@implementation _UIDigitizerGestureRecognizerImp

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  id WeakRetained;
  id v12;

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8 = v7 - self->_pressEndTime;
    objc_msgSend(a4, "_digitizerLocation");
    self->_digitizerLocation.x = v9;
    self->_digitizerLocation.y = v10;
    self->_numberOfActiveTouches += objc_msgSend(a3, "count");
    if (v8 < self->_pressEndToTouchBeginDuration && self->_lastRecognitionTime != self->_pressEndTime)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_waitingForTouchesAfterPressTimer);
      objc_msgSend(WeakRetained, "invalidate");

      objc_storeWeak((id *)&self->_waitingForTouchesAfterPressTimer, 0);
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "touchesBeganSuccessfully:", self);

    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  CGFloat v6;
  CGFloat v7;

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation", a3))
  {
    objc_msgSend(a4, "_digitizerLocation");
    self->_digitizerLocation.x = v6;
    self->_digitizerLocation.y = v7;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CGFloat v7;
  CGFloat v8;
  int64_t numberOfActiveTouches;
  uint64_t v10;
  double v11;

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation"))
  {
    objc_msgSend(a4, "_digitizerLocation");
    self->_digitizerLocation.x = v7;
    self->_digitizerLocation.y = v8;
    numberOfActiveTouches = self->_numberOfActiveTouches;
    v10 = objc_msgSend(a3, "count");
    self->_numberOfActiveTouches = (numberOfActiveTouches - v10) & ~((numberOfActiveTouches - v10) >> 63);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_touchEndTime = v11;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  CGFloat v6;
  CGFloat v7;
  int64_t numberOfActiveTouches;
  uint64_t v9;
  double v10;

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation", a3, a4))
  {
    -[_UIDigitizerGestureRecognizerImp defaultDigitizerLocation](self, "defaultDigitizerLocation");
    self->_digitizerLocation.x = v6;
    self->_digitizerLocation.y = v7;
    numberOfActiveTouches = self->_numberOfActiveTouches;
    v9 = objc_msgSend(a3, "count");
    self->_numberOfActiveTouches = (numberOfActiveTouches - v9) & ~((numberOfActiveTouches - v9) >> 63);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_touchEndTime = v10;
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  double v5;
  void *v6;
  NSTimer **p_waitingForTouchesAfterPressTimer;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3, a4);
  self->_pressBeginTime = v5;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__minimumPressDurationTimerFired_, 0, 0, self->_minimumPressDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_minimumPressDurationTimer, v6);

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation"))
  {
    p_waitingForTouchesAfterPressTimer = &self->_waitingForTouchesAfterPressTimer;
    WeakRetained = objc_loadWeakRetained((id *)p_waitingForTouchesAfterPressTimer);
    objc_msgSend(WeakRetained, "invalidate");

    objc_storeWeak((id *)p_waitingForTouchesAfterPressTimer, 0);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  double v7;
  double v8;
  double touchEndTime;
  double v10;
  id WeakRetained;
  void *v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  touchEndTime = self->_touchEndTime;
  v10 = v7 - self->_pressBeginTime;
  WeakRetained = objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&self->_minimumPressDurationTimer, 0);
  self->_pressEndTime = v8;
  if (self->_minimumPressDuration > v10 || v10 >= self->_maximumPressDuration)
    goto LABEL_11;
  if (!-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation"))
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "pressesEndedSuccessfully:", self);
LABEL_10:

    goto LABEL_11;
  }
  if (self->_numberOfActiveTouches <= 0 && v8 - touchEndTime >= self->_touchEndToPressEndDuration)
  {
    if (!-[_UIDigitizerGestureRecognizerImp _senderOfPressesHasTouchSurface:withEvent:](self, "_senderOfPressesHasTouchSurface:withEvent:", a3, a4, v8 - touchEndTime)|| -[_UIDigitizerGestureRecognizerImp _senderOfPressesIsSoftwareRemoteWithEvent:](self, "_senderOfPressesIsSoftwareRemoteWithEvent:", a4))
    {
      -[_UIDigitizerGestureRecognizerImp defaultDigitizerLocation](self, "defaultDigitizerLocation");
      self->_digitizerLocation.x = v14;
      self->_digitizerLocation.y = v15;
LABEL_20:
      self->_lastRecognitionTime = v8;
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "pressesEndedSuccessfully:", self);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__waitingForTouchesAfterPressTimerFired_, 0, 0, self->_pressEndToTouchBeginDuration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_waitingForTouchesAfterPressTimer, v12);
    goto LABEL_10;
  }
  if (-[_UIDigitizerGestureRecognizerImp _senderOfPressesHasTouchSurface:withEvent:](self, "_senderOfPressesHasTouchSurface:withEvent:", a3, a4)|| -[_UIDigitizerGestureRecognizerImp _senderOfPressesIsSoftwareRemoteWithEvent:](self, "_senderOfPressesIsSoftwareRemoteWithEvent:", a4))
  {
    goto LABEL_20;
  }
LABEL_11:
  if (v10 < self->_minimumPressDuration)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "pressesNotHeldLongEnough:", self);

  }
  if (v10 > self->_maximumPressDuration)
  {
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "pressesHeldOverMaximum:", self);
LABEL_15:

  }
}

- (BOOL)_shouldReportDigitizerLocation
{
  void *v2;
  BOOL v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_remoteTouchSurfaceType") != 2;

  return v3;
}

- (CGPoint)digitizerLocation
{
  double x;
  double y;
  CGPoint result;

  if (-[_UIDigitizerGestureRecognizerImp _shouldReportDigitizerLocation](self, "_shouldReportDigitizerLocation"))
  {
    x = self->_digitizerLocation.x;
    y = self->_digitizerLocation.y;
  }
  else
  {
    -[_UIDigitizerGestureRecognizerImp defaultDigitizerLocation](self, "defaultDigitizerLocation");
  }
  result.y = y;
  result.x = x;
  return result;
}

- (void)reset
{
  _UIDigitizerGestureRecognizerImp *v2;
  NSTimer **p_minimumPressDurationTimer;
  id WeakRetained;
  id v5;

  v2 = self;
  self->_numberOfActiveTouches = 0;
  p_minimumPressDurationTimer = &self->_minimumPressDurationTimer;
  *(_OWORD *)&self->_touchEndTime = 0u;
  *(_OWORD *)&self->_pressEndTime = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_minimumPressDurationTimer, 0);
  v2 = (_UIDigitizerGestureRecognizerImp *)((char *)v2 + 96);
  v5 = objc_loadWeakRetained((id *)&v2->super.isa);
  objc_msgSend(v5, "invalidate");

  objc_storeWeak((id *)&v2->super.isa, 0);
}

- (void)_minimumPressDurationTimerFired:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pressesHeldForMinimum:", self);

}

- (void)_waitingForTouchesAfterPressTimerFired:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pressesEndedSuccessfully:", self);

}

- (CGPoint)defaultDigitizerLocation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_senderOfPressesHasTouchSurface:(id)a3 withEvent:(id)a4
{
  uint64_t IntegerValue;
  uint64_t v8;
  char v9;
  BOOL v11;
  void *v12;
  char v13;
  void *v15;

  if (objc_msgSend(a4, "_hidEvent"))
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v8 == 65)
    {
      v9 = 0;
    }
    else
    {
      v11 = v8 != 158 && v8 != 40;
      v9 = IntegerValue != 7 || v11;
    }
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(a3, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "type") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDigitizerGestureRecognizers.m"), 322, &stru_1E16EDF20);

  }
  v13 = v9 & ~objc_msgSend(v12, "_isSynthetic");

  return v13;
}

- (BOOL)_senderOfPressesIsSoftwareRemoteWithEvent:(id)a3
{
  uint64_t IntegerValue;
  uint64_t v4;
  BOOL v5;
  uint64_t Children;
  const __CFArray *v7;
  CFIndex v8;
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;

  if (!objc_msgSend(a3, "_hidEvent"))
    return 0;
  IntegerValue = IOHIDEventGetIntegerValue();
  v4 = IOHIDEventGetIntegerValue();
  v5 = 0;
  if (IntegerValue != 12 || v4 != 128)
    return v5;
  Children = IOHIDEventGetChildren();
  if (!Children)
    return 0;
  v7 = (const __CFArray *)Children;
  v8 = 0;
  do
  {
    Count = CFArrayGetCount(v7);
    v5 = v8 < Count;
    if (v8 >= Count)
      break;
    CFArrayGetValueAtIndex(v7, v8);
    v10 = IOHIDEventGetIntegerValue();
    v11 = IOHIDEventGetIntegerValue();
    ++v8;
  }
  while (v10 != 65299 || v11 != 16);
  return v5;
}

- (_UIDigitizerGestureRecognizerImpDelegate)delegate
{
  return (_UIDigitizerGestureRecognizerImpDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (void)setDigitizerLocation:(CGPoint)a3
{
  self->_digitizerLocation = a3;
}

- (int64_t)numberOfActiveTouches
{
  return self->_numberOfActiveTouches;
}

- (void)setNumberOfActiveTouches:(int64_t)a3
{
  self->_numberOfActiveTouches = a3;
}

- (double)pressEndToTouchBeginDuration
{
  return self->_pressEndToTouchBeginDuration;
}

- (void)setPressEndToTouchBeginDuration:(double)a3
{
  self->_pressEndToTouchBeginDuration = a3;
}

- (double)touchEndToPressEndDuration
{
  return self->_touchEndToPressEndDuration;
}

- (void)setTouchEndToPressEndDuration:(double)a3
{
  self->_touchEndToPressEndDuration = a3;
}

- (double)touchEndTime
{
  return self->_touchEndTime;
}

- (void)setTouchEndTime:(double)a3
{
  self->_touchEndTime = a3;
}

- (double)pressBeginTime
{
  return self->_pressBeginTime;
}

- (void)setPressBeginTime:(double)a3
{
  self->_pressBeginTime = a3;
}

- (double)pressEndTime
{
  return self->_pressEndTime;
}

- (void)setPressEndTime:(double)a3
{
  self->_pressEndTime = a3;
}

- (double)lastRecognitionTime
{
  return self->_lastRecognitionTime;
}

- (void)setLastRecognitionTime:(double)a3
{
  self->_lastRecognitionTime = a3;
}

- (NSTimer)minimumPressDurationTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
}

- (void)setMinimumPressDurationTimer:(id)a3
{
  objc_storeWeak((id *)&self->_minimumPressDurationTimer, a3);
}

- (NSTimer)waitingForTouchesAfterPressTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_waitingForTouchesAfterPressTimer);
}

- (void)setWaitingForTouchesAfterPressTimer:(id)a3
{
  objc_storeWeak((id *)&self->_waitingForTouchesAfterPressTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_waitingForTouchesAfterPressTimer);
  objc_destroyWeak((id *)&self->_minimumPressDurationTimer);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
