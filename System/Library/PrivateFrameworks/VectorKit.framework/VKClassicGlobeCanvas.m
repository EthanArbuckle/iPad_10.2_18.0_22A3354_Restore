@implementation VKClassicGlobeCanvas

- (BOOL)useNewRenderPath
{
  return 1;
}

- (VKARCameraController)arCameraController
{
  VKARCameraController *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  void *mapEngine;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  VKARCameraController *v13;
  VKARCameraController *arCameraController;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  VKARCameraController *v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  Camera *v25;
  __shared_weak_count *v26;
  TaskContext *ptr;
  __shared_weak_count *v28;

  if (!self->_arCameraController)
  {
    v4 = [VKARCameraController alloc];
    cntrl = self->super._taskContext.__cntrl_;
    ptr = self->super._taskContext.__ptr_;
    v28 = cntrl;
    if (cntrl)
    {
      v6 = (unint64_t *)((char *)cntrl + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    mapEngine = self->super._mapEngine;
    v9 = *((_QWORD *)mapEngine + 113);
    v10 = *((_QWORD *)mapEngine + 14);
    v11 = *((_QWORD *)mapEngine + 15);
    v12 = *((id *)mapEngine + 138);
    v13 = -[VKARCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:](v4, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:", &ptr, v9, v10, v11, v12);
    arCameraController = self->_arCameraController;
    self->_arCameraController = v13;

    v15 = (std::__shared_weak_count *)v28;
    if (v28)
    {
      v16 = (unint64_t *)((char *)v28 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    -[VKARCameraController setGlobeView:](self->_arCameraController, "setGlobeView:", self->_globe);
    -[VKARCameraController setMapEngine:](self->_arCameraController, "setMapEngine:", self->_engine);
    v18 = self->_arCameraController;
    v19 = self->super._camera.__cntrl_;
    v25 = self->super._camera.__ptr_;
    v26 = v19;
    if (v19)
    {
      v20 = (unint64_t *)((char *)v19 + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    -[VKARCameraController setCamera:](v18, "setCamera:", &v25);
    v22 = (std::__shared_weak_count *)v26;
    if (v26)
    {
      v23 = (unint64_t *)((char *)v26 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  return self->_arCameraController;
}

- (void)enterARSessionAtCoordinate:(id)a3
{
  double var1;
  double var0;
  void *v6;
  VKARCameraController *arCameraController;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  md::LabelManager *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *globe;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _QWORD v26[5];
  objc_super v27;
  _QWORD v28[3];
  _QWORD *v29;
  uint64_t v30;

  var1 = a3.var1;
  var0 = a3.var0;
  v30 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas enterARSessionAtCoordinate:](&v27, sel_enterARSessionAtCoordinate_);
  if (+[MDARController isSupported](MDARController, "isSupported"))
  {
    -[VKClassicGlobeCanvas arCameraController](self, "arCameraController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKScreenCanvas setCameraController:](self, "setCameraController:", v6);

    arCameraController = self->_arCameraController;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __51__VKClassicGlobeCanvas_enterARSessionAtCoordinate___block_invoke;
    v26[3] = &unk_1E42F3E78;
    v26[4] = self;
    -[VKARCameraController trasitionToARModeAtCoordinate:withDuration:completion:](arCameraController, "trasitionToARModeAtCoordinate:withDuration:completion:", v26, var0, var1, 1.5);
  }
  else
  {
    -[VKClassicGlobeCanvas globeCameraController](self, "globeCameraController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKScreenCanvas setCameraController:](self, "setCameraController:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "map:didEnterARMode:", self, 1);

    }
  }
  v12 = *(_QWORD *)-[VKClassicGlobeCanvas _clientStyleState](self, "_clientStyleState");
  if (v12)
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v12, 0x10046u, 1);
  v13 = *((_QWORD *)self->super._mapEngine + 140);
  v14 = *(_QWORD *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    v16 = 0x20A1ED17D78F322BLL;
    if (v14 <= 0x20A1ED17D78F322BLL)
      v16 = 0x20A1ED17D78F322BLL % v14;
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * v16);
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x20A1ED17D78F322BLL);
    }
    while (v15[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * ((v14 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x20A1ED17D78F322BLL);
    }
    while (v15[2] != 0x20A1ED17D78F322BLL);
  }
  v17 = *(md::LabelManager **)(**(_QWORD **)(v15[5] + 144) + 24);
  v28[0] = &off_1E42C93B0;
  v28[1] = v17;
  v28[2] = 1;
  v29 = v28;
  md::LabelManager::queueCommand(v17, 48, 1, v28);
  v18 = v29;
  if (v29 == v28)
  {
    v19 = 4;
    v18 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_22;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_22:
  self->_arRoadDisabledState = -[VKClassicGlobeCanvas disableRoads](self, "disableRoads");
  -[VKClassicGlobeCanvas setDisableRoads:](self, "setDisableRoads:", 1);
  globe = self->_globe;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "enableAROmniTileLoader");
  v23 = globe[65];
  if (v23)
  {
    v24 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v23 + 24))(v23, 0, 0xFFFFFFFFLL);
    if (v22)
      v25 = 3;
    else
      v25 = 0;
    *(_DWORD *)(v24 + 1296) = v25;
  }

  *(_DWORD *)(*(_QWORD *)(*((_QWORD *)self->_globe + 107) + 136) + 52) = 1008981770;
}

- (void)exitARSession
{
  _QWORD *globe;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  md::LabelManager *v10;
  _QWORD *v11;
  uint64_t v12;
  VKARCameraController *arCameraController;
  void *v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  uint64_t v23;
  objc_super v24;
  char v25;
  _QWORD v26[3];
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VKClassicGlobeCanvas setDisableRoads:](self, "setDisableRoads:", self->_arRoadDisabledState);
  globe = self->_globe;
  v4 = globe[65];
  if (v4)
  {
    *(_DWORD *)((*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v4 + 24))(v4, 0, 0xFFFFFFFFLL)
              + 1296) = 0;
    globe = self->_globe;
  }
  *(_DWORD *)(*(_QWORD *)(globe[107] + 136) + 52) = 1036831949;
  v5 = *(_QWORD *)-[VKClassicGlobeCanvas _clientStyleState](self, "_clientStyleState");
  if (v5)
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v5, 0x10046u, 0);
  v6 = *((_QWORD *)self->super._mapEngine + 140);
  v7 = *(_QWORD *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    v9 = 0x20A1ED17D78F322BLL;
    if (v7 <= 0x20A1ED17D78F322BLL)
      v9 = 0x20A1ED17D78F322BLL % v7;
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * v9);
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x20A1ED17D78F322BLL);
    }
    while (v8[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * ((v7 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x20A1ED17D78F322BLL);
    }
    while (v8[2] != 0x20A1ED17D78F322BLL);
  }
  v10 = *(md::LabelManager **)(**(_QWORD **)(v8[5] + 144) + 24);
  v26[0] = &off_1E42C93B0;
  v26[1] = v10;
  v26[2] = 0;
  v27 = v26;
  md::LabelManager::queueCommand(v10, 48, 1, v26);
  v11 = v27;
  if (v27 == v26)
  {
    v12 = 4;
    v11 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_20;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_20:
  -[VKScreenCanvas setCameraController:](self, "setCameraController:", self->_globeCameraController);
  arCameraController = self->_arCameraController;
  self->_arCameraController = 0;

  v14 = self->_globe;
  (*(void (**)(_QWORD *__return_ptr, void *))(*(_QWORD *)v14 + 48))(v26, v14);
  v15 = *(double *)v26;
  *((_QWORD *)v14 + 35) = v26[0];
  v16 = tan(v15 * 0.5);
  *((double *)v14 + 36) = v16;
  v17 = (double *)*((_QWORD *)v14 + 9);
  v19 = v17[46];
  v18 = v17[47];
  if (v18 < v19)
  {
    v20 = v18 * v19;
    v21 = v19 / v18;
    if (v20 <= 0.0)
      v21 = 1.0;
    v22 = atan(v21 * v16);
    v15 = v22 + v22;
  }
  v17[57] = v15;
  v23 = **(_QWORD **)(*((_QWORD *)v14 + 107) + 88);
  if (v23)
  {
    v25 = 7;
    md::MapEngine::setNeedsTick(v23, &v25);
  }
  v24.receiver = self;
  v24.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas exitARSession](&v24, sel_exitARSession);
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  return 1;
}

- (void)setMapType:(int)a3
{
  -[VKClassicGlobeCanvas setMapType:animated:](self, "setMapType:animated:", *(_QWORD *)&a3, 1);
}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  _BYTE *globe;
  uint64_t v7;
  char *v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;

  if (a3 == 3)
    goto LABEL_11;
  if (a3 != 4)
  {
    if (a3 == 10)
    {
      globe = self->_globe;
      globe[432] = 0;
      v7 = **(_QWORD **)(*((_QWORD *)globe + 107) + 88);
      if (!v7)
        goto LABEL_16;
      v23 = 7;
      v8 = &v23;
      goto LABEL_15;
    }
    v10 = *(_QWORD *)self->_overlayContainer.__ptr_;
    if (v10)
      md::realistic::OverlayRenderLayer::clearOverlays(*(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(v10 + 856) + 40)
                                                                                             + 48));
LABEL_11:
    v11 = self->_globe;
    v11[432] = 0;
    v12 = **(_QWORD **)(*((_QWORD *)v11 + 107) + 88);
    if (v12)
    {
      v22 = 7;
      md::MapEngine::setNeedsTick(v12, &v22);
    }
    goto LABEL_17;
  }
  v9 = self->_globe;
  if (self->_disableRoads)
  {
    v9[432] = 0;
    v7 = **(_QWORD **)(*((_QWORD *)v9 + 107) + 88);
    if (!v7)
      goto LABEL_16;
    v20 = 7;
    v8 = &v20;
  }
  else
  {
    v9[432] = 1;
    v7 = **(_QWORD **)(*((_QWORD *)v9 + 107) + 88);
    if (!v7)
      goto LABEL_16;
    v21 = 7;
    v8 = &v21;
  }
LABEL_15:
  md::MapEngine::setNeedsTick(v7, v8);
LABEL_16:
  if (self->_disableLabels)
  {
LABEL_17:
    altitude::GlobeView::disableLabelData((altitude::GlobeView *)self->_globe);
    goto LABEL_18;
  }
  v13 = self->_globe;
  v13[433] = 1;
  v14 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v13 + 107) + 40) + 40);
  (*(void (**)(uint64_t, uint64_t, _QWORD, BOOL))(*(_QWORD *)v14 + 40))(v14, 1, 0, a4);
  v15 = *(_QWORD **)(*(_QWORD *)(*((_QWORD *)v13 + 107) + 40) + 40);
  v16 = v15[12];
  if (v16)
    atomic_store(1u, (unsigned __int8 *)(v16 + 224));
  v17 = v15[10];
  if (v17)
    atomic_store(1u, (unsigned __int8 *)(v17 + 224));
  v18 = v15[11];
  if (v18)
    atomic_store(1u, (unsigned __int8 *)(v18 + 224));
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v13 + 107) + 40) + 40) + 56);
  if (v19)
    *(_BYTE *)(v19 + 136) = 1;
LABEL_18:
  self->_mapType = a3;
  -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
}

- (void)stopLoading
{
  if (self->_isDownloading)
  {
    self->_isDownloading = 0;
    (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
  }
}

- (VKClassicGlobeCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  VKClassicGlobeCanvas *v5;
  _QWORD *v6;
  uint64_t v12;
  uint64_t v13;
  FlyoverLibrary *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v19;
  BOOL *v20;
  __shared_weak_count *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  VKGlobeCameraController *v25;
  __shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  void *mapEngine;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  VKGlobeCameraController *globeCameraController;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  int8x8_t *v40;
  int8x8_t v41;
  uint8x8_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  md::GlobeAdapter *value;
  unint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  GlobeOverlayContainer *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  NSObject *v64;
  _QWORD *globe;
  VKClassicGlobeCanvas *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  int8x8_t *v75;
  int8x8_t v76;
  uint8x8_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  md::StyleLogic *v84;
  uint64_t *v85;
  void *v86;
  id *v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  id v91;
  unint64_t *v92;
  unint64_t v93;
  float v94;
  void *v95;
  double v96;
  _BOOL4 altitudePauseLoading;
  void *v98;
  _BOOL4 altitudeFreezeViewNode;
  void *v100;
  _BOOL4 altitudeTexturePaging;
  void *v102;
  _BOOL4 altitudeShowTileBounds;
  void *v104;
  float tileQualityThreshold;
  void *v106;
  double v107;
  float hideMeshTime;
  void *v109;
  double v110;
  float fadeSpeed;
  void *v112;
  double v113;
  _BOOL4 tourSpeedup;
  void *v115;
  float tourSpeedupFactor;
  void *v117;
  double v118;
  VKClassicGlobeCanvas *v119;
  _QWORD block[4];
  VKClassicGlobeCanvas *v122;
  _QWORD v123[2];
  TaskContext *ptr;
  std::__shared_weak_count *v125;
  objc_super v126;
  _QWORD v127[3];
  _QWORD *v128;
  _QWORD v129[3];
  _QWORD *v130;
  _QWORD v131[3];
  _QWORD *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v126.receiver = self;
  v126.super_class = (Class)VKClassicGlobeCanvas;
  v5 = -[VKScreenCanvas initWithMapEngine:inBackground:](&v126, sel_initWithMapEngine_inBackground_, a3, a4);

  if (!v5)
    goto LABEL_117;
  v5->_engine = a3;
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKClassicGlobeCanvas initWithMapEngine:inBackground:]");
  md::MapEngine::createFlyoverRenderer((uint64_t)v5->_engine);
  v6 = (_QWORD *)*((_QWORD *)a3 + 108);
  __asm { FMOV            V0.2D, #-1.0 }
  v5->_lastCanvasSize = _Q0;
  v12 = *(_QWORD *)(*((_QWORD *)a3 + 3) + 24);
  v14 = *(FlyoverLibrary **)(v12 + 32);
  v13 = *(_QWORD *)(v12 + 40);
  if (v13)
  {
    v15 = (unint64_t *)(v13 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  cntrl = (std::__shared_weak_count *)v5->_flyoverLibrary.__cntrl_;
  v5->_flyoverLibrary.__ptr_ = v14;
  v5->_flyoverLibrary.__cntrl_ = (__shared_weak_count *)v13;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v20 = (BOOL *)operator new();
  *v20 = 0;
  v21 = (__shared_weak_count *)operator new();
  *(_QWORD *)v21 = &off_1E42E8E50;
  *((_QWORD *)v21 + 1) = 0;
  *((_QWORD *)v21 + 2) = 0;
  *((_QWORD *)v21 + 3) = v20;
  v22 = (std::__shared_weak_count *)v5->_isDead.__cntrl_;
  v5->_isDead.__ptr_ = v20;
  v5->_isDead.__cntrl_ = v21;
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v5->_loadingStatusTracker = (void *)*((_QWORD *)a3 + 142);
  v5->_currentZoomLevel = 0.0;
  v25 = [VKGlobeCameraController alloc];
  v26 = v5->super._taskContext.__cntrl_;
  ptr = v5->super._taskContext.__ptr_;
  v125 = (std::__shared_weak_count *)v26;
  if (v26)
  {
    v27 = (unint64_t *)((char *)v26 + 8);
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  mapEngine = v5->super._mapEngine;
  v30 = *((_QWORD *)mapEngine + 113);
  v31 = *((_QWORD *)mapEngine + 14);
  v32 = *((_QWORD *)mapEngine + 15);
  v33 = *((id *)mapEngine + 138);
  v34 = -[VKGlobeCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:](v25, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:", &ptr, v30, v31, v32, v33);
  globeCameraController = v5->_globeCameraController;
  v5->_globeCameraController = (VKGlobeCameraController *)v34;

  v36 = v125;
  if (v125)
  {
    v37 = (unint64_t *)&v125->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = operator new();
  v40 = (int8x8_t *)*((_QWORD *)v5->super._mapEngine + 140);
  v41 = v40[2];
  if (!*(_QWORD *)&v41)
    goto LABEL_43;
  v42 = (uint8x8_t)vcnt_s8(v41);
  v42.i16[0] = vaddlv_u8(v42);
  if (v42.u32[0] > 1uLL)
  {
    v43 = 0x20A1ED17D78F322BLL;
    if (*(_QWORD *)&v41 <= 0x20A1ED17D78F322BuLL)
      v43 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v41;
  }
  else
  {
    v43 = (*(_QWORD *)&v41 - 1) & 0x20A1ED17D78F322BLL;
  }
  v44 = *(_QWORD **)(*(_QWORD *)&v40[1] + 8 * v43);
  if (!v44 || (v45 = (_QWORD *)*v44) == 0)
  {
LABEL_43:
    v49 = 0;
    goto LABEL_44;
  }
  if (v42.u32[0] < 2uLL)
  {
    v46 = *(_QWORD *)&v41 - 1;
    while (1)
    {
      v48 = v45[1];
      if (v48 == 0x20A1ED17D78F322BLL)
      {
        if (v45[2] == 0x20A1ED17D78F322BLL)
          goto LABEL_118;
      }
      else if ((v48 & v46) != v43)
      {
        goto LABEL_43;
      }
      v45 = (_QWORD *)*v45;
      if (!v45)
        goto LABEL_43;
    }
  }
  while (1)
  {
    v47 = v45[1];
    if (v47 == 0x20A1ED17D78F322BLL)
      break;
    if (v47 >= *(_QWORD *)&v41)
      v47 %= *(_QWORD *)&v41;
    if (v47 != v43)
      goto LABEL_43;
LABEL_33:
    v45 = (_QWORD *)*v45;
    if (!v45)
      goto LABEL_43;
  }
  if (v45[2] != 0x20A1ED17D78F322BLL)
    goto LABEL_33;
LABEL_118:
  v49 = v45[5];
LABEL_44:
  v50 = md::LabelsLogic::labelManagerForWorldType(v49, 1u);
  v51 = (std::__shared_weak_count *)*((_QWORD *)v50 + 1);
  v123[0] = *(_QWORD *)v50;
  v123[1] = v51;
  if (v51)
  {
    v52 = (unint64_t *)&v51->__shared_owners_;
    do
      v53 = __ldxr(v52);
    while (__stxr(v53 + 1, v52));
  }
  md::GlobeAdapter::GlobeAdapter(v39, v123);
  value = (md::GlobeAdapter *)v5->_globeAdapter.__ptr_.__value_;
  v5->_globeAdapter.__ptr_.__value_ = (GlobeAdapter *)v39;
  if (value)
  {
    md::GlobeAdapter::~GlobeAdapter(value);
    MEMORY[0x1A1AF4E00]();
  }
  if (v51)
  {
    v55 = (unint64_t *)&v51->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v5->_mapType = 1;
  v5->_initialized = 0;
  v5->_globe = (void *)v6[16];
  v58 = (GlobeOverlayContainer *)v6[23];
  v57 = v6[24];
  if (v57)
  {
    v59 = (unint64_t *)(v57 + 8);
    do
      v60 = __ldxr(v59);
    while (__stxr(v60 + 1, v59));
  }
  v61 = (std::__shared_weak_count *)v5->_overlayContainer.__cntrl_;
  v5->_overlayContainer.__ptr_ = v58;
  v5->_overlayContainer.__cntrl_ = (__shared_weak_count *)v57;
  if (v61)
  {
    v62 = (unint64_t *)&v61->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  -[VKClassicGlobeCanvas updateCameraForFrameResize](v5, "updateCameraForFrameResize");
  -[VKClassicGlobeCanvas enableTileAnalytics](v5, "enableTileAnalytics");
  -[VKClassicGlobeCanvas setupMapScene](v5, "setupMapScene");
  -[VKGlobeCameraController setGlobeView:](v5->_globeCameraController, "setGlobeView:", v5->_globe);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[VKScreenCanvas setCameraController:](v5, "setCameraController:", v5->_globeCameraController);
  }
  else
  {
    v64 = *(id *)v5->super._taskContext.__ptr_;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__VKClassicGlobeCanvas_initWithMapEngine_inBackground___block_invoke;
    block[3] = &unk_1E42F6DA0;
    v122 = v5;
    dispatch_async(v64, block);

  }
  globe = v5->_globe;
  v66 = v5;
  v127[0] = &off_1E42C7CE8;
  v127[1] = v66;
  v128 = v127;
  v67 = *(_QWORD *)(globe[107] + 136);
  v130 = v129;
  std::__function::__func<-[VKClassicGlobeCanvas initWithMapEngine:inBackground:]::$_0,std::allocator<-[VKClassicGlobeCanvas initWithMapEngine:inBackground:]::$_0>,void ()(void)>::__clone((uint64_t)v127, v129);
  v68 = (uint64_t)v130;
  if (v130)
  {
    if (v130 != v129)
    {
      v68 = (*(uint64_t (**)(void))(*v130 + 16))();
      goto LABEL_68;
    }
    v132 = v131;
    (*(void (**)(_QWORD *, _QWORD *))(v129[0] + 24))(v129, v131);
  }
  else
  {
LABEL_68:
    v132 = (_QWORD *)v68;
  }
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v131, (_QWORD *)(v67 + 136));
  v69 = v132;
  if (v132 == v131)
  {
    v70 = 4;
    v69 = v131;
LABEL_74:
    (*(void (**)(void))(*v69 + 8 * v70))();
  }
  else if (v132)
  {
    v70 = 5;
    goto LABEL_74;
  }
  v71 = v130;
  if (v130 == v129)
  {
    v72 = 4;
    v71 = v129;
LABEL_79:
    (*(void (**)(void))(*v71 + 8 * v72))();
  }
  else if (v130)
  {
    v72 = 5;
    goto LABEL_79;
  }
  v73 = v128;
  if (v128 == v127)
  {
    v74 = 4;
    v73 = v127;
LABEL_84:
    (*(void (**)(void))(*v73 + 8 * v74))();
  }
  else if (v128)
  {
    v74 = 5;
    goto LABEL_84;
  }
  v75 = (int8x8_t *)*((_QWORD *)a3 + 140);
  v76 = v75[2];
  if (!*(_QWORD *)&v76)
    goto LABEL_105;
  v77 = (uint8x8_t)vcnt_s8(v76);
  v77.i16[0] = vaddlv_u8(v77);
  if (v77.u32[0] > 1uLL)
  {
    v78 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v76 <= 0x2FED70A4459DFCA1uLL)
      v78 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v76;
  }
  else
  {
    v78 = (*(_QWORD *)&v76 - 1) & 0x2FED70A4459DFCA1;
  }
  v79 = *(_QWORD **)(*(_QWORD *)&v75[1] + 8 * v78);
  if (!v79 || (v80 = (_QWORD *)*v79) == 0)
  {
LABEL_105:
    v84 = 0;
    goto LABEL_106;
  }
  if (v77.u32[0] < 2uLL)
  {
    v81 = *(_QWORD *)&v76 - 1;
    while (1)
    {
      v83 = v80[1];
      if (v83 == 0x2FED70A4459DFCA1)
      {
        if (v80[2] == 0x2FED70A4459DFCA1)
          goto LABEL_119;
      }
      else if ((v83 & v81) != v78)
      {
        goto LABEL_105;
      }
      v80 = (_QWORD *)*v80;
      if (!v80)
        goto LABEL_105;
    }
  }
  while (2)
  {
    v82 = v80[1];
    if (v82 != 0x2FED70A4459DFCA1)
    {
      if (v82 >= *(_QWORD *)&v76)
        v82 %= *(_QWORD *)&v76;
      if (v82 != v78)
        goto LABEL_105;
      goto LABEL_95;
    }
    if (v80[2] != 0x2FED70A4459DFCA1)
    {
LABEL_95:
      v80 = (_QWORD *)*v80;
      if (!v80)
        goto LABEL_105;
      continue;
    }
    break;
  }
LABEL_119:
  v84 = (md::StyleLogic *)v80[5];
LABEL_106:
  v85 = (uint64_t *)md::StyleLogic::globeContext(v84);
  altitude::GlobeView::setStyleManager((altitude::GlobeView *)v5->_globe, *v85, v85[1]);
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (id *)*((_QWORD *)a3 + 1);
  v88 = (std::__shared_weak_count *)*((_QWORD *)a3 + 2);
  v131[0] = v87;
  v131[1] = v88;
  if (v88)
  {
    v89 = (unint64_t *)&v88->__shared_owners_;
    do
      v90 = __ldxr(v89);
    while (__stxr(v90 + 1, v89));
  }
  v91 = *v87;
  objc_msgSend(v86, "addTileGroupObserver:queue:", v66, v91);

  if (v88)
  {
    v92 = (unint64_t *)&v88->__shared_owners_;
    do
      v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
      std::__shared_weak_count::__release_weak(v88);
    }
  }

  v94 = *(float *)(*((_QWORD *)v5->_globe + 86) + 200);
  v66->_debugSettings.lodScale = v94;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v96 = v94;
  objc_msgSend(v95, "setAltitudeLodScale:", v96);

  altitudePauseLoading = v66->_debugSettings.altitudePauseLoading;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setAltitudePauseLoading:", altitudePauseLoading);

  altitudeFreezeViewNode = v66->_debugSettings.altitudeFreezeViewNode;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setAltitudeFreezeViewNode:", altitudeFreezeViewNode);

  altitudeTexturePaging = v66->_debugSettings.altitudeTexturePaging;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setAltitudeTexturePaging:", altitudeTexturePaging);

  altitudeShowTileBounds = v66->_debugSettings.altitudeShowTileBounds;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setAltitudeShowTileBounds:", altitudeShowTileBounds);

  tileQualityThreshold = v66->_debugSettings.tileQualityThreshold;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v107 = tileQualityThreshold;
  objc_msgSend(v106, "setAltitudeTileQualityThreshold:", v107);

  hideMeshTime = v66->_debugSettings.hideMeshTime;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v110 = hideMeshTime;
  objc_msgSend(v109, "setAltitudeHideMeshTime:", v110);

  fadeSpeed = v66->_debugSettings.fadeSpeed;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v113 = fadeSpeed;
  objc_msgSend(v112, "setAltitudeFadeSpeed:", v113);

  tourSpeedup = v66->_debugSettings.tourSpeedup;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setAltitudeTourSpeedup:", tourSpeedup);

  tourSpeedupFactor = v66->_debugSettings.tourSpeedupFactor;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v118 = tourSpeedupFactor;
  objc_msgSend(v117, "setAltitudeTourSpeedupFactor:", v118);

  -[VKClassicGlobeCanvas updateCameraForFrameResize](v66, "updateCameraForFrameResize");
  v5->_initialized = 1;
  if (*v85)
    md::LabelManager::setStyleManager(*((md::LabelManager **)v5->_globeAdapter.__ptr_.__value_ + 10), *v85, v85[1]);
  md::GlobeAdapter::setGlobeView((md::GlobeAdapter *)v5->_globeAdapter.__ptr_.__value_, (altitude::GlobeView *)v5->_globe);
  v119 = v66;
LABEL_117:

  return v5;
}

- (void)willDealloc
{
  GlobeAdapter *value;
  GlobeAdapter *v4;
  VKARCameraController *arCameraController;
  VKGlobeCameraController *globeCameraController;
  VKGlobeCameraController *v7;

  value = self->_globeAdapter.__ptr_.__value_;
  if (value)
  {
    md::GlobeAdapter::setGlobeView((md::GlobeAdapter *)value, 0);
    v4 = self->_globeAdapter.__ptr_.__value_;
    self->_globeAdapter.__ptr_.__value_ = 0;
    if (v4)
    {
      md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)v4);
      MEMORY[0x1A1AF4E00]();
    }
  }
  arCameraController = self->_arCameraController;
  self->_arCameraController = 0;

  globeCameraController = self->_globeCameraController;
  if (globeCameraController)
  {
    -[VKScreenCameraController stopAnimations](globeCameraController, "stopAnimations");
    -[VKCameraController setCameraDelegate:](self->_globeCameraController, "setCameraDelegate:", 0);
    -[VKGlobeCameraController setGlobeView:](self->_globeCameraController, "setGlobeView:", 0);
    v7 = self->_globeCameraController;
    self->_globeCameraController = 0;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[VKClassicGlobeCanvas willDealloc](self, "willDealloc");
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  *self->_isDead.__ptr_ = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas dealloc](&v5, sel_dealloc);
}

- (id)consoleString:(BOOL)a3
{
  md::HomeQueueScheduler **engine;
  void *globe;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  int64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  _QWORD **v17;
  BOOL v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  void *v25;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  double *v35;
  long double v36;
  long double v37;
  long double v38;
  double v39;
  double v40;
  __double2 v41;
  long double v42;
  long double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD *v48;
  std::ios_base *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  size_t v55;
  void **v56;
  unint64_t v57;
  uint64_t v58;
  const void **v59;
  const void *v60;
  uint64_t v61;
  uint64_t v62;
  void **v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v74;
  void *v75;
  void *__dst[2];
  int64_t v77;
  _QWORD **v78;
  _QWORD *v79[2];
  _QWORD v80[3];
  uint64_t v81;
  unint64_t v82;
  void *__p[2];
  __int128 v84;
  int v85;
  uint64_t v86[20];

  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas consoleString:]");
  if (!engine[108])
  {
    v19 = &stru_1E4315B30;
    goto LABEL_49;
  }
  globe = self->_globe;
  v6 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)globe + 57) + 56))(*((_QWORD *)globe + 57));
  v8 = *(const void **)v6;
  v7 = *(_QWORD *)(v6 + 8);
  v9 = v7 - *(_QWORD *)v6;
  if (v7 == *(_QWORD *)v6)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v20 = 0xFFFFFFFFLL;
    v21 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (v9 < 0)
    abort();
  v10 = (char *)operator new(v7 - *(_QWORD *)v6);
  v11 = &v10[8 * (v9 >> 3)];
  memcpy(v10, v8, v9);
  v12 = v10;
  while (1)
  {
    v13 = *(_QWORD *)(*(_QWORD *)v12 + 328);
    if (*(_BYTE *)(v13 + 296))
      goto LABEL_6;
    v79[0] = 0;
    v79[1] = 0;
    v78 = v79;
    std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v78, *(_QWORD **)(v13 + 24), (_QWORD *)(v13 + 32));
    v14 = (uint64_t)v78;
    if (v78 != v79)
      break;
LABEL_5:
    std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v79[0]);
LABEL_6:
    v12 += 8;
    if (v12 == v11)
    {
      LOWORD(v9) = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v20 = 0xFFFFFFFFLL;
      v21 = 0xFFFFFFFFLL;
      goto LABEL_21;
    }
  }
  while (1)
  {
    v15 = *(_DWORD *)(v14 + 28);
    if (v15 == 15 || v15 == 42)
      break;
    v16 = *(_QWORD **)(v14 + 8);
    if (v16)
    {
      do
      {
        v17 = (_QWORD **)v16;
        v16 = (_QWORD *)*v16;
      }
      while (v16);
    }
    else
    {
      do
      {
        v17 = *(_QWORD ***)(v14 + 16);
        v18 = *v17 == (_QWORD *)v14;
        v14 = (uint64_t)v17;
      }
      while (!v18);
    }
    v14 = (uint64_t)v17;
    if (v17 == v79)
      goto LABEL_5;
  }
  v20 = *(unsigned int *)(v14 + 32);
  v21 = *(unsigned int *)(v14 + 40);
  LOWORD(v9) = *(_WORD *)(v13 + 298);
  v22 = *(_WORD *)(v13 + 300);
  v23 = *(_WORD *)(v13 + 302);
  v24 = *(_WORD *)(v13 + 304);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v79[0]);
LABEL_21:
  operator delete(v10);
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Flyover region: %d version: %d C3M version: %d.%d C3MM version: %d.%d\n"), v20, v21, (__int16)v9, v22, v23, v24);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E4315B30, "stringByAppendingString:", v75);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (unsigned int *)*((_QWORD *)globe + 56);
  if (v26)
  {
    v27 = v26[88];
    v28 = v26[82];
    v29 = v26[97];
    v30 = v26[46];
    v31 = v26[95];
    LODWORD(v26) = v31 / v30;
    v32 = v29 / v28;
  }
  else
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v31 = 0;
    v30 = 0;
    v32 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tiles: %d BaseSurface: %d (%d kB, avg: %d kB) Geometry: %d (%d kB, avg: %d kB)\n"), v27, v28, v29 >> 10, v32 >> 10, v30, v31 >> 10, v26 >> 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingString:", v33);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)globe + 66) + 24))(*((_QWORD *)globe + 66), 0, 0xFFFFFFFFLL);
  v35 = (double *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(v34 + 40) + 24))(v34 + 40);
  v37 = v35[1];
  v36 = v35[2];
  v38 = *v35;
  v39 = sqrt(v38 * v38 + v37 * v37);
  v40 = atan2(v36, v39 * 0.996647189);
  v41 = __sincos_stret(v40);
  v42 = atan2(v36 + v41.__sinval * v41.__sinval * 42841.3115 * v41.__sinval, v39 + v41.__cosval * v41.__cosval * -42697.6727 * v41.__cosval);
  v43 = tan(v42 * 0.5 + 0.785398163);
  log(v43);
  atan2(v37, v38);
  v44 = MEMORY[0x1E0DE4FE0];
  v45 = MEMORY[0x1E0DE4FE0] + 64;
  v46 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v47 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v48 = *(_QWORD **)(MEMORY[0x1E0DE4F60] + 16);
  v86[0] = MEMORY[0x1E0DE4FE0] + 64;
  v78 = (_QWORD **)v47;
  *(_QWORD **)((char *)&v79[-1] + *(_QWORD *)(v47 - 24)) = v48;
  v49 = (std::ios_base *)((char *)&v79[-1] + (_QWORD)*(v78 - 3));
  std::ios_base::init(v49, v79);
  v49[1].__vftable = 0;
  v49[1].__fmtflags_ = -1;
  v78 = (_QWORD **)(v44 + 24);
  v86[0] = v45;
  std::streambuf::basic_streambuf();
  v50 = MEMORY[0x1E0DE4FB8];
  v79[0] = (_QWORD *)(MEMORY[0x1E0DE4FB8] + 16);
  *(_OWORD *)__p = 0u;
  v84 = 0u;
  v85 = 16;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v78, (uint64_t)"level: ", 7);
  v51 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v51, (uint64_t)"  lat: ", 7);
  v52 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v52, (uint64_t)"  lon: ", 7);
  v53 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v53, (uint64_t)"  height: ", 10);
  std::ostream::operator<<();
  v54 = (void *)MEMORY[0x1E0CB3940];
  if ((v85 & 0x10) != 0)
  {
    v57 = *((_QWORD *)&v84 + 1);
    if (*((_QWORD *)&v84 + 1) < v82)
    {
      *((_QWORD *)&v84 + 1) = v82;
      v57 = v82;
    }
    v58 = v50;
    v59 = (const void **)&v81;
  }
  else
  {
    if ((v85 & 8) == 0)
    {
      v55 = 0;
      HIBYTE(v77) = 0;
      v56 = __dst;
      goto LABEL_42;
    }
    v58 = v50;
    v59 = (const void **)v80;
    v57 = v80[2];
  }
  v60 = *v59;
  v55 = v57 - (_QWORD)*v59;
  if (v55 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v55 >= 0x17)
  {
    v61 = (v55 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v55 | 7) != 0x17)
      v61 = v55 | 7;
    v62 = v61 + 1;
    v56 = (void **)operator new(v61 + 1);
    __dst[1] = (void *)v55;
    v77 = v62 | 0x8000000000000000;
    __dst[0] = v56;
  }
  else
  {
    HIBYTE(v77) = v57 - *(_BYTE *)v59;
    v56 = __dst;
    if (!v55)
      goto LABEL_41;
  }
  memmove(v56, v60, v55);
LABEL_41:
  v50 = v58;
LABEL_42:
  *((_BYTE *)v56 + v55) = 0;
  v63 = __dst;
  if (v77 < 0)
    v63 = (void **)__dst[0];
  objc_msgSend(v54, "stringWithFormat:", CFSTR("Tile id at camera position: %s\n"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v77) < 0)
    operator delete(__dst[0]);
  objc_msgSend(v74, "stringByAppendingString:", v64);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v78 = (_QWORD **)*v46;
  *(_QWORD **)((char *)&v79[-1] + (_QWORD)*(v78 - 3)) = (_QWORD *)v46[3];
  v79[0] = (_QWORD *)(v50 + 16);
  if (SBYTE7(v84) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1AF4D64](v86);

LABEL_49:
  if (self->_globeAdapter.__ptr_.__value_)
  {
    v65 = *((_QWORD *)self->super._mapEngine + 140);
    v66 = *(_QWORD *)(v65 + 16);
    if ((v66 & (v66 - 1)) != 0)
    {
      v68 = 0x20A1ED17D78F322BLL;
      if (v66 <= 0x20A1ED17D78F322BLL)
        v68 = 0x20A1ED17D78F322BLL % v66;
      v67 = *(_QWORD **)(*(_QWORD *)(v65 + 8) + 8 * v68);
      do
      {
        do
          v67 = (_QWORD *)*v67;
        while (v67[1] != 0x20A1ED17D78F322BLL);
      }
      while (v67[2] != 0x20A1ED17D78F322BLL);
    }
    else
    {
      v67 = *(_QWORD **)(*(_QWORD *)(v65 + 8) + 8 * ((v66 - 1) & 0x20A1ED17D78F322BLL));
      do
      {
        do
          v67 = (_QWORD *)*v67;
        while (v67[1] != 0x20A1ED17D78F322BLL);
      }
      while (v67[2] != 0x20A1ED17D78F322BLL);
    }
    v69 = (void *)MEMORY[0x1E0CB3940];
    md::LabelSettings::debugLabelString(*(md::LabelSettings **)(*(_QWORD *)(v67[5] + 144) + 24), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringWithFormat:", CFSTR("%@"), v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v71);
    v72 = objc_claimAutoreleasedReturnValue();

    v19 = (__CFString *)v72;
  }
  return v19;
}

- (void)_reloadStylesheet
{
  uint64_t *v3;
  GlobeAdapter *value;
  md::HomeQueueScheduler **engine;
  altitude::GlobeView *globe;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  altitude::GlobeCleanupLoader *v11;
  unsigned int v12;
  altitude::GlobeCleanupLoader *v13;
  unsigned int v14;

  v3 = -[VKClassicGlobeCanvas _styleManager](self, "_styleManager");
  if (*v3)
  {
    value = self->_globeAdapter.__ptr_.__value_;
    if (value)
      md::LabelManager::setStyleManager(*((md::LabelManager **)value + 10), *v3, v3[1]);
    engine = (md::HomeQueueScheduler **)self->_engine;
    md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas _reloadStylesheet]");
    if (engine[108])
    {
      globe = (altitude::GlobeView *)self->_globe;
      v7 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)globe + 107) + 40) + 16);
      v8 = *(_QWORD *)(v7 + 240);
      if (v8)
      {
        v9 = *(unsigned __int8 *)(v8 + 136);
        altitude::RoadRequestManager::disable(*(pthread_mutex_t ***)(v7 + 240));
        (*(void (**)(_QWORD))(**(_QWORD **)(v8 + 104) + 120))(*(_QWORD *)(v8 + 104));
        if (v9)
          *(_BYTE *)(v8 + 136) = 1;
      }
      v10 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)globe + 107) + 40) + 24) + 152);
      if (v10)
        altitude::SkeletonRequestManager::setStyleManager(v10, *((_QWORD *)globe + 76), *((_QWORD *)globe + 77));
      altitude::GlobeView::updateLodScale(globe);
      v11 = (altitude::GlobeCleanupLoader *)*((_QWORD *)globe + 56);
      if (v11)
      {
        v12 = *(_DWORD *)(*((_QWORD *)v11 + 4) + 88) + 1;
        altitude::GlobeCleanupLoader::pruneTrafficComponents(v11, v12, v12);
        v13 = (altitude::GlobeCleanupLoader *)*((_QWORD *)globe + 56);
        v14 = *(_DWORD *)(*((_QWORD *)v13 + 4) + 88) + 1;
        altitude::GlobeCleanupLoader::pruneRoadComponents(v13, v14, v14);
      }
    }
  }
}

- (const)_styleManager
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t ***v6;
  uint64_t **v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;

  v2 = (int8x8_t *)*((_QWORD *)self->super._mapEngine + 140);
  v3 = v2[2];
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = 0x2FED70A4459DFCA1;
      if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
        v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
    }
    else
    {
      v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
    }
    v6 = *(uint64_t ****)(*(_QWORD *)&v2[1] + 8 * v5);
    if (v6)
    {
      v7 = *v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          v8 = *(_QWORD *)&v3 - 1;
          while (1)
          {
            v10 = v7[1];
            if (v10 == (uint64_t *)0x2FED70A4459DFCA1)
            {
              if (v7[2] == (uint64_t *)0x2FED70A4459DFCA1)
                return md::StyleLogic::globeContext((md::StyleLogic *)v7[5]);
            }
            else if (((unint64_t)v10 & v8) != v5)
            {
              return md::StyleLogic::globeContext(0);
            }
            v7 = (uint64_t **)*v7;
            if (!v7)
              return md::StyleLogic::globeContext(0);
          }
        }
        do
        {
          v9 = (unint64_t)v7[1];
          if (v9 == 0x2FED70A4459DFCA1)
          {
            if (v7[2] == (uint64_t *)0x2FED70A4459DFCA1)
              return md::StyleLogic::globeContext((md::StyleLogic *)v7[5]);
          }
          else
          {
            if (v9 >= *(_QWORD *)&v3)
              v9 %= *(_QWORD *)&v3;
            if (v9 != v5)
              return md::StyleLogic::globeContext(0);
          }
          v7 = (uint64_t **)*v7;
        }
        while (v7);
      }
    }
  }
  return md::StyleLogic::globeContext(0);
}

- (const)_clientStyleState
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = (int8x8_t *)*((_QWORD *)self->super._mapEngine + 140);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return (const void *)208;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return (const void *)208;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return (const void *)208;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1)
          return (const void *)(v7[5] + 208);
      }
      else if ((v10 & v8) != v5)
      {
        return (const void *)208;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return (const void *)208;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return (const void *)208;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return (const void *)208;
  }
  if (v7[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
  return (const void *)(v7[5] + 208);
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  Camera *ptr;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  VKGlobeCameraController *globeCameraController;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  objc_super v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v21 = *(_QWORD *)a3.__ptr_;
  v22 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v20.receiver = self;
  v20.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas setCamera:](&v20, sel_setCamera_, &v21, a3.__cntrl_);
  v8 = v22;
  if (v22)
  {
    v9 = (unint64_t *)&v22->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  globeCameraController = self->_globeCameraController;
  v12 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v18 = *(_QWORD *)ptr;
  v19 = v12;
  if (v12)
  {
    v13 = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  -[VKGlobeCameraController setCamera:](globeCameraController, "setCamera:", &v18);
  v15 = v19;
  if (v19)
  {
    v16 = (unint64_t *)&v19->__shared_owners_;
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

- (void)setContentsScale:(double)a3
{
  GlobeOverlayContainer *ptr;
  altitude::GlobeView *globe;
  double v7;
  double v8;
  char *v9;
  double v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  MapEngine *var0;
  char v17;
  char v18;

  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    ptr = self->_overlayContainer.__ptr_;
    if (ptr)
      *((double *)ptr + 10) = a3;
    -[VKClassicGlobeCanvas _reloadStylesheet](self, "_reloadStylesheet");
    globe = (altitude::GlobeView *)self->_globe;
    *(double *)(*(_QWORD *)(*((_QWORD *)globe + 107) + 136) + 32) = a3;
    altitude::GlobeView::updateLodScale(globe);
    -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
    if (v7 > 0.0)
    {
      -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
      if (v8 > 0.0)
      {
        v9 = (char *)self->_globe;
        -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
        v11 = v10;
        -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
        v13 = v12;
        *(_QWORD *)(v9 + 636) = 0;
        *((_DWORD *)v9 + 161) = v11;
        *((_DWORD *)v9 + 162) = v12;
        v14 = **(_QWORD **)(*((_QWORD *)v9 + 107) + 88);
        if (v14)
        {
          v17 = 7;
          md::MapEngine::setNeedsTick(v14, &v17);
        }
        v15 = *((_QWORD *)v9 + 99);
        *(_QWORD *)(v15 + 40) = 0;
        *(_DWORD *)(v15 + 48) = v11;
        *(_DWORD *)(v15 + 52) = v13;
      }
    }
    var0 = self->super._runLoopController->var0;
    if (var0)
    {
      v18 = 2;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v18);
    }
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  -[VKClassicGlobeCanvas _reloadStylesheet](self, "_reloadStylesheet", a3);
  altitude::GlobeView::reload((altitude::GlobeView *)self->_globe);
  -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[VKClassicGlobeCanvas description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n\n"), v4);

  return v5;
}

- (CGPoint)_centerScreenPoint
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double top;
  double v10;
  double left;
  double v12;
  double v13;
  double bottom;
  double v15;
  double v16;
  double right;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  CGPoint result;

  -[MDRenderTarget size](self->super._displayTarget, "size");
  v3 = 0.0;
  v5 = v4 == 0.0;
  v6 = 0.0;
  if (!v5)
  {
    -[MDRenderTarget size](self->super._displayTarget, "size", 0.0, 0.0);
    v8 = v7;
    v3 = 0.0;
    v5 = v8 == 0.0;
    v6 = 0.0;
    if (!v5)
    {
      top = self->super._edgeInsets.top;
      -[MDRenderTarget size](self->super._displayTarget, "size");
      left = self->super._edgeInsets.left;
      v12 = top / (v10 + v10);
      -[MDRenderTarget size](self->super._displayTarget, "size");
      bottom = self->super._edgeInsets.bottom;
      v15 = left / (v13 + v13);
      -[MDRenderTarget size](self->super._displayTarget, "size");
      right = self->super._edgeInsets.right;
      v18 = bottom / (v16 + v16);
      -[MDRenderTarget size](self->super._displayTarget, "size");
      v20 = v12;
      v21 = v15;
      v22 = v18;
      *(float *)&v19 = right / (v19 + v19);
      v3 = v21 + 0.5 - *(float *)&v19;
      v6 = 0.5 - v20 + v22;
    }
  }
  result.y = v6;
  result.x = v3;
  return result;
}

- (void)transferStateFromCanvas:(id)a3
{
  id v4;
  VKGlobeCameraController *v5;
  VKGlobeCameraController *globeCameraController;
  const Camera *v7;
  float v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  gdc::DisplayZoomLevel *v11;
  std::__shared_weak_count *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas transferStateFromCanvas:](&v13, sel_transferStateFromCanvas_, v4);
  -[VKScreenCanvas cameraController](self, "cameraController");
  v5 = (VKGlobeCameraController *)objc_claimAutoreleasedReturnValue();
  globeCameraController = self->_globeCameraController;

  if (v5 == globeCameraController)
  {
    -[VKScreenCanvas camera](self, "camera");
    v8 = gdc::DisplayZoomLevel::centerZoomLevel(v11, v7);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)())v12->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    self->_currentZoomLevel = v8;
    -[VKGlobeCameraController setCurrentZoomLevel:](self->_globeCameraController, "setCurrentZoomLevel:");
  }

}

- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4
{
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  int8x16_t v11;
  uint64_t v12;
  __int128 v13;
  int8x16_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  void (**v19)(_QWORD *__return_ptr, _QWORD, float);
  double v20;
  _QWORD *v21;
  double v22;
  uint64_t v23;
  float v24;
  float v25;
  BOOL v26;
  double v27;
  double v28;
  float v29;
  int8x16_t v30;
  id v31;
  __int128 v33;
  uint64_t v34;
  int8x16_t v35;
  int8x16_t v36;
  __int128 v37;
  uint64_t v38;
  int8x16_t v39;
  int8x16_t v40;
  _OWORD v41[3];
  uint64_t v42;
  __int128 v43;
  _OWORD v44[3];
  int8x16_t v45;
  uint64_t v46;
  _BYTE v47[40];
  _QWORD v48[11007];

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v7 = v4;
  v48[11006] = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v9;
  v46 = 0;
  v11 = 0uLL;
  v45 = 0u;
  memset(v44, 0, sizeof(v44));
  v43 = 0u;
  if (v9)
  {
    objc_msgSend(v9, "cameraPathAtIndex:", 0);
    v12 = *(_QWORD *)&v44[0];
    v13 = *(_OWORD *)((char *)v44 + 8);
    v14 = v45;
    v11 = *(int8x16_t *)((char *)&v44[1] + 8);
  }
  else
  {
    v12 = 0;
    v14 = 0uLL;
    v13 = 0uLL;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v7 + 744) + 72);
  v16 = *(_QWORD *)(v15 + 56);
  v17 = *(void **)(v7 + 672);
  v18 = *(_OWORD *)(v15 + 24);
  v41[0] = *(_OWORD *)(v15 + 8);
  v41[1] = v18;
  v41[2] = *(_OWORD *)(v15 + 40);
  v42 = v16;
  v37 = v13;
  v38 = v12;
  v39 = vextq_s8(v14, v14, 8uLL);
  v40 = vextq_s8(v11, v11, 8uLL);
  objc_msgSend(v17, "createMoveToZoomOutZoomInFrameFunction:toLatLon:", v41, &v37);
  v19 = (void (**)(_QWORD *__return_ptr, _QWORD, float))objc_claimAutoreleasedReturnValue();
  v20 = v6 * 0.001;
  v21 = v48;
  v22 = 0.0;
  v23 = 1001;
  do
  {
    v24 = v22;
    v25 = v24 + v24;
    v26 = v25 < 1.0;
    v27 = (float)((float)((float)(v25 + -2.0) * (float)(v25 + -2.0)) * (float)(v25 + -2.0)) * 0.5 + 1.0;
    v28 = v25 * v25 * (0.5 * v25);
    if (!v26)
      v28 = v27;
    v29 = v28;
    ((void (**)(__int128 *__return_ptr, _QWORD, float))v19)[2](&v33, v19, v29);
    *(v21 - 3) = v34;
    v30 = vextq_s8(v36, v36, 8uLL);
    *((_OWORD *)v21 - 1) = v33;
    *(int8x16_t *)v21 = v30;
    *(int8x16_t *)(v21 + 3) = vextq_s8(v35, v35, 8uLL);
    *((double *)v21 + 2) = v20;
    *(v21 - 5) = 0x3F80000000000000;
    v22 = v22 + 0.001;
    v21 += 11;
    --v23;
  }
  while (v23);
  v31 = objc_alloc_init(MEMORY[0x1E0D272D8]);
  objc_msgSend(v31, "setCameraPaths:count:", v47, 1001);

  return v31;
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  _BYTE *globe;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  double v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  double v18;
  uint64_t v19;
  double v20;
  int v21;
  long double v22;
  _OWORD v23[2];
  char v24;

  v6 = a3;
  v7 = a4;
  v8 = 0uLL;
  memset(v23, 0, 24);
  if (v6)
  {
    objc_msgSend(v6, "cameraPathAtIndex:", 0, (unsigned __int128)0);
    v8 = *(_OWORD *)((char *)v23 + 8);
    v9 = *(_QWORD *)&v23[0];
  }
  else
  {
    v9 = 0;
  }
  globe = self->_globe;
  globe[160] = 0;
  v11 = *((_QWORD *)globe + 9);
  *(_OWORD *)(v11 + 8) = v8;
  *(_QWORD *)(v11 + 24) = v9;
  ++*((_DWORD *)globe + 94);
  v12 = **(_QWORD **)(*((_QWORD *)globe + 107) + 88);
  if (v12)
  {
    v24 = 7;
    md::MapEngine::setNeedsTick(v12, &v24);
  }
  v13 = (unsigned __int8 *)self->_globe;
  if (v13[184])
  {
    v14 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)self->_globe);
    v15 = v13[184];
    v16 = *((_QWORD *)v13 + 9);
    *(double *)(v16 + 32) = fmin(0.0, fmax(fmin(*((double *)v13 + 50), 60592301.5), v14));
    if (v15)
      *(double *)(v16 + 40) = fmax(*(double *)(v16 + 40), 0.0);
  }
  else
  {
    *(_QWORD *)(*((_QWORD *)v13 + 9) + 32) = 0;
  }
  ++*((_DWORD *)v13 + 94);
  v17 = self->_globe;
  v18 = 0.0;
  v19 = v17[9];
  v20 = fmax(0.0, 0.0);
  if (*((_BYTE *)v17 + 184))
    v18 = v20;
  *(double *)(v19 + 40) = v18;
  v21 = *((_DWORD *)v17 + 94);
  v22 = fmod(0.0 + 3.14159265, 6.28318531);
  *(long double *)(v19 + 48) = fmod(v22 + 6.28318531, 6.28318531) + -3.14159265;
  *(_QWORD *)(v19 + 56) = 0;
  *((_DWORD *)v17 + 94) = v21 + 3;
  -[VKClassicGlobeCanvas setSceneDidLoadCallback:](self, "setSceneDidLoadCallback:", v7);

}

- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  -[VKGlobeCameraController flyoverTourAnimation:animateToStart:labelChanged:stateChange:](self->_globeCameraController, "flyoverTourAnimation:animateToStart:labelChanged:stateChange:", a3, a4, a5, a6);
}

- (void)stopFlyoverAnimation
{
  -[VKGlobeCameraController stopFlyoverTourAnimation](self->_globeCameraController, "stopFlyoverTourAnimation");
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *globe;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  BOOL v26;
  _QWORD *v27;
  int v28;
  _QWORD *v29;
  void *v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  VKClassicGlobeCanvas *v43;
  uint64_t (**v44)();
  void *v45;
  BOOL v46;
  uint64_t (**v47)();
  void *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  __int128 v51;
  int v52;
  int v53;
  int v54;
  int v55;
  _BYTE v56[24];
  _BYTE *v57;
  _QWORD v58[3];
  _QWORD *v59;
  __int128 v60;
  _QWORD v61[3];
  _QWORD *v62;
  _QWORD v63[3];
  _QWORD *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v42 = a5;
  v10 = (void *)objc_msgSend(a6, "copy");
  v50[0] = &off_1E42B55B0;
  v11 = (void *)MEMORY[0x1A1AF5730]();
  v50[1] = v11;
  v12 = (void *)objc_msgSend(v42, "copy");
  v49[0] = &off_1E42B55D0;
  v13 = (void *)MEMORY[0x1A1AF5730]();
  v49[1] = v13;
  globe = self->_globe;
  v43 = self;
  geo::_retain_ptr<void({block_pointer} {__strong})(VKFlyoverTourState),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v44, (uint64_t)v50);
  v46 = a4;
  geo::_retain_ptr<void({block_pointer} {__strong})(NSString *),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v47, (uint64_t)v49);
  v57 = 0;
  v15 = operator new(0x48uLL);
  *v15 = &off_1E42C8090;
  v15[1] = v43;
  v15[2] = &off_1E42B55B0;
  v15[3] = MEMORY[0x1A1AF5730](v45);
  v16 = v45;
  v45 = 0;

  *((_BYTE *)v15 + 40) = v46;
  v15[6] = &off_1E42B55D0;
  v15[7] = MEMORY[0x1A1AF5730](v48);
  v17 = v48;
  v48 = 0;

  v57 = v15;
  v18 = globe[78];
  if (!v18)
  {
    *(_QWORD *)&v60 = 0;
    (*(void (**)(_QWORD *, __int128 *))(*v15 + 48))(v15, &v60);

    goto LABEL_46;
  }
  v19 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v15 + 16))(v15);
  v59 = v19;
  v20 = *(_QWORD *)(v18 + 48);
  v23 = *(_QWORD **)(v20 + 8);
  v21 = (_QWORD *)(v20 + 8);
  v22 = v23;
  if (v23)
  {
    v24 = v21;
    do
    {
      v25 = v22[4];
      v26 = v25 >= a3;
      if (v25 >= a3)
        v27 = v22;
      else
        v27 = v22 + 1;
      if (v26)
        v24 = v22;
      v22 = (_QWORD *)*v27;
    }
    while (*v27);
    if (v24 != v21 && v24[4] <= a3)
    {
      v30 = (void *)v24[5];
      if (!v30)
        goto LABEL_41;
      *(_QWORD *)&v60 = v30;
      if (v59)
      {
        (*(void (**)(_QWORD *, __int128 *))(*v59 + 48))(v59, &v60);

        goto LABEL_41;
      }
LABEL_62:
      std::__throw_bad_function_call[abi:nn180100]();
      __break(1u);
      return;
    }
  }
  v28 = *(_DWORD *)(v18 + 72);
  if (v28 < 0)
  {
    *(_QWORD *)&v60 = 0;
    if (v19)
    {
      (*(void (**)(_QWORD *, __int128 *))(*v19 + 48))(v19, &v60);

      goto LABEL_41;
    }
    goto LABEL_62;
  }
  if (!*(_QWORD *)(v18 + 64))
    goto LABEL_41;
  LODWORD(v51) = 15;
  DWORD1(v51) = v28;
  *((_QWORD *)&v51 + 1) = 0;
  v52 = 0;
  v53 = -(int)a3;
  v54 = HIDWORD(a3);
  v55 = 0;
  v29 = v61;
  *(_QWORD *)&v60 = v18;
  *((_QWORD *)&v60 + 1) = a3;
  if (!v19)
    goto LABEL_18;
  if (v19 != v58)
  {
    v19 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v19 + 16))(v19);
LABEL_18:
    v62 = v19;
    goto LABEL_26;
  }
  v62 = v61;
  (*(void (**)(_QWORD *, _QWORD *))(v58[0] + 24))(v58, v61);
LABEL_26:
  v64 = 0;
  v31 = (char *)operator new(0x38uLL);
  v32 = v31;
  *(_QWORD *)v31 = &off_1E42D9488;
  *(_OWORD *)(v31 + 8) = v60;
  if (v62)
  {
    if (v62 == v61)
    {
      *((_QWORD *)v31 + 6) = v31 + 24;
      (*(void (**)(_QWORD *))(v61[0] + 24))(v61);
    }
    else
    {
      *((_QWORD *)v31 + 6) = v62;
      v62 = 0;
    }
  }
  else
  {
    *((_QWORD *)v31 + 6) = 0;
  }
  v64 = v32;
  altitude::FlyoverTour::checkLoading(v18, &v51, v63);
  v33 = v64;
  if (v64 == v63)
  {
    v34 = 4;
    v33 = v63;
  }
  else
  {
    if (!v64)
      goto LABEL_36;
    v34 = 5;
  }
  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_36:
  if (v62 == v61)
  {
    v35 = 4;
  }
  else
  {
    if (!v62)
      goto LABEL_41;
    v35 = 5;
    v29 = v62;
  }
  (*(void (**)(_QWORD *))(*v29 + 8 * v35))(v29);
LABEL_41:
  v36 = v59;
  if (v59 == v58)
  {
    v37 = 4;
    v36 = v58;
  }
  else
  {
    if (!v59)
      goto LABEL_46;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_46:
  v38 = v57;
  if (v57 == v56)
  {
    v39 = 4;
    v38 = v56;
    goto LABEL_50;
  }
  if (v57)
  {
    v39 = 5;
LABEL_50:
    (*(void (**)(void))(*v38 + 8 * v39))();
  }
  v47 = &off_1E42B55D0;
  if (v48)
  {

    v40 = v48;
  }
  else
  {
    v40 = 0;
  }

  v44 = &off_1E42B55B0;
  if (v45)
  {

    v41 = v45;
  }
  else
  {
    v41 = 0;
  }

  if (v13)
  if (v11)

}

- (void)pauseFlyoverTourAnimation
{
  -[VKGlobeCameraController pauseFlyoverTourAnimation](self->_globeCameraController, "pauseFlyoverTourAnimation");
}

- (void)resumeFlyoverTourAnimation
{
  MapEngine *var0;
  char v4;

  -[VKGlobeCameraController resumeFlyoverTourAnimation](self->_globeCameraController, "resumeFlyoverTourAnimation");
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    v4 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v4);
  }
}

- (void)stopAnimations
{
  -[VKScreenCameraController stopAnimations](self->_globeCameraController, "stopAnimations");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKClassicGlobeCanvas convertPointToCoordinate:](self, "convertPointToCoordinate:", a3.x, a3.y);
  GEOMapPointForCoordinate();
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (CGPoint)convertMapPointToPoint:(id)a3
{
  double v4;
  double v5;
  CGPoint result;

  GEOCoordinate2DForMapPoint();
  -[VKClassicGlobeCanvas convertCoordinateToPoint:](self, "convertCoordinateToPoint:");
  result.y = v5;
  result.x = v4;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  _BOOL4 LatLongAtViewPosition;
  double v9;
  double v10;
  __int128 v11;
  uint64_t v12;
  int v13[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
  v13[0] = (int)(v6 * x);
  -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
  v13[1] = (int)(v7 * y);
  v11 = 0uLL;
  v12 = 0;
  LatLongAtViewPosition = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->_globe, v13, &v11);
  if (LatLongAtViewPosition)
    v9 = *(double *)&v11 * 57.2957795;
  else
    v9 = -180.0;
  if (LatLongAtViewPosition)
    v10 = *((double *)&v11 + 1) * 57.2957795;
  else
    v10 = -180.0;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinateOnSphere:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  _QWORD *globe;
  uint64_t v9;
  __int128 v10;
  _BOOL4 CoordAtScreenPosition;
  double v12;
  double v13;
  __int128 v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  int v19[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
  v19[0] = (int)(v6 * x);
  -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
  v19[1] = (int)(v7 * y);
  v16 = 0.0;
  v17 = 0.0;
  v18 = 0;
  globe = self->_globe;
  v9 = globe[9];
  if (v9)
  {
    v10 = *(_OWORD *)(v9 + 8);
    v15 = *(_QWORD *)(v9 + 24);
    v14 = v10;
  }
  else
  {
    v14 = 0uLL;
    v15 = 0;
  }
  CoordAtScreenPosition = altitude::GlobeView::getCoordAtScreenPosition((uint64_t)globe, v19, (double *)&v14, (uint64_t)&v16, 0);
  if (CoordAtScreenPosition)
    v12 = v16 * 57.2957795;
  else
    v12 = -180.0;
  if (CoordAtScreenPosition)
    v13 = v17 * 57.2957795;
  else
    v13 = -180.0;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (CGPoint)convertCoordinateToPoint:(id)a3
{
  _QWORD *globe;
  double v5;
  __double2 v6;
  double v7;
  __double2 v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int32x2_t v16;
  float64x2_t v22;
  int64x2_t v23;
  float64x2_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  float64x2_t v38;
  double v39;
  _QWORD *v40;
  CGPoint result;

  globe = self->_globe;
  v5 = a3.var1 * 0.0174532925;
  v40 = globe;
  v6 = __sincos_stret(a3.var0 * 0.0174532925);
  v7 = 6378137.0 / sqrt(v6.__sinval * v6.__sinval * -0.00669437999 + 1.0);
  v8 = __sincos_stret(v5);
  v36.f64[0] = v7 * v6.__cosval * v8.__cosval;
  v36.f64[1] = v7 * v6.__cosval * v8.__sinval;
  v37 = v7 * (0.99330562 * v6.__sinval);
  if (!altitude::Intersector::intersectAtPosition((uint64_t)&v40, &v36, &v38))
    goto LABEL_5;
  v9 = globe[66];
  if (!v9)
    goto LABEL_5;
  v10 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v9 + 24))(v9, 0, 0);
  v11 = (int32x2_t *)globe[99];
  v12 = *(double *)(v10 + 144);
  v13 = *(double *)(v10 + 176);
  v14 = *(double *)(v10 + 208);
  v31 = *(float64x2_t *)(v10 + 120);
  v32 = *(float64x2_t *)(v10 + 152);
  v33 = *(float64x2_t *)(v10 + 184);
  v34 = *(float64x2_t *)(v10 + 216);
  v15 = *(double *)(v10 + 240);
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v36.f64, (double *)(globe[9] + 8));
  if ((v38.f64[1] * v36.f64[1] + v39 * v37 + v38.f64[0] * v36.f64[0])
     / sqrt(v36.f64[0] * v36.f64[0] + v36.f64[1] * v36.f64[1] + v37 * v37) >= 0.0)
  {
    v16 = vsub_s32(v11[6], v11[5]);
    __asm { FMOV            V2.2D, #0.5 }
    v22 = vmulq_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v34, v31, v38.f64[0]), v32, v38.f64[1]), v33, v39), 1.0 / (v15 + v38.f64[0] * v12 + v38.f64[1] * v13 + v39 * v14)), _Q2);
    v23.i64[0] = v16.i32[0];
    v23.i64[1] = v16.i32[1];
    *(_QWORD *)&v24.f64[0] = *(_OWORD *)&vaddq_f64(v22, _Q2);
    v24.f64[1] = vsubq_f64(_Q2, v22).f64[1];
    *(int32x2_t *)&v35.f64[0] = vmovn_s64(vcvtq_s64_f64(vmulq_f64(v24, vcvtq_f64_s64(v23))));
    -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
    v26 = (double)SLODWORD(v35.f64[0]) / v25;
    -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
    v28 = (double)SHIDWORD(v35.f64[0]) / v27;
    v29 = trunc(v26);
    v30 = trunc(v28);
  }
  else
  {
LABEL_5:
    v29 = 9.22337204e18;
    v30 = 9.22337204e18;
  }
  result.y = v30;
  result.x = v29;
  return result;
}

- (CGPoint)convertCoordinateToCameraModelPoint:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _DWORD v10[2];
  __int128 v11;
  uint64_t v12;
  double v13[3];
  uint64_t v14;
  CGPoint result;

  v14 = 0;
  v13[0] = a3.var0 * 0.0174532925;
  v13[1] = a3.var1 * 0.0174532925;
  altitude::IntersectorHeight::heightAtLatLon(*((_QWORD *)self->_globe + 89), v13, (double *)&v14, 0xEu);
  v11 = *(_OWORD *)v13;
  v12 = v14;
  if (altitude::GlobeView::getViewPositionAtLatLongHeight((_QWORD *)self->_globe, (double *)&v11, v10))
  {
    -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
    v5 = (double)v10[0] / v4;
    -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
    v7 = (double)v10[1] / v6;
    v8 = trunc(v5);
    v9 = trunc(v7);
  }
  else
  {
    v8 = 9.22337204e18;
    v9 = 9.22337204e18;
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  Camera *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas updateWithTimestamp:withContext:](&v9, sel_updateWithTimestamp_withContext_, a4, a3);
  v7 = 0x40F86A0000000000;
  v8 = 0x4024000000000000;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(_QWORD *)self->_globe + 64))(self->_globe, &v8, &v7);
  ptr = self->super._camera.__ptr_;
  v6 = v7;
  *((_QWORD *)ptr + 58) = v8;
  *((_QWORD *)ptr + 59) = v6;
  -[VKClassicGlobeCanvas _update](self, "_update");
  -[VKClassicGlobeCanvas _updateDebugSettings](self, "_updateDebugSettings");
}

- (void)_update
{
  _QWORD *globe;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  MapEngine *var0;
  unsigned __int8 *v9;
  unsigned __int8 v10;
  _BOOL4 v11;
  uint64_t v12;
  BOOL *p_isDownloading;
  char v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  char v18;
  double v19[3];
  double v20;

  globe = self->_globe;
  if (*((_BYTE *)globe + 160))
  {
    v20 = 0.0;
    v4 = globe[89];
    *(_OWORD *)v19 = *(_OWORD *)(globe[9] + 8);
    if (altitude::IntersectorHeight::heightAtLatLon(v4, v19, &v20, 0xEu) == 2)
    {
      v5 = **(_QWORD **)(globe[107] + 88);
      if (v5)
      {
        LOBYTE(v19[0]) = 7;
        md::MapEngine::setNeedsTick(v5, v19);
      }
    }
    else
    {
      *((_BYTE *)globe + 160) = 0;
      *(double *)(globe[9] + 24) = v20 + *(double *)(globe[9] + 24);
    }
  }
  -[VKGlobeCameraController updateCameraManager](self->_globeCameraController, "updateCameraManager");
  if (altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globe)
    || (+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "layoutContinuously"),
        v6,
        v7))
  {
    var0 = self->super._runLoopController->var0;
    if (var0)
    {
      LOBYTE(v19[0]) = 2;
      md::MapEngine::setNeedsTick((uint64_t)var0, v19);
    }
  }
  v9 = (unsigned __int8 *)self->_globe;
  v10 = atomic_load(v9 + 832);
  v11 = v10 & 1;
  v12 = *((_QWORD *)v9 + 78);
  if (v12 && *(_DWORD *)(v12 + 116) != 2)
  {
    v14 = *(_BYTE *)(v12 + 252);
    if (v14)
    {
      if (!self->_tourIsDownloading)
        (*(void (**)(void *))(*(_QWORD *)self->_loadingStatusTracker + 16))(self->_loadingStatusTracker);
    }
    else if (self->_tourIsDownloading)
    {
      (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    }
    self->_tourIsDownloading = v14;
    p_isDownloading = &self->_isDownloading;
    self->_isDownloading = v11;
    if (v11)
      goto LABEL_32;
  }
  else
  {
    if (self->_tourIsDownloading && !self->_isDownloading)
      (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    self->_tourIsDownloading = 0;
    p_isDownloading = &self->_isDownloading;
    if (v11)
    {
      if (!self->_isDownloading)
        (*(void (**)(void *))(*(_QWORD *)self->_loadingStatusTracker + 16))(self->_loadingStatusTracker);
      *p_isDownloading = v11;
      goto LABEL_32;
    }
    if (self->_isDownloading)
      (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    *p_isDownloading = 0;
  }
  if (!altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globe))
  {
    -[VKClassicGlobeCanvas sceneDidLoadCallback](self, "sceneDidLoadCallback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[VKClassicGlobeCanvas sceneDidLoadCallback](self, "sceneDidLoadCallback");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16[2](v16, 1);

      -[VKClassicGlobeCanvas setSceneDidLoadCallback:](self, "setSceneDidLoadCallback:", 0);
    }
  }
  if (*p_isDownloading)
  {
LABEL_32:
    v17 = 0;
    self->_isLoading = 1;
    goto LABEL_33;
  }
  if (!self->_isLoading)
    goto LABEL_34;
  self->_isLoading = 0;
  v17 = 2;
LABEL_33:
  gdc::LoadingStatusTracker::setSceneStatus((uint64_t)self->_loadingStatusTracker, v17);
LABEL_34:
  v18 = *((_BYTE *)self->_globe + 272);
  if (!v18 && self->_coarseLoading)
    gdc::LoadingStatusTracker::setSceneStatus((uint64_t)self->_loadingStatusTracker, 0);
  self->_coarseLoading = v18;
}

- (void)updateCameraForFrameResize
{
  double v3;
  double v4;
  double v6;
  int v7;
  double v8;
  int v9;
  _DWORD *globe;
  int v12;
  int v13;
  double v14;
  long double v15;
  long double v16;
  float v17;
  double v18;
  void *v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  int v32;
  double *v33;
  double v34;
  double v35;
  objc_super v36;
  double v37;
  double v38;
  char v39;

  -[MDRenderTarget size](self->super._displayTarget, "size");
  if (self->_lastCanvasSize.width != v3 || self->_lastCanvasSize.height != v4)
  {
    self->_lastCanvasSize.width = v3;
    self->_lastCanvasSize.height = v4;
    -[VKCameraController beginRegionChange:](self->_globeCameraController, "beginRegionChange:", 0);
    -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
    v7 = (int)v6;
    -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
    v9 = (int)v8;
    if (v7 >= 1 && v9 >= 1)
    {
      globe = self->_globe;
      v12 = globe[162];
      (*(void (**)(double *__return_ptr))(*(_QWORD *)globe + 32))(&v38);
      (*(void (**)(double *__return_ptr))(*(_QWORD *)self->_globe + 48))(&v37);
      if (self->_initialized)
        v13 = v12;
      else
        v13 = v9;
      v14 = (float)((float)v9 / (float)v13);
      v15 = tan(v38 * 0.5);
      v16 = atan(v15 * v14);
      *(float *)&v16 = v16 + v16;
      v17 = v37;
      v18 = fminf(fmaxf(*(float *)&v16, 0.31416), v17);
      v38 = v18;
      v19 = self->_globe;
      *((double *)v19 + 35) = v18;
      v20 = tan(v18 * 0.5);
      *((double *)v19 + 36) = v20;
      v21 = (double *)*((_QWORD *)v19 + 9);
      v23 = v21[46];
      v22 = v21[47];
      if (v22 < v23)
      {
        v24 = v22 * v23;
        v25 = v23 / v22;
        if (v24 <= 0.0)
          v25 = 1.0;
        v26 = atan(v25 * v20);
        v18 = v26 + v26;
      }
      v21[57] = v18;
      v27 = **(_QWORD **)(*((_QWORD *)v19 + 107) + 88);
      if (v27)
      {
        v39 = 7;
        md::MapEngine::setNeedsTick(v27, &v39);
      }
      v28 = (char *)self->_globe;
      *(_QWORD *)(v28 + 636) = 0;
      *((_DWORD *)v28 + 161) = v7;
      *((_DWORD *)v28 + 162) = v9;
      v29 = **(_QWORD **)(*((_QWORD *)v28 + 107) + 88);
      if (v29)
      {
        v39 = 7;
        md::MapEngine::setNeedsTick(v29, &v39);
      }
      v30 = *((_QWORD *)v28 + 99);
      *(_QWORD *)(v30 + 40) = 0;
      *(_DWORD *)(v30 + 48) = v7;
      *(_DWORD *)(v30 + 52) = v9;
      -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
      if (v31 != 0.0)
      {
        if (v9 >= v7)
          v32 = v7;
        else
          v32 = v9;
        v33 = (double *)self->_globe;
        v34 = (double)v32;
        -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
        v33[48] = v34 * 0.001953125 / v35;
      }
    }
    v36.receiver = self;
    v36.super_class = (Class)VKClassicGlobeCanvas;
    -[VKScreenCanvas updateCameraForFrameResize](&v36, sel_updateCameraForFrameResize);
    -[VKCameraController endRegionChange](self->_globeCameraController, "endRegionChange");
  }
}

- (void)didPresent
{
  md::HomeQueueScheduler **engine;
  md::HomeQueueScheduler *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isFlyoverTileAtTarget;
  id WeakRetained;

  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas didPresent]");
  v4 = engine[108];
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v4 + 28), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v4 + 28));
  v5 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)self->_globe + 96) + 24))(*((_QWORD *)self->_globe + 96), 0, 0xFFFFFFFFLL);
  if (!v5)
    goto LABEL_27;
  v6 = v5;
  v7 = (_QWORD *)*((_QWORD *)self->_engine + 115);
  v8 = (int8x8_t)v7[1];
  if (!*(_QWORD *)&v8)
    goto LABEL_25;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = 0xE42D19AFCA302E68;
    if (*(_QWORD *)&v8 <= 0xE42D19AFCA302E68)
      v10 = 0xE42D19AFCA302E68 % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & 0xE42D19AFCA302E68;
  }
  v11 = *(_QWORD **)(*v7 + 8 * v10);
  if (!v11)
    goto LABEL_25;
  v12 = (_QWORD *)*v11;
  if (!v12)
    goto LABEL_25;
  if (v9.u32[0] < 2uLL)
  {
    v13 = *(_QWORD *)&v8 - 1;
    while (1)
    {
      v15 = v12[1];
      if (v15 == 0xE42D19AFCA302E68)
      {
        if (v12[2] == 0xE42D19AFCA302E68)
          goto LABEL_23;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_25;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_25;
    }
  }
  while (1)
  {
    v14 = v12[1];
    if (v14 == 0xE42D19AFCA302E68)
      break;
    if (v14 >= *(_QWORD *)&v8)
      v14 %= *(_QWORD *)&v8;
    if (v14 != v10)
      goto LABEL_25;
LABEL_12:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_25;
  }
  if (v12[2] != 0xE42D19AFCA302E68)
    goto LABEL_12;
LABEL_23:
  v16 = v12[5];
  if (*(_QWORD *)(v16 + 8) == 0xE42D19AFCA302E68)
  {
    v17 = *(_QWORD *)(v16 + 32);
    goto LABEL_26;
  }
LABEL_25:
  v17 = 0;
LABEL_26:
  self->_currentZoomLevel = (float)(*(float *)(v17 + 100) + *(float *)(v5 + 1352));
  -[VKGlobeCameraController setCurrentZoomLevel:](self->_globeCameraController, "setCurrentZoomLevel:");
  -[VKARCameraController setCurrentZoomLevel:](self->_arCameraController, "setCurrentZoomLevel:", self->_currentZoomLevel);
  -[VKGlobeCameraController setMaxZoomLevel:](self->_globeCameraController, "setMaxZoomLevel:", (float)(*(float *)(v17 + 100) + *(float *)(v6 + 1368)));
  -[VKGlobeCameraController setMinZoomLevel:](self->_globeCameraController, "setMinZoomLevel:", (float)(*(float *)(v17 + 100) + *(float *)(v6 + 1372)));
  -[VKARCameraController setMaxZoomLevel:](self->_arCameraController, "setMaxZoomLevel:", (float)(*(float *)(v17 + 100) + *(float *)(v6 + 1368)));
LABEL_27:
  isFlyoverTileAtTarget = altitude::GlobeView::isFlyoverTileAtTarget((altitude::GlobeView *)self->_globe);
  if (self->_canShowFlyover != isFlyoverTileAtTarget)
  {
    self->_canShowFlyover = isFlyoverTileAtTarget;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "map:canShowFlyoverDidChange:", self, self->_canShowFlyover);

  }
}

- (NSArray)visibleTileSets
{
  _QWORD *globe;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  _QWORD *v22;
  unsigned int v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _BYTE *v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  char **v41;
  char **v42;
  char **v43;
  unsigned int v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _BYTE *v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  void **v63;
  char **v64;
  char *v65;
  int v66;
  int v67;
  int v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _BYTE *v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD **v85;
  _QWORD **v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD **v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t i;
  void *v95;
  id v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD *v101;
  _QWORD *v102;
  uint64_t *v104;
  int v105;
  id v106;
  int v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD **v112;
  _QWORD *v113;
  uint64_t v114;
  _QWORD **v115;
  _QWORD *v116[2];
  _QWORD *v117;
  _QWORD *v118;
  uint64_t v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v106 = (id)objc_claimAutoreleasedReturnValue();
  globe = self->_globe;
  v113 = 0;
  v114 = 0;
  v112 = &v113;
  v4 = globe[57];
  if (v4)
  {
    v5 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4);
    v6 = *v5;
    if (v5[1] != *v5)
    {
      v7 = 0;
      v8 = 0;
      v104 = v5;
      while (1)
      {
        v105 = v8;
        v9 = *(_QWORD **)(v6 + 8 * v7);
        v116[0] = 0;
        v116[1] = 0;
        v115 = v116;
        v10 = v9[41];
        if (v10)
        {
          v118 = 0;
          v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(_QWORD **)(v10 + 24), (_QWORD *)(v10 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        v11 = v9[42];
        if (v11)
        {
          v118 = 0;
          v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(_QWORD **)(v11 + 24), (_QWORD *)(v11 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        v12 = v9[43];
        if (v12)
        {
          v118 = 0;
          v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(_QWORD **)(v12 + 24), (_QWORD *)(v12 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        v13 = v9[44];
        if (v13)
        {
          v118 = 0;
          v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(_QWORD **)(v13 + 24), (_QWORD *)(v13 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        v14 = v9[45];
        if (v14)
        {
          v118 = 0;
          v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(_QWORD **)(v14 + 24), (_QWORD *)(v14 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        v15 = (uint64_t)v115;
        if (v115 != v116)
          break;
LABEL_4:
        std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v116[0]);
        v7 = (v105 + 1);
        self = (VKClassicGlobeCanvas *)&v118;
        v6 = *v104;
        v8 = v105 + 1;
        if (v7 >= (v104[1] - *v104) >> 3)
          goto LABEL_148;
      }
LABEL_18:
      v16 = *(_DWORD *)(v15 + 28);
      v17 = *(_DWORD *)(v15 + 40);
      v107 = *(_DWORD *)(v15 + 44);
      v18 = *(unsigned int *)(v15 + 48);
      v19 = *(unsigned int *)(v15 + 52);
      v20 = &v113;
      v21 = &v113;
      v22 = v113;
      if (v113)
      {
        while (1)
        {
          while (1)
          {
            v20 = (_QWORD **)v22;
            v23 = *((_DWORD *)v22 + 8);
            if (v16 >= v23)
              break;
            v22 = *v20;
            v21 = v20;
            if (!*v20)
              goto LABEL_25;
          }
          if (v23 >= v16)
            break;
          v22 = v20[1];
          if (!v22)
          {
            v21 = v20 + 1;
            goto LABEL_25;
          }
        }
        v24 = (char *)v20;
      }
      else
      {
LABEL_25:
        v24 = (char *)operator new(0x40uLL);
        *((_DWORD *)v24 + 8) = v16;
        *((_QWORD *)v24 + 7) = 0;
        *((_QWORD *)v24 + 6) = 0;
        *((_QWORD *)v24 + 5) = v24 + 48;
        *(_QWORD *)v24 = 0;
        *((_QWORD *)v24 + 1) = 0;
        *((_QWORD *)v24 + 2) = v20;
        *v21 = v24;
        v25 = v24;
        if (*v112)
        {
          v112 = (_QWORD **)*v112;
          v25 = (_QWORD *)*v21;
        }
        v26 = v113;
        v27 = v25 == v113;
        *((_BYTE *)v25 + 24) = v25 == v113;
        if (!v27)
        {
          do
          {
            v28 = v25[2];
            if (*(_BYTE *)(v28 + 24))
              break;
            v29 = *(_QWORD **)(v28 + 16);
            v30 = *v29;
            if (*v29 == v28)
            {
              v33 = v29[1];
              if (!v33 || (v34 = *(unsigned __int8 *)(v33 + 24), v31 = (_BYTE *)(v33 + 24), v34))
              {
                if (*(_QWORD **)v28 == v25)
                {
                  v35 = (uint64_t *)v25[2];
                }
                else
                {
                  v35 = *(uint64_t **)(v28 + 8);
                  v36 = *v35;
                  *(_QWORD *)(v28 + 8) = *v35;
                  if (v36)
                  {
                    *(_QWORD *)(v36 + 16) = v28;
                    v29 = *(_QWORD **)(v28 + 16);
                  }
                  v35[2] = (uint64_t)v29;
                  *(_QWORD *)(*(_QWORD *)(v28 + 16) + 8 * (**(_QWORD **)(v28 + 16) != v28)) = v35;
                  *v35 = v28;
                  *(_QWORD *)(v28 + 16) = v35;
                  v29 = (_QWORD *)v35[2];
                  v28 = *v29;
                }
                *((_BYTE *)v35 + 24) = 1;
                *((_BYTE *)v29 + 24) = 0;
                v39 = *(_QWORD *)(v28 + 8);
                *v29 = v39;
                if (v39)
                  *(_QWORD *)(v39 + 16) = v29;
                *(_QWORD *)(v28 + 16) = v29[2];
                *(_QWORD *)(v29[2] + 8 * (*(_QWORD *)v29[2] != (_QWORD)v29)) = v28;
                *(_QWORD *)(v28 + 8) = v29;
                goto LABEL_55;
              }
            }
            else if (!v30 || (v32 = *(unsigned __int8 *)(v30 + 24), v31 = (_BYTE *)(v30 + 24), v32))
            {
              if (*(_QWORD **)v28 == v25)
              {
                v37 = v25[1];
                *(_QWORD *)v28 = v37;
                if (v37)
                {
                  *(_QWORD *)(v37 + 16) = v28;
                  v29 = *(_QWORD **)(v28 + 16);
                }
                v25[2] = v29;
                *(_QWORD *)(*(_QWORD *)(v28 + 16) + 8 * (**(_QWORD **)(v28 + 16) != v28)) = v25;
                v25[1] = v28;
                *(_QWORD *)(v28 + 16) = v25;
                v29 = (_QWORD *)v25[2];
              }
              else
              {
                v25 = (_QWORD *)v25[2];
              }
              *((_BYTE *)v25 + 24) = 1;
              *((_BYTE *)v29 + 24) = 0;
              v28 = v29[1];
              v38 = *(_QWORD **)v28;
              v29[1] = *(_QWORD *)v28;
              if (v38)
                v38[2] = v29;
              *(_QWORD *)(v28 + 16) = v29[2];
              *(_QWORD *)(v29[2] + 8 * (*(_QWORD *)v29[2] != (_QWORD)v29)) = v28;
              *(_QWORD *)v28 = v29;
LABEL_55:
              v29[2] = v28;
              break;
            }
            *(_BYTE *)(v28 + 24) = 1;
            v25 = v29;
            *((_BYTE *)v29 + 24) = v29 == v26;
            *v31 = 1;
          }
          while (v29 != v26);
        }
        ++v114;
      }
      v41 = (char **)(v24 + 48);
      v40 = (char *)*((_QWORD *)v24 + 6);
      v42 = (char **)(v24 + 48);
      v43 = (char **)(v24 + 48);
      if (v40)
      {
        while (1)
        {
          while (1)
          {
            v43 = (char **)v40;
            v44 = *((_DWORD *)v40 + 8);
            if (v17 >= v44)
              break;
            v40 = *v43;
            v42 = v43;
            if (!*v43)
              goto LABEL_64;
          }
          if (v44 >= v17)
            break;
          v40 = v43[1];
          if (!v40)
          {
            v42 = v43 + 1;
            goto LABEL_64;
          }
        }
        v45 = (char *)v43;
        v49 = v107;
      }
      else
      {
LABEL_64:
        v45 = (char *)operator new(0x40uLL);
        *((_DWORD *)v45 + 8) = v17;
        *((_QWORD *)v45 + 7) = 0;
        *((_QWORD *)v45 + 6) = 0;
        *((_QWORD *)v45 + 5) = v45 + 48;
        *(_QWORD *)v45 = 0;
        *((_QWORD *)v45 + 1) = 0;
        *((_QWORD *)v45 + 2) = v43;
        *v42 = v45;
        v46 = **((_QWORD **)v24 + 5);
        v47 = v45;
        if (v46)
        {
          *((_QWORD *)v24 + 5) = v46;
          v47 = *v42;
        }
        v48 = *v41;
        v27 = v47 == *v41;
        v47[24] = v27;
        v49 = v107;
        if (!v27)
        {
          do
          {
            v50 = *((_QWORD *)v47 + 2);
            if (*(_BYTE *)(v50 + 24))
              break;
            v51 = *(char **)(v50 + 16);
            v52 = *(_QWORD *)v51;
            if (*(_QWORD *)v51 == v50)
            {
              v55 = *((_QWORD *)v51 + 1);
              if (!v55 || (v56 = *(unsigned __int8 *)(v55 + 24), v53 = (_BYTE *)(v55 + 24), v56))
              {
                if (*(char **)v50 == v47)
                {
                  v57 = (uint64_t *)*((_QWORD *)v47 + 2);
                }
                else
                {
                  v57 = *(uint64_t **)(v50 + 8);
                  v58 = *v57;
                  *(_QWORD *)(v50 + 8) = *v57;
                  if (v58)
                  {
                    *(_QWORD *)(v58 + 16) = v50;
                    v51 = *(char **)(v50 + 16);
                  }
                  v57[2] = (uint64_t)v51;
                  *(_QWORD *)(*(_QWORD *)(v50 + 16) + 8 * (**(_QWORD **)(v50 + 16) != v50)) = v57;
                  *v57 = v50;
                  *(_QWORD *)(v50 + 16) = v57;
                  v51 = (char *)v57[2];
                  v50 = *(_QWORD *)v51;
                }
                *((_BYTE *)v57 + 24) = 1;
                v51[24] = 0;
                v61 = *(_QWORD *)(v50 + 8);
                *(_QWORD *)v51 = v61;
                if (v61)
                  *(_QWORD *)(v61 + 16) = v51;
                *(_QWORD *)(v50 + 16) = *((_QWORD *)v51 + 2);
                *(_QWORD *)(*((_QWORD *)v51 + 2) + 8 * (**((_QWORD **)v51 + 2) != (_QWORD)v51)) = v50;
                *(_QWORD *)(v50 + 8) = v51;
                goto LABEL_94;
              }
            }
            else if (!v52 || (v54 = *(unsigned __int8 *)(v52 + 24), v53 = (_BYTE *)(v52 + 24), v54))
            {
              if (*(char **)v50 == v47)
              {
                v59 = *((_QWORD *)v47 + 1);
                *(_QWORD *)v50 = v59;
                if (v59)
                {
                  *(_QWORD *)(v59 + 16) = v50;
                  v51 = *(char **)(v50 + 16);
                }
                *((_QWORD *)v47 + 2) = v51;
                *(_QWORD *)(*(_QWORD *)(v50 + 16) + 8 * (**(_QWORD **)(v50 + 16) != v50)) = v47;
                *((_QWORD *)v47 + 1) = v50;
                *(_QWORD *)(v50 + 16) = v47;
                v51 = (char *)*((_QWORD *)v47 + 2);
              }
              else
              {
                v47 = (char *)*((_QWORD *)v47 + 2);
              }
              v47[24] = 1;
              v51[24] = 0;
              v50 = *((_QWORD *)v51 + 1);
              v60 = *(char **)v50;
              *((_QWORD *)v51 + 1) = *(_QWORD *)v50;
              if (v60)
                *((_QWORD *)v60 + 2) = v51;
              *(_QWORD *)(v50 + 16) = *((_QWORD *)v51 + 2);
              *(_QWORD *)(*((_QWORD *)v51 + 2) + 8 * (**((_QWORD **)v51 + 2) != (_QWORD)v51)) = v50;
              *(_QWORD *)v50 = v51;
LABEL_94:
              *((_QWORD *)v51 + 2) = v50;
              break;
            }
            *(_BYTE *)(v50 + 24) = 1;
            v47 = v51;
            v51[24] = v51 == v48;
            *v53 = 1;
          }
          while (v51 != v48);
        }
        ++*((_QWORD *)v24 + 7);
      }
      v63 = (void **)(v45 + 48);
      v62 = (char *)*((_QWORD *)v45 + 6);
      v64 = (char **)(v45 + 48);
      v65 = v45 + 48;
      if (!v62)
        goto LABEL_111;
      while (1)
      {
        while (1)
        {
          v65 = v62;
          v66 = *((_DWORD *)v62 + 7);
          if ((_DWORD)v19 == v66)
            break;
          if ((int)v19 >= v66)
          {
            if (v66 >= (int)v19)
              goto LABEL_142;
            goto LABEL_109;
          }
LABEL_98:
          v62 = *(char **)v65;
          v64 = (char **)v65;
          if (!*(_QWORD *)v65)
            goto LABEL_111;
        }
        v67 = *((_DWORD *)v65 + 8);
        if ((_DWORD)v18 != v67)
        {
          if ((int)v18 >= v67)
          {
            if (v67 >= (int)v18)
              goto LABEL_142;
            goto LABEL_109;
          }
          goto LABEL_98;
        }
        v68 = *((_DWORD *)v65 + 9);
        if (v49 < v68)
          goto LABEL_98;
        if (v68 >= v49)
          goto LABEL_142;
LABEL_109:
        v62 = (char *)*((_QWORD *)v65 + 1);
        if (!v62)
        {
          v64 = (char **)(v65 + 8);
LABEL_111:
          v69 = (char *)operator new(0x28uLL);
          *(_QWORD *)(v69 + 28) = (v18 << 32) | v19;
          *((_DWORD *)v69 + 9) = v49;
          *(_QWORD *)v69 = 0;
          *((_QWORD *)v69 + 1) = 0;
          *((_QWORD *)v69 + 2) = v65;
          *v64 = v69;
          v70 = **((_QWORD **)v45 + 5);
          if (v70)
          {
            *((_QWORD *)v45 + 5) = v70;
            v69 = *v64;
          }
          v71 = (char *)*v63;
          v27 = v69 == *v63;
          v69[24] = v27;
          if (!v27)
          {
            do
            {
              v72 = *((_QWORD *)v69 + 2);
              if (*(_BYTE *)(v72 + 24))
                break;
              v73 = *(char **)(v72 + 16);
              v74 = *(_QWORD *)v73;
              if (*(_QWORD *)v73 == v72)
              {
                v77 = *((_QWORD *)v73 + 1);
                if (!v77 || (v78 = *(unsigned __int8 *)(v77 + 24), v75 = (_BYTE *)(v77 + 24), v78))
                {
                  if (*(char **)v72 == v69)
                  {
                    v79 = (uint64_t *)*((_QWORD *)v69 + 2);
                  }
                  else
                  {
                    v79 = *(uint64_t **)(v72 + 8);
                    v80 = *v79;
                    *(_QWORD *)(v72 + 8) = *v79;
                    if (v80)
                    {
                      *(_QWORD *)(v80 + 16) = v72;
                      v73 = *(char **)(v72 + 16);
                    }
                    v79[2] = (uint64_t)v73;
                    *(_QWORD *)(*(_QWORD *)(v72 + 16) + 8 * (**(_QWORD **)(v72 + 16) != v72)) = v79;
                    *v79 = v72;
                    *(_QWORD *)(v72 + 16) = v79;
                    v73 = (char *)v79[2];
                    v72 = *(_QWORD *)v73;
                  }
                  *((_BYTE *)v79 + 24) = 1;
                  v73[24] = 0;
                  v83 = *(_QWORD *)(v72 + 8);
                  *(_QWORD *)v73 = v83;
                  if (v83)
                    *(_QWORD *)(v83 + 16) = v73;
                  *(_QWORD *)(v72 + 16) = *((_QWORD *)v73 + 2);
                  *(_QWORD *)(*((_QWORD *)v73 + 2) + 8 * (**((_QWORD **)v73 + 2) != (_QWORD)v73)) = v72;
                  *(_QWORD *)(v72 + 8) = v73;
                  goto LABEL_140;
                }
              }
              else if (!v74 || (v76 = *(unsigned __int8 *)(v74 + 24), v75 = (_BYTE *)(v74 + 24), v76))
              {
                if (*(char **)v72 == v69)
                {
                  v81 = *((_QWORD *)v69 + 1);
                  *(_QWORD *)v72 = v81;
                  if (v81)
                  {
                    *(_QWORD *)(v81 + 16) = v72;
                    v73 = *(char **)(v72 + 16);
                  }
                  *((_QWORD *)v69 + 2) = v73;
                  *(_QWORD *)(*(_QWORD *)(v72 + 16) + 8 * (**(_QWORD **)(v72 + 16) != v72)) = v69;
                  *((_QWORD *)v69 + 1) = v72;
                  *(_QWORD *)(v72 + 16) = v69;
                  v73 = (char *)*((_QWORD *)v69 + 2);
                }
                else
                {
                  v69 = (char *)*((_QWORD *)v69 + 2);
                }
                v69[24] = 1;
                v73[24] = 0;
                v72 = *((_QWORD *)v73 + 1);
                v82 = *(char **)v72;
                *((_QWORD *)v73 + 1) = *(_QWORD *)v72;
                if (v82)
                  *((_QWORD *)v82 + 2) = v73;
                *(_QWORD *)(v72 + 16) = *((_QWORD *)v73 + 2);
                *(_QWORD *)(*((_QWORD *)v73 + 2) + 8 * (**((_QWORD **)v73 + 2) != (_QWORD)v73)) = v72;
                *(_QWORD *)v72 = v73;
LABEL_140:
                *((_QWORD *)v73 + 2) = v72;
                break;
              }
              *(_BYTE *)(v72 + 24) = 1;
              v69 = v73;
              v73[24] = v73 == v71;
              *v75 = 1;
            }
            while (v73 != v71);
          }
          ++*((_QWORD *)v45 + 7);
LABEL_142:
          v84 = *(_QWORD **)(v15 + 8);
          if (v84)
          {
            do
            {
              v85 = (_QWORD **)v84;
              v84 = (_QWORD *)*v84;
            }
            while (v84);
          }
          else
          {
            do
            {
              v85 = *(_QWORD ***)(v15 + 16);
              v27 = *v85 == (_QWORD *)v15;
              v15 = (uint64_t)v85;
            }
            while (!v27);
          }
          v15 = (uint64_t)v85;
          if (v85 == v116)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_148:
  v86 = v112;
  if (v112 != &v113)
  {
    while (1)
    {
      v87 = v86[5];
      if (v87 != v86 + 6)
        break;
LABEL_152:
      v88 = v86[1];
      if (v88)
      {
        do
        {
          v89 = (_QWORD **)v88;
          v88 = (_QWORD *)*v88;
        }
        while (v88);
      }
      else
      {
        do
        {
          v89 = (_QWORD **)v86[2];
          v27 = *v89 == v86;
          v86 = v89;
        }
        while (!v27);
      }
      v86 = v89;
      if (v89 == &v113)
        goto LABEL_187;
    }
    while (1)
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v90 = v106;
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      if (v91)
      {
        v92 = 0;
        v93 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v91; ++i)
          {
            if (*(_QWORD *)v109 != v93)
              objc_enumerationMutation(v90);
            v95 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
            if (objc_msgSend(v95, "style") == *((_DWORD *)v86 + 8)
              && objc_msgSend(v95, "identifier") == *((_DWORD *)v87 + 8))
            {
              v96 = v95;

              v92 = v96;
            }
          }
          v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        }
        while (v91);

        if (v92)
          goto LABEL_170;
      }
      else
      {

      }
      v92 = objc_alloc_init(MEMORY[0x1E0D273E0]);
      objc_msgSend(v92, "setStyle:", *((unsigned int *)v86 + 8));
      objc_msgSend(v92, "setIdentifier:", *((unsigned int *)v87 + 8));
      objc_msgSend(v90, "addObject:", v92);
LABEL_170:
      v97 = (_QWORD *)v87[5];
      if (v97 != v87 + 6)
      {
        do
        {
          v100 = *((unsigned int *)v97 + 9);
          self = (VKClassicGlobeCanvas *)((unint64_t)self & 0xFFFFFFF800000000 | v100 | 0x700000000);
          objc_msgSend(v92, "addTileKey:", *((unsigned int *)v97 + 7) | ((unint64_t)((1 << v100) + ~*((_DWORD *)v97 + 8)) << 32), self);
          v101 = (_QWORD *)v97[1];
          if (v101)
          {
            do
            {
              v102 = v101;
              v101 = (_QWORD *)*v101;
            }
            while (v101);
          }
          else
          {
            do
            {
              v102 = (_QWORD *)v97[2];
              v27 = *v102 == (_QWORD)v97;
              v97 = v102;
            }
            while (!v27);
          }
          v97 = v102;
        }
        while (v102 != v87 + 6);
      }

      v98 = (_QWORD *)v87[1];
      if (v98)
      {
        do
        {
          v99 = v98;
          v98 = (_QWORD *)*v98;
        }
        while (v98);
      }
      else
      {
        do
        {
          v99 = (_QWORD *)v87[2];
          v27 = *v99 == (_QWORD)v87;
          v87 = v99;
        }
        while (!v27);
      }
      v87 = v99;
      if (v99 == v86 + 6)
        goto LABEL_152;
    }
  }
LABEL_187:
  std::__tree<std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>>>::destroy(v113);
  return (NSArray *)v106;
}

- (id)attributionsForCurrentRegion
{
  return 0;
}

- (id)annotationRectTest
{
  return (id)objc_msgSend(&__block_literal_global_48, "copy");
}

- (id)annotationCoordinateTest
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__VKClassicGlobeCanvas_annotationCoordinateTest__block_invoke;
  v3[3] = &unk_1E42F36D0;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return 1;
}

- (void)setDisableLabels:(BOOL)a3
{
  _BYTE *globe;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  self->_disableLabels = a3;
  if (self->_mapType == 4)
  {
    globe = self->_globe;
    if (a3)
    {
      altitude::GlobeView::disableLabelData((altitude::GlobeView *)self->_globe);
    }
    else
    {
      globe[433] = 1;
      v4 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)globe + 107) + 40) + 40);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 40))(v4, 1);
      v5 = *(_QWORD **)(*(_QWORD *)(*((_QWORD *)globe + 107) + 40) + 40);
      v6 = v5[12];
      if (v6)
        atomic_store(1u, (unsigned __int8 *)(v6 + 224));
      v7 = v5[10];
      if (v7)
        atomic_store(1u, (unsigned __int8 *)(v7 + 224));
      v8 = v5[11];
      if (v8)
        atomic_store(1u, (unsigned __int8 *)(v8 + 224));
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)globe + 107) + 40) + 40) + 56);
      if (v9)
        *(_BYTE *)(v9 + 136) = 1;
    }
  }
}

- (void)setDisableRoads:(BOOL)a3
{
  _BYTE *globe;
  uint64_t v4;
  char *v5;
  char v6;
  char v7;

  self->_disableRoads = a3;
  if (self->_mapType == 4)
  {
    globe = self->_globe;
    if (a3)
    {
      globe[432] = 0;
      v4 = **(_QWORD **)(*((_QWORD *)globe + 107) + 88);
      if (!v4)
        return;
      v6 = 7;
      v5 = &v6;
    }
    else
    {
      globe[432] = 1;
      v4 = **(_QWORD **)(*((_QWORD *)globe + 107) + 88);
      if (!v4)
        return;
      v7 = 7;
      v5 = &v7;
    }
    md::MapEngine::setNeedsTick(v4, v5);
  }
}

- (void)addOverlay:(id)a3
{
  id v4;
  GlobeOverlayContainer *ptr;
  VKOverlay *v6;
  uint64_t v7;
  uint64_t v8;
  md::realistic::OverlayRenderLayer *v9;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  MapEngine *var0;
  GlobeOverlayContainer *v14;
  std::__shared_weak_count *v15;
  char v16;

  v4 = a3;
  ptr = self->_overlayContainer.__ptr_;
  v6 = (VKOverlay *)v4;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  objc_msgSend(*((id *)ptr + 1), "addObject:", v6);
  v7 = *(_QWORD *)ptr;
  if (*(_QWORD *)ptr)
  {
    *(_BYTE *)(v7 + 435) = 1;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 856) + 40) + 48);
    if (!v8
      || ((*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v8 + 40))(v8, 1, 0),
          (v7 = *(_QWORD *)ptr) != 0))
    {
      v9 = *(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(v7 + 856) + 40) + 48);
      if (v9)
        md::realistic::OverlayRenderLayer::addOverlay(v9, v6);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  v14 = self->_overlayContainer.__ptr_;
  v15 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 16);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  -[VKOverlay setFlyoverContainer:](v6, "setFlyoverContainer:", &v14);
  if (v15)
    std::__shared_weak_count::__release_weak(v15);
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    v16 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v16);
  }

}

- (void)removeOverlay:(id)a3
{
  id v4;
  GlobeOverlayContainer *ptr;
  uint64_t v6;
  VKOverlay *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VKOverlay **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  size_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  void *v34;
  uint64_t v35;
  md::realistic::OverlayRenderLayer *v36;
  MapEngine *var0;
  id v38;
  uint64_t v39;
  std::__shared_weak_count *v40;

  v4 = a3;
  ptr = self->_overlayContainer.__ptr_;
  v38 = v4;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  objc_msgSend(*((id *)ptr + 1), "removeObject:", v38);
  if (*(_QWORD *)ptr)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)ptr + 856) + 40) + 48);
    if (v6)
    {
      v7 = (VKOverlay *)v38;
      md::realistic::OverlayRenderLayer::invalidateTiles((md::realistic::OverlayRenderLayer *)v6, v7);
      v8 = *(_QWORD *)(v6 + 80);
      v9 = *(_QWORD *)(v6 + 88);
      v10 = v9 - v8;
      if (v9 != v8)
      {
        v11 = 0;
        v12 = v10 >> 4;
        v13 = *(VKOverlay ***)(v6 + 80);
        while (*v13 != v7)
        {
          ++v11;
          v13 += 2;
          if (v12 == v11)
            goto LABEL_31;
        }
        v14 = v8 + 16 * v11;
        v15 = v12 - 1;
        v16 = v8 + 16 * (v12 - 1);
        objc_storeStrong((id *)v14, *(id *)v16);
        *(_DWORD *)(v14 + 8) = *(_DWORD *)(v16 + 8);
        v18 = *(char **)(v6 + 80);
        v17 = *(char **)(v6 + 88);
        v19 = (v17 - v18) >> 4;
        v20 = v15 - v19;
        if (v15 <= v19)
        {
          if (v15 < v19)
          {
            v33 = &v18[16 * v15];
            while (v17 != v33)
            {
              v34 = (void *)*((_QWORD *)v17 - 2);
              v17 -= 16;

            }
            *(_QWORD *)(v6 + 88) = v33;
          }
        }
        else
        {
          v21 = *(_QWORD *)(v6 + 96);
          if (v20 <= (v21 - (uint64_t)v17) >> 4)
          {
            bzero(*(void **)(v6 + 88), 16 * v20);
            *(_QWORD *)(v6 + 88) = &v17[16 * v20];
          }
          else
          {
            if (v15 >> 60)
              abort();
            v22 = v21 - (_QWORD)v18;
            v23 = v22 >> 3;
            if (v22 >> 3 <= v15)
              v23 = v15;
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
              v24 = 0xFFFFFFFFFFFFFFFLL;
            else
              v24 = v23;
            if (v24 >> 60)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v25 = (char *)operator new(16 * v24);
            v26 = &v25[16 * v19];
            v27 = 16 * v20;
            v28 = &v25[16 * v24];
            bzero(v26, v27);
            v29 = &v26[v27];
            if (v17 == v18)
            {
              *(_QWORD *)(v6 + 80) = v26;
              *(_QWORD *)(v6 + 88) = v29;
              *(_QWORD *)(v6 + 96) = v28;
            }
            else
            {
              v30 = v17;
              do
              {
                v31 = *((_QWORD *)v30 - 2);
                v30 -= 16;
                *(_QWORD *)v30 = 0;
                *((_QWORD *)v26 - 2) = v31;
                v26 -= 16;
                *((_DWORD *)v26 + 2) = *((_DWORD *)v30 + 2);
              }
              while (v30 != v18);
              *(_QWORD *)(v6 + 80) = v26;
              *(_QWORD *)(v6 + 88) = v29;
              *(_QWORD *)(v6 + 96) = v28;
              do
              {
                v32 = (void *)*((_QWORD *)v17 - 2);
                v17 -= 16;

              }
              while (v17 != v18);
              v17 = v18;
            }
            if (v17)
              operator delete(v17);
          }
        }
      }
LABEL_31:

    }
    v39 = 0;
    v40 = 0;
    objc_msgSend(v38, "setFlyoverContainer:", &v39);
    if (v40)
      std::__shared_weak_count::__release_weak(v40);
    if (!objc_msgSend(*((id *)ptr + 1), "count"))
    {
      v35 = *(_QWORD *)ptr;
      *(_BYTE *)(v35 + 435) = 0;
      v36 = *(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(v35 + 856) + 40) + 48);
      if (v36)
      {
        (*(void (**)(md::realistic::OverlayRenderLayer *, _QWORD, _QWORD))(*(_QWORD *)v36 + 40))(v36, 0, 0);
        v36 = *(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(v35 + 856) + 40) + 48);
      }
      md::realistic::OverlayRenderLayer::clearOverlays(v36);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v39) = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v39);
  }

}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6;
  id v7;
  GlobeOverlayContainer *ptr;
  VKOverlay *v9;
  id v10;
  uint64_t v11;
  void *v12;
  md::realistic::OverlayRenderLayer *v13;
  __shared_weak_count *cntrl;
  unint64_t *v15;
  unint64_t v16;
  MapEngine *var0;
  GlobeOverlayContainer *v18;
  std::__shared_weak_count *v19;
  char v20;

  v6 = a3;
  v7 = a4;
  ptr = self->_overlayContainer.__ptr_;
  v9 = (VKOverlay *)v6;
  v10 = v7;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  v11 = objc_msgSend(*((id *)ptr + 1), "indexOfObjectIdenticalTo:", v10);
  v12 = (void *)*((_QWORD *)ptr + 1);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v12, "addObject:", v9);
  else
    objc_msgSend(v12, "insertObject:atIndex:", v9);
  if (*(_QWORD *)ptr)
  {
    v13 = *(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)ptr + 856) + 40) + 48);
    if (v13)
      md::realistic::OverlayRenderLayer::addOverlay(v13, v9);
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  v18 = self->_overlayContainer.__ptr_;
  v19 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v15 = (unint64_t *)((char *)cntrl + 16);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  -[VKOverlay setFlyoverContainer:](v9, "setFlyoverContainer:", &v18);
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    v20 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v20);
  }

}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6;
  id v7;
  GlobeOverlayContainer *ptr;
  VKOverlay *v9;
  id v10;
  uint64_t v11;
  void *v12;
  md::realistic::OverlayRenderLayer *v13;
  __shared_weak_count *cntrl;
  unint64_t *v15;
  unint64_t v16;
  MapEngine *var0;
  GlobeOverlayContainer *v18;
  std::__shared_weak_count *v19;
  char v20;

  v6 = a3;
  v7 = a4;
  ptr = self->_overlayContainer.__ptr_;
  v9 = (VKOverlay *)v6;
  v10 = v7;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  v11 = objc_msgSend(*((id *)ptr + 1), "indexOfObjectIdenticalTo:", v10);
  v12 = (void *)*((_QWORD *)ptr + 1);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v12, "addObject:", v9);
  else
    objc_msgSend(v12, "insertObject:atIndex:", v9, v11 + 1);
  if (*(_QWORD *)ptr)
  {
    v13 = *(md::realistic::OverlayRenderLayer **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)ptr + 856) + 40) + 48);
    if (v13)
      md::realistic::OverlayRenderLayer::addOverlay(v13, v9);
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  v18 = self->_overlayContainer.__ptr_;
  v19 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v15 = (unint64_t *)((char *)cntrl + 16);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  -[VKOverlay setFlyoverContainer:](v9, "setFlyoverContainer:", &v18);
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    v20 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v20);
  }

}

- (NSArray)overlays
{
  GlobeOverlayContainer *ptr;
  std::mutex *v3;
  id v4;

  ptr = self->_overlayContainer.__ptr_;
  v3 = (std::mutex *)((char *)ptr + 16);
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  v4 = *((id *)ptr + 1);
  std::mutex::unlock(v3);
  return (NSArray *)v4;
}

- (void)didReceiveMemoryWarning:(BOOL)a3 beAggressive:(BOOL)a4
{
  _BOOL4 v4;
  GlobeAdapter *value;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t *v11;
  md::FontTrackingCache **v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  objc_super v28;

  v4 = a4;
  v28.receiver = self;
  v28.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas didReceiveMemoryWarning:beAggressive:](&v28, sel_didReceiveMemoryWarning_beAggressive_, a3);
  value = self->_globeAdapter.__ptr_.__value_;
  v8 = *(_QWORD **)value;
  v7 = (std::__shared_weak_count *)*((_QWORD *)value + 1);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (uint64_t *)v8[3];
  if (v11 != v8 + 4)
  {
    do
    {
      v15 = *(_QWORD *)(v11[6] + 504);
      if (!v15 || *(_QWORD *)(v15 + 8) == -1)
      {
        v19 = (uint64_t *)v11[1];
        v20 = v19;
        v21 = v11;
        if (v19)
        {
          do
          {
            v17 = v20;
            v20 = (uint64_t *)*v20;
          }
          while (v20);
        }
        else
        {
          do
          {
            v17 = (uint64_t *)v21[2];
            v18 = *v17 == (_QWORD)v21;
            v21 = v17;
          }
          while (!v18);
        }
        v22 = v11;
        if (v19)
        {
          do
          {
            v23 = v19;
            v19 = (uint64_t *)*v19;
          }
          while (v19);
        }
        else
        {
          do
          {
            v23 = (uint64_t *)v22[2];
            v18 = *v23 == (_QWORD)v22;
            v22 = v23;
          }
          while (!v18);
        }
        if ((uint64_t *)v8[3] == v11)
          v8[3] = v23;
        v24 = (uint64_t *)v8[4];
        --v8[5];
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v24, v11);
        v25 = (std::__shared_weak_count *)v11[7];
        if (v25)
        {
          v26 = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        operator delete(v11);
      }
      else
      {
        v16 = (uint64_t *)v11[1];
        if (v16)
        {
          do
          {
            v17 = v16;
            v16 = (uint64_t *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (uint64_t *)v11[2];
            v18 = *v17 == (_QWORD)v11;
            v11 = v17;
          }
          while (!v18);
        }
      }
      v11 = v17;
    }
    while (v17 != v8 + 4);
  }
  v12 = (md::FontTrackingCache **)*((_QWORD *)value + 10);
  if (v12)
    md::LabelManager::didReceiveMemoryWarning(v12, v4);
  if (v7)
  {
    v13 = (unint64_t *)&v7->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)_updateDebugSettings
{
  AltitudeDebugSettings *p_debugSettings;
  int altitudePauseLoading;
  int v5;
  int altitudeFreezeViewNode;
  int v7;
  _QWORD *globe;
  _BOOL4 v9;
  _BYTE *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t DebugFrustumElement;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  int altitudeTexturePaging;
  int v33;
  altitude::GlobeView *v34;
  int altitudeShowTileBounds;
  int v36;
  _BOOL4 v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  int altitudeMipmapSatellite;
  altitude::GlobeView *v43;
  int altitudeMipmapFlyover;
  int v45;
  altitude::GlobeView *v46;
  int altitudeMipmapObjectTree;
  int v48;
  altitude::GlobeView *v49;
  int altitudeShowNightLight;
  int v51;
  altitude::GlobeView *v52;
  uint64_t v53;
  float lodScale;
  float v55;
  float v56;
  float v57;
  _QWORD *v58;
  float v59;
  uint64_t v60;
  float tileQualityThreshold;
  float v62;
  float v63;
  float v64;
  float hideMeshTime;
  float v66;
  float v67;
  float v68;
  float fadeSpeed;
  float v70;
  float v71;
  float v72;
  int tourSpeedup;
  float tourSpeedupFactor;
  void *v75;
  float v76;
  float v77;
  float v78;
  float v79;
  _BYTE *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  __int128 v111;

  p_debugSettings = &self->_debugSettings;
  altitudePauseLoading = self->_debugSettings.altitudePauseLoading;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v81 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v81, "altitudePauseLoading");

  if (altitudePauseLoading != v5)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v82 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudePauseLoading = objc_msgSend(v82, "altitudePauseLoading");

    (*(void (**)(void *, BOOL))(*(_QWORD *)self->_globe + 24))(self->_globe, p_debugSettings->altitudePauseLoading);
  }
  altitudeFreezeViewNode = p_debugSettings->altitudeFreezeViewNode;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v83 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v83, "altitudeFreezeViewNode");

  if (altitudeFreezeViewNode != v7)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v84 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeFreezeViewNode = objc_msgSend(v84, "altitudeFreezeViewNode");

    globe = self->_globe;
    v9 = p_debugSettings->altitudeFreezeViewNode;
    v10 = (_BYTE *)globe[8];
    v10[56] = v9;
    v10[57] = 1;
    v11 = (_QWORD *)globe[46];
    if (v11)
    {
      v12 = (_QWORD *)v11[6];
      v13 = (_QWORD *)v11[7];
      if (v12 != v13)
      {
        v14 = *(_QWORD *)(globe[107] + 40);
        do
        {
          v18 = *(_QWORD *)(v14 + 8);
          v19 = *(_QWORD *)(v18 + 224);
          v20 = *(_QWORD *)(v18 + 232);
          v21 = v20 - v19;
          if (v20 != v19)
          {
            v22 = 0;
            v23 = v21 >> 4;
            if (v23 <= 1)
              v24 = 1;
            else
              v24 = v23;
            v25 = *(_QWORD **)(v18 + 224);
            while (*v25 != *v12)
            {
              ++v22;
              v25 += 2;
              if (v24 == v22)
                goto LABEL_8;
            }
            v15 = v19 + 16 * v22;
            v16 = v19 + 16 * v23;
            v17 = *(_QWORD *)(v16 - 16);
            v16 -= 16;
            *(_QWORD *)v15 = v17;
            *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
            *(_QWORD *)(v18 + 232) = v16;
          }
LABEL_8:
          ++v12;
        }
        while (v12 != v13);
      }
      (*(void (**)(_QWORD *))(*v11 + 8))(v11);
    }
    globe[46] = 0;
    if (v9)
    {
      v26 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(*(_QWORD *)v10 + 24))(v10, 0, 0xFFFFFFFFLL);
      v27 = *(_QWORD *)(globe[107] + 136);
      v111 = xmmword_19FFB2D90;
      DebugFrustumElement = altitude::createDebugFrustumElement(v27, v26, (void (__cdecl **)(std::__shared_weak_count *__hidden))&v111);
      globe[46] = DebugFrustumElement;
      v29 = *(uint64_t **)(DebugFrustumElement + 48);
      v30 = *(uint64_t **)(DebugFrustumElement + 56);
      while (v29 != v30)
      {
        v31 = *v29++;
        md::realistic::GlobeRenderLayer::registerNoCullingRenderable(*(_QWORD **)(*(_QWORD *)(globe[107] + 40) + 8), v31, 4);
      }
    }
  }
  altitudeTexturePaging = p_debugSettings->altitudeTexturePaging;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v85 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v85, "altitudeTexturePaging");

  if (altitudeTexturePaging != v33)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v86 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeTexturePaging = objc_msgSend(v86, "altitudeTexturePaging");

    v34 = (altitude::GlobeView *)self->_globe;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v34 + 107) + 136) + 68) = p_debugSettings->altitudeTexturePaging;
    altitude::GlobeView::reload(v34);
    -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
  }
  altitudeShowTileBounds = p_debugSettings->altitudeShowTileBounds;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v87, "altitudeShowTileBounds");

  if (altitudeShowTileBounds != v36)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v88 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeShowTileBounds = objc_msgSend(v88, "altitudeShowTileBounds");

    v37 = p_debugSettings->altitudeShowTileBounds;
    v38 = self->_globe;
    v39 = v38[86];
    ++*(_DWORD *)(v39 + 196);
    *(_BYTE *)(v39 + 205) = v37;
    v40 = **(_QWORD **)(v38[107] + 88);
    if (v40)
    {
      LOBYTE(v111) = 7;
      md::MapEngine::setNeedsTick(v40, &v111);
    }
  }
  v41 = self->_globe;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  v41[632] = objc_msgSend(v89, "altitudeShowTriggerBounds");

  altitudeMipmapSatellite = p_debugSettings->altitudeMipmapSatellite;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = objc_msgSend(v90, "altitudeMipmapSatellite");

  if (altitudeMipmapSatellite != (_DWORD)v41)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v91 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeMipmapSatellite = objc_msgSend(v91, "altitudeMipmapSatellite");

    v43 = (altitude::GlobeView *)self->_globe;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v43 + 107) + 136) + 40) = p_debugSettings->altitudeMipmapSatellite;
    altitude::GlobeView::reload(v43);
    -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
  }
  altitudeMipmapFlyover = p_debugSettings->altitudeMipmapFlyover;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v92, "altitudeMipmapFlyover");

  if (altitudeMipmapFlyover != v45)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v93 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeMipmapFlyover = objc_msgSend(v93, "altitudeMipmapFlyover");

    v46 = (altitude::GlobeView *)self->_globe;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v46 + 107) + 136) + 41) = p_debugSettings->altitudeMipmapFlyover;
    altitude::GlobeView::reload(v46);
    -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
  }
  altitudeMipmapObjectTree = p_debugSettings->altitudeMipmapObjectTree;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v94 = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v94, "altitudeMipmapObjectTree");

  if (altitudeMipmapObjectTree != v48)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v95 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeMipmapObjectTree = objc_msgSend(v95, "altitudeMipmapObjectTree");

    v49 = (altitude::GlobeView *)self->_globe;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v49 + 107) + 136) + 42) = p_debugSettings->altitudeMipmapObjectTree;
    altitude::GlobeView::reload(v49);
    -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
  }
  altitudeShowNightLight = p_debugSettings->altitudeShowNightLight;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v96 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v96, "altitudeShowNightLight");

  if (altitudeShowNightLight != v51)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    p_debugSettings->altitudeShowNightLight = objc_msgSend(v97, "altitudeShowNightLight");

    v52 = (altitude::GlobeView *)self->_globe;
    v53 = *(_QWORD *)(*((_QWORD *)v52 + 107) + 136);
    if (p_debugSettings->altitudeShowNightLight)
    {
      *(_BYTE *)(v53 + 48) = 1;
      altitude::GlobeView::updateNightLightRedrawRequest(v52);
      v52 = (altitude::GlobeView *)self->_globe;
    }
    else
    {
      *(_BYTE *)(v53 + 48) = 0;
    }
    altitude::GlobeView::reload(v52);
    -[VKClassicGlobeCanvas setupMapScene](self, "setupMapScene");
  }
  lodScale = p_debugSettings->lodScale;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v98 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "altitudeLodScale");
  v56 = v55;

  if (lodScale != v56)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v99 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "altitudeLodScale");
    p_debugSettings->lodScale = v57;

    v58 = self->_globe;
    v59 = p_debugSettings->lodScale;
    *(float *)(v58[86] + 200) = v59;
    *(float *)(v58[87] + 216) = v59;
    v60 = **(_QWORD **)(v58[107] + 88);
    if (v60)
    {
      LOBYTE(v111) = 7;
      md::MapEngine::setNeedsTick(v60, &v111);
    }
  }
  tileQualityThreshold = p_debugSettings->tileQualityThreshold;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "altitudeTileQualityThreshold");
  v63 = v62;

  if (tileQualityThreshold != v63)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "altitudeTileQualityThreshold");
    p_debugSettings->tileQualityThreshold = v64;

    *(float *)(*(_QWORD *)(*((_QWORD *)self->_globe + 107) + 136) + 52) = p_debugSettings->tileQualityThreshold;
  }
  hideMeshTime = p_debugSettings->hideMeshTime;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "altitudeHideMeshTime");
  v67 = v66;

  if (hideMeshTime != v67)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "altitudeHideMeshTime");
    p_debugSettings->hideMeshTime = v68;

    *(float *)(*(_QWORD *)(*((_QWORD *)self->_globe + 107) + 136) + 56) = p_debugSettings->hideMeshTime;
  }
  fadeSpeed = p_debugSettings->fadeSpeed;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v104 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "altitudeFadeSpeed");
  v71 = v70;

  if (fadeSpeed != v71)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v105 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "altitudeFadeSpeed");
    p_debugSettings->fadeSpeed = v72;

    *(float *)(*(_QWORD *)(*((_QWORD *)self->_globe + 107) + 136) + 60) = p_debugSettings->fadeSpeed;
  }
  tourSpeedup = p_debugSettings->tourSpeedup;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v106 = (id)objc_claimAutoreleasedReturnValue();
  if (tourSpeedup == objc_msgSend(v106, "altitudeTourSpeedup"))
  {
    tourSpeedupFactor = p_debugSettings->tourSpeedupFactor;
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "altitudeTourSpeedupFactor");
    v77 = v76;

    if (tourSpeedupFactor == v77)
      goto LABEL_57;
  }
  else
  {

  }
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v107 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "altitudeTourSpeedupFactor");
  p_debugSettings->tourSpeedupFactor = v78;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v108 = (id)objc_claimAutoreleasedReturnValue();
  p_debugSettings->tourSpeedup = objc_msgSend(v108, "altitudeTourSpeedup");

  if (p_debugSettings->tourSpeedup)
    v79 = p_debugSettings->tourSpeedupFactor;
  else
    v79 = 1.0;
  *(float *)(*((_QWORD *)self->_globe + 78) + 112) = fmaxf(fminf(v79, 10.0), -5.0);
LABEL_57:
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v109 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)self->_globe + 107) + 136) + 66) = objc_msgSend(v109, "altitudeDisableC3mTextureLoading");

  v80 = self->_globe;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v110 = (id)objc_claimAutoreleasedReturnValue();
  v80[544] = objc_msgSend(v110, "altitudePrintRenderedTilesStat");

}

- (void)waitForLoading
{
  Camera *ptr;
  double v4;
  _QWORD *globe;
  void *engine;
  altitude::GlobeView ***v7;
  int8x8_t *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[2];
  _QWORD v25[2];
  __int128 v26;
  uint64_t v27;
  char v28;
  unint64_t v29[3];
  _QWORD v30[3];
  _QWORD *v31;
  _QWORD **v32;
  _QWORD *v33[2];
  __int128 v34;
  __int128 __p;
  int v36;
  _QWORD **v37;
  _QWORD *v38[3];
  _QWORD *v39[2];
  _BYTE v40[24];
  _BYTE *v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  ptr = self->super._camera.__ptr_;
  if (*((double *)ptr + 47) * *((double *)ptr + 46) <= 0.0)
  {
    *((int64x2_t *)ptr + 23) = vdupq_n_s64(0x4080000000000000uLL);
    v4 = fmax(*((float *)ptr + 112) * 512.0, 0.0);
    *((double *)ptr + 48) = v4;
    *((double *)ptr + 49) = v4;
  }
  globe = self->_globe;
  engine = self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)engine + 567), "-[VKClassicGlobeCanvas waitForLoading]");
  v7 = (altitude::GlobeView ***)*((_QWORD *)engine + 108);
  *(_BYTE *)(globe[88] + 64) = 1;
  -[VKClassicGlobeCanvas _update](self, "_update");
  v33[0] = 0;
  v33[1] = 0;
  v32 = v33;
  v34 = 0u;
  __p = 0u;
  v36 = 1065353216;
  v37 = v38;
  v38[0] = 0;
  v39[0] = 0;
  v39[1] = 0;
  v38[1] = 0;
  v38[2] = v39;
  v41 = 0;
  v42 = 0;
  v29[0] = 0x2FED70A4459DFCA1;
  v29[1] = (unint64_t)"md::StyleLogic]";
  v29[2] = 14;
  *(_QWORD *)&v26 = 0xE42D19AFCA302E68;
  *((_QWORD *)&v26 + 1) = "md::StyleLogicContext]";
  v27 = 21;
  v28 = 1;
  v25[0] = &v26;
  v25[1] = 0;
  v24[0] = v25;
  v24[1] = 0;
  gdc::LogicExecutionGraphBuilder::addLogic((uint64_t)&v32, v29, &v26, 0, (uint64_t)v25, (uint64_t)v24);
  v8 = (int8x8_t *)*((_QWORD *)self->super._mapEngine + 140);
  v31 = 0;
  gdc::LogicExecutionGraphBuilder::build((uint64_t *)&v26, (uint64_t)&v32, v30);
  md::LogicManager::setLogicExecutionGraph(v8, (unint64_t ***)&v26);
  v9 = v26;
  if ((_QWORD)v26)
  {
    v10 = *(void **)v26;
    if (*(_QWORD *)v26)
    {
      *(_QWORD *)(v26 + 8) = v10;
      operator delete(v10);
    }
    MEMORY[0x1A1AF4E00](v9, 0x20C40960023A9);
  }
  v11 = v31;
  if (v31 == v30)
  {
    v12 = 4;
    v11 = v30;
    goto LABEL_11;
  }
  if (v31)
  {
    v12 = 5;
LABEL_11:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  v13 = CACurrentMediaTime();
  md::realistic::RealisticRenderer::warmUp(v7, v13);
  *(_QWORD *)&v26 = 0;
  *((_QWORD *)&v26 + 1) = &v26;
  v27 = 0x2020000000;
  v28 = 0;
  v14 = dispatch_time(0, 1500000000);
  dispatch_get_global_queue(-32768, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__VKClassicGlobeCanvas_waitForLoading__block_invoke;
  v23[3] = &unk_1E42F36F8;
  v23[4] = &v26;
  dispatch_after(v14, v15, v23);

  while (1)
  {
    v16 = globe[88];
    if (!*(_BYTE *)(v16 + 64)
      || *(_QWORD *)(v16 + 104) != *(_QWORD *)(v16 + 112) && *(_QWORD *)(v16 + 80) == *(_QWORD *)(v16 + 88))
    {
      break;
    }
    if (*(_BYTE *)(*((_QWORD *)&v26 + 1) + 24))
      break;
    -[VKClassicGlobeCanvas _update](self, "_update");
    v17 = CACurrentMediaTime();
    md::realistic::RealisticRenderer::warmUp(v7, v17);
    usleep(0x2710u);
  }
  _Block_object_dispose(&v26, 8);
  v18 = v41;
  if (v41 == v40)
  {
    v19 = 4;
    v18 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_23;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_23:
  std::__tree<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,std::__map_value_compare<gdc::ContextTypeWrapper,std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,gdc::ContextTypeWrapperCompare,true>,std::allocator<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>>>::destroy(v39[0]);
  std::__tree<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,std::__map_value_compare<gdc::ContextTypeWrapper,std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,gdc::ContextTypeWrapperCompare,true>,std::allocator<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>>>::destroy(v38[0]);
  v20 = (_QWORD *)__p;
  if ((_QWORD)__p)
  {
    do
    {
      v21 = (_QWORD *)*v20;
      operator delete(v20);
      v20 = v21;
    }
    while (v21);
  }
  v22 = (void *)v34;
  *(_QWORD *)&v34 = 0;
  if (v22)
    operator delete(v22);
  std::__tree<std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>,std::__map_value_compare<gdc::LogicExecutionNode,std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>,gdc::LogicExecutionNodeCompare,true>,std::allocator<std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>>>::destroy(v33[0]);
}

- (void)setupMapScene
{
  md::HomeQueueScheduler **engine;

  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas setupMapScene]");
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)engine[108] + 5) + 40) + 48) = self->_globeAdapter.__ptr_.__value_;
}

- (void)enableFlyoverStatistics
{
  atomic_store(1u, (unsigned __int8 *)(*((_QWORD *)self->_globe + 103) + 152));
  atomic_store(1u, (unsigned __int8 *)(*((_QWORD *)self->_globe + 103) + 153));
}

- (void)disableFlyoverStatistics
{
  atomic_store(0, (unsigned __int8 *)(*((_QWORD *)self->_globe + 103) + 152));
  atomic_store(0, (unsigned __int8 *)(*((_QWORD *)self->_globe + 103) + 153));
}

- (void)resetFlyoverStatistics
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t i;
  std::chrono::steady_clock::time_point *v8;

  v3 = *((_QWORD *)self->_globe + 58);
  if (*(_QWORD *)(v3 + 912))
  {
    v4 = *(_QWORD **)(v3 + 904);
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    *(_QWORD *)(v3 + 904) = 0;
    v6 = *(_QWORD *)(v3 + 896);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
        *(_QWORD *)(*(_QWORD *)(v3 + 888) + 8 * i) = 0;
    }
    *(_QWORD *)(v3 + 912) = 0;
  }
  v8 = *(std::chrono::steady_clock::time_point **)(v3 + 944);
  v8->__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  if (*(_BYTE *)(v3 + 928))
    *(_BYTE *)(v3 + 928) = 0;
  gdc::Statistics::reset(*((gdc::Statistics **)self->_globe + 103));
}

- (id)flyoverStatistics
{
  uint64_t v2;
  id v3;
  char *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void **v19;
  void *v20;
  void **v22;
  _QWORD *v23;
  _QWORD v24[3];
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  void *__p;
  void *v30;
  void *v31[4];

  v2 = *((_QWORD *)self->_globe + 103);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  gdc::Statistics::getAllSamplers((gdc::Statistics *)v31, v2);
  gdc::Statistics::dumpSamplerValues((uint64_t)&__p, (uint64_t *)v31);
  v4 = (char *)v30;
  if (v30)
  {
    do
    {
      v5 = v4 + 16;
      if (v4[39] < 0)
        v5 = (_QWORD *)*v5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v4 + 5));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v7, v6);

      v4 = *(char **)v4;
    }
    while (v4);
  }
  gdc::Statistics::getAllHistograms((gdc::Statistics *)&v27, v2);
  v8 = v27;
  v23 = v28;
  if (v27 != v28)
  {
    while (1)
    {
      gdc::Histogram::getHistogramData((gdc::Histogram *)v24, v8[1]);
      v9 = v25;
      if (v26 != v25)
        break;
      v9 = v26;
      if (v26)
        goto LABEL_8;
LABEL_9:
      v8 += 2;
      if (v8 == v23)
      {
        v8 = v27;
        goto LABEL_16;
      }
    }
    v10 = 0;
    v11 = *(double *)&v24[2];
    v12 = *(double *)v24;
    v13 = v26 - v25;
    do
    {
      v14 = v10 + 1;
      v15 = v9[v10];
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (count) [%2.1f, %2.1f]ms"), *v8, v12 + v11 * (double)v10, v12 + v11 * (double)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setValue:forKey:", v17, v16);

      }
      v10 = v14;
    }
    while (v14 < v13);
LABEL_8:
    v26 = v9;
    operator delete(v9);
    goto LABEL_9;
  }
LABEL_16:
  v18 = v3;
  if (v8)
    operator delete(v8);
  v19 = (void **)v30;
  if (v30)
  {
    do
    {
      v22 = (void **)*v19;
      if (*((char *)v19 + 39) < 0)
        operator delete(v19[2]);
      operator delete(v19);
      v19 = v22;
    }
    while (v22);
  }
  v20 = __p;
  __p = 0;
  if (v20)
    operator delete(v20);
  if (v31[0])
    operator delete(v31[0]);

  return v18;
}

- (void)enableTileAnalytics
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *a3;
  v5 = *a4;
  v6 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureTileSetStateWithTileSetStateType:newCoverage:oldCoverage:durationInOldState:", 1, v9, v7, v8);

}

- (void)disableTileAnalytics
{
  _QWORD *globe;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  globe = self->_globe;
  v12 = 0;
  altitude::GlobeView::setTileSetGridFractionChangedCallback(globe[58], v11);
  v4 = v12;
  if (v12 == v11)
  {
    v5 = 4;
    v4 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v6 = self->_globe;
  v10 = 0;
  altitude::GlobeView::setTileSetLoadedFractionChangedCallback(v6[58], v9);
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (void)_setDefaultFov:(float)a3
{
  void *globe;
  double v5;
  void *v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  uint64_t v14;
  double v15;
  char v16;

  globe = self->_globe;
  v5 = a3;
  v15 = a3;
  (*(void (**)(void *, double *))(*(_QWORD *)globe + 56))(globe, &v15);
  v6 = self->_globe;
  *((double *)v6 + 35) = v5;
  v7 = tan(v5 * 0.5);
  *((double *)v6 + 36) = v7;
  v8 = (double *)*((_QWORD *)v6 + 9);
  v10 = v8[46];
  v9 = v8[47];
  if (v9 < v10)
  {
    v11 = v9 * v10;
    v12 = v10 / v9;
    if (v11 <= 0.0)
      v12 = 1.0;
    v13 = atan(v12 * v7);
    v5 = v13 + v13;
  }
  v8[57] = v5;
  v14 = **(_QWORD **)(*((_QWORD *)v6 + 107) + 88);
  if (v14)
  {
    v16 = 7;
    md::MapEngine::setNeedsTick(v14, &v16);
  }
}

- (GlobeOverlayContainer)overlayContainer
{
  return self->_overlayContainer.__ptr_;
}

- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 cameraController:(id)a7 pounceCompletionHandler:(id)a8
{
  double var1;
  double var0;
  _BOOL8 v13;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;

  var1 = a5.var1;
  var0 = a5.var0;
  v13 = a3;
  v15 = a7;
  v16 = a8;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("VKPounceWillStartNotification"), self, 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VKCameraController stopRegionAnimation](self->super._cameraController, "stopRegionAnimation");
  -[VKScreenCanvas setCameraController:](self, "setCameraController:", v15);
  objc_msgSend(v15, "setScreenCanvas:", self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke;
  v19[3] = &unk_1E42F3730;
  v18 = v16;
  v20 = v18;
  v21 = a4;
  v19[4] = self;
  objc_msgSend(v15, "startWithPounce:startLocation:startCourse:pounceCompletionHandler:", v13, v19, var0, var1, a6);

}

- (void)didBecomeActive
{
  VKCameraController *cameraController;
  __shared_weak_count *cntrl;
  Camera *ptr;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  Camera *v11;
  __shared_weak_count *v12;

  cameraController = self->super._cameraController;
  ptr = self->super._camera.__ptr_;
  cntrl = self->super._camera.__cntrl_;
  v11 = ptr;
  v12 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  -[VKCameraController setCamera:](cameraController, "setCamera:", &v11);
  v8 = (std::__shared_weak_count *)v12;
  if (v12)
  {
    v9 = (unint64_t *)((char *)v12 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)didBecomeInActive
{
  VKCameraController *cameraController;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  cameraController = self->super._cameraController;
  v6 = 0;
  v7 = 0;
  -[VKCameraController setCamera:](cameraController, "setCamera:", &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (VKInteractiveMapDelegate)delegate
{
  return (VKInteractiveMapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)flyoverAvailable
{
  return self->_canShowFlyover;
}

- (id)sceneDidLoadCallback
{
  return self->_sceneDidLoadCallback;
}

- (void)setSceneDidLoadCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (VKGlobeCameraController)globeCameraController
{
  return self->_globeCameraController;
}

- (BOOL)disableRoads
{
  return self->_disableRoads;
}

- (BOOL)disableLabels
{
  return self->_disableLabels;
}

- (int)mapType
{
  return self->_mapType;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  self->_trafficEnabled = a3;
}

- (int)flyoverMode
{
  return self->_flyoverMode;
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
  GlobeAdapter *value;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arCameraController, 0);
  objc_storeStrong(&self->_sceneDidLoadCallback, 0);
  cntrl = self->_isDead.__cntrl_;
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
  v6 = self->_flyoverLibrary.__cntrl_;
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
  v9 = self->_overlayContainer.__cntrl_;
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
  value = self->_globeAdapter.__ptr_.__value_;
  self->_globeAdapter.__ptr_.__value_ = 0;
  if (value)
  {
    md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)value);
    MEMORY[0x1A1AF4E00]();
  }
  objc_storeStrong((id *)&self->_globeCameraController, 0);
}

- (id).cxx_construct
{
  *(_QWORD *)((char *)self + 700) = 0x100010000010000;
  *((_BYTE *)self + 708) = 1;
  *(_OWORD *)((char *)self + 712) = xmmword_19FFB57E0;
  *((_BYTE *)self + 728) = 0;
  *((_DWORD *)self + 183) = 0x40000000;
  *((_QWORD *)self + 92) = 0;
  *((_QWORD *)self + 95) = 0;
  *((_QWORD *)self + 96) = 0;
  *((_QWORD *)self + 97) = 0;
  *((_QWORD *)self + 98) = 0;
  *((_QWORD *)self + 100) = 0;
  *((_QWORD *)self + 101) = 0;
  return self;
}

void __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = a1[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (a1[6] == 1)
  {
    v3 = dispatch_time(0, 4000000000);
    v4 = a1[4];
    v5 = **(NSObject ***)(v4 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2;
    block[3] = &unk_1E42F6DA0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VKPounceDidEndNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (_QWORD)enableTileAnalytics
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E42C7AA8;
  return result;
}

uint64_t __38__VKClassicGlobeCanvas_waitForLoading__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

BOOL __48__VKClassicGlobeCanvas_annotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  __double2 v11;
  __double2 v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744);
  v5 = *(double *)(*(_QWORD *)(v4 + 784) + 1448);
  v6 = *(_QWORD *)(v4 + 72);
  if (v6)
  {
    v7 = *(double *)(v6 + 8);
    v8 = *(double *)(v6 + 16);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }
  v9 = 6371008.77 / (v5 + 6371008.77);
  v10 = a2 * 0.0174532925;
  v11 = __sincos_stret(v7);
  v12 = __sincos_stret(v10);
  return v11.__sinval * v12.__sinval + v11.__cosval * v12.__cosval * cos(-(v8 - a3 * 0.0174532925)) > v9;
}

uint64_t __42__VKClassicGlobeCanvas_annotationRectTest__block_invoke()
{
  return 2;
}

- (uint64_t)startFlyoverTourAnimation:(uint64_t)a1 animateToStart:labelChanged:stateChange:
{
  void *v2;
  void *v3;

  *(_QWORD *)(a1 + 40) = &off_1E42B55D0;
  if (*(_QWORD *)(a1 + 48))
  {

    v2 = *(void **)(a1 + 48);
  }
  else
  {
    v2 = 0;
  }

  *(_QWORD *)(a1 + 8) = &off_1E42B55B0;
  if (*(_QWORD *)(a1 + 16))
  {

    v3 = *(void **)(a1 + 16);
  }
  else
  {
    v3 = 0;
  }

  return a1;
}

- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  void *v2;
  void *v3;

  *(_QWORD *)a1 = &off_1E42C8090;
  *(_QWORD *)(a1 + 48) = &off_1E42B55D0;
  if (*(_QWORD *)(a1 + 56))
  {

    v2 = *(void **)(a1 + 56);
  }
  else
  {
    v2 = 0;
  }

  *(_QWORD *)(a1 + 16) = &off_1E42B55B0;
  if (*(_QWORD *)(a1 + 24))
  {

    v3 = *(void **)(a1 + 24);
  }
  else
  {
    v3 = 0;
  }

  return a1;
}

- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  void *v2;
  void *v3;

  *(_QWORD *)(a1 + 40) = &off_1E42B55D0;
  if (*(_QWORD *)(a1 + 48))
  {

    v2 = *(void **)(a1 + 48);
  }
  else
  {
    v2 = 0;
  }

  *(_QWORD *)(a1 + 8) = &off_1E42B55B0;
  if (*(_QWORD *)(a1 + 16))
  {

    v3 = *(void **)(a1 + 16);
  }
  else
  {
    v3 = 0;
  }

}

- (_QWORD)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  *(_QWORD *)a2 = &off_1E42C8090;
  *(_QWORD *)(a2 + 8) = *(id *)(a1 + 8);
  geo::_retain_ptr<void({block_pointer} {__strong})(VKFlyoverTourState),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((_QWORD *)(a2 + 16), a1 + 16);
  *(_BYTE *)(a2 + 40) = *(_BYTE *)(a1 + 40);
  return geo::_retain_ptr<void({block_pointer} {__strong})(NSString *),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((_QWORD *)(a2 + 48), a1 + 48);
}

uint64_t __55__VKClassicGlobeCanvas_initWithMapEngine_inBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));
}

- (uint64_t)initWithMapEngine:inBackground:
{

  return a1;
}

- (void)initWithMapEngine:inBackground:
{
  uint64_t v1;
  char v2;

  v1 = **(_QWORD **)(*(_QWORD *)(a1 + 8) + 16);
  if (v1)
  {
    v2 = 2;
    md::MapEngine::setNeedsTick(v1, &v2);
  }
}

- (_QWORD)initWithMapEngine:inBackground:
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = &off_1E42C7CE8;
  v2[1] = v3;
  return v2;
}

- (id)initWithMapEngine:inBackground:
{
  void *v3;
  id result;

  v3 = *(void **)(a1 + 8);
  *a2 = &off_1E42C7CE8;
  result = v3;
  a2[1] = result;
  return result;
}

void __51__VKClassicGlobeCanvas_enterARSessionAtCoordinate___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 888));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 888));
    objc_msgSend(v6, "map:didEnterARMode:", *(_QWORD *)(a1 + 32), a2);

  }
}

+ (BOOL)supportsMapType:(int)a3 scale:(int)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  if (a3 == 10)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeTileGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeTileSetForTileType:scale:", 15, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    return v7;
  }
  if (a3 != 4)
  {
    if (a3 != 3)
      return 0;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeTileGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeTileSetForTileType:scale:", 15, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTileGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeTileSetForTileType:scale:", 20, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v14 = v13 == 0;
  else
    v14 = 1;
  return !v14;
}

@end
