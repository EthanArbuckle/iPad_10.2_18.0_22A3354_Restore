@implementation VCPSpillmapMetalSession

- (VCPSpillmapMetalSession)init
{
  VCPSpillmapMetalSession *v2;
  VCPSpillmapMetalSession *v3;
  VCPSpillmapMetalSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPSpillmapMetalSession;
  v2 = -[VCPSpillmapMetalSession init](&v6, sel_init);
  v3 = v2;
  if (v2 && !-[VCPSpillmapMetalSession configureGPU](v2, "configureGPU"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (int)configureGPU
{
  MTLDevice *v3;
  MTLDevice *device;
  MTLDevice *v5;
  MTLCommandQueue *v6;
  MTLCommandQueue *commandQueue;
  MPSImageBilinearScale *v8;
  MPSImageBilinearScale *bilinearScale;
  __CVMetalTextureCache *value;
  MTLDevice *v11;
  int result;
  __CVMetalTextureCache *v13;
  MTLDevice *v14;
  NSDictionary *v15;
  NSDictionary *readAttributes;
  NSDictionary *v17;
  NSDictionary *readWriteAttributes;
  NSObject *v19;
  const char *v20;
  uint8_t v21[8];
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = self->_device;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -26525;
    *(_WORD *)v21 = 0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "Unable to get metal device\n";
LABEL_21:
    _os_log_error_impl(&dword_1B676B000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    return -26525;
  }
  v6 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v5, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v6;

  if (!self->_commandQueue)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -26525;
    *(_WORD *)v21 = 0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "Unable to get command queue\n";
    goto LABEL_21;
  }
  v8 = (MPSImageBilinearScale *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E08]), "initWithDevice:", self->_device);
  bilinearScale = self->_bilinearScale;
  self->_bilinearScale = v8;

  if (!self->_bilinearScale)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Unable to initialize bilinear scaling filter\n";
      goto LABEL_21;
    }
    return -26525;
  }
  value = self->_textureCacheBGRA.value_;
  v11 = self->_device;
  if (value)
  {
    CFRelease(value);
    self->_textureCacheBGRA.value_ = 0;
  }
  result = CVMetalTextureCacheCreate(0, 0, v11, 0, &self->_textureCacheBGRA.value_);
  if (!result)
  {
    v13 = self->_textureCacheSpillmap.value_;
    v14 = self->_device;
    if (v13)
    {
      CFRelease(v13);
      self->_textureCacheSpillmap.value_ = 0;
    }
    result = CVMetalTextureCacheCreate(0, 0, v14, 0, &self->_textureCacheSpillmap.value_);
    if (!result)
    {
      if (!self->_readAttributes)
      {
        v24 = *MEMORY[0x1E0CA8F58];
        v25[0] = &unk_1E6A1D2E0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        readAttributes = self->_readAttributes;
        self->_readAttributes = v15;

      }
      if (!self->_readWriteAttributes)
      {
        v22 = *MEMORY[0x1E0CA8F58];
        v23 = &unk_1E6A1D2F8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        readWriteAttributes = self->_readWriteAttributes;
        self->_readWriteAttributes = v17;

      }
      return 0;
    }
  }
  return result;
}

- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CF<__CFDictionary *> *p_spillmapBufferProperties;
  __CFDictionary *value;
  CFNumberRef v17;
  __CFDictionary *v18;
  CFNumberRef v19;
  __CFDictionary *v20;
  CFNumberRef v21;
  CFNumberRef v22;
  const void *v23;
  __CFDictionary *v24;
  const void *v25;
  CVReturn v26;
  const void *v27;
  __CVPixelBufferPool *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  CFNumberRef v31;
  __CFDictionary *v32;
  const void *v33;
  __CVPixelBufferPool *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  CFNumberRef v37;
  __CFDictionary *v38;
  CFTypeRef v39;
  __CVPixelBufferPool *v40;
  __CFDictionary *v41;
  __CFDictionary *v42;
  CFTypeRef v43;
  __CVPixelBufferPool *v44;
  CF<__CVPixelBufferPool *> *p_spillBufferPoolHDCPType1;
  __CFDictionary *v46;
  CFTypeRef v48;
  CFTypeRef v49;
  CFTypeRef v50;
  CFTypeRef v51;
  CFTypeRef cf;
  const void *valuePtr[2];

  if (a3)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    cf = Mutable;
    if (!Mutable)
      goto LABEL_24;
    v9 = Mutable;
    LODWORD(valuePtr[0]) = a4;
    v10 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v10)
    {
      CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0CBC1E0], v10);
      CFRelease(v10);
    }
    LODWORD(valuePtr[0]) = a5;
    v11 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v11)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E0CBC008], v11);
      CFRelease(v11);
    }
    valuePtr[0] = (const void *)1111970369;
    v12 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
    if (v12)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E0CBC070], v12);
      CFRelease(v12);
    }
    LODWORD(valuePtr[0]) = 4 * a4;
    v13 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v13)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E0CBBF08], v13);
      CFRelease(v13);
    }
    LODWORD(valuePtr[0]) = 4;
    v14 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v14)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E0CBBF00], v14);
      CFRelease(v14);
    }
    valuePtr[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    p_spillmapBufferProperties = &self->_spillmapBufferProperties;
    sub_1B67774AC((const void **)&self->_spillmapBufferProperties.value_, valuePtr);
    sub_1B67705C8(valuePtr);
    value = self->_spillmapBufferProperties.value_;
    if (value)
    {
      LODWORD(valuePtr[0]) = a4;
      v17 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      if (v17)
      {
        CFDictionarySetValue(value, (const void *)*MEMORY[0x1E0CA90E0], v17);
        CFRelease(v17);
      }
      v18 = p_spillmapBufferProperties->value_;
      LODWORD(valuePtr[0]) = a5;
      v19 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      if (v19)
      {
        CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E0CA8FD8], v19);
        CFRelease(v19);
      }
      v20 = p_spillmapBufferProperties->value_;
      valuePtr[0] = (const void *)1111970369;
      v21 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
      if (v21)
      {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA9040], v21);
        CFRelease(v21);
      }
      valuePtr[0] = 0;
      v22 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
      v23 = (const void *)*MEMORY[0x1E0CBC1A0];
      if (v22)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E0CBC1A0], v22);
        CFRelease(v22);
      }
      v24 = p_spillmapBufferProperties->value_;
      v51 = cf;
      if (cf)
      {
        CFRetain(cf);
        v25 = v51;
      }
      else
      {
        v25 = 0;
      }
      v27 = (const void *)*MEMORY[0x1E0CA8FF0];
      CFDictionarySetValue(v24, (const void *)*MEMORY[0x1E0CA8FF0], v25);
      sub_1B67705C8(&v51);
      v28 = self->_spillBufferPoolUnprotected.value_;
      v29 = self->_spillmapBufferProperties.value_;
      if (v28)
      {
        CFRelease(v28);
        self->_spillBufferPoolUnprotected.value_ = 0;
      }
      v26 = CVPixelBufferPoolCreate(0, 0, v29, &self->_spillBufferPoolUnprotected.value_);
      if (!v26)
      {
        v30 = (__CFDictionary *)cf;
        valuePtr[0] = (const void *)1;
        v31 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        if (v31)
        {
          CFDictionarySetValue(v30, v23, v31);
          CFRelease(v31);
        }
        v32 = p_spillmapBufferProperties->value_;
        v50 = cf;
        if (cf)
        {
          CFRetain(cf);
          v33 = v50;
        }
        else
        {
          v33 = 0;
        }
        CFDictionarySetValue(v32, v27, v33);
        sub_1B67705C8(&v50);
        v34 = self->_spillBufferPoolScreenScrapingProtected.value_;
        v35 = self->_spillmapBufferProperties.value_;
        if (v34)
        {
          CFRelease(v34);
          self->_spillBufferPoolScreenScrapingProtected.value_ = 0;
        }
        v26 = CVPixelBufferPoolCreate(0, 0, v35, &self->_spillBufferPoolScreenScrapingProtected.value_);
        if (!v26)
        {
          v36 = (__CFDictionary *)cf;
          valuePtr[0] = (const void *)3;
          v37 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
          if (v37)
          {
            CFDictionarySetValue(v36, v23, v37);
            CFRelease(v37);
          }
          v38 = p_spillmapBufferProperties->value_;
          v39 = cf;
          v49 = cf;
          if (cf)
            CFRetain(cf);
          CFDictionarySetValue(v38, v27, v39);
          sub_1B67705C8(&v49);
          v40 = self->_spillBufferPoolHDCPType0.value_;
          v41 = self->_spillmapBufferProperties.value_;
          if (v40)
          {
            CFRelease(v40);
            self->_spillBufferPoolHDCPType0.value_ = 0;
          }
          v26 = CVPixelBufferPoolCreate(0, 0, v41, &self->_spillBufferPoolHDCPType0.value_);
          if (!v26)
          {
            sub_1B67774EC((__CFDictionary *)cf, v23);
            v42 = p_spillmapBufferProperties->value_;
            v43 = cf;
            v48 = cf;
            if (cf)
              CFRetain(cf);
            CFDictionarySetValue(v42, v27, v43);
            sub_1B67705C8(&v48);
            v44 = self->_spillBufferPoolHDCPType1.value_;
            v46 = self->_spillmapBufferProperties.value_;
            p_spillBufferPoolHDCPType1 = &self->_spillBufferPoolHDCPType1;
            if (v44)
            {
              CFRelease(v44);
              p_spillBufferPoolHDCPType1->value_ = 0;
            }
            v26 = CVPixelBufferPoolCreate(0, 0, v46, &p_spillBufferPoolHDCPType1->value_);
          }
        }
      }
    }
    else
    {
LABEL_24:
      v26 = -12904;
    }
    sub_1B67705C8(&cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(valuePtr[0]) = 0;
      _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Source iosurface is unavailable\n", (uint8_t *)valuePtr, 2u);
    }
    return -26525;
  }
  return v26;
}

- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5
{
  MTLTextureDescriptor *v7;
  MTLTextureDescriptor *intermediateImageDescriptor;
  id v9;
  double v10;
  MPSImageGaussianBlur *v11;
  MPSImageGaussianBlur *gaussianBlur;
  MPSImageGaussianBlur *v13;
  uint8_t v15[16];

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 81, a3, a4, 0);
  v7 = (MTLTextureDescriptor *)objc_claimAutoreleasedReturnValue();
  intermediateImageDescriptor = self->_intermediateImageDescriptor;
  self->_intermediateImageDescriptor = v7;

  -[MTLTextureDescriptor setUsage:](self->_intermediateImageDescriptor, "setUsage:", 3);
  if (!self->_intermediateImageDescriptor)
    return -12904;
  v9 = objc_alloc(MEMORY[0x1E0CC6E48]);
  *(float *)&v10 = a5;
  v11 = (MPSImageGaussianBlur *)objc_msgSend(v9, "initWithDevice:sigma:", self->_device, v10);
  gaussianBlur = self->_gaussianBlur;
  self->_gaussianBlur = v11;

  v13 = self->_gaussianBlur;
  if (v13)
  {
    -[MPSImageGaussianBlur setEdgeMode:](v13, "setEdgeMode:", 1);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to initialize gaussian filter\n", v15, 2u);
    }
    return -26525;
  }
}

- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7
{
  const __CFDictionary *v11;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v14;
  CFTypeRef cf;

  v11 = (const __CFDictionary *)a4;
  cf = 0;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a5);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a5);
  if (CVMetalTextureCacheCreateTextureFromImage(0, a6, a3, v11, (MTLPixelFormat)a7, WidthOfPlane, HeightOfPlane, a5, (CVMetalTextureRef *)&cf))
  {
    v14 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v14;
}

- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5
{
  void *v9;
  unint64_t ProtectionOptions;
  int v11;
  void *v13;
  int v14;
  __IOSurface *IOSurface;
  signed int PixelFormatType;
  int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSUInteger v24;
  unint64_t v25;
  size_t Width;
  unint64_t v27;
  size_t Height;
  float v29;
  float v30;
  MPSImageBilinearScale *bilinearScale;
  void *v32;
  MPSImageBilinearScale *v33;
  void *v34;
  void *v35;
  MPSImageGaussianBlur *gaussianBlur;
  void *v37;
  void *v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  MPSImageBilinearScale *v42;
  MPSImageBilinearScale *v43;
  void *v44;
  void *v45;
  NSUInteger v46;
  void *v47;
  _QWORD v48[6];
  _QWORD v49[6];
  uint8_t v50[8];
  double v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int v63;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferGetIOSurface(a3);
  ProtectionOptions = IOSurfaceGetProtectionOptions();
  objc_msgSend(v9, "setProtectionOptions:", ProtectionOptions);
  if (ProtectionOptions >= 8 || ((0x8Bu >> ProtectionOptions) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported frame protection option", buf, 2u);
    }
    v11 = -666;
    goto LABEL_6;
  }
  if (!(unsigned __int16)CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)((char *)&self->super.isa + qword_1B691FDF0[ProtectionOptions]), a4))
  {
    -[VCPSpillmapMetalSession loadTexture:withAttributes:forPlane:withCache:withFormat:](self, "loadTexture:withAttributes:forPlane:withCache:withFormat:", *a4, self->_readWriteAttributes, 0, self->_textureCacheSpillmap.value_, 81);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create spillmap texture from cache\n", buf, 2u);
      }
      v11 = -26525;
      goto LABEL_57;
    }
    v63 = 0;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    *(_OWORD *)buf = 0u;
    v55 = 116;
    CVPixelBufferGetIOSurface(a3);
    if (IOSurfaceGetBulkAttachments())
      v14 = 2;
    else
      v14 = 0;
    IOSurface = CVPixelBufferGetIOSurface(*a4);
    v54 = 13;
    v11 = IOSurfaceSetBulkAttachments();
    if (v11)
    {
LABEL_57:

      goto LABEL_6;
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType > 1111970368)
    {
      if (PixelFormatType <= 1885745711)
      {
        if (PixelFormatType == 1111970369)
        {
          v21 = 80;
          goto LABEL_39;
        }
        if (PixelFormatType != 1882468912)
          goto LABEL_59;
      }
      else if (PixelFormatType != 1885745712)
      {
        if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
        {
          v18 = 525;
          v19 = v14 == 8;
          v20 = 505;
          goto LABEL_36;
        }
        goto LABEL_59;
      }
    }
    else
    {
      if (PixelFormatType <= 645428783)
      {
        if (PixelFormatType != 641230384)
        {
          v17 = 641234480;
LABEL_31:
          if (PixelFormatType == v17)
            goto LABEL_32;
LABEL_59:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported pixel format", v50, 2u);
          }
          v11 = -666;
          goto LABEL_57;
        }
LABEL_32:
        v19 = v14 == 8;
        v18 = 520;
        v20 = 500;
        goto LABEL_36;
      }
      if (PixelFormatType != 645428784)
      {
        if (PixelFormatType != 875704422)
        {
          v17 = 875704438;
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    v18 = 528;
    v19 = v14 == 8;
    v20 = 508;
LABEL_36:
    if (v19)
      v21 = v20;
    else
      v21 = v18;
LABEL_39:
    -[VCPSpillmapMetalSession loadTexture:withAttributes:forPlane:withCache:withFormat:](self, "loadTexture:withAttributes:forPlane:withCache:withFormat:", a3, self->_readAttributes, 0, self->_textureCacheBGRA.value_, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v50 = 0;
        _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create BGRA texture from cache\n", v50, 2u);
      }
      v11 = -26525;
      goto LABEL_56;
    }
    v45 = (void *)v22;
    v24 = -[MTLTextureDescriptor width](self->_intermediateImageDescriptor, "width");
    v46 = -[MTLTextureDescriptor height](self->_intermediateImageDescriptor, "height");
    v25 = -[MTLTextureDescriptor width](self->_intermediateImageDescriptor, "width");
    Width = CVPixelBufferGetWidth(a3);
    v27 = -[MTLTextureDescriptor height](self->_intermediateImageDescriptor, "height");
    Height = CVPixelBufferGetHeight(a3);
    v29 = (float)((float)v25 / (float)Width) + (float)((float)v25 / (float)Width);
    if (a5 != 1)
      v29 = (float)v25 / (float)Width;
    if (a5 == 2)
    {
      v29 = (float)v25 / (float)Width;
      v30 = (float)((float)v27 / (float)Height) + (float)((float)v27 / (float)Height);
    }
    else
    {
      v30 = (float)v27 / (float)Height;
    }
    *(double *)v50 = v29;
    v51 = v30;
    v52 = 0;
    v53 = 0;
    -[MPSImageBilinearScale setScaleTransform:](self->_bilinearScale, "setScaleTransform:", v50);
    memset(v49, 0, 24);
    bilinearScale = self->_bilinearScale;
    v49[3] = v24;
    v49[4] = v46;
    v49[5] = 1;
    -[MPSImageBilinearScale setClipRect:](bilinearScale, "setClipRect:", v49);
    objc_msgSend(MEMORY[0x1E0CC7230], "temporaryImageWithCommandBuffer:textureDescriptor:", v9, self->_intermediateImageDescriptor);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v32;
    if (v32)
    {
      v33 = self->_bilinearScale;
      objc_msgSend(v32, "texture");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v33, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v9, v45, v34);

      objc_msgSend(MEMORY[0x1E0CC7230], "temporaryImageWithCommandBuffer:textureDescriptor:", v9, self->_intermediateImageDescriptor);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        gaussianBlur = self->_gaussianBlur;
        objc_msgSend(v47, "texture");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "texture");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSImageGaussianBlur encodeToCommandBuffer:sourceTexture:destinationTexture:](gaussianBlur, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v9, v37, v38);

        LODWORD(v37) = IOSurfaceGetWidth(IOSurface);
        v39 = IOSurfaceGetHeight(IOSurface);
        v40 = -[MTLTextureDescriptor width](self->_intermediateImageDescriptor, "width");
        v41 = -[MTLTextureDescriptor height](self->_intermediateImageDescriptor, "height");
        *(double *)v50 = (float)((float)(int)v37 / (float)v40);
        v51 = (float)((float)v39 / (float)v41);
        v52 = 0;
        v53 = 0;
        -[MPSImageBilinearScale setScaleTransform:](self->_bilinearScale, "setScaleTransform:", v50);
        memset(v48, 0, 24);
        v42 = self->_bilinearScale;
        v48[3] = (int)v37;
        v48[4] = v39;
        v48[5] = 1;
        -[MPSImageBilinearScale setClipRect:](v42, "setClipRect:", v48);
        v43 = self->_bilinearScale;
        objc_msgSend(v35, "texture");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v43, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v9, v44, v13);

        if ((objc_msgSend(v9, "commitAndWaitUntilSubmitted") & 1) == 0)
          objc_msgSend(v9, "waitUntilScheduled");
        v11 = 0;
        goto LABEL_55;
      }
    }
    else
    {
      v35 = 0;
    }
    v11 = -12904;
LABEL_55:

    v23 = v45;
LABEL_56:

    goto LABEL_57;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create spillmap pixel buffer from pool\n", buf, 2u);
  }
  v11 = -26525;
LABEL_6:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_intermediateImageDescriptor, 0);
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheSpillmap.value_);
  sub_1B677747C((const void **)&self->_textureCacheBGRA.value_);
  sub_1B67705C8((const void **)&self->_spillmapBufferProperties.value_);
  sub_1B6773DE4((const void **)&self->_spillBufferPoolHDCPType1.value_);
  sub_1B6773DE4((const void **)&self->_spillBufferPoolHDCPType0.value_);
  sub_1B6773DE4((const void **)&self->_spillBufferPoolScreenScrapingProtected.value_);
  sub_1B6773DE4((const void **)&self->_spillBufferPoolUnprotected.value_);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
