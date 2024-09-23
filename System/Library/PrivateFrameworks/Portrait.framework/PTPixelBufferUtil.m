@implementation PTPixelBufferUtil

+ (unsigned)pixelBufferToLumaChroma:(id)a3 pixelBuffer:(__CVBuffer *)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8
{
  return objc_msgSend(a1, "createTexturesFromPixelBuffer:device:outLuma:outChroma:read:write:", a4, a3, a5, a6, a7, a8);
}

+ (BOOL)isPixelBuffer10Bit:(__CVBuffer *)a3
{
  const __CFDictionary *DescriptionWithPixelFormatType;
  void *v4;
  BOOL v5;

  CVPixelBufferGetPixelFormatType(a3);
  DescriptionWithPixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E0CA90F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") == 10;

  return v5;
}

+ (id)getMTLTextureDescriptor:(__CVBuffer *)a3 device:(id)a4
{
  signed int PixelFormatType;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  size_t Width;
  void *v11;
  NSObject *v13;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 1380410944)
  {
    if (PixelFormatType <= 1717856626)
    {
      if (PixelFormatType == 1380410945)
      {
        v6 = 125;
        goto LABEL_30;
      }
      if (PixelFormatType == 1380411457)
      {
        v6 = 115;
        goto LABEL_30;
      }
      if (PixelFormatType != 1717855600)
        goto LABEL_32;
      goto LABEL_22;
    }
    if (PixelFormatType <= 1751411058)
    {
      if (PixelFormatType != 1717856627)
      {
        v7 = 1751410032;
        goto LABEL_20;
      }
LABEL_22:
      v6 = 55;
      goto LABEL_30;
    }
    if (PixelFormatType == 1751411059)
      goto LABEL_27;
    v8 = 2084718401;
LABEL_25:
    if (PixelFormatType != v8)
      goto LABEL_32;
LABEL_26:
    v6 = 80;
    goto LABEL_30;
  }
  if (PixelFormatType <= 1111970368)
  {
    if (PixelFormatType == 641877825 || PixelFormatType == 759318337)
      goto LABEL_26;
    v8 = 792872769;
    goto LABEL_25;
  }
  if (PixelFormatType > 1278226533)
  {
    if (PixelFormatType != 1278226534)
    {
      v7 = 1278226536;
LABEL_20:
      if (PixelFormatType != v7)
        goto LABEL_32;
LABEL_27:
      v6 = 25;
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (PixelFormatType == 1111970369)
    goto LABEL_26;
  if (PixelFormatType == 1278226488)
  {
    v6 = 10;
LABEL_30:
    v9 = (void *)MEMORY[0x1E0CC6BB0];
    Width = CVPixelBufferGetWidth(a3);
    objc_msgSend(v9, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v6, Width, CVPixelBufferGetHeight(a3), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", a3) | 3);
    objc_msgSend(v11, "setResourceOptions:", 0);
    return v11;
  }
LABEL_32:
  _PTLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[PTPixelBufferUtil getMTLTextureDescriptor:device:].cold.1(a3, v13);

  v11 = 0;
  return v11;
}

+ (unint64_t)getNoConcurrentAccessHint:(__CVBuffer *)a3
{
  if (objc_msgSend(a1, "isCompressed:", a3))
    return 0x4000;
  else
    return 0;
}

+ (BOOL)isCompressed:(__CVBuffer *)a3
{
  unsigned int v3;
  BOOL result;

  v3 = (int)CVPixelBufferGetPixelFormatType(a3) >> 24;
  result = 1;
  if (v3 > 0x2F || ((1 << v3) & 0xA04000000000) == 0)
    return v3 == 124;
  return result;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *pixelTransferSession;
  objc_super v4;

  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
    CFRelease(pixelTransferSession);
  v4.receiver = self;
  v4.super_class = (Class)PTPixelBufferUtil;
  -[PTPixelBufferUtil dealloc](&v4, sel_dealloc);
}

+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return objc_msgSend(a1, "createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:", a3, a4, 0, a5, a6, a7, v9);
}

+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 outLuma:(id *)a6 outChroma:(id *)a7 read:(BOOL)a8 write:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  size_t WidthOfPlane;
  NSObject *v23;
  void *v24;
  size_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id *v30;
  id v31;
  uint64_t v32;
  OSType v33;
  unsigned int v34;
  IOSurfaceRef IOSurface;
  uint64_t v36;
  id v37;
  id v38;
  OSType PixelFormatType;
  NSObject *v40;
  id *v42;
  id *v43;

  v9 = a8;
  v15 = a4;
  v16 = v9;
  if (a9)
    v16 = +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", a3) | v9 | 2;
  v17 = objc_msgSend(a1, "getPixelFormatsForPixelBuffer:", a3);
  if (v17)
  {
    v19 = v18;
    if (v18)
    {
      v20 = v17;
      v42 = a6;
      v43 = a7;
      v21 = (void *)MEMORY[0x1E0CC6BB0];
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      objc_msgSend(v21, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v20, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 0), 0);
      v23 = objc_claimAutoreleasedReturnValue();
      -[NSObject setUsage:](v23, "setUsage:", v16);
      v24 = (void *)MEMORY[0x1E0CC6BB0];
      v25 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      objc_msgSend(v24, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v19, v25, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUsage:", v16);
      if (v23 && v26)
      {
        v27 = v15;
        v28 = v15;
        if (a5)
        {
          objc_msgSend(a1, "createTextureFromCache:pixelBuffer:descriptor:plane:", a5, a3, v23, 0);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v42;
          v31 = *v42;
          *v42 = (id)v29;

          objc_msgSend(a1, "createTextureFromCache:pixelBuffer:descriptor:plane:", a5, a3, v26, 1);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          IOSurface = CVPixelBufferGetIOSurface(a3);
          v36 = -[NSObject newTextureWithDescriptor:iosurface:plane:](v28, "newTextureWithDescriptor:iosurface:plane:", v23, IOSurface, 0);
          v30 = v42;
          v37 = *v42;
          *v42 = (id)v36;

          v32 = -[NSObject newTextureWithDescriptor:iosurface:plane:](v28, "newTextureWithDescriptor:iosurface:plane:", v26, IOSurface, 1);
        }
        v38 = *v43;
        *v43 = (id)v32;

        if (*v30 && *v43)
        {
          v34 = 0;
LABEL_22:

          goto LABEL_23;
        }
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        _PTLogSystem();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:].cold.3(PixelFormatType);

      }
      else
      {
        _PTLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        v27 = v15;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:].cold.2();
      }
      v34 = -1;
      goto LABEL_22;
    }
  }
  v33 = CVPixelBufferGetPixelFormatType(a3);
  _PTLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:].cold.1(v33);
  v34 = -10;
  v27 = v15;
LABEL_23:

  return v34;
}

+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4
{
  return (id)objc_msgSend(a1, "createTextureFromPixelBuffer:device:textureCache:sRGB:", a3, a4, 0, 0);
}

+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 sRGB:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v18;

  v6 = a6;
  v10 = a4;
  objc_msgSend(a1, "getMTLTextureDescriptor:device:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v6)
  {
LABEL_7:
    if (a5)
    {
      objc_msgSend(a1, "createTextureFromCache:pixelBuffer:descriptor:plane:", a5, a3, v12, 0);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_msgSend(v10, "newTextureWithDescriptor:iosurface:plane:", v12, CVPixelBufferGetIOSurface(a3), 0);
    }
    v16 = (void *)v15;
    goto LABEL_11;
  }
  v13 = objc_msgSend(v11, "pixelFormat");
  if (v13 == 80)
  {
    v14 = 81;
    goto LABEL_6;
  }
  if (v13 == 10)
  {
    v14 = 11;
LABEL_6:
    objc_msgSend(v12, "setPixelFormat:", v14);
    goto LABEL_7;
  }
  _PTLogSystem();
  v18 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:textureCache:sRGB:].cold.1(v12, v18);

  v16 = 0;
LABEL_11:

  return v16;
}

+ (id)createTextureFromCache:(__CVMetalTextureCache *)a3 pixelBuffer:(__CVBuffer *)a4 descriptor:(id)a5 plane:(unint64_t)a6
{
  id v9;
  const __CFAllocator *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  CVMetalTextureRef image;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  image = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v19[0] = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "usage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E0CA8F50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "storageMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v13 = (const char *)CVMetalTextureCacheCreateTextureFromImage(v10, a3, a4, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2), (MTLPixelFormat)objc_msgSend(v9, "pixelFormat"), objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), a6, &image);

  if (!image || (_DWORD)v13)
  {
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[PTPixelBufferUtil createTextureFromCache:pixelBuffer:descriptor:plane:].cold.2(v9, v13, v15);

  }
  else
  {
    CVMetalTextureGetTexture(image);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    if (v14)
      goto LABEL_11;
  }
  _PTLogSystem();
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    +[PTPixelBufferUtil createTextureFromCache:pixelBuffer:descriptor:plane:].cold.1(v9, v16);

  v14 = 0;
LABEL_11:

  return v14;
}

+ (YUVPixelFormats)_getPixelFormatsForType:(unsigned int)a3
{
  unint64_t v3;
  unsigned __int16 v4;
  int v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  unint64_t v11;
  unsigned __int16 v12;
  YUVPixelFormats result;

  v3 = 0;
  if ((int)a3 > 875704421)
  {
    if ((int)a3 <= 2016686641)
    {
      if ((int)a3 <= 1882468911)
      {
        if ((int)a3 > 875704933)
        {
          if (a3 == 875704934)
            goto LABEL_62;
          v9 = 12918;
        }
        else
        {
          if (a3 == 875704422)
            goto LABEL_62;
          v9 = 12406;
        }
        v8 = v9 | 0x34320000;
        goto LABEL_61;
      }
      if ((int)a3 <= 1885745711)
      {
        if (a3 != 1882468912)
        {
          v10 = 1882468914;
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (a3 == 1885745712 || a3 == 1885745714)
        goto LABEL_53;
      v5 = 2016686640;
      goto LABEL_37;
    }
    if ((int)a3 > 2084075055)
    {
      if ((int)a3 <= 2088265265)
      {
        if (a3 == 2084075056)
          goto LABEL_62;
        v7 = 26160;
      }
      else
      {
        if (a3 == 2088265266 || a3 == 2088269360)
          goto LABEL_53;
        v7 = 30258;
      }
      v10 = v7 | 0x7C780000;
      goto LABEL_52;
    }
    if ((int)a3 > 2019963441)
    {
      if (a3 != 2019963442)
      {
        v8 = 2084070960;
        goto LABEL_61;
      }
    }
    else if (a3 != 2016686642)
    {
      v5 = 2019963440;
LABEL_37:
      v11 = 0;
      if (a3 != v5)
        goto LABEL_65;
    }
    v11 = 576;
    v3 = 578;
    goto LABEL_65;
  }
  if ((int)a3 > 762865201)
  {
    if ((int)a3 > 792229423)
    {
      if ((int)a3 <= 796419633)
      {
        if (a3 == 792229424)
          goto LABEL_62;
        v6 = 26160;
      }
      else
      {
        if (a3 == 796419634 || a3 == 796423728)
          goto LABEL_53;
        v6 = 30258;
      }
      v10 = v6 | 0x2F780000;
      goto LABEL_52;
    }
    if ((int)a3 <= 762869297)
    {
      if (a3 != 762865202)
      {
        v4 = 30256;
        goto LABEL_33;
      }
      goto LABEL_53;
    }
    if (a3 == 762869298)
      goto LABEL_53;
    v8 = 792225328;
LABEL_61:
    v11 = 0;
    if (a3 != v8)
      goto LABEL_65;
    goto LABEL_62;
  }
  if ((int)a3 > 645428783)
  {
    if ((int)a3 > 758670895)
    {
      if (a3 != 758670896 && a3 != 758674992)
      {
        v4 = 26160;
LABEL_33:
        v10 = v4 | 0x2D780000;
        goto LABEL_52;
      }
LABEL_62:
      v11 = 10;
      v3 = 30;
      goto LABEL_65;
    }
    if (a3 != 645428784)
    {
      v12 = 30258;
LABEL_51:
      v10 = v12 | 0x26780000;
LABEL_52:
      v11 = 0;
      if (a3 != v10)
        goto LABEL_65;
      goto LABEL_53;
    }
    goto LABEL_53;
  }
  if ((int)a3 <= 645424687)
  {
    if (a3 == 641230384)
      goto LABEL_62;
    v8 = 641234480;
    goto LABEL_61;
  }
  if (a3 != 645424688)
  {
    v12 = 26162;
    goto LABEL_51;
  }
LABEL_53:
  v11 = 588;
  v3 = 589;
LABEL_65:
  result.var1 = v3;
  result.var0 = v11;
  return result;
}

+ (YUVPixelFormats)getPixelFormatsForPixelBuffer:(__CVBuffer *)a3
{
  uint64_t PixelFormatType;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  YUVPixelFormats result;

  if (a3)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v6 = objc_msgSend(a1, "_getPixelFormatsForType:", PixelFormatType);
    v7 = v5;
    if (!v6 || !v5)
    {
      CVPixelBufferGetAttributes();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PixelFormatDescription"));
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PixelFormatDescription"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EquivalentUncompressedPixelFormat"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PixelFormatDescription"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EquivalentUncompressedPixelFormat"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "unsignedIntValue");

            if ((_DWORD)v16)
            {
              if ((_DWORD)v16 != (_DWORD)PixelFormatType)
              {
                v6 = objc_msgSend(a1, "_getPixelFormatsForType:", v16);
                v7 = v17;
              }
            }
          }
        }
      }

    }
    if (!v6 || !v7)
    {
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[PTPixelBufferUtil getPixelFormatsForPixelBuffer:].cold.1(PixelFormatType, v18);

    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v19 = v6;
  v20 = v7;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

+ (BOOL)isPixelBufferFullRange:(__CVBuffer *)a3
{
  const __CFDictionary *DescriptionWithPixelFormatType;
  const __CFString *Value;

  CVPixelBufferGetPixelFormatType(a3);
  DescriptionWithPixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  Value = (const __CFString *)CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E0CA9120]);
  return CFStringCompare(Value, (CFStringRef)*MEMORY[0x1E0CA9128], 0) == kCFCompareEqualTo;
}

+ (BOOL)isRGB:(__CVBuffer *)a3
{
  OSType PixelFormatType;
  BOOL v4;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v4 = PixelFormatType == 1380401729 || PixelFormatType == 1380411457;
  return PixelFormatType == 1111970369 || v4;
}

+ (id)getAttachmentString:(__CVBuffer *)a3 forKey:(__CFString *)a4
{
  return (id)(id)CVBufferCopyAttachment(a3, a4, 0);
}

+ (unsigned)getCVPixelBufferGetPixelFormatType:(unint64_t)a3
{
  NSObject *v4;

  if ((uint64_t)a3 <= 54)
  {
    if (a3 == 10)
      return 1278226488;
    if (a3 == 25)
      return 1278226536;
  }
  else
  {
    switch(a3)
    {
      case '7':
        return 1278226534;
      case '}':
        return 1380410945;
      case 'P':
        return 1111970369;
    }
  }
  _PTLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[PTPixelBufferUtil getCVPixelBufferGetPixelFormatType:].cold.1();

  return 0;
}

+ (void)logPixelbufferMetadataForPixelBuffer:(__CVBuffer *)a3 name:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  OSType PixelFormatType;
  void *v9;
  size_t Width;
  NSObject *v11;
  __IOSurface *IOSurface;
  __IOSurface *v13;
  NSObject *v14;
  CFTypeRef v15;
  const void *v16;
  CGColorSpaceRef v17;
  CGColorSpace *v18;
  NSObject *v19;
  int NumberOfComponents;
  NSObject *v21;
  _BOOL4 v22;
  _BOOL4 IsWideGamutRGB;
  _BOOL4 IsHLGBased;
  _BOOL4 IsPQBased;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  const __CFString *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  NSObject *v38;
  __CFString *v39;
  CGColorSpaceModel Model;
  id v41;
  CFStringRef Name;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  CFStringRef v49;
  __int16 v50;
  _BYTE v51[10];
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("PixelBuffer %@: "), v5);
  v7 = v6;
  if (a3)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    NSStringFromFourCharCode(PixelFormatType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Width = CVPixelBufferGetWidth(a3);
    -[__CFString appendFormat:](v7, "appendFormat:", CFSTR(" f: %@ s: %zu x %zu"), v9, Width, CVPixelBufferGetHeight(a3));

    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v7;
      _os_log_impl(&dword_1C9281000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    IOSurface = CVPixelBufferGetIOSurface(a3);
    if (IOSurface)
    {
      v13 = IOSurface;
      v14 = IOSurfaceCopyAllValues(IOSurface);
      v15 = IOSurfaceCopyValue(v13, (CFStringRef)*MEMORY[0x1E0CBBF90]);
      if (v15)
      {
        v16 = v15;
        v17 = CGColorSpaceCreateWithPropertyList(v15);
        if (v17)
        {
          v18 = v17;
          _PTLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            Name = CGColorSpaceGetName(v18);
            Model = CGColorSpaceGetModel(v18);
            NumberOfComponents = CGColorSpaceGetNumberOfComponents(v18);
            v21 = v14;
            v22 = CGColorSpaceUsesExtendedRange(v18);
            IsWideGamutRGB = CGColorSpaceIsWideGamutRGB(v18);
            IsHLGBased = CGColorSpaceIsHLGBased(v18);
            IsPQBased = CGColorSpaceIsPQBased(v18);
            *(_DWORD *)buf = 138413826;
            v49 = Name;
            v50 = 1024;
            *(_DWORD *)v51 = Model;
            *(_WORD *)&v51[4] = 1024;
            *(_DWORD *)&v51[6] = NumberOfComponents;
            v52 = 1024;
            v53 = v22;
            v14 = v21;
            v54 = 1024;
            v55 = IsWideGamutRGB;
            v56 = 1024;
            v57 = IsHLGBased;
            v58 = 1024;
            v59 = IsPQBased;
            _os_log_impl(&dword_1C9281000, v19, OS_LOG_TYPE_INFO, "colorSpaceName: %@ Model: %u NumberOfComponents: %i extendedRange: %i WideGamutRGB: %i HLG: %i PQ: %i", buf, 0x30u);
          }

          CGColorSpaceRelease(v18);
        }
        CFRelease(v16);
        if (v14)
        {
LABEL_11:
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          -[NSObject allKeys](v14, "allKeys");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v27)
          {
            v28 = v27;
            v39 = v7;
            v41 = v5;
            v29 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v44 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(const __CFString **)(*((_QWORD *)&v43 + 1) + 8 * i);
                _PTLogSystem();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v31);
                  v33 = v14;
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v49 = v31;
                  v50 = 2112;
                  *(_QWORD *)v51 = v34;
                  _os_log_impl(&dword_1C9281000, v32, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);

                  v14 = v33;
                }

              }
              v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            }
            while (v28);
            v7 = v39;
            v5 = v41;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      else
      {
        _PTLogSystem();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9281000, v38, OS_LOG_TYPE_INFO, "No kIOSurfaceColorSpace available", buf, 2u);
        }

        if (v14)
          goto LABEL_11;
      }
      _PTLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9281000, v26, OS_LOG_TYPE_INFO, "metadata: nil", buf, 2u);
      }
      goto LABEL_31;
    }
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v35 = "IOSurface is NULL";
      v36 = v14;
      v37 = 2;
      goto LABEL_25;
    }
  }
  else
  {
    -[__CFString appendString:](v6, "appendString:", CFSTR("NULL"));
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v7;
      v35 = "%@";
      v36 = v14;
      v37 = 12;
LABEL_25:
      _os_log_impl(&dword_1C9281000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);
    }
  }
LABEL_32:

}

+ (int)readRawPixelBufferFromFile:(id)a3 pixelBuffer:(__CVBuffer *)a4
{
  id v5;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  FILE *v13;
  FILE *i;
  id v15;
  int v16;
  id v18;

  v5 = a3;
  Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("LZMA")))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v5);
    v18 = 0;
    objc_msgSend(v9, "decompressedDataUsingAlgorithm:error:", 2, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (v11)
    {
      _PTLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[PTPixelBufferUtil readRawPixelBufferFromFile:pixelBuffer:].cold.1();

      goto LABEL_13;
    }
    v15 = objc_retainAutorelease(v10);
    memcpy(BaseAddress, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

  }
  else
  {
    v13 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "r");
    if (!v13)
    {
      fclose(0);
LABEL_13:
      v16 = -1;
      goto LABEL_14;
    }
    for (i = v13; Height; --Height)
    {
      fread(BaseAddress, 1uLL, BytesPerRow, i);
      BaseAddress += BytesPerRow;
    }
    fclose(i);
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  v16 = 0;
LABEL_14:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ciContext, 0);
}

+ (void)createTexturesFromPixelBuffer:(unsigned int)a1 device:textureCache:outLuma:outChroma:read:write:.cold.1(unsigned int a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromFourCharCode(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1C9281000, v2, v3, "pixelBufferToLumaChroma: Issue with pixelformat %@ %i for pixelbuffer %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

+ (void)createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1C9281000, v1, OS_LOG_TYPE_ERROR, "Error allocating texture desc %@ %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)createTexturesFromPixelBuffer:(unsigned int)a1 device:textureCache:outLuma:outChroma:read:write:.cold.3(unsigned int a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromFourCharCode(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1C9281000, v2, v3, "pixelBufferToLumaChroma: Cannot allocate textures for pixel format %@ %i for pixelbuffer %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

+ (void)createTextureFromPixelBuffer:(void *)a1 device:(char *)a2 textureCache:sRGB:.cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v3, "getMTLTextureFromPixelBuffer: sRGB unsupported for %lu", v4);
  OUTLINED_FUNCTION_1_1();
}

+ (void)createTextureFromCache:(void *)a1 pixelBuffer:(char *)a2 descriptor:plane:.cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v3, "Cannot get texture from cache %lu", v4);
  OUTLINED_FUNCTION_1_1();
}

+ (void)createTextureFromCache:(NSObject *)a3 pixelBuffer:descriptor:plane:.cold.2(void *a1, const char *a2, NSObject *a3)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v4 = (int)a2;
  v5 = 134218240;
  v6 = OUTLINED_FUNCTION_7_0(a1, a2);
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "Cannot get texture from cache. PixelFormat: %lu status: %ul", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1_1();
}

+ (void)getPixelFormatsForPixelBuffer:(unsigned int)a1 .cold.1(unsigned int a1, NSObject *a2)
{
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromFourCharCode(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109378;
  v5[1] = a1;
  v6 = 2112;
  v7 = v4;
  _os_log_debug_impl(&dword_1C9281000, a2, OS_LOG_TYPE_DEBUG, "getPixelFormatsForPixelBuffer: Unable to determine appropriate metal pixel format for CVPixelBuffer of pixel format type = %x %@\n", (uint8_t *)v5, 0x12u);

}

+ (void)getMTLTextureDescriptor:(__CVBuffer *)a1 device:(NSObject *)a2 .cold.1(__CVBuffer *a1, NSObject *a2)
{
  OSType PixelFormatType;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  NSStringFromFourCharCode(PixelFormatType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v5, "getMTLTextureDescriptor: No support for CVPixelBufferGetPixelFormatType %@ ", v6);

  OUTLINED_FUNCTION_1_1();
}

+ (void)getCVPixelBufferGetPixelFormatType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "getCVPixelBufferGetPixelFormatType: No support for MTLPixelFormat %lu", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)readRawPixelBufferFromFile:pixelBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "Error loading LZMA %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
