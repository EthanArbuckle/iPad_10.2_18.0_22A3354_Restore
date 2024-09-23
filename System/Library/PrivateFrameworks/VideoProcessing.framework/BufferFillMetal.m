@implementation BufferFillMetal

- (BufferFillMetal)init
{
  BufferFillMetal *v2;
  BufferFillMetal *v3;
  BufferFillMetal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BufferFillMetal;
  v2 = -[BufferFillMetal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BufferFillMetal initWithDevice:](v2, "initWithDevice:", 0);
    v4 = v3;
  }

  return v3;
}

- (BufferFillMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t RegistryID;
  MTLDevice *v5;
  MTLDevice **p_device;
  MTLDevice *device;
  BufferFillMetal *v8;
  MTLDevice *v9;
  MTLDevice *v10;
  MTLDevice *v11;
  MTLCommandQueue *v12;
  MTLCommandQueue *commandQueue;
  void *v14;
  void *v15;
  MTLDevice *v16;
  MTLLibrary *v17;
  id v18;
  MTLLibrary *library;
  NSDictionary *v20;
  NSDictionary *readWriteAttributes;
  __CVMetalTextureCache *value;
  MTLDevice *v23;
  __CVMetalTextureCache *v24;
  CF<__CVMetalTextureCache *> *p_textureCacheChroma;
  __CVMetalTextureCache *v26;
  __CVMetalTextureCache *v27;
  id v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
  *p_device = 0;

  v9 = *p_device;
  if (*p_device
    || (v10 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
        v11 = *p_device,
        *p_device = v10,
        v11,
        (v9 = *p_device) != 0))
  {
    v12 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v9, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v12;

    if (self->_commandQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLForResource:withExtension:", CFSTR("ProcessAccelerate"), CFSTR("metallib"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = *p_device;
        v29 = 0;
        v17 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](v16, "newLibraryWithURL:error:", v15, &v29);
        v18 = v29;
        library = self->_library;
        self->_library = v17;

        if (self->_library)
        {
          if (!self->_readWriteAttributes)
          {
            v30 = *MEMORY[0x1E0CA8F58];
            v31 = &unk_1E6A1D3B8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            readWriteAttributes = self->_readWriteAttributes;
            self->_readWriteAttributes = v20;

          }
          value = self->_textureCacheLuma.value_;
          v23 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          v8 = (BufferFillMetal *)CVMetalTextureCacheCreate(0, 0, v23, 0, &self->_textureCacheLuma.value_);
          if (!(_DWORD)v8)
          {
            v26 = self->_textureCacheChroma.value_;
            p_textureCacheChroma = &self->_textureCacheChroma;
            v24 = v26;
            v27 = p_textureCacheChroma[-11].value_;
            if (v26)
            {
              CFRelease(v24);
              p_textureCacheChroma->value_ = 0;
            }
            v8 = (BufferFillMetal *)CVMetalTextureCacheCreate(0, 0, v27, 0, &p_textureCacheChroma->value_);
          }
          goto LABEL_27;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v14;
          v34 = 2112;
          v35 = v18;
          _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        v18 = 0;
      }
      v8 = 0;
LABEL_27:

      return v8;
    }
  }
  return (BufferFillMetal *)4294954385;
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
  -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", a3, 0);
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

- (void)CompileBufferFill
{
  char v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *fillBoundaryLeftRightLuma;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *fillBoundaryLeftRightChroma;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *fillBoundaryTopBottomCornersLuma;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *fillBoundaryTopBottomCornersChroma;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *preFillLuma;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *preFillChroma;
  id v16;

  if (!self->_fillBoundaryLeftRightLuma)
  {
    if ((-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0
      || (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1004) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = -[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 3003);
    }
    self->_supportsNonuniformThreadgroups = v3;
    v16 = (id)objc_opt_new();
    objc_msgSend(v16, "setConstantValue:type:atIndex:", &self->_supportsNonuniformThreadgroups, 53, 0);
    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FillBoundaryLeftRightLuma"), v16);
    v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    fillBoundaryLeftRightLuma = self->_fillBoundaryLeftRightLuma;
    self->_fillBoundaryLeftRightLuma = v4;

    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FillBoundaryLeftRightChroma"), v16);
    v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    fillBoundaryLeftRightChroma = self->_fillBoundaryLeftRightChroma;
    self->_fillBoundaryLeftRightChroma = v6;

    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FillBoundaryTopBottomCornersLuma"), v16);
    v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    fillBoundaryTopBottomCornersLuma = self->_fillBoundaryTopBottomCornersLuma;
    self->_fillBoundaryTopBottomCornersLuma = v8;

    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("FillBoundaryTopBottomCornersChroma"), v16);
    v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    fillBoundaryTopBottomCornersChroma = self->_fillBoundaryTopBottomCornersChroma;
    self->_fillBoundaryTopBottomCornersChroma = v10;

    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("PreFillLuma"), v16);
    v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    preFillLuma = self->_preFillLuma;
    self->_preFillLuma = v12;

    -[BufferFillMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", CFSTR("PreFillChroma"), v16);
    v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    preFillChroma = self->_preFillChroma;
    self->_preFillChroma = v14;

  }
}

- (int)FillBoundaryOrExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[4] fillValues:(int)a5[3]
{
  __CVBuffer *v7;
  int v9;
  OSType PixelFormatType;
  size_t WidthOfPlane;
  size_t v12;
  size_t HeightOfPlane;
  size_t v14;
  void *v15;
  size_t v16;
  uint64x2_t v17;
  uint64x2_t v18;
  int8x8_t v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  int32x4_t v30;
  int v31;
  int v32;
  int *v33;
  __CVBuffer *v34;
  unint64_t v35;
  __int32 v36;
  __int32 v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  __int32 v43;
  __int32 v44;
  __int32 v45;
  __int32 v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void *v53;
  uint32x4_t *v54;
  char v55;
  BufferFillMetal *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  BOOL v68;
  _DWORD v69[2];
  uint32x4_t v70;
  uint64_t v71;

  v7 = a3;
  v71 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)a4 && !a4[2] && !a4[3])
    return 0;
  v9 = (int)-[BufferFillMetal initWithDevice:](self, "initWithDevice:", a3);
  if (!v9)
  {
    v54 = (uint32x4_t *)a4;
    -[BufferFillMetal CompileBufferFill](self, "CompileBufferFill");
    PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
    v68 = sub_1B67C37F4(PixelFormatType) == 10;
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(v7, 0);
    v12 = CVPixelBufferGetWidthOfPlane(v7, 1uLL);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(v7, 0);
    v14 = CVPixelBufferGetHeightOfPlane(v7, 1uLL);
    v56 = self;
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setLabel:", CFSTR("Fill frame boundaries"));
    objc_msgSend(v53, "computeCommandEncoder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17.i64[0] = WidthOfPlane;
    v17.i64[1] = HeightOfPlane;
    v18.i64[0] = v12;
    v18.i64[1] = v14;
    v19 = (int8x8_t)vmovn_s64((int64x2_t)vcgtq_u64(v17, v18));
    v20 = 1;
    while (1)
    {
      v55 = v20;
      v21 = (v20 & 1) == 0;
      v22 = 40;
      if (!v21)
        v22 = 32;
      v23 = *(Class *)((char *)&v56->super.isa + v22);
      v24 = v21 ? 56 : 48;
      v25 = v23;
      v26 = *(id *)((char *)&v56->super.isa + v24);
      v27 = v26;
      if (!v25 || v26 == 0)
        break;
      v57 = v26;
      v58 = v25;
      -[BufferFillMetal unormTexture:forPlane:withAttributes:](v56, "unormTexture:forPlane:withAttributes:", v7, v16, v56->_readWriteAttributes);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        break;
      v59 = (void *)v29;
      *(int8x8_t *)v30.i8 = vand_s8((int8x8_t)vdup_n_s32(v16), v19);
      v70 = vshlq_u32(*v54, (uint32x4_t)vnegq_s32(vzip1q_s32(v30, v30)));
      v31 = CVPixelBufferGetWidthOfPlane(v7, v16);
      v69[0] = v31 - (v70.i32[0] + v70.i32[1]);
      v32 = CVPixelBufferGetHeightOfPlane(v7, v16);
      v33 = a5;
      v34 = v7;
      v35 = (v32 - (v70.i32[2] + v70.i32[3]));
      v69[1] = v32 - (v70.i32[2] + v70.i32[3]);
      v36 = v70.i32[0];
      v37 = v70.i32[1];
      v38 = objc_msgSend(v58, "threadExecutionWidth");
      v39 = objc_msgSend(v58, "maxTotalThreadsPerThreadgroup");
      v40 = (v37 + v36);
      if (v38 >= v40)
        v38 = (v37 + v36);
      if (v39 / v38 >= v35)
        v41 = v35;
      else
        v41 = v39 / v38;
      objc_msgSend(v15, "setComputePipelineState:", v58);
      objc_msgSend(v15, "setTexture:atIndex:", v59, 0);
      objc_msgSend(v15, "setBytes:length:atIndex:", v69, 8, 0);
      objc_msgSend(v15, "setBytes:length:atIndex:", &v70, 16, 1);
      objc_msgSend(v15, "setBytes:length:atIndex:", a5, 12, 2);
      objc_msgSend(v15, "setBytes:length:atIndex:", &v68, 1, 3);
      if (v56->_supportsNonuniformThreadgroups)
      {
        v67[0] = v40;
        v67[1] = v35;
        v67[2] = 1;
        v66[0] = v38;
        v66[1] = v41;
        v66[2] = 1;
        objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v67, v66);
      }
      else
      {
        v65[0] = (v40 + v38 - 1) / v38;
        v65[1] = (v35 + v41 - 1) / v41;
        v65[2] = 1;
        v64[0] = v38;
        v64[1] = v41;
        v64[2] = 1;
        objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v65, v64);
      }
      v42 = v69[0];
      v43 = v70.i32[0];
      v44 = v70.i32[1];
      v46 = v70.i32[2];
      v45 = v70.i32[3];
      v47 = objc_msgSend(v57, "threadExecutionWidth");
      v48 = objc_msgSend(v57, "maxTotalThreadsPerThreadgroup");
      v49 = (v43 + v42 + v44);
      v50 = (v45 + v46);
      if (v47 >= v49)
        v47 = v49;
      if (v48 / v47 >= v50)
        v51 = (v45 + v46);
      else
        v51 = v48 / v47;
      objc_msgSend(v15, "setComputePipelineState:", v57);
      a5 = v33;
      v7 = v34;
      objc_msgSend(v15, "setTexture:atIndex:", v59, 0);
      objc_msgSend(v15, "setBytes:length:atIndex:", v69, 8, 0);
      objc_msgSend(v15, "setBytes:length:atIndex:", &v70, 16, 1);
      objc_msgSend(v15, "setBytes:length:atIndex:", v33, 12, 2);
      objc_msgSend(v15, "setBytes:length:atIndex:", &v68, 1, 3);
      if (v56->_supportsNonuniformThreadgroups)
      {
        v63[0] = v49;
        v63[1] = v50;
        v63[2] = 1;
        v62[0] = v47;
        v62[1] = v51;
        v62[2] = 1;
        objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v63, v62);
      }
      else
      {
        v61[0] = (v49 + v47 - 1) / v47;
        v61[1] = (v50 + v51 - 1) / v51;
        v61[2] = 1;
        v60[0] = v47;
        v60[1] = v51;
        v60[2] = 1;
        objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v61, v60);
      }

      v20 = 0;
      v16 = 1;
      if ((v55 & 1) == 0)
      {
        objc_msgSend(v15, "endEncoding");
        objc_msgSend(v53, "commit");
        v9 = 0;
        goto LABEL_35;
      }
    }

    v9 = -12911;
LABEL_35:

  }
  return v9;
}

- (int)FillBoundary:(__CVBuffer *)a3 padSize:(unsigned int)a4[3] fillValues:(int)a5[3]
{
  if (*a5 < 0 || a5[1] < 0 || a5[2] < 0)
    return -50;
  else
    return -[BufferFillMetal FillBoundaryOrExtendEdges:padSize:fillValues:](self, "FillBoundaryOrExtendEdges:padSize:fillValues:", a3, a4);
}

- (int)ExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[3]
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = -1;
  v5 = -1;
  return -[BufferFillMetal FillBoundaryOrExtendEdges:padSize:fillValues:](self, "FillBoundaryOrExtendEdges:padSize:fillValues:", a3, a4, &v5);
}

- (int)PreFill:(__CVBuffer *)a3 values:(int)a4[3]
{
  int v7;
  OSType PixelFormatType;
  void *v9;
  size_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  void *v24;
  int *__attribute__((__org_arrdim(0,3))) v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  BOOL v30;

  if (*a4 < 0 || a4[1] < 0 || a4[2] < 0)
    return -12902;
  v7 = (int)-[BufferFillMetal initWithDevice:](self, "initWithDevice:");
  if (!v7)
  {
    -[BufferFillMetal CompileBufferFill](self, "CompileBufferFill");
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v30 = sub_1B67C37F4(PixelFormatType) == 10;
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLabel:", CFSTR("Pre-fill pixel buffer"));
    v25 = a4;
    objc_msgSend(v24, "computeCommandEncoder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 1;
    while (1)
    {
      v12 = v11;
      v13 = (v11 & 1) == 0;
      v14 = 72;
      if (!v13)
        v14 = 64;
      v15 = *(id *)((char *)&self->super.isa + v14);
      if (!v15)
        break;
      v16 = v15;
      -[BufferFillMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, v10, self->_readWriteAttributes);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        break;
      }
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v10);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v10);
      v20 = objc_msgSend(v16, "threadExecutionWidth");
      v21 = objc_msgSend(v16, "maxTotalThreadsPerThreadgroup");
      if (v20 >= WidthOfPlane)
        v20 = WidthOfPlane;
      if (v21 / v20 >= HeightOfPlane)
        v22 = HeightOfPlane;
      else
        v22 = v21 / v20;
      objc_msgSend(v9, "setComputePipelineState:", v16);
      objc_msgSend(v9, "setTexture:atIndex:", v17, 0);
      objc_msgSend(v9, "setBytes:length:atIndex:", v25, 12, 0);
      objc_msgSend(v9, "setBytes:length:atIndex:", &v30, 1, 1);
      if (self->_supportsNonuniformThreadgroups)
      {
        v29[0] = WidthOfPlane;
        v29[1] = HeightOfPlane;
        v29[2] = 1;
        v28[0] = v20;
        v28[1] = v22;
        v28[2] = 1;
        objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v29, v28);
      }
      else
      {
        v27[0] = (WidthOfPlane + v20 - 1) / v20;
        v27[1] = (HeightOfPlane + v22 - 1) / v22;
        v27[2] = 1;
        v26[0] = v20;
        v26[1] = v22;
        v26[2] = 1;
        objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", v27, v26);
      }

      v11 = 0;
      v10 = 1;
      if ((v12 & 1) == 0)
      {
        objc_msgSend(v9, "endEncoding");
        objc_msgSend(v24, "commit");
        v7 = 0;
        goto LABEL_24;
      }
    }
    v7 = -12911;
LABEL_24:

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_preFillChroma, 0);
  objc_storeStrong((id *)&self->_preFillLuma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryTopBottomCornersChroma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryTopBottomCornersLuma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryLeftRightChroma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryLeftRightLuma, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
