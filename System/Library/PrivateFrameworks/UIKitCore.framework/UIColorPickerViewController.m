@implementation UIColorPickerViewController

+ (BOOL)_useSceneBackedColorPicker
{
  if (qword_1ECD7A8D8 != -1)
    dispatch_once(&qword_1ECD7A8D8, &__block_literal_global_76);
  return _MergedGlobals_5_3;
}

void __57__UIColorPickerViewController__useSceneBackedColorPicker__block_invoke()
{
  _MergedGlobals_5_3 = 1;
}

- (UIColorPickerViewController)initWithCoder:(id)a3
{
  id v4;
  UIColorPickerViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIColorPickerViewController;
  v5 = -[UIViewController initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIColorPickerViewControllerConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v5->_configuration, v7);
    if (!v6)

    -[UIColorPickerViewController _commonUIColorPickerViewControllerInit](v5, "_commonUIColorPickerViewControllerInit");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIColorPickerViewControllerConfiguration"));

}

- (UIColorPickerViewController)init
{
  UIColorPickerViewController *v2;
  _UIColorPickerViewControllerConfiguration *v3;
  _UIColorPickerViewControllerConfiguration *configuration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  v2 = -[UIViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v3 = objc_alloc_init(_UIColorPickerViewControllerConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    -[UIColorPickerViewController _commonUIColorPickerViewControllerInit](v2, "_commonUIColorPickerViewControllerInit");
  }
  return v2;
}

- (void)_commonUIColorPickerViewControllerInit
{
  _UIColorPickerColorQueue *v3;
  _UIColorPickerColorQueue *colorQueue;
  __objc2_class *v5;
  _UIColorPickerViewHostingImpl *v6;
  _UIColorPickerViewHostingImpl *hostingImpl;

  v3 = objc_alloc_init(_UIColorPickerColorQueue);
  colorQueue = self->_colorQueue;
  self->_colorQueue = v3;

  -[_UIColorPickerColorQueue setDelegate:](self->_colorQueue, "setDelegate:", self);
  if (objc_msgSend((id)objc_opt_class(), "_useSceneBackedColorPicker"))
    v5 = _UIColorPickerSceneHostingImpl;
  else
    v5 = _UIColorPickerRVCHostingImpl;
  v6 = (_UIColorPickerViewHostingImpl *)objc_alloc_init(v5);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = v6;

  -[_UIColorPickerViewHostingImpl setDelegateColorPickerViewController:](self->_hostingImpl, "setDelegateColorPickerViewController:", self);
  -[_UIColorPickerViewHostingImpl setupRemoteHosting](self->_hostingImpl, "setupRemoteHosting");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIColorPickerViewController;
  -[UIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIColorPickerViewController _selectDefaultColorIfNecessary](self, "_selectDefaultColorIfNecessary");
}

- (id)_defaultColor
{
  void *v2;
  uint64_t v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_nativeScreenGamut");

  if (v3)
    +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)delegate
{
  UIColorPickerViewControllerDelegate **p_delegate;
  id v5;
  char v6;
  char v7;
  char v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  p_delegate = &self->_delegate;
  v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v6;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v8;
  if ((unint64_t)_UIApplicationPackedMinimumDeploymentVersion() >= 0xF0000
    && (~*(_BYTE *)&self->_flags & 3) == 0)
  {
    v9 = setDelegate____s_category;
    if (!setDelegate____s_category)
    {
      v9 = __UILogCategoryGetNode("UIColorPicker", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&setDelegate____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "UIColorPickerViewControllerDelegate implements colorPickerViewControllerDidSelectColor: and colorPickerViewController:didSelectColor:continuously:, only colorPickerViewController:didSelectColor:continuous: will be called.", v11, 2u);
    }
  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIColorPickerViewController;
  -[UIViewController loadView](&v5, sel_loadView);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UIColorPicker"));

}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;

  if (!a3)
  {
    -[UIColorPickerViewController configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set_isEmbedded:", 0);

    -[UIColorPickerViewController _updateConfiguration](self, "_updateConfiguration");
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;

  if (a3)
  {
    -[UIColorPickerViewController configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set_isEmbedded:", 1);

    -[UIColorPickerViewController _updateConfiguration](self, "_updateConfiguration");
  }
}

- (void)_updateConfiguration
{
  void *v3;
  double Width;
  char isKindOfClass;
  id v6;
  uint64_t v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL8 v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v28);

  -[UIViewController activePresentationController](self, "activePresentationController");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v27, "_currentPresentedViewFrame");
    Width = CGRectGetWidth(v29);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v27;
      v7 = 1;
      objc_msgSend(v6, "_setIgnoresKeyboardNotifications:", 1);
      objc_msgSend(v6, "_proposedSize");
      Width = v8;

      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  if (Width > 0.0)
  {
    -[UIColorPickerViewController configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isEmbedded");

    -[UIViewController _window](self, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
    }
    else
    {
      -[UIViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v14 = v22;
      v16 = v23;
      v18 = v24;
      v20 = v25;

    }
    v26 = ((v7 | v10) & 1) == 0
       && (v30.origin.x = v14,
           v30.origin.y = v16,
           v30.size.width = v18,
           v30.size.height = v20,
           CGRectGetHeight(v30) < Width)
       && Width >= 550.0;
    -[_UIColorPickerViewControllerConfiguration set_preferredWidth:](self->_configuration, "set_preferredWidth:", Width);
    -[_UIColorPickerViewControllerConfiguration set_isInPopoverPresentation:](self->_configuration, "set_isInPopoverPresentation:", v7);
    -[_UIColorPickerViewControllerConfiguration set_useLandscapeLayout:](self->_configuration, "set_useLandscapeLayout:", v26);
    -[_UIColorPickerViewControllerConfiguration set_isInSheetPresentation:](self->_configuration, "set_isInSheetPresentation:", isKindOfClass & 1);
    -[UIColorPickerViewController _setRemoteConfiguration:](self, "_setRemoteConfiguration:", self->_configuration);
    -[_UIColorPickerViewHostingImpl setRemoteConfiguration:](self->_hostingImpl, "setRemoteConfiguration:", self->_configuration);
  }

}

- (void)_updateConfigurationIfNeeded
{
  if (self)
  {
    if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
      -[UIColorPickerViewController _updateConfiguration](self, "_updateConfiguration");
  }
}

- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  -[UIViewController beginAppearanceTransition:animated:](&v6, sel_beginAppearanceTransition_animated_, a3, a4);
  if (v4)
    -[UIColorPickerViewController _updateConfiguration](self, "_updateConfiguration");
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "setPrefersEdgeAttachedInCompactHeight:", 1);
    objc_msgSend(v6, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__UIColorPickerViewController__presentationController_prepareAdaptivePresentationController___block_invoke;
    v9[3] = &unk_1E16B73F0;
    v9[4] = self;
    +[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDetents:", v8);

  }
}

double __93__UIColorPickerViewController__presentationController_prepareAdaptivePresentationController___block_invoke(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  return v1;
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", a4.width, a4.height);
  v6 = fmax(v5, 550.0);
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIColorPickerViewController;
  -[UIViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[UIColorPickerViewController _updateConfiguration](self, "_updateConfiguration");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_msgSend(a3, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_childViewController;
  UIViewController *childViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  UIColorPickerViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    -[UIViewController willMoveToParentViewController:](childViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](*p_childViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_childViewController, a3);
    if (*p_childViewController)
    {
      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_childViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController addChildViewController:](self, "addChildViewController:", *p_childViewController);
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "addSubview:", v10);
      v21 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v10, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v24;
      objc_msgSend(v10, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v20;
      objc_msgSend(v10, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v12;
      objc_msgSend(v10, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v19 = self;
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v17);

      v5 = v15;
      -[UIViewController didMoveToParentViewController:](*p_childViewController, "didMoveToParentViewController:", v19);

    }
  }

}

- (void)_selectDefaultColorIfNecessary
{
  id v3;

  if (!self->_selectedColor && !-[UIColorPickerViewController _allowsNoColor](self, "_allowsNoColor"))
  {
    -[UIColorPickerViewController _defaultColor](self, "_defaultColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIColorPickerViewController setSelectedColor:](self, "setSelectedColor:", v3);

  }
}

- (UIColor)selectedColor
{
  UIColor *selectedColor;

  selectedColor = self->_selectedColor;
  if (selectedColor)
    return selectedColor;
  -[UIColorPickerViewController _defaultColor](self, "_defaultColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setSelectedColor:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[UIColorPickerViewController _allowsNoColor](self, "_allowsNoColor");
  v5 = v6;
  if (v6 || v4)
  {
    -[UIColorPickerViewController __setSelectedColor:notifyingViewService:](self, "__setSelectedColor:notifyingViewService:", v6, 1);
    v5 = v6;
  }

}

- (void)__setSelectedColor:(id)a3 notifyingViewService:(BOOL)a4
{
  _BOOL4 v4;
  UIColor *v7;
  UIColor **p_selectedColor;
  UIColor *v9;
  UIColor *v10;

  v4 = a4;
  v7 = (UIColor *)a3;
  p_selectedColor = &self->_selectedColor;
  if (self->_selectedColor != v7)
  {
    v10 = v7;
    if (v7)
    {
      -[UIColorPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedColor"));
      -[UIColorPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_selectedColor"));
      objc_storeStrong((id *)&self->_selectedColor, a3);
      -[UIColorPickerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedColor"));
    }
    else
    {
      -[UIColorPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_selectedColor"));
      v9 = *p_selectedColor;
      *p_selectedColor = 0;

    }
    -[UIColorPickerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_selectedColor"));
    v7 = v10;
    if (v4)
    {
      -[_UIColorPickerViewHostingImpl setRemoteSelectedColor:](self->_hostingImpl, "setRemoteSelectedColor:", v10);
      v7 = v10;
    }
  }

}

- (void)dismissEyedropper:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0;
  else
    v3 = 8;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
  -[_UIColorPickerViewHostingImpl dismissEyedropper:](self->_hostingImpl, "dismissEyedropper:");
}

- (void)setSupportsAlpha:(BOOL)supportsAlpha
{
  _BOOL8 v3;
  void *v5;

  v3 = supportsAlpha;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsAlpha:", v3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (BOOL)supportsAlpha
{
  void *v2;
  char v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsAlpha");

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  -[UIViewController setTitle:](&v6, sel_setTitle_, v4);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (void)_setShouldUseDarkGridInDarkMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_shouldUseDarkGridInDarkMode:", v3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (BOOL)_shouldUseDarkGridInDarkMode
{
  void *v2;
  char v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldUseDarkGridInDarkMode");

  return v3;
}

- (void)_setUserInterfaceStyleForGrid:(int64_t)a3
{
  void *v5;

  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_userInterfaceStyleForGrid:", a3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (int64_t)_userInterfaceStyleForGrid
{
  void *v2;
  int64_t v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_userInterfaceStyleForGrid");

  return v3;
}

- (void)_setSuggestedColors:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_suggestedColors:", v4);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (NSArray)_suggestedColors
{
  void *v2;
  void *v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_suggestedColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_setAllowsNoColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_allowsNoColor:", v3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (BOOL)_allowsNoColor
{
  void *v2;
  char v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_allowsNoColor");

  return v3;
}

- (BOOL)_supportsEyedropper
{
  void *v2;
  char v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_showsEyedropper");

  return v3;
}

- (void)_setSupportsEyedropper:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_showsEyedropper:", v3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (BOOL)_showsGridOnly
{
  void *v2;
  char v3;

  -[UIColorPickerViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_showsGridOnly");

  return v3;
}

- (void)_setShowsGridOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIColorPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_showsGridOnly:", v3);

  -[UIColorPickerViewController _updateConfigurationIfNeeded](self, "_updateConfigurationIfNeeded");
}

- (id)_remoteSheet
{
  return (id)-[_UIColorPickerViewHostingImpl _remoteSheet](self->_hostingImpl, "_remoteSheet");
}

- (void)_dequeue_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *WeakRetained;
  id v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v14 = v10;
  if (v9)
  {
    UISCreateCachedColorTransform();
    v11 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "CGColor");
    v12 = CGColorTransformConvertColor();
    CGColorTransformRelease();
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  kdebug_trace();
  -[UIColorPickerViewController __setSelectedColor:notifyingViewService:](self, "__setSelectedColor:notifyingViewService:", v10, 0);
  if (v10)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[UIColorPickerViewController delegate](self, "delegate");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "colorPickerViewController:didSelectColor:continuously:", self, v10, v5);
      goto LABEL_10;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "colorPickerViewControllerDidSelectColor:", self);
LABEL_10:

    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    -[UIColorPickerViewController delegate](self, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_colorPickerViewControllerDidDeselectColor:", self);
    goto LABEL_10;
  }
  kdebug_trace();

}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  -[_UIColorPickerColorQueue _pickerDidSelectColor:colorSpace:isVolatile:](self->_colorQueue, "_pickerDidSelectColor:colorSpace:isVolatile:", a3, a4, a5);
}

- (void)_pickerDidShowEyedropper
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  void *v18;
  char v19;
  void *v20;
  id obj;
  CGRect v22;
  CGRect v23;

  -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v15;
  v23.size.height = v16;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v17 = CGRectEqualToRect(v22, v23);

  if (v17)
  {
    if (obj)
    {
      objc_storeStrong((id *)&self->_presentationController, obj);
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_6;
    }
  }
  else
  {

  }
  obj = 0;
LABEL_6:
  -[UIColorPickerViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[UIColorPickerViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_colorPickerViewControllerDidShowEyedropper:", self);

  }
}

- (void)_pickerDidDismissEyedropper
{
  UIPresentationController *presentationController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  presentationController = self->_presentationController;
  if (presentationController)
  {
    -[UIViewController activePresentationController](self, "activePresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((*(_BYTE *)&self->_flags & 8) == 0
      && (!v4 || (objc_msgSend(v4, "dismissing") & 1) != 0 || objc_msgSend(v5, "dismissed")))
    {
      -[UIPresentationController presentedViewController](self->_presentationController, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setTemporaryPresentationController:", self->_presentationController);

      -[UIPresentationController presentingViewController](self->_presentationController, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPresentationController presentedViewController](self->_presentationController, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

    }
    -[UIColorPickerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[UIColorPickerViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_colorPickerViewControllerDidHideEyedropper:", self);

    }
    presentationController = self->_presentationController;
  }
  self->_presentationController = 0;

  *(_BYTE *)&self->_flags &= ~8u;
}

- (void)_pickerDidFinish
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  if (!-[_UIColorPickerViewControllerConfiguration _isEmbedded](self->_configuration, "_isEmbedded"))
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[UIColorPickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIColorPickerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorPickerViewControllerDidFinish:", self);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UIColorPickerViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (UIColor)_selectedColor
{
  return self->_selectedColor;
}

- (UIViewController)_childViewController
{
  return self->_childViewController;
}

- (_UIColorPickerColorQueue)colorQueue
{
  return self->_colorQueue;
}

- (void)setColorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_colorQueue, a3);
}

- (_UIColorPickerViewControllerConfiguration)_remoteConfiguration
{
  return self->__remoteConfiguration;
}

- (void)_setRemoteConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteConfiguration, 0);
  objc_storeStrong((id *)&self->_colorQueue, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
