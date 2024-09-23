@implementation _UIEditMenuContainerView

- (_UIEditMenuContainerView)initWithPresentation:(id)a3 enablePassthrough:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _UIEditMenuContainerView *v7;
  _UIEditMenuContainerView *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuContainerView;
  v7 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_presentation, v6);
    if (v4)
    {
      v8->_dismissesOnViewportResize = 1;
      -[_UIEditMenuContainerView _installDismissalGesture](v8, "_installDismissalGesture");
    }
  }

  return v8;
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
    -[_UIEditMenuContainerView _dismissMenuPresentationForSizeChange](self, "_dismissMenuPresentationForSizeChange");
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuContainerView;
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
    -[_UIEditMenuContainerView _dismissMenuPresentationForSizeChange](self, "_dismissMenuPresentationForSizeChange");
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuContainerView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_dismissMenuPresentationForSizeChange
{
  void *v3;
  void *v4;
  _QWORD block[5];

  if (-[_UIEditMenuContainerView dismissesOnViewportResize](self, "dismissesOnViewportResize"))
  {
    -[_UIEditMenuContainerView presentation](self, "presentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayedMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65___UIEditMenuContainerView__dismissMenuPresentationForSizeChange__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
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

  self->_ignoresPassthroughInPresentationSource = 0;
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIEditMenuContainerView;
  -[UIView willMoveToWindow:](&v7, sel_willMoveToWindow_, a3);
  -[_UIEditMenuContainerView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuContainerView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
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
  v7.super_class = (Class)_UIEditMenuContainerView;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIEditMenuContainerView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIEditMenuContainerView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addGestureRecognizer:", v5);

      -[_UIEditMenuContainerView touchFallbackView](self, "touchFallbackView");
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
    -[_UIEditMenuContainerView presentation](self, "presentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideMenuWithReason:", 0);

  }
}

- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;

  -[_UIEditMenuContainerView presentation](self, "presentation", a3, a5, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
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
  id v15;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  self->_lastHitTestPassedThrough = 0;
  objc_msgSend(a3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", self, x, y);
  v12 = v11;
  v14 = v13;

  v15 = -[_UIEditMenuContainerView hitTest:withEvent:](self, "hitTest:withEvent:", v9, v12, v14);
  LOBYTE(v10) = self->_lastHitTestPassedThrough;

  return (char)v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIEditMenuContainerView *v8;
  _UIEditMenuContainerView *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIEditMenuContainerView;
  -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIEditMenuContainerView *)objc_claimAutoreleasedReturnValue();
  if (v8 != self)
    goto LABEL_2;
  -[_UIEditMenuContainerView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
  v9 = (_UIEditMenuContainerView *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_3;
  if (objc_msgSend(v7, "type") == 9)
  {
    v9 = 0;
    goto LABEL_3;
  }
  if (+[_UIEditMenuDismissalGestureRecognizer canHandleEventForPassthrough:](_UIEditMenuDismissalGestureRecognizer, "canHandleEventForPassthrough:", v7))
  {
    if (-[_UIEditMenuContainerView ignoresPassthroughInPresentationSource](self, "ignoresPassthroughInPresentationSource"))
    {
      -[_UIEditMenuContainerView presentation](self, "presentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sourceView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
      -[UIView window](self, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);

      -[UIView window](self, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hitTest:withEvent:", v7, x, y);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
      v16 = objc_msgSend(v15, "isDescendantOfView:", v12) ^ 1;

    }
    else
    {
      v16 = 1;
    }
    v9 = 0;
    self->_lastHitTestPassedThrough = v16;
  }
  else
  {
LABEL_2:
    v9 = v8;
  }
LABEL_3:

  return v9;
}

- (_UIEditMenuPresentation)presentation
{
  return (_UIEditMenuPresentation *)objc_loadWeakRetained((id *)&self->_presentation);
}

- (BOOL)ignoresPassthroughInPresentationSource
{
  return self->_ignoresPassthroughInPresentationSource;
}

- (void)setIgnoresPassthroughInPresentationSource:(BOOL)a3
{
  self->_ignoresPassthroughInPresentationSource = a3;
}

- (BOOL)dismissesOnViewportResize
{
  return self->_dismissesOnViewportResize;
}

- (void)setDismissesOnViewportResize:(BOOL)a3
{
  self->_dismissesOnViewportResize = a3;
}

- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentation);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
}

@end
