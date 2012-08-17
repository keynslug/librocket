/*
 * This source file is part of libRocket, the HTML/CSS Interface Middleware
 *
 * For the latest information, see http://www.librocket.com
 *
 * Copyright (c) 2008-2010 CodePoint Ltd, Shift Technology Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#include "precompiled.h"
#include "ElementBackground.h"
#include <Rocket/Core/Element.h>
#include <Rocket/Core/GeometryUtilities.h>
#include <Rocket/Core/Property.h>
#include <Rocket/Core/Log.h>

namespace Rocket {
namespace Core {

enum StretchMode
{
	NONE = 0,			    // Do not stretches a single tile at all.
	COVER_WIDTH = 1,     	// Stretches a tile horizontally across surface width.
	COVER_HEIGHT = 2,     	// Stretches a tile vertically across surface height.
	COVER = 3,				// Stretches a tile across the required surface area.
};

ElementBackground::ElementBackground(Element* _element) : geometry(_element)
{
	element = _element;
	background_dirty = true;
	background_opacity_dirty = true;
}

ElementBackground::~ElementBackground()
{
}

// Renders the element's background, if it has one.
void ElementBackground::RenderBackground()
{
	if (background_dirty)
	{
		background_dirty = false;
		GenerateBackground();
	}

	if (background_opacity_dirty)
	{
		background_opacity_dirty = false;
		geometry.SetOpacity(element->GetAbsoluteOpacity());
	}

	geometry.Render(element->GetAbsoluteOffset(Box::PADDING));
}

// Marks the background geometry as dirty.
void ElementBackground::DirtyBackground()
{
	background_dirty = true;
}

void ElementBackground::DirtyOpacity()
{
	background_opacity_dirty = true;
}

// Generates the background geometry for the element.
void ElementBackground::GenerateBackground()
{
	// Fetch the new colour for the background. If the colour is transparent, then we don't render any background.
	Colourb colour = element->GetProperty(BACKGROUND_COLOR)->value.Get< Colourb >();
	if (colour.alpha <= 0)
	{
		geometry.GetVertices().clear();
		geometry.GetIndices().clear();
		geometry.Release();

		return;
	}

	// Fetch background image information.
	StretchMode mode = COVER;
	Vector2i dimensions(1, 1);
	const Property * image = element->GetProperty(BACKGROUND_IMAGE_SRC);
	String image_source;
	if (image)
	{
		image_source = image->value.Get< String >();
	}
	if (! image_source.Empty())
	{
		int texture_index = LoadTexture(image->value.Get< String >(), image->source);
		if (texture_index != -1)
		{
			const Texture* texture = GetTexture(texture_index);
			mode = (StretchMode)(element->GetProperty(BACKGROUND_IMAGE_MODE)->value.Get< int >());
			dimensions = texture->GetDimensions(element->GetRenderInterface());
			geometry.SetTexture(texture);
		}
	}
	else
	{
		geometry.SetTexture(NULL);
	}

	// Work out how many boxes we need to generate geometry for.
	int num_boxes = 0;

	for (int i = 0; i < element->GetNumBoxes(); ++i)
	{
		const Box& box = element->GetBox(i);
		Vector2f size = box.GetSize(Box::PADDING);
		if (size.x > 0 && size.y > 0)
			num_boxes++;
	}

	std::vector< Vertex >& vertices = geometry.GetVertices();
	std::vector< Index >& indices = geometry.GetIndices();

	Index index_offset = 0;
	vertices.resize(4 * num_boxes);
	indices.resize(6 * num_boxes);

	if (num_boxes > 0)
	{
		Vertex* raw_vertices = &vertices[0];
		Index* raw_indices = &indices[0];

		for (int i = 0; i < element->GetNumBoxes(); ++i)
		{
			const Box& box = element->GetBox(i);
			Vector2f padded_size = box.GetSize(Box::PADDING);
			Vector2f texcoord(1, 1);
			if (padded_size.x <= 0 ||
				padded_size.y <= 0)
				continue;

			bool rx = (mode == NONE) || (mode == COVER_HEIGHT);
			bool ry = (mode == NONE) || (mode == COVER_WIDTH);

			if (rx) {
				if (padded_size.x > dimensions.x) {
					padded_size.x = dimensions.x;
				}
				else {
					texcoord.x = padded_size.x / float(dimensions.x);
				}
			}

			if (ry) {
				if (padded_size.y > dimensions.y) {
					padded_size.y = dimensions.y;
				}
				else {
					texcoord.y = padded_size.y / float(dimensions.y);
				}
			}

			GeometryUtilities::GenerateQuad(raw_vertices, raw_indices, box.GetOffset(), padded_size, colour, Vector2f(0, 0), texcoord, index_offset);

			raw_vertices += 4;
			raw_indices += 6;
			index_offset += 4;
		}

	}

	geometry.Release();
}

// Attempts to load a texture into the list of textures in use by the decorator.
int ElementBackground::LoadTexture(const String& texture_name, const String& rcss_path)
{
	for (size_t i = 0; i < textures.size(); i++)
	{
		if (texture_name == textures[i].GetSource())
			return (int) i;
	}

	Texture texture;
	if (!texture.Load(texture_name, rcss_path))
		return -1;

	textures.push_back(texture);
	return (int) textures.size() - 1;
}

// Returns one of the decorator's previously loaded textures.
const Texture* ElementBackground::GetTexture(int index) const
{
	if (index < 0 || index >= (int) textures.size())
		return NULL;

	return &(textures[index]);
}

}
}
