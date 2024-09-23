@implementation _UIPopoverDimmingView

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverDimmingView;
  -[UIDimmingView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  if (dyld_program_sdk_at_least())
  {
    if (self->_passthroughScrollInteraction)
      -[UIView removeInteraction:](self, "removeInteraction:");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  _UIPassthroughScrollInteraction *passthroughScrollInteraction;
  _UIPassthroughScrollInteraction *v5;
  _UIPassthroughScrollInteraction *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverDimmingView;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  if (dyld_program_sdk_at_least())
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      passthroughScrollInteraction = self->_passthroughScrollInteraction;
      if (!passthroughScrollInteraction)
      {
        v5 = objc_alloc_init(_UIPassthroughScrollInteraction);
        v6 = self->_passthroughScrollInteraction;
        self->_passthroughScrollInteraction = v5;

        -[_UIPassthroughScrollInteraction setDelegate:](self->_passthroughScrollInteraction, "setDelegate:", self);
        -[_UIPopoverDimmingView _updatePassthroughInteraction](self, "_updatePassthroughInteraction");
        passthroughScrollInteraction = self->_passthroughScrollInteraction;
      }
      -[UIView addInteraction:](self, "addInteraction:", passthroughScrollInteraction);
    }
  }
}

- (BOOL)_delegateAllowsInteraction
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[UIDimmingView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[UIDimmingView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "popoverDimmingViewShouldAllowInteraction:", self);

  return v6;
}

- (void)_sendDelegateDimmingViewWasTapped
{
  id v3;

  -[UIDimmingView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverDimmingViewDidReceiveDismissalInteraction:", self);

}

- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3
{
  -[_UIPassthroughScrollInteraction _setOverrideAllowsHitTestingOnTouchFallbackView:](self->_passthroughScrollInteraction, "_setOverrideAllowsHitTestingOnTouchFallbackView:", a3);
}

- (void)setPassThroughDismissalTaps:(BOOL)a3
{
  self->_passThroughDismissalTaps = a3;
  -[_UIPopoverDimmingView _updatePassthroughInteraction](self, "_updatePassthroughInteraction");
}

- (void)_updatePassthroughInteraction
{
  -[_UIPassthroughScrollInteraction setEatsTouches:](self->_passthroughScrollInteraction, "setEatsTouches:", -[_UIPopoverDimmingView passThroughDismissalTaps](self, "passThroughDismissalTaps") ^ 1);
  -[_UIPassthroughScrollInteraction setRecognizeOnPrimaryButtonDown:](self->_passthroughScrollInteraction, "setRecognizeOnPrimaryButtonDown:", -[_UIPopoverDimmingView passThroughDismissalTaps](self, "passThroughDismissalTaps"));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIPopoverDimmingView *v8;
  _UIPopoverDimmingView *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_lastHitTestWasPassedThrough = 0;
  v11.receiver = self;
  v11.super_class = (Class)_UIPopoverDimmingView;
  -[UIDimmingView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIPopoverDimmingView *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0
    && v8 == self
    && !-[UIDimmingView ignoresTouches](self, "ignoresTouches")
    && +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:](_UIPassthroughScrollInteraction, "_shouldEventBePassedThrough:", v7)&& -[_UIPopoverDimmingView _delegateAllowsInteraction](self, "_delegateAllowsInteraction"))
  {
    v9 = 0;
    self->_lastHitTestWasPassedThrough = 1;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;

  y = a4.y;
  x = a4.x;
  self->_lastHitTestWasPassedThrough = 0;
  v9 = a5;
  objc_msgSend(a3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", v11, x, y);
  v13 = v12;
  v15 = v14;

  -[UIView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hitTest:withEvent:", v9, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  v20 = v19 == 6 && !v17 || self->_lastHitTestWasPassedThrough;
  return v20;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  _UIPopoverDimmingView *v3;
  void *v4;

  v3 = self;
  -[UIDimmingView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "popoverDimmingViewDidReceiveDismissalInteraction:", v3);

  return (char)v3;
}

- (_UIPassthroughScrollInteraction)_passthroughScrollInteraction
{
  return self->_passthroughScrollInteraction;
}

- (UIView)transitionContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_transitionContainerView);
}

- (void)setTransitionContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContainerView, a3);
}

- (BOOL)passThroughDismissalTaps
{
  return self->_passThroughDismissalTaps;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionContainerView);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
}

@end
