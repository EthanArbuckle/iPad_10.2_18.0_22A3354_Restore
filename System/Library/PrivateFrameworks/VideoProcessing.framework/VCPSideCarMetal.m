@implementation VCPSideCarMetal

- (void)setPacketLayout:(id)a3
{
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  for (i = 0; objc_msgSend(v8, "count") > i; ++i)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ByteOffset"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BytesPerRow"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        self->_planeOffset[i] = objc_msgSend(v6, "unsignedIntValue");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        self->_planeBytesPerRow[i] = objc_msgSend(v7, "unsignedIntValue");

    }
  }

}

- (int)selectGPUForFrame:(__CVBuffer *)a3
{
  uint64_t RegistryID;
  MTLDevice *v5;
  id *p_device;
  MTLDevice *device;
  CVReturn v8;
  MTLComputePipelineState *transitionDetection;
  MTLComputePipelineState *transitionDetectionUnorm;
  MTLComputePipelineState *blitKernel;
  MTLComputePipelineState *deblockLumaH;
  MTLComputePipelineState *deblockChromaH;
  MTLDevice *v14;
  id v15;
  id v16;
  MTLCommandQueue *v17;
  MTLCommandQueue *commandQueue;
  MTLCommandQueue *v19;
  MTLCommandQueue *v20;
  NSObject *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *submissionQueue;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *completionQueue;
  char v26;
  NSObject *v27;
  const char *v28;
  char v29;
  void *v30;
  id v31;
  MTLLibrary *v32;
  id v33;
  MTLLibrary *library;
  MTLComputePipelineState *v35;
  MTLComputePipelineState *v36;
  NSDictionary *v37;
  NSDictionary *readAttributes;
  NSDictionary *v39;
  NSDictionary *writeAttributes;
  NSDictionary *v41;
  NSDictionary *readWriteAttributes;
  const __CFDictionary *v43;
  __CVMetalTextureCache *value;
  MTLDevice *v45;
  __CVMetalTextureCache *v46;
  MTLDevice *v47;
  __CVMetalTextureCache *v48;
  MTLDevice *v49;
  __CVMetalTextureCache *v50;
  CF<__CVMetalTextureCache *> *p_textureCacheRGBAChroma;
  __CVMetalTextureCache *v52;
  __CVMetalTextureCache *v53;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    p_device = (id *)&self->_device;
    device = self->_device;
    if (!device)
      goto LABEL_9;
    return 0;
  }
  CVPixelBufferGetIOSurface(a3);
  RegistryID = IOSurfaceGetRegistryID();
  p_device = (id *)&self->_device;
  v5 = self->_device;
  if (!v5)
  {
    device = 0;
    goto LABEL_9;
  }
  if (!RegistryID || -[MTLDevice registryID](v5, "registryID") == RegistryID)
    return 0;
  device = (MTLDevice *)*p_device;
LABEL_9:
  self->_device = 0;

  transitionDetection = self->_transitionDetection;
  self->_transitionDetection = 0;

  transitionDetectionUnorm = self->_transitionDetectionUnorm;
  self->_transitionDetectionUnorm = 0;

  blitKernel = self->_blitKernel;
  self->_blitKernel = 0;

  deblockLumaH = self->_deblockLumaH;
  self->_deblockLumaH = 0;

  deblockChromaH = self->_deblockChromaH;
  self->_deblockChromaH = 0;

  v14 = self->_device;
  if (!v14)
  {
    v15 = MTLCreateSystemDefaultDevice();
    v16 = *p_device;
    *p_device = v15;

    v14 = (MTLDevice *)*p_device;
    if (!*p_device)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Unable to get metal device\n";
        goto LABEL_50;
      }
      return -26525;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v65 = -[MTLDevice registryID](v14, "registryID");
    _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Initializing for GPU %llx", buf, 0xCu);
    v14 = (MTLDevice *)*p_device;
  }
  v17 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v14, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v17;

  v19 = self->_commandQueue;
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Unable to get command queue\n";
LABEL_50:
      _os_log_error_impl(&dword_1B676B000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
      return -26525;
    }
    return -26525;
  }
  v20 = v19;
  -[MTLCommandQueue setGPUPriority:](v20, "setGPUPriority:", 4);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VideoProcessing.VCPSideCarMetal.submission", v21);
  submissionQueue = self->_submissionQueue;
  self->_submissionQueue = v22;

  v24 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VideoProcessing.VCPSideCarMetal.completion", v21);
  completionQueue = self->_completionQueue;
  self->_completionQueue = v24;

  -[MTLCommandQueue setSubmissionQueue:](v20, "setSubmissionQueue:", self->_submissionQueue);
  -[MTLCommandQueue setCompletionQueue:](v20, "setCompletionQueue:", self->_completionQueue);
  if ((objc_msgSend(*p_device, "supportsFamily:", 2001) & 1) != 0)
    v26 = 1;
  else
    v26 = objc_msgSend(*p_device, "supportsFamily:", 1006);
  self->_supportsSIMDPermute = v26;
  if ((-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0
    || (objc_msgSend(*p_device, "supportsFamily:", 1004) & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    v29 = objc_msgSend(*p_device, "supportsFamily:", 3003);
  }
  self->_supportsQuadPermute = v29;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *p_device;
  v55 = 0;
  v32 = (MTLLibrary *)objc_msgSend(v31, "newDefaultLibraryWithBundle:error:", v30, &v55);
  v33 = v55;
  library = self->_library;
  self->_library = v32;

  if (self->_library)
  {
    -[VCPSideCarMetal compileFunction:](self, "compileFunction:", CFSTR("BlitKernel"));
    v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v36 = self->_blitKernel;
    self->_blitKernel = v35;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v65 = (uint64_t)v30;
    v66 = 2112;
    v67 = v33;
    _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
  }
  sub_1B6781368((uint64_t)&self->_packetPool, self->_device);
  sub_1B6781368((uint64_t)&self->_blockDist, self->_device);
  if (!self->_readAttributes)
  {
    v62 = *MEMORY[0x1E0CA8F58];
    v63 = &unk_1E6A1D310;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    readAttributes = self->_readAttributes;
    self->_readAttributes = v37;

  }
  if (!self->_writeAttributes)
  {
    v60 = *MEMORY[0x1E0CA8F58];
    v61 = &unk_1E6A1D328;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    writeAttributes = self->_writeAttributes;
    self->_writeAttributes = v39;

  }
  if (!self->_readWriteAttributes)
  {
    v58 = *MEMORY[0x1E0CA8F58];
    v59 = &unk_1E6A1D340;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    readWriteAttributes = self->_readWriteAttributes;
    self->_readWriteAttributes = v41;

  }
  v56 = *MEMORY[0x1E0CA8F48];
  v57 = &unk_1E6A1D358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  value = self->_textureCacheLuma.value_;
  v45 = self->_device;
  if (value)
  {
    CFRelease(value);
    self->_textureCacheLuma.value_ = 0;
  }
  v8 = CVMetalTextureCacheCreate(0, v43, v45, 0, &self->_textureCacheLuma.value_);
  if (!v8)
  {
    v46 = self->_textureCacheChroma.value_;
    v47 = self->_device;
    if (v46)
    {
      CFRelease(v46);
      self->_textureCacheChroma.value_ = 0;
    }
    v8 = CVMetalTextureCacheCreate(0, v43, v47, 0, &self->_textureCacheChroma.value_);
    if (!v8)
    {
      v48 = self->_textureCacheRGBALuma.value_;
      v49 = self->_device;
      if (v48)
      {
        CFRelease(v48);
        self->_textureCacheRGBALuma.value_ = 0;
      }
      v8 = CVMetalTextureCacheCreate(0, v43, v49, 0, &self->_textureCacheRGBALuma.value_);
      if (!v8)
      {
        v52 = self->_textureCacheRGBAChroma.value_;
        p_textureCacheRGBAChroma = &self->_textureCacheRGBAChroma;
        v50 = v52;
        v53 = p_textureCacheRGBAChroma[-13].value_;
        if (v52)
        {
          CFRelease(v50);
          p_textureCacheRGBAChroma->value_ = 0;
        }
        v8 = CVMetalTextureCacheCreate(0, v43, v53, 0, &p_textureCacheRGBAChroma->value_);
      }
    }
  }

  return v8;
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

LABEL_13:
        goto LABEL_14;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unalbe to find kernel %@", buf, 0xCu);
    }
    v12 = 0;
    v13 = v10;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)compileFunction:(id)a3
{
  -[VCPSideCarMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)compileTransitionDetection
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *transitionDetection;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *transitionDetectionUnorm;
  MTLComputePipelineState *v7;

  if (!self->_transitionDetection)
  {
    if (self->_supportsSIMDPermute)
    {
      -[VCPSideCarMetal compileFunction:](self, "compileFunction:", CFSTR("TransitionDetectionSIMD"));
      v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      transitionDetection = self->_transitionDetection;
      self->_transitionDetection = v3;

      -[VCPSideCarMetal compileFunction:](self, "compileFunction:", CFSTR("TransitionDetectionUnorm"));
      v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      transitionDetectionUnorm = self->_transitionDetectionUnorm;
      self->_transitionDetectionUnorm = v5;
    }
    else
    {
      if (!self->_supportsQuadPermute)
        return;
      -[VCPSideCarMetal compileFunction:](self, "compileFunction:", CFSTR("TransitionDetectionQuad"));
      v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      transitionDetectionUnorm = self->_transitionDetection;
      self->_transitionDetection = v7;
    }

  }
}

- (void)compileDeblockForFrame:(__CVBuffer *)a3
{
  OSType PixelFormatType;
  int v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *deblockLumaH;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *deblockChromaH;
  int v13;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v5 = sub_1B67C37F4(PixelFormatType);
  v13 = v5;
  if ((!self->_deblockLumaH || !self->_deblockChromaH || self->_deblockBitdepth != v5) && self->_supportsQuadPermute)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setConstantValue:type:atIndex:", &v13, 33, 0);
    if (v13 == 8)
    {
      -[VCPSideCarMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("SubframeDeblockLumaH_Uint"), v6);
      v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      deblockLumaH = self->_deblockLumaH;
      self->_deblockLumaH = v7;

      -[VCPSideCarMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("SubframeDeblockChromaH_Uint"), v6);
    }
    else
    {
      -[VCPSideCarMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("SubframeDeblockLumaH_Unorm"), v6);
      v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v11 = self->_deblockLumaH;
      self->_deblockLumaH = v10;

      -[VCPSideCarMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("SubframeDeblockChromaH_Unorm"), v6);
    }
    v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    deblockChromaH = self->_deblockChromaH;
    self->_deblockChromaH = v9;

    self->_deblockBitdepth = v13;
  }
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
  v14 = 96;
  if (!a4)
    v14 = 88;
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
  v13 = 96;
  if (!a4)
    v13 = 88;
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

- (id)rgbaUnormTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4
{
  const __CFDictionary *v6;
  OSType PixelFormatType;
  MTLPixelFormat v8;
  __CVMetalTextureCache *value;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v12;
  CFTypeRef cf;

  v6 = (const __CFDictionary *)a4;
  cf = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1B67C37F4(PixelFormatType) == 10)
    v8 = MTLPixelFormatRGBA16Unorm;
  else
    v8 = MTLPixelFormatRGBA8Unorm;
  value = self->_textureCacheRGBALuma.value_;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, WidthOfPlane >> 2, HeightOfPlane, 0, (CVMetalTextureRef *)&cf))
  {
    v12 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v12;
}

- (id)rgbaUintTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4
{
  const __CFDictionary *v6;
  OSType PixelFormatType;
  MTLPixelFormat v8;
  __CVMetalTextureCache *value;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v12;
  CFTypeRef cf;

  v6 = (const __CFDictionary *)a4;
  cf = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1B67C37F4(PixelFormatType) == 10)
    v8 = MTLPixelFormatRGBA16Uint;
  else
    v8 = MTLPixelFormatRGBA8Uint;
  value = self->_textureCacheRGBALuma.value_;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, WidthOfPlane >> 2, HeightOfPlane, 0, (CVMetalTextureRef *)&cf))
  {
    v12 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v12;
}

- (id)rgbaUintTextureForChroma:(__CVBuffer *)a3 withAttributes:(id)a4
{
  const __CFDictionary *v6;
  OSType PixelFormatType;
  MTLPixelFormat v8;
  __CVMetalTextureCache *value;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v12;
  CFTypeRef cf;

  v6 = (const __CFDictionary *)a4;
  cf = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1B67C37F4(PixelFormatType) == 10)
    v8 = MTLPixelFormatRGBA16Uint;
  else
    v8 = MTLPixelFormatRGBA8Uint;
  value = self->_textureCacheRGBAChroma.value_;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, (WidthOfPlane >> 1) & 0x3FFFFFFFFFFFFFFFLL, HeightOfPlane, 1uLL, (CVMetalTextureRef *)&cf))
  {
    v12 = 0;
  }
  else
  {
    CVMetalTextureGetTexture((CVMetalTextureRef)cf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_1B6773B7C(&cf);

  return v12;
}

- (future<unsigned)temporalTransitionScore:(__CVBuffer *)a3 previousFrame:(__CVBuffer *)a4 forRegion:(id *)a5
{
  uint64_t *v5;
  uint64_t *v10;
  future<unsigned long long> v11;
  unint64_t var1;
  unint64_t var0;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  NSMutableArray *pool;
  size_t Width;
  size_t Height;
  unint64_t v20;
  unint64_t v21;
  OSType PixelFormatType;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  CFTypeRef v32;
  uint64_t v33;
  unint64_t *v34;
  __int128 v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  const void *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  _QWORD v48[3];
  CFTypeRef cf;
  int v50;
  id v51;
  const void *v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _DWORD v58[4];
  uint64_t v59;

  v10 = v5;
  v59 = *MEMORY[0x1E0C80C00];
  v11.var0 = (void *)-[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (LODWORD(v11.var0))
    goto LABEL_2;
  -[VCPSideCarMetal compileTransitionDetection](self, "compileTransitionDetection");
  var0 = a5->var1.var0;
  var1 = a5->var1.var1;
  v11.var0 = (void *)CVPixelBufferGetPixelFormatType(a3);
  if (!self->_transitionDetection)
    goto LABEL_2;
  v14 = (LODWORD(v11.var0) - 645424688) & 0xFFFFEFFB;
  if (!v14)
  {
    if (self->_transitionDetectionUnorm)
    {
      v15 = 32;
      goto LABEL_8;
    }
LABEL_2:
    *v10 = 0;
    return v11;
  }
  v15 = 16;
LABEL_8:
  v37 = v15;
  CVPixelBufferGetWidthOfPlane(a3, 0);
  CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  CVPixelBufferGetHeightOfPlane(a3, 0);
  CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  v16 = (((var0 + 127) >> 5) & 0x7FFFFFFFFFFFFFCLL) * ((var1 + 127) >> 7);
  if (self->_blockDist.allocSize_ < v16)
  {
    pool = self->_blockDist.pool_;
    self->_blockDist.pool_ = 0;

    self->_blockDist.allocSize_ = v16;
  }
  Width = CVPixelBufferGetWidth(a3);
  if (Width - a5->var0.var0 < var0)
    var0 = Width - a5->var0.var0;
  Height = CVPixelBufferGetHeight(a3);
  v20 = a5->var0.var1;
  v21 = Height - v20;
  if (Height - v20 >= var1)
    v21 = var1;
  v58[0] = a5->var0.var0;
  v58[1] = v20;
  v38 = v21;
  v39 = var0;
  v58[2] = var0;
  v58[3] = v21;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v50 = sub_1B67C37F4(PixelFormatType);
  cf = 0;
  sub_1B67802CC((uint64_t)&self->_blockDist, &cf);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[VCPSideCarMetal rgbaUintTextureForLuma:withAttributes:](self, "rgbaUintTextureForLuma:withAttributes:", a3, self->_readAttributes);
    v23 = objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal rgbaUintTextureForLuma:withAttributes:](self, "rgbaUintTextureForLuma:withAttributes:", a4, self->_readAttributes);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal rgbaUintTextureForChroma:withAttributes:](self, "rgbaUintTextureForChroma:withAttributes:", a3, self->_readAttributes);
    v25 = objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal rgbaUintTextureForChroma:withAttributes:](self, "rgbaUintTextureForChroma:withAttributes:", a4, self->_readAttributes);
  }
  else
  {
    -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
    v23 = objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 0, self->_readAttributes);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 1, self->_readAttributes);
    v25 = objc_claimAutoreleasedReturnValue();
    -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 1, self->_readAttributes);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v25;
  v41 = (void *)v23;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLabel:", CFSTR("SideCar transition detection"));
  objc_msgSend(v27, "computeCommandEncoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = 40;
  if (!v14)
    v30 = 48;
  objc_msgSend(v28, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v30));
  objc_msgSend(v29, "setTexture:atIndex:", v23, 0);
  objc_msgSend(v29, "setTexture:atIndex:", v24, 1);
  objc_msgSend(v29, "setTexture:atIndex:", v25, 2);
  objc_msgSend(v29, "setTexture:atIndex:", v26, 3);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", v40, 0, 0);
  objc_msgSend(v29, "setBytes:length:atIndex:", v58, 16, 1);
  objc_msgSend(v29, "setBytes:length:atIndex:", &v50, 4, 2);
  v48[0] = (v39 + 127) >> 7;
  v48[1] = (v38 + 127) >> 7;
  v48[2] = 1;
  v46 = v37;
  v47 = xmmword_1B6917440;
  objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", v48, &v46);
  objc_msgSend(v29, "endEncoding");
  objc_msgSend(v27, "commit");
  v31 = v27;
  v32 = cf;
  if (cf)
    CFRetain(cf);
  *(_QWORD *)&v44 = (v39 + 127) >> 7;
  *((_QWORD *)&v44 + 1) = (v38 + 127) >> 7;
  v45 = 1;
  v43 = 0;
  v53 = v44;
  v54 = 1;
  *(_QWORD *)&v55 = v31;
  *((_QWORD *)&v55 + 1) = v32;
  v51 = 0;
  v52 = 0;
  v56 = v44;
  v57 = 1;
  v33 = operator new();
  *(_QWORD *)(v33 + 8) = 0;
  v34 = (unint64_t *)(v33 + 8);
  *(_QWORD *)(v33 + 16) = 0;
  *(_QWORD *)(v33 + 24) = 850045863;
  *(_OWORD *)(v33 + 32) = 0u;
  *(_OWORD *)(v33 + 48) = 0u;
  *(_OWORD *)(v33 + 64) = 0u;
  *(_QWORD *)(v33 + 80) = 0;
  *(_QWORD *)(v33 + 88) = 1018212795;
  *(_OWORD *)(v33 + 96) = 0u;
  *(_OWORD *)(v33 + 112) = 0u;
  *(_QWORD *)(v33 + 128) = 0;
  *(_QWORD *)v33 = &off_1E6A15F28;
  *(_OWORD *)(v33 + 152) = v55;
  v55 = 0uLL;
  v35 = v56;
  *(_QWORD *)(v33 + 184) = v57;
  *(_OWORD *)(v33 + 168) = v35;
  *(_DWORD *)(v33 + 136) = 8;
  *v10 = v33;
  sub_1B67804AC(v33);
  do
    v36 = __ldaxr(v34);
  while (__stlxr(v36 - 1, v34));
  if (!v36)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 16))(v33);
  sub_1B67704D8((const void **)&v55 + 1);

  sub_1B67704D8(&v52);
  sub_1B67704D8(&v43);

  return (future<unsigned long long>)sub_1B67704D8(&cf);
}

- (int)subframeDeblock:(__CVBuffer *)a3 withOffsetsY:(unsigned int *)a4 numEdges:(int)a5
{
  int result;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t v12;
  OSType PixelFormatType;
  int v14;
  NSDictionary *readWriteAttributes;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int *v19;
  void *v20;
  void *v21;
  size_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  int v29;
  _DWORD v30[3];

  result = -[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (!result)
  {
    if (a5)
    {
      v29 = 13;
      v30[0] = 52;
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      v22 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      v12 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      -[VCPSideCarMetal compileDeblockForFrame:](self, "compileDeblockForFrame:", a3);
      if (!self->_deblockLumaH || !self->_deblockChromaH)
        return -12910;
      v14 = sub_1B67C37F4(PixelFormatType);
      readWriteAttributes = self->_readWriteAttributes;
      if (v14 == 8)
      {
        -[VCPSideCarMetal uintTexture:forPlane:withAttributes:](self, "uintTexture:forPlane:withAttributes:", a3, 0, readWriteAttributes);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPSideCarMetal uintTexture:forPlane:withAttributes:](self, "uintTexture:forPlane:withAttributes:", a3, 1, self->_readWriteAttributes);
      }
      else
      {
        -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, readWriteAttributes);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 1, self->_readWriteAttributes);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "computeCommandEncoder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLabel:", CFSTR("Subframe deblock"));
      objc_msgSend(v17, "setComputePipelineState:", self->_deblockLumaH);
      objc_msgSend(v17, "setTexture:atIndex:", v21, 0);
      objc_msgSend(v17, "setBytes:length:atIndex:", v30, 4, 0);
      objc_msgSend(v17, "setBytes:length:atIndex:", &v29, 4, 1);
      objc_msgSend(v17, "setBytes:length:atIndex:", a4, 4 * a5, 2);
      v28[0] = (WidthOfPlane + 31) >> 5;
      v28[1] = a5;
      v28[2] = 1;
      v26 = xmmword_1B6917440;
      v27 = 1;
      objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v28, &v26);
      if (v12 < HeightOfPlane && a5 >= 1)
      {
        v18 = a5;
        v19 = a4;
        do
        {
          *v19++ >>= 1;
          --v18;
        }
        while (v18);
      }
      objc_msgSend(v17, "setComputePipelineState:", self->_deblockChromaH);
      objc_msgSend(v17, "setTexture:atIndex:", v20, 0);
      objc_msgSend(v17, "setBytes:length:atIndex:", v30, 4, 0);
      objc_msgSend(v17, "setBytes:length:atIndex:", &v29, 4, 1);
      objc_msgSend(v17, "setBytes:length:atIndex:", a4, 4 * a5, 2);
      v25[0] = (v22 + 31) >> 5;
      v25[1] = a5;
      v25[2] = 1;
      v23 = xmmword_1B6917440;
      v24 = 1;
      objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
      objc_msgSend(v17, "endEncoding");
      objc_msgSend(v16, "commit");
      objc_msgSend(v16, "waitUntilCompleted");

    }
    return 0;
  }
  return result;
}

- (int)copyFromFrame:(__CVBuffer *)a3 toTile:(__CVBuffer *)a4 origin:(id *)a5 size:(id *)a6 withFence:(void *)a7
{
  int v13;
  size_t var0;
  size_t var1;
  unint64_t v16;
  unint64_t v17;
  size_t WidthOfPlane;
  char v19;
  size_t HeightOfPlane;
  char v21;
  unint64_t v22;
  uint64_t v23;
  OSType PixelFormatType;
  OSType v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  std::__assoc_sub_state *state;
  std::__assoc_sub_state *v32;
  uint64_t i;
  uint64_t j;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  __int128 v46;
  unint64_t v47;
  __int128 v48;
  unint64_t var2;
  int64x2_t v50;
  uint64_t v51;
  _QWORD v52[3];
  int64x2_t v53;
  uint64_t v54;
  __int128 v55;
  unint64_t v56;
  std::future<void> v57;
  std::future<void> v58;
  _DWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  uint8_t buf[8];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v13 = -[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (v13)
    return v13;
  var0 = a5->var0;
  if (var0 <= CVPixelBufferGetWidth(a3))
  {
    var1 = a5->var1;
    if (var1 <= CVPixelBufferGetHeight(a3))
    {
      v16 = (int)CVPixelBufferGetWidth(a3) - a5->var0;
      if (v16 >= a6->var0)
        v16 = a6->var0;
      a6->var0 = v16;
      v17 = (int)CVPixelBufferGetHeight(a3) - a5->var1;
      if (v17 >= a6->var1)
        v17 = a6->var1;
      a6->var1 = v17;
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      v19 = WidthOfPlane > CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      v21 = HeightOfPlane > CVPixelBufferGetHeightOfPlane(a3, 1uLL);
      v22 = a6->var0;
      v39 = a5->var0;
      v40 = a6->var1;
      v38 = a5->var1;
      *(_QWORD *)buf = 0;
      v63 = 0;
      v60 = 0;
      v61 = 0;
      -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 0, self->_writeAttributes);
      *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();

      -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
      v60 = objc_claimAutoreleasedReturnValue();

      -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 1, self->_writeAttributes);
      v63 = objc_claimAutoreleasedReturnValue();

      -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 1, self->_readAttributes);
      v23 = objc_claimAutoreleasedReturnValue();
      v61 = v23;

      if (!*(_QWORD *)buf || !v60 || !v63 || !v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v58.__state_) = 0;
          _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get textures\n", (uint8_t *)&v58, 2u);
        }
        v13 = -26525;
        goto LABEL_34;
      }
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      v25 = CVPixelBufferGetPixelFormatType(a4);
      v36 = v22 >> v19;
      v26 = v40 >> v21;
      v27 = v39 >> v19;
      v28 = v38 >> v21;
      if (((PixelFormatType - 645424688) & 0xFFFFEFFB) != 0 && ((v25 - 645424688) & 0xFFFFEFFB) != 0)
      {
        objc_msgSend(v37, "blitCommandEncoder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(_OWORD *)&a5->var0;
        var2 = a5->var2;
        v46 = *(_OWORD *)&a6->var0;
        v47 = a6->var2;
        memset(v45, 0, sizeof(v45));
        objc_msgSend(v29, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v60, 0, 0, &v48, &v46, *(_QWORD *)buf, 0, 0, v45);
        v44[0] = v27;
        v44[1] = v28;
        v44[2] = 0;
        v43[0] = v36;
        v43[1] = v26;
        v43[2] = 1;
        memset(v42, 0, sizeof(v42));
        objc_msgSend(v29, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v61, 0, 0, v44, v43, v63, 0, 0, v42);
        objc_msgSend(v29, "endEncoding");
        v30 = v37;
      }
      else
      {
        if (PixelFormatType != v25)
        {
          v30 = v37;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(v58.__state_) = 0;
            _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Compressed Blit needs same src and dst pixfmt", (uint8_t *)&v58, 2u);
          }
          v13 = -50;
          goto LABEL_33;
        }
        v30 = v37;
        objc_msgSend(v37, "computeCommandEncoder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v58.__state_ = (std::__assoc_sub_state *)vmovn_s64(*(int64x2_t *)&a5->var0);
        v59[0] = v27;
        v59[1] = v28;
        v57.__state_ = 0;
        objc_msgSend(v29, "setComputePipelineState:", self->_blitKernel);
        objc_msgSend(v29, "setTexture:atIndex:", v60, 0);
        objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)buf, 1);
        objc_msgSend(v29, "setBytes:length:atIndex:", &v58, 8, 0);
        objc_msgSend(v29, "setBytes:length:atIndex:", &v57, 8, 1);
        v55 = *(_OWORD *)&a6->var0;
        v56 = a6->var2;
        v53 = vdupq_n_s64(0x10uLL);
        v54 = 1;
        objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", &v55, &v53);
        objc_msgSend(v29, "setTexture:atIndex:", v61, 0);
        objc_msgSend(v29, "setTexture:atIndex:", v63, 1);
        objc_msgSend(v29, "setBytes:length:atIndex:", v59, 8, 0);
        objc_msgSend(v29, "setBytes:length:atIndex:", &v57, 8, 1);
        v52[0] = v36;
        v52[1] = v26;
        v52[2] = 1;
        v50 = vdupq_n_s64(0x10uLL);
        v51 = 1;
        objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", v52, &v50);
        objc_msgSend(v29, "endEncoding");
      }

      if (qword_1EDBB4CB8 != -1)
        dispatch_once_f(&qword_1EDBB4CB8, 0, (dispatch_function_t)sub_1B67ED9E8);
      if (dword_1EDBB4CC4 == 255)
      {
        objc_msgSend(v30, "commit");
        objc_msgSend(v30, "waitUntilCompleted");
      }
      else if ((objc_msgSend(v30, "commitAndWaitUntilSubmitted") & 1) == 0)
      {
        v41 = v30;
        sub_1B6780E98(&v57, (uint64_t *)&v41);
        state = v57.__state_;
        v32 = *(std::__assoc_sub_state **)a7;
        v57.__state_ = 0;
        v58.__state_ = v32;
        *(_QWORD *)a7 = state;
        std::future<void>::~future(&v58);
        std::future<void>::~future(&v57);

      }
      v13 = 0;
LABEL_33:

LABEL_34:
      for (i = 8; i != -8; i -= 8)

      for (j = 8; j != -8; j -= 8)
      return v13;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Offset is outside frame dimensions", buf, 2u);
  }
  return -50;
}

- (int)copySubframe:(__CVBuffer *)a3 toFrame:(__CVBuffer *)a4 atOffset:(id *)a5
{
  int result;
  OSType PixelFormatType;
  OSType v11;
  size_t v12;
  _BOOL4 v14;
  char v15;
  char v16;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t var0;
  uint64_t v26;
  char v27;
  char v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  char v35;
  char v36;
  char *v37;
  uint64_t i;
  uint64_t j;
  _BOOL4 v40;
  int64x2_t *v41;
  int64x2_t v42;
  int64x2_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  __int128 v48;
  uint64_t v49;
  _QWORD v50[3];
  int64x2_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  _QWORD v55[3];
  uint64_t v56;
  int32x2_t v57;
  int v58;
  int v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  result = -[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:", a4);
  if (!result)
  {
    if (self->_supportsQuadPermute)
    {
      v41 = (int64x2_t *)a5;
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      v11 = CVPixelBufferGetPixelFormatType(a4);
      v12 = 0;
      v14 = ((v11 - 641230384) & 0xFFBFEFFB) != 0 && PixelFormatType == v11;
      v40 = v14;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v15 = 1;
      do
      {
        v16 = v15;
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v12);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v12);
        v19 = (size_t *)&v60 + 3 * v12;
        *v19 = WidthOfPlane;
        v19[1] = HeightOfPlane;
        v19[2] = 1;
        -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, v12, self->_readAttributes);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)*(&v66 + v12);
        *(&v66 + v12) = v20;

        -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, v12, self->_writeAttributes);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)*(&v64 + v12);
        *(&v64 + v12) = v22;

        v15 = 0;
        v12 = 1;
      }
      while ((v16 & 1) != 0);
      var0 = a5->var0;
      v24 = v41->u64[1];
      v26 = v41[1].i64[0];
      v27 = (unint64_t)v60 > (unint64_t)v62;
      v28 = *((_QWORD *)&v60 + 1) > *((_QWORD *)&v62 + 1);
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = var0 >> v27;
      v32 = v24 >> v28;
      if (v40)
      {
        objc_msgSend(v29, "blitCommandEncoder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v55, 0, sizeof(v55));
        v53 = v60;
        v54 = v61;
        v51 = *v41;
        v52 = v41[1].i64[0];
        objc_msgSend(v33, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v66, 0, 0, v55, &v53, v64, 0, 0, &v51);
        v48 = v62;
        v49 = v63;
        memset(v50, 0, sizeof(v50));
        v47[0] = v31;
        v47[1] = v32;
        v47[2] = v26;
        objc_msgSend(v33, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v67, 0, 0, v50, &v48, v65, 0, 0, v47);
        objc_msgSend(v33, "endEncoding");
      }
      else
      {
        objc_msgSend(v29, "computeCommandEncoder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = vmovn_s64(*v41);
        v58 = v31;
        v59 = v32;
        v56 = 0;
        objc_msgSend(v33, "setComputePipelineState:", self->_blitKernel);
        v34 = 0;
        v42 = vdupq_n_s64(0x10uLL);
        v35 = 1;
        do
        {
          v36 = v35;
          objc_msgSend(v33, "setTexture:atIndex:", *(&v66 + v34), 0);
          objc_msgSend(v33, "setTexture:atIndex:", *(&v64 + v34), 1);
          objc_msgSend(v33, "setBytes:length:atIndex:", &v56, 8, 0);
          objc_msgSend(v33, "setBytes:length:atIndex:", &v57 + v34, 8, 1);
          v37 = (char *)&v60 + 24 * v34;
          v45 = *(_OWORD *)v37;
          v46 = *((_QWORD *)v37 + 2);
          v43 = v42;
          v44 = 1;
          objc_msgSend(v33, "dispatchThreads:threadsPerThreadgroup:", &v45, &v43);
          v35 = 0;
          v34 = 1;
        }
        while ((v36 & 1) != 0);
        objc_msgSend(v33, "endEncoding");
      }

      if ((objc_msgSend(v30, "commitAndWaitUntilSubmitted") & 1) == 0)
        objc_msgSend(v30, "waitUntilScheduled");

      for (i = 8; i != -8; i -= 8)
      for (j = 8; j != -8; j -= 8)

      return 0;
    }
    else
    {
      return -12910;
    }
  }
  return result;
}

- (future<CF<const)createEncodePacket:(__CVBuffer *)a3 forRegion:(id *)a4 instance:(unsigned int)a5 sequenceNumber:(unsigned int)a6 frameIndex:(unsigned int)a7 pts:(id *)a8 duration:(id *)a9 frameProperties:(__CFDictionary *)cf
{
  uint64_t *v10;
  uint64_t *v18;
  future<CF<const __CFData *>> v19;
  void *PlaneCount;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  size_t var0;
  size_t var1;
  size_t HeightOfPlane;
  MetalBufferPool *p_packetPool;
  unint64_t v28;
  NSMutableArray *pool;
  unint64_t v30;
  unint64_t v31;
  size_t v32;
  int v33;
  char *v34;
  int BytesPerRowOfPlane;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  CFTypeRef v43;
  id v44;
  VCPSideCarMetal *v45;
  __int128 v46;
  id v47;
  __int128 v48;
  id v49;
  uint64_t v50;
  void *v51;
  unint64_t *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t i;
  unsigned int v63;
  unsigned int v64;
  unint64_t v65;
  char v66;
  size_t v67;
  size_t WidthOfPlane;
  unint64_t v69;
  void *v70;
  unsigned int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[32];
  __int128 v79;
  __int128 v80;
  const void *v81;
  CFTypeRef v82;
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  __int128 v86;
  unint64_t var2;
  CFTypeRef v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  const void *v99;
  void *v100;
  void *v101;
  id buf[3];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;

  v18 = v10;
  v111 = *MEMORY[0x1E0C80C00];
  v19.var0 = (void *)-[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (LODWORD(v19.var0))
    goto LABEL_8;
  v71 = a5;
  PlaneCount = (void *)CVPixelBufferGetPlaneCount(a3);
  if ((unint64_t)PlaneCount >= 3)
  {
    v19.var0 = (void *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (LODWORD(v19.var0))
    {
      LODWORD(buf[0]) = 134217984;
      *(id *)((char *)buf + 4) = PlaneCount;
      v21 = MEMORY[0x1E0C81028];
      v22 = "%zu planes not supported";
      v23 = 12;
LABEL_38:
      _os_log_error_impl(&dword_1B676B000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)buf, v23);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  var0 = a4->var0.var0;
  if (var0 > CVPixelBufferGetWidth(a3) || (var1 = a4->var0.var1, var1 > CVPixelBufferGetHeight(a3)))
  {
    v19.var0 = (void *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (LODWORD(v19.var0))
    {
      LOWORD(buf[0]) = 0;
      v21 = MEMORY[0x1E0C81028];
      v22 = "Offset is outside frame dimensions";
      v23 = 2;
      goto LABEL_38;
    }
LABEL_8:
    *v18 = 0;
    return v19;
  }
  v64 = a6;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  v67 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v66 = HeightOfPlane > CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  p_packetPool = &self->_packetPool;
  v28 = self->_planeOffset[1] + (a4->var1.var1 >> v66) * self->_planeBytesPerRow[1];
  if (self->_packetPool.allocSize_ != v28)
  {
    pool = p_packetPool->pool_;
    p_packetPool->pool_ = 0;

  }
  self->_packetPool.allocSize_ = v28;
  v88 = 0;
  sub_1B67802CC((uint64_t)&self->_packetPool, &v88);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = a7;
  v30 = CVPixelBufferGetWidth(a3) - a4->var0.var0;
  if (v30 >= a4->var1.var0)
    v30 = a4->var1.var0;
  v69 = v30;
  v31 = CVPixelBufferGetHeight(a3) - a4->var0.var1;
  if (v31 >= a4->var1.var1)
    v31 = a4->var1.var1;
  v65 = v31;
  if (PlaneCount)
  {
    v32 = 0;
    v33 = 1024;
    do
    {
      v34 = (char *)self + 4 * v32;
      BytesPerRowOfPlane = *((_DWORD *)v34 + 60);
      if (!BytesPerRowOfPlane)
      {
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v32);
        *((_DWORD *)v34 + 60) = BytesPerRowOfPlane;
      }
      if (!*((_DWORD *)v34 + 56))
        *((_DWORD *)v34 + 56) = v33;
      v33 += BytesPerRowOfPlane * CVPixelBufferGetHeightOfPlane(a3, v32++);
    }
    while (PlaneCount != (void *)v32);
  }
  v101 = 0;
  v100 = 0;
  -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v100;
  v100 = (void *)v36;

  -[VCPSideCarMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 1, self->_readAttributes);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v101;
  v101 = (void *)v38;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "blitCommandEncoder");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = *(_OWORD *)&a4->var0.var0;
  var2 = a4->var0.var2;
  v85[0] = v69;
  v85[1] = v65;
  v85[2] = 1;
  objc_msgSend(v41, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v100, 0, 0, &v86, v85, v70, self->_planeOffset[0], self->_planeBytesPerRow[0], 0);
  v42 = a4->var0.var1 >> v66;
  v84[0] = a4->var0.var0 >> (WidthOfPlane > v67);
  v84[1] = v42;
  v84[2] = 0;
  v83[0] = v69 >> (WidthOfPlane > v67);
  v83[1] = v65 >> v66;
  v83[2] = 1;
  objc_msgSend(v41, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v101, 0, 0, v84, v83, v70, self->_planeOffset[1], self->_planeBytesPerRow[1], 0);
  objc_msgSend(v41, "endEncoding");
  objc_msgSend(v40, "commit");
  v82 = CVPixelBufferRetain(a3);
  v43 = CFRetain(cf);
  v81 = v43;
  v44 = v40;
  v74 = *(_OWORD *)&a4->var0.var0;
  *(_QWORD *)&v73 = __PAIR64__(v64, v71);
  DWORD2(v73) = v63;
  v75 = *(_OWORD *)&a4->var0.var2;
  v76 = *(_OWORD *)&a4->var1.var1;
  v77 = *(_OWORD *)&a8->var0;
  *(_QWORD *)v78 = a8->var3;
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v78[8] = *a9;
  *(_QWORD *)&v79 = v43;
  if (v43)
    CFRetain(v43);
  *((_QWORD *)&v79 + 1) = v82;
  if (v82)
    CFRetain(v82);
  v45 = self;
  *(_QWORD *)&v80 = v45;
  *((_QWORD *)&v80 + 1) = v88;
  if (v88)
  {
    CFRetain(v88);
    v46 = v80;
  }
  else
  {
    v46 = (unint64_t)v45;
  }
  v72 = v46;
  v93 = v76;
  v94 = v77;
  v95 = *(_OWORD *)v78;
  v96 = *(_OWORD *)&v78[16];
  v90 = v73;
  v91 = v74;
  v92 = v75;
  v47 = (id)v46;
  v105 = v76;
  v106 = v77;
  v107 = *(_OWORD *)v78;
  v108 = *(_OWORD *)&v78[16];
  *(_OWORD *)&buf[1] = v73;
  v103 = v74;
  *((_QWORD *)&v80 + 1) = 0;
  v98 = v47;
  v89 = 0;
  buf[0] = v44;
  v104 = v75;
  v48 = v79;
  v79 = 0u;
  v109 = v48;
  v97 = 0u;
  v49 = v47;
  v110 = v72;
  v99 = 0;
  v50 = operator new();
  *(_QWORD *)(v50 + 16) = 0;
  *(_QWORD *)(v50 + 24) = 850045863;
  *(_QWORD *)(v50 + 80) = 0;
  *(_QWORD *)(v50 + 88) = 1018212795;
  *(_QWORD *)v50 = &off_1E6A15E28;
  v51 = (void *)v110;
  *(id *)(v50 + 152) = buf[0];
  *(_QWORD *)(v50 + 8) = 0;
  v52 = (unint64_t *)(v50 + 8);
  *(_OWORD *)(v50 + 32) = 0u;
  *(_OWORD *)(v50 + 48) = 0u;
  *(_OWORD *)(v50 + 64) = 0u;
  *(_OWORD *)(v50 + 96) = 0u;
  *(_OWORD *)(v50 + 112) = 0u;
  *(_QWORD *)(v50 + 128) = 0;
  v53 = v103;
  *(_OWORD *)(v50 + 160) = *(_OWORD *)&buf[1];
  *(_OWORD *)(v50 + 176) = v53;
  v54 = v104;
  v55 = v105;
  v56 = v107;
  v57 = v108;
  *(_OWORD *)(v50 + 224) = v106;
  *(_OWORD *)(v50 + 240) = v56;
  *(_OWORD *)(v50 + 192) = v54;
  *(_OWORD *)(v50 + 208) = v55;
  v58 = v109;
  *(_OWORD *)(v50 + 256) = v57;
  *(_OWORD *)(v50 + 272) = v58;
  v109 = 0uLL;
  buf[0] = 0;
  v59 = v51;
  v60 = *((_QWORD *)&v110 + 1);
  *(_QWORD *)(v50 + 288) = v59;
  *(_QWORD *)(v50 + 296) = v60;
  *((_QWORD *)&v110 + 1) = 0;
  *(_DWORD *)(v50 + 136) = 8;
  *v18 = v50;
  sub_1B67804AC(v50);
  do
    v61 = __ldaxr(v52);
  while (__stlxr(v61 - 1, v52));
  if (!v61)
    (*(void (**)(uint64_t))(*(_QWORD *)v50 + 16))(v50);
  sub_1B67704D8((const void **)&v110 + 1);

  sub_1B6773B7C((const void **)&v109 + 1);
  sub_1B6770568((const void **)&v109);

  sub_1B67704D8(&v99);
  sub_1B6773B7C((const void **)&v97 + 1);
  sub_1B6770568((const void **)&v97);

  sub_1B67704D8((const void **)&v80 + 1);
  sub_1B6773B7C((const void **)&v79 + 1);
  sub_1B6770568((const void **)&v79);

  sub_1B6770568(&v81);
  sub_1B6773B7C(&v82);

  for (i = 8; i != -8; i -= 8)
  return (future<CF<const __CFData *>>)sub_1B67704D8(&v88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);

  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheRGBAChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheRGBALuma.value_);
  sub_1B677747C((const void **)&self->_textureCacheChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_deblockChromaH, 0);
  objc_storeStrong((id *)&self->_deblockLumaH, 0);
  objc_storeStrong((id *)&self->_blitKernel, 0);
  objc_storeStrong((id *)&self->_transitionDetectionUnorm, 0);
  objc_storeStrong((id *)&self->_transitionDetection, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  return self;
}

@end
