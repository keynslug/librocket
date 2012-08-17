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

#ifndef ROCKETCOREVERTEX_H
#define ROCKETCOREVERTEX_H

#include <Rocket/Core/Header.h>
#include <Rocket/Core/Types.h>

namespace Rocket {
namespace Core {

/**
	The element that makes up all geometry sent to the renderer.

	@author Peter Curry
 */

struct ROCKETCORE_API Vertex
{
    
    Vertex() : opacity(255) {}

    Vector2f & Position() { return position; }
    Vector2f & TexCoord() { return tex_coord; }

    void SetPosition(float x, float y) { position.x = x; position.y = y; }
    void SetTexCoord(float x, float y) { tex_coord.x = x; tex_coord.y = y; }
    void SetPosition(Vector2f const& v) { position = v; }
    void SetTexCoord(Vector2f const& v) { tex_coord = v; }

    void SetColour(Colourb const& c)
    {
        colour = c;
        alpha = c.alpha;
        SetOpacity(opacity);
    }

    void SetOpacity(byte op)
    {
        opacity = op;
        colour.alpha = (unsigned(alpha) * (op + 1)) >> 8;
    }

    const Vector2f * GetPositionPointer() const { return &position; }
    const Vector2f * GetTexCoordPointer() const { return &tex_coord; }
    const Colourb * GetColourPointer() const { return &colour; }

private:
	/// Two-dimensional position of the vertex (usually in pixels).
	Vector2f position;
	/// RGBA-ordered 8-bit / channel colour.
	Colourb colour;
	/// Texture coordinate for any associated texture.
	Vector2f tex_coord;
    /// Preserved and master alpha
    byte alpha, opacity;

};

}
}

#endif
