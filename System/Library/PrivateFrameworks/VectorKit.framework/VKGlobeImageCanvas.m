@implementation VKGlobeImageCanvas

- (VKGlobeImageCanvas)initWithMapEngine:(void *)a3
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  altitude::GlobeView *v9;
  uint64_t v10;
  uint64_t v11;
  altitude::GlobeView *v12;
  _QWORD *v13;
  uint64_t v14;
  VKGlobeCameraController *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  VKGlobeCameraController *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  int8x8_t *v27;
  int8x8_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  md::StyleLogic *v36;
  uint64_t *v37;
  uint64_t v38;
  std::__shared_weak_count_vtbl *v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count_vtbl *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  int8x8_t *v51;
  int8x8_t v52;
  uint8x8_t v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  md::GlobeAdapter *v65;
  unint64_t *v66;
  unint64_t v67;
  _QWORD v69[2];
  std::__shared_weak_count_vtbl *v70;
  std::__shared_weak_count *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  objc_super v74;
  char v75;

  v74.receiver = self;
  v74.super_class = (Class)VKGlobeImageCanvas;
  v4 = -[VKImageCanvas initWithMapEngine:](&v74, sel_initWithMapEngine_);
  if (!v4)
    return (VKGlobeImageCanvas *)v4;
  md::MapEngine::createFlyoverRenderer((uint64_t)a3);
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKGlobeImageCanvas initWithMapEngine:]");
  v5 = *((_QWORD *)a3 + 108);
  v6 = *(_QWORD *)(v5 + 128);
  *((_QWORD *)v4 + 16) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(v6 + 856) + 136);
  *(_BYTE *)(v7 + 42) = 1;
  *(_WORD *)(v7 + 40) = 1;
  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 856) + 136) + 49) = objc_msgSend(v8, "proceduralRoadAlpha");

  v9 = (altitude::GlobeView *)*((_QWORD *)v4 + 16);
  v10 = *(_QWORD *)(*((_QWORD *)v9 + 107) + 136);
  *(_BYTE *)(v10 + 64) = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a3 + 3) + 8) + 16);
  *(_BYTE *)(v10 + 68) = 0;
  objc_msgSend(*((id *)v4 + 12), "contentScale");
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v9 + 107) + 136) + 32) = v11;
  altitude::GlobeView::updateLodScale(v9);
  v12 = (altitude::GlobeView *)*((_QWORD *)v4 + 16);
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v12 + 107) + 136) + 48) = 1;
  altitude::GlobeView::updateNightLightRedrawRequest(v12);
  v13 = (_QWORD *)*((_QWORD *)v4 + 16);
  *(_DWORD *)(v13[86] + 200) = 1065353216;
  *(_DWORD *)(v13[87] + 216) = 1065353216;
  v14 = **(_QWORD **)(v13[107] + 88);
  if (v14)
  {
    v75 = 7;
    md::MapEngine::setNeedsTick(v14, &v75);
  }
  v15 = [VKGlobeCameraController alloc];
  v16 = (std::__shared_weak_count *)*((_QWORD *)v4 + 5);
  v72 = *((_QWORD *)v4 + 4);
  v73 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v19 = *((_QWORD *)a3 + 113);
  v20 = *((_QWORD *)a3 + 14);
  v21 = *((_QWORD *)a3 + 15);
  v22 = *((id *)a3 + 138);
  v23 = -[VKGlobeCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:](v15, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:", &v72, v19, v20, v21, v22);

  v24 = v73;
  if (v73)
  {
    v25 = (unint64_t *)&v73->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  -[VKGlobeCameraController setGlobeView:](v23, "setGlobeView:", *((_QWORD *)v4 + 16));
  -[VKCameraController setCanvas:](v23, "setCanvas:", *((_QWORD *)v4 + 12));
  -[VKGlobeCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](v23, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 2, 0, 0, 58.412323, 15.569748, 2000.0, 0.0, 0.0, 0.0);
  objc_storeStrong((id *)v4 + 2, v23);
  objc_msgSend(v4, "_updateViewport");
  v27 = (int8x8_t *)*((_QWORD *)a3 + 140);
  v28 = v27[2];
  if (!*(_QWORD *)&v28)
    goto LABEL_32;
  v29 = (uint8x8_t)vcnt_s8(v28);
  v29.i16[0] = vaddlv_u8(v29);
  if (v29.u32[0] > 1uLL)
  {
    v30 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v28 <= 0x2FED70A4459DFCA1uLL)
      v30 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v28;
  }
  else
  {
    v30 = (*(_QWORD *)&v28 - 1) & 0x2FED70A4459DFCA1;
  }
  v31 = *(_QWORD **)(*(_QWORD *)&v27[1] + 8 * v30);
  if (!v31 || (v32 = (_QWORD *)*v31) == 0)
  {
LABEL_32:
    v36 = 0;
    goto LABEL_33;
  }
  if (v29.u32[0] < 2uLL)
  {
    v33 = *(_QWORD *)&v28 - 1;
    while (1)
    {
      v35 = v32[1];
      if (v35 == 0x2FED70A4459DFCA1)
      {
        if (v32[2] == 0x2FED70A4459DFCA1)
          goto LABEL_79;
      }
      else if ((v35 & v33) != v30)
      {
        goto LABEL_32;
      }
      v32 = (_QWORD *)*v32;
      if (!v32)
        goto LABEL_32;
    }
  }
  while (1)
  {
    v34 = v32[1];
    if (v34 == 0x2FED70A4459DFCA1)
      break;
    if (v34 >= *(_QWORD *)&v28)
      v34 %= *(_QWORD *)&v28;
    if (v34 != v30)
      goto LABEL_32;
LABEL_22:
    v32 = (_QWORD *)*v32;
    if (!v32)
      goto LABEL_32;
  }
  if (v32[2] != 0x2FED70A4459DFCA1)
    goto LABEL_22;
LABEL_79:
  v36 = (md::StyleLogic *)v32[5];
LABEL_33:
  v37 = (uint64_t *)md::StyleLogic::globeContext(v36);
  v38 = *v37;
  v39 = (std::__shared_weak_count_vtbl *)operator new();
  gss::ClientStyleState<gss::PropertyID>::ClientStyleState((uint64_t)v39);
  std::shared_ptr<gss::ClientStyleState<gss::PropertyID>>::shared_ptr[abi:nn180100]<gss::ClientStyleState<gss::PropertyID>,void>(&v70, v39);
  v41 = v70;
  v40 = v71;
  if (v71)
  {
    v42 = (unint64_t *)&v71->__shared_owners_;
    do
      v43 = __ldxr(v42);
    while (__stxr(v43 + 1, v42));
  }
  *(_QWORD *)(v38 + 520) = v41;
  v44 = *(std::__shared_weak_count **)(v38 + 528);
  *(_QWORD *)(v38 + 528) = v40;
  if (v44)
  {
    v45 = (unint64_t *)&v44->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v47 = v71;
  if (v71)
  {
    v48 = (unint64_t *)&v71->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  altitude::GlobeView::setStyleManager(*((altitude::GlobeView **)v4 + 16), *v37, v37[1]);
  v50 = operator new();
  v51 = (int8x8_t *)*((_QWORD *)a3 + 140);
  v52 = v51[2];
  if (!*(_QWORD *)&v52)
    goto LABEL_66;
  v53 = (uint8x8_t)vcnt_s8(v52);
  v53.i16[0] = vaddlv_u8(v53);
  if (v53.u32[0] > 1uLL)
  {
    v54 = 0x20A1ED17D78F322BLL;
    if (*(_QWORD *)&v52 <= 0x20A1ED17D78F322BuLL)
      v54 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v52;
  }
  else
  {
    v54 = (*(_QWORD *)&v52 - 1) & 0x20A1ED17D78F322BLL;
  }
  v55 = *(_QWORD **)(*(_QWORD *)&v51[1] + 8 * v54);
  if (!v55 || (v56 = (_QWORD *)*v55) == 0)
  {
LABEL_66:
    v60 = 0;
    goto LABEL_67;
  }
  if (v53.u32[0] < 2uLL)
  {
    v57 = *(_QWORD *)&v52 - 1;
    while (1)
    {
      v59 = v56[1];
      if (v59 == 0x20A1ED17D78F322BLL)
      {
        if (v56[2] == 0x20A1ED17D78F322BLL)
          goto LABEL_80;
      }
      else if ((v59 & v57) != v54)
      {
        goto LABEL_66;
      }
      v56 = (_QWORD *)*v56;
      if (!v56)
        goto LABEL_66;
    }
  }
  while (2)
  {
    v58 = v56[1];
    if (v58 != 0x20A1ED17D78F322BLL)
    {
      if (v58 >= *(_QWORD *)&v52)
        v58 %= *(_QWORD *)&v52;
      if (v58 != v54)
        goto LABEL_66;
      goto LABEL_56;
    }
    if (v56[2] != 0x20A1ED17D78F322BLL)
    {
LABEL_56:
      v56 = (_QWORD *)*v56;
      if (!v56)
        goto LABEL_66;
      continue;
    }
    break;
  }
LABEL_80:
  v60 = v56[5];
LABEL_67:
  v61 = md::LabelsLogic::labelManagerForWorldType(v60, 1u);
  v62 = (std::__shared_weak_count *)*((_QWORD *)v61 + 1);
  v69[0] = *(_QWORD *)v61;
  v69[1] = v62;
  if (v62)
  {
    v63 = (unint64_t *)&v62->__shared_owners_;
    do
      v64 = __ldxr(v63);
    while (__stxr(v64 + 1, v63));
  }
  md::GlobeAdapter::GlobeAdapter(v50, v69);
  v65 = (md::GlobeAdapter *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v50;
  if (v65)
  {
    md::GlobeAdapter::~GlobeAdapter(v65);
    MEMORY[0x1A1AF4E00]();
  }
  if (v62)
  {
    v66 = (unint64_t *)&v62->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  md::LabelManager::setStyleManager(*(md::LabelManager **)(*((_QWORD *)v4 + 18) + 80), *v37, v37[1]);
  md::GlobeAdapter::setGlobeView(*((md::GlobeAdapter **)v4 + 18), *((altitude::GlobeView **)v4 + 16));
  *((_QWORD *)v4 + 19) = *((_QWORD *)a3 + 142);
  md::realistic::RealisticRenderer::warmUp((altitude::GlobeView ***)v5, 0.0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 40) + 48) = *((_QWORD *)v4 + 18);
  objc_msgSend(v4, "setMapType:", v4[22]);

  return (VKGlobeImageCanvas *)v4;
}

- (void)willDealloc
{
  _QWORD *globeView;
  altitude::GlobeCleanupLoader *v4;
  altitude::ObjectTreeLoader *v5;
  uint64_t v6;

  globeView = self->_globeView;
  if (globeView)
  {
    v4 = (altitude::GlobeCleanupLoader *)globeView[56];
    if (v4)
      altitude::GlobeCleanupLoader::pruneNodesAndGeometry(v4);
    v5 = (altitude::ObjectTreeLoader *)globeView[87];
    if (v5)
      altitude::ObjectTreeLoader::pruneModels(v5);
    v6 = globeView[105];
    if (v6)
      *(_BYTE *)(v6 + 376) = 1;
    if (md::HardwareFigDecoder::instance(void)::once != -1)
      dispatch_once(&md::HardwareFigDecoder::instance(void)::once, &__block_literal_global_19093);
    md::HardwareFigDecoder::discardCaches(*(std::mutex **)md::HardwareFigDecoder::instance(void)::_singleton);
    md::GlobeAdapter::setGlobeView((md::GlobeAdapter *)self->_globeAdapter.__ptr_.__value_, 0);
    -[VKCameraController setGlobeView:](self->super._cameraController._obj, "setGlobeView:", 0);
    self->_globeView = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[VKGlobeImageCanvas willDealloc](self, "willDealloc");
  -[VKCameraController setCanvas:](self->super._cameraController._obj, "setCanvas:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKGlobeImageCanvas;
  -[VKGlobeImageCanvas dealloc](&v3, sel_dealloc);
}

- (void)setMapType:(int)a3
{
  _BYTE *globeView;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;
  char v16;

  globeView = self->_globeView;
  if (a3 == 4)
  {
    globeView[432] = 1;
    v6 = *((_QWORD *)globeView + 107);
    v7 = **(_QWORD **)(v6 + 88);
    if (v7)
    {
      v15 = 7;
      md::MapEngine::setNeedsTick(v7, &v15);
      globeView = self->_globeView;
      v6 = *((_QWORD *)globeView + 107);
    }
    globeView[433] = 1;
    (*(void (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(v6 + 40) + 40) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 40), 1, 0);
    v8 = *(_QWORD **)(*(_QWORD *)(*((_QWORD *)globeView + 107) + 40) + 40);
    v9 = v8[12];
    if (v9)
      atomic_store(1u, (unsigned __int8 *)(v9 + 224));
    v10 = v8[10];
    if (v10)
      atomic_store(1u, (unsigned __int8 *)(v10 + 224));
    v11 = v8[11];
    if (v11)
      atomic_store(1u, (unsigned __int8 *)(v11 + 224));
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)globeView + 107) + 40) + 40) + 56);
    if (v12)
      *(_BYTE *)(v12 + 136) = 1;
  }
  else
  {
    altitude::GlobeView::disableLabelData((altitude::GlobeView *)self->_globeView);
    v13 = self->_globeView;
    v13[432] = 0;
    v14 = **(_QWORD **)(*((_QWORD *)v13 + 107) + 88);
    if (v14)
    {
      v16 = 7;
      md::MapEngine::setNeedsTick(v14, &v16);
    }
  }
  self->super._mapType = a3;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  Camera *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKGlobeImageCanvas;
  -[VKImageCanvas updateWithTimestamp:withContext:](&v9, sel_updateWithTimestamp_withContext_, a4, a3);
  v7 = 0x40F86A0000000000;
  v8 = 0x4024000000000000;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(_QWORD *)self->_globeView + 64))(self->_globeView, &v8, &v7);
  ptr = self->super._camera.__ptr_;
  v6 = v7;
  *((_QWORD *)ptr + 58) = v8;
  *((_QWORD *)ptr + 59) = v6;
  -[VKCameraController updateCameraManager](self->super._cameraController._obj, "updateCameraManager");
}

- (void)didLayout
{
  unsigned __int8 v3;
  MapEngine *var0;
  char v5;

  v3 = atomic_load((unsigned __int8 *)self->_globeView + 832);
  if ((v3 & 1) != 0 || altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globeView))
  {
    var0 = self->super._runLoopController->var0;
    if (var0)
    {
      v5 = 5;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v5);
    }
  }
  else
  {
    gdc::LoadingStatusTracker::setSceneStatus((uint64_t)self->_loadingStatusTracker, 2);
  }
}

- (void)_updateViewport
{
  double v3;
  int v4;
  double v5;
  int v6;
  int v8;
  long double v9;
  double v10;
  void *globeView;
  double v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  int v24;
  double *v25;
  double v26;
  double v27;
  char v28;
  char v29;

  -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
  v4 = (int)v3;
  -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
  v6 = (int)v5;
  if (v4 >= 1 && v6 >= 1)
  {
    if (v4 <= v6)
      v8 = (int)v5;
    else
      v8 = v4;
    v9 = atan((float)((float)v6 / (float)v8) * 0.267949192);
    *(float *)&v9 = v9 + v9;
    v10 = fminf(fmaxf(*(float *)&v9, 0.31416), 0.5236);
    globeView = self->_globeView;
    *((double *)globeView + 35) = v10;
    v12 = tan(v10 * 0.5);
    *((double *)globeView + 36) = v12;
    v13 = (double *)*((_QWORD *)globeView + 9);
    v15 = v13[46];
    v14 = v13[47];
    if (v14 < v15)
    {
      v16 = v14 * v15;
      v17 = v15 / v14;
      if (v16 <= 0.0)
        v17 = 1.0;
      v18 = atan(v17 * v12);
      v10 = v18 + v18;
    }
    v13[57] = v10;
    v19 = **(_QWORD **)(*((_QWORD *)globeView + 107) + 88);
    if (v19)
    {
      v28 = 7;
      md::MapEngine::setNeedsTick(v19, &v28);
    }
    v20 = (char *)self->_globeView;
    *(_QWORD *)(v20 + 636) = 0;
    *((_DWORD *)v20 + 161) = v4;
    *((_DWORD *)v20 + 162) = v6;
    v21 = **(_QWORD **)(*((_QWORD *)v20 + 107) + 88);
    if (v21)
    {
      v29 = 7;
      md::MapEngine::setNeedsTick(v21, &v29);
    }
    v22 = *((_QWORD *)v20 + 99);
    *(_QWORD *)(v22 + 40) = 0;
    *(_DWORD *)(v22 + 48) = v4;
    *(_DWORD *)(v22 + 52) = v6;
    -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
    if (v23 != 0.0)
    {
      if (v6 >= v4)
        v24 = v4;
      else
        v24 = v6;
      v25 = (double *)self->_globeView;
      v26 = (double)v24;
      -[MDRenderTarget contentScale](self->super._displayTarget, "contentScale");
      v25[48] = v26 * 0.001953125 / v27;
    }
  }
}

- (void)cancelTileRequests
{
  karo::JobManager **v2;
  karo::JobManager *v3;
  karo::JobManager *v4;
  karo::JobManager *v5;
  karo::JobManager *v6;

  v2 = *(karo::JobManager ***)(*(_QWORD *)(*((_QWORD *)self->_globeView + 107) + 136) + 72);
  v3 = *v2;
  v4 = v2[1];
  *((_BYTE *)*v2 + 64) = 1;
  *((_BYTE *)v2[2] + 64) = 1;
  if (v4)
    *((_BYTE *)v4 + 64) = 1;
  karo::JobManager::cancelAll(v3);
  karo::JobManager::cancelAll(v2[2]);
  v5 = v2[1];
  if (!v5)
  {
    *((_BYTE *)*v2 + 64) = 0;
    v6 = v2[2];
    goto LABEL_7;
  }
  karo::JobManager::cancelAll(v5);
  v6 = v2[1];
  *((_BYTE *)*v2 + 64) = 0;
  *((_BYTE *)v2[2] + 64) = 0;
  if (v6)
LABEL_7:
    *((_BYTE *)v6 + 64) = 0;
}

- (void).cxx_destruct
{
  GlobeAdapter *value;

  value = self->_globeAdapter.__ptr_.__value_;
  self->_globeAdapter.__ptr_.__value_ = 0;
  if (value)
  {
    md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)value);
    MEMORY[0x1A1AF4E00]();
  }
  objc_storeStrong((id *)&self->_vkCamera, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  return self;
}

@end
