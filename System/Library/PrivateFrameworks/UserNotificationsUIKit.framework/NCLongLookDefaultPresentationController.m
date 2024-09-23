@implementation NCLongLookDefaultPresentationController

- (NCLongLookDefaultPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6
{
  id v10;
  NCLongLookDefaultPresentationController *v11;
  NCLongLookDefaultPresentationController *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NCLongLookDefaultPresentationController;
  v11 = -[PLExpandedPlatterPresentationController initWithPresentedViewController:presentingViewController:sourceViewController:sourceView:](&v14, sel_initWithPresentedViewController_presentingViewController_sourceViewController_sourceView_, a3, a4, v10, a6);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_sourceViewController, v10);

  return v12;
}

- (BOOL)shouldPresentInFullscreen
{
  return !-[NCLongLookDefaultPresentationController _shouldPresentInCurrentContext](self, "_shouldPresentInCurrentContext");
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect result;

  v4 = a3;
  -[PLExpandedPlatterPresentationController presentationControllerDelegate](self, "presentationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expandedPlatterPresentationController:frameForTransitionViewInPresentationSuperview:", self, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  if (CGRectIsEmpty(v23))
  {
    v22.receiver = self;
    v22.super_class = (Class)NCLongLookDefaultPresentationController;
    -[NCLongLookDefaultPresentationController _frameForTransitionViewInPresentationSuperview:](&v22, sel__frameForTransitionViewInPresentationSuperview_, v4);
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }

  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  MTMaterialView *v5;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCLongLookDefaultPresentationController;
  -[PLExpandedPlatterPresentationController presentationTransitionWillBegin](&v8, sel_presentationTransitionWillBegin);
  -[PLExpandedPlatterPresentationController presentationControllerDelegate](self, "presentationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "customBackgroundContainerViewForExpandedPlatterPresentationController:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[NCLongLookDefaultPresentationController containerView](self, "containerView"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v3, "expandedPlatterPresentationControllerShouldProvideBackground:", self))
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 6, 0, 0.0);
      v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
      backgroundMaterialView = self->_backgroundMaterialView;
      self->_backgroundMaterialView = v5;

      v7 = self->_backgroundMaterialView;
      objc_msgSend(v4, "bounds");
      -[MTMaterialView setFrame:](v7, "setFrame:");
      -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", self->_backgroundMaterialView);
      objc_msgSend(v4, "sendSubviewToBack:", self->_backgroundMaterialView);
    }
  }

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  MTMaterialView *backgroundMaterialView;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCLongLookDefaultPresentationController;
  -[NCLongLookDefaultPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    -[MTMaterialView removeFromSuperview](self->_backgroundMaterialView, "removeFromSuperview");
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = 0;

  }
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v6;
  void *v7;
  void *v8;
  MTMaterialView *v9;
  _QWORD v10[4];
  MTMaterialView *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCLongLookDefaultPresentationController;
  -[PLExpandedPlatterPresentationController viewControllerAnimator:willBeginPresentationAnimationWithTransitionContext:](&v12, sel_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext_, a3, a4);
  backgroundMaterialView = self->_backgroundMaterialView;
  if (backgroundMaterialView)
  {
    v6 = backgroundMaterialView;
    -[NCLongLookDefaultPresentationController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __118__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E8D1E258;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v10, 0);

  }
}

uint64_t __118__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWeighting:", 1.0);
}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v6;
  void *v7;
  void *v8;
  MTMaterialView *v9;
  _QWORD v10[4];
  MTMaterialView *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCLongLookDefaultPresentationController;
  -[PLExpandedPlatterPresentationController viewControllerAnimator:willBeginDismissalAnimationWithTransitionContext:](&v12, sel_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext_, a3, a4);
  backgroundMaterialView = self->_backgroundMaterialView;
  if (backgroundMaterialView)
  {
    v6 = backgroundMaterialView;
    -[NCLongLookDefaultPresentationController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __115__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E8D1E258;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v10, 0);

  }
}

uint64_t __115__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWeighting:", 0.0);
}

- (BOOL)_shouldPresentInCurrentContext
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceViewController);
  v3 = objc_msgSend(WeakRetained, "definesPresentationContext");

  return v3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_destroyWeak((id *)&self->_sourceViewController);
}

@end
