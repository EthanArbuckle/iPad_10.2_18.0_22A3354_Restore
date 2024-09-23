@implementation MetalLayer

- (int)backingFormat
{
  if (self->_sRGB)
    return 15;
  else
    return 14;
}

- (MetalLayer)initWithDevice:(shared_ptr<ggl:(BOOL)a4 :MetalDevice>)a3 sRGB:
{
  char cntrl;
  MetalDevice *ptr;
  MetalLayer *v6;
  MetalLayer *v7;
  uint64_t v8;
  MetalDevice *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v23;
  _QWORD v24[5];
  _QWORD v25[6];

  cntrl = (char)a3.__cntrl_;
  ptr = a3.__ptr_;
  v25[5] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MetalLayer;
  v6 = -[CAMetalLayer init](&v23, sel_init, a3.__ptr_, a3.__cntrl_, a4);
  v7 = v6;
  if (v6)
  {
    v9 = *(MetalDevice **)ptr;
    v8 = *((_QWORD *)ptr + 1);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (std::__shared_weak_count *)v6->_device.__cntrl_;
    v6->_device.__ptr_ = v9;
    v6->_device.__cntrl_ = (__shared_weak_count *)v8;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v7->_sRGB = cntrl;
    v24[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v24[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    v24[2] = CFSTR("contentsScale");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v17;
    v24[3] = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v18;
    v24[4] = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MetalLayer setActions:](v7, "setActions:", v20);

    -[MetalLayer setOpaque:](v7, "setOpaque:", 1);
    -[MetalLayer setHidden:](v7, "setHidden:", 0);
    -[MetalLayer setContentsGravity:](v7, "setContentsGravity:", *MEMORY[0x1E0CD2F78]);
    -[CAMetalLayer setPresentsWithTransaction:](v7, "setPresentsWithTransaction:", 1);
    -[MetalLayer setValue:forKey:](v7, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("disablePromotionCompatibility"));
    -[CAMetalLayer setFramebufferOnly:](v7, "setFramebufferOnly:", 0);
    if (v7->_sRGB)
      v21 = 81;
    else
      v21 = 80;
    -[CAMetalLayer setPixelFormat:](v7, "setPixelFormat:", v21);
    -[CAMetalLayer setFenceEnabled:](v7, "setFenceEnabled:", 1);
    -[CAMetalLayer setDevice:](v7, "setDevice:", *(_QWORD *)(*(_QWORD *)ptr + 104));
  }
  return v7;
}

- (void)_createTexture
{
  double v3;
  double v4;
  double v5;
  unsigned int v6;
  double v7;
  unsigned int v8;
  shared_ptr<ggl::Texture2D> *p_texture;
  Texture2D *ptr;
  uint64_t v11;
  uint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  __shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __shared_weak_count *v21;
  __shared_weak_count *cntrl;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;

  -[MetalLayer contentsScale](self, "contentsScale");
  v4 = v3;
  -[MetalLayer bounds](self, "bounds");
  v6 = (v5 * v4);
  v8 = (v7 * v4);
  p_texture = &self->_texture;
  if (!(v6 * v8))
  {
    cntrl = self->_texture.__cntrl_;
    p_texture->__ptr_ = 0;
    p_texture->__cntrl_ = 0;
    if (!cntrl)
      return;
    v25 = (unint64_t *)((char *)cntrl + 8);
    do
      v24 = __ldaxr(v25);
    while (__stlxr(v24 - 1, v25));
    goto LABEL_20;
  }
  ptr = p_texture->__ptr_;
  if (!p_texture->__ptr_ || *((_DWORD *)ptr + 20) != v6 || *((_DWORD *)ptr + 21) != v8)
  {
    self->_backingSize.width = (double)v6;
    self->_backingSize.height = (double)v8;
    -[CAMetalLayer setDrawableSize:](self, "setDrawableSize:");
    v11 = operator new();
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = 0;
    *(_DWORD *)(v11 + 32) = 0;
    *(_QWORD *)v11 = &off_1E42B63B0;
    *(_QWORD *)(v11 + 8) = 0;
    *(_OWORD *)(v11 + 36) = xmmword_19FFB3C50;
    *(_QWORD *)(v11 + 52) = 0x100000000;
    *(_DWORD *)(v11 + 60) = 0;
    v12 = operator new();
    *(_QWORD *)v12 = &off_1E42E77C8;
    *(_QWORD *)(v12 + 8) = 0;
    *(_QWORD *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = v11;
    v13 = self->_samplerState.__cntrl_;
    self->_samplerState.__ptr_ = (SamplerState *)v11;
    self->_samplerState.__cntrl_ = (__shared_weak_count *)v12;
    if (v13)
    {
      v14 = (unint64_t *)((char *)v13 + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v13 + 16))(v13);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
      }
    }
    v16 = operator new();
    v17 = -[MetalLayer backingFormat](self, "backingFormat");
    *(_DWORD *)(v16 + 32) = 0;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = 0;
    *(_QWORD *)(v16 + 56) = 0x100000001;
    *(_DWORD *)(v16 + 64) = 0;
    *(_DWORD *)(v16 + 68) = v17;
    *(_DWORD *)(v16 + 72) = 1;
    *(_QWORD *)(v16 + 76) = 0;
    *(_QWORD *)(v16 + 92) = 0;
    *(_QWORD *)(v16 + 84) = 0;
    *(_QWORD *)(v16 + 100) = 0x100000000;
    *(_QWORD *)v16 = &off_1E42BE438;
    *(_QWORD *)(v16 + 8) = 0;
    *(_QWORD *)(v16 + 40) = &unk_1E42BE458;
    *(_QWORD *)(v16 + 48) = "";
    *(_QWORD *)(v16 + 112) = 0;
    *(_QWORD *)(v16 + 120) = 0;
    *(_WORD *)(v16 + 128) = 0;
    *(_BYTE *)(v16 + 130) = 1;
    v18 = self->_samplerState.__cntrl_;
    *(_QWORD *)(v16 + 136) = self->_samplerState.__ptr_;
    *(_QWORD *)(v16 + 144) = v18;
    if (v18)
    {
      v19 = (unint64_t *)((char *)v18 + 8);
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    *(_DWORD *)(v16 + 80) = v6;
    *(_DWORD *)(v16 + 84) = v8;
    v21 = (__shared_weak_count *)operator new();
    *(_QWORD *)v21 = &off_1E42E7E58;
    *((_QWORD *)v21 + 1) = 0;
    *((_QWORD *)v21 + 2) = 0;
    *((_QWORD *)v21 + 3) = v16;
    cntrl = self->_texture.__cntrl_;
    p_texture->__ptr_ = (Texture2D *)v16;
    p_texture->__cntrl_ = v21;
    if (cntrl)
    {
      v23 = (unint64_t *)((char *)cntrl + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
LABEL_20:
      if (!v24)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
}

- (id)_updateDrawable
{
  void *v3;
  void *v4;
  Texture2D *ptr;
  id v6;

  if (-[CAMetalLayer isDrawableAvailable](self, "isDrawableAvailable"))
  {
    -[CAMetalLayer nextDrawable](self, "nextDrawable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      ptr = self->_texture.__ptr_;
      if (ptr)
      {
        ggl::MetalResourceManager::updateTextureWithResource(*((ggl::MetalResourceManager **)self->_device.__ptr_ + 10), (const ggl::Texture *)ptr, (void *)objc_msgSend(v3, "texture"));
        v6 = v4;
LABEL_8:

        return v6;
      }
    }
    else
    {
      NSLog((NSString *)CFSTR("Nil drawable for layer %@"), self);
    }
    v6 = 0;
    goto LABEL_8;
  }
  NSLog((NSString *)CFSTR("No drawable available at time of request for layer %@"), self);
  v6 = 0;
  return v6;
}

- (void)_onTimerFired:(double)a3 withPresent:(id)a4
{
  void (**v6)(id, id);
  uint64_t v7;
  void *v8;
  const ggl::Texture **p_texture;
  id WeakRetained;
  void *v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  GGLLayerDelegate **p_delegate;
  id v19;
  int v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  const ggl::Texture *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  const ggl::Texture *v38;
  __shared_weak_count *v39;

  v6 = (void (**)(id, id))a4;
  v7 = mach_absolute_time();
  v8 = (void *)MEMORY[0x1A1AF555C]();
  -[MetalLayer _createTexture](self, "_createTexture");
  p_texture = (const ggl::Texture **)&self->_texture;
  if (self->_texture.__ptr_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    cntrl = self->_texture.__cntrl_;
    v38 = *p_texture;
    v39 = cntrl;
    if (cntrl)
    {
      v13 = (unint64_t *)((char *)cntrl + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    objc_msgSend(WeakRetained, "prepareTexture:", &v38);
    v15 = (std::__shared_weak_count *)v39;
    if (v39)
    {
      v16 = (unint64_t *)((char *)v39 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

  }
  p_delegate = &self->_delegate;
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = objc_msgSend(v19, "isDelayedRenderQueueConsumptionSupported");

  if (v20)
  {
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = objc_msgSend(v21, "renderQueueForTimestamp:", a3);

  }
  else
  {
    v22 = 0;
  }
  v23 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v23, "willUpdateFrameTexture");

  -[MetalLayer _updateDrawable](self, "_updateDrawable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v25, "didUpdateFrameTexture");

  if (v24)
  {
    v35 = v7;
    if ((v20 & 1) == 0)
    {
      v26 = objc_loadWeakRetained((id *)p_delegate);
      v22 = objc_msgSend(v26, "renderQueueForTimestamp:", a3);

    }
    v27 = objc_loadWeakRetained((id *)p_delegate);
    v28 = *p_texture;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __40__MetalLayer__onTimerFired_withPresent___block_invoke;
    v36[3] = &unk_1E42FAFB0;
    v36[4] = self;
    v29 = v24;
    v37 = v29;
    objc_msgSend(v27, "drawToTexture:withRenderQueue:completionHandler:", v28, v22, v36);

    v30 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v30, "willPresent");

    v7 = v35;
    v6[2](v6, v29);
    ggl::MetalResourceManager::updateTextureWithResource(*((ggl::MetalResourceManager **)self->_device.__ptr_ + 10), *p_texture, 0);
    v31 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v31, "didPresent");

  }
  objc_autoreleasePoolPop(v8);
  v32 = mach_absolute_time();
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  v33 = *(unint64_t **)(ggl::Performance::Counters::instance(void)::counters + 32);
  do
    v34 = __ldaxr(v33);
  while (__stlxr(v34 + v32 - v7, v33));

}

- (void)onTimerFired:(double)a3
{
  -[MetalLayer _onTimerFired:withPresent:](self, "_onTimerFired:withPresent:", &__block_literal_global_41159, a3);
}

- (void)onTimerFired:(double)a3 presentAtTime:(double)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__MetalLayer_onTimerFired_presentAtTime___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v16__0___CAMetalDrawable__8l;
  *(double *)&v4[4] = a4;
  -[MetalLayer _onTimerFired:withPresent:](self, "_onTimerFired:withPresent:", v4, a3);
}

- (void)onTimerFired:(double)a3 presentAfterMinimumDuration:(double)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MetalLayer_onTimerFired_presentAfterMinimumDuration___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v16__0___CAMetalDrawable__8l;
  *(double *)&v4[4] = a4;
  -[MetalLayer _onTimerFired:withPresent:](self, "_onTimerFired:withPresent:", v4, a3);
}

- (GGLLayerDelegate)renderDelegate
{
  return (GGLLayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setRenderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)backingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_backingSize.width;
  height = self->_backingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)sRGB
{
  return self->_sRGB;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;

  objc_storeStrong((id *)&self->_prevDrawable, 0);
  cntrl = self->_samplerState.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v6 = self->_texture.__cntrl_;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  v9 = self->_device.__cntrl_;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v9 + 16))(v9);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

uint64_t __55__MetalLayer_onTimerFired_presentAfterMinimumDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentAfterMinimumDuration:", *(double *)(a1 + 32));
}

uint64_t __41__MetalLayer_onTimerFired_presentAtTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentAtTime:", *(double *)(a1 + 32));
}

uint64_t __27__MetalLayer_onTimerFired___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "present");
}

void __40__MetalLayer__onTimerFired_withPresent___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

@end
