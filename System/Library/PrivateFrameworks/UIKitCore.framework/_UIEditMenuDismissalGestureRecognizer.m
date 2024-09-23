@implementation _UIEditMenuDismissalGestureRecognizer

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (_UIEditMenuDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIEditMenuDismissalGestureRecognizer *v4;
  _UIEditMenuDismissalGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v5, "_setAcceptsFailureRequiments:", 0);
    *((_BYTE *)&v5->super._gestureFlags + 8) &= ~8u;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  -[UIGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  -[UIGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 2);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  -[UIGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  -[UIGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  -[_UIEditMenuDismissalGestureRecognizer interactionDelegate](self, "interactionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    -[_UIEditMenuDismissalGestureRecognizer interactionDelegate](self, "interactionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "dismissalGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v7, v11, v13);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "canHandleEventForPassthrough:", v4) & 1) != 0)
  {
    -[_UIEditMenuDismissalGestureRecognizer interactionDelegate](self, "interactionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend(v4, "type") == 10)
      {
        v6 = v4;
        -[UIGestureRecognizer view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "locationInView:", v7);
        v9 = v8;
        v11 = v10;

        v12 = objc_msgSend(v5, "dismissalGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
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
    v14.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
    v12 = -[UIGestureRecognizer shouldReceiveEvent:](&v14, sel_shouldReceiveEvent_, v4);
  }

  return v12;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "phase") == 2)
  {
    v4 = 1;
LABEL_9:
    -[UIGestureRecognizer setState:](self, "setState:", v4);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "phase") != 5)
  {
    if (objc_msgSend(v5, "phase") == 3)
      v4 = 2;
    else
      v4 = 3;
    goto LABEL_9;
  }
  if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateEnded)
  {
    v4 = 4;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_transformChangedWithEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "phase") - 1;
  if (v4 <= 3)
    -[UIGestureRecognizer setState:](self, "setState:", qword_186684690[v4]);
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

+ (BOOL)canHandleEventForPassthrough:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !objc_msgSend(v3, "type") || objc_msgSend(v3, "type") == 10 || objc_msgSend(v3, "type") == 14;

  return v4;
}

- (_UIEditMenuDismissalGestureRecognizerDelegate)interactionDelegate
{
  return (_UIEditMenuDismissalGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
