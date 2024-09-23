@implementation PUCropGestureHandler

- (PUCropGestureHandler)initWithCropModel:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUCropGestureHandler;
  v5 = -[PUCropGestureHandler init](&v14, sel_init);
  v6 = (void *)*((_QWORD *)v5 + 29);
  *((_QWORD *)v5 + 29) = v4;
  v7 = v4;

  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 8) = 0u;
  *((_QWORD *)v5 + 32) = 0;
  *((_QWORD *)v5 + 33) = 0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("PUCropGestureHandlerAnimationQueue", v8);
  v10 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v9;

  *((_QWORD *)v5 + 31) = 0;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[198] = objc_msgSend(v11, "perspectiveViewDebugCropEnabled");

  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v5 + 136) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v5 + 152) = v12;
  *((_QWORD *)v5 + 9) = 0x3FF0000000000000;
  *((_QWORD *)v5 + 10) = 0;
  *((_QWORD *)v5 + 11) = 0;
  *((_QWORD *)v5 + 12) = 0x3FF0000000000000;
  *((_QWORD *)v5 + 28) = 0x4024000000000000;
  v5[200] = 1;
  objc_storeStrong((id *)v5 + 27, MEMORY[0x1E0C80D38]);

  *(_WORD *)(v5 + 201) = 1;
  return (PUCropGestureHandler *)v5;
}

- (void)reset
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_panPinchStartRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_panRubberBandDelta.dx = 0.0;
  self->_panRubberBandDelta.dy = 0.0;
  self->_panRubberBandOffset.dx = 0.0;
  self->_panRubberBandOffset.dy = 0.0;
  self->_panPinchStartRect.size = v2;
  self->_panState.scale = 1.0;
  self->_panState.modelSpaceTranslation.dx = 0.0;
  self->_panState.modelSpaceTranslation.dy = 0.0;
  self->_pinchState.scale = 1.0;
  self->_gesture = 0;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_isLogging = a3;
}

- (void)setAnimateEndGestureEnabled:(BOOL)a3
{
  self->_animateEndGesture = a3;
}

- (void)setDelegateQueue:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *delegateQueue;
  void *v7;

  v5 = (OS_dispatch_queue *)a3;
  if (v5 == (OS_dispatch_queue *)MEMORY[0x1E0C80D38])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegateQueue != dispatch_get_main_queue()"));

  }
  self->_delegateQueueIsMain = 0;
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v5;

}

- (id)delgateQueue
{
  return self->_delegateQueue;
}

- (CGSize)masterImageSize
{
  double v2;
  double v3;
  CGSize result;

  -[NUCropModel masterImageSize](self->_cropModel, "masterImageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_activateRequest
{
  if (!self->_isRequestActive)
  {
    self->_isRequestActive = 1;
    _UIUpdateRequestActivate();
  }
}

- (void)_deactivateRequest
{
  if (self->_isRequestActive)
  {
    self->_isRequestActive = 0;
    _UIUpdateRequestDeactivate();
  }
}

- (void)tearDown
{
  _UIUpdateRequestDispose();
}

- (void)_setGestureTypePan
{
  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", self->_gesture & 0xFFFFFFFFFFFFFFF8 | 4);
}

- (void)_setGestureTypePinch
{
  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", self->_gesture & 0xFFFFFFFFFFFFFFF4 | 8);
}

- (void)_clearGestureTypePitchYawRoll
{
  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", self->_gesture & 0xFFFFFFFFFFFFFFFCLL);
}

- (void)_clearGestureTypePan
{
  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", self->_gesture & 0xFFFFFFFFFFFFFFFBLL);
}

- (void)_clearGestureTypePinch
{
  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", self->_gesture & 0xFFFFFFFFFFFFFFF7);
}

- (void)_dispatchSyncOnDelegateQueue:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v6 = v4;
  if (self->_delegateQueueIsMain && (v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"), v4 = v6, v5))
    v6[2](v6);
  else
    dispatch_sync((dispatch_queue_t)self->_delegateQueue, v4);

}

- (void)_didTrack
{
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  PUCropGestureHandler *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __33__PUCropGestureHandler__didTrack__block_invoke;
    v5[3] = &unk_1E58ABCA8;
    v6 = WeakRetained;
    v7 = self;
    -[PUCropGestureHandler _dispatchSyncOnDelegateQueue:](self, "_dispatchSyncOnDelegateQueue:", v5);

  }
}

- (void)_setGestureType:(int64_t)a3
{
  const char *v6;
  int64_t gesture;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double height;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  PUCropGestureHandler *v29;
  _QWORD v30[4];
  id v31;
  PUCropGestureHandler *v32;
  _QWORD v33[4];
  id v34;
  PUCropGestureHandler *v35;

  if (self->_gesture != a3)
  {
    if (self->_isDebugging)
    {
      v6 = (unint64_t)a3 > 0xC ? "<incorrect enum value>" : off_1E58AB820[a3];
      printf(" _setGestureType:%s\n", v6);
      if ((a3 & 3) != 0)
      {
        puts(" pitching, yawing or rolling during a pan or pinch is not expected");
        if ((a3 & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(type & PUCropGestureTypePan) == 0"));

          if ((a3 & 8) == 0)
            goto LABEL_9;
        }
        else if ((a3 & 8) == 0)
        {
          goto LABEL_9;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(type & PUCropGestureTypePinch) == 0"));

      }
    }
LABEL_9:
    gesture = self->_gesture;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (WeakRetained && !gesture)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __40__PUCropGestureHandler__setGestureType___block_invoke;
      v33[3] = &unk_1E58ABCA8;
      v34 = WeakRetained;
      v35 = self;
      -[PUCropGestureHandler _dispatchSyncOnDelegateQueue:](self, "_dispatchSyncOnDelegateQueue:", v33);

    }
    if ((a3 & 0xC) == 0 || (gesture & 4) != 0 || (gesture & 8) != 0)
    {
      if ((a3 & 4) == 0 && (gesture & 4) != 0)
      {
        self->_panState.modelSpaceTranslation.dx = 0.0;
        self->_panState.modelSpaceTranslation.dy = 0.0;
      }
    }
    else
    {
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      self->_panPinchStartRect.origin.x = v10;
      self->_panPinchStartRect.origin.y = v11;
      self->_panPinchStartRect.size.width = v12;
      self->_panPinchStartRect.size.height = v13;
      -[PUCropGestureHandler _setZoomScale:](self, "_setZoomScale:", 1.0);
      if (self->_panPinchStartRect.size.width < 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_panPinchStartRect.size.width >= 1"));

      }
      if (self->_panPinchStartRect.size.height < 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_panPinchStartRect.size.height >= 1"));

      }
    }
    if ((a3 & 3) != 0)
    {
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      self->_pitchYawRollState.startCropRect.origin.x = v16;
      self->_pitchYawRollState.startCropRect.origin.y = v17;
      self->_pitchYawRollState.startCropRect.size.width = v18;
      self->_pitchYawRollState.startCropRect.size.height = height;
      if (v18 < 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_pitchYawRollState.startCropRect.size.width >= 1"));

        height = self->_pitchYawRollState.startCropRect.size.height;
      }
      if (height < 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_pitchYawRollState.startCropRect.size.height >= 1"));

      }
    }
    -[NUCropModel pitchRadians](self->_cropModel, "pitchRadians");
    self->_gestureStartPitch = v19;
    -[NUCropModel yawRadians](self->_cropModel, "yawRadians");
    self->_gestureStartYaw = v20;
    -[NUCropModel rollRadians](self->_cropModel, "rollRadians");
    self->_gestureStartRoll = v21;
    self->_gesture = a3;
    if (!v9)
      goto LABEL_30;
    if (gesture)
    {
      if (a3)
      {
LABEL_30:

        return;
      }
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __40__PUCropGestureHandler__setGestureType___block_invoke_2;
      v30[3] = &unk_1E58ABCA8;
      v31 = v9;
      v32 = self;
      -[PUCropGestureHandler _dispatchSyncOnDelegateQueue:](self, "_dispatchSyncOnDelegateQueue:", v30);

      if (a3)
        goto LABEL_30;
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __40__PUCropGestureHandler__setGestureType___block_invoke_3;
    v27[3] = &unk_1E58ABCA8;
    v28 = v9;
    v29 = self;
    -[PUCropGestureHandler _dispatchSyncOnDelegateQueue:](self, "_dispatchSyncOnDelegateQueue:", v27);

    goto LABEL_30;
  }
}

- (void)beginPan
{
  void *v4;

  if (self->_isLogging)
    puts("[handler beginPan];");
  -[PUCropGestureHandler _activateRequest](self, "_activateRequest");
  if (self->_inPanState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_inPanState"));

  }
  self->_inPanState = 1;
  -[PUCropGestureHandler _stopAnimatedPanTimer](self, "_stopAnimatedPanTimer");
  -[PUCropGestureHandler _setGestureTypePan](self, "_setGestureTypePan");
  self->_panState.modelSpaceTranslation.dx = 0.0;
  self->_panState.modelSpaceTranslation.dy = 0.0;
}

- (void)panWithTranslation:(CGVector)a3 velocity:(CGVector)a4
{
  CGFloat dy;
  CGFloat dx;
  double scale;
  double ScaledRect;
  double v9;
  double v10;
  double v11;

  dy = a3.dy;
  dx = a3.dx;
  if (self->_isLogging)
    printf("[handler panWithTranslation:CGVectorMake(%f, %f) velocity:CGVectorMake(%f, %f)];\n",
      a3.dx,
      a3.dy,
      a4.dx,
      a4.dy);
  if (self->_inPanState)
  {
    if (self->_isLogging && (self->_gesture & 4) == 0)
      puts("- NOT in pan state");
    self->_panState.modelSpaceTranslation.dx = dx;
    self->_panState.modelSpaceTranslation.dy = dy;
    scale = self->_pinchState.scale;
    if (scale != 1.0)
      -[PUCropGestureHandler _zoomWithScale:startCropRect:](self, "_zoomWithScale:startCropRect:", scale, self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height);
    ScaledRect = getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height, self->_panState.scale);
    -[PUCropGestureHandler _constrainedMoveCropRectBy:startRect:rubberband:](self, "_constrainedMoveCropRectBy:startRect:rubberband:", 1, self->_panState.modelSpaceTranslation.dx, self->_panState.modelSpaceTranslation.dy, ScaledRect, v9, v10, v11);
    -[PUCropGestureHandler _didTrack](self, "_didTrack");
  }
  else
  {
    NSLog(CFSTR("Pan gesture called out of order"), a2, a3.dx, a3.dy, a4.dx, a4.dy);
  }
}

- (void)endPanWithTranslation:(CGVector)a3 velocity:(CGVector)a4
{
  double dy;
  double dx;
  double v6;
  double v7;
  NSObject *v9;
  dispatch_time_t v10;
  PUCropGestureHandler *v11;
  OS_dispatch_source *panAnimationTimer;
  NSObject *v13;
  _QWORD handler[5];

  dy = a4.dy;
  dx = a4.dx;
  v6 = a3.dy;
  v7 = a3.dx;
  -[PUCropGestureHandler panWithTranslation:velocity:](self, "panWithTranslation:velocity:");
  if (self->_isLogging)
    printf("[handler endPanWithTranslation:CGVectorMake(%f, %f) velocity:CGVectorMake(%f, %f)];\n", v7, v6, dx, dy);
  self->_inPanState = 0;
  self->_panSlideVelocity.dx = dx;
  self->_panSlideVelocity.dy = dy;
  if (self->_animateEndGesture)
  {
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_animationQueue);
    v10 = dispatch_time(0, 8000000);
    dispatch_source_set_timer(v9, v10, 0x7A1200uLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke;
    handler[3] = &unk_1E58ABD10;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    v11 = self;
    objc_sync_enter(v11);
    panAnimationTimer = v11->_panAnimationTimer;
    v11->_panAnimationTimer = (OS_dispatch_source *)v9;
    v13 = v9;

    dispatch_resume(v13);
    objc_sync_exit(v11);

  }
  else
  {
    -[PUCropGestureHandler _stopAnimatedPan](self, "_stopAnimatedPan");
    -[PUCropGestureHandler _clearGestureTypePan](self, "_clearGestureTypePan");
  }
}

- (double)_zoomScaleForModelCropRect:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;
  double v10;

  height = a3.size.height;
  width = a3.size.width;
  -[PUCropGestureHandler masterImageSize](self, "masterImageSize", a3.origin.x, a3.origin.y);
  v7 = 1.0;
  if (width >= 1.0)
    v8 = width;
  else
    v8 = 1.0;
  result = v5 / v8;
  if (height >= 1.0)
    v7 = height;
  v10 = v6 / v7;
  if (result >= v10)
    return v10;
  return result;
}

- (double)_zoomScaleForCurrentCropRectAndModelRect
{
  double result;

  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropGestureHandler _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:");
  return result;
}

- (void)beginZoom
{
  void *v4;

  if (self->_isLogging)
    puts("[handler beginZoom];");
  -[PUCropGestureHandler _activateRequest](self, "_activateRequest");
  if (self->_inZoomState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_inZoomState"));

  }
  self->_inZoomState = 1;
  -[PUCropGestureHandler _stopAnimatedZoomTimer](self, "_stopAnimatedZoomTimer");
  -[PUCropGestureHandler _stopAnimatedPanTimer](self, "_stopAnimatedPanTimer");
  -[PUCropGestureHandler _setGestureTypePinch](self, "_setGestureTypePinch");
}

- (void)_setZoomScale:(double)a3
{
  double v5;
  double v6;
  double width;
  double height;
  double v9;
  double v10;
  double maximumZoomScale;
  double v12;
  double v13;
  CGFloat v14;

  self->_pinchState.scale = a3;
  self->_panState.scale = a3;
  -[PUCropGestureHandler masterImageSize](self, "masterImageSize");
  width = self->_panPinchStartRect.size.width;
  height = self->_panPinchStartRect.size.height;
  if (v5 < 1.0)
    v5 = 1.0;
  v9 = width / v5;
  if (v6 < 1.0)
    v6 = 1.0;
  v10 = height / v6;
  if (v9 >= v10)
    v9 = v10;
  if (v9 > a3)
    self->_panState.scale = v9;
  maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= a3)
    maximumZoomScale = self->_panState.scale;
  else
    self->_panState.scale = maximumZoomScale;
  getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, width, height, maximumZoomScale);
  if (v13 < 2.0 || v12 < 2.0)
  {
    v14 = self->_panPinchStartRect.size.height * 0.5;
    if (self->_panPinchStartRect.size.width * 0.5 < v14)
      v14 = self->_panPinchStartRect.size.width * 0.5;
    self->_panState.scale = v14;
  }
}

- (void)zoomWithScale:(double)a3 rubberband:(BOOL)a4
{
  _BOOL8 v4;
  double scale;
  double ScaledRect;
  double v9;
  double v10;
  double v11;
  void *v13;

  if (self->_inZoomState)
  {
    v4 = a4;
    if ((self->_gesture & 8) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_gesture & PUCropGestureTypePinch"));

    }
    -[PUCropGestureHandler _setZoomScale:](self, "_setZoomScale:", a3);
    scale = self->_pinchState.scale;
    if (scale != 1.0)
      -[PUCropGestureHandler _zoomWithScale:startCropRect:](self, "_zoomWithScale:startCropRect:", scale, self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height);
    ScaledRect = getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height, self->_panState.scale);
    -[PUCropGestureHandler _constrainedMoveCropRectBy:startRect:rubberband:](self, "_constrainedMoveCropRectBy:startRect:rubberband:", v4, self->_panState.modelSpaceTranslation.dx, self->_panState.modelSpaceTranslation.dy, ScaledRect, v9, v10, v11);
    -[PUCropGestureHandler _didTrack](self, "_didTrack");
  }
}

- (void)zoomWithScale:(double)a3
{
  if (self->_isLogging)
    printf("[handler zoomWithScale:%f];\n", a3);
  -[PUCropGestureHandler zoomWithScale:rubberband:](self, "zoomWithScale:rubberband:", 1, a3);
}

- (void)endZoomWithScale:(double)a3
{
  NSObject *v6;
  dispatch_time_t v7;
  PUCropGestureHandler *v8;
  OS_dispatch_source *zoomAnimationTimer;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD handler[5];

  if (self->_isLogging)
    printf("[handler endZoomWithScale:%f];\n", a3);
  -[PUCropGestureHandler zoomWithScale:rubberband:](self, "zoomWithScale:rubberband:", ((unint64_t)self->_gesture >> 2) & 1, a3);
  if (!self->_inZoomState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 489, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_inZoomState"));

  }
  self->_inZoomState = 0;
  if ((self->_gesture & 8) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_gesture & PUCropGestureTypePinch"));

  }
  if (self->_animateEndGesture)
  {
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_animationQueue);
    v7 = dispatch_time(0, 8000000);
    dispatch_source_set_timer(v6, v7, 0x7A1200uLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__PUCropGestureHandler_endZoomWithScale___block_invoke;
    handler[3] = &unk_1E58ABD10;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    v8 = self;
    objc_sync_enter(v8);
    zoomAnimationTimer = v8->_zoomAnimationTimer;
    v8->_zoomAnimationTimer = (OS_dispatch_source *)v6;
    v10 = v6;

    dispatch_resume(v10);
    objc_sync_exit(v8);

  }
  else
  {
    -[PUCropGestureHandler _stopAnimatedZoom](self, "_stopAnimatedZoom");
  }
}

- (void)_startPitchYawRollGestureTimeoutTimer
{
  PUCropGestureHandler *v2;
  uint64_t v3;
  NSObject *animationQueue;
  NSObject *v5;
  dispatch_time_t v6;
  OS_dispatch_source *pitchYawRollAnimationTimer;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v3 = MEMORY[0x1E0C809B0];
  animationQueue = v2->_animationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = v2;
  dispatch_async(animationQueue, block);
  if (!v2->_pitchYawRollAnimationTimer)
  {
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v2->_animationQueue);
    v6 = dispatch_time(0, 120000000);
    dispatch_source_set_timer(v5, v6, 0x7270E00uLL, 0x5F5E100uLL);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke_2;
    v9[3] = &unk_1E58ABD10;
    v9[4] = v2;
    dispatch_source_set_event_handler(v5, v9);
    pitchYawRollAnimationTimer = v2->_pitchYawRollAnimationTimer;
    v2->_pitchYawRollAnimationTimer = (OS_dispatch_source *)v5;
    v8 = v5;

    dispatch_resume(v8);
  }
  objc_sync_exit(v2);

}

- (void)setPitchAngle:(double)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;
  CGRect v10;
  CGRect v11;

  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", 1);
  x = self->_pitchYawRollState.startCropRect.origin.x;
  y = self->_pitchYawRollState.startCropRect.origin.y;
  width = self->_pitchYawRollState.startCropRect.size.width;
  height = self->_pitchYawRollState.startCropRect.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[NUCropModel setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v11), x, y, width, height, self->_gestureStartPitch);
  -[PUCropGestureHandler _didTrack](self, "_didTrack");
  -[PUCropGestureHandler _startPitchYawRollGestureTimeoutTimer](self, "_startPitchYawRollGestureTimeoutTimer");
}

- (void)setYawAngle:(double)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;
  CGRect v10;
  CGRect v11;

  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", 3);
  x = self->_pitchYawRollState.startCropRect.origin.x;
  y = self->_pitchYawRollState.startCropRect.origin.y;
  width = self->_pitchYawRollState.startCropRect.size.width;
  height = self->_pitchYawRollState.startCropRect.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[NUCropModel setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v11), x, y, width, height, self->_gestureStartYaw);
  -[PUCropGestureHandler _didTrack](self, "_didTrack");
  -[PUCropGestureHandler _startPitchYawRollGestureTimeoutTimer](self, "_startPitchYawRollGestureTimeoutTimer");
}

- (void)setRollAngle:(double)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;
  CGRect v10;
  CGRect v11;

  -[PUCropGestureHandler _setGestureType:](self, "_setGestureType:", 2);
  x = self->_pitchYawRollState.startCropRect.origin.x;
  y = self->_pitchYawRollState.startCropRect.origin.y;
  width = self->_pitchYawRollState.startCropRect.size.width;
  height = self->_pitchYawRollState.startCropRect.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[NUCropModel setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v11), x, y, width, height, self->_gestureStartRoll);
  -[PUCropGestureHandler _didTrack](self, "_didTrack");
  -[PUCropGestureHandler _startPitchYawRollGestureTimeoutTimer](self, "_startPitchYawRollGestureTimeoutTimer");
}

- (void)_zoomWithScale:(double)a3 startCropRect:(CGRect)a4
{
  double height;
  double y;
  double x;
  double ScaledRect;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double maximumZoomScale;
  double v22;
  double v23;
  double MidX;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double width;
  double v39;
  CGRect v40;
  CGRect v41;

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  width = a4.size.width;
  ScaledRect = getScaledRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PUCropGestureHandler masterImageSize](self, "masterImageSize");
  if (v12 >= 1.0)
    v17 = v12;
  else
    v17 = 1.0;
  v18 = v15 / v17;
  if (v14 >= 1.0)
    v19 = v14;
  else
    v19 = 1.0;
  v20 = v16 / v19;
  if (v18 < v20)
    v20 = v18;
  v39 = v20;
  if (v20 <= self->_maximumZoomScale)
  {
    -[NUCropModel setForZoomCropRect:newCropRect:](self->_cropModel, "setForZoomCropRect:newCropRect:", x, y, width, height, ScaledRect, v10, v12, v14);
    -[PUCropGestureHandler _zoomScaleForCurrentCropRectAndModelRect](self, "_zoomScaleForCurrentCropRectAndModelRect");
    if (v39 >= v25)
    {
      self->_zoomOverflow = 0.0;
    }
    else
    {
      v26 = v25;
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      if (v27 < 1.0)
        v27 = 1.0;
      v29 = self->_panPinchStartRect.size.width / v27;
      if (v28 >= 1.0)
        v30 = v28;
      else
        v30 = 1.0;
      if (v29 >= self->_panPinchStartRect.size.height / v30)
        v29 = self->_panPinchStartRect.size.height / v30;
      self->_panState.scale = v29;
      self->_zoomOverflow = (1.0 - 1.0 / ((v26 - v39) * 2.0 + 1.0)) * -0.5;
      if (self->_isDebugging)
        printf(" zoomWithScale - rubberband in (%.2f, %.2f)\n");
    }
  }
  else
  {
    -[PUCropGestureHandler masterImageSize](self, "masterImageSize");
    maximumZoomScale = self->_maximumZoomScale;
    v35 = v23 / maximumZoomScale;
    v36 = v22 / maximumZoomScale;
    v40.origin.x = ScaledRect;
    v40.origin.y = v10;
    v40.size.width = v12;
    v40.size.height = v14;
    v37 = height;
    MidX = CGRectGetMidX(v40);
    v41.origin.x = ScaledRect;
    v41.origin.y = v10;
    v41.size.width = v12;
    v41.size.height = v14;
    -[NUCropModel setForZoomCropRect:newCropRect:](self->_cropModel, "setForZoomCropRect:newCropRect:", x, y, width, v37, MidX - v36 * 0.5, CGRectGetMidY(v41) - v35 * 0.5);
    self->_zoomOverflow = (1.0 - 1.0 / ((v39 - self->_maximumZoomScale) * 0.25 * 2.0 + 1.0)) * 0.5 * 4.0;
    if (self->_isDebugging)
      printf(" zoomWithScale - rubberband out (%.2f, %.2f)\n");
  }
  if (self->_isLogging)
  {
    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    printf("// zoom cropRect = (%.3f, %.3f, %.3f, %.3f), scale = %f, offset = (%.2f, %.2f), v = (%.2f, %.2f), overflow = %.2f\n", v31, v32, v33, v34, self->_pinchState.scale, self->_panRubberBandOffset.dx, self->_panRubberBandOffset.dy, self->_panSlideVelocity.dx, self->_panSlideVelocity.dy, self->_zoomOverflow);
  }
}

- (void)_constrainedMoveCropRectBy:(CGVector)a3 startRect:(CGRect)a4 rubberband:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double dy;
  double dx;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  dy = a3.dy;
  dx = a3.dx;
  if (a4.size.width < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startRect.size.width >= 1"));

  }
  if (height < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropGestureHandler.m"), 621, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startRect.size.height >= 1"));

  }
  -[NUCropModel constrainedMoveCropRectBy:strict:startRect:](self->_cropModel, "constrainedMoveCropRectBy:strict:startRect:", 0, dx, dy, x, y, width, height);
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  if (v5)
  {
    -[NUCropModel cropRect](self->_cropModel, "cropRect", 0.0, 0.0);
    v14 = dx + x - v18;
    v15 = dy + y - v19;
    v20 = hypot(v14, v15);
    v21 = pow(0.999, v20) * 0.8 + 0.2;
    v16 = v14 * v21;
    v17 = v15 * v21;
  }
  self->_panRubberBandDelta.dx = v14;
  self->_panRubberBandDelta.dy = v15;
  self->_panRubberBandOffset.dx = v16;
  self->_panRubberBandOffset.dy = v17;
  if (self->_isLogging)
  {
    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    printf("// move t = (%.2f, %.2f), sr = (%.2f, %.2f, %.2f, %.2f), cropRect = (%.3f, %.3f, %.3f, %.3f), scale = %f, offset = (%.2f, %.2f), v = (%.2f, %.2f), overflow = %.2f\n", dx, dy, x, y, width, height, v22, v23, v24, v25, self->_pinchState.scale, self->_panRubberBandOffset.dx, self->_panRubberBandOffset.dy, self->_panSlideVelocity.dx, self->_panSlideVelocity.dy, self->_zoomOverflow);
  }
}

- (void)_stopAnimatedZoomTimer
{
  NSObject *zoomAnimationTimer;
  OS_dispatch_source *v3;
  PUCropGestureHandler *obj;

  obj = self;
  objc_sync_enter(obj);
  zoomAnimationTimer = obj->_zoomAnimationTimer;
  if (zoomAnimationTimer)
  {
    dispatch_source_cancel(zoomAnimationTimer);
    v3 = obj->_zoomAnimationTimer;
    obj->_zoomAnimationTimer = 0;

  }
  objc_sync_exit(obj);

}

- (void)_stopAnimatedZoom
{
  uint64_t v3;
  _QWORD block[5];

  -[PUCropGestureHandler _stopAnimatedZoomTimer](self, "_stopAnimatedZoomTimer");
  -[PUCropGestureHandler _clearGestureTypePinch](self, "_clearGestureTypePinch");
  v3 = MEMORY[0x1E0C809B0];
  self->_zoomOverflow = 0.0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __41__PUCropGestureHandler__stopAnimatedZoom__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_stopAnimatedPanTimer
{
  PUCropGestureHandler *v2;
  NSObject *panAnimationTimer;
  OS_dispatch_source *v4;

  v2 = self;
  objc_sync_enter(v2);
  panAnimationTimer = v2->_panAnimationTimer;
  if (panAnimationTimer)
  {
    dispatch_source_cancel(panAnimationTimer);
    v4 = v2->_panAnimationTimer;
    v2->_panAnimationTimer = 0;

  }
  objc_sync_exit(v2);

  -[PUCropGestureHandler _clearGestureTypePan](v2, "_clearGestureTypePan");
}

- (void)_stopAnimatedPan
{
  uint64_t v3;
  _QWORD block[5];

  -[PUCropGestureHandler _stopAnimatedPanTimer](self, "_stopAnimatedPanTimer");
  self->_panSlideVelocity = 0u;
  self->_panRubberBandDelta = 0u;
  self->_panState.modelSpaceTranslation.dx = 0.0;
  self->_panState.modelSpaceTranslation.dy = 0.0;
  v3 = MEMORY[0x1E0C809B0];
  self->_panRubberBandOffset.dx = 0.0;
  self->_panRubberBandOffset.dy = 0.0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __40__PUCropGestureHandler__stopAnimatedPan__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (PUCropGestureHandlerDelegate)delegate
{
  return (PUCropGestureHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (void)setMaximumZoomScale:(double)a3
{
  self->_maximumZoomScale = a3;
}

- (NUCropModel)cropModel
{
  return (NUCropModel *)objc_getProperty(self, a2, 232, 1);
}

- (CGVector)panRubberBandOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_panRubberBandOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (double)zoomOverflow
{
  return self->_zoomOverflow;
}

- (int64_t)gesture
{
  return self->_gesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_zoomAnimationTimer, 0);
  objc_storeStrong((id *)&self->_panAnimationTimer, 0);
  objc_storeStrong((id *)&self->_pitchYawRollAnimationTimer, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
}

uint64_t __40__PUCropGestureHandler__stopAnimatedPan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateRequest");
}

uint64_t __41__PUCropGestureHandler__stopAnimatedZoom__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateRequest");
}

uint64_t __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 192) = 3;
  return result;
}

uint64_t __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 192);
  v3 = __OFSUB__(v2--, 1);
  *(_DWORD *)(v1 + 192) = v2;
  if ((v2 < 0) ^ v3 | (v2 == 0))
  {
    v4 = result;
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(result + 32) + 48));
    v5 = *(_QWORD *)(v4 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    return objc_msgSend(*(id *)(v4 + 32), "_clearGestureTypePitchYawRoll");
  }
  return result;
}

void __41__PUCropGestureHandler_endZoomWithScale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  *(double *)(*(_QWORD *)(a1 + 32) + 240) = *(double *)(*(_QWORD *)(a1 + 32) + 240) * 0.92;
  objc_msgSend(*(id *)(a1 + 32), "_didTrack");
  v2 = *(_QWORD *)(a1 + 32);
  if (fabs(*(double *)(v2 + 240)) < 0.005)
  {
    v3 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PUCropGestureHandler_endZoomWithScale___block_invoke_2;
    block[3] = &unk_1E58ABD10;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __41__PUCropGestureHandler_endZoomWithScale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAnimatedZoom");
}

void __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float64x2_t v3;
  id *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  float64x2_t v11;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(float64x2_t *)(v2 + 24);
  v11 = vmlaq_f64(vmulq_f64(v3, (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)), (float64x2_t)vdupq_n_s64(0x3FEA3D70A3D70A3DuLL), *(float64x2_t *)(v2 + 8));
  *(double *)(v2 + 24) = 0.94 * v3.f64[0];
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = *(double *)(*(_QWORD *)(a1 + 32) + 32) * 0.94;
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[29], "cropRect");
  objc_msgSend(v4, "_constrainedMoveCropRectBy:startRect:rubberband:", 1, *(_OWORD *)&v11, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "_didTrack");
  v9 = *(_QWORD *)(a1 + 32);
  if (hypot(*(long double *)(v9 + 24), *(long double *)(v9 + 32)) < 16.0
    && hypot(*(long double *)(v9 + 256), *(long double *)(v9 + 264)) < 0.1)
  {
    v10 = *(NSObject **)(v9 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke_2;
    block[3] = &unk_1E58ABD10;
    block[4] = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAnimatedPan");
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willBeginTrackingWithCropGestureHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didBeginTrackingWithCropGestureHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTrackingWithCropGestureHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__PUCropGestureHandler__didTrack__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTrackWithCropGestureHandler:", *(_QWORD *)(a1 + 40));
}

@end
