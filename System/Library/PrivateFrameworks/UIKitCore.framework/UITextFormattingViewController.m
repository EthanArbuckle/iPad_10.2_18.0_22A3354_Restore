@implementation UITextFormattingViewController

- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 start:(BOOL)a4
{
  UITextFormattingViewController *v6;

  v6 = self;
  sub_18566D4A8(a3, a4, 0, 0);

}

- (void)_modifyKeyboardTrackingIfNeededForKeyboardSuppression
{
  UITextFormattingViewController *v2;

  v2 = self;
  sub_18566D824();

}

- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 start:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  UITextFormattingViewController *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v16 = self;
  sub_18566D9A0(a3, a6, v14, v13, v12, v11, x, y, width, height);

}

- (void)_setupForEditResponder
{
  UITextFormattingViewController *v2;

  v2 = self;
  sub_18566DC78();

}

- (void)_cleanupForEditResponder
{
  void *v3;
  UITextFormattingViewController *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

}

- (void)_resumeKeyboardSuppressionIfNeeded
{
  UITextFormattingViewController *v2;

  v2 = self;
  sub_18566DF98();

}

- (BOOL)_adjustAttributesInTextStorage:(id)a3 atRange:(_NSRange)a4 forChangeValue:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  UITextFormattingViewController *v11;
  char v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_1856B26E0(v9, location, length, v10);
  LOBYTE(length) = v12;

  return length & 1;
}

- (UITextFormattingViewController)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewController *v5;
  UITextFormattingViewControllerConfiguration *v6;
  UITextFormattingViewControllerConfiguration *v7;

  v4 = a3;
  v5 = -[UITextFormattingViewController init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextFormattingViewControllerConfiguration"));
    v6 = (UITextFormattingViewControllerConfiguration *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = objc_alloc_init(UITextFormattingViewControllerConfiguration);
    objc_storeStrong((id *)&v5->_configuration, v7);
    if (!v6)

  }
  return v5;
}

- (UITextFormattingViewController)initWithConfiguration:(id)a3
{
  id v4;
  UITextFormattingViewController *v5;
  uint64_t v6;
  UITextFormattingViewControllerConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextFormattingViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (UITextFormattingViewControllerConfiguration *)v6;

    -[UITextFormattingViewController _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (UITextFormattingViewController)init
{
  UITextFormattingViewController *v2;
  UITextFormattingViewControllerConfiguration *v3;
  UITextFormattingViewControllerConfiguration *configuration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextFormattingViewController;
  v2 = -[UIViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v3 = objc_alloc_init(UITextFormattingViewControllerConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    -[UITextFormattingViewController _commonInit](v2, "_commonInit");
  }
  return v2;
}

- (void)_commonInit
{
  UIView *v3;
  UIView *containerView;
  UIView *v5;
  UIView *contentView;
  UIStackView *v7;
  UIStackView *contentStackView;
  void *v9;
  objc_class *v10;
  _TFTextFormattingContentViewController *v11;
  _TFTextFormattingContentViewController *contentViewController;
  _TFTextFormattingContentViewController *v13;
  unint64_t v14;
  NSObject *v15;
  _UITextFormattingSceneHostingImpl *v16;
  _UITextFormattingViewHostingImpl *hostingImpl;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_opt_new();
  containerView = self->_containerView;
  self->_containerView = v3;

  v5 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v5;

  v7 = (UIStackView *)objc_opt_new();
  contentStackView = self->_contentStackView;
  self->_contentStackView = v7;

  -[UIStackView setAxis:](self->_contentStackView, "setAxis:", 1);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v9 = (void *)qword_1ECD7A828;
  v28 = qword_1ECD7A828;
  if (!qword_1ECD7A828)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __get_TFTextFormattingContentViewControllerClass_block_invoke;
    v24[3] = &unk_1E16B14C0;
    v24[4] = &v25;
    __get_TFTextFormattingContentViewControllerClass_block_invoke((uint64_t)v24);
    v9 = (void *)v26[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v25, 8);
  v11 = (_TFTextFormattingContentViewController *)objc_alloc_init(v10);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v11;

  v13 = self->_contentViewController;
  if (v13)
  {
    -[_TFTextFormattingContentViewController loadView](v13, "loadView");
  }
  else
  {
    v14 = _MergedGlobals_3_29;
    if (!_MergedGlobals_3_29)
    {
      v14 = __UILogCategoryGetNode("TextFormattingUI", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_MergedGlobals_3_29);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "TextFormattingUI was not loaded!", (uint8_t *)v24, 2u);
    }
  }
  v16 = objc_alloc_init(_UITextFormattingSceneHostingImpl);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = (_UITextFormattingViewHostingImpl *)v16;

  -[_UITextFormattingViewHostingImpl setDelegateTextFormattingViewController:](self->_hostingImpl, "setDelegateTextFormattingViewController:", self);
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", 375.0, 196.0);
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[UIViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v19, self, sel__updateInternalConfigurationProperties);

  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v22, self, sel__onUserInterfaceStyleChange);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextFormattingViewController configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UITextFormattingViewControllerConfiguration"));

}

- (void)dealloc
{
  objc_super v3;

  -[UITextFormattingViewController _cleanupForEditResponder](self, "_cleanupForEditResponder");
  v3.receiver = self;
  v3.super_class = (Class)UITextFormattingViewController;
  -[UIViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UITextFormattingViewController _textViewFormattingWillBegin](self, "_textViewFormattingWillBegin");
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[UITextFormattingViewController _updateNavBarVisibility](self, "_updateNavBarVisibility");
  -[UITextFormattingViewController _updateInternalConfigurationProperties](self, "_updateInternalConfigurationProperties");
  -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
  -[UITextFormattingViewController _updateContentSizeForAppearance:](self, "_updateContentSizeForAppearance:", 1);
  -[UITextFormattingViewController _updateDisabledComponents](self, "_updateDisabledComponents");
  -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 2, 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 2, 0);
  -[UITextFormattingViewController _textViewFormattingDidBegin](self, "_textViewFormattingDidBegin");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
    -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 3, 1);
  -[UITextFormattingViewController _textViewFormattingWillEnd](self, "_textViewFormattingWillEnd");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
    -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 3, 0);
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)&self->_internalDelegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_internalDelegate);
        objc_msgSend(v8, "_textFormattingDidDisappear:", self);

      }
    }
  }
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed")
    && !self->_shouldSkipStoppingKeyboardSuppressionOnDidDisappear)
  {
    -[UITextFormattingViewController _stopSuppressingKeyboardForTextFormatting](self, "_stopSuppressingKeyboardForTextFormatting");
  }
  -[UITextFormattingViewController _textViewFormattingDidEnd](self, "_textViewFormattingDidEnd");
}

- (void)loadView
{
  void *v3;
  UIView *v4;
  UIView *containerView;
  UIView *v6;
  UIView *v7;
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
  _TFTextFormattingContentViewController *contentViewController;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[UIViewController setView:](self, "setView:", v3);

  if (-[UITextFormattingViewControllerConfiguration _allowContentToScroll](self->_configuration, "_allowContentToScroll"))
  {
    v4 = (UIView *)objc_opt_new();
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[UIView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[UIView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[UIView setDirectionalLockEnabled:](v4, "setDirectionalLockEnabled:", 1);
    -[UIView addSubview:](v4, "addSubview:", self->_contentView);
    containerView = self->_containerView;
    self->_containerView = v4;

  }
  else
  {
    v6 = (UIView *)objc_opt_new();
    v7 = self->_containerView;
    self->_containerView = v6;

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_contentView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_containerView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v38;
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v8;
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v11;
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v15);

  }
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_contentStackView);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_contentStackView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  -[UIView leadingAnchor](self->_contentStackView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v29;
  -[UIView trailingAnchor](self->_contentStackView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v18;
  -[UIView bottomAnchor](self->_contentStackView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v23);

  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    -[_TFTextFormattingContentViewController view](contentViewController, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeFromSuperview");

    -[_TFTextFormattingContentViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
    -[_TFTextFormattingContentViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", self);
    -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
    -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", v26);
    -[_TFTextFormattingContentViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);

  }
  -[UIViewController parentViewController](self, "parentViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextFormattingViewController _reconfigureViewHierarchyForParentController:](self, "_reconfigureViewHierarchyForParentController:", v27);

}

- (void)viewWillLayoutSubviews
{
  _BOOL4 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[UITextFormattingViewController _updateScrollViewContentSizeIfNeeded](self, "_updateScrollViewContentSizeIfNeeded");
  v3 = -[UITextFormattingViewController _useLandscapeLayout](self, "_useLandscapeLayout");
  if (v3 != -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self->_configuration, "_useLandscapeLayout"))
  {
    -[UITextFormattingViewController _updateInternalConfigurationProperties](self, "_updateInternalConfigurationProperties");
    -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextFormattingViewController;
  v4 = a3;
  -[UIViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);
  -[UITextFormattingViewController _reconfigureViewHierarchyForParentController:](self, "_reconfigureViewHierarchyForParentController:", v4, v5.receiver, v5.super_class);

  -[UITextFormattingViewControllerConfiguration _setHasParentViewController:](self->_configuration, "_setHasParentViewController:", v4 != 0);
  -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextFormattingViewController;
  v4 = a3;
  -[UIViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, v4);
  -[UITextFormattingViewController _reconfigureViewHierarchyForParentController:](self, "_reconfigureViewHierarchyForParentController:", v4, v5.receiver, v5.super_class);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[UITextFormattingViewController _updateContentSizeForAppearance:](self, "_updateContentSizeForAppearance:", 0);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v6;
    objc_msgSend(v5, "setPrefersEdgeAttachedInCompactHeight:", 1);
    objc_msgSend(v5, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
    -[UITextFormattingViewController _resetDetentsForSheetController:invalidate:](self, "_resetDetentsForSheetController:invalidate:", v5, 0);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  objc_super v37;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v37, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v35[3] = &unk_1E16B2E68;
    v35[4] = self;
    v36 = v8;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v35, 0);

  }
  -[UITextFormattingViewControllerConfiguration _setUseLandscapeLayout:](self->_configuration, "_setUseLandscapeLayout:", -[UITextFormattingViewController _useLandscapeLayoutForSize:](self, "_useLandscapeLayoutForSize:", width, height));
  -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x4010000000;
  v32[3] = &unk_18685B0AF;
  v33 = 0u;
  v34 = 0u;
  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toView:", v22, v14, v16, v18, v20);
  *(_QWORD *)&v33 = v23;
  *((_QWORD *)&v33 + 1) = v24;
  *(_QWORD *)&v34 = v25;
  *((_QWORD *)&v34 + 1) = v26;

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x4010000000;
  v29[3] = &unk_18685B0AF;
  v30 = 0u;
  v31 = 0u;
  v27[6] = v32;
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v28[3] = &unk_1E16B3F88;
  v28[4] = self;
  v28[5] = v29;
  v28[6] = v32;
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v27[3] = &unk_1E16B3F88;
  v27[4] = self;
  v27[5] = v29;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v28, v27);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v32, 8);

}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetDetentsForSheetController:invalidate:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  double *v20;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:toView:", v13, v5, v7, v9, v11);
  v14 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v14[4] = v15;
  v14[5] = v16;
  v14[6] = v17;
  v14[7] = v18;

  v19 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:fromFrame:toFrame:start:", 1, 1, v19[4], v19[5], v19[6], v19[7], v20[4], v20[5], v20[6], v20[7]);
}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  double *v20;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:toView:", v13, v5, v7, v9, v11);
  v14 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v14[4] = v15;
  v14[5] = v16;
  v14[6] = v17;
  v14[7] = v18;

  v19 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:fromFrame:toFrame:start:", 1, 0, v19[4], v19[5], v19[6], v19[7], v20[4], v20[5], v20[6], v20[7]);
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  if (-[UITextFormattingViewControllerConfiguration _textViewConfiguration](self->_configuration, "_textViewConfiguration"))
  {
    +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", width, height);
    v10 = 656.0;
    if (v7 <= 656.0)
      v10 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UITextFormattingViewController;
    -[UIViewController _formSheetSizeForWindowWithSize:screenSize:](&v11, sel__formSheetSizeForWindowWithSize_screenSize_, v7, v6, width, height);
  }
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setConfiguration:(id)a3
{
  UITextFormattingViewControllerConfiguration *v4;
  UITextFormattingViewControllerConfiguration *configuration;

  v4 = (UITextFormattingViewControllerConfiguration *)objc_msgSend(a3, "copy");
  configuration = self->_configuration;
  self->_configuration = v4;

  -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
}

- (void)_setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_remoteViewController;
  UIViewController *remoteViewController;
  void *v8;
  void *v9;
  UIViewController *v10;

  v5 = (UIViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  if (remoteViewController != v5)
  {
    v10 = v5;
    -[UIViewController view](remoteViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](*p_remoteViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    v5 = v10;
    if (*p_remoteViewController)
    {
      -[UIViewController willMoveToParentViewController:](v10, "willMoveToParentViewController:", self);
      -[UIViewController view](v10, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController addChildViewController:](self, "addChildViewController:", v10);
      -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", v9);
      -[UIViewController didMoveToParentViewController:](v10, "didMoveToParentViewController:", self);
      -[UITextFormattingViewController _computeContentSize](self, "_computeContentSize");
      -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");

      v5 = v10;
    }
  }

}

- (UITextFormattingViewControllerFormattingDescriptor)formattingDescriptor
{
  return (UITextFormattingViewControllerFormattingDescriptor *)(id)-[UITextFormattingViewControllerFormattingDescriptor copy](self->_formattingDescriptor, "copy");
}

- (void)setFormattingDescriptor:(id)a3
{
  id conversionHandler;
  id v5;
  UITextFormattingViewControllerFormattingDescriptor *v6;
  UITextFormattingViewControllerFormattingDescriptor *formattingDescriptor;

  conversionHandler = self->__conversionHandler;
  self->__conversionHandler = 0;
  v5 = a3;

  v6 = (UITextFormattingViewControllerFormattingDescriptor *)objc_msgSend(v5, "copy");
  formattingDescriptor = self->_formattingDescriptor;
  self->_formattingDescriptor = v6;

  -[UITextFormattingViewController _updateFormattingDescriptor:](self, "_updateFormattingDescriptor:", self->_formattingDescriptor);
}

- (void)_setEditResponder:(id)a3
{
  id v4;

  v4 = a3;
  -[UITextFormattingViewController _cleanupForEditResponder](self, "_cleanupForEditResponder");
  objc_storeWeak((id *)&self->__editResponder, v4);

  -[UITextFormattingViewController _setupForEditResponder](self, "_setupForEditResponder");
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id v20;

  v19 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v15, v5, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  -[UITextFormattingViewController _textFormattingDidChangeValue:textAttributes:](self, "_textFormattingDidChangeValue:textAttributes:", v19, v16);

}

- (void)_textFormattingDidFinish
{
  void *v3;
  char v4;
  void *v5;

  -[UITextFormattingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITextFormattingViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textFormattingDidFinish:", self);

  }
  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_textFormattingRequestsFirstResponderRestoration
{
  _UITextFormattingViewControllerInternalDelegate **p_internalDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_internalDelegate = &self->_internalDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      objc_msgSend(v8, "_textFormattingRequestsFirstResponderRestoration:", self);

    }
  }
}

- (void)_textFormattingRequestsFirstResponderResignation
{
  _UITextFormattingViewControllerInternalDelegate **p_internalDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_internalDelegate = &self->_internalDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      objc_msgSend(v8, "_textFormattingRequestsFirstResponderResignation:", self);

    }
  }
}

- (void)_startSuppressingKeyboardForTextFormatting
{
  _UITextFormattingViewControllerInternalDelegate **p_internalDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_internalDelegate = &self->_internalDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      objc_msgSend(v8, "_startSuppressingKeyboardForTextFormatting:", self);

      -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForKeyboardSuppression](self, "_modifyKeyboardTrackingIfNeededForKeyboardSuppression");
    }
  }
}

- (void)_stopSuppressingKeyboardForTextFormatting
{
  _UITextFormattingViewControllerInternalDelegate **p_internalDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_internalDelegate = &self->_internalDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      objc_msgSend(v8, "_stopSuppressingKeyboardForTextFormatting:", self);

    }
  }
}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  double height;
  double width;
  double y;
  double x;
  id v12;
  UIColorPickerViewController *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v27[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = objc_alloc_init(UIColorPickerViewController);
  -[UIColorPickerViewController setSelectedColor:](v13, "setSelectedColor:", v12);
  -[UIColorPickerViewController setSupportsAlpha:](v13, "setSupportsAlpha:", 0);
  -[UIColorPickerViewController _setSupportsEyedropper:](v13, "_setSupportsEyedropper:", 0);
  -[UITextFormattingViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0
    || (-[UITextFormattingViewController delegate](self, "delegate"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "textFormattingViewController:shouldPresentColorPicker:", self, v13),
        v16,
        v17))
  {
    -[UIColorPickerViewController setSelectedColor:](v13, "setSelectedColor:", v12);
    -[UIColorPickerViewController setSupportsAlpha:](v13, "setSupportsAlpha:", 0);
    -[UIColorPickerViewController _setSupportsEyedropper:](v13, "_setSupportsEyedropper:", 0);
    -[UIColorPickerViewController setDelegate:](v13, "setDelegate:", self);
    -[UIViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 7);
    -[UIViewController popoverPresentationController](v13, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceView:", v19);

    -[UIViewController popoverPresentationController](v13, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
    if (v21)
    {
      -[UIViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertRect:toView:", v6, x, y, width, height);
      x = v22;
      y = v23;
      width = v24;
      height = v25;
    }
    objc_msgSend(v20, "setSourceRect:", x, y, width, height);
    if (v21)
    {

    }
    -[UIViewController popoverPresentationController](v13, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPermittedArrowDirections:", 15);

    -[UIColorPickerViewController _setShowsGridOnly:](v13, "_setShowsGridOnly:", 1);
    if (!-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
    {
      -[UITextFormattingViewController _stopSuppressingKeyboardForTextFormatting](self, "_stopSuppressingKeyboardForTextFormatting");
      -[UITextFormattingViewController _textFormattingRequestsFirstResponderResignation](self, "_textFormattingRequestsFirstResponderResignation");
    }
    -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 2, 1);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __68__UITextFormattingViewController__presentColorPicker_selectedColor___block_invoke;
    v27[3] = &unk_1E16B1B28;
    v27[4] = self;
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, v27);
    objc_storeStrong((id *)&self->_colorPicker, v13);
  }

}

uint64_t __68__UITextFormattingViewController__presentColorPicker_selectedColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:start:", 2, 0);
}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  UIFontPickerViewController *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  id WeakRetained;
  void *v20;
  UITextFormattingViewController *v21;
  UITextFormattingViewController *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  _BOOL4 v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  id v50;
  UIFontPickerViewController *v51;
  id v52;
  id v53;
  id location;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v6 = a4;
  -[UITextFormattingViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontPickerConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = v45;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = -[UIFontPickerViewController initWithConfiguration:]([UIFontPickerViewController alloc], "initWithConfiguration:", v11);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke;
  v55[3] = &unk_1E16ED6D8;
  v14 = v13;
  v56 = v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v55);
  -[UIFontPickerViewController _setSelectedFontDescriptors:](v12, "_setSelectedFontDescriptors:", v14);
  -[UITextFormattingViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0
    || (-[UITextFormattingViewController delegate](self, "delegate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "textFormattingViewController:shouldPresentFontPicker:", self, v12),
        v17,
        v18))
  {
    -[UIFontPickerViewController _setSelectedFontDescriptors:](v12, "_setSelectedFontDescriptors:", v14, v45);
    WeakRetained = objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
    if (WeakRetained)
    {
      v20 = WeakRetained;
      v21 = (UITextFormattingViewController *)objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
      if (v21 == self)
      {

      }
      else
      {
        v22 = v21;
        v23 = objc_loadWeakRetained((id *)&self->_internalDelegate);

        if (v23)
        {
          v24 = objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
          -[UITextFormattingViewController _editResponder](self, "_editResponder");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          self->_shouldSkipStoppingKeyboardSuppressionOnDidDisappear = 1;
          v26 = objc_loadWeakRetained((id *)&self->_internalDelegate);
          objc_initWeak(&location, v26);
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_2;
          v48[3] = &unk_1E16ED700;
          v49 = v6;
          v27 = v25;
          v50 = v27;
          v51 = v12;
          v28 = v24;
          v52 = v28;
          objc_copyWeak(&v53, &location);
          -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v48);
          objc_destroyWeak(&v53);

          objc_destroyWeak(&location);
          goto LABEL_16;
        }
      }
    }
    -[UIFontPickerViewController setDelegate:](v12, "setDelegate:", self);
    -[UITextFormattingViewController _stopSuppressingKeyboardForTextFormatting](self, "_stopSuppressingKeyboardForTextFormatting");
    -[UITextFormattingViewController _textFormattingRequestsFirstResponderResignation](self, "_textFormattingRequestsFirstResponderResignation");
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    v30 = v29;
    v31 = -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self->_configuration, "_useLandscapeLayout");
    v32 = 0.0;
    if (v31)
      v32 = 25.0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_4;
    v47[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    *(double *)&v47[4] = v30 + v32;
    +[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("com.apple.UIKit.textFormattingFontPicker"), v47);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v33;
    +[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController sheetPresentationController](v12, "sheetPresentationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDetents:", v35);

    -[UIViewController sheetPresentationController](v12, "sheetPresentationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setLargestUndimmedDetentIdentifier:", 0);

    -[UIViewController sheetPresentationController](v12, "sheetPresentationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPrefersEdgeAttachedInCompactHeight:", 1);

    -[UIViewController sheetPresentationController](v12, "sheetPresentationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 0);

    -[UIViewController sheetPresentationController](v12, "sheetPresentationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPrefersGrabberVisible:", 1);

    -[UIViewController preferredContentSize](self->_remoteViewController, "preferredContentSize");
    -[UIViewController setPreferredContentSize:](v12, "setPreferredContentSize:");
    -[UITextFormattingViewController _modifyKeyboardTrackingIfNeededForType:start:](self, "_modifyKeyboardTrackingIfNeededForType:start:", 2, 1);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_5;
    v46[3] = &unk_1E16B1B28;
    v46[4] = self;
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, v46);
    objc_storeStrong((id *)&self->_fontPicker, v12);
    objc_msgSend(v6, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v6, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "pointSize");
      self->_selectedFontSize = v43;

    }
    else
    {
      objc_msgSend(off_1E167A828, "defaultFontSize");
      self->_selectedFontSize = v44;
    }

  }
LABEL_16:

}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "fontDescriptor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_2(uint64_t a1)
{
  _UITextFormattingDeferredFontPickingDelegate *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc_init(_UITextFormattingDeferredFontPickingDelegate);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pointSize");
    -[_UITextFormattingDeferredFontPickingDelegate setFontSize:](v2, "setFontSize:");

  }
  else
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    -[_UITextFormattingDeferredFontPickingDelegate setFontSize:](v2, "setFontSize:");
  }

  -[_UITextFormattingDeferredFontPickingDelegate setEditResponder:](v2, "setEditResponder:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setDelegate:", v2);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_3;
  v7[3] = &unk_1E16B3F40;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, v7);
  objc_destroyWeak(&v8);

}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_opt_respondsToSelector();
    v2 = v4;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v4, "_stopSuppressingKeyboardForTextFormatting:", 0);
      v2 = v4;
    }
  }

}

double __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

uint64_t __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:start:", 2, 0);
}

- (void)_presentTypographySettingsForFont:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  UINavigationController *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)qword_1ECD7A838;
  v26 = qword_1ECD7A838;
  if (!qword_1ECD7A838)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __get_TFTypographySettingsContentViewControllerClass_block_invoke;
    v22[3] = &unk_1E16B14C0;
    v22[4] = &v23;
    __get_TFTypographySettingsContentViewControllerClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "set_delegate:", self);
  v8 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v7);
  if (-[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self->_configuration, "_hasPopoverPresentation"))
  {
    -[UIViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 1);
  }
  else
  {
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    v10 = v9;
    v11 = -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self->_configuration, "_useLandscapeLayout");
    v12 = 0.0;
    if (v11)
      v12 = 25.0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__UITextFormattingViewController__presentTypographySettingsForFont___block_invoke;
    v21[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    *(double *)&v21[4] = v10 + v12;
    +[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("com.apple.UIKit.textFormattingFontPicker"), v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    +[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController sheetPresentationController](v8, "sheetPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDetents:", v15);

    -[UIViewController sheetPresentationController](v8, "sheetPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLargestUndimmedDetentIdentifier:", CFSTR("com.apple.UIKit.textFormattingFontPicker"));

    -[UIViewController sheetPresentationController](v8, "sheetPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrefersEdgeAttachedInCompactHeight:", 1);

    -[UIViewController sheetPresentationController](v8, "sheetPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 0);

    -[UIViewController sheetPresentationController](v8, "sheetPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPrefersGrabberVisible:", 1);

  }
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_msgSend(v7, "_setSelectedFont:", v4);

}

double __68__UITextFormattingViewController__presentTypographySettingsForFont___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)_setShouldDeferFontPickerPresentationToViewController:(id)a3
{
  objc_storeWeak((id *)&self->_preferredFontPickerPresentationViewController, a3);
  -[UITextFormattingViewController _updateChildControllersConfiguration](self, "_updateChildControllersConfiguration");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_resetDetentsForSheetController:(id)a3 invalidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[2];

  v4 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  objc_msgSend(v6, "detents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") == 0;

  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    objc_msgSend(v6, "detents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke;
    v16[3] = &unk_1E16ED728;
    v16[4] = &v17;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  }
  if (*((_BYTE *)v18 + 24))
  {
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke_2;
    v15[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    v15[4] = v11;
    +[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("com.apple.UIKit.textFormatting"), v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDetents:", v13);

    if (-[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self->_configuration, "_preferringDimmingVisible"))
    {
      v14 = 0;
    }
    else
    {
      v14 = CFSTR("com.apple.UIKit.textFormatting");
    }
    objc_msgSend(v6, "setLargestUndimmedDetentIdentifier:", v14);
    if (v4)
      objc_msgSend(v6, "invalidateDetents");
  }
  _Block_object_dispose(&v17, 8);

}

void __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6 != CFSTR("com.apple.UIKit.textFormatting"))
  {
    v7 = v6;
    objc_msgSend(v9, "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8 != CFSTR("com.apple.UIKit.large"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

double __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (BOOL)_useLandscapeLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v6 = v10;
    v8 = v11;

  }
  return -[UITextFormattingViewController _useLandscapeLayoutForSize:](self, "_useLandscapeLayoutForSize:", v6, v8);
}

- (BOOL)_useLandscapeLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v10;

  height = a3.height;
  width = a3.width;
  if (-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orientation");

  v10 = height < width && v7 == 0;
  return width > 480.0 && v10;
}

- (void)_updateInternalConfigurationProperties
{
  void *v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  void *v9;
  int v10;

  -[UITextFormattingViewControllerConfiguration _setHasPopoverPresentation:](self->_configuration, "_setHasPopoverPresentation:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
  -[UITextFormattingViewControllerConfiguration _setUseLandscapeLayout:](self->_configuration, "_setUseLandscapeLayout:", -[UITextFormattingViewController _useLandscapeLayout](self, "_useLandscapeLayout"));
  -[UITextFormattingViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isTextAnimationsConfiguration");

  if (v4)
  {
    if (-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
    {
      v5 = 0;
    }
    else
    {
      +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", -[UIViewController interfaceOrientation](self, "interfaceOrientation"));
      v5 = v7 <= 320.0;
    }
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_deviceInfoForKey:", CFSTR("main-screen-class"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v6 = v10 == 28 || (v10 & 0xFFFFFFFE) == 6;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  -[UITextFormattingViewControllerConfiguration set_useReducedMetrics:](self->_configuration, "set_useReducedMetrics:", v5 | v6);
}

- (void)_updateChildControllersConfiguration
{
  -[_UITextFormattingViewHostingImpl setRemoteConfiguration:](self->_hostingImpl, "setRemoteConfiguration:", self->_configuration);
  -[_TFTextFormattingContentViewController _setConfiguration:](self->_contentViewController, "_setConfiguration:", self->_configuration);
}

- (void)_sendUpdatesToEditResponder:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[UITextFormattingViewController _textView](self, "_textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && v4)
  {
    objc_msgSend(v4, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      MakeConversionHandler(v12);
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "typingAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTypingAttributes:", v9);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "performSelector:withObject:", sel__textFormattingOptionsNeedUpdate_, 0);

    }
  }
  else if (!v12)
  {
    goto LABEL_10;
  }
  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UITextFormattingViewController _editResponder](self, "_editResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SendUpdatesToEditResponder(v12, v11);

  }
LABEL_10:

}

- (void)_updateNavBarVisibility
{
  void *v3;
  UINavigationBar *navBar;
  UINavigationBar *v5;
  UINavigationBar *v6;
  UINavigationBar *v7;
  void *v8;
  void *v9;
  UINavigationBar *v10;
  void *v11;
  UIBarButtonItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIBarButtonItem *v17;
  void *v18;
  void *v19;
  UINavigationBar *v20;
  void *v21;
  void *v22;
  UIBarButtonItem *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation")
    || (-[UIViewController parentViewController](self, "parentViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    navBar = self->_navBar;
    if (navBar)
      -[UIView removeFromSuperview](navBar, "removeFromSuperview");
  }
  else
  {
    v5 = self->_navBar;
    if (!v5)
    {
      v6 = (UINavigationBar *)objc_opt_new();
      v7 = self->_navBar;
      self->_navBar = v6;

      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "configureWithTransparentBackground");
      -[UINavigationBar setStandardAppearance:](self->_navBar, "setStandardAppearance:", v8);
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setLeftItemsSupplementBackButton:", 0);
      v10 = self->_navBar;
      v27[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar setItems:](v10, "setItems:", v11);

      v12 = -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:primaryAction:", 24, 0);
      -[UIBarButtonItem setAction:](v12, "setAction:", sel__textFormattingDidFinish);
      -[UIBarButtonItem setTarget:](v12, "setTarget:", self);
      objc_msgSend(v9, "setRightBarButtonItem:", v12);
      v13 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TEXT_FORMATTING_FORMAT"), CFSTR("Format"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v15);

      objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 21.0, *(double *)off_1E167DC78);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v16);

      v17 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v13);
      objc_msgSend(v9, "setLeftBarButtonItem:", v17);

      v5 = self->_navBar;
    }
    -[UIView superview](v5, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      -[UIStackView insertArrangedSubview:atIndex:](self->_contentStackView, "insertArrangedSubview:atIndex:", self->_navBar, 0);
    -[UIViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", 0);

  }
  v20 = self->_navBar;
  -[UIViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    objc_msgSend(v21, "setTitle:", 0);

    -[UIViewController navigationItem](self, "navigationItem");
    v23 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setRightBarButtonItem:](v23, "setRightBarButtonItem:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TEXT_FORMATTING_FORMAT"), CFSTR("Format"), CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", v25);

    v23 = -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:primaryAction:", 0, 0);
    -[UIBarButtonItem setAction:](v23, "setAction:", sel__textFormattingDidFinish);
    -[UIBarButtonItem setTarget:](v23, "setTarget:", self);
    -[UIViewController navigationItem](self, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRightBarButtonItem:", v23);

  }
}

- (BOOL)_useChildViewWidthForContentSize
{
  _BOOL4 v3;

  v3 = -[UITextFormattingViewController _useLandscapeLayout](self, "_useLandscapeLayout");
  if (v3)
  {
    v3 = -[UITextFormattingViewControllerConfiguration _isTextViewConfiguration](self->_configuration, "_isTextViewConfiguration");
    if (v3)
      LOBYTE(v3) = !-[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_configuration, "_isTextAnimationsConfiguration");
  }
  return v3;
}

- (CGSize)_computeContentSize
{
  UIViewController *remoteViewController;
  double v4;
  double v5;
  double v6;
  double v7;
  _TFTextFormattingContentViewController *contentViewController;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  UINavigationBar *navBar;
  double v16;
  void *v17;
  UINavigationBar *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[UIViewController preferredContentSize](remoteViewController, "preferredContentSize");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    -[_TFTextFormattingContentViewController preferredContentSize](contentViewController, "preferredContentSize");
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (-[UITextFormattingViewController _useChildViewWidthForContentSize](self, "_useChildViewWidthForContentSize"))
  {
    if (v5 < v10)
      v5 = v10;
  }
  else
  {
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v5 = v14;

  }
  navBar = self->_navBar;
  v16 = 0.0;
  if (navBar)
  {
    -[UIView superview](navBar, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = self->_navBar;
      -[UIView frame](v18, "frame");
      -[UINavigationBar sizeThatFits:](v18, "sizeThatFits:", v19, v20);
      v16 = v21;
    }
  }
  v22 = v7 + v12 + v16;
  v23 = v5;
  result.height = v22;
  result.width = v23;
  return result;
}

- (void)_updateContentSizeForAppearance:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;
  UIViewController *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  UIStackView *contentStackView;
  void *v28;
  _TFTextFormattingContentViewController *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  UIStackView *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  NSObject *v72;
  UIViewController *remoteViewController;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  _TFTextFormattingContentViewController *contentViewController;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v3 = a3;
  v88 = *MEMORY[0x1E0C80C00];
  v5 = qword_1ECD7A818;
  if (!qword_1ECD7A818)
  {
    v5 = __UILogCategoryGetNode("TextFormattingUI", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1ECD7A818);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v72 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      remoteViewController = self->_remoteViewController;
      v74 = v72;
      -[UIViewController preferredContentSize](remoteViewController, "preferredContentSize");
      v76 = v75;
      -[UIViewController preferredContentSize](self->_remoteViewController, "preferredContentSize");
      v84 = 134218240;
      v85 = v76;
      v86 = 2048;
      v87 = v77;
      _os_log_impl(&dword_185066000, v74, OS_LOG_TYPE_ERROR, "Remote child view content size is %f by %f", (uint8_t *)&v84, 0x16u);

    }
  }
  v6 = qword_1ECD7A820;
  if (!qword_1ECD7A820)
  {
    v6 = __UILogCategoryGetNode("TextFormattingUI", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&qword_1ECD7A820);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v78 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      contentViewController = self->_contentViewController;
      v80 = v78;
      -[_TFTextFormattingContentViewController preferredContentSize](contentViewController, "preferredContentSize");
      v82 = v81;
      -[_TFTextFormattingContentViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
      v84 = 134218240;
      v85 = v82;
      v86 = 2048;
      v87 = v83;
      _os_log_impl(&dword_185066000, v80, OS_LOG_TYPE_ERROR, "In-process child view content size is %f by %f", (uint8_t *)&v84, 0x16u);

    }
  }
  v7 = self->_remoteViewController;
  if (v7)
  {
    -[UIViewController view](v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    -[UIViewController preferredContentSize](self->_remoteViewController, "preferredContentSize");
    v12 = v11;

    if (v10 != v12)
    {
      -[UIViewController view](self->_remoteViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;

      -[UIViewController preferredContentSize](self->_remoteViewController, "preferredContentSize");
      v21 = v20;
      -[UIViewController view](self->_remoteViewController, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      -[UIStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_remoteViewController, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "indexOfObject:", v24);

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UIViewController view](self->_remoteViewController, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeFromSuperview");

        contentStackView = self->_contentStackView;
        -[UIViewController view](self->_remoteViewController, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStackView insertArrangedSubview:atIndex:](contentStackView, "insertArrangedSubview:atIndex:", v28, v25);

      }
    }
  }
  v29 = self->_contentViewController;
  if (v29)
  {
    -[_TFTextFormattingContentViewController view](v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    -[_TFTextFormattingContentViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
    v34 = v33;

    if (v32 != v34)
    {
      -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v37 = v36;
      v39 = v38;
      v41 = v40;

      -[_TFTextFormattingContentViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
      v43 = v42;
      -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

      -[UIStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "indexOfObject:", v46);

      if (v47 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "removeFromSuperview");

        v49 = self->_contentStackView;
        -[_TFTextFormattingContentViewController view](self->_contentViewController, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStackView insertArrangedSubview:atIndex:](v49, "insertArrangedSubview:atIndex:", v50, v47);

      }
    }
  }
  -[UITextFormattingViewController _computeContentSize](self, "_computeContentSize");
  v52 = v51;
  v54 = v53;
  if (!-[UITextFormattingViewController _useChildViewWidthForContentSize](self, "_useChildViewWidthForContentSize"))
  {
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    if ((v56 != v54 || v55 != v52) && v3)
    {
      if (-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
      {
        -[UIViewController popoverPresentationController](self, "popoverPresentationController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          -[UIViewController popoverPresentationController](self, "popoverPresentationController");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "arrowDirection");

          if (v60 == 8 || v60 == 4)
          {
            -[UIViewController view](self, "view");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "bounds");
            v63 = v62;
            -[UIViewController view](self, "view");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "safeAreaInsets");
            v66 = v63 - v65;
            -[UIViewController view](self, "view");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "safeAreaInsets");
            v52 = v66 - v68;

          }
        }
      }
    }
  }
  -[UIViewController preferredContentSize](self, "preferredContentSize");
  if (v70 != v52 || v69 != v54)
  {
    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v52, v54);
    -[UITextFormattingViewController _updateScrollViewContentSizeIfNeeded](self, "_updateScrollViewContentSizeIfNeeded");
    -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UITextFormattingViewController _resetDetentsForSheetController:invalidate:](self, "_resetDetentsForSheetController:invalidate:", v71, 1);
    }

  }
}

- (void)_updateScrollViewContentSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  id v16;

  -[UITextFormattingViewController _computeContentSize](self, "_computeContentSize");
  v4 = v3;
  v6 = v5;
  -[UITextFormattingViewController _scrollView](self, "_scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = v7;
    objc_msgSend(v7, "contentSize");
    if (v9 != v4 || v8 != v6)
      objc_msgSend(v16, "setContentSize:", v4, v6);
    -[UIView frame](self->_contentView, "frame");
    v13 = v12 == v4 && v11 == v6;
    v7 = v16;
    if (!v13)
    {
      -[UIView frame](self->_contentView, "frame");
      v15 = v14;
      -[UIView frame](self->_contentView, "frame");
      -[UIView setFrame:](self->_contentView, "setFrame:", v15);
      v7 = v16;
    }
  }

}

- (id)_scrollView
{
  void *v3;
  UIView *containerView;
  UIView *v5;

  if (self->_containerView)
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      containerView = self->_containerView;
    else
      containerView = 0;
    v5 = containerView;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_invokeEditResponderAction:(SEL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UITextFormattingViewController _editResponder](self, "_editResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UITextFormattingViewController _editResponder](self, "_editResponder");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, a3, self);

    }
  }
}

- (void)_applyTextViewHighlightWithChangeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[UITextFormattingViewController _textView](self, "_textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _NSTextHighlightColorSchemeForTextFormattingChangeValue(v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEmpty"))
    {
      v8 = (void *)objc_opt_new();
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)off_1E1679178, *(_QWORD *)off_1E1679170);
        objc_msgSend(v9, "setObject:forKey:", v7, *(_QWORD *)off_1E1679130);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v11, *(_QWORD *)off_1E1679170);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v12, *(_QWORD *)off_1E1679130);

      }
      -[UITextFormattingViewController _sendUpdatesToEditResponder:](self, "_sendUpdatesToEditResponder:", v9);
    }
    else if (v7)
    {
      v10 = *(_QWORD *)off_1E1679178;
      objc_msgSend(v5, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_applyHighlightStyle:colorScheme:toTextRange:", v10, v7, v9);
    }
    else
    {
      objc_msgSend(v5, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_removeHighlightsFromTextRange:", v9);
    }

  }
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id conversionHandler;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  UITextFormattingViewController *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  char *v63;
  void *v64;
  int v65;
  BOOL v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (unint64_t)v7;
  if (v7)
  {
    MakeConversionHandler(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = _Block_copy(v9);
  conversionHandler = self->__conversionHandler;
  self->__conversionHandler = v10;

  if (v8)
  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_15:
    -[UITextFormattingViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[UITextFormattingViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textFormattingViewController:didChangeValue:", self, v6);
      goto LABEL_39;
    }
    -[UITextFormattingViewController configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_isTextAnimationsConfiguration");

    if (v25 && (objc_msgSend(v6, "_textAnimationAttributes"), v26 = objc_claimAutoreleasedReturnValue(), v8 | v26))
    {
      v19 = (void *)v26;
      if (v26)
        v34 = v26;
      else
        v34 = v8;
      v35 = self;
    }
    else
    {
      -[UITextFormattingViewController _textView](self, "_textView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changeType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("UITextFormattingViewControllerIncreaseFontSizeChange"));

      if (v28)
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          goto LABEL_39;
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "increaseSize:", self);
LABEL_38:

        goto LABEL_39;
      }
      objc_msgSend(v6, "changeType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("UITextFormattingViewControllerDecreaseFontSizeChange"));

      if (v32)
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
          goto LABEL_39;
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "decreaseSize:", self);
        goto LABEL_38;
      }
      objc_msgSend(v6, "changeType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("UITextFormattingViewControllerFontSizeChange"));

      if (v37)
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)v38;
          objc_msgSend(v6, "numberValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v70 = CFSTR("_UITextFormattingSizeAttributeName");
            objc_msgSend(v6, "numberValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = v41;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            -[UITextFormattingViewController _sendUpdatesToEditResponder:](self, "_sendUpdatesToEditResponder:", v42);
          }
        }
        goto LABEL_39;
      }
      objc_msgSend(v6, "changeType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetBoldChange"));

      if (v44
        || (objc_msgSend(v6, "changeType"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveBoldChange")),
            v45,
            v46))
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v47)
          goto LABEL_39;
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "toggleBoldface:", self);
        goto LABEL_38;
      }
      objc_msgSend(v6, "changeType");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetItalicChange"));

      if (v52
        || (objc_msgSend(v6, "changeType"),
            v53 = (void *)objc_claimAutoreleasedReturnValue(),
            v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveItalicChange")),
            v53,
            v54))
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          goto LABEL_39;
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "toggleItalics:", self);
        goto LABEL_38;
      }
      objc_msgSend(v6, "changeType");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetUnderlineChange"));

      if (v57
        || (objc_msgSend(v6, "changeType"),
            v58 = (void *)objc_claimAutoreleasedReturnValue(),
            v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveUnderlineChange")),
            v58,
            v59))
      {
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v60)
          goto LABEL_39;
        -[UITextFormattingViewController _editResponder](self, "_editResponder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "toggleUnderline:", self);
        goto LABEL_38;
      }
      objc_msgSend(v6, "changeType");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("UITextFormattingViewControllerTextAlignmentChange"));

      if (v62)
      {
        if (objc_msgSend(v6, "textAlignment"))
        {
          if (objc_msgSend(v6, "textAlignment") == 1)
          {
            v63 = sel_alignCenter_;
          }
          else if (objc_msgSend(v6, "textAlignment") == 2)
          {
            v63 = sel_alignRight_;
          }
          else
          {
            if (objc_msgSend(v6, "textAlignment") != 3)
              goto LABEL_39;
            v63 = sel_alignJustified_;
          }
        }
        else
        {
          v63 = sel_alignLeft_;
        }
        -[UITextFormattingViewController _invokeEditResponderAction:](self, "_invokeEditResponderAction:", v63);
        goto LABEL_39;
      }
      if (v19)
      {
        objc_msgSend(v6, "changeType");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("UITextFormattingViewControllerHighlightChange"));

        if (v65)
        {
          -[UITextFormattingViewController _applyTextViewHighlightWithChangeValue:](self, "_applyTextViewHighlightWithChangeValue:", v6);
          goto LABEL_39;
        }
        objc_msgSend(v19, "textStorage");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v19, "selectedRange");
        v66 = -[UITextFormattingViewController _adjustAttributesInTextStorage:atRange:forChangeValue:](self, "_adjustAttributesInTextStorage:atRange:forChangeValue:", v67, v68, v69, v6);

      }
      else
      {
        v66 = 0;
      }
      if (!v8 || v66)
        goto LABEL_39;
      v35 = self;
      v34 = v8;
    }
    -[UITextFormattingViewController _sendUpdatesToEditResponder:](v35, "_sendUpdatesToEditResponder:", v34);
    goto LABEL_39;
  }
  v13 = (void *)v12;
  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_15;
  }
  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "performSelector:withObject:", sel__shouldHandleTextFormattingChangeValue_, v6);

  if (v16)
    goto LABEL_15;
  if (-[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_configuration, "_isTextAnimationsConfiguration"))
  {
    objc_msgSend(v6, "changeType");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v17 == CFSTR("UITextFormattingViewControllerCustomComponentSelectedChange"))
    {
      -[UITextFormattingViewController _textView](self, "_textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "selectedTextRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEmpty");

        if (v21)
        {
          -[UITextFormattingViewController _textFormattingDidFinish](self, "_textFormattingDidFinish");
LABEL_39:

          goto LABEL_40;
        }
      }

    }
  }
  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_opt_respondsToSelector();

  if ((v49 & 1) != 0)
  {
    -[UITextFormattingViewController _editResponder](self, "_editResponder");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "performSelector:withObject:", sel__textFormattingOptionsNeedUpdate_, 0);

  }
LABEL_40:

}

- (id)_textView
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[UITextFormattingViewController _editResponder](self, "_editResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UITextFormattingViewController _editResponder](self, "_editResponder");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_reconfigureViewHierarchyForParentController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;
  int *v9;
  UIView *containerView;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  UIKBVisualEffectView *backdropView;
  unint64_t v22;
  void *v23;
  int v24;
  UIKBVisualEffectView *v25;
  void *v26;
  UIKBVisualEffectView *v27;
  UIKBVisualEffectView *v28;
  UIKBVisualEffectView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  UIVisualEffectView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
  if (v4)
  {
    containerView = self->_containerView;

    if (v8 == containerView)
      goto LABEL_21;
  }
  else if (v7)
  {
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_21;
  }
  else
  {

  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subviews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v94 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "removeFromSuperview");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    }
    while (v18);
  }

  backdropView = self->_backdropView;
  self->_backdropView = 0;

  v22 = 0x1E0D15000uLL;
  v92 = v4;
  if (v4)
  {
    -[UITextFormattingViewController configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "_isTextAnimationsConfiguration");

    if (v24)
    {
      v25 = [UIKBVisualEffectView alloc];
      -[UIViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v27 = -[UIVisualEffectView initWithFrame:](v25, "initWithFrame:");

      -[UIKBBackdropView transitionToStyle:](v27, "transitionToStyle:", -[UITextFormattingViewController _backdropViewStyle](self, "_backdropViewStyle"));
      v28 = self->_backdropView;
      self->_backdropView = v27;
      v29 = v27;

      -[UIViewController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v29);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v69 = (void *)MEMORY[0x1E0D156E0];
      -[UIView topAnchor](v29, "topAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "topAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToAnchor:", v83);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = v80;
      -[UIView leadingAnchor](v29, "leadingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "leadingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:", v71);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v67;
      -[UIView trailingAnchor](v29, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v99[2] = v33;
      -[UIView bottomAnchor](v29, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v99[3] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "activateConstraints:", v38);

      v9 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
      v39 = 0x1E0C99000;

      v22 = 0x1E0D15000;
      -[UIVisualEffectView contentView](v29, "contentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor clearColor](UIColor, "clearColor");
      v41 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();

      -[UIViewController view](self, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setBackgroundColor:", v41);

    }
    else
    {
      -[UIViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
      v41 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setBackgroundColor:", v41);
      v39 = 0x1E0C99000uLL;
    }
  }
  else
  {
    v41 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v41, "setEffect:", v90);
    -[UIViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v41);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v68 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v41, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v81);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v78;
    -[UIView leadingAnchor](v41, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v70);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v66;
    -[UIView trailingAnchor](v41, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v46;
    -[UIView bottomAnchor](v41, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v51);

    v9 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
    v39 = 0x1E0C99000;

    v22 = 0x1E0D15000;
    -[UIVisualEffectView contentView](v41, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setBackgroundColor:", v52);

  }
  v54 = v9[1011];
  objc_msgSend(v40, "addSubview:", *(Class *)((char *)&self->super.super.super.isa + v54));
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v73 = *(void **)(v22 + 1760);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v85);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v82;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v76);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v55;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v58;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v62;
  objc_msgSend(*(id *)(v39 + 3360), "arrayWithObjects:count:", v97, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "activateConstraints:", v63);

  v4 = v92;
LABEL_21:

}

- (void)_textViewFormattingWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UITextFormattingViewController _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "textView:willBeginFormattingWithViewController:", v8, self);
    }
    else
    {
      objc_msgSend(v8, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "_textView:willBeginFormatting:", v8, self);

    }
    v3 = v8;
  }

}

- (void)_textViewFormattingDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextFormattingViewController _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "textView:didBeginFormattingWithViewController:", v6, self);
    }
    else
    {
      objc_msgSend(v6, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_textView:didBeginFormatting:", v6, self);

    }
    v3 = v6;
  }

}

- (void)_textViewFormattingWillEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextFormattingViewController _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "textView:willEndFormattingWithViewController:", v6, self);
    }
    else
    {
      objc_msgSend(v6, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_textView:willEndFormatting:", v6, self);

    }
    v3 = v6;
  }

}

- (void)_textViewFormattingDidEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextFormattingViewController _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "textView:didEndFormattingWithViewController:", v6, self);
    }
    else
    {
      objc_msgSend(v6, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_textView:didEndFormatting:", v6, self);

    }
    v3 = v6;
  }

}

- (int64_t)_backdropViewStyle
{
  void *v3;
  UITextFormattingViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;

  +[UISubstituteKeyboardSession sharedSession](UITextFormattingKeyboardSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textFormattingViewController");
  v4 = (UITextFormattingViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    goto LABEL_8;
  +[UISubstituteKeyboardSession sharedSession](UITextFormattingKeyboardSession, "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_textFormattingResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend(v6, "_shouldReplaceKeyboardForTextFormattingKeyboardSessionIfApplicable"))
  {

LABEL_8:
    -[UIViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_inheritedRenderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "backdropStyle");
    goto LABEL_9;
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceStyle") == 2)
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
  else
    +[UIKBRenderConfig defaultEmojiConfig](UIKBRenderConfig, "defaultEmojiConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "backdropStyle");

LABEL_9:
  return v8;
}

- (void)_onUserInterfaceStyleChange
{
  UIKBVisualEffectView *backdropView;

  backdropView = self->_backdropView;
  if (backdropView)
    -[UIKBBackdropView transitionToStyle:](backdropView, "transitionToStyle:", -[UITextFormattingViewController _backdropViewStyle](self, "_backdropViewStyle"));
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  void *v6;
  id v7;
  void *v8;
  UITextFormattingViewControllerChangeValue *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v10 = *(_QWORD *)off_1E1678D98;
    v11[0] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITextFormattingViewControllerChangeValue initWithTextColor:]([UITextFormattingViewControllerChangeValue alloc], "initWithTextColor:", v7);

    -[UITextFormattingViewController _textFormattingDidChangeValue:textAttributes:](self, "_textFormattingDidChangeValue:textAttributes:", v9, v8);
  }
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UITextFormattingViewControllerChangeValue *v7;
  void *v8;
  UITextFormattingViewControllerChangeValue *v9;
  UIColorPickerViewController *colorPicker;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *(_QWORD *)off_1E1678D98;
  v4 = a3;
  objc_msgSend(v4, "selectedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [UITextFormattingViewControllerChangeValue alloc];
  objc_msgSend(v4, "selectedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UITextFormattingViewControllerChangeValue initWithTextColor:](v7, "initWithTextColor:", v8);
  -[UITextFormattingViewController _textFormattingDidChangeValue:textAttributes:](self, "_textFormattingDidChangeValue:textAttributes:", v9, v6);
  colorPicker = self->_colorPicker;
  self->_colorPicker = 0;

  -[UITextFormattingViewController _textFormattingRequestsFirstResponderRestoration](self, "_textFormattingRequestsFirstResponderRestoration");
  -[UITextFormattingViewController _startSuppressingKeyboardForTextFormatting](self, "_startSuppressingKeyboardForTextFormatting");

}

- (void)_updateFormattingDescriptor:(id)a3
{
  _UITextFormattingViewHostingImpl *hostingImpl;
  id v5;

  if (a3)
  {
    hostingImpl = self->_hostingImpl;
    v5 = a3;
    -[_UITextFormattingViewHostingImpl setRemoteFormattingDescriptor:](hostingImpl, "setRemoteFormattingDescriptor:", v5);
    -[_TFTextFormattingContentViewController _setFormattingDescriptor:](self->_contentViewController, "_setFormattingDescriptor:", v5);

    -[UITextFormattingViewController _updateDisabledComponents](self, "_updateDisabledComponents");
  }
}

- (void)_updateDisabledComponents
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  -[UITextFormattingViewController _editResponder](self, "_editResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITextFormattingViewController _editResponder](self, "_editResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performSelector:", sel__disabledComponentsForTextFormattingOptions);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v12;
  }
  else
  {
    v6 = 0;
  }
  v13 = v6;
  if (!objc_msgSend(v6, "count"))
  {
    -[UITextFormattingViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UITextFormattingViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_disabledComponentsForTextFormattingViewController:", self);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v10;
      if (!v10)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v11 = v13;
  if (v13)
  {
LABEL_9:
    v14 = v11;
    -[_TFTextFormattingContentViewController _setDisabledComponents:](self->_contentViewController, "_setDisabledComponents:", v11);
    v11 = v14;
  }
LABEL_10:

}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  UIFontPickerViewController *fontPicker;
  UIFontPickerViewController *v5;
  _QWORD v6[5];

  fontPicker = self->_fontPicker;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__UITextFormattingViewController_fontPickerViewControllerDidCancel___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](fontPicker, "dismissViewControllerAnimated:completion:", 1, v6);
  v5 = self->_fontPicker;
  self->_fontPicker = 0;

  -[UITextFormattingViewController _textFormattingRequestsFirstResponderRestoration](self, "_textFormattingRequestsFirstResponderRestoration");
  -[UITextFormattingViewController _startSuppressingKeyboardForTextFormatting](self, "_startSuppressingKeyboardForTextFormatting");
}

uint64_t __68__UITextFormattingViewController_fontPickerViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:start:", 2, 0);
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UITextFormattingViewControllerChangeValue *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  id location;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "selectedFontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v4, self->_selectedFontSize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)off_1E1678D90;
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UITextFormattingViewControllerChangeValue initWithFont:]([UITextFormattingViewControllerChangeValue alloc], "initWithFont:", v5);
    -[UITextFormattingViewController _textFormattingDidChangeValue:textAttributes:](self, "_textFormattingDidChangeValue:textAttributes:", v7, v6);

  }
  v8 = dispatch_time(0, 300000000);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[131];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke_2;
    v5[3] = &unk_1E16B1B28;
    v5[4] = v2;
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);
    v4 = (void *)v2[131];
    v2[131] = 0;

    objc_msgSend(v2, "_textFormattingRequestsFirstResponderRestoration");
    objc_msgSend(v2, "_startSuppressingKeyboardForTextFormatting");
  }

}

uint64_t __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyKeyboardTrackingIfNeededForType:start:", 2, 0);
}

- (void)_typographySettingsViewControllerDidUpdateFont:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  UITextFormattingViewControllerChangeValue *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = *(_QWORD *)off_1E1678D90;
    v9[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UITextFormattingViewControllerChangeValue initWithFont:]([UITextFormattingViewControllerChangeValue alloc], "initWithFont:", v5);

    -[UITextFormattingViewController _textFormattingDidChangeValue:textAttributes:](self, "_textFormattingDidChangeValue:textAttributes:", v7, v6);
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[UITextFormattingViewController configuration](self, "configuration", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_isTextAnimationsConfiguration") & 1) != 0
    && (-[UIViewController view](self, "view"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10 == 1)
      return -1;
    else
      return -2;
  }
  else
  {

    return -2;
  }
}

- (id)_remoteSheet
{
  return 0;
}

- (UITextFormattingViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (UITextFormattingViewControllerDelegate)delegate
{
  return (UITextFormattingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (_UITextFormattingViewControllerInternalDelegate)_internalDelegate
{
  return (_UITextFormattingViewControllerInternalDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)_setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (id)_conversionHandler
{
  return self->__conversionHandler;
}

- (UIResponderStandardEditActions)_editResponder
{
  return (UIResponderStandardEditActions *)objc_loadWeakRetained((id *)&self->__editResponder);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__editResponder);
  objc_storeStrong(&self->__conversionHandler, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formattingDescriptor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_fontPicker, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_destroyWeak((id *)&self->_preferredFontPickerPresentationViewController);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
