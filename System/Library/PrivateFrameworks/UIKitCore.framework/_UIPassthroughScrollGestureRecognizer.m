@implementation _UIPassthroughScrollGestureRecognizer

- (_UIPassthroughScrollGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIPassthroughScrollGestureRecognizer *v4;
  _UIPassthroughScrollGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super._gestureFlags + 8) &= ~8u;
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v4, "_setRequiresSystemGesturesToFail:", 1);
  }
  return v5;
}

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (void)setView:(id)a3
{
  void *v6;
  objc_class *v7;
  void *v8;
  objc_super v9;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPassthroughScrollGestureRecognizer.m"), 67, CFSTR("%@ can only be added to a window"), v8);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
  -[UIGestureRecognizer setView:](&v9, sel_setView_, a3);
}

- (void)reset
{
  self->_startPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_startTime = 0.0;
  self->_accumulatedScrollEventDelta.dx = 0.0;
  self->_accumulatedScrollEventDelta.dy = 0.0;
  *(_BYTE *)&self->_flags &= ~1u;
}

- (void)_beginAtLocation:(CGPoint)a3
{
  self->_startPoint = a3;
  self->_startTime = CACurrentMediaTime();
  self->_endReason = 0;
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)_endWithReason:(unint64_t)a3
{
  self->_endReason = a3;
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  uint64_t v7;

  if (-[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible)
  {
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer locationInView:](self, "locationInView:", v6);
    -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:");

    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) != 0);
    if (-[_UIPassthroughScrollGestureRecognizer endForSecondaryButtonDown](self, "endForSecondaryButtonDown")
      && (objc_msgSend(a4, "buttonMask") & 2) != 0)
    {
      v7 = 5;
    }
    else
    {
      if (!-[_UIPassthroughScrollGestureRecognizer endForPrimaryButtonDown](self, "endForPrimaryButtonDown")
        || (objc_msgSend(a4, "buttonMask") & 1) == 0)
      {
        return;
      }
      v7 = 2;
    }
    -[_UIPassthroughScrollGestureRecognizer _endWithReason:](self, "_endWithReason:", v7);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;

  -[UIGestureRecognizer view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = sqrt((v7 - self->_startPoint.x) * (v7 - self->_startPoint.x)+ (v9 - self->_startPoint.y) * (v9 - self->_startPoint.y));
  if ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
  if (v10 <= 10.0)
    goto LABEL_7;
  -[_UIPassthroughScrollGestureRecognizer _window](self, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "_hasSystemGestureGate"))
  {
    -[_UIPassthroughScrollGestureRecognizer _window](self, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_systemGestureRecognitionIsPossible");

    if ((v13 & 1) == 0)
      goto LABEL_8;
LABEL_7:
    -[UIGestureRecognizer setState:](self, "setState:", 2);
    return;
  }

LABEL_8:
  -[_UIPassthroughScrollGestureRecognizer _endWithReason:](self, "_endWithReason:", 4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double startTime;
  uint64_t v13;

  -[UIGestureRecognizer view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = sqrt((v7 - self->_startPoint.x) * (v7 - self->_startPoint.x)+ (v9 - self->_startPoint.y) * (v9 - self->_startPoint.y));
  v11 = CACurrentMediaTime();
  startTime = self->_startTime;
  if ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
  if (v10 <= 10.0)
  {
    if (v11 - startTime <= 1.5)
    {
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        v13 = 3;
      else
        v13 = 2;
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 4;
  }
  -[_UIPassthroughScrollGestureRecognizer _endWithReason:](self, "_endWithReason:", v13);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;

  -[UIGestureRecognizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[UIGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(v7, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, a4, v10, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)canHandleEventForPassthrough:(id)a3
{
  return !objc_msgSend(a3, "type") || objc_msgSend(a3, "type") == 10 || objc_msgSend(a3, "type") == 14;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  objc_super v14;

  if (+[_UIPassthroughScrollGestureRecognizer canHandleEventForPassthrough:](_UIPassthroughScrollGestureRecognizer, "canHandleEventForPassthrough:"))
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend(a3, "type") == 10)
      {
        v6 = a3;
        -[UIGestureRecognizer view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "locationInView:", v7);
        v9 = v8;
        v11 = v10;

        v12 = objc_msgSend(v5, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
    return -[UIGestureRecognizer shouldReceiveEvent:](&v14, sel_shouldReceiveEvent_, a3);
  }
  return v12;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UIPassthroughScrollGestureRecognizer *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;

  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (objc_msgSend(a3, "phase") == 2)
  {
    -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:", v7, v9);
    return;
  }
  if (objc_msgSend(a3, "phase") == 5)
  {
    if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateEnded)
      goto LABEL_5;
  }
  else if (self->_startTime != 0.0)
  {
    -[UIGestureRecognizer view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "_adjustedAcceleratedDeltaInView:", v12);
    v14 = v13;
    v16 = v15;

    v17 = v14 + self->_accumulatedScrollEventDelta.dx;
    v18 = v16 + self->_accumulatedScrollEventDelta.dy;
    self->_accumulatedScrollEventDelta.dx = v17;
    self->_accumulatedScrollEventDelta.dy = v18;
    if (sqrt(v17 * v17 + v18 * v18) > 10.0)
    {
      v10 = self;
      v11 = 4;
      goto LABEL_10;
    }
    if (objc_msgSend(a3, "phase") != 3)
    {
LABEL_5:
      v10 = self;
      v11 = 1;
LABEL_10:
      -[_UIPassthroughScrollGestureRecognizer _endWithReason:](v10, "_endWithReason:", v11);
      return;
    }
    -[UIGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (void)_transformChangedWithEvent:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  _UIPassthroughScrollGestureRecognizer *v11;
  uint64_t v12;

  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(a3, "phase");
  if ((unint64_t)(v10 - 2) < 2)
  {
    v11 = self;
    v12 = 6;
LABEL_7:
    -[_UIPassthroughScrollGestureRecognizer _endWithReason:](v11, "_endWithReason:", v12);
    return;
  }
  if (v10 == 4)
  {
    v11 = self;
    v12 = 1;
    goto LABEL_7;
  }
  if (v10 == 1)
    -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:", v7, v9);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (BOOL)endForPrimaryButtonDown
{
  return self->_endForPrimaryButtonDown;
}

- (void)setEndForPrimaryButtonDown:(BOOL)a3
{
  self->_endForPrimaryButtonDown = a3;
}

- (BOOL)endForSecondaryButtonDown
{
  return self->_endForSecondaryButtonDown;
}

- (void)setEndForSecondaryButtonDown:(BOOL)a3
{
  self->_endForSecondaryButtonDown = a3;
}

@end
