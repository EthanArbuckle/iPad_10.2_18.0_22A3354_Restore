@implementation SBHIconViewContextMenuWrapperViewController

- (void)viewDidLoad
{
  MTMaterialView *v3;
  MTMaterialView *backgroundView;
  MTMaterialView *v5;
  void *v6;
  MTMaterialView *v7;
  void *v8;
  MTMaterialView *v9;
  void *v10;
  MTMaterialView *v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  -[SBHIconViewContextMenuWrapperViewController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
  v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = self->_backgroundView;
  -[SBHIconViewContextMenuWrapperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[MTMaterialView setFrame:](v5, "setFrame:");

  v7 = self->_backgroundView;
  -[SBHIconViewContextMenuWrapperViewController groupNameBase](self, "groupNameBase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView setGroupNameBase:](v7, "setGroupNameBase:", v8);

  v9 = self->_backgroundView;
  -[SBHIconViewContextMenuWrapperViewController backgroundScale](self, "backgroundScale");
  -[MTMaterialView setContentScaleFactor:](v9, "setContentScaleFactor:");
  -[MTMaterialView _setLayoutDebuggingIdentifier:](self->_backgroundView, "_setLayoutDebuggingIdentifier:", CFSTR("backgroundView"));
  -[MTMaterialView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
  -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHIconViewContextMenuWrapperViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_backgroundView);

  v11 = self->_backgroundView;
  -[SBHIconViewContextMenuWrapperViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SBHPinViewWithinView(v11, v12);

  -[SBHIconViewContextMenuWrapperViewController _applyContinuousCornerRadius](self, "_applyContinuousCornerRadius");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  -[SBHIconViewContextMenuWrapperViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  -[SBHIconViewContextMenuWrapperViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  NSArray *layoutConstraints;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_layoutConstraints);
    layoutConstraints = self->_layoutConstraints;
    self->_layoutConstraints = 0;

    -[SBHIconViewContextMenuWrapperViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v12, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHIconViewContextMenuWrapperViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", *p_contentViewController);
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v12)
    {
      -[UIViewController preferredContentSize](v12, "preferredContentSize");
      -[SBHIconViewContextMenuWrapperViewController _applyPreferredContentSizeChange:](self, "_applyPreferredContentSizeChange:");
      -[SBHIconViewContextMenuWrapperViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", *p_contentViewController, v8);
      objc_msgSend(v8, "bringSubviewToFront:", v9);
      SBHPinViewWithinView(v9, v8);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_layoutConstraints;
      self->_layoutConstraints = v10;

    }
    -[SBHIconViewContextMenuWrapperViewController _applyContinuousCornerRadius](self, "_applyContinuousCornerRadius");

    v5 = v12;
  }

}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
  if (-[SBHIconViewContextMenuWrapperViewController isViewLoaded](self, "isViewLoaded"))
    -[SBHIconViewContextMenuWrapperViewController _applyContinuousCornerRadius](self, "_applyContinuousCornerRadius");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBHIconViewContextMenuWrapperViewController *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  -[SBHIconViewContextMenuWrapperViewController preferredContentSizeDidChangeForChildContentContainer:](&v13, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __101__SBHIconViewContextMenuWrapperViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v10 = &unk_1E8D84EF0;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if (-[SBHIconViewContextMenuWrapperViewController isViewLoaded](self, "isViewLoaded", v7, v8, v9, v10, v11))objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v6, 0, 1.0, 0.34024, 0.0, 0.0, 0.0,
      0.0,
      0.0,
      0.0);
  else
    v6[2](v6);

}

uint64_t __101__SBHIconViewContextMenuWrapperViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "preferredContentSize");
  return objc_msgSend(v1, "_applyPreferredContentSizeChange:");
}

- (void)recentsDocumentExtensionViewControllerRequestsDismiss:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_applyPreferredContentSizeChange:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  height = a3.height;
  width = a3.width;
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == a3.width && v6 == height)
  {
    -[UIViewController view](self->_contentViewController, "view", *MEMORY[0x1E0C9D820], v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemLayoutSizeFittingSize:", 398.0, 0.0);
    width = v9;
    height = v10;

  }
  -[SBHIconViewContextMenuWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  -[UIViewController view](self->_contentViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  -[UIViewController view](self->_contentViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v13, v15, width, height);

  -[MTMaterialView frame](self->_backgroundView, "frame");
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:");
  -[SBHIconViewContextMenuWrapperViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v17, "setFrame:");
  objc_msgSend(v17, "setNeedsLayout");
  objc_msgSend(v17, "layoutIfNeeded");

}

- (void)_applyContinuousCornerRadius
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SBHIconViewContextMenuWrapperViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBHIconViewContextMenuWrapperViewController continuousCornerRadius](self, "continuousCornerRadius");
    v4 = v3;
    v5 = (void *)objc_opt_new();
    -[SBHIconViewContextMenuWrapperViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeAddObject:", v6);

    -[SBHIconViewContextMenuWrapperViewController contentViewController](self, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeAddObject:", v8);

    objc_msgSend(v5, "bs_safeAddObject:", self->_backgroundView);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_setContinuousCornerRadius:", v4, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (NSString)groupNameBase
{
  return self->_groupNameBase;
}

- (void)setGroupNameBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (double)backgroundScale
{
  return self->_backgroundScale;
}

- (void)setBackgroundScale:(double)a3
{
  self->_backgroundScale = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
