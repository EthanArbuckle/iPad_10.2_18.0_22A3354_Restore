@implementation SBBannerCustomTransitionAnimatorContext

- (id)targetViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBBannerCustomTransitionAnimatorContext transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBannerCustomTransitionAnimatorContext transitionContext](self, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBBannerCustomTransitionAnimatorContext isPresentationTransition](self, "isPresentationTransition"))
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (UIView)transitionView
{
  void *v2;
  void *v3;

  -[SBBannerCustomTransitionAnimatorContext targetViewController](self, "targetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGRect)initialFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SBBannerCustomTransitionAnimatorContext transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerCustomTransitionAnimatorContext targetViewController](self, "targetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialFrameForViewController:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)initialContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[SBBannerCustomTransitionAnimatorContext targetViewController](self, "targetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "bannerContentOutsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0CEB4B0];
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  -[SBBannerCustomTransitionAnimatorContext initialFrame](self, "initialFrame");
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v11 + v7);
  v19 = v18 - (v9 + v5);

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)finalFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SBBannerCustomTransitionAnimatorContext transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerCustomTransitionAnimatorContext targetViewController](self, "targetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finalFrameForViewController:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)finalContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[SBBannerCustomTransitionAnimatorContext targetViewController](self, "targetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "bannerContentOutsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0CEB4B0];
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  -[SBBannerCustomTransitionAnimatorContext finalFrame](self, "finalFrame");
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v11 + v7);
  v19 = v18 - (v9 + v5);

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (BOOL)isPresentationTransition
{
  return self->_presentationTransition;
}

- (void)setPresentationTransition:(BOOL)a3
{
  self->_presentationTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
