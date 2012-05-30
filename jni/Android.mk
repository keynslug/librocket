#
# libRocket 1.2.1-custom static and shared C++ libraries
#

LOCAL_PATH := $(call my-dir)

SRC_PATH := ../Source
INCLUDE_PATH := $(LOCAL_PATH)/../Include

ifeq ($(FT2_ROOT),)
FT2_ROOT := $(LOCAL_PATH)/../../libfreetype2
endif

ROCKET_SRC_FILES := \
    $(SRC_PATH)/Controls/ElementTabSet.cpp \
    $(SRC_PATH)/Controls/WidgetTextInput.cpp \
    $(SRC_PATH)/Controls/ElementFormControlInput.cpp \
    $(SRC_PATH)/Controls/DataQuery.cpp \
    $(SRC_PATH)/Controls/WidgetTextInputMultiLine.cpp \
    $(SRC_PATH)/Controls/ElementFormControlSelect.cpp \
    $(SRC_PATH)/Controls/XMLNodeHandlerTextArea.cpp \
    $(SRC_PATH)/Controls/ElementDataGridExpandButton.cpp \
    $(SRC_PATH)/Controls/DataSourceListener.cpp \
    $(SRC_PATH)/Controls/DataSource.cpp \
    $(SRC_PATH)/Controls/ElementDataGridRow.cpp \
    $(SRC_PATH)/Controls/InputTypeCheckbox.cpp \
    $(SRC_PATH)/Controls/SelectOption.cpp \
    $(SRC_PATH)/Controls/WidgetSliderInput.cpp \
    $(SRC_PATH)/Controls/XMLNodeHandlerDataGrid.cpp \
    $(SRC_PATH)/Controls/ElementDataGridCell.cpp \
    $(SRC_PATH)/Controls/DataFormatter.cpp \
    $(SRC_PATH)/Controls/ElementFormControl.cpp \
    $(SRC_PATH)/Controls/ElementDataGrid.cpp \
    $(SRC_PATH)/Controls/ElementFormControlDataSelect.cpp \
    $(SRC_PATH)/Controls/InputTypeButton.cpp \
    $(SRC_PATH)/Controls/ElementTextSelection.cpp \
    $(SRC_PATH)/Controls/WidgetTextInputSingleLine.cpp \
    $(SRC_PATH)/Controls/InputTypeRange.cpp \
    $(SRC_PATH)/Controls/XMLNodeHandlerTabSet.cpp \
    $(SRC_PATH)/Controls/InputType.cpp \
    $(SRC_PATH)/Controls/WidgetTextInputSingleLinePassword.cpp \
    $(SRC_PATH)/Controls/Controls.cpp \
    $(SRC_PATH)/Controls/InputTypeText.cpp \
    $(SRC_PATH)/Controls/WidgetDropDown.cpp \
    $(SRC_PATH)/Controls/InputTypeRadio.cpp \
    $(SRC_PATH)/Controls/Clipboard.cpp \
    $(SRC_PATH)/Controls/WidgetSlider.cpp \
    $(SRC_PATH)/Controls/ElementForm.cpp \
    $(SRC_PATH)/Controls/InputTypeSubmit.cpp \
    $(SRC_PATH)/Controls/ElementFormControlTextArea.cpp \
    $(SRC_PATH)/Core/TextureDatabase.cpp \
    $(SRC_PATH)/Core/Plugin.cpp \
    $(SRC_PATH)/Core/ElementText.cpp \
    $(SRC_PATH)/Core/precompiled.cpp \
    $(SRC_PATH)/Core/Vector2.cpp \
    $(SRC_PATH)/Core/DecoratorTiledVerticalInstancer.cpp \
    $(SRC_PATH)/Core/PropertySpecification.cpp \
    $(SRC_PATH)/Core/Property.cpp \
    $(SRC_PATH)/Core/LayoutBlockBoxSpace.cpp \
    $(SRC_PATH)/Core/StyleSheetSpecification.cpp \
    $(SRC_PATH)/Core/FontEffectInstancer.cpp \
    $(SRC_PATH)/Core/PropertyDefinition.cpp \
    $(SRC_PATH)/Core/DocumentHeader.cpp \
    $(SRC_PATH)/Core/String.cpp \
    $(SRC_PATH)/Core/FontEffectOutline.cpp \
    $(SRC_PATH)/Core/Texture.cpp \
    $(SRC_PATH)/Core/XMLNodeHandlerDefault.cpp \
    $(SRC_PATH)/Core/StreamFile.cpp \
    $(SRC_PATH)/Core/PropertyParserColour.cpp \
    $(SRC_PATH)/Core/TextureResource.cpp \
    $(SRC_PATH)/Core/UnicodeRange.cpp \
    $(SRC_PATH)/Core/RenderInterface.cpp \
    $(SRC_PATH)/Core/ElementImage.cpp \
    $(SRC_PATH)/Core/GeometryDatabase.cpp \
    $(SRC_PATH)/Core/FontEffectShadowInstancer.cpp \
    $(SRC_PATH)/Core/ElementUtilities.cpp \
    $(SRC_PATH)/Core/WidgetSliderScroll.cpp \
    $(SRC_PATH)/Core/TemplateCache.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorFirstChild.cpp \
    $(SRC_PATH)/Core/StyleSheetFactory.cpp \
    $(SRC_PATH)/Core/GeometryUtilities.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorEmpty.cpp \
    $(SRC_PATH)/Core/Clock.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorOnlyOfType.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorNthChild.cpp \
    $(SRC_PATH)/Core/LayoutInlineBoxText.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorNthOfType.cpp \
    $(SRC_PATH)/Core/StyleSheetParser.cpp \
    $(SRC_PATH)/Core/LayoutBlockBox.cpp \
    $(SRC_PATH)/Core/DecoratorTiledVertical.cpp \
    $(SRC_PATH)/Core/DecoratorNoneInstancer.cpp \
    $(SRC_PATH)/Core/TextureLayoutTexture.cpp \
    $(SRC_PATH)/Core/Core.cpp \
    $(SRC_PATH)/Core/FontFaceHandle.cpp \
    $(SRC_PATH)/Core/TextureLayoutRectangle.cpp \
    $(SRC_PATH)/Core/StreamMemory.cpp \
    $(SRC_PATH)/Core/DecoratorTiledInstancer.cpp \
    $(SRC_PATH)/Core/DecoratorTiledBoxInstancer.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorFirstOfType.cpp \
    $(SRC_PATH)/Core/ElementReference.cpp \
    $(SRC_PATH)/Core/Event.cpp \
    $(SRC_PATH)/Core/DecoratorTiledHorizontal.cpp \
    $(SRC_PATH)/Core/FileInterface.cpp \
    $(SRC_PATH)/Core/Log.cpp \
    $(SRC_PATH)/Core/ElementDefinition.cpp \
    $(SRC_PATH)/Core/StyleSheetNode.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorLastChild.cpp \
    $(SRC_PATH)/Core/StringUtilities.cpp \
    $(SRC_PATH)/Core/ElementHandle.cpp \
    $(SRC_PATH)/Core/DecoratorNone.cpp \
    $(SRC_PATH)/Core/ElementScroll.cpp \
    $(SRC_PATH)/Core/Template.cpp \
    $(SRC_PATH)/Core/ElementDocument.cpp \
    $(SRC_PATH)/Core/StringCache.cpp \
    $(SRC_PATH)/Core/ContextInstancerDefault.cpp \
    $(SRC_PATH)/Core/FontEffect.cpp \
    $(SRC_PATH)/Core/ContextInstancer.cpp \
    $(SRC_PATH)/Core/ConvolutionFilter.cpp \
    $(SRC_PATH)/Core/ElementBorder.cpp \
    $(SRC_PATH)/Core/PropertyParserString.cpp \
    $(SRC_PATH)/Core/TextureLayout.cpp \
    $(SRC_PATH)/Core/WString.cpp \
    $(SRC_PATH)/Core/DecoratorTiledImage.cpp \
    $(SRC_PATH)/Core/Box.cpp \
    $(SRC_PATH)/Core/Dictionary.cpp \
    $(SRC_PATH)/Core/BaseXMLParser.cpp \
    $(SRC_PATH)/Core/Variant.cpp \
    $(SRC_PATH)/Core/ReferenceCountable.cpp \
    $(SRC_PATH)/Core/ElementTextDefault.cpp \
    $(SRC_PATH)/Core/SystemInterface.cpp \
    $(SRC_PATH)/Core/Decorator.cpp \
    $(SRC_PATH)/Core/PropertyParserNumber.cpp \
    $(SRC_PATH)/Core/FontFaceLayer.cpp \
    $(SRC_PATH)/Core/EventDispatcher.cpp \
    $(SRC_PATH)/Core/Geometry.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorLastOfType.cpp \
    $(SRC_PATH)/Core/DecoratorTiledHorizontalInstancer.cpp \
    $(SRC_PATH)/Core/DecoratorTiled.cpp \
    $(SRC_PATH)/Core/DecoratorInstancer.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorOnlyChild.cpp \
    $(SRC_PATH)/Core/XMLNodeHandlerTemplate.cpp \
    $(SRC_PATH)/Core/StyleSheet.cpp \
    $(SRC_PATH)/Core/LayoutLineBox.cpp \
    $(SRC_PATH)/Core/Factory.cpp \
    $(SRC_PATH)/Core/Math.cpp \
    $(SRC_PATH)/Core/FreeType/FontProvider.cpp \
    $(SRC_PATH)/Core/FreeType/FontFamily.cpp \
    $(SRC_PATH)/Core/FreeType/FontFace.cpp \
    $(SRC_PATH)/Core/FreeType/FontFaceHandle.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorNthLastChild.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontProvider.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontFamily.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontFace.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontFaceHandle.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontParser.cpp \
    $(SRC_PATH)/Core/BitmapFont/FontFaceLayer.cpp \
    $(SRC_PATH)/Core/LayoutInlineBox.cpp \
    $(SRC_PATH)/Core/Stream.cpp \
    $(SRC_PATH)/Core/Element.cpp \
    $(SRC_PATH)/Core/FontEffectNoneInstancer.cpp \
    $(SRC_PATH)/Core/XMLNodeHandlerHead.cpp \
    $(SRC_PATH)/Core/ElementStyle.cpp \
    $(SRC_PATH)/Core/FontEffectShadow.cpp \
    $(SRC_PATH)/Core/EventListenerInstancer.cpp \
    $(SRC_PATH)/Core/XMLNodeHandlerBody.cpp \
    $(SRC_PATH)/Core/FontEffectNone.cpp \
    $(SRC_PATH)/Core/XMLParser.cpp \
    $(SRC_PATH)/Core/ElementDecoration.cpp \
    $(SRC_PATH)/Core/XMLParseTools.cpp \
    $(SRC_PATH)/Core/DecoratorTiledImageInstancer.cpp \
    $(SRC_PATH)/Core/ElementBackground.cpp \
    $(SRC_PATH)/Core/PluginRegistry.cpp \
    $(SRC_PATH)/Core/WidgetSlider.cpp \
    $(SRC_PATH)/Core/TextureLayoutRow.cpp \
    $(SRC_PATH)/Core/FontDatabase.cpp \
    $(SRC_PATH)/Core/LayoutEngine.cpp \
    $(SRC_PATH)/Core/FileInterfaceDefault.cpp \
    $(SRC_PATH)/Core/Context.cpp \
    $(SRC_PATH)/Core/FontEffectOutlineInstancer.cpp \
    $(SRC_PATH)/Core/EventInstancer.cpp \
    $(SRC_PATH)/Core/EventInstancerDefault.cpp \
    $(SRC_PATH)/Core/ElementInstancer.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelectorNthLastOfType.cpp \
    $(SRC_PATH)/Core/DecoratorTiledBox.cpp \
    $(SRC_PATH)/Core/XMLNodeHandler.cpp \
    $(SRC_PATH)/Core/PropertyDictionary.cpp \
    $(SRC_PATH)/Core/PropertyParserKeyword.cpp \
    $(SRC_PATH)/Core/StyleSheetNodeSelector.cpp \
    $(SRC_PATH)/Core/URL.cpp \
    $(SRC_PATH)/Debugger/Plugin.cpp \
    $(SRC_PATH)/Debugger/ElementContextHook.cpp \
    $(SRC_PATH)/Debugger/Debugger.cpp \
    $(SRC_PATH)/Debugger/SystemInterface.cpp \
    $(SRC_PATH)/Debugger/Geometry.cpp \
    $(SRC_PATH)/Debugger/ElementInfo.cpp \
    $(SRC_PATH)/Debugger/ElementLog.cpp \

ROCKET_CPPFLAGS := \
    -DROCKET_SHORT_INDICES \
    -DRocketCore_EXPORTS \
    -DRocketControls_EXPORTS \
    -DRocketDebugger_EXPORTS \
    -DRocketFreeType_EXPORTS \
    -DRocketBitmapFont_EXPORTS \

#
# Static library directives
#

include $(FT2_ROOT)/jni/static.mk

include $(CLEAR_VARS)

LOCAL_MODULE := rocket_static

LOCAL_MODULE_FILENAME := librocket
LOCAL_CPPFLAGS := $(ROCKET_CPPFLAGS)
LOCAL_SRC_FILES := $(ROCKET_SRC_FILES)

LOCAL_C_INCLUDES := \
    $(INCLUDE_PATH) \

LOCAL_STATIC_LIBRARIES := freetype2_prebuilt_static
LOCAL_EXPORT_C_INCLUDES := $(INCLUDE_PATH)
LOCAL_EXPORT_CPPFLAGS := -DROCKET_SHORT_INDICES

include $(BUILD_STATIC_LIBRARY)

#
# Shared library directives
#

include $(CLEAR_VARS)

LOCAL_MODULE := rocket_shared

LOCAL_MODULE_FILENAME := librocket
LOCAL_CPPFLAGS := $(ROCKET_CPPFLAGS)
LOCAL_SRC_FILES := $(ROCKET_SRC_FILES)

LOCAL_C_INCLUDES := \
    $(INCLUDE_PATH) \

LOCAL_STATIC_LIBRARIES := freetype2_prebuilt_static
LOCAL_EXPORT_C_INCLUDES := $(INCLUDE_PATH)
LOCAL_EXPORT_CPPFLAGS := -DROCKET_SHORT_INDICES

include $(BUILD_SHARED_LIBRARY)
