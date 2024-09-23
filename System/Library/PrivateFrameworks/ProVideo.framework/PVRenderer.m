@implementation PVRenderer

- (PVRenderer)initWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  HGSynchronizable *v9;
  PVRenderManager *v10;
  HGCVPixelBufferPool *v11;
  HGCVPixelBufferPool *v12;
  id *v13;
  PVRenderManager *v14;
  PVRenderEffectLoader *v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PVRenderer;
  v5 = -[PVRendererBase initWithOptions:](&v24, sel_initWithOptions_, v4);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVRendererPoolDestinationBuffers"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVRendererPoolDestinationBuffers"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }
    v9 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v9);
    *((_QWORD *)v5 + 11) = v9;
    *((_BYTE *)v5 + 120) = v8 ^ 1;
    if ((v8 & 1) == 0)
    {
      v11 = (HGCVPixelBufferPool *)HGObject::operator new(0x18uLL);
      HGCVPixelBufferPool::HGCVPixelBufferPool(v11);
      v12 = (HGCVPixelBufferPool *)*((_QWORD *)v5 + 16);
      if (v12 == v11)
      {
        if (v11)
          (*(void (**)(HGCVPixelBufferPool *))(*(_QWORD *)v11 + 24))(v11);
      }
      else
      {
        if (v12)
          (*(void (**)(HGCVPixelBufferPool *))(*(_QWORD *)v12 + 24))(v12);
        *((_QWORD *)v5 + 16) = v11;
      }
      v10 = (PVRenderManager *)objc_msgSend(v5, "_configureDefaultPoolPolicy");
    }
    PVRenderManager::INSTANCE(v10, &v23);
    v13 = (id *)*((_QWORD *)v5 + 17);
    v14 = (PVRenderManager *)v23;
    if (v13 == v23)
    {
      if (v13)
      {
        (*((void (**)(_QWORD))*v13 + 3))(*((_QWORD *)v5 + 17));
        v14 = (PVRenderManager *)*((_QWORD *)v5 + 17);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      if (v13)
      {
        (*((void (**)(_QWORD))*v13 + 3))(*((_QWORD *)v5 + 17));
        v14 = (PVRenderManager *)v23;
      }
      *((_QWORD *)v5 + 17) = v14;
    }
    PVRenderManager::SetupTextureFactories(v14, 0.5);
    v15 = objc_alloc_init(PVRenderEffectLoader);
    v16 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v15;

    v17 = (id *)operator new();
    *v17 = dispatch_queue_create("com.apple.PVRenderer.DateLock", 0);
    v23 = 0;
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)v5 + 19, v17);
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v23, 0);
    v18 = objc_opt_new();
    v19 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v18;

    v20 = objc_opt_new();
    v21 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v20;

  }
  return (PVRenderer *)v5;
}

- (void)dealloc
{
  HGSynchronizable *cvPoolsLock;
  _QWORD *begin;
  _QWORD *end;
  uint64_t v6;
  objc_super v7;

  PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  cvPoolsLock = self->_cvPoolsLock;
  if (cvPoolsLock)
    (*((void (**)(HGSynchronizable *))cvPoolsLock->var0 + 1))(cvPoolsLock);
  begin = self->_cvPools.__begin_;
  end = self->_cvPools.__end_;
  if (begin != end)
  {
    do
    {
      v6 = *begin;
      if (*begin)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v6 + 16))(*begin);
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
      }
      ++begin;
    }
    while (begin != end);
    begin = self->_cvPools.__begin_;
  }
  std::vector<HGRef<PVCVPixelBufferPool>>::__base_destruct_at_end[abi:ne180100](&self->_cvPools.__begin_, (uint64_t)begin);
  v7.receiver = self;
  v7.super_class = (Class)PVRenderer;
  -[PVRendererBase dealloc](&v7, sel_dealloc);
}

- (void)startRenderRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  PVRenderRequestJobDelegate *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "outputNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v6, "outputNodes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10)
    && (objc_msgSend(v6, "outputSize"), v11 != 0.0)
    && (objc_msgSend(v6, "outputSize"), v12 != 0.0))
  {
    v13 = -[PVRenderRequestJobDelegate initWithRequest:completionHandler:pvRenderer:]([PVRenderRequestJobDelegate alloc], "initWithRequest:completionHandler:pvRenderer:", v6, v7, self);
    if (v6)
    {
      objc_msgSend(v6, "time");
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
    -[PVRendererBase startJobForDelegate:time:playback:](self, "startJobForDelegate:time:playback:", v13, &v14, 1);
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
    -[PVRenderer _statsLogCheck](self, "_statsLogCheck", v14, v15, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, id, _QWORD))v7 + 2))(v7, 0, v6, 0);
  }

}

- (void)loadInstructionGraphEffects:(id)a3
{
  id v4;
  PVVideoCompositingContext *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  char v10;
  PVRendererInstructionGraphContext *v11;
  PVRenderEffectLoader *effectLoader;
  void *v13;
  PVRendererInstructionGraphContext *v14;
  CMTime v15;
  CMTime v16;
  CGSize v17;

  v4 = a3;
  -[PVRendererBase compositingContext](self, "compositingContext");
  v5 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputSize");
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v4, "highQuality");
  -[PVRenderer frameDuration](self, "frameDuration");
  v11 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
  v16 = v15;
  v17.width = v7;
  v17.height = v9;
  PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v11, v5, v17, v10, &v16);

  effectLoader = self->_effectLoader;
  objc_msgSend(v4, "outputNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v11)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v11 + 16))(v11);
  -[PVRenderEffectLoader loadEffectsForGraphs:loadContext:](effectLoader, "loadEffectsForGraphs:loadContext:", v13, &v14);
  if (v14)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v14 + 24))(v14);

  if (v11)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v11 + 24))(v11);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 30);
}

- (void)cleanupMemoryCaches
{
  HGCVPixelBufferPool *m_Obj;
  CVPixelBufferPoolRef **begin;
  CVPixelBufferPoolRef **end;
  CVPixelBufferPoolRef *v6;
  HGSynchronizable *cvPoolsLock;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVRenderer;
  -[PVRendererBase cleanupMemoryCaches](&v9, sel_cleanupMemoryCaches);
  -[PVRenderEffectLoader ageOutEffects](self->_effectLoader, "ageOutEffects");
  m_Obj = self->_destinationBufferPool.m_Obj;
  if (m_Obj)
    HGCVPixelBufferPool::clear(m_Obj);
  PVRenderManager::FreeTexturePools(self->_renderManager.m_Obj);
  cvPoolsLock = self->_cvPoolsLock;
  v8 = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  begin = (CVPixelBufferPoolRef **)self->_cvPools.__begin_;
  end = (CVPixelBufferPoolRef **)self->_cvPools.__end_;
  while (begin != end)
  {
    v6 = *begin;
    if (*begin)
      (*((void (**)(CVPixelBufferPoolRef *))*v6 + 2))(*begin);
    CVPixelBufferPoolFlush(v6[5], 1uLL);
    (*((void (**)(CVPixelBufferPoolRef *))*v6 + 3))(v6);
    ++begin;
  }
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
}

- (unsigned)outputCVPixelBufferFormat
{
  return self->_destinationPixelFormat;
}

- (HGRef<HGBitmap>)getDestinationBuffer:(CGSize)a3 cvPixelBufferFormat:(unsigned int)a4
{
  _QWORD *v4;
  HGCV *v5;
  double height;
  double width;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  __CVBuffer *v12;
  void *v13;
  PVColorSpace *v14;
  char *v15;
  int v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HGCVPixelBuffer *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  HGCVPixelBuffer *v30;
  CGSize v32;
  CGSize v33;

  v5 = *(HGCV **)&a4;
  height = a3.height;
  width = a3.width;
  v9 = v4;
  *v4 = 0;
  if (PVIsMultiplaneCoreVideo420Format(a4) || PVIsMultiplaneCoreVideo422Format((int)v5))
  {
    v32.width = width;
    v32.height = height;
    if (!PVCanCreateCVPixelBuffer(v32))
    {
      v10 = PVMaximumCVPixelBufferSize();
      if (width > (double)v10)
        width = (double)v10;
      if (height > (double)v10)
        height = (double)v10;
      NSLog(CFSTR("Error: multiplanar destination buffer size request exceeds maximum - cropping."));
    }
  }
  v33.width = width;
  v33.height = height;
  if (PVCanCreateCVPixelBuffer(v33))
  {
    -[PVRenderer hgCVPixelBufferFromCVPoolForSize:withFormat:](self, "hgCVPixelBufferFromCVPoolForSize:withFormat:", v5, width, height);
    if (v30)
    {
      v12 = (__CVBuffer *)*((_QWORD *)v30 + 3);
      -[PVRendererBase compositingContext](self, "compositingContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "outputColorSpace");
      v14 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
      PVAddColorSpaceAttributesToCVPixelBuffer(v12, v14);

      if (PVIsMultiplaneCoreVideo420Format((int)v5) || PVIsMultiplaneCoreVideo422Format((int)v5))
      {
        if (PVIs10BitMultiplaneCoreVideoX420Format((int)v5) || PVIs10BitMultiplaneCoreVideoX422Format((int)v5))
          v16 = 3;
        else
          v16 = 1;
        HGCVBitmap::create(&v30, v16, 0, &v29);
      }
      else
      {
        v27 = HGCV::HGFormatForCVPixelFormat(v5, 0, v15);
        HGCVBitmap::create(&v30, v27, 0, &v29);
      }
      v28 = v29;
      if (v29)
      {
        *v9 = v29;
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 16))(v28);
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28);
      }
    }
    else
    {
      NSLog(CFSTR("Error: getDestinationBuffer: HGCVPixelBuffer creation failed!"));
    }
    v26 = v30;
    if (v30)
      return (HGRef<HGBitmap>)(*(uint64_t (**)(HGCVPixelBuffer *))(*(_QWORD *)v30 + 24))(v30);
  }
  else
  {
    v17 = width;
    v18 = height;
    v19 = HGRectMake4f(v11, 0.0, 0.0, v17, v18);
    v21 = v20;
    v23 = HGCV::HGFormatForCVPixelFormat(v5, 0, v22);
    -[PVRendererBase compositingContext](self, "compositingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "outputColorSpace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PVCreateHGBitmapWithStorage(v19, v21, v23, v25, (HGBitmap **)&v30);
    if (v30)
    {
      *v9 = v30;
      v30 = 0;
    }

  }
  return (HGRef<HGBitmap>)v26;
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  vector<HGRef<PVCVPixelBufferPool>, std::allocator<HGRef<PVCVPixelBufferPool>>> *p_cvPools;
  CVPixelBufferPoolRef **begin;
  CVPixelBufferPoolRef **end;
  CVPixelBufferPoolRef *v7;
  PVGCDLock *value;
  CVPixelBufferPoolRef **v9;
  CVPixelBufferPoolRef **v10;
  CVPixelBufferPoolRef *v11;
  HGSynchronizable *v12;
  char v13;
  _QWORD block[6];
  HGSynchronizable *cvPoolsLock;
  HGSynchronizable **p_cvPoolsLock;
  uint64_t v17;
  char v18;
  objc_super v19;
  uint64_t v20;

  v20 = *(_QWORD *)a3.var0;
  if (v20)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v20 + 16))(v20, a2);
  v19.receiver = self;
  v19.super_class = (Class)PVRenderer;
  -[PVRendererBase renderJobFinished:](&v19, sel_renderJobFinished_, &v20);
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
  cvPoolsLock = self->_cvPoolsLock;
  LOBYTE(p_cvPoolsLock) = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  p_cvPools = &self->_cvPools;
  begin = (CVPixelBufferPoolRef **)self->_cvPools.__begin_;
  end = (CVPixelBufferPoolRef **)self->_cvPools.__end_;
  while (begin != end)
  {
    v7 = *begin;
    if (*begin)
      (*((void (**)(CVPixelBufferPoolRef *))*v7 + 2))(*begin);
    CVPixelBufferPoolFlush(v7[5], 0);
    (*((void (**)(CVPixelBufferPoolRef *))*v7 + 3))(v7);
    ++begin;
  }
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
  cvPoolsLock = 0;
  p_cvPoolsLock = &cvPoolsLock;
  v17 = 0x2020000000;
  v18 = 0;
  value = self->_dateLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PVRenderer_renderJobFinished___block_invoke;
  block[3] = &unk_1E64D6458;
  block[4] = self;
  block[5] = &cvPoolsLock;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  if (*((_BYTE *)p_cvPoolsLock + 24))
  {
    PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
    v12 = self->_cvPoolsLock;
    v13 = 0;
    HGSynchronizable::Lock(v12);
    v9 = (CVPixelBufferPoolRef **)p_cvPools->__begin_;
    v10 = (CVPixelBufferPoolRef **)p_cvPools->__end_;
    while (v9 != v10)
    {
      v11 = *v9;
      if (*v9)
        (*((void (**)(CVPixelBufferPoolRef *))*v11 + 2))(*v9);
      CVPixelBufferPoolFlush(v11[5], 1uLL);
      (*((void (**)(CVPixelBufferPoolRef *))*v11 + 3))(v11);
      ++v9;
    }
    HGSynchronizer::~HGSynchronizer(&v12);
  }
  _Block_object_dispose(&cvPoolsLock, 8);
}

void __32__PVRenderer_renderJobFinished___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "timeIntervalSinceNow");
  if (v2 < -1.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 168);
    *(_QWORD *)(v4 + 168) = v3;

  }
}

- (void)_statsLogCheck
{
  PVGCDLock *value;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  value = self->_dateLock.__ptr_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PVRenderer__statsLogCheck__block_invoke;
  v4[3] = &unk_1E64D6458;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
  if (*((_BYTE *)v6 + 24))
    -[PVRendererBase printAndClearStats:](self, "printAndClearStats:", 1);
  _Block_object_dispose(&v5, 8);
}

void __28__PVRenderer__statsLogCheck__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "timeIntervalSinceNow");
  if (v2 < -5.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

  }
}

- (void)_configureDefaultPoolPolicy
{
  HGCVPixelBufferPool *m_Obj;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::string __p;

  m_Obj = self->_destinationBufferPool.m_Obj;
  std::string::basic_string[abi:ne180100]<0>(&__p, "com.apple.PVRenderer.destinationBufferPool");
  HGCVPixelBufferPool::setLabel((uint64_t)m_Obj, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (+[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice"))
  {
    v4 = 500;
    v5 = 1;
    v6 = 1;
  }
  else
  {
    if (+[PVDeviceCharacteristics actualMemory](PVDeviceCharacteristics, "actualMemory") >= 1073741825)
      v6 = 128;
    else
      v6 = 32;
    v4 = 1000;
    v5 = 20;
  }
  HGCVPixelBufferPool::setRecyclingPolicy(self->_destinationBufferPool.m_Obj, v5, v6, v4);
}

- (void)updateDestinationFormatForOutputColorSpace
{
  void *v3;
  void *v4;
  char v5;
  unsigned int v6;
  void *v7;
  void *v8;

  -[PVRendererBase compositingContext](self, "compositingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputColorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHDRSpace");

  if ((v5 & 1) != 0)
  {
    v6 = 2016686640;
  }
  else
  {
    -[PVRendererBase compositingContext](self, "compositingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isP3d65GammaColorSpace");

    v6 = 1111970369;
  }
  self->_destinationPixelFormat = v6;
}

- (HGRef<HGCVPixelBuffer>)hgCVPixelBufferFromCVPoolForSize:(CGSize)a3 withFormat:(unsigned int)a4
{
  CVPixelBufferRef *v4;
  uint64_t v5;
  double height;
  double width;
  CVPixelBufferRef *v9;
  uint64_t *p_cvPools;
  void ***begin;
  void ***end;
  void **v13;
  void *v14;
  PVCVPixelBufferPool *v15;
  HGRef<HGCVPixelBuffer> v16;
  void (*v17)(void **);
  HGObject *v18;
  void **v19;
  HGSynchronizable *cvPoolsLock;
  char v21;
  CVPixelBufferRef pixelBufferOut;

  v5 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v9 = v4;
  cvPoolsLock = self->_cvPoolsLock;
  v21 = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  *v9 = 0;
  if (self->_enableDestinationPool)
  {
    v19 = 0;
    p_cvPools = (uint64_t *)&self->_cvPools;
    begin = (void ***)self->_cvPools.__begin_;
    end = (void ***)self->_cvPools.__end_;
    if (begin == end)
    {
LABEL_9:
      -[PVRendererBase name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("[%@] Could not find pool for size (%d, %d)"), v14, (int)width, (int)height);

      v15 = (PVCVPixelBufferPool *)HGObject::operator new(0x30uLL);
      PVCVPixelBufferPool::PVCVPixelBufferPool(v15, (unint64_t)width, (unint64_t)height, v5);
      if (v15)
        v19 = (void **)v15;
      std::vector<HGRef<PVCVPixelBufferPool>>::push_back[abi:ne180100](p_cvPools, &v19);
      v13 = v19;
    }
    else
    {
      while (1)
      {
        v13 = *begin;
        if (*begin)
          (*((void (**)(void **))*v13 + 2))(*begin);
        if (v13[2] == (void *)width && v13[3] == (void *)height && *((_DWORD *)v13 + 8) == (_DWORD)v5)
          break;
        (*((void (**)(void **))*v13 + 3))(v13);
        if (++begin == end)
          goto LABEL_9;
      }
      v17 = (void (*)(void **))*((_QWORD *)*v13 + 2);
      v19 = v13;
      v17(v13);
      (*((void (**)(void **))*v13 + 3))(v13);
    }
    pixelBufferOut = 0;
    CVPixelBufferPoolCreatePixelBuffer(0, (CVPixelBufferPoolRef)v13[5], &pixelBufferOut);
    HGCVPixelBuffer::convert((HGCVPixelBuffer *)pixelBufferOut, &v18);
    if (v18)
      *v9 = v18;
    if (v19)
      (*((void (**)(void **))*v19 + 3))(v19);
  }
  else
  {
    HGCVPixelBuffer::create((HGCVPixelBuffer *)width, (unint64_t)height, v5, &pixelBufferOut);
    if (pixelBufferOut)
      *v9 = pixelBufferOut;
  }
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
  return v16;
}

- (void).cxx_destruct
{
  PVRenderManager *m_Obj;
  HGCVPixelBufferPool *v4;
  vector<HGRef<PVCVPixelBufferPool>, std::allocator<HGRef<PVCVPixelBufferPool>>> *p_cvPools;

  objc_storeStrong((id *)&self->_lastTextureCacheFlushDate, 0);
  objc_storeStrong((id *)&self->_lastStatsLogDateTime, 0);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_dateLock, 0);
  objc_storeStrong((id *)&self->_effectLoader, 0);
  m_Obj = self->_renderManager.m_Obj;
  if (m_Obj)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  v4 = self->_destinationBufferPool.m_Obj;
  if (v4)
    (*(void (**)(HGCVPixelBufferPool *))(*(_QWORD *)v4 + 24))(v4);
  p_cvPools = &self->_cvPools;
  std::vector<HGRef<PVCVPixelBufferPool>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_cvPools);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
