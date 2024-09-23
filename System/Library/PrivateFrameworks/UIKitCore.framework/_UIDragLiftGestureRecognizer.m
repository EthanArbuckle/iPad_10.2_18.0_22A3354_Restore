@implementation _UIDragLiftGestureRecognizer

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIDragLiftGestureRecognizer;
  -[UILongPressGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, a3, a4);
  if (-[UIGestureRecognizer _hasUnmetFailureRequirements](self, "_hasUnmetFailureRequirements"))
  {
    -[UILongPressGestureRecognizer startPoint](self, "startPoint");
    v6 = v5;
    v8 = v7;
    -[UILongPressGestureRecognizer centroid](self, "centroid");
    v11 = sqrt((v9 - v6) * (v9 - v6) + (v10 - v8) * (v10 - v8));
    -[UILongPressGestureRecognizer allowableMovement](self, "allowableMovement");
    if (v11 > v12)
    {
      if (-[UIGestureRecognizer state](self, "state") < UIGestureRecognizerStateBegan)
      {
        -[UIGestureRecognizer setState:](self, "setState:", 5);
      }
      else
      {
        -[UIGestureRecognizer setState:](self, "setState:", 4);
        -[UIGestureRecognizer delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "_gestureRecognizerFailed:", self);

      }
    }
  }
}

- (BOOL)_isForPointer
{
  return 0;
}

- (void)setIsForPointer:(BOOL)a3
{
  self->_isForPointer = a3;
}

@end
