@implementation VKDaVinciCameraController

- (VKDaVinciCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6 mapEngine:(void *)a7
{
  id v12;
  VKDaVinciCameraController *v13;
  VKDaVinciCameraController *v14;
  uint64_t v15;
  VKDaVinciGestureCameraController *v16;
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  objc_super v19;

  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VKDaVinciCameraController;
  v13 = -[VKScreenCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v19, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a3, a4, a5, v12);
  v14 = v13;
  if (v13)
  {
    v13->_mapEngine = a7;
    v15 = operator new();
    *(_QWORD *)v15 = &off_1E428D708;
    *(_QWORD *)(v15 + 8) = a3;
    *(_WORD *)(v15 + 16) = 0;
    *(_BYTE *)(v15 + 18) = 0;
    *(_QWORD *)(v15 + 96) = 0;
    *(_QWORD *)(v15 + 104) = 0;
    *(_QWORD *)(v15 + 88) = 0;
    *(_QWORD *)(v15 + 144) = 0;
    *(_QWORD *)(v15 + 152) = 0;
    *(_QWORD *)(v15 + 136) = 0;
    *(_QWORD *)(v15 + 200) = 0;
    *(_QWORD *)(v15 + 208) = 0;
    *(_QWORD *)(v15 + 192) = 0;
    *(_OWORD *)(v15 + 48) = 0u;
    *(_OWORD *)(v15 + 64) = 0u;
    *(_DWORD *)(v15 + 80) = 0;
    *(_QWORD *)(v15 + 120) = 0;
    *(_DWORD *)(v15 + 127) = 0;
    *(_DWORD *)(v15 + 183) = 0;
    *(_QWORD *)(v15 + 176) = 0;
    *(_QWORD *)(v15 + 237) = 0;
    *(_QWORD *)(v15 + 224) = 0;
    *(_QWORD *)(v15 + 232) = 0;
    *(_QWORD *)(v15 + 248) = 0;
    *(_QWORD *)(v15 + 256) = 0;
    *(_QWORD *)(v15 + 264) = 0xBFF0000000000000;
    *(_OWORD *)(v15 + 320) = xmmword_19FFB5940;
    *(_OWORD *)(v15 + 336) = xmmword_19FFB2E00;
    *(_OWORD *)(v15 + 352) = xmmword_19FFB5950;
    *(_OWORD *)(v15 + 368) = xmmword_19FFB2E00;
    *(_OWORD *)(v15 + 384) = xmmword_19FFB5950;
    *(_OWORD *)(v15 + 400) = xmmword_19FFB2E00;
    *(_QWORD *)(v15 + 416) = 0xFFEFFFFFFFFFFFFFLL;
    v14->_cameraManager = (void *)v15;
    v14->_currentDoublePanPitch = 0.0;
    v14->_isPitching = 0;
    v14->_isRotating = 0;
    -[VKCameraController setIsPitchEnabled:](v14, "setIsPitchEnabled:", 1);
    *(_QWORD *)&v14->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel = 1;
    *(_OWORD *)&v14->super._annotationTrackingBehavior.shouldZoomToFit = VKAnnotationTrackingBehaviorDefault;
    v16 = -[VKDaVinciGestureCameraController initWithCameraController:cameraManager:]([VKDaVinciGestureCameraController alloc], "initWithCameraController:cameraManager:", v14, v14->_cameraManager);
    gestureCameraControllerBehavior = v14->super._gestureCameraControllerBehavior;
    v14->super._gestureCameraControllerBehavior = &v16->super;

  }
  return v14;
}

- (void)dealloc
{
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  void *cameraManager;
  objc_super v5;

  gestureCameraControllerBehavior = self->super._gestureCameraControllerBehavior;
  self->super._gestureCameraControllerBehavior = 0;

  cameraManager = self->_cameraManager;
  if (cameraManager)
    (*(void (**)(void *))(*(_QWORD *)cameraManager + 8))(cameraManager);
  v5.receiver = self;
  v5.super_class = (Class)VKDaVinciCameraController;
  -[VKScreenCameraController dealloc](&v5, sel_dealloc);
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
  double *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  double v21[3];
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  std::__shared_weak_count *v25;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v24 = *(_QWORD *)a3.__ptr_;
  v25 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v23.receiver = self;
  v23.super_class = (Class)VKDaVinciCameraController;
  -[VKScreenCameraController setCamera:](&v23, sel_setCamera_, &v24, a3.__cntrl_);
  v8 = v25;
  if (!v25)
    goto LABEL_8;
  v9 = (unint64_t *)&v25->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    v11 = *(double **)ptr;
    if (!*(_QWORD *)ptr)
      return;
  }
  else
  {
LABEL_8:
    v11 = *(double **)ptr;
    if (!*(_QWORD *)ptr)
      return;
  }
  -[VKCameraController vkCamera](self, "vkCamera", gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v21, v11 + 1, *(unsigned __int8 *)v11 == 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", v21);

  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOrientation:", &v22);

  -[VKCameraController camera](self, "camera");
  v14 = *(_OWORD *)(*(_QWORD *)ptr + 24);
  v15 = *(_OWORD *)(*(_QWORD *)ptr + 40);
  v16 = *(_QWORD *)(*(_QWORD *)ptr + 56);
  *(_OWORD *)(v19 + 8) = *(_OWORD *)(*(_QWORD *)ptr + 8);
  *(_QWORD *)(v19 + 56) = v16;
  *(_OWORD *)(v19 + 40) = v15;
  *(_OWORD *)(v19 + 24) = v14;
  if (v20)
  {
    v17 = (unint64_t *)&v20->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  -[VKDaVinciCameraController updateCameraLimits](self, "updateCameraLimits");
}

- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  char *cameraManager;
  Matrix<int, 2, 1> v9;
  double *v10;
  Matrix<int, 2, 1> v11;

  y = a4.y;
  x = a4.x;
  self->_isPitching = 0;
  if (!self->_isRotating)
  {
    cameraManager = (char *)self->_cameraManager;
    v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", a4.x, a4.y);
    *(_WORD *)(cameraManager + 81) = 1;
    cameraManager[83] = 0;
    *((Matrix<int, 2, 1> *)cameraManager + 14) = v9;
    *((_QWORD *)cameraManager + 15) = 0;
    self->_isRotating = 1;
  }
  v10 = (double *)self->_cameraManager;
  v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  v10[15] = v10[15] + a3;
  *((Matrix<int, 2, 1> *)v10 + 14) = v11;
}

- (void)pitch:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  _WORD *cameraManager;
  Matrix<int, 2, 1> v9;
  double v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  Matrix<int, 2, 1> *v18;
  Matrix<int, 2, 1> v19;
  double v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  y = a3.y;
  x = a3.x;
  if (-[VKCameraController isPitchEnabled](self, "isPitchEnabled"))
  {
    self->_isRotating = 0;
    self->super._isPitchIncreasing = a4 < 0.0;
    if (!self->_isPitching)
    {
      cameraManager = self->_cameraManager;
      v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((_BYTE *)cameraManager + 130) = 0;
      *((_QWORD *)cameraManager + 22) = 0;
      *((Matrix<int, 2, 1> *)cameraManager + 20) = v9;
      *((Matrix<int, 2, 1> *)cameraManager + 21) = v9;
      self->_isPitching = 1;
    }
    -[VKCameraController camera](self, "camera");
    v10 = *(double *)(v21 + 72);
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)())v22->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v13 = self->_beganDoublePanPitch - a4;
    v14 = fmax(v10, 0.0);
    if (v14 >= v13)
    {
      if (v13 >= 0.0)
      {
LABEL_14:
        v17 = fmin(fmax(v13, 0.0), v10 + 0.0698131701);
        v18 = (Matrix<int, 2, 1> *)self->_cameraManager;
        v19 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
        v20 = v17 - self->_currentDoublePanPitch;
        v18[20] = v19;
        *(double *)&v18[22] = v20 + *(double *)&v18[22];
        self->_currentDoublePanPitch = v17;
        -[VKDaVinciCameraController _updateIsPitched](self, "_updateIsPitched");
        -[VKDaVinciCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
        return;
      }
      v15 = 0.0698131701 / (v13 * -7.87816968 + 1.0);
      v16 = -0.0698131701;
    }
    else
    {
      v15 = 0.0698131701 / ((v14 - v13) * 7.87816968 + -1.0);
      v16 = v14 + 0.0698131701;
    }
    v13 = v15 + v16;
    goto LABEL_14;
  }
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  else
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  v12 = v10;
  v13 = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__VKDaVinciCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
  v15[3] = &unk_1E42F4BE0;
  v14 = v9;
  v16 = v14;
  -[VKDaVinciCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v15, v12, v13, a3);

}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  _WORD *cameraManager;
  Matrix<int, 2, 1> v11;

  y = a3.y;
  x = a3.x;
  if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  else
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  v8 = v6;
  v9 = v7;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  cameraManager = self->_cameraManager;
  v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v8, v9);
  cameraManager[92] = 1;
  *((_BYTE *)cameraManager + 186) = 0;
  *((Matrix<int, 2, 1> *)cameraManager + 27) = v11;
  *((_QWORD *)cameraManager + 28) = 0x3FF0000000000000;
  *((_BYTE *)cameraManager + 240) = 0;
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double x;
  double y;
  VKAnimation *zoomAnimation;
  double *cameraManager;
  Matrix<int, 2, 1> v12;
  void *v13;
  uint64_t v14;
  char v15;

  x = a3.x;
  if (a5 >= 0.01)
  {
    y = a3.y;
    zoomAnimation = self->super._zoomAnimation;
    if (!zoomAnimation || !-[VKAnimation running](zoomAnimation, "running"))
    {
      if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
        -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      else
        -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
      cameraManager = (double *)self->_cameraManager;
      v12 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      cameraManager[28] = cameraManager[28] * (a4 * 0.7 / a5 + 0.3);
      *((Matrix<int, 2, 1> *)cameraManager + 27) = v12;
      self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
      -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mapLayerDidChangeVisibleRegion");

      v14 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
      if (v14)
      {
        v15 = 4;
        md::MapEngine::setNeedsTick(v14, &v15);
      }
    }
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKAnimation *zoomAnimation;
  _BYTE *cameraManager;

  y = a3.y;
  x = a3.x;
  zoomAnimation = self->super._zoomAnimation;
  if (!zoomAnimation || !-[VKAnimation running](zoomAnimation, "running"))
  {
    if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    else
      -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
    cameraManager = self->_cameraManager;
    -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    cameraManager[186] = 1;
    -[VKCameraController endRegionChange](self, "endRegionChange");
    -[VKDaVinciCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1;
  double var0;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  _QWORD v26[2];
  double v27;
  double v28;

  var1 = a3.var1;
  var0 = a3.var0;
  v19 = a9;
  v20 = a10;
  v21 = var0 * 0.0174532925;
  v22 = var1 * 0.0174532925;
  v23 = a6 * 0.0174532925;
  v24 = a4 / fmax(cos(v23), 0.00001);
  if (a8)
  {
    if (a8 != 2)
    {
      *(double *)v26 = v21;
      *(double *)&v26[1] = v22;
      -[VKDaVinciCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", v26, 0, v19, v20, 0.0, v24, a5 * -0.0174532925, v23, a7);
      goto LABEL_7;
    }
    v28 = v21;
    a7 = 0.0;
    v25 = &v28;
  }
  else
  {
    v27 = v21;
    v25 = &v27;
  }
  v25[1] = v22;
  -[VKDaVinciCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v24, a5 * -0.0174532925, v23, a7);
LABEL_7:

}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2;
  double var1;
  double var0;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26[2];
  double v27;
  double v28;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v20 = a9;
  v21 = a10;
  v22 = a6 * 0.0174532925;
  v23 = a4 / fmax(cos(v22), 0.00001);
  v24 = a5 * -0.0174532925;
  if (a8)
  {
    if (a8 != 2)
    {
      v26[0] = var0 * 0.0174532925;
      v26[1] = var1 * 0.0174532925;
      -[VKDaVinciCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", v26, 1, v20, v21, var2, v23, v24, v22, a7);
      goto LABEL_7;
    }
    v28 = var0 * 0.0174532925;
    a7 = 0.0;
    v25 = &v28;
  }
  else
  {
    v27 = var0 * 0.0174532925;
    v25 = &v27;
  }
  v25[1] = var1 * 0.0174532925;
  -[VKDaVinciCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", var2, v23, v24, v22, a7);
LABEL_7:

}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  double v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  unint64_t *v16;
  unint64_t v17;
  double v18;
  BOOL v19;
  unint64_t *v20;
  unint64_t v21;
  double v22;
  char v23;
  double *v25;
  std::__shared_weak_count *v26;

  v3 = a3;
  -[VKCameraController camera](self, "camera");
  v5 = v25[5];
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
  v9 = v8;
  *(float *)&v8 = v9;
  -[VKDaVinciCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:", v8);
  v11 = v10;
  *(float *)&v12 = v9;
  -[VKDaVinciCameraController minPitchForNormalizedZoomLevel:](self, "minPitchForNormalizedZoomLevel:", v12);
  v14 = v13;
  if (v5 < v14 && v5 > 0.0001)
  {
    if (!self->super._isPitchIncreasing)
      v14 = 0.0;
    goto LABEL_12;
  }
  v14 = v11;
  if (v5 > v11)
LABEL_12:
    -[VKDaVinciCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", v3, 0, v14);
  -[VKCameraController camera](self, "camera");
  v15 = fabs(v25[1]);
  if (v26)
  {
    v16 = (unint64_t *)&v26->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (v15 < 1.30899694)
  {
    -[VKCameraController camera](self, "camera");
    v18 = fabs(v25[6]);
    v19 = v18 < 2.22507386e-308 || v18 <= v18 * 2.22044605e-14;
    if (v26)
    {
      v20 = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)())v26->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
    v23 = v22 > 6.0 || v19;
    if ((v23 & 1) == 0)
      -[VKDaVinciCameraController rotateTo:animated:](self, "rotateTo:animated:", v3, 0.0);
  }
  return 0;
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  uint64_t *p_shared_owners;
  unint64_t v10;
  VKTimedAnimation *rotationAnimation;
  VKTimedAnimation *v12;
  VKTimedAnimation *v13;
  VKTimedAnimation *v14;
  uint64_t v15;
  char *cameraManager;
  char *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23[2];
  _QWORD v24[4];
  id v25[3];
  id location;
  std::__shared_weak_count *v27;

  v4 = a4;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v7 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  -[VKCameraController camera](self, "camera");
  v8 = *((double *)location + 6);
  if (!v27)
    goto LABEL_5;
  p_shared_owners = &v27->__shared_owners_;
  do
    v10 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v10 - 1, (unint64_t *)p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
    if (v4)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (v4)
    {
LABEL_6:
      rotationAnimation = self->super._rotationAnimation;
      if (rotationAnimation)
      {
        -[VKAnimation stop](rotationAnimation, "stop");
        v12 = self->super._rotationAnimation;
        self->super._rotationAnimation = 0;

      }
      v13 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
      v14 = self->super._rotationAnimation;
      self->super._rotationAnimation = v13;

      -[VKTimedAnimation setTimingFunction:](self->super._rotationAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
      objc_initWeak(&location, self);
      v15 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__VKDaVinciCameraController_rotateTo_animated___block_invoke;
      v24[3] = &unk_1E42F9418;
      objc_copyWeak(v25, &location);
      v25[1] = *(id *)&v8;
      v25[2] = *(id *)&a3;
      -[VKTimedAnimation setStepHandler:](self->super._rotationAnimation, "setStepHandler:", v24);
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __47__VKDaVinciCameraController_rotateTo_animated___block_invoke_2;
      v22[3] = &unk_1E42F4C08;
      objc_copyWeak(v23, &location);
      v23[1] = v7;
      -[VKAnimation setCompletionHandler:](self->super._rotationAnimation, "setCompletionHandler:", v22);
      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
      cameraManager = (char *)self->_cameraManager;
      *(_WORD *)(cameraManager + 81) = 1;
      cameraManager[83] = 0;
      *((_QWORD *)cameraManager + 14) = v7;
      *((_QWORD *)cameraManager + 15) = 0;
      self->_isRotating = 1;
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._rotationAnimation->super);
      objc_destroyWeak(v23);
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      return;
    }
  }
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  v17 = (char *)self->_cameraManager;
  *(_WORD *)(v17 + 81) = 1;
  v17[83] = 0;
  *((_QWORD *)v17 + 14) = v7;
  *((_QWORD *)v17 + 15) = 0;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  -[VKDaVinciCameraController rotate:atScreenPoint:](self, "rotate:atScreenPoint:", a3 - v8, v18, v19);
  *((_BYTE *)self->_cameraManager + 83) = 1;
  -[VKCameraController cameraDelegate](self, "cameraDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mapLayerDidChangeVisibleRegion");

  v21 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v21)
  {
    LOBYTE(location) = 4;
    md::MapEngine::setNeedsTick(v21, &location);
  }
  -[VKCameraController endRegionChange](self, "endRegionChange");
}

- (void)tiltTo:(double)a3 animated:(BOOL)a4 exaggerate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *v14;
  VKTimedAnimation *v15;
  double v16;
  VKTimedAnimation *v17;
  VKTimedAnimation *v18;
  uint64_t v19;
  _WORD *cameraManager;
  _WORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28[2];
  _QWORD v29[4];
  id v30[4];
  id location;
  std::__shared_weak_count *v32;

  v5 = a5;
  v6 = a4;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  -[VKCameraController camera](self, "camera");
  v10 = (void *)*((_QWORD *)location + 5);
  if (!v32)
    goto LABEL_5;
  p_shared_owners = &v32->__shared_owners_;
  do
    v12 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
    std::__shared_weak_count::__release_weak(v32);
    if (v6)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (v6)
    {
LABEL_6:
      pitchAnimation = self->super._pitchAnimation;
      if (pitchAnimation)
      {
        -[VKAnimation stop](pitchAnimation, "stop");
        v14 = self->super._pitchAnimation;
        self->super._pitchAnimation = 0;

      }
      v15 = [VKTimedAnimation alloc];
      v16 = 0.3;
      if (v5)
        v16 = 0.5;
      v17 = -[VKTimedAnimation initWithDuration:](v15, "initWithDuration:", v16);
      v18 = self->super._pitchAnimation;
      self->super._pitchAnimation = v17;

      objc_initWeak(&location, self);
      v19 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke;
      v29[3] = &unk_1E42F4C30;
      objc_copyWeak(v30, &location);
      v30[1] = v10;
      v30[2] = *(id *)&a3;
      v30[3] = v9;
      -[VKTimedAnimation setStepHandler:](self->super._pitchAnimation, "setStepHandler:", v29);
      v24 = v19;
      v25 = 3221225472;
      v26 = __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke_2;
      v27 = &unk_1E42F4C08;
      objc_copyWeak(v28, &location);
      v28[1] = v9;
      -[VKAnimation setCompletionHandler:](self->super._pitchAnimation, "setCompletionHandler:", &v24);
      -[VKTimedAnimation setTimingFunction:](self->super._pitchAnimation, "setTimingFunction:", VKAnimationCurveEaseOut, v24, v25, v26, v27);
      -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
      cameraManager = self->_cameraManager;
      cameraManager[64] = 1;
      *((_BYTE *)cameraManager + 130) = 0;
      *((_QWORD *)cameraManager + 22) = 0;
      *((_QWORD *)cameraManager + 20) = v9;
      *((_QWORD *)cameraManager + 21) = v9;
      self->_isPitching = 1;
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._pitchAnimation->super);
      objc_destroyWeak(v28);
      objc_destroyWeak(v30);
      objc_destroyWeak(&location);
      return;
    }
  }
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  v21 = self->_cameraManager;
  v21[64] = 1;
  *((_BYTE *)v21 + 130) = 0;
  *((_QWORD *)v21 + 22) = 0;
  *((_QWORD *)v21 + 20) = v9;
  *((_QWORD *)v21 + 21) = v9;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  -[VKDaVinciCameraController pitch:translation:](self, "pitch:translation:");
  *((_BYTE *)self->_cameraManager + 130) = 1;
  -[VKDaVinciCameraController _updateIsPitched](self, "_updateIsPitched");
  -[VKDaVinciCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
  -[VKCameraController cameraDelegate](self, "cameraDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mapLayerDidChangeVisibleRegion");

  v23 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v23)
  {
    LOBYTE(location) = 4;
    md::MapEngine::setNeedsTick(v23, &location);
  }
  -[VKCameraController endRegionChange](self, "endRegionChange");
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  long double v10;
  void *v11;
  VKAnimation **p_zoomAnimation;
  VKAnimation *zoomAnimation;
  VKAnimation *v14;
  VKTimedAnimation *v15;
  uint64_t v16;
  id v17;
  _WORD *cameraManager;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24[2];
  _QWORD v25[5];
  id v26[3];
  id location;
  _QWORD v28[4];

  y = a3.y;
  x = a3.x;
  v9 = a5;
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
  v10 = exp2(-a4);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0x3FF0000000000000;
  v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  p_zoomAnimation = &self->super._zoomAnimation;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    -[VKAnimation stop](zoomAnimation, "stop");
    v14 = *p_zoomAnimation;
    *p_zoomAnimation = 0;

  }
  v15 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.25);
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke;
  v25[3] = &unk_1E42F4C58;
  objc_copyWeak(v26, &location);
  v26[1] = *(id *)&v10;
  v25[4] = v28;
  v26[2] = v11;
  -[VKTimedAnimation setStepHandler:](v15, "setStepHandler:", v25);
  v19 = v16;
  v20 = 3221225472;
  v21 = __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke_2;
  v22 = &unk_1E42F9FC8;
  objc_copyWeak(v24, &location);
  v24[1] = v11;
  v17 = v9;
  v23 = v17;
  -[VKAnimation setCompletionHandler:](v15, "setCompletionHandler:", &v19);
  objc_storeStrong((id *)&self->super._zoomAnimation, v15);
  cameraManager = self->_cameraManager;
  cameraManager[92] = 1;
  *((_BYTE *)cameraManager + 186) = 0;
  *((_QWORD *)cameraManager + 27) = v11;
  *((_QWORD *)cameraManager + 28) = 0x3FF0000000000000;
  *((_BYTE *)cameraManager + 240) = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v19, v20, v21, v22);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *p_zoomAnimation);

  objc_destroyWeak(v24);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5 completionHandler:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  VKAnimation *zoomAnimation;
  VKTimedAnimation *v17;
  uint64_t v18;
  id v19;
  _WORD *cameraManager;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26[2];
  _QWORD v27[5];
  id v28[3];
  id location;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  -[VKCameraController camera](self, "camera");
  v13 = *(double *)(v30 + 32);
  if (v31)
  {
    p_shared_owners = &v31->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v30 = 0;
  v31 = (std::__shared_weak_count *)&v30;
  v32 = 0x2020000000;
  v33 = 0x3FF0000000000000;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
    -[VKAnimation stop](zoomAnimation, "stop");
  v17 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a5);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke;
  v27[3] = &unk_1E42F4C58;
  objc_copyWeak(v28, &location);
  *(double *)&v28[1] = a4 / v13;
  v27[4] = &v30;
  v28[2] = v12;
  -[VKTimedAnimation setStepHandler:](v17, "setStepHandler:", v27);
  v21 = v18;
  v22 = 3221225472;
  v23 = __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2;
  v24 = &unk_1E42F9FC8;
  objc_copyWeak(v26, &location);
  v26[1] = v12;
  v19 = v11;
  v25 = v19;
  -[VKAnimation setCompletionHandler:](v17, "setCompletionHandler:", &v21);
  objc_storeStrong((id *)&self->super._zoomAnimation, v17);
  cameraManager = self->_cameraManager;
  cameraManager[92] = 1;
  *((_BYTE *)cameraManager + 186) = 0;
  *((_QWORD *)cameraManager + 27) = v12;
  *((_QWORD *)cameraManager + 28) = 0x3FF0000000000000;
  *((_BYTE *)cameraManager + 240) = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v21, v22, v23, v24);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), self->super._zoomAnimation);

  objc_destroyWeak(v26);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v30, 8);
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5
{
  -[VKDaVinciCameraController zoomToDistance:distance:time:completionHandler:](self, "zoomToDistance:distance:time:completionHandler:", 0, a3.x, a3.y, a4, a5);
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  uint64_t v8;
  double y;
  double x;
  double v11;
  double v12;
  void (**v14)(_QWORD);
  VKTimedAnimation *regionAnimation;
  CGFloat v16;
  CGFloat v17;
  char *cameraManager;
  Matrix<int, 2, 1> v19;
  double v20;
  double v21;
  VKTimedAnimation *v22;
  uint64_t v23;
  _BYTE *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD);
  double v27;
  double v28;
  _QWORD v29[7];

  LODWORD(v8) = a5;
  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = (void (**)(_QWORD))a7;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && -[VKAnimation running](regionAnimation, "running"))
  {
    if (v14)
      goto LABEL_11;
  }
  else
  {
    if (a6 > 0.0)
      v8 = v8;
    else
      v8 = 0;
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", v8);
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
    self->_panStartScreenPoint.x = v16;
    self->_panStartScreenPoint.y = v17;
    cameraManager = (char *)self->_cameraManager;
    v19 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    v20 = x + v12;
    *((_WORD *)cameraManager + 8) = 1;
    v21 = y - v11;
    cameraManager[18] = 0;
    cameraManager[80] = 0;
    *(Matrix<int, 2, 1> *)(cameraManager + 36) = v19;
    *(Matrix<int, 2, 1> *)(cameraManager + 20) = v19;
    *(Matrix<int, 2, 1> *)(cameraManager + 28) = v19;
    if ((_DWORD)v8)
    {
      v22 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a6);
      -[VKTimedAnimation setTimingFunction:](v22, "setTimingFunction:", VKAnimationCurveLinear);
      v23 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v29[3] = &unk_1E42F4C80;
      *(double *)&v29[5] = v12;
      *(double *)&v29[6] = v11;
      v29[4] = self;
      -[VKTimedAnimation setStepHandler:](v22, "setStepHandler:", v29);
      v25[0] = v23;
      v25[1] = 3221225472;
      v25[2] = __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v25[3] = &unk_1E42F4CA8;
      v25[4] = self;
      v27 = v20;
      v28 = v21;
      v26 = v14;
      -[VKAnimation setCompletionHandler:](v22, "setCompletionHandler:", v25);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &v22->super);

    }
    else
    {
      -[VKScreenCameraController updatePanWithTranslation:](self, "updatePanWithTranslation:", v12, v11);
      v24 = self->_cameraManager;
      -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v20, v21);
      v24[18] = 1;
      -[VKCameraController endRegionChange](self, "endRegionChange");
      if (v14)
LABEL_11:
        v14[2](v14);
    }
  }

}

- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians zoom:(double)a5 rotation:(double)a6 tilt:(double)a7 duration:(id)a8 timingCurve:(id)a9 completion:
{
  uint64_t v9;
  __int128 v10;

  v10 = *(_OWORD *)a8;
  -[VKDaVinciCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", &v10, 0, a9, v9, 0.0, a3.latitude._value, a3.longitude._value, a4, a5, a7);
}

- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:
{
  void *v11;
  void *v12;
  double value;
  char v17;
  double v18;
  float64x2_t *v19;
  id v21;
  void (**v22)(id, uint64_t);
  uint64_t *p_shared_owners;
  unint64_t v24;
  double v25;
  double v26;
  uint64_t *v27;
  unint64_t v28;
  double v29;
  VKTimedAnimation *v30;
  VKTimedAnimation *regionAnimation;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  void *v35;
  Matrix<int, 2, 1> v36;
  uint64_t *v37;
  unint64_t v38;
  void *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  void *v42;
  uint64_t *v43;
  unint64_t v44;
  void *v45;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  _BYTE *cameraManager;
  uint64_t v54;
  uint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  void *v66;
  Matrix<int, 2, 1> v67;
  uint64_t *v68;
  unint64_t v69;
  double *v75;
  uint64_t *v76;
  unint64_t v77;
  void *v78;
  std::__shared_weak_count *v79;
  uint64_t *v80;
  unint64_t v81;
  void *v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  float64x2_t v86;
  double v87;
  float64x2_t v88;
  _QWORD v89[4];
  void (**v90)(id, uint64_t);
  id v91;
  _QWORD v92[5];
  id v93[6];
  float64x2_t v94;
  std::__shared_weak_count *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  char v100;
  id location;
  std::__shared_weak_count *v102;
  uint64_t v103;
  std::__shared_weak_count *v104;
  uint64_t v105;

  v12 = v11;
  value = a3.longitude._value;
  v17 = (char)a10;
  v18 = a3.latitude._value;
  v19 = (float64x2_t *)a5;
  v21 = a11;
  v22 = v12;
  -[VKDaVinciCameraController stopGlobeAnimations](self, "stopGlobeAnimations");
  -[VKCameraController camera](self, "camera");
  if (!v104)
    goto LABEL_5;
  p_shared_owners = &v104->__shared_owners_;
  do
    v24 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v24 - 1, (unint64_t *)p_shared_owners));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
    std::__shared_weak_count::__release_weak(v104);
    if (!v103)
      goto LABEL_83;
  }
  else
  {
LABEL_5:
    if (!v103)
      goto LABEL_83;
  }
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  -[VKCameraController camera](self, "camera");
  v25 = *(double *)(v103 + 104);
  v26 = fmax(*(double *)(v103 + 96), value);
  if (v104)
  {
    v27 = &v104->__shared_owners_;
    do
      v28 = __ldaxr((unint64_t *)v27);
    while (__stlxr(v28 - 1, (unint64_t *)v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }
  v29 = fmin(v25, v26);
  if (a7 <= 0.0)
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    cameraManager = self->_cameraManager;
    cameraManager[242] = 0;
    cameraManager[244] = 0;
    v88 = *v19;
    -[VKCameraController camera](self, "camera");
    v54 = v103;
    *(float64x2_t *)(v103 + 8) = v88;
    *(double *)(v54 + 24) = v18;
    if (v104)
    {
      v55 = &v104->__shared_owners_;
      do
        v56 = __ldaxr((unint64_t *)v55);
      while (__stlxr(v56 - 1, (unint64_t *)v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
        std::__shared_weak_count::__release_weak(v104);
      }
    }
    -[VKCameraController camera](self, "camera");
    v57 = v104;
    *(double *)(v103 + 40) = a6;
    if (v57)
    {
      v58 = (unint64_t *)&v57->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    -[VKCameraController camera](self, "camera");
    v60 = v104;
    *(double *)(v103 + 32) = v29;
    if (v60)
    {
      v61 = (unint64_t *)&v60->__shared_owners_;
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
    -[VKCameraController camera](self, "camera");
    v63 = v104;
    *(double *)(v103 + 48) = a4;
    if (v63)
    {
      v64 = (unint64_t *)&v63->__shared_owners_;
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    v66 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    v67 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    -[VKCameraController camera](self, "camera");
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v103, (uint64_t)v66, (uint64_t)location + 8, (int32x2_t)v67);
    if (v102)
    {
      v68 = &v102->__shared_owners_;
      do
        v69 = __ldaxr((unint64_t *)v68);
      while (__stlxr(v69 - 1, (unint64_t *)v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    *(_QWORD *)&v86.f64[1] = v104;
    -[VKCameraController camera](self, "camera", v103);
    __asm { FMOV            V0.2D, #-2.0 }
    v75 = (double *)location;
    *(float64x2_t *)((char *)location + 8) = vnegq_f64(vmlaq_f64(v86, _Q0, v88));
    v75[3] = v18;
    if (v102)
    {
      v76 = &v102->__shared_owners_;
      do
        v77 = __ldaxr((unint64_t *)v76);
      while (__stlxr(v77 - 1, (unint64_t *)v76));
      if (!v77)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    v78 = self->_cameraManager;
    -[VKCameraController camera](self, "camera");
    md::CameraManager::update((uint64_t)v78, (uint64_t *)&location, 1);
    v79 = v102;
    if (v102)
    {
      v80 = &v102->__shared_owners_;
      do
        v81 = __ldaxr((unint64_t *)v80);
      while (__stlxr(v81 - 1, (unint64_t *)v80));
      if (!v81)
      {
        ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
        std::__shared_weak_count::__release_weak(v79);
      }
    }
    -[VKDaVinciCameraController _updateIsPitched](self, "_updateIsPitched");
    -[VKDaVinciCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "mapLayerDidChangeVisibleRegion");

    v83 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v83)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v83, &location);
    }
    if ((v17 & 1) == 0)
      self->_updateHeight = 1;
    -[VKCameraController endRegionChange](self, "endRegionChange");
    -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    *((_BYTE *)self->_cameraManager + 242) = 1;
    if (v22)
      v22[2](v22, 1);
  }
  else
  {
    v30 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a7);
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v30;

    if (v21)
      v32 = (uint64_t)v21;
    else
      v32 = VKAnimationCurveLinear;
    -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v32);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    -[VKCameraController camera](self, "camera");
    if (v104)
    {
      v33 = &v104->__shared_owners_;
      do
        v34 = __ldaxr((unint64_t *)v33);
      while (__stlxr(v34 - 1, (unint64_t *)v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
        std::__shared_weak_count::__release_weak(v104);
      }
    }
    v35 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    v36 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    -[VKCameraController camera](self, "camera");
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v103, (uint64_t)v35, (uint64_t)location + 8, (int32x2_t)v36);
    if (v102)
    {
      v37 = &v102->__shared_owners_;
      do
        v38 = __ldaxr((unint64_t *)v37);
      while (__stlxr(v38 - 1, (unint64_t *)v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    v87 = a4;
    v84 = v18;
    v39 = (void *)v103;
    v40 = v104;
    v41 = v105;
    -[VKCameraController camera](self, "camera", *(_QWORD *)&v84);
    v42 = (void *)*((_QWORD *)location + 4);
    if (v102)
    {
      v43 = &v102->__shared_owners_;
      do
        v44 = __ldaxr((unint64_t *)v43);
      while (__stlxr(v44 - 1, (unint64_t *)v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    -[VKCameraController camera](self, "camera");
    v45 = (void *)*((_QWORD *)location + 5);
    if (v102)
    {
      v46 = &v102->__shared_owners_;
      do
        v47 = __ldaxr((unint64_t *)v46);
      while (__stlxr(v47 - 1, (unint64_t *)v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    -[VKCameraController camera](self, "camera");
    v48 = *((_QWORD *)location + 6);
    if (v102)
    {
      v49 = &v102->__shared_owners_;
      do
        v50 = __ldaxr((unint64_t *)v49);
      while (__stlxr(v50 - 1, (unint64_t *)v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
        std::__shared_weak_count::__release_weak(v102);
      }
    }
    v51 = self->_cameraManager;
    v51[242] = 0;
    v51[244] = 0;
    objc_initWeak(&location, self);
    v52 = MEMORY[0x1E0C809B0];
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3321888768;
    v92[2] = __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
    v92[3] = &unk_1E42E9340;
    objc_copyWeak(v93, &location);
    v93[1] = v42;
    v93[2] = *(id *)&v29;
    v93[3] = v45;
    v93[4] = *(id *)&a6;
    v94 = *v19;
    v93[5] = v39;
    v100 = v17;
    v92[4] = self;
    v95 = v40;
    v96 = v85;
    v97 = v41;
    v98 = v48;
    v99 = v87;
    -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v92);
    v89[0] = v52;
    v89[1] = 3221225472;
    v89[2] = __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_13;
    v89[3] = &unk_1E42F9D20;
    objc_copyWeak(&v91, &location);
    v90 = v22;
    -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v89);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

    objc_destroyWeak(&v91);
    objc_destroyWeak(v93);
    objc_destroyWeak(&location);
  }
LABEL_83:

}

- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:
{
  double value;
  double v7;
  double v8;
  double v9;
  double v10;
  __double2 v11;
  double v12;
  double v13;
  __double2 v14;
  __double2 v15;
  double v16;
  double v17;
  __double2 v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  double v27;
  long double v28;
  double v29;
  __double2 v30;
  double v31;
  double v32;
  __double2 v33;
  __double2 v34;
  double v35;
  double v36;
  __double2 v37;
  long double v39;
  double v40;
  double v41;
  long double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  long double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _QWORD v64[44];

  value = a3->_target.latitude._value;
  v7 = a4->_target.longitude._value;
  v8 = a4->_target.altitude._value;
  v62 = a4->_distanceFromTarget._value;
  v63 = a3->_target.longitude._value;
  v56 = a3->_target.altitude._value;
  v9 = a3->_heading._value;
  v10 = a4->_heading._value;
  v48 = v10;
  v60 = a3->_distanceFromTarget._value;
  v61 = v9;
  v53 = v10 - v9;
  if ((v9 > 0.0) - (v9 < 0.0) == (v10 > 0.0) - (v10 < 0.0))
  {
    v40 = 0.95;
    v51 = 0.05;
  }
  else
  {
    v51 = -v9 / (v10 - v9);
    v40 = v51;
  }
  v59 = a4->_target.latitude._value;
  v11 = __sincos_stret(a4->_target.latitude._value);
  v12 = 6378137.0 / sqrt(-(v11.__sinval * v11.__sinval * 0.00669437999 + -1.0));
  v13 = (v12 + v8) * v11.__cosval;
  v14 = __sincos_stret(v7);
  v55 = v13 * v14.__cosval;
  v15 = __sincos_stret(value);
  v58 = v7;
  v16 = 6378137.0 / sqrt(-(v15.__sinval * v15.__sinval * 0.00669437999 + -1.0));
  v17 = (v16 + v56) * v15.__cosval;
  v18 = __sincos_stret(v63);
  v44 = v17 * v18.__cosval;
  v57 = v8;
  v46 = v13 * v14.__sinval;
  v47 = (v8 + v12 * 0.99330562) * v11.__sinval;
  v43 = v17 * v18.__sinval;
  v45 = fmax(fmax(acos(fmax(fmin((v47 * ((v56 + v16 * 0.99330562) * v15.__sinval)+ v55 * (v17 * v18.__cosval)+ v46 * (v17 * v18.__sinval))/ sqrt((v55 * v55 + v46 * v46 + v47 * v47)* (v44 * v44+ v43 * v43+ (v56 + v16 * 0.99330562) * v15.__sinval * ((v56 + v16 * 0.99330562) * v15.__sinval))), 1.0), -1.0))* 6378137.0, v62 + v8), v60 + v56);
  v19 = fmod(v61 + 3.14159265 + v51 * v53, 6.28318531);
  v42 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  v20 = fmod(3.14159265 - value + v59, 6.28318531);
  v39 = fmod(v20 + 6.28318531, 6.28318531) + -3.14159265;
  v21 = fmod(value + 3.14159265 + v39 * 0.0500000007, 6.28318531);
  v52 = fmod(v21 + 6.28318531, 6.28318531) + -3.14159265;
  v22 = fmod(3.14159265 - v63 + v58, 6.28318531);
  v23 = fmod(v22 + 6.28318531, 6.28318531) + -3.14159265;
  v24 = fmod(v63 + 3.14159265 + v23 * 0.0500000007, 6.28318531);
  v50 = fmod(v24 + 6.28318531, 6.28318531) + -3.14159265;
  v49 = v56 + (v8 - v56) * 0.05;
  v25 = fmod(v61 + 3.14159265 + v40 * v53, 6.28318531);
  v54 = fmod(v25 + 6.28318531, 6.28318531) + -3.14159265;
  v26 = fmod(value + 3.14159265 + v39 * 0.949999988, 6.28318531);
  v27 = fmod(v26 + 6.28318531, 6.28318531) + -3.14159265;
  v28 = fmod(v63 + 3.14159265 + v23 * 0.949999988, 6.28318531);
  v41 = fmod(v28 + 6.28318531, 6.28318531) + -3.14159265;
  v29 = v56 + (v8 - v56) * 0.95;
  v30 = __sincos_stret(v52);
  v31 = 6378137.0 / sqrt(-(v30.__sinval * v30.__sinval * 0.00669437999 + -1.0));
  v32 = (v31 + v49) * v30.__cosval;
  v33 = __sincos_stret(v50);
  v34 = __sincos_stret(v27);
  v35 = 6378137.0 / sqrt(-(v34.__sinval * v34.__sinval * 0.00669437999 + -1.0));
  v36 = (v35 + v29) * v34.__cosval;
  v37 = __sincos_stret(v41);
  *(double *)&v64[4] = v44;
  *(double *)&v64[5] = v43;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3321888768;
  v64[2] = __77__VKDaVinciCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
  v64[3] = &__block_descriptor_352_ea8_128c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE184c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE240c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE296c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE_e386__CameraFrame_geo::Radians__double___Coordinate3D_geo::Radians__double___Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::MeterUnitDescription__double__d___Unit_geo::MeterUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__12__0f8l;
  *(double *)&v64[6] = (v56 + v16 * 0.99330562) * v15.__sinval;
  *(double *)&v64[7] = v32 * v33.__cosval;
  *(double *)&v64[8] = v32 * v33.__sinval;
  *(double *)&v64[9] = (v49 + v31 * 0.99330562) * v30.__sinval;
  *(double *)&v64[10] = v36 * v37.__cosval;
  *(double *)&v64[11] = v36 * v37.__sinval;
  *(double *)&v64[12] = (v29 + v35 * 0.99330562) * v34.__sinval;
  *(double *)&v64[13] = v55;
  *(double *)&v64[14] = v46;
  *(double *)&v64[15] = v47;
  *(double *)&v64[16] = value;
  *(double *)&v64[17] = v63;
  *(double *)&v64[18] = v56;
  *(double *)&v64[19] = v60;
  v64[20] = *(_QWORD *)&a3->_pitch._value;
  *(double *)&v64[21] = v61;
  v64[22] = *(_QWORD *)&a3->_roll._value;
  *(double *)&v64[23] = v52;
  *(double *)&v64[24] = v50;
  *(double *)&v64[25] = v49;
  *(double *)&v64[26] = v45;
  v64[27] = 0;
  *(long double *)&v64[28] = v42;
  v64[29] = 0;
  *(double *)&v64[30] = v27;
  *(double *)&v64[31] = v41;
  *(double *)&v64[32] = v29;
  *(double *)&v64[33] = v45;
  v64[34] = 0;
  *(long double *)&v64[35] = v54;
  v64[36] = 0;
  *(double *)&v64[37] = v59;
  *(double *)&v64[38] = v58;
  *(double *)&v64[39] = v57;
  *(double *)&v64[40] = v62;
  v64[41] = *(_QWORD *)&a4->_pitch._value;
  *(double *)&v64[42] = v48;
  v64[43] = *(_QWORD *)&a4->_roll._value;
  return (id)objc_msgSend(v64, "copy");
}

- (void)moveToZoomOutZoomInTransition:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:
{
  void *v11;
  void *v12;
  double value;
  double v17;
  double *v18;
  id v20;
  void (**v21)(id, uint64_t);
  double v22;
  double v23;
  uint64_t *p_shared_owners;
  unint64_t v25;
  double v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  __double2 v39;
  double v40;
  __double2 v41;
  double v42;
  double v43;
  double v44;
  __double2 v45;
  double v46;
  double v47;
  __double2 v48;
  double v49;
  double v50;
  VKTimedAnimation *v51;
  VKTimedAnimation *regionAnimation;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id *v57;
  VKTimedAnimation *v58;
  id v59;
  _BYTE *cameraManager;
  double *v61;
  uint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  void *v73;
  std::__shared_weak_count *v74;
  uint64_t *v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  _BYTE *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  _QWORD v94[4];
  void (**v95)(id, uint64_t);
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD v100[7];
  _QWORD v101[7];
  _QWORD v102[4];
  id v103[15];
  id location;
  std::__shared_weak_count *v105;

  v12 = v11;
  value = a3.longitude._value;
  v17 = a3.latitude._value;
  v18 = (double *)a5;
  v20 = a11;
  v21 = v12;
  -[VKDaVinciCameraController stopGlobeAnimations](self, "stopGlobeAnimations");
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  -[VKCameraController camera](self, "camera");
  v23 = *((double *)location + 12);
  v22 = *((double *)location + 13);
  if (v105)
  {
    p_shared_owners = &v105->__shared_owners_;
    do
      v25 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v25 - 1, (unint64_t *)p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  -[VKCameraController camera](self, "camera");
  v26 = *((double *)location + 3);
  v91 = (void *)*((_QWORD *)location + 1);
  v92 = (void *)*((_QWORD *)location + 2);
  if (v105)
  {
    v27 = &v105->__shared_owners_;
    do
      v28 = __ldaxr((unint64_t *)v27);
    while (__stlxr(v28 - 1, (unint64_t *)v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  -[VKCameraController camera](self, "camera");
  v90 = *((double *)location + 4);
  if (v105)
  {
    v29 = &v105->__shared_owners_;
    do
      v30 = __ldaxr((unint64_t *)v29);
    while (__stlxr(v30 - 1, (unint64_t *)v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  -[VKCameraController camera](self, "camera");
  v85 = (void *)*((_QWORD *)location + 7);
  if (v105)
  {
    v31 = &v105->__shared_owners_;
    do
      v32 = __ldaxr((unint64_t *)v31);
    while (__stlxr(v32 - 1, (unint64_t *)v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  -[VKCameraController camera](self, "camera");
  v84 = (void *)*((_QWORD *)location + 6);
  if (v105)
  {
    v33 = &v105->__shared_owners_;
    do
      v34 = __ldaxr((unint64_t *)v33);
    while (__stlxr(v34 - 1, (unint64_t *)v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  -[VKCameraController camera](self, "camera");
  v83 = (void *)*((_QWORD *)location + 5);
  if (v105)
  {
    v35 = &v105->__shared_owners_;
    do
      v36 = __ldaxr((unint64_t *)v35);
    while (__stlxr(v36 - 1, (unint64_t *)v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  v81 = *(void **)v18;
  v82 = (void *)*((_QWORD *)v18 + 1);
  -[VKCameraController camera](self, "camera");
  v86 = a7;
  v87 = v26;
  v88 = v17;
  v89 = a6;
  v93 = fmin(v22, fmax(v23, value));
  v80 = (void *)*((_QWORD *)location + 7);
  if (v105)
  {
    v37 = &v105->__shared_owners_;
    do
      v38 = __ldaxr((unint64_t *)v37);
    while (__stlxr(v38 - 1, (unint64_t *)v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  v39 = __sincos_stret(*(double *)&v91);
  v40 = 6378137.0 / sqrt(-(v39.__sinval * v39.__sinval * 0.00669437999 + -1.0));
  v41 = __sincos_stret(*(double *)&v92);
  v42 = v40 * v39.__cosval * v41.__cosval;
  v43 = v40 * v39.__cosval * v41.__sinval;
  v44 = v18[1];
  v45 = __sincos_stret(*v18);
  v46 = 6378137.0 / sqrt(-(v45.__sinval * v45.__sinval * 0.00669437999 + -1.0));
  v47 = v46 * v45.__cosval;
  v48 = __sincos_stret(v44);
  v49 = acos(fmax(fmin((v45.__sinval * 0.99330562 * v46 * (v39.__sinval * 0.99330562 * v40)+ v47 * v48.__cosval * v42+ v47 * v48.__sinval * v43)/ sqrt((v47 * v48.__cosval * (v47 * v48.__cosval)+ v47 * v48.__sinval * (v47 * v48.__sinval)+ v45.__sinval * 0.99330562 * v46 * (v45.__sinval * 0.99330562 * v46))* (v42 * v42 + v43 * v43 + v39.__sinval * 0.99330562 * v40 * (v39.__sinval * 0.99330562 * v40))), 1.0), -1.0));
  v50 = ((fabs(v87 - (v93 + v88) + v90) * 0.0000000499064047 + v49 * 0.318309886) * 0.8 + 0.2) * v86;
  if (v50 <= 0.0)
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    cameraManager = self->_cameraManager;
    cameraManager[242] = 0;
    cameraManager[244] = 0;
    -[VKCameraController camera](self, "camera");
    v61 = (double *)location;
    *(_OWORD *)((char *)location + 8) = *(_OWORD *)v18;
    v61[3] = v88;
    if (v105)
    {
      v62 = &v105->__shared_owners_;
      do
        v63 = __ldaxr((unint64_t *)v62);
      while (__stlxr(v63 - 1, (unint64_t *)v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
        std::__shared_weak_count::__release_weak(v105);
      }
    }
    -[VKCameraController camera](self, "camera");
    v64 = v105;
    *((double *)location + 5) = v89;
    if (v64)
    {
      v65 = (unint64_t *)&v64->__shared_owners_;
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
    -[VKCameraController camera](self, "camera");
    v67 = v105;
    *((double *)location + 4) = v93;
    if (v67)
    {
      v68 = (unint64_t *)&v67->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }
    -[VKCameraController camera](self, "camera");
    v70 = v105;
    *((double *)location + 6) = a4;
    if (v70)
    {
      v71 = (unint64_t *)&v70->__shared_owners_;
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
    v73 = self->_cameraManager;
    -[VKCameraController camera](self, "camera");
    md::CameraManager::update((uint64_t)v73, (uint64_t *)&location, 1);
    v74 = v105;
    if (v105)
    {
      v75 = &v105->__shared_owners_;
      do
        v76 = __ldaxr((unint64_t *)v75);
      while (__stlxr(v76 - 1, (unint64_t *)v75));
      if (!v76)
      {
        ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
        std::__shared_weak_count::__release_weak(v74);
      }
    }
    -[VKDaVinciCameraController _updateIsPitched](self, "_updateIsPitched");
    -[VKDaVinciCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "mapLayerDidChangeVisibleRegion");

    v78 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v78)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v78, &location);
    }
    -[VKCameraController endRegionChange](self, "endRegionChange");
    -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    *((_BYTE *)self->_cameraManager + 242) = 1;
    if (v21)
      v21[2](v21, 1);
  }
  else
  {
    v51 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v50);
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v51;

    if (v20)
      v53 = (uint64_t)v20;
    else
      v53 = VKAnimationCurveExponentialEaseInOut;
    v54 = (void *)MEMORY[0x1A1AF5730](v53);
    -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v54);
    objc_initWeak(&location, self);
    v55 = MEMORY[0x1E0C809B0];
    if (fabs(v49 * 57.2957795) <= 0.05)
    {
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3321888768;
      v102[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
      v102[3] = &unk_1E42E93E8;
      v57 = v103;
      objc_copyWeak(v103, &location);
      v103[1] = v91;
      v103[2] = v92;
      v103[3] = *(id *)&v87;
      v103[4] = *(id *)&v90;
      v103[5] = v83;
      v103[6] = v84;
      v103[7] = v85;
      v103[8] = v81;
      v103[9] = v82;
      v103[10] = *(id *)&v88;
      v103[11] = *(id *)&v93;
      v103[12] = *(id *)&v89;
      v103[13] = *(id *)&a4;
      v103[14] = v80;
      -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v102);
    }
    else
    {
      v101[0] = v91;
      v101[1] = v92;
      *(double *)&v101[2] = v87;
      *(double *)&v101[3] = v90;
      v101[4] = v83;
      v101[5] = v84;
      v101[6] = v85;
      v100[0] = v81;
      v100[1] = v82;
      *(double *)&v100[2] = v88;
      *(double *)&v100[3] = v93;
      *(double *)&v100[4] = v89;
      *(double *)&v100[5] = a4;
      v100[6] = v80;
      -[VKDaVinciCameraController createMoveToZoomOutZoomInFrameFunction:toLatLon:](self, "createMoveToZoomOutZoomInFrameFunction:toLatLon:", v101, v100);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v55;
      v97[1] = 3221225472;
      v97[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_15;
      v97[3] = &unk_1E42F4D20;
      v57 = &v99;
      objc_copyWeak(&v99, &location);
      v98 = v56;
      v58 = self->super._regionAnimation;
      v59 = v56;
      -[VKTimedAnimation setStepHandler:](v58, "setStepHandler:", v97);

    }
    objc_destroyWeak(v57);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    v79 = self->_cameraManager;
    v79[242] = 0;
    v79[244] = 0;
    v94[0] = v55;
    v94[1] = 3221225472;
    v94[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v94[3] = &unk_1E42F9D20;
    objc_copyWeak(&v96, &location);
    v95 = v21;
    -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v94);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);

  }
}

- (void)stopGlobeAnimations
{
  VKTimedAnimation *regionAnimation;
  VKTimedAnimation *v4;
  VKTimedAnimation *rotationAnimation;
  VKTimedAnimation *v6;
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *v8;
  VKAnimation *zoomAnimation;
  VKAnimation *v10;

  regionAnimation = self->super._regionAnimation;
  if (regionAnimation)
  {
    -[VKAnimation stop](regionAnimation, "stop");
    v4 = self->super._regionAnimation;
    self->super._regionAnimation = 0;

  }
  rotationAnimation = self->super._rotationAnimation;
  if (rotationAnimation)
  {
    -[VKAnimation stop](rotationAnimation, "stop");
    v6 = self->super._rotationAnimation;
    self->super._rotationAnimation = 0;

  }
  pitchAnimation = self->super._pitchAnimation;
  if (pitchAnimation)
  {
    -[VKAnimation stop](pitchAnimation, "stop");
    v8 = self->super._pitchAnimation;
    self->super._pitchAnimation = 0;

  }
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    -[VKAnimation stop](zoomAnimation, "stop");
    v10 = self->super._zoomAnimation;
    self->super._zoomAnimation = 0;

  }
}

- (void)enter3DMode
{
  double v3;
  float v4;

  -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
  *(float *)&v3 = v3;
  -[VKDaVinciCameraController idealPitchForNormalizedZoomLevel:](self, "idealPitchForNormalizedZoomLevel:", v3);
  -[VKDaVinciCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", 1, 1, v4);
}

- (void)exit3DMode
{
  -[VKDaVinciCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", 1, 1, 0.0);
}

- (BOOL)canEnter3DMode
{
  double v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;

  -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
  v4 = v3;
  *(float *)&v3 = v4;
  -[VKDaVinciCameraController minPitchForNormalizedZoomLevel:](self, "minPitchForNormalizedZoomLevel:", v3);
  v6 = v5;
  *(float *)&v7 = v4;
  -[VKDaVinciCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:", v7);
  return v8 > v6;
}

- (BOOL)isPitched
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 40);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2 > 0.0001;
}

- (BOOL)isFullyPitched
{
  double v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  double v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  -[VKCameraController camera](self, "camera");
  v3 = *(double *)(v10 + 40);
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  -[VKCameraController camera](self, "camera");
  v6 = *(double *)(v10 + 72);
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v3 > v6;
}

- (double)minPitch
{
  double v3;
  float v4;

  -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
  *(float *)&v3 = v3;
  -[VKDaVinciCameraController minPitchForNormalizedZoomLevel:](self, "minPitchForNormalizedZoomLevel:", v3);
  return v4 * 57.2957795;
}

- (double)maxPitch
{
  double v3;
  float v4;

  -[VKDaVinciCameraController currentZoomLevel](self, "currentZoomLevel");
  *(float *)&v3 = v3;
  -[VKDaVinciCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:", v3);
  return v4 * 57.2957795;
}

- (void)_updateIsPitched
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;

  v3 = -[VKDaVinciCameraController isPitched](self, "isPitched");
  if (self->_wasPitched != v3)
  {
    v4 = v3;
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapLayerDidBecomePitched:", v4);

    self->_wasPitched = v4;
  }
}

- (void)_updateCanEnter3DMode
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;

  v3 = -[VKDaVinciCameraController canEnter3DMode](self, "canEnter3DMode");
  if (self->_couldEnter3DMode != v3)
  {
    v4 = v3;
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapLayerCanEnter3DModeDidChange:", v4);

    self->_couldEnter3DMode = v4;
  }
}

- (void)updateState
{
  -[VKDaVinciCameraController _updateIsPitched](self, "_updateIsPitched");
  -[VKDaVinciCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
}

- (void)setGesturing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKDaVinciCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  -[VKAnnotationTrackingCameraController setGesturing:](self->super._annotationTrackingCameraController, "setGesturing:", v3);
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  VKAnnotationTrackingCameraController *annotationTrackingCameraController;
  VKDaVinciAnnotationTrackingCameraController *v15;
  void *v16;
  AnimationRunner *v17;
  RunLoopController *v18;
  void *v19;
  VKAnnotationTrackingCameraController *v20;
  VKAnnotationTrackingCameraController *v21;
  void *v22;
  VKAnnotationTrackingCameraController *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  void *v27;
  unsigned int v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v31[8];
  std::__shared_weak_count *v32;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  if (!annotationTrackingCameraController)
  {
    v28 = v9;
    v15 = [VKDaVinciAnnotationTrackingCameraController alloc];
    v16 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    v17 = -[VKCameraController animationRunner](self, "animationRunner");
    v18 = -[VKCameraController runLoopController](self, "runLoopController");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VKAnnotationTrackingCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](v15, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:", v16, v17, v18, v19);
    v21 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v20;

    -[VKCameraController vkCamera](self, "vkCamera");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController setVkCamera:](self->super._annotationTrackingCameraController, "setVkCamera:", v22);

    v23 = self->super._annotationTrackingCameraController;
    -[VKCameraController camera](self, "camera");
    -[VKCameraController setCamera:](v23, "setCamera:", v31);
    v24 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    -[VKCameraController canvas](self, "canvas");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController setCanvas:](self->super._annotationTrackingCameraController, "setCanvas:", v27);

    v29 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    v30 = *(_QWORD *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    -[VKAnnotationTrackingCameraController setBehavior:](self->super._annotationTrackingCameraController, "setBehavior:", &v29);
    -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", self->super._userChangedZoomSinceLastProgrammaticRegionChange);
    -[VKAnnotationTrackingCameraController setHeadingAnimationDisplayRate:](self->super._annotationTrackingCameraController, "setHeadingAnimationDisplayRate:", self->super._annotationTrackingHeadingAnimationDisplayRate);
    -[VKCameraController edgeInsets](self, "edgeInsets");
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
    v9 = v28;
  }
  -[VKAnnotationTrackingCameraController startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](annotationTrackingCameraController, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v12, v10, v9, v13, a6);

}

- (void)updateCameraManager
{
  void *cameraManager;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  cameraManager = self->_cameraManager;
  -[VKCameraController camera](self, "camera");
  md::CameraManager::update((uint64_t)cameraManager, &v6, 0);
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

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;

  v4 = a4;
  -[VKDaVinciCameraController heading](self, "heading");
  if (vabdd_f64(a3, v7) >= 0.000001)
    -[VKDaVinciCameraController rotateTo:animated:](self, "rotateTo:animated:", v4, a3 * -0.0174532925);
}

- (vector<geo::Coordinate2D<geo::Radians,)_getVisibleArea
{
  __int128 *v5;
  __int128 *v6;
  __int128 *v7;
  __int128 v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  _OWORD *v18;
  char *v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t i;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  char *v80;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  double v112;
  double *v113;
  uint64_t *p_shared_owners;
  unint64_t v115;
  double v116;
  double v117;
  double v118;
  std::__shared_weak_count *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double *v125;
  void *v126;
  vector<geo::Coordinate2D<geo::Radians, double>, std::allocator<geo::Coordinate2D<geo::Radians, double>>> *result;
  __n128 v128;
  std::__shared_weak_count *v129;
  unint64_t *v130;
  unint64_t v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  long double v142;
  long double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double *v148;
  long double v149;
  long double v150;
  long double v151;
  double v152;
  double v153;
  __double2 v154;
  long double v155;
  char *v156;
  char *v157;
  long double v158;
  long double v159;
  long double v160;
  double v161;
  double v162;
  long double v163;
  __double2 v164;
  double v165;
  double v166;
  long double *var0;
  long double *var1;
  long double *v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t v174;
  void **v175;
  int64_t v176;
  unint64_t v177;
  void **v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  int64_t v183;
  unint64_t v184;
  unint64_t v185;
  long double *v186;
  unint64_t v187;
  const double *v188;
  double *v189;
  uint64_t v190;
  const double *v191;
  double *v192;
  void *v193;
  unint64_t v194;
  char *v195;
  unint64_t v196;
  const double *v197;
  double *v198;
  uint64_t v199;
  const double *v200;
  double *v201;
  void *v202;
  VKDaVinciCameraController *v203;
  long double v204;
  double v205;
  double v206;
  double v207;
  char v208;
  double v209;
  std::__shared_weak_count *v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  std::__shared_weak_count *v218;
  double v219;
  float64x2x2_t v220;
  float64x2x2_t v221;
  float64x2x2_t v222;
  float64x2x2_t v223;

  v5 = (__int128 *)operator new(0x10uLL);
  *v5 = xmmword_19FFB4C60;
  v6 = (__int128 *)operator new(0x20uLL);
  v6[1] = xmmword_19FFB5960;
  *v6 = *v5;
  operator delete(v5);
  v7 = (__int128 *)operator new(0x40uLL);
  v7[2] = xmmword_19FFB5970;
  v8 = v6[1];
  *v7 = *v6;
  v7[1] = v8;
  operator delete(v6);
  v7[3] = xmmword_19FFB5980;
  v9 = (__int128 *)operator new(0x80uLL);
  v9[4] = xmmword_19FFB5990;
  v10 = v7[3];
  v9[2] = v7[2];
  v9[3] = v10;
  v11 = v7[1];
  *v9 = *v7;
  v9[1] = v11;
  operator delete(v7);
  v9[7] = xmmword_19FFB59A0;
  v9[5] = xmmword_19FFB33A0;
  v9[6] = xmmword_19FFB15E0;
  v12 = operator new(0x100uLL);
  v13 = v9[6];
  v12[7] = v9[7];
  v12[8] = xmmword_19FFB59B0;
  v14 = v9[4];
  v12[5] = v9[5];
  v12[6] = v13;
  v15 = v9[2];
  v12[3] = v9[3];
  v12[4] = v14;
  v16 = *v9;
  v12[1] = v9[1];
  v12[2] = v15;
  *v12 = v16;
  operator delete(v9);
  v17 = (unint64_t)(v12 + 16);
  v12[9] = xmmword_19FFB59C0;
  v18 = v12 + 10;
  if (v12 + 10 >= v12 + 16)
  {
    v21 = operator new(0x200uLL);
    v20 = v21 + 10;
    v17 = (unint64_t)(v21 + 32);
    v21[10] = xmmword_19FFB59D0;
    v19 = (char *)(v21 + 10);
    if (v18 != v12)
    {
      for (i = 0; i != -10; --i)
        v20[i - 1] = v12[i + 9];
      v19 = (char *)v21;
    }
    operator delete(v12);
  }
  else
  {
    *v18 = xmmword_19FFB59D0;
    v19 = (char *)v12;
    v20 = v12 + 10;
  }
  v23 = (char *)(v20 + 1);
  if ((unint64_t)(v20 + 1) >= v17)
  {
    v43 = (v23 - v19) >> 4;
    v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 60)
      abort();
    if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v44)
      v44 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
      v45 = 0xFFFFFFFFFFFFFFFLL;
    else
      v45 = v44;
    if (v45)
    {
      if (v45 >> 60)
        goto LABEL_280;
      v46 = (char *)operator new(16 * v45);
    }
    else
    {
      v46 = 0;
    }
    v47 = &v46[16 * v43];
    v17 = (unint64_t)&v46[16 * v45];
    *(_OWORD *)v47 = xmmword_19FFB32C0;
    v24 = v47 + 16;
    if (v23 == v19)
    {
      v48 = v47;
    }
    else
    {
      do
      {
        v48 = v47 - 16;
        *((_OWORD *)v47 - 1) = *((_OWORD *)v23 - 1);
        v23 -= 16;
        v47 -= 16;
      }
      while (v23 != v19);
    }
    operator delete(v19);
    v19 = v48;
    if ((unint64_t)v24 < v17)
    {
LABEL_10:
      *(_OWORD *)v24 = xmmword_19FFB32B0;
      v25 = v24 + 16;
      if ((unint64_t)(v24 + 16) < v17)
        goto LABEL_11;
      goto LABEL_52;
    }
  }
  else
  {
    v20[1] = xmmword_19FFB32C0;
    v24 = (char *)(v20 + 2);
    if ((unint64_t)(v20 + 2) < v17)
      goto LABEL_10;
  }
  v49 = (v24 - v19) >> 4;
  v50 = v49 + 1;
  if ((unint64_t)(v49 + 1) >> 60)
    goto LABEL_283;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v50)
    v50 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v51 = 0xFFFFFFFFFFFFFFFLL;
  else
    v51 = v50;
  if (v51)
  {
    if (v51 >> 60)
      goto LABEL_280;
    v52 = (char *)operator new(16 * v51);
  }
  else
  {
    v52 = 0;
  }
  v53 = &v52[16 * v49];
  v17 = (unint64_t)&v52[16 * v51];
  *(_OWORD *)v53 = xmmword_19FFB32B0;
  v25 = v53 + 16;
  if (v24 == v19)
  {
    v54 = &v52[16 * v49];
  }
  else
  {
    do
    {
      v54 = v53 - 16;
      *((_OWORD *)v53 - 1) = *((_OWORD *)v24 - 1);
      v24 -= 16;
      v53 -= 16;
    }
    while (v24 != v19);
  }
  operator delete(v19);
  v19 = v54;
  if ((unint64_t)v25 < v17)
  {
LABEL_11:
    *(_OWORD *)v25 = xmmword_19FFB59E0;
    v26 = v25 + 16;
    if ((unint64_t)(v25 + 16) < v17)
      goto LABEL_12;
    goto LABEL_67;
  }
LABEL_52:
  v55 = (v25 - v19) >> 4;
  v56 = v55 + 1;
  if ((unint64_t)(v55 + 1) >> 60)
    goto LABEL_283;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v56)
    v56 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v57 = 0xFFFFFFFFFFFFFFFLL;
  else
    v57 = v56;
  if (v57)
  {
    if (v57 >> 60)
      goto LABEL_280;
    v58 = (char *)operator new(16 * v57);
  }
  else
  {
    v58 = 0;
  }
  v59 = &v58[16 * v55];
  v17 = (unint64_t)&v58[16 * v57];
  *(_OWORD *)v59 = xmmword_19FFB59E0;
  v26 = v59 + 16;
  if (v25 == v19)
  {
    v60 = &v58[16 * v55];
  }
  else
  {
    do
    {
      v60 = v59 - 16;
      *((_OWORD *)v59 - 1) = *((_OWORD *)v25 - 1);
      v25 -= 16;
      v59 -= 16;
    }
    while (v25 != v19);
  }
  operator delete(v19);
  v19 = v60;
  if ((unint64_t)v26 < v17)
  {
LABEL_12:
    *(_OWORD *)v26 = xmmword_19FFB59F0;
    v27 = v26 + 16;
    if ((unint64_t)(v26 + 16) < v17)
      goto LABEL_13;
LABEL_82:
    v66 = (v27 - v19) >> 4;
    v67 = v66 + 1;
    if ((unint64_t)(v66 + 1) >> 60)
      goto LABEL_283;
    if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v67)
      v67 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
      v68 = 0xFFFFFFFFFFFFFFFLL;
    else
      v68 = v67;
    if (v68)
    {
      if (v68 >> 60)
        goto LABEL_280;
      v69 = (char *)operator new(16 * v68);
    }
    else
    {
      v69 = 0;
    }
    v70 = &v69[16 * v66];
    v17 = (unint64_t)&v69[16 * v68];
    *(_OWORD *)v70 = xmmword_19FFB5A00;
    v28 = v70 + 16;
    if (v27 == v19)
      goto LABEL_95;
    do
    {
      *((_OWORD *)v70 - 1) = *((_OWORD *)v27 - 1);
      v70 -= 16;
      v27 -= 16;
    }
    while (v27 != v19);
    if (v19)
LABEL_95:
      operator delete(v19);
    v19 = v70;
    if ((unint64_t)v28 < v17)
      goto LABEL_14;
    goto LABEL_97;
  }
LABEL_67:
  v61 = (v26 - v19) >> 4;
  v62 = v61 + 1;
  if ((unint64_t)(v61 + 1) >> 60)
    goto LABEL_283;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v62)
    v62 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v63 = 0xFFFFFFFFFFFFFFFLL;
  else
    v63 = v62;
  if (v63)
  {
    if (v63 >> 60)
      goto LABEL_280;
    v64 = (char *)operator new(16 * v63);
  }
  else
  {
    v64 = 0;
  }
  v65 = &v64[16 * v61];
  v17 = (unint64_t)&v64[16 * v63];
  *(_OWORD *)v65 = xmmword_19FFB59F0;
  v27 = v65 + 16;
  if (v26 == v19)
    goto LABEL_80;
  do
  {
    *((_OWORD *)v65 - 1) = *((_OWORD *)v26 - 1);
    v65 -= 16;
    v26 -= 16;
  }
  while (v26 != v19);
  if (v19)
LABEL_80:
    operator delete(v19);
  v19 = v65;
  if ((unint64_t)v27 >= v17)
    goto LABEL_82;
LABEL_13:
  *(_OWORD *)v27 = xmmword_19FFB5A00;
  v28 = v27 + 16;
  if ((unint64_t)(v27 + 16) < v17)
  {
LABEL_14:
    *(_OWORD *)v28 = xmmword_19FFB5A10;
    v29 = v28 + 16;
    if ((unint64_t)(v28 + 16) < v17)
      goto LABEL_15;
    goto LABEL_112;
  }
LABEL_97:
  v71 = (v28 - v19) >> 4;
  v72 = v71 + 1;
  if ((unint64_t)(v71 + 1) >> 60)
    goto LABEL_283;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v72)
    v72 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v73 = 0xFFFFFFFFFFFFFFFLL;
  else
    v73 = v72;
  if (v73)
  {
    if (v73 >> 60)
      goto LABEL_280;
    v74 = (char *)operator new(16 * v73);
  }
  else
  {
    v74 = 0;
  }
  v75 = &v74[16 * v71];
  v17 = (unint64_t)&v74[16 * v73];
  *(_OWORD *)v75 = xmmword_19FFB5A10;
  v29 = v75 + 16;
  if (v28 == v19)
    goto LABEL_110;
  do
  {
    *((_OWORD *)v75 - 1) = *((_OWORD *)v28 - 1);
    v75 -= 16;
    v28 -= 16;
  }
  while (v28 != v19);
  if (v19)
LABEL_110:
    operator delete(v19);
  v19 = v75;
  if ((unint64_t)v29 < v17)
  {
LABEL_15:
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)v29 = _Q0;
    v35 = v29 + 16;
    if ((unint64_t)(v29 + 16) < v17)
      goto LABEL_16;
    goto LABEL_127;
  }
LABEL_112:
  v76 = (v29 - v19) >> 4;
  v77 = v76 + 1;
  if ((unint64_t)(v76 + 1) >> 60)
LABEL_283:
    abort();
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v77)
    v77 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v78 = 0xFFFFFFFFFFFFFFFLL;
  else
    v78 = v77;
  if (v78)
  {
    if (v78 >> 60)
      goto LABEL_280;
    v79 = (char *)operator new(16 * v78);
  }
  else
  {
    v79 = 0;
  }
  v80 = &v79[16 * v76];
  v17 = (unint64_t)&v79[16 * v78];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)v80 = _Q0;
  v35 = v80 + 16;
  if (v29 == v19)
    goto LABEL_125;
  do
  {
    *((_OWORD *)v80 - 1) = *((_OWORD *)v29 - 1);
    v80 -= 16;
    v29 -= 16;
  }
  while (v29 != v19);
  if (v19)
LABEL_125:
    operator delete(v19);
  v19 = v80;
  if ((unint64_t)v35 < v17)
  {
LABEL_16:
    *(_OWORD *)v35 = xmmword_19FFB3310;
    v36 = v35 + 16;
    if ((unint64_t)(v35 + 16) < v17)
      goto LABEL_17;
    goto LABEL_142;
  }
LABEL_127:
  v82 = (v35 - v19) >> 4;
  v83 = v82 + 1;
  if ((unint64_t)(v82 + 1) >> 60)
    goto LABEL_284;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v83)
    v83 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v84 = 0xFFFFFFFFFFFFFFFLL;
  else
    v84 = v83;
  if (v84)
  {
    if (v84 >> 60)
      goto LABEL_280;
    v85 = (char *)operator new(16 * v84);
  }
  else
  {
    v85 = 0;
  }
  v86 = &v85[16 * v82];
  v17 = (unint64_t)&v85[16 * v84];
  *(_OWORD *)v86 = xmmword_19FFB3310;
  v36 = v86 + 16;
  if (v35 == v19)
    goto LABEL_140;
  do
  {
    *((_OWORD *)v86 - 1) = *((_OWORD *)v35 - 1);
    v86 -= 16;
    v35 -= 16;
  }
  while (v35 != v19);
  if (v19)
LABEL_140:
    operator delete(v19);
  v19 = v86;
  if ((unint64_t)v36 < v17)
  {
LABEL_17:
    *(_OWORD *)v36 = xmmword_19FFB5A20;
    v37 = v36 + 16;
    if ((unint64_t)(v36 + 16) < v17)
      goto LABEL_18;
    goto LABEL_157;
  }
LABEL_142:
  v87 = (v36 - v19) >> 4;
  v88 = v87 + 1;
  if ((unint64_t)(v87 + 1) >> 60)
    goto LABEL_284;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v88)
    v88 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v89 = 0xFFFFFFFFFFFFFFFLL;
  else
    v89 = v88;
  if (v89)
  {
    if (v89 >> 60)
      goto LABEL_280;
    v90 = (char *)operator new(16 * v89);
  }
  else
  {
    v90 = 0;
  }
  v91 = &v90[16 * v87];
  v17 = (unint64_t)&v90[16 * v89];
  *(_OWORD *)v91 = xmmword_19FFB5A20;
  v37 = v91 + 16;
  if (v36 == v19)
    goto LABEL_155;
  do
  {
    *((_OWORD *)v91 - 1) = *((_OWORD *)v36 - 1);
    v91 -= 16;
    v36 -= 16;
  }
  while (v36 != v19);
  if (v19)
LABEL_155:
    operator delete(v19);
  v19 = v91;
  if ((unint64_t)v37 < v17)
  {
LABEL_18:
    *(_OWORD *)v37 = xmmword_19FFB5A30;
    v38 = v37 + 16;
    if ((unint64_t)(v37 + 16) < v17)
      goto LABEL_19;
    goto LABEL_172;
  }
LABEL_157:
  v92 = (v37 - v19) >> 4;
  v93 = v92 + 1;
  if ((unint64_t)(v92 + 1) >> 60)
    goto LABEL_284;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v93)
    v93 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v94 = 0xFFFFFFFFFFFFFFFLL;
  else
    v94 = v93;
  if (v94)
  {
    if (v94 >> 60)
      goto LABEL_280;
    v95 = (char *)operator new(16 * v94);
  }
  else
  {
    v95 = 0;
  }
  v96 = &v95[16 * v92];
  v17 = (unint64_t)&v95[16 * v94];
  *(_OWORD *)v96 = xmmword_19FFB5A30;
  v38 = v96 + 16;
  if (v37 == v19)
    goto LABEL_170;
  do
  {
    *((_OWORD *)v96 - 1) = *((_OWORD *)v37 - 1);
    v96 -= 16;
    v37 -= 16;
  }
  while (v37 != v19);
  if (v19)
LABEL_170:
    operator delete(v19);
  v19 = v96;
  if ((unint64_t)v38 < v17)
  {
LABEL_19:
    *(_OWORD *)v38 = xmmword_19FFB5A40;
    v39 = v38 + 16;
    if ((unint64_t)(v38 + 16) < v17)
      goto LABEL_20;
LABEL_187:
    v102 = (v39 - v19) >> 4;
    v103 = v102 + 1;
    if ((unint64_t)(v102 + 1) >> 60)
      goto LABEL_284;
    if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v103)
      v103 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
      v104 = 0xFFFFFFFFFFFFFFFLL;
    else
      v104 = v103;
    if (v104)
    {
      if (v104 >> 60)
        goto LABEL_280;
      v105 = (char *)operator new(16 * v104);
    }
    else
    {
      v105 = 0;
    }
    v106 = &v105[16 * v102];
    v17 = (unint64_t)&v105[16 * v104];
    *(_OWORD *)v106 = xmmword_19FFB5A50;
    v40 = v106 + 16;
    if (v39 == v19)
      goto LABEL_200;
    do
    {
      *((_OWORD *)v106 - 1) = *((_OWORD *)v39 - 1);
      v106 -= 16;
      v39 -= 16;
    }
    while (v39 != v19);
    if (v19)
LABEL_200:
      operator delete(v19);
    v19 = v106;
    if ((unint64_t)v40 < v17)
      goto LABEL_21;
LABEL_202:
    v107 = (v40 - v19) >> 4;
    v108 = v107 + 1;
    if (!((unint64_t)(v107 + 1) >> 60))
    {
      if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v108)
        v108 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
      if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
        v108 = 0xFFFFFFFFFFFFFFFLL;
      if (!v108)
      {
        v109 = 0;
LABEL_211:
        v110 = &v109[16 * v107];
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)v110 = _Q0;
        v42 = (double *)(v110 + 16);
        if (v40 == v19)
          goto LABEL_214;
        do
        {
          *((_OWORD *)v110 - 1) = *((_OWORD *)v40 - 1);
          v110 -= 16;
          v40 -= 16;
        }
        while (v40 != v19);
        if (v19)
LABEL_214:
          operator delete(v19);
        v19 = v110;
        goto LABEL_216;
      }
      if (!(v108 >> 60))
      {
        v109 = (char *)operator new(16 * v108);
        goto LABEL_211;
      }
LABEL_280:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_284:
    abort();
  }
LABEL_172:
  v97 = (v38 - v19) >> 4;
  v98 = v97 + 1;
  if ((unint64_t)(v97 + 1) >> 60)
    goto LABEL_284;
  if ((uint64_t)(v17 - (_QWORD)v19) >> 3 > v98)
    v98 = (uint64_t)(v17 - (_QWORD)v19) >> 3;
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
    v99 = 0xFFFFFFFFFFFFFFFLL;
  else
    v99 = v98;
  if (v99)
  {
    if (v99 >> 60)
      goto LABEL_280;
    v100 = (char *)operator new(16 * v99);
  }
  else
  {
    v100 = 0;
  }
  v101 = &v100[16 * v97];
  v17 = (unint64_t)&v100[16 * v99];
  *(_OWORD *)v101 = xmmword_19FFB5A40;
  v39 = v101 + 16;
  if (v38 == v19)
    goto LABEL_185;
  do
  {
    *((_OWORD *)v101 - 1) = *((_OWORD *)v38 - 1);
    v101 -= 16;
    v38 -= 16;
  }
  while (v38 != v19);
  if (v19)
LABEL_185:
    operator delete(v19);
  v19 = v101;
  if ((unint64_t)v39 >= v17)
    goto LABEL_187;
LABEL_20:
  *(_OWORD *)v39 = xmmword_19FFB5A50;
  v40 = v39 + 16;
  if ((unint64_t)(v39 + 16) >= v17)
    goto LABEL_202;
LABEL_21:
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)v40 = _Q0;
  v42 = (double *)(v40 + 16);
LABEL_216:
  -[VKCameraController camera](self, "camera");
  v112 = v217;
  v113 = (double *)(*(_QWORD *)&v217 + 8);
  if (*(double *)&v218 != 0.0)
  {
    p_shared_owners = &v218->__shared_owners_;
    do
      v115 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v115 - 1, (unint64_t *)p_shared_owners));
    if (!v115)
    {
      ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
      std::__shared_weak_count::__release_weak(v218);
    }
  }
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v217, v113);
  v116 = *(double *)(*(_QWORD *)&v112 + 32);
  v117 = cos(3.14159265 - *(double *)(*(_QWORD *)&v112 + 40));
  v118 = v217;
  v119 = v218;
  v120 = v219;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (v19 == (char *)v42)
  {
LABEL_278:
    operator delete(v19);
    return result;
  }
  v121 = sqrt((v116 + v117 * -12756274.0) * v116 + 4.06806316e13);
  v122 = v121 + -6378137.0;
  v123 = sqrt((v121 + 6378137.0) * (v121 + -6378137.0));
  v124 = sqrt(v118 * v118 + *(double *)&v119 * *(double *)&v119 + v120 * v120);
  v205 = v123 + v123;
  v207 = (v124 - v122) * (v124 - v122);
  v206 = v123;
  v125 = (double *)v19;
  v203 = self;
  do
  {
    -[VKCameraController camera](self, "camera");
    v128.n128_f64[0] = gdc::ViewDataAccess::worldRayFromScreenNormalizedPoint((uint64_t)&v211, *(uint64_t *)&v209, v113, *v125, v125[1]);
    v129 = v210;
    if (v210)
    {
      v130 = (unint64_t *)&v210->__shared_owners_;
      do
        v131 = __ldaxr(v130);
      while (__stlxr(v131 - 1, v130));
      if (!v131)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v129->__on_zero_shared)(v129, v128);
        std::__shared_weak_count::__release_weak(v129);
      }
    }
    v209 = 0.0;
    v132 = v211;
    v133 = v212;
    v134 = v213;
    v135 = v214;
    v137 = v215;
    v136 = v216;
    v138 = v135 * v135 + v137 * v137 + v136 * v136;
    v139 = v214 * v211 + v215 * v212 + v216 * v213;
    v140 = v139 + v139;
    v141 = (v207 - (v132 * v132 + v133 * v133 + v134 * v134)) * (4.0 * v138) + v140 * v140;
    v142 = 0.0;
    if (v141 < 0.0)
    {
      v143 = 0.0;
      v144 = v205;
      goto LABEL_237;
    }
    v145 = sqrt(v141);
    v146 = (v145 + v140) * -0.5 / v138;
    v147 = (v145 - v140) * 0.5 / v138;
    if (v146 >= 0.0)
    {
      v209 = v146;
      v148 = (double *)&v208;
    }
    else
    {
      v143 = 0.0;
      v144 = v205;
      if (v147 < 0.0)
        goto LABEL_237;
      v148 = &v209;
    }
    *v148 = v147;
    v149 = v132 + v135 * v209;
    v150 = v133 + v137 * v209;
    v151 = v134 + v136 * v209;
    v152 = sqrt(v149 * v149 + v150 * v150);
    v153 = atan2(v151, v152 * 0.996647189);
    v204 = atan2(v150, v149);
    v154 = __sincos_stret(v153);
    v155 = v152 + v154.__cosval * v154.__cosval * -42697.6727 * v154.__cosval;
    v142 = v204;
    v143 = atan2(v151 + v154.__sinval * v154.__sinval * 42841.3115 * v154.__sinval, v155);
    v144 = sqrt((v217 - v149) * (v217 - v149)+ (*(double *)&v218 - v150) * (*(double *)&v218 - v150)+ (v219 - v151) * (v219 - v151));
    v123 = v206;
LABEL_237:
    if (v144 >= v123)
    {
      v158 = v217 + v135 * v123;
      v159 = *(double *)&v218 + v137 * v123;
      v160 = v219 + v136 * v123;
      v161 = sqrt(v158 * v158 + v159 * v159);
      v162 = atan2(v160, v161 * 0.996647189);
      v163 = atan2(v159, v158);
      v164 = __sincos_stret(v162);
      v165 = atan2(v160 + v164.__sinval * v164.__sinval * 42841.3115 * v164.__sinval, v161 + v164.__cosval * v164.__cosval * -42697.6727 * v164.__cosval);
      v166 = v165;
      var1 = (long double *)retstr->var1;
      var0 = (long double *)retstr->var2.var0;
      if (var1 < var0)
      {
        *var1 = v165;
        var1[1] = v163;
        v126 = var1 + 2;
        v123 = v206;
        goto LABEL_224;
      }
      v169 = (long double *)retstr->var0;
      v170 = (char *)var1 - (char *)retstr->var0;
      v171 = v170 >> 4;
      v172 = (v170 >> 4) + 1;
      if (v172 >> 60)
        abort();
      v173 = (char *)var0 - (char *)v169;
      if (v173 >> 3 > v172)
        v172 = v173 >> 3;
      if ((unint64_t)v173 >= 0x7FFFFFFFFFFFFFF0)
        v174 = 0xFFFFFFFFFFFFFFFLL;
      else
        v174 = v172;
      v123 = v206;
      if (v174 >> 60)
        goto LABEL_280;
      result = (vector<geo::Coordinate2D<geo::Radians, double>, std::allocator<geo::Coordinate2D<geo::Radians, double>>> *)operator new(16 * v174);
      v175 = &result->var0 + 2 * v171;
      *(double *)v175 = v166;
      *((long double *)v175 + 1) = v163;
      v176 = (char *)var1 - (char *)v169;
      if (var1 == v169)
        goto LABEL_261;
      v177 = v176 - 16;
      if ((unint64_t)(v176 - 16) >= 0xB0)
      {
        v185 = v177 >> 4;
        v186 = (long double *)((char *)result + v170 - (v177 & 0xFFFFFFFFFFFFFFF0) - 16);
        self = v203;
        if (v186 >= var1 || (v178 = &result->var0 + 2 * v171, &var1[-2 * v185 - 2] >= (long double *)v175))
        {
          v187 = v185 + 1;
          v188 = var1 - 4;
          v189 = (double *)(v175 - 4);
          v190 = v187 & 0x1FFFFFFFFFFFFFFCLL;
          do
          {
            v220 = vld2q_f64(v188);
            v191 = v188 - 4;
            v222 = vld2q_f64(v191);
            vst2q_f64(v189, v220);
            v192 = v189 - 4;
            vst2q_f64(v192, v222);
            v189 -= 8;
            v188 -= 8;
            v190 -= 4;
          }
          while (v190);
          v178 = &v175[-2 * (v187 & 0x1FFFFFFFFFFFFFFCLL)];
          var1 -= 2 * (v187 & 0x1FFFFFFFFFFFFFFCLL);
          if (v187 == (v187 & 0x1FFFFFFFFFFFFFFCLL))
            goto LABEL_275;
        }
      }
      else
      {
        v178 = &result->var0 + 2 * v171;
        self = v203;
      }
      do
      {
        v193 = (void *)*((_QWORD *)var1 - 2);
        var1 -= 2;
        *(v178 - 2) = v193;
        v178 -= 2;
        v178[1] = (void *)*((_QWORD *)var1 + 1);
      }
      while (var1 != v169);
    }
    else
    {
      v157 = (char *)retstr->var1;
      v156 = (char *)retstr->var2.var0;
      if (v157 < v156)
      {
        *(long double *)v157 = v143;
        *((long double *)v157 + 1) = v142;
        v126 = v157 + 16;
        goto LABEL_224;
      }
      v169 = (long double *)retstr->var0;
      v179 = v157 - (char *)retstr->var0;
      v180 = v179 >> 4;
      v181 = (v179 >> 4) + 1;
      if (v181 >> 60)
        abort();
      v182 = v156 - (char *)v169;
      if (v182 >> 3 > v181)
        v181 = v182 >> 3;
      if ((unint64_t)v182 >= 0x7FFFFFFFFFFFFFF0)
        v174 = 0xFFFFFFFFFFFFFFFLL;
      else
        v174 = v181;
      if (v174 >> 60)
        goto LABEL_280;
      result = (vector<geo::Coordinate2D<geo::Radians, double>, std::allocator<geo::Coordinate2D<geo::Radians, double>>> *)operator new(16 * v174);
      v175 = &result->var0 + 2 * v180;
      *(long double *)v175 = v143;
      *((long double *)v175 + 1) = v142;
      v183 = v157 - (char *)v169;
      if (v157 == (char *)v169)
      {
LABEL_261:
        v178 = v175;
        self = v203;
        goto LABEL_275;
      }
      v184 = v183 - 16;
      if ((unint64_t)(v183 - 16) >= 0xB0)
      {
        v194 = v184 >> 4;
        v195 = (char *)result + v179 - (v184 & 0xFFFFFFFFFFFFFFF0) - 16;
        self = v203;
        if (v195 >= v157 || (v178 = &result->var0 + 2 * v180, &v157[-16 * v194 - 16] >= (char *)v175))
        {
          v196 = v194 + 1;
          v197 = (const double *)(v157 - 32);
          v198 = (double *)(v175 - 4);
          v199 = v196 & 0x1FFFFFFFFFFFFFFCLL;
          do
          {
            v221 = vld2q_f64(v197);
            v200 = v197 - 4;
            v223 = vld2q_f64(v200);
            vst2q_f64(v198, v221);
            v201 = v198 - 4;
            vst2q_f64(v201, v223);
            v198 -= 8;
            v197 -= 8;
            v199 -= 4;
          }
          while (v199);
          v178 = &v175[-2 * (v196 & 0x1FFFFFFFFFFFFFFCLL)];
          v157 -= 16 * (v196 & 0x1FFFFFFFFFFFFFFCLL);
          if (v196 == (v196 & 0x1FFFFFFFFFFFFFFCLL))
            goto LABEL_275;
        }
      }
      else
      {
        v178 = &result->var0 + 2 * v180;
        self = v203;
      }
      do
      {
        v202 = (void *)*((_QWORD *)v157 - 2);
        v157 -= 16;
        *(v178 - 2) = v202;
        v178 -= 2;
        v178[1] = (void *)*((_QWORD *)v157 + 1);
      }
      while (v157 != (char *)v169);
    }
LABEL_275:
    v126 = v175 + 2;
    retstr->var0 = v178;
    retstr->var1 = v175 + 2;
    retstr->var2.var0 = (char *)result + 16 * v174;
    if (v169)
      operator delete(v169);
LABEL_224:
    retstr->var1 = v126;
    v125 += 2;
  }
  while (v125 != v42);
  if (v19)
    goto LABEL_278;
  return result;
}

- (id)mapRegion
{
  id v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  double v6;
  std::__shared_weak_count *v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  id v15;
  double v16;
  double v17;
  float64x2_t v18;
  const double *v19;
  uint64_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  const double *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float64x2_t v34;
  float64x2_t v35;
  const double *p_shared_weak_owners;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  const double *v40;
  unsigned __int128 v41;
  unsigned __int128 v42;
  float64x2_t v43;
  float64x2_t v44;
  double v45;
  id v46;
  std::__shared_weak_count *__p;
  std::__shared_weak_count *v49;
  float64x2x2_t v50;
  float64x2x2_t v51;

  v3 = objc_alloc_init(MEMORY[0x1E0D27208]);
  -[VKCameraController camera](self, "camera");
  if (!v49)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v49->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
  {
LABEL_5:
    if (__p)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(v3, "setEastLng:", -180.0);
    objc_msgSend(v3, "setWestLng:", -180.0);
    objc_msgSend(v3, "setNorthLat:", -180.0);
    objc_msgSend(v3, "setSouthLat:", -180.0);
    v15 = v3;
    goto LABEL_31;
  }
  ((void (*)())v49->__on_zero_shared)();
  std::__shared_weak_count::__release_weak(v49);
  if (!__p)
    goto LABEL_10;
LABEL_6:
  -[VKDaVinciCameraController _getVisibleArea](self, "_getVisibleArea");
  v7 = __p;
  if (__p != v49)
  {
    v8 = (char *)v49 - (char *)__p - 16;
    v9 = (v8 >> 4) + 1;
    if (v8 > 0x2F)
    {
      v18 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
      v19 = (const double *)&__p[1].__shared_owners_;
      v20 = v9 & 0x1FFFFFFFFFFFFFFCLL;
      v21 = v18;
      v22 = v18;
      v23 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
      v24 = v18;
      v25 = v23;
      v26 = v23;
      v27 = v23;
      do
      {
        v28 = v19 - 4;
        v50 = vld2q_f64(v28);
        v51 = vld2q_f64(v19);
        v22 = vminnmq_f64(v22, v50.val[1]);
        v24 = vminnmq_f64(v24, v51.val[1]);
        v18 = vminnmq_f64(v18, v50.val[0]);
        v21 = vminnmq_f64(v21, v51.val[0]);
        v26 = vmaxnmq_f64(v26, v50.val[1]);
        v27 = vmaxnmq_f64(v27, v51.val[1]);
        v23 = vmaxnmq_f64(v23, v50.val[0]);
        v25 = vmaxnmq_f64(v25, v51.val[0]);
        v19 += 8;
        v20 -= 4;
      }
      while (v20);
      v13 = vmaxnmvq_f64(vmaxnmq_f64(v26, v27));
      v10 = vmaxnmvq_f64(vmaxnmq_f64(v23, v25));
      v12 = vminnmvq_f64(vminnmq_f64(v22, v24));
      v11 = vminnmvq_f64(vminnmq_f64(v18, v21));
      if (v9 == (v9 & 0x1FFFFFFFFFFFFFFCLL))
      {
LABEL_17:
        v16 = v10 * 57.2957795;
        v17 = v11 * 57.2957795;
        v6 = v13 - v12;
        if (v13 - v12 > 3.14159265)
        {
          if (v8 > 0x3F)
          {
            v31 = v9 & 3;
            if ((v9 & 3) == 0)
              v31 = 4;
            v32 = v9 - v31;
            v33 = 16 * v32;
            v34 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
            v35 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
            p_shared_weak_owners = (const double *)&__p[1].__shared_weak_owners_;
            v37 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
            v38 = v35;
            v39 = v34;
            do
            {
              v40 = p_shared_weak_owners - 4;
              v41 = (unsigned __int128)vld2q_f64(v40);
              v42 = (unsigned __int128)vld2q_f64(p_shared_weak_owners);
              v43 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v41), (int8x16_t)vaddq_f64((float64x2_t)v41, v37), (int8x16_t)v41);
              v44 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v42), (int8x16_t)vaddq_f64((float64x2_t)v42, v37), (int8x16_t)v42);
              v35 = vminnmq_f64(v35, v43);
              v38 = vminnmq_f64(v38, v44);
              v34 = vmaxnmq_f64(v34, v43);
              v39 = vmaxnmq_f64(v39, v44);
              p_shared_weak_owners += 8;
              v32 -= 4;
            }
            while (v32);
            v7 = (std::__shared_weak_count *)((char *)__p + v33);
            v13 = vmaxnmvq_f64(vmaxnmq_f64(v34, v39));
            v6 = vminnmvq_f64(vminnmq_f64(v35, v38));
          }
          else
          {
            v13 = -3.40282347e38;
            v6 = 3.40282347e38;
          }
          do
          {
            v45 = *(double *)&v7->__shared_owners_;
            if (v45 > 0.0)
              v45 = v45 + -6.28318531;
            v6 = fmin(v6, v45);
            v13 = fmax(v13, v45);
            v7 = (std::__shared_weak_count *)((char *)v7 + 16);
          }
          while (v7 != v49);
          v12 = v6 + 6.28318531;
        }
        goto LABEL_29;
      }
      v14 = (double *)(&__p->std::__shared_count + (v9 & 0x1FFFFFFFFFFFFFFCLL));
    }
    else
    {
      v10 = -3.40282347e38;
      v11 = 3.40282347e38;
      v12 = 3.40282347e38;
      v13 = -3.40282347e38;
      v14 = (double *)__p;
    }
    do
    {
      v30 = *v14;
      v29 = v14[1];
      v14 += 2;
      v12 = fmin(v12, v29);
      v11 = fmin(v11, v30);
      v13 = fmax(v13, v29);
      v10 = fmax(v10, v30);
    }
    while (v14 != (double *)v49);
    goto LABEL_17;
  }
  v12 = 3.40282347e38;
  v13 = -3.40282347e38;
  v16 = -1.94967423e40;
  v17 = 1.94967423e40;
LABEL_29:
  objc_msgSend(v3, "setEastLng:", v13 * 57.2957795, v6);
  objc_msgSend(v3, "setWestLng:", v12 * 57.2957795);
  objc_msgSend(v3, "setNorthLat:", v16);
  objc_msgSend(v3, "setSouthLat:", v17);
  v46 = v3;
  operator delete(__p);
LABEL_31:

  return v3;
}

- (double)geocAngleBetween:()Coordinate2D<geo:(double>)a3 :()Coordinate2D<geo:(double>)a4 :Radians Radians andCoordinate:
{
  double *v4;
  double *v5;
  double v6;
  __double2 v7;
  double v8;
  __double2 v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  double v14;
  __double2 v15;
  double v17;
  double v18;

  v6 = v4[1];
  v17 = *v5;
  v18 = v5[1];
  v7 = __sincos_stret(*v4);
  v8 = 6378137.0 / sqrt(-(v7.__sinval * v7.__sinval * 0.00669437999 + -1.0));
  v9 = __sincos_stret(v6);
  v10 = v8 * v7.__cosval * v9.__cosval;
  v11 = v8 * v7.__cosval * v9.__sinval;
  v12 = __sincos_stret(v17);
  v13 = 6378137.0 / sqrt(-(v12.__sinval * v12.__sinval * 0.00669437999 + -1.0));
  v14 = v13 * v12.__cosval;
  v15 = __sincos_stret(v18);
  return acos(fmax(fmin((v12.__sinval * 0.99330562 * v13 * (v7.__sinval * 0.99330562 * v8)+ v14 * v15.__cosval * v10+ v14 * v15.__sinval * v11)/ sqrt((v14 * v15.__cosval * (v14 * v15.__cosval)+ v14 * v15.__sinval * (v14 * v15.__sinval)+ v12.__sinval * 0.99330562 * v13 * (v12.__sinval * 0.99330562 * v13))* (v10 * v10 + v11 * v11 + v7.__sinval * 0.99330562 * v8 * (v7.__sinval * 0.99330562 * v8))), 1.0), -1.0));
}

- (double)earthRadiusAt:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double *v3;
  __double2 v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;

  v4 = __sincos_stret(*v3);
  v5 = vmulq_n_f64((float64x2_t)xmmword_19FFB5A60, v4.__cosval);
  v6 = vmulq_n_f64((float64x2_t)xmmword_19FFB5A70, v4.__sinval);
  v7 = vmlaq_f64(vmulq_f64(v6, v6), v5, v5);
  return sqrt(vdivq_f64(v7, (float64x2_t)vdupq_laneq_s64((int64x2_t)v7, 1)).f64[0]);
}

- (Unit<geo::RadianUnitDescription,)greatCircleMidPointLatitude:()Unit<geo:(double>)a3 :()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :RadianUnitDescription RadianUnitDescription RadianUnitDescription fromLongitude:toLongitude:
{
  double *v5;
  double *v6;
  double *v7;
  double *v8;
  double *v9;
  double v10;
  __double2 v11;
  __double2 v12;
  Unit<geo::RadianUnitDescription, double> v13;

  v9 = v8;
  v10 = *v7 - *v6;
  v11 = __sincos_stret(*v5);
  v12 = __sincos_stret(v10);
  v13._value = atan2(v11.__sinval + v11.__sinval, sqrt(v12.__sinval * v11.__cosval * (v12.__sinval * v11.__cosval)+ (v11.__cosval + v12.__cosval * v11.__cosval) * (v11.__cosval + v12.__cosval * v11.__cosval)));
  *v9 = v13._value;
  return v13;
}

- (Unit<geo::RadianUnitDescription,)widestLatitudeForMapRegion:(id)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  Unit<geo::RadianUnitDescription, double> v9;
  id v10;

  v4 = v3;
  v10 = a3;
  objc_msgSend(v10, "southLat");
  if (v5 >= 0.0)
  {
    objc_msgSend(v10, "southLat");
    goto LABEL_5;
  }
  objc_msgSend(v10, "northLat");
  v6 = 0.0;
  if (v7 <= 0.0)
  {
    objc_msgSend(v10, "northLat");
LABEL_5:
    v6 = v8 * 0.0174532925;
  }
  *v4 = v6;

  return v9;
}

- (double)zoomForMapRegion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  std::__shared_weak_count *v49;
  uint64_t *v50;
  unint64_t v51;
  float v52;
  float v53;
  std::__shared_weak_count *v54;
  uint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t *v58;
  unint64_t v59;
  double v60;
  std::__shared_weak_count *v61;
  double v62;
  uint64_t *v63;
  unint64_t v64;
  __double2 v65;
  double v66;
  __double2 v67;
  __double2 v68;
  double v70;
  double v71;
  double v72;
  float v73;
  float v74;
  double v75;
  float v76;
  float v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _QWORD v82[2];
  _QWORD v83[2];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[2];
  uint64_t v89;
  double v90[2];
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  double v94[2];
  uint64_t v95;
  uint64_t v96;
  std::__shared_weak_count *v97;
  double *v98;
  std::__shared_weak_count *v99;
  __int128 v100;

  v4 = a3;
  objc_msgSend(v4, "eastLng");
  v6 = v5;
  objc_msgSend(v4, "westLng");
  if (v6 < v7)
  {
    objc_msgSend(v4, "eastLng");
    objc_msgSend(v4, "setEastLng:", v8 + 360.0);
  }
  -[VKDaVinciCameraController _centerCoordinateForMapRegion:](self, "_centerCoordinateForMapRegion:", v4);
  -[VKCameraController camera](self, "camera");
  v9 = v98[46];
  -[VKCameraController camera](self, "camera");
  v10 = *(double *)(v96 + 376);
  if (v97)
  {
    p_shared_owners = &v97->__shared_owners_;
    do
      v12 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
      std::__shared_weak_count::__release_weak(v97);
    }
  }
  if (v99)
  {
    v13 = &v99->__shared_owners_;
    do
      v14 = __ldaxr((unint64_t *)v13);
    while (__stlxr(v14 - 1, (unint64_t *)v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
      std::__shared_weak_count::__release_weak(v99);
    }
  }
  -[VKCameraController camera](self, "camera");
  v16 = v98[46];
  v15 = v98[47];
  if (v15 >= v16)
  {
    v22 = v98[57];
    v23 = v99;
    if (!v99)
      goto LABEL_24;
  }
  else
  {
    v17 = v15 * v16;
    v18 = v15 / v16;
    if (v17 <= 0.0)
      v19 = 1.0;
    else
      v19 = v18;
    v20 = tan(v98[57] * 0.5);
    v21 = atan(v19 * v20);
    v22 = v21 + v21;
    v23 = v99;
    if (!v99)
      goto LABEL_24;
  }
  v24 = (unint64_t *)&v23->__shared_owners_;
  do
    v25 = __ldaxr(v24);
  while (__stlxr(v25 - 1, v24));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
LABEL_24:
  v95 = v100;
  -[VKDaVinciCameraController earthRadiusAt:](self, "earthRadiusAt:", &v95);
  v27 = v26;
  objc_msgSend(v4, "northLat");
  v94[0] = v28 * 0.0174532925;
  v94[1] = *((double *)&v100 + 1);
  v93 = v100;
  -[VKDaVinciCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v94, &v93);
  v30 = v29;
  objc_msgSend(v4, "northLat");
  v92 = v31;
  -[VKDaVinciCameraController earthRadiusAt:](self, "earthRadiusAt:", &v92);
  v33 = v32;
  v91 = v100;
  objc_msgSend(v4, "southLat");
  v90[0] = v34 * 0.0174532925;
  v90[1] = *((double *)&v100 + 1);
  -[VKDaVinciCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", &v91, v90);
  v81 = v35;
  objc_msgSend(v4, "southLat");
  v89 = v36;
  -[VKDaVinciCameraController earthRadiusAt:](self, "earthRadiusAt:", &v89);
  v80 = v37;
  -[VKDaVinciCameraController widestLatitudeForMapRegion:](self, "widestLatitudeForMapRegion:", v4);
  v88[0] = v96;
  objc_msgSend(v4, "westLng");
  v87 = v38;
  objc_msgSend(v4, "eastLng");
  v86 = v39;
  -[VKDaVinciCameraController greatCircleMidPointLatitude:fromLongitude:toLongitude:](self, "greatCircleMidPointLatitude:fromLongitude:toLongitude:", v88, &v87, &v86);
  v85 = v88[1];
  -[VKDaVinciCameraController earthRadiusAt:](self, "earthRadiusAt:", &v85);
  v79 = v40;
  v84 = v96;
  -[VKDaVinciCameraController earthRadiusAt:](self, "earthRadiusAt:", &v84);
  v78 = v41;
  objc_msgSend(v4, "westLng");
  v83[0] = v96;
  *(double *)&v83[1] = v42 * 0.0174532925;
  objc_msgSend(v4, "eastLng");
  v82[0] = v96;
  *(double *)&v82[1] = v43 * 0.0174532925;
  -[VKDaVinciCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v83, v82);
  v45 = v44;
  -[VKCameraController camera](self, "camera");
  v46 = v98[47];
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v77 = v47;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v76 = v48;
  v49 = v99;
  if (v99)
  {
    v50 = &v99->__shared_owners_;
    do
      v51 = __ldaxr((unint64_t *)v50);
    while (__stlxr(v51 - 1, (unint64_t *)v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  -[VKCameraController camera](self, "camera");
  v75 = v98[46];
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v74 = v52;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v73 = v53;
  v54 = v99;
  if (v99)
  {
    v55 = &v99->__shared_owners_;
    do
      v56 = __ldaxr((unint64_t *)v55);
    while (__stlxr(v56 - 1, (unint64_t *)v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  -[VKCameraController camera](self, "camera");
  v57 = v99;
  v70 = v98[47];
  if (v99)
  {
    v58 = &v99->__shared_owners_;
    do
      v59 = __ldaxr((unint64_t *)v58);
    while (__stlxr(v59 - 1, (unint64_t *)v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v71 = v46;
  v72 = v33;
  -[VKCameraController camera](self, "camera");
  v60 = v30;
  v61 = v99;
  v62 = v98[46];
  if (v99)
  {
    v63 = &v99->__shared_owners_;
    do
      v64 = __ldaxr((unint64_t *)v63);
    while (__stlxr(v64 - 1, (unint64_t *)v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  v65 = __sincos_stret(v45 * 0.5);
  v66 = tan(v22 * 0.5);
  v67 = __sincos_stret(v60);
  v68 = __sincos_stret(v81);

  return fmax(fmax(v72 * v67.__sinval / v66 + (v67.__cosval + -1.0) * v27, v80 * v68.__sinval / v66 + (v68.__cosval + -1.0) * v27)* v70/ (v71 - (v77 + v76)), (v78 * v10 * v65.__sinval / (v66 * v9) + (v65.__cosval + -1.0) * v79) * v62 / (v75 - (v74 + v73)));
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  return 1.0;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _OWORD v18[2];

  v11 = a3;
  v12 = a7;
  v13 = a8;
  -[VKDaVinciCameraController _centerCoordinateForMapRegion:](self, "_centerCoordinateForMapRegion:", v11);
  objc_msgSend(v11, "eastLng");
  v15 = v14;
  objc_msgSend(v11, "westLng");
  if (v15 < v16)
  {
    objc_msgSend(v11, "eastLng");
    objc_msgSend(v11, "setEastLng:", v17 + 360.0);
  }
  -[VKDaVinciCameraController zoomForMapRegion:](self, "zoomForMapRegion:", v11);
  v18[0] = v18[1];
  -[VKDaVinciCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v18, v12, v13);
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 0;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 0);

}

- (Coordinate2D<geo::Radians,)_centerCoordinateForMapRegion:(id)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  Coordinate2D<geo::Radians, double> result;

  v4 = v3;
  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  v6 = v5 * 0.0174532925;
  v8 = v7 * 0.0174532925;
  *v4 = v6;
  v4[1] = v8;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v8;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v6;
  return result;
}

- (Coordinate2D<geo::Radians,)centerCoordinateRad
{
  _OWORD *v2;
  _OWORD *v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  Matrix<int, 2, 1> v8;
  double v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  double v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  __int128 v15;
  Coordinate2D<geo::Radians, double> result;

  v4 = v2;
  -[VKCameraController camera](self, "camera");
  if (*((_QWORD *)&v15 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v15 + 1) + 16))(*((_QWORD *)&v15 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v15 + 1));
    }
  }
  v7 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v8 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  -[VKCameraController camera](self, "camera");
  md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v15, (uint64_t)v7, v13 + 8, (int32x2_t)v8);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v12 = *(double *)&v15;
  *v4 = v15;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v9;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v12;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2;
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKDaVinciCameraController centerCoordinateRad](self, "centerCoordinateRad");
  v2 = v4 * 57.2957795;
  v3 = v5 * 57.2957795;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)distanceFromCenterCoordinate
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 32);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2;
}

- (double)altitude
{
  double v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  double v6;
  unint64_t *v7;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  -[VKCameraController camera](self, "camera");
  v3 = *(double *)(v12 + 32);
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  -[VKCameraController camera](self, "camera");
  v6 = *(double *)(v12 + 40);
  if (v13)
  {
    v7 = (unint64_t *)&v13->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v9 = v6;
  v10 = v3;
  return (float)(cosf(v9) * v10);
}

- (double)heading
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  float v5;
  float v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v8 + 48);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v5 = v2;
  if (v5 > 3.14159265)
  {
    v6 = v5 + -6.28318531;
    v5 = v6;
  }
  return v5 * -57.2957795;
}

- (double)pitch
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 40);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2 * 57.2957795;
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  double v9;
  double var1;
  BOOL v11;
  double v12;
  double v13;
  unint64_t *v14;
  unint64_t v15;
  double var0;
  double v17;
  double v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  Matrix<int, 2, 1> v22;
  uint64_t *v23;
  unint64_t v24;
  _BYTE *cameraManager;
  double v26;
  double v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  __int128 v35;
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  uint64_t v39;
  double v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  __int128 v45;
  uint64_t v46;
  objc_super v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;

  v8 = a5;
  v9 = 60592301.5;
  var1 = a3->var1;
  v11 = var1 > 60592301.5 || var1 < 0.0;
  v12 = fmin(a3->var0, 60592301.5);
  if (!v11)
    v9 = a3->var1;
  a3->var0 = v12;
  a3->var1 = v9;
  v50 = 0;
  v51 = 0.0;
  v52 = 0;
  -[VKScreenCameraController centerCoordinateDistanceRange](self, "centerCoordinateDistanceRange");
  if (a3->var0 != 0.0 || a3->var1 != v51 || a3->var2 != v52)
  {
    v48 = *(_OWORD *)&a3->var0;
    v49 = *(_QWORD *)&a3->var2;
    v47.receiver = self;
    v47.super_class = (Class)VKDaVinciCameraController;
    -[VKScreenCameraController setCenterCoordinateDistanceRange:duration:timingFunction:](&v47, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v48, v8, a4);
    a3->var0 = fmax(a3->var0, 0.0);
    -[VKCameraController camera](self, "camera");
    v13 = *(double *)(v45 + 32);
    if (*((_QWORD *)&v45 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v45 + 1) + 16))(*((_QWORD *)&v45 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v45 + 1));
      }
    }
    var0 = a3->var0;
    if (v13 >= a3->var0)
    {
      v17 = a3->var1;
      -[VKDaVinciCameraController distanceFromCenterCoordinate](self, "distanceFromCenterCoordinate");
      if (v17 >= v18)
        goto LABEL_39;
      var0 = a3->var0;
    }
    if (a4 <= 0.0)
    {
      v26 = a3->var1;
      -[VKDaVinciCameraController centerCoordinateRad](self, "centerCoordinateRad");
      v35 = v45;
      -[VKCameraController camera](self, "camera");
      v27 = *(double *)(v43 + 48);
      -[VKCameraController camera](self, "camera");
      -[VKDaVinciCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", &v35, VKAnimationCurveEaseInOut, &__block_literal_global_21504, fmin(fmax(v13, var0), v26), v27, *(double *)(v33 + 40), 0.0);
      if (v34)
      {
        p_shared_owners = (unint64_t *)&v34->__shared_owners_;
        do
          v29 = __ldaxr(p_shared_owners);
        while (__stlxr(v29 - 1, p_shared_owners));
        if (!v29)
        {
          ((void (*)())v34->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      v30 = v44;
      if (v44)
      {
        v31 = &v44->__shared_owners_;
        do
          v32 = __ldaxr((unint64_t *)v31);
        while (__stlxr(v32 - 1, (unint64_t *)v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
    else
    {
      -[VKCameraController camera](self, "camera");
      if (*((_QWORD *)&v45 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v45 + 1) + 16))(*((_QWORD *)&v45 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v45 + 1));
        }
      }
      v21 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      v22 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      -[VKCameraController camera](self, "camera");
      md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v45, (uint64_t)v21, v43 + 8, (int32x2_t)v22);
      if (v44)
      {
        v23 = &v44->__shared_owners_;
        do
          v24 = __ldaxr((unint64_t *)v23);
        while (__stlxr(v24 - 1, (unint64_t *)v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
      cameraManager = self->_cameraManager;
      cameraManager[242] = 0;
      cameraManager[244] = 0;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3321888768;
      v37[2] = __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
      v37[3] = &unk_1E42EA068;
      v38 = *(_OWORD *)&a3->var0;
      v39 = *(_QWORD *)&a3->var2;
      v40 = v13;
      v41 = v45;
      v42 = v46;
      v37[4] = self;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_22;
      v36[3] = &unk_1E42F3E78;
      v36[4] = self;
      -[VKDaVinciCameraController animateRegionWithDuration:timingFunction:stepHandler:completionHandler:](self, "animateRegionWithDuration:timingFunction:stepHandler:completionHandler:", v8, v37, v36, a4);
    }
  }
LABEL_39:

}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  VKTimedAnimation *regionAnimation;
  VKTimedAnimation *v14;
  VKTimedAnimation *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation)
    -[VKAnimation stop](regionAnimation, "stop");
  v14 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a3);
  v15 = self->super._regionAnimation;
  self->super._regionAnimation = v14;

  if (v10)
    v16 = v10;
  else
    v16 = VKAnimationCurveEaseInOut;
  -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v16);
  -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v11);
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__VKDaVinciCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E42F9D20;
  objc_copyWeak(&v20, &location);
  v17 = v12;
  v19 = v17;
  -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v18);
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  VKAnnotationTrackingCameraController *annotationTrackingCameraController;
  void *v13;
  _QWORD *cameraManager;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  char v21;
  _OWORD *v22;
  char *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v8 = a3;
  v9 = a5;
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
    v36.receiver = self;
    v36.super_class = (Class)VKDaVinciCameraController;
    -[VKScreenCameraController setRegionRestriction:duration:timingFunction:](&v36, sel_setRegionRestriction_duration_timingFunction_, v8, v9, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      annotationTrackingCameraController = self->super._annotationTrackingCameraController;
      -[VKScreenCameraController regionRestriction](self, "regionRestriction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKAnnotationTrackingCameraController setRegionRestriction:](annotationTrackingCameraController, "setRegionRestriction:", v13);

    }
    if (objc_msgSend(v8, "isEmpty"))
    {
      cameraManager = self->_cameraManager;
      cameraManager[41] = 0x7FEFFFFFFFFFFFFFLL;
      *((_OWORD *)cameraManager + 21) = xmmword_19FFB2E00;
      *((_OWORD *)cameraManager + 22) = xmmword_19FFB5950;
      *((_OWORD *)cameraManager + 23) = xmmword_19FFB2E00;
      *((_OWORD *)cameraManager + 24) = xmmword_19FFB5950;
      *((_OWORD *)cameraManager + 25) = xmmword_19FFB2E00;
      cameraManager[52] = 0xFFEFFFFFFFFFFFFFLL;
    }
    else
    {
      -[VKDaVinciCameraController centerCoordinate](self, "centerCoordinate");
      v16 = v15;
      v18 = v17;
      -[VKScreenCameraController regionRestriction](self, "regionRestriction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsCoordinate:", v16, v18);

      if (a4 <= 0.0)
        v21 = 1;
      else
        v21 = v20;
      if ((v21 & 1) != 0)
      {
        objc_msgSend(v8, "radianSingleRect:westOfDatelineRect:eastOfDatelineRect:", &v34, &v32, &v30);
        if (v20)
        {
          v22 = (char *)self->_cameraManager + 328;
          *v22 = v34;
          v22[1] = v35;
          v22[2] = v32;
          v22[3] = v33;
          v22[4] = v30;
          v22[5] = v31;
        }
        else
        {
          -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
          v23 = (char *)self->_cameraManager;
          *(_OWORD *)(v23 + 328) = v34;
          *(_OWORD *)(v23 + 344) = v35;
          *(_OWORD *)(v23 + 360) = v32;
          *(_OWORD *)(v23 + 376) = v33;
          *(_OWORD *)(v23 + 392) = v30;
          *(_OWORD *)(v23 + 408) = v31;
          -[VKCameraController camera](self, "camera");
          md::CameraManager::update((uint64_t)v23, &v28, 1);
          v24 = v29;
          if (v29)
          {
            p_shared_owners = (unint64_t *)&v29->__shared_owners_;
            do
              v26 = __ldaxr(p_shared_owners);
            while (__stlxr(v26 - 1, p_shared_owners));
            if (!v26)
            {
              ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
          -[VKCameraController cameraDelegate](self, "cameraDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mapLayerDidChangeVisibleRegion");

          -[VKCameraController endRegionChange](self, "endRegionChange");
        }
      }
      else
      {
        -[VKDaVinciCameraController animateToRestriction:duration:timingFunction:](self, "animateToRestriction:duration:timingFunction:", v8, v9, a4);
      }
    }
  }

}

- (void)animateToRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[9];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v8 = a5;
  objc_msgSend(a3, "radianSingleRect:westOfDatelineRect:eastOfDatelineRect:", &v36, &v34, &v32);
  -[VKDaVinciCameraController centerCoordinate](self, "centerCoordinate");
  v10 = v9;
  v12 = v11;
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clampedCoordinate:", v10, v12);
  v15 = v14;
  v17 = v16;

  *(double *)&v25[5] = v10;
  *(double *)&v25[6] = v12;
  v25[7] = v15;
  v25[8] = v17;
  v26 = v36;
  v27 = v37;
  v28 = v34;
  v29 = v35;
  v31 = v33;
  v30 = v32;
  v25[1] = 3221225472;
  v18[1] = 3221225472;
  v20 = v37;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke;
  v25[3] = &unk_1E42F4DB0;
  v25[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke_2;
  v18[3] = &unk_1E42F4DD8;
  v18[4] = self;
  v19 = v36;
  v22 = v35;
  v21 = v34;
  v24 = v33;
  v23 = v32;
  -[VKDaVinciCameraController animateRegionWithDuration:timingFunction:stepHandler:completionHandler:](self, "animateRegionWithDuration:timingFunction:stepHandler:completionHandler:", v8, v25, v18, a4);

}

- (BOOL)usesVKCamera
{
  return 0;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  _QWORD *mapEngine;
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
  int v16;
  std::__shared_weak_count *v17;
  float64x2_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  double v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  __n128 v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  float64_t v38;
  float64x2_t *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  objc_super v46;

  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    v6 = (int8x8_t *)mapEngine[140];
    v7 = v6[2];
    if (v7)
    {
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = 0x17767EADC5B287BLL;
        if (*(_QWORD *)&v7 <= 0x17767EADC5B287BuLL)
          v9 = 0x17767EADC5B287BuLL % *(_QWORD *)&v7;
      }
      else
      {
        v9 = (*(_QWORD *)&v7 - 1) & 0x17767EADC5B287BLL;
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
              if (v14 == 0x17767EADC5B287BLL)
              {
                if (v11[2] == 0x17767EADC5B287BLL)
                  goto LABEL_23;
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_28;
              }
              v11 = (_QWORD *)*v11;
              if (!v11)
                goto LABEL_28;
            }
          }
          do
          {
            v13 = v11[1];
            if (v13 == 0x17767EADC5B287BLL)
            {
              if (v11[2] == 0x17767EADC5B287BLL)
              {
LABEL_23:
                v15 = v11[5];
                if (v15)
                {
                  if (self->_updateHeight)
                    v16 = 1;
                  else
                    v16 = 2;
                  *(_DWORD *)(v15 + 288) = v16;
                  self->_updateHeight = 0;
                }
                break;
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
  }
LABEL_28:
  v46.receiver = self;
  v46.super_class = (Class)VKDaVinciCameraController;
  -[VKScreenCameraController updateWithTimestamp:withContext:](&v46, sel_updateWithTimestamp_withContext_, a4, a3);
  -[VKDaVinciCameraController updateCameraLimits](self, "updateCameraLimits");
  -[VKCameraController camera](self, "camera");
  -[VKCameraController camera](self, "camera");
  v38 = *(double *)(v44 + 32);
  -[VKCameraController camera](self, "camera");
  v17 = v43;
  v18.f64[0] = v38;
  v18.f64[1] = *(float64_t *)(v42 + 32);
  v39[29] = vmaxnmq_f64(vmulq_f64(v18, (float64x2_t)xmmword_19FFB5A80), (float64x2_t)xmmword_19FFB5A90);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v45)
  {
    v21 = &v45->__shared_owners_;
    do
      v22 = __ldaxr((unint64_t *)v21);
    while (__stlxr(v22 - 1, (unint64_t *)v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  if (v40)
  {
    v23 = &v40->__shared_owners_;
    do
      v24 = __ldaxr((unint64_t *)v23);
    while (__stlxr(v24 - 1, (unint64_t *)v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  -[VKCameraController camera](self, "camera");
  v25 = fabs(v39->f64[1]);
  if (v40)
  {
    v26 = &v40->__shared_owners_;
    do
      v27 = __ldaxr((unint64_t *)v26);
    while (__stlxr(v27 - 1, (unint64_t *)v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  if (v25 < 1.48352986)
  {
    -[VKCameraController camera](self, "camera");
    v28 = v44;
    -[VKCameraController camera](self, "camera");
    v29.n128_f64[0] = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator((double *)&v39, (double *)(v28 + 8), *(_BYTE *)v42 == 0);
    v30 = v43;
    if (v43)
    {
      v31 = (unint64_t *)&v43->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v30->__on_zero_shared)(v30, v29);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    v33 = v45;
    if (v45)
    {
      v34 = &v45->__shared_owners_;
      do
        v35 = __ldaxr((unint64_t *)v34);
      while (__stlxr(v35 - 1, (unint64_t *)v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v33->__on_zero_shared)(v33, v29);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    -[VKCameraController vkCamera](self, "vkCamera", v29.n128_f64[0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPosition:", &v39);

    -[VKCameraController vkCamera](self, "vkCamera");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setOrientation:", &v41);

  }
}

- (float)maximumNormalizedZoomLevel
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_mapEngine + 149);
  if (v2)
    return (float)*(unsigned int *)(v2 + 52);
  else
    return 20.0;
}

- (float)minimumNormalizedZoomLevel
{
  _QWORD *mapEngine;
  float v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  mapEngine = self->_mapEngine;
  v3 = 1.0;
  if (!mapEngine[149])
    return fmaxf(v3, 1.0);
  v4 = (int8x8_t *)mapEngine[140];
  v5 = v4[2];
  if (!*(_QWORD *)&v5)
    return fmaxf(v3, 1.0);
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.u32[0];
  if (v6.u32[0] > 1uLL)
  {
    v8 = 0xAF46DE79C836B0D8;
    if (*(_QWORD *)&v5 <= 0xAF46DE79C836B0D8)
      v8 = 0xAF46DE79C836B0D8 % *(_QWORD *)&v5;
  }
  else
  {
    v8 = (*(_QWORD *)&v5 - 1) & 0xAF46DE79C836B0D8;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v8);
  v3 = 1.0;
  if (!v9)
    return fmaxf(v3, 1.0);
  v10 = (_QWORD *)*v9;
  if (!v10)
    return fmaxf(v3, 1.0);
  if (v7 < 2)
  {
    v11 = *(_QWORD *)&v5 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0xAF46DE79C836B0D8)
      {
        if (v10[2] == 0xAF46DE79C836B0D8)
          goto LABEL_23;
      }
      else if ((v13 & v11) != v8)
      {
        return fmaxf(1.0, 1.0);
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        return fmaxf(1.0, 1.0);
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0xAF46DE79C836B0D8)
      break;
    if (v12 >= *(_QWORD *)&v5)
      v12 %= *(_QWORD *)&v5;
    if (v12 != v8)
      return fmaxf(1.0, 1.0);
LABEL_12:
    v10 = (_QWORD *)*v10;
    if (!v10)
      return fmaxf(1.0, 1.0);
  }
  if (v10[2] != 0xAF46DE79C836B0D8)
    goto LABEL_12;
LABEL_23:
  v15 = v10[5];
  v3 = 1.0;
  if (v15)
    v3 = (float)*(unsigned int *)(v15 + 312);
  return fmaxf(v3, 1.0);
}

- (int64_t)tileSize
{
  _QWORD *mapEngine;
  uint64_t v3;

  mapEngine = self->_mapEngine;
  if (mapEngine && (v3 = mapEngine[112]) != 0)
    return *(_QWORD *)(v3 + 312);
  else
    return 256;
}

- (void)updateCameraLimits
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const Camera *v7;
  float v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  float v21;
  float v22;
  double v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  float v27;
  float v28;
  uint64_t v29;
  double v30;
  float v31;
  unint64_t *v32;
  unint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  double v37;
  float v38;
  float v39;
  float v40;
  unint64_t *v41;
  unint64_t v42;
  float v43;
  _QWORD *mapEngine;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  double v49;
  float v50;
  float v51;
  unint64_t *v52;
  unint64_t v53;
  int8x8_t *v54;
  int8x8_t v55;
  uint8x8_t v56;
  unint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  double v66;
  float v67;
  float v68;
  float v69;
  unint64_t *v70;
  unint64_t v71;
  float v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  float v78;
  double v79;
  float v80;
  float v81;
  float v82;
  unint64_t *v83;
  unint64_t v84;
  uint64_t v85;
  double v86;
  float v87;
  float v88;
  float v89;
  unint64_t *v90;
  unint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  long double v98;
  long double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  long double v106;
  long double v107;
  double v108;
  std::__shared_weak_count *v109;
  unint64_t *p_shared_owners;
  unint64_t v111;
  std::__shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  std::__shared_weak_count *v115;
  unint64_t *v116;
  unint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  __int128 v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  __int128 v124;
  unint64_t *v125;
  unint64_t v126;
  double v127[2];
  std::__shared_weak_count *v128;
  double *v129;
  std::__shared_weak_count *v130;
  double v131;
  double *v132;
  std::__shared_weak_count *v133;
  double v134;
  uint64_t v135;
  std::__shared_weak_count *v136;
  gdc::DisplayZoomLevel *v137[2];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  float v142;
  double v143;
  double v144;
  float v145;
  double v146;
  double v147;
  char v148[8];
  gdc::DisplayZoomLevel *v149;
  char v150;
  gdc::DisplayZoomLevel *v151;
  double v152;

  -[VKCameraController camera](self, "camera");
  if (!v137[1])
    goto LABEL_5;
  v3 = (unint64_t *)((char *)v137[1] + 8);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  if (!v4)
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    if (!v137[0])
      return;
  }
  else
  {
LABEL_5:
    if (!v137[0])
      return;
  }
  -[VKCameraController camera](self, "camera");
  v152 = *((double *)v137[0] + 9);
  if (v137[1])
  {
    v5 = (unint64_t *)((char *)v137[1] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  -[VKCameraController camera](self, "camera");
  v8 = gdc::DisplayZoomLevel::centerZoomLevel(v137[0], v7);
  if (v137[1])
  {
    v9 = (unint64_t *)((char *)v137[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v11 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v12 = *((double *)v137[0] + 46);
  v13 = 0.0;
  if (v12 > 0.0)
  {
    v14 = v12;
    v15 = (float)v11;
    v13 = log2f(v14 / v15);
  }
  v16 = fminf(fmaxf(v8 + v13, 1.0), 25.0);
  if (v137[1])
  {
    v17 = (unint64_t *)((char *)v137[1] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v19 = *((_QWORD *)self->_mapEngine + 149);
  v20 = v16;
  v21 = pitchForZ((_QWORD *)(v19 + 384), v16);
  v22 = pitchForZ((_QWORD *)(v19 + 408), v20);
  -[VKCameraController camera](self, "camera");
  v23 = *((double *)v137[0] + 9);
  if (v137[1])
  {
    v24 = (unint64_t *)((char *)v137[1] + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v152 = v22;
  if (v23 > v21 != v22 > v21)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mapLayerCanEnter3DModeDidChange:", v22 > v21);

  }
  -[VKDaVinciCameraController minimumNormalizedZoomLevel](self, "minimumNormalizedZoomLevel");
  v28 = v27;
  v29 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v30 = *((double *)v137[0] + 46);
  v31 = 0.0;
  if (v30 > 0.0)
    v31 = log2((double)v29 / v30);
  if (v137[1])
  {
    v32 = (unint64_t *)((char *)v137[1] + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  -[VKDaVinciCameraController maximumNormalizedZoomLevel](self, "maximumNormalizedZoomLevel");
  v35 = v34;
  v36 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v37 = *((double *)v137[0] + 46);
  v38 = fminf(fmaxf(v35, 1.0), 25.0);
  v39 = 0.0;
  if (v37 > 0.0)
    v39 = log2((double)v36 / v37);
  v40 = fmaxf(v38 + v39, 1.0);
  if (v137[1])
  {
    v41 = (unint64_t *)((char *)v137[1] + 8);
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v43 = fminf(v40, 25.0);
  mapEngine = self->_mapEngine;
  if (!mapEngine)
  {
    v47 = v43;
    goto LABEL_93;
  }
  v45 = mapEngine[112];
  if (!v45 || (v46 = *(_QWORD *)(v45 + 272)) == 0)
  {
    v47 = v43;
    goto LABEL_58;
  }
  v47 = v43;
  if (!*(_BYTE *)(v46 + 344))
    goto LABEL_58;
  v48 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v49 = *((double *)v137[0] + 46);
  v50 = 0.0;
  if (v49 > 0.0)
    v50 = log2((double)v48 / v49);
  v51 = fmaxf(v50 + 25.0, 1.0);
  if (v137[1])
  {
    v52 = (unint64_t *)((char *)v137[1] + 8);
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v47 = fminf(v51, 25.0);
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
LABEL_58:
    v54 = (int8x8_t *)mapEngine[140];
    v55 = v54[2];
    if (v55)
    {
      v56 = (uint8x8_t)vcnt_s8(v55);
      v56.i16[0] = vaddlv_u8(v56);
      if (v56.u32[0] > 1uLL)
      {
        v57 = 0xEC9B77B4222D22FFLL;
        if (*(_QWORD *)&v55 <= 0xEC9B77B4222D22FFLL)
          v57 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v55;
      }
      else
      {
        v57 = (*(_QWORD *)&v55 - 1) & 0xEC9B77B4222D22FFLL;
      }
      v58 = *(_QWORD **)(*(_QWORD *)&v54[1] + 8 * v57);
      if (v58)
      {
        v59 = (_QWORD *)*v58;
        if (v59)
        {
          if (v56.u32[0] < 2uLL)
          {
            v60 = *(_QWORD *)&v55 - 1;
            while (1)
            {
              v62 = v59[1];
              if (v62 == 0xEC9B77B4222D22FFLL)
              {
                if (v59[2] == 0xEC9B77B4222D22FFLL)
                  goto LABEL_82;
              }
              else if ((v62 & v60) != v57)
              {
                goto LABEL_93;
              }
              v59 = (_QWORD *)*v59;
              if (!v59)
                goto LABEL_93;
            }
          }
          do
          {
            v61 = v59[1];
            if (v61 == 0xEC9B77B4222D22FFLL)
            {
              if (v59[2] == 0xEC9B77B4222D22FFLL)
              {
LABEL_82:
                v63 = v59[5];
                if (v63 && *(_BYTE *)(v63 + 56) && *(_QWORD *)(v63 + 568))
                {
                  v64 = fmin(fmax(*(double *)(v63 + 584) * 1048576.0 + -0.5, 0.0), 1.0);
                  v65 = -[VKDaVinciCameraController tileSize](self, "tileSize");
                  -[VKCameraController camera](self, "camera");
                  v66 = *((double *)v137[0] + 46);
                  v67 = 0.0;
                  if (v66 > 0.0)
                    v67 = log2((double)v65 / v66);
                  v68 = v64;
                  v69 = fminf(fmaxf(v67 + 20.0, 1.0), 25.0);
                  if (v137[1])
                  {
                    v70 = (unint64_t *)((char *)v137[1] + 8);
                    do
                      v71 = __ldaxr(v70);
                    while (__stlxr(v71 - 1, v70));
                    if (!v71)
                    {
                      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
                      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
                    }
                  }
                  v72 = 1.0 - cos(v68 * 3.14159265);
                  v47 = v69 + (float)((float)(v72 * 0.5) * (float)(v43 - v69));
                }
                break;
              }
            }
            else
            {
              if (v61 >= *(_QWORD *)&v55)
                v61 %= *(_QWORD *)&v55;
              if (v61 != v57)
                break;
            }
            v59 = (_QWORD *)*v59;
          }
          while (v59);
        }
      }
    }
  }
LABEL_93:
  v148[0] = 0;
  v150 = 0;
  -[VKCameraController vkCamera](self, "vkCamera");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    objc_msgSend(v73, "minDistanceToGroundRestriction");
    if (LOBYTE(v137[0]))
    {
      v148[0] = 1;
      v149 = v137[1];
      LOBYTE(v137[0]) = 0;
    }
  }
  else
  {
    v137[0] = 0;
    v137[1] = 0;
  }

  -[VKCameraController vkCamera](self, "vkCamera");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    objc_msgSend(v75, "maxDistanceToGroundRestriction");
    if (LOBYTE(v137[0]))
    {
      v150 = 1;
      v151 = v137[1];
      LOBYTE(v137[0]) = 0;
    }
  }
  else
  {
    v137[0] = 0;
    v137[1] = 0;
  }

  v77 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v78 = fminf(fmaxf(fminf(fmaxf(v28, 1.0), 25.0) + v31, 1.0), 25.0);
  v79 = *((double *)v137[0] + 46);
  v146 = (double)v77;
  v147 = v79;
  v80 = 0.0;
  if (v79 > 0.0)
  {
    v81 = v79;
    v82 = (float)v77;
    v80 = log2f(v81 / v82);
  }
  v145 = fminf(fmaxf(v78 + v80, 1.0), 25.0);
  if (v137[1])
  {
    v83 = (unint64_t *)((char *)v137[1] + 8);
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  v85 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v86 = *((double *)v137[0] + 46);
  v143 = (double)v85;
  v144 = v86;
  v87 = 0.0;
  if (v86 > 0.0)
  {
    v88 = v86;
    v89 = (float)v85;
    v87 = log2f(v88 / v89);
  }
  v142 = fminf(fmaxf(v47 + v87, 1.0), 25.0);
  if (v137[1])
  {
    v90 = (unint64_t *)((char *)v137[1] + 8);
    do
      v91 = __ldaxr(v90);
    while (__stlxr(v91 - 1, v90));
    if (!v91)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v137[1] + 16))(v137[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v137[1]);
    }
  }
  -[VKCameraController camera](self, "camera");
  v92 = v135;
  -[VKCameraController camera](self, "camera");
  v94 = v132[46];
  v93 = v132[47];
  if (v93 >= v94)
  {
    v100 = v132[57];
  }
  else
  {
    v95 = v93 * v94;
    v96 = v93 / v94;
    if (v95 <= 0.0)
      v97 = 1.0;
    else
      v97 = v96;
    v98 = tan(v132[57] * 0.5);
    v99 = atan(v97 * v98);
    v100 = v99 + v99;
  }
  v134 = v100;
  -[VKCameraController camera](self, "camera");
  v101 = v129[46];
  v102 = v129[47];
  if (v101 >= v102)
  {
    v108 = v129[57];
  }
  else
  {
    v103 = v102 * v101;
    v104 = v101 / v102;
    if (v103 <= 0.0)
      v105 = 1.0;
    else
      v105 = v104;
    v106 = tan(v129[57] * 0.5);
    v107 = atan(v105 * v106);
    v108 = v107 + v107;
  }
  v131 = v108;
  -[VKCameraController camera](self, "camera");
  v127[0] = 0.0;
  gdc::CameraLimits::CameraLimits((uint64_t)v137, (double *)(v92 + 8), &v134, &v131, (long double *)(*(_QWORD *)&v127[1] + 40), &v152, v127, (uint64_t)&v145, v152, (uint64_t)&v142, (uint64_t)v148);
  v109 = v128;
  if (v128)
  {
    p_shared_owners = (unint64_t *)&v128->__shared_owners_;
    do
      v111 = __ldaxr(p_shared_owners);
    while (__stlxr(v111 - 1, p_shared_owners));
    if (!v111)
    {
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
    }
  }
  v112 = v130;
  if (v130)
  {
    v113 = (unint64_t *)&v130->__shared_owners_;
    do
      v114 = __ldaxr(v113);
    while (__stlxr(v114 - 1, v113));
    if (!v114)
    {
      ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
      std::__shared_weak_count::__release_weak(v112);
    }
  }
  v115 = v133;
  if (v133)
  {
    v116 = (unint64_t *)&v133->__shared_owners_;
    do
      v117 = __ldaxr(v116);
    while (__stlxr(v117 - 1, v116));
    if (!v117)
    {
      ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
      std::__shared_weak_count::__release_weak(v115);
    }
  }
  v118 = v136;
  if (v136)
  {
    v119 = (unint64_t *)&v136->__shared_owners_;
    do
      v120 = __ldaxr(v119);
    while (__stlxr(v120 - 1, v119));
    if (!v120)
    {
      ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
      std::__shared_weak_count::__release_weak(v118);
    }
  }
  -[VKCameraController camera](self, "camera");
  v121 = v140;
  v122 = v135;
  v123 = v136;
  *(_OWORD *)(v135 + 96) = v139;
  *(_OWORD *)(v122 + 112) = v121;
  *(_QWORD *)(v122 + 128) = v141;
  v124 = v138;
  *(_OWORD *)(v122 + 64) = *(_OWORD *)v137;
  *(_OWORD *)(v122 + 80) = v124;
  if (v123)
  {
    v125 = (unint64_t *)&v123->__shared_owners_;
    do
      v126 = __ldaxr(v125);
    while (__stlxr(v126 - 1, v125));
    if (!v126)
    {
      ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
      std::__shared_weak_count::__release_weak(v123);
    }
  }
}

- (double)minimumZoomLevel
{
  uint64_t v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  -[VKCameraController camera](self, "camera");
  v3 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v4 = *(double *)(v18 + 368);
  v5 = 0.0;
  if (v4 > 0.0)
  {
    v6 = v4;
    v7 = (float)v3;
    v5 = log2f(v6 / v7);
  }
  v8 = *(float *)(v20 + 84);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v13 = fmaxf(v8 + v5, 1.0);
  v14 = v13 * 1000.0;
  v15 = v13 <= 25.0;
  v16 = 25000.0;
  if (v15)
    v16 = v14;
  return (float)(ceilf(v16) * 0.001);
}

- (double)maximumZoomLevel
{
  uint64_t v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  -[VKCameraController camera](self, "camera");
  v3 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v4 = *(double *)(v18 + 368);
  v5 = 0.0;
  if (v4 > 0.0)
  {
    v6 = v4;
    v7 = (float)v3;
    v5 = log2f(v6 / v7);
  }
  v8 = *(float *)(v20 + 80);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v13 = fmaxf(v8 + v5, 1.0);
  v14 = v13 * 1000.0;
  v15 = v13 <= 25.0;
  v16 = 25000.0;
  if (v15)
    v16 = v14;
  return (float)(floorf(v16) * 0.001);
}

- (double)currentZoomLevel
{
  const Camera *v3;
  float v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  double v8;
  float v9;
  float v10;
  float v11;
  unint64_t *v12;
  unint64_t v13;
  float v14;
  float v15;
  BOOL v16;
  float v17;
  double *v19;
  std::__shared_weak_count *v20;

  -[VKCameraController camera](self, "camera");
  v4 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)v19, v3);
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v7 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v8 = v19[46];
  v9 = 0.0;
  if (v8 > 0.0)
  {
    v10 = v8;
    v11 = (float)v7;
    v9 = log2f(v10 / v11);
  }
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v14 = fmaxf(v4 + v9, 1.0);
  v15 = v14 * 1000.0;
  v16 = v14 <= 25.0;
  v17 = 25000.0;
  if (v16)
    v17 = v15;
  return (float)(floorf(v17) * 0.001);
}

- (double)topDownMinimumZoomLevel
{
  uint64_t v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  -[VKCameraController camera](self, "camera");
  v3 = -[VKDaVinciCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v4 = *(double *)(v18 + 368);
  v5 = 0.0;
  if (v4 > 0.0)
  {
    v6 = v4;
    v7 = (float)v3;
    v5 = log2f(v6 / v7);
  }
  v8 = *(float *)(v20 + 88);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v13 = fmaxf(v8 + v5, 1.0);
  v14 = v13 * 1000.0;
  v15 = v13 <= 25.0;
  v16 = 25000.0;
  if (v15)
    v16 = v14;
  return (float)(ceilf(v16) * 0.001);
}

- (float)minPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_mapEngine + 149);
  if (v3)
    return pitchForZ((_QWORD *)(v3 + 384), a3);
  else
    return 0.0;
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_mapEngine + 149);
  if (v3)
    return pitchForZ((_QWORD *)(v3 + 432), a3);
  else
    return 0.0;
}

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  void *v5;
  char v6;
  uint64_t v8;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relaxTiltLimits");

  if ((v6 & 1) != 0)
    return 1.4835;
  v8 = *((_QWORD *)self->_mapEngine + 149);
  if (v8)
    return pitchForZ((_QWORD *)(v8 + 408), a3);
  else
    return 0.0;
}

void __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3;
  double v4;
  long double v5;
  long double v6;
  long double v7;
  double v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  long double v29;
  long double v30;
  long double v31;
  long double v32;
  double v33;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double *v51;
  _QWORD *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *p_shared_owners;
  unint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  std::__shared_weak_count *v70;

  v3 = *(double *)(a1 + 40) * 0.0174532925;
  v4 = a2;
  v5 = fmod(3.14159265 - v3 + *(double *)(a1 + 56) * 0.0174532925, 6.28318531);
  v6 = fmod(v5 + 6.28318531, 6.28318531);
  v7 = fmod(v3 + 3.14159265 + (v6 + -3.14159265) * v4, 6.28318531);
  v8 = fmod(v7 + 6.28318531, 6.28318531) + -3.14159265;
  v9 = *(double *)(a1 + 48) * 0.0174532925;
  v10 = fmod(3.14159265 - v9 + *(double *)(a1 + 64) * 0.0174532925, 6.28318531);
  v11 = fmod(v10 + 6.28318531, 6.28318531);
  v12 = fmod(v9 + 3.14159265 + (v11 + -3.14159265) * v4, 6.28318531);
  v13 = fmod(v12 + 6.28318531, 6.28318531);
  v14 = v13 + -3.14159265;
  v15 = *(double *)(a1 + 72);
  v16 = *(double *)(a1 + 80);
  v17 = *(double *)(a1 + 88);
  v18 = *(double *)(a1 + 96);
  v19 = *(double *)(a1 + 104);
  v20 = *(double *)(a1 + 112);
  v21 = *(double *)(a1 + 120);
  v22 = *(double *)(a1 + 128);
  v24 = *(double *)(a1 + 136);
  v23 = *(double *)(a1 + 144);
  v25 = *(double *)(a1 + 152);
  v26 = *(double *)(a1 + 160);
  if (v17 < v15 || v18 < v16)
  {
    v36 = 0.0;
    v37 = (v19 - v14) * (v19 - v14);
    if (v14 >= v19)
      v37 = 0.0;
    if (v14 > v21)
      v37 = (v14 - v21) * (v14 - v21);
    v38 = v37 + (v8 - v22) * (v8 - v22);
    if (v8 < v20)
      v37 = v37 + (v20 - v8) * (v20 - v8);
    if (v8 > v22)
      v37 = v38;
    if (v14 <= v25)
    {
      if (v14 >= v24)
        goto LABEL_29;
      v39 = v24 - v14;
    }
    else
    {
      v39 = v14 - v25;
    }
    v36 = v39 * v39;
LABEL_29:
    v40 = sqrt(v37);
    if (v8 <= v26)
    {
      if (v8 >= v23)
      {
LABEL_34:
        v42 = v40 < sqrt(v36);
        v43 = fmin(v14, v24);
        v44 = fmax(v14, v25);
        v45 = fmin(v8, v23);
        v46 = fmax(v8, v26);
        v47 = fmin(v14, v19);
        v48 = fmax(v14, v21);
        v49 = fmin(v8, v20);
        v50 = fmax(v8, v22);
        if (v42)
        {
          v19 = v47;
        }
        else
        {
          v24 = v43;
          v23 = v45;
          v25 = v44;
          v26 = v46;
        }
        if (v42)
          v20 = v49;
        if (v42)
          v21 = v48;
        if (v42)
          v22 = v50;
        goto LABEL_46;
      }
      v41 = v23 - v8;
    }
    else
    {
      v41 = v8 - v26;
    }
    v36 = v36 + v41 * v41;
    goto LABEL_34;
  }
  if (v15 <= v14 && v14 <= v17)
    goto LABEL_15;
  v58 = *(double *)(a1 + 112);
  v59 = *(double *)(a1 + 104);
  v60 = *(double *)(a1 + 160);
  v61 = *(double *)(a1 + 152);
  v64 = *(double *)(a1 + 80);
  v65 = *(double *)(a1 + 96);
  v62 = *(double *)(a1 + 136);
  v63 = *(double *)(a1 + 144);
  v67 = *(double *)(a1 + 72);
  v68 = *(double *)(a1 + 88);
  v28 = v13 + -6.28318531;
  v29 = fmod(v15 - (v13 + -6.28318531), 6.28318531);
  v66 = fabs(fmod(v29 + 6.28318531, 6.28318531) + -3.14159265);
  v30 = v68 - v28;
  v17 = v68;
  v31 = fmod(v30, 6.28318531);
  v32 = fmod(v31 + 6.28318531, 6.28318531);
  v15 = v67;
  v33 = fabs(v32 + -3.14159265);
  if (v66 <= v33 && v67 < v14)
  {
    v22 = v65;
    v23 = fmin(v8, v64);
    if (v8 <= v65)
    {
      v25 = v68;
      v15 = 1.79769313e308;
      v24 = -3.14159265;
      v26 = v65;
      v19 = v14;
      v20 = v23;
      v21 = 3.14159265;
      v16 = 1.79769313e308;
      v18 = -1.79769313e308;
    }
    else
    {
      v18 = -1.79769313e308;
      v15 = 1.79769313e308;
      v24 = -3.14159265;
      v25 = v68;
      v26 = v8;
      v19 = v14;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v8;
      v16 = 1.79769313e308;
    }
    v17 = -1.79769313e308;
    goto LABEL_46;
  }
  v35 = v66 > v33 && v14 < v68;
  v24 = v62;
  v23 = v63;
  v16 = v64;
  v18 = v65;
  v26 = v60;
  v25 = v61;
  v20 = v58;
  v19 = v59;
  if (v35)
  {
    v23 = fmin(v8, v64);
    v17 = -1.79769313e308;
    v16 = 1.79769313e308;
    v24 = -3.14159265;
    v25 = v14;
    if (v8 <= v65)
    {
      v26 = v65;
      v19 = v67;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v65;
    }
    else
    {
      v26 = v8;
      v19 = v67;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v8;
    }
    v15 = 1.79769313e308;
    v18 = -1.79769313e308;
  }
  else
  {
LABEL_15:
    v15 = fmin(v14, v15);
    v17 = fmax(v17, v14);
    v16 = fmin(v8, v16);
    v18 = fmax(v18, v8);
  }
LABEL_46:
  v51 = *(double **)(*(_QWORD *)(a1 + 32) + 280);
  v51[41] = v15;
  v51[42] = v16;
  v51[43] = v17;
  v51[44] = v18;
  v51[45] = v19;
  v51[46] = v20;
  v51[47] = v21;
  v51[48] = v22;
  v51[49] = v24;
  v51[50] = v23;
  v51[51] = v25;
  v51[52] = v26;
  v52 = *(_QWORD **)(a1 + 32);
  v53 = v52[35];
  objc_msgSend(v52, "camera");
  md::CameraManager::update(v53, &v69, 1);
  v54 = v70;
  if (v70)
  {
    p_shared_owners = (unint64_t *)&v70->__shared_owners_;
    do
      v56 = __ldaxr(p_shared_owners);
    while (__stlxr(v56 - 1, p_shared_owners));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "mapLayerDidChangeVisibleRegion");

}

uint64_t __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "beginRegionChange:", 0);
    v3 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 280) + 328);
    v4 = *(_OWORD *)(v2 + 56);
    v5 = *(_OWORD *)(v2 + 72);
    v6 = *(_OWORD *)(v2 + 88);
    v7 = *(_OWORD *)(v2 + 104);
    v8 = *(_OWORD *)(v2 + 120);
    *v3 = *(_OWORD *)(v2 + 40);
    v3[1] = v4;
    v3[2] = v5;
    v3[3] = v6;
    v3[4] = v7;
    v3[5] = v8;
    v9 = *(_QWORD **)(v2 + 32);
    v10 = v9[35];
    objc_msgSend(v9, "camera");
    md::CameraManager::update(v10, &v15, 1);
    v11 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    objc_msgSend(*(id *)(v2 + 32), "cameraDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapLayerDidChangeVisibleRegion");

    return objc_msgSend(*(id *)(v2 + 32), "endRegionChange");
  }
  return result;
}

void __100__VKDaVinciCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[20], "stop");
    v4 = WeakRetained[20];
    WeakRetained[20] = 0;

    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }

}

void __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3;
  uint64_t v4;
  float64_t v5;
  unint64_t *v6;
  unint64_t v7;
  float64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int32x2_t v13;
  void *v14;
  uint64_t v15;
  uint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t *v29;
  unint64_t v30;
  void *v31;
  float64x2_t v32;
  __int128 v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  float64x2_t v36;

  v3 = fmin(fmax(*(double *)(a1 + 64), *(double *)(a1 + 64) + (*(double *)(a1 + 40) - *(double *)(a1 + 64)) * a2), *(double *)(a1 + 64) + (*(double *)(a1 + 48) - *(double *)(a1 + 64)) * a2);
  v32 = *(float64x2_t *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v5 = v36.f64[0];
  *(float64x2_t *)(*(_QWORD *)&v36.f64[0] + 8) = v32;
  *(_QWORD *)(*(_QWORD *)&v5 + 24) = v4;
  if (*(_QWORD *)&v36.f64[1])
  {
    v6 = (unint64_t *)(*(_QWORD *)&v36.f64[1] + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v36.f64[1] + 16))(*(_QWORD *)&v36.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v36.f64[1]);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v8 = v36.f64[1];
  *(double *)(*(_QWORD *)&v36.f64[0] + 32) = v3;
  if (v8 != 0.0)
  {
    v9 = (unint64_t *)(*(_QWORD *)&v8 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(float64_t))(**(_QWORD **)&v8 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v8));
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v8);
    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "mapDataAccess");
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "centerScreenPoint");
  v13 = (int32x2_t)objc_msgSend(v12, "cursorFromScreenPoint:");
  v14 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v14, "camera");
    v15 = v34;
  }
  else
  {
    v15 = 0;
    v34 = 0;
    v35 = 0;
  }
  md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v36, v11, v15 + 8, v13);
  if (v35)
  {
    p_shared_owners = &v35->__shared_owners_;
    do
      v17 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v17 - 1, (unint64_t *)p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  __asm { FMOV            V1.2D, #-2.0 }
  objc_msgSend(*(id *)(a1 + 32), "camera", vnegq_f64(vmlaq_f64(v36, _Q1, v32)));
  v23 = v34;
  *(_OWORD *)(v34 + 8) = v33;
  *(_QWORD *)(v23 + 24) = v4;
  if (v35)
  {
    v24 = &v35->__shared_owners_;
    do
      v25 = __ldaxr((unint64_t *)v24);
    while (__stlxr(v25 - 1, (unint64_t *)v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v26 = *(_QWORD **)(a1 + 32);
  v27 = v26[35];
  objc_msgSend(v26, "camera");
  md::CameraManager::update(v27, &v34, 1);
  v28 = v35;
  if (v35)
  {
    v29 = &v35->__shared_owners_;
    do
      v30 = __ldaxr((unint64_t *)v29);
    while (__stlxr(v30 - 1, (unint64_t *)v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateIsPitched");
  objc_msgSend(*(id *)(a1 + 32), "_updateCanEnter3DMode");
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mapLayerDidChangeVisibleRegion");

}

void __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_22(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[35];
  objc_msgSend(v2, "camera");
  md::CameraManager::update(v3, &v7, 1);
  v4 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 242) = 1;
}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  uint64_t v23;
  uint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  float64x2_t v35;
  float64x2_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(double *)(a1 + 80);
    v33 = *(double *)(a1 + 128);
    v34 = *(double *)(a1 + 72);
    v32 = *(double *)(a1 + 136);
    v7 = *(double *)(a1 + 40);
    v8 = *(double *)(a1 + 48);
    v9 = *(double *)(a1 + 96);
    v10 = *(double *)(a1 + 104);
    v35 = *(float64x2_t *)(a1 + 56);
    v36 = *(float64x2_t *)(a1 + 112);
    objc_msgSend(WeakRetained, "camera");
    v11 = fmod(3.14159265 - v8 + v10, 6.28318531);
    v12 = fmod(v11 + 6.28318531, 6.28318531);
    v13 = fmod(v8 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    v14 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    v15 = fmod(3.14159265 - v7 + v9, 6.28318531);
    v16 = fmod(v15 + 6.28318531, 6.28318531);
    v17 = fmod(v7 + 3.14159265 + (v16 + -3.14159265) * a2, 6.28318531);
    v18 = fmod(v17 + 6.28318531, 6.28318531) + -3.14159265;
    v19 = fmod(3.14159265 - v6 + v32, 6.28318531);
    v20 = fmod(v19 + 6.28318531, 6.28318531);
    v21 = fmod(v6 + 3.14159265 + (v20 + -3.14159265) * a2, 6.28318531);
    v22 = fmod(v21 + 6.28318531, 6.28318531);
    v23 = v37;
    *(long double *)(v37 + 8) = v18;
    *(long double *)(v23 + 16) = v14;
    *(float64x2_t *)(v23 + 24) = vmlaq_n_f64(v35, vsubq_f64(v36, v35), a2);
    *(double *)(v23 + 40) = v34 + (v33 - v34) * a2;
    *(long double *)(v23 + 48) = v22 + -3.14159265;
    *(_QWORD *)(v23 + 56) = 0;
    if (v38)
    {
      p_shared_owners = &v38->__shared_owners_;
      do
        v25 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v25 - 1, (unint64_t *)p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    v26 = v5[35];
    objc_msgSend(v5, "camera");
    md::CameraManager::update(v26, &v37, 0);
    v27 = v38;
    if (v38)
    {
      v28 = &v38->__shared_owners_;
      do
        v29 = __ldaxr((unint64_t *)v28);
      while (__stlxr(v29 - 1, (unint64_t *)v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    objc_msgSend(v5, "_updateIsPitched");
    objc_msgSend(v5, "_updateCanEnter3DMode");
    objc_msgSend(v5, "cameraDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mapLayerDidChangeVisibleRegion");

    v31 = *(_QWORD *)objc_msgSend(v5, "runLoopController");
    if (v31)
    {
      LOBYTE(v37) = 4;
      md::MapEngine::setNeedsTick(v31, &v37);
    }
  }

}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_15(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  _OWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "camera");
    v6 = v20;
    (*(void (**)(_OWORD *__return_ptr, float))(*(_QWORD *)(a1 + 32) + 16))(v18, a2);
    v7 = v18[0];
    v8 = v18[1];
    v9 = v18[2];
    *(_QWORD *)(v6 + 56) = v19;
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 24) = v8;
    *(_OWORD *)(v6 + 8) = v7;
    v10 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v5[35];
    objc_msgSend(v5, "camera");
    md::CameraManager::update(v13, (uint64_t *)v18, 0);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v18[0] + 1);
    if (*((_QWORD *)&v18[0] + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v18[0] + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    objc_msgSend(v5, "_updateIsPitched");
    objc_msgSend(v5, "_updateCanEnter3DMode");
    objc_msgSend(v5, "cameraDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mapLayerDidChangeVisibleRegion");

  }
}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_BYTE *)(*((_QWORD *)WeakRetained + 35) + 242) = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(*((id *)WeakRetained + 23), "resumeAnimation");
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }

}

long double __77__VKDaVinciCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  float v5;
  long double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  long double v11;
  __double2 v12;
  long double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double result;
  double v25;
  double v26;
  double v27;
  double v28;

  v25 = (float)((float)((float)(1.0 - a3) * (float)(1.0 - a3)) * (float)(1.0 - a3));
  v5 = (float)(1.0 - a3) * 3.0;
  v26 = (float)((float)((float)(1.0 - a3) * a3) * v5);
  v27 = (float)((float)(a3 * a3) * a3);
  v28 = (float)(v5 * (float)(a3 * a3));
  v6 = *(double *)(a1 + 32) * v25
     + *(double *)(a1 + 56) * v26
     + *(double *)(a1 + 80) * v28
     + *(double *)(a1 + 104) * v27;
  v7 = *(double *)(a1 + 40) * v25
     + *(double *)(a1 + 64) * v26
     + *(double *)(a1 + 88) * v28
     + *(double *)(a1 + 112) * v27;
  v8 = *(double *)(a1 + 48) * v25
     + *(double *)(a1 + 72) * v26
     + *(double *)(a1 + 96) * v28
     + *(double *)(a1 + 120) * v27;
  v9 = sqrt(v6 * v6 + v7 * v7);
  v10 = atan2(v8, v9 * 0.996647189);
  v11 = atan2(v7, v6);
  v12 = __sincos_stret(v10);
  v13 = atan2(v8 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v9 + v12.__cosval * v12.__cosval * -42697.6727 * v12.__cosval);
  *(_QWORD *)(a2 + 48) = 0;
  *(long double *)a2 = v13;
  *(long double *)(a2 + 8) = v11;
  v14 = *(double *)(a1 + 168);
  v15 = *(double *)(a1 + 224);
  *(double *)(a2 + 32) = *(double *)(a1 + 160) * v25
                       + *(double *)(a1 + 216) * v26
                       + *(double *)(a1 + 272) * v28
                       + *(double *)(a1 + 328) * v27;
  *(float64x2_t *)(a2 + 16) = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 144), v25), *(float64x2_t *)(a1 + 200), v26), *(float64x2_t *)(a1 + 256), v28), *(float64x2_t *)(a1 + 312), v27);
  v16 = fmod(3.14159265 - v14 + v15, 6.28318531);
  v17 = fmod(v16 + 6.28318531, 6.28318531) + -3.14159265;
  v18 = *(double *)(a1 + 280);
  v19 = fmod(3.14159265 - v15 + v18, 6.28318531);
  v20 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  v21 = fmod(3.14159265 - v18 + *(double *)(a1 + 336), 6.28318531);
  v22 = fmod(v21 + 6.28318531, 6.28318531);
  v23 = fmod(v14 + 3.14159265 + v17 * v26 + (v20 + v17) * v28 + (v22 + -3.14159265 + v20 + v17) * v27, 6.28318531);
  result = fmod(v23 + 6.28318531, 6.28318531) + -3.14159265;
  *(long double *)(a2 + 40) = result;
  return result;
}

void __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  unint64_t *v6;
  unint64_t v7;
  double v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  unsigned __int8 *v20;
  double v21;
  char v22;
  double v23;
  double v24;
  long double v25;
  long double v26;
  long double v27;
  double v28;
  float64x2_t v29;
  double v30;
  float64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  int32x2_t v45;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t *v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float64x2_t v68;
  float64x2_t v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  float64x2_t v72;
  uint64_t v73;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "camera");
    if (!*(_QWORD *)&v72.f64[1])
      goto LABEL_6;
    v6 = (unint64_t *)(*(_QWORD *)&v72.f64[1] + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v72.f64[1] + 16))(*(_QWORD *)&v72.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v72.f64[1]);
      if (!*(_QWORD *)&v72.f64[0])
        goto LABEL_50;
    }
    else
    {
LABEL_6:
      if (!*(_QWORD *)&v72.f64[0])
        goto LABEL_50;
    }
    v61 = *(_QWORD *)(a1 + 56);
    v63 = *(_QWORD *)(a1 + 48);
    v8 = a2;
    v9 = *(double *)(a1 + 80);
    v65 = *(double *)(a1 + 72);
    v66 = *(double *)(a1 + 64);
    v10 = fmod(3.14159265 - v9 + *(double *)(a1 + 88), 6.28318531);
    v11 = fmod(v10 + 6.28318531, 6.28318531);
    v12 = fmod(v9 + 3.14159265 + (v11 + -3.14159265) * a2, 6.28318531);
    v13 = fmod(v12 + 6.28318531, 6.28318531);
    v14 = *(double *)(a1 + 104);
    v15 = fmod(3.14159265 - v14 + *(double *)(a1 + 96), 6.28318531);
    v16 = fmod(v15 + 6.28318531, 6.28318531);
    v17 = fmod(v14 + 3.14159265 + (v16 + -3.14159265) * a2, 6.28318531);
    v67 = fmod(v17 + 6.28318531, 6.28318531);
    if (*(_BYTE *)(a1 + 144))
    {
      v18 = v13;
      v19 = *(double *)(a1 + 112);
    }
    else
    {
      v20 = (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 32), "mapDataAccess");
      v72 = *(float64x2_t *)(a1 + 88);
      v73 = 0;
      md::MapDataAccess::heightAtCoordinate(v20, &v72);
      v18 = v13;
      if (v22)
        v19 = v21;
      else
        v19 = 0.0;
    }
    v24 = *(double *)(a1 + 120);
    v23 = *(double *)(a1 + 128);
    v25 = fmod(3.14159265 - v23 + *(double *)(a1 + 136), 6.28318531);
    v26 = fmod(v25 + 6.28318531, 6.28318531);
    v27 = fmod(v23 + 3.14159265 + (v26 + -3.14159265) * v8, 6.28318531);
    v28 = fmod(v27 + 6.28318531, 6.28318531);
    objc_msgSend(v5, "camera");
    v29.f64[0] = v18 + -3.14159265;
    v30 = v24 + (v19 - v24) * v8;
    v29.f64[1] = v67 + -3.14159265;
    v31 = v72.f64[0];
    v68 = v29;
    *(float64x2_t *)(*(_QWORD *)&v72.f64[0] + 8) = v29;
    *(double *)(*(_QWORD *)&v31 + 24) = v30;
    v32 = *(std::__shared_weak_count **)&v72.f64[1];
    if (*(_QWORD *)&v72.f64[1])
    {
      v33 = (unint64_t *)(*(_QWORD *)&v72.f64[1] + 8);
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    objc_msgSend(v5, "camera", v61, v63);
    v35 = *(std::__shared_weak_count **)&v72.f64[1];
    *(double *)(*(_QWORD *)&v72.f64[0] + 40) = v66 + (v65 - v66) * v8;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v37 = __ldaxr(p_shared_owners);
      while (__stlxr(v37 - 1, p_shared_owners));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    objc_msgSend(v5, "camera");
    v38 = *(std::__shared_weak_count **)&v72.f64[1];
    *(double *)(*(_QWORD *)&v72.f64[0] + 32) = v64 + (v62 - v64) * v8;
    if (v38)
    {
      v39 = (unint64_t *)&v38->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    objc_msgSend(v5, "camera");
    v41 = *(std::__shared_weak_count **)&v72.f64[1];
    *(double *)(*(_QWORD *)&v72.f64[0] + 48) = v28 + -3.14159265;
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    v44 = objc_msgSend(v5, "mapDataAccess");
    objc_msgSend(v5, "centerScreenPoint");
    v45 = (int32x2_t)objc_msgSend(v5, "cursorFromScreenPoint:");
    objc_msgSend(v5, "camera");
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v72, v44, v70 + 8, v45);
    if (v71)
    {
      v46 = &v71->__shared_owners_;
      do
        v47 = __ldaxr((unint64_t *)v46);
      while (__stlxr(v47 - 1, (unint64_t *)v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    v69 = v72;
    objc_msgSend(v5, "camera");
    __asm { FMOV            V0.2D, #-2.0 }
    v53 = v70;
    *(float64x2_t *)(v70 + 8) = vnegq_f64(vmlaq_f64(v69, _Q0, v68));
    *(double *)(v53 + 24) = v30;
    if (v71)
    {
      v54 = &v71->__shared_owners_;
      do
        v55 = __ldaxr((unint64_t *)v54);
      while (__stlxr(v55 - 1, (unint64_t *)v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    v56 = v5[35];
    objc_msgSend(v5, "camera");
    md::CameraManager::update(v56, &v70, 1);
    v57 = v71;
    if (v71)
    {
      v58 = &v71->__shared_owners_;
      do
        v59 = __ldaxr((unint64_t *)v58);
      while (__stlxr(v59 - 1, (unint64_t *)v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    objc_msgSend(v5, "_updateIsPitched");
    objc_msgSend(v5, "_updateCanEnter3DMode");
    objc_msgSend(v5, "cameraDelegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "mapLayerDidChangeVisibleRegion");

  }
LABEL_50:

}

void __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_BYTE *)(*((_QWORD *)WeakRetained + 35) + 242) = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(*((id *)WeakRetained + 23), "resumeAnimation");
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }

}

void __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 40), a2))));
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapLayerDidChangeVisibleRegion");

}

uint64_t __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[35];
  objc_msgSend(v2, "cursorFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_BYTE *)(v3 + 18) = 1;
  objc_msgSend(*(id *)(a1 + 32), "endRegionChange");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    v8 = WeakRetained[35];
    *(double *)(v8 + 224) = *(double *)(v8 + 224) * v5 / v7;
    *(_DWORD *)(v8 + 216) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 220) = *(_DWORD *)(a1 + 60);
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "cameraDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v10;
  }

}

void __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_BYTE *)(WeakRetained[35] + 186) = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

void __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    v8 = WeakRetained[35];
    *(double *)(v8 + 224) = *(double *)(v8 + 224) * v5 / v7;
    *(_DWORD *)(v8 + 216) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 220) = *(_DWORD *)(a1 + 60);
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(v10, "_updateCanEnter3DMode");
    objc_msgSend(v10, "cameraDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v10;
  }

}

void __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_BYTE *)(WeakRetained[35] + 186) = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

void __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(double *)(a1 + 40);
    v7 = *(double *)(a1 + 48);
    v8 = WeakRetained[35];
    objc_msgSend(WeakRetained, "camera");
    v9 = v6 + (v7 - v6) * a2 - *(double *)(v13 + 40);
    *(_DWORD *)(v8 + 160) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 164) = *(_DWORD *)(a1 + 60);
    *(double *)(v8 + 176) = v9 + *(double *)(v8 + 176);
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    objc_msgSend(v5, "_updateIsPitched");
    objc_msgSend(v5, "cameraDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapLayerDidChangeVisibleRegion");

  }
}

void __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_BYTE *)(*((_QWORD *)WeakRetained + 35) + 130) = 1;
    *((_BYTE *)WeakRetained + 296) = 0;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(*((id *)WeakRetained + 23), "resumeAnimation");
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(WeakRetained, "_updateCanEnter3DMode");
  }

}

void __47__VKDaVinciCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  double v5;
  long double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  void *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40);
    v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    v7 = fmod(v6 + 6.28318531, 6.28318531);
    v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531);
    objc_msgSend(WeakRetained, "camera");
    v10 = *(double *)(v19 + 48);
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)())v20->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    objc_msgSend(WeakRetained, "centerScreenPoint");
    v14 = v13;
    v16 = v15;
    v17 = fmod(v9 - v10, 6.28318531);
    objc_msgSend(WeakRetained, "rotate:atScreenPoint:", (double)(fmod(v17 + 6.28318531, 6.28318531) + -3.14159265), v14, v16);
    objc_msgSend(WeakRetained, "cameraDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapLayerDidChangeVisibleRegion");

  }
}

void __47__VKDaVinciCameraController_rotateTo_animated___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_BYTE *)(WeakRetained[35] + 83) = 1;
    *((_BYTE *)WeakRetained + 297) = 0;
    objc_msgSend(WeakRetained, "endRegionChange");
  }

}

uint64_t __67__VKDaVinciCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
