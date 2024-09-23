@implementation SBHAddWidgetDetailsSheetPageViewController

- (SBHAddWidgetDetailsSheetPageViewController)initWithWidgetWrapperViewController:(id)a3
{
  id v5;
  SBHAddWidgetDetailsSheetPageViewController *v6;
  SBHAddWidgetDetailsSheetPageViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  v6 = -[SBHAddWidgetDetailsSheetPageViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widgetWrapperViewController, a3);
    objc_msgSend(v5, "setDelegate:", v7);
  }

  return v7;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  -[SBHAddWidgetDetailsSheetPageViewController loadView](&v3, sel_loadView);
  -[SBHAddWidgetDetailsSheetPageViewController _createViews](self, "_createViews");
  -[SBHAddWidgetDetailsSheetPageViewController _createConstraints](self, "_createConstraints");
}

- (void)_createViews
{
  void *v3;
  SBHWidgetWrapperViewController *widgetWrapperViewController;
  id v5;
  _QWORD v6[5];
  id v7;

  -[SBHAddWidgetDetailsSheetPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  widgetWrapperViewController = self->_widgetWrapperViewController;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SBHAddWidgetDetailsSheetPageViewController__createViews__block_invoke;
  v6[3] = &unk_1E8D8E6E0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[SBHAddWidgetDetailsSheetPageViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", widgetWrapperViewController, 0, v6);

}

void __58__SBHAddWidgetDetailsSheetPageViewController__createViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  v4 = a2;
  objc_msgSend(v3, "setForcesEdgeAntialiasing:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "wrapperView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHoverAnimationEnabled:", !UIAccessibilityIsReduceMotionEnabled());
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_createSizeConstraintsForWrapperView:", v5);
  v4[2](v4);

}

- (void)_createConstraints
{
  void *v3;
  void *v4;
  UILayoutGuide *v5;
  UILayoutGuide *layoutGuide;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetDetailsSheetPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperViewController view](self->_widgetWrapperViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v5;

  objc_msgSend(v3, "addLayoutGuide:", self->_layoutGuide);
  v20 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v18;
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v8;
  v17 = v4;
  objc_msgSend(v4, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v11;
  objc_msgSend(v4, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_layoutGuide, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  -[SBHAddWidgetDetailsSheetPageViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBHAddWidgetDetailsSheetPageViewController _updateWidgetScale](self, "_updateWidgetScale");
  -[SBHAddWidgetDetailsSheetPageViewController updateParallaxEffectInReferenceView:](self, "updateParallaxEffectInReferenceView:", self->_referenceView);
}

- (void)setJumpAnimationInProgress:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBHWidgetWrapperViewController view](self->_widgetWrapperViewController, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[SBHAddWidgetDetailsSheetPageViewController _pauseLayer:](self, "_pauseLayer:", v5);
  else
    -[SBHAddWidgetDetailsSheetPageViewController _resumeLayer:](self, "_resumeLayer:", v5);
  objc_msgSend(v6, "setHidden:", v3);

}

- (BOOL)isJumpAnimationInProgress
{
  void *v2;
  void *v3;
  char v4;

  -[SBHAddWidgetDetailsSheetPageViewController widgetWrapperViewController](self, "widgetWrapperViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (void)updateParallaxEffectInReferenceView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double scale;
  double width;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;

  v5 = a3;
  objc_storeStrong((id *)&self->_referenceView, a3);
  if (self->_referenceView)
  {
    -[SBHAddWidgetDetailsSheetPageViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetWrapperViewController view](self->_widgetWrapperViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "convertRect:fromView:", v6);
    v10 = (v8 + v9 + v8 + v9) / (v9 + v9) + -1.0;
    v11 = -[SBHAddWidgetDetailsSheetPageViewController addWidgetSheetStyle](self, "addWidgetSheetStyle");
    scale = self->_scale;
    if (v11 == 1)
      scale = fmin(fmax(scale * (1.0 - fabs(v10)), 0.00000001), 1.0);
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, scale, scale);
    objc_msgSend(v7, "bounds");
    v21 = v22;
    v24 = CGRectApplyAffineTransform(v23, &v21);
    width = v24.size.width;
    objc_msgSend(v7, "center", v24.origin.x, v24.origin.y);
    v15 = v14 + width * -0.5;
    -[SBHAddWidgetDetailsSheetPageViewController _widgetPadding](self, "_widgetPadding");
    v17 = width - v16;
    if (v11 != 1)
      v17 = 10.0;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, -1.0 / scale * (v15 + v17) * v10, 0.0);
    t1 = v21;
    memset(&v20, 0, sizeof(v20));
    v18 = v22;
    CGAffineTransformConcat(&v20, &t1, &v18);
    t1 = v20;
    objc_msgSend(v7, "setTransform:", &t1);

  }
}

- (CGAffineTransform)wrapperViewTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[SBHWidgetWrapperViewController view](self->_widgetWrapperViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "transform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[SBHAddWidgetDetailsSheetPageViewController updateParallaxEffectInReferenceView:](self, "updateParallaxEffectInReferenceView:", self->_referenceView);
  }
}

- (CGSize)_widgetPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (-[SBHAddWidgetDetailsSheetPageViewController addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    -[SBHAddWidgetDetailsSheetPageViewController addWidgetSheetMetrics](self, "addWidgetSheetMetrics");
    v3 = v5;
    v4 = v6;
  }
  else
  {
    v4 = 30.0;
    v3 = 45.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateWidgetScale
{
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
  double v15;
  id v16;

  if (-[SBHWidgetWrapperViewController selectedSizeClass](self->_widgetWrapperViewController, "selectedSizeClass") <= 1)
    v3 = 1.0;
  else
    v3 = 0.9;
  -[SBHWidgetWrapperViewController view](self->_widgetWrapperViewController, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailsSheetPageViewController _widgetPadding](self, "_widgetPadding");
  v5 = v4;
  v7 = v6;
  -[UILayoutGuide layoutFrame](self->_layoutGuide, "layoutFrame");
  v9 = v8 + v7 * -2.0;
  objc_msgSend(v16, "bounds");
  v11 = v9 / v10;
  -[UILayoutGuide layoutFrame](self->_layoutGuide, "layoutFrame");
  v13 = v12 + v5 * -2.0;
  objc_msgSend(v16, "bounds");
  v15 = v13 / v14;
  if (v11 < v13 / v14)
    v15 = v11;
  if (v15 >= v3)
    v15 = v3;
  -[SBHAddWidgetDetailsSheetPageViewController setScale:](self, "setScale:", v15);

}

- (void)_createSizeConstraintsForWrapperView:(id)a3
{
  SBHWidgetWrapperViewController *widgetWrapperViewController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  widgetWrapperViewController = self->_widgetWrapperViewController;
  v5 = a3;
  -[SBHWidgetWrapperViewController listLayoutProvider](widgetWrapperViewController, "listLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBHIconGridSizeClassForCHSWidgetFamily(-[SBHWidgetWrapperViewController selectedSizeClass](self->_widgetWrapperViewController, "selectedSizeClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, v8);
  v11 = v10;
  v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, CFSTR("SBHIconGridSizeClassLarge"));
  v14 = v13;
  objc_msgSend(v5, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1132068864;
  objc_msgSend(v16, "setPriority:", v17);
  objc_msgSend(v5, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1132068864;
  objc_msgSend(v19, "setPriority:", v20);
  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToConstant:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  objc_msgSend(v5, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "constraintGreaterThanOrEqualToConstant:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  v27[2] = v16;
  v27[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v26);

}

- (void)_pauseLayer:(id)a3
{
  double v3;
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;
  LODWORD(v3) = 0;
  objc_msgSend(v5, "setSpeed:", v3);
  objc_msgSend(v5, "setTimeOffset:", v4);

}

- (void)_resumeLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeOffset");
  v4 = v3;
  LODWORD(v3) = 1.0;
  objc_msgSend(v6, "setSpeed:", v3);
  objc_msgSend(v6, "setTimeOffset:", 0.0);
  objc_msgSend(v6, "setBeginTime:", 0.0);
  objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v6, "setBeginTime:", v5 - v4);

}

- (SBHWidgetDragHandling)widgetDragHandler
{
  void *v2;
  void *v3;

  -[SBHAddWidgetDetailsSheetPageViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetDragHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBHAddWidgetDetailsSheetPageViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundViewMatchingMaterialBeneathPageViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathWrapperViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBHAddWidgetDetailsSheetPageViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureBackgroundView:matchingMaterialBeneathPageViewController:", v5, self);

}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (SBHAddWidgetDetailsSheetPageViewControllerDelegate)delegate
{
  return (SBHAddWidgetDetailsSheetPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics
{
  CGSize v3;
  __int128 v4;
  __int128 v5;

  v3 = *(CGSize *)&self[9].sidebarWidth;
  *(_OWORD *)&retstr->scaledWidgetSize.height = *(_OWORD *)&self[9].sheetMargin;
  retstr->detailWidgetPadding = v3;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *(_OWORD *)&self[9].trailingPadding;
  retstr->detailPageControlTopSpacing = self[9].widgetScaleFactor;
  v4 = *(_OWORD *)&self[8].widgetColumns;
  *(CGSize *)&retstr->sheetMargin = self[8].scaledWidgetSize;
  *(_OWORD *)&retstr->sidebarWidth = v4;
  v5 = *(_OWORD *)&self[8].detailAddButtonBottomSpacing;
  *(_OWORD *)&retstr->trailingPadding = *(_OWORD *)&self[8].detailWidgetPadding.height;
  *(_OWORD *)&retstr->widgetScaleFactor = v5;
  return self;
}

- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGSize detailWidgetPadding;
  __int128 v8;

  v3 = *(_OWORD *)&a3->widgetScaleFactor;
  v5 = *(_OWORD *)&a3->sheetMargin;
  v4 = *(_OWORD *)&a3->sidebarWidth;
  *(_OWORD *)&self->_addWidgetSheetMetrics.trailingPadding = *(_OWORD *)&a3->trailingPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.widgetScaleFactor = v3;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sheetMargin = v5;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sidebarWidth = v4;
  detailWidgetPadding = a3->detailWidgetPadding;
  v6 = *(_OWORD *)&a3->detailAddButtonTopSpacing;
  v8 = *(_OWORD *)&a3->scaledWidgetSize.height;
  self->_addWidgetSheetMetrics.detailPageControlTopSpacing = a3->detailPageControlTopSpacing;
  self->_addWidgetSheetMetrics.detailWidgetPadding = detailWidgetPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.detailAddButtonTopSpacing = v6;
  *(_OWORD *)&self->_addWidgetSheetMetrics.scaledWidgetSize.height = v8;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (double)scale
{
  return self->_scale;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
}

@end
