@implementation VKAnnotationTrackingCameraController

- (VKAnnotationTrackingCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  VKAnnotationTrackingCameraController *v6;
  VKAnnotationTrackingCameraController *v7;
  VKAnnotationTrackingCameraController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKAnnotationTrackingCameraController;
  v6 = -[VKCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v10, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v6->_headingAnimationDisplayRate = -1;
    v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  VKTrackableAnnotation *annotation;
  __int16 v4;
  VKTrackableAnnotationPresentation *annotationPresentation;
  objc_super v6;

  annotation = self->_annotation;
  if (annotation)
  {
    v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    if ((v4 & 0x80) != 0)
    {
      -[VKTrackableAnnotation removeObserver:forKeyPath:](annotation, "removeObserver:forKeyPath:", self, CFSTR("accuracy"));
      v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
      annotation = self->_annotation;
    }
    if ((v4 & 4) != 0)
    {
      -[VKTrackableAnnotation removeObserver:forKeyPath:](annotation, "removeObserver:forKeyPath:", self, CFSTR("heading"));
      annotation = self->_annotation;
    }
    -[VKTrackableAnnotation removeObserver:forKeyPath:](annotation, "removeObserver:forKeyPath:", self, CFSTR("coordinate"));
  }
  -[VKAnimation stop](self->_currentAnimation, "stop");
  -[VKAnimation stop](self->_currentHeadingAnimation, "stop");
  -[VKTrackableAnnotationPresentation setTracking:](self->_annotationPresentation, "setTracking:", 0);
  annotationPresentation = self->_annotationPresentation;
  self->_annotationPresentation = 0;

  v6.receiver = self;
  v6.super_class = (Class)VKAnnotationTrackingCameraController;
  -[VKAnnotationTrackingCameraController dealloc](&v6, sel_dealloc);
}

- (BOOL)isTrackingHeading
{
  return (*(unsigned __int16 *)(&self->_hasUserSpecifiedZoomLevel + 1) >> 2) & 1;
}

- (void)updateFramerate
{
  __int16 v3;
  RunLoopController *v4;
  uint64_t v5;
  VKAnnotationTrackingCameraController *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t var0;

  v3 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
  if ((v3 & 0x10) != 0)
  {
    v4 = -[VKCameraController runLoopController](self, "runLoopController");
    v6 = self;
  }
  else
  {
    if ((v3 & 4) != 0
      && -[VKAnimation running](self->_currentHeadingAnimation, "running")
      && *(&self->_hasUserSpecifiedZoomLevel + 3))
    {
      v4 = -[VKCameraController runLoopController](self, "runLoopController");
      v5 = -[VKCameraController baseDisplayRate](self, "baseDisplayRate");
      goto LABEL_10;
    }
    v7 = -[VKAnimation running](self->_currentAnimation, "running");
    v4 = -[VKCameraController runLoopController](self, "runLoopController");
    v6 = self;
    if (v7)
    {
      v5 = -[VKCameraController baseDisplayRate](self, "baseDisplayRate");
      goto LABEL_10;
    }
  }
  v5 = -[VKCameraController maxDisplayRate](v6, "maxDisplayRate");
LABEL_10:
  v8 = v5;
  v4->var1 = v5;
  var0 = (uint64_t)v4->var0;
  if (v4->var0)
  {
    if (!**(_BYTE **)(var0 + 1056))
      md::MapEngine::setDisplayRate(var0, v8);
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v13;
  VKTrackableAnnotation **p_annotation;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  void *v20;
  VKTrackableAnnotationPresentation *v21;
  VKTrackableAnnotationPresentation *annotationPresentation;
  double v23;
  VKTimedAnimation *currentHeadingAnimation;
  __int16 v25;
  VKTrackableAnnotation *v26;
  double v27;
  VKTrackableAnnotation *v28;

  v9 = a5;
  v10 = a4;
  v28 = (VKTrackableAnnotation *)a3;
  v13 = a7;
  p_annotation = &self->_annotation;
  if (self->_annotation == v28)
  {
    if (!v28)
      goto LABEL_36;
    goto LABEL_22;
  }
  -[VKAnnotationTrackingCameraController stopTrackingAnnotation](self, "stopTrackingAnnotation");
  if (v28)
  {
    objc_storeStrong((id *)&self->_annotation, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 128;
    else
      v15 = 0;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFF7F | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 256;
    else
      v16 = 0;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFEFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 512;
    else
      v17 = 0;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFDFF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 1024;
    else
      v18 = 0;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFBFF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 2048;
    else
      v19 = 0;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xF7FF | v19;
    -[VKTrackableAnnotation addObserver:forKeyPath:options:context:](*p_annotation, "addObserver:forKeyPath:options:context:", self, CFSTR("coordinate"), 0, 0);
    if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
      -[VKTrackableAnnotation addObserver:forKeyPath:options:context:](*p_annotation, "addObserver:forKeyPath:options:context:", self, CFSTR("accuracy"), 0, 0);
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mapLayerPresentationForAnnotation:", *p_annotation);
    v21 = (VKTrackableAnnotationPresentation *)objc_claimAutoreleasedReturnValue();
    annotationPresentation = self->_annotationPresentation;
    self->_annotationPresentation = v21;

    -[VKTrackableAnnotationPresentation setTracking:](self->_annotationPresentation, "setTracking:", 1);
LABEL_22:
    v23 = -1.0;
    if (a6 > 0.0)
      v23 = a6;
    -[VKAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", v9, v13, 1, v23);
  }
  if (*p_annotation)
  {
    if (((((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 4) == 0) ^ v10) & 1) == 0)
    {
      -[VKAnimation stop](self->_currentHeadingAnimation, "stop");
      currentHeadingAnimation = self->_currentHeadingAnimation;
      self->_currentHeadingAnimation = 0;

      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x200) != 0)
      {
        if (v10)
          v25 = 4;
        else
          v25 = 0;
        *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFFFB | v25;
        v26 = *p_annotation;
        if (v10)
        {
          -[VKTrackableAnnotation addObserver:forKeyPath:options:context:](v26, "addObserver:forKeyPath:options:context:", self, CFSTR("heading"), 0, 0);
          v27 = 0.4;
          if (a6 > 0.0)
            v27 = a6;
          -[VKAnnotationTrackingCameraController _rotateToHeadingAnimated:duration:](self, "_rotateToHeadingAnimated:duration:", v9, v27);
        }
        else
        {
          -[VKTrackableAnnotation removeObserver:forKeyPath:](v26, "removeObserver:forKeyPath:", self, CFSTR("heading"));
        }
      }
    }
  }
LABEL_36:
  -[VKAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");

}

- (void)stopTrackingAnnotation
{
  VKTrackableAnnotation *annotation;
  __int16 v4;
  __int16 v5;
  VKTrackableAnnotation *v6;
  VKTrackableAnnotationPresentation *annotationPresentation;
  VKTimedAnimation *currentAnimation;
  VKTimedAnimation *v9;
  VKTimedAnimation *currentHeadingAnimation;

  annotation = self->_annotation;
  if (annotation)
  {
    v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    if ((v4 & 0x80) != 0)
    {
      -[VKTrackableAnnotation removeObserver:forKeyPath:](annotation, "removeObserver:forKeyPath:", self, CFSTR("accuracy"));
      v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    }
    v5 = v4 & 0xFF7F;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = v4 & 0xFF7F;
    if ((v4 & 4) != 0)
    {
      -[VKTrackableAnnotation removeObserver:forKeyPath:](self->_annotation, "removeObserver:forKeyPath:", self, CFSTR("heading"));
      v5 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = v5 & 0xFFFB;
    -[VKTrackableAnnotation removeObserver:forKeyPath:](self->_annotation, "removeObserver:forKeyPath:", self, CFSTR("coordinate"));
    v6 = self->_annotation;
    self->_annotation = 0;

    -[VKTrackableAnnotationPresentation setTracking:](self->_annotationPresentation, "setTracking:", 0);
    annotationPresentation = self->_annotationPresentation;
    self->_annotationPresentation = 0;

    currentAnimation = self->_currentAnimation;
    if (currentAnimation)
    {
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x10) == 0)
      {
        -[VKAnimation stop](currentAnimation, "stop");
        v9 = self->_currentAnimation;
        self->_currentAnimation = 0;

      }
    }
    -[VKAnimation stop](self->_currentHeadingAnimation, "stop");
    currentHeadingAnimation = self->_currentHeadingAnimation;
    self->_currentHeadingAnimation = 0;

    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) &= 0xFDF6u;
  }
}

- (void)setGesturing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKAnnotationTrackingCameraController;
  -[VKCameraController setGesturing:](&v4, sel_setGesturing_, a3);
  if (-[VKCameraController isGesturing](self, "isGesturing"))
    -[VKAnnotationTrackingCameraController pauseAnimation](self, "pauseAnimation");
  else
    -[VKAnnotationTrackingCameraController resumeAnimation](self, "resumeAnimation");
}

- (BOOL)shouldForceZoomToFit
{
  if (!self->_behavior.shouldZoomToFit)
    return 0;
  if (self->_behavior.shouldPreserveUserSpecifiedZoomLevel)
    return !self->_hasUserSpecifiedZoomLevel;
  return 1;
}

- (BOOL)isAnimating
{
  _BOOL4 v3;

  if (-[VKAnimation running](self->_currentAnimation, "running")
    || -[VKAnimation running](self->_currentHeadingAnimation, "running"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unsigned __int16 *)(&self->_hasUserSpecifiedZoomLevel + 1) >> 5) & 1;
  }
  return v3;
}

- (void)pauseAnimation
{
  -[VKTimedAnimation pause](self->_currentAnimation, "pause");
  -[VKTimedAnimation pause](self->_currentHeadingAnimation, "pause");
  *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) |= 2u;
  -[VKAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");
}

- (void)resumeAnimation
{
  double v3;
  double pendingChangeDuration;
  VKTimedAnimation *currentAnimation;
  VKTimedAnimation *currentHeadingAnimation;

  -[VKTimedAnimation duration](self->_currentAnimation, "duration");
  if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 1) != 0)
    pendingChangeDuration = self->_pendingChangeDuration;
  else
    pendingChangeDuration = v3;
  -[VKAnimation stop](self->_currentAnimation, "stop");
  currentAnimation = self->_currentAnimation;
  self->_currentAnimation = 0;

  -[VKAnimation stop](self->_currentHeadingAnimation, "stop");
  currentHeadingAnimation = self->_currentHeadingAnimation;
  self->_currentHeadingAnimation = 0;

  *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) &= ~2u;
  -[VKAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, pendingChangeDuration);
  if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 4) != 0)
    -[VKAnnotationTrackingCameraController _rotateToHeadingAnimated:duration:](self, "_rotateToHeadingAnimated:duration:", 1, 0.4);
  -[VKAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  VKTrackableAnnotation *v11;
  id v12;
  VKTrackableAnnotation *annotation;
  double v14;
  double v15;
  objc_super v16;

  v10 = a3;
  v11 = (VKTrackableAnnotation *)a4;
  v12 = a5;
  annotation = self->_annotation;
  if (annotation == v11)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("coordinate")) & 1) != 0)
    {
      v15 = -1.0;
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x400) != 0)
        -[VKTrackableAnnotation expectedCoordinateUpdateInterval](self->_annotation, "expectedCoordinateUpdateInterval", -1.0);
    }
    else
    {
      annotation = self->_annotation;
      if (annotation != v11)
        goto LABEL_2;
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("accuracy")) & 1) == 0)
      {
        if (self->_annotation != v11)
          goto LABEL_16;
        goto LABEL_3;
      }
      v15 = -1.0;
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x400) != 0)
        -[VKTrackableAnnotation expectedCoordinateUpdateInterval](self->_annotation, "expectedCoordinateUpdateInterval", -1.0);
    }
    -[VKAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, v15);
    goto LABEL_17;
  }
LABEL_2:
  if (annotation != v11)
  {
LABEL_16:
    v16.receiver = self;
    v16.super_class = (Class)VKAnnotationTrackingCameraController;
    -[VKAnnotationTrackingCameraController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_17;
  }
LABEL_3:
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("heading")))
    goto LABEL_16;
  if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x800) != 0)
    -[VKTrackableAnnotation expectedHeadingUpdateInterval](self->_annotation, "expectedHeadingUpdateInterval");
  else
    v14 = 0.4;
  -[VKAnnotationTrackingCameraController _rotateToHeadingAnimated:duration:](self, "_rotateToHeadingAnimated:duration:", 1, v14);
LABEL_17:

}

- (VKTrackableAnnotation)annotation
{
  return self->_annotation;
}

- ($FF918C85BF8E73478720C66798E418D4)behavior
{
  *($F8852815F5307377C348AED5259C60F2 *)retstr = *($F8852815F5307377C348AED5259C60F2 *)((char *)self + 296);
  return self;
}

- (void)setBehavior:(id *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_behavior.shouldZoomToFit = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_behavior.shouldPreserveUserSpecifiedZoomLevel = v3;
}

- (int64_t)headingAnimationDisplayRate
{
  return self->_headingAnimationDisplayRate;
}

- (void)setHeadingAnimationDisplayRate:(int64_t)a3
{
  self->_headingAnimationDisplayRate = a3;
}

- (BOOL)hasUserSpecifiedZoomLevel
{
  return self->_hasUserSpecifiedZoomLevel;
}

- (void)setHasUserSpecifiedZoomLevel:(BOOL)a3
{
  self->_hasUserSpecifiedZoomLevel = a3;
}

- (BOOL)hasVehicleHeading
{
  return *(&self->_hasUserSpecifiedZoomLevel + 3);
}

- (void)setHasVehicleHeading:(BOOL)a3
{
  *(&self->_hasUserSpecifiedZoomLevel + 3) = a3;
}

- (void)elevationLogic
{
  return *(void **)&self->_hasVehicleHeading;
}

- (void)setElevationLogic:(void *)a3
{
  *(_QWORD *)&self->_hasVehicleHeading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHeadingAnimation, 0);
  objc_storeStrong((id *)&self->_currentAnimation, 0);
  objc_storeStrong((id *)&self->_annotationPresentation, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
