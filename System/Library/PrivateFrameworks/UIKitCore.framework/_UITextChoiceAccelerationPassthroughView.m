@implementation _UITextChoiceAccelerationPassthroughView

- (_UITextChoiceAccelerationPassthroughView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UITextChoiceAccelerationPassthroughView *v10;
  _UITextChoiceAccelerationPassthroughView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    -[_UITextChoiceAccelerationPassthroughView _installDismissalGesture](v11, "_installDismissalGesture");
  }

  return v11;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (width != v9 || height != v8)
    -[_UITextChoiceAccelerationPassthroughView _passthroughViewDidChangeSize](self, "_passthroughViewDidChangeSize");
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  if (width != v9 || height != v8)
    -[_UITextChoiceAccelerationPassthroughView _passthroughViewDidChangeSize](self, "_passthroughViewDidChangeSize");
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_passthroughViewDidChangeSize
{
  id v2;

  -[_UITextChoiceAccelerationPassthroughView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passthruViewDidChangeSize");

}

- (_UITouchFallbackView)touchFallbackView
{
  _UITouchFallbackView *touchFallbackView;
  _UITouchFallbackView *v4;
  _UITouchFallbackView *v5;
  _UITouchFallbackView *v6;

  touchFallbackView = self->_touchFallbackView;
  if (!touchFallbackView)
  {
    v4 = [_UITouchFallbackView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[_UITouchFallbackView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_touchFallbackView;
    self->_touchFallbackView = v5;

    -[_UITouchFallbackView setDelegate:](self->_touchFallbackView, "setDelegate:", self);
    -[UIView setAutoresizingMask:](self->_touchFallbackView, "setAutoresizingMask:", 18);
    touchFallbackView = self->_touchFallbackView;
  }
  return touchFallbackView;
}

- (void)_installDismissalGesture
{
  _UIEditMenuDismissalGestureRecognizer *v3;
  _UIEditMenuDismissalGestureRecognizer *dismissalGestureRecognizer;

  v3 = -[_UIEditMenuDismissalGestureRecognizer initWithTarget:action:]([_UIEditMenuDismissalGestureRecognizer alloc], "initWithTarget:action:", self, sel_didRecognizeDismissalGestureRecognizer_);
  -[_UIEditMenuDismissalGestureRecognizer setInteractionDelegate:](v3, "setInteractionDelegate:", self);
  dismissalGestureRecognizer = self->_dismissalGestureRecognizer;
  self->_dismissalGestureRecognizer = v3;

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView willMoveToWindow:](&v7, sel_willMoveToWindow_, a3);
  -[_UITextChoiceAccelerationPassthroughView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationPassthroughView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

  }
  -[UIView removeFromSuperview](self->_touchFallbackView, "removeFromSuperview");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UITextChoiceAccelerationPassthroughView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UITextChoiceAccelerationPassthroughView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addGestureRecognizer:", v5);

      -[_UITextChoiceAccelerationPassthroughView touchFallbackView](self, "touchFallbackView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v3, "insertSubview:atIndex:", v6, 0);

    }
  }

}

- (void)didRecognizeDismissalGestureRecognizer:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4 == 1)
      self->_didDismissFromGesture = 0;
  }
  else if (!self->_didDismissFromGesture)
  {
    self->_didDismissFromGesture = 1;
    -[_UITextChoiceAccelerationPassthroughView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didRecognizeDismissal");

  }
}

- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return 1;
}

- (BOOL)dismissalGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  objc_msgSend(a3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", self, x, y);
  v12 = v11;
  v14 = v13;

  -[_UITextChoiceAccelerationPassthroughView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_UITextChoiceAccelerationPassthroughView _hitTest:withEvent:withSourceView:](self, "_hitTest:withEvent:withSourceView:", v9, v16, v12, v14);

  return (char)self;
}

- (BOOL)_hitTest:(CGPoint)a3 withEvent:(id)a4 withSourceView:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  if (!a5)
    return 1;
  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = a4;
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[UIView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);

  -[UIView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hitTest:withEvent:", v10, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  LOBYTE(self) = objc_msgSend(v13, "isDescendantOfView:", v9);

  v14 = self ^ 1;
  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UITextChoiceAccelerationPassthroughView *v8;
  _UITextChoiceAccelerationPassthroughView *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UITextChoiceAccelerationPassthroughView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    -[_UITextChoiceAccelerationPassthroughView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
    v9 = (_UITextChoiceAccelerationPassthroughView *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_7;
    if (objc_msgSend(v7, "type") == 9
      || +[_UIEditMenuDismissalGestureRecognizer canHandleEventForPassthrough:](_UIEditMenuDismissalGestureRecognizer, "canHandleEventForPassthrough:", v7))
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (_UITextChoiceAccelerationPassthroughDelegate)delegate
{
  return (_UITextChoiceAccelerationPassthroughDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
}

@end
