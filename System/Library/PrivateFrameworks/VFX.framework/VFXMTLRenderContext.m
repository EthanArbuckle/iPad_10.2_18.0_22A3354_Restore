@implementation VFXMTLRenderContext

- (void)_reduceStatsOfConstantBuffer:(id)a3
{
  uint64_t v3;

  --self->__engineStats->cboCount;
  self->__engineStats->cboMemory -= objc_msgSend_length(a3, a2, (uint64_t)a3, v3);
}

- (VFXMTLRenderContext)initWithDevice:(id)a3 engineContext:(__CFXEngineContext *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXMTLRenderContext *v10;
  VFXMTLRenderContext *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  MTLCommandQueue *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  id v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  unsigned int features;
  const __CFString *v86;
  _BYTE v88[28];
  _OWORD v89[2];
  objc_super v90;

  if (!a3)
  {
    v86 = CFSTR("Error: VFXMTLRenderContext initWithDevice : device should not be nil");
    goto LABEL_43;
  }
  v90.receiver = self;
  v90.super_class = (Class)VFXMTLRenderContext;
  v10 = -[VFXMTLRenderContext init](&v90, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_device = (MTLDevice *)a3;
  if ((sub_1B17A0090() & 1) == 0)
  {
    v15 = (MTLCommandQueue *)objc_msgSend_newCommandQueue(a3, v12, v13, v14);
    v11->_ownedCommandQueue = v15;
    if (v15)
    {
      objc_msgSend_setLabel_(v15, v16, (uint64_t)CFSTR("com.apple.vfx"), (uint64_t)a4);
      goto LABEL_6;
    }
    v86 = CFSTR("Error: VFXMTLRenderContext initWithDevice : cannot create a command queue. Bailing out.");
LABEL_43:
    sub_1B17C4408(16, (uint64_t)v86, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)v88);
    return 0;
  }
LABEL_6:
  v11->_isValidationEnabled = MTLValidationEnabled();
  v11->_superSamplingFactor = 1.0;
  *(_OWORD *)&v11->_anon_20[4] = VFXMatrix4Identity;
  *(_OWORD *)&v11->_anon_20[20] = unk_1B2247DB0;
  *(_OWORD *)&v11->_anon_20[36] = xmmword_1B2247DC0;
  *(_OWORD *)&v11->_anon_20[52] = unk_1B2247DD0;
  v11->_needSuperSampling = 0;
  v11->_engineContext = a4;
  v17 = v11->_features | 3;
  v11->_profile = 0;
  v11->_features = v17;
  if (j__objc_msgSend_supportsMSAADepthResolve(v11->_device, v18, v19, v20))
    v11->_features |= 4u;
  if (j__objc_msgSend_supportsMSAAStencilResolve(v11->_device, v21, v22, v23))
    v11->_features |= 0x4000u;
  if (j__objc_msgSend_supportsNonUniformThreadgroupSize(v11->_device, v24, v25, v26))
    v11->_features |= 0x40u;
  if (sub_1B189E944())
    v11->_features |= 8u;
  if (j__objc_msgSend_supportsLayeredRendering(v11->_device, v27, v28, v29))
    v11->_features |= 0x20u;
  if (sub_1B189E950(v11->_device, v30, v31, v32))
    v11->_features |= 0x80u;
  if (sub_1B189EACC((uint64_t)v11->_device, v33, v34, v35))
    v11->_features |= 0x2000u;
  if (j__objc_msgSend_supportsTessellation(v11->_device, v36, v37, v38))
    v11->_features |= 0x10u;
  if (j__objc_msgSend_supportsTextureCubeArray(v11->_device, v39, v40, v41))
    v11->_features |= 0x100u;
  if (j__objc_msgSend_supportsReadWriteTextureCubeArguments(v11->_device, v42, v43, v44))
    v11->_features |= 0x200u;
  if (j__objc_msgSend_supportsBaseVertexInstanceDrawing(v11->_device, v45, v46, v47))
    v11->_features |= 0x400u;
  if (j__objc_msgSend_supportsProgrammableBlending(v11->_device, v48, v49, v50))
    v11->_features |= 0x800u;
  if (j__objc_msgSend_supportsDepthClipMode(v11->_device, v51, v52, v53))
    v11->_features |= 0x1000u;
  if (j__objc_msgSend_supportsTextureSwizzle(v11->_device, v54, v55, v56))
    v11->_features |= 0x8000u;
  v11->_resourceManager = (VFXMTLResourceManager *)sub_1B18F8C8C((uint64_t)VFXMTLResourceManager, (uint64_t)a3);
  v11->_resourceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.vfx.resourceCPUQueue", 0);
  v11->_resourceGroup = (OS_dispatch_group *)dispatch_group_create();
  v11->__engineStats = (__CFXEngineStats *)malloc_type_calloc(0x358uLL, 1uLL, 0x6DFE3DAFuLL);
  v11->_currentStreamBufferIndices = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  v62 = sub_1B1814B08((uint64_t)v11->_engineContext, CFSTR("maxInFlightFrameCount"), 3, v57, v58, v59, v60, v61);
  v11->_maxInFlightFrameCount = v62;
  v11->_inFlightSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(v62);
  v11->_constantBufferPools = (VFXMTLBufferPool **)operator new[]();
  v11->_volatileBufferPools = (VFXMTLBufferPool **)operator new[]();
  if (v11->_maxInFlightFrameCount >= 1)
  {
    v63 = 0;
    do
    {
      v64 = operator new();
      sub_1B1868AAC(v64, v11->_resourceManager, CFSTR("FrameConstant"), 0x40000, 0);
      v11->_constantBufferPools[v63] = (VFXMTLBufferPool *)v64;
      v65 = operator new();
      sub_1B1868AAC(v65, v11->_resourceManager, CFSTR("Volatile"), 0x40000, 0);
      v11->_volatileBufferPools[v63++] = (VFXMTLBufferPool *)v65;
    }
    while (v63 < v11->_maxInFlightFrameCount);
  }
  v66 = operator new();
  sub_1B18CFF34(v66, v11, v67, v68);
  v11->_frameTexturePool = (void *)v66;
  v11->_frameConstantBufferPool = *v11->_constantBufferPools;
  v11->_frameVolatileBufferPool = *v11->_volatileBufferPools;
  v11->_volatileMeshes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11->_bufferPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11->_usedVolatileMeshElements = (NSMutableArray *)objc_msgSend_initWithCapacity_(v69, v70, 16, v71);
  v72 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11->_freeVolatileMeshElements = (NSMutableArray *)objc_msgSend_initWithCapacity_(v72, v73, 16, v74);
  v75 = objc_alloc_init(MEMORY[0x1E0CC6B80]);
  v11->_defaultSamplerState = (MTLSamplerState *)objc_msgSend_newSamplerStateWithDescriptor_(v11->_device, v76, (uint64_t)v75, v77);

  v78 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
  objc_msgSend_setDepthWriteEnabled_(v78, v79, 0, v80);
  objc_msgSend_setDepthCompareFunction_(v78, v81, 7, v82);
  v11->_defaultDepthStencilState = (MTLDepthStencilState *)objc_msgSend_newDepthStencilStateWithDescriptor_(v11->_device, v83, (uint64_t)v78, v84);

  v11->_background2DProgram[0] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_2D_vertid"), CFSTR("background_2D_frag"));
  v11->_backgroundCubeProgram[0] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_cube_vertid"), CFSTR("background_cube_frag"));
  v11->_backgroundVideoProgram = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_video_vertid"), CFSTR("background_video_frag"));
  v11->_backgroundVideoAlpha0Program = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_video_vertid"), CFSTR("background_video_alpha_0_frag"));
  features = v11->_features;
  if ((features & 0x80) != 0)
  {
    v11->_background2DProgram[2] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_2D_multiple_viewports_vertid"), CFSTR("background_2D_multiple_viewports_frag"));
    v11->_backgroundCubeProgram[2] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_cube_multiple_viewports_vertid"), CFSTR("background_cube_multiple_viewports_frag"));
    features = v11->_features;
  }
  if ((features & 0x20) != 0)
  {
    v11->_background2DProgram[1] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_2D_layered_vertid"), CFSTR("background_2D_layered_frag"));
    v11->_backgroundCubeProgram[1] = (__CFXFXProgram *)sub_1B181DE74(CFSTR("background_cube_layered_vertid"), CFSTR("background_cube_layered_frag"));
  }
  memset(v89, 0, 28);
  sub_1B181EB54(v89);
  WORD4(v89[0]) = 0;
  *(_OWORD *)&v88[12] = *(_OWORD *)((char *)v89 + 12);
  *(_OWORD *)v88 = v89[0];
  v11->_backgroundRasterizerStates = (__CFXRasterizerStates *)sub_1B181EC70((uint64_t)v88);
  v11->_showsAuthoringEnvironment = 0;
  v11->_renderTargetInfo = objc_alloc_init(CFXVFXRenderTargetInfo);
  return v11;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  char *v14;
  __CFXFXProgram *v15;
  const void *v16;
  __CFXFXProgram *backgroundVideoProgram;
  __CFXFXProgram *backgroundVideoAlpha0Program;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  VFXMTLBufferPool **constantBufferPools;
  VFXMTLBufferPool **volatileBufferPools;
  uint64_t v24;
  VFXMTLRenderCommandEncoder *renderEncoder;
  objc_super v26;

  objc_msgSend_setGeneratedTexturePath_(self, v3, 0, v4);
  objc_msgSend_setClientCommandBuffer_(self, v5, 0, v6);
  objc_msgSend_setClientRenderPassDescriptor_(self, v7, 0, v8);
  objc_msgSend_setClientRenderCommandEncoder_(self, v9, 0, v10);
  objc_msgSend_setClientCommandQueue_(self, v11, 0, v12);
  dispatch_release((dispatch_object_t)self->_resourceQueue);
  dispatch_release((dispatch_object_t)self->_resourceGroup);
  dispatch_release((dispatch_object_t)self->_inFlightSemaphore);
  for (i = 0; i != 3; ++i)
  {
    v14 = (char *)self + i * 8;
    v15 = self->_background2DProgram[i];
    if (v15)
    {
      CFRelease(v15);
      *((_QWORD *)v14 + 52) = 0;
    }
    v16 = (const void *)*((_QWORD *)v14 + 55);
    if (v16)
    {
      CFRelease(v16);
      *((_QWORD *)v14 + 55) = 0;
    }
  }
  backgroundVideoProgram = self->_backgroundVideoProgram;
  if (backgroundVideoProgram)
  {
    CFRelease(backgroundVideoProgram);
    self->_backgroundVideoProgram = 0;
  }
  backgroundVideoAlpha0Program = self->_backgroundVideoAlpha0Program;
  if (backgroundVideoAlpha0Program)
  {
    CFRelease(backgroundVideoAlpha0Program);
    self->_backgroundVideoAlpha0Program = 0;
  }
  sub_1B181EE08(self->_backgroundRasterizerStates);

  if (self->_maxInFlightFrameCount >= 1)
  {
    v19 = 0;
    do
    {
      if (self->_constantBufferPools[v19])
      {
        v20 = sub_1B1868B30();
        MEMORY[0x1B5E22E18](v20, 0x10B0C4030928402);
      }
      if (self->_volatileBufferPools[v19])
      {
        v21 = sub_1B1868B30();
        MEMORY[0x1B5E22E18](v21, 0x10B0C4030928402);
      }
      ++v19;
    }
    while (v19 < self->_maxInFlightFrameCount);
  }
  constantBufferPools = self->_constantBufferPools;
  if (constantBufferPools)
    MEMORY[0x1B5E22E00](constantBufferPools, 0x20C8093837F09);
  volatileBufferPools = self->_volatileBufferPools;
  if (volatileBufferPools)
    MEMORY[0x1B5E22E00](volatileBufferPools, 0x20C8093837F09);
  if (self->_frameTexturePool)
  {
    v24 = sub_1B18CFFE8();
    MEMORY[0x1B5E22E18](v24, 0x10A0C400A278675);
  }
  renderEncoder = self->_renderEncoder;
  if (renderEncoder)
  {

    MEMORY[0x1B5E22E18](renderEncoder, 0x10A0C40F855BF67);
  }

  free(self->__engineStats);
  v26.receiver = self;
  v26.super_class = (Class)VFXMTLRenderContext;
  -[VFXMTLRenderContext dealloc](&v26, sel_dealloc);
}

- (MTLDevice)device
{
  return self->_device;
}

- (__CFXEngineContext)engineContext
{
  return self->_engineContext;
}

- (MTLCommandQueue)commandQueue
{
  uint64_t v2;
  uint64_t v3;
  MTLCommandBuffer *clientCommandBuffer;
  MTLCommandQueue *result;

  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
    return (MTLCommandQueue *)objc_msgSend_commandQueue(clientCommandBuffer, a2, v2, v3);
  if (objc_msgSend_clientCommandQueue(self, a2, v2, v3))
    return self->_clientCommandQueue;
  result = self->_ownedCommandQueue;
  if (!result)
    return (MTLCommandQueue *)sub_1B18FD780((uint64_t)self->_resourceManager);
  return result;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a3)
  {
    v5 = (void *)objc_msgSend_mainScreen(MEMORY[0x1E0DC3BF8], a2, 0, v3);
    a3 = objc_msgSend_maximumFramesPerSecond(v5, v6, v7, v8);
    if (!a3)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: setPreferredFramesPerSecond - no screen"), 0, v9, v10, v11, v12, v13, v14);
      a3 = 120;
    }
  }
  self->_targetedFrameInterval = 1.0 / (float)a3;
}

- (int64_t)preferredFramesPerSecond
{
  float targetedFrameInterval;

  targetedFrameInterval = self->_targetedFrameInterval;
  if (targetedFrameInterval == 0.0)
    return 0;
  else
    return (uint64_t)(float)(1.0 / targetedFrameInterval);
}

- (void)frameConstantBufferPool
{
  return self->_frameConstantBufferPool;
}

- (__n128)setScreenTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (__n128)screenTransform
{
  return a1[2];
}

- (unsigned)features
{
  return self->_features;
}

- (int)profile
{
  return self->_profile;
}

- (BOOL)supportsMTLFeatureSet:(unint64_t)a3
{
  uint64_t v3;

  return objc_msgSend_supportsFeatureSet_(self->_device, a2, a3, v3);
}

- (void)setWantsWideGamut:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  const void *v9;

  v8 = *((_BYTE *)self + 152);
  if (((((v8 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 152) = v8 & 0xFE | a3;
    v9 = (const void *)sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
    sub_1B194F874(CFSTR("kCFXNotificationEngineContextInvalidatePasses"), v9, 0, 1u);
  }
}

- (BOOL)wantsWideGamut
{
  return *((_BYTE *)self + 152) & 1;
}

- (int64_t)pendingGPUFrameCount
{
  return (int)atomic_load((unsigned int *)&self->_pendingGPUFrameCount);
}

- (void)setEnableARMode:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 152);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 152) = v3 & 0xFB | v4;
  }
}

- (BOOL)enableARMode
{
  return (*((unsigned __int8 *)self + 152) >> 2) & 1;
}

- (void)setShouldDelegateARCompositing:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 152);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *((_BYTE *)self + 152) = v3 & 0xF7 | v4;
  }
}

- (BOOL)shouldDelegateARCompositing
{
  return (*((unsigned __int8 *)self + 152) >> 3) & 1;
}

- (void)setIsOpaque:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  const void *v10;

  v8 = *((_BYTE *)self + 152);
  if (((((v8 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v9 = 2;
    else
      v9 = 0;
    *((_BYTE *)self + 152) = v8 & 0xFD | v9;
    v10 = (const void *)sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
    sub_1B194F874(CFSTR("kCFXNotificationEngineContextInvalidatePasses"), v10, 0, 1u);
  }
}

- (void)setSampleCount:(int64_t)a3
{
  uint64_t v3;

  self->_sampleCount = sub_1B189EA44(self->_device, (const char *)a3, a3, v3);
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (BOOL)isOpaque
{
  return (*((unsigned __int8 *)self + 152) >> 1) & 1;
}

- (void)_clearUnusedBindingPoints
{
  uint64_t v2;
  _DWORD *v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t i;
  VFXMTLRenderCommandEncoder *renderEncoder;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  uint64_t j;
  VFXMTLRenderCommandEncoder *v15;
  __int16 v16;
  __int16 v17;
  const char *v18;
  const char *v19;
  uint64_t v20;

  v3 = *(_DWORD **)&self->_anon_4730[128];
  if (v3)
  {
    objc_msgSend_pushDebugGroup_(self->_renderEncoder->var3, a2, (uint64_t)CFSTR("Clear binding points"), v2);
    v8 = 0;
    for (i = 0; i != 31; ++i)
    {
      renderEncoder = self->_renderEncoder;
      if ((v3[30] & (1 << i)) != 0)
        v11 = 255;
      else
        v11 = i;
      if ((v3[31] & (1 << i)) != 0)
        v12 = -256;
      else
        v12 = v8;
      if ((_BYTE)v11 != 0xFF)
        objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v5, 0, 0, (char)v11);
      if ((~((unsigned __int16)v12 | (unsigned __int16)v11) & 0xFF00) != 0)
        objc_msgSend_setFragmentBuffer_offset_atIndex_(renderEncoder->var3, v5, 0, 0, (uint64_t)(__int16)(v12 | v11) >> 8);
      v8 += 256;
    }
    v13 = 0;
    for (j = 0; j != 31; ++j)
    {
      v15 = self->_renderEncoder;
      if ((v3[32] & (1 << j)) != 0)
        v16 = 255;
      else
        v16 = j;
      if ((v3[33] & (1 << j)) != 0)
        v17 = -256;
      else
        v17 = v13;
      if ((_BYTE)v16 != 0xFF)
      {
        v20 = 0;
        sub_1B189E888((__IOSurface *)v15->var2, (const char *)&v20, 1, v7);
        objc_msgSend_setVertexTexture_atIndex_(v15->var3, v18, v20, (char)v16);
      }
      if ((~((unsigned __int16)v17 | (unsigned __int16)v16) & 0xFF00) != 0)
      {
        v20 = 0;
        sub_1B189E888((__IOSurface *)v15->var2, (const char *)&v20, 1, v7);
        objc_msgSend_setFragmentTexture_atIndex_(v15->var3, v19, v20, (uint64_t)(__int16)(v17 | v16) >> 8);
      }
      v13 += 256;
    }
    objc_msgSend_popDebugGroup(self->_renderEncoder->var3, v5, v6, v7);
  }
}

- (__CFXEngineStats)stats
{
  return self->__engineStats;
}

- (int64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (OS_dispatch_group)resourceGroup
{
  return self->_resourceGroup;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)captureNextFrame
{
  self->_shouldCaptureNextFrame = 1;
}

- (void)beginFrame:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  atomic<int> *p_pendingGPUFrameCount;
  unsigned int v52;
  CAMetalLayer *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  VFXMTLBufferPool *v57;
  VFXMTLBufferPool *v58;
  MTLCommandBuffer *clientCommandBuffer;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  MTLCommandBuffer *currentCommandBuffer;
  _QWORD v71[7];
  _QWORD v72[6];

  v10 = self->_currentFrameIndex + 1;
  self->_currentFrameIndex = v10;
  v11 = sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v11)
  {
    v19 = sub_1B187C160(v11, v12, v13, v14, v15, v16, v17, v18);
    vfx_counters_push_frame(v19, v10);
  }
  prof_beginFlameSmallData((uint64_t)"-[VFXMTLRenderContext beginFrame:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1052, LODWORD(self->_currentFrameIndex) | 0x300000000);
  if (self->_shouldCaptureNextFrame && !self->_captureStarted)
  {
    *(_WORD *)&self->_shouldCaptureNextFrame = 256;
    v23 = objc_alloc_init(MEMORY[0x1E0CC6A40]);
    v27 = objc_msgSend_commandQueue(self, v24, v25, v26);
    objc_msgSend_setCaptureObject_(v23, v28, v27, v29);
    v32 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v30, (uint64_t)CFSTR("/tmp/vfx-capture.gputrace"), v31);
    objc_msgSend_setOutputURL_(v23, v33, v32, v34);
    v38 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v35, v36, v37);
    v42 = objc_msgSend_outputURL(v23, v39, v40, v41);
    objc_msgSend_removeItemAtURL_error_(v38, v43, v42, 0);
    objc_msgSend_setDestination_(v23, v44, 2, v45);
    v49 = (void *)objc_msgSend_sharedCaptureManager(MEMORY[0x1E0CC6A48], v46, v47, v48);
    objc_msgSend_startCaptureWithDescriptor_error_(v49, v50, (uint64_t)v23, 0);
  }
  self->_counters = 0u;
  objc_msgSend_reloadPipelinesIfNeeded(self->_resourceManager, v20, v21, v22);
  prof_beginFlameSmallData((uint64_t)"Wait inFlightSemaphore", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1087, LODWORD(self->_currentFrameIndex) | 0x300000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_inFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  p_pendingGPUFrameCount = &self->_pendingGPUFrameCount;
  do
    v52 = __ldaxr((unsigned int *)p_pendingGPUFrameCount);
  while (__stlxr(v52 + 1, (unsigned int *)p_pendingGPUFrameCount));
  prof_endFlame();

  self->_textureTarget = 0;
  self->_layerTarget = 0;
  self->_shouldPresentWithTransaction = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = (CAMetalLayer *)a3;
    self->_layerTarget = v53;
    self->_shouldPresentWithTransaction = objc_msgSend_presentsWithTransaction(v53, v54, v55, v56);
  }
  else
  {
    self->_textureTarget = (MTLTexture *)a3;
  }
  v57 = self->_constantBufferPools[self->_currentFrameIndex % self->_maxInFlightFrameCount];
  self->_frameConstantBufferPool = v57;
  sub_1B1868A9C((uint64_t)v57);
  v58 = self->_volatileBufferPools[self->_currentFrameIndex % self->_maxInFlightFrameCount];
  self->_frameVolatileBufferPool = v58;
  sub_1B1868A9C((uint64_t)v58);
  sub_1B18D05C4((uint64_t)self->_frameTexturePool);
  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
  {
    self->_currentCommandBuffer = clientCommandBuffer;
    prof_eventSmallData(0, (uint64_t)"Current CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1138, v10 | 0x300000000);
  }
  else
  {
    os_variant_has_internal_diagnostics();
    v66 = (void *)objc_msgSend_commandQueue(self, v63, v64, v65);
    self->_currentCommandBuffer = (MTLCommandBuffer *)objc_msgSend_commandBuffer(v66, v67, v68, v69);
    prof_eventSmallData(0, (uint64_t)"Current CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1164, v10 | 0x300000000);
  }
  if (self->_compilationIssues.collectEnabled)
    objc_msgSend_removeAllObjects(self->_compilationIssues.errors, v60, v61, v62);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3052000000;
  v72[3] = sub_1B1850954;
  v72[4] = sub_1B1850964;
  v72[5] = self->_inFlightSemaphore;
  currentCommandBuffer = self->_currentCommandBuffer;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = sub_1B1850970;
  v71[3] = &unk_1E63D72B0;
  v71[5] = v72;
  v71[6] = v10;
  v71[4] = self;
  objc_msgSend_addCompletedHandler_(currentCommandBuffer, v60, (uint64_t)v71, v62);
  _Block_object_dispose(v72, 8);
  prof_endFlame();
}

- (void)endFrameWorldSpecifics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_resetVolatileMeshes(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](self, sel_resetVolatileMeshElements, v5, v6);
}

- (void)endFrameWaitingUntilCompleted:(BOOL)a3 status:(unint64_t *)a4 error:(id *)a5
{
  _BOOL4 v7;
  unint64_t currentFrameIndex;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MTLCommandBuffer *resourceCommandBuffer;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id commandBufferScheduledHandlers;
  MTLCommandBuffer *currentCommandBuffer;
  MTLCommandBuffer *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id commandBufferCompletedHandlers;
  MTLCommandBuffer *v36;
  CAMetalDrawable *drawable;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id drawablePresentedHandlers;
  CAMetalDrawable *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  MTLCommandBuffer *clientCommandBuffer;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[6];
  _QWORD v63[5];
  _QWORD v64[5];

  v7 = a3;
  currentFrameIndex = self->_currentFrameIndex;
  prof_beginFlameSmallData((uint64_t)"-[VFXMTLRenderContext endFrameWaitingUntilCompleted:status:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1244, currentFrameIndex | 0x300000000);
  v17 = MEMORY[0x1E0C809B0];
  if (self->_resourceCommandBuffer)
  {
    if (self->_resourceBlitEncoder._encoder)
      sub_1B1850E30((uint64_t)&self->_resourceBlitEncoder, v10, v11, v12, v13, v14, v15, v16);
    if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, v10, v11, v12))
      sub_1B1792E3C((uint64_t)&self->_resourceComputeEncoder, v18, v19, v20, v21, v22, v23, v24);
    resourceCommandBuffer = self->_resourceCommandBuffer;
    v64[0] = v17;
    v64[1] = 3221225472;
    v64[2] = sub_1B1850E84;
    v64[3] = &unk_1E63D72D0;
    v64[4] = currentFrameIndex;
    objc_msgSend_addCompletedHandler_(resourceCommandBuffer, v18, (uint64_t)v64, v20);
    objc_msgSend_commit(self->_resourceCommandBuffer, v26, v27, v28);
    self->_resourceCommandBuffer = 0;
  }
  commandBufferScheduledHandlers = self->_commandBufferScheduledHandlers;
  if (commandBufferScheduledHandlers)
  {
    currentCommandBuffer = self->_currentCommandBuffer;
    v63[0] = v17;
    v63[1] = 3221225472;
    v63[2] = sub_1B1850F68;
    v63[3] = &unk_1E63D72F8;
    v63[4] = commandBufferScheduledHandlers;
    objc_msgSend_addScheduledHandler_(currentCommandBuffer, v10, (uint64_t)v63, v12);

    self->_commandBufferScheduledHandlers = 0;
  }
  v31 = self->_currentCommandBuffer;
  v62[0] = v17;
  v62[1] = 3221225472;
  v62[2] = sub_1B18510A8;
  v62[3] = &unk_1E63D7320;
  v62[4] = self;
  v62[5] = currentFrameIndex;
  objc_msgSend_addCompletedHandler_(v31, v10, (uint64_t)v62, v12);
  commandBufferCompletedHandlers = self->_commandBufferCompletedHandlers;
  if (commandBufferCompletedHandlers)
  {
    v36 = self->_currentCommandBuffer;
    v61[0] = v17;
    v61[1] = 3221225472;
    v61[2] = sub_1B18511B4;
    v61[3] = &unk_1E63D72F8;
    v61[4] = commandBufferCompletedHandlers;
    objc_msgSend_addCompletedHandler_(v36, v32, (uint64_t)v61, v34);

    self->_commandBufferCompletedHandlers = 0;
  }
  drawable = self->_drawable;
  if (drawable)
  {
    v60[0] = v17;
    v60[1] = 3221225472;
    v60[2] = sub_1B18512F4;
    v60[3] = &unk_1E63D7340;
    v60[4] = currentFrameIndex;
    objc_msgSend_addPresentedHandler_(drawable, v32, (uint64_t)v60, v34);
    drawablePresentedHandlers = self->_drawablePresentedHandlers;
    if (drawablePresentedHandlers)
    {
      v42 = self->_drawable;
      v59[0] = v17;
      v59[1] = 3221225472;
      v59[2] = sub_1B1851384;
      v59[3] = &unk_1E63D7368;
      v59[4] = drawablePresentedHandlers;
      objc_msgSend_addPresentedHandler_(v42, v38, (uint64_t)v59, v40);

      self->_drawablePresentedHandlers = 0;
    }
    if (self->_shouldPresentWithTransaction)
    {
      objc_msgSend_begin(MEMORY[0x1E0CD28B0], v38, v39, v40);
      if (!pthread_main_np())
        objc_msgSend_activateBackground_(MEMORY[0x1E0CD28B0], v38, 1, v40);
    }
    if (self->_shouldPresentAfterMinimumDuration
      && objc_msgSend_maximumDrawableCount(self->_layerTarget, v38, v39, v40) == 3)
    {
      objc_msgSend_presentDrawable_afterMinimumDuration_(self->_currentCommandBuffer, v38, (uint64_t)self->_drawable, v40, self->_targetedFrameInterval);
    }
    else
    {
      objc_msgSend_presentDrawable_(self->_currentCommandBuffer, v38, (uint64_t)self->_drawable, v40);
    }
    if (self->_shouldPresentWithTransaction)
      objc_msgSend_commit(MEMORY[0x1E0CD28B0], v43, v44, v45);

    self->_drawable = 0;
  }
  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
  {
    if (v7)
    {
      objc_msgSend_waitUntilCompleted(clientCommandBuffer, v32, v33, v34);
      if (a4)
        *a4 = objc_msgSend_status(self->_clientCommandBuffer, v32, v47, v34);
      if (a5)
        *a5 = 0;
    }
    objc_msgSend_setClientCommandBuffer_(self, v32, 0, v34);
  }
  else
  {
    dispatch_group_wait((dispatch_group_t)self->_resourceGroup, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_commit(self->_currentCommandBuffer, v50, v51, v52);
    if (v7)
    {
      objc_msgSend_waitUntilCompleted(self->_currentCommandBuffer, v48, v53, v49);
      if (a4)
        *a4 = objc_msgSend_status(self->_currentCommandBuffer, v48, v54, v49);
      if (a5)
        *a5 = (id)objc_msgSend_error(self->_currentCommandBuffer, v48, v54, v49);
    }
  }
  objc_msgSend_setClientRenderCommandEncoder_(self, v48, 0, v49);
  objc_msgSend_setClientRenderPassDescriptor_(self, v55, 0, v56);
  objc_msgSend_setClientCommandQueue_(self, v57, 0, v58);
  self->_currentCommandBuffer = 0;
  *(_QWORD *)&self->_anon_4100[704] = 0;

  self->_textureTarget = 0;
  self->_layerTarget = 0;

  self->_drawable = 0;
  prof_endFlame();
}

- (MTLTexture)textureTarget
{
  return self->_textureTarget;
}

- (CAMetalLayer)layerTarget
{
  return self->_layerTarget;
}

- (id)_finalRenderTexture
{
  VFXTextureAttachmentProvider *attachmentProvider;
  uint64_t v4;
  id Path;
  const char *v6;
  id result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CAMetalDrawable *drawable;
  double v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  uint8_t v32[16];
  uint8_t buf[16];

  attachmentProvider = self->_attachmentProvider;
  v4 = RGResourceIdentifierFinalColor((CFX::RG::ResourceIdentifier *)self);
  Path = RGResourceIdentifierGetPath(v4);
  result = (id)objc_msgSend_textureForAttachment_withDescriptor_(attachmentProvider, v6, (uint64_t)Path, 0);
  if (!result)
  {
    if (self->_layerTarget)
    {
      drawable = self->_drawable;
      if (!drawable)
      {
        v12 = CACurrentMediaTime();
        prof_beginFlame((uint64_t)"waitDrawable", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1609);
        v31 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v13 = -3;
        do
        {
          v14 = v13;
          v15 = sub_1B18137DC((uint64_t)self->_engineContext);
          v16 = sub_1B17C439C();
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v20 = v16;
            if (os_signpost_enabled(v16))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B178D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v15, "WaitDrawable", ", buf, 2u);
            }
          }
          v21 = (void *)objc_msgSend_nextDrawable(self->_layerTarget, v17, v18, v19);
          v22 = sub_1B17C439C();
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v29 = v22;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)v32 = 0;
              _os_signpost_emit_with_name_impl(&dword_1B178D000, v29, OS_SIGNPOST_INTERVAL_END, v15, "WaitDrawable", ", v32, 2u);
            }
          }
          if (v21)
            break;
          v13 = v14 + 1;
        }
        while (v14);
        if (!v21)
          sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Failed getting a valid drawable. Skipping this frame."), v23, v24, v25, v26, v27, v28, v30);
        self->__engineStats->drawableWaitTime = CACurrentMediaTime() - v12 + self->__engineStats->drawableWaitTime;
        prof_endFlame();
        self->_drawable = (CAMetalDrawable *)v21;

        drawable = self->_drawable;
      }
      return (id)objc_msgSend_texture(drawable, v8, v9, v10);
    }
    else
    {
      return self->_textureTarget;
    }
  }
  return result;
}

- (id)_reflectionProbeArrayTexture
{
  return *(id *)&self->_anon_4100[704];
}

- (void)_setReflectionProbeArrayTexture:(id)a3
{
  *(_QWORD *)&self->_anon_4100[704] = a3;
}

- (void)_clusterInfo
{
  return &self->_anon_4100[336];
}

- (void)_clearRenderCaches
{
  *(_OWORD *)&self->_anon_4730[128] = 0u;
  *(_OWORD *)&self->_anon_4730[112] = 0u;
  *(_OWORD *)&self->_anon_4730[96] = 0u;
  *(_OWORD *)&self->_anon_4730[80] = 0u;
  *(_OWORD *)&self->_anon_4730[64] = 0u;
  *(_OWORD *)&self->_anon_4730[48] = 0u;
  *(_OWORD *)&self->_anon_4730[32] = 0u;
  *(_OWORD *)&self->_anon_4730[16] = 0u;
  *(_OWORD *)self->_anon_4730 = 0u;
  *(_OWORD *)&self->_cache.tessellationPipelineStateHash = 0u;
  *(_OWORD *)&self->_cache.deformers = 0u;
  *(_OWORD *)&self->_cache.node = 0u;
  *(_OWORD *)&self->_cache.blendStates = 0u;
  *(_OWORD *)&self->_cache.metalShadable = 0u;
  *(_OWORD *)&self->_cache.material = 0u;
  *(_OWORD *)&self->_cache.metalMeshElement = 0u;
  *(_OWORD *)&self->_cache.metalMesh = 0u;
  *(_OWORD *)&self->_cache.rasterizerStates = 0u;
}

- (void)_createResourceCommandBufferIfNeeded
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  MTLCommandBuffer *resourceCommandBuffer;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  if (!self->_resourceCommandBuffer)
  {
    os_variant_has_internal_diagnostics();
    v6 = (void *)objc_msgSend_commandQueue(self, v3, v4, v5);
    self->_resourceCommandBuffer = (MTLCommandBuffer *)objc_msgSend_commandBuffer(v6, v7, v8, v9);
    prof_eventSmallData(0, (uint64_t)"Resource CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1702, LODWORD(self->_currentFrameIndex) | 0x300000000);
    resourceCommandBuffer = self->_resourceCommandBuffer;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B18517BC;
    v16[3] = &unk_1E63D72F8;
    v16[4] = self;
    objc_msgSend_addCompletedHandler_(resourceCommandBuffer, v11, (uint64_t)v16, v12);
    objc_msgSend_enqueue(self->_resourceCommandBuffer, v13, v14, v15);
  }
}

- (MTLCommandBuffer)resourceCommandBuffer
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!self->_resourceCommandBuffer)
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3))
    sub_1B1792E3C((uint64_t)&self->_resourceComputeEncoder, v5, v6, v7, v8, v9, v10, v11);
  if (self->_resourceBlitEncoder._encoder)
    sub_1B1850E30((uint64_t)&self->_resourceBlitEncoder, v5, v6, v7, v8, v9, v10, v11);
  return self->_resourceCommandBuffer;
}

- (VFXMTLBlitCommandEncoder)resourceBlitEncoder
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!self->_resourceCommandBuffer)
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3))
    sub_1B1792E3C((uint64_t)&self->_resourceComputeEncoder, v5, v6, v7, v8, v9, v10, v11);
  if (!self->_resourceBlitEncoder._encoder)
    sub_1B1792B08(&self->_resourceBlitEncoder._encoder, self->_resourceCommandBuffer, 0, v7, v8, v9, v10, v11);
  return &self->_resourceBlitEncoder;
}

- (VFXMTLComputeCommandEncoder)resourceComputeEncoder
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  MTLCommandBuffer *resourceCommandBuffer;
  VFXMTLBufferPool *frameConstantBufferPool;
  const char *v12;
  uint64_t v13;

  if (!self->_resourceCommandBuffer)
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  if (self->_resourceBlitEncoder._encoder)
    sub_1B1850E30((uint64_t)&self->_resourceBlitEncoder, a2, v2, v3, v4, v5, v6, v7);
  if ((objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3) & 1) == 0)
  {
    resourceCommandBuffer = self->_resourceCommandBuffer;
    frameConstantBufferPool = (VFXMTLBufferPool *)self->_frameConstantBufferPool;
    self->_resourceComputeEncoder._features = self->_features;
    self->_resourceComputeEncoder._commandBuffer = resourceCommandBuffer;
    objc_msgSend_loadWithCommandBuffer_label_(self->_resourceComputeEncoder._encoder, v9, (uint64_t)resourceCommandBuffer, (uint64_t)CFSTR("ResourceComputeEncoder"));
    self->_resourceComputeEncoder._bufferPool = frameConstantBufferPool;
    objc_msgSend_setLabel_(self->_resourceComputeEncoder._encoder, v12, (uint64_t)CFSTR("ResourceComputeEncoder"), v13);
  }
  return &self->_resourceComputeEncoder;
}

- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  MTLRenderPassDescriptor *currentRenderPassDescriptor;

  self->_renderEncoder = (VFXMTLRenderCommandEncoder *)a4;
  v6 = (void *)objc_msgSend_colorAttachments(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  v16 = (void *)objc_msgSend_texture(v9, v10, v11, v12);
  if (!v16)
  {
    v17 = (void *)objc_msgSend_depthAttachment(a3, v13, v14, v15);
    v16 = (void *)objc_msgSend_texture(v17, v18, v19, v20);
  }
  *(float *)self->_renderSize = (float)(unint64_t)objc_msgSend_width(v16, v13, v14, v15);
  *(float *)&self->_renderSize[4] = (float)(unint64_t)objc_msgSend_height(v16, v21, v22, v23);
  objc_msgSend__clearRenderCaches(self, v24, v25, v26);
  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  self->_currentRenderPassDescriptor = (MTLRenderPassDescriptor *)a3;
  self->_originalRenderPassDescriptor = currentRenderPassDescriptor;
}

- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4 parameters:(id)a5
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;

  v5 = *(_QWORD *)&a5.var0;
  objc_msgSend_beginRenderPass_renderEncoder_(self, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setRenderPassParameters_(self, v7, v5 & 0xFFFFFFFFFFLL, v8);
}

- (void)setRenderPassParameters:(id)a3
{
  self->_renderPassParameters = ($A377741CE82F7EFB2C85CC9BE95A1EAA)a3;
}

- (void)endRenderPass
{
  self->_renderEncoder = 0;
  self->_renderGraph = 0u;
  self->_currentRenderPassDescriptor = self->_originalRenderPassDescriptor;
}

- (VFXTextureAttachmentProvider)attachmentProvider
{
  return self->_attachmentProvider;
}

- (void)setAttachmentProvider:(id)a3
{
  id v5;

  v5 = a3;

  self->_attachmentProvider = (VFXTextureAttachmentProvider *)a3;
}

- (id)textureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  return (id)objc_msgSend_renderResourceForMaterialProperty_withEngineContext_didFallbackToDefaultTexture_isDynamic_(self->_resourceManager, a2, (uint64_t)a3, (uint64_t)self->_engineContext, 0, 0);
}

- (id)irradianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t lightingSystem;
  VFXMTLResourceManager *resourceManager;
  id result;
  _QWORD v27[5];

  v10 = sub_1B1842EE4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v10)
    return (id)MEMORY[0x1E0DE7D20](self->_resourceManager, sel_irradianceTextureForPrecomputedLightingEnvironment_, v10, v12);
  result = (id)objc_msgSend_textureForMaterialProperty_(self, v11, (uint64_t)a3, v12);
  if (result)
  {
    v16 = result;
    if (objc_msgSend_textureType(result, v13, v14, v15) == 5)
    {
      lightingSystem = (uint64_t)self->_processingContext.lightingSystem;
      if (lightingSystem)
        lightingSystem = sub_1B1796998(lightingSystem, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
      resourceManager = self->_resourceManager;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1B1851BC0;
      v27[3] = &unk_1E63D7388;
      v27[4] = lightingSystem;
      return (id)objc_msgSend_irradianceTextureForEnvironmentTexture_renderContext_applySH_(resourceManager, v17, (uint64_t)v16, (uint64_t)self, v27);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)radianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  VFXMTLResourceManager *resourceManager;
  __CFXEngineContext *engineContext;

  v10 = sub_1B1842EE4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v10)
    return (id)MEMORY[0x1E0DE7D20](self->_resourceManager, sel_radianceTextureForPrecomputedLightingEnvironment_, v10, v12);
  v13 = (void *)objc_msgSend_textureForMaterialProperty_(self, v11, (uint64_t)a3, v12);
  if (!v13)
    return 0;
  v17 = v13;
  if (objc_msgSend_textureType(v13, v14, v15, v16) != 5)
    return 0;
  resourceManager = self->_resourceManager;
  engineContext = self->_engineContext;
  objc_msgSend_resourceCommandBuffer(self, v18, v19, v20);
  return (id)MEMORY[0x1E0DE7D20](resourceManager, sel_radianceTextureForEnvironmentTexture_engineContext_commandBuffer_, v17, engineContext);
}

- (void)_logLightingInformation
{
  _DWORD *next;
  uint64_t v4;

  NSLog(CFSTR("LightingSet: uploaded count: %d"), a2, self->_lighting.frameLightingSetDatas.__table_.__p2_.__value_);
  next = self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_;
  if (next)
  {
    LODWORD(v4) = 0;
    do
    {
      v4 = (v4 + next[10]);
      next = *(_DWORD **)next;
    }
    while (next);
  }
  else
  {
    v4 = 0;
  }
  NSLog(CFSTR("  LightingSet: uploaded size %d bytes"), v4);
}

- (void)setRasterizerStates:(__CFXRasterizerStates *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXRasterizerStates *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFXRasterizerStates *rasterizerStates;
  int v18;
  int v19;
  int v20;
  VFXMTLRenderCommandEncoder *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;

  v8 = a3;
  if (!a3)
    v8 = (__CFXRasterizerStates *)sub_1B181EEC0();
  if (self->_cache.rasterizerStates != v8)
  {
    v37 = 0;
    v38 = 0;
    v40 = 0;
    v39 = 0;
    sub_1B181EE68((uint64_t)v8, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&v37);
    rasterizerStates = self->_cache.rasterizerStates;
    if (!rasterizerStates)
    {
      LOBYTE(v20) = -1;
      v18 = v37;
      goto LABEL_29;
    }
    v33 = 0;
    v34 = 0;
    v36 = 0;
    v35 = 0;
    sub_1B181EE68((uint64_t)rasterizerStates, v11, v12, v13, v14, v15, v16, (uint64_t)&v33);
    v18 = v37;
    if (HIDWORD(v33) == HIDWORD(v37))
      v19 = v33 != v37;
    else
      v19 = ((_DWORD)v33 != (_DWORD)v37) | 2;
    if (v34 == v38)
      v20 = v19;
    else
      v20 = v19 | 4;
    if ((_BYTE)v38)
    {
      if (BYTE2(v34) != BYTE2(v38) || v34 == 0)
        v20 |= 8u;
      if ((_BYTE)v34 && BYTE1(v34) == BYTE1(v38))
      {
LABEL_24:
        if (BYTE3(v38) | BYTE3(v34))
        {
          LOBYTE(v20) = v20 | 0x20;
        }
        else if (!v20)
        {
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v11, v12, v13, v14, v15, v16, (uint64_t)"setMask");
LABEL_34:
          self->_cache.rasterizerStates = v8;
          return;
        }
        if ((v20 & 1) == 0)
        {
LABEL_30:
          if ((v20 & 2) != 0)
          {
            renderEncoder = self->_renderEncoder;
            v27 = sub_1B189D00C(HIDWORD(v37), v10, v11, v12, v13, v14, v15, v16);
            objc_msgSend_setTriangleFillMode_(renderEncoder->var3, v28, v27, v29);
          }
          if ((v20 & 0x3C) != 0)
          {
            v30 = sub_1B18FA408((uint64_t)self->_resourceManager, (uint64_t)v8);
            objc_msgSend_setDepthStencilState_(self->_renderEncoder->var3, v31, (uint64_t)v30, v32);
          }
          goto LABEL_34;
        }
LABEL_29:
        v22 = self->_renderEncoder;
        v23 = sub_1B189CFB8(v18, v10, v11, v12, v13, v14, v15, v16);
        objc_msgSend_setCullMode_(v22->var3, v24, v23, v25);
        goto LABEL_30;
      }
    }
    else
    {
      if ((_BYTE)v34)
        goto LABEL_24;
      v20 |= 8u;
    }
    v20 |= 0x10u;
    goto LABEL_24;
  }
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v3;

  objc_msgSend_pushDebugGroup_(self->_renderEncoder->var3, a2, (uint64_t)a3, v3);
}

- (void)popDebugGroup
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_popDebugGroup(self->_renderEncoder->var3, a2, v2, v3);
}

- (void)_setWorldBufferAtVertexIndex:(int64_t)a3 fragmentIndex:(int64_t)a4
{
  if (a3 != -1)
    objc_msgSend_setVertexBuffer_offset_atIndex_(self->_renderEncoder->var3, a2, (uint64_t)self->_worldUniforms.buffer, self->_worldUniforms.offset, a3);
  if (a4 != -1)
    objc_msgSend_setFragmentBuffer_offset_atIndex_(self->_renderEncoder->var3, a2, (uint64_t)self->_worldUniforms.buffer, self->_worldUniforms.offset, a4);
}

- (void)_setMeshBuffers:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  VFXMTLRenderCommandEncoder *renderEncoder;
  _OWORD v15[7];
  uint64_t v16[15];

  v16[14] = *MEMORY[0x1E0C80C00];
  memset(v15, 0, sizeof(v15));
  v5 = (void *)sub_1B1955CE0((uint64_t)a3);
  v9 = objc_msgSend_count(v5, v6, v7, v8);
  if (v9 >= 0xE)
    v10 = 14;
  else
    v10 = v9;
  v11 = (void *)sub_1B1955CE0((uint64_t)a3);
  objc_msgSend_getObjects_range_(v11, v12, (uint64_t)v16, 0, v10);
  if (sub_1B1955D20((uint64_t)a3))
  {
    *((_QWORD *)v15 + v10) = sub_1B1955D40((uint64_t)a3);
    v16[v10++] = sub_1B1955D20((uint64_t)a3);
  }
  renderEncoder = self->_renderEncoder;
  if (v10 == 1)
    objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v13, v16[0], *(uint64_t *)&v15[0], 18);
  else
    objc_msgSend_setVertexBuffers_offsets_withRange_(renderEncoder->var3, v13, (uint64_t)v16, (uint64_t)v15, 18, v10);
}

- (void)_drawMeshElement:(id)a3 instanceCount:(unint64_t)a4
{
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  int v25;
  __CFXEngineStats *engineStats;
  VFXMTLMesh *metalMesh;
  int v28;
  uint64_t v29;
  VFXMTLRenderCommandEncoder *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  id var3;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  id v51;

  ++self->__engineStats->drawCount;
  if (sub_1B1955CE0((uint64_t)a3))
  {
    renderEncoder = self->_renderEncoder;
    v8 = sub_1B18FD774((uint64_t)a3);
    v9 = sub_1B1955D00((uint64_t)a3);
    v10 = (void *)sub_1B1956188((uint64_t)a3);
    v14 = objc_msgSend_buffer(v10, v11, v12, v13);
    v15 = sub_1B1955EF4((uint64_t)a3);
    v16 = (void *)sub_1B1956188((uint64_t)a3);
    v20 = objc_msgSend_offset(v16, v17, v18, v19);
    v21 = v20 + v15 + sub_1B18FD768((uint64_t)a3);
    v22 = sub_1B1955CE0((uint64_t)a3);
    v23 = sub_1B1955D40((uint64_t)a3);
    objc_msgSend_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_(renderEncoder->var3, v24, v8, v9, v14, v21, v22, v23);
  }
  else
  {
    v29 = sub_1B1956188((uint64_t)a3);
    v30 = self->_renderEncoder;
    v31 = sub_1B18FD774((uint64_t)a3);
    if (v29)
    {
      v32 = sub_1B1955D20((uint64_t)a3);
      v33 = sub_1B1955D00((uint64_t)a3);
      v34 = (void *)sub_1B1956188((uint64_t)a3);
      v38 = objc_msgSend_buffer(v34, v35, v36, v37);
      v39 = sub_1B1955EF4((uint64_t)a3);
      v40 = (void *)sub_1B1956188((uint64_t)a3);
      v44 = objc_msgSend_offset(v40, v41, v42, v43);
      v46 = v44 + v39 + sub_1B18FD768((uint64_t)a3);
      var3 = v30->var3;
      if (v30->var0 * a4 < 2)
        objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_(var3, v45, v31, v32, v33, v38, v46);
      else
        objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(var3, v45, v31, v32, v33, v38, v46);
    }
    else
    {
      v48 = sub_1B1955EF4((uint64_t)a3);
      v50 = sub_1B1955D20((uint64_t)a3);
      v51 = v30->var3;
      if (v30->var0 * a4 < 2)
        objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v51, v49, v31, v48, v50);
      else
        objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(v51, v49, v31, v48, v50);
    }
  }
  v25 = sub_1B19560E8((uint64_t)a3);
  engineStats = self->__engineStats;
  engineStats->primitivesProcessed += v25 * a4;
  metalMesh = self->_cache.metalMesh;
  if (metalMesh)
  {
    v28 = sub_1B186FCC4((uint64_t)metalMesh) * a4;
    engineStats = self->__engineStats;
  }
  else
  {
    v28 = 0;
  }
  engineStats->verticesProcessed += v28;
}

- (void)_drawPatchForMeshElement:(id)a3 instanceCount:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  int v33;
  __CFXEngineStats *engineStats;
  VFXMTLMesh *metalMesh;
  int v36;

  if (sub_1B1955D00((uint64_t)a3) != 1 && sub_1B1955D00((uint64_t)a3))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Control point indices must be 16-bit or 32-bit"), v7, v8, v9, v10, v11, v12, (uint64_t)"element.indexType == MTLIndexTypeUInt32 || element.indexType == MTLIndexTypeUInt16");
  if (sub_1B18FD774((uint64_t)a3) != 3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Only triangle arrays are supported for tessellation"), v13, v14, v15, v16, v17, v18, (uint64_t)"element.primitiveType == MTLPrimitiveTypeTriangle");
  ++self->__engineStats->drawCount;
  renderEncoder = self->_renderEncoder;
  v20 = sub_1B195606C((uint64_t)a3);
  v21 = (void *)sub_1B1956188((uint64_t)a3);
  v25 = objc_msgSend_buffer(v21, v22, v23, v24);
  v26 = (void *)sub_1B1956188((uint64_t)a3);
  v30 = objc_msgSend_offset(v26, v27, v28, v29);
  v31 = sub_1B18FD768((uint64_t)a3);
  objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_(renderEncoder->var3, v32, 3, 0, v20, 0, 0, v25, v31 + v30, renderEncoder->var0 * a4, 0);
  v33 = sub_1B195606C((uint64_t)a3);
  engineStats = self->__engineStats;
  engineStats->primitivesProcessed += v33 * a4;
  metalMesh = self->_cache.metalMesh;
  if (metalMesh)
  {
    v36 = sub_1B186FCC4((uint64_t)metalMesh) * a4;
    engineStats = self->__engineStats;
  }
  else
  {
    v36 = 0;
  }
  engineStats->verticesProcessed += v36;
}

- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(id *)a3
{
  __int128 v3;
  float v5;
  double v6;
  int32x2_t v7;
  __n128 v8;
  float v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  float v14;
  double v15;
  double v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int8x8_t v23;
  _OWORD v24[4];
  _OWORD v25[4];

  v3 = *((_OWORD *)a3 + 2);
  if (*((float *)&v3 + 3) == 0.0)
  {
    v5 = *((float *)a3 + 14);
    v6 = (v5 + -1.0) / *((float *)&v3 + 2);
    *(float *)&v6 = v6;
    *(float *)v7.i32 = v5 / *((float *)&v3 + 2);
    *(float *)&v3 = *(float *)v7.i32;
    v7.i32[1] = LODWORD(v6);
    v23 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v3, *(float32x2_t *)&v6), 0), (int8x8_t)vrev64_s32(v7), (int8x8_t)v7);
    v8 = sub_1B1815A98((__n128 *)self->_engineContext);
    if (v8.n128_f32[3] == 0.0)
      v9 = 1.0;
    else
      v9 = v8.n128_f32[2] / v8.n128_f32[3];
    v10 = *(float *)v23.i32;
    v11 = __tanpi(0.166666667);
    v12 = 0;
    if (v11 == 0.0)
      v13 = 1.0;
    else
      v13 = 1.0 / v11;
    v14 = v13;
    v15 = v10 + 1.0;
    if (*(float *)&v23.i32[1] > *(float *)v23.i32)
      v15 = *(float *)&v23.i32[1];
    v16 = v15 / (v10 - v15);
    *(float *)&v17 = v16;
    *(float *)&v16 = v16 * v10;
    *(_QWORD *)&v18 = 0;
    *((_QWORD *)&v18 + 1) = __PAIR64__(-1.0, v17);
    *(_QWORD *)&v19 = 0;
    *((_QWORD *)&v19 + 1) = LODWORD(v16);
    LODWORD(v16) = 0;
    *((float *)&v16 + 1) = v9 * v14;
    v24[0] = LODWORD(v14);
    v24[1] = *(unint64_t *)&v16;
    v24[2] = v18;
    v24[3] = v19;
    do
    {
      v25[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(v24[v12])), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)&v24[v12], 1), (float32x4_t)xmmword_1B2244DF0, (float32x4_t)v24[v12], 2), (float32x4_t)xmmword_1B2244E10, (float32x4_t)v24[v12], 3);
      ++v12;
    }
    while (v12 != 4);
    v20 = v25[1];
    v21 = v25[2];
    v22 = v25[3];
    *(_OWORD *)a3 = v25[0];
    *((_OWORD *)a3 + 1) = v20;
    *((_OWORD *)a3 + 2) = v21;
    *((_OWORD *)a3 + 3) = v22;
  }
}

- (float)_zFarForSkyboxRenderingProjectionMatrix:(id *)a3 defaultZFar:(float)result
{
  if (result <= 0.0)
    return 1.0;
  return result;
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:(uint64_t)a5
{
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float32x4_t *v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float32x4_t *v52;
  unint64_t v53;
  float32x4_t v54;
  float32x4_t v55;
  __int128 v56;
  float32x4_t *v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  VFXMTLMesh *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  const char *v90;
  char v91;
  char v92;
  char v93;
  void *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  unint64_t v139;
  float32x4_t *v140;
  _BOOL4 v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  float32x4_t *v149;
  unint64_t v150;
  float32x4_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  float32x4_t v164;
  float32x4_t v165;
  float32x4_t v166;
  float32x4_t v167;
  float32x4_t v168;
  float32x4_t v169;
  __int128 v170;
  float32x4_t *v171;
  float32x4_t v172;
  float32x4_t v173;
  float32x4_t v174;
  float32x4_t v175;
  uint64_t v176;
  double v177;
  const char *v178;
  uint64_t v179;
  int v180;
  uint64_t v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  double v191;
  const char *v192;
  uint64_t v193;
  int v194;
  uint64_t v195;
  const char *v196;
  const char *v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  VFXMTLMesh *v206;
  float32x4_t v207;
  __int128 v208;
  float32x4_t v209;
  float32x4_t v210;
  __int128 v211;
  float32x4_t v212;
  float32x4_t v213;
  __int128 v214;
  float32x4_t v215;
  float32x4_t v216;
  __int128 v217;
  float32x4_t v218;
  float32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  float32x4_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  int v231;
  int v232;
  float v233;
  uint64_t v234;
  __int128 v235;
  __int128 v236;
  VFXMTLMesh *v237;
  uint64_t v238;
  uint64_t v239;
  __int16 v240;
  char v241;
  char v242;
  char v243;
  __int128 v244;
  _BYTE v245[19];
  void *v246;
  float32x4_t v247;
  float32x4_t v248;
  float32x4_t v249;
  float32x4_t v250;
  float32x4_t v251;
  float32x4_t v252;
  float32x4_t v253;
  __int128 v254;

  v246 = 0;
  v12 = sub_1B1842D3C(a3, a2, a3, a4, a5, a6, a7, a8);
  v13 = sub_1B1815870(a4);
  v21 = (const void *)v13;
  if (v13 && sub_1B181F5A8(v13) != v12)
  {
    sub_1B1815820(a4, 0);
    v21 = 0;
  }
  if (!v12)
  {
    v28 = (void *)objc_msgSend_textureForMaterialProperty_((void *)a1, v14, a3, v16);
    goto LABEL_12;
  }
  v27 = sub_1B1842028(a3, (uint64_t)v14, v15, v16, v17, v18, v19, v20);
  if (v27)
  {
    if (!v21)
    {
LABEL_10:
      v21 = (const void *)sub_1B181F11C(v12, v27, a4, v22, v23, v24, v25, v26);
      sub_1B1815820(a4, v21);
      CFRelease(v21);
      if (!v21)
        return;
    }
  }
  else
  {
    v27 = sub_1B180CF10();
    if (!v21)
      goto LABEL_10;
  }
  v28 = (void *)sub_1B181F4A8((uint64_t)v21, a4, v27, (uint64_t)&v223, v23, v24, v25, v26);
LABEL_12:
  v36 = v28;
  v246 = v28;
  if (!v28)
    return;
  v37 = sub_1B1813884(a4, v29, v30, v31, v32, v33, v34, v35);
  if (objc_msgSend_textureType(v36, v38, v39, v40) == 5)
  {
    v41 = sub_1B1813954(a4);
    v42 = *(_QWORD *)(a1 + 8 * *(unsigned __int8 *)(a1 + 314) + 440);
    v43 = (float32x4_t *)sub_1B1815A5C(a4, 1);
    v44 = sub_1B1842B54(a3);
    v213 = v43[2];
    v216 = *v43;
    v210 = v43[1];
    if (v44)
    {
      v207 = v43[3];
      v52 = (float32x4_t *)sub_1B1842B0C(a3, v45, v46, v47, v48, v49, v50, v51);
      v53 = 0;
      v54 = v52[1];
      v55 = v52[2];
      v56 = (__int128)v52[3];
      v251 = *v52;
      v252 = v54;
      v253 = v55;
      v254 = v56;
      do
      {
        *(__int128 *)((char *)&v223 + v53) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v216, COERCE_FLOAT(*(_OWORD *)((char *)&v251 + v53))), v210, *(float32x2_t *)&v251.f32[v53 / 4], 1), v213, *(float32x4_t *)((char *)&v251 + v53), 2), v207, *(float32x4_t *)((char *)&v251 + v53), 3);
        v53 += 16;
      }
      while (v53 != 64);
      v210 = (float32x4_t)v224;
      v213 = (float32x4_t)v225;
      v216 = (float32x4_t)v223;
    }
    v57 = (float32x4_t *)sub_1B1815A5C(*(_QWORD *)(a1 + 144), 0);
    v58 = v57[3];
    v60 = *v57;
    v59 = v57[1];
    v249 = v57[2];
    v250 = v58;
    v247 = v60;
    v248 = v59;
    objc_msgSend__updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded_((void *)a1, v61, (uint64_t)&v247, v62);
    v65 = 0;
    v66 = v247;
    v67 = v248;
    v68 = v249;
    v69 = v250;
    v251 = v216;
    v252 = v210;
    v253 = v213;
    v254 = xmmword_1B2244E20;
    do
    {
      *(__int128 *)((char *)&v223 + v65) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, COERCE_FLOAT(*(_OWORD *)((char *)&v251 + v65))), v67, *(float32x2_t *)&v251.f32[v65 / 4], 1), v68, *(float32x4_t *)((char *)&v251 + v65), 2), v69, *(float32x4_t *)((char *)&v251 + v65), 3);
      v65 += 16;
    }
    while (v65 != 64);
    v208 = v223;
    v211 = v224;
    v214 = v225;
    v70 = v226;
  }
  else
  {
    v41 = sub_1B1815878(a4);
    v42 = *(_QWORD *)(a1 + 8 * *(unsigned __int8 *)(a1 + 314) + 416);
    if (!sub_1B1842B54(a3))
    {
      v217 = xmmword_1B2244E20;
      v214 = xmmword_1B2244D90;
      v211 = xmmword_1B2244DD0;
      v208 = xmmword_1B2244DB0;
      goto LABEL_25;
    }
    v76 = (__int128 *)sub_1B1842B0C(a3, (uint64_t)v63, v71, v64, v72, v73, v74, v75);
    v208 = *v76;
    v211 = v76[1];
    v214 = v76[2];
    v70 = v76[3];
  }
  v217 = v70;
LABEL_25:
  objc_msgSend_pushDebugGroup_((void *)a1, v63, (uint64_t)CFSTR("VFX - Draw world background"), v64);
  v77 = sub_1B18FB1C0(*(_QWORD *)(a1 + 112), v41, 1);
  v81 = (void *)objc_msgSend_colorAttachments(*(void **)(a1 + 216), v78, v79, v80);
  v84 = (void *)objc_msgSend_objectAtIndexedSubscript_(v81, v82, 0, v83);
  objc_msgSend_clearColor(v84, v85, v86, v87);
  if (v88 == 1.0)
    v89 = sub_1B18A7C20();
  else
    v89 = sub_1B18A7BA0();
  v91 = *(_BYTE *)(a1 + 313);
  v92 = *(_BYTE *)(a1 + 314);
  if (*(_BYTE *)(a1 + 315) == 2)
    v93 = 2;
  else
    v93 = 1;
  v94 = *(void **)(a1 + 112);
  v235 = 0u;
  v236 = 0u;
  v234 = v42;
  v237 = v77;
  v238 = v89;
  v239 = 0;
  v240 = 783;
  v241 = v91;
  v242 = v93;
  v243 = v92;
  v244 = 0u;
  memset(v245, 0, sizeof(v245));
  v95 = (void *)objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(v94, v90, (uint64_t)&v234, *(_QWORD *)(a1 + 216));
  v96 = *(_QWORD *)(a1 + 248);
  v100 = objc_msgSend_state(v95, v97, v98, v99);
  objc_msgSend_setRenderPipelineState_(*(void **)(v96 + 16), v101, v100, v102);
  objc_msgSend_setRasterizerStates_((void *)a1, v103, *(_QWORD *)(a1 + 480), v104);
  v233 = sub_1B1841E14(a3, v105, v106, v107, v108, v109, v110, v111);
  v112 = *(_QWORD *)(a1 + 248);
  v223 = 0uLL;
  *(_QWORD *)&v224 = 0;
  sub_1B1868D14(*(_QWORD *)(v112 + 24), &v233, 4uLL, (void **)&v223);
  objc_msgSend_setFragmentBuffer_offset_atIndex_(*(void **)(v112 + 16), v113, *((uint64_t *)&v223 + 1), v224, 0);
  v121 = sub_1B1842028(a3, v114, v115, v116, v117, v118, v119, v120);
  if (!v121)
    v121 = sub_1B180CF10();
  v122 = sub_1B18FD03C(*(_QWORD *)(a1 + 112), v121);
  if (objc_msgSend_pixelFormat(v36, v123, v124, v125) == 520 || objc_msgSend_pixelFormat(v36, v126, v127, v128) == 500)
  {
    v129 = *(void **)(*(_QWORD *)(a1 + 248) + 16);
    sub_1B189E888(*(__IOSurface **)(a1 + 240), (const char *)&v246, 1, v128);
    objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(v129, v130, (uint64_t)v246, 0, v122, 0);
  }
  else
  {
    sub_1B179AEE4(*(_QWORD *)(a1 + 248), v36, 0, v128);
    objc_msgSend_setFragmentSamplerState_atIndex_(*(void **)(*(_QWORD *)(a1 + 248) + 16), v138, (uint64_t)v122, 0);
  }
  if (*(_BYTE *)(a1 + 314))
  {
    v206 = v77;
    if (!a5)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v132, v133, v134, v135, v136, v137, (uint64_t)"currentPassInstance");
    if (*(_BYTE *)(a1 + 313))
    {
      v139 = 0;
      do
      {
        if (v139 >= 6)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. invalid index"), v132, v133, v134, v135, v136, v137, (uint64_t)"i < 6");
        v140 = (float32x4_t *)(a5 + (v139 << 6));
        v141 = sub_1B1842B54(a3);
        v215 = v140[524];
        v218 = v140[523];
        v209 = v140[526];
        v212 = v140[525];
        if (v141)
        {
          v149 = (float32x4_t *)sub_1B1842B0C(a3, (uint64_t)v142, v143, v144, v145, v146, v147, v148);
          v150 = 0;
          v151 = v149[1];
          v152 = v149[2];
          v153 = v149[3];
          v247 = *v149;
          v248 = v151;
          v249 = v152;
          v250 = v153;
          do
          {
            *(float32x4_t *)((char *)&v251 + v150) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v218, COERCE_FLOAT(*(_OWORD *)((char *)&v247 + v150))), v215, *(float32x2_t *)&v247.f32[v150 / 4], 1), v212, *(float32x4_t *)((char *)&v247 + v150), 2), v209, *(float32x4_t *)((char *)&v247 + v150), 3);
            v150 += 16;
          }
          while (v150 != 64);
          v215 = v252;
          v218 = v251;
          v209 = (float32x4_t)v254;
          v212 = v253;
        }
        v154 = v140[588];
        v219 = v140[587];
        v220 = v154;
        v155 = v140[590];
        v221 = v140[589];
        v222 = v155;
        objc_msgSend__updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded_((void *)a1, v142, (uint64_t)&v219, v144);
        v163 = 0;
        v164 = v219;
        v165 = v220;
        v166 = v221;
        v167 = v222;
        v247 = v218;
        v248 = v215;
        v249 = v212;
        v250 = v209;
        do
        {
          *(float32x4_t *)((char *)&v251 + v163) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v164, COERCE_FLOAT(*(_OWORD *)((char *)&v247 + v163))), v165, *(float32x2_t *)&v247.f32[v163 / 4], 1), v166, *(float32x4_t *)((char *)&v247 + v163), 2), v167, *(float32x4_t *)((char *)&v247 + v163), 3);
          v163 += 16;
        }
        while (v163 != 64);
        v168 = v252;
        v169 = v253;
        v170 = v254;
        v171 = (float32x4_t *)(&v223 + 4 * v139);
        *v171 = v251;
        v171[1] = v168;
        v171[2] = v169;
        v171[3] = (float32x4_t)v170;
        *(double *)v172.i64 = sub_1B187BC38(v37, v156, v157, v158, v159, v160, v161, v162);
        v171[24] = v172;
        v171[25] = v173;
        v171[26] = v174;
        v171[27] = v175;
        ++v139;
      }
      while (v139 < *(unsigned __int8 *)(a1 + 313));
    }
    v176 = sub_1B1815A5C(*(_QWORD *)(a1 + 144), 0);
    v177 = *(double *)(a5 + 12824);
    *(float *)&v177 = v177;
    objc_msgSend__zFarForSkyboxRenderingProjectionMatrix_defaultZFar_((void *)a1, v178, v176, v179, v177);
    v232 = v180;
    v181 = *(_QWORD *)(a1 + 248);
    v251 = 0uLL;
    v252.i64[0] = 0;
    sub_1B1868D14(*(_QWORD *)(v181 + 24), &v223, 0x310uLL, (void **)&v251);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v181 + 16), v182, v251.i64[1], v252.i64[0], 0);
    v77 = v206;
  }
  else
  {
    v223 = v208;
    v224 = v211;
    v225 = v214;
    v226 = v217;
    *(double *)&v186 = sub_1B187BC38(v37, v131, v132, v133, v134, v135, v136, v137);
    v227 = v186;
    v228 = v187;
    v229 = v188;
    v230 = v189;
    v190 = sub_1B1815A5C(*(_QWORD *)(a1 + 144), 0);
    v191 = *(double *)(a5 + 12824);
    *(float *)&v191 = v191;
    objc_msgSend__zFarForSkyboxRenderingProjectionMatrix_defaultZFar_((void *)a1, v192, v190, v193, v191);
    v231 = v194;
    v195 = *(_QWORD *)(a1 + 248);
    v251 = 0uLL;
    v252.i64[0] = 0;
    sub_1B1868D14(*(_QWORD *)(v195 + 24), &v223, 0x90uLL, (void **)&v251);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v195 + 16), v196, v251.i64[1], v252.i64[0], 0);
  }
  if (*(_QWORD *)(a1 + 18088) != v41)
  {
    *(_QWORD *)(a1 + 18088) = v41;
    objc_msgSend__setMeshBuffers_((void *)a1, v183, (uint64_t)v77, v185);
  }
  if (objc_msgSend_textureType(v246, v183, v184, v185) == 5)
  {
    v198 = (void *)sub_1B1955D00((uint64_t)v77);
    v201 = objc_msgSend_objectAtIndexedSubscript_(v198, v199, 0, v200);
    objc_msgSend__drawMeshElement_instanceCount_((void *)a1, v202, v201, 1);
  }
  else
  {
    sub_1B179AF64(*(_QWORD *)(a1 + 248), v197);
  }
  objc_msgSend_popDebugGroup((void *)a1, v203, v204, v205);
}

- (void)renderVideoBackground:(__CFXImageProxy *)a3 engineContext:(__CFXEngineContext *)a4 materialProperty:(__CFXMaterialProperty *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFXMesh *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFDictionary *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 eyeCount;
  unsigned __int8 viewMapping;
  char v60;
  VFXMTLResourceManager *resourceManager;
  void *v62;
  VFXMTLRenderCommandEncoder *renderEncoder;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id var3;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  VFXMTLRenderCommandEncoder *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  VFXMTLRenderCommandEncoder *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  VFXMTLMesh *v113;
  float v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  VFXMTLMesh *v122;
  uint64_t v123;
  uint64_t v124;
  __int16 v125;
  unsigned __int8 v126;
  char v127;
  unsigned __int8 v128;
  __int128 v129;
  _BYTE v130[19];
  uint64_t v131;
  _BYTE v132[2];
  void *v133;
  uint64_t v134;
  uint64_t v135;

  objc_msgSend_pushDebugGroup_(self, a2, (uint64_t)CFSTR("VFX - Draw video background"), (uint64_t)a4);
  v16 = sub_1B181F2D4((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
  v17 = sub_1B1815870((uint64_t)a4);
  if (!v17)
    goto LABEL_4;
  v18 = (const void *)v17;
  if ((__CFXImageProxy *)sub_1B181F5A8(v17) != a3)
  {
    sub_1B1815820((uint64_t)a4, 0);
LABEL_4:
    v19 = sub_1B180CF10();
    v18 = (const void *)sub_1B181F11C((uint64_t)a3, v19, (uint64_t)a4, v20, v21, v22, v23, v24);
    sub_1B1815820((uint64_t)a4, v18);
    CFRelease(v18);
    goto LABEL_6;
  }
  v19 = sub_1B180CF10();
LABEL_6:
  v29 = sub_1B181F4A8((uint64_t)v18, (uint64_t)a4, v19, (uint64_t)v132, v25, v26, v27, v28);
  v131 = v29;
  if (v29)
  {
    v30 = (void *)v29;
    v31 = (__CFXMesh *)sub_1B1815878((uint64_t)a4);
    v113 = sub_1B18FB1C0((uint64_t)self->_resourceManager, (uint64_t)v31, 1);
    v39 = sub_1B1814768((uint64_t *)self->_engineContext, v32, v33, v34, v35, v36, v37, v38);
    if (v39)
      v47 = sub_1B186CFA8((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);
    else
      v47 = 0;
    v48 = sub_1B186453C((uint64_t)v47, v40, v41, v42, v43, v44, v45, v46);
    if ((*((_BYTE *)self + 152) & 4) != 0
      && v47
      && self->_renderPassParameters.isMainPass
      && v48
      && sub_1B18E8E04(v48, (uint64_t)v49, v50, v51, v52, v53, v54, v55))
    {
      v56 = 472;
    }
    else
    {
      v56 = 464;
    }
    v57 = *(uint64_t *)((char *)&self->super.isa + v56);
    eyeCount = self->_renderPassParameters.eyeCount;
    viewMapping = self->_renderPassParameters.viewMapping;
    if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2)
      v60 = 2;
    else
      v60 = 1;
    resourceManager = self->_resourceManager;
    v119 = v57;
    v120 = 0u;
    v121 = 0u;
    v123 = 0;
    v124 = 0;
    v122 = v113;
    v125 = 783;
    v126 = eyeCount;
    v127 = v60;
    v128 = viewMapping;
    v129 = 0u;
    memset(v130, 0, sizeof(v130));
    v62 = (void *)objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(resourceManager, v49, (uint64_t)&v119, (uint64_t)self->_currentRenderPassDescriptor);
    renderEncoder = self->_renderEncoder;
    v67 = objc_msgSend_state(v62, v64, v65, v66);
    objc_msgSend_setRenderPipelineState_(renderEncoder->var3, v68, v67, v69);
    objc_msgSend_setRasterizerStates_(self, v70, (uint64_t)self->_backgroundRasterizerStates, v71);
    v72 = sub_1B18FD03C((uint64_t)self->_resourceManager, v19);
    if (objc_msgSend_pixelFormat(v30, v73, v74, v75) == 520 || objc_msgSend_pixelFormat(v30, v76, v77, v78) == 500)
    {
      var3 = self->_renderEncoder->var3;
      sub_1B189E888(self->_currentCommandBuffer, (const char *)&v131, 1, v78);
      objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(var3, v80, v131, 0, v72, 0);
    }
    else
    {
      sub_1B179AEE4((uint64_t)self->_renderEncoder, v30, 0, v78);
      objc_msgSend_setFragmentSamplerState_atIndex_(self->_renderEncoder->var3, v87, (uint64_t)v72, 0);
    }
    switch(v16)
    {
      case 0:
        sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Cannot render video background with an unspecified source type."), v81, v82, v83, v84, v85, v86, v112);
        break;
      case 1:
        __asm { FMOV            V1.2S, #1.0 }
        v115 = 0x3F80000000000000;
        v116 = _D1;
        v117 = 0;
        v118 = 1065353216;
        break;
      case 2:
        sub_1B1853044((uint64_t)a3, (__n128 *)a4, v81, v82, v83, v84, v85, v86);
        goto LABEL_28;
      case 3:
LABEL_28:
        v115 = sub_1B1853044((uint64_t)a3, (__n128 *)a4, v81, v82, v83, v84, v85, v86).n128_u64[0];
        v116 = v93;
        v117 = v94;
        v118 = v95;
        break;
      default:
        break;
    }
    v96 = self->_renderEncoder;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    sub_1B1868D14((uint64_t)v96->var4, &v115, 0x20uLL, &v133);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v96->var3, v97, v134, v135, 0);
    v114 = sub_1B1841E14((uint64_t)a5, v98, v99, v100, v101, v102, v103, v104);
    v105 = self->_renderEncoder;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    sub_1B1868D14((uint64_t)v105->var4, &v114, 4uLL, &v133);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v105->var3, v106, v134, v135, 0);
    if (self->_cache.mesh != v31)
    {
      self->_cache.mesh = v31;
      objc_msgSend__setMeshBuffers_(self, v107, (uint64_t)v113, v108);
    }
    sub_1B17C197C((uint64_t)self->_renderEncoder, v107);
    objc_msgSend_popDebugGroup(self, v109, v110, v111);
  }
}

- (void)renderMesh:(__n128)a3 meshElement:(__n128)a4 withProgram:(__n128)a5 engineContext:(uint64_t)a6 transform:(uint64_t)a7 color:(uint64_t)a8 rasterizerStates:(uint64_t)a9 blendState:(uint64_t)a10 texture:(__int128 *)a11 depthBias:(uint64_t)a12
{
  VFXMTLMesh *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  VFXMTLMeshElement *v35;
  uint64_t v36;
  VFXMTLMeshElement *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  char v41;
  char v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  _OWORD v79[5];
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  VFXMTLMesh *v83;
  uint64_t v84;
  uint64_t v85;
  __int16 v86;
  char v87;
  char v88;
  char v89;
  __int128 v90;
  _BYTE v91[19];
  void *v92;
  uint64_t v93;
  uint64_t v94;

  if (*(_QWORD *)(a1 + 216))
  {
    v21 = sub_1B18FB1C0(*(_QWORD *)(a1 + 112), a7, 1);
    if (sub_1B187680C(a7, v22, v23, v24, v25, v26, v27, v28) && !sub_1B1955D20((uint64_t)v21))
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Volatile mesh must have been mapped already"), v29, v30, v31, v32, v33, v34, (uint64_t)"!CFXMeshIsVolatile(mesh) || (renderMesh.volatileBuffer != nil)");
    v35 = sub_1B18FAA70(*(_QWORD *)(a1 + 112), a8);
    v36 = a8;
    v37 = v35;
    v38 = sub_1B17A4584(v36);
    sub_1B1955FEC(v37, v38, v39);
    if (*(_BYTE *)(a1 + 315) == 2)
      v41 = 2;
    else
      v41 = 1;
    v42 = *(_BYTE *)(a1 + 313);
    v43 = *(_BYTE *)(a1 + 314);
    v44 = *(void **)(a1 + 112);
    v80 = a9;
    v81 = 0u;
    v82 = 0u;
    v83 = v21;
    v84 = a13;
    v85 = 0;
    v86 = 15;
    v87 = v42;
    v88 = v41;
    v89 = v43;
    v90 = 0u;
    memset(v91, 0, sizeof(v91));
    v45 = (void *)objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(v44, v40, (uint64_t)&v80, *(_QWORD *)(a1 + 216));
    v46 = *(_QWORD *)(a1 + 248);
    v50 = objc_msgSend_state(v45, v47, v48, v49);
    objc_msgSend_setRenderPipelineState_(*(void **)(v46 + 16), v51, v50, v52);
    *(_QWORD *)(a1 + 18352) = 0;
    objc_msgSend_setRasterizerStates_((void *)a1, v53, a12, v54);
    if (a15)
    {
      LODWORD(v58) = -2.0;
      LODWORD(v59) = -2.0;
      LODWORD(v60) = 0;
      objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(*(_QWORD *)(a1 + 248) + 16), v55, v56, v57, v58, v59, v60);
    }
    if (a14)
    {
      v61 = (void *)objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(*(void **)(a1 + 112), v55, a14, 0, 0, a10, 0);
      sub_1B179AEE4(*(_QWORD *)(a1 + 248), v61, 0, v62);
    }
    v79[0] = a2;
    v79[1] = a3;
    v79[2] = a4;
    v79[3] = a5;
    if (a11)
      v63 = *a11;
    else
      v63 = 0uLL;
    v79[4] = v63;
    v64 = *(_QWORD *)(a1 + 248);
    v92 = 0;
    v93 = 0;
    v94 = 0;
    sub_1B1868D14(*(_QWORD *)(v64 + 24), v79, 0x50uLL, &v92);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v64 + 16), v65, v93, v94, 1);
    if (*(_QWORD *)(a1 + 18088) != a7)
    {
      *(_QWORD *)(a1 + 18088) = a7;
      objc_msgSend__setMeshBuffers_((void *)a1, v66, (uint64_t)v21, v67);
    }
    objc_msgSend__drawMeshElement_instanceCount_((void *)a1, v66, (uint64_t)v37, 1);
    if (a15)
    {
      LODWORD(v71) = 0;
      LODWORD(v72) = 0;
      LODWORD(v73) = 0;
      objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(*(_QWORD *)(a1 + 248) + 16), v68, v69, v70, v71, v72, v73);
    }
  }
  else if ((byte_1EEF65E98 & 1) == 0)
  {
    byte_1EEF65E98 = 1;
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot renderMesh without a vaid passDescriptor"), a7, a8, a9, a10, (uint64_t)a11, a12, a13);
  }
}

- (void)processRendererElements:(id *)a3 count:(unsigned int)a4 engineIterationContext:(id *)a5
{
  $9938A8B6F3BCC52CF6B458841C2B5828 *v5;
  unint64_t var1;
  __CFXFXPassInstance *var2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 *v41;
  unsigned int v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t CurrentPassHash;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BOOL4 isMainPass;
  char v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  $9938A8B6F3BCC52CF6B458841C2B5828 *v78;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;

  v5 = a5;
  var1 = (unint64_t)a5->var1;
  var2 = a5->var2;
  v83 = *((_QWORD *)a5->var0 + 12);
  v11 = sub_1B1815A54(var1);
  v82 = sub_1B18143C8(var1, v12, v13, v14, v15, v16, v17, v18);
  if ((self->_debugOptions & 2) != 0 && (BYTE2(var2[75].var8[11]) & 1) != 0)
  {
    v21 = 1;
    objc_msgSend_setTriangleFillMode_(self->_renderEncoder->var3, v19, 1, v20);
    objc_msgSend_setLockFillMode_(self->_renderEncoder->var3, v22, 1, v23);
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend_startProcessingRendererElementsWithEngineIterationContext_(self, v19, (uint64_t)v5, v20);
  v24 = sub_1B1815818(var1);
  v81 = (_QWORD *)sub_1B187B218((uint64_t)var2[76].var8[0], v25, v26, v27, v28, v29, v30, v31);
  if (!a4)
    goto LABEL_35;
  v76 = v21;
  v78 = v5;
  v79 = a3;
  v80 = 0;
  v39 = 0;
  v77 = a4;
  v40 = a4;
  v41 = a3;
  do
  {
    v42 = *v41++;
    var1 = var1 & 0xFFFFFFFF00000000 | v42;
    v43 = sub_1B19CFAFC(v83, var1, v33, v34, v35, v36, v37, v38);
    CurrentPassHash = objc_msgSend_getCurrentPassHash(self, v44, v45, v46);
    v55 = sub_1B19AF2AC((uint64_t)var2, v48, v49, v50, v51, v52, v53, v54);
    v56 = sub_1B17C7D94(v82, (char *)v43, v55, CurrentPassHash);
    if (!v39)
      goto LABEL_13;
    if (sub_1B17C2B78((uint64_t)v39)
      || sub_1B17C2B78(v43)
      || v39[2] != *(_QWORD *)(v43 + 16)
      || v39[3] != *(_QWORD *)(v43 + 24)
      || v80 != v56
      || v39[6] != *(_QWORD *)(v43 + 48)
      || v39[8] != *(_QWORD *)(v43 + 64)
      || !sub_1B191DA10(v81, *(_QWORD *)(v43 + 8), v57, v34, v35, v36, v37, v38))
    {
      sub_1B1853864((uint64_t)self, (uint64_t)v39, (uint64_t)var2, v34, v35, v36, v37, v38);
      sub_1B191DA08((uint64_t)v81);
      v80 = 0;
LABEL_13:
      if (!sub_1B17C2B78(v43)
        && !v24
        && v56
        && sub_1B1956E88(v56)
        && (v63 = *(_QWORD *)(v43 + 16)) != 0
        && sub_1B17A276C(v63))
      {
        if ((sub_1B1956E88(v56) & 1) == 0)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. shader does not support batching!"), v64, v65, v66, v67, v68, v69, (uint64_t)"!programHashCode || CFXProgramHashCodeUseDynamicBatching(programHashCode)");
        sub_1B191DA10(v81, *(_QWORD *)(v43 + 8), v64, v65, v66, v67, v68, v69);
        v80 = v56;
        if (!v11)
          goto LABEL_25;
      }
      else
      {
        sub_1B1853864((uint64_t)self, v43, (uint64_t)var2, v58, v59, v60, v61, v62);
        v43 = 0;
        if (!v11)
        {
LABEL_25:
          ++self->__engineStats->drawStep;
          v39 = (_QWORD *)v43;
          goto LABEL_26;
        }
      }
      if (((*(uint64_t (**)(uint64_t))(v11 + 16))(v11) & 1) != 0)
        break;
      goto LABEL_25;
    }
    v43 = (uint64_t)v39;
LABEL_26:
    --v40;
  }
  while (v40);
  v5 = v78;
  a3 = v79;
  a4 = v77;
  v21 = v76;
  if (v43)
  {
    sub_1B1853864((uint64_t)self, v43, (uint64_t)var2, v34, v35, v36, v37, v38);
    sub_1B191DA08((uint64_t)v81);
  }
LABEL_35:
  isMainPass = self->_processingContext.isMainPass;
  v71 = objc_msgSend_debugOptions(self, v32, v33, v34);
  if (isMainPass && (v71 & 4) != 0)
    objc_msgSend_drawWireframeOverlayForElements_range_store_passInstance_(self, v72, (uint64_t)a3, 0, a4, v83, v5->var2);
  if (v21)
  {
    objc_msgSend_setLockFillMode_(self->_renderEncoder->var3, v72, 0, v73);
    objc_msgSend_setTriangleFillMode_(self->_renderEncoder->var3, v74, 0, v75);
  }
  MEMORY[0x1E0DE7D20](self, sel_stopProcessingRendererElements_, isMainPass, v73);
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXFXPassInstance *var2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  float v92;
  _OWORD *v93;
  unsigned __int8 *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  float v98;
  unsigned int v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  int32x2_t v103;
  double v104;
  int32x2_t v105;
  unsigned int eyeCount;
  uint64_t v107;
  uint64_t v108;
  unsigned __int8 *v109;
  int renderSliceIndex;
  uint64_t v112;
  float32x4_t *v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  simd_float4 v120;
  simd_float4 v121;
  simd_float4 v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  __int128 v132;
  int32x4_t v133;
  int32x4_t v134;
  int32x4_t v135;
  int32x4_t v136;
  int32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  int32x4_t v140;
  float32x4_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  const void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const __CFDictionary *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  simd_float4x4 *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int32x2_t v191;
  float32x4_t v192;
  uint64_t v193;
  __int128 v194;
  _BOOL4 v195;
  uint64_t i;
  const double *v197;
  uint64_t v198;
  float32x4_t *v199;
  float32x4_t v200;
  float32x4_t v201;
  float32x4_t v202;
  float32x4_t v203;
  simd_float4 v204;
  uint64_t v205;
  simd_float4 v206;
  simd_float4 v207;
  simd_float4 v208;
  simd_float4 v209;
  unsigned __int8 *v210;
  float32x4_t *v211;
  float32x4_t *v212;
  float32x4_t v213;
  float32x4_t v214;
  float32x4_t v215;
  float32x4_t v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  unsigned __int8 *v220;
  unsigned __int8 *v221;
  float32x4_t v222;
  float32x4_t v223;
  float32x4_t v224;
  unsigned __int8 *v225;
  unsigned __int8 *v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  float32x4_t v230;
  __n128 v231;
  $9C0F8B4F66DF38FFF0C157D59FF3376B *v232;
  unint64_t v233;
  unsigned int v234;
  float32x4_t v235;
  __CFXFXPassInstance *v236;
  __int128 v237;
  float32x4_t v238;
  float32x4_t v239;
  __int128 v240;
  float32x4_t v241;
  uint64_t v242;
  simd_float4x4 v243;
  _BYTE __src[368];
  uint64_t v245;

  v245 = *MEMORY[0x1E0C80C00];
  var2 = a3->var2;
  self->_processingContext.passInstance = var2;
  v236 = var2;
  if (!var2)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_processingContext.passInstance");
  v18 = sub_1B1813884((uint64_t)a3->var1, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (a3->var1 != self->_engineContext)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. unexpected engine context"), v12, v13, v14, v15, v16, v17, (uint64_t)"engineIterationContext->engineContext == _engineContext");
  self->_processingContext.lightingSystem = (__CFXLightingSystem *)sub_1B187B188(v18, v11, v12, v13, v14, v15, v16, v17);
  self->_processingContext.transformTree = (__CFXTransformTree *)sub_1B187B2A8(v18, v19, v20, v21, v22, v23, v24, v25);
  self->_processingContext.dynamicBatchingSystem = (__CFXDynamicBatchingSystem *)sub_1B187B218(v18, v26, v27, v28, v29, v30, v31, v32);
  self->_processingContext.pass = (__CFXFXPass *)sub_1B19AF2AC((uint64_t)self->_processingContext.passInstance, v33, v34, v35, v36, v37, v38, v39);
  self->_processingContext.renderGraphPass = a3->var3;
  self->_processingContext.passRequiresLighting = a3->var6;
  self->_processingContext.isMainPass = a3->var9;
  self->_processingContext.programHashCodeStoreKey = a3->var4;
  v40 = sub_1B1795ED8((uint64_t)self->_processingContext.lightingSystem);
  *(_QWORD *)&self->_anon_250[396] = v41;
  *(_QWORD *)&self->_anon_250[388] = v40;
  v47 = sub_1B1814F08((uint64_t)self->_engineContext, 0, 0, v42, v43, v44, v45, v46);
  v237 = *(_OWORD *)(v47 + 48);
  v240 = *(_OWORD *)(v47 + 32);
  sub_1B18144E8((uint64_t)self->_engineContext, v48, v49, v50, v51, v52, v53, v54);
  *(_OWORD *)&self->_anon_250[404] = *(_OWORD *)sub_1B187B514(v18, v55, v56, v57, v58, v59, v60, v61);
  if (*((float *)&v240 + 3) == 0.0 && sub_1B17A0188())
    v69 = xmmword_1B2244D90;
  else
    sub_1B187B55C(v18, v62, v63, v64, v65, v66, v67, v68);
  *(_OWORD *)&self->_anon_250[420] = v69;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&self->_anon_250[436] = vdiv_f32(_D1, *(float32x2_t *)self->_renderSize);
  v75 = sub_1B187B0F0(v18, 0);
  if (v75)
  {
    v83 = v75;
    if (sub_1B1841A40(v75, v76, v77, v78, v79, v80, v81, v82)
      || (v91 = sub_1B1842E64(v83, v84, v85, v86, v87, v88, v89, v90), v92 = 1.0, v91))
    {
      v92 = sub_1B1841E14(v83, v84, v85, v86, v87, v88, v89, v90);
    }
    *(float *)&self->_anon_250[464] = v92;
    v75 = sub_1B1842B0C(v83, v84, v85, v86, v87, v88, v89, v90);
  }
  else
  {
    *(_DWORD *)&self->_anon_250[464] = 1065353216;
  }
  v93 = (_OWORD *)MEMORY[0x1E0C83FF0];
  v94 = &self->_anon_250[4];
  if (v75)
    v93 = (_OWORD *)v75;
  v95 = v93[1];
  v96 = v93[2];
  v97 = v93[3];
  *(_OWORD *)&self->_anon_250[468] = *v93;
  *(_OWORD *)&self->_anon_250[484] = v95;
  *(_OWORD *)&self->_anon_250[500] = v96;
  *(_OWORD *)&self->_anon_250[516] = v97;
  v98 = sub_1B1815810((uint64_t)self->_engineContext);
  *(float *)&self->_anon_250[444] = v98;
  *(__float2 *)&self->_anon_250[448] = __sincosf_stret(v98);
  v99 = 214013 * self->_seed + 2531011;
  self->_seed = v99;
  *(float *)&self->_anon_250[456] = (float)HIWORD(v99) * 0.000015259;
  *(_DWORD *)&self->_anon_250[772] = sub_1B1815BE8((uint64_t)self->_engineContext, v100, v101, v102);
  v103.i32[1] = DWORD1(v240);
  *(float *)v103.i32 = *((float *)&v237 + 2) / *((float *)&v240 + 2);
  v104 = (*((float *)&v237 + 2) + -1.0) / *((float *)&v240 + 2);
  if (*((float *)&v240 + 3) != 0.0)
    v104 = *((float *)&v237 + 2) / (*((float *)&v240 + 2) + 1.0);
  *(float *)&v104 = v104;
  v105 = vcgt_f32((float32x2_t)v103, *(float32x2_t *)&v104);
  v103.i32[1] = LODWORD(v104);
  *(int8x8_t *)&self->_anon_250[660] = vbsl_s8((int8x8_t)vdup_lane_s32(v105, 0), (int8x8_t)vrev64_s32(v103), (int8x8_t)v103);
  if (self->_processingContext.passRequiresLighting)
  {
    sub_1B1815C9C((uint64_t)self->_engineContext);
    sub_1B17D0680((uint64_t)&self->_anon_4100[144], (uint64_t)&self->_processingContext.passInstance->var9);
    memcpy(&self->_anon_4100[336], __src, 0x170uLL);
    *(_OWORD *)&self->_anon_250[756] = *(_OWORD *)&self->_anon_4100[400];
  }
  if (self->_renderPassParameters.viewMapping)
  {
    eyeCount = self->_renderPassParameters.eyeCount;
    if (!self->_renderPassParameters.eyeCount)
    {
      v234 = 0;
      v241 = 0u;
      goto LABEL_34;
    }
  }
  else
  {
    eyeCount = 1;
  }
  v107 = 0;
  v234 = eyeCount;
  v108 = eyeCount;
  v109 = &self->_anon_250[84];
  v241 = 0u;
  __asm { FMOV            V0.4S, #1.0 }
  v235 = _Q0;
  do
  {
    renderSliceIndex = self->_renderPassParameters.renderSliceIndex;
    if (v107)
      memcpy(v109 - 80, &self->_anon_250[4], 0x310uLL);
    v112 = (v107 + renderSliceIndex);
    v113 = (float32x4_t *)((char *)v236 + 64 * v112);
    *(float32x4_t *)__src = v113[523];
    *(float32x4_t *)&__src[16] = v113[524];
    *(float32x4_t *)&__src[32] = v113[525];
    *(float32x4_t *)&__src[48] = v113[526];
    v114 = v113[524];
    v115 = v113[525];
    v116 = v113[526];
    *((float32x4_t *)v109 - 5) = v113[523];
    *((float32x4_t *)v109 - 4) = v114;
    *((float32x4_t *)v109 - 3) = v115;
    *((float32x4_t *)v109 - 2) = v116;
    v117 = v113[460];
    v118 = v113[461];
    v119 = v113[462];
    *((float32x4_t *)v109 - 1) = v113[459];
    *(float32x4_t *)v109 = v117;
    *((float32x4_t *)v109 + 1) = v118;
    *((float32x4_t *)v109 + 2) = v119;
    v238 = v113[462];
    v243 = *(simd_float4x4 *)__src;
    sub_1B187B890(v18, &v243);
    v120 = v243.columns[1];
    v121 = v243.columns[2];
    v122 = v243.columns[3];
    *((_OWORD *)v109 + 11) = v243.columns[0];
    *((simd_float4 *)v109 + 12) = v120;
    *((simd_float4 *)v109 + 13) = v121;
    *((simd_float4 *)v109 + 14) = v122;
    v123 = v113[588];
    v124 = v113[589];
    v125 = v113[590];
    *((float32x4_t *)v109 + 3) = v113[587];
    *((float32x4_t *)v109 + 4) = v123;
    *((float32x4_t *)v109 + 5) = v124;
    *((float32x4_t *)v109 + 6) = v125;
    v126 = v113[652];
    v127 = v113[653];
    v128 = v113[654];
    *((float32x4_t *)v109 + 7) = v113[651];
    *((float32x4_t *)v109 + 8) = v126;
    *((float32x4_t *)v109 + 9) = v127;
    *((float32x4_t *)v109 + 10) = v128;
    v129 = *((float32x4_t *)v109 - 5);
    v130 = *((float32x4_t *)v109 - 4);
    v131 = *((float32x4_t *)v109 - 3);
    v132 = *((_OWORD *)v109 - 2);
    v133 = (int32x4_t)vmulq_f32(v129, v129);
    v134 = (int32x4_t)vmulq_f32(v130, v130);
    v135 = (int32x4_t)vmulq_f32(v131, v131);
    v136 = vzip1q_s32(v133, v135);
    v137 = vzip2q_s32(v133, v135);
    v138 = (float32x4_t)vtrn2q_s32(v133, v134);
    v138.i32[2] = v135.i32[1];
    v139 = vaddq_f32((float32x4_t)vzip1q_s32(v137, vdupq_laneq_s32(v134, 2)), vaddq_f32((float32x4_t)vzip1q_s32(v136, v134), v138));
    v140 = vceqzq_f32(v139);
    v140.i32[3] = 0;
    v141 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v140), (int8x16_t)v139, (int8x16_t)vdivq_f32(v235, v139));
    *((float32x4_t *)v109 + 38) = vmulq_n_f32(v129, v141.f32[0]);
    *((float32x4_t *)v109 + 39) = vmulq_lane_f32(v130, *(float32x2_t *)v141.f32, 1);
    *((float32x4_t *)v109 + 40) = vmulq_laneq_f32(v131, v141, 2);
    *((_OWORD *)v109 + 41) = v132;
    if (sub_1B1815A90((uint64_t)self->_engineContext))
    {
      v149 = v113[732];
      v150 = v113[733];
      v151 = v113[734];
      *((float32x4_t *)v109 + 15) = v113[731];
      *((float32x4_t *)v109 + 16) = v149;
      *((float32x4_t *)v109 + 17) = v150;
      *((float32x4_t *)v109 + 18) = v151;
      v152 = sub_1B1814768((uint64_t *)a3->var1, v142, v143, v144, v145, v146, v147, v148);
      if (v152)
      {
        v160 = sub_1B186CFA8((uint64_t)v152, v153, v154, v155, v156, v157, v158, v159);
        if (v160)
        {
          v168 = (uint64_t)v160;
          if (sub_1B18650B8((uint64_t)v160, v161, v162, v163, v164, v165, v166, v167))
          {
            v176 = sub_1B186443C(v168, v169, v170, v171, v172, v173, v174, v175);
            *((float *)v109 + 94) = sub_1B18E8CD4(v176, v177, v178, v179, v180, v181, v182, v183) * 0.5;
          }
        }
      }
    }
    v241 = vaddq_f32(v241, v238);
    v184 = (simd_float4x4 *)&v94[784 * v112];
    *((simd_float4x4 *)v109 + 7) = __invert_f4(v184[2]);
    *((simd_float4x4 *)v109 + 8) = __invert_f4(v184[3]);
    *((int8x16_t *)v109 + 37) = vextq_s8(*((int8x16_t *)&v236[68].var2 + v107), *((int8x16_t *)&v236[68].var2 + v107), 8uLL);
    ++v107;
    v109 += 784;
  }
  while (v108 != v107);
LABEL_34:
  if (sub_1B1816084((uint64_t)self->_engineContext))
  {
    *(float *)v191.i32 = (float)v234;
    v192 = vdivq_f32(v241, (float32x4_t)vdupq_lane_s32(v191, 0));
    if (v234 >= 2)
      v193 = 2;
    else
      v193 = v234;
    v242 = v193;
    if (v234 >= 3 && (byte_1EEF65E99 & 1) == 0)
    {
      byte_1EEF65E99 = 1;
      v239 = v192;
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXCore can render a maximum of %d pov - %d were asked"), v185, v186, v187, v188, v189, v190, 2);
      v192 = v239;
    }
    *(float32x4_t *)&self->_anon_43d0[544] = v192;
    *(_QWORD *)&v194 = *(_QWORD *)self->_renderSize;
    *((_QWORD *)&v194 + 1) = *(_QWORD *)&self->_anon_250[436];
    *(_OWORD *)&self->_anon_43d0[560] = v194;
    v195 = self->_renderPassParameters.multiVertexOutputStreamGenerator == 2;
    *(_DWORD *)&self->_anon_43d0[576] = v242;
    *(_DWORD *)&self->_anon_43d0[580] = v195;
    if ((_DWORD)v242)
    {
      for (i = 0; i != v242; ++i)
      {
        v198 = 0;
        v199 = (float32x4_t *)&v94[784 * i];
        v200 = *v199;
        v201 = v199[1];
        v202 = v199[2];
        v203 = v199[3];
        v204 = *(simd_float4 *)&self->_anon_43d0[544];
        v204.i32[3] = 1.0;
        v243.columns[0] = (simd_float4)xmmword_1B2244DB0;
        v243.columns[1] = (simd_float4)xmmword_1B2244DD0;
        v243.columns[2] = (simd_float4)xmmword_1B2244D90;
        v243.columns[3] = v204;
        do
        {
          *(float32x4_t *)&__src[v198 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v200, COERCE_FLOAT(*(_OWORD *)&v243.columns[v198])), v201, *(float32x2_t *)v243.columns[v198].f32, 1), v202, (float32x4_t)v243.columns[v198], 2), v203, (float32x4_t)v243.columns[v198], 3);
          ++v198;
        }
        while (v198 != 4);
        v205 = 0;
        v206 = *(simd_float4 *)__src;
        v207 = *(simd_float4 *)&__src[16];
        v208 = *(simd_float4 *)&__src[32];
        v209 = *(simd_float4 *)&__src[48];
        v210 = &self->_anon_43d0[64 * i];
        *(_OWORD *)v210 = *(_OWORD *)__src;
        *((simd_float4 *)v210 + 1) = v207;
        *((simd_float4 *)v210 + 2) = v208;
        *((simd_float4 *)v210 + 3) = v209;
        v211 = (float32x4_t *)&v94[784 * i];
        v213 = v211[8];
        v214 = v211[9];
        v212 = v211 + 8;
        v215 = v212[2];
        v216 = v212[3];
        v243.columns[0] = v206;
        v243.columns[1] = v207;
        v243.columns[2] = v208;
        v243.columns[3] = v209;
        do
        {
          *(float32x4_t *)&__src[v205 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v213, COERCE_FLOAT(*(_OWORD *)&v243.columns[v205])), v214, *(float32x2_t *)v243.columns[v205].f32, 1), v215, (float32x4_t)v243.columns[v205], 2), v216, (float32x4_t)v243.columns[v205], 3);
          ++v205;
        }
        while (v205 != 4);
        v217 = *(_OWORD *)&__src[16];
        v218 = *(_OWORD *)&__src[32];
        v219 = *(_OWORD *)&__src[48];
        v220 = &self->_anon_43d0[64 * i + 128];
        *(_OWORD *)v220 = *(_OWORD *)__src;
        *((_OWORD *)v220 + 1) = v217;
        *((_OWORD *)v220 + 2) = v218;
        *((_OWORD *)v220 + 3) = v219;
        v221 = &self->_anon_43d0[64 * i + 256];
        v222 = *v212;
        v223 = v212[1];
        v224 = v212[3];
        *((float32x4_t *)v221 + 2) = v212[2];
        *((float32x4_t *)v221 + 3) = v224;
        *(float32x4_t *)v221 = v222;
        *((float32x4_t *)v221 + 1) = v223;
        v225 = &v94[784 * i];
        v226 = &self->_anon_43d0[64 * i + 384];
        v227 = *((_OWORD *)v225 + 33);
        v228 = *((_OWORD *)v225 + 34);
        v229 = *((_OWORD *)v225 + 36);
        *((_OWORD *)v226 + 2) = *((_OWORD *)v225 + 35);
        *((_OWORD *)v226 + 3) = v229;
        *(_OWORD *)v226 = v227;
        *((_OWORD *)v226 + 1) = v228;
        *(float32x4_t *)&self->_anon_43d0[16 * i + 512] = vsubq_f32(*((float32x4_t *)&v236[44].var0 + 4 * i), *(float32x4_t *)&self->_anon_43d0[544]);
        v197 = (const double *)&self->_anon_43d0[560];
        v230 = (float32x4_t)vld1q_dup_f64(v197);
        *(float32x4_t *)&self->_anon_43d0[16 * i + 592] = vdivq_f32(*((float32x4_t *)&v236[68].var2 + i), v230);
        v231 = sub_1B181537C((uint64_t)self->_engineContext, i, v185, v186, v187, v188, v189, v190);
        v232 = &self->_vfxCoreViewports[i];
        *(float64x2_t *)&v232->originX = vcvtq_f64_f32((float32x2_t)v231.n128_u64[0]);
        *(float64x2_t *)&v232->width = vcvt_hight_f64_f32((float32x4_t)v231);
        *(_OWORD *)&v232->znear = xmmword_1B2245B90;
      }
    }
  }
  memset(__src, 0, 24);
  sub_1B1868D14((uint64_t)self->_frameConstantBufferPool, &self->_anon_250[4], 784 * v234, (void **)__src);
  v233 = *(_QWORD *)&__src[16];
  self->_worldUniforms.buffer = *(MTLBuffer **)&__src[8];
  self->_worldUniforms.offset = v233;
}

- (void)stopProcessingRendererElements:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t debugOptions;

  if (a3)
  {
    if (self->_processingContext.passRequiresLighting
      && sub_1B1814484((uint64_t)self->_engineContext, 0, a3, v3, v4, v5, v6, v7)
      && (sub_1B1814458((uint64_t)self->_engineContext) & 0x100000) != 0
      && !self->_processingContext.passInstance[75].var8[15])
    {
      sub_1B17D200C((uint64_t)&self->_anon_4100[144], (uint64_t)self->_renderEncoder);
    }
    debugOptions = self->_debugOptions;
    if ((debugOptions & 0x10) != 0)
    {
      objc_msgSend__drawPBRTextures(self, a2, a3, v3);
      debugOptions = self->_debugOptions;
    }
    if ((debugOptions & 8) != 0)
      objc_msgSend__drawShadowMaps(self, a2, a3, v3);
  }
  *(_OWORD *)&self->_processingContext.renderGraphPass = 0u;
  *(_OWORD *)&self->_processingContext.transformTree = 0u;
  *(_OWORD *)&self->_processingContext.passInstance = 0u;
  *(_OWORD *)&self->_processingContext.dynamicBatchingSystem = 0u;
}

- (void)_prepareMaterialTextures:(__CFXMaterial *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;

  v9 = sub_1B187813C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v9)
  {
    v17 = v9;
    v20 = sub_1B1841314(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v20 == 3)
      objc_msgSend_specularDFGDiffuseHammonTextureWithRenderContext_(self->_resourceManager, v18, (uint64_t)self, v19);
    v21 = sub_1B18545A0();
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      do
      {
        if (sub_1B1840C94(v20, v23))
        {
          v29 = sub_1B1840E70(v17, v23, 0, v24, v25, v26, v27, v28);
          if (v29)
            objc_msgSend_textureForMaterialProperty_(self, v30, v29, v31);
        }
        ++v23;
      }
      while (v23 != v22);
    }
  }
}

- (void)_executeDrawCommand:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXGeometry *var2;
  __CFXNode *var3;
  __CFXMesh *var4;
  __CFXMeshElement *var5;
  __CFXFXPass *var7;
  _BOOL4 var9;
  _BOOL4 v15;
  __CFXFXProgram *program;
  __CFXFXProgram *v17;
  __CFXMesh *mesh;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _BOOL4 v30;
  __CFXDeformerStack *v31;
  char v32;
  uint64_t v33;
  unsigned __int8 v34;
  VFXMTLMesh *v35;
  VFXMTLMesh *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  unsigned __int8 *v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  unsigned __int8 *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  unsigned __int8 *v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  unsigned __int8 *v68;
  __int32 v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t eyeCount;
  unsigned __int8 *v84;
  uint64_t v85;
  unsigned __int8 *v86;
  uint64_t v87;
  float32x4_t *v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  unsigned __int8 *v96;
  uint64_t v97;
  uint64_t v98;
  float32x4_t *v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  unsigned __int8 *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  float *v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  char v133;
  int v134;
  float v135;
  float32x4_t *v136;
  float32x4_t v137;
  float v138;
  float v139;
  float32x4_t v140;
  float32x4_t v141;
  float v142;
  double v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  VFXMTLMesh *metalMesh;
  unint64_t currentFrameIndex;
  void *v153;
  const char *v154;
  uint64_t v155;
  VFXMTLMeshElement *metalMeshElement;
  uint64_t v157;
  const char *v158;
  unsigned __int8 *v159;
  char v160;
  VFXMTLMeshElement *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  VFXMTLMeshElement **p_metalMeshElement;
  uint64_t v169;
  uint64_t v170;
  CFIndex v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  VFXMTLMeshElement *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unsigned int v180;
  __CFXNode *v181;
  unint64_t v182;
  int v183;
  __CFXCommonProfile *v184;
  _BOOL4 v186;
  __int32 v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  int v196;
  int v198;
  float32x4_t *passInstance;
  __CFXNode *v200;
  float32x4_t v201;
  float32x4_t v202;
  float32x4_t v203;
  __int128 *v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  VFXMTLMesh *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  __CFXBlendStates *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  double v224;
  double v225;
  double v226;
  double v227;
  int v228;
  __CFXFXProgram *v229;
  int v230;
  int v231;
  __CFXBlendStates *blendStates;
  const void *v233;
  int v234;
  const char *v235;
  int v236;
  char v237;
  char v238;
  VFXMTLMesh *v239;
  unsigned __int8 v240;
  unsigned __int8 viewMapping;
  NSMutableDictionary *errors;
  VFXMTLResourceManager *resourceManager;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t i;
  void *v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  id Weak;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  unint64_t v302;
  id v303;
  size_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  double v310;
  char *v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  void *v331;
  VFXMTLRenderCommandEncoder *renderEncoder;
  int v333;
  int v334;
  VFXMTLRenderCommandEncoder *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  VFXMTLRenderCommandEncoder *v371;
  __int16 v372;
  char v373;
  VFXMTLShadable *v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t j;
  void *v381;
  uint64_t v382;
  __CFXFXPassInstance *v383;
  uint64_t p_var6;
  unint64_t v385;
  unint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t k;
  VFXMTLRenderCommandEncoder *v396;
  uint64_t v397;
  uint64_t v398;
  int v399;
  __CFXGeometry *v400;
  uint64_t v401;
  uint64_t v402;
  __CFXMaterial *v403;
  uint64_t v404;
  unint64_t v405;
  uint64_t v406;
  id *v407;
  float32x4_t v408;
  float32x4_t v409;
  float32x4_t v410;
  float32x4_t v411;
  uint64_t v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  unsigned __int8 *v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  VFXMTLRenderCommandEncoder *v429;
  uint64_t v430;
  uint64_t v431;
  int v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t m;
  uint64_t v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  size_t v454;
  uint64_t v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  VFXMTLRenderCommandEncoder *v459;
  uint64_t v460;
  uint64_t v461;
  int v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  double v471;
  int v472;
  VFXMTLRenderCommandEncoder *v473;
  uint64_t v474;
  uint64_t v475;
  unsigned __int8 *v476;
  VFXMTLRenderCommandEncoder *v477;
  MTLBuffer *buffer;
  unint64_t offset;
  uint64_t v480;
  int v481;
  int32x4_t v482;
  int32x4_t v483;
  float32x4_t v484;
  _BOOL8 v485;
  VFXMTLRenderCommandEncoder *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  int v490;
  char v491;
  __int128 v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  int v496;
  unsigned int v497;
  void *v498;
  $CD19659F3392EC3503AA16FFBCCAF51A *v499;
  __CFXFXProgram *v500;
  unsigned int v501;
  __CFXFXProgram *var0;
  uint64_t v503;
  __CFXGeometry *geometry;
  uint64_t v505;
  void *v506;
  __CFXGeometry *v507;
  unsigned int *var8;
  uint64_t v509;
  int v510;
  __CFXMaterial *var1;
  id *p_resourceManagerMonitor;
  unsigned __int8 *v513;
  simd_float4 v514;
  simd_float4 v515;
  simd_float4 v516;
  simd_float4 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  _OWORD v522[2];
  int v523;
  int v524;
  VFXMTLRenderContext *v525;
  char v526;
  _DWORD v527[3];
  _QWORD v528[2];
  uint64_t (*v529)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v530;
  VFXMTLRenderContext *v531;
  uint64_t v532;
  uint64_t v533;
  unsigned int *v534;
  uint64_t v535;
  int v536;
  int v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  _BOOL8 v546;
  uint64_t v547;
  uint64_t v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  unint64_t v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  uint64_t v566;
  _QWORD v567[8];
  char v568;
  char v569;
  unsigned __int8 v570;
  char v571;
  unsigned __int8 v572;
  char v573;
  __int16 v574;
  NSMutableDictionary *v575;
  __int8 v576;
  _BYTE v577[7];
  const void *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  _QWORD v582[3];
  int v583;
  BOOL v584;
  __int16 v585;
  char v586;
  __int128 v587[7];
  __int128 v588[12];
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  _BYTE v609[128];
  _BYTE v610[128];
  _BYTE v611[128];
  _BYTE v612[128];
  _BYTE v613[128];
  _BYTE v614[128];
  uint64_t v615;
  simd_float4x4 v616;
  simd_float4x4 v617;

  v615 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  var2 = a3->var2;
  var1 = a3->var1;
  var3 = a3->var3;
  var4 = a3->var4;
  var5 = a3->var5;
  var7 = a3->var7;
  var8 = a3->var8;
  v509 = (uint64_t)var3;
  var9 = a3->var9;
  v499 = a3;
  LODWORD(p_resourceManagerMonitor) = a3->var10;
  if (var2
    && sub_1B17A2818((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7)
    && (self->_features & 0x10) != 0)
  {
    v15 = (*((_BYTE *)v499 + 77) & 7) != 0;
    v501 = 1;
  }
  else
  {
    v501 = 0;
    v15 = 0;
  }
  if (var0)
  {
    if (!var2)
      goto LABEL_14;
  }
  else
  {
    if ((byte_1EEF65E9A & 1) == 0)
    {
      byte_1EEF65E9A = 1;
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: can not render without programs, using default"), (uint64_t)a3, v3, v4, v5, v6, v7, v495);
    }
    var0 = (__CFXFXProgram *)objc_msgSend_defaultProgramUsingTessellation_(self->_resourceManager, a2, v501, v3);
    if (!var2)
      goto LABEL_14;
  }
  if (sub_1B193F97C((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) || sub_1B17A0A4C((uint64_t)var2))
  {
    v507 = var2;
    goto LABEL_15;
  }
LABEL_14:
  v507 = 0;
LABEL_15:
  v513 = &self->_anon_3378[3248];
  program = self->_cache.program;
  v17 = var0;
  self->_cache.program = var0;
  mesh = self->_cache.mesh;
  v500 = program;
  v20 = mesh != var4 || program != v17;
  if (var2)
    v516.i32[0] = sub_1B17A289C((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  else
    v516.i32[0] = 1;
  v517.i64[0] = (uint64_t)var7;
  v515.i32[0] = var9;
  if (!v509)
  {
    if (self->_cache.deformers)
      v29 = 1;
    else
      v29 = v20;
    self->_cache.deformers = 0;
    if ((v29 & 1) != 0)
    {
      v514.i32[0] = 0;
      v505 = 0;
      v30 = 0;
      v510 = -1;
      goto LABEL_42;
    }
    v496 = 0;
    v514.i32[0] = 0;
    v505 = 0;
    v35 = 0;
    LOBYTE(v30) = 0;
    v510 = -1;
    goto LABEL_49;
  }
  v21 = sub_1B186AE38(v509, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v514.i32[0] = v21 != 0;
  v505 = v21;
  if (v21)
    v510 = sub_1B18E4B20(v21);
  else
    v510 = -1;
  v31 = (__CFXDeformerStack *)sub_1B1868F58(v509, v22, v23, v24, v25, v26, v27, v28);
  v32 = self->_cache.deformers != v31 || v20;
  self->_cache.deformers = v31;
  if (!v31 || (v33 = (uint64_t)v31, !sub_1B19988A4(v31, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7)))
  {
    if ((v32 & 1) != 0)
    {
      v30 = 0;
      goto LABEL_42;
    }
    v496 = 0;
    v35 = 0;
    LOBYTE(v30) = 0;
LABEL_49:
    if ((v501 & 1) != 0)
      goto LABEL_113;
LABEL_70:
    v69 = 0;
    v498 = 0;
    v70 = v513[1920] == 0;
    v513[1920] = 0;
    goto LABEL_116;
  }
  v34 = v499->var11 || sub_1B17B1EAC((uint64_t)var2, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
  v71 = objc_msgSend_renderResourceForDeformerStack_node_dataKind_(self->_resourceManager, a2, v33, v509, v516.u32[0]);
  if (sub_1B1872074(v71))
  {
    v546 = 0;
    sub_1B191DA5C((uint64_t)self->_processingContext.dynamicBatchingSystem, &v546);
    if (v546 >= 2)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. CFXDeformerTransforms is not supported when instancing is active"), v72, v73, v74, v75, v76, v77, (uint64_t)"dynamicBatchCount < 2");
    v78 = (__int128 *)sub_1B18D138C((uint64_t)self->_processingContext.transformTree, *(_DWORD *)(v509 + 88), v72, v73, v74, v75, v76, v77);
    v79 = *v78;
    v80 = v78[1];
    v81 = v78[2];
    v82 = v78[3];
    *(_OWORD *)&self->_nodeUniforms.instanceNode = *v78;
    *(_OWORD *)&self->_nodeUniforms.probeCacheIndex = v80;
    *(_OWORD *)&self->_anon_3378[8] = v81;
    *(_OWORD *)&self->_anon_3378[24] = v82;
    eyeCount = self->_renderPassParameters.eyeCount;
    v84 = v513;
    *(_DWORD *)v513 = 2;
    if (eyeCount)
    {
      v85 = 0;
      v86 = &self->_anon_250[4];
      do
      {
        v87 = 0;
        v88 = (float32x4_t *)&v86[784 * v85];
        v89 = *v88;
        v90 = v88[1];
        v91 = v88[2];
        v92 = v88[3];
        v589 = v79;
        v590 = v80;
        v591 = v81;
        v592 = v82;
        do
        {
          *(__int128 *)((char *)&v597 + v87) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v87))), v90, *(float32x2_t *)((char *)&v589 + v87), 1), v91, *(float32x4_t *)((char *)&v589 + v87), 2), v92, *(float32x4_t *)((char *)&v589 + v87), 3);
          v87 += 16;
        }
        while (v87 != 64);
        v93 = v598;
        v94 = v599;
        v95 = v600;
        v96 = &self->_anon_3378[64 * v85 + 1128];
        *(_OWORD *)v96 = v597;
        *((_OWORD *)v96 + 1) = v93;
        *((_OWORD *)v96 + 2) = v94;
        *((_OWORD *)v96 + 3) = v95;
        ++v85;
      }
      while (v85 != eyeCount);
      if ((*(_DWORD *)v513 & 4) == 0)
      {
        v97 = 0;
        *(_DWORD *)v513 |= 4u;
        do
        {
          v98 = 0;
          v99 = (float32x4_t *)&v86[784 * v97];
          v100 = v99[12];
          v101 = v99[13];
          v102 = v99[14];
          v103 = v99[15];
          v589 = v79;
          v590 = v80;
          v591 = v81;
          v592 = v82;
          do
          {
            *(__int128 *)((char *)&v597 + v98) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v98))), v101, *(float32x2_t *)((char *)&v589 + v98), 1), v102, *(float32x4_t *)((char *)&v589 + v98), 2), v103, *(float32x4_t *)((char *)&v589 + v98), 3);
            v98 += 16;
          }
          while (v98 != 64);
          v104 = v598;
          v105 = v599;
          v106 = v600;
          v107 = &self->_anon_3378[64 * v97 + 2152];
          *(_OWORD *)v107 = v597;
          *((_OWORD *)v107 + 1) = v104;
          *((_OWORD *)v107 + 2) = v105;
          *((_OWORD *)v107 + 3) = v106;
          ++v97;
        }
        while (v97 != eyeCount);
      }
    }
    else
    {
      *(_DWORD *)v84 = 6;
    }
    v108 = *(_OWORD *)&self->_anon_3378[1144];
    v589 = *(_OWORD *)&self->_anon_3378[1128];
    v590 = v108;
    v109 = *(_OWORD *)&self->_anon_3378[1176];
    v591 = *(_OWORD *)&self->_anon_3378[1160];
    v592 = v109;
    v110 = *(_OWORD *)&self->_anon_3378[2168];
    v593 = *(_OWORD *)&self->_anon_3378[2152];
    v594 = v110;
    v111 = *(_OWORD *)&self->_anon_3378[2200];
    v595 = *(_OWORD *)&self->_anon_3378[2184];
    v596 = v111;
    v112 = *(_OWORD *)&self->_anon_250[132];
    v113 = *(_OWORD *)&self->_anon_250[148];
    v114 = *(_OWORD *)&self->_anon_250[164];
    v608 = *(_OWORD *)&self->_anon_250[180];
    v607 = v114;
    v606 = v113;
    v605 = v112;
    v600 = v592;
    v599 = v591;
    v598 = v590;
    v597 = v589;
    v604 = v596;
    v603 = v595;
    v602 = v594;
    v601 = v593;
  }
  if (sub_1B1872088(v71))
  {
    objc_msgSend_renderSize(self, v115, v116, v117);
    v118 = 0;
    *(_QWORD *)&v589 = v119;
    v120 = *(_OWORD *)&self->_anon_3378[2152];
    v121 = *(_OWORD *)&self->_anon_3378[2168];
    v122 = *(_OWORD *)&self->_anon_3378[2184];
    v123 = *(_OWORD *)&self->_anon_3378[2200];
    do
    {
      v124 = 0;
      v125 = (float *)((unint64_t)&v519 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      v518 = v120;
      v126 = *(float *)((unint64_t)&v518 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      v519 = v121;
      v127 = *((float *)&v121 + 3) - *v125;
      v128 = *((float *)&v121 + 3) + *v125;
      v520 = v122;
      v129 = *(float *)((unint64_t)&v520 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      v521 = v123;
      v130 = *(float *)((unint64_t)&v521 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      v131 = *((float *)&v122 + 3) - v129;
      v132 = *((float *)&v122 + 3) + v129;
      v133 = 1;
      do
      {
        v134 = v133 & 1;
        if ((v133 & 1) != 0)
          v135 = v126;
        else
          v135 = -v126;
        v136 = (float32x4_t *)(&v589 + (v124 | (2 * v118)));
        v137 = v136[1];
        v137.f32[0] = *((float *)&v120 + 3) + v135;
        if ((v133 & 1) != 0)
          v138 = v128;
        else
          v138 = v127;
        v137.f32[1] = v138;
        if ((v133 & 1) != 0)
          v139 = v132;
        else
          v139 = v131;
        v137.f32[2] = v139;
        v140 = vmulq_f32(v137, v137);
        v141 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v140.f32, 1);
        if ((v133 & 1) != 0)
          v142 = v130;
        else
          v142 = -v130;
        v137.f32[3] = *((float *)&v123 + 3) + v142;
        v136[1] = vmulq_n_f32(v137, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v140, 2), vaddq_f32(v140, v141)).f32[0]));
        v124 = 1;
        v133 = 0;
      }
      while (v134);
      ++v118;
    }
    while (v118 != 3);
  }
  v143 = CACurrentMediaTime();
  prof_beginFlame((uint64_t)"Deformer", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 3329);
  v546 = 0;
  v588[8] = v605;
  v588[9] = v606;
  v588[10] = v607;
  v588[11] = v608;
  v588[4] = v601;
  v588[5] = v602;
  v588[6] = v603;
  v588[7] = v604;
  v588[0] = v597;
  v588[1] = v598;
  v588[2] = v599;
  v588[3] = v600;
  v587[4] = v593;
  v587[5] = v594;
  v587[6] = v595;
  v587[0] = v589;
  v587[1] = v590;
  v587[3] = v592;
  v587[2] = v591;
  v35 = (VFXMTLMesh *)sub_1B187209C(v71, (uint64_t)self, v34, v588, v587, &v546);
  self->__engineStats->mrphTime = CACurrentMediaTime() - v143 + self->__engineStats->mrphTime;
  prof_endFlame();
  v30 = v546;
  if ((v32 & 1) != 0)
  {
    var7 = (__CFXFXPass *)v517.i64[0];
    if (v35)
    {
      *((_QWORD *)v513 + 208) = var4;
      v36 = v35;
LABEL_53:
      self->_cache.metalMesh = v35;
      v496 = 1;
      v35 = v36;
      goto LABEL_54;
    }
LABEL_42:
    if (v499->var11 && (v501 & v15 & 1) == 0)
      sub_1B17B1F4C((uint64_t)var4, v516.u32[0], (uint64_t)a3, v3, v4, v5, v6, v7);
    *((_QWORD *)v513 + 208) = var4;
    if (var4)
      v35 = sub_1B18FB1C0((uint64_t)self->_resourceManager, (uint64_t)var4, v516.u32[0]);
    else
      v35 = 0;
    v36 = 0;
    goto LABEL_53;
  }
  v496 = 0;
  var7 = (__CFXFXPass *)v517.i64[0];
LABEL_54:
  if ((v501 & 1) == 0)
    goto LABEL_70;
  if (v30)
  {
    v37 = self->_renderPassParameters.eyeCount;
    v38 = *(_DWORD *)v513;
    if ((*(_DWORD *)v513 & 2) == 0)
    {
      *(_DWORD *)v513 = v38 | 2;
      if (!(_DWORD)v37)
      {
        if ((v38 & 4) == 0)
          *(_DWORD *)v513 = v38 | 6;
        goto LABEL_112;
      }
      v39 = 0;
      v40 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
      v41 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
      v42 = *(_OWORD *)&self->_anon_3378[8];
      v43 = *(_OWORD *)&self->_anon_3378[24];
      do
      {
        v44 = 0;
        v45 = &self->_anon_250[784 * v39 + 4];
        v46 = *(float32x4_t *)v45;
        v47 = *((float32x4_t *)v45 + 1);
        v48 = *((float32x4_t *)v45 + 2);
        v49 = *((float32x4_t *)v45 + 3);
        v589 = v40;
        v590 = v41;
        v591 = v42;
        v592 = v43;
        do
        {
          *(__int128 *)((char *)&v597 + v44) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v44))), v47, *(float32x2_t *)((char *)&v589 + v44), 1), v48, *(float32x4_t *)((char *)&v589 + v44), 2), v49, *(float32x4_t *)((char *)&v589 + v44), 3);
          v44 += 16;
        }
        while (v44 != 64);
        v50 = v598;
        v51 = v599;
        v52 = v600;
        v53 = &self->_anon_3378[64 * v39 + 1128];
        *(_OWORD *)v53 = v597;
        *((_OWORD *)v53 + 1) = v50;
        *((_OWORD *)v53 + 2) = v51;
        *((_OWORD *)v53 + 3) = v52;
        ++v39;
      }
      while (v39 != v37);
      v38 = *(_DWORD *)v513;
    }
    if ((v38 & 4) == 0)
    {
      *(_DWORD *)v513 = v38 | 4;
      if ((_DWORD)v37)
      {
        v54 = 0;
        v55 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
        v56 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
        v57 = *(_OWORD *)&self->_anon_3378[8];
        v58 = *(_OWORD *)&self->_anon_3378[24];
        do
        {
          v59 = 0;
          v60 = &self->_anon_250[784 * v54 + 4];
          v61 = *((float32x4_t *)v60 + 12);
          v62 = *((float32x4_t *)v60 + 13);
          v63 = *((float32x4_t *)v60 + 14);
          v64 = *((float32x4_t *)v60 + 15);
          v589 = v55;
          v590 = v56;
          v591 = v57;
          v592 = v58;
          do
          {
            *(__int128 *)((char *)&v597 + v59) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v59))), v62, *(float32x2_t *)((char *)&v589 + v59), 1), v63, *(float32x4_t *)((char *)&v589 + v59), 2), v64, *(float32x4_t *)((char *)&v589 + v59), 3);
            v59 += 16;
          }
          while (v59 != 64);
          v65 = v598;
          v66 = v599;
          v67 = v600;
          v68 = &self->_anon_3378[64 * v54 + 2152];
          *(_OWORD *)v68 = v597;
          *((_OWORD *)v68 + 1) = v65;
          *((_OWORD *)v68 + 2) = v66;
          *((_OWORD *)v68 + 3) = v67;
          ++v54;
        }
        while (v54 != v37);
      }
    }
LABEL_112:
    LOBYTE(v30) = 1;
  }
LABEL_113:
  v144 = *(_OWORD *)&self->_anon_3378[1144];
  v597 = *(_OWORD *)&self->_anon_3378[1128];
  v598 = v144;
  v145 = *(_OWORD *)&self->_anon_3378[1176];
  v599 = *(_OWORD *)&self->_anon_3378[1160];
  v600 = v145;
  v146 = *(_OWORD *)&self->_anon_3378[2168];
  v601 = *(_OWORD *)&self->_anon_3378[2152];
  v602 = v146;
  v147 = *(_OWORD *)&self->_anon_3378[2200];
  v603 = *(_OWORD *)&self->_anon_3378[2184];
  v604 = v147;
  v148 = *(_OWORD *)&self->_anon_250[132];
  v149 = *(_OWORD *)&self->_anon_250[148];
  v150 = *(_OWORD *)&self->_anon_250[164];
  v608 = *(_OWORD *)&self->_anon_250[180];
  v607 = v150;
  v606 = v149;
  v605 = v148;
  metalMesh = self->_cache.metalMesh;
  currentFrameIndex = self->_currentFrameIndex;
  v153 = sub_1B18FBC34((uint64_t)self->_resourceManager, (uint64_t)var2);
  v582[0] = metalMesh;
  v582[1] = self;
  v582[2] = &v597;
  v583 = currentFrameIndex;
  v584 = v30;
  v585 = 0;
  v586 = 0;
  objc_msgSend_update_(v153, v154, (uint64_t)v582, v155);
  metalMeshElement = self->_cache.metalMeshElement;
  v157 = *((_BYTE *)v499 + 77) & 7;
  v498 = v153;
  v69 = objc_msgSend_pipelineStateHashForMeshElement_patchType_(v153, v158, (uint64_t)metalMeshElement, v157);
  v70 = v513[1920] == v69;
  v513[1920] = v69;
  if (v15)
  {
    self->_cache.meshElement = var5;
    self->_cache.metalMeshElement = 0;
    v159 = v513;
    var7 = (__CFXFXPass *)v517.i64[0];
    goto LABEL_132;
  }
  var7 = (__CFXFXPass *)v517.i64[0];
LABEL_116:
  if (self->_cache.meshElement == var5)
    goto LABEL_128;
  if (v35)
    v160 = v15;
  else
    v160 = 1;
  if ((v160 & 1) == 0)
  {
    v171 = sub_1B1876128((uint64_t)var4, var5, v516.u32[0], v3, v4, v5, v6, v7);
    if (v171 != -1)
    {
      v172 = v171;
      v173 = (void *)sub_1B1955D00((uint64_t)v35);
      v176 = (VFXMTLMeshElement *)objc_msgSend_objectAtIndexedSubscript_(v173, v174, v172, v175);
      self->_cache.meshElement = var5;
      self->_cache.metalMeshElement = v176;
      v159 = v513;
      if (sub_1B1955CE0((uint64_t)v176))
        goto LABEL_132;
      v177 = sub_1B17A4584((uint64_t)var5);
      sub_1B1955FEC(v176, v177, v178);
      v179 = (uint64_t)v176;
      goto LABEL_131;
    }
LABEL_128:
    v159 = v513;
    goto LABEL_132;
  }
  self->_cache.meshElement = var5;
  if (var5)
  {
    v161 = sub_1B18FAA70((uint64_t)self->_resourceManager, (uint64_t)var5);
    p_metalMeshElement = &self->_cache.metalMeshElement;
    self->_cache.metalMeshElement = v161;
    v159 = v513;
    if (!v161)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v162, v163, v164, v165, v166, v167, (uint64_t)"_cache.metalMeshElement");
    v169 = sub_1B17A4584((uint64_t)var5);
    sub_1B1955FEC(*p_metalMeshElement, v169, v170);
  }
  else
  {
    p_metalMeshElement = &self->_cache.metalMeshElement;
    self->_cache.metalMeshElement = 0;
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_cache.metalMeshElement");
    v159 = v513;
  }
  v179 = (uint64_t)*p_metalMeshElement;
LABEL_131:
  if (!sub_1B1955D20(v179))
    return;
LABEL_132:
  v516.i32[0] = v69;
  if (var5)
  {
    v180 = sub_1B17A426C((uint64_t)var5, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
    v181 = (__CFXNode *)v509;
    if (v180 > 5)
      LOBYTE(v182) = 0;
    else
      v182 = 0x30001020303uLL >> (8 * v180);
  }
  else
  {
    LOBYTE(v182) = 0;
    v181 = (__CFXNode *)v509;
  }
  v183 = v159[1745];
  v159[1745] = v182;
  v184 = (__CFXCommonProfile *)var1;
  v186 = self->_cache.material != var1 || v500 != var0;
  LODWORD(v506) = v186;
  self->_cache.material = var1;
  if (v184)
    v184 = (__CFXCommonProfile *)sub_1B187813C((uint64_t)v184, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v187 = v515.i32[0];
  self->_cache.commonProfile = v184;
  geometry = self->_cache.geometry;
  self->_cache.geometry = v507;
  v188 = sub_1B18F39CC((uint64_t)self->_processingContext.dynamicBatchingSystem);
  v196 = v514.i32[0];
  if (v510 != 1)
    v196 = 0;
  if (self->_cache.node == v181 && v500 == var0)
    v198 = v196;
  else
    v198 = 1;
  if (v188 > 1)
    v198 = 1;
  HIDWORD(v495) = v198;
  self->_cache.node = v181;
  passInstance = (float32x4_t *)self->_processingContext.passInstance;
  v200 = (__CFXNode *)passInstance[797].i64[1];
  if (self->_cache.pointOfView == v200
    && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_4730, passInstance[524]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_cache.tessellationPipelineStateHash, passInstance[523])), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[16], passInstance[525]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[32], passInstance[526])))) & 0x80000000) != 0)
  {
    LODWORD(v495) = 0;
  }
  else
  {
    self->_cache.pointOfView = v200;
    v201 = passInstance[523];
    v202 = passInstance[524];
    v203 = passInstance[525];
    *(float32x4_t *)&self->_anon_4730[32] = passInstance[526];
    *(float32x4_t *)&self->_anon_4730[16] = v203;
    *(float32x4_t *)self->_anon_4730 = v202;
    *(float32x4_t *)&self->_cache.tessellationPipelineStateHash = v201;
    LODWORD(v495) = 1;
  }
  v497 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[64], passInstance[588]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[48], passInstance[587])), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[80], passInstance[589]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[96], passInstance[590]))));
  if ((v497 & 0x80000000) == 0)
  {
    v204 = (__int128 *)&passInstance[587];
    v205 = *v204;
    v206 = v204[1];
    v207 = v204[3];
    *(_OWORD *)&self->_anon_4730[80] = v204[2];
    *(_OWORD *)&self->_anon_4730[96] = v207;
    *(_OWORD *)&self->_anon_4730[48] = v205;
    *(_OWORD *)&self->_anon_4730[64] = v206;
  }
  v208 = self->_cache.metalMesh;
  if (v501)
    v209 = (uint64_t)sub_1B1955A0C(v208, v189, v190, v191);
  else
    v209 = sub_1B1955904((uint64_t)v208, (uint64_t)v189, v190, v191, v192, v193, v194, v195);
  v217 = v209;
  v218 = *(_QWORD *)&self->_anon_4730[112];
  *(_QWORD *)&self->_anon_4730[112] = v209;
  if (v181 && !v187)
    sub_1B186C4A8((uint64_t)v181, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  v581 = 0;
  v580 = 0;
  if (var7)
    v219 = (__CFXBlendStates *)sub_1B19AF21C((uint64_t)var7, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  else
    v219 = 0;
  if (var1 && !v219)
  {
    v220 = objc_msgSend_enableARMode(self, v210, v211, v212);
    v219 = (__CFXBlendStates *)sub_1B1878724((uint64_t)var1, v187 != 0, (_DWORD)p_resourceManagerMonitor != 0, v220, (uint64_t)&v580, v221, v222, v223);
  }
  if (v219 && sub_1B18A79E4((uint64_t)v219, (uint64_t)v210, v211, v212, v213, v214, v215, v216))
  {
    LODWORD(v225) = HIDWORD(v580);
    LODWORD(v224) = v580;
    LODWORD(v227) = HIDWORD(v581);
    LODWORD(v226) = v581;
    objc_msgSend_setBlendColorRed_green_blue_alpha_(self->_renderEncoder->var3, v210, v211, v212, v224, v225, v226, v227);
  }
  if (var1)
    v228 = sub_1B1878538((uint64_t)var1, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  else
    v228 = 15;
  v229 = v500;
  if (v499->var13)
    v230 = 0;
  else
    v230 = v228;
  v231 = v513[1744];
  v513[1744] = v230;
  blendStates = self->_cache.blendStates;
  self->_cache.blendStates = v219;
  if (v229 == var0 && v218 == v217 && blendStates == v219 && v231 == v230 && v70 && v183 == v182)
  {
LABEL_203:
    v566 = 1;
    v258 = *(void **)&self->_anon_4730[128];
    if (!v258 || !objc_msgSend_state(v258, v210, v211, v212))
      return;
    v564 = 0u;
    v565 = 0u;
    v562 = 0u;
    v563 = 0u;
    v262 = (void *)objc_msgSend_frameBufferBindings(*(void **)&self->_anon_4730[128], v259, v260, v261);
    v264 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v263, (uint64_t)&v562, (uint64_t)v614, 16);
    if (v264)
    {
      v268 = v264;
      v269 = *(_QWORD *)v563;
      do
      {
        for (i = 0; i != v268; ++i)
        {
          if (*(_QWORD *)v563 != v269)
            objc_enumerationMutation(v262);
          v271 = *(void **)(*((_QWORD *)&v562 + 1) + 8 * i);
          v272 = objc_msgSend_bindBlock(v271, v265, v266, v267, v495);
          (*(void (**)(uint64_t, void *, VFXMTLRenderContext *))(v272 + 16))(v272, v271, self);
        }
        v268 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v265, (uint64_t)&v562, (uint64_t)v614, 16);
      }
      while (v268);
    }
    if (objc_msgSend_passBufferBindings(*(void **)&self->_anon_4730[128], v265, v266, v267, v495))
    {
      v280 = sub_1B19AD268(v517.i64[0], (uint64_t)v273, v274, v275, v276, v277, v278, v279);
      v558 = 0u;
      v559 = 0u;
      v560 = 0u;
      v561 = 0u;
      v514.i64[0] = objc_msgSend_passBufferBindings(*(void **)&self->_anon_4730[128], v281, v282, v283);
      v517.i64[0] = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v514.i64[0], v284, (uint64_t)&v558, (uint64_t)v613, 16);
      if (v517.i64[0])
      {
        v516.i64[0] = *(_QWORD *)v559;
        p_resourceManagerMonitor = (id *)&self->_resourceManagerMonitor;
        do
        {
          v285 = 0;
          do
          {
            if (*(_QWORD *)v559 != v516.i64[0])
              objc_enumerationMutation((id)v514.i64[0]);
            v286 = *(_QWORD *)(*((_QWORD *)&v558 + 1) + 8 * v285);
            if (objc_msgSend_type((void *)v286, v273, v274, v275))
            {
              if (objc_msgSend_type((void *)v286, v287, v288, v289) != 2)
                goto LABEL_266;
              Weak = objc_loadWeak(p_resourceManagerMonitor);
              v295 = Weak;
              v296 = *(_QWORD *)(v286 + 56);
              if (*(_DWORD *)(v296 + 16) == 1)
              {
                v297 = *(void **)(v296 + 72);
                if (!v297)
                  v297 = *(void **)(v296 + 56);
                v298 = sub_1B1813E3C((uint64_t)self->_engineContext);
                v301 = *(_QWORD *)(v296 + 64);
                if (v301)
                {
                  v302 = 0x9DDFEA08EB382D69
                       * (v301 ^ ((0x9DDFEA08EB382D69 * (v301 ^ v509)) >> 47) ^ (0x9DDFEA08EB382D69 * (v301 ^ v509)));
                  v303 = sub_1B19AAB74(v298, -348639895 * ((v302 >> 47) ^ v302));
                }
                else
                {
                  v303 = sub_1B19AAB7C(v298, v297, v299, v300);
                }
                v330 = v303;
                if (!v303)
                {
                  if (v295)
                  {
                    v338 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v273, (uint64_t)CFSTR("No registered texture for binding %@ and symbol \"%@\" in pass or render graph.\nPass: (%p)\n"), v275, v286, v297, self->_processingContext.renderGraphPass, v493);
                    goto LABEL_249;
                  }
LABEL_259:
                  v297 = 0;
                  v339 = 0;
                  goto LABEL_260;
                }
                goto LABEL_262;
              }
              if (v280)
              {
                v317 = *(_QWORD *)(v296 + 96);
                v318 = *(_QWORD *)(v280 + v317);
                if (v318)
                {
                  v297 = (void *)sub_1B19209C0(*(_QWORD *)(v280 + v317), (uint64_t)v273, v274, v275, v291, v292, v293, v294);
                  v330 = (void *)sub_1B1920AC8(v318, v319, v320, v321, v322, v323, v324, v325);
                  if (v330
                    || (v348 = sub_1B1920A80(v318, (uint64_t)v273, v274, v275, v326, v327, v328, v329)) != 0
                    && (v330 = (void *)objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(self->_resourceManager, v273, v348, (uint64_t)v297, 0, self->_engineContext, 0)) != 0)
                  {
                    if (*(unsigned __int8 *)(v286 + 12) != 255 || *(unsigned __int8 *)(v286 + 11) != 255)
                    {
                      v331 = sub_1B18FD03C((uint64_t)self->_resourceManager, (uint64_t)v297);
                      renderEncoder = self->_renderEncoder;
                      v333 = *(unsigned __int16 *)(v286 + 9);
                      if (*(_BYTE *)(v286 + 9) != 0xFF)
                        objc_msgSend_setVertexSamplerState_atIndex_(renderEncoder->var3, v273, (uint64_t)v331, (char)v333);
                      if ((~v333 & 0xFF00) != 0)
                        objc_msgSend_setFragmentSamplerState_atIndex_(renderEncoder->var3, v273, (uint64_t)v331, (uint64_t)(__int16)v333 >> 8);
                    }
                  }
                  else
                  {
                    if (!v295)
                      goto LABEL_259;
                    v353 = (void *)MEMORY[0x1E0CB3940];
                    v354 = sub_1B1920AC8(v318, (uint64_t)v273, v274, v275, v349, v350, v351, v352);
                    v494 = sub_1B1920A80(v318, v355, v356, v357, v358, v359, v360, v361);
                    v338 = objc_msgSend_stringWithFormat_(v353, v362, (uint64_t)CFSTR("No texture or image provided for binding %@ by sampler %@.\nTexture: %@\nImage: %@"), v363, v286, v297, v354, v494);
LABEL_249:
                    v339 = v338;
LABEL_260:
                    v364 = (void *)objc_msgSend_binding((void *)v286, v273, v274, v275);
                    v368 = objc_msgSend_textureType(v364, v365, v366, v367);
                    v330 = (void *)objc_msgSend_defaultTextureForTextureType_(self->_resourceManager, v369, v368, v370);
                    if (v295)
                      objc_msgSend_renderContext_didFallbackToDefaultTextureForSource_message_(v295, v273, (uint64_t)self, (uint64_t)v297, v339);
                  }
LABEL_262:
                  v371 = self->_renderEncoder;
                  v372 = *(_WORD *)(v286 + 9);
                  if ((_BYTE)v372 != 0xFF)
                    sub_1B185B808((uint64_t)self->_renderEncoder, v330, (char)v372, v275);
                  if ((~v372 & 0xFF00) != 0)
                    sub_1B179AEE4((uint64_t)v371, v330, (uint64_t)v372 >> 8, v275);
                  goto LABEL_266;
                }
                if (!Weak)
                  goto LABEL_259;
                v347 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v273, (uint64_t)CFSTR("No sampler found for binding %@ and input %@"), v275, v286, v296);
              }
              else
              {
                v340 = objc_msgSend_name((void *)v286, v273, v274, v275);
                sub_1B17C4408(16, (uint64_t)CFSTR("Error: pass has no storage for input %@"), v341, v342, v343, v344, v345, v346, v340);
                if (!v295)
                  goto LABEL_259;
                v347 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v273, (uint64_t)CFSTR("No pass storage for binding %@"), v275, v286, v493);
              }
              v339 = v347;
              v297 = (void *)v286;
              goto LABEL_260;
            }
            v304 = objc_msgSend_bufferSize((void *)v286, v287, v288, v289);
            v515.i64[0] = (uint64_t)&v495;
            v310 = MEMORY[0x1E0C80A78](v304, v305);
            v311 = (char *)&v495 - v309;
            if (v280)
            {
              if (objc_msgSend_inputsCount((void *)v286, v306, v307, v308, v310) >= 1)
              {
                v312 = 0;
                v313 = 0;
                do
                {
                  memcpy(&v311[*(unsigned int *)(*(_QWORD *)(v286 + 48) + v312 + 8)], (const void *)(v280 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v286 + 48) + v312) + 96)), *(unsigned int *)(*(_QWORD *)(v286 + 48) + v312 + 12));
                  ++v313;
                  v312 += 16;
                }
                while (v313 < objc_msgSend_inputsCount((void *)v286, v314, v315, v316));
              }
            }
            else
            {
              bzero((char *)&v495 - v309, v304);
            }
            v334 = *(unsigned __int16 *)(v286 + 9);
            v335 = self->_renderEncoder;
            v597 = 0uLL;
            *(_QWORD *)&v598 = 0;
            sub_1B1868D14((uint64_t)v335->var4, v311, v304, (void **)&v597);
            v336 = *((_QWORD *)&v597 + 1);
            v337 = v598;
            if ((_BYTE)v334 != 0xFF)
              objc_msgSend_setVertexBuffer_offset_atIndex_(v335->var3, v273, *((uint64_t *)&v597 + 1), v598, (char)v334);
            if ((~v334 & 0xFF00) != 0)
              objc_msgSend_setFragmentBuffer_offset_atIndex_(v335->var3, v273, v336, v337, (uint64_t)(__int16)v334 >> 8);
LABEL_266:
            ++v285;
          }
          while (v285 != v517.i64[0]);
          v517.i64[0] = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v514.i64[0], v273, (uint64_t)&v558, (uint64_t)v613, 16);
        }
        while (v517.i64[0]);
      }
    }
    v373 = (char)v506;
    if (geometry != v507)
      v373 = 1;
    if ((v373 & 1) != 0 || v500 != var0)
    {
      v374 = self->_cache.material
           ? sub_1B18FC0C8((uint64_t)self->_resourceManager, var1, v507, *(VFXMTLRenderPipeline **)&self->_anon_4730[128], (uint64_t)self->_engineContext, v277, v278, v279): 0;
      self->_cache.metalShadable = v374;
      v554 = 0u;
      v555 = 0u;
      v556 = 0u;
      v557 = 0u;
      v375 = (void *)objc_msgSend_shadableBufferBindings(*(void **)&self->_anon_4730[128], v273, v274, v275);
      v377 = objc_msgSend_countByEnumeratingWithState_objects_count_(v375, v376, (uint64_t)&v554, (uint64_t)v612, 16);
      if (v377)
      {
        v378 = v377;
        v379 = *(_QWORD *)v555;
        do
        {
          for (j = 0; j != v378; ++j)
          {
            if (*(_QWORD *)v555 != v379)
              objc_enumerationMutation(v375);
            v381 = *(void **)(*((_QWORD *)&v554 + 1) + 8 * j);
            v382 = objc_msgSend_bindBlock(v381, v273, v274, v275);
            if (v382)
              (*(void (**)(uint64_t, void *, VFXMTLRenderContext *))(v382 + 16))(v382, v381, self);
          }
          v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v375, v273, (uint64_t)&v554, (uint64_t)v612, 16);
        }
        while (v378);
      }
    }
    if (v499->var12)
    {
      v383 = self->_processingContext.passInstance;
      v616.columns[3] = *(simd_float4 *)&v383[50].var2;
      v616.columns[2] = *(simd_float4 *)&v383[50].var0;
      v616.columns[1] = *(simd_float4 *)&v383[49].var8[15];
      p_resourceManagerMonitor = (id *)&v383->var0;
      v616.columns[0] = *(simd_float4 *)&v383[49].var8[13];
      v617 = __invert_f4(v616);
      v516 = v617.columns[1];
      v517 = v617.columns[0];
      v514 = v617.columns[3];
      v515 = v617.columns[2];
      p_var6 = (uint64_t)&v499->var6;
      v385 = *(_QWORD *)&self->_anon_4730[128];
      v386 = *(_QWORD *)&v499->var6 ^ v385 ^ self->_renderPassParameters.eyeCount ^ (unint64_t)self->_renderPassParameters.viewMapping;
      v553 = v386;
      if (self->_lighting.currentLightingHashKey != v386)
      {
        self->_lighting.currentLightingHashKey = v386;
        v506 = (void *)objc_msgSend_lightBufferBindings((void *)v385, v273, v274, v275);
        if (v506)
        {
          sub_1B17961D0((uint64_t)self->_processingContext.lightingSystem, p_var6, (unint64_t *)&self->_lighting.currentLightingDesc, v275, v387, v388, v389, v390);
          *(_QWORD *)&v597 = &v553;
          var1 = (__CFXMaterial *)sub_1B185B8D0((uint64_t)&self->_lighting, &v553, (uint64_t)&unk_1B22458B0, (_QWORD **)&v597);
          if (*((_QWORD *)var1 + 3))
          {
            v544 = 0u;
            v545 = 0u;
            v542 = 0u;
            v543 = 0u;
            v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v391, (uint64_t)&v542, (uint64_t)v610, 16);
            if (v392)
            {
              v393 = v392;
              v394 = *(_QWORD *)v543;
              do
              {
                for (k = 0; k != v393; ++k)
                {
                  if (*(_QWORD *)v543 != v394)
                    objc_enumerationMutation(v506);
                  v396 = self->_renderEncoder;
                  v397 = *((_QWORD *)var1 + 3);
                  v398 = *((_QWORD *)var1 + 4);
                  v399 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)&v542 + 1) + 8 * k) + 9);
                  if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v542 + 1) + 8 * k) + 9) != 0xFF)
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v396->var3, v273, *((_QWORD *)var1 + 3), *((_QWORD *)var1 + 4), (char)v399);
                  if ((~v399 & 0xFF00) != 0)
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v396->var3, v273, v397, v398, (uint64_t)(__int16)v399 >> 8);
                }
                v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v273, (uint64_t)&v542, (uint64_t)v610, 16);
              }
              while (v393);
            }
          }
          else
          {
            v551 = 0u;
            v552 = 0u;
            v549 = 0u;
            v550 = 0u;
            geometry = (__CFXGeometry *)objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v391, (uint64_t)&v549, (uint64_t)v611, 16);
            if (geometry)
            {
              v503 = *(_QWORD *)v550;
              do
              {
                v400 = 0;
                do
                {
                  if (*(_QWORD *)v550 != v503)
                    objc_enumerationMutation(v506);
                  v507 = v400;
                  v401 = *(_QWORD *)(*((_QWORD *)&v549 + 1) + 8 * (_QWORD)v400);
                  if (objc_msgSend_semanticsCount((void *)v401, v273, v274, v275) >= 1)
                  {
                    v402 = objc_msgSend_bufferSize((void *)v401, v273, v274, v275)
                         * self->_renderPassParameters.eyeCount;
                    v403 = var1;
                    *((_QWORD *)var1 + 5) = v402;
                    v547 = 0;
                    v546 = 0;
                    v548 = 0;
                    sub_1B1868B34((uint64_t)self->_frameConstantBufferPool, v402, &v546);
                    v404 = v548;
                    *((_QWORD *)v403 + 3) = v547;
                    *((_QWORD *)v403 + 4) = v404;
                    if (self->_renderPassParameters.eyeCount)
                    {
                      v405 = 0;
                      do
                      {
                        v406 = 0;
                        v407 = &p_resourceManagerMonitor[8 * v405];
                        v408 = *((float32x4_t *)v407 + 523);
                        v409 = *((float32x4_t *)v407 + 524);
                        v410 = *((float32x4_t *)v407 + 525);
                        v411 = *((float32x4_t *)v407 + 526);
                        v589 = (__int128)v517;
                        v590 = (__int128)v516;
                        v591 = (__int128)v515;
                        v592 = (__int128)v514;
                        do
                        {
                          *(__int128 *)((char *)&v597 + v406) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v406))), v409, *(float32x2_t *)((char *)&v589 + v406), 1), v410, *(float32x4_t *)((char *)&v589 + v406), 2), v411, *(float32x4_t *)((char *)&v589 + v406), 3);
                          v406 += 16;
                        }
                        while (v406 != 64);
                        v412 = 0;
                        v413 = v598;
                        v414 = v599;
                        v415 = v600;
                        *(_OWORD *)self->_anon_4100 = v597;
                        *(_OWORD *)&self->_anon_4100[16] = v413;
                        *(_OWORD *)&self->_anon_4100[32] = v414;
                        *(_OWORD *)&self->_anon_4100[48] = v415;
                        v589 = (__int128)v517;
                        v590 = (__int128)v516;
                        v591 = (__int128)v515;
                        v592 = (__int128)v514;
                        v416 = v513;
                        do
                        {
                          *(__int128 *)((char *)&v597 + v412) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(__int128 *)((char *)&v589 + v412))), v409, *(float32x2_t *)((char *)&v589 + v412), 1), v410, *(float32x4_t *)((char *)&v589 + v412), 2), v411, *(float32x4_t *)((char *)&v589 + v412), 3);
                          v412 += 16;
                        }
                        while (v412 != 64);
                        v417 = v598;
                        v418 = v599;
                        v419 = v600;
                        *(_OWORD *)&self->_anon_4100[64] = v597;
                        *(_OWORD *)&self->_anon_4100[80] = v417;
                        *(_OWORD *)&self->_anon_4100[96] = v418;
                        *(_OWORD *)&self->_anon_4100[112] = v419;
                        v416[344] = 1;
                        if (objc_msgSend_semanticsCount((void *)v401, v273, v274, v275) >= 1)
                        {
                          v423 = 0;
                          v424 = 0;
                          do
                          {
                            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v401 + 48) + v423) + 16))();
                            ++v424;
                            v423 += 16;
                          }
                          while (v424 < objc_msgSend_semanticsCount((void *)v401, v425, v426, v427));
                        }
                        v428 = objc_msgSend_bufferSize((void *)v401, v420, v421, v422);
                        v546 += v428;
                        ++v405;
                      }
                      while (v405 < self->_renderPassParameters.eyeCount);
                    }
                  }
                  v429 = self->_renderEncoder;
                  v430 = *((_QWORD *)var1 + 3);
                  v431 = *((_QWORD *)var1 + 4);
                  v432 = *(unsigned __int16 *)(v401 + 9);
                  if ((_BYTE)v432 != 0xFF)
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v429->var3, v273, *((_QWORD *)var1 + 3), *((_QWORD *)var1 + 4), (char)v432);
                  if ((~v432 & 0xFF00) != 0)
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v429->var3, v273, v430, v431, (uint64_t)(__int16)v432 >> 8);
                  v400 = (__CFXGeometry *)((char *)&v507->var0.var0.var0 + 1);
                }
                while ((__CFXGeometry *)((char *)&v507->var0.var0.var0 + 1) != geometry);
                geometry = (__CFXGeometry *)objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v273, (uint64_t)&v549, (uint64_t)v611, 16);
              }
              while (geometry);
            }
          }
        }
      }
    }
    v433 = v505;
    if (((HIDWORD(v495) | v495) & 1) != 0 || (v497 & 0x80000000) == 0)
    {
      v540 = 0u;
      v541 = 0u;
      v538 = 0u;
      v539 = 0u;
      v517.i64[0] = objc_msgSend_nodeBufferBindings(*(void **)&self->_anon_4730[128], v273, v274, v275);
      v435 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v517.i64[0], v434, (uint64_t)&v538, (uint64_t)v609, 16);
      if (v435)
      {
        v436 = v435;
        v437 = *(_QWORD *)v539;
        v516.i64[0] = *(_QWORD *)v539;
        do
        {
          for (m = 0; m != v436; ++m)
          {
            if (*(_QWORD *)v539 != v437)
              objc_enumerationMutation((id)v517.i64[0]);
            v439 = *(_QWORD *)(*((_QWORD *)&v538 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend_semanticsCount((void *)v439, v440, v441, v442) < 1)
              {
                sub_1B17C4408(16, (uint64_t)CFSTR("Error: binding is broken : neither block or semantic"), v444, v445, v446, v447, v448, v449, v495);
              }
              else
              {
                v450 = objc_msgSend_bufferSize((void *)v439, v443, v444, v445);
                v451 = self->_renderPassParameters.eyeCount;
                v528[0] = MEMORY[0x1E0C809B0];
                v528[1] = 3221225472;
                v529 = sub_1B185659C;
                v530 = &unk_1E63D73B0;
                v533 = v433;
                v534 = var8;
                v536 = v510;
                v537 = v451;
                v535 = v450;
                v531 = self;
                v532 = v439;
                v452 = sub_1B191DA5C((uint64_t)self->_processingContext.dynamicBatchingSystem, &v566);
                v454 = v450 * v451;
                if (v566 < 2)
                {
                  v515.i64[0] = (uint64_t)&v495;
                  v471 = MEMORY[0x1E0C80A78](v452, v453);
                  ((void (*)(_QWORD *, uint64_t, char *, double))v529)(v528, v509, (char *)&v495 - ((v454 + 15) & 0xFFFFFFFFFFFFFFF0), v471);
                  v472 = *(unsigned __int16 *)(v439 + 9);
                  v473 = self->_renderEncoder;
                  v597 = 0uLL;
                  *(_QWORD *)&v598 = 0;
                  sub_1B1868D14((uint64_t)v473->var4, (char *)&v495 - ((v454 + 15) & 0xFFFFFFFFFFFFFFF0), v454, (void **)&v597);
                  v474 = *((_QWORD *)&v597 + 1);
                  v475 = v598;
                  if ((_BYTE)v472 != 0xFF)
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v473->var3, v456, *((uint64_t *)&v597 + 1), v598, (char)v472);
                  if ((~v472 & 0xFF00) != 0)
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v473->var3, v456, v474, v475, (uint64_t)(__int16)v472 >> 8);
                  v433 = v505;
                }
                else
                {
                  v455 = v452;
                  v597 = 0uLL;
                  *(_QWORD *)&v598 = 0;
                  sub_1B1868B34((uint64_t)self->_frameConstantBufferPool, v566 * v454, &v597);
                  if (v566 >= 1)
                  {
                    v457 = 0;
                    v458 = v597;
                    do
                    {
                      ((void (*)(_QWORD *, _QWORD, uint64_t))v529)(v528, *(_QWORD *)(v455 + 8 * v457), v458);
                      v458 += v454;
                      ++v457;
                    }
                    while (v457 < v566);
                  }
                  v459 = self->_renderEncoder;
                  v460 = *((_QWORD *)&v597 + 1);
                  v461 = v598;
                  v462 = *(unsigned __int16 *)(v439 + 9);
                  if ((_BYTE)v462 != 0xFF)
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v459->var3, v456, *((uint64_t *)&v597 + 1), v598, (char)v462);
                  if ((~v462 & 0xFF00) != 0)
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v459->var3, v456, v460, v461, (uint64_t)(__int16)v462 >> 8);
                }
                v437 = v516.i64[0];
              }
            }
            else
            {
              if (!objc_msgSend_bindBlock((void *)v439, v440, v441, v442))
                sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v464, v465, v466, v467, v468, v469, (uint64_t)"resourceBinding.bindBlock");
              v470 = objc_msgSend_bindBlock((void *)v439, v463, v464, v465);
              (*(void (**)(uint64_t, uint64_t, VFXMTLRenderContext *))(v470 + 16))(v470, v439, self);
            }
          }
          v436 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v517.i64[0], v456, (uint64_t)&v538, (uint64_t)v609, 16);
        }
        while (v436);
      }
    }
    v476 = v513;
    if (v500 != var0 || (v497 & 0x80000000) == 0)
    {
      v477 = self->_renderEncoder;
      buffer = self->_worldUniforms.buffer;
      offset = self->_worldUniforms.offset;
      v480 = *(_QWORD *)&self->_anon_4730[128];
      v481 = *(unsigned __int16 *)(v480 + 8);
      if (*(_BYTE *)(v480 + 8) != 0xFF)
        objc_msgSend_setVertexBuffer_offset_atIndex_(v477->var3, v273, (uint64_t)self->_worldUniforms.buffer, self->_worldUniforms.offset, (char)v481);
      if ((~v481 & 0xFF00) != 0)
        objc_msgSend_setFragmentBuffer_offset_atIndex_(v477->var3, v273, (uint64_t)buffer, offset, (uint64_t)(__int16)v481 >> 8);
    }
    if (v509 && v566 <= 1)
    {
      v482 = *(int32x4_t *)&self->_nodeUniforms.probeCacheIndex;
      v483 = *(int32x4_t *)&self->_anon_3378[8];
      v484 = vmulq_f32(*(float32x4_t *)&self->_nodeUniforms.instanceNode, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v483, (int8x16_t)v483, 0xCuLL), (int8x16_t)v483, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v482, v482), (int8x16_t)v482, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v483, v483), (int8x16_t)v483, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v482, (int8x16_t)v482, 0xCuLL), (int8x16_t)v482, 8uLL)));
      v485 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v484, 2), vaddq_f32(v484, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v484.f32, 1))).f32[0] > 0.0;
      v486 = self->_renderEncoder;
      if (v486->var5)
      {
        objc_msgSend_setFrontFacingWinding_(v486->var3, v273, *((_QWORD *)&xmmword_1B2246910 + v485), v275);
LABEL_369:
        if (v496)
          objc_msgSend__setMeshBuffers_(self, v487, (uint64_t)self->_cache.metalMesh, v488);
        v489 = v566;
        if (v566 <= 1)
          v489 = sub_1B18FD634((uint64_t)self->_cache.metalMeshElement);
        if (v501)
        {
          *(_DWORD *)((char *)v527 + 3) = 0;
          v527[0] = 0;
          if (v489 <= 1)
            v490 = 1;
          else
            v490 = v489;
          v491 = *((_BYTE *)v499 + 77) & 7;
          v492 = *((_OWORD *)v476 + 105);
          v522[0] = *((_OWORD *)v476 + 104);
          v522[1] = v492;
          v523 = v490;
          v524 = 0;
          v525 = self;
          v526 = v491;
          objc_msgSend_draw_(v498, v487, (uint64_t)v522, v489);
        }
        else
        {
          objc_msgSend__drawMeshElement_instanceCount_(self, v487, (uint64_t)self->_cache.metalMeshElement, v489);
        }
        return;
      }
    }
    else
    {
      v486 = self->_renderEncoder;
      v485 = !v486->var5;
    }
    objc_msgSend_setFrontFacingWinding_(v486->var3, v273, v485, v275);
    goto LABEL_369;
  }
  if (v501)
    v233 = (const void *)objc_msgSend_newPipelineStateConfiguratorForMeshElement_patchType_device_(v498, v210, (uint64_t)self->_cache.metalMeshElement, *((_BYTE *)v499 + 77) & 7, self->_device);
  else
    v233 = 0;
  v234 = sub_1B1815A4C((uint64_t)self->_engineContext);
  v236 = v234;
  if ((*((_BYTE *)self + 152) & 0x10) != 0)
    v237 = 2;
  else
    v237 = v234;
  if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2)
    v238 = 2;
  else
    v238 = 1;
  v239 = self->_cache.metalMesh;
  v240 = self->_renderPassParameters.eyeCount;
  viewMapping = self->_renderPassParameters.viewMapping;
  if (v513[2024])
    errors = self->_compilationIssues.errors;
  else
    errors = 0;
  resourceManager = self->_resourceManager;
  v567[0] = var0;
  v567[1] = var1;
  v567[2] = v507;
  v567[3] = v517.i64[0];
  v567[4] = v517.i64[0];
  v567[5] = v239;
  v567[6] = v219;
  v567[7] = v509;
  v568 = v230;
  v569 = v182;
  v570 = v240;
  v571 = v238;
  v572 = viewMapping;
  v573 = v237;
  v574 = 0;
  v575 = errors;
  v576 = v516.i8[0];
  memset(v577, 0, sizeof(v577));
  v578 = v233;
  v579 = 0;
  v244 = (void *)objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(resourceManager, v235, (uint64_t)v567, (uint64_t)self->_currentRenderPassDescriptor, v495);
  *(_QWORD *)&self->_anon_4730[128] = v244;
  if (v233)
  {
    _Block_release(v233);
    v244 = *(void **)&self->_anon_4730[128];
  }
  if (objc_msgSend_state(v244, v245, v246, v247))
  {
    v255 = objc_msgSend_state(*(void **)&self->_anon_4730[128], v248, v249, v250);
    objc_msgSend_setRenderPipelineState_(self->_renderEncoder->var3, v256, v255, v257);
    goto LABEL_203;
  }
  *(_QWORD *)&self->_anon_4730[128] = 0;
  self->_cache.program = 0;
  if (v236)
  {
    if (var1)
      objc_msgSend__prepareMaterialTextures_(self, v248, (uint64_t)var1, v250);
  }
  else if ((byte_1EEF65E9B & 1) == 0)
  {
    byte_1EEF65E9B = 1;
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: _executeProgram - no pipeline state"), v249, v250, v251, v252, v253, v254, v495);
  }
}

- (void)drawRenderElement:(__CFXRendererElement *)a3 withPass:(__CFXFXPass *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  int v22;
  __CFXFXPass *pass;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  int v33;
  char v34;
  float v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  unsigned int var0_low;
  char v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char *v76;
  char *v77;
  BOOL v78;
  BOOL v79;
  char v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  _QWORD v85[3];
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD v90[9];
  char v91;
  char v92;
  char v93;
  BOOL v94;
  BOOL v95;
  char v96;
  __int16 v97;
  _QWORD v98[9];
  char v99;
  char v100;
  char v101;
  BOOL v102;
  char v103;
  char v104;
  __int16 v105;
  _QWORD v106[9];
  char v107;
  char v108;
  char v109;
  BOOL v110;
  char v111;
  char v112;
  __int16 v113;
  _QWORD v114[9];
  char v115;
  char v116;
  char v117;
  BOOL v118;
  char v119;
  char v120;
  __int16 v121;
  _QWORD v122[9];
  char v123;
  char v124;
  char v125;
  BOOL v126;
  char v127;
  char v128;
  __int16 v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  if (!self->_engineContext)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"_engineContext");
  v11 = sub_1B17C2DEC((uint64_t)a3);
  v12 = sub_1B17C2E5C((uint64_t)a3);
  v13 = sub_1B17C2EA0((uint64_t)a3);
  v21 = sub_1B17C2EC0((uint64_t)a3);
  v88 = 0;
  v89 = 0;
  v87 = 0;
  if (a4)
  {
    v22 = sub_1B19ACF10((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
    pass = a4;
    if (v22 == 2)
    {
      pass = a4;
      if ((*(_BYTE *)(v11 + 221) & 0x10) != 0)
        pass = self->_processingContext.pass;
    }
  }
  else
  {
    pass = 0;
  }
  sub_1B18213DC((uint64_t)a3, (uint64_t)pass, (uint64_t)self->_engineContext, &v89, &v87, &v88, 0, v20, v74);
  v31 = sub_1B17C2E50((uint64_t)a3);
  v32 = v87;
  if (!v31 || !v87)
  {
    if ((v31 & 1) != 0)
    {
      v33 = 0;
      v34 = 1;
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if ((sub_1B1956DE4((uint64_t)v87) & 1) == 0)
  {
LABEL_14:
    if (v11)
    {
      sub_1B186C4A8(v11, v24, v25, v26, v27, v28, v29, v30);
      if (v35 <= 0.0)
        return;
    }
    if (!v87)
    {
      v82 = 0;
      v83 = v13;
      v34 = 0;
      goto LABEL_27;
    }
    v36 = sub_1B187813C(v89, v24, v25, v26, v27, v28, v29, v30);
    if (v36)
    {
      v33 = sub_1B1842568(v36, v24, v25, v26, v27, v28, v29, v30);
      v34 = 0;
    }
    else
    {
      v34 = 0;
      v33 = 0;
    }
    goto LABEL_21;
  }
  v33 = 0;
  v34 = 1;
LABEL_21:
  v32 = v87;
LABEL_22:
  LODWORD(v82) = v33;
  v83 = v13;
  if (!v32)
  {
    BYTE4(v82) = 0;
LABEL_27:
    v84 = 0;
    if (!a4)
      goto LABEL_29;
LABEL_28:
    v39 = sub_1B19AF264((uint64_t)a4, v24, v25, v26, v27, v28, v29, v30);
    if (v39)
      goto LABEL_30;
    goto LABEL_29;
  }
  BYTE4(v82) = sub_1B1956E40((uint64_t)v32);
  if (!v87)
    goto LABEL_27;
  v84 = sub_1B1956E58((uint64_t)v87);
  if (a4)
    goto LABEL_28;
LABEL_29:
  v39 = sub_1B17C2F14((uint64_t)a3);
  if (!v39)
  {
    v40 = 1;
    goto LABEL_32;
  }
LABEL_30:
  objc_msgSend_setRasterizerStates_(self, v37, v39, v38);
  v40 = 0;
LABEL_32:
  v41 = (char *)a3 + 76;
  var0_low = LOWORD(a3[1].var0);
  v43 = v34;
  v44 = (var0_low & 0x40) != 0 && self->_processingContext.passRequiresLighting;
  v45 = v88;
  v46 = v89;
  v47 = (var0_low >> 14) & 1;
  v48 = *(_QWORD *)&a3->var4;
  if ((v43 & 1) != 0 || BYTE1(self->_processingContext.passInstance[76].var0))
    goto LABEL_37;
  if ((_DWORD)v82 == 1)
  {
    v106[0] = v88;
    v106[1] = v89;
    v106[2] = v12;
    v106[3] = v11;
    v106[4] = v83;
    v106[5] = v21;
    v106[6] = v48;
    v106[7] = a4;
    v106[8] = v41;
    v107 = v43;
    v108 = BYTE4(v82);
    v109 = v84;
    v110 = v44;
    v111 = 1;
    v112 = (var0_low >> 11) & 7;
    v113 = 0;
    v81 = v112;
    LOBYTE(v82) = v43;
    v79 = v44;
    v77 = v41;
    objc_msgSend__executeDrawCommand_(self, v37, (uint64_t)v106, v38);
    v98[0] = v45;
    v98[1] = v46;
    v98[2] = v12;
    v98[3] = v11;
    v98[4] = v83;
    v98[5] = v21;
    v98[6] = v48;
    v98[7] = a4;
    v98[8] = v77;
    v99 = v82;
    v100 = BYTE4(v82);
    v101 = v84;
    v102 = v79;
    v103 = 0;
    v104 = v81;
    v105 = 0;
    objc_msgSend__executeDrawCommand_(self, v72, (uint64_t)v98, v73);
    return;
  }
  if ((_DWORD)v82 != 2)
  {
LABEL_37:
    v90[0] = v88;
    v90[1] = v89;
    v90[2] = v12;
    v90[3] = v11;
    v90[4] = v83;
    v90[5] = v21;
    v90[6] = v48;
    v90[7] = a4;
    v90[8] = v41;
    v91 = v43;
    v92 = BYTE4(v82);
    v93 = v84;
    v94 = v44;
    v95 = (var0_low & 0x4000) != 0;
    v96 = (var0_low >> 11) & 7;
    v97 = 0;
    objc_msgSend__executeDrawCommand_(self, v37, (uint64_t)v90, v38);
  }
  else
  {
    v80 = (var0_low >> 11) & 7;
    LOBYTE(v82) = v43;
    v78 = v44;
    v76 = v41;
    v75 = v40;
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v37, 1, v38);
    v122[0] = v45;
    v122[1] = v46;
    v122[2] = v12;
    v122[3] = v11;
    v122[4] = v83;
    v122[5] = v21;
    v122[6] = v48;
    v122[7] = a4;
    v122[8] = v76;
    v123 = v82;
    v124 = BYTE4(v82);
    v125 = v84;
    v126 = v78;
    v127 = v47;
    v128 = v80;
    v129 = 0;
    objc_msgSend__executeDrawCommand_(self, v49, (uint64_t)v122, v50);
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v51, 2, v52);
    v114[0] = v45;
    v114[1] = v46;
    v114[2] = v12;
    v114[3] = v11;
    v114[4] = v83;
    v114[5] = v21;
    v114[6] = v48;
    v114[7] = a4;
    v114[8] = v76;
    v115 = v82;
    v116 = BYTE4(v82);
    v117 = v84;
    v118 = v78;
    v119 = v47;
    v120 = v80;
    v121 = 0;
    objc_msgSend__executeDrawCommand_(self, v53, (uint64_t)v114, v54);
    if ((v75 & 1) == 0)
    {
      memset(v85, 0, sizeof(v85));
      v86 = 0;
      sub_1B181EE68(v39, v55, v56, v57, v58, v59, v60, (uint64_t)v85);
      renderEncoder = self->_renderEncoder;
      v69 = sub_1B189CFB8(v85[0], v62, v63, v64, v65, v66, v67, v68);
      objc_msgSend_setCullMode_(renderEncoder->var3, v70, v69, v71);
    }
  }
}

- (BOOL)showsAuthoringEnvironment
{
  return self->_showsAuthoringEnvironment;
}

- (void)setShowsAuthoringEnvironment:(BOOL)a3
{
  self->_showsAuthoringEnvironment = a3;
}

- (BOOL)forceAsyncShaderCompilation
{
  return (*((unsigned __int8 *)self + 152) >> 4) & 1;
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xEF | v3;
}

- (BOOL)collectsCompilationErrors
{
  return self->_compilationIssues.collectEnabled;
}

- (void)setCollectsCompilationErrors:(BOOL)a3
{
  uint64_t v3;
  NSMutableDictionary *errors;

  self->_compilationIssues.collectEnabled = a3;
  errors = self->_compilationIssues.errors;
  if (a3)
  {
    if (!errors)
    {
      errors = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_compilationIssues.errors = errors;
    }
    objc_msgSend_removeAllObjects(errors, a2, a3, v3);
  }
  else
  {

    self->_compilationIssues.errors = 0;
  }
}

- (NSMutableDictionary)compilationErrors
{
  return self->_compilationIssues.errors;
}

- (uint64_t)drawWireframeOverlayForElements:(unint64_t)a3 range:(uint64_t)a4 store:(int)a5 passInstance:(uint64_t)a6
{
  unsigned int v9;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  double v26;
  double v27;
  unsigned int *v28;
  unint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const void *v36;
  const void *v37;
  VFXMetalWireframeResource *v38;
  uint64_t material;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  uint64_t v51;
  void *program;
  _QWORD v54[9];
  int v55;
  char v56;
  char v57;
  __int16 v58;
  uint64_t v59;

  v9 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend_pushDebugGroup_(a1, a2, (uint64_t)CFSTR("VFX - Draw wireframe"), a4);
  LODWORD(v12) = -1138501878;
  LODWORD(v13) = -1194215657;
  LODWORD(v14) = -10.0;
  objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(a1[31] + 16), v15, v16, v17, v14, v12, v13);
  if (v9 < v9 + a5)
  {
    v28 = (unsigned int *)(a3 + 4 * v9);
    *(_QWORD *)&v25 = 257;
    v50 = v25;
    v29 = v9 + a5 - (unint64_t)v9;
    v51 = a6;
    do
    {
      v30 = *v28++;
      a3 = a3 & 0xFFFFFFFF00000000 | v30;
      v31 = sub_1B19CFAFC(a6, a3, v19, v20, v21, v22, v23, v24);
      v32 = sub_1B17C2DEC(v31);
      v33 = sub_1B17C2E5C(v31);
      v34 = sub_1B17C2EA0(v31);
      if (v34)
      {
        v35 = v34;
        v36 = sub_1B17C2EC0(v31);
        if (v36)
        {
          v37 = v36;
          v38 = sub_1B18FBCE8(a1[14], v31, a1[18], a7, a1[72], v22, v23, v24);
          if (v38)
          {
            material = (uint64_t)v38->material;
            program = v38->program;
            v40 = sub_1B17EE4F8(material);
            objc_msgSend_setRasterizerStates_(a1, v41, v40, v42);
            v43 = (*(unsigned __int16 *)(v31 + 80) >> 11) & 7;
            v54[0] = program;
            v54[1] = material;
            a6 = v51;
            v54[2] = v33;
            v54[3] = v32;
            v54[4] = v35;
            v54[5] = v37;
            memset(&v54[6], 0, 24);
            v55 = v50;
            v56 = 0;
            v57 = v43;
            v58 = 0;
            objc_msgSend__executeDrawCommand_(a1, v44, (uint64_t)v54, v45);
          }
        }
      }
      --v29;
    }
    while (v29);
  }
  LODWORD(v25) = 0;
  LODWORD(v26) = 0;
  LODWORD(v27) = 0;
  objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(a1[31] + 16), v18, v19, v20, *(double *)&v25, v26, v27, v50);
  return objc_msgSend_popDebugGroup(a1, v46, v47, v48);
}

+ (void)registerBindings
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  unsigned __int8 v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  int v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[5];
  char v132;
  char v133;

  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, a2, (uint64_t)CFSTR("modelTransform"), (uint64_t)&unk_1E63D0CF0);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v2, (uint64_t)CFSTR("inverseModelTransform"), (uint64_t)&unk_1E63D73F0);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v3, (uint64_t)CFSTR("modelViewTransform"), (uint64_t)&unk_1E63D7410);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v4, (uint64_t)CFSTR("inverseModelViewTransform"), (uint64_t)&unk_1E63D7430);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v5, (uint64_t)CFSTR("normalTransform"), (uint64_t)&unk_1E63D7450);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v6, (uint64_t)CFSTR("modelViewProjectionTransform"), (uint64_t)&unk_1E63D7470);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v7, (uint64_t)CFSTR("lastFrameModelTransform"), (uint64_t)&unk_1E63D1850);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v8, (uint64_t)CFSTR("motionBlurIntensity"), (uint64_t)&unk_1E63D7490);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v9, (uint64_t)CFSTR("inverseModelViewProjectionTransform"), (uint64_t)&unk_1E63D74B0);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v10, (uint64_t)CFSTR("boundingBox"), (uint64_t)&unk_1E63D74D0);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v11, (uint64_t)CFSTR("worldBoundingBox"), (uint64_t)&unk_1E63D74F0);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v12, (uint64_t)CFSTR("nodeOpacity"), (uint64_t)&unk_1E63D7510);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v13, (uint64_t)CFSTR("shCoefficients"), (uint64_t)&unk_1E63D7530);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v14, (uint64_t)CFSTR("categoryBitmask"), (uint64_t)&unk_1E63D7550);
  objc_msgSend_registerShadableArgumentBindingBlockForBuffers_textures_samplers_(VFXMTLShaderBindingsGenerator, v15, (uint64_t)&unk_1E63D7590, (uint64_t)&unk_1E63D75B0, &unk_1E63D75D0);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v16, (uint64_t)CFSTR("vfx_lights"), 0, 1, &unk_1E63D75F0);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v17, (uint64_t)CFSTR("vfx_lights_count"), 0, 1, &unk_1E63D7610);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v18, (uint64_t)CFSTR("vfx_commonprofile"), 2, 1, &unk_1E63D7590);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v19, (uint64_t)CFSTR("vfx_pointSize"), 2, &unk_1E63D1910);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v20, (uint64_t)CFSTR("u_clusterTexture"), 0, &unk_1E63D7630);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v21, (uint64_t)CFSTR("u_lightIndicesTexture"), 0, &unk_1E63D7650);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v22, (uint64_t)CFSTR("u_areaLightBakedDataTexture"), 0, &unk_1E63D7670);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v23, (uint64_t)CFSTR("u_shadowKernel"), 0, &unk_1E63D7690);
  v133 = 0;
  v24 = sub_1B18545A0();
  v32 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    v33 = v24;
    v34 = 0;
    do
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = sub_1B181A680((char)v34, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
      v39 = objc_msgSend_stringWithFormat_(v35, v37, (uint64_t)CFSTR("u_%@Texture"), v38, v36);
      v131[0] = v32;
      v131[1] = 3221225472;
      v131[2] = sub_1B1858AA8;
      v131[3] = &unk_1E63D76F8;
      v131[4] = &unk_1E63D76D0;
      v132 = v34;
      objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v40, v39, 2, v131);
      ++v34;
    }
    while (v34 != v33);
  }
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v25, (uint64_t)CFSTR("u_shadowTexture"), 1, &unk_1E63D7718);
  for (i = 0; i != 8; ++i)
  {
    v130[0] = v32;
    v130[1] = 3221225472;
    v130[2] = sub_1B1858B44;
    v130[3] = &unk_1E63D7738;
    v130[4] = i;
    v44 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v41, (uint64_t)CFSTR("u_goboTexture%d"), v42, i);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v45, v44, 1, v130);
    v48 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v46, (uint64_t)CFSTR("u_iesTexture%d"), v47, i);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v49, v48, 1, v130);
    v52 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v50, (uint64_t)CFSTR("u_iesCubeTexture%d"), v51, i);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v53, v52, 1, v130);
    v56 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v54, (uint64_t)CFSTR("color%d"), v55, i);
    v129[0] = v32;
    v129[1] = 3221225472;
    v129[2] = sub_1B1858CDC;
    v129[3] = &unk_1E63D7758;
    v129[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v57, v56, (uint64_t)v129);
    v60 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v58, (uint64_t)CFSTR("position%d"), v59, i);
    v128[0] = v32;
    v128[1] = 3221225472;
    v128[2] = sub_1B1858CF4;
    v128[3] = &unk_1E63D7758;
    v128[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v61, v60, (uint64_t)v128);
    v64 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v62, (uint64_t)CFSTR("direction%d"), v63, i);
    v127[0] = v32;
    v127[1] = 3221225472;
    v127[2] = sub_1B1858D4C;
    v127[3] = &unk_1E63D7758;
    v127[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v65, v64, (uint64_t)v127);
    v68 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v66, (uint64_t)CFSTR("right%d"), v67, i);
    v126[0] = v32;
    v126[1] = 3221225472;
    v126[2] = sub_1B1858DA8;
    v126[3] = &unk_1E63D7758;
    v126[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v69, v68, (uint64_t)v126);
    v72 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v70, (uint64_t)CFSTR("up%d"), v71, i);
    v125[0] = v32;
    v125[1] = 3221225472;
    v125[2] = sub_1B1858DC0;
    v125[3] = &unk_1E63D7758;
    v125[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v73, v72, (uint64_t)v125);
    v76 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v74, (uint64_t)CFSTR("iesMatrix%d"), v75, i);
    v124[0] = v32;
    v124[1] = 3221225472;
    v124[2] = sub_1B1858DD8;
    v124[3] = &unk_1E63D7758;
    v124[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v77, v76, (uint64_t)v124);
    v80 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v78, (uint64_t)CFSTR("attenuation%d"), v79, i);
    v123[0] = v32;
    v123[1] = 3221225472;
    v123[2] = sub_1B1858DF8;
    v123[3] = &unk_1E63D7758;
    v123[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v81, v80, (uint64_t)v123);
    v84 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v82, (uint64_t)CFSTR("spotAttenuation%d"), v83, i);
    v122[0] = v32;
    v122[1] = 3221225472;
    v122[2] = sub_1B1858E10;
    v122[3] = &unk_1E63D7758;
    v122[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v85, v84, (uint64_t)v122);
    v88 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v86, (uint64_t)CFSTR("shadowMatrix%d"), v87, i);
    v121[0] = v32;
    v121[1] = 3221225472;
    v121[2] = sub_1B1858E28;
    v121[3] = &unk_1E63D7758;
    v121[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v89, v88, (uint64_t)v121);
    v92 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v90, (uint64_t)CFSTR("shadowRadius%d"), v91, i);
    v120[0] = v32;
    v120[1] = 3221225472;
    v120[2] = sub_1B1858FDC;
    v120[3] = &unk_1E63D7758;
    v120[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v93, v92, (uint64_t)v120);
    v96 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v94, (uint64_t)CFSTR("shadowColor%d"), v95, i);
    v119[0] = v32;
    v119[1] = 3221225472;
    v119[2] = sub_1B1858FF4;
    v119[3] = &unk_1E63D7758;
    v119[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v97, v96, (uint64_t)v119);
    v100 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v98, (uint64_t)CFSTR("goboMatrix%d"), v99, i);
    v118[0] = v32;
    v118[1] = 3221225472;
    v118[2] = sub_1B185900C;
    v118[3] = &unk_1E63D7758;
    v118[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v101, v100, (uint64_t)v118);
    v104 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v102, (uint64_t)CFSTR("projectorColor%d"), v103, i);
    v117[0] = v32;
    v117[1] = 3221225472;
    v117[2] = sub_1B185902C;
    v117[3] = &unk_1E63D7758;
    v117[4] = i;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v105, v104, (uint64_t)v117);
    v108 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v106, (uint64_t)CFSTR("u_areaPolygonPositions%d"), v107, i);
    v116[0] = v32;
    v116[1] = 3221225472;
    v116[2] = sub_1B1859044;
    v116[3] = &unk_1E63D7738;
    v116[4] = i;
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v109, v108, 1, v116);
  }
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v41, (uint64_t)CFSTR("u_specularDFGDiffuseHammonTexture"), 0, &unk_1E63D19D0);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v110, (uint64_t)CFSTR("u_radianceTexture"), 0, &unk_1E63D7778);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v111, (uint64_t)CFSTR("u_irradianceTexture"), 0, &unk_1E63D7798);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v112, (uint64_t)CFSTR("u_reflectionProbeTexture"), 0, &unk_1E63D77B8);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v113, (uint64_t)CFSTR("u_ssaoTexture"), 0, &unk_1E63D77D8);
  objc_msgSend_registerUserBlockTrampoline_(VFXMTLShaderBindingsGenerator, v114, (uint64_t)&unk_1E63D7818, v115);
}

- (BOOL)mapVolatileMesh:(__CFXMesh *)a3 verticesCount:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  VFXMTLMesh *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  _QWORD v34[6];
  uint64_t v35;
  id newValue;
  uint64_t v37;

  v17 = sub_1B187680C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7);
  if ((v17 & 1) != 0)
  {
    v18 = sub_1B18FB1C0((uint64_t)self->_resourceManager, (uint64_t)a3, 1);
    if (!sub_1B1955D58((uint64_t)v18))
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Mesh should have volatile data to allocate"), v19, v20, v21, v22, v23, v24, (uint64_t)"metalMesh.volatileStride != 0");
    sub_1B1955D20((uint64_t)v18);
    v25 = sub_1B1955D58((uint64_t)v18) * a4;
    v35 = 0;
    newValue = 0;
    v37 = 0;
    sub_1B1868B34((uint64_t)self->_frameVolatileBufferPool, v25, &v35);
    sub_1B1955D7C((uint64_t)v18, v25);
    sub_1B1955D2C(v18, (char *)newValue);
    sub_1B1955D4C((uint64_t)v18, v37);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1B1859750;
    v34[3] = &unk_1E63D7860;
    v34[4] = a4;
    v34[5] = v35;
    sub_1B1873EE0((uint64_t)a3, 1, (uint64_t)v34, v26, v27, v28, v29, v30);
    objc_msgSend_addObject_(self->_volatileMeshes, v31, (uint64_t)v18, v32);
  }
  else
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can only map volatile mesh"), v11, v12, v13, v14, v15, v16, (uint64_t)"0");
  }
  return v17;
}

- (void)unmapVolatileMesh:(__CFXMesh *)a3 modifiedVerticesCount:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VFXMTLMesh *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if ((sub_1B187680C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7) & 1) != 0)
  {
    v17 = sub_1B18FB1C0((uint64_t)self->_resourceManager, (uint64_t)a3, 1);
    sub_1B1955D70((uint64_t)v17);
    if ((a4 & 0x8000000000000000) == 0)
      sub_1B1955D58((uint64_t)v17);
    v18 = sub_1B1955D20((uint64_t)v17);
    sub_1B1955D40((uint64_t)v17);
    if (!v18)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Mesh should be mapped"), v19, v20, v21, v22, v23, v24, (uint64_t)"sub.buffer != nil");
    sub_1B1873EE0((uint64_t)a3, 1, (uint64_t)&unk_1E63D78A0, v20, v21, v22, v23, v24);
  }
  else
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can only map volatile mesh"), v11, v12, v13, v14, v15, v16, (uint64_t)"0");
  }
}

- (void)resetVolatileMeshes
{
  NSMutableArray *volatileMeshes;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  volatileMeshes = self->_volatileMeshes;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(volatileMeshes, a2, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v4)
  {
    v8 = v4;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(volatileMeshes);
        sub_1B1955D2C(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), 0);
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(volatileMeshes, v11, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v8);
  }
  objc_msgSend_removeAllObjects(self->_volatileMeshes, v5, v6, v7);
}

- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3
{
  uint64_t v3;
  VFXMTLBuffer *Object;
  VFXMTLBuffer *v7;
  VFXMTLBuffer *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  Object = (VFXMTLBuffer *)objc_msgSend_lastObject(self->_bufferPool, a2, a3, v3);
  if (Object)
  {
    v7 = Object;
    v8 = Object;
    objc_msgSend_removeLastObject(self->_bufferPool, v9, v10, v11);
  }
  else
  {
    v7 = objc_alloc_init(VFXMTLBuffer);
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  sub_1B1868B34((uint64_t)self->_frameVolatileBufferPool, a3, &v20);
  objc_msgSend_setBuffer_(v7, v12, v21, v13);
  objc_msgSend_setOffset_(v7, v14, v22, v15);
  if (!objc_msgSend_buffer(v7, v16, v17, v18))
  {

    return 0;
  }
  return v7;
}

- (void)_recycleMTLBufferToPool:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. MeshElement should be mapped"), 0, v3, v4, v5, v6, v7, (uint64_t)"mtlBuffer != nil");
  objc_msgSend_addObject_(self->_bufferPool, a2, (uint64_t)a3, v3);
  objc_msgSend_setUsedCount_(a3, v10, 0, v11);
  objc_msgSend_setBuffer_(a3, v12, 0, v13);
  objc_msgSend_setOffset_(a3, v14, 0, v15);
  objc_msgSend_setDataSource_(a3, v16, 0, v17);
}

- (__CFXMeshElement)createVolatileMeshElementOfType:(VFXMTLRenderContext *)self primitiveCount:(unsigned int)a2 bytesPerIndex:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFXMeshElement *Object;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  VFXMTLMeshElement *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v55;
  uint64_t v56;

  v5 = v4;
  v6 = v3;
  v7 = v2;
  if (objc_msgSend_count(self->_freeVolatileMeshElements, *(const char **)&a2, v2, v3))
  {
    Object = (__CFXMeshElement *)objc_msgSend_lastObject(self->_freeVolatileMeshElements, v9, v10, v11);
    objc_msgSend_addObject_(self->_usedVolatileMeshElements, v13, (uint64_t)Object, v14);
    objc_msgSend_removeLastObject(self->_freeVolatileMeshElements, v15, v16, v17);
    if (Object)
      goto LABEL_4;
    goto LABEL_3;
  }
  Object = (__CFXMeshElement *)sub_1B17A5050();
  objc_msgSend_addObject_(self->_usedVolatileMeshElements, v55, (uint64_t)Object, v56);
  CFRelease(Object);
  if (!Object)
LABEL_3:
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v18, v19, v20, v21, v22, v23, (uint64_t)"meshElement");
LABEL_4:
  sub_1B17A3B60((uint64_t)Object, v7, v18, v19, v20, v21, v22, v23);
  sub_1B17A4464((uint64_t)Object, v6, 0, v5);
  v24 = sub_1B18FAA70((uint64_t)self->_resourceManager, (uint64_t)Object);
  if (sub_1B1956188((uint64_t)v24))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Mesh should not be already mapped"), v25, v26, v27, v28, v29, v30, (uint64_t)"metalMeshElement.indexBuffer == nil");
  sub_1B1955F00(v24, (uint64_t)Object, v25, v26, v27, v28, v29, v30);
  v31 = sub_1B18FD780((uint64_t)v24);
  v34 = (char *)objc_msgSend__newMTLBufferFromPoolWithLength_(self, v32, v31 * v5, v33);
  sub_1B1955E70(v24, v34);

  v38 = (void *)objc_msgSend_buffer(v34, v35, v36, v37);
  v42 = objc_msgSend_contents(v38, v39, v40, v41);
  v46 = objc_msgSend_offset(v34, v43, v44, v45);
  v47 = sub_1B18FD768((uint64_t)v24);
  sub_1B17A50BC((uint64_t)Object, v42 + v46 + v47, v48, v49, v50, v51, v52, v53);
  return Object;
}

- (uint64_t)unmapVolatileMeshElement:(uint64_t)a3
{
  VFXMTLMeshElement *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = sub_1B18FAA70(*(_QWORD *)(a1 + 112), a3);
  v5 = (void *)sub_1B1956188((uint64_t)v4);
  objc_msgSend_buffer(v5, v6, v7, v8);
  v9 = (void *)sub_1B1956188((uint64_t)v4);
  objc_msgSend_offset(v9, v10, v11, v12);
  sub_1B17A5150(a3, v13, v14, v15, v16, v17, v18, v19);
  return sub_1B18FD780((uint64_t)v4);
}

- (void)resetVolatileMeshElements
{
  NSMutableArray *usedVolatileMeshElements;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  VFXMTLMeshElement *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  usedVolatileMeshElements = self->_usedVolatileMeshElements;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(usedVolatileMeshElements, a2, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(usedVolatileMeshElements);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v11 = sub_1B18FAA70((uint64_t)self->_resourceManager, v10);
        v12 = sub_1B1956188((uint64_t)v11);
        objc_msgSend__recycleMTLBufferToPool_(self, v13, v12, v14);
        sub_1B1955E70(v11, 0);
        sub_1B195617C((uint64_t)v11, 0);
        sub_1B17A50BC(v10, 0, v15, v16, v17, v18, v19, v20);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(usedVolatileMeshElements, v21, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v7);
  }
  objc_msgSend_addObjectsFromArray_(self->_freeVolatileMeshElements, v5, (uint64_t)self->_usedVolatileMeshElements, v6);
  objc_msgSend_removeAllObjects(self->_usedVolatileMeshElements, v22, v23, v24);
}

- (void)drawFullScreenQuadForPass:(__CFXFXPass *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXEngineContext *engineContext;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  _QWORD v33[9];
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  engineContext = self->_engineContext;
  if (!engineContext)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_engineContext");
    engineContext = self->_engineContext;
  }
  v11 = sub_1B1815878((uint64_t)engineContext);
  v33[0] = sub_1B19ACE28((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  v33[1] = sub_1B19ACF58((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = v11;
  v33[5] = sub_1B1874C3C(v11, 0, 1, v26, v27, v28, v29, v30);
  v33[6] = 0;
  v33[7] = a3;
  v33[8] = 0;
  v34 = 257;
  v35 = 0;
  v36 = 0;
  objc_msgSend__executeDrawCommand_(self, v31, (uint64_t)v33, v32);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  VFXMTLRenderCommandEncoder *renderEncoder;

  renderEncoder = self->_renderEncoder;
  if (renderEncoder)
    return (MTLRenderCommandEncoder *)renderEncoder->var3;
  else
    return 0;
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  uint64_t v2;

  v2 = sub_1B1813E3C((uint64_t)self->_engineContext);
  return (MTLRenderPassDescriptor *)sub_1B18F0604(v2);
}

- (MTLCommandBuffer)currentCommandBuffer
{
  return self->_currentCommandBuffer;
}

- (void)_drawPBRTextures
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  VFXMTLResourceManager *resourceManager;
  const char *v53;
  uint64_t v54;
  VFXMTLResourceManager *v55;
  const char *v56;
  uint64_t v57;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  __n128 v86;
  unint64_t v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  VFXMTLRenderCommandEncoder *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  VFXMTLRenderCommandEncoder *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  _BOOL4 IsCube;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  VFXMTLRenderCommandEncoder *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  __int128 v132;
  uint64_t v133;
  float v134;
  id v135;
  uint64_t v136;
  __int128 v137;
  VFXMTLRenderCommandEncoder *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  float v146;
  id v147;
  uint64_t v148;
  __int128 v149;
  VFXMTLRenderCommandEncoder *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  VFXMTLRenderCommandEncoder *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  VFXMTLRenderCommandEncoder *v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  VFXMTLRenderCommandEncoder *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  VFXMTLRenderCommandEncoder *v188;
  const char *v189;
  const char *v190;
  unint64_t v191;
  uint64_t v192;
  __int128 v193;
  float v194;
  float v195;
  __int128 v196;
  _BYTE v197[328];
  _BYTE __dst[328];
  _OWORD __src[21];

  v5 = (void *)objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  v16 = (void *)objc_msgSend_texture(v12, v13, v14, v15);
  v20 = objc_msgSend_pixelFormat(v16, v17, v18, v19);
  v24 = (void *)objc_msgSend_currentRenderPassDescriptor(self, v21, v22, v23);
  v28 = (void *)objc_msgSend_colorAttachments(v24, v25, v26, v27);
  v31 = (void *)objc_msgSend_objectAtIndexedSubscript_(v28, v29, 0, v30);
  v35 = (void *)objc_msgSend_texture(v31, v32, v33, v34);
  v39 = objc_msgSend_sampleCount(v35, v36, v37, v38);
  if (v20)
  {
    if (self->_debug.pixelFormat != v20 || self->_debug.sampleCount != v39)
    {
      self->_debug.pixelFormat = v20;
      self->_debug.sampleCount = v39;
      v42 = (void *)sub_1B18FD768((uint64_t)self->_resourceManager);
      memset(&__src[19], 0, 24);
      memset(&__src[13], 0, 88);
      memset(&__src[7], 0, 88);
      memset(__src, 0, 104);
      *((_QWORD *)&__src[6] + 1) = objc_msgSend_frameworkLibrary(v42, v43, v44, v45);
      *((_QWORD *)&__src[12] + 1) = sub_1B18A7BA0();
      *((_QWORD *)&__src[18] + 1) = CFSTR("quad_vertex");
      *(_QWORD *)&__src[19] = CFSTR("quad_display_cube_equirectangular");
      v49 = (void *)objc_msgSend_currentRenderPassDescriptor(self, v46, v47, v48);
      sub_1B1954D58((uint64_t)&__src[7], v49, v50, v51);

      resourceManager = self->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      self->_debug.displayCubemapPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v53, (uint64_t)__dst, v54);
      *((_QWORD *)&__src[12] + 1) = sub_1B18A7C20();
      *(_QWORD *)&__src[19] = CFSTR("quad_display_texture2D");

      v55 = self->_resourceManager;
      memcpy(v197, __src, sizeof(v197));
      self->_debug.displayTexture2DPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(v55, v56, (uint64_t)v197, v57);
    }
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v40, 0, v41);
    renderEncoder = self->_renderEncoder;
    v59 = sub_1B18FD640((uint64_t)self->_resourceManager);
    objc_msgSend_setDepthStencilState_(renderEncoder->var3, v60, v59, v61);
    v72 = sub_1B1813884((uint64_t)self->_engineContext, v62, v63, v64, v65, v66, v67, v68);
    v73 = *(void **)&self->_anon_4100[704];
    if (v73)
    {
      v74 = objc_msgSend_arrayLength(v73, v69, v70, v71);
      v78 = objc_msgSend_mipmapLevelCount(*(void **)&self->_anon_4100[704], v75, v76, v77);
      v82 = objc_msgSend_pixelFormat(*(void **)&self->_anon_4100[704], v79, v80, v81);
      v86 = sub_1B1815A98((__n128 *)self->_engineContext);
      v87 = v86.n128_u64[1];
      v88 = v86.n128_f32[2] / v86.n128_f32[3];
      v89 = 1.0 / (float)(unint64_t)v74;
      v90 = 4.0 / v86.n128_f32[3];
      v91 = (float)(v89 + (float)((float)(4.0 / v86.n128_f32[3]) * -2.0)) * 2.5;
      v195 = v89 + (float)((float)(4.0 / v86.n128_f32[3]) * -2.0);
      v191 = v86.n128_u64[0];
      if ((float)(v86.n128_f32[2] / v86.n128_f32[3]) <= 1.0)
        v92 = v88 * v91;
      else
        v92 = v91 / v88;
      v194 = v92;
      v122 = objc_msgSend_textureType(*(void **)&self->_anon_4100[704], v83, v84, v85, v191);
      IsCube = VFXMTLTextureTypeIsCube(v122);
      v127 = self->_renderEncoder;
      if (IsCube)
      {
        v128 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v124, v125, v126);
        objc_msgSend_setRenderPipelineState_(v127->var3, v129, v128, v130);
        if (v74)
        {
          v133 = 0;
          v134 = (float)-*((float *)&v192 + 1) / *((float *)&v87 + 1);
          *(float *)&v132 = *(float *)&v192 / *(float *)&v87;
          v193 = v132;
          do
          {
            v135 = (id)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(*(void **)&self->_anon_4100[704], v131, v82, 5, 0, v78, v133, 6, v193);
            sub_1B179AEE4((uint64_t)self->_renderEncoder, v135, 0, v136);
            LODWORD(v137) = v193;
            *((float *)&v137 + 1) = v90 + v134;
            *((_QWORD *)&v137 + 1) = __PAIR64__(LODWORD(v195), LODWORD(v194));
            v196 = v137;
            v138 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B1868D14((uint64_t)v138->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v138->var3, v139, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v140, 4, 0, 4);
            v134 = v89 + v134;
            v133 += 6;
            --v74;
          }
          while (v74);
        }
      }
      else
      {
        v141 = objc_msgSend_state(self->_debug.displayTexture2DPipeline, v124, v125, v126);
        objc_msgSend_setRenderPipelineState_(v127->var3, v142, v141, v143);
        if (v74)
        {
          v145 = 0;
          v146 = 0.0;
          do
          {
            v147 = (id)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(*(void **)&self->_anon_4100[704], v144, v82, 2, 0, v78, v145, 1);
            sub_1B179AEE4((uint64_t)self->_renderEncoder, v147, 0, v148);
            LODWORD(v149) = 0;
            *((float *)&v149 + 1) = v90 + v146;
            *((_QWORD *)&v149 + 1) = __PAIR64__(LODWORD(v195), LODWORD(v194));
            v196 = v149;
            v150 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B1868D14((uint64_t)v150->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v150->var3, v151, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v152, 4, 0, 4);
            ++v145;
            v146 = v89 + v146;
          }
          while (v74 != v145);
        }
      }
    }
    else
    {
      v93 = sub_1B187B0F0(v72, 0);
      if (v93)
      {
        v101 = v93;
        if (sub_1B1841A40(v93, v94, v95, v96, v97, v98, v99, v100)
          || sub_1B1842E64(v101, (uint64_t)v102, v103, v104, v105, v106, v107, v108))
        {
          v109 = objc_msgSend_radianceTextureForMaterialProperty_(self, v102, v101, v104);
          if (v109)
          {
            v113 = (void *)v109;
            v114 = self->_renderEncoder;
            v115 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v110, v111, v112);
            objc_msgSend_setRenderPipelineState_(v114->var3, v116, v115, v117);
            sub_1B179AEE4((uint64_t)self->_renderEncoder, v113, 0, v118);
            v196 = xmmword_1B2246C30;
            v119 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B1868D14((uint64_t)v119->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v119->var3, v120, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v121, 4, 0, 4);
          }
        }
      }
    }
    v153 = sub_1B187B0F0(v72, 0);
    if (v153)
    {
      v161 = v153;
      if (sub_1B1841A40(v153, (uint64_t)v154, v155, v156, v157, v158, v159, v160)
        || sub_1B1842E64(v161, (uint64_t)v154, v162, v156, v163, v164, v165, v166))
      {
        v167 = objc_msgSend_irradianceTextureForMaterialProperty_(self, v154, v161, v156);
        if (v167)
        {
          v169 = (void *)v167;
          v170 = self->_renderEncoder;
          v171 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v154, v168, v156);
          objc_msgSend_setRenderPipelineState_(v170->var3, v172, v171, v173);
          sub_1B179AEE4((uint64_t)self->_renderEncoder, v169, 0, v174);
          v196 = xmmword_1B2246C40;
          v175 = self->_renderEncoder;
          memset(__src, 0, 24);
          sub_1B1868D14((uint64_t)v175->var4, &v196, 0x10uLL, (void **)__src);
          objc_msgSend_setVertexBuffer_offset_atIndex_(v175->var3, v176, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
          objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v177, 4, 0, 4);
        }
      }
    }
    v178 = objc_msgSend_specularDFGDiffuseHammonTextureWithRenderContext_(self->_resourceManager, v154, (uint64_t)self, v156);
    if (v178)
    {
      v182 = (void *)v178;
      v183 = self->_renderEncoder;
      v184 = objc_msgSend_state(self->_debug.displayTexture2DPipeline, v179, v180, v181);
      objc_msgSend_setRenderPipelineState_(v183->var3, v185, v184, v186);
      sub_1B179AEE4((uint64_t)self->_renderEncoder, v182, 0, v187);
      v196 = xmmword_1B2246C50;
      v188 = self->_renderEncoder;
      memset(__src, 0, 24);
      sub_1B1868D14((uint64_t)v188->var4, &v196, 0x10uLL, (void **)__src);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v188->var3, v189, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v190, 4, 0, 4);
    }
  }
}

- (void)_drawShadowMaps
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  VFXMTLResourceManager *resourceManager;
  const char *v39;
  uint64_t v40;
  VFXMTLResourceManager *v41;
  const char *v42;
  uint64_t v43;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  VFXMTLRenderCommandEncoder *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  VFXMTLRenderCommandEncoder *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  VFXMTLRenderCommandEncoder *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  uint64_t v95;
  __int128 v96;
  VFXMTLRenderCommandEncoder *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  float v103;
  __int128 v104;
  _BYTE v105[328];
  _BYTE __dst[328];
  _OWORD __src[21];

  v5 = (void *)objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  v16 = (void *)objc_msgSend_texture(v12, v13, v14, v15);
  if (v16)
  {
    v20 = v16;
    v21 = objc_msgSend_pixelFormat(v16, v17, v18, v19);
    v25 = objc_msgSend_sampleCount(v20, v22, v23, v24);
    if (self->_debug.pixelFormat != v21 || self->_debug.sampleCount != v25)
    {
      self->_debug.pixelFormat = v21;
      self->_debug.sampleCount = v25;
      v28 = (void *)sub_1B18FD768((uint64_t)self->_resourceManager);
      *(_QWORD *)&__src[20] = 0;
      *((_QWORD *)&__src[19] + 1) = 0;
      memset(&__src[7], 0, 184);
      memset(__src, 0, 104);
      *((_QWORD *)&__src[6] + 1) = objc_msgSend_frameworkLibrary(v28, v29, v30, v31);
      *((_QWORD *)&__src[18] + 1) = CFSTR("quad_vertex");
      *(_QWORD *)&__src[19] = CFSTR("quad_display_depth2D");
      v35 = (void *)objc_msgSend_currentRenderPassDescriptor(self, v32, v33, v34);
      sub_1B1954D58((uint64_t)&__src[7], v35, v36, v37);

      resourceManager = self->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      self->_debug.displayDepth2DPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v39, (uint64_t)__dst, v40);
      *(_QWORD *)&__src[19] = CFSTR("quad_display_depth_cube");

      v41 = self->_resourceManager;
      memcpy(v105, __src, sizeof(v105));
      self->_debug.displayDepthCubePipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(v41, v42, (uint64_t)v105, v43);
    }
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v26, 0, v27);
    renderEncoder = self->_renderEncoder;
    v45 = sub_1B18FD640((uint64_t)self->_resourceManager);
    objc_msgSend_setDepthStencilState_(renderEncoder->var3, v46, v45, v47);
    v51 = (float)(unint64_t)objc_msgSend_height(v20, v48, v49, v50);
    v103 = (float)(v51 / (float)(unint64_t)objc_msgSend_width(v20, v52, v53, v54)) * 0.125;
    v55 = *(void **)&self->_anon_4100[480];
    if (objc_msgSend_textureType(v55, v56, v57, v58) == 5)
    {
      v62 = self->_renderEncoder;
      v63 = objc_msgSend_state(self->_debug.displayDepthCubePipeline, v59, v60, v61);
LABEL_9:
      objc_msgSend_setRenderPipelineState_(v62->var3, v64, v63, v65);
      sub_1B179AEE4((uint64_t)self->_renderEncoder, v55, 0, v69);
      *(_QWORD *)&v70 = 0x3F5D70A43C23D70ALL;
      *((_QWORD *)&v70 + 1) = __PAIR64__(0.125, LODWORD(v103));
      v104 = v70;
      v71 = self->_renderEncoder;
      memset(__src, 0, 24);
      sub_1B1868D14((uint64_t)v71->var4, &v104, 0x10uLL, (void **)__src);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v71->var3, v72, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v73, 4, 0, 4);
      return;
    }
    if (objc_msgSend_textureType(v55, v59, v60, v61) == 2)
    {
      v62 = self->_renderEncoder;
      v63 = objc_msgSend_state(self->_debug.displayDepth2DPipeline, v66, v67, v68);
      goto LABEL_9;
    }
    if (objc_msgSend_textureType(v55, v66, v67, v68) == 3)
    {
      v77 = self->_renderEncoder;
      v78 = objc_msgSend_state(self->_debug.displayDepth2DPipeline, v74, v75, v76);
      objc_msgSend_setRenderPipelineState_(v77->var3, v79, v78, v80);
      if (objc_msgSend_arrayLength(v55, v81, v82, v83))
      {
        v87 = 0;
        do
        {
          v88 = objc_msgSend_pixelFormat(v55, v84, v85, v86);
          v92 = objc_msgSend_mipmapLevelCount(v55, v89, v90, v91);
          v94 = (void *)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v55, v93, v88, 2, 0, v92, v87, 1);
          sub_1B179AEE4((uint64_t)self->_renderEncoder, v94, 0, v95);
          *(float *)&v96 = (float)((float)v87 * (float)(v103 + 0.01)) + 0.01;
          DWORD1(v96) = 1063088292;
          *((_QWORD *)&v96 + 1) = __PAIR64__(0.125, LODWORD(v103));
          v104 = v96;
          v97 = self->_renderEncoder;
          memset(__src, 0, 24);
          sub_1B1868D14((uint64_t)v97->var4, &v104, 0x10uLL, (void **)__src);
          objc_msgSend_setVertexBuffer_offset_atIndex_(v97->var3, v98, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
          objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v99, 4, 0, 4);

          ++v87;
        }
        while (v87 < objc_msgSend_arrayLength(v55, v100, v101, v102));
      }
    }
  }
}

- (void)_drawFullScreenTexture:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  VFXMTLResourceManager *resourceManager;
  const char *v69;
  uint64_t v70;
  VFXMTLRenderCommandEncoder *renderEncoder;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  VFXMTLRenderCommandEncoder *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  _BYTE __dst[328];
  _QWORD __src[42];

  v6 = (void *)objc_msgSend_currentRenderPassDescriptor(self, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_depthAttachment(v6, v7, v8, v9);
  v14 = (void *)objc_msgSend_texture(v10, v11, v12, v13);
  v18 = objc_msgSend_pixelFormat(v14, v15, v16, v17);
  v22 = (void *)objc_msgSend_stencilAttachment(v6, v19, v20, v21);
  v26 = (void *)objc_msgSend_texture(v22, v23, v24, v25);
  v30 = objc_msgSend_pixelFormat(v26, v27, v28, v29);
  v34 = 0;
  v35 = 0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69
        * (v18 ^ ((0x9DDFEA08EB382D69 * (v30 ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (v30 ^ v18)))) ^ ((0x9DDFEA08EB382D69 * (v18 ^ ((0x9DDFEA08EB382D69 * (v30 ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (v30 ^ v18)))) >> 47));
  do
  {
    v36 = (void *)objc_msgSend_colorAttachments(v6, v31, v32, v33);
    v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(v36, v37, v34, v38);
    v43 = (void *)objc_msgSend_texture(v39, v40, v41, v42);
    v47 = objc_msgSend_pixelFormat(v43, v44, v45, v46);
    v51 = (void *)objc_msgSend_texture(v39, v48, v49, v50);
    v55 = objc_msgSend_sampleCount(v51, v52, v53, v54);
    v56 = 0x9DDFEA08EB382D69
        * (v35 ^ ((0x9DDFEA08EB382D69 * (v47 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v47 ^ v35)));
    v57 = 0x9DDFEA08EB382D69 * (v56 ^ (v56 >> 47));
    ++v34;
    v35 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v57 ^ ((0x9DDFEA08EB382D69 * (v57 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v57 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v57 ^ ((0x9DDFEA08EB382D69 * (v57 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v57 ^ v55)))) >> 47));
  }
  while (v34 != 8);
  if (self->_compositeRendering[0].hash != v35)
  {
    self->_compositeRendering[0].hash = v35;
    v58 = (void *)sub_1B18FD768((uint64_t)self->_resourceManager);
    memset(&__src[38], 0, 24);
    memset(&__src[14], 0, 184);
    memset(__src, 0, 104);
    __src[13] = objc_msgSend_frameworkLibrary(v58, v59, v60, v61);
    __src[37] = CFSTR("vfx_draw_fullscreen_triangle_vertex");
    __src[38] = CFSTR("vfx_draw_fullscreen_gamma_fragment");
    v65 = (void *)objc_msgSend_currentRenderPassDescriptor(self, v62, v63, v64);
    sub_1B1954D58((uint64_t)&__src[14], v65, v66, v67);

    resourceManager = self->_resourceManager;
    memcpy(__dst, __src, sizeof(__dst));
    self->_compositeRendering[0].pipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v69, (uint64_t)__dst, v70);
  }
  objc_msgSend_setCullMode_(self->_renderEncoder->var3, v31, 0, v33);
  renderEncoder = self->_renderEncoder;
  v72 = sub_1B18FD640((uint64_t)self->_resourceManager);
  objc_msgSend_setDepthStencilState_(renderEncoder->var3, v73, v72, v74);
  v75 = self->_renderEncoder;
  v79 = objc_msgSend_state(self->_compositeRendering[0].pipeline, v76, v77, v78);
  objc_msgSend_setRenderPipelineState_(v75->var3, v80, v79, v81);
  sub_1B179AEE4((uint64_t)self->_renderEncoder, a3, 0, v82);
  sub_1B179AF64((uint64_t)self->_renderEncoder, v83);
}

- (float)renderTime
{
  return *(float *)&self->_anon_250[444];
}

- (double)renderSize
{
  return *(double *)(a1 + 232);
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  VFXMTLRenderCommandEncoder *renderEncoder;
  int currentStreamBufferIndices;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  renderEncoder = self->_renderEncoder;
  currentStreamBufferIndices = (unsigned __int16)self->_currentStreamBufferIndices;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  sub_1B1868D14((uint64_t)renderEncoder->var4, a3, a4, &v9);
  v7 = v10;
  v8 = v11;
  if ((_BYTE)currentStreamBufferIndices != 0xFF)
    objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v6, v10, v11, (char)currentStreamBufferIndices);
  if ((~currentStreamBufferIndices & 0xFF00) != 0)
    objc_msgSend_setFragmentBuffer_offset_atIndex_(renderEncoder->var3, v6, v7, v8, (uint64_t)(__int16)currentStreamBufferIndices >> 8);
}

- (void)setCurrentPassHash:(unint64_t)a3
{
  self->_renderGraph.passHash = a3;
}

- (void)setCurrentPassMaterial:(__CFXMaterial *)a3
{
  self->_renderGraph.material = a3;
}

- (unint64_t)getCurrentPassHash
{
  return self->_renderGraph.passHash;
}

- (__CFXMaterial)getCurrentPassMaterial
{
  return self->_renderGraph.material;
}

- (unint64_t)cubeArrayTypeIfSupported
{
  if ((self->_features & 0x100) != 0)
    return 6;
  else
    return 3;
}

- (void)addCommandBufferScheduledHandler:(id)a3
{
  uint64_t v3;
  void *v5;
  char isKindOfClass;
  const char *v7;
  uint64_t v8;
  id commandBufferScheduledHandlers;
  id v10;
  const char *v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_commandBufferScheduledHandlers)
  {
    v12 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    commandBufferScheduledHandlers = self->_commandBufferScheduledHandlers;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_addObject_(self->_commandBufferScheduledHandlers, v7, (uint64_t)v12, v8);

    }
    else
    {
      v13[0] = self->_commandBufferScheduledHandlers;
      v13[1] = v12;
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_commandBufferScheduledHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);

    }
  }
  else
  {
    self->_commandBufferScheduledHandlers = v5;
  }
}

- (void)addCommandBufferCompletedHandler:(id)a3
{
  uint64_t v3;
  void *v5;
  char isKindOfClass;
  const char *v7;
  uint64_t v8;
  id commandBufferCompletedHandlers;
  id v10;
  const char *v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_commandBufferCompletedHandlers)
  {
    v12 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    commandBufferCompletedHandlers = self->_commandBufferCompletedHandlers;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_addObject_(self->_commandBufferCompletedHandlers, v7, (uint64_t)v12, v8);

    }
    else
    {
      v13[0] = self->_commandBufferCompletedHandlers;
      v13[1] = v12;
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_commandBufferCompletedHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);

    }
  }
  else
  {
    self->_commandBufferCompletedHandlers = v5;
  }
}

- (void)addDrawablePresentedHandler:(id)a3
{
  uint64_t v3;
  void *v5;
  char isKindOfClass;
  const char *v7;
  uint64_t v8;
  id drawablePresentedHandlers;
  id v10;
  const char *v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_drawablePresentedHandlers)
  {
    v12 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    drawablePresentedHandlers = self->_drawablePresentedHandlers;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_addObject_(self->_drawablePresentedHandlers, v7, (uint64_t)v12, v8);

    }
    else
    {
      v13[0] = self->_drawablePresentedHandlers;
      v13[1] = v12;
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_drawablePresentedHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);

    }
  }
  else
  {
    self->_drawablePresentedHandlers = v5;
  }
}

- (void)_allowGPUBackgroundExecution
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  MTLCommandQueue *ownedCommandQueue;
  const char *v9;
  uint64_t v10;
  MTLCommandQueue *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  if (!self->_clientCommandBuffer && !objc_msgSend_clientCommandQueue(self, a2, v2, v3))
  {
    ownedCommandQueue = self->_ownedCommandQueue;
    if (ownedCommandQueue)
    {
      if (objc_msgSend_getBackgroundGPUPriority(self->_ownedCommandQueue, v5, v6, v7) != 3)
        return;
      v11 = ownedCommandQueue;
    }
    else
    {
      v12 = (void *)sub_1B18FD780((uint64_t)self->_resourceManager);
      if (objc_msgSend_getBackgroundGPUPriority(v12, v13, v14, v15) != 3)
        return;
      v11 = (MTLCommandQueue *)v12;
    }
    objc_msgSend_setBackgroundGPUPriority_(v11, v9, 2, v10);
  }
}

- (void)_VFXWorldRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(id)a3 commandBuffer:(id)a4 renderPassDescriptor:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  VFXMTLRenderCommandEncoder *renderEncoder;
  MTLRenderPassDescriptor *currentRenderPassDescriptor;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[16];
  RGCachedRenderCommandEncoder *v36;

  v12 = sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  v13 = sub_1B187B0A0(v12, 0);
  if (v13)
  {
    v19 = v13;
    renderEncoder = self->_renderEncoder;
    if (renderEncoder->var3 == a3)
    {
      sub_1B1813AE4((uint64_t)self->_engineContext, v13, 0, v14, v15, v16, v17, v18);
    }
    else
    {
      currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
      v36 = objc_alloc_init(RGCachedRenderCommandEncoder);
      objc_msgSend_setDeferredBindingEnabled_(v36, v22, 1, v23);
      self->_renderEncoder = (VFXMTLRenderCommandEncoder *)v35;
      self->_currentRenderPassDescriptor = (MTLRenderPassDescriptor *)a5;
      sub_1B185B070((uint64_t)v35, (const char *)a4, (uint64_t)a3, (uint64_t)self->_frameConstantBufferPool, v24, v25, v26, v27);
      objc_msgSend_setFrontFacingWinding_(self->_renderEncoder->var3, v28, !self->_renderEncoder->var5, v29);
      sub_1B1813AE4((uint64_t)self->_engineContext, v19, 0, v30, v31, v32, v33, v34);
      self->_renderEncoder = renderEncoder;
      self->_currentRenderPassDescriptor = currentRenderPassDescriptor;

    }
  }
}

- (CFXVFXRenderTargetInfo)renderTargetInfo
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v31;
  unsigned int v32;

  v5 = objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  objc_msgSend_setDescriptor_(self->_renderTargetInfo, v6, v5, v7);
  objc_msgSend_renderSize(self, v8, v9, v10);
  v32 = v11;
  objc_msgSend_renderSize(self, v12, v13, v14);
  v31 = v15;
  objc_msgSend_renderSize(self, v16, v17, v18);
  objc_msgSend_renderSize(self, v19, v20, v21);
  __asm { FMOV            V0.2S, #1.0 }
  objc_msgSend_set_renderTargetSize_(self->_renderTargetInfo, v27, v28, v29, COERCE_DOUBLE(__PAIR64__(v31, v32)));
  return self->_renderTargetInfo;
}

- (MTLRenderPassDescriptor)clientRenderPassDescriptor
{
  return self->_clientRenderPassDescriptor;
}

- (void)setClientRenderPassDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 18568);
}

- (MTLRenderCommandEncoder)clientRenderCommandEncoder
{
  return self->_clientRenderCommandEncoder;
}

- (void)setClientRenderCommandEncoder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 18576);
}

- (MTLCommandBuffer)clientCommandBuffer
{
  return self->_clientCommandBuffer;
}

- (void)setClientCommandBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 18584);
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(unint64_t)a3
{
  self->_debugOptions = a3;
}

- (VFXMTLResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void)frameTexturePool
{
  return self->_frameTexturePool;
}

- (BOOL)shouldPresentAfterMinimumDuration
{
  return self->_shouldPresentAfterMinimumDuration;
}

- (void)setShouldPresentAfterMinimumDuration:(BOOL)a3
{
  self->_shouldPresentAfterMinimumDuration = a3;
}

- (void)renderEncoder
{
  return self->_renderEncoder;
}

- (MTLCommandQueue)clientCommandQueue
{
  return self->_clientCommandQueue;
}

- (void)setClientCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 18600);
}

- (VFXMTLRenderContextResourceManagerMonitor)resourceManagerMonitor
{
  return (VFXMTLRenderContextResourceManagerMonitor *)objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)setResourceManagerMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_resourceManagerMonitor, a3);
}

- (VFXMTLRenderContextCommandBufferStatusMonitor)commandBufferStatusMonitor
{
  return (VFXMTLRenderContextCommandBufferStatusMonitor *)objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)setCommandBufferStatusMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_commandBufferStatusMonitor, a3);
}

- (BOOL)canRecycleParticleBuffers
{
  return self->_canRecycleParticleBuffers;
}

- (void)setCanRecycleParticleBuffers:(BOOL)a3
{
  self->_canRecycleParticleBuffers = a3;
}

- (BOOL)requireLoadFinalTexture
{
  return self->_requireLoadFinalTexture;
}

- (void)setRequireLoadFinalTexture:(BOOL)a3
{
  self->_requireLoadFinalTexture = a3;
}

- (BOOL)simulateCommandBufferFailure
{
  return self->_simulateCommandBufferFailure;
}

- (void)setSimulateCommandBufferFailure:(BOOL)a3
{
  self->_simulateCommandBufferFailure = a3;
}

- (float)superSamplingFactor
{
  return self->_superSamplingFactor;
}

- (void)setSuperSamplingFactor:(float)a3
{
  self->_superSamplingFactor = a3;
}

- (NSString)generatedTexturePath
{
  return self->_generatedTexturePath;
}

- (void)setGeneratedTexturePath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 18608);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
  sub_1B17D067C((id *)&self->_anon_4100[144]);
  sub_1B185B888((uint64_t)&self->_lighting);

}

- (id).cxx_construct
{
  uint64_t v3;
  _OWORD *v4;

  self->_pendingGPUFrameCount.__a_.__a_value = 0;
  self->_resourceBlitEncoder._encoder = 0;
  self->_resourceBlitEncoder._commandBuffer = 0;
  self->_resourceComputeEncoder._encoder = objc_alloc_init(RGCachedComputeCommandEncoder);
  self->_resourceComputeEncoder._bufferPool = 0;
  v3 = -12544;
  do
  {
    v4 = (_OWORD *)((char *)self + v3);
    v4[867] = 0uLL;
    v4[866] = 0uLL;
    v4[865] = 0uLL;
    v4[864] = 0uLL;
    v4[821] = 0uLL;
    v4[822] = 0uLL;
    v4[823] = 0uLL;
    v4[824] = 0uLL;
    v4[825] = 0uLL;
    v4[826] = 0uLL;
    v4[827] = 0uLL;
    v4[828] = 0uLL;
    v4[829] = 0uLL;
    v4[830] = 0uLL;
    v4[831] = 0uLL;
    v4[832] = 0uLL;
    v4[833] = 0uLL;
    v4[834] = 0uLL;
    v4[835] = 0uLL;
    v4[836] = 0uLL;
    v4[837] = 0uLL;
    v4[838] = 0uLL;
    v4[839] = 0uLL;
    v4[840] = 0uLL;
    v4[841] = 0uLL;
    v4[842] = 0uLL;
    v4[843] = 0uLL;
    v4[844] = 0uLL;
    v4[861] = 0uLL;
    v4[860] = 0uLL;
    v4[859] = 0uLL;
    v4[858] = 0uLL;
    v4[857] = 0uLL;
    v4[856] = 0uLL;
    v4[855] = 0uLL;
    v4[854] = 0uLL;
    v4[853] = 0uLL;
    v4[852] = 0uLL;
    v4[851] = 0uLL;
    v4[850] = 0uLL;
    v3 += 784;
  }
  while (v3);
  bzero(&self->_nodeUniforms, 0xCC0uLL);
  *(_OWORD *)&self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__bucket_list_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__p3_.__value_ = 1.0;
  sub_1B17D05DC((uint64_t)&self->_anon_4100[144]);
  return self;
}

- (id)texture:(int)a3 :(id)a4
{
  const CFX::RG::Resource *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("shadowMap"), (uint64_t)a4)
    && (v5 = (const CFX::RG::Resource *)sub_1B179859C((uint64_t)self->_processingContext.lightingSystem)) != 0)
  {
    return sub_1B1815AE8((uint64_t)self->_engineContext, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    return 0;
  }
}

- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v7 = *(_QWORD *)&a3;
  v9 = objc_msgSend_engineContext(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6);
  v10 = sub_1B1813E3C(v9);
  if (v10)
  {
    v13 = v10;
    if (objc_msgSend_isEqualToString_(a4, v11, (uint64_t)CFSTR("passConstants"), v12))
    {
      v17 = objc_msgSend_resourceManager(self, v14, v15, v16);
      v18 = (void *)sub_1B18FD768(v17);
      v22 = (void *)objc_msgSend_frameworkLibrary(v18, v19, v20, v21);
      v25 = (void *)objc_msgSend_newFunctionWithName_(v22, v23, (uint64_t)CFSTR("pass_constants_encoder"), v24);
      v28 = (void *)objc_msgSend_newArgumentEncoderWithBufferIndex_(v25, v26, 0, v27);

      v32 = (void *)objc_msgSend_device(self, v29, v30, v31);
      v36 = objc_msgSend_encodedLength(v28, v33, v34, v35);
      v38 = (void *)objc_msgSend_newBufferWithLength_options_(v32, v37, v36, 0);
      objc_msgSend_setArgumentBuffer_offset_(v28, v39, (uint64_t)v38, 0);
      v42 = sub_1B19AAB7C(v13, CFSTR("VFX-Depth-Linear"), v40, v41);
      objc_msgSend_setTexture_atIndex_(v28, v43, (uint64_t)v42, 30);

      return v38;
    }
    objc_msgSend_UTF8String(a4, v14, v15, v16);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXMTLRenderContext::buffer not implemented for scope %d and name %s"), v45, v46, v47, v48, v49, v50, v7);
  }
  return 0;
}

- (id)sampler:(int)a3 :(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXMTLRenderContext::sampler no implemented"), *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (const)constantData:(int)a3
{
  unsigned __int8 *anon_43d0;

  anon_43d0 = self->_anon_43d0;
  if (a3 != 8)
    anon_43d0 = 0;
  if (a3 == 1)
    return (const char *)self->_anon_43d0;
  else
    return (const char *)anon_43d0;
}

- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  const char *v10;
  uint64_t v11;
  int64_t v12;
  BOOL result;
  int64_t v14;
  const char *v15;
  uint64_t v16;
  int64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int64_t v29;
  const char *v30;
  uint64_t v31;

  if (a3 != 1)
  {
    if (a3 == 8)
    {
      if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("crWorldToViewArray"), (uint64_t)a4))
      {
        *a5 = 0;
LABEL_15:
        v14 = (unint64_t)self->_renderPassParameters.eyeCount << 6;
LABEL_16:
        result = 1;
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(a4, v10, (uint64_t)CFSTR("crWorldToProjArray"), v11))
      {
        v17 = 128;
LABEL_14:
        *a5 = v17;
        goto LABEL_15;
      }
      if (objc_msgSend_isEqualToString_(a4, v15, (uint64_t)CFSTR("viewToProjArray"), v16))
      {
        v17 = 256;
        goto LABEL_14;
      }
      if (objc_msgSend_isEqualToString_(a4, v18, (uint64_t)CFSTR("projToViewArray"), v19))
      {
        v17 = 384;
        goto LABEL_14;
      }
      if (objc_msgSend_isEqualToString_(a4, v20, (uint64_t)CFSTR("crwsCameraPositionArray"), v21))
      {
        v24 = 512;
LABEL_19:
        *a5 = v24;
        v14 = 16 * self->_renderPassParameters.eyeCount;
        goto LABEL_16;
      }
      if (objc_msgSend_isEqualToString_(a4, v22, (uint64_t)CFSTR("renderTargetSize"), v23))
      {
        v12 = 560;
        goto LABEL_7;
      }
      if (objc_msgSend_isEqualToString_(a4, v25, (uint64_t)CFSTR("viewportCount"), v26))
      {
        v29 = 576;
LABEL_26:
        *a5 = v29;
        result = 1;
        v14 = 4;
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(a4, v27, (uint64_t)CFSTR("useVertexAmplification"), v28))
      {
        v29 = 580;
        goto LABEL_26;
      }
      if (objc_msgSend_isEqualToString_(a4, v30, (uint64_t)CFSTR("viewportPercentsArray"), v31))
      {
        v24 = 592;
        goto LABEL_19;
      }
    }
LABEL_29:
    v14 = 0;
    result = 0;
    *a5 = 0;
    goto LABEL_30;
  }
  if (!objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("crwsReferencePosition"), (uint64_t)a4))
    goto LABEL_29;
  v12 = 544;
LABEL_7:
  *a5 = v12;
  result = 1;
  v14 = 16;
LABEL_30:
  *a6 = v14;
  return result;
}

- (void)viewports:(const void *)a3 :(int64_t *)a4
{
  *a3 = self->_vfxCoreViewports;
  *a4 = self->_renderPassParameters.eyeCount;
}

- (BOOL)depthOnly
{
  return self->_depthOnly;
}

- (BOOL)renderInGBuffer
{
  return (self->_commonProfileConditioner >> 9) & 1;
}

- (BOOL)outputsNormal
{
  return self->_commonProfileConditioner & 1;
}

- (int64_t)renderMode
{
  return self->_renderMode;
}

- (BOOL)isDrawingBlur
{
  return 0;
}

- (BOOL)isLayeredRendering
{
  return self->_renderPassParameters.viewMapping == 1;
}

@end
