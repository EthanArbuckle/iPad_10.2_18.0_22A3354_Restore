@implementation CACTouchEventObserver

- (CACTouchEventObserver)init
{
  CACTouchEventObserver *v2;
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  AXEventProcessor *eventProcessor;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CACTouchEventObserver;
  v2 = -[CACTouchEventObserver init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE00618]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:", v5, 33, 0, 0);
    eventProcessor = v2->_eventProcessor;
    v2->_eventProcessor = (AXEventProcessor *)v6;

    objc_initWeak(&location, v2);
    -[AXEventProcessor setHIDEventFilterMask:](v2->_eventProcessor, "setHIDEventFilterMask:", 1);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __29__CACTouchEventObserver_init__block_invoke;
    v9[3] = &unk_24F2AC728;
    objc_copyWeak(&v10, &location);
    -[AXEventProcessor setHIDEventHandler:](v2->_eventProcessor, "setHIDEventHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __29__CACTouchEventObserver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__CACTouchEventObserver_init__block_invoke_2;
  v8[3] = &unk_24F2AAD70;
  v9 = WeakRetained;
  v10 = v3;
  v5 = v3;
  v6 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  return 0;
}

uint64_t __29__CACTouchEventObserver_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveEvent:", *(_QWORD *)(a1 + 40));
}

- (void)beginObserving
{
  AXEventProcessor *eventProcessor;
  objc_class *v3;
  id v4;

  eventProcessor = self->_eventProcessor;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor beginHandlingHIDEventsForReason:](eventProcessor, "beginHandlingHIDEventsForReason:", v4);

}

- (void)endObserving
{
  AXEventProcessor *eventProcessor;
  objc_class *v3;
  id v4;

  eventProcessor = self->_eventProcessor;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor endHandlingHIDEventsForReason:](eventProcessor, "endHandlingHIDEventsForReason:", v4);

}

- (BOOL)isRecording
{
  void *v2;
  BOOL v3;

  -[CACTouchEventObserver gestureBeingRecorded](self, "gestureBeingRecorded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)startRecordingGesture
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x24BE00678]);
  -[CACTouchEventObserver setGestureBeingRecorded:](self, "setGestureBeingRecorded:", v3);

  -[CACTouchEventObserver setStartTimeForGestureBeingRecorded:](self, "setStartTimeForGestureBeingRecorded:", 0.0);
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showLiveRecordingGesturePreview");

}

- (id)stopRecordingGesture
{
  void *v3;
  void *v4;

  -[CACTouchEventObserver gestureBeingRecorded](self, "gestureBeingRecorded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACTouchEventObserver setGestureBeingRecorded:](self, "setGestureBeingRecorded:", 0);
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideLiveRecordingGesturePreview");

  return v3;
}

- (BOOL)_isTouchEvent:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "handInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventType");

  return (v4 - 1) < 2;
}

- (BOOL)_isLiftEvent:(id)a3
{
  void *v3;
  unsigned int v4;

  objc_msgSend(a3, "handInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventType");

  return (v4 < 0xB) & (0x740u >> v4);
}

- (void)_recordEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v4, "handInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "pathIdentity"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CACTouchEventObserver _isLiftEvent:](self, "_isLiftEvent:", v4))
        {
          +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeTrackingForFingerIdentifier:", v12);
        }
        else
        {
          objc_msgSend(v11, "pathLocation");
          v15 = v14;
          v17 = v16;
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bounds");
          CACPortraitUpRectFromViewRect(0, v19, v20, v21, v22);
          v24 = v23;
          v26 = v25;

          objc_msgSend(MEMORY[0x24BDD1968], "axValueWithCGPoint:", CACViewPointFromPortraitUpPoint(0, v15 * v24, v17 * v26));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, v12);

          v28 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v11, "orbValue");
          objc_msgSend(v28, "numberWithFloat:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v8);
  }

  if (!dword_255A8CB34)
    mach_timebase_info((mach_timebase_info_t)&_recordEvent___TimebaseInfo);
  v29 = objc_msgSend(v4, "HIDTime");
  v30 = (double)(v29 * (unint64_t)_recordEvent___TimebaseInfo / dword_255A8CB34)
      / 1000000000.0;
  -[CACTouchEventObserver startTimeForGestureBeingRecorded](self, "startTimeForGestureBeingRecorded");
  if (v31 == 0.0)
  {
    -[CACTouchEventObserver setStartTimeForGestureBeingRecorded:](self, "setStartTimeForGestureBeingRecorded:", v30);
    v32 = 0.0;
  }
  else
  {
    -[CACTouchEventObserver startTimeForGestureBeingRecorded](self, "startTimeForGestureBeingRecorded");
    v32 = v30 - v33;
  }
  -[CACTouchEventObserver gestureBeingRecorded](self, "gestureBeingRecorded");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addPointsByFingerIdentifier:forces:atTime:", v37, v36, v32);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addPointsToLiveRecordingGesturePreviewByFingerIdentifier:forces:atTime:", v37, v36, v32);

}

- (void)_didReceiveEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CACTouchEventObserver gestureBeingRecorded](self, "gestureBeingRecorded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[CACTouchEventObserver _recordEvent:](self, "_recordEvent:", v6);
  if (objc_msgSend(v6, "senderID") != 0x8000000817319372)
  {
    if (-[CACTouchEventObserver _isTouchEvent:](self, "_isTouchEvent:", v6))
    {
      if (!self->_areTouchesDown)
      {
        self->_areTouchesDown = 1;
        -[CACTouchEventObserver delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "didObserveFirstTouchDownForObserver:", self);
LABEL_10:

      }
    }
    else if (-[CACTouchEventObserver _isLiftEvent:](self, "_isLiftEvent:", v6) && self->_areTouchesDown)
    {
      self->_areTouchesDown = 0;
      -[CACTouchEventObserver delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didObserveLastTouchUpForObserver:", self);
      goto LABEL_10;
    }
  }

}

- (CACTouchEventObserverDelegate)delegate
{
  return (CACTouchEventObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXMutableReplayableGesture)gestureBeingRecorded
{
  return self->_gestureBeingRecorded;
}

- (void)setGestureBeingRecorded:(id)a3
{
  objc_storeStrong((id *)&self->_gestureBeingRecorded, a3);
}

- (double)startTimeForGestureBeingRecorded
{
  return self->_startTimeForGestureBeingRecorded;
}

- (void)setStartTimeForGestureBeingRecorded:(double)a3
{
  self->_startTimeForGestureBeingRecorded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureBeingRecorded, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
}

@end
