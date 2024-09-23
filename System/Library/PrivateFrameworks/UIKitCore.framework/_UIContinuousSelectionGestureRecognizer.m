@implementation _UIContinuousSelectionGestureRecognizer

- (_UIContinuousSelectionGestureRecognizer)init
{
  _UIContinuousSelectionGestureRecognizer *v2;
  _UIContinuousSelectionGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContinuousSelectionGestureRecognizer;
  v2 = -[UIGestureRecognizer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIContinuousSelectionGestureRecognizer setAllowableMovement:](v2, "setAllowableMovement:", 0.0, 0.0);
  return v3;
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (void)_cancelOrFail
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state"))
    v3 = 4;
  else
    v3 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v3);
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  void *v4;
  BOOL v5;

  -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0, a4);
  -[_UIContinuousSelectionGestureRecognizer setOriginalLocation:](self, "setOriginalLocation:");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;

  -[_UIContinuousSelectionGestureRecognizer allowableMovement](self, "allowableMovement", a3, a4);
  v6 = v5;
  v8 = v7;
  -[_UIContinuousSelectionGestureRecognizer originalLocation](self, "originalLocation");
  v10 = v9;
  v12 = v11;
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0);
  v15 = v14;
  if (v6 <= 0.0)
  {
    if (v8 <= 0.0)
      goto LABEL_9;
    v18 = 0;
    goto LABEL_7;
  }
  v16 = vabdd_f64(v13, v10);
  -[_UIContinuousSelectionGestureRecognizer allowableMovement](self, "allowableMovement");
  v18 = v16 > v17;
  if (v8 > 0.0)
  {
LABEL_7:
    -[_UIContinuousSelectionGestureRecognizer allowableMovement](self, "allowableMovement");
    if (v18 || vabdd_f64(v15, v12) > v19)
      goto LABEL_13;
    goto LABEL_9;
  }
  if (v16 > v17)
  {
LABEL_13:
    -[_UIContinuousSelectionGestureRecognizer _cancelOrFail](self, "_cancelOrFail");
    return;
  }
LABEL_9:
  if (-[UIGestureRecognizer state](self, "state") >= UIGestureRecognizerStateBegan
    && -[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStateChanged)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[UIGestureRecognizer state](self, "state", a3, a4) < UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") >= UIGestureRecognizerStateEnded)
  {
    v5 = 5;
  }
  else
  {
    v5 = 3;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (CGVector)allowableMovement
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_allowableMovement.dx;
  dy = self->_allowableMovement.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setAllowableMovement:(CGVector)a3
{
  self->_allowableMovement = a3;
}

- (CGPoint)originalLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalLocation.x;
  y = self->_originalLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalLocation:(CGPoint)a3
{
  self->_originalLocation = a3;
}

@end
