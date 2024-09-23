@implementation SpatialAnalysisMetal

- (SpatialAnalysisMetal)init
{
  SpatialAnalysisMetal *v2;
  SpatialAnalysisMetal *v3;
  SpatialAnalysisMetal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SpatialAnalysisMetal;
  v2 = -[SpatialAnalysisMetal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SpatialAnalysisMetal initWithDevice:](v2, "initWithDevice:", 0);
    v4 = v3;
  }

  return v3;
}

- (SpatialAnalysisMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t RegistryID;
  MTLDevice *v5;
  id *p_device;
  MTLDevice *device;
  SpatialAnalysisMetal *v8;
  MTLComputePipelineState *spatialAnalysisSumSad;
  MTLComputePipelineState *spatialAnalysisVariance;
  MTLComputePipelineState *spatialAnalysisDistance;
  MTLDevice *v12;
  id v13;
  id v14;
  MTLCommandQueue *v15;
  MTLCommandQueue *commandQueue;
  char v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  MTLLibrary *v22;
  id v23;
  MTLLibrary *library;
  NSDictionary *v25;
  NSDictionary *readAttributes;
  NSDictionary *v27;
  NSDictionary *writeAttributes;
  __CVMetalTextureCache *value;
  MTLDevice *v30;
  __CVMetalTextureCache *v31;
  MTLDevice *v32;
  __CVMetalTextureCache *v33;
  MTLDevice *v34;
  __CVMetalTextureCache *v35;
  CF<__CVMetalTextureCache *> *p_textureCacheRGBAChroma;
  __CVMetalTextureCache *v37;
  __CVMetalTextureCache *v38;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
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

  spatialAnalysisSumSad = self->_spatialAnalysisSumSad;
  self->_spatialAnalysisSumSad = 0;

  spatialAnalysisVariance = self->_spatialAnalysisVariance;
  self->_spatialAnalysisVariance = 0;

  spatialAnalysisDistance = self->_spatialAnalysisDistance;
  self->_spatialAnalysisDistance = 0;

  v12 = self->_device;
  if (v12
    || (v13 = MTLCreateSystemDefaultDevice(),
        v14 = *p_device,
        *p_device = v13,
        v14,
        (v12 = (MTLDevice *)*p_device) != 0))
  {
    v15 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v12, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v15;

    if (self->_commandQueue)
    {
      if ((objc_msgSend(*p_device, "supportsFamily:", 2001) & 1) != 0)
        v17 = 1;
      else
        v17 = objc_msgSend(*p_device, "supportsFamily:", 1006);
      self->_supportsSIMDPermute = v17;
      if ((-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 2002) & 1) != 0
        || (objc_msgSend(*p_device, "supportsFamily:", 1004) & 1) != 0)
      {
        v18 = 1;
      }
      else
      {
        v18 = objc_msgSend(*p_device, "supportsFamily:", 3003);
      }
      self->_supportsQuadPermute = v18;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLForResource:withExtension:", CFSTR("ProcessAccelerate"), CFSTR("metallib"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = *p_device;
        v40 = 0;
        v22 = (MTLLibrary *)objc_msgSend(v21, "newLibraryWithURL:error:", v20, &v40);
        v23 = v40;
        library = self->_library;
        self->_library = v22;

        if (self->_library)
        {
          sub_1B6781368((uint64_t)&self->_sumBufferPool, self->_device);
          sub_1B6781368((uint64_t)&self->_sadBufferPool, self->_device);
          sub_1B6781368((uint64_t)&self->_sumVarBufferPool, self->_device);
          if (!self->_readAttributes)
          {
            v43 = *MEMORY[0x1E0CA8F58];
            v44 = &unk_1E6A1D3D0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
            v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            readAttributes = self->_readAttributes;
            self->_readAttributes = v25;

          }
          if (!self->_writeAttributes)
          {
            v41 = *MEMORY[0x1E0CA8F58];
            v42 = &unk_1E6A1D3E8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
            v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            writeAttributes = self->_writeAttributes;
            self->_writeAttributes = v27;

          }
          value = self->_textureCacheLuma.value_;
          v30 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v30, 0, &self->_textureCacheLuma.value_);
          if (!(_DWORD)v8)
          {
            v31 = self->_textureCacheChroma.value_;
            v32 = self->_device;
            if (v31)
            {
              CFRelease(v31);
              self->_textureCacheChroma.value_ = 0;
            }
            v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v32, 0, &self->_textureCacheChroma.value_);
            if (!(_DWORD)v8)
            {
              v33 = self->_textureCacheRGBALuma.value_;
              v34 = self->_device;
              if (v33)
              {
                CFRelease(v33);
                self->_textureCacheRGBALuma.value_ = 0;
              }
              v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v34, 0, &self->_textureCacheRGBALuma.value_);
              if (!(_DWORD)v8)
              {
                v37 = self->_textureCacheRGBAChroma.value_;
                p_textureCacheRGBAChroma = &self->_textureCacheRGBAChroma;
                v35 = v37;
                v38 = p_textureCacheRGBAChroma[-22].value_;
                if (v37)
                {
                  CFRelease(v35);
                  p_textureCacheRGBAChroma->value_ = 0;
                }
                v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v38, 0, &p_textureCacheRGBAChroma->value_);
              }
            }
          }
          goto LABEL_42;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v19;
          v47 = 2112;
          v48 = v23;
          _os_log_error_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        v23 = 0;
      }
      v8 = 0;
LABEL_42:

      return v8;
    }
  }
  return (SpatialAnalysisMetal *)4294954385;
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
  -[SpatialAnalysisMetal compileFunction:constantValues:](self, "compileFunction:constantValues:", a3, 0);
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
  v14 = 168;
  if (!a4)
    v14 = 160;
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

- (void)CompileSpatialAnalysis:(BOOL)a3
{
  MTLComputePipelineState *v5;
  MTLComputePipelineState *spatialAnalysisSumSad;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *spatialAnalysisVariance;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  const __CFString *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *spatialAnalysisDistance;

  if (!self->_spatialAnalysisSumSad)
  {
    if (self->_supportsSIMDPermute)
    {
      if (a3)
      {
        -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialSumSadUnorm"));
        v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        spatialAnalysisSumSad = self->_spatialAnalysisSumSad;
        self->_spatialAnalysisSumSad = v5;

        -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialVarianceUnorm"));
        v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        spatialAnalysisVariance = self->_spatialAnalysisVariance;
        self->_spatialAnalysisVariance = v7;

LABEL_8:
        v13 = CFSTR("SpatialDistanceUnorm");
LABEL_11:
        -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", v13);
        v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        spatialAnalysisDistance = self->_spatialAnalysisDistance;
        self->_spatialAnalysisDistance = v18;

        return;
      }
      -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialSumSadSIMD"));
      v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v15 = self->_spatialAnalysisSumSad;
      self->_spatialAnalysisSumSad = v14;

      -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialVarianceSIMD"));
      v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v17 = self->_spatialAnalysisVariance;
      self->_spatialAnalysisVariance = v16;

    }
    else
    {
      if (self->_supportsQuadPermute)
      {
        -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialSumSadQuad"));
        v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        v10 = self->_spatialAnalysisSumSad;
        self->_spatialAnalysisSumSad = v9;

        -[SpatialAnalysisMetal compileFunction:](self, "compileFunction:", CFSTR("SpatialVarianceQuad"));
        v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        v12 = self->_spatialAnalysisVariance;
        self->_spatialAnalysisVariance = v11;

      }
      if (a3)
        goto LABEL_8;
    }
    v13 = CFSTR("SpatialDistance");
    goto LABEL_11;
  }
}

- (int)SpatialSumSadVar:(__CVBuffer *)a3 sumBlockArray:(unsigned int *)a4 sadBlockArray:(unsigned int *)a5 sumUnitArray:(unsigned int *)a6 sumSquareUnitArray:(unint64_t *)a7 sumTotal:(unint64_t *)a8 sadTotal:(unsigned int *)a9 variance:(unsigned int *)a10 forRegion:(id *)a11 blockStride:(unsigned int)a12 unitStride:(unsigned int)a13 method:(unsigned int)a14 log2UnitSize:(unsigned int)a15 calcVar:(BOOL)a16
{
  char v23;
  uint64_t v24;
  int v25;
  OSType PixelFormatType;
  OSType v27;
  int v28;
  size_t WidthOfPlane;
  unint64_t var0;
  size_t HeightOfPlane;
  unint64_t var1;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSMutableArray *pool;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  NSMutableArray *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  uint32x4_t *BytePtr;
  uint32x4_t *v53;
  unint64_t v54;
  int v55;
  unsigned int v56;
  uint32x4_t *v57;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _BOOL4 v66;
  unint64_t *v67;
  uint64_t v68;
  unsigned int *v69;
  unint64_t *v70;
  void *v71;
  void *v72;
  char v73;
  unint64_t v74;
  void *v75;
  void *v76;
  int64x2_t v77;
  uint64_t v78;
  _QWORD v79[3];
  CFTypeRef cf;
  int64x2_t v81;
  uint64_t v82;
  _QWORD v83[3];
  int v84;
  const void *v85;
  const __CFData *v86;
  BOOL v87;
  _DWORD v88[4];
  uint64_t v89;

  v23 = a15;
  v24 = a13;
  v89 = *MEMORY[0x1E0C80C00];
  v25 = (int)-[SpatialAnalysisMetal initWithDevice:](self, "initWithDevice:");
  if (!v25)
  {
    v73 = v23;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v87 = sub_1B67C37F4(PixelFormatType) == 10;
    v27 = CVPixelBufferGetPixelFormatType(a3);
    v28 = CVIsCompressedPixelFormatAvailable(v27);
    -[SpatialAnalysisMetal CompileSpatialAnalysis:](self, "CompileSpatialAnalysis:", v28 != 0);
    if (self->_spatialAnalysisSumSad)
    {
      v68 = v24;
      v69 = a6;
      v67 = a7;
      v70 = a8;
      if (v28)
        -[SpatialAnalysisMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
      else
        -[SpatialAnalysisMetal rgbaUintTextureForLuma:withAttributes:](self, "rgbaUintTextureForLuma:withAttributes:", a3, self->_readAttributes);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (v76)
      {
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        if (WidthOfPlane - a11->var0.var0 >= a11->var1.var0)
          var0 = a11->var1.var0;
        else
          var0 = WidthOfPlane - a11->var0.var0;
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        var1 = a11->var0.var1;
        v33 = HeightOfPlane - var1;
        if (HeightOfPlane - var1 >= a11->var1.var1)
          v33 = a11->var1.var1;
        v88[0] = a11->var0.var0;
        v88[1] = var1;
        v88[2] = var0;
        v88[3] = v33;
        v85 = 0;
        v86 = 0;
        v84 = 3;
        v59 = v33;
        v60 = var0;
        v34 = (v33 + 7) >> 3;
        v35 = a12;
        v63 = (v34 + 15) >> 4;
        v65 = (((var0 + 7) >> 3) + 15) >> 4;
        v36 = 4 * v63 * v65;
        v62 = v63 * v65;
        if (self->_sumBufferPool.allocSize_ < v36)
        {
          pool = self->_sumBufferPool.pool_;
          self->_sumBufferPool.pool_ = 0;

          self->_sumBufferPool.allocSize_ = v36;
        }
        if (self->_sadBufferPool.allocSize_ < v36)
        {
          v38 = self->_sadBufferPool.pool_;
          self->_sadBufferPool.pool_ = 0;

          self->_sadBufferPool.allocSize_ = v36;
        }
        sub_1B67802CC((uint64_t)&self->_sumBufferPool, &v86);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {
          CFRelease(v85);
          v85 = 0;
        }
        sub_1B67802CC((uint64_t)&self->_sadBufferPool, &v85);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = 4 * v34 * v35;
        v41 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", a4, v40, 0, 0);
        v42 = -[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", a5, v40, 0, 0);
        -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setLabel:", CFSTR("Spadial Sum, Sad, Variance"));
        v71 = (void *)v39;
        v72 = (void *)v42;
        objc_msgSend(v43, "computeCommandEncoder");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setComputePipelineState:", self->_spatialAnalysisSumSad);
        objc_msgSend(v44, "setTexture:atIndex:", v76, 0);
        objc_msgSend(v44, "setBuffer:offset:atIndex:", v41, 0, 0);
        objc_msgSend(v44, "setBuffer:offset:atIndex:", v42, 0, 1);
        objc_msgSend(v44, "setBuffer:offset:atIndex:", v75, 0, 2);
        objc_msgSend(v44, "setBuffer:offset:atIndex:", v39, 0, 3);
        objc_msgSend(v44, "setBytes:length:atIndex:", v88, 16, 4);
        objc_msgSend(v44, "setBytes:length:atIndex:", &a12, 4, 5);
        objc_msgSend(v44, "setBytes:length:atIndex:", &v84, 4, 6);
        objc_msgSend(v44, "setBytes:length:atIndex:", &a14, 4, 7);
        objc_msgSend(v44, "setBytes:length:atIndex:", &v87, 1, 8);
        v83[0] = v65;
        v83[1] = v63;
        v83[2] = 1;
        v81 = vdupq_n_s64(0x10uLL);
        v82 = 1;
        objc_msgSend(v44, "dispatchThreadgroups:threadsPerThreadgroup:", v83, &v81);
        cf = 0;
        v66 = a16;
        if (a16)
        {
          v45 = ~(-1 << v73);
          v46 = (v59 + v45) >> v73;
          v64 = (((v60 + v45) >> v73) + 15) >> 4;
          v61 = (v46 + 15) >> 4;
          v74 = v64 * v61;
          if (self->_sumVarBufferPool.allocSize_ < 4 * v64 * v61)
          {
            v47 = self->_sumVarBufferPool.pool_;
            self->_sumVarBufferPool.pool_ = 0;

            self->_sumVarBufferPool.allocSize_ = 4 * v74;
            if (cf)
            {
              CFRelease(cf);
              cf = 0;
            }
          }
          sub_1B67802CC((uint64_t)&self->_sumVarBufferPool, &cf);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v46 * v24;
          v50 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", v69, 4 * v46 * v24, 0, 0);
          v51 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", v67, 8 * v46 * v68, 0, 0);
          objc_msgSend(v44, "setComputePipelineState:", self->_spatialAnalysisVariance);
          objc_msgSend(v44, "setTexture:atIndex:", v76, 0);
          objc_msgSend(v44, "setBuffer:offset:atIndex:", v41, 0, 0);
          objc_msgSend(v44, "setBuffer:offset:atIndex:", v50, 0, 1);
          objc_msgSend(v44, "setBuffer:offset:atIndex:", v51, 0, 2);
          objc_msgSend(v44, "setBuffer:offset:atIndex:", v48, 0, 3);
          objc_msgSend(v44, "setBytes:length:atIndex:", v88, 16, 4);
          objc_msgSend(v44, "setBytes:length:atIndex:", &a13, 4, 5);
          objc_msgSend(v44, "setBytes:length:atIndex:", &a15, 4, 6);
          objc_msgSend(v44, "setBytes:length:atIndex:", &v87, 1, 7);
          v79[0] = v64;
          v79[1] = v61;
          v79[2] = 1;
          v77 = vdupq_n_s64(0x10uLL);
          v78 = 1;
          objc_msgSend(v44, "dispatchThreadgroups:threadsPerThreadgroup:", v79, &v77);
        }
        else
        {
          v49 = 0;
          v74 = 0;
          v48 = 0;
          v50 = 0;
          v51 = 0;
        }
        objc_msgSend(v44, "endEncoding");
        objc_msgSend(v43, "commit");
        objc_msgSend(v43, "waitUntilCompleted");
        BytePtr = (uint32x4_t *)CFDataGetBytePtr(v86);
        *v70 = sub_1B67A0EDC(BytePtr, v62);
        v53 = (uint32x4_t *)CFDataGetBytePtr((CFDataRef)v85);
        v54 = sub_1B67A0EDC(v53, v62);
        v55 = -1;
        if (v54 < 0xFFFFFFFF)
          v55 = v54;
        if (v87)
          v56 = v55;
        else
          v56 = v54;
        *a9 = v56;
        if (v66)
        {
          v57 = (uint32x4_t *)CFDataGetBytePtr((CFDataRef)cf);
          *a10 = (sub_1B67A0EDC(v57, v74) + (v49 >> 1)) / v49;
        }

        sub_1B67704D8(&cf);
        sub_1B67704D8(&v85);
        sub_1B67704D8((const void **)&v86);
        v25 = 0;
      }
      else
      {
        v25 = -12911;
      }

    }
    else
    {
      return -12911;
    }
  }
  return v25;
}

- (int)SpatialDistance:(__CVBuffer *)a3 prevFrame:(__CVBuffer *)a4 distBlockArray:(unsigned int *)a5 forRegion:(id *)a6 blockStride:(unsigned int)a7 log2UnitSize:(unsigned int)a8 startLine:(unsigned int)a9 lineStep:(unsigned int)a10 method:(unsigned int)a11
{
  char v11;
  int v18;
  OSType PixelFormatType;
  OSType v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  size_t WidthOfPlane;
  unint64_t var0;
  unint64_t v27;
  size_t HeightOfPlane;
  unint64_t v29;
  unint64_t var1;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  int64x2_t v39;
  uint64_t v40;
  _QWORD v41[3];
  BOOL v42;
  unsigned int v43;
  unsigned int v44;
  _DWORD v45[4];
  uint64_t v46;

  v11 = a8;
  v46 = *MEMORY[0x1E0C80C00];
  v43 = a8;
  v44 = a7;
  v18 = (int)-[SpatialAnalysisMetal initWithDevice:](self, "initWithDevice:");
  if (!v18)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v42 = sub_1B67C37F4(PixelFormatType) == 10;
    v20 = CVPixelBufferGetPixelFormatType(a3);
    v21 = CVIsCompressedPixelFormatAvailable(v20);
    -[SpatialAnalysisMetal CompileSpatialAnalysis:](self, "CompileSpatialAnalysis:", v21 != 0);
    if (self->_spatialAnalysisDistance)
    {
      if (v21)
      {
        -[SpatialAnalysisMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a3, 0, self->_readAttributes);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SpatialAnalysisMetal unormTexture:forPlane:withAttributes:](self, "unormTexture:forPlane:withAttributes:", a4, 0, self->_readAttributes);
      }
      else
      {
        -[SpatialAnalysisMetal rgbaUintTextureForLuma:withAttributes:](self, "rgbaUintTextureForLuma:withAttributes:", a3, self->_readAttributes);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SpatialAnalysisMetal rgbaUintTextureForLuma:withAttributes:](self, "rgbaUintTextureForLuma:withAttributes:", a4, self->_readAttributes);
      }
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v18 = -12911;
      if (v22 && v23)
      {
        v38 = (void *)v23;
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        var0 = a6->var0.var0;
        v27 = a6->var1.var0;
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        if (WidthOfPlane - var0 >= v27)
          v29 = v27;
        else
          v29 = WidthOfPlane - var0;
        var1 = a6->var0.var1;
        v31 = HeightOfPlane - var1;
        if (HeightOfPlane - var1 >= a6->var1.var1)
          v31 = a6->var1.var1;
        v45[0] = a6->var0.var0;
        v45[1] = var1;
        v45[2] = v29;
        v45[3] = v31;
        v32 = ~(-1 << v11);
        v33 = (v31 + v32) >> v11;
        v34 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", a5, 4 * a7 * v33, 0, 0);
        v24 = v38;
        -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setLabel:", CFSTR("Spadial Distance"));
        objc_msgSend(v35, "computeCommandEncoder");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setComputePipelineState:", self->_spatialAnalysisDistance);
        objc_msgSend(v36, "setTexture:atIndex:", v22, 0);
        objc_msgSend(v36, "setTexture:atIndex:", v38, 1);
        objc_msgSend(v36, "setBuffer:offset:atIndex:", v34, 0, 0);
        objc_msgSend(v36, "setBytes:length:atIndex:", v45, 16, 1);
        objc_msgSend(v36, "setBytes:length:atIndex:", &v44, 4, 2);
        objc_msgSend(v36, "setBytes:length:atIndex:", &v43, 4, 3);
        objc_msgSend(v36, "setBytes:length:atIndex:", &v42, 1, 4);
        objc_msgSend(v36, "setBytes:length:atIndex:", &a9, 4, 5);
        objc_msgSend(v36, "setBytes:length:atIndex:", &a10, 4, 6);
        objc_msgSend(v36, "setBytes:length:atIndex:", &a11, 4, 7);
        v41[0] = (((v29 + v32) >> v11) + 15) >> 4;
        v41[1] = (v33 + 15) >> 4;
        v41[2] = 1;
        v39 = vdupq_n_s64(0x10uLL);
        v40 = 1;
        objc_msgSend(v36, "dispatchThreadgroups:threadsPerThreadgroup:", v41, &v39);
        objc_msgSend(v36, "endEncoding");
        objc_msgSend(v35, "commit");
        objc_msgSend(v35, "waitUntilCompleted");

        v18 = 0;
      }

    }
    else
    {
      return -12911;
    }
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1B677747C((const void **)&self->_textureCacheRGBAChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheRGBALuma.value_);
  sub_1B677747C((const void **)&self->_textureCacheChroma.value_);
  sub_1B677747C((const void **)&self->_textureCacheLuma.value_);

  objc_storeStrong((id *)&self->_spatialAnalysisDistance, 0);
  objc_storeStrong((id *)&self->_spatialAnalysisVariance, 0);
  objc_storeStrong((id *)&self->_spatialAnalysisSumSad, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

@end
