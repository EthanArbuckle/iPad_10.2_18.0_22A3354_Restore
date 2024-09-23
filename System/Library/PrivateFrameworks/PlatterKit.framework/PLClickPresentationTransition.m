@implementation PLClickPresentationTransition

- (PLClickPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  PLClickPresentationTransition *v11;
  PLClickPresentationTransition *v12;
  _PLViewControllerOneToOneTransitionContext *v13;
  _PLViewControllerOneToOneTransitionContext *transitionContext;
  uint64_t v15;
  id completion;
  objc_super v18;

  v9 = a3;
  v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLClickPresentationTransition;
  v11 = -[PLClickPresentationTransition init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transitionDelegate, a3);
    v13 = objc_alloc_init(_PLViewControllerOneToOneTransitionContext);
    transitionContext = v12->_transitionContext;
    v12->_transitionContext = v13;

    v15 = objc_msgSend(v10, "copy");
    completion = v12->_completion;
    v12->_completion = (id)v15;

  }
  return v12;
}

- (void)updateBackgroundViewForTransition
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLClickPresentationInteractionManager.m"), 420, CFSTR("Abstract"));

}

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_transitionContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLClickPresentationInteractionManager.m"), 426, CFSTR("Must have a transition context at this point."));

  }
  -[PLClickPresentationTransition _configureTransitionContextWithFromView:toView:containerView:](self, "_configureTransitionContextWithFromView:toView:containerView:", v13, v9, v10);
  -[PLClickPresentationTransition _animator](self, "_animator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareForTransitionWithContext:", self->_transitionContext);

}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v9;
  id v10;
  PLViewControllerAnimator *animator;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_animator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLClickPresentationInteractionManager.m"), 432, CFSTR("Must have an animator at this point."));

  }
  if (!self->_transitionContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLClickPresentationInteractionManager.m"), 433, CFSTR("Must have a transition context at this point."));

  }
  animator = self->_animator;
  -[PLClickPresentationTransition _animator](self, "_animator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLViewControllerAnimator setRunAlongsideAnimationsManually:](animator, "setRunAlongsideAnimationsManually:", objc_msgSend((id)objc_opt_class(), "drivesAnimation"));

  -[PLViewControllerAnimator performTransitionWithContext:](self->_animator, "performTransitionWithContext:", self->_transitionContext);
  -[PLClickPresentationTransition updateBackgroundViewForTransition](self, "updateBackgroundViewForTransition");

}

- (void)transitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  id completion;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)MEMORY[0x1D17E5ED8](self->_completion, a2);
  completion = self->_completion;
  self->_completion = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v3);
    v6 = v7;
  }

}

- (UIViewPropertyAnimator)customAnimator
{
  void *v3;
  void *v4;
  void *v5;

  -[PLClickPresentationTransition _animator](self, "_animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "drivesAnimation"))
  {
    -[PLClickPresentationTransition _animator](self, "_animator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIViewPropertyAnimator *)v5;
}

- (id)_newAnimator
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLClickPresentationInteractionManager.m"), 454, CFSTR("Abstract"));

  return 0;
}

- (id)_animator
{
  PLViewControllerAnimator *animator;
  PLViewControllerAnimator *v4;
  PLViewControllerAnimator *v5;

  animator = self->_animator;
  if (!animator)
  {
    v4 = -[PLClickPresentationTransition _newAnimator](self, "_newAnimator");
    v5 = self->_animator;
    self->_animator = v4;

    animator = self->_animator;
  }
  return animator;
}

- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _PLViewControllerOneToOneTransitionContext *transitionContext;
  __int128 v13;
  _OWORD v14[3];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLClickPresentationTransition _animator](self, "_animator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionContext _setAnimator:](self->_transitionContext, "_setAnimator:", v11);
  -[_UIViewControllerTransitionContext _setIsAnimated:](self->_transitionContext, "_setIsAnimated:", 1);
  -[_UIViewControllerOneToOneTransitionContext _setFromView:](self->_transitionContext, "_setFromView:", v10);

  -[_UIViewControllerOneToOneTransitionContext _setToView:](self->_transitionContext, "_setToView:", v9);
  -[_UIViewControllerTransitionContext _setContainerView:](self->_transitionContext, "_setContainerView:", v8);

  transitionContext = self->_transitionContext;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v13;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[_PLViewControllerOneToOneTransitionContext setTargetTransform:](transitionContext, "setTargetTransform:", v14);

}

- (MTMaterialView)backgroundView
{
  return (MTMaterialView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (BOOL)propagatesPresentingViewTransform
{
  return self->_propagatesPresentingViewTransform;
}

- (void)setPropagatesPresentingViewTransform:(BOOL)a3
{
  self->_propagatesPresentingViewTransform = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_transitionDelegate, 0);
}

@end
