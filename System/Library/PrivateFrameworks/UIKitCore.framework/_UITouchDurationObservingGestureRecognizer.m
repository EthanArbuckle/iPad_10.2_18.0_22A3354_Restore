@implementation _UITouchDurationObservingGestureRecognizer

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (_UITouchDurationObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UITouchDurationObservingGestureRecognizer *v4;
  _UITouchDurationObservingGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UITouchDurationObservingGestureRecognizer setMinimumDurationRequired:](v4, "setMinimumDurationRequired:", 0.15);
    -[_UITouchDurationObservingGestureRecognizer setTouchStartTimestamp:](v5, "setTouchStartTimestamp:", 978307200.0);
  }
  return v5;
}

- (void)setMinimumDurationRequired:(double)a3
{
  self->_minimumDurationRequired = a3;
}

- (void)setTouchStartTimestamp:(double)a3
{
  self->_touchStartTimestamp = a3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[UIGestureRecognizer state](self, "state", a3, a4) <= UIGestureRecognizerStatePossible)
    v5 = 5;
  else
    v5 = 3;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (void)reset
{
  void *v3;
  UIDelayedAction *delayedAction;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  -[UIGestureRecognizer reset](&v5, sel_reset);
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  -[_UITouchDurationObservingGestureRecognizer delayedAction](self, "delayedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  self->_touchForce = 0.0;
  self->_hasExceededAllowableMovement = 0;
  -[_UITouchDurationObservingGestureRecognizer setTouchStartTimestamp:](self, "setTouchStartTimestamp:", 978307200.0);
  -[_UITouchDurationObservingGestureRecognizer setOriginalCentroid:](self, "setOriginalCentroid:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  UIDelayedAction *v5;
  UIDelayedAction *v6;
  UIDelayedAction *delayedAction;
  void *v8;
  id v9;

  -[_UITouchDurationObservingGestureRecognizer _allTouchesMatchingRequirementsForEvent:](self, "_allTouchesMatchingRequirementsForEvent:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1 && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    -[UIGestureRecognizer locationInView:](self, "locationInView:", 0);
    -[_UITouchDurationObservingGestureRecognizer setOriginalCentroid:](self, "setOriginalCentroid:");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[_UITouchDurationObservingGestureRecognizer setTouchStartTimestamp:](self, "setTouchStartTimestamp:");
    v5 = [UIDelayedAction alloc];
    -[_UITouchDurationObservingGestureRecognizer minimumDurationRequired](self, "minimumDurationRequired");
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v5, "initWithTarget:action:userInfo:delay:", self, sel__performDelayedBegin, 0);
    delayedAction = self->_delayedAction;
    self->_delayedAction = v6;

    self->_touchForce = _UITouchForceFromTouches(v9);
    -[_UITouchDurationObservingGestureRecognizer displayLink](self, "displayLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPaused:", 0);

  }
  else
  {
    -[_UITouchDurationObservingGestureRecognizer _cancelOrFail](self, "_cancelOrFail");
  }

}

- (void)setOriginalCentroid:(CGPoint)a3
{
  self->_originalCentroid = a3;
}

- (double)minimumDurationRequired
{
  return self->_minimumDurationRequired;
}

- (CADisplayLink)displayLink
{
  CADisplayLink *displayLink;
  _UIWeakDisplayLinkTarget *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  void *v8;

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    v4 = -[_UIWeakDisplayLinkTarget initWithTarget:action:]([_UIWeakDisplayLinkTarget alloc], "initWithTarget:action:", self, sel__displayLinkDidFire_);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v4, +[_UIWeakDisplayLinkTarget displayLinkAction](_UIWeakDisplayLinkTarget, "displayLinkAction"));
    v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    displayLink = self->_displayLink;
  }
  return displayLink;
}

- (UIDelayedAction)delayedAction
{
  return self->_delayedAction;
}

- (void)_displayLinkDidFire:(id)a3
{
  void *v4;
  id v5;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UITouchDurationObservingGestureRecognizer _exceededNumberOfTouchesForEvent:](self, "_exceededNumberOfTouchesForEvent:"))
  {
    -[_UITouchDurationObservingGestureRecognizer _cancelOrFail](self, "_cancelOrFail");
  }
  else
  {
    -[_UITouchDurationObservingGestureRecognizer _allTouchesMatchingRequirementsForEvent:](self, "_allTouchesMatchingRequirementsForEvent:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_touchForce = _UITouchForceFromTouches(v4);

    if (-[UIGestureRecognizer state](self, "state") < UIGestureRecognizerStateBegan
      || -[UIGestureRecognizer state](self, "state") > UIGestureRecognizerStateEnded)
    {
      if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible && self->_touchForce >= 2.6)
      {
        -[_UITouchDurationObservingGestureRecognizer _performDelayedBegin](self, "_performDelayedBegin");
        -[UIDelayedAction cancel](self->_delayedAction, "cancel");
      }
    }
    else
    {
      -[UIGestureRecognizer setState:](self, "setState:", 2);
    }
  }

}

- (BOOL)_exceededNumberOfTouchesForEvent:(id)a3
{
  void *v3;
  BOOL v4;

  -[_UITouchDurationObservingGestureRecognizer _allTouchesMatchingRequirementsForEvent:](self, "_allTouchesMatchingRequirementsForEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (id)_allTouchesMatchingRequirementsForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allTouches", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        if (self && (self->super._allowedTouchTypes & (1 << v12)) != 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedAction, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  void *v4;
  objc_super v5;

  displayLink = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v5, sel_dealloc);
}

- (double)touchDuration
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[_UITouchDurationObservingGestureRecognizer touchStartTimestamp](self, "touchStartTimestamp");
  v4 = v3;
  result = 0.0;
  if (v4 < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
    v7 = v6;
    -[_UITouchDurationObservingGestureRecognizer touchStartTimestamp](self, "touchStartTimestamp");
    return v7 - v8;
  }
  return result;
}

- (void)_performDelayedBegin
{
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (BOOL)_isGestureType:(int64_t)a3
{
  BOOL result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  result = -[UIGestureRecognizer _isGestureType:](&v5, sel__isGestureType_);
  if (a3 == 7)
    return 1;
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  id v17;

  v17 = a4;
  if (-[_UITouchDurationObservingGestureRecognizer _exceededNumberOfTouchesForEvent:](self, "_exceededNumberOfTouchesForEvent:"))
  {
    -[_UITouchDurationObservingGestureRecognizer _cancelOrFail](self, "_cancelOrFail");
  }
  else
  {
    -[_UITouchDurationObservingGestureRecognizer _allTouchesMatchingRequirementsForEvent:](self, "_allTouchesMatchingRequirementsForEvent:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_touchForce = _UITouchForceFromTouches(v5);

    -[_UITouchDurationObservingGestureRecognizer allowableMovement](self, "allowableMovement");
    if (v6 > 0.0)
    {
      v7 = v6;
      -[UIGestureRecognizer locationInView:](self, "locationInView:", 0);
      v9 = v8;
      v11 = v10;
      -[_UITouchDurationObservingGestureRecognizer originalCentroid](self, "originalCentroid");
      v14 = vabdd_f64(v11, v13);
      if (vabdd_f64(v9, v12) > v7 || v14 > v7)
      {
        self->_hasExceededAllowableMovement = 1;
        -[_UITouchDurationObservingGestureRecognizer _cancelOrFail](self, "_cancelOrFail");
        -[_UITouchDurationObservingGestureRecognizer delayedAction](self, "delayedAction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cancel");

      }
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
  -[_UITouchDurationObservingGestureRecognizer delayedAction](self, "delayedAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (void)_cancelOrFail
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state"))
    v3 = 4;
  else
    v3 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v3);
  -[UIDelayedAction cancel](self->_delayedAction, "cancel");
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)hasExceededAllowableMovement
{
  return self->_hasExceededAllowableMovement;
}

- (double)touchForce
{
  return self->_touchForce;
}

- (double)touchStartTimestamp
{
  return self->_touchStartTimestamp;
}

- (CGPoint)originalCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCentroid.x;
  y = self->_originalCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
