@implementation SBBannerCustomTransitionAnimator

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  objc_super v10;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___SBBannerCustomTransitionAnimator;
    objc_msgSendSuper2(&v10, sel_animateInteractive_animations_completion_, v6, v8, v9);
  }
  else
  {
    objc_msgSend(a1, "performAnimationsForTransition:completion:", v8, v9);
  }

}

+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performAnimationsForTransition:completion:", v10, v9);
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SBBannerCustomTransitionAnimator;
    objc_msgSendSuper2(&v11, sel_animateWithSettings_animations_completion_, v8, v10, v9);
  }

}

- (void)_updateCustomContextWithTransitionContext:(id)a3
{
  id v4;
  SBBannerCustomTransitionAnimatorContext *v5;
  SBBannerCustomTransitionAnimatorContext *customContext;
  id v7;

  v7 = a3;
  -[SBBannerCustomTransitionAnimatorContext transitionContext](self->_customContext, "transitionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    v5 = objc_alloc_init(SBBannerCustomTransitionAnimatorContext);
    customContext = self->_customContext;
    self->_customContext = v5;

    -[SBBannerCustomTransitionAnimatorContext setTransitionContext:](self->_customContext, "setTransitionContext:", v7);
    -[SBBannerCustomTransitionAnimatorContext setPresentationTransition:](self->_customContext, "setPresentationTransition:", -[BNBannerTransitionAnimator isPresenting](self, "isPresenting"));
  }

}

- (void)animateTransition:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SBBannerCustomTransitionAnimator _updateCustomContextWithTransitionContext:](self, "_updateCustomContextWithTransitionContext:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBBannerCustomTransitionAnimator prepareForTransition:](self, "prepareForTransition:", self->_customContext);
  v5.receiver = self;
  v5.super_class = (Class)SBBannerCustomTransitionAnimator;
  -[BNBannerAnimator animateTransition:](&v5, sel_animateTransition_, v4);

}

- (void)animationEnded:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_animationEnded_))
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerCustomTransitionAnimator;
    -[SBBannerCustomTransitionAnimator animationEnded:](&v5, sel_animationEnded_, v3);
  }
}

- (void)actionsForTransition:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SBBannerCustomTransitionAnimator _updateCustomContextWithTransitionContext:](self, "_updateCustomContextWithTransitionContext:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBBannerCustomTransitionAnimator performActionsForTransition:](self, "performActionsForTransition:", self->_customContext);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerCustomTransitionAnimator;
    -[BNBannerTransitionAnimator actionsForTransition:](&v5, sel_actionsForTransition_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContext, 0);
}

@end
