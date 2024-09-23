@implementation UITapAndAHalfRecognizer

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (UITapAndAHalfRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UITapAndAHalfRecognizer *v4;
  UITapAndAHalfRecognizer *v5;
  NSMutableSet *v6;
  NSMutableSet *activeTouches;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITapAndAHalfRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfFullTaps = 1;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeTouches = v5->_activeTouches;
    v5->_activeTouches = v6;

    v5->_allowableMovement = 1.79769313e308;
    v5->_minimumFinalPressDuration = 0.15;
    -[UIGestureRecognizer reset](v5, "reset");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
  -[UITapAndAHalfRecognizer setTouch:](self, "setTouch:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UITapAndAHalfRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)setTouch:(id)a3
{
  objc_storeStrong((id *)&self->_touch, a3);
}

- (void)clearTapTimer
{
  UIDelayedAction *tapTimer;
  UIDelayedAction *v3;
  UITapAndAHalfRecognizer *v4;

  v4 = self;
  tapTimer = v4->_tapTimer;
  if (tapTimer)
  {
    -[UIDelayedAction setTarget:](tapTimer, "setTarget:", 0);
    -[UIDelayedAction unschedule](v4->_tapTimer, "unschedule");
    v3 = v4->_tapTimer;
    v4->_tapTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapTimer, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

- (void)setNumberOfFullTaps:(int)a3
{
  self->_numberOfFullTaps = a3;
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
  self->_currentNumberOfTaps = 0;
  -[NSMutableSet removeAllObjects](self->_activeTouches, "removeAllObjects");
  -[UITapAndAHalfRecognizer setTouch:](self, "setTouch:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UITapAndAHalfRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)startRecognitionTimer:(double)a3
{
  UIDelayedAction *v5;
  UIDelayedAction *v6;
  UIDelayedAction *tapTimer;

  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
  v5 = [UIDelayedAction alloc];
  v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v5, "initWithTarget:action:userInfo:delay:mode:", self, sel_recognized_, 0, *MEMORY[0x1E0C99860], a3);
  tapTimer = self->_tapTimer;
  self->_tapTimer = v6;

}

- (void)startTapTimer:(double)a3
{
  UIDelayedAction *v5;
  UIDelayedAction *v6;
  UIDelayedAction *tapTimer;

  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
  v5 = [UIDelayedAction alloc];
  v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v5, "initWithTarget:action:userInfo:delay:mode:", self, sel_tooSlow_, 0, *MEMORY[0x1E0C99860], a3);
  tapTimer = self->_tapTimer;
  self->_tapTimer = v6;

}

- (void)tooSlow:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
}

- (void)recognized:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 1);
  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
}

- (void)_verifyMovementInAllowableRange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_allowableMovement != 1.79769313e308)
  {
    -[UITapAndAHalfRecognizer touch](self, "touch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInView:", 0);
    v5 = v4;
    v7 = v6;

    if (sqrt((self->_startPoint.x - v5) * (self->_startPoint.x - v5)+ (self->_startPoint.y - v7) * (self->_startPoint.y - v7)) > self->_allowableMovement)
    {
      -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
      -[UIGestureRecognizer setState:](self, "setState:", 5);
    }
  }
}

- (CGPoint)translationInWindowCoordinates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UITapAndAHalfRecognizer touch](self, "touch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", 0);
  v5 = v4;
  v7 = v6;

  v8 = v5 - self->_startPoint.x;
  v9 = v7 - self->_startPoint.y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int currentNumberOfTaps;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[NSMutableSet count](self->_activeTouches, "count")
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateFailed)
  {
    -[UIGestureRecognizer reset](self, "reset");
  }
  if ((unint64_t)(self->super._state - 1) > 2)
  {
    -[NSMutableSet unionSet:](self->_activeTouches, "unionSet:", v6);
    if ((unint64_t)-[NSMutableSet count](self->_activeTouches, "count") >= 2)
    {
      -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
      -[UIGestureRecognizer setState:](self, "setState:", 5);
    }
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    {
      -[NSMutableSet anyObject](self->_activeTouches, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapAndAHalfRecognizer setTouch:](self, "setTouch:", v13);

      -[UITapAndAHalfRecognizer touch](self, "touch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInView:", 0);
      v16 = v15;
      v18 = v17;

      if (self->_currentNumberOfTaps)
      {
        -[UITapAndAHalfRecognizer allowableMovement](self, "allowableMovement");
        if (v19 != 1.79769313e308)
        {
          v20 = sqrt((v16 - self->_startPoint.x) * (v16 - self->_startPoint.x)+ (v18 - self->_startPoint.y) * (v18 - self->_startPoint.y));
          -[UITapAndAHalfRecognizer allowableMovement](self, "allowableMovement");
          if (v20 > v21)
          {
            -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
            -[UIGestureRecognizer setState:](self, "setState:", 5);
          }
        }
      }
      else
      {
        self->_startPoint.x = v16;
        self->_startPoint.y = v18;
      }
      if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
      {
        currentNumberOfTaps = self->_currentNumberOfTaps;
        if (currentNumberOfTaps == -[UITapAndAHalfRecognizer numberOfFullTaps](self, "numberOfFullTaps"))
        {
          -[UITapAndAHalfRecognizer minimumFinalPressDuration](self, "minimumFinalPressDuration");
          -[UITapAndAHalfRecognizer startRecognitionTimer:](self, "startRecognitionTimer:");
        }
        else
        {
          -[UITapAndAHalfRecognizer startTapTimer:](self, "startTapTimer:", 0.5);
        }
      }
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v7, (_QWORD)v23);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int currentNumberOfTaps;

  v5 = a3;
  -[UITapAndAHalfRecognizer touch](self, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    if (self && (unint64_t)(self->super._state - 1) <= 2)
    {
      -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
      -[UIGestureRecognizer setState:](self, "setState:", 2);
    }
    else
    {
      currentNumberOfTaps = self->_currentNumberOfTaps;
      if (currentNumberOfTaps < -[UITapAndAHalfRecognizer numberOfFullTaps](self, "numberOfFullTaps"))
        -[UITapAndAHalfRecognizer _verifyMovementInAllowableRange](self, "_verifyMovementInAllowableRange");
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  NSMutableSet *activeTouches;
  id v6;
  void *v7;
  int v8;
  UITapAndAHalfRecognizer *v9;
  uint64_t v10;
  int currentNumberOfTaps;

  activeTouches = self->_activeTouches;
  v6 = a3;
  -[NSMutableSet minusSet:](activeTouches, "minusSet:", v6);
  -[UITapAndAHalfRecognizer touch](self, "touch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    if ((unint64_t)(self->super._state - 1) <= 2)
    {
      -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
      v9 = self;
      v10 = 3;
LABEL_4:
      -[UIGestureRecognizer setState:](v9, "setState:", v10);
      return;
    }
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    {
      -[UITapAndAHalfRecognizer _verifyMovementInAllowableRange](self, "_verifyMovementInAllowableRange");
      if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible
        && !-[NSMutableSet count](self->_activeTouches, "count"))
      {
        currentNumberOfTaps = self->_currentNumberOfTaps;
        self->_currentNumberOfTaps = currentNumberOfTaps + 1;
        if (currentNumberOfTaps >= -[UITapAndAHalfRecognizer numberOfFullTaps](self, "numberOfFullTaps"))
        {
          -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
          v9 = self;
          v10 = 5;
          goto LABEL_4;
        }
        -[UITapAndAHalfRecognizer startTapTimer:](self, "startTapTimer:", 0.3);
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3, a4);
  -[UITapAndAHalfRecognizer clearTapTimer](self, "clearTapTimer");
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (CGPoint)locationOfFirstTap
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)numberOfFullTaps
{
  return self->_numberOfFullTaps;
}

- (UITouch)touch
{
  return self->_touch;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (double)minimumFinalPressDuration
{
  return self->_minimumFinalPressDuration;
}

- (void)setMinimumFinalPressDuration:(double)a3
{
  self->_minimumFinalPressDuration = a3;
}

@end
