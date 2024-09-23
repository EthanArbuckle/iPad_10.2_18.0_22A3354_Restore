@implementation SBHRecentsDocumentExtensionWrappingViewController

- (SBHRecentsDocumentExtensionWrappingViewController)init
{
  SBHRecentsDocumentExtensionWrappingViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *constraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  v2 = -[SBHRecentsDocumentExtensionWrappingViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

  }
  return v2;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_touchCancellationAssertionsToTokens;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_touchCancellationAssertionsToTokens, "removeAllObjects");
  v8.receiver = self;
  v8.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  -[SBHRecentsDocumentExtensionWrappingViewController dealloc](&v8, sel_dealloc);
}

- (void)loadView
{
  void *v2;
  int v4;
  char v5;
  uint64_t v6;
  double v10;
  double v11;
  float v12;
  _SBHRecentsDocumentView *v13;

  if (-[SBHRecentsDocumentExtensionWrappingViewController usesIntrinsicContentSizeBasedOnScreenSize](self, "usesIntrinsicContentSizeBasedOnScreenSize"))
  {
    v4 = __sb__runningInSpringBoard();
    v5 = v4;
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    v12 = CGRectGetWidth(*(CGRect *)&v6) * 0.46;
    v10 = floorf(v12);
    v11 = 220.5;
    if ((v5 & 1) == 0)

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = -[_SBHRecentsDocumentView initWithFrame:]([_SBHRecentsDocumentView alloc], "initWithFrame:", 0.0, 0.0, v10, v11);
  -[_SBHRecentsDocumentView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[SBHRecentsDocumentExtensionWrappingViewController setView:](self, "setView:", v13);
  -[SBHRecentsDocumentExtensionWrappingViewController _updateViewIntrinsicContentSize:](self, "_updateViewIntrinsicContentSize:", v10, v11);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  v4 = a3;
  -[SBHRecentsDocumentExtensionWrappingViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[SBHRecentsDocumentExtensionWrappingViewController _updateViewIntrinsicContentSize:](self, "_updateViewIntrinsicContentSize:", v6, v8);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  -[SBHRecentsDocumentExtensionWrappingViewController setPreferredContentSize:](&v12, sel_setPreferredContentSize_);
  -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v8, v10, width, height);

}

- (void)_updateViewIntrinsicContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIntrinsicContentSize:", width, height);
  -[SBHRecentsDocumentExtensionWrappingViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateConstraints");

}

- (void)wrapRemoteViewController:(id)a3
{
  _UIRemoteViewController *v5;
  _UIRemoteViewController **p_wrappedRemoteViewController;
  _UIRemoteViewController *wrappedRemoteViewController;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *constraints;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  _UIRemoteViewController *v37;

  v5 = (_UIRemoteViewController *)a3;
  p_wrappedRemoteViewController = &self->_wrappedRemoteViewController;
  wrappedRemoteViewController = self->_wrappedRemoteViewController;
  v37 = v5;
  if (wrappedRemoteViewController != v5)
  {
    -[_UIRemoteViewController willMoveToParentViewController:](wrappedRemoteViewController, "willMoveToParentViewController:", 0);
    -[_UIRemoteViewController view](*p_wrappedRemoteViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[_UIRemoteViewController removeFromParentViewController](*p_wrappedRemoteViewController, "removeFromParentViewController");
  }
  objc_storeStrong((id *)&self->_wrappedRemoteViewController, a3);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[_UIRemoteViewController view](v37, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Icon Pop Over"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    -[_UIRemoteViewController bs_endAppearanceTransition:](v37, "bs_endAppearanceTransition:", 1);
    -[SBHRecentsDocumentExtensionWrappingViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHRecentsDocumentExtensionWrappingViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v37, v12);

    constraints = self->_constraints;
    objc_msgSend(v9, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](constraints, "addObject:", v16);

    v17 = self->_constraints;
    objc_msgSend(v9, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v17, "addObject:", v20);

    v21 = self->_constraints;
    objc_msgSend(v9, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v24);

    v25 = self->_constraints;
    objc_msgSend(v9, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v28);

    v29 = self->_constraints;
    objc_msgSend(v9, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v31, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v29, "addObject:", v32);

    v33 = self->_constraints;
    objc_msgSend(v9, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v35, 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v33, "addObject:", v36);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);

}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  _UIRemoteViewController *wrappedRemoteViewController;
  uint64_t v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *touchCancellationAssertionsToTokens;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  wrappedRemoteViewController = self->_wrappedRemoteViewController;
  if (!wrappedRemoteViewController)
    return 0;
  -[_UIRemoteViewController _cancelTouchesForCurrentEventInHostedContent](wrappedRemoteViewController, "_cancelTouchesForCurrentEventInHostedContent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = (void *)v4;
  if (!self->_touchCancellationAssertionsToTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    touchCancellationAssertionsToTokens = self->_touchCancellationAssertionsToTokens;
    self->_touchCancellationAssertionsToTokens = v6;

  }
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D01868]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __96__SBHRecentsDocumentExtensionWrappingViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
  v14 = &unk_1E8D85A30;
  objc_copyWeak(&v15, &location);
  v9 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("recentsDocumentExtension.cancelTouchesAssertion"), CFSTR("cancelTouches"), &v11);
  -[NSMapTable setObject:forKey:](self->_touchCancellationAssertionsToTokens, "setObject:forKey:", v5, v9, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __96__SBHRecentsDocumentExtensionWrappingViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[122], "removeObjectForKey:", v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isTransparent
{
  SBHRecentsDocumentExtensionWrappingViewController *v2;
  void *v3;

  v2 = self;
  -[SBHRecentsDocumentExtensionWrappingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "recentsDocumentExtensionWrappingViewControllerHasTransparentContent:", v2);

  return (char)v2;
}

- (_UIRemoteViewController)wrappedRemoteViewController
{
  return self->_wrappedRemoteViewController;
}

- (SBHRecentsDocumentExtensionWrappingViewControllerDelegate)delegate
{
  return (SBHRecentsDocumentExtensionWrappingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize
{
  return self->_usesIntrinsicContentSizeBasedOnScreenSize;
}

- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3
{
  self->_usesIntrinsicContentSizeBasedOnScreenSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wrappedRemoteViewController, 0);
  objc_storeStrong((id *)&self->_touchCancellationAssertionsToTokens, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
