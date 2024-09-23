@implementation VKMapImageCanvas

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  VKCamera *v7;
  _QWORD *mapEngine;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  Camera *ptr;
  __shared_weak_count *v28;
  objc_super v29;
  _BYTE v30[24];
  _BYTE *v31;
  _QWORD v32[3];
  _QWORD *v33;
  _QWORD v34[3];
  _QWORD *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)VKMapImageCanvas;
  -[VKImageCanvas updateWithTimestamp:withContext:](&v29, sel_updateWithTimestamp_withContext_);
  -[VKCameraController updateWithTimestamp:withContext:](self->super._cameraController._obj, "updateWithTimestamp:withContext:", a4, a3);
  if (-[VKCameraController usesVKCamera](self->super._cameraController._obj, "usesVKCamera"))
  {
    v7 = self->super._vkCamera._obj;
    v35 = 0;
    mapEngine = self->_mapEngine;
    if (!mapEngine)
      goto LABEL_25;
    v9 = mapEngine[149];
    if (!v9)
      goto LABEL_25;
    if (*(_BYTE *)(v9 + 488) && (v10 = *(_QWORD *)(v9 + 480)) != 0)
    {
      if (v10 == v9 + 456)
      {
        v33 = v32;
        (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(v9 + 456) + 24))(v9 + 456, v32);
LABEL_10:
        v12 = v35;
        v35 = 0;
        if (v12 == v34)
        {
          v13 = 4;
          v12 = v34;
        }
        else
        {
          if (!v12)
          {
LABEL_15:
            if (!v33)
            {
              v35 = 0;
              goto LABEL_25;
            }
            if (v33 != v32)
            {
              v35 = v33;
              goto LABEL_25;
            }
            v35 = v34;
            (*(void (**)(_QWORD *, _QWORD *))(v32[0] + 24))(v32, v34);
            v14 = v33;
            if (v33 == v32)
            {
              v15 = 4;
              v14 = v32;
            }
            else
            {
              if (!v33)
                goto LABEL_25;
              v15 = 5;
            }
            (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_25:
            cntrl = self->super._camera.__cntrl_;
            ptr = self->super._camera.__ptr_;
            v28 = cntrl;
            if (cntrl)
            {
              v17 = (unint64_t *)((char *)cntrl + 8);
              do
                v18 = __ldxr(v17);
              while (__stxr(v18 + 1, v17));
            }
            v19 = (uint64_t)v35;
            if (v35)
            {
              if (v35 == v34)
              {
                v31 = v30;
                (*(void (**)(_QWORD *, _BYTE *))(v34[0] + 24))(v34, v30);
LABEL_33:
                -[VKCamera updateCamera:withAdjustment:](v7, "updateCamera:withAdjustment:", &ptr, v30);
                v20 = v31;
                if (v31 == v30)
                {
                  v21 = 4;
                  v20 = v30;
                }
                else
                {
                  if (!v31)
                    goto LABEL_38;
                  v21 = 5;
                }
                (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_38:
                v22 = (std::__shared_weak_count *)v28;
                if (v28)
                {
                  v23 = (unint64_t *)((char *)v28 + 8);
                  do
                    v24 = __ldaxr(v23);
                  while (__stlxr(v24 - 1, v23));
                  if (!v24)
                  {
                    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
                    std::__shared_weak_count::__release_weak(v22);
                  }
                }
                v25 = v35;
                if (v35 == v34)
                {
                  v26 = 4;
                  v25 = v34;
                }
                else
                {
                  if (!v35)
                  {
LABEL_48:

                    return;
                  }
                  v26 = 5;
                }
                (*(void (**)(void))(*v25 + 8 * v26))();
                goto LABEL_48;
              }
              v19 = (*(uint64_t (**)(void))(*v35 + 16))();
            }
            v31 = (_BYTE *)v19;
            goto LABEL_33;
          }
          v13 = 5;
        }
        (*(void (**)(void))(*v12 + 8 * v13))();
        goto LABEL_15;
      }
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
    }
    else
    {
      v11 = 0;
    }
    v33 = (_QWORD *)v11;
    goto LABEL_10;
  }
}

- (void)initWithMapEngine:
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "tileGroupDidChange");

}

- (void)setMapType:(int)a3
{
  char v5;

  self->super._mapType = a3;
  -[VKMapImageCanvas resetCameraController](self, "resetCameraController");
  if ((a3 - 3) >= 8)
    v5 = 0;
  else
    v5 = 0x100000000000101uLL >> (8 * (a3 - 3));
  self->_forceRasterizationForGlobe = v5;
}

- (VKMapImageCanvas)initWithMapEngine:(void *)a3
{
  VKMapImageCanvas *v4;
  VKMapImageCanvas *v5;
  VKMapImageCanvas *v6;
  uint64_t v7;
  uint64_t v8;
  OverlayContainer *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v14;
  VKManifestTileGroupObserverProxy *v15;
  void *mapEngine;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  VKManifestTileGroupObserverProxy *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t (***v24)();
  uint64_t v25;
  uint64_t (***v26)();
  uint64_t v27;
  id from;
  id to;
  id location[2];
  objc_super v32;
  uint64_t (**v33)();
  id v34;
  uint64_t (***v35)();
  uint64_t (**v36)();
  id v37;
  uint64_t (***v38)();
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)VKMapImageCanvas;
  v4 = -[VKImageCanvas initWithMapEngine:](&v32, sel_initWithMapEngine_);
  v5 = v4;
  v6 = v4;
  if (v4)
  {
    v4->_mapEngine = a3;
    v7 = *((_QWORD *)a3 + 112);
    v9 = *(OverlayContainer **)(v7 + 272);
    v8 = *(_QWORD *)(v7 + 280);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    cntrl = (std::__shared_weak_count *)v4->_overlayContainer.__cntrl_;
    v4->_overlayContainer.__ptr_ = v9;
    v4->_overlayContainer.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    -[VKMapImageCanvas resetCameraController](v6, "resetCameraController");
    v15 = [VKManifestTileGroupObserverProxy alloc];
    mapEngine = v6->_mapEngine;
    v17 = (_QWORD *)*((_QWORD *)mapEngine + 1);
    v18 = (std::__shared_weak_count *)*((_QWORD *)mapEngine + 2);
    location[0] = v17;
    location[1] = v18;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    v21 = -[VKManifestTileGroupObserverProxy initWithQueue:](v15, "initWithQueue:", *v17);
    if (v18)
    {
      v22 = (unint64_t *)&v18->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    objc_storeStrong((id *)&v5->_manifestTileGroupObserverProxy._obj, v21);
    objc_initWeak(location, v6);
    objc_copyWeak(&to, location);
    v38 = 0;
    v36 = &off_1E42C7868;
    objc_moveWeak(&v37, &to);
    v38 = &v36;
    objc_destroyWeak(&to);
    -[VKManifestTileGroupObserverProxy setDidChangeActiveTileGroup:](v21, "setDidChangeActiveTileGroup:", &v36);
    v24 = v38;
    if (v38 == &v36)
    {
      v25 = 4;
      v24 = &v36;
    }
    else
    {
      if (!v38)
        goto LABEL_23;
      v25 = 5;
    }
    (*v24)[v25]();
LABEL_23:
    objc_copyWeak(&from, location);
    v35 = 0;
    v33 = &off_1E42C78B0;
    objc_moveWeak(&v34, &from);
    v35 = &v33;
    objc_destroyWeak(&from);
    -[VKManifestTileGroupObserverProxy setExperimentConfigurationDidChange:](v21, "setExperimentConfigurationDidChange:", &v33);
    v26 = v35;
    if (v35 == &v33)
    {
      v27 = 4;
      v26 = &v33;
    }
    else
    {
      if (!v35)
      {
LABEL_28:
        objc_destroyWeak(location);

        return v6;
      }
      v27 = 5;
    }
    (*v26)[v27]();
    goto LABEL_28;
  }
  return v6;
}

- (void)resetCameraController
{
  VKMuninCameraController *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int8x8_t *v12;
  int8x8_t v13;
  uint8x8_t v14;
  uint64_t v15;
  VKMapCameraController *v16;
  void *mapEngine;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  VKCameraController *v22;
  _QWORD *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  VKCameraController *obj;
  uint64_t v32;
  int8x8_t v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  VKCameraController *v44;
  VKCameraController *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;

  if (self->super._mapType != 11)
  {
    v16 = [VKMapCameraController alloc];
    mapEngine = self->_mapEngine;
    v18 = *((_QWORD *)mapEngine + 113);
    v19 = *((_QWORD *)mapEngine + 14);
    v20 = *((_QWORD *)mapEngine + 15);
    v21 = *((id *)mapEngine + 138);
    v22 = -[VKMapCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](v16, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:", v18, v19, v20, v21);

    -[VKCameraController setCanvas:](v22, "setCanvas:", self->super._displayTarget);
    -[VKCameraController setVkCamera:](v22, "setVkCamera:", self->super._vkCamera._obj);
    v23 = self->_mapEngine;
    v24 = v23[133];
    v25 = (std::__shared_weak_count *)v23[134];
    v49 = v24;
    v50 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldxr(p_shared_owners);
      while (__stxr(v27 + 1, p_shared_owners));
    }
    -[VKCameraController setCamera:](v22, "setCamera:", &v49);
    v28 = v50;
    if (v50)
    {
      v29 = (unint64_t *)&v50->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    -[VKCameraController setMapEngine:](v22, "setMapEngine:", self->_mapEngine);
    obj = self->super._cameraController._obj;
    self->super._cameraController._obj = v22;

    return;
  }
  v3 = [VKMuninCameraController alloc];
  v4 = self->_mapEngine;
  v5 = (std::__shared_weak_count *)*((_QWORD *)v4 + 2);
  v51 = *((_QWORD *)v4 + 1);
  v52 = v5;
  if (v5)
  {
    v6 = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    v4 = self->_mapEngine;
  }
  v8 = *((_QWORD *)v4 + 113);
  v9 = *((_QWORD *)v4 + 14);
  v10 = *((_QWORD *)v4 + 15);
  v11 = *((id *)v4 + 138);
  v12 = (int8x8_t *)*((_QWORD *)self->_mapEngine + 140);
  v13 = v12[2];
  if (!*(_QWORD *)&v13)
  {
    v32 = 0;
    goto LABEL_57;
  }
  v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v13 <= 0x669A8EDAC04FCBF1uLL)
      v15 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v13;
  }
  else
  {
    v15 = (*(_QWORD *)&v13 - 1) & 0x669A8EDAC04FCBF1;
  }
  v33 = v12[1];
  v34 = *(_QWORD **)(*(_QWORD *)&v33 + 8 * v15);
  if (!v34 || (v35 = (_QWORD *)*v34) == 0)
  {
LABEL_36:
    v32 = 0;
    goto LABEL_37;
  }
  if (v14.u32[0] < 2uLL)
  {
    while (1)
    {
      v37 = v35[1];
      if (v37 == 0x669A8EDAC04FCBF1)
      {
        if (v35[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_64;
      }
      else if ((v37 & (*(_QWORD *)&v13 - 1)) != v15)
      {
        goto LABEL_36;
      }
      v35 = (_QWORD *)*v35;
      if (!v35)
        goto LABEL_36;
    }
  }
  while (1)
  {
    v36 = v35[1];
    if (v36 == 0x669A8EDAC04FCBF1)
      break;
    if (v36 >= *(_QWORD *)&v13)
      v36 %= *(_QWORD *)&v13;
    if (v36 != v15)
      goto LABEL_36;
LABEL_26:
    v35 = (_QWORD *)*v35;
    if (!v35)
      goto LABEL_36;
  }
  if (v35[2] != 0x669A8EDAC04FCBF1)
    goto LABEL_26;
LABEL_64:
  v32 = v35[5];
LABEL_37:
  if (v14.u32[0] > 1uLL)
  {
    v38 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v13 <= 0x17767EADC5B287BuLL)
      v38 = 0x17767EADC5B287BuLL % *(_QWORD *)&v13;
  }
  else
  {
    v38 = (*(_QWORD *)&v13 - 1) & 0x17767EADC5B287BLL;
  }
  v39 = *(_QWORD **)(*(_QWORD *)&v33 + 8 * v38);
  if (!v39 || (v40 = (_QWORD *)*v39) == 0)
  {
LABEL_56:
    v13 = 0;
    goto LABEL_57;
  }
  if (v14.u32[0] < 2uLL)
  {
    v41 = *(_QWORD *)&v13 - 1;
    while (1)
    {
      v43 = v40[1];
      if (v43 == 0x17767EADC5B287BLL)
      {
        if (v40[2] == 0x17767EADC5B287BLL)
          goto LABEL_65;
      }
      else if ((v43 & v41) != v38)
      {
        goto LABEL_56;
      }
      v40 = (_QWORD *)*v40;
      if (!v40)
        goto LABEL_56;
    }
  }
  while (2)
  {
    v42 = v40[1];
    if (v42 != 0x17767EADC5B287BLL)
    {
      if (v42 >= *(_QWORD *)&v13)
        v42 %= *(_QWORD *)&v13;
      if (v42 != v38)
        goto LABEL_56;
      goto LABEL_46;
    }
    if (v40[2] != 0x17767EADC5B287BLL)
    {
LABEL_46:
      v40 = (_QWORD *)*v40;
      if (!v40)
        goto LABEL_56;
      continue;
    }
    break;
  }
LABEL_65:
  v13 = (int8x8_t)v40[5];
LABEL_57:
  v44 = -[VKMuninCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:muninSceneLogic:elevationLogic:](v3, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:muninSceneLogic:elevationLogic:", &v51, v8, v9, v10, v11, v32, *(_QWORD *)&v13);
  v45 = self->super._cameraController._obj;
  self->super._cameraController._obj = v44;

  v46 = v52;
  if (v52)
  {
    v47 = (unint64_t *)&v52->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  -[VKCameraController setCanvas:](self->super._cameraController._obj, "setCanvas:", self->super._displayTarget);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = &off_1E42B5270;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  return self;
}

- (NSArray)overlays
{
  id v3;
  OverlayContainer *ptr;
  _BYTE *v5;
  _BYTE *v6;
  OverlayContainer *v7;
  char *v8;
  char *v9;
  void *v10;
  char *v11;
  char *v12;
  void (**v13)(char *);
  BOOL v14;
  void (***v15)(_QWORD);
  void (***v16)(_QWORD);
  void (**v17)(_QWORD);
  OverlayContainer *v18;
  char *v19;
  id *v20;
  id *v21;
  id v22;
  char *v23;
  char *v24;
  void (**v25)(char *);
  OverlayContainer *v26;
  char *v27;
  id *v28;
  id *v29;
  id v30;
  char *v31;
  char *v32;
  void (**v33)(char *);
  char *v35;
  char *v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  ptr = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)ptr + 232));
  v38 = 0;
  v39 = 0;
  v40 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v38, *((_QWORD *)ptr + 20), *((_QWORD *)ptr + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)ptr + 21) - *((_QWORD *)ptr + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)ptr + 232));
  v5 = v38;
  v6 = v39;
  v7 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v7 + 232));
  v35 = 0;
  v36 = 0;
  v37 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v35, *((_QWORD *)v7 + 23), *((_QWORD *)v7 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v7 + 24) - *((_QWORD *)v7 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v7 + 232));
  v8 = v35;
  v9 = v36;
  v10 = (void *)objc_msgSend(v3, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3) - 0x5555555555555555 * ((v36 - v35) >> 3));
  if (v8)
  {
    if (v9 == v8)
    {
      v8 = v9;
    }
    else
    {
      v11 = v9 - 24;
      v12 = v9 - 24;
      do
      {
        v13 = *(void (***)(char *))v12;
        v12 -= 24;
        (*v13)(v11);
        v14 = v11 == v8;
        v11 = v12;
      }
      while (!v14);
    }
    operator delete(v8);
  }
  if (v5)
  {
    if (v6 == v5)
    {
      v5 = v6;
    }
    else
    {
      v15 = (void (***)(_QWORD))(v6 - 24);
      v16 = (void (***)(_QWORD))(v6 - 24);
      do
      {
        v17 = *v16;
        v16 -= 3;
        (*v17)(v15);
        v14 = v15 == (void (***)(_QWORD))v5;
        v15 = v16;
      }
      while (!v14);
    }
    operator delete(v5);
  }
  v18 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v18 + 232));
  v38 = 0;
  v39 = 0;
  v40 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v38, *((_QWORD *)v18 + 20), *((_QWORD *)v18 + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v18 + 21) - *((_QWORD *)v18 + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v18 + 232));
  v19 = v38;
  v20 = (id *)v39;
  if (v38 == v39)
  {
    if (!v38)
      goto LABEL_28;
    goto LABEL_27;
  }
  v21 = (id *)v38;
  do
  {
    v22 = v21[1];
    objc_msgSend(v10, "addObject:", v22);

    v21 += 3;
  }
  while (v21 != v20);
  if (v19)
  {
    if (v19 != (char *)v20)
    {
      v23 = (char *)(v20 - 3);
      v24 = (char *)(v20 - 3);
      do
      {
        v25 = *(void (***)(char *))v24;
        v24 -= 24;
        (*v25)(v23);
        v14 = v23 == v19;
        v23 = v24;
      }
      while (!v14);
    }
LABEL_27:
    operator delete(v19);
  }
LABEL_28:
  v26 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v26 + 232));
  v38 = 0;
  v39 = 0;
  v40 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v38, *((_QWORD *)v26 + 23), *((_QWORD *)v26 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v26 + 24) - *((_QWORD *)v26 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v26 + 232));
  v27 = v38;
  v28 = (id *)v39;
  if (v38 == v39)
  {
    if (v38)
LABEL_38:
      operator delete(v27);
  }
  else
  {
    v29 = (id *)v38;
    do
    {
      v30 = v29[1];
      objc_msgSend(v10, "addObject:", v30);

      v29 += 3;
    }
    while (v29 != v28);
    if (v27)
    {
      if (v27 != (char *)v28)
      {
        v31 = (char *)(v28 - 3);
        v32 = (char *)(v28 - 3);
        do
        {
          v33 = *(void (***)(char *))v32;
          v32 -= 24;
          (*v33)(v31);
          v14 = v31 == v27;
          v31 = v32;
        }
        while (!v14);
      }
      goto LABEL_38;
    }
  }
  return (NSArray *)v10;
}

- (void)dealloc
{
  objc_super v3;

  -[VKCameraController setCanvas:](self->super._cameraController._obj, "setCanvas:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKMapImageCanvas;
  -[VKMapImageCanvas dealloc](&v3, sel_dealloc);
}

- (void)updateOverlays
{
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  void *__p;
  char *v18;
  uint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  md::OverlayContainer::computeTileExclusionAreas(self->_overlayContainer.__ptr_, &__p);
  v3 = (int8x8_t *)*((_QWORD *)self->_mapEngine + 140);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_21;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x87BA2765F9E38E05;
    if (*(_QWORD *)&v4 <= 0x87BA2765F9E38E05)
      v6 = 0x87BA2765F9E38E05 % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x87BA2765F9E38E05;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
  if (!v7 || (v8 = (_QWORD *)*v7) == 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0x87BA2765F9E38E05)
      {
        if (v8[2] == 0x87BA2765F9E38E05)
          goto LABEL_35;
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_21;
      }
      v8 = (_QWORD *)*v8;
      if (!v8)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v10 = v8[1];
    if (v10 == 0x87BA2765F9E38E05)
      break;
    if (v10 >= *(_QWORD *)&v4)
      v10 %= *(_QWORD *)&v4;
    if (v10 != v6)
      goto LABEL_21;
LABEL_11:
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_21;
  }
  if (v8[2] != 0x87BA2765F9E38E05)
    goto LABEL_11;
LABEL_35:
  v12 = v8[5];
LABEL_22:
  std::vector<md::TileExclusionArea>::__assign_with_size[abi:nn180100]<md::TileExclusionArea*,md::TileExclusionArea*>((_QWORD *)(v12 + 144), (char *)__p, v18, (v18 - (_BYTE *)__p) >> 6);
  v13 = *((_QWORD *)self->_mapEngine + 140);
  v14 = *(_QWORD *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    v16 = 0x87668FB4D087F775;
    if (v14 <= 0x87668FB4D087F775)
      v16 = 0x87668FB4D087F775 % v14;
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * v16);
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  else
  {
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * ((v14 - 1) & 0x87668FB4D087F775));
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  *(_BYTE *)(v15[5] + 923) = 1;
  if (__p)
    operator delete(__p);
}

- (void)addOverlay:(id)a3
{
  VKOverlay *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  OverlayContainer *ptr;
  std::__shared_weak_count *v9;

  v4 = (VKOverlay *)a3;
  md::OverlayContainer::addOverlay((md::OverlayContainer *)self->_overlayContainer.__ptr_, v4);
  cntrl = self->_overlayContainer.__cntrl_;
  ptr = self->_overlayContainer.__ptr_;
  v9 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  -[VKOverlay setStandardContainer:](v4, "setStandardContainer:", &ptr);
  if (v9)
    std::__shared_weak_count::__release_weak(v9);
  -[VKOverlay setRunLoopController:](v4, "setRunLoopController:", self->super._runLoopController, ptr);
  -[VKOverlay setForceRasterizationForGlobe:](v4, "setForceRasterizationForGlobe:", self->_forceRasterizationForGlobe);
  -[VKMapImageCanvas updateOverlays](self, "updateOverlays");

}

- (void)clearScene
{
  md::HomeQueueScheduler **mapEngine;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  mapEngine = (md::HomeQueueScheduler **)self->_mapEngine;
  md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapImageCanvas clearScene]");
  v3 = *((_QWORD *)mapEngine[1] + 1);
  v6[0] = &off_1E42D49F0;
  v6[1] = mapEngine;
  v7 = v6;
  geo::TaskQueue::barrierSync(v3, v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)cancelTileRequests
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;

  v2 = *(_QWORD *)(*((_QWORD *)self->_mapEngine + 112) + 24);
  v3 = *(_QWORD *)(v2 + 8);
  for (i = *(_QWORD *)(v2 + 16); v3 != i; v3 += 24)
    gdc::LayerDataSource::cancelAllLayerDataRequests(*(gdc::LayerDataSource **)(v3 + 8));
  gdc::ResourceManager::cleanupResources(*(gdc::ResourceManager **)(v2 + 56));
}

- (void)tileGroupDidChange
{
  md::HomeQueueScheduler **mapEngine;

  mapEngine = (md::HomeQueueScheduler **)self->_mapEngine;
  md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapImageCanvas tileGroupDidChange]");
  md::MapEngineSyncAccessor::configurationDidChange((md::MapEngineSyncAccessor *)mapEngine);
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  OverlayContainer *ptr;
  char *v5;
  id *v6;
  id *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  void (**v12)(char *);
  BOOL v13;
  OverlayContainer *v14;
  char *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  char *v20;
  char *v21;
  void (**v22)(char *);
  char *v23;
  id *v24;
  uint64_t v25;

  if (self->_forceRasterizationForGlobe == a3)
    return;
  self->_forceRasterizationForGlobe = a3;
  ptr = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)ptr + 232));
  v23 = 0;
  v24 = 0;
  v25 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v23, *((_QWORD *)ptr + 20), *((_QWORD *)ptr + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)ptr + 21) - *((_QWORD *)ptr + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)ptr + 232));
  v5 = v23;
  v6 = v24;
  if (v23 != (char *)v24)
  {
    v7 = (id *)v23;
    do
    {
      v8 = v7[1];
      objc_msgSend(v8, "setForceRasterizationForGlobe:", self->_forceRasterizationForGlobe);

      v9 = v7[1];
      objc_msgSend(v9, "setNeedsDisplayForReason:", 2);

      v7 += 3;
    }
    while (v7 != v6);
    if (!v5)
      goto LABEL_13;
    if (v5 != (char *)v6)
    {
      v10 = (char *)(v6 - 3);
      v11 = (char *)(v6 - 3);
      do
      {
        v12 = *(void (***)(char *))v11;
        v11 -= 24;
        (*v12)(v10);
        v13 = v10 == v5;
        v10 = v11;
      }
      while (!v13);
    }
    goto LABEL_12;
  }
  if (v23)
LABEL_12:
    operator delete(v5);
LABEL_13:
  v14 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v14 + 232));
  v23 = 0;
  v24 = 0;
  v25 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v23, *((_QWORD *)v14 + 23), *((_QWORD *)v14 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 + 24) - *((_QWORD *)v14 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v14 + 232));
  v15 = v23;
  v16 = v24;
  if (v23 == (char *)v24)
  {
    if (!v23)
      return;
    goto LABEL_23;
  }
  v17 = (id *)v23;
  do
  {
    v18 = v17[1];
    objc_msgSend(v18, "setForceRasterizationForGlobe:", self->_forceRasterizationForGlobe);

    v19 = v17[1];
    objc_msgSend(v19, "setNeedsDisplayForReason:", 2);

    v17 += 3;
  }
  while (v17 != v16);
  if (v15)
  {
    if (v15 != (char *)v16)
    {
      v20 = (char *)(v16 - 3);
      v21 = (char *)(v16 - 3);
      do
      {
        v22 = *(void (***)(char *))v21;
        v21 -= 24;
        (*v22)(v20);
        v13 = v20 == v15;
        v20 = v21;
      }
      while (!v13);
    }
LABEL_23:
    operator delete(v15);
  }
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

  cntrl = self->_overlayContainer.__cntrl_;
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
  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&off_1E42B5270;

}

- (uint64_t)initWithMapEngine:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)initWithMapEngine:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7868;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
