@implementation _UIAnimationCoordinator

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  _UIViewControllerOneToOneTransitionContext *v4;
  _UIViewControllerOneToOneTransitionContext *v5;

  transitionContext = self->_transitionContext;
  if (!transitionContext)
  {
    v4 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    v5 = self->_transitionContext;
    self->_transitionContext = v4;

    transitionContext = self->_transitionContext;
  }
  return transitionContext;
}

- (void)dealloc
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  _UIViewControllerOneToOneTransitionContext *v4;
  objc_super v5;

  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    -[_UIViewControllerTransitionContext _setInteractor:](transitionContext, "_setInteractor:", 0);
    -[_UIViewControllerTransitionContext _setAnimator:](self->_transitionContext, "_setAnimator:", 0);
    v4 = self->_transitionContext;
    self->_transitionContext = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAnimationCoordinator;
  -[_UIAnimationCoordinator dealloc](&v5, sel_dealloc);
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[_UIViewControllerTransitionContext _setDuration:](self->_transitionContext, "_setDuration:");
  }
}

- (NSMutableDictionary)stash
{
  NSMutableDictionary *stash;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  stash = self->_stash;
  if (!stash)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_stash;
    self->_stash = v4;

    stash = self->_stash;
  }
  return stash;
}

- (void)setContainerView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_containerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_containerView, a3);
    -[_UIViewControllerTransitionContext _setContainerView:](self->_transitionContext, "_setContainerView:", self->_containerView);
    v5 = v6;
  }

}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewController, a3);
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](self->_transitionContext, "_setFromViewController:", self->_viewController);
    v5 = v6;
  }

}

- (void)setStartFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_startFrame))
  {
    self->_startFrame.origin.x = x;
    self->_startFrame.origin.y = y;
    self->_startFrame.size.width = width;
    self->_startFrame.size.height = height;
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](self->_transitionContext, "_setToStartFrame:", x, y, width, height);
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](self->_transitionContext, "_setFromStartFrame:", self->_startFrame.origin.x, self->_startFrame.origin.y, self->_startFrame.size.width, self->_startFrame.size.height);
  }
}

- (void)setEndFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_endFrame))
  {
    self->_endFrame.origin.x = x;
    self->_endFrame.origin.y = y;
    self->_endFrame.size.width = width;
    self->_endFrame.size.height = height;
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](self->_transitionContext, "_setToEndFrame:", x, y, width, height);
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](self->_transitionContext, "_setFromEndFrame:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  }
}

- (void)_updateTransitionContext
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[_UIAnimationCoordinator transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_duration > 0.0 && self->_animator != 0;
  v5 = v3;
  objc_msgSend(v3, "_setIsAnimated:", v4);
  objc_msgSend(v5, "_setFromViewController:", self->_viewController);
  objc_msgSend(v5, "_setToViewController:", 0);
  objc_msgSend(v5, "_setContainerView:", self->_containerView);
  objc_msgSend(v5, "_setToStartFrame:", self->_startFrame.origin.x, self->_startFrame.origin.y, self->_startFrame.size.width, self->_startFrame.size.height);
  objc_msgSend(v5, "_setFromStartFrame:", self->_startFrame.origin.x, self->_startFrame.origin.y, self->_startFrame.size.width, self->_startFrame.size.height);
  objc_msgSend(v5, "_setToEndFrame:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  objc_msgSend(v5, "_setFromEndFrame:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  objc_msgSend(v5, "_setAnimator:", self);

}

- (void)animate
{
  _QWORD v3[5];

  -[_UIAnimationCoordinator _updateTransitionContext](self, "_updateTransitionContext");
  if (self->_preperation)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __34___UIAnimationCoordinator_animate__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  }
  -[_UIAnimationCoordinator animateTransition:](self, "animateTransition:", self->_transitionContext);
}

- (void)animateInteractively
{
  UIPercentDrivenInteractiveTransition *v3;
  UIPercentDrivenInteractiveTransition *interactiveTransition;
  _QWORD v5[5];

  -[_UIAnimationCoordinator _updateTransitionContext](self, "_updateTransitionContext");
  v3 = objc_alloc_init(UIPercentDrivenInteractiveTransition);
  interactiveTransition = self->_interactiveTransition;
  self->_interactiveTransition = v3;

  -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](self->_interactiveTransition, "startInteractiveTransition:", self->_transitionContext);
  -[_UIViewControllerTransitionContext _setInteractor:](self->_transitionContext, "_setInteractor:", self->_interactiveTransition);
  -[_UIViewControllerTransitionContext _setTransitionIsInFlight:](self->_transitionContext, "_setTransitionIsInFlight:", 1);
  -[_UIViewControllerTransitionContext _setInteractiveUpdateHandler:](self->_transitionContext, "_setInteractiveUpdateHandler:", &__block_literal_global_144);
  if (self->_preperation)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47___UIAnimationCoordinator_animateInteractively__block_invoke_2;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (void)updateInteractiveProgress:(double)a3
{
  UIPercentDrivenInteractiveTransition *interactiveTransition;
  double v5;
  void *v8;

  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAnimationCoordinator.m"), 151, CFSTR("Trying to update an interactive transition that was not started interactively"));

    interactiveTransition = self->_interactiveTransition;
  }
  v5 = 0.0;
  if (a3 >= 0.0)
  {
    v5 = a3;
    if (a3 >= 1.0)
      v5 = nextafter(1.0, -1.0);
  }
  -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](interactiveTransition, "updateInteractiveTransition:", v5);
}

- (void)cancelInteractiveAnimation
{
  UIPercentDrivenInteractiveTransition *interactiveTransition;
  void *v5;

  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAnimationCoordinator.m"), 157, CFSTR("Trying to cancel an interactive transition that was not started interactively"));

    interactiveTransition = self->_interactiveTransition;
  }
  -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](interactiveTransition, "cancelInteractiveTransition");
}

- (void)finishInteractiveAnimation
{
  UIPercentDrivenInteractiveTransition *interactiveTransition;
  void *v5;

  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAnimationCoordinator.m"), 163, CFSTR("Trying to finish an interactive transition that was not started interactively"));

    interactiveTransition = self->_interactiveTransition;
  }
  -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](interactiveTransition, "finishInteractiveTransition");
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void (**animator)(id, _UIAnimationCoordinator *);
  void *v8;
  id v9;
  void *v10;
  double duration;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  void (**v17)(_QWORD);
  _QWORD v18[5];
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45___UIAnimationCoordinator_animateTransition___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[_UIViewControllerTransitionContext isAnimated](self->_transitionContext, "isAnimated"))
  {
    if (self->_interactiveTransition)
    {
      -[UIView window](self->_containerView, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "beginDisablingInterfaceAutorotation");
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __45___UIAnimationCoordinator_animateTransition___block_invoke_2;
    v18[3] = &unk_1E16B1B28;
    v18[4] = self;
    v8 = _Block_copy(v18);
    v12 = v4;
    v13 = 3221225472;
    v14 = __45___UIAnimationCoordinator_animateTransition___block_invoke_3;
    v15 = &unk_1E16BC218;
    v9 = v6;
    v16 = v9;
    v17 = v5;
    v10 = _Block_copy(&v12);
    duration = self->_duration;
    if (self->_interactiveTransition)
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v8, v10, duration, 0.0, v12, v13, v14, v15, v16);
    else
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v8, v10, duration, 0.0, 1.0, 0.0, v12, v13, v14, v15, v16);

  }
  else
  {
    animator = (void (**)(id, _UIAnimationCoordinator *))self->_animator;
    if (animator)
      animator[2](animator, self);
    -[_UIViewControllerTransitionContext __runAlongsideAnimations](self->_transitionContext, "__runAlongsideAnimations");
    v5[2](v5);
  }

}

- (void)animationEnded:(BOOL)a3
{
  void (**completion)(id, _UIAnimationCoordinator *);

  completion = (void (**)(id, _UIAnimationCoordinator *))self->_completion;
  if (completion)
    completion[2](completion, self);
}

- (double)duration
{
  return self->_duration;
}

- (id)preperation
{
  return self->_preperation;
}

- (void)setPreperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (CGRect)startFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animator, 0);
  objc_storeStrong(&self->_preperation, 0);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_stash, 0);
}

@end
