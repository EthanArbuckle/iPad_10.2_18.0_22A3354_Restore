@implementation WFCompactPlatterViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WFCompactPlatterViewController)init
{
  WFCompactPlatterViewController *v2;
  WFCompactPlatterViewController *v3;
  uint64_t v4;
  WFCompactPlatterTransitioningDelegate *wf_transitioningDelegate;
  WFCompactPlatterViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterViewController;
  v2 = -[WFCompactPlatterViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFCompactPlatterViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 4);
    v4 = objc_opt_new();
    wf_transitioningDelegate = v3->_wf_transitioningDelegate;
    v3->_wf_transitioningDelegate = (WFCompactPlatterTransitioningDelegate *)v4;

    -[WFCompactPlatterViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", v3->_wf_transitioningDelegate);
    v6 = v3;
  }

  return v3;
}

- (void)setTransitioningDelegate:(id)a3
{
  WFCompactPlatterTransitioningDelegate *v4;
  WFCompactPlatterTransitioningDelegate *wf_transitioningDelegate;
  objc_super v6;

  v4 = (WFCompactPlatterTransitioningDelegate *)a3;
  wf_transitioningDelegate = self->_wf_transitioningDelegate;
  if (wf_transitioningDelegate != v4)
  {
    self->_wf_transitioningDelegate = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterViewController;
  -[WFCompactPlatterViewController setTransitioningDelegate:](&v6, sel_setTransitioningDelegate_, v4);

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterViewController;
  -[WFCompactPlatterViewController loadView](&v8, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BEBD918]);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setDelaysContentTouches:", 0);
  -[WFCompactPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[WFCompactPlatterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  objc_storeWeak((id *)&self->_scrollView, v3);
  objc_msgSend(v3, "setClipsToBounds:", 0);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 2);
  v6 = (void *)objc_opt_new();
  -[WFCompactPlatterViewController appearanceProvider](self, "appearanceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppearanceProvider:", v7);

  objc_msgSend(v6, "setSizingDelegate:", self);
  objc_msgSend(v3, "addSubview:", v6);
  objc_storeWeak((id *)&self->_platterView, v6);

}

- (WFCompactPlatterView)platterView
{
  -[WFCompactPlatterViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (WFCompactPlatterView *)objc_loadWeakRetained((id *)&self->_platterView);
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scrollToTopIfPossible:", v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterViewController;
  -[WFCompactPlatterViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WFCompactPlatterViewController updateContentSizeAndPlatterPosition](self, "updateContentSizeAndPlatterPosition");
}

- (void)updateContentSizeAndPlatterPosition
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL8 v35;
  void *v36;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v7, 1.79769313e308);
  v9 = v8;
  v11 = v10;

  -[WFCompactPlatterViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13 - v11;

  -[WFCompactPlatterViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  -[WFCompactPlatterViewController contentHeightForWidth:withMaximumVisibleHeight:](self, "contentHeightForWidth:withMaximumVisibleHeight:", v16, fmax(v14, 0.0));
  v18 = v17;

  -[WFCompactPlatterViewController setMinimumPlatterSize:](self, "setMinimumPlatterSize:", v9, v11);
  -[WFCompactPlatterViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentSize:", v21, v11 + v18);

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentHeightWhenClipped:", v18);

  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentSize");
  -[WFCompactPlatterViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v27 = v26;
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  -[WFCompactPlatterViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v31 = vabdd_f64(v27, v30);
  if (v31 < 2.22044605e-16)
  {
    v35 = 0;
  }
  else
  {
    -[WFCompactPlatterViewController scrollView](self, "scrollView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentSize");
    v33 = v32;
    -[WFCompactPlatterViewController scrollView](self, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v35 = v33 > v34;
  }
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClippingContent:", v35);

  if (v31 >= 2.22044605e-16)
  {

  }
  -[WFCompactPlatterViewController updateScrollViewSeparators](self, "updateScrollViewSeparators");
  -[WFCompactPlatterViewController updatePlatterPosition](self, "updatePlatterPosition");
}

- (void)updatePlatterPosition
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
  id v14;

  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v14, "contentOffset");
  v9 = v8;
  objc_msgSend(v14, "frame");
  v11 = v10;
  -[WFCompactPlatterViewController minimumPlatterSize](self, "minimumPlatterSize");
  if (v12 < v7 - v9)
    v12 = v7 - v9;
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  objc_msgSend(v3, "setFrame:", *MEMORY[0x24BDBF090], v9, v5, v13);
  objc_msgSend(v3, "setContentVerticalOffsetWhenClipped:", -v9);

}

- (void)updateScrollViewSeparators
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClippingContent");

  if (!v4)
  {
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsTopScrollingSeparator:", 0);

    -[WFCompactPlatterViewController platterView](self, "platterView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
LABEL_6:
    v21 = 0;
    goto LABEL_7;
  }
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6 > 0.0;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsTopScrollingSeparator:", v7);

  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOffset");
  v11 = v10;
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSize");
  v17 = v16;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionGroupView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    return;
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v20;
  if (round((v11 + v14) * 100.0) / 100.0 >= round(v17 * 100.0) / 100.0)
    goto LABEL_6;
  v21 = 1;
LABEL_7:
  objc_msgSend(v20, "setShowsBottomScrollingSeparator:", v21);

}

- (void)scrollViewDidScroll:(id)a3
{
  -[WFCompactPlatterViewController updateScrollViewSeparators](self, "updateScrollViewSeparators", a3);
  -[WFCompactPlatterViewController updatePlatterPosition](self, "updatePlatterPosition");
}

- (double)platterHeightForWidth:(double)a3 withMaximumHeight:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", a3, a4);
  v9 = v8;

  -[WFCompactPlatterViewController contentHeightForWidth:withMaximumVisibleHeight:](self, "contentHeightForWidth:withMaximumVisibleHeight:", a3, fmax(a4 - v9, 0.0));
  return v9 + v10;
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[WFCompactPlatterViewController platterView](self, "platterView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x24BEBE588] + 8), v7, v8);
  v10 = v9;

  return v10;
}

- (double)maximumExpectedVisibleContentHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[WFCompactPlatterViewController platterContentContainer](self, "platterContentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumExpectedHeightForPlatterPresentation:", self);
  v5 = v4;
  -[WFCompactPlatterViewController minimumPlatterSize](self, "minimumPlatterSize");
  v7 = v5 - v6;

  return v7;
}

- (void)invalidatePlatterSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[WFCompactPlatterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[WFCompactPlatterViewController platterContentContainer](self, "platterContentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platterPresentationDidInvalidateSize:", self);

  -[WFCompactPlatterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (v11 == v5 && v13 == v7)
    -[WFCompactPlatterViewController updateContentSizeAndPlatterPosition](self, "updateContentSizeAndPlatterPosition");
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFCompactPlatterViewController;
  -[WFCompactPlatterViewController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v4, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, a3);
  -[WFCompactPlatterViewController invalidatePlatterSize](self, "invalidatePlatterSize");
}

- (void)setContentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_contentViewController, a3);
  if (v8)
  {
    -[WFCompactPlatterViewController addChildViewController:](self, "addChildViewController:", v8);
    objc_msgSend(v8, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentView:", v5);

    objc_msgSend(v8, "didMoveToParentViewController:", self);
  }
  else
  {
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentView:", 0);

  }
}

- (NSString)requestIdentifier
{
  void *v2;
  void *v3;

  -[WFCompactPlatterViewController associatedRunningContext](self, "associatedRunningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)requesterIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BEC1768];
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (UIEdgeInsets)bannerContentOutsets
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setAppearanceProvider:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  v5 = a3;
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppearanceProvider:", v5);

}

- (BOOL)shouldHideSashView
{
  return 0;
}

- (WFCompactPlatterContentContainer)platterContentContainer
{
  return (WFCompactPlatterContentContainer *)objc_loadWeakRetained((id *)&self->_platterContentContainer);
}

- (void)setPlatterContentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_platterContentContainer, a3);
}

- (BOOL)platterHeightAnimationsDisabled
{
  return self->_platterHeightAnimationsDisabled;
}

- (void)setPlatterHeightAnimationsDisabled:(BOOL)a3
{
  self->_platterHeightAnimationsDisabled = a3;
}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)objc_loadWeakRetained((id *)&self->_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  objc_storeWeak((id *)&self->_presentableContext, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (void)setAssociatedRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRunningContext, a3);
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (WFCompactPlatterTransitioningDelegate)wf_transitioningDelegate
{
  return self->_wf_transitioningDelegate;
}

- (void)setWf_transitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_wf_transitioningDelegate, a3);
}

- (CGSize)minimumPlatterSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumPlatterSize.width;
  height = self->_minimumPlatterSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumPlatterSize:(CGSize)a3
{
  self->_minimumPlatterSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wf_transitioningDelegate, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_destroyWeak((id *)&self->_platterContentContainer);
  objc_destroyWeak((id *)&self->_platterView);
}

@end
