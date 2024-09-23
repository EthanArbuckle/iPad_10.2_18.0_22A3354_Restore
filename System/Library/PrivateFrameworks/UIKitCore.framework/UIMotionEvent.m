@implementation UIMotionEvent

- (void)_willSuspend
{
  _BOOL8 v3;

  v3 = -[UIMotionEvent _detectWhenNotActive](self, "_detectWhenNotActive");
  -[BKSAccelerometer setAccelerometerEventsEnabled:](self->_motionAccelerometer, "setAccelerometerEventsEnabled:", v3);
  if (!v3)
    -[UIMotionEvent _idleTimerFired](self, "_idleTimerFired");
}

- (void)_updateAccelerometerEnabled
{
  int v3;
  _BOOL4 v4;

  if ((objc_msgSend((id)UIApp, "_isActivated") & 1) == 0)
  {
    v3 = -[BKSAccelerometer accelerometerEventsEnabled](self->_motionAccelerometer, "accelerometerEventsEnabled");
    v4 = -[UIMotionEvent _detectWhenNotActive](self, "_detectWhenNotActive");
    if (!v3 || v4)
    {
      if (((v3 | !v4) & 1) == 0)
        -[UIMotionEvent _willResume](self, "_willResume");
    }
    else
    {
      -[UIMotionEvent _willSuspend](self, "_willSuspend");
    }
  }
}

- (BOOL)_detectWhenNotActive
{
  if ((objc_msgSend((id)UIApp, "_supportsShakesWhenNotActive") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)UIApp, "_needsShakesWhenInactive");
}

- (id)_init
{
  id v2;
  id v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  uint64_t state64;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIMotionEvent;
  v2 = -[UIEvent _init](&v10, sel__init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D00C40]);
    v4 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v3;

    objc_msgSend(*((id *)v2 + 15), "setDelegate:", v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__screenBlanked, CFSTR("com.apple.springboard.hasBlankedScreen"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    notify_register_check("com.apple.springboard.hasBlankedScreen", (int *)v2 + 66);
    state64 = 0;
    if (!notify_get_state(*((_DWORD *)v2 + 66), &state64))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", state64);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_enablePeakDetectionForScreenBlanked:", v6);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__willResume, CFSTR("UIApplicationDidBecomeActiveNotification"), UIApp);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__willSuspend, CFSTR("UIApplicationSuspendedNotification"), UIApp);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__updateAccelerometerEnabled, CFSTR("UIWindowDidBecomeVisibleNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__updateAccelerometerEnabled, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

  }
  return v2;
}

- (void)_enablePeakDetectionForScreenBlanked:(id)a3
{
  double v4;
  float v5;
  double v6;
  double v7;

  if (objc_msgSend(a3, "BOOLValue"))
    v5 = 0.0;
  else
    v5 = 1.9;
  *(float *)&v4 = v5;
  -[BKSAccelerometer setXThreshold:](self->_motionAccelerometer, "setXThreshold:", v4);
  *(float *)&v6 = v5;
  -[BKSAccelerometer setYThreshold:](self->_motionAccelerometer, "setYThreshold:", v6);
  *(float *)&v7 = v5;
  -[BKSAccelerometer setZThreshold:](self->_motionAccelerometer, "setZThreshold:", v7);
}

- (void)_willResume
{
  -[BKSAccelerometer setAccelerometerEventsEnabled:](self->_motionAccelerometer, "setAccelerometerEventsEnabled:", 1);
}

- (void)_idleTimerFired
{
  CFTimeInterval v3;
  NSTimer *idleTimer;
  id WeakRetained;

  v3 = self->_lastMovementTime + 3.0;
  if (v3 < CACurrentMediaTime())
  {
    -[NSTimer invalidate](self->_idleTimer, "invalidate");
    idleTimer = self->_idleTimer;
    self->_idleTimer = 0;

    -[BKSAccelerometer setUpdateInterval:](self->_motionAccelerometer, "setUpdateInterval:", 0.0);
    if (self->_sentMotionBegan)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      -[UIEventEnvironment _sendMotionCancelled:]((uint64_t)WeakRetained, 1);

      self->_sentMotionBegan = 0;
    }
    -[UIMotionEvent _resetLowPassState](self, "_resetLowPassState");
    self->_stateMachineState = 0;
  }
}

- (void)_resetLowPassState
{
  *(_OWORD *)self->_lowPassState = 0u;
  *(_OWORD *)&self->_lowPassState[4] = 0u;
  *(_QWORD *)&self->_lowPassState[8] = 0;
  self->_lowPassStateIndex = 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  notify_cancel(self->notifyToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.hasBlankedScreen"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v7[1] = CFSTR("UIApplicationSuspendedNotification");
  v7[2] = CFSTR("UIWindowDidBecomeVisibleNotification");
  v7[3] = CFSTR("UIWindowDidBecomeHiddenNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIMotionEvent;
  -[UIEvent dealloc](&v6, sel_dealloc);
}

- (int64_t)type
{
  return 1;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)_setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UIMotionEvent;
  -[UIMotionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEvent timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ timestamp: %g subtype: %ld"), v4, v5, -[UIMotionEvent subtype](self, "subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allWindows
{
  void *v2;
  void *v3;

  objc_msgSend((id)UIApp, "_motionKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_sendEventToResponder:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[UIMotionEvent shakeState](self, "shakeState");
  if (v4 == 2)
  {
    objc_msgSend(v6, "motionCancelled:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    objc_msgSend(v6, "motionEnded:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
    goto LABEL_7;
  }
  v5 = v6;
  if (!v4)
  {
    objc_msgSend(v6, "motionBegan:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
LABEL_7:
    v5 = v6;
  }

}

- (BOOL)_isDetectingMotionEvents
{
  return -[BKSAccelerometer accelerometerEventsEnabled](self->_motionAccelerometer, "accelerometerEventsEnabled");
}

- (void)_accelerometerDidDetectMovementWithTimestamp:(double)a3
{
  NSTimer *v4;
  NSTimer *idleTimer;
  double v6;

  self->_lastMovementTime = a3;
  if (!self->_idleTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__idleTimerFired, 0, 1, 3.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    idleTimer = self->_idleTimer;
    self->_idleTimer = v4;

  }
  -[BKSAccelerometer updateInterval](self->_motionAccelerometer, "updateInterval");
  if (v6 < 0.1)
  {
    -[BKSAccelerometer setUpdateInterval:](self->_motionAccelerometer, "setUpdateInterval:");
    if (!self->_stateMachineState)
    {
      self->_stateMachineState = 1;
      self->_sentMotionBegan = 0;
    }
  }
}

- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8
{
  id v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  id WeakRetained;
  id v20;
  id v21;
  id v22;

  v14 = a3;
  if (a8)
  {
    if (a8 == 1)
    {
      v22 = v14;
      -[UIMotionEvent _accelerometerDidDetectMovementWithTimestamp:](self, "_accelerometerDidDetectMovementWithTimestamp:", a4);
LABEL_4:
      v14 = v22;
    }
  }
  else
  {
    *(float *)&v15 = a5;
    *(float *)&v16 = a6;
    *(float *)&v17 = a7;
    v22 = v14;
    -[UIMotionEvent _determineShakeLevelX:y:z:currentState:](self, "_determineShakeLevelX:y:z:currentState:", self->_stateMachineState, v15, v16, v17);
    v18 = -[UIMotionEvent _feedStateMachine:currentState:timestamp:](self, "_feedStateMachine:currentState:timestamp:", self->_stateMachineState);
    v14 = v22;
    self->_stateMachineState = v18;
    switch(v18)
    {
      case 0:
      case 5:
        if (self->_sentMotionBegan)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionCancelled:]((uint64_t)WeakRetained, 1);

          v14 = v22;
          self->_sentMotionBegan = 0;
        }
        break;
      case 2:
        if (!self->_sentMotionBegan)
        {
          self->_sentMotionBegan = 1;
          v20 = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionBegan:]((uint64_t)v20, 1);

          goto LABEL_4;
        }
        break;
      case 6:
        -[UIMotionEvent _resetLowPassState](self, "_resetLowPassState");
        v14 = v22;
        if (self->_sentMotionBegan)
        {
          v21 = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionEnded:]((uint64_t)v21, 1);

          v14 = v22;
          self->_stateMachineState = 0;
          self->_sentMotionBegan = 0;
        }
        break;
      default:
        break;
    }
  }

}

- (int64_t)_feedStateMachine:(float)a3 currentState:(int64_t)a4 timestamp:(double)a5
{
  double v5;

  switch(a4)
  {
    case 0:
      if (a3 < 0.071243)
        goto LABEL_14;
      break;
    case 1:
      if (a3 > 0.071243)
      {
        self->_shakeStartTime = a5;
        a4 = 2;
      }
      break;
    case 2:
      v5 = a3;
      if (v5 < 0.071243)
        goto LABEL_14;
      if (v5 <= 0.237488)
        goto LABEL_17;
      self->_highLevelTime = a5;
      a4 = 3;
      break;
    case 3:
      if (a3 >= 0.237488)
        goto LABEL_17;
      if (self->_highLevelTime + 0.0 >= a5)
      {
LABEL_14:
        a4 = 1;
      }
      else
      {
        self->_lowEndTimeout = a5;
        a4 = 4;
      }
      break;
    case 4:
      if (self->_lowEndTimeout + 0.5 >= a5)
      {
        if (a3 >= 0.071243)
        {
LABEL_17:
          if (self->_shakeStartTime + 2.0 < a5)
            a4 = 0;
        }
        else
        {
          a4 = 6;
        }
      }
      else
      {
        a4 = 5;
      }
      break;
    default:
      return a4;
  }
  return a4;
}

- (float)_highPass:(float)a3
{
  unint64_t highPassStateIndex;
  unint64_t v4;
  float v5;
  float v6;

  highPassStateIndex = self->_highPassStateIndex;
  self->_highPassState[highPassStateIndex] = a3;
  v4 = highPassStateIndex & 1;
  v5 = self->_highPassState[v4] + 0.0;
  v4 ^= 1uLL;
  v6 = v5 - self->_highPassState[v4];
  self->_highPassStateIndex = v4;
  return v6 * 0.5;
}

- (float)_lowPass:(float)a3
{
  uint64_t v3;
  unint64_t lowPassStateIndex;
  float v5;

  v3 = 0;
  lowPassStateIndex = self->_lowPassStateIndex;
  self->_lowPassState[lowPassStateIndex] = a3;
  self->_lowPassStateIndex = (lowPassStateIndex + 1) % 0xA;
  v5 = 0.0;
  do
    v5 = v5 + self->_lowPassState[v3++];
  while (v3 != 10);
  return v5 / 10.0;
}

- (float)_determineShakeLevelX:(float)a3 y:(float)a4 z:(float)a5 currentState:(int64_t)a6
{
  void *v11;
  uint64_t v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  float result;
  unint64_t v21;
  double v22;
  float v23;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v15 = a5 * 0.65;
  *(float *)&v15 = v15;
  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    *(float *)&v15 = 0.0;
  v13 = a3 * 0.65;
  v14 = a4 * 0.65;
  v16 = (float)((float)(v13 * v13) + (float)(v14 * v14)) + (float)(*(float *)&v15 * *(float *)&v15);
  *(float *)&v15 = (float)(v16 * v16) * 0.5;
  if (a6 == 5)
  {
    -[UIMotionEvent _highPass:](self, "_highPass:", v15);
    if (v17 >= 0.0)
      v18 = v17;
    else
      v18 = -v17;
    v19 = v18;
    if (v18 < 0.071243)
    {
      -[UIMotionEvent _resetLowPassState](self, "_resetLowPassState", v19);
      self->_stateMachineState = 0;
    }
    *(float *)&v19 = v18;
    -[UIMotionEvent _lowPass:](self, "_lowPass:", v19);
  }
  else
  {
    v21 = a6 - 3;
    -[UIMotionEvent _highPass:](self, "_highPass:", v15);
    if (*(float *)&v22 >= 0.0)
      v23 = *(float *)&v22;
    else
      v23 = -*(float *)&v22;
    *(float *)&v22 = v23;
    -[UIMotionEvent _lowPass:](self, "_lowPass:", v22);
    if (v21 < 2)
      return v23;
  }
  return result;
}

- (int)_shakeState
{
  return self->_shakeState;
}

- (void)_enablePeakDetectionIfNecessary
{
  void *v3;
  uint64_t state64;

  state64 = 0;
  if (!notify_get_state(self->notifyToken, &state64))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", state64);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEvent performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__enablePeakDetectionForScreenBlanked_, v3, 0);

  }
}

- (int)shakeState
{
  return self->_shakeState;
}

- (void)setShakeState:(int)a3
{
  self->_shakeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_motionAccelerometer, 0);
}

@end
