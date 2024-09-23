@implementation TKVibrationRecorderTouchSurface

- (TKVibrationRecorderTouchSurface)initWithVibrationPatternMaximumDuration:(double)a3 styleProvider:(id)a4
{
  TKVibrationRecorderTouchSurface *v5;
  TKVibrationRecorderTouchSurface *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKVibrationRecorderTouchSurface;
  v5 = -[TKVibrationRecorderRippleView initWithStyleProvider:](&v9, sel_initWithStyleProvider_, a4);
  v6 = v5;
  if (v5)
  {
    -[TKVibrationRecorderTouchSurface setMultipleTouchEnabled:](v5, "setMultipleTouchEnabled:", 0);
    -[TKVibrationRecorderTouchSurface setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    -[TKVibrationRecorderTouchSurface setClipsToBounds:](v6, "setClipsToBounds:", 1);
    TLLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderTouchSurface setAccessibilityLabel:](v6, "setAccessibilityLabel:", v7);

    -[TKVibrationRecorderTouchSurface setAccessibilityHint:](v6, "setAccessibilityHint:", 0);
    v6->_vibrationPatternMaximumDuration = a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TKVibrationRecorderTouchSurface exitRecordingMode](self, "exitRecordingMode");
  -[TKVibrationRecorderTouchSurface exitReplayMode](self, "exitReplayMode");
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderTouchSurface;
  -[TKVibrationRecorderRippleView dealloc](&v3, sel_dealloc);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  -[TKVibrationRecorderTouchSurface delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((self->_isRecordingModeEnabled
     || self->_isReplayModeEnabled
     || objc_msgSend(v6, "vibrationRecorderTouchSurfaceDidEnterRecordingMode:", self)
     && self->_isRecordingModeEnabled)
    && (!a4 || !v14 || !self->_isReplayModeEnabled))
  {
    objc_msgSend(v14, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "locationInView:", self);
      v11 = v10;
      v13 = v12;
    }
    else
    {
      v11 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    }
    if (self->_isRecordingModeEnabled)
    {
      self->_shouldIgnoreCurrentTouch = 0;
      -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 1, v11, v13);
      -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v11, v13);
      objc_msgSend(v7, "vibrationComponentDidStartForVibrationRecorderTouchSurface:", self);
    }
    else
    {
      -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v11, v13);
    }

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 isRecordingModeEnabled;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Height;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  v6 = a4;
  isRecordingModeEnabled = self->_isRecordingModeEnabled;
  if ((self->_isReplayModeEnabled || isRecordingModeEnabled)
    && (!self->_isRecordingModeEnabled || !self->_shouldIgnoreCurrentTouch)
    && (!v23 || !v6 || !self->_isReplayModeEnabled))
  {
    -[TKVibrationRecorderTouchSurface bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v23, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "locationInView:", self);
      v19 = v18;
      v21 = v20;
    }
    else
    {
      v19 = *MEMORY[0x24BDBEFB0];
      v21 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    }
    Height = 0.0;
    if (v21 >= 0.0)
    {
      v24.origin.x = v9;
      v24.origin.y = v11;
      v24.size.width = v13;
      v24.size.height = v15;
      Height = v21;
      if (v21 > CGRectGetHeight(v24))
      {
        v25.origin.x = v9;
        v25.origin.y = v11;
        v25.size.width = v13;
        v25.size.height = v15;
        Height = CGRectGetHeight(v25);
      }
    }
    if (isRecordingModeEnabled)
      -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 2, v19, Height);
    -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:", v19, Height);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 isRecordingModeEnabled;
  int v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  isRecordingModeEnabled = self->_isRecordingModeEnabled;
  v8 = self->_isReplayModeEnabled || isRecordingModeEnabled;
  if (!self->_isReplayModeEnabled)
  {
    if (!v8)
      goto LABEL_19;
LABEL_12:
    objc_msgSend(v19, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "locationInView:", self);
      v15 = v14;
      v17 = v16;
      if (isRecordingModeEnabled)
        goto LABEL_14;
    }
    else
    {
      v15 = *MEMORY[0x24BDBEFB0];
      v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (isRecordingModeEnabled)
      {
LABEL_14:
        -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 3, v15, v17);
        if (!self->_shouldIgnoreCurrentTouch)
        {
          -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v15, v17);
          -[TKVibrationRecorderTouchSurface delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "vibrationComponentDidEndForVibrationRecorderTouchSurface:", self);

        }
        goto LABEL_18;
      }
    }
    -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v15, v17);
LABEL_18:

    goto LABEL_19;
  }
  v9 = objc_msgSend(v19, "count");
  if (v6)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8 && (v11 & 1) == 0)
    goto LABEL_12;
LABEL_19:

}

- (void)enterRecordingMode
{
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *v3;
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *recordedDataWrapper;

  if (!self->_isRecordingModeEnabled)
  {
    self->_isRecordingModeEnabled = 1;
    v3 = -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper initWithVibrationPatternMaximumDuration:]([TKVibrationRecorderTouchSurfaceRecordedDataWrapper alloc], "initWithVibrationPatternMaximumDuration:", self->_vibrationPatternMaximumDuration);
    recordedDataWrapper = self->_recordedDataWrapper;
    self->_recordedDataWrapper = v3;

  }
}

- (void)exitRecordingMode
{
  void *v3;
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *recordedDataWrapper;
  id v5;

  if (self->_isRecordingModeEnabled)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    -[TKVibrationRecorderTouchSurface touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v5, 0);
    self->_isRecordingModeEnabled = 0;
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper didStopRecording](self->_recordedDataWrapper, "didStopRecording");
    -[TKVibrationRecorderTouchSurface delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vibrationRecorderTouchSurface:didExitRecordingModeWithContextObject:", self, self->_recordedDataWrapper);

    recordedDataWrapper = self->_recordedDataWrapper;
    self->_recordedDataWrapper = 0;

  }
}

- (void)currentVibrationComponentShouldEnd
{
  id v3;

  if (self->_isRecordingModeEnabled)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    -[TKVibrationRecorderTouchSurface touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v3, 0);
    self->_shouldIgnoreCurrentTouch = 1;

  }
}

- (void)_recordTouchLocation:(CGPoint)a3 touchPhase:(int)a4
{
  uint64_t v4;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat width;
  CGFloat height;
  double v12;
  CGRect v13;
  CGRect v14;

  v4 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  -[TKVibrationRecorderTouchSurface bounds](self, "bounds");
  v8 = v13.origin.x;
  v9 = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v12 = x / CGRectGetWidth(v13);
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = width;
  v14.size.height = height;
  -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:](self->_recordedDataWrapper, "recordNormalizedTouchLocation:touchPhase:", v4, v12, y / CGRectGetHeight(v14));
}

- (void)enterReplayModeWithVibrationPattern:(id)a3
{
  id v5;
  double v6;
  void *v7;
  NSCopying *v8;
  NSCopying *displayLinkManagerObserverToken;
  _QWORD v10[5];

  v5 = a3;
  if (!self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 1;
    objc_storeStrong((id *)&self->_vibrationPatternToReplay, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_replayModeWasEnteredStartTime = v6;
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__TKVibrationRecorderTouchSurface_enterReplayModeWithVibrationPattern___block_invoke;
    v10[3] = &unk_24D380388;
    v10[4] = self;
    objc_msgSend(v7, "addObserverWithHandler:", v10);
    v8 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = v8;

  }
}

uint64_t __71__TKVibrationRecorderTouchSurface_enterReplayModeWithVibrationPattern___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTouchLocationForReplayMode:", a2);
}

- (void)exitReplayMode
{
  TLVibrationPattern *vibrationPatternToReplay;
  void *v4;
  NSCopying *displayLinkManagerObserverToken;
  id v6;

  if (self->_isReplayModeEnabled)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    -[TKVibrationRecorderTouchSurface touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v6, 0);
    self->_isReplayModeEnabled = 0;
    vibrationPatternToReplay = self->_vibrationPatternToReplay;
    self->_vibrationPatternToReplay = 0;

    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserverWithToken:", self->_displayLinkManagerObserverToken);

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;

  }
}

- (void)_updateTouchLocationForReplayMode:(id)a3
{
  double v4;
  double v5;
  void *v6;
  int v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  int v19;
  __int128 v20;
  CGRect v21;
  CGRect v22;

  v20 = *MEMORY[0x24BDBEFB0];
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", a3);
  v5 = v4 - self->_replayModeWasEnteredStartTime;
  -[TLVibrationPattern contextObject](self->_vibrationPatternToReplay, "contextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getNormalizedTouchLocation:touchPhase:forTimeInterval:", &v20, &v19, v5);

  if (v7)
  {
    if (v19)
    {
      -[TKVibrationRecorderTouchSurface bounds](self, "bounds");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      v12 = *(double *)&v20;
      v13 = v12 * CGRectGetWidth(v21);
      v14 = *((double *)&v20 + 1);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v15 = v14 * CGRectGetHeight(v22);
      v16 = -[TKVibrationRecorderRippleView _isTouchDown](self, "_isTouchDown");
      if (v19 == 2 && !v16)
      {
        v19 = 1;
LABEL_6:
        -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v13, v15);
        return;
      }
      if (v19 == 1 && v16)
      {
        v19 = 2;
LABEL_14:
        -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:", v13, v15);
        return;
      }
      switch(v19)
      {
        case 3:
          -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v13, v15);
          break;
        case 2:
          goto LABEL_14;
        case 1:
          goto LABEL_6;
      }
    }
  }
  else
  {
    -[TKVibrationRecorderTouchSurface exitReplayMode](self, "exitReplayMode");
    -[TKVibrationRecorderTouchSurface delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "vibrationRecorderTouchSurfaceDidFinishReplayingVibration:", self);

  }
}

- (TKVibrationRecorderTouchSurfaceDelegate)delegate
{
  return (TKVibrationRecorderTouchSurfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_vibrationPatternToReplay, 0);
  objc_storeStrong((id *)&self->_recordedDataWrapper, 0);
}

@end
