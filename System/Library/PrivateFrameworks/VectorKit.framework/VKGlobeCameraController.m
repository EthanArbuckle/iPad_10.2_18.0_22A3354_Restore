@implementation VKGlobeCameraController

- (VKGlobeCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:
{
  __shared_weak_count *cntrl;
  TaskContext *ptr;
  RunLoopController *v12;
  VKGlobeCameraController *v13;
  VKGlobeCameraController *v14;
  VKGlobeCameraController *v15;
  uint64_t v16;
  TaskContext *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  VKGlobeGestureCameraController *v23;
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  objc_super v26;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VKGlobeCameraController;
  v13 = -[VKScreenCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v26, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, cntrl, a4, a5, v12);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v17 = *(TaskContext **)ptr;
    v16 = *((_QWORD *)ptr + 1);
    if (v16)
    {
      v18 = (unint64_t *)(v16 + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    v20 = (std::__shared_weak_count *)v13->_taskContext.__cntrl_;
    v13->_taskContext.__ptr_ = v17;
    v13->_taskContext.__cntrl_ = (__shared_weak_count *)v16;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v15->_currentDoublePanPitch = 0.0;
    v15->_globeView = 0;
    v15->_isPitching = 0;
    v15->_isRotating = 0;
    -[VKCameraController setIsPitchEnabled:](v15, "setIsPitchEnabled:", 1);
    v23 = -[VKGestureCameraBehavior initWithCameraController:]([VKGlobeGestureCameraController alloc], "initWithCameraController:", v15);
    gestureCameraControllerBehavior = v15->super._gestureCameraControllerBehavior;
    v15->super._gestureCameraControllerBehavior = &v23->super;

    -[VKGestureCameraBehavior setCameraManager:](v15->super._gestureCameraControllerBehavior, "setCameraManager:", &v14->_cameraManager);
    v15->_minZoomLevel = 1.0;
    v15->_maxZoomLevel = 21.0;
    v15->_tourShouldResumeWhenDoneGesturing = 1;
  }

  return v15;
}

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
  -[VKAnnotationTrackingCameraController setGlobeView:](self->super._annotationTrackingCameraController, "setGlobeView:");
  -[VKGestureCameraBehavior setGlobeView:](self->super._gestureCameraControllerBehavior, "setGlobeView:", a3);
  if (self->_globeView)
  {
    self->_wasPitched = -[VKGlobeCameraController isPitched](self, "isPitched");
    self->_couldEnter3DMode = -[VKGlobeCameraController canEnter3DMode](self, "canEnter3DMode");
  }
}

- (int64_t)tileSize
{
  return 256;
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
  uint64_t v11;
  _QWORD *globeView;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v18 = *(_QWORD *)a3.__ptr_;
  v19 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v17.receiver = self;
  v17.super_class = (Class)VKGlobeCameraController;
  -[VKScreenCameraController setCamera:](&v17, sel_setCamera_, &v18, a3.__cntrl_);
  v8 = v19;
  if (v19)
  {
    v9 = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(_QWORD *)ptr;
  if (*(_QWORD *)ptr)
  {
    globeView = self->_globeView;
    v13 = globeView[9];
    v14 = *(_OWORD *)(v11 + 24);
    v15 = *(_OWORD *)(v11 + 40);
    v16 = *(_QWORD *)(v11 + 56);
    *(_OWORD *)(v13 + 8) = *(_OWORD *)(v11 + 8);
    *(_QWORD *)(v13 + 56) = v16;
    *(_OWORD *)(v13 + 40) = v15;
    *(_OWORD *)(v13 + 24) = v14;
    ++*((_DWORD *)globeView + 94);
  }
}

- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  CameraManager *p_cameraManager;
  Matrix<int, 2, 1> v9;
  Matrix<int, 2, 1> v10;

  y = a4.y;
  x = a4.x;
  self->_isPitching = 0;
  if (!self->_isRotating)
  {
    p_cameraManager = &self->_cameraManager;
    v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", a4.x, a4.y);
    *(_WORD *)&p_cameraManager->_rotateBegin = 1;
    p_cameraManager->_rotateEnd = 0;
    p_cameraManager->_rotateCurrentCursor = v9;
    p_cameraManager->_rotateAngle = 0.0;
    self->_isRotating = 1;
  }
  v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  self->_cameraManager._rotateAngle = self->_cameraManager._rotateAngle + a3;
  self->_cameraManager._rotateCurrentCursor = v10;
}

- (void)pitch:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  Matrix<int, 2, 1> v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  Matrix<int, 2, 1> v18;
  double v19;

  y = a3.y;
  x = a3.x;
  if (-[VKCameraController isPitchEnabled](self, "isPitchEnabled"))
  {
    self->_isRotating = 0;
    self->super._isPitchIncreasing = a4 < 0.0;
    if (!self->_isPitching)
    {
      v8 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
      *(_WORD *)&self->_cameraManager._tiltBegin = 1;
      self->_cameraManager._tiltEnd = 0;
      self->_cameraManager._tiltAngle = 0.0;
      self->_cameraManager._tiltCurrentCursor = v8;
      self->_cameraManager._tiltPreviousCursor = v8;
      self->_isPitching = 1;
    }
    if (self->_cameraManager._useTiltLimit)
    {
      v9 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
      v10 = 0.0;
      if (v9 <= 1500000.0)
      {
        v11 = 1.0;
        v12 = fmax(v9, 1.0);
        v10 = 0.680678408 - cos(sqrt(v12 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
        if (self->_cameraManager._tiltLimitMode == 1)
        {
          if (v12 < 20000.0)
            v11 = self->_cameraManager._fullZoomTiltLimitFactor
                + v12 * 0.00005 * (1.0 - self->_cameraManager._fullZoomTiltLimitFactor);
          v10 = v11 * v10;
        }
        if (self->_cameraManager._tiltLimitTransferInProgress)
          v10 = self->_cameraManager._startTiltLimitTilt
              + fmin(fmax(self->_cameraManager._tiltLimitTransferFraction, 0.0), 1.0)
              * (v10 - self->_cameraManager._startTiltLimitTilt);
      }
    }
    else
    {
      v10 = 1.57079633;
    }
    v13 = self->_beganDoublePanPitch - a4;
    v14 = fmax(v10, 0.0);
    if (v14 >= v13)
    {
      if (v13 >= 0.0)
      {
LABEL_19:
        v17 = fmin(fmax(v13, 0.0), v10 + 0.0698131701);
        v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
        v19 = v17 - self->_currentDoublePanPitch;
        self->_cameraManager._tiltCurrentCursor = v18;
        self->_cameraManager._tiltAngle = v19 + self->_cameraManager._tiltAngle;
        self->_currentDoublePanPitch = v17;
        -[VKGlobeCameraController _updateIsPitched](self, "_updateIsPitched");
        -[VKGlobeCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
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
    goto LABEL_19;
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
  v15[2] = __65__VKGlobeCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
  v15[3] = &unk_1E42F4BE0;
  v14 = v9;
  v16 = v14;
  -[VKGlobeCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v15, v12, v13, a3);

}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  Matrix<int, 2, 1> v10;

  y = a3.y;
  x = a3.x;
  if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  else
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  v8 = v6;
  v9 = v7;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v8, v9);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = v10;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 0;
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double x;
  double y;
  VKAnimation *zoomAnimation;
  Matrix<int, 2, 1> v11;
  void *v12;
  uint64_t v13;
  char v14;

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
      v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      self->_cameraManager._zoomFactor = self->_cameraManager._zoomFactor * (a4 * 0.7 / a5 + 0.3);
      self->_cameraManager._zoomCurrentCursor = v11;
      self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
      -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mapLayerDidChangeVisibleRegion");

      v13 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
      if (v13)
      {
        v14 = 4;
        md::MapEngine::setNeedsTick(v13, &v14);
      }
    }
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKAnimation *zoomAnimation;

  y = a3.y;
  x = a3.x;
  zoomAnimation = self->super._zoomAnimation;
  if (!zoomAnimation || !-[VKAnimation running](zoomAnimation, "running"))
  {
    if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    else
      -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
    -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    self->_cameraManager._zoomEnd = 1;
    -[VKCameraController endRegionChange](self, "endRegionChange");
    -[VKGlobeCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1;
  double var0;
  id v19;
  double v20;
  double v21;
  double v22;
  id v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v23 = a9;
  v19 = a10;
  -[VKGlobeCameraController _fovAdjustment](self, "_fovAdjustment");
  v20 = a6 * 0.0174532925;
  v22 = a4 / (v21 * fmax(cos(v20), 0.00001));
  if (a8)
  {
    if (a8 != 2)
    {
      -[VKGlobeCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 0, v23, v19, var0, var1, 0.0, v22, a5 * -0.0174532925, v20, a7);
      goto LABEL_6;
    }
    a7 = 0.0;
  }
  -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v23, v19, var0, var1, v22, a5 * -0.0174532925, v20, a7);
LABEL_6:

}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2;
  double var1;
  double var0;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v27 = a9;
  v20 = a10;
  -[VKGlobeCameraController _fovAdjustment](self, "_fovAdjustment");
  v21 = a6 * 0.0174532925;
  v23 = a4 / (v22 * fmax(cos(v21), 0.00001));
  v24 = a5 * -0.0174532925;
  if (!a8)
  {
    v25 = a7;
    v26 = v27;
    goto LABEL_5;
  }
  v25 = 0.0;
  v26 = v27;
  if (a8 == 2)
  {
LABEL_5:
    -[VKGlobeCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v26, v20, var0, var1, var2, v23, v24, v21, v25);
    goto LABEL_6;
  }
  -[VKGlobeCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v27, v20, var0, var1, var2, v23, v24, v21, a7);
LABEL_6:

}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_globeView)
  {
    v3 = a3;
    -[VKCameraController canvas](self, "canvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *((_QWORD *)self->_globeView + 9);
      v7 = *(double *)(v6 + 40);
      if (v7 < 0.261799388 && v7 > 0.0001)
        goto LABEL_15;
      if (self->_cameraManager._useTiltLimit)
      {
        v8 = *(double *)(v6 + 32);
        v9 = 0.0;
        if (v8 <= 1500000.0)
        {
          v10 = 1.0;
          v11 = fmax(v8, 1.0);
          v9 = 0.680678408 - cos(sqrt(v11 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
          if (self->_cameraManager._tiltLimitMode == 1)
          {
            if (v11 < 20000.0)
              v10 = self->_cameraManager._fullZoomTiltLimitFactor
                  + v11 * 0.00005 * (1.0 - self->_cameraManager._fullZoomTiltLimitFactor);
            v9 = v10 * v9;
          }
          if (self->_cameraManager._tiltLimitTransferInProgress)
            v9 = self->_cameraManager._startTiltLimitTilt
               + fmin(fmax(self->_cameraManager._tiltLimitTransferFraction, 0.0), 1.0)
               * (v9 - self->_cameraManager._startTiltLimitTilt);
        }
      }
      else
      {
        v9 = 1.57079633;
      }
      if (v7 > v9)
LABEL_15:
        -[VKGlobeCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", v3, 0);
    }
  }
  return 0;
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  double v9;
  VKTimedAnimation *rotationAnimation;
  VKTimedAnimation *v11;
  VKTimedAnimation *v12;
  VKTimedAnimation *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23[2];
  _QWORD v24[4];
  id v25[3];
  id location;

  if (self->_globeView)
  {
    v4 = a4;
    -[VKCameraController canvas](self, "canvas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      v8 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      v9 = *(double *)(*((_QWORD *)self->_globeView + 9) + 48);
      if (v4)
      {
        rotationAnimation = self->super._rotationAnimation;
        if (rotationAnimation)
        {
          -[VKAnimation stop](rotationAnimation, "stop");
          v11 = self->super._rotationAnimation;
          self->super._rotationAnimation = 0;

        }
        v12 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
        v13 = self->super._rotationAnimation;
        self->super._rotationAnimation = v12;

        -[VKTimedAnimation setTimingFunction:](self->super._rotationAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
        objc_initWeak(&location, self);
        v14 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __45__VKGlobeCameraController_rotateTo_animated___block_invoke;
        v24[3] = &unk_1E42F9418;
        objc_copyWeak(v25, &location);
        v25[1] = *(id *)&v9;
        v25[2] = *(id *)&a3;
        -[VKTimedAnimation setStepHandler:](self->super._rotationAnimation, "setStepHandler:", v24);
        v19 = v14;
        v20 = 3221225472;
        v21 = __45__VKGlobeCameraController_rotateTo_animated___block_invoke_2;
        v22 = &unk_1E42F4C08;
        objc_copyWeak(v23, &location);
        v23[1] = v8;
        -[VKAnimation setCompletionHandler:](self->super._rotationAnimation, "setCompletionHandler:", &v19);
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v19, v20, v21, v22);
        *(_WORD *)&self->_cameraManager._rotateBegin = 1;
        self->_cameraManager._rotateEnd = 0;
        self->_cameraManager._rotateCurrentCursor = (Matrix<int, 2, 1>)v8;
        self->_cameraManager._rotateAngle = 0.0;
        self->_isRotating = 1;
        md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._rotationAnimation->super);
        objc_destroyWeak(v23);
        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }
      else
      {
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
        *(_WORD *)&self->_cameraManager._rotateBegin = 1;
        self->_cameraManager._rotateEnd = 0;
        self->_cameraManager._rotateCurrentCursor = (Matrix<int, 2, 1>)v8;
        self->_cameraManager._rotateAngle = 0.0;
        -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
        -[VKGlobeCameraController rotate:atScreenPoint:](self, "rotate:atScreenPoint:", a3 - v9, v15, v16);
        self->_cameraManager._rotateEnd = 1;
        -[VKCameraController cameraDelegate](self, "cameraDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mapLayerDidChangeVisibleRegion");

        v18 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
        if (v18)
        {
          LOBYTE(location) = 4;
          md::MapEngine::setNeedsTick(v18, &location);
        }
        -[VKCameraController endRegionChange](self, "endRegionChange");
      }
    }
  }
}

- (void)tiltTo:(double)a3 animated:(BOOL)a4 exaggerate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *v12;
  double v13;
  VKTimedAnimation *v14;
  VKTimedAnimation *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20[2];
  _QWORD v21[4];
  id v22[4];
  id location;

  v5 = a5;
  v6 = a4;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  v10 = *(void **)(*((_QWORD *)self->_globeView + 9) + 40);
  if (v6)
  {
    pitchAnimation = self->super._pitchAnimation;
    if (pitchAnimation)
      -[VKAnimation stop](pitchAnimation, "stop");
    v12 = [VKTimedAnimation alloc];
    v13 = 0.3;
    if (v5)
      v13 = 0.5;
    v14 = -[VKTimedAnimation initWithDuration:](v12, "initWithDuration:", v13);
    v15 = self->super._pitchAnimation;
    self->super._pitchAnimation = v14;

    objc_initWeak(&location, self);
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke;
    v21[3] = &unk_1E42F4C30;
    objc_copyWeak(v22, &location);
    v22[1] = v10;
    v22[2] = *(id *)&a3;
    v22[3] = v9;
    -[VKTimedAnimation setStepHandler:](self->super._pitchAnimation, "setStepHandler:", v21);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke_2;
    v19[3] = &unk_1E42F4C08;
    objc_copyWeak(v20, &location);
    v20[1] = v9;
    -[VKAnimation setCompletionHandler:](self->super._pitchAnimation, "setCompletionHandler:", v19);
    -[VKTimedAnimation setTimingFunction:](self->super._pitchAnimation, "setTimingFunction:", VKAnimationCurveEaseOut);
    -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    *(_WORD *)&self->_cameraManager._tiltBegin = 1;
    self->_cameraManager._tiltEnd = 0;
    self->_cameraManager._tiltAngle = 0.0;
    self->_cameraManager._tiltCurrentCursor = (Matrix<int, 2, 1>)v9;
    self->_cameraManager._tiltPreviousCursor = (Matrix<int, 2, 1>)v9;
    self->_isPitching = 1;
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._pitchAnimation->super);
    objc_destroyWeak(v20);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    *(_WORD *)&self->_cameraManager._tiltBegin = 1;
    self->_cameraManager._tiltEnd = 0;
    self->_cameraManager._tiltAngle = 0.0;
    self->_cameraManager._tiltCurrentCursor = (Matrix<int, 2, 1>)v9;
    self->_cameraManager._tiltPreviousCursor = (Matrix<int, 2, 1>)v9;
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    -[VKGlobeCameraController pitch:translation:](self, "pitch:translation:");
    self->_cameraManager._tiltEnd = 1;
    -[VKGlobeCameraController _updateIsPitched](self, "_updateIsPitched");
    -[VKGlobeCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mapLayerDidChangeVisibleRegion");

    v18 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v18)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v18, &location);
    }
    -[VKCameraController endRegionChange](self, "endRegionChange");
  }
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  long double v10;
  void *v11;
  VKAnimation *zoomAnimation;
  VKTimedAnimation *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21[2];
  _QWORD v22[5];
  id v23[3];
  id location;
  _QWORD v25[4];

  y = a3.y;
  x = a3.x;
  v9 = a5;
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
  v10 = exp2(-a4);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x3FF0000000000000;
  v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
    -[VKAnimation stop](zoomAnimation, "stop");
  v13 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.25);
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke;
  v22[3] = &unk_1E42F4C58;
  objc_copyWeak(v23, &location);
  v23[1] = *(id *)&v10;
  v22[4] = v25;
  v23[2] = v11;
  -[VKTimedAnimation setStepHandler:](v13, "setStepHandler:", v22);
  v16 = v14;
  v17 = 3221225472;
  v18 = __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke_2;
  v19 = &unk_1E42F9FC8;
  objc_copyWeak(v21, &location);
  v21[1] = v11;
  v15 = v9;
  v20 = v15;
  -[VKAnimation setCompletionHandler:](v13, "setCompletionHandler:", &v16);
  objc_storeStrong((id *)&self->super._zoomAnimation, v13);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = (Matrix<int, 2, 1>)v11;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v16, v17, v18, v19);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), self->super._zoomAnimation);

  objc_destroyWeak(v21);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v25, 8);
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5 completionHandler:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  VKAnimation **p_zoomAnimation;
  VKAnimation *zoomAnimation;
  VKAnimation *v16;
  VKTimedAnimation *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25[2];
  _QWORD v26[5];
  id v27[3];
  id location;
  _QWORD v29[4];

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  v13 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x3FF0000000000000;
  p_zoomAnimation = &self->super._zoomAnimation;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    -[VKAnimation stop](zoomAnimation, "stop");
    v16 = *p_zoomAnimation;
    *p_zoomAnimation = 0;

  }
  v17 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a5);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke;
  v26[3] = &unk_1E42F4C58;
  objc_copyWeak(v27, &location);
  *(double *)&v27[1] = a4 / v13;
  v26[4] = v29;
  v27[2] = v12;
  -[VKTimedAnimation setStepHandler:](v17, "setStepHandler:", v26);
  v20 = v18;
  v21 = 3221225472;
  v22 = __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2;
  v23 = &unk_1E42F9FC8;
  objc_copyWeak(v25, &location);
  v25[1] = v12;
  v19 = v11;
  v24 = v19;
  -[VKAnimation setCompletionHandler:](v17, "setCompletionHandler:", &v20);
  objc_storeStrong((id *)&self->super._zoomAnimation, v17);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = (Matrix<int, 2, 1>)v12;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v20, v21, v22, v23);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *p_zoomAnimation);

  objc_destroyWeak(v25);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Block_object_dispose(v29, 8);
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5
{
  -[VKGlobeCameraController zoomToDistance:distance:time:completionHandler:](self, "zoomToDistance:distance:time:completionHandler:", 0, a3.x, a3.y, a4, a5);
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
  Matrix<int, 2, 1> v18;
  double v19;
  double v20;
  VKTimedAnimation *v21;
  uint64_t v22;
  _QWORD v23[5];
  void (**v24)(_QWORD);
  double v25;
  double v26;
  _QWORD v27[7];

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
    v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    v19 = x + v12;
    *(_WORD *)&self->_cameraManager._panBegin = 1;
    self->_cameraManager._panEnd = 0;
    v20 = y - v11;
    self->_cameraManager._panAtStartPosition = 0;
    self->_cameraManager._panStartCursor = v18;
    self->_cameraManager._panCurrentCursor = v18;
    self->_cameraManager._panPreviousCursor = v18;
    if ((_DWORD)v8)
    {
      v21 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a6);
      -[VKTimedAnimation setTimingFunction:](v21, "setTimingFunction:", VKAnimationCurveLinear);
      v22 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v27[3] = &unk_1E42F4C80;
      *(double *)&v27[5] = v12;
      *(double *)&v27[6] = v11;
      v27[4] = self;
      -[VKTimedAnimation setStepHandler:](v21, "setStepHandler:", v27);
      v23[0] = v22;
      v23[1] = 3221225472;
      v23[2] = __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v23[3] = &unk_1E42F4CA8;
      v23[4] = self;
      v25 = v19;
      v26 = v20;
      v24 = v14;
      -[VKAnimation setCompletionHandler:](v21, "setCompletionHandler:", v23);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &v21->super);

    }
    else
    {
      -[VKScreenCameraController updatePanWithTranslation:](self, "updatePanWithTranslation:", v12, v11);
      -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v19, v20);
      self->_cameraManager._panEnd = 1;
      -[VKCameraController endRegionChange](self, "endRegionChange");
      if (v14)
LABEL_11:
        v14[2](v14);
    }
  }

}

- (void)moveTo:(id)a3 zoom:(double)a4 rotation:(double)a5 tilt:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9
{
  -[VKGlobeCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 0, a8, a9, a3.var0, a3.var1, 0.0, a4, a5, a6, a7);
}

- (void)moveTo:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11
{
  double var1;
  double var0;
  id v21;
  void (**v22)(id, uint64_t);
  double v23;
  double v24;
  double v25;
  VKTimedAnimation *v26;
  VKTimedAnimation *regionAnimation;
  uint64_t v28;
  uint64_t v29;
  float64x2_t v30;
  _BYTE *globeView;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  int v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  int v43;
  _QWORD *v44;
  uint64_t v45;
  long double v46;
  _BYTE *v52;
  uint64_t v53;
  float64x2_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  double v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t *Anchor;
  uint64_t v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  _QWORD v73[4];
  void (**v74)(id, uint64_t);
  float64x2_t *v75;
  id v76;
  _QWORD v77[5];
  id v78[13];
  id location[2];
  float64x2_t v80;
  uint64_t v81;
  uint64_t v82;
  Matrix<int, 2, 1> v83;
  void *v84;
  void *v85;
  Matrix<int, 2, 1> v86;
  float64x2_t v87;
  uint64_t v88;

  var1 = a3.var1;
  var0 = a3.var0;
  v21 = a10;
  v22 = (void (**)(id, uint64_t))a11;
  -[VKGlobeCameraController stopGlobeAnimations](self, "stopGlobeAnimations");
  if (-[VKGlobeCameraController isFlyoverTourStarted](self, "isFlyoverTourStarted"))
    -[VKGlobeCameraController stopFlyoverTourAnimation](self, "stopFlyoverTourAnimation");
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  v23 = var0 * 0.0174532925;
  v24 = var1 * 0.0174532925;
  v25 = fmin(fmax(*((double *)self->_globeView + 49), a6), *((double *)self->_globeView + 50));
  if (a9 <= 0.0)
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v80.f64[0] = v23;
    v80.f64[1] = v24;
    v81 = *(_QWORD *)&a4;
    globeView = self->_globeView;
    v32 = !a5;
    globeView[160] = !a5;
    v33 = *((_QWORD *)globeView + 9);
    v34 = v81;
    *(float64x2_t *)(v33 + 8) = v80;
    *(_QWORD *)(v33 + 24) = v34;
    ++*((_DWORD *)globeView + 94);
    v35 = **(_QWORD **)(*((_QWORD *)globeView + 107) + 88);
    if (v35)
    {
      LOBYTE(v87.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v35, &v87);
    }
    v36 = (unsigned __int8 *)self->_globeView;
    v37 = v36[184];
    v38 = *((_QWORD *)v36 + 9);
    v39 = fmax(a8, 0.0);
    if (!v36[184])
      v39 = a8;
    *(double *)(v38 + 40) = v39;
    ++*((_DWORD *)v36 + 94);
    if (v37)
    {
      v40 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v36);
      v41 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v36);
      v42 = *((_QWORD *)v36 + 9);
      v43 = v36[184];
      *(double *)(v42 + 32) = fmin(fmax(v40, v25), fmax(fmin(*((double *)v36 + 50), 60592301.5), v41));
      if (v43)
        *(double *)(v42 + 40) = fmax(*(double *)(v42 + 40), 0.0);
    }
    else
    {
      *(double *)(v38 + 32) = v25;
    }
    ++*((_DWORD *)v36 + 94);
    v44 = self->_globeView;
    v45 = v44[9];
    v46 = fmod(a7 + 3.14159265, 6.28318531);
    *(long double *)(v45 + 48) = fmod(v46 + 6.28318531, 6.28318531) + -3.14159265;
    ++*((_DWORD *)v44 + 94);
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    v83 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    v87 = 0uLL;
    v88 = 0;
    altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v83, v80.f64, (uint64_t)&v87, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    v80 = vnegq_f64(vmlaq_f64(v87, _Q2, v80));
    v52 = self->_globeView;
    v52[160] = v32;
    v53 = *((_QWORD *)v52 + 9);
    v54 = v80;
    *(_QWORD *)(v53 + 24) = v81;
    *(float64x2_t *)(v53 + 8) = v54;
    ++*((_DWORD *)v52 + 94);
    v55 = **(_QWORD **)(*((_QWORD *)v52 + 107) + 88);
    if (v55)
    {
      LOBYTE(location[0]) = 7;
      md::MapEngine::setNeedsTick(v55, location);
    }
    altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)self->_globeView, 1);
    -[VKGlobeCameraController _updateIsPitched](self, "_updateIsPitched");
    -[VKGlobeCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "mapLayerDidChangeVisibleRegion");

    v57 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v57)
    {
      LOBYTE(location[0]) = 4;
      md::MapEngine::setNeedsTick(v57, location);
    }
    -[VKCameraController endRegionChange](self, "endRegionChange");
    -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    self->_cameraManager._tiltLimitPushDownEnabled = 1;
    if (v22)
      v22[2](v22, 1);
  }
  else
  {
    v26 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a9);
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v26;

    if (v21)
      v28 = (uint64_t)v21;
    else
      v28 = VKAnimationCurveLinear;
    -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v28);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    v29 = *((_QWORD *)self->_globeView + 9);
    if (v29)
    {
      v30 = *(float64x2_t *)(v29 + 8);
      v88 = *(_QWORD *)(v29 + 24);
      v87 = v30;
    }
    else
    {
      v87 = 0uLL;
      v88 = 0;
    }
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    v71 = a7;
    v72 = v24;
    v69 = a4;
    v70 = a8;
    v85 = 0;
    v86 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    v83 = 0;
    v84 = 0;
    altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v86, v87.f64, (uint64_t)&v83, 0);
    v58 = v25;
    v59 = (void *)v83;
    v60 = v84;
    v68 = v85;
    v61 = self->_globeView;
    v62 = (_QWORD *)v61[9];
    v63 = (void *)v62[4];
    v64 = (void *)v62[5];
    v65 = (void *)v62[6];
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v80.f64[0] = 0.0;
    *(_QWORD *)&v80.f64[1] = &v80;
    v81 = 0x2020000000;
    v82 = 0;
    if (!a5)
    {
      location[0] = *(id *)&v23;
      location[1] = *(id *)&v72;
      Anchor = altitude::GlobeView::createAnchor((uint64_t)v61, (double *)location);
      *(_QWORD *)(*(_QWORD *)&v80.f64[1] + 24) = Anchor;
    }
    objc_initWeak(location, self);
    v67 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
    v77[3] = &unk_1E42F4CD0;
    objc_copyWeak(v78, location);
    v78[1] = v63;
    v78[2] = *(id *)&v58;
    v78[3] = v64;
    v78[4] = *(id *)&v70;
    v78[5] = v59;
    v78[6] = *(id *)&v23;
    v78[7] = v60;
    v78[8] = *(id *)&v72;
    v77[4] = &v80;
    v78[9] = v68;
    v78[10] = *(id *)&v69;
    v78[11] = v65;
    v78[12] = *(id *)&v71;
    -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v77);
    v73[0] = v67;
    v73[1] = 3221225472;
    v73[2] = __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v73[3] = &unk_1E42F4CF8;
    objc_copyWeak(&v76, location);
    v74 = v22;
    v75 = &v80;
    -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v73);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

    objc_destroyWeak(&v76);
    objc_destroyWeak(v78);
    objc_destroyWeak(location);
    _Block_object_dispose(&v80, 8);
  }

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
  v64[2] = __75__VKGlobeCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
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

- (void)moveToZoomOutZoomInTransition:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11
{
  _BOOL4 v16;
  double var1;
  double var0;
  id v21;
  void (**v22)(id, uint64_t);
  double *globeView;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t *Anchor;
  uint64_t v33;
  __double2 v34;
  double v35;
  __double2 v36;
  double v37;
  double v38;
  __double2 v39;
  double v40;
  double v41;
  __double2 v42;
  double v43;
  double v44;
  VKTimedAnimation *v45;
  VKTimedAnimation *regionAnimation;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id *v51;
  VKTimedAnimation *v52;
  id v53;
  unsigned __int8 *v54;
  double *v55;
  uint64_t v56;
  int v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  int v62;
  _QWORD *v63;
  uint64_t v64;
  long double v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  _QWORD v82[4];
  void (**v83)(id, uint64_t);
  uint64_t *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD v89[7];
  _QWORD v90[7];
  _QWORD v91[4];
  id v92[15];
  id location[2];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;

  v16 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v21 = a10;
  v22 = (void (**)(id, uint64_t))a11;
  -[VKGlobeCameraController stopGlobeAnimations](self, "stopGlobeAnimations");
  if (-[VKGlobeCameraController isFlyoverTourStarted](self, "isFlyoverTourStarted"))
    -[VKGlobeCameraController stopFlyoverTourAnimation](self, "stopFlyoverTourAnimation");
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  v75 = a6;
  globeView = (double *)self->_globeView;
  v24 = *((_QWORD *)globeView + 9);
  v72 = a8;
  if (v24)
  {
    v25 = *(double *)(v24 + 8);
    v80 = *(void **)(v24 + 16);
    v26 = *(double *)(v24 + 24);
  }
  else
  {
    v26 = 0.0;
    v80 = 0;
    v25 = 0.0;
  }
  v77 = a9;
  v27 = globeView[49];
  v28 = globeView[50];
  v29 = var0 * 0.0174532925;
  v30 = var1 * 0.0174532925;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v78 = v26;
  v79 = a7;
  v81 = v30;
  if (v16)
  {
    v69 = *(void **)(v24 + 48);
    v70 = *(void **)(v24 + 56);
    v73 = *(double *)(v24 + 32);
    v74 = a4;
    v68 = *(void **)(v24 + 40);
  }
  else
  {
    v31 = v25;
    location[0] = *(id *)&v29;
    location[1] = *(id *)&v30;
    Anchor = altitude::GlobeView::createAnchor((uint64_t)globeView, (double *)location);
    v95[3] = (uint64_t)Anchor;
    v33 = *((_QWORD *)self->_globeView + 9);
    v69 = *(void **)(v33 + 48);
    v70 = *(void **)(v33 + 56);
    v68 = *(void **)(v33 + 40);
    v25 = v31;
    v73 = *(double *)(v33 + 32);
    if (Anchor)
      v74 = *((double *)Anchor + 7);
    else
      v74 = a4;
  }
  v76 = fmin(fmax(v27, v75), v28);
  v71 = v25;
  v34 = __sincos_stret(v25);
  v35 = 6378137.0 / sqrt(-(v34.__sinval * v34.__sinval * 0.00669437999 + -1.0));
  v36 = __sincos_stret(*(double *)&v80);
  v37 = v35 * v34.__cosval * v36.__cosval;
  v38 = v35 * v34.__cosval * v36.__sinval;
  v39 = __sincos_stret(v29);
  v40 = 6378137.0 / sqrt(-(v39.__sinval * v39.__sinval * 0.00669437999 + -1.0));
  v41 = v40 * v39.__cosval;
  v42 = __sincos_stret(v81);
  v43 = acos(fmax(fmin((v34.__sinval * 0.99330562 * v35 * (v39.__sinval * 0.99330562 * v40)+ v37 * (v41 * v42.__cosval)+ v38 * (v41 * v42.__sinval))/ sqrt((v37 * v37 + v38 * v38 + v34.__sinval * 0.99330562 * v35 * (v34.__sinval * 0.99330562 * v35))* (v41 * v42.__cosval * (v41 * v42.__cosval)+ v41 * v42.__sinval * (v41 * v42.__sinval)+ v39.__sinval * 0.99330562 * v40 * (v39.__sinval * 0.99330562 * v40))), 1.0), -1.0));
  v44 = ((vabdd_f64(v78 + v73, v76 + v74) * 0.0000000499064047 + v43 * 0.318309886) * 0.8 + 0.2) * v77;
  if (v44 <= 0.0)
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v54 = (unsigned __int8 *)self->_globeView;
    v54[160] = !v16;
    v55 = (double *)*((_QWORD *)v54 + 9);
    v55[1] = v29;
    v55[2] = v81;
    v55[3] = a4;
    ++*((_DWORD *)v54 + 94);
    v56 = **(_QWORD **)(*((_QWORD *)v54 + 107) + 88);
    if (v56)
    {
      LOBYTE(location[0]) = 7;
      md::MapEngine::setNeedsTick(v56, location);
      v54 = (unsigned __int8 *)self->_globeView;
      v55 = (double *)*((_QWORD *)v54 + 9);
    }
    v57 = v54[184];
    v58 = fmax(v72, 0.0);
    if (!v54[184])
      v58 = v72;
    v55[5] = v58;
    ++*((_DWORD *)v54 + 94);
    if (v57)
    {
      v59 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v54);
      v60 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v54);
      v61 = *((_QWORD *)v54 + 9);
      v62 = v54[184];
      *(double *)(v61 + 32) = fmin(fmax(v59, v76), fmax(fmin(*((double *)v54 + 50), 60592301.5), v60));
      if (v62)
        *(double *)(v61 + 40) = fmax(*(double *)(v61 + 40), 0.0);
    }
    else
    {
      v55[4] = v76;
    }
    ++*((_DWORD *)v54 + 94);
    v63 = self->_globeView;
    v64 = v63[9];
    v65 = fmod(v79 + 3.14159265, 6.28318531);
    *(long double *)(v64 + 48) = fmod(v65 + 6.28318531, 6.28318531) + -3.14159265;
    ++*((_DWORD *)v63 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)v63, 1);
    -[VKGlobeCameraController _updateIsPitched](self, "_updateIsPitched");
    -[VKGlobeCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mapLayerDidChangeVisibleRegion");

    v67 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v67)
    {
      LOBYTE(location[0]) = 4;
      md::MapEngine::setNeedsTick(v67, location);
    }
    -[VKCameraController endRegionChange](self, "endRegionChange", v68, v69, v70);
    -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    self->_cameraManager._tiltLimitPushDownEnabled = 1;
    if (v22)
      v22[2](v22, 1);
  }
  else
  {
    v45 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v44);
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v45;

    if (v21)
      v47 = (uint64_t)v21;
    else
      v47 = VKAnimationCurveExponentialEaseInOut;
    v48 = (void *)MEMORY[0x1A1AF5730](v47);
    -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v48);
    objc_initWeak(location, self);
    v49 = MEMORY[0x1E0C809B0];
    if (fabs(v43 * 57.2957795) <= 0.05)
    {
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3321888768;
      v91[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
      v91[3] = &unk_1E42E93E8;
      v51 = v92;
      objc_copyWeak(v92, location);
      v92[1] = *(id *)&v71;
      v92[2] = v80;
      v92[3] = *(id *)&v78;
      v92[4] = *(id *)&v73;
      v92[5] = v68;
      v92[6] = v69;
      v92[7] = v70;
      v92[8] = *(id *)&v29;
      v92[9] = *(id *)&v81;
      v92[10] = *(id *)&v74;
      v92[11] = *(id *)&v76;
      v92[12] = *(id *)&v72;
      v92[13] = *(id *)&v79;
      v92[14] = v70;
      -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v91);
    }
    else
    {
      *(double *)v90 = v71;
      v90[1] = v80;
      *(double *)&v90[2] = v78;
      *(double *)&v90[3] = v73;
      v90[4] = v68;
      v90[5] = v69;
      v90[6] = v70;
      *(double *)v89 = v29;
      *(double *)&v89[1] = v81;
      *(double *)&v89[2] = v74;
      *(double *)&v89[3] = v76;
      *(double *)&v89[4] = v72;
      *(double *)&v89[5] = v79;
      v89[6] = v70;
      -[VKGlobeCameraController createMoveToZoomOutZoomInFrameFunction:toLatLon:](self, "createMoveToZoomOutZoomInFrameFunction:toLatLon:", v90, v89);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v49;
      v86[1] = 3221225472;
      v86[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_12;
      v86[3] = &unk_1E42F4D20;
      v51 = &v88;
      objc_copyWeak(&v88, location);
      v87 = v50;
      v52 = self->super._regionAnimation;
      v53 = v50;
      -[VKTimedAnimation setStepHandler:](v52, "setStepHandler:", v86);

    }
    objc_destroyWeak(v51);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v82[0] = v49;
    v82[1] = 3221225472;
    v82[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v82[3] = &unk_1E42F4CF8;
    objc_copyWeak(&v85, location);
    v83 = v22;
    v84 = &v94;
    -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v82);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

    objc_destroyWeak(&v85);
    objc_destroyWeak(location);

  }
  _Block_object_dispose(&v94, 8);

}

- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  int8x16_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int8x16_t v42;
  uint64_t v43;
  __int128 v44;
  _OWORD v45[2];
  __int128 v46;
  int8x16_t v47;
  uint64_t v48;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = *((_QWORD *)self->_globeView + 78);
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  if (v10)
  {
    objc_msgSend(v10, "cameraPathAtIndex:", 0);
    v14 = *(double *)v45;
    v16 = *(double *)&v47.i64[1];
    v15 = *(double *)v47.i64;
    v17 = *(double *)&v46;
    v18 = *((double *)v45 + 1) * 57.2957795;
    v19 = *(double *)&v45[1] * 57.2957795;
  }
  else
  {
    v17 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v14 = 0.0;
    v19 = 0.0;
    v18 = 0.0;
  }
  v20 = objc_msgSend(v10, "cameraPathsCount");
  if (v10)
  {
    objc_msgSend(v10, "cameraPathAtIndex:", v20 - 1);
  }
  else
  {
    v43 = 0;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
  }
  v45[1] = v40;
  v46 = v41;
  v47 = v42;
  v48 = v43;
  v44 = v38;
  v45[0] = v39;
  v21 = v39;
  v22 = v41;
  self->_cameraManager._useTiltLimit = 0;
  v23 = VKAnimationCurveEaseInOut;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3321888768;
  v28[2] = __88__VKGlobeCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke;
  v28[3] = &unk_1E42E9238;
  v24 = v12;
  v30 = v24;
  v25 = v11;
  v31 = v25;
  v32 = v13;
  v28[4] = self;
  v26 = v10;
  v29 = v26;
  v33 = *(_OWORD *)((char *)v45 + 8);
  v34 = v21;
  v35 = vextq_s8(v47, v47, 8uLL);
  v36 = v22;
  v37 = 0;
  if (v8)
    v27 = 1.0;
  else
    v27 = 0.0;
  -[VKGlobeCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v23, v28, v18, v19, v14, v16, v17, v15, v27);

}

- (void)pauseFlyoverTourAnimation
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = *((_QWORD *)self->_globeView + 78);
  if (v2 && *(_DWORD *)(v2 + 116) == 1)
  {
    *(_DWORD *)(v2 + 116) = 0;
    v3 = *(_QWORD *)(v2 + 144);
    if (v3)
    {
      v4 = 1;
      (*(void (**)(uint64_t, int *))(*(_QWORD *)v3 + 48))(v3, &v4);
    }
  }
}

- (void)resumeFlyoverTourAnimation
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  int v8;

  v2 = *((_QWORD *)self->_globeView + 78);
  if (v2 && !*(_DWORD *)(v2 + 116))
  {
    *(_DWORD *)(v2 + 116) = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(v2 + 184) + 72);
    v4 = *(_OWORD *)(v3 + 24);
    v5 = *(_OWORD *)(v3 + 40);
    v6 = *(_OWORD *)(v3 + 8);
    *(_QWORD *)(v2 + 240) = *(_QWORD *)(v3 + 56);
    *(_OWORD *)(v2 + 208) = v4;
    *(_OWORD *)(v2 + 224) = v5;
    *(_OWORD *)(v2 + 192) = v6;
    *(_DWORD *)(v2 + 248) = 1065353216;
    v7 = *(_QWORD *)(v2 + 144);
    if (v7)
    {
      v8 = 2;
      (*(void (**)(uint64_t, int *))(*(_QWORD *)v7 + 48))(v7, &v8);
    }
  }
}

- (void)stopFlyoverTourAnimation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;

  v2 = *((_QWORD *)self->_globeView + 78);
  if (!v2 || *(_DWORD *)(v2 + 116) == 2)
    return;
  *(_DWORD *)(v2 + 116) = 2;
  v3 = *(_QWORD *)(v2 + 184);
  if (v3)
    *(_QWORD *)(v3 + 264) = 0;
  v4 = *(_QWORD *)(v2 + 144);
  if (!v4)
    return;
  v5 = *(_QWORD *)(v2 + 80);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 8);
    if (v6)
      v7 = *(double *)(v6 + 144);
    else
      v7 = 0.0;
    if (v7 > *(float *)(v2 + 88))
      v8 = 3;
    else
      v8 = 5;
  }
  else
  {
    v8 = 5;
  }
  v13 = v8;
  (*(void (**)(uint64_t, int *))(*(_QWORD *)v4 + 48))(v4, &v13);
  v9 = *(_QWORD **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;
  if (v9 == (_QWORD *)(v2 + 120))
  {
    v10 = 4;
    v9 = (_QWORD *)(v2 + 120);
    goto LABEL_18;
  }
  if (v9)
  {
    v10 = 5;
LABEL_18:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  v11 = *(_QWORD **)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0;
  if (v11 == (_QWORD *)(v2 + 152))
  {
    v12 = 4;
    v11 = (_QWORD *)(v2 + 152);
  }
  else
  {
    if (!v11)
      return;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
}

- (void)interruptFlyoverTourAnimation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;

  v2 = *((_QWORD *)self->_globeView + 78);
  if (!v2 || *(_DWORD *)(v2 + 116) == 2)
    return;
  *(_DWORD *)(v2 + 116) = 2;
  v3 = *(_QWORD *)(v2 + 184);
  if (v3)
    *(_QWORD *)(v3 + 264) = 0;
  v4 = *(_QWORD *)(v2 + 144);
  if (!v4)
    return;
  v5 = 4;
  v9 = 4;
  (*(void (**)(uint64_t, int *))(*(_QWORD *)v4 + 48))(v4, &v9);
  v6 = *(_QWORD **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;
  if (v6 == (_QWORD *)(v2 + 120))
  {
    v6 = (_QWORD *)(v2 + 120);
    goto LABEL_10;
  }
  if (v6)
  {
    v5 = 5;
LABEL_10:
    (*(void (**)(void))(*v6 + 8 * v5))();
  }
  v7 = *(_QWORD **)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0;
  if (v7 == (_QWORD *)(v2 + 152))
  {
    v8 = 4;
    v7 = (_QWORD *)(v2 + 152);
  }
  else
  {
    if (!v7)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (BOOL)isFlyoverTourStarted
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_globeView + 78);
  return v2 && *(_DWORD *)(v2 + 116) != 2;
}

- (float)slowDownFactorFromLoadProgress
{
  char *MainTileLoaderStatistics;
  unsigned int v3;

  MainTileLoaderStatistics = altitude::GlobeView::getMainTileLoaderStatistics(*((altitude::GlobeView **)self->_globeView + 58), *((_QWORD *)self->_globeView + 66));
  v3 = *((_DWORD *)MainTileLoaderStatistics + 1);
  if (v3)
    return fminf((float)*((unsigned int *)MainTileLoaderStatistics + 2) / (float)v3, cbrtf(1.0 - (float)((float)*((unsigned int *)MainTileLoaderStatistics + 4) / (float)v3)));
  else
    return 1.0;
}

- (void)adjustLoadingForAnimation:(float)a3 progressFactor:(float)a4
{
  altitude::GlobeView *globeView;
  float v5;
  float v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  globeView = (altitude::GlobeView *)self->_globeView;
  v5 = a3 * 7.0;
  v6 = 95.0 - (float)(a4 * 95.0);
  *(float *)(*((_QWORD *)globeView + 98) + 1312) = a3 * 7.0;
  v7 = *((_QWORD *)globeView + 65);
  if (v7 && (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v7 + 24))(v7, 0, 0xFFFFFFFFLL))
    *(float *)((*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)globeView + 65) + 24))(*((_QWORD *)globeView + 65), 0, 0xFFFFFFFFLL)+ 1312) = v5;
  v8 = (float)(v6 * 0.01) + 1.0;
  altitude::GlobeView::setCoarseLoading(globeView);
  *(float *)(*((_QWORD *)globeView + 98) + 1304) = v6;
  v9 = *((_QWORD *)globeView + 65);
  if (!v9)
  {
    v12 = *((_QWORD *)globeView + 98);
    goto LABEL_11;
  }
  v10 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v9 + 24))(v9, 0, 0xFFFFFFFFLL);
  v11 = *((_QWORD *)globeView + 65);
  if (v10)
  {
    *(float *)((*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v11 + 24))(v11, 0, 0xFFFFFFFFLL)
             + 1304) = v6;
    v11 = *((_QWORD *)globeView + 65);
  }
  *(float *)(*((_QWORD *)globeView + 98) + 1308) = v8;
  if (v11 && (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v11 + 24))(v11, 0, 0xFFFFFFFFLL))
  {
    v12 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)globeView + 65) + 24))(*((_QWORD *)globeView + 65), 0, 0xFFFFFFFFLL);
LABEL_11:
    *(float *)(v12 + 1308) = v8;
  }
}

- (Geocentric<double>)cameraPosition
{
  double v2;
  double v3;
  double v4;
  double v5[7];
  Geocentric<double> result;

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v5, (double *)(*((_QWORD *)self->_globeView + 9) + 8));
  v2 = v5[0];
  v3 = v5[1];
  v4 = v5[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
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
  CameraManager *p_cameraManager;
  double v4;
  double v5;
  double v6;
  double v7;

  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    v4 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
    v5 = 0.0;
    if (v4 <= 1500000.0)
    {
      v6 = 1.0;
      v7 = fmax(v4, 1.0);
      v5 = 0.680678408 - cos(sqrt(v7 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v7 < 20000.0)
          v6 = p_cameraManager->_fullZoomTiltLimitFactor
             + v7 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        v5 = v6 * v5;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress)
        v5 = p_cameraManager->_startTiltLimitTilt
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v5 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    v5 = 1.57079633;
  }
  -[VKGlobeCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", 1, 1, fmin(v5, 0.785398163));
}

- (void)exit3DMode
{
  -[VKGlobeCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", 1, 1, 0.0);
}

- (BOOL)canEnter3DMode
{
  CameraManager *p_cameraManager;
  double v3;
  double v4;
  double v5;
  double v6;

  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    v3 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
    v4 = 0.0;
    if (v3 <= 1500000.0)
    {
      v5 = 1.0;
      v6 = fmax(v3, 1.0);
      v4 = 0.680678408 - cos(sqrt(v6 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v6 < 20000.0)
          v5 = p_cameraManager->_fullZoomTiltLimitFactor
             + v6 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        v4 = v5 * v4;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress)
        v4 = p_cameraManager->_startTiltLimitTilt
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v4 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    v4 = 1.57079633;
  }
  return v4 > 0.261799388;
}

- (BOOL)isPitched
{
  return *(double *)(*((_QWORD *)self->_globeView + 9) + 40) > 0.0001;
}

- (BOOL)isFullyPitched
{
  uint64_t v2;
  double v3;
  CameraManager *p_cameraManager;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = *((_QWORD *)self->_globeView + 9);
  v3 = *(double *)(v2 + 40);
  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    v5 = *(double *)(v2 + 32);
    v6 = 0.0;
    if (v5 <= 1500000.0)
    {
      v7 = 1.0;
      v8 = fmax(v5, 1.0);
      v6 = 0.680678408 - cos(sqrt(v8 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v8 < 20000.0)
          v7 = p_cameraManager->_fullZoomTiltLimitFactor
             + v8 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        v6 = v7 * v6;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress)
        v6 = p_cameraManager->_startTiltLimitTilt
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v6 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    v6 = 1.57079633;
  }
  return v3 > v6;
}

- (double)minPitch
{
  return 15.0;
}

- (double)maxPitch
{
  CameraManager *p_cameraManager;
  double v3;
  double v4;
  double v5;
  double v6;

  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    v3 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
    v4 = 0.0;
    if (v3 <= 1500000.0)
    {
      v5 = 1.0;
      v6 = fmax(v3, 1.0);
      v4 = 0.680678408 - cos(sqrt(v6 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v6 < 20000.0)
          v5 = p_cameraManager->_fullZoomTiltLimitFactor
             + v6 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        v4 = v5 * v4;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress)
        v4 = p_cameraManager->_startTiltLimitTilt
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v4 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    v4 = 1.57079633;
  }
  return v4 * 57.2957795;
}

- (void)_updateIsPitched
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;

  if (self->_globeView)
  {
    v3 = -[VKGlobeCameraController isPitched](self, "isPitched");
    if (self->_wasPitched != v3)
    {
      v4 = v3;
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mapLayerDidBecomePitched:", v4);

      self->_wasPitched = v4;
    }
  }
}

- (void)_updateCanEnter3DMode
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;

  v3 = -[VKGlobeCameraController canEnter3DMode](self, "canEnter3DMode");
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
  -[VKGlobeCameraController _updateIsPitched](self, "_updateIsPitched");
  -[VKGlobeCameraController _updateCanEnter3DMode](self, "_updateCanEnter3DMode");
}

- (void)setGesturing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKGlobeCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  -[VKAnnotationTrackingCameraController setGesturing:](self->super._annotationTrackingCameraController, "setGesturing:", v3);
  if (v3)
  {
    -[VKGlobeCameraController stopGlobeAnimations](self, "stopGlobeAnimations");
    if (-[VKGlobeCameraController isFlyoverTourStarted](self, "isFlyoverTourStarted"))
      -[VKGlobeCameraController pauseFlyoverTourAnimation](self, "pauseFlyoverTourAnimation");
  }
  else if (-[VKGlobeCameraController isFlyoverTourStarted](self, "isFlyoverTourStarted")
         && self->_tourShouldResumeWhenDoneGesturing)
  {
    -[VKGlobeCameraController resumeFlyoverTourAnimation](self, "resumeFlyoverTourAnimation");
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  VKAnnotationTrackingCameraController *annotationTrackingCameraController;
  VKGlobeAnnotationTrackingCameraController *v14;
  void *v15;
  AnimationRunner *v16;
  RunLoopController *v17;
  void *v18;
  VKAnnotationTrackingCameraController *v19;
  VKAnnotationTrackingCameraController *v20;
  VKAnnotationTrackingCameraController *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void *v25;
  VKAnnotationTrackingCameraController *v26;
  void *v27;
  _BOOL4 v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v31[8];
  std::__shared_weak_count *v32;

  v28 = a5;
  v9 = a4;
  v11 = a3;
  v12 = a7;
  if (-[VKGlobeCameraController isFlyoverTourStarted](self, "isFlyoverTourStarted"))
    -[VKGlobeCameraController interruptFlyoverTourAnimation](self, "interruptFlyoverTourAnimation");
  annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  if (!annotationTrackingCameraController)
  {
    v14 = [VKGlobeAnnotationTrackingCameraController alloc];
    v15 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    v16 = -[VKCameraController animationRunner](self, "animationRunner");
    v17 = -[VKCameraController runLoopController](self, "runLoopController");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[VKAnnotationTrackingCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](v14, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:", v15, v16, v17, v18);
    v20 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v19;

    v21 = self->super._annotationTrackingCameraController;
    -[VKCameraController camera](self, "camera");
    -[VKCameraController setCamera:](v21, "setCamera:", v31);
    v22 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    -[VKCameraController canvas](self, "canvas");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController setCanvas:](self->super._annotationTrackingCameraController, "setCanvas:", v25);

    v29 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    v30 = *(_QWORD *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    -[VKAnnotationTrackingCameraController setBehavior:](self->super._annotationTrackingCameraController, "setBehavior:", &v29);
    -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", self->super._userChangedZoomSinceLastProgrammaticRegionChange);
    -[VKAnnotationTrackingCameraController setHeadingAnimationDisplayRate:](self->super._annotationTrackingCameraController, "setHeadingAnimationDisplayRate:", self->super._annotationTrackingHeadingAnimationDisplayRate);
    -[VKCameraController edgeInsets](self, "edgeInsets");
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    -[VKAnnotationTrackingCameraController setGlobeView:](self->super._annotationTrackingCameraController, "setGlobeView:", -[VKGlobeCameraController globeView](self, "globeView"));
    v26 = self->super._annotationTrackingCameraController;
    -[VKScreenCameraController regionRestriction](self, "regionRestriction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKAnnotationTrackingCameraController setRegionRestriction:](v26, "setRegionRestriction:", v27);

    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  }
  -[VKAnnotationTrackingCameraController startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](annotationTrackingCameraController, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v11, v9, v28, v12, a6);

}

- (void)updateCameraManager
{
  altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)self->_globeView, 0);
}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;

  v4 = a4;
  if (!self->_globeView || (-[VKGlobeCameraController heading](self, "heading"), vabdd_f64(a3, v7) >= 0.000001))
    -[VKGlobeCameraController rotateTo:animated:](self, "rotateTo:animated:", v4, a3 * -0.0174532925);
}

- (id)mapRegion
{
  id v3;
  void *globeView;
  double v5;
  double *v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  float64x2_t v16;
  const double *v17;
  uint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  const double *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float64x2_t v32;
  float64x2_t v33;
  const double *v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  const double *v38;
  unsigned __int128 v39;
  unsigned __int128 v40;
  float64x2_t v41;
  float64x2_t v42;
  double v43;
  void *__p;
  _BYTE *v46;
  uint64_t v47;
  float64x2x2_t v48;
  float64x2x2_t v49;

  v3 = objc_alloc_init(MEMORY[0x1E0D27208]);
  __p = 0;
  v46 = 0;
  v47 = 0;
  globeView = self->_globeView;
  if (!globeView || (altitude::GlobeView::getVisibleArea((uint64_t)globeView, (long double **)&__p) & 1) == 0)
  {
    objc_msgSend(v3, "setEastLng:", -180.0);
    objc_msgSend(v3, "setWestLng:", -180.0);
    v14 = -180.0;
    objc_msgSend(v3, "setNorthLat:", -180.0);
    goto LABEL_26;
  }
  v6 = (double *)__p;
  if (__p != v46)
  {
    v7 = v46 - (_BYTE *)__p - 16;
    v8 = (v7 >> 4) + 1;
    if (v7 > 0x2F)
    {
      v16 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
      v17 = (const double *)((char *)__p + 32);
      v18 = v8 & 0x1FFFFFFFFFFFFFFCLL;
      v19 = v16;
      v20 = v16;
      v21 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
      v22 = v16;
      v23 = v21;
      v24 = v21;
      v25 = v21;
      do
      {
        v26 = v17 - 4;
        v48 = vld2q_f64(v26);
        v49 = vld2q_f64(v17);
        v20 = vminnmq_f64(v20, v48.val[1]);
        v22 = vminnmq_f64(v22, v49.val[1]);
        v16 = vminnmq_f64(v16, v48.val[0]);
        v19 = vminnmq_f64(v19, v49.val[0]);
        v24 = vmaxnmq_f64(v24, v48.val[1]);
        v25 = vmaxnmq_f64(v25, v49.val[1]);
        v21 = vmaxnmq_f64(v21, v48.val[0]);
        v23 = vmaxnmq_f64(v23, v49.val[0]);
        v17 += 8;
        v18 -= 4;
      }
      while (v18);
      v12 = vmaxnmvq_f64(vmaxnmq_f64(v24, v25));
      v9 = vmaxnmvq_f64(vmaxnmq_f64(v21, v23));
      v11 = vminnmvq_f64(vminnmq_f64(v20, v22));
      v10 = vminnmvq_f64(vminnmq_f64(v16, v19));
      if (v8 == (v8 & 0x1FFFFFFFFFFFFFFCLL))
      {
LABEL_13:
        v15 = v9 * 57.2957795;
        v14 = v10 * 57.2957795;
        v5 = v12 - v11;
        if (v12 - v11 > 3.14159265)
        {
          if (v7 > 0x3F)
          {
            v29 = v8 & 3;
            if ((v8 & 3) == 0)
              v29 = 4;
            v30 = v8 - v29;
            v31 = 16 * v30;
            v32 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
            v33 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
            v34 = (const double *)((char *)__p + 40);
            v35 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
            v36 = v33;
            v37 = v32;
            do
            {
              v38 = v34 - 4;
              v39 = (unsigned __int128)vld2q_f64(v38);
              v40 = (unsigned __int128)vld2q_f64(v34);
              v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v39), (int8x16_t)vaddq_f64((float64x2_t)v39, v35), (int8x16_t)v39);
              v42 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v40), (int8x16_t)vaddq_f64((float64x2_t)v40, v35), (int8x16_t)v40);
              v33 = vminnmq_f64(v33, v41);
              v36 = vminnmq_f64(v36, v42);
              v32 = vmaxnmq_f64(v32, v41);
              v37 = vmaxnmq_f64(v37, v42);
              v34 += 8;
              v30 -= 4;
            }
            while (v30);
            v6 = (double *)((char *)__p + v31);
            v12 = vmaxnmvq_f64(vmaxnmq_f64(v32, v37));
            v5 = vminnmvq_f64(vminnmq_f64(v33, v36));
          }
          else
          {
            v12 = -3.40282347e38;
            v5 = 3.40282347e38;
          }
          do
          {
            v43 = v6[1];
            if (v43 > 0.0)
              v43 = v43 + -6.28318531;
            v5 = fmin(v5, v43);
            v12 = fmax(v12, v43);
            v6 += 2;
          }
          while (v6 != (double *)v46);
          v11 = v5 + 6.28318531;
        }
        goto LABEL_25;
      }
      v13 = (double *)((char *)__p + 16 * (v8 & 0x1FFFFFFFFFFFFFFCLL));
    }
    else
    {
      v9 = -3.40282347e38;
      v10 = 3.40282347e38;
      v11 = 3.40282347e38;
      v12 = -3.40282347e38;
      v13 = (double *)__p;
    }
    do
    {
      v28 = *v13;
      v27 = v13[1];
      v13 += 2;
      v11 = fmin(v11, v27);
      v10 = fmin(v10, v28);
      v12 = fmax(v12, v27);
      v9 = fmax(v9, v28);
    }
    while (v13 != (double *)v46);
    goto LABEL_13;
  }
  v11 = 3.40282347e38;
  v12 = -3.40282347e38;
  v15 = -1.94967423e40;
  v14 = 1.94967423e40;
LABEL_25:
  objc_msgSend(v3, "setEastLng:", v12 * 57.2957795, v5);
  objc_msgSend(v3, "setWestLng:", v11 * 57.2957795);
  objc_msgSend(v3, "setNorthLat:", v15);
LABEL_26:
  objc_msgSend(v3, "setSouthLat:", v14);
  if (__p)
    operator delete(__p);
  return v3;
}

- (double)geocAngleBetween:(id)a3 andCoordinate:(id)a4
{
  double var0;
  double v5;
  __double2 v6;
  double v7;
  __double2 v8;
  __double2 v9;
  double v10;
  double v11;
  __double2 v12;
  double v14;
  double v15;
  double var1;

  var1 = a4.var1;
  var0 = a4.var0;
  v5 = a3.var1 * 0.0174532925;
  v6 = __sincos_stret(a3.var0 * 0.0174532925);
  v7 = 6378137.0 / sqrt(-(v6.__sinval * v6.__sinval * 0.00669437999 + -1.0));
  v8 = __sincos_stret(v5);
  v14 = v7 * v6.__cosval * v8.__sinval;
  v15 = v7 * v6.__cosval * v8.__cosval;
  v9 = __sincos_stret(var0 * 0.0174532925);
  v10 = 6378137.0 / sqrt(-(v9.__sinval * v9.__sinval * 0.00669437999 + -1.0));
  v11 = v10 * v9.__cosval;
  v12 = __sincos_stret(var1 * 0.0174532925);
  return acos(fmax(fmin((v9.__sinval * 0.99330562 * v10 * (v6.__sinval * 0.99330562 * v7)+ v11 * v12.__cosval * v15+ v11 * v12.__sinval * v14)/ sqrt((v11 * v12.__cosval * (v11 * v12.__cosval)+ v11 * v12.__sinval * (v11 * v12.__sinval)+ v9.__sinval * 0.99330562 * v10 * (v9.__sinval * 0.99330562 * v10))* (v15 * v15 + v14 * v14 + v6.__sinval * 0.99330562 * v7 * (v6.__sinval * 0.99330562 * v7))), 1.0), -1.0));
}

- (double)earthRadiusAt:(double)a3
{
  __double2 v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;

  v3 = __sincos_stret(a3 * 0.0174532925);
  v4 = vmulq_n_f64((float64x2_t)xmmword_19FFB5A60, v3.__cosval);
  v5 = vmulq_n_f64((float64x2_t)xmmword_19FFB5A70, v3.__sinval);
  v6 = vmlaq_f64(vmulq_f64(v5, v5), v4, v4);
  return sqrt(vdivq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]);
}

- (double)greatCircleMidPointLatitude:(double)a3 fromLongitude:(double)a4 toLongitude:(double)a5
{
  double v5;
  __double2 v6;
  __double2 v7;

  v5 = (a5 - a4) * 0.0174532925;
  v6 = __sincos_stret(a3 * 0.0174532925);
  v7 = __sincos_stret(v5);
  return atan2(v6.__sinval + v6.__sinval, sqrt(v7.__sinval * v6.__cosval * (v7.__sinval * v6.__cosval)+ (v6.__cosval + v7.__cosval * v6.__cosval) * (v6.__cosval + v7.__cosval * v6.__cosval)))* 57.2957795;
}

- (double)widestLatitudeForMapRegion:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "southLat");
  if (v4 >= 0.0)
  {
    objc_msgSend(v3, "southLat");
    goto LABEL_5;
  }
  objc_msgSend(v3, "northLat");
  v5 = 0.0;
  if (v6 <= 0.0)
  {
    objc_msgSend(v3, "northLat");
LABEL_5:
    v5 = v7;
  }

  return v5;
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
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  float v41;
  float v42;
  void *v43;
  double v44;
  float v45;
  float v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  __double2 v53;
  __double2 v54;
  __double2 v55;
  double v57;
  float v58;
  float v59;
  double v60;
  float v61;
  float v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;

  v4 = a3;
  objc_msgSend(v4, "eastLng");
  v6 = v5;
  objc_msgSend(v4, "westLng");
  if (v6 < v7)
  {
    objc_msgSend(v4, "eastLng");
    objc_msgSend(v4, "setEastLng:", v8 + 360.0);
  }
  -[VKGlobeCameraController _centerCoordinateForMapRegion:](self, "_centerCoordinateForMapRegion:", v4);
  v10 = v9;
  v12 = v11;
  -[VKCameraController canvas](self, "canvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  -[VKCameraController canvas](self, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  v18 = v17;

  v19 = (*(double (**)(void *))(*(_QWORD *)self->_globeView + 40))(self->_globeView);
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:", v10);
  v69 = v20;
  objc_msgSend(v4, "northLat");
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:");
  v68 = v21;
  objc_msgSend(v4, "northLat");
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  v67 = v22;
  objc_msgSend(v4, "southLat");
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v10, v12, v23, v12);
  v66 = v24;
  objc_msgSend(v4, "southLat");
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  v65 = v25;
  -[VKGlobeCameraController widestLatitudeForMapRegion:](self, "widestLatitudeForMapRegion:", v4);
  v27 = v26;
  objc_msgSend(v4, "westLng");
  v29 = v28;
  objc_msgSend(v4, "eastLng");
  -[VKGlobeCameraController greatCircleMidPointLatitude:fromLongitude:toLongitude:](self, "greatCircleMidPointLatitude:fromLongitude:toLongitude:", v27, v29, v30);
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  v64 = v31;
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:", v27);
  v63 = v32;
  objc_msgSend(v4, "westLng");
  v34 = v33;
  objc_msgSend(v4, "eastLng");
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v27, v34, v27, v35);
  v37 = v36;
  -[VKCameraController canvas](self, "canvas");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "size");
  v40 = v39;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v62 = v41;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v61 = v42;

  -[VKCameraController canvas](self, "canvas");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "size");
  v60 = v44;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v59 = v45;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v58 = v46;

  -[VKCameraController canvas](self, "canvas");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "size");
  v49 = v48;

  -[VKCameraController canvas](self, "canvas");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v15;
  objc_msgSend(v50, "size");
  v52 = v51;
  v53 = __sincos_stret(v68);
  v54 = __sincos_stret(v66);
  v55 = __sincos_stret(v37 * 0.5);

  return fmax(v49* fmax(v67 * v53.__sinval / v19 + (v53.__cosval + -1.0) * v69, v65 * v54.__sinval / v19 + (v54.__cosval + -1.0) * v69)/ (v40 - (v62 + v61)), v52 * (v63 * v18 * v55.__sinval / (v19 * v57) + (v55.__cosval + -1.0) * v64) / (v60 - (v59 + v58)));
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  return 1.0;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  v14 = a7;
  v15 = a8;
  -[VKGlobeCameraController _centerCoordinateForMapRegion:](self, "_centerCoordinateForMapRegion:", v25);
  v17 = v16;
  v19 = v18;
  objc_msgSend(v25, "eastLng");
  v21 = v20;
  objc_msgSend(v25, "westLng");
  if (v21 < v22)
  {
    objc_msgSend(v25, "eastLng");
    objc_msgSend(v25, "setEastLng:", v23 + 360.0);
  }
  -[VKGlobeCameraController zoomForMapRegion:](self, "zoomForMapRegion:", v25);
  -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v14, v15, v17, v19, v24, a5 * -0.0174532925, a4 * 0.0174532925, a6);
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 0;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 0);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerCoordinateForMapRegion:(id)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  uint64_t v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  Matrix<int, 2, 1> v10;
  __int128 v11;
  uint64_t v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = *((_QWORD *)self->_globeView + 9);
  if (v3)
  {
    v4 = *(_OWORD *)(v3 + 8);
    v12 = *(_QWORD *)(v3 + 24);
    v11 = v4;
  }
  else
  {
    v11 = 0uLL;
    v12 = 0;
  }
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v9 = 0;
  v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  v7 = 0.0;
  v8 = 0.0;
  altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v10, (double *)&v11, (uint64_t)&v7, 0);
  v5 = v7 * 57.2957795;
  v6 = v8 * 57.2957795;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (double)distanceFromCenterCoordinate
{
  return *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
}

- (double)altitude
{
  uint64_t v3;
  float v4;
  float v5;
  double v6;
  double v7;

  v3 = *((_QWORD *)self->_globeView + 9);
  v4 = *(double *)(v3 + 32);
  v5 = *(double *)(v3 + 40);
  v6 = (float)(cosf(v5) * v4);
  -[VKGlobeCameraController _fovAdjustment](self, "_fovAdjustment");
  return v7 * v6;
}

- (double)heading
{
  float v2;
  float v3;

  v2 = *(double *)(*((_QWORD *)self->_globeView + 9) + 48);
  if (v2 > 3.14159265)
  {
    v3 = v2 + -6.28318531;
    v2 = v3;
  }
  return v2 * -57.2957795;
}

- (double)pitch
{
  return *(double *)(*((_QWORD *)self->_globeView + 9) + 40) * 57.2957795;
}

- (double)_fovAdjustment
{
  double v2;
  unsigned __int8 v3;
  uint64_t *v4;
  int v6;
  double v7;

  (*(void (**)(void *, SEL))(*(_QWORD *)self->_globeView + 40))(self->_globeView, a2);
  v4 = &ggl::ARMesh::ARDepthMeshPipelineSetup::typedReflection(void)::ref;
  if ((v3 & 1) == 0)
  {
    v7 = v2;
    v4 = &ggl::ARMesh::ARDepthMeshPipelineSetup::typedReflection(void)::ref;
    v2 = v7;
    if (v6)
    {
      -[VKGlobeCameraController _fovAdjustment]::tanHalfStandardFovY = 0x3FD12612A0540B8FLL;
      v4 = &ggl::ARMesh::ARDepthMeshPipelineSetup::typedReflection(void)::ref;
      v2 = v7;
    }
  }
  return v2 / *((double *)v4 + 399);
}

- (double)minimumZoomLevel
{
  return self->_minZoomLevel;
}

- (double)maximumZoomLevel
{
  return self->_maxZoomLevel;
}

- (double)currentZoomLevel
{
  return self->_currentZoomLevel;
}

- (void)setCurrentZoomLevel:(double)a3
{
  self->_currentZoomLevel = a3;
}

- (void)setMaxZoomLevel:(double)a3
{
  self->_maxZoomLevel = a3;
}

- (void)setMinZoomLevel:(double)a3
{
  self->_minZoomLevel = fmax(a3, 1.0);
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  double v9;
  double var1;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  Matrix<int, 2, 1> v18;
  _QWORD *v19;
  uint64_t v20;
  __int128 v21;
  char *v22;
  __int128 v23;
  char *globeView;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  uint64_t v29;
  _QWORD v30[5];
  __int128 v31;
  uint64_t v32;
  double v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  Matrix<int, 2, 1> v40;
  objc_super v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;

  v8 = a5;
  v9 = 60592301.5;
  var1 = a3->var1;
  v11 = fmin(a3->var0, 60592301.5);
  v12 = var1 < 0.0;
  v13 = fmin(var1, 60592301.5);
  if (!v12)
    v9 = v13;
  a3->var0 = v11;
  a3->var1 = v9;
  v44 = 0;
  v45 = 0.0;
  v46 = 0;
  -[VKScreenCameraController centerCoordinateDistanceRange](self, "centerCoordinateDistanceRange");
  if (a3->var0 != 0.0 || a3->var1 != v45 || a3->var2 != v46)
  {
    v42 = *(_OWORD *)&a3->var0;
    v43 = *(_QWORD *)&a3->var2;
    v41.receiver = self;
    v41.super_class = (Class)VKGlobeCameraController;
    -[VKScreenCameraController setCenterCoordinateDistanceRange:duration:timingFunction:](&v41, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v42, v8, a4);
    v14 = fmax(a3->var0, 0.0);
    a3->var0 = v14;
    v15 = *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
    if (v15 >= v14
      && (v16 = a3->var1,
          -[VKGlobeCameraController distanceFromCenterCoordinate](self, "distanceFromCenterCoordinate"),
          v16 >= v17))
    {
      globeView = (char *)self->_globeView;
      v25 = *(_OWORD *)&a3->var0;
      *((_QWORD *)globeView + 51) = *(_QWORD *)&a3->var2;
      *(_OWORD *)(globeView + 392) = v25;
    }
    else if (a4 <= 0.0)
    {
      v22 = (char *)self->_globeView;
      v23 = *(_OWORD *)&a3->var0;
      *((_QWORD *)v22 + 51) = *(_QWORD *)&a3->var2;
      *(_OWORD *)(v22 + 392) = v23;
      -[VKGlobeCameraController centerCoordinate](self, "centerCoordinate");
      -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", VKAnimationCurveEaseInOut, &__block_literal_global_25643);
    }
    else
    {
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      v40 = v18;
      v19 = self->_globeView;
      v20 = v19[9];
      if (v20)
      {
        v21 = *(_OWORD *)(v20 + 8);
        v39 = *(_QWORD *)(v20 + 24);
        v38 = v21;
      }
      else
      {
        v38 = 0uLL;
        v39 = 0;
      }
      v36 = 0uLL;
      v37 = 0;
      altitude::GlobeView::getCoordAtScreenPosition((uint64_t)v19, (int *)&v40, (double *)&v38, (uint64_t)&v36, 0);
      self->_cameraManager._tiltLimitPushDownEnabled = 0;
      v26 = MEMORY[0x1E0C809B0];
      self->_cameraManager._tiltLimitPushDown = 0;
      v30[0] = v26;
      v30[1] = 3321888768;
      v30[2] = __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
      v30[3] = &unk_1E42EA068;
      v31 = *(_OWORD *)&a3->var0;
      v32 = *(_QWORD *)&a3->var2;
      v33 = v15;
      v30[4] = self;
      v34 = v36;
      v35 = v37;
      v27[0] = v26;
      v27[1] = 3221225472;
      v27[2] = __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_19;
      v27[3] = &unk_1E42F4D48;
      v27[4] = self;
      v28 = *(_OWORD *)&a3->var0;
      v29 = *(_QWORD *)&a3->var2;
      -[VKGlobeCameraController animateRegionWithDuration:timingFunction:cursor:stepHandler:completionHandler:](self, "animateRegionWithDuration:timingFunction:cursor:stepHandler:completionHandler:", v8, v18, v30, v27, a4);
    }
  }

}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 cursor:()Matrix<int stepHandler:()2 completionHandler:(1>)a5
{
  id v11;
  id v12;
  id v13;
  VKTimedAnimation *regionAnimation;
  VKTimedAnimation *v15;
  VKTimedAnimation *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation)
    -[VKAnimation stop](regionAnimation, "stop");
  v15 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a3);
  v16 = self->super._regionAnimation;
  self->super._regionAnimation = v15;

  if (v11)
    v17 = v11;
  else
    v17 = VKAnimationCurveEaseInOut;
  -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v17);
  -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v12);
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__VKGlobeCameraController_animateRegionWithDuration_timingFunction_cursor_stepHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E42F9D20;
  objc_copyWeak(&v21, &location);
  v18 = v13;
  v20 = v18;
  -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v19);
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

  objc_destroyWeak(&v21);
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
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  char v20;
  Matrix<double, 2, 1> v21;
  Matrix<double, 2, 1> v22;
  Matrix<double, 2, 1> v23;
  Matrix<double, 2, 1> v24;
  Matrix<double, 2, 1> v25;
  Matrix<double, 2, 1> v26;
  void *v27;
  Matrix<double, 2, 1> v28;
  Matrix<double, 2, 1> v29;
  Matrix<double, 2, 1> v30;
  Matrix<double, 2, 1> v31;
  Matrix<double, 2, 1> v32;
  Matrix<double, 2, 1> v33;
  objc_super v34;

  v8 = a3;
  v9 = a5;
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)VKGlobeCameraController;
    -[VKScreenCameraController setRegionRestriction:duration:timingFunction:](&v34, sel_setRegionRestriction_duration_timingFunction_, v8, v9, a4);
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
      self->_cameraManager._singleRestriction._minimum._e[0] = 1.79769313e308;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._singleRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_19FFB2E00;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._singleRestriction._maximum + 8) = (Matrix<double, 2, 1>)xmmword_19FFB5950;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._westOfDatelineRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_19FFB2E00;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._westOfDatelineRestriction._maximum + 8) = (Matrix<double, 2, 1>)xmmword_19FFB5950;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._eastOfDatelineRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_19FFB2E00;
      self->_cameraManager._eastOfDatelineRestriction._maximum._e[1] = -1.79769313e308;
    }
    else
    {
      -[VKGlobeCameraController centerCoordinate](self, "centerCoordinate");
      v15 = v14;
      v17 = v16;
      -[VKScreenCameraController regionRestriction](self, "regionRestriction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsCoordinate:", v15, v17);

      if (a4 <= 0.0)
        v20 = 1;
      else
        v20 = v19;
      if ((v20 & 1) != 0)
      {
        objc_msgSend(v8, "radianSingleRect:westOfDatelineRect:eastOfDatelineRect:", &v32, &v30, &v28);
        if (v19)
        {
          v21 = v33;
          self->_cameraManager._singleRestriction._minimum = v32;
          self->_cameraManager._singleRestriction._maximum = v21;
          v22 = v31;
          self->_cameraManager._westOfDatelineRestriction._minimum = v30;
          self->_cameraManager._westOfDatelineRestriction._maximum = v22;
          v23 = v29;
          self->_cameraManager._eastOfDatelineRestriction._minimum = v28;
          self->_cameraManager._eastOfDatelineRestriction._maximum = v23;
        }
        else
        {
          -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
          v24 = v33;
          self->_cameraManager._singleRestriction._minimum = v32;
          self->_cameraManager._singleRestriction._maximum = v24;
          v25 = v31;
          self->_cameraManager._westOfDatelineRestriction._minimum = v30;
          self->_cameraManager._westOfDatelineRestriction._maximum = v25;
          v26 = v29;
          self->_cameraManager._eastOfDatelineRestriction._minimum = v28;
          self->_cameraManager._eastOfDatelineRestriction._maximum = v26;
          altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)self->_globeView, 1);
          -[VKCameraController cameraDelegate](self, "cameraDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mapLayerDidChangeVisibleRegion");

          -[VKCameraController endRegionChange](self, "endRegionChange");
        }
      }
      else
      {
        -[VKGlobeCameraController animateToRestriction:duration:timingFunction:](self, "animateToRestriction:duration:timingFunction:", v8, v9, a4);
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
  Matrix<int, 2, 1> v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[9];
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
  __int128 v38;

  v8 = a5;
  objc_msgSend(a3, "radianSingleRect:westOfDatelineRect:eastOfDatelineRect:", &v37, &v35, &v33);
  -[VKGlobeCameraController centerCoordinate](self, "centerCoordinate");
  v10 = v9;
  v12 = v11;
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clampedCoordinate:", v10, v12);
  v15 = v14;
  v17 = v16;

  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  *(double *)&v26[5] = v10;
  *(double *)&v26[6] = v12;
  v26[7] = v15;
  v26[8] = v17;
  v27 = v37;
  v28 = v38;
  v29 = v35;
  v30 = v36;
  v32 = v34;
  v31 = v33;
  v26[1] = 3221225472;
  v19[1] = 3221225472;
  v21 = v38;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[2] = __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke;
  v26[3] = &unk_1E42F4DB0;
  v26[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[2] = __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke_2;
  v19[3] = &unk_1E42F4DD8;
  v19[4] = self;
  v20 = v37;
  v23 = v36;
  v22 = v35;
  v25 = v34;
  v24 = v33;
  -[VKGlobeCameraController animateRegionWithDuration:timingFunction:cursor:stepHandler:completionHandler:](self, "animateRegionWithDuration:timingFunction:cursor:stepHandler:completionHandler:", v8, v18, v26, v19, a4);

}

- (void)globeView
{
  return self->_globeView;
}

- (BOOL)tourShouldResumeWhenDoneGesturing
{
  return self->_tourShouldResumeWhenDoneGesturing;
}

- (void)setTourShouldResumeWhenDoneGesturing:(BOOL)a3
{
  self->_tourShouldResumeWhenDoneGesturing = a3;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_taskContext.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = &off_1E42C4070;
  *((_WORD *)self + 144) = 0;
  *((_BYTE *)self + 290) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 46) = 0;
  *((_QWORD *)self + 47) = 0;
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 51) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_DWORD *)self + 88) = 0;
  *(_DWORD *)((char *)self + 399) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 56) = 0;
  *(_DWORD *)((char *)self + 455) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)self + 31) = _Q0;
  *((_WORD *)self + 256) = 256;
  *((_DWORD *)self + 129) = 0;
  *((_WORD *)self + 260) = 1;
  *((_BYTE *)self + 522) = 0;
  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 68) = 0xBFF0000000000000;
  *((_QWORD *)self + 73) = 0;
  *((_QWORD *)self + 74) = 0;
  *((_QWORD *)self + 72) = 0;
  *(_OWORD *)((char *)self + 600) = xmmword_19FFB5940;
  *(_OWORD *)((char *)self + 616) = xmmword_19FFB2E00;
  *(_OWORD *)((char *)self + 632) = xmmword_19FFB5950;
  *(_OWORD *)((char *)self + 648) = xmmword_19FFB2E00;
  *(_OWORD *)((char *)self + 664) = xmmword_19FFB5950;
  *(_OWORD *)((char *)self + 680) = xmmword_19FFB2E00;
  *((_QWORD *)self + 87) = 0xFFEFFFFFFFFFFFFFLL;
  *((_QWORD *)self + 99) = 0;
  *((_QWORD *)self + 100) = 0;
  return self;
}

void __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke(uint64_t a1, float a2)
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
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;

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
  v52 = *(double *)(a1 + 112);
  v53 = *(double *)(a1 + 104);
  v54 = *(double *)(a1 + 160);
  v55 = *(double *)(a1 + 152);
  v58 = *(double *)(a1 + 80);
  v59 = *(double *)(a1 + 96);
  v56 = *(double *)(a1 + 136);
  v57 = *(double *)(a1 + 144);
  v61 = *(double *)(a1 + 72);
  v62 = *(double *)(a1 + 88);
  v28 = v13 + -6.28318531;
  v29 = fmod(v15 - (v13 + -6.28318531), 6.28318531);
  v60 = fabs(fmod(v29 + 6.28318531, 6.28318531) + -3.14159265);
  v30 = v62 - v28;
  v17 = v62;
  v31 = fmod(v30, 6.28318531);
  v32 = fmod(v31 + 6.28318531, 6.28318531);
  v15 = v61;
  v33 = fabs(v32 + -3.14159265);
  if (v60 <= v33 && v61 < v14)
  {
    v22 = v59;
    v23 = fmin(v8, v58);
    if (v8 <= v59)
    {
      v25 = v62;
      v15 = 1.79769313e308;
      v24 = -3.14159265;
      v26 = v59;
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
      v25 = v62;
      v26 = v8;
      v19 = v14;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v8;
      v16 = 1.79769313e308;
    }
    v17 = -1.79769313e308;
  }
  else
  {
    v35 = v60 > v33 && v14 < v62;
    v24 = v56;
    v23 = v57;
    v16 = v58;
    v18 = v59;
    v26 = v54;
    v25 = v55;
    v20 = v52;
    v19 = v53;
    if (!v35)
    {
LABEL_15:
      v15 = fmin(v14, v15);
      v17 = fmax(v17, v14);
      v16 = fmin(v8, v16);
      v18 = fmax(v18, v8);
      goto LABEL_46;
    }
    v23 = fmin(v8, v58);
    v17 = -1.79769313e308;
    v16 = 1.79769313e308;
    v24 = -3.14159265;
    v25 = v14;
    if (v8 <= v59)
    {
      v26 = v59;
      v19 = v61;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v59;
    }
    else
    {
      v26 = v8;
      v19 = v61;
      v20 = v23;
      v21 = 3.14159265;
      v22 = v8;
    }
    v15 = 1.79769313e308;
    v18 = -1.79769313e308;
  }
LABEL_46:
  v51 = (double *)(*(_QWORD *)(a1 + 32) + 280);
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
  altitude::CameraManager::update((altitude::CameraManager *)(*(_QWORD *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(_QWORD *)(a1 + 32) + 272), 1);
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "mapLayerDidChangeVisibleRegion");

}

uint64_t __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  void *v11;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "beginRegionChange:", 0);
    v3 = (_OWORD *)(*(_QWORD *)(v2 + 32) + 608);
    v4 = *(_OWORD *)(v2 + 56);
    v5 = (_OWORD *)(*(_QWORD *)(v2 + 32) + 640);
    v6 = *(_OWORD *)(v2 + 72);
    v7 = *(_OWORD *)(v2 + 88);
    v8 = (_OWORD *)(*(_QWORD *)(v2 + 32) + 672);
    v9 = *(_OWORD *)(v2 + 104);
    v10 = *(_OWORD *)(v2 + 120);
    *v3 = *(_OWORD *)(v2 + 40);
    v3[1] = v4;
    *v5 = v6;
    v5[1] = v7;
    *v8 = v9;
    v8[1] = v10;
    altitude::CameraManager::update((altitude::CameraManager *)(*(_QWORD *)(v2 + 32) + 280), *(altitude::GlobeView **)(*(_QWORD *)(v2 + 32) + 272), 1);
    objc_msgSend(*(id *)(v2 + 32), "cameraDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerDidChangeVisibleRegion");

    return objc_msgSend(*(id *)(v2 + 32), "endRegionChange");
  }
  return result;
}

void __105__VKGlobeCameraController_animateRegionWithDuration_timingFunction_cursor_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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

void __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  uint64_t v3;
  const double *v4;
  uint64_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v27;
  uint64_t v28;
  float64x2_t v29;
  uint64_t v30;
  void *v31;
  float64x2_t v32;
  uint64_t v33;
  uint64_t v34;
  float64x2_t v35;
  uint64_t v36;
  char v37;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = (const double *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  v6 = vld1q_dup_f64(v4);
  v7 = vmlaq_n_f64(v6, vsubq_f64(*(float64x2_t *)(a1 + 40), v6), a2);
  *(float64x2_t *)(v5 + 392) = v7;
  *(_QWORD *)(v5 + 408) = v3;
  v8 = fmax(*(double *)(a1 + 64), v7.f64[0]);
  v9 = v7.f64[1];
  v35 = *(float64x2_t *)(a1 + 72);
  v36 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  *(_BYTE *)(v10 + 160) = 0;
  v11 = *(_QWORD *)(v10 + 72);
  v12 = v36;
  *(float64x2_t *)(v11 + 8) = v35;
  *(_QWORD *)(v11 + 24) = v12;
  ++*(_DWORD *)(v10 + 376);
  v13 = **(_QWORD **)(*(_QWORD *)(v10 + 856) + 88);
  if (v13)
  {
    LOBYTE(v32.f64[0]) = 7;
    md::MapEngine::setNeedsTick(v13, &v32);
  }
  v14 = fmin(v8, v9);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  if (*(_BYTE *)(v15 + 184))
  {
    v16 = fmax(altitude::GlobeView::calculateMinZoomDistance(*(altitude::GlobeView **)(*(_QWORD *)(a1 + 32) + 272)), v14);
    v17 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v15);
    v18 = *(unsigned __int8 *)(v15 + 184);
    v19 = *(_QWORD *)(v15 + 72);
    *(double *)(v19 + 32) = fmin(v16, fmax(fmin(*(double *)(v15 + 400), 60592301.5), v17));
    if (v18)
      *(double *)(v19 + 40) = fmax(*(double *)(v19 + 40), 0.0);
  }
  else
  {
    *(double *)(*(_QWORD *)(v15 + 72) + 32) = v14;
  }
  ++*(_DWORD *)(v15 + 376);
  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "centerScreenPoint");
  v21 = objc_msgSend(v20, "cursorFromScreenPoint:");
  v33 = 0;
  v34 = v21;
  v32 = 0uLL;
  altitude::GlobeView::getCoordAtScreenPosition(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), (int *)&v34, v35.f64, (uint64_t)&v32, 0);
  __asm { FMOV            V2.2D, #-2.0 }
  v35 = vnegq_f64(vmlaq_f64(v32, _Q2, v35));
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  *(_BYTE *)(v27 + 160) = 0;
  v28 = *(_QWORD *)(v27 + 72);
  v29 = v35;
  *(_QWORD *)(v28 + 24) = v36;
  *(float64x2_t *)(v28 + 8) = v29;
  ++*(_DWORD *)(v27 + 376);
  v30 = **(_QWORD **)(*(_QWORD *)(v27 + 856) + 88);
  if (v30)
  {
    v37 = 7;
    md::MapEngine::setNeedsTick(v30, &v37);
  }
  altitude::CameraManager::update((altitude::CameraManager *)(*(_QWORD *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(_QWORD *)(a1 + 32) + 272), 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateIsPitched");
  objc_msgSend(*(id *)(a1 + 32), "_updateCanEnter3DMode");
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mapLayerDidChangeVisibleRegion");

}

void __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  v3 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v2 + 408) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 392) = v3;
  altitude::CameraManager::update((altitude::CameraManager *)(*(_QWORD *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(_QWORD *)(a1 + 32) + 272), 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
}

void __88__VKGlobeCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  md::AnimationData *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  __int16 v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  unint64_t v33;
  char *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  __int128 v43;
  char *v44;
  __int128 v45;
  char *v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char *v52;
  int v53;
  double v54;
  _OWORD *v55;
  int v56;
  __int128 v57;
  char *v58;
  __int128 v59;
  char *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  __int128 v68;
  char *v69;
  __int128 v70;
  char *v71;
  char *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  double *v77;
  double *v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  __int128 v83;
  _BYTE *v84;
  _BYTE *v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  __int128 v90;
  _BYTE *v91;
  _BYTE *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  __int128 v97;
  _BYTE *v98;
  _BYTE *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  __int128 *v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  double v112;
  unint64_t v113;
  int v114;
  char *v115;
  float v116;
  __int128 v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  __double2 v124;
  double v125;
  double v126;
  __double2 v127;
  double v128;
  unint64_t v129;
  double *v130;
  _QWORD *v131;
  unint64_t v132;
  double *v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  double v138;
  uint64_t v139;
  char *v140;
  double *v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  char *v146;
  double *v147;
  __int128 v148;
  __int128 v149;
  double *v150;
  double *v151;
  double v152;
  double v153;
  double v154;
  unint64_t v155;
  double *v156;
  double v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  char *v161;
  double *v162;
  double *v163;
  __int128 v164;
  char *v165;
  unint64_t v166;
  _QWORD *v167;
  __int128 v168;
  _QWORD *v169;
  _QWORD *v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  char *v174;
  char *v175;
  char *v176;
  unint64_t v177;
  double *v178;
  double *v179;
  double *v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t v184;
  _BYTE *v185;
  double *v186;
  unint64_t v187;
  uint64_t v188;
  _OWORD *v189;
  double *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  int v194;
  void *v195;
  void *v196;
  _QWORD *v197;
  id v198;
  char *v199;
  double *v200;
  double *v201;
  double v202;
  double v203;
  void *v204;
  char **v205;
  unint64_t v206;
  unint64_t v207;
  void **v208;
  uint64_t v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  uint64_t v214;
  __int128 v215;
  void **v216;
  unint64_t v217;
  float v218;
  unsigned int v219;
  float v220;
  unint64_t v221;
  float v222;
  unint64_t v223;
  char *v224;
  void *v225;
  void *v226;
  _BYTE *v227;
  _QWORD *v228;
  std::string *v229;
  __int128 v230;
  char *v231;
  char *v232;
  uint64_t v233;
  unint64_t v234;
  char *v235;
  _QWORD *v236;
  uint64_t v237;
  uint64_t v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  _QWORD *v242;
  uint64_t v243;
  void *v244;
  _QWORD *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  void *v251;
  id v252;
  void *v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void **v258;
  void *v259;
  float v260;
  float v261;
  uint64_t v262;
  double v263;
  double v264;
  char *__p;
  id v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  uint64_t v270;
  uint64_t (**v271)();
  void *v272;
  id v273;
  uint64_t (**v274)();
  void *v275;
  uint64_t (**v276)();
  uint64_t v277;
  uint64_t (**v278)();
  uint64_t v279;
  _QWORD v280[3];
  _QWORD *v281;
  _QWORD v282[3];
  _QWORD *v283;
  _OWORD v284[2];
  __int128 v285;
  __int128 v286;
  __int128 v287;
  uint64_t v288;
  uint64_t v289;

  v2 = a1;
  v289 = *MEMORY[0x1E0C80C00];
  v3 = *(void (***)(_QWORD, _QWORD))(a1 + 48);
  if (!a2)
  {
    if (v3)
      v3[2](v3, 3);
    goto LABEL_332;
  }
  v4 = objc_msgSend(v3, "copy");
  v278 = &off_1E42B55B0;
  v279 = MEMORY[0x1A1AF5730]();
  v253 = (void *)v4;
  v5 = objc_msgSend(*(id *)(v2 + 56), "copy");
  v276 = &off_1E42B55D0;
  v277 = MEMORY[0x1A1AF5730]();
  v254 = (void *)v5;
  objc_msgSend(*(id *)(v2 + 32), "beginRegionChange:", 1);
  v256 = v2;
  v257 = *(_QWORD *)(v2 + 64);
  v6 = *(void **)(v2 + 40);
  v273 = *(id *)(v2 + 32);
  geo::_retain_ptr<void({block_pointer} {__strong})(NSString *),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v274, (uint64_t)&v276);
  v283 = 0;
  v7 = operator new(0x28uLL);
  *v7 = &off_1E42D94D0;
  v7[1] = v273;
  v7[2] = &off_1E42B55D0;
  v7[3] = MEMORY[0x1A1AF5730](v275);
  v8 = v275;
  v275 = 0;

  v283 = v7;
  v266 = *(id *)(v2 + 32);
  v267 = *(_OWORD *)(v2 + 72);
  v268 = *(_OWORD *)(v2 + 88);
  v269 = *(_OWORD *)(v2 + 104);
  v270 = *(_QWORD *)(v2 + 120);
  geo::_retain_ptr<void({block_pointer} {__strong})(VKFlyoverTourState),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v271, (uint64_t)&v278);
  v281 = 0;
  v9 = operator new(0x60uLL);
  *v9 = &off_1E42D9518;
  v9[1] = v266;
  *((_OWORD *)v9 + 1) = v267;
  *((_OWORD *)v9 + 2) = v268;
  *((_OWORD *)v9 + 3) = v269;
  v9[8] = v270;
  v9[9] = &off_1E42B55B0;
  v9[10] = MEMORY[0x1A1AF5730](v272);
  v10 = v272;
  v272 = 0;

  v281 = v9;
  v11 = v6;
  if (*(_DWORD *)(v257 + 116) == 2)
    goto LABEL_26;
  *(_DWORD *)(v257 + 116) = 2;
  v12 = *(_QWORD *)(v257 + 184);
  if (v12)
    *(_QWORD *)(v12 + 264) = 0;
  v13 = *(_QWORD *)(v257 + 144);
  if (!v13)
    goto LABEL_26;
  v14 = *(_QWORD *)(v257 + 80);
  if (v14)
  {
    v15 = *(_QWORD *)(v14 + 8);
    if (v15)
      v16 = *(double *)(v15 + 144);
    else
      v16 = 0.0;
    if (v16 > *(float *)(v257 + 88))
      v17 = 3;
    else
      v17 = 5;
  }
  else
  {
    v17 = 5;
  }
  LODWORD(v284[0]) = v17;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v13 + 48))(v13, v284);
  v18 = *(_QWORD **)(v257 + 144);
  *(_QWORD *)(v257 + 144) = 0;
  if (v18 == (_QWORD *)(v257 + 120))
  {
    v19 = 4;
    v18 = (_QWORD *)(v257 + 120);
    goto LABEL_20;
  }
  if (v18)
  {
    v19 = 5;
LABEL_20:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  v20 = *(_QWORD **)(v257 + 176);
  *(_QWORD *)(v257 + 176) = 0;
  if (v20 == (_QWORD *)(v257 + 152))
  {
    v21 = 4;
    v20 = (_QWORD *)(v257 + 152);
  }
  else
  {
    if (!v20)
      goto LABEL_26;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_26:
  v22 = *(_QWORD *)(v257 + 80);
  if (v22)
  {
    v23 = *(md::AnimationData **)(v22 + 8);
    if (v23)
    {
      md::AnimationData::~AnimationData(v23);
      MEMORY[0x1A1AF4E00]();
    }

    MEMORY[0x1A1AF4E00](v22, 0x10E0C402FD04164);
    *(_QWORD *)(v257 + 80) = 0;
  }
  if (!v11)
  {
    LODWORD(v284[0]) = 6;
    if (v281)
    {
      (*(void (**)(_QWORD *, _OWORD *))(*v281 + 48))(v281, v284);
      goto LABEL_311;
    }
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  v24 = operator new();
  v250 = v11;
  v252 = v11;
  *(_QWORD *)(v24 + 8) = 0;
  *(_QWORD *)(v24 + 16) = 0;
  *(_QWORD *)v24 = 0;
  *(_DWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 32) = 0;
  *(_DWORD *)(v24 + 39) = 0;
  v255 = v24;
  objc_storeStrong((id *)v24, v6);
  v25 = operator new();
  v26 = *(id *)v24;
  *(_OWORD *)(v25 + 96) = 0u;
  v258 = (void **)(v25 + 96);
  *(_OWORD *)v25 = 0u;
  *(_OWORD *)(v25 + 16) = 0u;
  *(_OWORD *)(v25 + 32) = 0u;
  *(_OWORD *)(v25 + 48) = 0u;
  *(_OWORD *)(v25 + 64) = 0u;
  *(_OWORD *)(v25 + 80) = 0u;
  *(_OWORD *)(v25 + 112) = 0u;
  *(_OWORD *)(v25 + 128) = 0u;
  *(_QWORD *)(v25 + 144) = 0;
  v259 = v26;
  *(_BYTE *)(v25 + 152) = objc_msgSend(v26, "useSplines");
  v27 = objc_msgSend(v26, "cameraPathsCount");
  v28 = v27;
  if (!v27)
  {
    __p = 0;
    goto LABEL_95;
  }
  if (v27 != 1)
  {
    if (v27 > 0x2E8BA2E8BA2E8BALL)
      abort();
    v30 = (char *)operator new(88 * v27);
    v31 = 0;
    v32 = 0;
    v33 = v28;
    v34 = &v30[88 * v28];
    __p = v30;
    v35 = v259;
    while (1)
    {
      if (v35)
      {
        objc_msgSend(v35, "cameraPathAtIndex:", v31);
        if (v30 >= v34)
          goto LABEL_47;
      }
      else
      {
        v288 = 0;
        v286 = 0u;
        v287 = 0u;
        v285 = 0u;
        memset(v284, 0, sizeof(v284));
        if (v30 >= v34)
        {
LABEL_47:
          v40 = 0x2E8BA2E8BA2E8BA3 * ((v30 - __p) >> 3) + 1;
          if (v40 > 0x2E8BA2E8BA2E8BALL)
            abort();
          if (0x5D1745D1745D1746 * ((v34 - __p) >> 3) > v40)
            v40 = 0x5D1745D1745D1746 * ((v34 - __p) >> 3);
          if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v34 - __p) >> 3)) >= 0x1745D1745D1745DLL)
            v41 = 0x2E8BA2E8BA2E8BALL;
          else
            v41 = v40;
          if (v41)
          {
            if (v41 > 0x2E8BA2E8BA2E8BALL)
LABEL_333:
              std::__throw_bad_array_new_length[abi:nn180100]();
            v42 = (char *)operator new(88 * v41);
          }
          else
          {
            v42 = 0;
          }
          v43 = v286;
          v44 = &v42[8 * ((v30 - __p) >> 3)];
          *((_OWORD *)v44 + 2) = v285;
          *((_OWORD *)v44 + 3) = v43;
          *((_OWORD *)v44 + 4) = v287;
          *((_QWORD *)v44 + 10) = v288;
          v45 = v284[1];
          *(_OWORD *)v44 = v284[0];
          *((_OWORD *)v44 + 1) = v45;
          if (v30 == __p)
          {
            v52 = &v42[8 * ((v30 - __p) >> 3)];
            v47 = __p;
          }
          else
          {
            v46 = &v42[8 * ((v30 - __p) >> 3)];
            v47 = __p;
            do
            {
              v48 = *(_OWORD *)(v30 - 88);
              *(_OWORD *)(v46 - 72) = *(_OWORD *)(v30 - 72);
              *(_OWORD *)(v46 - 88) = v48;
              v49 = *(_OWORD *)(v30 - 56);
              v50 = *(_OWORD *)(v30 - 40);
              v51 = *(_OWORD *)(v30 - 24);
              v52 = v46 - 88;
              *((_QWORD *)v46 - 1) = *((_QWORD *)v30 - 1);
              *(_OWORD *)(v46 - 24) = v51;
              *(_OWORD *)(v46 - 40) = v50;
              *(_OWORD *)(v46 - 56) = v49;
              v30 -= 88;
              v46 -= 88;
            }
            while (v30 != __p);
          }
          v34 = &v42[88 * v41];
          v30 = v44 + 88;
          if (v47)
            operator delete(v47);
          __p = v52;
          v35 = v259;
          goto LABEL_42;
        }
      }
      v36 = v284[1];
      *(_OWORD *)v30 = v284[0];
      *((_OWORD *)v30 + 1) = v36;
      v37 = v285;
      v38 = v286;
      v39 = v287;
      *((_QWORD *)v30 + 10) = v288;
      *((_OWORD *)v30 + 3) = v38;
      *((_OWORD *)v30 + 4) = v39;
      *((_OWORD *)v30 + 2) = v37;
      v30 += 88;
LABEL_42:
      v31 = ++v32;
      if (v33 <= v32)
      {
        v28 = v33;
        goto LABEL_95;
      }
    }
  }
  v288 = 0;
  v286 = 0u;
  v287 = 0u;
  v285 = 0u;
  memset(v284, 0, sizeof(v284));
  if (v26)
  {
    objc_msgSend(v26, "cameraPathAtIndex:", 0);
    v29 = v288;
    if ((v288 & 1) != 0)
      goto LABEL_68;
  }
  else
  {
    v29 = 0;
  }
  v29 |= 1u;
  LOWORD(v288) = v29;
  LODWORD(v284[0]) = 0;
LABEL_68:
  if ((v29 & 2) == 0)
  {
    LOWORD(v288) = v29 | 2;
    DWORD1(v284[0]) = 1065353216;
  }
  v53 = _AXSReduceMotionEnabled();
  v54 = 30.0;
  if (!v53)
    v54 = 15.0;
  *((double *)&v286 + 1) = v54;
  v55 = operator new(0x318uLL);
  v56 = 0;
  v57 = v286;
  v58 = (char *)v55 + 792;
  v55[2] = v285;
  v55[3] = v57;
  v55[4] = v287;
  *((_QWORD *)v55 + 10) = v288;
  v59 = v284[1];
  v60 = (char *)v55 + 88;
  *v55 = v284[0];
  v55[1] = v59;
  __p = (char *)v55;
  do
  {
    *(double *)&v286 = *(double *)&v286 + 1.57079633;
    if (v60 < v58)
    {
      v61 = v284[1];
      *(_OWORD *)v60 = v284[0];
      *((_OWORD *)v60 + 1) = v61;
      v62 = v285;
      v63 = v286;
      v64 = v287;
      *((_QWORD *)v60 + 10) = v288;
      *((_OWORD *)v60 + 3) = v63;
      *((_OWORD *)v60 + 4) = v64;
      *((_OWORD *)v60 + 2) = v62;
      v60 += 88;
      goto LABEL_74;
    }
    v65 = 0x2E8BA2E8BA2E8BA3 * ((v60 - __p) >> 3) + 1;
    if (v65 > 0x2E8BA2E8BA2E8BALL)
      abort();
    if (0x5D1745D1745D1746 * ((v58 - __p) >> 3) > v65)
      v65 = 0x5D1745D1745D1746 * ((v58 - __p) >> 3);
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v58 - __p) >> 3)) >= 0x1745D1745D1745DLL)
      v66 = 0x2E8BA2E8BA2E8BALL;
    else
      v66 = v65;
    if (v66)
    {
      if (v66 > 0x2E8BA2E8BA2E8BALL)
        goto LABEL_333;
      v67 = (char *)operator new(88 * v66);
    }
    else
    {
      v67 = 0;
    }
    v68 = v286;
    v69 = &v67[8 * ((v60 - __p) >> 3)];
    v58 = &v67[88 * v66];
    *((_OWORD *)v69 + 2) = v285;
    *((_OWORD *)v69 + 3) = v68;
    *((_OWORD *)v69 + 4) = v287;
    *((_QWORD *)v69 + 10) = v288;
    v70 = v284[1];
    *(_OWORD *)v69 = v284[0];
    *((_OWORD *)v69 + 1) = v70;
    v71 = v69 + 88;
    if (v60 == __p)
    {
      v72 = __p;
    }
    else
    {
      v72 = __p;
      do
      {
        v73 = *(_OWORD *)(v60 - 88);
        *(_OWORD *)(v69 - 72) = *(_OWORD *)(v60 - 72);
        *(_OWORD *)(v69 - 88) = v73;
        v74 = *(_OWORD *)(v60 - 56);
        v75 = *(_OWORD *)(v60 - 40);
        v76 = *(_OWORD *)(v60 - 24);
        *((_QWORD *)v69 - 1) = *((_QWORD *)v60 - 1);
        *(_OWORD *)(v69 - 24) = v76;
        *(_OWORD *)(v69 - 40) = v75;
        *(_OWORD *)(v69 - 56) = v74;
        v69 -= 88;
        v60 -= 88;
      }
      while (v60 != __p);
      if (!__p)
        goto LABEL_93;
    }
    operator delete(v72);
LABEL_93:
    __p = v69;
    v60 = v71;
LABEL_74:
    ++v56;
  }
  while (v56 != 8);
  v28 = 0x2E8BA2E8BA2E8BA3 * ((v60 - __p) >> 3);
LABEL_95:
  v77 = *(double **)v25;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v25 + 16) - *(_QWORD *)v25) >> 3) < v28)
  {
    v78 = *(double **)(v25 + 8);
    v79 = (char *)operator new(24 * v28);
    v80 = &v79[24 * (((char *)v78 - (char *)v77) / 24)];
    v81 = v80;
    if (v78 != v77)
    {
      v82 = &v79[24 * (((char *)v78 - (char *)v77) / 24)];
      do
      {
        v81 = v82 - 24;
        v83 = *(_OWORD *)(v78 - 3);
        *((double *)v82 - 1) = *(v78 - 1);
        *(_OWORD *)(v82 - 24) = v83;
        v78 -= 3;
        v82 -= 24;
      }
      while (v78 != v77);
    }
    *(_QWORD *)v25 = v81;
    *(_QWORD *)(v25 + 8) = v80;
    *(_QWORD *)(v25 + 16) = &v79[24 * v28];
    if (v77)
      operator delete(v77);
  }
  v84 = *(_BYTE **)(v25 + 24);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v25 + 40) - (_QWORD)v84) >> 3) < v28)
  {
    v85 = *(_BYTE **)(v25 + 32);
    v86 = (char *)operator new(24 * v28);
    v87 = &v86[24 * ((v85 - v84) / 24)];
    v88 = v87;
    if (v85 != v84)
    {
      v89 = &v86[24 * ((v85 - v84) / 24)];
      do
      {
        v88 = v89 - 24;
        v90 = *(_OWORD *)(v85 - 24);
        *((_QWORD *)v89 - 1) = *((_QWORD *)v85 - 1);
        *(_OWORD *)(v89 - 24) = v90;
        v85 -= 24;
        v89 -= 24;
      }
      while (v85 != v84);
    }
    *(_QWORD *)(v25 + 24) = v88;
    *(_QWORD *)(v25 + 32) = v87;
    *(_QWORD *)(v25 + 40) = &v86[24 * v28];
    if (v84)
      operator delete(v84);
  }
  v91 = *(_BYTE **)(v25 + 48);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v25 + 64) - (_QWORD)v91) >> 3) < v28)
  {
    v92 = *(_BYTE **)(v25 + 56);
    v93 = (char *)operator new(24 * v28);
    v94 = &v93[24 * ((v92 - v91) / 24)];
    v95 = v94;
    if (v92 != v91)
    {
      v96 = &v93[24 * ((v92 - v91) / 24)];
      do
      {
        v95 = v96 - 24;
        v97 = *(_OWORD *)(v92 - 24);
        *((_QWORD *)v96 - 1) = *((_QWORD *)v92 - 1);
        *(_OWORD *)(v96 - 24) = v97;
        v92 -= 24;
        v96 -= 24;
      }
      while (v92 != v91);
    }
    *(_QWORD *)(v25 + 48) = v95;
    *(_QWORD *)(v25 + 56) = v94;
    *(_QWORD *)(v25 + 64) = &v93[24 * v28];
    if (v91)
      operator delete(v91);
  }
  v98 = *(_BYTE **)(v25 + 72);
  if (v28 > (unint64_t)((uint64_t)(*(_QWORD *)(v25 + 88) - (_QWORD)v98) >> 3))
  {
    v99 = *(_BYTE **)(v25 + 80);
    v100 = (char *)operator new(8 * v28);
    v101 = v99 - v98;
    v102 = &v100[(v99 - v98) & 0xFFFFFFFFFFFFFFF8];
    v103 = v102;
    if (v99 != v98)
    {
      v104 = v99 - v98 - 8;
      if (v104 < 0x58)
      {
        v103 = &v100[(v99 - v98) & 0xFFFFFFFFFFFFFFF8];
        goto LABEL_121;
      }
      v103 = &v100[(v99 - v98) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(v99 - &v100[v101 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
        goto LABEL_346;
      v105 = v101 >> 3;
      v106 = (v104 >> 3) + 1;
      v107 = &v100[8 * v105 - 16];
      v108 = (__int128 *)(v99 - 16);
      v109 = v106 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v110 = *v108;
        *((_OWORD *)v107 - 1) = *(v108 - 1);
        *(_OWORD *)v107 = v110;
        v107 -= 32;
        v108 -= 2;
        v109 -= 4;
      }
      while (v109);
      v103 = &v102[-8 * (v106 & 0x3FFFFFFFFFFFFFFCLL)];
      v99 -= 8 * (v106 & 0x3FFFFFFFFFFFFFFCLL);
      if (v106 != (v106 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_346:
        do
        {
LABEL_121:
          v111 = *((_QWORD *)v99 - 1);
          v99 -= 8;
          *((_QWORD *)v103 - 1) = v111;
          v103 -= 8;
        }
        while (v99 != v98);
      }
    }
    *(_QWORD *)(v25 + 72) = v103;
    *(_QWORD *)(v25 + 80) = v102;
    *(_QWORD *)(v25 + 88) = &v100[8 * v28];
    if (v98)
      operator delete(v98);
  }
  std::vector<geo::_retain_ptr<CAMediaTimingFunction * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::reserve((uint64_t)v258, v28);
  if (v28)
  {
    v113 = 0;
    v114 = 0;
    do
    {
      v115 = &__p[88 * v113];
      v116 = *((float *)v115 + 1);
      *(_QWORD *)&v117 = *((_QWORD *)v115 + 2);
      v118 = *((double *)v115 + 3);
      v120 = *((double *)v115 + 4);
      v119 = *((double *)v115 + 5);
      v121 = *((double *)v115 + 6);
      v263 = v119;
      v264 = *((double *)v115 + 7);
      v122 = *((double *)v115 + 8);
      v262 = *((_QWORD *)v115 + 9);
      if (*(_BYTE *)(v25 + 152))
      {
        v260 = *((float *)v115 + 1);
        v123 = *((double *)v115 + 2);
        v124 = __sincos_stret(v118);
        v125 = 6378137.0 / sqrt(v124.__sinval * v124.__sinval * -0.00669437999 + 1.0);
        v126 = (v125 + v123) * v124.__cosval;
        v127 = __sincos_stret(v120);
        v119 = v126 * v127.__cosval;
        *(double *)&v117 = v126 * v127.__sinval;
        v128 = (v123 + v125 * 0.99330562) * v124.__sinval;
        v130 = *(double **)(v25 + 8);
        v129 = *(_QWORD *)(v25 + 16);
        if ((unint64_t)v130 >= v129)
        {
          v133 = *(double **)v25;
          v134 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v130 - *(_QWORD *)v25) >> 3);
          v135 = v134 + 1;
          if (v134 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v136 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v129 - (_QWORD)v133) >> 3);
          if (2 * v136 > v135)
            v135 = 2 * v136;
          if (v136 >= 0x555555555555555)
            v137 = 0xAAAAAAAAAAAAAAALL;
          else
            v137 = v135;
          v116 = v260;
          if (v137)
          {
            if (v137 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_333;
            v138 = v119;
            v139 = v117;
            v140 = (char *)operator new(24 * v137);
            *(_QWORD *)&v117 = v139;
            v119 = v138;
            v116 = v260;
            v128 = (v123 + v125 * 0.99330562) * v124.__sinval;
          }
          else
          {
            v140 = 0;
          }
          v146 = &v140[24 * v134];
          *(double *)v146 = v119;
          *((_QWORD *)v146 + 1) = v117;
          *((double *)v146 + 2) = v128;
          v147 = (double *)v146;
          if (v130 != v133)
          {
            do
            {
              v148 = *(_OWORD *)(v130 - 3);
              *(v147 - 1) = *(v130 - 1);
              *(_OWORD *)(v147 - 3) = v148;
              v147 -= 3;
              v130 -= 3;
            }
            while (v130 != v133);
            goto LABEL_157;
          }
          goto LABEL_158;
        }
        *v130 = v119;
        *((_QWORD *)v130 + 1) = v117;
        v131 = v130 + 3;
        v130[2] = v128;
        v116 = v260;
      }
      else
      {
        v130 = *(double **)(v25 + 8);
        v132 = *(_QWORD *)(v25 + 16);
        if ((unint64_t)v130 >= v132)
        {
          v141 = *(double **)v25;
          v142 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v130 - *(_QWORD *)v25) >> 3);
          v143 = v142 + 1;
          if (v142 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v144 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v132 - (_QWORD)v141) >> 3);
          if (2 * v144 > v143)
            v143 = 2 * v144;
          if (v144 >= 0x555555555555555)
            v137 = 0xAAAAAAAAAAAAAAALL;
          else
            v137 = v143;
          if (v137)
          {
            v261 = v116;
            if (v137 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_333;
            v145 = v117;
            v140 = (char *)operator new(24 * v137);
            *(_QWORD *)&v117 = v145;
            v116 = v261;
          }
          else
          {
            v140 = 0;
          }
          v146 = &v140[24 * v142];
          *(double *)v146 = v118;
          *((double *)v146 + 1) = v120;
          *((_QWORD *)v146 + 2) = v117;
          v147 = (double *)v146;
          if (v130 != v141)
          {
            do
            {
              v149 = *(_OWORD *)(v130 - 3);
              *(v147 - 1) = *(v130 - 1);
              *(_OWORD *)(v147 - 3) = v149;
              v147 -= 3;
              v130 -= 3;
            }
            while (v130 != v141);
LABEL_157:
            v130 = *(double **)v25;
          }
LABEL_158:
          v131 = v146 + 24;
          *(_QWORD *)v25 = v147;
          *(_QWORD *)(v25 + 8) = v146 + 24;
          *(_QWORD *)(v25 + 16) = &v140[24 * v137];
          if (v130)
            operator delete(v130);
          goto LABEL_160;
        }
        *v130 = v118;
        v130[1] = v120;
        v131 = v130 + 3;
        *((_QWORD *)v130 + 2) = v117;
      }
LABEL_160:
      *(_QWORD *)(v25 + 8) = v131;
      v150 = *(double **)(v25 + 48);
      v151 = *(double **)(v25 + 56);
      if (v150 != v151)
      {
        v152 = *(v151 - 3);
        while (1)
        {
          v153 = v121 - v152;
          if (v121 - v152 <= 3.14159265)
            break;
          v121 = v121 + -6.28318531;
        }
        while (v153 < -3.14159265)
        {
          v121 = v121 + 6.28318531;
          v153 = v121 - v152;
        }
        v154 = *(v151 - 2);
        while (1)
        {
          *(double *)&v117 = v122 - v154;
          if (v122 - v154 <= 3.14159265)
            break;
          v122 = v122 + -6.28318531;
        }
        while (*(double *)&v117 < -3.14159265)
        {
          v122 = v122 + 6.28318531;
          *(double *)&v117 = v122 - v154;
        }
      }
      v155 = *(_QWORD *)(v25 + 64);
      if ((unint64_t)v151 >= v155)
      {
        v158 = 0xAAAAAAAAAAAAAAABLL * (v151 - v150) + 1;
        if (v158 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v159 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v155 - (_QWORD)v150) >> 3);
        if (2 * v159 > v158)
          v158 = 2 * v159;
        if (v159 >= 0x555555555555555)
          v160 = 0xAAAAAAAAAAAAAAALL;
        else
          v160 = v158;
        if (v160)
        {
          if (v160 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_333;
          v161 = (char *)operator new(24 * v160);
        }
        else
        {
          v161 = 0;
        }
        v162 = (double *)&v161[8 * (v151 - v150)];
        *v162 = v121;
        v162[1] = v122;
        v162[2] = v263;
        v163 = v162;
        if (v150 == v151)
        {
          v157 = v264;
        }
        else
        {
          v157 = v264;
          do
          {
            v164 = *(_OWORD *)(v151 - 3);
            *(v163 - 1) = *(v151 - 1);
            *(_OWORD *)(v163 - 3) = v164;
            v163 -= 3;
            v151 -= 3;
          }
          while (v151 != v150);
          v150 = *(double **)(v25 + 48);
        }
        v165 = &v161[24 * v160];
        v156 = v162 + 3;
        *(_QWORD *)(v25 + 48) = v163;
        *(_QWORD *)(v25 + 56) = v162 + 3;
        *(_QWORD *)(v25 + 64) = v165;
        if (v150)
          operator delete(v150);
      }
      else
      {
        *v151 = v121;
        v151[1] = v122;
        v156 = v151 + 3;
        v157 = v264;
        v151[2] = v263;
      }
      *(_QWORD *)(v25 + 56) = v156;
      v167 = *(_QWORD **)(v25 + 32);
      v166 = *(_QWORD *)(v25 + 40);
      if ((unint64_t)v167 >= v166)
      {
        v170 = *(_QWORD **)(v25 + 24);
        v171 = 0xAAAAAAAAAAAAAAABLL * (v167 - v170) + 1;
        if (v171 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v172 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v166 - (_QWORD)v170) >> 3);
        if (2 * v172 > v171)
          v171 = 2 * v172;
        if (v172 >= 0x555555555555555)
          v173 = 0xAAAAAAAAAAAAAAALL;
        else
          v173 = v171;
        if (v173)
        {
          if (v173 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_333;
          v174 = (char *)operator new(24 * v173);
        }
        else
        {
          v174 = 0;
        }
        v175 = &v174[8 * (v167 - v170)];
        DWORD1(v168) = HIDWORD(v262);
        *(_QWORD *)v175 = v262;
        *((_QWORD *)v175 + 1) = 0;
        *((_QWORD *)v175 + 2) = 0;
        v176 = v175;
        if (v167 != v170)
        {
          do
          {
            v168 = *(_OWORD *)(v167 - 3);
            *((_QWORD *)v176 - 1) = *(v167 - 1);
            *(_OWORD *)(v176 - 24) = v168;
            v176 -= 24;
            v167 -= 3;
          }
          while (v167 != v170);
          v167 = *(_QWORD **)(v25 + 24);
        }
        v169 = v175 + 24;
        *(_QWORD *)(v25 + 24) = v176;
        *(_QWORD *)(v25 + 32) = v175 + 24;
        *(_QWORD *)(v25 + 40) = &v174[24 * v173];
        if (v167)
          operator delete(v167);
      }
      else
      {
        DWORD1(v168) = HIDWORD(v262);
        *v167 = v262;
        v169 = v167 + 3;
        v167[1] = 0;
        v167[2] = 0;
      }
      *(_QWORD *)(v25 + 32) = v169;
      v178 = *(double **)(v25 + 80);
      v177 = *(_QWORD *)(v25 + 88);
      if ((unint64_t)v178 >= v177)
      {
        v180 = *(double **)(v25 + 72);
        v181 = v178 - v180;
        v182 = v181 + 1;
        if ((unint64_t)(v181 + 1) >> 61)
          abort();
        v183 = v177 - (_QWORD)v180;
        if (v183 >> 2 > v182)
          v182 = v183 >> 2;
        if ((unint64_t)v183 >= 0x7FFFFFFFFFFFFFF8)
          v184 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v184 = v182;
        if (v184)
        {
          if (v184 >> 61)
            goto LABEL_333;
          v185 = operator new(8 * v184);
        }
        else
        {
          v185 = 0;
        }
        v186 = (double *)&v185[8 * v181];
        *v186 = v157;
        v179 = v186 + 1;
        if (v178 != v180)
        {
          v187 = (char *)(v178 - 1) - (char *)v180;
          if (v187 < 0x58)
            goto LABEL_347;
          if ((unint64_t)((char *)v180 - v185) < 0x20)
            goto LABEL_347;
          v188 = (v187 >> 3) + 1;
          v189 = &v185[8 * v181 - 16];
          v190 = v178 - 2;
          v191 = v188 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v117 = *((_OWORD *)v190 - 1);
            v168 = *(_OWORD *)v190;
            *(v189 - 1) = v117;
            *v189 = v168;
            v189 -= 2;
            v190 -= 4;
            v191 -= 4;
          }
          while (v191);
          v186 -= v188 & 0x3FFFFFFFFFFFFFFCLL;
          v178 -= v188 & 0x3FFFFFFFFFFFFFFCLL;
          if (v188 != (v188 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_347:
            do
            {
              v192 = *((_QWORD *)v178-- - 1);
              DWORD1(v168) = HIDWORD(v192);
              *((_QWORD *)v186-- - 1) = v192;
            }
            while (v178 != v180);
          }
        }
        *(_QWORD *)(v25 + 72) = v186;
        *(_QWORD *)(v25 + 80) = v179;
        *(_QWORD *)(v25 + 88) = &v185[8 * v184];
        if (v180)
          operator delete(v180);
      }
      else
      {
        *v178 = v157;
        v179 = v178 + 1;
      }
      *(_QWORD *)(v25 + 80) = v179;
      if (v28 - 1 > v113)
      {
        *(double *)&v168 = *(double *)(v25 + 144) + v157;
        *(_QWORD *)(v25 + 144) = v168;
      }
      v113 = (v114 + 1);
      v193 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v25 + 8) - *(_QWORD *)v25) >> 3);
      if (v193 > v113)
        v194 = v114 + 1;
      else
        v194 = v193 - 1;
      *(float *)&v168 = 1.0 - v116;
      *(float *)&v119 = 1.0 - *(float *)&__p[88 * v194];
      LODWORD(v117) = 0;
      LODWORD(v112) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", *(double *)&v168, *(double *)&v117, v119, v112, v250, v252);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = v195;
      v197 = *(_QWORD **)(v25 + 104);
      if ((unint64_t)v197 >= *(_QWORD *)(v25 + 112))
      {
        v199 = std::vector<geo::_retain_ptr<CAMediaTimingFunction * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__emplace_back_slow_path<CAMediaTimingFunction * {__strong},geo::memory_management_mode const&>(v258, v195);
      }
      else
      {
        v198 = v195;
        *v197 = &off_1E42B4F30;
        v197[1] = v198;
        v199 = (char *)(v197 + 3);
      }
      *(_QWORD *)(v25 + 104) = v199;

      ++v114;
    }
    while (v28 > v113);
  }
  v200 = *(double **)(v25 + 72);
  v201 = *(double **)(v25 + 80);
  if (v200 != v201)
  {
    v202 = 0.0;
    do
    {
      v203 = *v200;
      *v200++ = v202 / *(double *)(v25 + 144);
      v202 = v203 + v202;
    }
    while (v200 != v201);
  }
  v204 = v259;
  v205 = (char **)(v25 + 120);
  v206 = objc_msgSend(v259, "labelFramesCount", v250);
  v207 = v206;
  v208 = *(void ***)(v25 + 120);
  if (v206 > (uint64_t)(*(_QWORD *)(v25 + 136) - (_QWORD)v208) >> 5)
  {
    if (v206 >> 59)
      abort();
    v209 = *(_QWORD *)(v25 + 128);
    v210 = (char *)operator new(32 * v206);
    v211 = &v210[32 * v207];
    v212 = &v210[v209 - (_QWORD)v208];
    if ((void **)v209 == v208)
    {
      *(_QWORD *)(v25 + 120) = v212;
      *(_QWORD *)(v25 + 128) = v212;
      *(_QWORD *)(v25 + 136) = v211;
    }
    else
    {
      v213 = &v210[v209 - (_QWORD)v208];
      do
      {
        v214 = *(_QWORD *)(v209 - 32);
        v209 -= 32;
        *((_QWORD *)v213 - 4) = v214;
        v213 -= 32;
        v215 = *(_OWORD *)(v209 + 8);
        *((_QWORD *)v213 + 3) = *(_QWORD *)(v209 + 24);
        *(_OWORD *)(v213 + 8) = v215;
        *(_QWORD *)(v209 + 16) = 0;
        *(_QWORD *)(v209 + 24) = 0;
        *(_QWORD *)(v209 + 8) = 0;
      }
      while ((void **)v209 != v208);
      v208 = *(void ***)(v25 + 120);
      v216 = *(void ***)(v25 + 128);
      *(_QWORD *)(v25 + 120) = v213;
      *(_QWORD *)(v25 + 128) = v212;
      *(_QWORD *)(v25 + 136) = v211;
      while (v216 != v208)
      {
        if (*((char *)v216 - 1) < 0)
          operator delete(*(v216 - 3));
        v216 -= 4;
      }
    }
    if (v208)
      operator delete(v208);
  }
  if (v207)
  {
    v217 = 0;
    v218 = 0.0;
    v219 = 1;
    do
    {
      v221 = objc_msgSend(v204, "labelFrameAtIndex:", v217);
      v222 = v220;
      if (v218 < v220)
      {
        HIBYTE(v284[1]) = 0;
        BYTE8(v284[0]) = 0;
        *(_QWORD *)&v284[0] = __PAIR64__(LODWORD(v220), LODWORD(v218));
        v223 = *(_QWORD *)(v25 + 128);
        if (v223 >= *(_QWORD *)(v25 + 136))
        {
          v224 = std::vector<altitude::AnimationData::LabelEntry>::__push_back_slow_path<altitude::AnimationData::LabelEntry const&>(v205, (uint64_t)v284);
        }
        else
        {
          *(_QWORD *)v223 = *(_QWORD *)&v284[0];
          *(_OWORD *)(v223 + 8) = *(_OWORD *)((char *)v284 + 8);
          *(_QWORD *)(v223 + 24) = *((_QWORD *)&v284[1] + 1);
          v224 = (char *)(v223 + 32);
          *(_QWORD *)(v25 + 128) = v223 + 32;
        }
        *(_QWORD *)(v25 + 128) = v224;
      }
      HIBYTE(v284[1]) = 0;
      BYTE8(v284[0]) = 0;
      *(_QWORD *)&v284[0] = __PAIR64__(v221, LODWORD(v222));
      objc_msgSend(v204, "bestLocalizedLabelAtIndex:", HIDWORD(v221));
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v226 = v225;
      if (v225)
      {
        v205 = (char **)(v25 + 120);
        std::string::__assign_external((std::string *)((char *)v284 + 8), (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v225), "UTF8String"));
      }
      else
      {
        if (SHIBYTE(v284[1]) < 0)
        {
          *(_QWORD *)&v284[1] = 0;
          v227 = (_BYTE *)*((_QWORD *)&v284[0] + 1);
        }
        else
        {
          HIBYTE(v284[1]) = 0;
          v227 = (char *)v284 + 8;
        }
        *v227 = 0;
      }
      v228 = *(_QWORD **)(v25 + 128);
      if ((unint64_t)v228 >= *(_QWORD *)(v25 + 136))
      {
        v231 = std::vector<altitude::AnimationData::LabelEntry>::__push_back_slow_path<altitude::AnimationData::LabelEntry const&>(v205, (uint64_t)v284);
      }
      else
      {
        *v228 = *(_QWORD *)&v284[0];
        v229 = (std::string *)(v228 + 1);
        if (SHIBYTE(v284[1]) < 0)
        {
          std::string::__init_copy_ctor_external(v229, *((const std::string::value_type **)&v284[0] + 1), *(std::string::size_type *)&v284[1]);
        }
        else
        {
          v230 = *(_OWORD *)((char *)v284 + 8);
          v228[3] = *((_QWORD *)&v284[1] + 1);
          *(_OWORD *)&v229->__r_.__value_.__l.__data_ = v230;
        }
        v231 = (char *)(v228 + 4);
        *(_QWORD *)(v25 + 128) = v228 + 4;
      }
      *(_QWORD *)(v25 + 128) = v231;

      v204 = v259;
      if (SHIBYTE(v284[1]) < 0)
        operator delete(*((void **)&v284[0] + 1));
      LODWORD(v218) = v221;
      v217 = v219++;
      v205 = (char **)(v25 + 120);
    }
    while (v207 > v217);
    if (*(float *)&v221 >= 1.0)
    {
      v232 = __p;
      if (__p)
        goto LABEL_281;
      goto LABEL_282;
    }
  }
  else
  {
    v218 = 0.0;
  }
  HIBYTE(v284[1]) = 0;
  BYTE8(v284[0]) = 0;
  *(_QWORD *)&v284[0] = LODWORD(v218) | 0x3F80000000000000;
  v234 = *(_QWORD *)(v25 + 128);
  if (v234 >= *(_QWORD *)(v25 + 136))
  {
    v235 = std::vector<altitude::AnimationData::LabelEntry>::__push_back_slow_path<altitude::AnimationData::LabelEntry const&>(v205, (uint64_t)v284);
  }
  else
  {
    *(_QWORD *)v234 = *(_QWORD *)&v284[0];
    *(_OWORD *)(v234 + 8) = *(_OWORD *)((char *)v284 + 8);
    *(_QWORD *)(v234 + 24) = *((_QWORD *)&v284[1] + 1);
    v235 = (char *)(v234 + 32);
  }
  *(_QWORD *)(v25 + 128) = v235;
  v232 = __p;
  if (__p)
LABEL_281:
    operator delete(v232);
LABEL_282:

  *(_QWORD *)(v255 + 8) = v25;
  *(_QWORD *)(v257 + 80) = v255;
  *(_QWORD *)(v257 + 88) = 0;
  *(_DWORD *)(v257 + 96) = -1;
  v233 = (uint64_t)v281;
  if (v281)
  {
    if (v281 != v280)
    {
      v11 = v251;
      v233 = (*(uint64_t (**)(void))(*v281 + 16))();
      goto LABEL_289;
    }
    *((_QWORD *)&v284[1] + 1) = v284;
    v11 = v251;
    (*(void (**)(_QWORD *, _OWORD *))(v280[0] + 24))(v280, v284);
  }
  else
  {
    v11 = v251;
LABEL_289:
    *((_QWORD *)&v284[1] + 1) = v233;
  }
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v284, (_QWORD *)(v257 + 120));
  v236 = (_QWORD *)*((_QWORD *)&v284[1] + 1);
  if (*((_OWORD **)&v284[1] + 1) == v284)
  {
    v237 = 4;
    v236 = v284;
LABEL_298:
    (*(void (**)(void))(*v236 + 8 * v237))();
  }
  else if (*((_QWORD *)&v284[1] + 1))
  {
    v237 = 5;
    goto LABEL_298;
  }
  v238 = (uint64_t)v283;
  if (v283)
  {
    if (v283 != v282)
    {
      v238 = (*(uint64_t (**)(void))(*v283 + 16))();
      goto LABEL_302;
    }
    *((_QWORD *)&v284[1] + 1) = v284;
    (*(void (**)(_QWORD *, _OWORD *))(v282[0] + 24))(v282, v284);
  }
  else
  {
LABEL_302:
    *((_QWORD *)&v284[1] + 1) = v238;
  }
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v284, (_QWORD *)(v257 + 152));
  v239 = (_QWORD *)*((_QWORD *)&v284[1] + 1);
  if (*((_OWORD **)&v284[1] + 1) == v284)
  {
    v240 = 4;
    v239 = v284;
LABEL_308:
    (*(void (**)(void))(*v239 + 8 * v240))();
  }
  else if (*((_QWORD *)&v284[1] + 1))
  {
    v240 = 5;
    goto LABEL_308;
  }
  *(_DWORD *)(v257 + 116) = 1;
  *(_QWORD *)(v257 + 104) = 0x3FE0000000000000;
  *(_DWORD *)(v257 + 248) = 0;
  *(_BYTE *)(v257 + 252) = 0;
  v241 = *(_QWORD *)(v257 + 144);
  if (v241)
  {
    LODWORD(v284[0]) = 0;
    (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v241 + 48))(v241, v284);
  }
LABEL_311:

  v242 = v281;
  if (v281 == v280)
  {
    v243 = 4;
    v242 = v280;
LABEL_315:
    (*(void (**)(void))(*v242 + 8 * v243))();
  }
  else if (v281)
  {
    v243 = 5;
    goto LABEL_315;
  }
  v271 = &off_1E42B55B0;
  if (v272)
  {

    v244 = v272;
  }
  else
  {
    v244 = 0;
  }

  v245 = v283;
  if (v283 == v282)
  {
    v246 = 4;
    v245 = v282;
LABEL_323:
    (*(void (**)(void))(*v245 + 8 * v246))();
  }
  else if (v283)
  {
    v246 = 5;
    goto LABEL_323;
  }
  v274 = &off_1E42B55D0;
  if (v275)
  {

    v247 = v275;
  }
  else
  {
    v247 = 0;
  }

  v248 = (void *)v277;
  if (v277)

  v249 = (void *)v279;
  if (v279)

  v2 = v256;
LABEL_332:
  *(_BYTE *)(*(_QWORD *)(v2 + 32) + 513) = 1;
}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  double v4;
  double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  double v10;
  long double v11;
  long double v12;
  long double v13;
  long double v14;
  double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;
  float64x2_t v20;
  altitude::GlobeView *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  altitude::GlobeView **WeakRetained;
  char v26;

  WeakRetained = (altitude::GlobeView **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 80);
    v5 = *(double *)(a1 + 72) + (*(double *)(a1 + 128) - *(double *)(a1 + 72)) * a2;
    v6 = fmod(3.14159265 - v4 + *(double *)(a1 + 136), 6.28318531);
    v7 = fmod(v6 + 6.28318531, 6.28318531);
    v8 = fmod(v4 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    v10 = *(double *)(a1 + 40);
    v11 = fmod(3.14159265 - v10 + *(double *)(a1 + 96), 6.28318531);
    v12 = fmod(v11 + 6.28318531, 6.28318531);
    v13 = fmod(v10 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    v14 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    v15 = *(double *)(a1 + 48);
    v16 = fmod(3.14159265 - v15 + *(double *)(a1 + 104), 6.28318531);
    v17 = fmod(v16 + 6.28318531, 6.28318531);
    v18 = fmod(v15 + 3.14159265 + (v17 + -3.14159265) * a2, 6.28318531);
    v19 = fmod(v18 + 6.28318531, 6.28318531);
    v20 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(*(float64x2_t *)(a1 + 112), *(float64x2_t *)(a1 + 56)), a2);
    v21 = WeakRetained[34];
    v22 = *((_QWORD *)v21 + 9);
    *(long double *)(v22 + 8) = v14;
    *(long double *)(v22 + 16) = v19 + -3.14159265;
    *(float64x2_t *)(v22 + 24) = v20;
    *(double *)(v22 + 40) = v5;
    *(long double *)(v22 + 48) = v9;
    *(_QWORD *)(v22 + 56) = 0;
    ++*((_DWORD *)v21 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)(WeakRetained + 35), WeakRetained[34], 0);
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(WeakRetained, "_updateCanEnter3DMode");
    objc_msgSend(WeakRetained, "cameraDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mapLayerDidChangeVisibleRegion");

    v24 = *(_QWORD *)objc_msgSend(WeakRetained, "runLoopController");
    if (v24)
    {
      v26 = 4;
      md::MapEngine::setNeedsTick(v24, &v26);
    }
  }

}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_12(uint64_t a1, float a2)
{
  altitude::GlobeView **WeakRetained;
  altitude::GlobeView **v5;
  altitude::GlobeView *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];
  uint64_t v13;

  WeakRetained = (altitude::GlobeView **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[34];
    (*(void (**)(_OWORD *__return_ptr, float))(*(_QWORD *)(a1 + 32) + 16))(v12, a2);
    v7 = *((_QWORD *)v6 + 9);
    v8 = v12[0];
    v9 = v12[1];
    v10 = v12[2];
    *(_QWORD *)(v7 + 56) = v13;
    *(_OWORD *)(v7 + 40) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    *(_OWORD *)(v7 + 8) = v8;
    ++*((_DWORD *)v6 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)(v5 + 35), v5[34], 0);
    objc_msgSend(v5, "_updateIsPitched");
    objc_msgSend(v5, "_updateCanEnter3DMode");
    objc_msgSend(v5, "cameraDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerDidChangeVisibleRegion");

  }
}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  altitude::Anchor *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 520) = 1;
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(v8[23], "resumeAnimation");
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(altitude::Anchor **)(v6 + 24);
    if (v7)
    {
      altitude::Anchor::destroy(v7);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    WeakRetained = v8;
    *(_QWORD *)(v6 + 24) = 0;
  }

}

long double __75__VKGlobeCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
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

void __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  uint64_t *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  double v17;
  double v18;
  uint64_t v19;
  double *v20;
  double v21;
  double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  uint64_t v27;
  uint64_t v28;
  float64x2_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  long double v43;
  uint64_t v44;
  uint64_t v50;
  uint64_t v51;
  float64x2_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  float64x2_t v57;
  uint64_t v58;
  uint64_t v59;
  float64x2_t v60;
  double v61;
  char v62;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 48);
    v6 = a2;
    v7 = *(double *)(a1 + 64);
    v55 = *(double *)(a1 + 72);
    v56 = *(double *)(a1 + 56) - v5;
    v8 = *(double *)(a1 + 80);
    v9 = fmod(3.14159265 - v8 + *(double *)(a1 + 88), 6.28318531);
    v10 = fmod(v9 + 6.28318531, 6.28318531);
    v11 = fmod(v8 + 3.14159265 + (v10 + -3.14159265) * a2, 6.28318531);
    v12 = fmod(v11 + 6.28318531, 6.28318531) + -3.14159265;
    v13 = *(double *)(a1 + 96);
    v14 = fmod(3.14159265 - v13 + *(double *)(a1 + 104), 6.28318531);
    v15 = fmod(v14 + 6.28318531, 6.28318531);
    v16 = fmod(v13 + 3.14159265 + (v15 + -3.14159265) * a2, 6.28318531);
    v17 = fmod(v16 + 6.28318531, 6.28318531) + -3.14159265;
    v18 = *(double *)(a1 + 112);
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v19)
      v20 = (double *)(v19 + 56);
    else
      v20 = (double *)(a1 + 120);
    v21 = *v20 - v18;
    v60.f64[0] = v12;
    v60.f64[1] = v17;
    v61 = v18 + v21 * v6;
    v22 = *(double *)(a1 + 128);
    v23 = fmod(3.14159265 - v22 + *(double *)(a1 + 136), 6.28318531);
    v24 = fmod(v23 + 6.28318531, 6.28318531);
    v25 = fmod(v22 + 3.14159265 + (v24 + -3.14159265) * v6, 6.28318531);
    v26 = fmod(v25 + 6.28318531, 6.28318531);
    v27 = WeakRetained[34];
    *(_BYTE *)(v27 + 160) = 0;
    v28 = *(_QWORD *)(v27 + 72);
    v29 = v60;
    *(double *)(v28 + 24) = v61;
    *(float64x2_t *)(v28 + 8) = v29;
    ++*(_DWORD *)(v27 + 376);
    v30 = **(_QWORD **)(*(_QWORD *)(v27 + 856) + 88);
    if (v30)
    {
      LOBYTE(v57.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v30, &v57);
    }
    v31 = v5 + v56 * v6;
    v32 = v7 + (v55 - v7) * v6;
    v33 = WeakRetained[34];
    v34 = *(unsigned __int8 *)(v33 + 184);
    v35 = *(_QWORD *)(v33 + 72);
    v36 = fmax(v32, 0.0);
    if (*(_BYTE *)(v33 + 184))
      v32 = v36;
    *(double *)(v35 + 40) = v32;
    ++*(_DWORD *)(v33 + 376);
    if (v34)
    {
      v37 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v33);
      v38 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v33);
      v39 = *(_QWORD *)(v33 + 72);
      v40 = *(unsigned __int8 *)(v33 + 184);
      *(double *)(v39 + 32) = fmin(fmax(v37, v31), fmax(fmin(*(double *)(v33 + 400), 60592301.5), v38));
      if (v40)
        *(double *)(v39 + 40) = fmax(*(double *)(v39 + 40), 0.0);
    }
    else
    {
      *(double *)(v35 + 32) = v31;
    }
    ++*(_DWORD *)(v33 + 376);
    v41 = WeakRetained[34];
    v42 = *(_QWORD *)(v41 + 72);
    v43 = fmod(v26, 6.28318531);
    *(long double *)(v42 + 48) = fmod(v43 + 6.28318531, 6.28318531) + -3.14159265;
    ++*(_DWORD *)(v41 + 376);
    objc_msgSend(WeakRetained, "centerScreenPoint");
    v44 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:");
    v58 = 0;
    v59 = v44;
    v57 = 0uLL;
    altitude::GlobeView::getCoordAtScreenPosition(WeakRetained[34], (int *)&v59, v60.f64, (uint64_t)&v57, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    v60 = vnegq_f64(vmlaq_f64(v57, _Q2, v60));
    v50 = WeakRetained[34];
    *(_BYTE *)(v50 + 160) = 0;
    v51 = *(_QWORD *)(v50 + 72);
    v52 = v60;
    *(double *)(v51 + 24) = v61;
    *(float64x2_t *)(v51 + 8) = v52;
    ++*(_DWORD *)(v50 + 376);
    v53 = **(_QWORD **)(*(_QWORD *)(v50 + 856) + 88);
    if (v53)
    {
      v62 = 7;
      md::MapEngine::setNeedsTick(v53, &v62);
    }
    altitude::CameraManager::update((altitude::CameraManager *)(WeakRetained + 35), (altitude::GlobeView *)WeakRetained[34], 1);
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(WeakRetained, "_updateCanEnter3DMode");
    objc_msgSend(WeakRetained, "cameraDelegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "mapLayerDidChangeVisibleRegion");

  }
}

void __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  altitude::Anchor *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 520) = 1;
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(v8[23], "resumeAnimation");
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(altitude::Anchor **)(v6 + 24);
    if (v7)
    {
      altitude::Anchor::destroy(v7);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    WeakRetained = v8;
    *(_QWORD *)(v6 + 24) = 0;
  }

}

void __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 40), a2))));
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapLayerDidChangeVisibleRegion");

}

uint64_t __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  char *v2;
  char *v3;
  uint64_t result;

  v2 = *(char **)(a1 + 32);
  v3 = v2 + 280;
  objc_msgSend(v2, "cursorFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3[10] = 1;
  objc_msgSend(*(id *)(a1 + 32), "endRegionChange");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke(uint64_t a1, float a2)
{
  double *WeakRetained;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  double *v9;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    WeakRetained[62] = WeakRetained[62] * v5 / v7;
    *((_DWORD *)WeakRetained + 122) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 123) = *(_DWORD *)(a1 + 60);
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "cameraDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v9;
  }

}

void __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[458] = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

void __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  double *WeakRetained;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  double *v9;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    WeakRetained[62] = WeakRetained[62] * v5 / v7;
    *((_DWORD *)WeakRetained + 122) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 123) = *(_DWORD *)(a1 + 60);
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(v9, "_updateCanEnter3DMode");
    objc_msgSend(v9, "cameraDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v9;
  }

}

void __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[458] = 1;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

void __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  double v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40)
       + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2
       - *(double *)(*(_QWORD *)(WeakRetained[34] + 72) + 40);
    *((_DWORD *)WeakRetained + 108) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 109) = *(_DWORD *)(a1 + 60);
    *((double *)WeakRetained + 56) = v5 + *((double *)WeakRetained + 56);
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(v7, "cameraDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v7;
  }

}

void __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 402) = 1;
    *((_BYTE *)WeakRetained + 712) = 0;
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(*((id *)WeakRetained + 23), "resumeAnimation");
    objc_msgSend(WeakRetained, "_updateIsPitched");
    objc_msgSend(WeakRetained, "_updateCanEnter3DMode");
  }

}

void __45__VKGlobeCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  void *v17;
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40);
    v6 = *(double *)(a1 + 48);
    v7 = *(double *)(*(_QWORD *)(WeakRetained[34] + 72) + 48);
    v18 = WeakRetained;
    objc_msgSend(WeakRetained, "centerScreenPoint");
    v9 = v8;
    v11 = v10;
    v12 = fmod(3.14159265 - v5 + v6, 6.28318531);
    v13 = fmod(v12 + 6.28318531, 6.28318531);
    v14 = fmod(v5 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
    v15 = fmod(v14 + 6.28318531, 6.28318531);
    v16 = fmod(v15 - v7, 6.28318531);
    objc_msgSend(v18, "rotate:atScreenPoint:", (double)(fmod(v16 + 6.28318531, 6.28318531) + -3.14159265), v9, v11);
    objc_msgSend(v18, "cameraDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v18;
  }

}

void __45__VKGlobeCameraController_rotateTo_animated___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[355] = 1;
    WeakRetained[713] = 0;
    objc_msgSend(WeakRetained, "endRegionChange");
  }

}

uint64_t __65__VKGlobeCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
