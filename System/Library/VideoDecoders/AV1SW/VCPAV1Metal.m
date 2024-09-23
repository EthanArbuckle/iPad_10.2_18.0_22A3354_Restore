@implementation VCPAV1Metal

- (BOOL)metalIsSupported
{
  -[VCPAV1Metal openDevice](self, "openDevice");
  return self->_library != 0;
}

- (int)openDevice
{
  CVReturn v3;
  MTLDevice *device;
  MTLDevice *v5;
  MTLDevice *v6;
  int v7;
  int maximumTextureDimension;
  MTLDevice *v9;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  MTLDevice *v14;
  CF<__CVMetalTextureCache *> *v15;
  MTLDevice *v16;
  CF<__CVMetalTextureCache *> *v17;
  MTLCommandQueue *v18;
  MTLCommandQueue *commandQueue;
  void *v20;
  MTLDevice *v21;
  MTLLibrary *v22;
  id v23;
  MTLLibrary *library;
  void *v25;
  MTLDevice *v26;
  MTLLibrary *v27;
  id v28;
  MTLLibrary *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (self->_openAttempted)
  {
    if (self->_library)
      return 0;
    else
      return -12910;
  }
  else
  {
    self->_openAttempted = 1;
    device = self->_device;
    if (device
      || (v5 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
          v6 = self->_device,
          self->_device = v5,
          v6,
          (device = self->_device) != 0))
    {
      if ((-[MTLDevice supportsFamily:](device, "supportsFamily:", 3003) & 1) != 0
        || (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v7 = -[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1004);
      }
      self->_supportsNonUniformThreadgroup = v7;
      self->_maximumTextureDimension = 0x2000;
      if ((-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1003) & 1) != 0
        || (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0)
      {
        maximumTextureDimension = 0x4000;
        self->_maximumTextureDimension = 0x4000;
      }
      else
      {
        maximumTextureDimension = self->_maximumTextureDimension;
      }
      self->_maximumTextureDimension = maximumTextureDimension - 1;
      v9 = self->_device;
      -[MTLDevice vendorName](v9, "vendorName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_broken444 = objc_msgSend(v10, "containsString:", CFSTR("Intel"));

      v11 = 0;
      v12 = 1;
      while (1)
      {
        v13 = v12;
        v14 = self->_device;
        v15 = &self->_textureCacheSrc[v11];
        if (v15->value_)
        {
          CFRelease(v15->value_);
          v15->value_ = 0;
        }
        v3 = CVMetalTextureCacheCreate(0, 0, v14, 0, &self->_textureCacheSrc[v11].value_);
        if (v3)
          break;
        v16 = self->_device;
        v17 = &self->_textureCacheDst[v11];
        if (v17->value_)
        {
          CFRelease(v17->value_);
          v17->value_ = 0;
        }
        v3 = CVMetalTextureCacheCreate(0, 0, v16, 0, &self->_textureCacheDst[v11].value_);
        if (v3)
          break;
        v12 = 0;
        v11 = 1;
        if ((v13 & 1) == 0)
        {
          v18 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
          commandQueue = self->_commandQueue;
          self->_commandQueue = v18;

          if (self->_commandQueue)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = self->_device;
            v32 = 0;
            v22 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](v21, "newDefaultLibraryWithBundle:error:", v20, &v32);
            v23 = v32;
            library = self->_library;
            self->_library = v22;

            if (self->_library)
            {
              v3 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/VideoDecoders/AV1SW.metallib"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = self->_device;
              v31 = v23;
              v27 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](v26, "newLibraryWithURL:error:", v25, &v31);
              v28 = v31;

              v29 = self->_library;
              self->_library = v27;

              if (self->_library)
              {
                fwrite("Using /System/Library/VideoDecoders/AV1SW.metallib\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Using /System/Library/VideoDecoders/AV1SW.metallib", buf, 2u);
                }
              }

              if (self->_library)
              {
                v3 = 0;
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v34 = v28;
                  _os_log_error_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to get metal library, error: %@", buf, 0xCu);
                }
                v3 = -12911;
              }
              v23 = v28;
            }

          }
          else
          {
            fwrite("Unable to get command queue\n\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to get command queue\n", buf, 2u);
            }
            v3 = -12911;
          }
          break;
        }
      }

    }
    else
    {
      fwrite("Unable to get metal device\n\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to get metal device\n", buf, 2u);
      }
      return -12911;
    }
  }
  return v3;
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

  v21 = *MEMORY[0x24BDAC8D0];
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

        if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v13;
          _os_log_error_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed compiling %@ with error %@", buf, 0x16u);
        }

LABEL_13:
        goto LABEL_14;
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to find kernel %@", buf, 0xCu);
    }
    v12 = 0;
    v13 = v10;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (void)updatePictureFormat:(Dav1dPicture *)a3 pixelBuffer:(__CVBuffer *)a4
{
  OSType PixelFormatType;
  int v7;
  Dav1dFrameHeader *var1;
  _BOOL4 v9;
  int v10;
  MTLComputePipelineState *blitKernelLuma;
  MTLComputePipelineState *blitKernelChroma;
  MTLComputePipelineState *filmGrainLuma;
  MTLComputePipelineState *filmGrainChroma;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  v7 = sub_218BB670C(PixelFormatType);
  var1 = a3->var1;
  if (!*((_DWORD *)var1 + 1) && !*((_DWORD *)var1 + 10) && !*((_DWORD *)var1 + 11))
  {
    if (!*((_DWORD *)var1 + 54))
    {
      v9 = v7;
      goto LABEL_5;
    }
    v9 = v7;
    if (!*((_DWORD *)var1 + 9))
      goto LABEL_5;
  }
  v9 = 1;
LABEL_5:
  v10 = v7 ^ 1;
  if (self->_gpuBitdepth != a3->var4.var3
    || self->_layout != a3->var4.var2
    || self->_onePixelPerWrite != v9
    || self->_integerWrites != v10)
  {
    blitKernelLuma = self->_blitKernelLuma;
    self->_blitKernelLuma = 0;

    blitKernelChroma = self->_blitKernelChroma;
    self->_blitKernelChroma = 0;

    filmGrainLuma = self->_filmGrainLuma;
    self->_filmGrainLuma = 0;

    filmGrainChroma = self->_filmGrainChroma;
    self->_filmGrainChroma = 0;

    *(int32x2_t *)&self->_gpuBitdepth = vrev64_s32(*(int32x2_t *)&a3->var4.var2);
    self->_onePixelPerWrite = v9;
    self->_integerWrites = v10;
  }
}

- (int)compileBlitForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4
{
  int v7;
  void *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *blitKernelLuma;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *blitKernelChroma;
  uint8_t v18[16];

  v7 = -[VCPAV1Metal openDevice](self, "openDevice");
  if (!v7)
  {
    -[VCPAV1Metal updatePictureFormat:pixelBuffer:](self, "updatePictureFormat:pixelBuffer:", a3, a4);
    if (self->_blitKernelLuma && self->_blitKernelChroma)
    {
      return 0;
    }
    else
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setConstantValue:type:atIndex:", &self->_supportsNonUniformThreadgroup, 33, 0);
      objc_msgSend(v8, "setConstantValue:type:atIndex:", &self->_gpuBitdepth, 33, 1);
      if (self->_integerWrites)
      {
        if (self->_onePixelPerWrite)
        {
          -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitLumaKernel_Uint"), v8);
          v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          blitKernelLuma = self->_blitKernelLuma;
          self->_blitKernelLuma = v9;

          -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitChromaKernel_Uint"), v8);
        }
        else
        {
          -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitLumaKernel_UintPacked"), v8);
          v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          v15 = self->_blitKernelLuma;
          self->_blitKernelLuma = v14;

          -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitChromaKernel_UintPacked"), v8);
        }
        v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitLumaKernel_Unorm"), v8);
        v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        v13 = self->_blitKernelLuma;
        self->_blitKernelLuma = v12;

        -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("BlitChromaKernel_Unorm"), v8);
        v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      }
      blitKernelChroma = self->_blitKernelChroma;
      self->_blitKernelChroma = v11;

      if (self->_blitKernelLuma && self->_blitKernelChroma)
      {
        v7 = 0;
      }
      else
      {
        fwrite("Unable to compile blit kernels\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to compile blit kernels", v18, 2u);
        }
        v7 = -12911;
      }

    }
  }
  return v7;
}

- (int)compileFilmGrainForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4
{
  int v7;
  int var0;
  int var1;
  int v10;
  int v11;
  int v12;
  void *v13;
  MTLBuffer *v14;
  MTLBuffer *offsets;
  MTLTexture *v16;
  MTLTexture *offsetsTex;
  int var2;
  void *v19;
  MTLComputePipelineState *v20;
  MTLComputePipelineState *filmGrainLuma;
  MTLComputePipelineState *v22;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *v24;
  MTLComputePipelineState *filmGrainChroma;
  void *v26;
  void *v27;
  MTLTexture *v28;
  MTLTexture *grainTextureY;
  MTLTexture *v30;
  MTLTexture *grainTextureUV;
  MTLBuffer *v32;
  MTLBuffer *grainPatch;
  MTLBuffer *v34;
  MTLBuffer *scalingLUT;
  uint8_t v37[8];
  _BOOL4 v38;
  _BOOL4 v39;

  v7 = -[VCPAV1Metal openDevice](self, "openDevice");
  if (v7)
    return v7;
  v7 = -[VCPAV1Metal compileBlitForPicture:andPixelBuffer:](self, "compileBlitForPicture:andPixelBuffer:", a3, a4);
  if (v7)
    return v7;
  var0 = a3->var4.var0;
  if (self->_width == var0)
  {
    var1 = a3->var4.var1;
    if (self->_height == var1)
      goto LABEL_8;
  }
  else
  {
    var1 = a3->var4.var1;
  }
  v10 = var0 + 31;
  v11 = var1 + 31;
  v12 = -[MTLDevice minimumLinearTextureAlignmentForPixelFormat:](self->_device, "minimumLinearTextureAlignmentForPixelFormat:", 73);
  self->_offsetsStride = (((unint64_t)v12 >> 2) + (v10 >> 5) - 1) & -(int)((unint64_t)v12 >> 2);
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 73, (uint64_t)v10 >> 5, (uint64_t)v11 >> 5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStorageMode:", 0);
  v14 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4 * self->_offsetsStride * (v11 >> 5), 0);
  offsets = self->_offsets;
  self->_offsets = v14;

  v16 = (MTLTexture *)-[MTLBuffer newTextureWithDescriptor:offset:bytesPerRow:](self->_offsets, "newTextureWithDescriptor:offset:bytesPerRow:", v13, 0, 4 * self->_offsetsStride);
  offsetsTex = self->_offsetsTex;
  self->_offsetsTex = v16;

  self->_width = a3->var4.var0;
  self->_height = a3->var4.var1;

LABEL_8:
  if (self->_filmGrainLuma && self->_filmGrainChroma)
    return 0;
  var2 = a3->var4.var2;
  v38 = var2 != 3;
  v39 = var2 == 1;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &self->_supportsNonUniformThreadgroup, 33, 0);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &self->_gpuBitdepth, 33, 1);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &v38, 33, 2);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &v39, 33, 3);
  if (self->_integerWrites)
  {
    -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FilmGrainLumaKernel_Uint"), v19);
    v20 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    filmGrainLuma = self->_filmGrainLuma;
    self->_filmGrainLuma = v20;

    -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FilmGrainChromaKernel_Uint"), v19);
  }
  else
  {
    -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FilmGrainLumaKernel_Unorm"), v19);
    v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v24 = self->_filmGrainLuma;
    self->_filmGrainLuma = v23;

    -[VCPAV1Metal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FilmGrainChromaKernel_Unorm"), v19);
  }
  v22 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  filmGrainChroma = self->_filmGrainChroma;
  self->_filmGrainChroma = v22;

  if (self->_filmGrainLuma && self->_filmGrainChroma)
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 24, 64, 64, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 64, 64, 64, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setStorageMode:", 2);
    objc_msgSend(v27, "setStorageMode:", 2);
    objc_msgSend(v26, "setUsage:", 1);
    objc_msgSend(v27, "setUsage:", 1);
    v28 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    grainTextureY = self->_grainTextureY;
    self->_grainTextureY = v28;

    v30 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v27);
    grainTextureUV = self->_grainTextureUV;
    self->_grainTextureUV = v30;

    v32 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 24576, 0);
    grainPatch = self->_grainPatch;
    self->_grainPatch = v32;

    v34 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 3 * (256 << (self->_gpuBitdepth - 8)), 0);
    scalingLUT = self->_scalingLUT;
    self->_scalingLUT = v34;

    v7 = 0;
  }
  else
  {
    fwrite("Unable to compile blit kernels\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to compile blit kernels", v37, 2u);
    }
    v7 = -12911;
  }

  return v7;
}

- (id)srcTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5
{
  size_t Width;
  size_t Height;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  MTLPixelFormat v15;
  const __CFDictionary *v16;
  void *v17;
  CVMetalTextureRef image;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v11 = 23;
  if (a5 == 8)
    v11 = 13;
  v12 = 63;
  if (a5 == 8)
    v12 = 33;
  v13 = (Width + 1) >> 1;
  v14 = 113;
  if (a5 == 8)
    v14 = 73;
  if (!a4)
  {
    v13 = (Width + 3) >> 2;
    v12 = v14;
  }
  if (self->_onePixelPerWrite)
  {
    v15 = v11;
  }
  else
  {
    Width = v13;
    v15 = v12;
  }
  v20 = *MEMORY[0x24BDC55C8];
  v21[0] = &unk_24D9B1F00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage(0, self->_textureCacheSrc[a4 > 0].value_, a3, v16, v15, Width, Height, 0, &image))
  {
    v17 = 0;
  }
  else
  {
    CVMetalTextureGetTexture(image);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_218B5AFAC((const void **)&image);

  return v17;
}

- (id)dstTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5
{
  size_t v9;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  MTLPixelFormat v16;
  _BOOL4 v17;
  const __CFDictionary *v18;
  void *v19;
  CVMetalTextureRef image;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v9);
  v12 = 13;
  if (a4)
    v12 = 33;
  if (self->_integerWrites)
  {
    v13 = 23;
    if (a4)
      v13 = 63;
    if (a5 > 8)
      v12 = v13;
    v14 = 113;
    if (a5 == 8)
      v14 = 73;
    v15 = (WidthOfPlane + 1) >> 1;
    if (!a4)
      v15 = (WidthOfPlane + 3) >> 2;
    if (self->_onePixelPerWrite)
    {
      v16 = v12;
    }
    else
    {
      WidthOfPlane = v15;
      v16 = v14;
    }
  }
  else
  {
    v16 = sub_218B5AF0C(a3, a4);
  }
  v17 = a4 != 0;
  v22 = *MEMORY[0x24BDC55C8];
  v23[0] = &unk_24D9B1F18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage(0, self->_textureCacheDst[v17].value_, a3, v18, v16, WidthOfPlane, HeightOfPlane, v9, &image))
  {
    v19 = 0;
  }
  else
  {
    CVMetalTextureGetTexture(image);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_218B5AFAC((const void **)&image);

  return v19;
}

- (void)encodeBlit:(id)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5 plane:(int)a6
{
  id v10;
  _QWORD *var18;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];

  v10 = a3;
  var18 = a4->var18;
  if (a6)
  {
    -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", var18[1], 1, a4->var4.var3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", var18[2], 2, a4->var4.var3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAV1Metal dstTexture:forPlane:bitdepth:](self, "dstTexture:forPlane:bitdepth:", a5, 1, a4->var4.var3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "width");
    v16 = objc_msgSend(v14, "height");
    objc_msgSend(v10, "setComputePipelineState:", self->_blitKernelChroma);
    objc_msgSend(v10, "setTexture:atIndex:", v14, 0);
    objc_msgSend(v10, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v10, "setTexture:atIndex:", v13, 2);
    if (self->_supportsNonUniformThreadgroup)
    {
      v24[0] = v15;
      v24[1] = v16;
      v24[2] = 1;
      v22 = vdupq_n_s64(0x10uLL);
      v23 = 1;
      objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
    }
    else
    {
      v21[0] = (unint64_t)(v15 + 15) >> 4;
      v21[1] = (unint64_t)(v16 + 15) >> 4;
      v21[2] = 1;
      v19 = vdupq_n_s64(0x10uLL);
      v20 = 1;
      objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
    }

  }
  else
  {
    -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", *var18, 0, a4->var4.var3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAV1Metal dstTexture:forPlane:bitdepth:](self, "dstTexture:forPlane:bitdepth:", a5, 0, a4->var4.var3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "width");
    v18 = objc_msgSend(v13, "height");
    objc_msgSend(v10, "setComputePipelineState:", self->_blitKernelLuma);
    objc_msgSend(v10, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v10, "setTexture:atIndex:", v12, 1);
    if (self->_supportsNonUniformThreadgroup)
    {
      v30[0] = v17;
      v30[1] = v18;
      v30[2] = 1;
      v28 = vdupq_n_s64(0x10uLL);
      v29 = 1;
      objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
    }
    else
    {
      v27[0] = (unint64_t)(v17 + 15) >> 4;
      v27[1] = (unint64_t)(v18 + 15) >> 4;
      v27[2] = 1;
      v25 = vdupq_n_s64(0x10uLL);
      v26 = 1;
      objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v27, &v25);
    }
  }

}

- (int)copyPicture:(Dav1dPicture *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  _BYTE *var18;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  var18 = a3->var18;
  v8 = -[VCPAV1Metal compileBlitForPicture:andPixelBuffer:](self, "compileBlitForPicture:andPixelBuffer:");
  if (!v8)
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "computeCommandEncoder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!var18[24])
      -[VCPAV1Metal encodeBlit:forPicture:toPixelBuffer:plane:](self, "encodeBlit:forPicture:toPixelBuffer:plane:", v10, a3, a4, 0);
    if (a3->var4.var2)
      -[VCPAV1Metal encodeBlit:forPicture:toPixelBuffer:plane:](self, "encodeBlit:forPicture:toPixelBuffer:plane:", v10, a3, a4, 1);
    objc_msgSend(v10, "endEncoding");
    objc_msgSend(v9, "commit");
    objc_msgSend(v9, "waitUntilCompleted");
    objc_msgSend(v9, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_error_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error %@ in metal execution", (uint8_t *)&v14, 0xCu);

      }
      v8 = -12911;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  VCPAV1Metal *v5;
  int v6;
  void *v7;
  uint64_t v8;
  MTLComputePipelineState *blitKernelUnorm;
  void *v10;
  void *v11;
  OSType PixelFormatType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v24;
  void *v25;
  int64x2_t v26;
  uint64_t v27;
  _QWORD v28[3];
  int64x2_t v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[2];
  __CVBuffer *v33;
  VCPAV1Metal *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v5 = self;
  v37 = *MEMORY[0x24BDAC8D0];
  v34 = self;
  v33 = a3;
  v6 = -[VCPAV1Metal openDevice](self, "openDevice");
  if (!v6)
  {
    if (!v5->_blitKernelUnorm)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setConstantValue:type:atIndex:", &v5->_supportsNonUniformThreadgroup, 33, 0);
      -[VCPAV1Metal compileFunction:constantValues:](v34, "compileFunction:constantValues:", CFSTR("BlitKernel_Unorm"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v5 = v34;
      blitKernelUnorm = v34->_blitKernelUnorm;
      v34->_blitKernelUnorm = (MTLComputePipelineState *)v8;

      *(_WORD *)&v5->_onePixelPerWrite = 1;
    }
    v32[0] = &v33;
    v32[1] = &v34;
    -[MTLCommandQueue commandBuffer](v5->_commandQueue, "commandBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "computeCommandEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    v13 = sub_218BB6238(PixelFormatType);
    sub_218B5AD98((uint64_t)v32, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_218B5AD98((uint64_t)v32, 1uLL);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAV1Metal dstTexture:forPlane:bitdepth:](v34, "dstTexture:forPlane:bitdepth:", a4, 0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAV1Metal dstTexture:forPlane:bitdepth:](v34, "dstTexture:forPlane:bitdepth:", a4, 1, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "width");
    v18 = objc_msgSend(v15, "height");
    v19 = objc_msgSend(v16, "width");
    v20 = objc_msgSend(v16, "height");
    objc_msgSend(v11, "setComputePipelineState:", v34->_blitKernelUnorm);
    objc_msgSend(v11, "setTexture:atIndex:", v15, 0);
    objc_msgSend(v11, "setTexture:atIndex:", v14, 1);
    v31[0] = v17;
    v31[1] = v18;
    v31[2] = 1;
    v29 = vdupq_n_s64(0x10uLL);
    v30 = 1;
    objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v31, &v29);
    if (CVPixelBufferGetPlaneCount(a4) >= 2)
    {
      objc_msgSend(v11, "setComputePipelineState:", v34->_blitKernelUnorm);
      objc_msgSend(v11, "setTexture:atIndex:", v16, 0);
      objc_msgSend(v11, "setTexture:atIndex:", v25, 1);
      v28[0] = v19;
      v28[1] = v20;
      v28[2] = 1;
      v26 = vdupq_n_s64(0x10uLL);
      v27 = 1;
      objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v28, &v26);
    }
    objc_msgSend(v11, "endEncoding");
    objc_msgSend(v10, "commit");
    objc_msgSend(v10, "waitUntilCompleted");
    objc_msgSend(v10, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (v22)
    {
      v6 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_error_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error %@ in metal execution", buf, 0xCu);

      }
      v6 = -12911;
    }

  }
  return v6;
}

- (int)applyFilmGrain:(void *)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5
{
  _QWORD *var18;
  Dav1dFrameHeader *var1;
  int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  int v22;
  uint64_t i;
  Dav1dFrameHeader *v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  MTLBuffer *grainPatch;
  MTLTexture *grainTextureY;
  MTLBuffer *v37;
  MTLTexture *grainTextureUV;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  void *v53;
  int gpuBitdepth;
  _QWORD *v55;
  int64x2_t v56;
  uint64_t v57;
  _QWORD v58[3];
  int64x2_t v59;
  uint64_t v60;
  _QWORD v61[3];
  int64x2_t v62;
  uint64_t v63;
  _QWORD v64[3];
  int64x2_t v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD v68[3];
  int64x2_t v69;
  uint64_t v70;
  _QWORD v71[3];
  int64x2_t v72;
  uint64_t v73;
  uint8_t v74[4];
  void *v75;
  _BYTE v76[4];
  int v77;
  uint8_t buf[4];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int8x16_t v83;
  uint32x2_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  var18 = a4->var18;
  var1 = a4->var1;
  v11 = -[VCPAV1Metal compileFilmGrainForPicture:andPixelBuffer:](self, "compileFilmGrainForPicture:andPixelBuffer:", a4, a5);
  if (v11)
    return v11;
  v55 = var18;
  v12 = -[MTLBuffer contents](self->_grainPatch, "contents", sub_218BAC0F0((uint64_t)v76, (uint64_t)a4).n128_f64[0]);
  sub_218BAC004((char *)a3, (uint64_t)v76);
  v13 = (char *)a3 + 36784;
  (*((void (**)(_BYTE *, void *, uint64_t))a3 + 4598))(v76, a3, v12);
  v14 = -[MTLBuffer contents](self->_scalingLUT, "contents");
  v15 = -[MTLBuffer length](self->_scalingLUT, "length");
  v16 = (unsigned __int16)v77 >> 13;
  v17 = 768 << v16;
  if (v15 == 768 << v16)
  {
    if ((unsigned __int16)v77 >> 13)
    {
      v18 = 0;
      do
      {
        (*((void (**)(_BYTE *, uint8_t *, uint64_t))v13 + 1))(v76, buf, v18);
        v19 = 0;
        v20 = (unsigned __int16)v77 >> 13;
        do
        {
          v21 = (unint64_t)v19 >> v20;
          if (!v20 || (_DWORD)v21 == 255)
            LOBYTE(v22) = buf[v21];
          else
            v22 = (((1 << (v20 - 1)) + (buf[v21 + 1] - buf[v21]) * ((int)v19 - ((_DWORD)v21 << v20))) >> v20)
                + buf[v21];
          *(_BYTE *)(v14 + v19) = v22;
          v20 = (unsigned __int16)v77 >> 13;
          ++v19;
        }
        while (v19 < 256 << v20);
        v14 += v19;
        v18 = (v18 + 1);
      }
      while ((_DWORD)v18 != 3);
    }
    else
    {
      for (i = 0; i != 3; ++i)
      {
        (*((void (**)(_BYTE *, uint64_t, uint64_t))v13 + 1))(v76, v14, i);
        v14 += 256;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid length %zu for bitdepth %d, expected %d\n", v15, v16 | 8, v17);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v79 = v15;
      LOWORD(v80) = 1024;
      *(_DWORD *)((char *)&v80 + 2) = ((unsigned __int16)v77 >> 13) | 8;
      HIWORD(v80) = 1024;
      LODWORD(v81) = v17;
      _os_log_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid length %zu for bitdepth %d, expected %d", buf, 0x18u);
    }
  }
  (*((void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(-[MTLBuffer contents](self->_offsets, "contents"), self->_offsetsStride, ((a4->var4.var0 + 31) >> 5), ((a4->var4.var1 + 31) >> 5), *(_DWORD *)a4->var1);
  v24 = a4->var1;
  v25 = a4->var4.var3 - 8;
  v26 = (256 << (LOBYTE(a4->var4.var3) - 8)) - 1;
  *(_DWORD *)buf = 0;
  LODWORD(v79) = v26;
  HIDWORD(v79) = v26;
  if (*((_DWORD *)v24 + 54))
  {
    *(_DWORD *)buf = 16 << v25;
    LODWORD(v79) = 235 << v25;
    if (*((_DWORD *)a4->var0 + 6))
      v27 = 240 << v25;
    else
      v27 = 235 << v25;
    HIDWORD(v79) = v27;
  }
  v28 = *((_DWORD *)v24 + 53);
  LODWORD(v80) = *((_DWORD *)v24 + 22);
  HIDWORD(v80) = v28;
  v81 = *(_QWORD *)((char *)v24 + 36);
  v82 = *((_DWORD *)v24 + 11);
  v83 = vextq_s8(*(int8x16_t *)((char *)v24 + 188), *(int8x16_t *)((char *)v24 + 188), 8uLL);
  v84 = vshl_u32(*(uint32x2_t *)((char *)v24 + 204), (uint32x2_t)vdup_n_s32(v25));
  if (*((int *)var1 + 10) > 0 || *((int *)var1 + 11) > 0)
    goto LABEL_24;
  if (!*((_DWORD *)var1 + 9))
  {
    v29 = 0;
    goto LABEL_25;
  }
  if (*((_DWORD *)var1 + 54))
LABEL_24:
    v29 = 1;
  else
    v29 = *((_DWORD *)var1 + 1) != 0;
LABEL_25:
  gpuBitdepth = self->_gpuBitdepth;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (*((_DWORD *)var1 + 1))
    v32 = 1;
  else
    v32 = v29;
  if (v32 == 1)
  {
    objc_msgSend(v30, "blitCommandEncoder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (*((_DWORD *)var1 + 1))
    {
      v72 = vdupq_n_s64(0x40uLL);
      v73 = 1;
      grainPatch = self->_grainPatch;
      grainTextureY = self->_grainTextureY;
      memset(v71, 0, sizeof(v71));
      objc_msgSend(v33, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", grainPatch, 0, 128, 0x2000, &v72, grainTextureY, 0, 0, v71);
    }
    if (v29)
    {
      v37 = self->_grainPatch;
      v69 = vdupq_n_s64(0x40uLL);
      v70 = 1;
      grainTextureUV = self->_grainTextureUV;
      memset(v68, 0, sizeof(v68));
      objc_msgSend(v34, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v37, 0x2000, 256, 0x4000, &v69, grainTextureUV, 0, 0, v68);
    }
    objc_msgSend(v34, "endEncoding");

  }
  objc_msgSend(v31, "computeCommandEncoder");
  v39 = v55;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", *v55, 0, a4->var4.var3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)var1 + 1))
  {
    -[VCPAV1Metal dstTexture:forPlane:bitdepth:](self, "dstTexture:forPlane:bitdepth:", a5, 0, a4->var4.var3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "width");
    v44 = objc_msgSend(v42, "height");
    objc_msgSend(v40, "setComputePipelineState:", self->_filmGrainLuma);
    objc_msgSend(v40, "setTexture:atIndex:", v42, 0);
    objc_msgSend(v40, "setTexture:atIndex:", v41, 1);
    objc_msgSend(v40, "setTexture:atIndex:", self->_offsetsTex, 2);
    objc_msgSend(v40, "setTexture:atIndex:", self->_grainTextureY, 3);
    objc_msgSend(v40, "setBytes:length:atIndex:", buf, 56, 0);
    objc_msgSend(v40, "setBuffer:offset:atIndex:", self->_scalingLUT, 0, 1);
    if (self->_supportsNonUniformThreadgroup)
    {
      v67[0] = v43;
      v67[1] = v44;
      v67[2] = 1;
      v65 = vdupq_n_s64(0x10uLL);
      v66 = 1;
      objc_msgSend(v40, "dispatchThreads:threadsPerThreadgroup:", v67, &v65);
    }
    else
    {
      v64[0] = (unint64_t)(v43 + 15) >> 4;
      v64[1] = (unint64_t)(v44 + 15) >> 4;
      v64[2] = 1;
      v62 = vdupq_n_s64(0x10uLL);
      v63 = 1;
      objc_msgSend(v40, "dispatchThreadgroups:threadsPerThreadgroup:", v64, &v62);
    }

    v39 = v55;
  }
  else
  {
    -[VCPAV1Metal encodeBlit:forPicture:toPixelBuffer:plane:](self, "encodeBlit:forPicture:toPixelBuffer:plane:", v40, a4, a5, 0);
  }
  if (a4->var4.var2)
  {
    if (v29)
    {
      -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", v39[1], 1, a4->var4.var3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPAV1Metal srcTexture:forPlane:bitdepth:](self, "srcTexture:forPlane:bitdepth:", v39[2], 2, a4->var4.var3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPAV1Metal dstTexture:forPlane:bitdepth:](self, "dstTexture:forPlane:bitdepth:", a5, 1, a4->var4.var3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "width");
      v49 = objc_msgSend(v47, "height");
      objc_msgSend(v40, "setComputePipelineState:", self->_filmGrainChroma);
      objc_msgSend(v40, "setTexture:atIndex:", v47, 0);
      objc_msgSend(v40, "setTexture:atIndex:", v41, 1);
      objc_msgSend(v40, "setTexture:atIndex:", self->_offsetsTex, 2);
      objc_msgSend(v40, "setTexture:atIndex:", self->_grainTextureUV, 3);
      objc_msgSend(v40, "setTexture:atIndex:", v45, 4);
      objc_msgSend(v40, "setTexture:atIndex:", v46, 5);
      objc_msgSend(v40, "setBytes:length:atIndex:", buf, 56, 0);
      objc_msgSend(v40, "setBuffer:offset:atIndex:", self->_scalingLUT, 256 << (gpuBitdepth - 8), 1);
      objc_msgSend(v40, "setBuffer:offset:atIndex:", self->_scalingLUT, 512 << (gpuBitdepth - 8), 2);
      if (self->_supportsNonUniformThreadgroup)
      {
        v61[0] = v48;
        v61[1] = v49;
        v61[2] = 1;
        v59 = vdupq_n_s64(0x10uLL);
        v60 = 1;
        objc_msgSend(v40, "dispatchThreads:threadsPerThreadgroup:", v61, &v59);
      }
      else
      {
        v58[0] = (unint64_t)(v48 + 15) >> 4;
        v58[1] = (unint64_t)(v49 + 15) >> 4;
        v58[2] = 1;
        v56 = vdupq_n_s64(0x10uLL);
        v57 = 1;
        objc_msgSend(v40, "dispatchThreadgroups:threadsPerThreadgroup:", v58, &v56);
      }

    }
    else
    {
      -[VCPAV1Metal encodeBlit:forPicture:toPixelBuffer:plane:](self, "encodeBlit:forPicture:toPixelBuffer:plane:", v40, a4, a5, 1);
    }
  }
  objc_msgSend(v40, "endEncoding");
  objc_msgSend(v31, "commit");
  objc_msgSend(v31, "waitUntilCompleted");
  objc_msgSend(v31, "error");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 == 0;

  if (v51)
  {
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v31, "error");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v74 = 138412290;
      v75 = v53;
      _os_log_error_impl(&dword_218B1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error %@ in metal execution", v74, 0xCu);

    }
    v11 = -12911;
  }

  return v11;
}

- (int)maximumTextureDimension
{
  return self->_maximumTextureDimension;
}

- (BOOL)broken444
{
  return self->_broken444;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_offsetsTex, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scalingLUT, 0);
  objc_storeStrong((id *)&self->_grainTextureUV, 0);
  objc_storeStrong((id *)&self->_grainTextureY, 0);
  objc_storeStrong((id *)&self->_grainPatch, 0);
  for (i = 0; i != -2; --i)
    sub_218B5AD58((const void **)&self->_textureCacheDst[i + 1].value_);
  for (j = 0; j != -2; --j)
    sub_218B5AD58((const void **)&self->_textureCacheSrc[j + 1].value_);
  objc_storeStrong((id *)&self->_filmGrainChroma, 0);
  objc_storeStrong((id *)&self->_filmGrainLuma, 0);
  objc_storeStrong((id *)&self->_blitKernelChroma, 0);
  objc_storeStrong((id *)&self->_blitKernelLuma, 0);
  objc_storeStrong((id *)&self->_blitKernelUnorm, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

@end
