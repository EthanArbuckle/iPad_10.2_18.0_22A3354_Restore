@implementation _UIEditMenuPresentation

- (_UIEditMenuPresentation)initWithDelegate:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  _UIEditMenuPresentation *v8;
  _UIEditMenuPresentation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuPresentation;
  v8 = -[_UIEditMenuPresentation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_sourceView, v7);
    v9->_currentState = 1;
  }

  return v9;
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)resolvedUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "overrideUserInterfaceStyle"))
  {
    v6 = objc_msgSend(v5, "overrideUserInterfaceStyle");
  }
  else if (dyld_program_sdk_at_least())
  {
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "userInterfaceStyle");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)forceEndPresentIfNeeded
{
  if (self->_currentState == 2)
  {
    if (-[_UIEditMenuPresentation enforcesMenuControllerLifecycle](self, "enforcesMenuControllerLifecycle"))
      -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:", 1);
  }
}

- (void)forceEndDismissalIfNeeded
{
  if (self->_currentState == 4)
  {
    if (-[_UIEditMenuPresentation enforcesMenuControllerLifecycle](self, "enforcesMenuControllerLifecycle"))
      -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:", 3);
  }
}

- (void)animateScalePresentWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, a4, a5, 0.38, a3, 0.85, 0.0);
}

- (void)animateScaleDismissalWithAnimations:(id)a3 completion:(id)a4
{
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, a3, a4, 0.45, 0.0, 0.85, 0.0);
}

- (void)animateReducedMotionTransitionWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, a4, a5, 0.25, a3);
}

- (void)animateFadeWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, a4, a5, 0.55, a3, 0.85, 0.0);
}

- (void)transitionWithEvent:(unint64_t)a3
{
  handleEvent(_stateMachineSpec, self->_currentState, a3, (uint64_t)self, (uint64_t *)&self->_currentState);
}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  id v15;

  switch(a4)
  {
    case 2uLL:
      v5 = (void *)objc_opt_new();
      -[_UIEditMenuPresentation setPresentAnimator:](self, "setPresentAnimator:", v5);

      -[_UIEditMenuPresentation delegate](self, "delegate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation presentAnimator](self, "presentAnimator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_editMenuPresentation:willPresentMenuForConfiguration:animator:", self, v6, v7);
      goto LABEL_12;
    case 3uLL:
      if (a3 == 6)
      {
        -[_UIEditMenuPresentation delegate](self, "delegate");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_editMenuPresentation:didTransitionMenuForConfiguration:", self, v6);
LABEL_13:

LABEL_14:
      }
      else
      {
        -[_UIEditMenuPresentation presentAnimator](self, "presentAnimator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "runCompletions");

        -[_UIEditMenuPresentation setPresentAnimator:](self, "setPresentAnimator:", 0);
      }
      return;
    case 4uLL:
      v8 = (void *)objc_opt_new();
      -[_UIEditMenuPresentation setDismissAnimator:](self, "setDismissAnimator:", v8);

      -[_UIEditMenuPresentation dismissingConfiguration](self, "dismissingConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v11;

      -[_UIEditMenuPresentation delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation dismissAnimator](self, "dismissAnimator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_editMenuPresentation:willDismissMenuForConfiguration:animator:", self, v15, v7);
LABEL_12:

      goto LABEL_13;
    case 5uLL:
      -[_UIEditMenuPresentation dismissAnimator](self, "dismissAnimator", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "runCompletions");

      -[_UIEditMenuPresentation setDismissAnimator:](self, "setDismissAnimator:", 0);
      return;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuPresentation.m"), 291, CFSTR("We should never reach this state."));
      goto LABEL_14;
    default:
      return;
  }
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (_UIEditMenuPresentationDelegate)delegate
{
  return (_UIEditMenuPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)enforcesMenuControllerLifecycle
{
  return self->_enforcesMenuControllerLifecycle;
}

- (void)setEnforcesMenuControllerLifecycle:(BOOL)a3
{
  self->_enforcesMenuControllerLifecycle = a3;
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (void)setDisplayedMenu:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMenu, a3);
}

- (UIEditMenuConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
}

- (UIEditMenuConfiguration)dismissingConfiguration
{
  return self->_dismissingConfiguration;
}

- (void)setDismissingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_dismissingConfiguration, a3);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (_UIEditMenuPresentationAnimator)presentAnimator
{
  return self->_presentAnimator;
}

- (void)setPresentAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_presentAnimator, a3);
}

- (_UIEditMenuPresentationAnimator)dismissAnimator
{
  return self->_dismissAnimator;
}

- (void)setDismissAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAnimator, 0);
  objc_storeStrong((id *)&self->_presentAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingConfiguration, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
