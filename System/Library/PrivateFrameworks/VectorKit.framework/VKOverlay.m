@implementation VKOverlay

- (VKOverlay)init
{
  char *v2;
  VKOverlay *v3;
  __int128 v4;
  unsigned int v5;
  _QWORD *v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VKOverlay;
  v2 = -[VKOverlay init](&v15, sel_init);
  v3 = (VKOverlay *)v2;
  if (v2)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0D266D8] + 16);
    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0D266D8];
    *(_OWORD *)(v2 + 40) = v4;
    do
      v5 = __ldaxr(_overlaysCounter);
    while (__stlxr(v5 + 1, _overlaysCounter));
    *((_DWORD *)v2 + 53) = v5;
    v6 = operator new(0x20uLL);
    v6[1] = 0;
    v6[2] = 0;
    *v6 = &off_1E42DCB30;
    v6[3] = 1065353216;
    cntrl = (std::__shared_weak_count *)v3->_rasterStyle.__cntrl_;
    v3->_rasterStyle.__ptr_ = (RasterTileOverlayStyle *)(v6 + 3);
    v3->_rasterStyle.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v10 = operator new(0x20uLL);
    v10[1] = 0;
    v10[2] = 0;
    *v10 = &off_1E42DCB30;
    v10[3] = 1065353216;
    v11 = (std::__shared_weak_count *)v3->_customStyle.__cntrl_;
    v3->_customStyle.__ptr_ = (RasterTileOverlayStyle *)(v10 + 3);
    v3->_customStyle.__cntrl_ = (__shared_weak_count *)v10;
    if (v11)
    {
      v12 = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v3->_blendMode = 0;
    v3->_forceRasterizationForGlobe = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[VKVectorOverlayData _setDelegate:](self->_vectorData, "_setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKOverlay;
  -[VKOverlay dealloc](&v3, sel_dealloc);
}

- (VKOverlayDelegate)delegate
{
  return (VKOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)clearDelegate
{
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[VKOverlay _updateVectorData](self, "_updateVectorData");
  -[VKOverlay _updateRasterTileProvider](self, "_updateRasterTileProvider");
  -[VKOverlay _updateCustomTileProvider](self, "_updateCustomTileProvider");
}

- (void)setBlendMode:(int64_t)a3
{
  int64_t blendMode;
  int v5;
  RunLoopController *runLoopController;
  uint64_t var0;
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v10;
  md::OverlayContainer *ptr;
  __shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD v15[2];

  blendMode = self->_blendMode;
  if (blendMode == a3)
    return;
  self->_blendMode = a3;
  if ((unint64_t)(a3 - 1) < 0x11)
    v5 = a3;
  else
    v5 = 0;
  *((_DWORD *)self->_rasterStyle.__ptr_ + 1) = v5;
  *((_DWORD *)self->_customStyle.__ptr_ + 1) = v5;
  -[VKVectorOverlayData setBlendMode:](self->_vectorData, "setBlendMode:");
  if (blendMode)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        LOBYTE(v15[0]) = 1;
        md::MapEngine::setNeedsTick(var0, v15);
      }
    }
    return;
  }
  -[VKOverlay _updateVectorData](self, "_updateVectorData");
  p_standardContainer = &self->_standardContainer;
  v15[0] = 0;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    return;
  }
  v10 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  v15[1] = v10;
  if (v10)
  {
    ptr = (md::OverlayContainer *)p_standardContainer->__ptr_;
    v15[0] = ptr;
    if (ptr)
    {
      md::OverlayContainer::invalidate(ptr, self, 1, 0);
LABEL_17:
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
  }
  v12 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v12)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
  if (v10)
    goto LABEL_17;
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  if (self->_forceRasterizationForGlobe != a3)
  {
    self->_forceRasterizationForGlobe = a3;
    if (a3 && self->_canProvideVectorData)
      -[VKOverlay _updateVectorData](self, "_updateVectorData");
  }
}

- (void)setRunLoopController:(RunLoopController *)a3
{
  self->_runLoopController = a3;
  -[VKOverlay customTileOverlayDidChangeDisplayRate:](self, "customTileOverlayDidChangeDisplayRate:", self->_customTileProvider);
}

- (void)setNeedsDisplayInRect:(id *)a3 level:(int64_t)a4 reason:(unint64_t)a5
{
  __shared_weak_count *cntrl;
  GlobeOverlayContainer *ptr;
  double var1;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  VKOverlay *v18;
  VKOverlay *v19;
  uint64_t v20;
  VKOverlay *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v40;
  __shared_weak_count *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  VKOverlay *v49;
  double *v50;
  double *v51;
  uint64_t v52;
  __shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  _QWORD v60[3];
  double *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  cntrl = self->_flyoverContainer.__cntrl_;
  if (cntrl && (v59 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl)) != 0)
    ptr = self->_flyoverContainer.__ptr_;
  else
    ptr = 0;
  var1 = a3->var0.var1;
  v12 = *(double *)(MEMORY[0x1E0D266E8] + 16);
  v13 = *(double *)(MEMORY[0x1E0D266E8] + 24);
  v14 = a3->var0.var0 / v12;
  v15 = 1.0 - (a3->var1.var1 + var1) / v13;
  v16 = 1.0 - var1 / v13;
  v17 = (a3->var1.var0 + a3->var0.var0) / v12;
  if (ptr)
  {
    v18 = self;
    v19 = v18;
    if (*(_QWORD *)ptr)
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)ptr + 856) + 40) + 48);
      if (v20)
      {
        v58 = a5;
        v21 = v18;
        v22 = *(_DWORD *)(v20 + 72) + 1;
        *(_DWORD *)(v20 + 76) = v22;
        v24 = *(_QWORD *)(v20 + 104);
        v23 = *(_QWORD *)(v20 + 112);
        if (v23 != v24)
        {
          v25 = 0;
          do
          {
            v26 = *(_QWORD *)(v24 + 8 * v25);
            v27 = *(_QWORD *)(v26 + 360);
            if (v27)
            {
              v28 = *(_DWORD *)(v26 + 392);
              if (v28 >= 0x1F)
                v29 = 31;
              else
                v29 = *(_DWORD *)(v26 + 392);
              v30 = (~(-1 << v29) - *(_DWORD *)(v26 + 396));
              v31 = *(unsigned int *)(v26 + 400);
              v32 = 1.0 / (double)(1 << v28);
              v33 = v32 * (double)(int)v31;
              v34 = v32 * (double)((1 << v28) + ~(_DWORD)v30);
              v35 = v34 + v32;
              v36 = v33 + v32;
              if (v17 > v33 && v14 < v36 && v16 > v34 && v15 < v35)
              {
                v60[0] = v31 | (v30 << 32);
                v60[1] = v28 | 0x200000000;
                if (-[VKOverlay canDrawKey:](v21, "canDrawKey:", v60))
                {
                  if (-[VKOverlay level](v21, "level"))
                    v40 = v27 + 1;
                  else
                    v40 = v27;
                  *(_BYTE *)(v40 + 168) = 1;
                }
                v22 = *(_DWORD *)(v20 + 76);
                v24 = *(_QWORD *)(v20 + 104);
                v23 = *(_QWORD *)(v20 + 112);
              }
              *(_DWORD *)(v27 + 84) = v22;
            }
            ++v25;
          }
          while (v25 != (v23 - v24) >> 3);
        }

        a5 = v58;
        v42 = *(_QWORD *)(v20 + 80);
        v43 = *(_QWORD *)(v20 + 88);
        while (v42 != v43)
        {
          if (*(VKOverlay **)v42 == v21)
            *(_DWORD *)(v42 + 8) = *(_DWORD *)(v20 + 72) + 1;
          v42 += 16;
        }
        v44 = **(_QWORD **)(*(_QWORD *)(v20 + 40) + 88);
        if (v44)
        {
          LOBYTE(v60[0]) = 7;
          md::MapEngine::setNeedsTick(v44, v60);
        }

      }
    }

  }
  else
  {
    v41 = self->_flyoverContainer.__cntrl_;
    self->_flyoverContainer.__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    if (v41)
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v41);
  }
  p_standardContainer = &self->_standardContainer;
  v46 = self->_standardContainer.__cntrl_;
  if (!v46)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_64;
  }
  v47 = std::__shared_weak_count::lock((std::__shared_weak_count *)v46);
  if (v47)
  {
    v48 = (uint64_t)p_standardContainer->__ptr_;
    if (p_standardContainer->__ptr_)
    {
      v49 = self;
      v61 = 0;
      v50 = (double *)operator new(0x40uLL);
      *(_QWORD *)v50 = &off_1E42CD778;
      *((_QWORD *)v50 + 1) = v48;
      *((_QWORD *)v50 + 2) = v49;
      v50[3] = v14;
      v50[4] = v15;
      v50[5] = v17;
      v50[6] = v16;
      *((_BYTE *)v50 + 56) = 0;
      if ((a4 & 0x8000000000000000) == 0)
      {
        *((_BYTE *)v50 + 57) = a4;
        *((_BYTE *)v50 + 56) = 1;
      }
      *((_BYTE *)v50 + 58) = a5 != 3;
      v61 = v50;
      md::OverlayContainer::queueCommand(v48, 4, v60);
      v51 = v61;
      if (v61 == (double *)v60)
      {
        v52 = 4;
        v51 = (double *)v60;
      }
      else
      {
        if (!v61)
        {
LABEL_59:

LABEL_60:
          p_shared_owners = (unint64_t *)&v47->__shared_owners_;
          do
            v55 = __ldaxr(p_shared_owners);
          while (__stlxr(v55 - 1, p_shared_owners));
          if (!v55)
          {
            ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
            std::__shared_weak_count::__release_weak(v47);
          }
          goto LABEL_64;
        }
        v52 = 5;
      }
      (*(void (**)(void))(*(_QWORD *)v51 + 8 * v52))();
      goto LABEL_59;
    }
  }
  v53 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v53)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v53);
  if (v47)
    goto LABEL_60;
LABEL_64:
  if (v59)
  {
    v56 = (unint64_t *)&v59->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
}

- (BOOL)canPossiblyDrawKey:(id *)a3
{
  void *v5;

  -[VKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "overlay:canPossiblyDrawKey:", self, a3);

  return (char)a3;
}

- (BOOL)canDrawKey:(id *)a3
{
  void *v5;

  -[VKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "overlay:canDrawKey:", self, a3);

  return (char)a3;
}

- (BOOL)areResourcesRequired
{
  VKOverlay *v2;
  void *v3;

  v2 = self;
  -[VKOverlay delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "areOverlayResourcesRequired:", v2);

  return (char)v2;
}

- (BOOL)shouldUseMetalTexture
{
  VKOverlay *v2;
  void *v3;

  v2 = self;
  -[VKOverlay delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldUseMetalTexture:", v2);

  return (char)v2;
}

- (unsigned)anisotropy
{
  void *v3;
  unsigned int v4;
  unsigned int v5;

  -[VKOverlay delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anisotropy:", self);

  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  if (v5 >= 0x10)
    return 16;
  else
    return v5;
}

- (unint64_t)estimatedCostForCustomTileData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[VKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "overlay:estimatedCostForCustomTileData:", self, v4);

  return v6;
}

- (BOOL)canDrawKey:(id *)a3 withData:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[VKOverlay delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "overlay:canDrawKey:withData:", self, a3, v6);

  return (char)a3;
}

- (void)didExitKey:(id *)a3
{
  id v5;

  -[VKOverlay delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlay:didExitKey:", self, a3);

}

- (void)didEnterKey:(id *)a3 withFallback:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  -[VKOverlay delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlay:didEnterKey:withFallback:", self, a3, v4);

}

- (void)onVisibleTiles:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKOverlay delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlay:onVisibleTiles:", self, v5);

}

- (void)drawKey:(id *)a3 inContext:(CGContext *)a4
{
  id v7;

  -[VKOverlay delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlay:drawKey:inContext:", self, a3, a4);

}

- (void)drawKey:(id *)a3 withData:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6
{
  void *v10;
  id v11;

  v11 = a4;
  -[VKOverlay delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "overlay:drawKey:withData:inIOSurface:withTimestamp:", self, a3, v11, a5, a6);

}

- (void)drawKey:(id *)a3 withData:(id)a4 inTexture:(id)a5 withTimestamp:(double)a6 withTileScale:(float)a7
{
  id v12;
  void *v13;
  double v14;
  id v15;

  v15 = a4;
  v12 = a5;
  -[VKOverlay delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a7;
  objc_msgSend(v13, "overlay:drawKey:withData:inTexture:withTimestamp:withTileScale:", self, a3, v15, v12, a6, v14);

}

- (id)vectorData
{
  unfair_lock *p_vectorDataLock;
  VKVectorOverlayData *v4;

  p_vectorDataLock = &self->_vectorDataLock;
  os_unfair_lock_lock(&self->_vectorDataLock._lock);
  v4 = self->_vectorData;
  os_unfair_lock_unlock(&p_vectorDataLock->_lock);
  return v4;
}

- (void)_updateVectorData
{
  unfair_lock *p_vectorDataLock;
  void *v4;
  BOOL v5;
  VKVectorOverlayData *vectorData;
  VKVectorOverlayData *v7;
  VKVectorOverlayData *v8;

  p_vectorDataLock = &self->_vectorDataLock;
  os_unfair_lock_lock(&self->_vectorDataLock._lock);
  -[VKOverlay delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "overlayCanProvideVectorData:", self))
    v5 = !self->_forceRasterizationForGlobe;
  else
    v5 = 0;
  self->_canProvideVectorData = v5;
  -[VKVectorOverlayData _setDelegate:](self->_vectorData, "_setDelegate:", 0);
  vectorData = self->_vectorData;
  self->_vectorData = 0;

  if (self->_canProvideVectorData)
  {
    objc_msgSend(v4, "vectorDataForOverlay:", self);
    v7 = (VKVectorOverlayData *)objc_claimAutoreleasedReturnValue();
    v8 = self->_vectorData;
    self->_vectorData = v7;

    -[VKVectorOverlayData _setDelegate:](self->_vectorData, "_setDelegate:", self);
    -[VKVectorOverlayData setBlendMode:](self->_vectorData, "setBlendMode:", self->_blendMode);
  }

  os_unfair_lock_unlock(&p_vectorDataLock->_lock);
}

- (id)rasterTileProvider
{
  unfair_lock *p_rasterTileProviderLock;
  VKRasterTileOverlayProviderData *v4;

  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  v4 = self->_rasterTileProvider;
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
  return v4;
}

- (void)_updateRasterTileProvider
{
  unfair_lock *p_rasterTileProviderLock;
  VKRasterTileOverlayProviderData *rasterTileProvider;
  id WeakRetained;
  int v6;
  id v7;
  VKRasterTileOverlayProviderData *v8;
  VKRasterTileOverlayProviderData *v9;
  VKRasterTileOverlayProviderData *v10;
  RasterTileOverlayStyle *ptr;
  double v12;
  float v13;

  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  -[VKRasterTileOverlayProviderData setDelegate:](self->_rasterTileProvider, "setDelegate:", 0);
  rasterTileProvider = self->_rasterTileProvider;
  self->_rasterTileProvider = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "overlayCanProvideRasterTileData:", self);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "rasterTileProviderForOverlay:", self);
    v8 = (VKRasterTileOverlayProviderData *)objc_claimAutoreleasedReturnValue();
    v9 = self->_rasterTileProvider;
    self->_rasterTileProvider = v8;

    -[VKRasterTileOverlayProviderData setDelegate:](self->_rasterTileProvider, "setDelegate:", self);
  }
  v10 = self->_rasterTileProvider;
  ptr = self->_rasterStyle.__ptr_;
  if (v10)
  {
    -[VKRasterTileOverlayProviderData alpha](v10, "alpha");
    v13 = v12;
  }
  else
  {
    v13 = 1.0;
  }
  *(float *)ptr = v13;
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
}

- (id)customTileProvider
{
  unfair_lock *p_customTileProviderLock;
  VKCustomTileOverlayProviderData *v4;

  p_customTileProviderLock = &self->_customTileProviderLock;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  v4 = self->_customTileProvider;
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
  return v4;
}

- (void)_updateCustomTileProvider
{
  unfair_lock *p_customTileProviderLock;
  VKCustomTileOverlayProviderData *customTileProvider;
  id WeakRetained;
  int v6;
  id v7;
  VKCustomTileOverlayProviderData *v8;
  VKCustomTileOverlayProviderData *v9;
  VKCustomTileOverlayProviderData *v10;
  RasterTileOverlayStyle *ptr;
  double v12;
  float v13;

  p_customTileProviderLock = &self->_customTileProviderLock;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  -[VKCustomTileOverlayProviderData setDelegate:](self->_customTileProvider, "setDelegate:", 0);
  customTileProvider = self->_customTileProvider;
  self->_customTileProvider = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "overlayCanProvideCustomTileData:", self);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "customTileProviderForOverlay:", self);
    v8 = (VKCustomTileOverlayProviderData *)objc_claimAutoreleasedReturnValue();
    v9 = self->_customTileProvider;
    self->_customTileProvider = v8;

    -[VKCustomTileOverlayProviderData setDelegate:](self->_customTileProvider, "setDelegate:", self);
  }
  v10 = self->_customTileProvider;
  ptr = self->_customStyle.__ptr_;
  if (v10)
  {
    -[VKCustomTileOverlayProviderData alpha](v10, "alpha");
    v13 = v12;
  }
  else
  {
    v13 = 1.0;
  }
  *(float *)ptr = v13;
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
}

- (void)setNeedsDisplayForReason:(unint64_t)a3
{
  int canProvideVectorData;
  int v6;
  id v7;
  void *v8;
  void *v9;
  weak_ptr<md::GlobeOverlayContainer> *p_flyoverContainer;
  __shared_weak_count *cntrl;
  GlobeOverlayContainer *ptr;
  VKOverlay *v13;
  VKOverlay *v14;
  uint64_t v15;
  VKOverlay *v16;
  uint64_t v17;
  uint64_t v18;
  __shared_weak_count *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *v24;
  std::__shared_weak_count *v25;
  md::OverlayContainer *v26;
  RunLoopController *runLoopController;
  uint64_t var0;
  __shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[2];
  GlobeOverlayContainer *v39;
  std::__shared_weak_count *v40;
  char v41;

  -[VKOverlay vectorData](self, "vectorData");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[VKOverlay rasterTileProvider](self, "rasterTileProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKOverlay customTileProvider](self, "customTileProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  canProvideVectorData = self->_canProvideVectorData;
  -[VKOverlay _updateVectorData](self, "_updateVectorData");
  v6 = self->_canProvideVectorData;
  -[VKOverlay _updateRasterTileProvider](self, "_updateRasterTileProvider");
  -[VKOverlay _updateCustomTileProvider](self, "_updateCustomTileProvider");
  -[VKOverlay vectorData](self, "vectorData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKOverlay rasterTileProvider](self, "rasterTileProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKOverlay customTileProvider](self, "customTileProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_flyoverContainer = &self->_flyoverContainer;
  v39 = 0;
  v40 = 0;
  cntrl = self->_flyoverContainer.__cntrl_;
  if (!cntrl)
  {
    p_flyoverContainer->__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    goto LABEL_15;
  }
  v40 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v40 || (ptr = p_flyoverContainer->__ptr_, (v39 = ptr) == 0))
  {
    v19 = self->_flyoverContainer.__cntrl_;
    p_flyoverContainer->__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    if (v19)
    {
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
      if (a3 == 2)
        goto LABEL_16;
      goto LABEL_31;
    }
LABEL_15:
    if (a3 == 2)
      goto LABEL_16;
LABEL_31:
    v20 = 0;
    goto LABEL_32;
  }
  v13 = self;
  v14 = v13;
  if (*(_QWORD *)ptr)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)ptr + 856) + 40) + 48);
    if (v15)
    {
      v16 = v13;
      md::realistic::OverlayRenderLayer::invalidateTiles((md::realistic::OverlayRenderLayer *)v15, v16);
      v17 = *(_QWORD *)(v15 + 80);
      v18 = *(_QWORD *)(v15 + 88);
      while (v17 != v18)
      {
        if (*(VKOverlay **)v17 == v16)
          *(_DWORD *)(v17 + 8) = *(_DWORD *)(v15 + 72) + 1;
        v17 += 16;
      }
      v22 = **(_QWORD **)(*(_QWORD *)(v15 + 40) + 88);
      if (v22)
      {
        LOBYTE(v38[0]) = 7;
        md::MapEngine::setNeedsTick(v22, v38);
      }

    }
  }

  if (a3 != 2)
    goto LABEL_31;
LABEL_16:
  if (v7 && v7 == v37 || v8 && v8 == v36)
  {
    v20 = 1;
  }
  else
  {
    if (v9)
      v21 = v9 == v35;
    else
      v21 = 0;
    v20 = v21;
  }
LABEL_32:
  p_standardContainer = &self->_standardContainer;
  v38[0] = 0;
  v24 = self->_standardContainer.__cntrl_;
  if (!v24)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_49;
  }
  v25 = std::__shared_weak_count::lock((std::__shared_weak_count *)v24);
  v38[1] = v25;
  if (v25)
  {
    v26 = (md::OverlayContainer *)p_standardContainer->__ptr_;
    v38[0] = v26;
    if (v26)
    {
      if (v20 && (runLoopController = self->_runLoopController) != 0)
      {
        var0 = (uint64_t)runLoopController->var0;
        if (runLoopController->var0)
        {
          v41 = 1;
          md::MapEngine::setNeedsTick(var0, &v41);
        }
      }
      else
      {
        md::OverlayContainer::invalidate(v26, self, a3 != 3, canProvideVectorData != v6);
      }
LABEL_45:
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v31 = __ldaxr(p_shared_owners);
      while (__stlxr(v31 - 1, p_shared_owners));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
      goto LABEL_49;
    }
  }
  v29 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v29)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v29);
  if (v25)
    goto LABEL_45;
LABEL_49:
  v32 = v40;
  if (v40)
  {
    v33 = (unint64_t *)&v40->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

}

- (weak_ptr<md::GlobeOverlayContainer>)flyoverContainer
{
  GlobeOverlayContainer **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  weak_ptr<md::GlobeOverlayContainer> result;

  cntrl = self->_flyoverContainer.__cntrl_;
  *v2 = self->_flyoverContainer.__ptr_;
  v2[1] = (GlobeOverlayContainer *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (GlobeOverlayContainer *)self;
  return result;
}

- (void)setFlyoverContainer:(weak_ptr<md::GlobeOverlayContainer>)a3
{
  __shared_weak_count *v3;
  GlobeOverlayContainer *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;

  v4 = *(GlobeOverlayContainer **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_flyoverContainer.__cntrl_;
  self->_flyoverContainer.__ptr_ = v4;
  self->_flyoverContainer.__cntrl_ = v3;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (weak_ptr<md::OverlayContainer>)standardContainer
{
  OverlayContainer **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  weak_ptr<md::OverlayContainer> result;

  cntrl = self->_standardContainer.__cntrl_;
  *v2 = self->_standardContainer.__ptr_;
  v2[1] = (OverlayContainer *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (OverlayContainer *)self;
  return result;
}

- (void)setStandardContainer:(weak_ptr<md::OverlayContainer>)a3
{
  __shared_weak_count *v3;
  OverlayContainer *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;

  v4 = *(OverlayContainer **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_standardContainer.__cntrl_;
  self->_standardContainer.__ptr_ = v4;
  self->_standardContainer.__cntrl_ = v3;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (void)vectorOverlayNeedsDisplay:(id)a3 needsFullInvalidate:(BOOL)a4
{
  _BOOL4 v4;
  unfair_lock *p_vectorDataLock;
  VKVectorOverlayData *v7;
  VKVectorOverlayData *vectorData;
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v11;
  md::OverlayContainer *ptr;
  RunLoopController *runLoopController;
  uint64_t var0;
  __shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD v18[2];

  v4 = a4;
  p_vectorDataLock = &self->_vectorDataLock;
  v7 = (VKVectorOverlayData *)a3;
  os_unfair_lock_lock(&p_vectorDataLock->_lock);
  vectorData = self->_vectorData;

  if (vectorData != v7)
    goto LABEL_2;
  if (v4)
  {
    p_standardContainer = &self->_standardContainer;
    v18[0] = 0;
    cntrl = self->_standardContainer.__cntrl_;
    if (!cntrl)
    {
      p_standardContainer->__ptr_ = 0;
      self->_standardContainer.__cntrl_ = 0;
      goto LABEL_2;
    }
    v11 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    v18[1] = v11;
    if (v11)
    {
      ptr = (md::OverlayContainer *)p_standardContainer->__ptr_;
      v18[0] = ptr;
      if (ptr)
      {
        md::OverlayContainer::invalidate(ptr, self, 1, 0);
LABEL_14:
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        goto LABEL_2;
      }
    }
    v15 = self->_standardContainer.__cntrl_;
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    if (v15)
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v15);
    if (v11)
      goto LABEL_14;
  }
  else
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        LOBYTE(v18[0]) = 1;
        md::MapEngine::setNeedsTick(var0, v18);
      }
    }
  }
LABEL_2:
  os_unfair_lock_unlock(&p_vectorDataLock->_lock);
}

- (void)rasterTileOverlayNeedsDisplay:(id)a3
{
  unfair_lock *p_rasterTileProviderLock;
  VKRasterTileOverlayProviderData *v5;
  VKRasterTileOverlayProviderData *rasterTileProvider;
  RunLoopController *runLoopController;
  uint64_t var0;
  char v9;

  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  v5 = (VKRasterTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&p_rasterTileProviderLock->_lock);
  rasterTileProvider = self->_rasterTileProvider;

  if (rasterTileProvider == v5)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
}

- (void)rasterTileOverlayDidChangeAlpha:(id)a3
{
  RasterTileOverlayStyle *ptr;
  double v5;
  RunLoopController *runLoopController;
  uint64_t var0;
  VKRasterTileOverlayProviderData *v8;
  char v9;

  v8 = (VKRasterTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  if (self->_rasterTileProvider == v8)
  {
    ptr = self->_rasterStyle.__ptr_;
    -[VKRasterTileOverlayProviderData alpha](v8, "alpha");
    *(float *)&v5 = v5;
    *(_DWORD *)ptr = LODWORD(v5);
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&self->_rasterTileProviderLock._lock);

}

- (void)rasterTileOverlayNeedsInvalidate:(id)a3
{
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v6;
  __shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  p_standardContainer = &self->_standardContainer;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    p_standardContainer->__ptr_ = 0;
    p_standardContainer->__cntrl_ = 0;
    return;
  }
  v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (v6 && p_standardContainer->__ptr_)
  {
    md::OverlayContainer::invalidate((md::OverlayContainer *)p_standardContainer->__ptr_, self, 1, 0);
LABEL_8:
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    return;
  }
  v7 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  p_standardContainer->__cntrl_ = 0;
  if (v7)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  if (v6)
    goto LABEL_8;
}

- (void)customTileOverlayNeedsDisplay:(id)a3
{
  unfair_lock *p_customTileProviderLock;
  VKCustomTileOverlayProviderData *v5;
  VKCustomTileOverlayProviderData *customTileProvider;
  RunLoopController *runLoopController;
  uint64_t var0;
  char v9;

  p_customTileProviderLock = &self->_customTileProviderLock;
  v5 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&p_customTileProviderLock->_lock);
  customTileProvider = self->_customTileProvider;

  if (customTileProvider == v5)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
}

- (void)customTileOverlayDidChangeAlpha:(id)a3
{
  RasterTileOverlayStyle *ptr;
  double v5;
  RunLoopController *runLoopController;
  uint64_t var0;
  VKCustomTileOverlayProviderData *v8;
  char v9;

  v8 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  if (self->_customTileProvider == v8)
  {
    ptr = self->_customStyle.__ptr_;
    -[VKCustomTileOverlayProviderData alpha](v8, "alpha");
    *(float *)&v5 = v5;
    *(_DWORD *)ptr = LODWORD(v5);
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&self->_customTileProviderLock._lock);

}

- (void)customTileOverlayNeedsInvalidate:(id)a3
{
  weak_ptr<md::OverlayContainer> *p_standardContainer;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v6;
  __shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  p_standardContainer = &self->_standardContainer;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    p_standardContainer->__ptr_ = 0;
    p_standardContainer->__cntrl_ = 0;
    return;
  }
  v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (v6 && p_standardContainer->__ptr_)
  {
    md::OverlayContainer::invalidate((md::OverlayContainer *)p_standardContainer->__ptr_, self, 1, 0);
LABEL_8:
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    return;
  }
  v7 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  p_standardContainer->__cntrl_ = 0;
  if (v7)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  if (v6)
    goto LABEL_8;
}

- (void)customTileOverlayDidChangeDisplayRate:(id)a3
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *runLoopController;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  MapEngine *var0;
  VKCustomTileOverlayProviderData *v18;
  char v19;

  v18 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  if (self->_customTileProvider == v18 && self->_runLoopController)
  {
    v4 = -[VKCustomTileOverlayProviderData desiredDisplayRate](v18, "desiredDisplayRate");
    if (v4
      || -[VKCustomTileOverlayProviderData forceContinuousLayout](v18, "forceContinuousLayout")
      || -[VKCustomTileOverlayProviderData forceNativeDisplayRate](v18, "forceNativeDisplayRate"))
    {
      v5 = -[VKCustomTileOverlayProviderData forceNativeDisplayRate](v18, "forceNativeDisplayRate", v18);
      v6 = 60;
      if ((unint64_t)(v4 - 20) < 0xA)
        v6 = 20;
      if ((unint64_t)(v4 - 15) >= 5)
        v7 = v6;
      else
        v7 = 15;
      if ((unint64_t)(v4 - 5) >= 0xA)
        v8 = v7;
      else
        v8 = 5;
      if ((unint64_t)(v4 - 1) >= 4)
        v9 = v8;
      else
        v9 = 1;
      if (v5)
        v10 = -1;
      else
        v10 = v9;
      runLoopController = (uint64_t *)self->_runLoopController;
      v12 = runLoopController[1];
      v13 = -[VKCustomTileOverlayProviderData forceNativeDisplayRate](v18, "forceNativeDisplayRate");
      v14 = *runLoopController;
      if (*runLoopController)
      {
        v15 = v12 >= v10 ? v10 : v12;
        v16 = v12 == -1 ? v10 : v15;
        *(_QWORD *)(v14 + 1168) = v16;
        *(_BYTE *)(v14 + 1242) = v13;
        runLoopController[1] = v16;
        if (!**(_BYTE **)(v14 + 1056))
          md::MapEngine::setDisplayRate(v14, v16);
      }
      md::RunLoopController::setNeedsLayoutContinously((md::RunLoopController *)self->_runLoopController->var0, 1);
      var0 = self->_runLoopController->var0;
      if (var0)
      {
        v19 = 1;
        md::MapEngine::setNeedsTick((uint64_t)var0, &v19);
      }
    }
    else
    {
      md::RunLoopController::setNeedsLayoutContinously((md::RunLoopController *)self->_runLoopController->var0, 0);
    }
  }
  os_unfair_lock_unlock(&self->_customTileProviderLock._lock);

}

- (BOOL)canProvideVectorData
{
  return self->_canProvideVectorData;
}

- ($47F18235E17FF75F5C17F39635350F8F)replaceMapContentInRect
{
  double x;
  double y;
  double width;
  double height;
  $47F18235E17FF75F5C17F39635350F8F result;

  x = self->_replaceMapContentInRect.origin.x;
  y = self->_replaceMapContentInRect.origin.y;
  width = self->_replaceMapContentInRect.size.width;
  height = self->_replaceMapContentInRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setReplaceMapContentInRect:(id)a3
{
  self->_replaceMapContentInRect = ($B15126825004F4193EADBFFC71D2DA44)a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)fallbackable
{
  return self->_fallbackable;
}

- (void)setFallbackable:(unint64_t)a3
{
  self->_fallbackable = a3;
}

- (RunLoopController)runLoopController
{
  return self->_runLoopController;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (shared_ptr<md::RasterTileOverlayStyle>)rasterStyle
{
  RasterTileOverlayStyle **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::RasterTileOverlayStyle> result;

  cntrl = self->_rasterStyle.__cntrl_;
  *v2 = self->_rasterStyle.__ptr_;
  v2[1] = (RasterTileOverlayStyle *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RasterTileOverlayStyle *)self;
  return result;
}

- (shared_ptr<md::RasterTileOverlayStyle>)customStyle
{
  RasterTileOverlayStyle **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::RasterTileOverlayStyle> result;

  cntrl = self->_customStyle.__cntrl_;
  *v2 = self->_customStyle.__ptr_;
  v2[1] = (RasterTileOverlayStyle *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RasterTileOverlayStyle *)self;
  return result;
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (BOOL)forceRasterizationForGlobe
{
  return self->_forceRasterizationForGlobe;
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
  __shared_weak_count *v10;

  cntrl = self->_customStyle.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_customTileProvider, 0);
  v6 = self->_rasterStyle.__cntrl_;
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
  objc_storeStrong((id *)&self->_rasterTileProvider, 0);
  objc_storeStrong((id *)&self->_vectorData, 0);
  v9 = self->_standardContainer.__cntrl_;
  if (v9)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
  v10 = self->_flyoverContainer.__cntrl_;
  if (v10)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 32) = 0;
  *((_DWORD *)self + 36) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_DWORD *)self + 44) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

@end
