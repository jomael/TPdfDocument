﻿{*******************************************************}
{                                                       }
{  Files: D2D1_1.h                                      }
{    Copyright (C) Microsoft Corporation.               }
{    All Rights Reserved.                               }
{                                                       }
{  Translator: Lyna                                     }
{    Copyright(c) 2016 Lyna  All rights reserved.       }
{                                                       }
{*******************************************************}
unit Winapi.D2D1_1;

{$ALIGN ON}
{$MINENUMSIZE 4}
{$LEGACYIFEND ON}

interface

uses
  Winapi.Windows, Winapi.ActiveX, Winapi.D2D1, Winapi.DXGI, Winapi.DXGIFormat,
  Winapi.Wincodec;

type
  REFCLSID = ^TCLSID;
  PUINT32 = ^UInt32;

// File name: D2DBaseTypes.h
//---------------------------------------------------------------------------

type
{$IF not declared(D2D_POINT_2L)}
  D2D_POINT_2L = TPoint;
{$IFEND}

{$IF not declared(D2D_VECTOR_2F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_VECTOR_2F
//
//------------------------------------------------------------------------------
  D2D_VECTOR_2F = record
    x: Single;
    y: Single;
  end;
  TD2DVector2F = D2D_VECTOR_2F;
  PD2DVector2F = ^TD2DVector2F;
{$IFEND}

{$IF not declared(D2D_VECTOR_3F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_VECTOR_3F
//
//------------------------------------------------------------------------------
  D2D_VECTOR_3F = record
    x: Single;
    y: Single;
    z: Single;
  end;
  TD2DVector3F = D2D_VECTOR_3F;
  PD2DVector3F = ^TD2DVector3F;
{$IFEND}

{$IF not declared(D2D_VECTOR_4F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_VECTOR_4F
//
//------------------------------------------------------------------------------
  D2D_VECTOR_4F = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;
  TD2DVector4F = D2D_VECTOR_4F;
  PD2DVector4F = ^TD2DVector4F;
{$IFEND}

{$IF not declared(D2D_RECT_L)}
  D2D_RECT_L = TRect;
{$IFEND}

{$IF not declared(D2D_MATRIX_4X3_F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_MATRIX_4X3_F
//
//------------------------------------------------------------------------------
  D2D_MATRIX_4X3_F = record
    case Integer of
      0: (
        _11, _12, _13: Single;
        _21, _22, _23: Single;
        _31, _32, _33: Single;
        _41, _42, _43: Single);
      1: (m: array[0..3, 0..2] of Single);
  end;
  TD2DMatrix4x3F = D2D_MATRIX_4X3_F;
  PD2DMatrix4x3F = ^TD2DMatrix4x3F;
{$IFEND}

{$IF not declared(D2D_MATRIX_4X4_F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_MATRIX_4X4_F
//
//------------------------------------------------------------------------------
  D2D_MATRIX_4X4_F = record
    case Integer of
      0: (
        _11, _12, _13, _14: Single;
        _21, _22, _23, _24: Single;
        _31, _32, _33, _34: Single;
        _41, _42, _43, _44: Single);
      1: (m: array[0..3, 0..3] of Single);
  end;
  TD2DMatrix4x4F = D2D_MATRIX_4X4_F;
  PD2DMatrix4x4F = ^TD2DMatrix4x4F;
{$IFEND}

{$IF not declared(D2D_MATRIX_5X4_F)}
//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D_MATRIX_5X4_F
//
//------------------------------------------------------------------------------
  D2D_MATRIX_5X4_F = record
    case Integer of
      0: (
        _11, _12, _13, _14: Single;
        _21, _22, _23, _24: Single;
        _31, _32, _33, _34: Single;
        _41, _42, _43, _44: Single;
        _51, _52, _53, _54: Single);
      1: (m: array[0..4, 0..3] of Single);
  end;
  TD2DMatrix5x4F = D2D_MATRIX_5X4_F;
  PD2DMatrix5x4F = ^TD2DMatrix5x4F;
{$IFEND}

// File name: D2D1EffectAuthor.h
//---------------------------------------------------------------------------

//+-----------------------------------------------------------------------------
//
//  Function Pointer:
//      PD2D1_PROPERTY_SET_FUNCTION
//
//  Synopsis:
//      Function pointer that sets a property on an effect.
//
//------------------------------------------------------------------------------
  PD2D1_PROPERTY_SET_FUNCTION = function(
    effect: IUnknown;
    data: PByte;
    dataSize: UINT32): HRESULT; stdcall;
  PD2D1PropertySetFunction = PD2D1_PROPERTY_SET_FUNCTION;

//+-----------------------------------------------------------------------------
//
//  Function Pointer:
//      PD2D1_PROPERTY_GET_FUNCTION
//
//  Synopsis:
//      Function pointer that gets a property from an effect.
//
//------------------------------------------------------------------------------
  PD2D1_PROPERTY_GET_FUNCTION = function(
    effect: IUnknown;
    data: PByte;
    dataSize: UINT32;
    actualSize: PUINT32): HRESULT; stdcall;
  PD2D1PropertyGetFunction = PD2D1_PROPERTY_GET_FUNCTION;

//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_PROPERTY_BINDING
//
//  Synopsis:
//      Defines a property binding to a function. The name must match the property
//      defined in the registration schema.
//
//------------------------------------------------------------------------------
  D2D1_PROPERTY_BINDING = record
    //
    // The name of the property.
    //
    propertyName: PWideChar;

    //
    // The function that will receive the data to set.
    //
    setFunction: PD2D1_PROPERTY_SET_FUNCTION;

    //
    // The function that will be asked to write the output data.
    //
    getFunction: PD2D1_PROPERTY_GET_FUNCTION;
  end;
  TD2D1PropertyBinding = D2D1_PROPERTY_BINDING;
  PD2D1PropertyBinding = ^TD2D1PropertyBinding;

// File name: DocumentTarget.h
//---------------------------------------------------------------------------

  IPrintDocumentPackageTarget = interface(IUnknown)
    ['{1b8efec4-3019-4c27-964e-367202156906}']
    function GetPackageTargetTypes(
      out targetCount: UINT32;
      out targetTypes: TGUID): HRESULT; stdcall;

    function GetPackageTarget(
      [Ref] guidTargetType: TGUID;
      [Ref] riid: TGUID;
      out ppvTarget): HRESULT; stdcall;

    function Cancel: HRESULT; stdcall;
  end;

// File name: D2D1.h
//---------------------------------------------------------------------------

//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_INTERPOLATION_MODE_DEFINITION
//
//  Synopsis:
//      This defines the superset of interpolation mode supported by D2D APIs
//      and built-in effects
//
//------------------------------------------------------------------------------
const
  D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR = 0;
  D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR = 1;
  D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC = 2;
  D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR = 3;
  D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC = 4;
  D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC = 5;
  D2D1_INTERPOLATION_MODE_DEFINITION_FANT = 6;
  D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR = 7;


//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Image
//
//------------------------------------------------------------------------------
type
  ID2D1Image = interface(ID2D1Resource)
    ['{65019f75-8da2-497c-b32c-dfa34e48ede6}']
  end; // interface ID2D1Image

// File name: D2D1_1.h
//---------------------------------------------------------------------------

type
//+-----------------------------------------------------------------------------
//
//  Function Pointer:
//      PD2D1_EFFECT_FACTORY
//
//  Synopsis:
//      Function pointer to construct a new effect once registered.
//
//------------------------------------------------------------------------------
  PD2D1_EFFECT_FACTORY = function(
    out effectImpl: IUnknown): HRESULT; stdcall;
  PD2D1EffectFactory = PD2D1_EFFECT_FACTORY;

const
  D2D1_INVALID_PROPERTY_INDEX = High(UINT); //UINT_MAX

type
  D2D1_RECT_L = D2D_RECT_L;
  D2D1_POINT_2L = D2D_POINT_2L;

//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_PROPERTY_TYPE
//
//  Synopsis:
//      This defines the valid property types that can be used in an effect property
//      interface.
//
//------------------------------------------------------------------------------
  D2D1_PROPERTY_TYPE = (
    D2D1_PROPERTY_TYPE_UNKNOWN = 0,
    D2D1_PROPERTY_TYPE_STRING = 1,
    D2D1_PROPERTY_TYPE_BOOL = 2,
    D2D1_PROPERTY_TYPE_UINT32 = 3,
    D2D1_PROPERTY_TYPE_INT32 = 4,
    D2D1_PROPERTY_TYPE_FLOAT = 5,
    D2D1_PROPERTY_TYPE_VECTOR2 = 6,
    D2D1_PROPERTY_TYPE_VECTOR3 = 7,
    D2D1_PROPERTY_TYPE_VECTOR4 = 8,
    D2D1_PROPERTY_TYPE_BLOB = 9,
    D2D1_PROPERTY_TYPE_IUNKNOWN = 10,
    D2D1_PROPERTY_TYPE_ENUM = 11,
    D2D1_PROPERTY_TYPE_ARRAY = 12,
    D2D1_PROPERTY_TYPE_CLSID = 13,
    D2D1_PROPERTY_TYPE_MATRIX_3X2 = 14,
    D2D1_PROPERTY_TYPE_MATRIX_4X3 = 15,
    D2D1_PROPERTY_TYPE_MATRIX_4X4 = 16,
    D2D1_PROPERTY_TYPE_MATRIX_5X4 = 17,
    D2D1_PROPERTY_TYPE_COLOR_CONTEXT = 18,
    D2D1_PROPERTY_TYPE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1PropertyType = D2D1_PROPERTY_TYPE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_PROPERTY
//
//  Synopsis:
//      This defines the list of system properties present on the root effect property
//      interface.
//
//------------------------------------------------------------------------------
  D2D1_PROPERTY = (
    D2D1_PROPERTY_CLSID = Integer($80000000),
    D2D1_PROPERTY_DISPLAYNAME = Integer($80000001),
    D2D1_PROPERTY_AUTHOR = Integer($80000002),
    D2D1_PROPERTY_CATEGORY = Integer($80000003),
    D2D1_PROPERTY_DESCRIPTION = Integer($80000004),
    D2D1_PROPERTY_INPUTS = Integer($80000005),
    D2D1_PROPERTY_CACHED = Integer($80000006),
    D2D1_PROPERTY_PRECISION = Integer($80000007),
    D2D1_PROPERTY_MIN_INPUTS = Integer($80000008),
    D2D1_PROPERTY_MAX_INPUTS = Integer($80000009),
    D2D1_PROPERTY_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1Property = D2D1_PROPERTY;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_SUBPROPERTY
//
//  Synopsis:
//      This defines the indices of sub-properties that may be present on any parent
//      property.
//
//------------------------------------------------------------------------------
  D2D1_SUBPROPERTY = (
    D2D1_SUBPROPERTY_DISPLAYNAME = Integer($80000000),
    D2D1_SUBPROPERTY_ISREADONLY = Integer($80000001),
    D2D1_SUBPROPERTY_MIN = Integer($80000002),
    D2D1_SUBPROPERTY_MAX = Integer($80000003),
    D2D1_SUBPROPERTY_DEFAULT = Integer($80000004),
    D2D1_SUBPROPERTY_FIELDS = Integer($80000005),
    D2D1_SUBPROPERTY_INDEX = Integer($80000006),
    D2D1_SUBPROPERTY_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1SubProperty = D2D1_SUBPROPERTY;


//+-----------------------------------------------------------------------------
//
//  Flag:
//      D2D1_BITMAP_OPTIONS
//
//  Synopsis:
//      Specifies how the bitmap can be used.
//
//------------------------------------------------------------------------------
  D2D1_BITMAP_OPTIONS = type Integer;
  TD2D1BitmapOptions = D2D1_BITMAP_OPTIONS;
const
  //
  // The bitmap is created with default properties.
  //
  D2D1_BITMAP_OPTIONS_NONE = $00000000;
  
  //
  // The bitmap can be specified as a target in ID2D1DeviceContext::SetTarget
  //
  D2D1_BITMAP_OPTIONS_TARGET = $00000001;
  
  //
  // The bitmap cannot be used as an input to DrawBitmap, DrawImage, in a bitmap
  // brush or as an input to an effect.
  //
  D2D1_BITMAP_OPTIONS_CANNOT_DRAW = $00000002;
  
  //
  // The bitmap can be read from the CPU.
  //
  D2D1_BITMAP_OPTIONS_CPU_READ = $00000004;
  
  //
  // The bitmap works with the ID2D1GdiInteropRenderTarget::GetDC API.
  //
  D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE = $00000008;
  D2D1_BITMAP_OPTIONS_FORCE_DWORD = $ffffffff;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_COMPOSITE_MODE
//
//  Synopsis:
//      Specifies the composite mode that will be applied.
//
//------------------------------------------------------------------------------
type
  D2D1_COMPOSITE_MODE = (
    D2D1_COMPOSITE_MODE_SOURCE_OVER = 0,
    D2D1_COMPOSITE_MODE_DESTINATION_OVER = 1,
    D2D1_COMPOSITE_MODE_SOURCE_IN = 2,
    D2D1_COMPOSITE_MODE_DESTINATION_IN = 3,
    D2D1_COMPOSITE_MODE_SOURCE_OUT = 4,
    D2D1_COMPOSITE_MODE_DESTINATION_OUT = 5,
    D2D1_COMPOSITE_MODE_SOURCE_ATOP = 6,
    D2D1_COMPOSITE_MODE_DESTINATION_ATOP = 7,
    D2D1_COMPOSITE_MODE_XOR = 8,
    D2D1_COMPOSITE_MODE_PLUS = 9,
    D2D1_COMPOSITE_MODE_SOURCE_COPY = 10,
    D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY = 11,
    D2D1_COMPOSITE_MODE_MASK_INVERT = 12,
    D2D1_COMPOSITE_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1CompositeMode = D2D1_COMPOSITE_MODE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_BUFFER_PRECISION
//
//  Synopsis:
//      This specifies the precision that should be used in buffers allocated by D2D.
//
//------------------------------------------------------------------------------
  D2D1_BUFFER_PRECISION = (
    D2D1_BUFFER_PRECISION_UNKNOWN = 0,
    D2D1_BUFFER_PRECISION_8BPC_UNORM = 1,
    D2D1_BUFFER_PRECISION_8BPC_UNORM_SRGB = 2,
    D2D1_BUFFER_PRECISION_16BPC_UNORM = 3,
    D2D1_BUFFER_PRECISION_16BPC_FLOAT = 4,
    D2D1_BUFFER_PRECISION_32BPC_FLOAT = 5,
    D2D1_BUFFER_PRECISION_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1BufferPrecision = D2D1_BUFFER_PRECISION;


//+-----------------------------------------------------------------------------
//
//  Flag:
//      D2D1_MAP_OPTIONS
//
//  Synopsis:
//      This describes how the individual mapping operation should be performed.
//
//------------------------------------------------------------------------------
  D2D1_MAP_OPTIONS = type Integer;
  TD2D1MapOptions = D2D1_MAP_OPTIONS;
const
  //
  // The mapped pointer has undefined behavior.
  //
  D2D1_MAP_OPTIONS_NONE = 0;
  
  //
  // The mapped pointer can be read from.
  //
  D2D1_MAP_OPTIONS_READ = 1;
  
  //
  // The mapped pointer can be written to.
  //
  D2D1_MAP_OPTIONS_WRITE = 2;
  
  //
  // The previous contents of the bitmap are discarded when it is mapped.
  //
  D2D1_MAP_OPTIONS_DISCARD = 4;
  D2D1_MAP_OPTIONS_FORCE_DWORD = $ffffffff;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_INTERPOLATION_MODE
//
//  Synopsis:
//      This is used to specify the quality of image scaling with
//      ID2D1DeviceContext::DrawImage and with the 2D Affine Transform Effect.
//
//------------------------------------------------------------------------------
type
  D2D1_INTERPOLATION_MODE = (
    D2D1_INTERPOLATION_MODE_NEAREST_NEIGHBOR = D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR,
    D2D1_INTERPOLATION_MODE_LINEAR = D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR,
    D2D1_INTERPOLATION_MODE_CUBIC = D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC,
    D2D1_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR,
    D2D1_INTERPOLATION_MODE_ANISOTROPIC = D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC,
    D2D1_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC = D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC,
    D2D1_INTERPOLATION_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1InterpolationMode = D2D1_INTERPOLATION_MODE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_UNIT_MODE
//
//  Synopsis:
//      This specifies what units should be accepted by the D2D API.
//
//------------------------------------------------------------------------------
  D2D1_UNIT_MODE = (
    D2D1_UNIT_MODE_DIPS = 0,
    D2D1_UNIT_MODE_PIXELS = 1,
    D2D1_UNIT_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1UnitMode = D2D1_UNIT_MODE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_COLOR_SPACE
//
//  Synopsis:
//      Defines a color space.
//
//------------------------------------------------------------------------------
  D2D1_COLOR_SPACE = (
    //
    // The color space is described by accompanying data, such as a color profile.
    //
    D2D1_COLOR_SPACE_CUSTOM = 0,
    
    //
    // The sRGB color space.
    //
    D2D1_COLOR_SPACE_SRGB = 1,
    
    //
    // The scRGB color space.
    //
    D2D1_COLOR_SPACE_SCRGB = 2,
    D2D1_COLOR_SPACE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1ColorSpace = D2D1_COLOR_SPACE;


//+-----------------------------------------------------------------------------
//
//  Flag:
//      D2D1_DEVICE_CONTEXT_OPTIONS
//
//  Synopsis:
//      This specifies options that apply to the device context for its lifetime.
//
//------------------------------------------------------------------------------
  D2D1_DEVICE_CONTEXT_OPTIONS = type Integer;
  TD2D1DeviceContextOptions = D2D1_DEVICE_CONTEXT_OPTIONS;
const
  D2D1_DEVICE_CONTEXT_OPTIONS_NONE = 0;
  
  //
  // Geometry rendering will be performed on many threads in parallel, a single
  // thread is the default.
  //
  D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS = 1;
  D2D1_DEVICE_CONTEXT_OPTIONS_FORCE_DWORD = $ffffffff;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_STROKE_TRANSFORM_TYPE
//
//------------------------------------------------------------------------------
type
  D2D1_STROKE_TRANSFORM_TYPE = (
    //
    // The stroke respects the world transform, the DPI, and the stroke width.
    //
    D2D1_STROKE_TRANSFORM_TYPE_NORMAL = 0,
    
    //
    // The stroke does not respect the world transform, but it does respect the DPI and
    // the stroke width.
    //
    D2D1_STROKE_TRANSFORM_TYPE_FIXED = 1,
    
    //
    // The stroke is forced to one pixel wide.
    //
    D2D1_STROKE_TRANSFORM_TYPE_HAIRLINE = 2,
    D2D1_STROKE_TRANSFORM_TYPE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1StrokeTransformType = D2D1_STROKE_TRANSFORM_TYPE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_PRIMITIVE_BLEND
//
//  Synopsis:
//      A blend mode that applies to all primitives drawn on the context.
//
//------------------------------------------------------------------------------
  D2D1_PRIMITIVE_BLEND = (
    D2D1_PRIMITIVE_BLEND_SOURCE_OVER = 0,
    D2D1_PRIMITIVE_BLEND_COPY = 1,
    D2D1_PRIMITIVE_BLEND_MIN = 2,
    D2D1_PRIMITIVE_BLEND_ADD = 3,
    D2D1_PRIMITIVE_BLEND_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1PrimitiveBlend = D2D1_PRIMITIVE_BLEND;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_THREADING_MODE
//
//  Synopsis:
//      This specifies the threading mode used while simultaneously creating the device,
//      factory, and device context.
//
//------------------------------------------------------------------------------
  D2D1_THREADING_MODE = (
    //
    // Resources may only be invoked serially.  Reference counts on resources are
    // interlocked, however, resource and render target state is not protected from
    // multi-threaded access
    //
    D2D1_THREADING_MODE_SINGLE_THREADED = D2D1_FACTORY_TYPE_SINGLE_THREADED,
    
    //
    // Resources may be invoked from multiple threads. Resources use interlocked
    // reference counting and their state is protected.
    //
    D2D1_THREADING_MODE_MULTI_THREADED = D2D1_FACTORY_TYPE_MULTI_THREADED,
    D2D1_THREADING_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1ThreadingMode = D2D1_THREADING_MODE;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_COLOR_INTERPOLATION_MODE
//
//  Synopsis:
//      This specifies how colors are interpolated.
//
//------------------------------------------------------------------------------
  D2D1_COLOR_INTERPOLATION_MODE = (
    //
    // Colors will be interpolated in straight alpha space.
    //
    D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT = 0,
    
    //
    // Colors will be interpolated in premultiplied alpha space.
    //
    D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED = 1,
    D2D1_COLOR_INTERPOLATION_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1ColorInterpolationMode = D2D1_COLOR_INTERPOLATION_MODE;

  D2D1_VECTOR_2F = D2D_VECTOR_2F;
  D2D1_VECTOR_3F = D2D_VECTOR_3F;
  D2D1_VECTOR_4F = D2D_VECTOR_4F;

//+-----------------------------------------------------------------------------
//
//  Flag:
//      D2D1_LAYER_OPTIONS1
//
//  Synopsis:
//      Specifies how the layer contents should be prepared.
//
//------------------------------------------------------------------------------
  D2D1_LAYER_OPTIONS1 = type Integer;
  TD2D1LayerOptions1 = D2D1_LAYER_OPTIONS1;
const
  D2D1_LAYER_OPTIONS1_NONE = 0;
  D2D1_LAYER_OPTIONS1_INITIALIZE_FROM_BACKGROUND = 1;
  D2D1_LAYER_OPTIONS1_IGNORE_ALPHA = 2;
  D2D1_LAYER_OPTIONS1_FORCE_DWORD = $ffffffff;


type
  ID2D1ColorContext = interface;
  ID2D1Effect = interface;
  ID2D1Device = interface;

//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_BITMAP_PROPERTIES1
//
//  Synopsis:
//      Extended bitmap properties.
//
//------------------------------------------------------------------------------
  D2D1_BITMAP_PROPERTIES1 = record
    pixelFormat: D2D1_PIXEL_FORMAT;
    dpiX: Single;
    dpiY: Single;
    
    //
    // Specifies how the bitmap can be used.
    //
    bitmapOptions: D2D1_BITMAP_OPTIONS;
    colorContext: ID2D1ColorContext;
  end;
  TD2D1BitmapProperties1 = D2D1_BITMAP_PROPERTIES1;
  PD2D1BitmapProperties1 = ^TD2D1BitmapProperties1;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_MAPPED_RECT
//
//  Synopsis:
//      Describes mapped memory from the ID2D1Bitmap1::Map API.
//
//------------------------------------------------------------------------------
  D2D1_MAPPED_RECT = record
    pitch: UINT32;
    bits: PByte;
  end;
  TD2D1MappedRect = D2D1_MAPPED_RECT;
  PD2D1MappedRect = ^TD2D1MappedRect;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_RENDERING_CONTROLS
//
//  Synopsis:
//      This controls advanced settings of the Direct2D imaging pipeline.
//
//------------------------------------------------------------------------------
  D2D1_RENDERING_CONTROLS = record
    //
    // The default buffer precision, used if the precision isn't otherwise specified.
    //
    bufferPrecision: D2D1_BUFFER_PRECISION;
    
    //
    // The size of allocated tiles used to render imaging effects.
    //
    tileSize: D2D1_SIZE_U;
  end;
  TD2D1RenderingControls = D2D1_RENDERING_CONTROLS;
  PD2D1RenderingControls = ^TD2D1RenderingControls;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_EFFECT_INPUT_DESCRIPTION
//
//  Synopsis:
//      This identifies a certain input connection of a certain effect.
//
//------------------------------------------------------------------------------
  D2D1_EFFECT_INPUT_DESCRIPTION = record
    //
    // The effect whose input connection is being specified.
    //
    effect: ID2D1Effect;
    
    //
    // The index of the input connection into the specified effect.
    //
    inputIndex: UINT32;
    
    //
    // The rectangle which would be available on the specified input connection during
    // render operations.
    //
    inputRectangle: D2D1_RECT_F;
  end;
  TD2D1EffectInputDescription = D2D1_EFFECT_INPUT_DESCRIPTION;
  PD2D1EffectInputDescription = ^TD2D1EffectInputDescription;

  D2D1_MATRIX_4X3_F = D2D_MATRIX_4X3_F;
  TD2D1Matrix4x3F = D2D1_MATRIX_4X3_F;
  PD2D1Matrix4x3F = ^TD2D1Matrix4x3F;
  D2D1_MATRIX_4X4_F = D2D_MATRIX_4X4_F;
  TD2D1Matrix4x4F = D2D1_MATRIX_4X4_F;
  PD2D1Matrix4x4F = ^TD2D1Matrix4x4F;
  D2D1_MATRIX_5X4_F = D2D_MATRIX_5X4_F;
  TD2D1Matrix5x4F = D2D1_MATRIX_5X4_F;
  PD2D1Matrix5x4F = ^TD2D1Matrix5x4F;

//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_POINT_DESCRIPTION
//
//  Synopsis:
//      Describes a point along a path.
//
//------------------------------------------------------------------------------
  D2D1_POINT_DESCRIPTION = record
    point: D2D1_POINT_2F;
    unitTangentVector: D2D1_POINT_2F;
    endSegment: UINT32;
    endFigure: UINT32;
    lengthToEndSegment: Single;
  end;
  TD2D1PointDescription = D2D1_POINT_DESCRIPTION;
  PD2D1PointDescription = ^TD2D1PointDescription;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_IMAGE_BRUSH_PROPERTIES
//
//  Synopsis:
//      Creation properties for an image brush.
//
//------------------------------------------------------------------------------
  D2D1_IMAGE_BRUSH_PROPERTIES = record
    sourceRectangle: D2D1_RECT_F;
    extendModeX: D2D1_EXTEND_MODE;
    extendModeY: D2D1_EXTEND_MODE;
    interpolationMode: D2D1_INTERPOLATION_MODE;
  end;
  TD2D1ImageBrushProperties = D2D1_IMAGE_BRUSH_PROPERTIES;
  PD2D1ImageBrushProperties = ^TD2D1ImageBrushProperties;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_BITMAP_BRUSH_PROPERTIES1
//
//------------------------------------------------------------------------------
  D2D1_BITMAP_BRUSH_PROPERTIES1 = record
    extendModeX: D2D1_EXTEND_MODE;
    extendModeY: D2D1_EXTEND_MODE;
    interpolationMode: D2D1_INTERPOLATION_MODE;
  end;
  TD2D1BitmapBrushProperties1 = D2D1_BITMAP_BRUSH_PROPERTIES1;
  PD2D1BitmapBrushProperties1 = ^TD2D1BitmapBrushProperties1;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_STROKE_STYLE_PROPERTIES1
//
//  Synopsis:
//      This defines how geometries should be drawn and widened.
//
//------------------------------------------------------------------------------
  D2D1_STROKE_STYLE_PROPERTIES1 = record
    startCap: D2D1_CAP_STYLE;
    endCap: D2D1_CAP_STYLE;
    dashCap: D2D1_CAP_STYLE;
    lineJoin: D2D1_LINE_JOIN;
    miterLimit: Single;
    dashStyle: D2D1_DASH_STYLE;
    dashOffset: Single;
    
    //
    // How the nib of the stroke is influenced by the context properties.
    //
    transformType: D2D1_STROKE_TRANSFORM_TYPE;
  end;
  TD2D1StrokeStyleProperties1 = D2D1_STROKE_STYLE_PROPERTIES1;
  PD2D1StrokeStyleProperties1 = ^TD2D1StrokeStyleProperties1;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_LAYER_PARAMETERS1
//
//  Synopsis:
//      All parameters related to pushing a layer.
//
//------------------------------------------------------------------------------
  D2D1_LAYER_PARAMETERS1 = record
    contentBounds: D2D1_RECT_F;
    geometricMask: ID2D1Geometry;
    maskAntialiasMode: D2D1_ANTIALIAS_MODE;
    maskTransform: D2D1_MATRIX_3X2_F;
    opacity: Single;
    opacityBrush: ID2D1Brush;
    layerOptions: D2D1_LAYER_OPTIONS1;
  end;
  TD2D1LayerParameters1 = D2D1_LAYER_PARAMETERS1;
  PD2D1LayerParameters1 = ^TD2D1LayerParameters1;


//+-----------------------------------------------------------------------------
//
//  Enum:
//      D2D1_PRINT_FONT_SUBSET_MODE
//
//------------------------------------------------------------------------------
  D2D1_PRINT_FONT_SUBSET_MODE = (
    //
    // Subset for used glyphs, send and discard font resource after every five pages
    //
    D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT = 0,
    
    //
    // Subset for used glyphs, send and discard font resource after each page
    //
    D2D1_PRINT_FONT_SUBSET_MODE_EACHPAGE = 1,
    
    //
    // Do not subset, reuse font for all pages, send it after first page
    //
    D2D1_PRINT_FONT_SUBSET_MODE_NONE = 2,
    D2D1_PRINT_FONT_SUBSET_MODE_FORCE_DWORD = Integer($ffffffff)
  );
  TD2D1PrintFontSubsetMode = D2D1_PRINT_FONT_SUBSET_MODE;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_DRAWING_STATE_DESCRIPTION1
//
//  Synopsis:
//      This describes the drawing state.
//
//------------------------------------------------------------------------------
  D2D1_DRAWING_STATE_DESCRIPTION1 = record
    antialiasMode: D2D1_ANTIALIAS_MODE;
    textAntialiasMode: D2D1_TEXT_ANTIALIAS_MODE;
    tag1: D2D1_TAG;
    tag2: D2D1_TAG;
    transform: D2D1_MATRIX_3X2_F;
    primitiveBlend: D2D1_PRIMITIVE_BLEND;
    unitMode: D2D1_UNIT_MODE;
  end;
  TD2D1DrawingStateDescription1 = D2D1_DRAWING_STATE_DESCRIPTION1;
  PD2D1DrawingStateDescription1 = ^TD2D1DrawingStateDescription1;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_PRINT_CONTROL_PROPERTIES
//
//------------------------------------------------------------------------------
  D2D1_PRINT_CONTROL_PROPERTIES = record
    fontSubset: D2D1_PRINT_FONT_SUBSET_MODE;
    
    //
    // DPI for rasterization of all unsupported D2D commands or options, defaults to
    // 150.0
    //
    rasterDPI: Single;
    
    //
    // Color space for vector graphics in XPS package
    //
    colorSpace: D2D1_COLOR_SPACE;
  end;
  TD2D1PrintControlProperties = D2D1_PRINT_CONTROL_PROPERTIES;
  PD2D1PrintControlProperties = ^TD2D1PrintControlProperties;


//+-----------------------------------------------------------------------------
//
//  Struct:
//      D2D1_CREATION_PROPERTIES
//
//  Synopsis:
//      This specifies the options while simultaneously creating the device, factory,
//      and device context.
//
//------------------------------------------------------------------------------
  D2D1_CREATION_PROPERTIES = record
    //
    // Describes locking behavior of D2D resources
    //
    threadingMode: D2D1_THREADING_MODE;
    debugLevel: D2D1_DEBUG_LEVEL;
    options: D2D1_DEVICE_CONTEXT_OPTIONS;
  end;
  TD2D1CreationProperties = D2D1_CREATION_PROPERTIES;
  PD2D1CreationProperties = ^TD2D1CreationProperties;





//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1GdiMetafileSink
//
//  Synopsis:
//      User-implementable interface for introspecting on a metafile.
//
//------------------------------------------------------------------------------
  ID2D1GdiMetafileSink = interface(IUnknown)
    ['{82237326-8111-4f7c-bcf4-b5c1175564fe}']
    //
    // Callback for examining a metafile record.
    //
    function ProcessRecord(
      recordType: DWORD;
      recordData: Pointer;
      recordDataSize: DWORD): HRESULT; stdcall;
  end; // interface ID2D1GdiMetafileSink



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1GdiMetafile
//
//  Synopsis:
//      Interface encapsulating a GDI/GDI+ metafile.
//
//------------------------------------------------------------------------------
  ID2D1GdiMetafile = interface(ID2D1Resource)
    ['{2f543dc3-cfc1-4211-864f-cfd91c6f3395}']
    //
    // Play the metafile into a caller-supplied sink interface.
    //
    function Stream(
      sink: ID2D1GdiMetafileSink): HRESULT; stdcall;
    
    
    //
    // Gets the bounds of the metafile.
    //
    function GetBounds(
      out bounds: D2D1_RECT_F): HRESULT; stdcall;
  end; // interface ID2D1GdiMetafile



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1CommandSink
//
//  Synopsis:
//      Caller-supplied implementation of an interface to receive the recorded command
//      list.
//
//------------------------------------------------------------------------------
  ID2D1CommandSink = interface(IUnknown)
    ['{54d7898a-a061-40a7-bec7-e465bcba2c4f}']
    function BeginDraw: HRESULT; stdcall;
    
    function EndDraw: HRESULT; stdcall;
    
    function SetAntialiasMode(
      antialiasMode: D2D1_ANTIALIAS_MODE): HRESULT; stdcall;
    
    function SetTags(
      tag1: D2D1_TAG;
      tag2: D2D1_TAG): HRESULT; stdcall;
    
    function SetTextAntialiasMode(
      textAntialiasMode: D2D1_TEXT_ANTIALIAS_MODE): HRESULT; stdcall;
    
    function SetTextRenderingParams(
      textRenderingParams: IDWriteRenderingParams): HRESULT; stdcall;
    
    function SetTransform(
      const transform: D2D1_MATRIX_3X2_F): HRESULT; stdcall;
    
    function SetPrimitiveBlend(
      primitiveBlend: D2D1_PRIMITIVE_BLEND): HRESULT; stdcall;
    
    function SetUnitMode(
      unitMode: D2D1_UNIT_MODE): HRESULT; stdcall;
    
    function Clear(
      color: PD2D1ColorF): HRESULT; stdcall;
    
    function DrawGlyphRun(
      baselineOrigin: D2D1_POINT_2F;
      const glyphRun: DWRITE_GLYPH_RUN;
      glyphRunDescription: PDwriteGlyphRunDescription;
      foregroundBrush: ID2D1Brush;
      measuringMode: DWRITE_MEASURING_MODE): HRESULT; stdcall;
    
    function DrawLine(
      point0: D2D1_POINT_2F;
      point1: D2D1_POINT_2F;
      brush: ID2D1Brush;
      strokeWidth: Single;
      strokeStyle: ID2D1StrokeStyle): HRESULT; stdcall;
    
    function DrawGeometry(
      geometry: ID2D1Geometry;
      brush: ID2D1Brush;
      strokeWidth: Single;
      strokeStyle: ID2D1StrokeStyle): HRESULT; stdcall;
    
    function DrawRectangle(
      const rect: D2D1_RECT_F;
      brush: ID2D1Brush;
      strokeWidth: Single;
      strokeStyle: ID2D1StrokeStyle): HRESULT; stdcall;
    
    function DrawBitmap(
      bitmap: ID2D1Bitmap;
      destinationRectangle: PD2D1RectF;
      opacity: Single;
      interpolationMode: D2D1_INTERPOLATION_MODE;
      sourceRectangle: PD2D1RectF;
      perspectiveTransform: PD2D1Matrix4x4F): HRESULT; stdcall;
    
    function DrawImage(
      image: ID2D1Image;
      targetOffset: PD2D1Point2F;
      imageRectangle: PD2D1RectF;
      interpolationMode: D2D1_INTERPOLATION_MODE;
      compositeMode: D2D1_COMPOSITE_MODE): HRESULT; stdcall;
    
    function DrawGdiMetafile(
      gdiMetafile: ID2D1GdiMetafile;
      targetOffset: PD2D1Point2F): HRESULT; stdcall;
    
    function FillMesh(
      mesh: ID2D1Mesh;
      brush: ID2D1Brush): HRESULT; stdcall;
    
    function FillOpacityMask(
      opacityMask: ID2D1Bitmap;
      brush: ID2D1Brush;
      destinationRectangle: PD2D1RectF;
      sourceRectangle: PD2D1RectF): HRESULT; stdcall;
    
    function FillGeometry(
      geometry: ID2D1Geometry;
      brush: ID2D1Brush;
      opacityBrush: ID2D1Brush): HRESULT; stdcall;
    
    function FillRectangle(
      const rect: D2D1_RECT_F;
      brush: ID2D1Brush): HRESULT; stdcall;
    
    function PushAxisAlignedClip(
      const clipRect: D2D1_RECT_F;
      antialiasMode: D2D1_ANTIALIAS_MODE): HRESULT; stdcall;
    
    function PushLayer(
      const layerParameters1: D2D1_LAYER_PARAMETERS1;
      layer: ID2D1Layer): HRESULT; stdcall;
    
    function PopAxisAlignedClip: HRESULT; stdcall;
    
    function PopLayer: HRESULT; stdcall;
  end; // interface ID2D1CommandSink



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1CommandList
//
//  Synopsis:
//      The commandList interface.
//
//------------------------------------------------------------------------------
  ID2D1CommandList = interface(ID2D1Image)
    ['{b4f34a19-2383-4d76-94f6-ec343657c3dc}']
    //
    // Play the command list into a caller-supplied sink interface.
    //
    function Stream(
      sink: ID2D1CommandSink): HRESULT; stdcall;
    
    
    //
    // Marks the command list as ready for use.
    //
    function Close: HRESULT; stdcall;
  end; // interface ID2D1CommandList



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1PrintControl
//
//------------------------------------------------------------------------------
  ID2D1PrintControl = interface(IUnknown)
    ['{2c1d867d-c290-41c8-ae7e-34a98702e9a5}']
    function AddPage(
      commandList: ID2D1CommandList;
      pageSize: D2D_SIZE_F;
      pagePrintTicketStream: IStream;
      tag1: PD2D1Tag = nil;
      tag2: PD2D1Tag = nil): HRESULT; stdcall;
    
    function Close: HRESULT; stdcall;
  end; // interface ID2D1PrintControl



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1ImageBrush
//
//  Synopsis:
//      Provides a brush that can take any effect, command list or bitmap and use it to
//      fill a 2D shape.
//
//------------------------------------------------------------------------------
  ID2D1ImageBrush = interface(ID2D1Brush)
    ['{fe9e984d-3f95-407c-b5db-cb94d4e8f87c}']
    procedure SetImage(
      image: ID2D1Image); stdcall;
    
    procedure SetExtendModeX(
      extendModeX: D2D1_EXTEND_MODE); stdcall;
    
    procedure SetExtendModeY(
      extendModeY: D2D1_EXTEND_MODE); stdcall;
    
    procedure SetInterpolationMode(
      interpolationMode: D2D1_INTERPOLATION_MODE); stdcall;
    
    procedure SetSourceRectangle(
      const sourceRectangle: D2D1_RECT_F); stdcall;
    
    procedure GetImage(
      out image: ID2D1Image); stdcall;
    
    function GetExtendModeX: D2D1_EXTEND_MODE; stdcall;
    
    function GetExtendModeY: D2D1_EXTEND_MODE; stdcall;
    
    function GetInterpolationMode: D2D1_INTERPOLATION_MODE; stdcall;
    
    procedure GetSourceRectangle(
      out sourceRectangle: D2D1_RECT_F); stdcall;
  end; // interface ID2D1ImageBrush



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1BitmapBrush1
//
//  Synopsis:
//      A bitmap brush allows a bitmap to be used to fill a geometry.  Interpolation
//      mode is specified with D2D1_INTERPOLATION_MODE
//
//------------------------------------------------------------------------------
  ID2D1BitmapBrush1 = interface(ID2D1BitmapBrush)
    ['{41343a53-e41a-49a2-91cd-21793bbb62e5}']
    //
    // Sets the interpolation mode used when this brush is used.
    //
    procedure SetInterpolationMode1(
      interpolationMode: D2D1_INTERPOLATION_MODE); stdcall;
    
    function GetInterpolationMode1: D2D1_INTERPOLATION_MODE; stdcall;
  end; // interface ID2D1BitmapBrush1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1StrokeStyle1
//
//  Synopsis:
//      Extends a stroke style to allow nominal width strokes.
//
//------------------------------------------------------------------------------
  ID2D1StrokeStyle1 = interface(ID2D1StrokeStyle)
    ['{10a72a66-e91c-43f4-993f-ddf4b82b0b4a}']
    function GetStrokeTransformType: D2D1_STROKE_TRANSFORM_TYPE; stdcall;
  end; // interface ID2D1StrokeStyle1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1PathGeometry1
//
//------------------------------------------------------------------------------
  ID2D1PathGeometry1 = interface(ID2D1PathGeometry)
    ['{62baa2d2-ab54-41b7-b872-787e0106a421}']
    function ComputePointAndSegmentAtLength(
      length: Single;
      startSegment: UINT32;
      worldTransform: PD2D1Matrix3x2F;
      flatteningTolerance: Single;
      out pointDescription: D2D1_POINT_DESCRIPTION): HRESULT; stdcall;
  end; // interface ID2D1PathGeometry1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Properties
//
//------------------------------------------------------------------------------
  ID2D1Properties = interface(IUnknown)
    ['{483473d7-cd46-4f9d-9d3a-3112aa80159d}']
    //
    // Returns the total number of custom properties in this interface.
    //
    function GetPropertyCount: UINT32; stdcall;
    
    
    //
    // Retrieves the property name from the given property index.
    //
    function GetPropertyName(
      index: UINT32;
      name: PWideChar;
      nameCount: UINT32): HRESULT; stdcall;
    

    //
    // Returns the length of the property name from the given index.
    //
    function GetPropertyNameLength(
      index: UINT32): UINT32; stdcall;
    
    
    //
    // Retrieves the type of the given property.
    //
    function GetType(
      index: UINT32): D2D1_PROPERTY_TYPE; stdcall;
    
    
    //
    // Retrieves the property index for the given property name.
    //
    function GetPropertyIndex(
      name: PWideChar): UINT32; stdcall;
    
    
    //
    // Sets the value of the given property using its name.
    //
    function SetValueByName(
      name: PWideChar;
      type_: D2D1_PROPERTY_TYPE;
      data: PByte;
      dataSize: UINT32): HRESULT; stdcall;
    
    
    //
    // Sets the given value using the property index.
    //
    function SetValue(
      index: UINT32;
      type_: D2D1_PROPERTY_TYPE;
      data: PByte;
      dataSize: UINT32): HRESULT; stdcall;
    
    
    //
    // Retrieves the given property or sub-property by name. '.' is the delimiter for
    // sub-properties.
    //
    function GetValueByName(
      name: PWideChar;
      type_: D2D1_PROPERTY_TYPE;
      data: PByte;
      dataSize: UINT32): HRESULT; stdcall;
    
    
    //
    // Retrieves the given value by index.
    //
    function GetValue(
      index: UINT32;
      type_: D2D1_PROPERTY_TYPE;
      data: PByte;
      dataSize: UINT32): HRESULT; stdcall;
    
    
    //
    // Returns the value size for the given property index.
    //
    function GetValueSize(
      index: UINT32): UINT32; stdcall;
    
    
    //
    // Retrieves the sub-properties of the given property by index.
    //
    function GetSubProperties(
      index: UINT32;
      out subProperties: ID2D1Properties): HRESULT; stdcall;
  end; // interface ID2D1Properties



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Effect
//
//  Synopsis:
//      The effect interface. Properties control how the effect is rendered. The effect
//      is Drawn with the DrawImage call.
//
//------------------------------------------------------------------------------
  ID2D1Effect = interface(ID2D1Properties)
    ['{28211a43-7d89-476f-8181-2d6159b220ad}']
    //
    // Sets the input to the given effect. The input can be a concrete bitmap or the
    // output of another effect.
    //
    procedure SetInput(
      index: UINT32;
      input: ID2D1Image;
      invalidate: BOOL = True); stdcall;
    
    
    //
    // If the effect supports a variable number of inputs, this sets the number of
    // input that are currently active on the effect.
    //
    function SetInputCount(
      inputCount: UINT32): HRESULT; stdcall;
    
    
    //
    // Returns the input image to the effect. The input could be another effect or a
    // bitmap.
    //
    procedure GetInput(
      index: UINT32;
      out input: ID2D1Image); stdcall;
    
    
    //
    // This returns the number of input that are bound into this effect.
    //
    function GetInputCount: UINT32; stdcall;
    
    
    //
    // Returns the output image of the given effect. This can be set as the input to
    // another effect or can be drawn with DrawImage.
    //
    procedure GetOutput(
      out outputImage: ID2D1Image); stdcall;
  end; // interface ID2D1Effect



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Bitmap1
//
//------------------------------------------------------------------------------
  ID2D1Bitmap1 = interface(ID2D1Bitmap)
    ['{a898a84c-3873-4588-b08b-ebbf978df041}']
    //
    // Retrieves the color context information associated with the bitmap.
    //
    procedure GetColorContext(
      out colorContext: ID2D1ColorContext); stdcall;
    
    
    //
    // Retrieves the bitmap options used when creating the API.
    //
    function GetOptions: D2D1_BITMAP_OPTIONS; stdcall;
    
    
    //
    // Retrieves the DXGI surface from the corresponding bitmap, if the bitmap was
    // created from a device derived from a D3D device.
    //
    function GetSurface(
      out dxgiSurface: IDXGISurface): HRESULT; stdcall;
    
    
    //
    // Maps the given bitmap into memory. The bitmap must have been created with the
    // D2D1_BITMAP_OPTIONS_CPU_READ flag.
    //
    function Map(
      options: D2D1_MAP_OPTIONS;
      out mappedRect: D2D1_MAPPED_RECT): HRESULT; stdcall;
    
    
    //
    // Unmaps the given bitmap from memory.
    //
    function Unmap: HRESULT; stdcall;
  end; // interface ID2D1Bitmap1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1ColorContext
//
//------------------------------------------------------------------------------
  ID2D1ColorContext = interface(ID2D1Resource)
    ['{1c4820bb-5771-4518-a581-2fe4dd0ec657}']
    //
    // Retrieves the color space of the color context.
    //
    function GetColorSpace: D2D1_COLOR_SPACE; stdcall;
    
    
    //
    // Retrieves the size of the color profile, in bytes.
    //
    function GetProfileSize: UINT32; stdcall;
    
    
    //
    // Retrieves the color profile bytes.
    //
    function GetProfile(
      profile: PByte;
      profileSize: UINT32): HRESULT; stdcall;
  end; // interface ID2D1ColorContext



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1GradientStopCollection1
//
//  Synopsis:
//      Represents an collection of gradient stops that can then be the source resource
//      for either a linear or radial gradient brush.
//
//------------------------------------------------------------------------------
  ID2D1GradientStopCollection1 = interface(ID2D1GradientStopCollection)
    ['{ae1572f4-5dd0-4777-998b-9279472ae63b}']
    //
    // Copies the gradient stops from the collection into the caller's memory. If this
    // object was created using ID2D1DeviceContext::CreateGradientStopCollection, this
    // method returns the same values as were specified in the creation method. If this
    // object was created using ID2D1RenderTarget::CreateGradientStopCollection, the
    // stops returned here will first be transformed into the gamma space specified by
    // the colorInterpolationGamma parameter.
    //
    procedure GetGradientStops1(
      gradientStops: PD2D1GradientStop;
      gradientStopsCount: UINT32); stdcall;
    
    
    //
    // Returns the color space in which interpolation occurs. If this object was
    // created using ID2D1RenderTarget::CreateGradientStopCollection, this method
    // returns the color space related to the color interpolation gamma.
    //
    function GetPreInterpolationSpace: D2D1_COLOR_SPACE; stdcall;
    
    
    //
    // Returns the color space colors will be converted to after interpolation occurs.
    // If this object was created using
    // ID2D1RenderTarget::CreateGradientStopCollection, this method returns
    // D2D1_COLOR_SPACE_SRGB.
    //
    function GetPostInterpolationSpace: D2D1_COLOR_SPACE; stdcall;
    
    
    //
    // Returns the buffer precision of this gradient. If this object was created using
    // ID2D1RenderTarget::CreateGradientStopCollection, this method returns
    // D2D1_BUFFER_PRECISION_8BPC_UNORM.
    //
    function GetBufferPrecision: D2D1_BUFFER_PRECISION; stdcall;
    
    
    //
    // Returns the interpolation mode used to interpolate colors in the gradient.
    //
    function GetColorInterpolationMode: D2D1_COLOR_INTERPOLATION_MODE; stdcall;
  end; // interface ID2D1GradientStopCollection1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1DrawingStateBlock1
//
//  Synopsis:
//      Represents drawing state.
//
//------------------------------------------------------------------------------
  ID2D1DrawingStateBlock1 = interface(ID2D1DrawingStateBlock)
    ['{689f1f85-c72e-4e33-8f19-85754efd5ace}']
    //
    // Retrieves the state currently contained within this state block resource.
    //
    procedure GetDescription(
      out stateDescription: D2D1_DRAWING_STATE_DESCRIPTION1); stdcall;
    
    
    //
    // Sets the state description of this state block resource.
    //
    procedure SetDescription(
      const stateDescription: D2D1_DRAWING_STATE_DESCRIPTION1); stdcall;
  end; // interface ID2D1DrawingStateBlock1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1DeviceContext
//
//  Synopsis:
//      The device context represents a set of state and a command buffer that is used
//      to render to a target bitmap.
//
//------------------------------------------------------------------------------
  ID2D1DeviceContext = interface(ID2D1RenderTarget)
    ['{e8f7fe7a-191c-466d-ad95-975678bda998}']
    //
    // Creates a bitmap with extended bitmap properties, potentially from a block of
    // memory.
    //
    function CreateBitmap(
      size: D2D1_SIZE_U;
      sourceData: Pointer;
      pitch: UINT32;
      const bitmapProperties: D2D1_BITMAP_PROPERTIES1;
      out bitmap: ID2D1Bitmap1): HRESULT; stdcall;
    
    
    //
    // Create a D2D bitmap by copying a WIC bitmap.
    //
    function CreateBitmapFromWicBitmap(
      wicBitmapSource: IWICBitmapSource;
      bitmapProperties: PD2D1BitmapProperties1;
      out bitmap: ID2D1Bitmap1): HRESULT; stdcall;
    
    
    //
    // Creates a color context from a color space.  If the space is Custom, the context
    // is initialized from the profile/profileSize arguments.  Otherwise the context is
    // initialized with the profile bytes associated with the space and
    // profile/profileSize are ignored.
    //
    function CreateColorContext(
      space: D2D1_COLOR_SPACE;
      profile: PByte;
      profileSize: UINT32;
      out colorContext: ID2D1ColorContext): HRESULT; stdcall;
    
    function CreateColorContextFromFilename(
      filename: PWideChar;
      out colorContext: ID2D1ColorContext): HRESULT; stdcall;
    
    function CreateColorContextFromWicColorContext(
      wicColorContext: IWICColorContext;
      out colorContext: ID2D1ColorContext): HRESULT; stdcall;
    
    
    //
    // Creates a bitmap from a DXGI surface with a set of extended properties.
    //
    function CreateBitmapFromDxgiSurface(
      surface: IDXGISurface;
      bitmapProperties: PD2D1BitmapProperties1;
      out bitmap: ID2D1Bitmap1): HRESULT; stdcall;
    
    
    //
    // Create a new effect, the effect must either be built in or previously registered
    // through ID2D1Factory1::RegisterEffectFromStream or
    // ID2D1Factory1::RegisterEffectFromString.
    //
    function CreateEffect(
      effectId: REFCLSID;
      out effect: ID2D1Effect): HRESULT; stdcall;
    
    
    //
    // A gradient stop collection represents a set of stops in an ideal unit length.
    // This is the source resource for a linear gradient and radial gradient brush.
    //
    function CreateGradientStopCollection(
      straightAlphaGradientStops: PD2D1GradientStop;
      straightAlphaGradientStopsCount: UINT32;
      
      //
      // Specifies both the input color space and the space in which the color
      // interpolation occurs.
      //
      preInterpolationSpace: D2D1_COLOR_SPACE;
      
      //
      // Specifies the color space colors will be converted to after interpolation
      // occurs.
      //
      postInterpolationSpace: D2D1_COLOR_SPACE;
      
      //
      // Specifies the precision in which the gradient buffer will be held.
      //
      bufferPrecision: D2D1_BUFFER_PRECISION;
      
      //
      // Specifies how the gradient will be extended outside of the unit length.
      //
      extendMode: D2D1_EXTEND_MODE;
      
      //
      // Determines if colors will be interpolated in straight alpha or premultiplied
      // alpha space.
      //
      colorInterpolationMode: D2D1_COLOR_INTERPOLATION_MODE;
      out gradientStopCollection1: ID2D1GradientStopCollection1
      ): HRESULT; stdcall;
    
    
    //
    // Creates an image brush, the input image can be any type of image, including a
    // bitmap, effect and a command list.
    //
    function CreateImageBrush(
      image: ID2D1Image;
      const imageBrushProperties: D2D1_IMAGE_BRUSH_PROPERTIES;
      brushProperties: PD2D1BrushProperties;
      out imageBrush: ID2D1ImageBrush): HRESULT; stdcall;
    
    function CreateBitmapBrush(
      bitmap: ID2D1Bitmap;
      bitmapBrushProperties: PD2D1BitmapBrushProperties1;
      brushProperties: PD2D1BrushProperties;
      out bitmapBrush: ID2D1BitmapBrush1): HRESULT; stdcall;
    
    
    //
    // Creates a new command list.
    //
    function CreateCommandList(
      out commandList: ID2D1CommandList): HRESULT; stdcall;
    
    
    //
    // Indicates whether the format is supported by D2D.
    //
    function IsDxgiFormatSupported(
      format: DXGI_FORMAT): BOOL; stdcall;
    
    
    //
    // Indicates whether the buffer precision is supported by D2D.
    //
    function IsBufferPrecisionSupported(
      bufferPrecision: D2D1_BUFFER_PRECISION): BOOL; stdcall;
    
    
    //
    // This retrieves the local-space bounds in DIPs of the current image using the
    // device context DPI.
    //
    function GetImageLocalBounds(
      image: ID2D1Image;
      out localBounds: D2D1_RECT_F): HRESULT; stdcall;
    
    
    //
    // This retrieves the world-space bounds in DIPs of the current image using the
    // device context DPI.
    //
    function GetImageWorldBounds(
      image: ID2D1Image;
      out worldBounds: D2D1_RECT_F): HRESULT; stdcall;
    
    
    //
    // Retrieves the world-space bounds in DIPs of the glyph run using the device
    // context DPI.
    //
    function GetGlyphRunWorldBounds(
      baselineOrigin: D2D1_POINT_2F;
      const glyphRun: DWRITE_GLYPH_RUN;
      measuringMode: DWRITE_MEASURING_MODE;
      out bounds: D2D1_RECT_F): HRESULT; stdcall;
    
    
    //
    // Retrieves the device associated with this device context.
    //
    procedure GetDevice(
      out device: ID2D1Device); stdcall;
    
    
    //
    // Sets the target for this device context to point to the given image. The image
    // can be a command list or a bitmap created with the D2D1_BITMAP_OPTIONS_TARGET
    // flag.
    //
    procedure SetTarget(
      image: ID2D1Image); stdcall;
    
    
    //
    // Gets the target that this device context is currently pointing to.
    //
    procedure GetTarget(
      out image: ID2D1Image); stdcall;
    
    
    //
    // Sets tuning parameters for internal rendering inside the device context.
    //
    procedure SetRenderingControls(
      const renderingControls: D2D1_RENDERING_CONTROLS); stdcall;
    
    
    //
    // This retrieves the rendering controls currently selected into the device
    // context.
    //
    procedure GetRenderingControls(
      out renderingControls: D2D1_RENDERING_CONTROLS); stdcall;
    
    
    //
    // Changes the primitive blending mode for all of the rendering operations.
    //
    procedure SetPrimitiveBlend(
      primitiveBlend: D2D1_PRIMITIVE_BLEND); stdcall;
    
    
    //
    // Returns the primitive blend currently selected into the device context.
    //
    function GetPrimitiveBlend: D2D1_PRIMITIVE_BLEND; stdcall;
    
    
    //
    // Changes the units used for all of the rendering operations.
    //
    procedure SetUnitMode(
      unitMode: D2D1_UNIT_MODE); stdcall;
    
    
    //
    // Returns the unit mode currently set on the device context.
    //
    function GetUnitMode: D2D1_UNIT_MODE; stdcall;
    
    
    //
    // Draws the glyph run with an extended description to describe the glyphs.
    //
    procedure DrawGlyphRun(
      baselineOrigin: D2D1_POINT_2F;
      const glyphRun: DWRITE_GLYPH_RUN;
      glyphRunDescription: PDwriteGlyphRunDescription;
      foregroundBrush: ID2D1Brush;
      measuringMode: DWRITE_MEASURING_MODE = DWRITE_MEASURING_MODE_NATURAL); stdcall;
    
    
    //
    // Draw an image to the device context. The image represents either a concrete
    // bitmap or the output of an effect graph.
    //
    procedure DrawImage(
      image: ID2D1Image;
      targetOffset: PD2D1Point2F = nil;
      imageRectangle: PD2D1RectF = nil;
      interpolationMode: D2D1_INTERPOLATION_MODE = D2D1_INTERPOLATION_MODE_LINEAR;
      compositeMode: D2D1_COMPOSITE_MODE = D2D1_COMPOSITE_MODE_SOURCE_OVER); stdcall;
    
    
    //
    // Draw a metafile to the device context.
    //
    procedure DrawGdiMetafile(
      gdiMetafile: ID2D1GdiMetafile;
      targetOffset: PD2D1Point2F = nil); stdcall;
    
    procedure DrawBitmap(
      bitmap: ID2D1Bitmap;
      destinationRectangle: PD2D1RectF;
      opacity: Single;
      interpolationMode: D2D1_INTERPOLATION_MODE;
      sourceRectangle: PD2D1RectF = nil;
      perspectiveTransform: PD2D1Matrix4x4F = nil); stdcall;
    
    
    //
    // Push a layer on the device context.
    //
    procedure PushLayer(
      const layerParameters: D2D1_LAYER_PARAMETERS1;
      layer: ID2D1Layer); stdcall;
    
    
    //
    // This indicates that a portion of an effect's input is invalid. This method can
    // be called many times.
    //
    function InvalidateEffectInputRectangle(
      effect: ID2D1Effect;
      input: UINT32;
      const inputRectangle: D2D1_RECT_F): HRESULT; stdcall;
    
    
    //
    // Gets the number of invalid ouptut rectangles that have accumulated at the
    // effect.
    //
    function GetEffectInvalidRectangleCount(
      effect: ID2D1Effect;
      out rectangleCount: UINT32): HRESULT; stdcall;
    
    
    //
    // Gets the invalid rectangles that are at the output of the effect.
    //
    function GetEffectInvalidRectangles(
      effect: ID2D1Effect;
      rectangles: PD2D1RectF;
      rectanglesCount: UINT32): HRESULT; stdcall;
    
    
    //
    // Gets the maximum region of each specified input which would be used during a
    // subsequent rendering operation
    //
    function GetEffectRequiredInputRectangles(
      renderEffect: ID2D1Effect;
      renderImageRectangle: PD2D1RectF;
      inputDescriptions: PD2D1EffectInputDescription;
      requiredInputRects: PD2D1RectF;
      inputCount: UINT32): HRESULT; stdcall;
    
    
    //
    // Fill using the alpha channel of the supplied opacity mask bitmap. The brush
    // opacity will be modulated by the mask. The render target antialiasing mode must
    // be set to aliased.
    //
    procedure FillOpacityMask(
      opacityMask: ID2D1Bitmap;
      brush: ID2D1Brush;
      destinationRectangle: PD2D1RectF = nil;
      sourceRectangle: PD2D1RectF = nil); stdcall;
  end; // interface ID2D1DeviceContext



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Device
//
//  Synopsis:
//      The device defines a resource domain whose objects and device contexts can be
//      used together.
//
//------------------------------------------------------------------------------
  ID2D1Device = interface(ID2D1Resource)
    ['{47dd575d-ac05-4cdd-8049-9b02cd16f44c}']
    //
    // Creates a new device context with no initially assigned target.
    //
    function CreateDeviceContext(
      options: D2D1_DEVICE_CONTEXT_OPTIONS;
      out deviceContext: ID2D1DeviceContext): HRESULT; stdcall;
    
    
    //
    // Creates a D2D print control.
    //
    function CreatePrintControl(
      wicFactory: IWICImagingFactory;
      documentTarget: IPrintDocumentPackageTarget;
      printControlProperties: PD2D1PrintControlProperties;
      out printControl: ID2D1PrintControl): HRESULT; stdcall;
    
    
    //
    // Sets the maximum amount of texture memory to maintain before evicting caches.
    //
    procedure SetMaximumTextureMemory(
      maximumInBytes: UINT64); stdcall;
    
    
    //
    // Gets the maximum amount of texture memory to maintain before evicting caches.
    //
    function GetMaximumTextureMemory: UINT64; stdcall;
    
    
    //
    // Clears all resources that are cached but not held in use by the application
    // through an interface reference.
    //
    procedure ClearResources(
      millisecondsSinceUse: UINT32 = 0); stdcall;
  end; // interface ID2D1Device



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Factory1
//
//------------------------------------------------------------------------------
  ID2D1Factory1 = interface(ID2D1Factory)
    ['{bb12d362-daee-4b9a-aa1d-14ba401cfa1f}']
    //
    // This creates a new Direct2D device from the given IDXGIDevice.
    //
    function CreateDevice(
      dxgiDevice: IDXGIDevice;
      out d2dDevice: ID2D1Device): HRESULT; stdcall;
    
    
    //
    // This creates a stroke style with the ability to preserve stroke width in various
    // ways.
    //
    function CreateStrokeStyle(
      const strokeStyleProperties: D2D1_STROKE_STYLE_PROPERTIES1;
      dashes: PSingle;
      dashesCount: UINT32;
      out strokeStyle: ID2D1StrokeStyle1): HRESULT; stdcall;
    
    
    //
    // Creates a path geometry with new operational methods.
    //
    function CreatePathGeometry(
      out pathGeometry: ID2D1PathGeometry1): HRESULT; stdcall;
    
    
    //
    // Creates a new drawing state block, this can be used in subsequent
    // SaveDrawingState and RestoreDrawingState operations on the render target.
    //
    function CreateDrawingStateBlock(
      drawingStateDescription: PD2D1DrawingStateDescription1;
      textRenderingParams: IDWriteRenderingParams;
      out drawingStateBlock: ID2D1DrawingStateBlock1): HRESULT; stdcall;
    
    
    //
    // Creates a new GDI metafile.
    //
    function CreateGdiMetafile(
      metafileStream: IStream;
      out metafile: ID2D1GdiMetafile): HRESULT; stdcall;
    
    
    //
    // This globally registers the given effect. The effect can later be instantiated
    // by using the registered class id. The effect registration is reference counted.
    //
    function RegisterEffectFromStream(
      classId: REFCLSID;
      propertyXml: IStream;
      bindings: PD2D1PropertyBinding;
      bindingsCount: UINT32;
      effectFactory: PD2D1EffectFactory): HRESULT; stdcall;
    
    
    //
    // This globally registers the given effect. The effect can later be instantiated
    // by using the registered class id. The effect registration is reference counted.
    //
    function RegisterEffectFromString(
      classId: REFCLSID;
      propertyXml: PWideChar;
      bindings: PD2D1PropertyBinding;
      bindingsCount: UINT32;
      effectFactory: PD2D1EffectFactory): HRESULT; stdcall;
    
    
    //
    // This unregisters the given effect by its class id, you need to call
    // UnregisterEffect for every call to ID2D1Factory1::RegisterEffectFromStream and
    // ID2D1Factory1::RegisterEffectFromString to completely unregister it.
    //
    function UnregisterEffect(
      classId: REFCLSID): HRESULT; stdcall;
    
    
    //
    // This returns all of the registered effects in the process, including any
    // built-in effects.
    //
    function GetRegisteredEffects(
      effects: PCLSID;
      effectsCount: UINT32;
      
      //
      // The number of effects returned into the passed in effects array.
      //
      effectsReturned: PUINT32;
      
      //
      // The number of effects currently registered in the system.
      //
      effectsRegistered: PUINT32): HRESULT; stdcall;
    
    
    //
    // This retrieves the effect properties for the given effect, all of the effect
    // properties will be set to a default value since an effect is not instantiated to
    // implement the returned property interface.
    //
    function GetEffectProperties(
      effectId: REFCLSID;
      out properties: ID2D1Properties): HRESULT; stdcall;
  end; // interface ID2D1Factory1



//+-----------------------------------------------------------------------------
//
//  Interface:
//      ID2D1Multithread
//
//------------------------------------------------------------------------------
  ID2D1Multithread = interface(IUnknown)
    ['{31e6e7bc-e0ff-4d46-8c64-a0a8c41c15d3}']
    //
    // Returns whether the D2D factory was created with
    // D2D1_FACTORY_TYPE_MULTI_THREADED.
    //
    function GetMultithreadProtected: BOOL; stdcall;
    
    
    //
    // Enters the D2D API critical section, if it exists.
    //
    procedure Enter; stdcall;
    
    
    //
    // Leaves the D2D API critical section, if it exists.
    //
    procedure Leave; stdcall;
  end; // interface ID2D1Multithread





//EXTERN_C CONST IID IID_ID2D1GdiMetafileSink;
//EXTERN_C CONST IID IID_ID2D1GdiMetafile;
//EXTERN_C CONST IID IID_ID2D1CommandSink;
//EXTERN_C CONST IID IID_ID2D1CommandList;
//EXTERN_C CONST IID IID_ID2D1PrintControl;
//EXTERN_C CONST IID IID_ID2D1ImageBrush;
//EXTERN_C CONST IID IID_ID2D1BitmapBrush1;
//EXTERN_C CONST IID IID_ID2D1StrokeStyle1;
//EXTERN_C CONST IID IID_ID2D1PathGeometry1;
//EXTERN_C CONST IID IID_ID2D1Properties;
//EXTERN_C CONST IID IID_ID2D1Effect;
//EXTERN_C CONST IID IID_ID2D1Bitmap1;
//EXTERN_C CONST IID IID_ID2D1ColorContext;
//EXTERN_C CONST IID IID_ID2D1GradientStopCollection1;
//EXTERN_C CONST IID IID_ID2D1DrawingStateBlock1;
//EXTERN_C CONST IID IID_ID2D1DeviceContext;
//EXTERN_C CONST IID IID_ID2D1Device;
//EXTERN_C CONST IID IID_ID2D1Factory1;
//EXTERN_C CONST IID IID_ID2D1Multithread;





function D2D1CreateDevice(
  dxgiDevice: IDXGIDevice;
  creationProperties: PD2D1CreationProperties;
  out d2dDevice: ID2D1Device): HRESULT; stdcall; overload;

function D2D1CreateDeviceContext(
  dxgiSurface: IDXGISurface;
  creationProperties: PD2D1CreationProperties;
  out d2dDeviceContext: ID2D1DeviceContext): HRESULT; stdcall; overload;

function D2D1ConvertColorSpace(
  sourceColorSpace: D2D1_COLOR_SPACE;
  destinationColorSpace: D2D1_COLOR_SPACE;
  const color: D2D1_COLOR_F): D2D1_COLOR_F; stdcall;

procedure D2D1SinCos(
  angle: Single;
  out s: Single;
  out c: Single); stdcall;

function D2D1Tan(
  angle: Single): Single; stdcall;

function D2D1Vec3Length(
  x, y, z: Single): Single; stdcall;

function D2D1CreateDevice(
  dxgiDevice: IDXGIDevice;
  const creationProperties: D2D1_CREATION_PROPERTIES;
  out d2dDevice: ID2D1Device): HRESULT; overload; inline;

function D2D1CreateDeviceContext(
  dxgiSurface: IDXGISurface;
  const creationProperties: D2D1_CREATION_PROPERTIES;
  out d2dDeviceContext: ID2D1DeviceContext): HRESULT; overload; inline;

const
  d2d1lib = 'd2d1.dll';

implementation

{$WARN SYMBOL_PLATFORM OFF}
function D2D1CreateDevice(
  dxgiDevice: IDXGIDevice;
  creationProperties: PD2D1CreationProperties;
  out d2dDevice: ID2D1Device): HRESULT; external d2d1lib delayed;
function D2D1CreateDeviceContext(
  dxgiSurface: IDXGISurface;
  creationProperties: PD2D1CreationProperties;
  out d2dDeviceContext: ID2D1DeviceContext): HRESULT; external d2d1lib delayed;
function D2D1ConvertColorSpace; external d2d1lib delayed;
procedure D2D1SinCos; external d2d1lib delayed;
function D2D1Tan; external d2d1lib delayed;
function D2D1Vec3Length; external d2d1lib delayed;
{$WARN SYMBOL_PLATFORM ON}

function D2D1CreateDevice(
  dxgiDevice: IDXGIDevice;
  const creationProperties: D2D1_CREATION_PROPERTIES;
  out d2dDevice: ID2D1Device): HRESULT;
begin
  Result :=
    D2D1CreateDevice(
      dxgiDevice,
      @creationProperties,
      d2dDevice);
end;

function D2D1CreateDeviceContext(
  dxgiSurface: IDXGISurface;
  const creationProperties: D2D1_CREATION_PROPERTIES;
  out d2dDeviceContext: ID2D1DeviceContext): HRESULT;
begin
  Result :=
    D2D1CreateDeviceContext(
      dxgiSurface,
      @creationProperties,
      d2dDeviceContext);
end;

end.