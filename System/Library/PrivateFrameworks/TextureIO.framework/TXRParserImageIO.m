@implementation TXRParserImageIO

+ (BOOL)handlesData:(id)a3
{
  return 1;
}

- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CGImageSource *v12;
  CGImageSource *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CGImageRef ImageAtIndex;
  void *v21;
  BOOL v22;
  TXRImageInfo *v23;
  TXRImageInfo *imageInfo;
  void *v25;
  TXRTextureInfo *v26;
  TXRTextureInfo *textureInfo;

  v10 = a4;
  v11 = a5;
  v12 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v12)
    goto LABEL_11;
  v13 = v12;
  v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
  if (!v14)
    goto LABEL_11;
  if (v11)
  {
    v15 = v14;
    v16 = (const void *)*MEMORY[0x1E0CBCFF0];
    if (CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x1E0CBCFF0]))
    {
      CFDictionaryGetValue(v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");
      if ((objc_msgSend(v11, "originOperation") & 0xF) != 0)
      {
        v19 = (void *)objc_msgSend(v11, "copyWithZone:", 0);

        objc_msgSend(v19, "setOriginOperation:", objc_msgSend(v19, "originOperation") & 0xFFFFFFFFFFFFFFF0);
        objc_msgSend(v19, "setOriginOperation:", objc_msgSend(v19, "originOperation") | v18);
        v11 = v19;
      }

    }
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
  if (ImageAtIndex)
  {
    +[TXRParserImageIO decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:](TXRParserImageIO, "decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:", ImageAtIndex, 0, v10, v11, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 != 0;
    if (v21)
    {
      v23 = objc_alloc_init(TXRImageInfo);
      imageInfo = self->_imageInfo;
      self->_imageInfo = v23;

      -[TXRImageInfo setBytesPerRow:](self->_imageInfo, "setBytesPerRow:", objc_msgSend(v21, "bytesPerRow"));
      -[TXRImageInfo setBytesPerImage:](self->_imageInfo, "setBytesPerImage:", objc_msgSend(v21, "bytesPerImage"));
      objc_msgSend(v21, "buffer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TXRImageInfo setBuffer:](self->_imageInfo, "setBuffer:", v25);

      -[TXRImageInfo setOffset:](self->_imageInfo, "setOffset:", objc_msgSend(v21, "offset"));
      v26 = objc_alloc_init(TXRTextureInfo);
      textureInfo = self->_textureInfo;
      self->_textureInfo = v26;

      -[TXRTextureInfo setPixelFormat:](self->_textureInfo, "setPixelFormat:", objc_msgSend(v21, "pixelFormat"));
      -[TXRTextureInfo setAlphaInfo:](self->_textureInfo, "setAlphaInfo:", objc_msgSend(v21, "alphaInfo"));
      objc_msgSend(v21, "dimensions");
      -[TXRTextureInfo setDimensions:](self->_textureInfo, "setDimensions:");
      -[TXRTextureInfo setCubemap:](self->_textureInfo, "setCubemap:", 0);
      -[TXRTextureInfo setMipmapLevelCount:](self->_textureInfo, "setMipmapLevelCount:", 1);
      -[TXRTextureInfo setArrayLength:](self->_textureInfo, "setArrayLength:", 1);
    }
    else if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
LABEL_11:
    if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));
      v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

+ (int)determineColorSpaceClass:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  CGColorSpaceRef ColorSpace;
  CGColorSpace *DeviceRGB;
  CGColorSpaceRef DeviceGray;
  CGColorSpace *v14;
  CGColorSpace *v16;
  CGColorSpaceRef v17;

  v7 = a5;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "colorSpaceHandling"))
  {
    v9 = objc_msgSend(v8, "colorSpaceHandling");
    if ((unint64_t)(v9 - 1) >= 3)
      +[TXRParserImageIO determineColorSpaceClass:displayGamut:options:].cold.1();
    v10 = 3 - v9;
  }
  else
  {
    ColorSpace = CGImageGetColorSpace(a3);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    DeviceGray = CGColorSpaceCreateDeviceGray();
    if (!ColorSpace || (v14 = DeviceGray, CFEqual(DeviceRGB, ColorSpace)) || CFEqual(v14, ColorSpace))
    {
      v10 = 0;
    }
    else
    {
      CGColorSpaceRelease(DeviceRGB);
      CGColorSpaceRelease(v14);
      v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      if (!CFEqual(ColorSpace, v16))
      {
        CGColorSpaceRelease(v16);
        v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D990]);
        if (CFEqual(ColorSpace, v17))
        {
          v10 = 1;
          goto LABEL_9;
        }
        CGColorSpaceRelease(v17);
        if (a4 == 1 && CGColorSpaceIsWideGamutRGB(ColorSpace))
        {
          v10 = 3;
          goto LABEL_9;
        }
      }
      v10 = 2;
    }
  }
LABEL_9:

  return v10;
}

+ (id)decodeCGImage:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  CGColorSpace *ColorSpace;
  void *v15;

  v12 = a6;
  v13 = a5;
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceRetain(ColorSpace);
  objc_msgSend(a1, "decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:", a3, a4, v13, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(ColorSpace);
  return v15;
}

+ (id)decodeCGImageNonIndexed:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  unsigned int Width;
  unsigned int Height;
  CGColorSpace *ColorSpace;
  CFStringRef *v15;
  CGImageAlphaInfo AlphaInfo;
  int v17;
  unsigned __int32 v18;
  int v19;
  uint64_t v20;
  CGBitmapInfo v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t v25;
  char v26;
  CGColorSpace *v27;
  unsigned int v28;
  id v29;
  uint64_t v30;
  void *v31;
  vImagePixelCount v32;
  vImagePixelCount v33;
  TXRImageIndependent *v34;
  void *v35;
  void *v36;
  void *v37;
  size_t v38;
  uint64_t v39;
  int v40;
  int v41;
  id *v42;
  int v43;
  void *v44;
  vImage_Error v45;
  void *v46;
  int v47;
  vImage_Error v48;
  vImage_Error v49;
  uint8_t v50;
  double v51;
  char v53;
  void *v54;
  int v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  uint8_t backColor[4];
  vImage_Buffer dest;
  vImage_Buffer src;
  vImage_CGImageFormat format;
  vImage_Buffer buf;
  uint64_t v73;
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  switch(+[TXRParserImageIO determineColorSpaceClass:displayGamut:options:](TXRParserImageIO, "determineColorSpaceClass:displayGamut:options:", a3, 1, v11))
  {
    case 0:
      ColorSpace = CGImageGetColorSpace(a3);
      if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
        ColorSpace = CGColorSpaceCreateDeviceRGB();
      CGColorSpaceRetain(ColorSpace);
      if (v11)
        goto LABEL_12;
      goto LABEL_9;
    case 1:
      v15 = (CFStringRef *)MEMORY[0x1E0C9D990];
      goto LABEL_11;
    case 2:
      v15 = (CFStringRef *)MEMORY[0x1E0C9DA00];
      goto LABEL_11;
    case 3:
      v15 = (CFStringRef *)MEMORY[0x1E0C9D958];
LABEL_11:
      ColorSpace = CGColorSpaceCreateWithName(*v15);
      if (v11)
        goto LABEL_12;
      goto LABEL_9;
    default:
      ColorSpace = 0;
      if (!v11)
      {
LABEL_9:
        AlphaInfo = CGImageGetAlphaInfo(a3);
        v17 = 0;
        v18 = AlphaInfo - 1;
LABEL_18:
        v20 = 2 * (v18 > 3);
        v21 = 8451;
        goto LABEL_19;
      }
LABEL_12:
      v19 = objc_msgSend(v11, "multiplyAlpha");
      v18 = CGImageGetAlphaInfo(a3) - 1;
      if (!v19)
      {
        v17 = 0;
        goto LABEL_18;
      }
      v17 = 1;
      if (v18 < 4)
        v20 = 1;
      else
        v20 = 2;
      v21 = 8449;
LABEL_19:
      v22 = 0x8000000020;
      v23 = 125;
      v67 = v11;
      if ((uint64_t)a4 <= 39)
      {
        if (a4 - 10 < 2)
        {
LABEL_58:
          if (v17)
            v21 = 1;
          else
            v21 = 3;
          v22 = 0x800000008;
          v23 = 11;
        }
        else if (a4 - 30 >= 2)
        {
          if (v17)
            v47 = 4353;
          else
            v47 = 4355;
          if (a4 == 25)
          {
            v21 = v47;
            v23 = 25;
            *(double *)&v22 = COERCE_DOUBLE(0x1000000010);
          }
        }
        else
        {
LABEL_46:
          if (v17)
            v21 = 1;
          else
            v21 = 3;
          v22 = 0x1000000008;
          v23 = 31;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x37uLL:
          case 0x8DuLL:
          case 0xAAuLL:
          case 0xACuLL:
            if (v17)
              v21 = 8449;
            else
              v21 = 8451;
            v22 = 0x2000000020;
            v23 = 55;
            break;
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4DuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x62uLL:
          case 0x63uLL:
          case 0x64uLL:
          case 0x65uLL:
          case 0x66uLL:
          case 0x67uLL:
          case 0x68uLL:
          case 0x6AuLL:
          case 0x6BuLL:
          case 0x6CuLL:
          case 0x6DuLL:
          case 0x6EuLL:
          case 0x6FuLL:
          case 0x70uLL:
          case 0x71uLL:
          case 0x72uLL:
          case 0x74uLL:
          case 0x75uLL:
          case 0x76uLL:
          case 0x77uLL:
          case 0x78uLL:
          case 0x79uLL:
          case 0x7AuLL:
          case 0x7BuLL:
          case 0x7CuLL:
          case 0x7EuLL:
          case 0x7FuLL:
          case 0x80uLL:
          case 0x81uLL:
          case 0x88uLL:
          case 0x89uLL:
          case 0x8AuLL:
          case 0x8BuLL:
          case 0x90uLL:
          case 0x91uLL:
          case 0x92uLL:
          case 0x93uLL:
          case 0x94uLL:
          case 0x95uLL:
          case 0x9AuLL:
          case 0x9BuLL:
          case 0x9CuLL:
          case 0x9DuLL:
          case 0x9EuLL:
          case 0x9FuLL:
          case 0xA8uLL:
          case 0xA9uLL:
          case 0xABuLL:
          case 0xADuLL:
          case 0xAFuLL:
          case 0xB1uLL:
          case 0xB8uLL:
          case 0xB9uLL:
          case 0xBFuLL:
          case 0xC9uLL:
          case 0xCAuLL:
          case 0xCBuLL:
          case 0xD1uLL:
            break;
          case 0x41uLL:
            if (v17)
              v21 = 4353;
            else
              v21 = 4355;
            v22 = 0x2000000010;
            v23 = 65;
            break;
          case 0x46uLL:
          case 0x47uLL:
          case 0x82uLL:
          case 0x83uLL:
          case 0x84uLL:
          case 0x85uLL:
          case 0x86uLL:
          case 0x87uLL:
          case 0x98uLL:
          case 0x99uLL:
          case 0xA0uLL:
          case 0xA1uLL:
          case 0xA2uLL:
          case 0xA3uLL:
          case 0xA4uLL:
          case 0xA5uLL:
          case 0xA6uLL:
          case 0xA7uLL:
          case 0xB2uLL:
          case 0xB3uLL:
          case 0xB4uLL:
          case 0xB5uLL:
          case 0xB6uLL:
          case 0xB7uLL:
          case 0xBAuLL:
          case 0xBBuLL:
          case 0xBCuLL:
          case 0xBDuLL:
          case 0xBEuLL:
          case 0xC0uLL:
          case 0xC1uLL:
          case 0xC2uLL:
          case 0xC3uLL:
          case 0xC4uLL:
          case 0xC5uLL:
          case 0xC6uLL:
          case 0xC7uLL:
          case 0xC8uLL:
          case 0xCCuLL:
          case 0xCDuLL:
          case 0xCEuLL:
          case 0xCFuLL:
          case 0xD0uLL:
          case 0xD2uLL:
          case 0xD3uLL:
          case 0xD4uLL:
          case 0xD5uLL:
          case 0xD6uLL:
          case 0xD7uLL:
          case 0xD8uLL:
          case 0xD9uLL:
          case 0xDAuLL:
            if (v17)
              v21 = 1;
            else
              v21 = 3;
            v22 = 0x2000000008;
            v23 = 71;
            break;
          case 0x50uLL:
          case 0x51uLL:
            if (v17)
              v21 = 8194;
            else
              v21 = 8196;
            v22 = 0x2000000008;
            v23 = 81;
            break;
          case 0x69uLL:
          case 0xAEuLL:
          case 0xB0uLL:
            if (v17)
              v21 = 8449;
            else
              v21 = 8451;
            v22 = 0x4000000020;
            v23 = 105;
            break;
          case 0x73uLL:
            if (v17)
              v21 = 4353;
            else
              v21 = 4355;
            v22 = 0x4000000010;
            v23 = 115;
            break;
          case 0x7DuLL:
          case 0x8FuLL:
          case 0x96uLL:
          case 0x97uLL:
            if (v17)
              v21 = 8449;
            else
              v21 = 8451;
            v23 = 125;
            break;
          case 0x8CuLL:
            goto LABEL_58;
          case 0x8EuLL:
            goto LABEL_46;
          default:
            if (a4 == 41)
            {
              if (v17)
                v21 = 4098;
              else
                v21 = 4100;
              v22 = 0x1000000005;
              v23 = 41;
            }
            else if (a4 == 40)
            {
              v22 = 0x1000000005;
              v21 = 5;
              v23 = 40;
            }
            break;
        }
      }
      v60 = v23;
      v59 = pixelBytes(v23);
      v24 = v59 * Width;
      v65 = Height * (unint64_t)v24;
      v63 = (void *)objc_msgSend(v10, "newBufferWithLength:");
      objc_msgSend(v63, "map");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v11, "originOperation");
      v64 = v10;
      v58 = v20;
      if (v25 > 255)
      {
        switch(v25)
        {
          case 256:
            goto LABEL_28;
          case 768:
            goto LABEL_30;
          case 512:
            goto LABEL_28;
        }
      }
      else
      {
        v26 = v25 - 15;
        if ((unint64_t)(v25 - 15) <= 0x39)
        {
          if (((1 << v26) & 0x1540000000002A8) != 0)
          {
LABEL_28:
            v27 = ColorSpace;
            v28 = Height;
            v29 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v65));
            v30 = objc_msgSend(v29, "mutableBytes");
LABEL_31:
            v31 = (void *)v30;
            goto LABEL_32;
          }
          if (((1 << v26) & 0x288000000000150) != 0)
          {
LABEL_30:
            v27 = ColorSpace;
            v28 = Height;
            v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v65);
            v30 = objc_msgSend(v66, "bytes");
            goto LABEL_31;
          }
          if (((1 << v26) & 0x2000000000003) != 0)
            goto LABEL_170;
        }
        if ((unint64_t)(v25 - 1) < 8 || v25 == 240)
LABEL_170:
          +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.14();
      }
      v27 = ColorSpace;
      v28 = Height;
      v31 = (void *)objc_msgSend(v66, "bytes");
      v29 = 0;
LABEL_32:
      v32 = v28;
      buf.data = v31;
      buf.height = v28;
      v33 = Width;
      buf.width = Width;
      buf.rowBytes = v59 * Width;
      *(_QWORD *)&format.bitsPerComponent = v22;
      format.colorSpace = v27;
      format.bitmapInfo = v21;
      memset(&format.version, 0, 20);
      if (!vImageBuffer_InitWithCGImage(&buf, &format, 0, a3, 0x200u))
      {
        v56 = v28;
        v57 = Width;
        CGColorSpaceRelease(v27);
        v36 = v29;
        v38 = v24;
        v37 = v67;
        if (!v67)
        {
LABEL_150:
          v51 = COERCE_DOUBLE(__PAIR64__(v56, v57));
          v35 = v63;
          v34 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:]([TXRImageIndependent alloc], "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v60, v58, v38, v65, v63, 0, v51);
          goto LABEL_151;
        }
        v39 = objc_msgSend(v67, "originOperation");
        v40 = 0;
        v41 = 1;
        if (v39 <= 63)
        {
          v42 = a7;
          v43 = 0;
          switch(v39)
          {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 15:
            case 16:
LABEL_169:
              +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.5();
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 17:
              break;
            case 18:
              goto LABEL_67;
            case 19:
              goto LABEL_66;
            case 20:
              goto LABEL_65;
            case 21:
LABEL_43:
              v44 = (void *)objc_msgSend(objc_retainAutorelease(v29), "mutableBytes");
              v53 = 0;
              v55 = 0;
              v54 = 0;
              v40 = 1;
              goto LABEL_82;
            case 22:
              goto LABEL_97;
            case 23:
LABEL_81:
              v44 = (void *)objc_msgSend(objc_retainAutorelease(v29), "mutableBytes");
              v53 = 0;
              v40 = 0;
              v54 = 0;
              v55 = 1;
              goto LABEL_82;
            case 24:
LABEL_96:
              v41 = 0;
              v40 = 1;
LABEL_97:
              objc_msgSend(v66, "bytes");
              v43 = v40;
              v40 = v41;
              break;
            default:
              v43 = 0;
              break;
          }
        }
        else
        {
          v42 = a7;
          if (v39 <= 255)
          {
            v43 = 0;
            switch(v39)
            {
              case '@':
                goto LABEL_169;
              case 'A':
                goto LABEL_65;
              case 'B':
                goto LABEL_66;
              case 'C':
                goto LABEL_67;
              case 'D':
                goto LABEL_98;
              case 'E':
                goto LABEL_96;
              case 'F':
                goto LABEL_81;
              case 'G':
                goto LABEL_97;
              case 'H':
                goto LABEL_43;
              default:
                v43 = 0;
                if (v39 == 240)
                  goto LABEL_169;
                goto LABEL_98;
            }
          }
          if (v39 == 768)
          {
LABEL_66:
            v44 = (void *)objc_msgSend(objc_retainAutorelease(v29), "mutableBytes");
            v54 = (void *)objc_msgSend(v66, "bytes");
            v40 = 0;
            v55 = 0;
            v53 = 1;
            goto LABEL_82;
          }
          if (v39 == 512)
          {
LABEL_67:
            v62 = componentsPerPixel(v60);
            v45 = 0;
            v40 = 0;
            v55 = 0;
            v54 = 0;
            v46 = v31;
LABEL_126:
            src.data = v46;
            src.height = v32;
            src.width = v33;
            src.rowBytes = v38;
            v31 = v54;
            dest.data = v54;
            dest.height = v32;
            dest.width = v33;
            dest.rowBytes = v38;
            switch(v62)
            {
              case 1:
                switch(v59)
                {
                  case 4:
                    v49 = vImageHorizontalReflect_PlanarF(&src, &dest, 0);
                    break;
                  case 2:
LABEL_133:
                    v49 = vImageHorizontalReflect_Planar16U(&src, &dest, 0);
                    break;
                  case 1:
                    v49 = vImageHorizontalReflect_Planar8(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.6();
                }
LABEL_141:
                v45 = v49;
LABEL_142:
                if (v42 && !v45)
                {
                  _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Unable to horizontally flip image"));
                  *v42 = (id)objc_claimAutoreleasedReturnValue();
                }
                break;
              case 2:
                if (v59 == 4)
                  goto LABEL_138;
                if (v59 != 2)
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.7();
                goto LABEL_133;
              case 3:
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.8();
              case 4:
                switch(v59)
                {
                  case 16:
                    v49 = vImageHorizontalReflect_ARGBFFFF(&src, &dest, 0);
                    break;
                  case 8:
LABEL_138:
                    v49 = vImageHorizontalReflect_ARGB16U(&src, &dest, 0);
                    break;
                  case 4:
                    v49 = vImageHorizontalReflect_ARGB8888(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.9();
                }
                goto LABEL_141;
              default:
                goto LABEL_142;
            }
            goto LABEL_145;
          }
          v43 = 0;
          if (v39 == 256)
          {
LABEL_65:
            v44 = (void *)objc_msgSend(v66, "bytes");
            v53 = 0;
            v40 = 0;
            v55 = 0;
            v54 = 0;
LABEL_82:
            src.data = v31;
            src.height = v32;
            src.width = v33;
            src.rowBytes = v38;
            v31 = v44;
            dest.data = v44;
            dest.height = v32;
            v62 = componentsPerPixel(v60);
            dest.width = v33;
            dest.rowBytes = v38;
            switch(v62)
            {
              case 1:
                switch(v59)
                {
                  case 4:
                    v48 = vImageVerticalReflect_PlanarF(&src, &dest, 0);
                    break;
                  case 2:
LABEL_90:
                    v48 = vImageVerticalReflect_Planar16U(&src, &dest, 0);
                    break;
                  case 1:
                    v48 = vImageVerticalReflect_Planar8(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.10();
                }
LABEL_121:
                v45 = v48;
LABEL_122:
                if (v42 && !v45)
                {
                  _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Unable to vertically flip image"));
                  *v42 = (id)objc_claimAutoreleasedReturnValue();
                }
                v46 = v31;
                if ((v53 & 1) != 0)
                  goto LABEL_126;
                goto LABEL_145;
              case 2:
                if (v59 == 4)
                  goto LABEL_95;
                if (v59 != 2)
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.11();
                goto LABEL_90;
              case 3:
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.12();
              case 4:
                switch(v59)
                {
                  case 16:
                    v48 = vImageVerticalReflect_ARGBFFFF(&src, &dest, 0);
                    break;
                  case 8:
LABEL_95:
                    v48 = vImageVerticalReflect_ARGB16U(&src, &dest, 0);
                    break;
                  case 4:
                    v48 = vImageVerticalReflect_ARGB8888(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.13();
                }
                goto LABEL_121;
              default:
                v45 = 0;
                goto LABEL_122;
            }
          }
        }
LABEL_98:
        v55 = v43;
        v62 = componentsPerPixel(v60);
LABEL_145:
        if (v40)
          v50 = 3;
        else
          v50 = 1;
        if ((v40 & 1) != 0 || v55)
        {
          src.data = v31;
          src.height = v32;
          src.width = v33;
          src.rowBytes = v38;
          dest.data = (void *)objc_msgSend(v66, "bytes");
          dest.height = v32;
          dest.width = v33;
          dest.rowBytes = v38;
          v74[0] = 0;
          v74[1] = 0;
          v73 = 0;
          *(_DWORD *)backColor = 0;
          switch(v62)
          {
            case 1:
              switch(v59)
              {
                case 4:
                  vImageRotate90_PlanarF(&src, &dest, v50, 0.0, 0);
                  break;
                case 2:
LABEL_159:
                  vImageRotate90_Planar16U(&src, &dest, v50, 0, 0);
                  break;
                case 1:
                  vImageRotate90_Planar8(&src, &dest, v50, 0, 0);
                  break;
                default:
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.1();
              }
              break;
            case 2:
              if (v59 == 4)
                goto LABEL_164;
              if (v59 != 2)
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.2();
              goto LABEL_159;
            case 3:
              +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.3();
            case 4:
              switch(v59)
              {
                case 16:
                  vImageRotate90_ARGBFFFF(&src, &dest, v50, (const float *)v74, 0);
                  break;
                case 8:
LABEL_164:
                  vImageRotate90_ARGB16U(&src, &dest, v50, (const uint16_t *)&v73, 0);
                  break;
                case 4:
                  vImageRotate90_ARGB8888(&src, &dest, v50, backColor, 0);
                  break;
                default:
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.4();
              }
              goto LABEL_150;
            default:
              goto LABEL_150;
          }
        }
        goto LABEL_150;
      }
      _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Could retrieve image data from CGImageRef"));
      v34 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v35 = v63;
      v36 = v29;
      v37 = v67;
LABEL_151:

      return v34;
  }
}

- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  return self->_imageInfo;
}

+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)exportImage:(id)a3 url:(id)a4 uttype:(__CFString *)a5 colorSpace:(CGColorSpace *)a6 orientation:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9;
  id v13;
  id v14;
  CGColorSpaceRef v15;
  CGColorSpaceRef v16;
  CGColorSpaceRef v17;
  CGColorSpace *v18;
  CFStringRef *v19;
  CGImage *v20;
  CGImage *v21;
  const __CFURL *v22;
  CGImageDestinationRef v23;
  CGImageDestination *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFDictionary *v28;
  BOOL v29;
  _QWORD v31[2];
  _QWORD v32[3];

  v9 = a7;
  v32[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  if (a6)
  {
    v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
    v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
    v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D948]);
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9F0]);
    if (!CFEqual(v15, a6) && !CFEqual(v16, a6) && !CFEqual(v15, a6))
      CFEqual(v17, a6);
    CGColorSpaceRelease(v15);
    CGColorSpaceRelease(v16);
    CGColorSpaceRelease(v17);
    CGColorSpaceRelease(v18);
    CGColorSpaceRetain(a6);
  }
  else
  {
    if (isSRGB(objc_msgSend(v13, "pixelFormat")))
      v19 = (CFStringRef *)MEMORY[0x1E0C9D960];
    else
      v19 = (CFStringRef *)MEMORY[0x1E0C9D958];
    a6 = CGColorSpaceCreateWithName(*v19);
  }
  v20 = +[TXRParserImageIO newCGImageFromImage:colorSpace:error:](TXRParserImageIO, "newCGImageFromImage:colorSpace:error:", v13, a6, a8);
  if (v20)
  {
    v21 = v20;
    v22 = (const __CFURL *)v14;
    v23 = CGImageDestinationCreateWithURL(v22, a5, 1uLL, 0);
    if (v23)
    {
      v24 = v23;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v9);
      CGColorSpaceCopyName(a6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0CBD060];
      v31[0] = *MEMORY[0x1E0CBCFF0];
      v31[1] = v27;
      v32[0] = v25;
      v32[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationSetProperties(v24, v28);
      CGImageDestinationAddImage(v24, v21, 0);
      v29 = CGImageDestinationFinalize(v24);
      CGImageRelease(v21);
      CFRelease(v24);
      CFRelease(v22);

    }
    else
    {
      _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Could not create CG Destination Image with URL"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v21);
      if (v22)
        CFRelease(v22);
      v29 = 0;
    }
  }
  else
  {
    _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Could not create CG Image with URL"));
    v29 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

+ (CGImage)newCGImageFromImage:(id)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  CFStringRef *v9;
  CGImage *v10;
  size_t NumberOfComponents;
  CGBitmapInfo v12;
  TXRDefaultBufferAllocator *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CGDataProvider *v19;
  char v20;
  size_t v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  size_t v26;
  unsigned int v27;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    if (isSRGB(objc_msgSend(v7, "pixelFormat")))
      v9 = (CFStringRef *)MEMORY[0x1E0C9D960];
    else
      v9 = (CFStringRef *)MEMORY[0x1E0C9D958];
    a4 = CGColorSpaceCreateWithName(*v9);
LABEL_10:
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(a4);
    if (NumberOfComponents == 2)
    {
      if (objc_msgSend(v8, "pixelFormat") == 30)
      {
        v12 = 3;
        goto LABEL_35;
      }
      if (objc_msgSend(v8, "pixelFormat") != 65)
      {
        if (objc_msgSend(v8, "pixelFormat") != 105)
        {
          v13 = objc_alloc_init(TXRDefaultBufferAllocator);
          v15 = v8;
          v16 = 105;
LABEL_33:
          v14 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:gammaDegamma:error:", v15, v16, v13, 0, a5);
          v12 = 8451;
          goto LABEL_34;
        }
LABEL_27:
        v12 = 8451;
        goto LABEL_35;
      }
    }
    else
    {
      if (NumberOfComponents == 1)
      {
        if (objc_msgSend(v8, "pixelFormat") == 10)
        {
          v12 = 0;
LABEL_35:
          objc_msgSend(v8, "buffer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "map");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = CGDataProviderCreateWithData(0, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v8, "bytesPerImage"), 0);
          v20 = pixelBytes(objc_msgSend(v8, "pixelFormat"));
          v21 = 8 * (v20 & 0x1Fu) / componentsPerPixel(objc_msgSend(v8, "pixelFormat"));
          v22 = pixelBytes(objc_msgSend(v8, "pixelFormat"));
          objc_msgSend(v8, "dimensions");
          v24 = v23 * v22;
          objc_msgSend(v8, "dimensions");
          v26 = v25;
          objc_msgSend(v8, "dimensions");
          v10 = CGImageCreate(v26, v27, v21, 8 * (v20 & 0x1F), v24, a4, v12, v19, 0, 0, kCGRenderingIntentDefault);
          CGColorSpaceRelease(a4);

          goto LABEL_36;
        }
        if (objc_msgSend(v8, "pixelFormat") == 25)
        {
          v12 = 4352;
          goto LABEL_35;
        }
        if (objc_msgSend(v8, "pixelFormat") == 55)
        {
          v12 = 8448;
          goto LABEL_35;
        }
        v13 = objc_alloc_init(TXRDefaultBufferAllocator);
        v14 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:gammaDegamma:error:", v8, 55, v13, 0, a5);
        v12 = 8448;
LABEL_34:

        v8 = v14;
        goto LABEL_35;
      }
      if (objc_msgSend(v8, "pixelFormat") == 80 || objc_msgSend(v8, "pixelFormat") == 81)
      {
        v12 = 8196;
        goto LABEL_35;
      }
      if (objc_msgSend(v8, "pixelFormat") == 70 || objc_msgSend(v8, "pixelFormat") == 71)
      {
        v12 = 16387;
        goto LABEL_35;
      }
      if (objc_msgSend(v8, "pixelFormat") != 115)
      {
        if (objc_msgSend(v8, "pixelFormat") != 125)
        {
          v13 = objc_alloc_init(TXRDefaultBufferAllocator);
          v15 = v8;
          v16 = 125;
          goto LABEL_33;
        }
        goto LABEL_27;
      }
    }
    v12 = 4355;
    goto LABEL_35;
  }
  if (CGColorSpaceGetModel(a4) < kCGColorSpaceModelCMYK)
  {
    CGColorSpaceRetain(a4);
    goto LABEL_10;
  }
  if (a5)
  {
    _newTXRErrorWithCodeAndErrorString(13, (uint64_t)CFSTR("Cannot create CGImage with given colorSpace.  ColorModel of colorSpace must be Monochrome or RGB "));
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_36:

  return v10;
}

- (TXRTextureInfo)textureInfo
{
  return self->_textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_textureInfo, 0);
}

+ (void)determineColorSpaceClass:displayGamut:options:.cold.1()
{
  __assert_rtn("+[TXRParserImageIO determineColorSpaceClass:displayGamut:options:]", "TXRParserImageIO.m", 385, "!\"Unhandled color space handling option\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.1()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 878, "!\"Unhandled rotation case for 1 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.2()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 890, "!\"Unhandled rotation case for 2 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.3()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 894, "!\"TODO: must handle rotation for 3 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.4()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 908, "!\"Unhandled rotation case for 4 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.5()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 693, "!\"Invalid TXROriginOperation\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.6()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 797, "!\"Unhandled horizontal flipping case for 1 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.7()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 809, "!\"Unhandled horizontal flipping case for 2 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.8()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 813, "!\"TODO: must handle horizontal flipping for 3 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.9()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 827, "!\"Unhandled horizontal flipping case for 4 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.10()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 726, "!\"Unhandled vertical flipping case for 1 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.11()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 738, "!\"Unhandled vertical flipping case for 2 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.12()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 742, "!\"TODO: must handle vertical flipping for 3 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.13()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 755, "!\"Unhandled vertical flipping case for 4 component pixels\");
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.14()
{
  __assert_rtn("+[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]", "TXRParserImageIO.m", 579, "!\"Invalid TXROriginOperation\");
}

@end
