@implementation _UICollectionViewControllerLayoutToLayoutTransition

+ (id)transitionForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    NSLog(CFSTR("Attempt to use a shared collection view controller for a navigation transition (%@) for something other than a push or pop."), v9);
LABEL_4:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "setOperation:", a3);
  objc_msgSend(v8, "loadViewIfRequired");
  objc_msgSend(v8, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setToLayout:", v12);

  if (a3 == 1)
    v13 = v8;
  else
    v13 = v7;
  objc_msgSend(v10, "setCrossFadeNavigationBar:", objc_msgSend(v13, "shouldCrossFadeNavigationBar"));
  objc_msgSend(v10, "setCrossFadeBottomBars:", objc_msgSend(v13, "shouldCrossFadeBottomBars"));
  v11 = v10;
LABEL_9:

  return v11;
}

- (void)animationEnded:(BOOL)a3
{
  id v3;

  -[_UICollectionViewControllerLayoutToLayoutTransition interactionController](self, "interactionController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resetInteractionController");

}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
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
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _UICollectionViewControllerLayoutToLayoutTransition *v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke;
  v31[3] = &unk_1E16B2268;
  v10 = v4;
  v32 = v10;
  objc_msgSend(v8, "_setNavigationCompletion:", v31);

  objc_msgSend(v6, "_navigationControllerContentInsetAdjustment");
  objc_msgSend(v5, "_primitiveSetNavigationControllerContentInsetAdjustment:");
  objc_msgSend(v6, "_navigationControllerContentOffsetAdjustment");
  objc_msgSend(v5, "_primitiveSetNavigationControllerContentOffsetAdjustment:");
  objc_msgSend(v6, "_contentOverlayInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v6, "_leftContentMargin");
  v20 = v19;
  objc_msgSend(v6, "_rightContentMargin");
  objc_msgSend(v5, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v12, v14, v16, v18, v20, v21);
  objc_msgSend(v10, "finalFrameForViewController:", v5);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v10, "containerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v7);

  -[_UICollectionViewControllerLayoutToLayoutTransition transitionDuration:](self, "transitionDuration:", v10);
  v24 = v23;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke_2;
  v27[3] = &unk_1E16B47A8;
  v28 = v5;
  v29 = self;
  v30 = v10;
  v25 = v10;
  v26 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v27, v24);

}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return self->_crossFadeNavigationBar;
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return self->_crossFadeBottomBars;
}

- (UICollectionViewLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
  objc_storeStrong((id *)&self->_toLayout, a3);
}

- (BOOL)crossFadeNavigationBar
{
  return self->_crossFadeNavigationBar;
}

- (void)setCrossFadeNavigationBar:(BOOL)a3
{
  self->_crossFadeNavigationBar = a3;
}

- (BOOL)crossFadeBottomBars
{
  return self->_crossFadeBottomBars;
}

- (void)setCrossFadeBottomBars:(BOOL)a3
{
  self->_crossFadeBottomBars = a3;
}

- (UIPercentDrivenInteractiveTransition)interactionController
{
  return self->_interactionController;
}

- (void)setInteractionController:(id)a3
{
  self->_interactionController = (UIPercentDrivenInteractiveTransition *)a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toLayout, 0);
}

@end
