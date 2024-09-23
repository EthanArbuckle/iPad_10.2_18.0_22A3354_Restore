@implementation VKScreenCameraController

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)VKScreenCameraController;
  -[VKCameraController setEdgeInsets:](&v12, sel_setEdgeInsets_);
  *(float *)&v8 = top;
  *(float *)&v9 = left;
  *(float *)&v10 = bottom;
  *(float *)&v11 = right;
  -[VKCameraController setEdgeInsets:](self->_annotationTrackingCameraController, "setEdgeInsets:", v8, v9, v10, v11);
}

- (void)clampZoomLevelIfNecessary
{
  -[VKScreenCameraController clampZoomLevelIfNecessaryAnimated:](self, "clampZoomLevelIfNecessaryAnimated:", 0);
}

- (BOOL)isAnimatingToTrackAnnotation
{
  return -[VKAnnotationTrackingCameraController isAnimating](self->_annotationTrackingCameraController, "isAnimating");
}

- (void)setVkCamera:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!v4)
    -[VKScreenCameraController stopAnimations](self, "stopAnimations");
  v5.receiver = self;
  v5.super_class = (Class)VKScreenCameraController;
  -[VKCameraController setVkCamera:](&v5, sel_setVkCamera_, v4);

}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  Camera *ptr;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  objc_super v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  ptr = a3.__ptr_;
  v5 = *(_QWORD *)a3.__ptr_;
  if (!*(_QWORD *)a3.__ptr_)
  {
    -[VKScreenCameraController stopAnimations](self, "stopAnimations");
    v5 = *(_QWORD *)ptr;
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v13 = v5;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v12.receiver = self;
  v12.super_class = (Class)VKScreenCameraController;
  -[VKCameraController setCamera:](&v12, sel_setCamera_, &v13, a3.__cntrl_);
  v9 = v14;
  if (v14)
  {
    v10 = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (VKCameraRegionRestriction)regionRestriction
{
  return self->_regionRestriction;
}

- (VKScreenCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10;
  char *v11;
  VKCameraRegionRestriction *v12;
  void *v13;
  char *v19;
  objc_super v21;

  v10 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VKScreenCameraController;
  v11 = -[VKCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v21, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a3, a4, a5, v10);
  if (v11)
  {
    v12 = -[VKCameraRegionRestriction initWithMapRegion:]([VKCameraRegionRestriction alloc], "initWithMapRegion:", 0);
    v13 = (void *)*((_QWORD *)v11 + 30);
    *((_QWORD *)v11 + 30) = v12;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v11 + 248) = _Q0;
    v11[264] = 0;
    v19 = v11;
  }

  return (VKScreenCameraController *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRestriction, 0);
  objc_storeStrong((id *)&self->_gestureCameraControllerBehavior, 0);
  objc_storeStrong((id *)&self->_annotationTrackingCameraController, 0);
  objc_storeStrong((id *)&self->_moveToTourPositionAnimation, 0);
  objc_storeStrong((id *)&self->_flyoverAnimation, 0);
  objc_storeStrong((id *)&self->_regionAnimation, 0);
  objc_storeStrong((id *)&self->_rotationAnimation, 0);
  objc_storeStrong((id *)&self->_pitchAnimation, 0);
  objc_storeStrong((id *)&self->_zoomAnimation, 0);
}

- (void)dealloc
{
  VKAnnotationTrackingCameraController *annotationTrackingCameraController;
  VKAnimation *zoomAnimation;
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *rotationAnimation;
  VKTimedAnimation *regionAnimation;
  VKCameraRegionRestriction *regionRestriction;
  objc_super v9;

  -[VKCameraController setCameraDelegate:](self->_annotationTrackingCameraController, "setCameraDelegate:", 0);
  annotationTrackingCameraController = self->_annotationTrackingCameraController;
  self->_annotationTrackingCameraController = 0;

  -[VKAnimation stop](self->_zoomAnimation, "stop");
  zoomAnimation = self->_zoomAnimation;
  self->_zoomAnimation = 0;

  -[VKAnimation stop](self->_pitchAnimation, "stop");
  pitchAnimation = self->_pitchAnimation;
  self->_pitchAnimation = 0;

  -[VKAnimation stop](self->_rotationAnimation, "stop");
  rotationAnimation = self->_rotationAnimation;
  self->_rotationAnimation = 0;

  -[VKAnimation stop](self->_regionAnimation, "stop");
  regionAnimation = self->_regionAnimation;
  self->_regionAnimation = 0;

  regionRestriction = self->_regionRestriction;
  self->_regionRestriction = 0;

  v9.receiver = self;
  v9.super_class = (Class)VKScreenCameraController;
  -[VKScreenCameraController dealloc](&v9, sel_dealloc);
}

- (void)stopTrackingAnnotation
{
  __int128 v3;
  uint64_t v4;

  -[VKAnnotationTrackingCameraController stopTrackingAnnotation](self->_annotationTrackingCameraController, "stopTrackingAnnotation");
  if (self->_annotationTrackingBehavior.resetAfterTracking)
  {
    v3 = VKAnnotationTrackingBehaviorDefault;
    v4 = 1;
    -[VKScreenCameraController setAnnotationTrackingBehavior:](self, "setAnnotationTrackingBehavior:", &v3);
  }
}

- (VKTrackableAnnotation)trackingAnnotation
{
  return -[VKAnnotationTrackingCameraController annotation](self->_annotationTrackingCameraController, "annotation");
}

- (BOOL)isTrackingHeading
{
  return -[VKAnnotationTrackingCameraController isTrackingHeading](self->_annotationTrackingCameraController, "isTrackingHeading");
}

- (void)setAnnotationTrackingBehavior:(id *)a3
{
  uint64_t v3;
  $FF918C85BF8E73478720C66798E418D4 v4;

  v3 = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_annotationTrackingBehavior.shouldZoomToFit = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel = v3;
  v4 = *a3;
  -[VKAnnotationTrackingCameraController setBehavior:](self->_annotationTrackingCameraController, "setBehavior:", &v4);
}

- (void)setHasVehicleHeading:(BOOL)a3
{
  self->_hasVehicleHeading = a3;
  -[VKAnnotationTrackingCameraController setHasVehicleHeading:](self->_annotationTrackingCameraController, "setHasVehicleHeading:");
}

- (void)stopSnappingAnimations
{
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *rotationAnimation;

  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation)
    -[VKAnimation stop](pitchAnimation, "stop");
  rotationAnimation = self->_rotationAnimation;
  if (rotationAnimation)
    -[VKAnimation stop](rotationAnimation, "stop");
}

- (void)stopRegionAnimation
{
  VKTimedAnimation *regionAnimation;

  -[VKAnimation stop](self->_regionAnimation, "stop");
  regionAnimation = self->_regionAnimation;
  self->_regionAnimation = 0;

}

- (void)stopAnimations
{
  VKTimedAnimation *regionAnimation;
  VKTimedAnimation *v4;
  VKTimedAnimation *rotationAnimation;
  VKTimedAnimation *v6;
  VKTimedAnimation *pitchAnimation;
  VKTimedAnimation *v8;
  VKAnimation *zoomAnimation;
  VKAnimation *v10;

  regionAnimation = self->_regionAnimation;
  if (regionAnimation)
  {
    -[VKAnimation stop](regionAnimation, "stop");
    v4 = self->_regionAnimation;
    self->_regionAnimation = 0;

  }
  rotationAnimation = self->_rotationAnimation;
  if (rotationAnimation)
  {
    -[VKAnimation stop](rotationAnimation, "stop");
    v6 = self->_rotationAnimation;
    self->_rotationAnimation = 0;

  }
  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation)
  {
    -[VKAnimation stop](pitchAnimation, "stop");
    v8 = self->_pitchAnimation;
    self->_pitchAnimation = 0;

  }
  zoomAnimation = self->_zoomAnimation;
  if (zoomAnimation)
  {
    -[VKAnimation stop](zoomAnimation, "stop");
    v10 = self->_zoomAnimation;
    self->_zoomAnimation = 0;

  }
}

- (BOOL)isAnimating
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKScreenCameraController;
  return -[VKCameraController isAnimating](&v4, sel_isAnimating)
      || -[VKAnnotationTrackingCameraController isAnimating](self->_annotationTrackingCameraController, "isAnimating");
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  return 0;
}

- (void)setCenterCoordinateDistanceRange:(id *)a3
{
  $FB7D626B10600DAA2A617849B22B1DA6 v3;

  v3 = *a3;
  -[VKScreenCameraController setCenterCoordinateDistanceRange:duration:timingFunction:](self, "setCenterCoordinateDistanceRange:duration:timingFunction:", &v3, 0, 0.0);
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  uint64_t v7;
  void *v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  double v17;
  long double v18;
  double v19;
  void *v20;
  void *v21;
  double var1;
  char v23;
  void *v24;
  void *v25;
  char v26;
  char v27[8];
  double v28;
  char v29[8];
  double v30;

  v7 = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_centerCoordinateDistanceRange.min = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_centerCoordinateDistanceRange.allowRubberband = v7;
  -[VKGestureCameraBehavior setAllowsZoomRubberbanding:](self->_gestureCameraControllerBehavior, "setAllowsZoomRubberbanding:", a3->var2, a5);
  -[VKCameraController vkCamera](self, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groundPoint");
  v10 = exp(v9 * 6.28318531 + -3.14159265);
  v11 = atan(v10) * 114.591559 + -90.0;
  v12 = cos(v11 * 0.034906585) * -559.82 + 111132.92;
  v13 = v12 + cos(v11 * 0.0698131701) * 1.175;
  v14 = v13 + cos(v11 * 0.104719755) * -0.0023;
  v15 = v11 * 0.00872664626;
  v16 = tan(v11 * 0.00872664626 + 0.78103484);
  v17 = log(v16);
  v18 = tan(v15 + 0.789761487);
  v19 = fabs((log(v18) - v17) * 0.159154943) / v14;

  -[VKCameraController vkCamera](self, "vkCamera");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  var1 = a3->var1;
  if (var1 < 0.0)
  {
    v23 = 0;
  }
  else
  {
    v30 = fmin(var1 * v19, 1.0);
    v23 = 1;
  }
  v29[0] = v23;
  objc_msgSend(v20, "setMaxDistanceToGroundRestriction:", v29);
  if (v29[0])
    v29[0] = 0;

  -[VKCameraController vkCamera](self, "vkCamera");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a3->var0 < 0.0)
  {
    v26 = 0;
  }
  else
  {
    v28 = fmin(fmax(a3->var0 * v19, 0.0), 1.0);
    v26 = 1;
  }
  v27[0] = v26;
  objc_msgSend(v24, "setMinDistanceToGroundRestriction:", v27);
  if (v27[0])
    v27[0] = 0;

}

- (void)setRegionRestriction:(id)a3
{
  -[VKScreenCameraController setRegionRestriction:duration:timingFunction:](self, "setRegionRestriction:duration:timingFunction:", a3, 0, 0.0);
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  void *v7;
  id v8;

  v8 = a3;
  if (!-[VKCameraRegionRestriction isEqual:](self->_regionRestriction, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_regionRestriction, a3);
    -[VKCameraController vkCamera](self, "vkCamera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRegionRestriction:", v8);

  }
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  -[VKGestureCameraBehavior zoom:withFocusPoint:completionHandler:](self->_gestureCameraControllerBehavior, "zoom:withFocusPoint:completionHandler:", v9, a3, x, y);
  -[VKCameraController endRegionChange](self, "endRegionChange");

}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKAnimation *zoomAnimation;
  VKAnimation *v7;

  y = a3.y;
  x = a3.x;
  zoomAnimation = self->_zoomAnimation;
  if (zoomAnimation && -[VKAnimation running](zoomAnimation, "running"))
  {
    if (!self->_zoomAnimationCanBeInterrupted)
      return;
    -[VKAnimation stop](self->_zoomAnimation, "stop");
    v7 = self->_zoomAnimation;
    self->_zoomAnimation = 0;

  }
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  -[VKGestureCameraBehavior startPinchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "startPinchingWithFocusPoint:", x, y);
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  -[VKGestureCameraBehavior updatePinchWithFocusPoint:oldFactor:newFactor:](self->_gestureCameraControllerBehavior, "updatePinchWithFocusPoint:oldFactor:newFactor:", a3.x, a3.y, a4, a5);
  self->_userChangedZoomSinceLastProgrammaticRegionChange = 1;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->_annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPinchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopPinchingWithFocusPoint:", a3.x, a3.y);
  -[VKScreenCameraController clampZoomLevelIfNecessaryAnimated:](self, "clampZoomLevelIfNecessaryAnimated:", -[VKGestureCameraBehavior allowsZoomRubberbanding](self->_gestureCameraControllerBehavior, "allowsZoomRubberbanding"));
  -[VKCameraController endRegionChange](self, "endRegionChange");
  -[VKScreenCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  -[VKGestureCameraBehavior startPanningAtPoint:panAtStartPoint:](self->_gestureCameraControllerBehavior, "startPanningAtPoint:panAtStartPoint:", v4, x, y);
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  -[VKGestureCameraBehavior updatePanWithTranslation:](self->_gestureCameraControllerBehavior, "updatePanWithTranslation:", a3.x, a3.y);
  -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPanningAtPoint:](self->_gestureCameraControllerBehavior, "stopPanningAtPoint:", a3.x, a3.y);
  -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
  -[VKCameraController endRegionChange](self, "endRegionChange");
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  -[VKGestureCameraBehavior startRotatingWithFocusPoint:](self->_gestureCameraControllerBehavior, "startRotatingWithFocusPoint:", x, y);
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  -[VKGestureCameraBehavior updateRotationWithFocusPoint:newValue:](self->_gestureCameraControllerBehavior, "updateRotationWithFocusPoint:newValue:", a3.x, a3.y, a4);
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopRotatingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopRotatingWithFocusPoint:", a3.x, a3.y);
  -[VKCameraController endRegionChange](self, "endRegionChange");
  -[VKScreenCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKTimedAnimation *pitchAnimation;

  y = a3.y;
  x = a3.x;
  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation)
    -[VKAnimation stop](pitchAnimation, "stop");
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  -[VKGestureCameraBehavior startPitchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "startPitchingWithFocusPoint:", x, y);
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  -[VKGestureCameraBehavior updatePitchWithFocusPoint:translation:](self->_gestureCameraControllerBehavior, "updatePitchWithFocusPoint:translation:", a3.x, a3.y, a4);
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  -[VKGestureCameraBehavior updatePitchWithFocusPoint:degrees:](self->_gestureCameraControllerBehavior, "updatePitchWithFocusPoint:degrees:", a3.x, a3.y, a4);
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPitchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopPitchingWithFocusPoint:", a3.x, a3.y);
  -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
  -[VKCameraController endRegionChange](self, "endRegionChange");
  -[VKScreenCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
}

- (void)transferGestureState:(id)a3
{
  -[VKGestureCameraBehavior transferGestureState:](self->_gestureCameraControllerBehavior, "transferGestureState:", a3);
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  return 0.0;
}

- (int64_t)tileSize
{
  return 0;
}

- (BOOL)canEnter3DMode
{
  return 0;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKScreenCameraController;
  -[VKCameraController updateWithTimestamp:withContext:](&v7, sel_updateWithTimestamp_withContext_);
  -[VKGestureCameraBehavior updateWithTimestamp:withContext:](self->_gestureCameraControllerBehavior, "updateWithTimestamp:withContext:", a4, a3);
}

- (BOOL)isFlyoverTourStarted
{
  return 0;
}

- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior
{
  *($F8852815F5307377C348AED5259C60F2 *)retstr = *($F8852815F5307377C348AED5259C60F2 *)((char *)self + 200);
  return self;
}

- (BOOL)hasVehicleHeading
{
  return self->_hasVehicleHeading;
}

- ($FB7D626B10600DAA2A617849B22B1DA6)centerCoordinateDistanceRange
{
  *($86C499896B48E8EBD2EEEC504ABFB400 *)retstr = *($86C499896B48E8EBD2EEEC504ABFB400 *)((char *)self + 248);
  return self;
}

- (BOOL)userChangedZoomSinceLastProgrammaticRegionChange
{
  return self->_userChangedZoomSinceLastProgrammaticRegionChange;
}

- (void)setUserChangedZoomSinceLastProgrammaticRegionChange:(BOOL)a3
{
  self->_userChangedZoomSinceLastProgrammaticRegionChange = a3;
}

@end
