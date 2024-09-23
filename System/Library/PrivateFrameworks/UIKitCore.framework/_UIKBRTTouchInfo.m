@implementation _UIKBRTTouchInfo

+ (id)touchDict
{
  if (qword_1ECD7AD50 != -1)
    dispatch_once(&qword_1ECD7AD50, &__block_literal_global_375);
  return (id)_MergedGlobals_9_2;
}

+ (void)setTouchInfo:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "touchDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

+ (id)touchInfoForTouch:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "touchDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateTouch:", v7);
  return v9;
}

+ (id)createTouchInfoForTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _UIKBRTTouchInfo *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_UIKBRTTouchInfo initWithTouch:withIdentifier:canLogTouch:]([_UIKBRTTouchInfo alloc], "initWithTouch:withIdentifier:canLogTouch:", v9, v8, v5);

  objc_msgSend(a1, "setTouchInfo:forIdentifier:", v10, v8);
  return v10;
}

- (_UIKBRTTouchInfo)initWithTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  id v7;
  id v8;
  _UIKBRTTouchInfo *v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  float v15;
  double v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *timerQueue;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIKBRTTouchInfo;
  v9 = -[_UIKBRTTouchInfo init](&v20, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "timestamp");
    v9->_originalTimestamp = v10;
    v9->_currentTimestamp = v10;
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v11);
    v9->_originalTouchPoint.x = v12;
    v9->_originalTouchPoint.y = v13;
    v9->_currentTouchPoint = v9->_originalTouchPoint;

    objc_msgSend(v7, "majorRadius");
    v9->_maximumRadius = v14;
    objc_msgSend(v7, "_zGradient");
    v16 = v15;
    v9->_originalZGradient = v16;
    v9->_currentZGradient = v16;
    v17 = dispatch_queue_create("_UIKBRTTouchInfoTimerQueue", 0);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong(&v9->_touchIdentifier, a4);
    v9->_currentTouchState = 0;
    v9->_preRuleTouchState = -1;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKBRTTouchInfo invalidateTimer](self, "invalidateTimer");
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchInfo;
  -[_UIKBRTTouchInfo dealloc](&v3, sel_dealloc);
}

- (void)updateTouch:(id)a3
{
  id v4;
  double v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  double maximumRadius;
  double v10;
  float v11;
  float v12;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  self->_currentTimestamp = v5;
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  self->_currentTouchPoint.x = v7;
  self->_currentTouchPoint.y = v8;

  maximumRadius = self->_maximumRadius;
  objc_msgSend(v4, "majorRadius");
  if (maximumRadius >= v10)
    v10 = maximumRadius;
  self->_maximumRadius = v10;
  objc_msgSend(v4, "_zGradient");
  v12 = v11;

  self->_currentZGradient = v12;
}

- (void)setTimerWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5
{
  id v8;
  id v9;
  NSObject *timerQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  double v16;

  v8 = a4;
  v9 = a5;
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___UIKBRTTouchInfo_setTimerWithTimeInterval_onQueue_do___block_invoke;
  block[3] = &unk_1E16D85F8;
  v16 = a3;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(timerQueue, block);

}

- (void)fireTimerNow
{
  id v4;

  -[_UIKBRTTimerBlock fireNow](self->_timer, "fireNow");
  if (self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTTouchInfo.m"), 232, CFSTR("_timer is not nil!"));

  }
}

- (void)invalidateTimer
{
  NSObject *timerQueue;
  _QWORD block[5];

  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___UIKBRTTouchInfo_invalidateTimer__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

- (void)cleanup
{
  void *v3;

  -[_UIKBRTObject owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_uikbrtRemove:", self);

  objc_msgSend((id)objc_opt_class(), "setTouchInfo:forIdentifier:", 0, self->_touchIdentifier);
}

- (id)setOfTouchesToIgnoreWhenSettingTouchInfo:(id)a3 toState:(char)a4
{
  id v5;
  void *v6;
  char currentTouchState;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v22;
  double v23;
  void *v24;
  double originalTimestamp;
  double v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  currentTouchState = self->_currentTouchState;
  -[_UIKBRTTouchInfo nextTouch](self, "nextTouch");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v5)
  {
    while (currentTouchState == 3)
      currentTouchState = self->_preRuleTouchState;
    switch(currentTouchState)
    {
      case 0:
        objc_msgSend(v5, "originalTimestamp");
        v19 = v18 - self->_originalTimestamp;
        if (v19 <= _UIGet_UIKBRT_SetDownTapInterval())
        {
          -[_UIKBRTTouchInfo previousTouch](self, "previousTouch");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", self, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count"))
          {
            objc_msgSend(v6, "unionSet:", v14);
          }
          else
          {
            self->_currentTouchState = 1;
            objc_msgSend(v5, "setCurrentTouchState:", 1);
          }
LABEL_12:

        }
        break;
      case 1:
        v12 = v5;
        v13 = 1;
        goto LABEL_20;
      case 2:
        v12 = v5;
        v13 = 2;
        goto LABEL_20;
      case 4:
      case 5:
        objc_msgSend(v5, "originalTimestamp");
        v11 = v10 - self->_originalTimestamp;
        if (v11 > _UIGet_UIKBRT_SetDownTapInterval())
          break;
        v12 = v5;
        v13 = 4;
LABEL_20:
        objc_msgSend(v12, "setCurrentTouchState:", v13);
        break;
      case 6:
        objc_msgSend(v5, "originalTimestamp");
        v23 = v22 - self->_originalTimestamp;
        if (v23 <= _UIGet_UIKBRT_SetDownTapInterval())
        {
          v27[0] = self;
          v27[1] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v24);

        }
        break;
      default:
        break;
    }
  }
  else
  {
    -[_UIKBRTTouchInfo previousTouch](self, "previousTouch");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v5)
    {
      while (currentTouchState == 3)
        currentTouchState = self->_preRuleTouchState;
      switch(currentTouchState)
      {
        case 0:
          originalTimestamp = self->_originalTimestamp;
          objc_msgSend(v5, "originalTimestamp");
          if (originalTimestamp - v26 <= _UIGet_UIKBRT_SetDownTapInterval())
          {
            objc_msgSend(v5, "setCurrentTouchState:", 1);
            self->_currentTouchState = 1;
          }
          break;
        case 1:
        case 2:
        case 6:
          objc_msgSend(v6, "addObject:", self);
          -[_UIKBRTTouchInfo nextTouch](self, "nextTouch");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", self, 6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unionSet:", v15);

          goto LABEL_12;
        case 4:
        case 5:
          v16 = self->_originalTimestamp;
          objc_msgSend(v5, "originalTimestamp");
          if (v16 - v17 > _UIGet_UIKBRT_SetDownTapInterval())
            objc_msgSend(v6, "addObject:", self);
          break;
        default:
          break;
      }
    }
  }

  return v6;
}

- (BOOL)willChangeTouchInfo:(id)a3 toState:(char)a4
{
  int v4;
  id v6;
  id v7;
  id v8;
  int *v9;
  uint64_t v10;
  int v11;
  int *v12;
  BOOL v13;
  double v14;
  double v15;

  v4 = a4;
  v6 = a3;
  if (v4 != 8)
    goto LABEL_14;
  -[_UIKBRTTouchInfo nextTouch](self, "nextTouch");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v12 = &OBJC_IVAR____UIKBRTTouchInfo__currentTouchState;
    do
    {
      v10 = *v12;
      v11 = *((char *)&self->super.super.isa + v10);
      v12 = &OBJC_IVAR____UIKBRTTouchInfo__preRuleTouchState;
    }
    while (v11 == 3);
  }
  else
  {
    -[_UIKBRTTouchInfo previousTouch](self, "previousTouch");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v6)
    {
LABEL_14:
      v13 = 0;
      goto LABEL_15;
    }
    v9 = &OBJC_IVAR____UIKBRTTouchInfo__currentTouchState;
    do
    {
      v10 = *v9;
      v11 = *((char *)&self->super.super.isa + v10);
      v9 = &OBJC_IVAR____UIKBRTTouchInfo__preRuleTouchState;
    }
    while (v11 == 3);
  }
  if (v11 == 6)
  {
    objc_msgSend(v6, "originalTimestamp");
    v15 = v14 - self->_originalTimestamp;
    if (v15 > _UIGet_UIKBRT_SetDownTapInterval())
      goto LABEL_14;
LABEL_16:
    v13 = 1;
    *((_BYTE *)&self->super.super.isa + v10) = 1;
    goto LABEL_15;
  }
  if (v11 == 2)
    goto LABEL_16;
  if (v11 != 1)
    goto LABEL_14;
  *((_BYTE *)&self->super.super.isa + v10) = 0;
  v13 = 1;
LABEL_15:

  return v13;
}

- (double)originalTimestamp
{
  return self->_originalTimestamp;
}

- (CGPoint)originalTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalTouchPoint.x;
  y = self->_originalTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)currentTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTouchPoint.x;
  y = self->_currentTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)maximumRadius
{
  return self->_maximumRadius;
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (double)originalZGradient
{
  return self->_originalZGradient;
}

- (double)currentZGradient
{
  return self->_currentZGradient;
}

- (char)currentTouchState
{
  return self->_currentTouchState;
}

- (void)setCurrentTouchState:(char)a3
{
  self->_currentTouchState = a3;
}

- (char)preRuleTouchState
{
  return self->_preRuleTouchState;
}

- (void)setPreRuleTouchState:(char)a3
{
  self->_preRuleTouchState = a3;
}

- (id)touchIdentifier
{
  return self->_touchIdentifier;
}

- (_UIKBRTTimerBlock)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_touchIdentifier, 0);
}

@end
