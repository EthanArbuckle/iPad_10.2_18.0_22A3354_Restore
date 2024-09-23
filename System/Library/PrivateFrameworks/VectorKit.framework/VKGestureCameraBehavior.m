@implementation VKGestureCameraBehavior

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraController);
}

- (BOOL)isPinching
{
  return self->_pinching;
}

- (VKGestureCameraBehavior)initWithCameraController:(id)a3
{
  id v4;
  VKGestureCameraBehavior *v5;
  VKGestureCameraBehavior *v6;
  VKGestureCameraBehavior *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKGestureCameraBehavior;
  v5 = -[VKGestureCameraBehavior init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cameraController, v4);
    v6->_notifyCameraStateChanges = 1;
    v7 = v6;
  }

  return v6;
}

- (void)transferGestureState:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_pinching)
    objc_msgSend(v4, "startPinchingWithFocusPoint:", self->_pinchStartFocusPoint.x, self->_pinchStartFocusPoint.y);
  if (self->_panning)
    objc_msgSend(v4, "startPanningAtPoint:panAtStartPoint:", 1, self->_panStartFocusPoint.x, self->_panStartFocusPoint.y);
  if (self->_rotating)
    objc_msgSend(v4, "startRotatingWithFocusPoint:", self->_rotateStartFocusPoint.x, self->_rotateStartFocusPoint.y);
  if (self->_pitching)
    objc_msgSend(v4, "startPitchingWithFocusPoint:", self->_pitchStartFocusPoint.x, self->_pitchStartFocusPoint.y);

}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id WeakRetained;
  int v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  y = a4.y;
  x = a4.x;
  v17 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v10 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v11 = objc_loadWeakRetained((id *)&self->_cameraController);
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "centerScreenPoint");
  else
    objc_msgSend(v11, "scaledScreenPointForPoint:", x, y);
  v15 = v13;
  v16 = v14;

  -[VKGestureCameraBehavior tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v17, v15, v16, a3);
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  void (**v5)(void);

  v5 = (void (**)(void))a5;
  if (v5)
    v5[2]();

}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  self->_pinching = 1;
  self->_pinchStartFocusPoint = a3;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v8 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v9 = objc_loadWeakRetained((id *)p_cameraController);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "centerScreenPoint");
  else
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  v13 = v11;
  v14 = v12;

  -[VKGestureCameraBehavior beginZoom:](self, "beginZoom:", v13, v14);
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double x;
  double y;
  VKCameraController **p_cameraController;
  int v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  id v20;
  id v21;
  id v22;
  char v23;

  x = a3.x;
  if (a5 >= 0.01)
  {
    y = a3.y;
    p_cameraController = &self->_cameraController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
    v11 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

    v12 = objc_loadWeakRetained((id *)p_cameraController);
    if (v11)
      objc_msgSend(v12, "centerScreenPoint", v12);
    else
      objc_msgSend(v12, "scaledScreenPointForPoint:", x, y, v12);
    v15 = v13;
    v16 = v14;

    -[VKGestureCameraBehavior updateZoom:oldFactor:newFactor:](self, "updateZoom:oldFactor:newFactor:", v15, v16, a4, a5);
    if (self->_notifyCameraStateChanges)
    {
      v21 = objc_loadWeakRetained((id *)p_cameraController);
      objc_msgSend(v21, "cameraDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mapLayerDidChangeVisibleRegion");

      v22 = objc_loadWeakRetained((id *)p_cameraController);
      v18 = *(_QWORD *)objc_msgSend(v22, "runLoopController");
      if (v18)
      {
        v23 = 4;
        md::MapEngine::setNeedsTick(v18, &v23);
      }

    }
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  self->_pinching = 0;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v8 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v9 = objc_loadWeakRetained((id *)p_cameraController);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "centerScreenPoint");
  else
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  v13 = v11;
  v14 = v12;

  -[VKGestureCameraBehavior endZoom:](self, "endZoom:", v13, v14);
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;

  self->_panStartFocusPoint = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "scaledScreenPointForPoint:", self->_panStartFocusPoint.x, self->_panStartFocusPoint.y);
  v7 = v6;
  v9 = v8;

  self->_panStartScreenPoint.x = v7;
  self->_panStartScreenPoint.y = v9;
  self->_panLastScreenPoint.x = v7;
  self->_panLastScreenPoint.y = v9;
  self->_panning = 1;
  -[VKGestureCameraBehavior beginPan:](self, "beginPan:", v7, v9);
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  char v21;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "canvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v11, "canvas");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;

  v15 = self->_panStartScreenPoint.x + x / v10;
  v16 = self->_panStartScreenPoint.y - y / v14;
  -[VKGestureCameraBehavior updatePan:lastScreenPoint:](self, "updatePan:lastScreenPoint:", v15, v16, self->_panLastScreenPoint.x, self->_panLastScreenPoint.y);
  if (self->_notifyCameraStateChanges)
  {
    v17 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v17, "cameraDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapLayerDidChangeVisibleRegion");

    v19 = objc_loadWeakRetained((id *)p_cameraController);
    v20 = *(_QWORD *)objc_msgSend(v19, "runLoopController");
    if (v20)
    {
      v21 = 4;
      md::MapEngine::setNeedsTick(v20, &v21);
    }

  }
  self->_panLastScreenPoint.x = v15;
  self->_panLastScreenPoint.y = v16;
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  id WeakRetained;

  self->_panning = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "centerScreenPoint");
  -[VKGestureCameraBehavior endPan:](self, "endPan:");

}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;

  self->_rotateStartFocusPoint = a3;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v6 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v7 = objc_loadWeakRetained((id *)p_cameraController);
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "centerScreenPoint");
  else
    objc_msgSend(v7, "scaledScreenPointForPoint:", self->_rotateStartFocusPoint.x, self->_rotateStartFocusPoint.y);
  v11 = v9;
  v12 = v10;

  self->_lastRotation = 0.0;
  v13 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v13, "currentZoomLevel");
  self->_shouldRotationRubberband = v14 <= 6.0;

  -[VKGestureCameraBehavior beginRotate:](self, "beginRotate:", v11, v12);
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  int v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  id v21;
  id v22;
  id v23;
  char v24;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v9 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v10 = objc_loadWeakRetained((id *)p_cameraController);
  if (v9)
    objc_msgSend(v10, "centerScreenPoint", v10);
  else
    objc_msgSend(v10, "scaledScreenPointForPoint:", x, y, v10);
  v13 = v11;
  v14 = v12;

  if (self->_shouldRotationRubberband)
  {
    v15 = fabs(a4);
    if (v15 > 0.392699082)
      v15 = -0.261799388 / (v15 * 2.10084525 + 0.175) + 0.65449847;
    if (a4 >= 0.0)
      a4 = v15;
    else
      a4 = -v15;
  }
  v16 = fmod(a4 + 3.14159265 - self->_lastRotation, 6.28318531);
  v17 = fmod(v16 + 6.28318531, 6.28318531);
  self->_lastRotation = a4;
  -[VKGestureCameraBehavior updateRotate:atScreenPoint:](self, "updateRotate:atScreenPoint:", (double)(v17 + -3.14159265), v13, v14);
  if (self->_notifyCameraStateChanges)
  {
    v22 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v22, "cameraDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapLayerDidChangeVisibleRegion");

    v23 = objc_loadWeakRetained((id *)p_cameraController);
    v19 = *(_QWORD *)objc_msgSend(v23, "runLoopController");
    if (v19)
    {
      v24 = 4;
      md::MapEngine::setNeedsTick(v19, &v24);
    }

  }
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  v8 = objc_msgSend(WeakRetained, "staysCenteredDuringPinch");

  v9 = objc_loadWeakRetained((id *)p_cameraController);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "centerScreenPoint");
  else
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  v13 = v11;
  v14 = v12;

  -[VKGestureCameraBehavior endRotate:](self, "endRotate:", v13, v14);
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;

  self->_pitching = 1;
  self->_pitchStartFocusPoint = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "centerScreenPoint");
  v6 = v5;
  v8 = v7;

  self->_pitchStartScreenPoint.x = v6;
  self->_pitchStartScreenPoint.y = v8;
  -[VKGestureCameraBehavior beginPitch:](self, "beginPitch:", v6, v8);
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  VKCameraController **p_cameraController;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  id v14;
  id v15;
  char v16;

  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "centerScreenPoint");
  v8 = v7;
  v10 = v9;

  -[VKGestureCameraBehavior updatePitch:translation:](self, "updatePitch:translation:", v8, v10, a4 * 0.005);
  if (self->_notifyCameraStateChanges)
  {
    v14 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v14, "cameraDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerDidChangeVisibleRegion");

    v15 = objc_loadWeakRetained((id *)p_cameraController);
    v12 = *(_QWORD *)objc_msgSend(v15, "runLoopController");
    if (v12)
    {
      v16 = 4;
      md::MapEngine::setNeedsTick(v12, &v16);
    }

  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  VKCameraController **p_cameraController;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  id v14;
  id v15;
  char v16;

  p_cameraController = &self->_cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "centerScreenPoint");
  v8 = v7;
  v10 = v9;

  -[VKGestureCameraBehavior updatePitch:degrees:](self, "updatePitch:degrees:", v8, v10, a4);
  if (self->_notifyCameraStateChanges)
  {
    v14 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v14, "cameraDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerDidChangeVisibleRegion");

    v15 = objc_loadWeakRetained((id *)p_cameraController);
    v12 = *(_QWORD *)objc_msgSend(v15, "runLoopController");
    if (v12)
    {
      v16 = 4;
      md::MapEngine::setNeedsTick(v12, &v16);
    }

  }
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;

  self->_pitching = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "centerScreenPoint");
  v6 = v5;
  v8 = v7;

  -[VKGestureCameraBehavior endPitch:](self, "endPitch:", v6, v8);
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)isGesturing
{
  if (self->_panning)
    return 1;
  if (self->_rotating)
    return 1;
  if (self->_pinching)
    return 1;
  return self->_pitching;
}

- (BOOL)isPitching
{
  return self->_pitching;
}

- (BOOL)isPanning
{
  return self->_panning;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (BOOL)allowsZoomRubberbanding
{
  return self->_allowsZoomRubberbanding;
}

- (void)setAllowsZoomRubberbanding:(BOOL)a3
{
  self->_allowsZoomRubberbanding = a3;
}

@end
