@implementation ScaleMetal

- (ScaleMetal)init
{
  ScaleMetal *v2;
  ScaleMetal *v3;
  ScaleMetal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ScaleMetal;
  v2 = -[ScaleMetal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ScaleMetal initWithDevice:](v2, "initWithDevice:", 0);
    v4 = v3;
  }

  return v3;
}

- (ScaleMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t RegistryID;
  MTLDevice *v5;
  MTLDevice **p_device;
  MTLDevice *device;
  ScaleMetal *v8;
  MTLComputePipelineState *bilinearScaleLuma;
  MTLComputePipelineState *bilinearScaleChroma;
  MTLDevice *v11;
  MTLDevice *v12;
  MTLDevice *v13;
  MTLCommandQueue *v14;
  MTLCommandQueue *commandQueue;
  void *v16;
  void *v17;
  MTLDevice *v18;
  MTLLibrary *v19;
  id v20;
  MTLLibrary *library;
  NSDictionary *v22;
  NSDictionary *readAttributes;
  NSDictionary *v24;
  NSDictionary *writeAttributes;
  __CVMetalTextureCache *value;
  MTLDevice *v27;
  __CVMetalTextureCache *v28;
  CF<__CVMetalTextureCache *> *p_textureCacheChroma;
  __CVMetalTextureCache *v30;
  __CVMetalTextureCache *v31;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    p_device = &self->_device;
    device = self->_device;
    if (!device)
      goto LABEL_9;
    return 0;
  }
  CVPixelBufferGetIOSurface(a3);
  RegistryID = IOSurfaceGetRegistryID();
  p_device = &self->_device;
  v5 = self->_device;
  if (!v5)
  {
    device = 0;
    goto LABEL_9;
  }
  if (!RegistryID || -[MTLDevice registryID](v5, "registryID") == RegistryID)
    return 0;
  device = *p_device;
LABEL_9:
  self->_device = 0;

  bilinearScaleLuma = self->_bilinearScaleLuma;
  self->_bilinearScaleLuma = 0;

  bilinearScaleChroma = self->_bilinearScaleChroma;
  self->_bilinearScaleChroma = 0;

  v11 = self->_device;
  if (v11
    || (v12 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
        v13 = *p_device,
        *p_device = v12,
        v13,
        (v11 = *p_device) != 0))
  {
    v14 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v11, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v14;

    if (self->_commandQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLForResource:withExtension:", CFSTR("ProcessAccelerate"), CFSTR("metallib"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = *p_device;
        v33 = 0;
        v19 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](v18, "newLibraryWithURL:error:", v17, &v33);
        v20 = v33;
        library = self->_library;
        self->_library = v19;

        if (self->_library)
        {
          if (!self->_readAttributes)
          {
            v36 = *MEMORY[0x1E0CA8F58];
            v37 = &unk_1E6A1D370;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
            v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            readAttributes = self->_readAttributes;
            self->_readAttributes = v22;

          }
          if (!self->_writeAttributes)
          {
            v34 = *MEMORY[0x1E0CA8F58];
            v35 = &unk_1E6A1D388;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            writeAttributes = self->_writeAttributes;
            self->_writeAttributes = v24;

          }
          value = self->_textureCacheLuma.value_;
          v27 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          v8 = (ScaleMetal *)CVMetalTextureCacheCreate(0, 0, v27, 0, &self->_textureCacheLuma.value_);
          if (!(_DWORD)v8)
          {
            v30 = self->_textureCacheChroma.value_;
            p_textureCacheChroma = &self->_textureCacheChroma;
            v28 = v30;
            v31 = p_textureCacheChroma[-9].value_;
            if (v30)
            {
              CFRelease(v28);
              p_textureCacheChroma->value_ = 0;
            }
            v8 = (ScaleMetal *)CVMetalTextureCacheCreate(0, 0, v31, 0, &p_textureCacheChroma->value_);
          }
          goto LABEL_29;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v16;
          v40 = 2112;
          v41 = v20;
          _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        v20 = 0;
      }
      v8 = 0;
LABEL_29:

      return v8;
    }
  }
  return (ScaleMetal *)4294954385;
}

- (id)compileFunction:(id)a3 constantValues:(id)a4
{
  id v6;
  id v7;
  MTLLibrary *library;
  void *v9;
  id v10;
  MTLDevice *device;
  void *v12;
  id v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  library = self->_library;
  if (library)
  {
    if (v7)
    {
      v16 = 0;
      v9 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](library, "newFunctionWithName:constantValues:error:", v6, v7, &v16);
      v10 = v16;
      if (v9)
        goto LABEL_4;
    }
    else
    {
      v9 = (void *)-[MTLLibrary newFunctionWithName:](library, "newFunctionWithName:", v6);
      v10 = 0;
      if (v9)
      {
LABEL_4:
        device = self->_device;
        v15 = v10;
        v12 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](device, "newComputePipelineStateWithFunction:error:", v9, &v15);
        v13 = v15;

        if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v13;
          _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed compiling %@ with error %@", buf, 0x16u);
        }

        v10 = v13;
LABEL_13:

        goto LABEL_14;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unalbe to find kernel %@ with error %@", buf, 0x16u);
    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)compileFunction:(id)a3
{
  -[ScaleMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  const __CFDictionary *v8;
  OSType PixelFormatType;
  int v10;
  MTLPixelFormat v11;
  unsigned __int16 v12;
  int v13;
  uint64_t v14;
  __CVMetalTextureCache *v15;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v18;
  CFTypeRef cf;

  v8 = (const __CFDictionary *)a5;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v10 = PixelFormatType;
  if (a4)
    v11 = MTLPixelFormatRG8Unorm;
  else
    v11 = MTLPixelFormatR8Unorm;
  if (sub_1B67C37F4(PixelFormatType) == 10)
  {
    if (v10 > 1882468911)
    {
      if (v10 > 1885745711)
      {
        if (v10 == 1885745712)
          goto LABEL_18;
        v13 = 1885746228;
      }
      else
      {
        if (v10 == 1882468912)
          goto LABEL_18;
        v13 = 1882469428;
      }
    }
    else
    {
      if (v10 > 645428783)
      {
        if (v10 == 645428784)
          goto LABEL_18;
        v12 = 30260;
      }
      else
      {
        if (v10 == 645424688)
          goto LABEL_18;
        v12 = 26164;
      }
      v13 = v12 | 0x26780000;
    }
    if (v10 == v13)
    {
LABEL_18:
      if (a4)
        v11 = MTLPixelFormatRGBA8Uint|0x204;
      else
        v11 = 588;
      goto LABEL_21;
    }
    if (a4)
      v11 = 578;
    else
      v11 = 576;
  }
LABEL_21:
  v14 = 80;
  if (!a4)
    v14 = 72;
  v15 = *(Class *)((char *)&self->super.isa + v14);
  cf = 0;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v11, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v18 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v18;
}

- (id)uintTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  const __CFDictionary *v8;
  OSType PixelFormatType;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MTLPixelFormat v14;
  __CVMetalTextureCache *v15;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v18;
  CFTypeRef cf;

  v8 = (const __CFDictionary *)a5;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v10 = sub_1B67C37F4(PixelFormatType);
  v11 = 33;
  if (!a4)
    v11 = 13;
  v12 = 63;
  if (!a4)
    v12 = 23;
  v13 = 80;
  if (!a4)
    v13 = 72;
  cf = 0;
  if (v10 <= 8)
    v14 = v11;
  else
    v14 = v12;
  v15 = *(Class *)((char *)&self->super.isa + v13);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v14, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v18 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v18;
}

- (int)scaleFrame:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6 scaleMethod:(int)a7
{
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  MPSImageBilinearScale *bilinearKernel;
  MPSImageBilinearScale *v22;
  MPSImageBilinearScale *v23;
  MPSImageLanczosScale *v24;
  MPSImageLanczosScale *v26;
  MPSImageLanczosScale *lanczosKernel;
  float64x2_t v28;
  float64x2_t v29;
  __int128 v30;
  $445C4095E4B6CD76AE4296F0F76FCBC9 *v31;
  uint64_t v32;
  _OWORD v33[3];
  _OWORD v34[2];

  if (!a4 || CVPixelBufferGetPlaneCount(a3) != 2)
    return -12902;
  v13 = (int)-[ScaleMetal initWithDevice:](self, "initWithDevice:", a3);
  if (!v13)
  {
    v31 = a6;
    -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 1, self->_readAttributes);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 0, self->_writeAttributes);
    v16 = objc_claimAutoreleasedReturnValue();
    -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 1, self->_writeAttributes);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v32 = v16;
    v13 = -12911;
    if (!v14)
    {
      v19 = (void *)v16;
      goto LABEL_19;
    }
    v19 = (void *)v16;
    if (!v15 || !v16 || !v17)
      goto LABEL_19;
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLabel:", CFSTR("Frame scaler (interpolator)"));
    if (a7 == 1)
    {
      if (!self->_lanczosKernel)
      {
        v26 = (MPSImageLanczosScale *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E80]), "initWithDevice:", self->_device);
        lanczosKernel = self->_lanczosKernel;
        self->_lanczosKernel = v26;

      }
    }
    else if (!a7)
    {
      bilinearKernel = self->_bilinearKernel;
      if (!bilinearKernel)
      {
        v22 = (MPSImageBilinearScale *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E08]), "initWithDevice:", self->_device);
        v23 = self->_bilinearKernel;
        self->_bilinearKernel = v22;

        bilinearKernel = self->_bilinearKernel;
      }
      v24 = bilinearKernel;
      goto LABEL_18;
    }
    v24 = self->_lanczosKernel;
    v28 = vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&v31->var1.var0), vcvtq_f64_u64(*(uint64x2_t *)&a5->var1.var0));
    v29 = vmulq_f64(v28, vnegq_f64(vcvtq_f64_u64(*(uint64x2_t *)&a5->var0.var0)));
    v34[0] = v28;
    v34[1] = v29;
    -[MPSImageLanczosScale setScaleTransform:](v24, "setScaleTransform:", v34);
    v30 = *(_OWORD *)&v31->var0.var2;
    v33[0] = *(_OWORD *)&v31->var0.var0;
    v33[1] = v30;
    v33[2] = *(_OWORD *)&v31->var1.var1;
    -[MPSImageLanczosScale setClipRect:](v24, "setClipRect:", v33);
    -[MPSImageLanczosScale setEdgeMode:](v24, "setEdgeMode:", 1);
    -[MPSImageLanczosScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v24, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v20, v14, v32);
    -[MPSImageLanczosScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v24, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v20, v15, v18);
    objc_msgSend(v20, "commit");
    objc_msgSend(v20, "waitUntilCompleted");
    v13 = 0;
LABEL_18:

LABEL_19:
  }
  return v13;
}

- (void)CompileBilinearScaler:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *bilinearScaleLuma;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *bilinearScaleChroma;
  id v12;

  if (!self->_bilinearScaleLuma)
  {
    v3 = a3;
    if ((-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0
      || (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1004) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = -[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 3003);
    }
    self->_supportsNonuniformThreadgroups = v5;
    v12 = (id)objc_opt_new();
    objc_msgSend(v12, "setConstantValue:type:atIndex:", &self->_supportsNonuniformThreadgroups, 53, 0);
    if (v3)
    {
      -[ScaleMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("bilinearScaleUnormLuma"), v12);
      v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      bilinearScaleLuma = self->_bilinearScaleLuma;
      self->_bilinearScaleLuma = v6;

      -[ScaleMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("bilinearScaleUnormChroma"), v12);
    }
    else
    {
      -[ScaleMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("bilinearScaleUintLuma"), v12);
      v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v10 = self->_bilinearScaleLuma;
      self->_bilinearScaleLuma = v9;

      -[ScaleMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("bilinearScaleUintChroma"), v12);
    }
    v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    bilinearScaleChroma = self->_bilinearScaleChroma;
    self->_bilinearScaleChroma = v8;

  }
}

- (int)scaleFrameBilinear:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6
{
  int v9;
  OSType PixelFormatType;
  __CVBuffer *v11;
  void *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  char v22;
  unint64_t var0;
  unint64_t var1;
  char v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v38;
  size_t v39;
  size_t v40;
  size_t Height;
  size_t Width;
  __CVBuffer *v43;
  size_t v44;
  size_t HeightOfPlane;
  size_t v46;
  size_t WidthOfPlane;
  __CVBuffer *pixelBuffer;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  BOOL v55;
  _DWORD v56[4];
  _DWORD v57[4];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a4 || CVPixelBufferGetPlaneCount(a3) != 2)
    return -12902;
  v9 = (int)-[ScaleMetal initWithDevice:](self, "initWithDevice:", a3);
  if (!v9)
  {
    pixelBuffer = a3;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    v55 = sub_1B67C37F4(PixelFormatType) == 10;
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
    v46 = CVPixelBufferGetWidthOfPlane(a4, 1uLL);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
    v44 = CVPixelBufferGetHeightOfPlane(a4, 1uLL);
    -[ScaleMetal CompileBilinearScaler:](self, "CompileBilinearScaler:", 1);
    if (self->_bilinearScaleLuma && self->_bilinearScaleChroma)
    {
      v43 = a4;
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setLabel:", CFSTR("Bilinear frame scaler (interpolator)"));
      objc_msgSend(v38, "computeCommandEncoder");
      v11 = a4;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      v40 = CVPixelBufferGetWidth(v11);
      v39 = CVPixelBufferGetHeight(v11);
      v13 = 0;
      v14 = 1;
      while (1)
      {
        v15 = v14;
        v21 = (v14 & 1) == 0;
        v16 = 56;
        if (!v21)
          v16 = 48;
        v17 = *(id *)((char *)&self->super.isa + v16);
        -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", pixelBuffer, v13, self->_readAttributes);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ScaleMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", v43, v13, self->_writeAttributes);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = !v18 || v19 == 0;
        if (v21)
          break;
        if (WidthOfPlane <= v46)
          v22 = 0;
        else
          v22 = v13;
        var0 = a5->var0.var0;
        var1 = a5->var0.var1;
        if (HeightOfPlane <= v44)
          v25 = 0;
        else
          v25 = v13;
        v57[0] = a5->var0.var0 >> v22;
        v57[1] = var1 >> v25;
        v26 = Width - var0;
        if (v26 >= a5->var1.var0)
          v26 = a5->var1.var0;
        v27 = v26 >> v22;
        v28 = Height - var1;
        if (v28 >= a5->var1.var1)
          v28 = a5->var1.var1;
        v57[2] = v27;
        v57[3] = v28 >> v25;
        v29 = a6->var0.var0;
        v30 = a6->var0.var1;
        v56[0] = a6->var0.var0 >> v22;
        v56[1] = v30 >> v25;
        v31 = v40 - v29;
        if (v31 >= a6->var1.var0)
          v31 = a6->var1.var0;
        v32 = v31 >> v22;
        LODWORD(v33) = v39 - v30;
        if (v39 - v30 >= a6->var1.var1)
          v33 = a6->var1.var1;
        v34 = v33 >> v25;
        v56[2] = v32;
        v56[3] = v33 >> v25;
        v35 = objc_msgSend(v17, "threadExecutionWidth");
        v36 = objc_msgSend(v17, "maxTotalThreadsPerThreadgroup");
        objc_msgSend(v12, "setComputePipelineState:", v17);
        objc_msgSend(v12, "setTexture:atIndex:", v18, 0);
        objc_msgSend(v12, "setTexture:atIndex:", v20, 1);
        objc_msgSend(v12, "setBytes:length:atIndex:", v57, 16, 0);
        objc_msgSend(v12, "setBytes:length:atIndex:", v56, 16, 1);
        objc_msgSend(v12, "setBytes:length:atIndex:", &v55, 1, 2);
        if (self->_supportsNonuniformThreadgroups)
        {
          v54[0] = v32;
          v54[1] = v34;
          v54[2] = 1;
          v53[0] = v35;
          v53[1] = v36 / v35;
          v53[2] = 1;
          objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v54, v53);
        }
        else
        {
          v52[0] = (v32 + v35 - 1) / v35;
          v52[1] = (v34 + v36 / v35 - 1) / (v36 / v35);
          v52[2] = 1;
          v51[0] = v35;
          v51[1] = v36 / v35;
          v51[2] = 1;
          objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v52, v51);
        }

        v14 = 0;
        v13 = 1;
        if ((v15 & 1) == 0)
        {
          objc_msgSend(v12, "endEncoding");
          objc_msgSend(v38, "commit");
          objc_msgSend(v38, "waitUntilCompleted");
          v9 = 0;
          goto LABEL_36;
        }
      }

      v9 = -12911;
LABEL_36:

    }
    else
    {
      return -12911;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_bilinearScaleChroma, 0);
  objc_storeStrong((id *)&self->_bilinearScaleLuma, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lanczosKernel, 0);
  objc_storeStrong((id *)&self->_bilinearKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
