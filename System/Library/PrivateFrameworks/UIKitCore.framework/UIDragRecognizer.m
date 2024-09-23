@implementation UIDragRecognizer

- (UIDragRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIDragRecognizer *v4;
  UIDragRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDragRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIDragRecognizer setRestrictsToAngle:](v4, "setRestrictsToAngle:", 1);
    -[UIDragRecognizer setAngle:](v5, "setAngle:", 0.0);
    -[UIDragRecognizer setMinimumDistance:](v5, "setMinimumDistance:", 50.0);
    -[UIDragRecognizer setMaximumDeviation:](v5, "setMaximumDeviation:", 0.261799388);
    -[UIGestureRecognizer reset](v5, "reset");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDragRecognizer clearTimer](self, "clearTimer");
  -[UIDragRecognizer setTouch:](self, "setTouch:", 0);
  -[UIDragRecognizer clearIgnoreTouch](self, "clearIgnoreTouch");
  v3.receiver = self;
  v3.super_class = (Class)UIDragRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UIDragRecognizer clearTimer](self, "clearTimer");
  -[UIDragRecognizer setTouch:](self, "setTouch:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIDragRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)clearTimer
{
  UIDelayedAction *tooSlow;

  -[UIDelayedAction unschedule](self->_tooSlow, "unschedule");
  tooSlow = self->_tooSlow;
  self->_tooSlow = 0;

}

- (void)tooSlow:(id)a3
{
  -[UIDragRecognizer clearTimer](self, "clearTimer", a3);
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)clearIgnoreTouch
{
  void *v3;

  -[UIDragRecognizer ignoreTouch](self, "ignoreTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unschedule");

  -[UIDragRecognizer setIgnoreTouch:](self, "setIgnoreTouch:", 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *tooSlow;
  void *v6;
  double v7;
  void *v8;
  UIDelayedAction *v9;
  UIDelayedAction *v10;
  void *v11;
  void *v12;
  void *v13;
  UIDelayedAction *v14;
  UIDelayedAction *v15;
  id v16;

  v16 = a3;
  -[UIDragRecognizer ignoreTouch](self, "ignoreTouch");
  tooSlow = (void *)objc_claimAutoreleasedReturnValue();
  if (tooSlow)
    goto LABEL_2;
  -[UIDragRecognizer touch](self, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v16, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragRecognizer setTouch:](self, "setTouch:", v11);

    -[UIDragRecognizer touch](self, "touch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v13);
    -[UIDragRecognizer setStartPosition:](self, "setStartPosition:");

    v14 = [UIDelayedAction alloc];
    v15 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v14, "initWithTarget:action:userInfo:delay:mode:", self, sel_tooSlow_, 0, *MEMORY[0x1E0C99860], 2.0);
    tooSlow = self->_tooSlow;
    self->_tooSlow = v15;
LABEL_2:

  }
  -[UIDragRecognizer quietPeriod](self, "quietPeriod");
  if (v7 > 0.0)
  {
    -[UIDragRecognizer ignoreTouch](self, "ignoreTouch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIDragRecognizer ignoreTouch](self, "ignoreTouch");
      v9 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
      -[UIDragRecognizer quietPeriod](self, "quietPeriod");
      -[UIDelayedAction touchWithDelay:](v9, "touchWithDelay:");
    }
    else
    {
      v10 = [UIDelayedAction alloc];
      -[UIDragRecognizer quietPeriod](self, "quietPeriod");
      v9 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v10, "initWithTarget:action:userInfo:delay:mode:", self, sel_clearIgnoreTouch, 0, *MEMORY[0x1E0C99860]);
      -[UIDragRecognizer setIgnoreTouch:](self, "setIgnoreTouch:", v9);
    }

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  _BOOL8 v39;
  double v41;

  v5 = a3;
  -[UIDragRecognizer touch](self, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    if (self && (unint64_t)(self->super._state - 1) < 3)
    {
      v8 = 2;
LABEL_5:
      -[UIGestureRecognizer setState:](self, "setState:", v8);
      return;
    }
    -[UIDragRecognizer touch](self, "touch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    -[UIDragRecognizer startPosition](self, "startPosition");
    v17 = (v15 - v12) * (v15 - v12) + (v16 - v14) * (v16 - v14);
    -[UIDragRecognizer startPosition](self, "startPosition");
    v19 = v12 - v18;
    -[UIDragRecognizer startPosition](self, "startPosition");
    v21 = atan2(v14 - v20, v19);
    if (v21 >= 0.0)
      v22 = v21;
    else
      v22 = v21 + 3.14159265;
    -[UIDragRecognizer angle](self, "angle");
    v24 = v23 - v22;
    if (v24 >= 0.0)
      v25 = v24;
    else
      v25 = -v24;
    -[UIDragRecognizer angle](self, "angle");
    v27 = v26 + 3.14159265 - v22;
    if (v27 < 0.0)
      v27 = -v27;
    if (v27 < v25)
    {
      -[UIDragRecognizer angle](self, "angle");
      v29 = v28 + 3.14159265 - v22;
      if (v29 >= 0.0)
        v25 = v29;
      else
        v25 = -v29;
    }
    v30 = sqrt(v17);
    -[UIDragRecognizer angle](self, "angle");
    v32 = v31 - (v22 + 3.14159265);
    if (v32 < 0.0)
      v32 = -v32;
    if (v32 < v25)
    {
      -[UIDragRecognizer angle](self, "angle");
      v34 = v33 - (v22 + 3.14159265);
      if (v34 >= 0.0)
        v25 = v34;
      else
        v25 = -v34;
    }
    -[UIDragRecognizer minimumDistance](self, "minimumDistance");
    v36 = v35;
    v37 = -[UIDragRecognizer restrictsToAngle](self, "restrictsToAngle");
    if (v30 <= v36)
    {
      if (v30 > 20.0 && v37)
      {
        -[UIDragRecognizer maximumDeviation](self, "maximumDeviation");
        if (v25 > v41)
        {
          -[UIDragRecognizer clearTimer](self, "clearTimer");
          v8 = 5;
          goto LABEL_5;
        }
      }
    }
    else
    {
      if (v37)
      {
        -[UIDragRecognizer maximumDeviation](self, "maximumDeviation");
        v39 = v25 <= v38;
      }
      else
      {
        v39 = 1;
      }
      -[UIDragRecognizer setCanBeginDrag:](self, "setCanBeginDrag:", v39);
      if (-[UIDragRecognizer canBeginDrag](self, "canBeginDrag"))
      {
        -[UIDragRecognizer clearTimer](self, "clearTimer");
        -[UIDragRecognizer setStartAngle:](self, "setStartAngle:", v22);
        v8 = 1;
        goto LABEL_5;
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  v5 = a3;
  -[UIDragRecognizer touch](self, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    if (self && (unint64_t)(self->super._state - 1) < 3)
    {
      v8 = 3;
    }
    else
    {
      -[UIDragRecognizer clearTimer](self, "clearTimer");
      v8 = 5;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v8);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIDragRecognizer clearTimer](self, "clearTimer", a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (double)maximumDeviation
{
  return self->_maximumDeviation;
}

- (void)setMaximumDeviation:(double)a3
{
  self->_maximumDeviation = a3;
}

- (CGPoint)startPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPosition.x;
  y = self->_startPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPosition:(CGPoint)a3
{
  self->_startPosition = a3;
}

- (double)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(double)a3
{
  self->_minimumDistance = a3;
}

- (UITouch)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
  objc_storeStrong((id *)&self->_touch, a3);
}

- (BOOL)restrictsToAngle
{
  return self->_restrictsToAngle;
}

- (void)setRestrictsToAngle:(BOOL)a3
{
  self->_restrictsToAngle = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)quietPeriod
{
  return self->_quietPeriod;
}

- (void)setQuietPeriod:(double)a3
{
  self->_quietPeriod = a3;
}

- (BOOL)canBeginDrag
{
  return self->_canBeginDrag;
}

- (void)setCanBeginDrag:(BOOL)a3
{
  self->_canBeginDrag = a3;
}

- (UIDelayedAction)ignoreTouch
{
  return self->ignoreTouch;
}

- (void)setIgnoreTouch:(id)a3
{
  objc_storeStrong((id *)&self->ignoreTouch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ignoreTouch, 0);
  objc_storeStrong((id *)&self->_tooSlow, 0);
  objc_storeStrong((id *)&self->_touch, 0);
}

@end
