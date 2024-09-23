@implementation VKScreenCanvas

- (VKEdgeInsets)edgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)wantsTimerTick
{
  return -[VKCameraController wantsTimerTick](self->_cameraController, "wantsTimerTick");
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  double v4;
  VKEdgeInsets v5;

  *(_QWORD *)&v5.bottom = *(_QWORD *)&a3.bottom;
  if (*(_QWORD *)&v5.top != *(_QWORD *)&self->_edgeInsets.top
    || *(_QWORD *)&a3.bottom != *(_QWORD *)&self->_edgeInsets.bottom)
  {
    HIDWORD(v4) = LODWORD(v5.left);
    self->_edgeInsets = v5;
    *(float *)&v4 = self->_edgeInsets.top;
    a3.left = self->_edgeInsets.left;
    a3.bottom = self->_edgeInsets.bottom;
    a3.right = self->_edgeInsets.right;
    -[VKCameraController setEdgeInsets:](self->_cameraController, "setEdgeInsets:", v4, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  }
}

- (id)cameraController
{
  return self->_cameraController;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  -[VKCameraController updateWithTimestamp:withContext:](self->_cameraController, "updateWithTimestamp:withContext:", a4, a3);
}

- (void)setVkCamera:(_retain_ptr<VKCamera *)
{
  VKCamera *v4;
  VKCamera *obj;

  v4 = a3._vptr$_retain_ptr[1];
  obj = self->_vkCamera._obj;
  self->_vkCamera._obj = v4;

}

- (void)setMapDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapDelegate, a3);
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  __shared_weak_count *v3;
  Camera *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(Camera **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_camera.__cntrl_;
  self->_camera.__ptr_ = v4;
  self->_camera.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (VKScreenCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  VKScreenCanvas *v5;
  VKScreenCanvas *v6;
  uint64_t v7;
  TaskContext *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v13;
  VKScreenCanvas *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VKScreenCanvas;
  v5 = -[VKScreenCanvas init](&v16, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_mapEngine = a3;
    v5->_runLoopController = (RunLoopController *)*((_QWORD *)a3 + 15);
    v5->_animationRunner = (AnimationRunner *)*((_QWORD *)a3 + 14);
    objc_storeStrong((id *)&v5->_displayTarget, *((id *)a3 + 105));
    v8 = (TaskContext *)*((_QWORD *)a3 + 1);
    v7 = *((_QWORD *)a3 + 2);
    if (v7)
    {
      v9 = (unint64_t *)(v7 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    cntrl = (std::__shared_weak_count *)v6->_taskContext.__cntrl_;
    v6->_taskContext.__ptr_ = v8;
    v6->_taskContext.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v14 = v6;
  }

  return v6;
}

- (void)setCameraController:(id)a3
{
  VKCameraController *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  VKCameraController *v9;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  Camera *ptr;
  __shared_weak_count *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  VKCameraController *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (VKCameraController *)a3;
  if (self->_cameraController != v5)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1626);
    v6 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2048;
      v30 = v5;
      _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "Camera controller did change:%@ %p", buf, 0x16u);

    }
    v9 = self->_cameraController;
    -[VKCameraController setVkCamera:](v5, "setVkCamera:", self->_vkCamera._obj);
    cntrl = self->_camera.__cntrl_;
    ptr = self->_camera.__ptr_;
    v26 = cntrl;
    if (cntrl)
    {
      v11 = (unint64_t *)((char *)cntrl + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    -[VKCameraController setCamera:](v5, "setCamera:", &ptr);
    v13 = (std::__shared_weak_count *)v26;
    if (v26)
    {
      v14 = (unint64_t *)((char *)v26 + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    -[VKCameraController setCanvas:](v5, "setCanvas:", self->_displayTarget);
    *(float *)&v16 = self->_edgeInsets.top;
    *(float *)&v17 = self->_edgeInsets.left;
    *(float *)&v18 = self->_edgeInsets.bottom;
    *(float *)&v19 = self->_edgeInsets.right;
    -[VKCameraController setEdgeInsets:](v5, "setEdgeInsets:", v16, v17, v18, v19);
    -[VKCameraController setBaseDisplayRate:](v5, "setBaseDisplayRate:", self->_baseDisplayRate);
    -[VKCameraController setMaxDisplayRate:](v5, "setMaxDisplayRate:", self->_maxDisplayRate);
    objc_storeStrong((id *)&self->_cameraController, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      -[VKCameraController transferGestureState:](v9, "transferGestureState:", self->_cameraController);
    -[VKCameraController setVkCamera:](v9, "setVkCamera:", 0);
    v23 = 0;
    v24 = 0;
    -[VKCameraController setCamera:](v9, "setCamera:", &v23);
    v20 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    -[VKCameraController setCanvas:](v9, "setCanvas:", 0);

  }
}

- (void)updateCameraForFrameResize
{
  uint64_t v3;
  double v4;
  double v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int8x8_t *v23;
  int8x8_t v24;
  uint8x8_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char v35;
  char v36;

  v3 = 0x2FED70A4459DFCA1;
  -[VKCameraController canvasDidLayout](self->_cameraController, "canvasDidLayout");
  -[MDRenderTarget size](self->_displayTarget, "size");
  v6 = (int8x8_t *)*((_QWORD *)self->_mapEngine + 140);
  v7 = v6[2];
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = 0x2FED70A4459DFCA1;
      if (*(_QWORD *)&v7 <= 0x2FED70A4459DFCA1uLL)
        v9 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v7;
    }
    else
    {
      v9 = (*(_QWORD *)&v7 - 1) & 0x2FED70A4459DFCA1;
    }
    v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          v12 = *(_QWORD *)&v7 - 1;
          while (1)
          {
            v14 = v11[1];
            if (v14 == 0x2FED70A4459DFCA1)
            {
              if (v11[2] == 0x2FED70A4459DFCA1)
                goto LABEL_67;
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_21;
            }
            v11 = (_QWORD *)*v11;
            if (!v11)
              goto LABEL_21;
          }
        }
        do
        {
          v13 = v11[1];
          if (v13 == 0x2FED70A4459DFCA1)
          {
            if (v11[2] == 0x2FED70A4459DFCA1)
            {
LABEL_67:
              v15 = v11[5];
              goto LABEL_22;
            }
          }
          else
          {
            if (v13 >= *(_QWORD *)&v7)
              v13 %= *(_QWORD *)&v7;
            if (v13 != v9)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_21:
  v15 = 0;
LABEL_22:
  v16 = *(_QWORD *)(v15 + 208);
  v17 = fmin(v5, v4);
  if (v17 <= 250.0)
  {
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v16, 0x10018u, 0);
    v22 = 0;
    v21 = *(_QWORD *)(v15 + 224);
  }
  else
  {
    if (v17 <= 850.0)
      v18 = 2;
    else
      v18 = 3;
    if (v17 <= 450.0)
      v19 = 1;
    else
      v19 = v18;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v16, 0x10018u, v19);
    if (v17 <= 850.0)
      v20 = 2;
    else
      v20 = 3;
    v21 = *(_QWORD *)(v15 + 224);
    if (v17 <= 450.0)
      v22 = 1;
    else
      v22 = v20;
  }
  gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(v21, 0x10018u, v22);
  v23 = (int8x8_t *)*((_QWORD *)self->_mapEngine + 140);
  v24 = v23[2];
  if (!*(_QWORD *)&v24)
    goto LABEL_56;
  v25 = (uint8x8_t)vcnt_s8(v24);
  v25.i16[0] = vaddlv_u8(v25);
  if (v25.u32[0] > 1uLL)
  {
    if (*(_QWORD *)&v24 <= 0x2FED70A4459DFCA1uLL)
      v3 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v24;
  }
  else
  {
    v3 = (*(_QWORD *)&v24 - 1) & 0x2FED70A4459DFCA1;
  }
  v26 = *(_QWORD **)(*(_QWORD *)&v23[1] + 8 * v3);
  if (!v26 || (v27 = (_QWORD *)*v26) == 0)
  {
LABEL_56:
    v31 = 0;
    goto LABEL_57;
  }
  if (v25.u32[0] < 2uLL)
  {
    v28 = *(_QWORD *)&v24 - 1;
    while (1)
    {
      v30 = v27[1];
      if (v30 == 0x2FED70A4459DFCA1)
      {
        if (v27[2] == 0x2FED70A4459DFCA1)
          goto LABEL_68;
      }
      else if ((v30 & v28) != v3)
      {
        goto LABEL_56;
      }
      v27 = (_QWORD *)*v27;
      if (!v27)
        goto LABEL_56;
    }
  }
  while (1)
  {
    v29 = v27[1];
    if (v29 == 0x2FED70A4459DFCA1)
      break;
    if (v29 >= *(_QWORD *)&v24)
      v29 %= *(_QWORD *)&v24;
    if (v29 != v3)
      goto LABEL_56;
LABEL_46:
    v27 = (_QWORD *)*v27;
    if (!v27)
      goto LABEL_56;
  }
  if (v27[2] != 0x2FED70A4459DFCA1)
    goto LABEL_46;
LABEL_68:
  v31 = v27[5];
LABEL_57:
  v35 = 4;
  v32 = *(char **)(v31 + 1128);
  v33 = *(char **)(v31 + 1136);
  if (v32 != v33)
  {
    while (*v32 <= 3u)
    {
      if (++v32 == v33)
        goto LABEL_63;
    }
  }
  if (v32 == v33 || (v33 = v32, *v32 != 4))
LABEL_63:
    std::vector<md::StyleManagerEvent>::insert(v31 + 1128, v33, &v35);
  v34 = **(_QWORD **)(v31 + 1240);
  if (v34)
  {
    v36 = 12;
    md::MapEngine::setNeedsTick(v34, &v36);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = &off_1E42B54B0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_QWORD *)self + 28) = 0x3FF0000000000000;
  *((_QWORD *)self + 77) = 0xBFF0000000000000;
  *((_QWORD *)self + 78) = 0x3FF0000000000000;
  *((_DWORD *)self + 159) = 2;
  return self;
}

- (void)dealloc
{
  VKCameraController *cameraController;
  objc_super v4;

  self->_deallocing = 1;
  cameraController = self->_cameraController;
  self->_cameraController = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKScreenCanvas;
  -[VKScreenCanvas dealloc](&v4, sel_dealloc);
}

- (void)runAnimation:(id)a3
{
  md::AnimationRunner::runAnimation((md::MapEngine **)self->_animationRunner, (VKAnimation *)a3);
}

- (BOOL)isGesturing
{
  return self->_userIsGesturing;
}

- (void)setGesturing:(BOOL)a3
{
  MapEngine *var0;
  char v5;

  if (self->_userIsGesturing != a3)
  {
    self->_userIsGesturing = a3;
    -[VKCameraController setGesturing:](self->_cameraController, "setGesturing:");
    var0 = self->_runLoopController->var0;
    if (var0)
    {
      v5 = 1;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v5);
    }
  }
}

- (void)cameraController:(id)a3 requestsDisplayRate:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapDelegate);
  objc_msgSend(WeakRetained, "mapController:requestsDisplayRate:", self, a4);

}

- (void)setBaseDisplayRate:(int64_t)a3
{
  VKCameraController *cameraController;

  self->_baseDisplayRate = a3;
  cameraController = self->_cameraController;
  if (cameraController)
    -[VKCameraController setBaseDisplayRate:](cameraController, "setBaseDisplayRate:");
}

- (void)setMaxDisplayRate:(int64_t)a3
{
  VKCameraController *cameraController;

  self->_maxDisplayRate = a3;
  cameraController = self->_cameraController;
  if (cameraController)
    -[VKCameraController setMaxDisplayRate:](cameraController, "setMaxDisplayRate:");
}

- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4
{
  return 0;
}

- (void)transferStateFromCanvas:(id)a3
{
  void *v4;
  id v5;
  VKCameraController *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[3];

  objc_msgSend(a3, "cameraController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController setStaysCenteredDuringRotation:](self->_cameraController, "setStaysCenteredDuringRotation:", objc_msgSend(v4, "staysCenteredDuringRotation"));
  -[VKCameraController setStaysCenteredDuringPinch:](self->_cameraController, "setStaysCenteredDuringPinch:", objc_msgSend(v4, "staysCenteredDuringPinch"));
  -[VKCameraController setGesturing:](self->_cameraController, "setGesturing:", objc_msgSend(v4, "isGesturing"));
  -[VKCameraController setIsPitchEnabled:](self->_cameraController, "setIsPitchEnabled:", objc_msgSend(v4, "isPitchEnabled"));
  -[VKCameraController setEdgeInsetsAnimating:](self->_cameraController, "setEdgeInsetsAnimating:", objc_msgSend(v4, "edgeInsetsAnimating"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v4;
    v6 = self->_cameraController;
    objc_msgSend(v5, "trackingAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(v5, "isTrackingHeading");
      objc_msgSend(v5, "stopTrackingAnnotation");
      if (v5)
        objc_msgSend(v5, "annotationTrackingBehavior");
      else
        memset(v9, 0, sizeof(v9));
      -[VKCameraController setAnnotationTrackingBehavior:](v6, "setAnnotationTrackingBehavior:", v9);
      -[VKCameraController startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](v6, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v7, v8, 0, 0, -1.0);
    }

  }
}

- (int64_t)tileSize
{
  return 256;
}

- (_retain_ptr<VKCamera)vkCamera
{
  _QWORD *v2;
  _QWORD *v3;
  VKCamera *v4;
  VKCamera *v5;
  _retain_ptr<VKCamera *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc> result;

  v3 = v2;
  *v2 = &off_1E42B54B0;
  v4 = self->_vkCamera._obj;
  v3[1] = v4;
  result._obj = v5;
  result._vptr$_retain_ptr = (void **)&v4->super.isa;
  return result;
}

- (shared_ptr<gdc::Camera>)camera
{
  Camera **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<gdc::Camera> result;

  cntrl = self->_camera.__cntrl_;
  *v2 = self->_camera.__ptr_;
  v2[1] = (Camera *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Camera *)self;
  return result;
}

- (VKEdgeInsets)fullyOccludedEdgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_fullyOccludedEdgeInsets.top;
  left = self->_fullyOccludedEdgeInsets.left;
  bottom = self->_fullyOccludedEdgeInsets.bottom;
  right = self->_fullyOccludedEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3
{
  self->_fullyOccludedEdgeInsets = a3;
}

- (MDMapControllerDelegate)mapDelegate
{
  return (MDMapControllerDelegate *)objc_loadWeakRetained((id *)&self->_mapDelegate);
}

- (void)mapEngine
{
  return self->_mapEngine;
}

- (int64_t)baseDisplayRate
{
  return self->_baseDisplayRate;
}

- (int64_t)maxDisplayRate
{
  return self->_maxDisplayRate;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  objc_storeStrong((id *)&self->_arSession, 0);
  objc_destroyWeak((id *)&self->_mapDelegate);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong((id *)&self->_displayTarget, 0);
  cntrl = self->_camera.__cntrl_;
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
  self->_vkCamera._vptr$_retain_ptr = (void **)&off_1E42B54B0;

  v6 = self->_taskContext.__cntrl_;
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
}

@end
