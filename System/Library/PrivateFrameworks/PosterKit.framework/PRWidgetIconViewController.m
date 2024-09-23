@implementation PRWidgetIconViewController

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3
{
  return -[PRWidgetIconViewController initWithComplicationDescriptor:contentType:](self, "initWithComplicationDescriptor:contentType:", a3, 0);
}

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4
{
  return -[PRWidgetIconViewController initWithComplicationDescriptor:contentType:presentationMode:](self, "initWithComplicationDescriptor:contentType:presentationMode:", a3, a4, 2);
}

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4 presentationMode:(unint64_t)a5
{
  id v9;
  PRWidgetIconViewController *v10;
  PRWidgetIconViewController *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRWidgetIconViewController;
  v10 = -[PRWidgetIconViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_complicationDescriptor, a3);
    v11->_contentType = a4;
    v11->_presentationMode = a5;
    v11->_backgroundHidden = 1;
    v11->_useMaterialBackground = 1;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PRWidgetIconViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_userInterfaceStyleTraitChangeRegistration);
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewController;
  -[PRWidgetIconViewController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[PRWidgetIconViewController widgetHostViewController](self, "widgetHostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITraitChangeRegistration *v5;
  UITraitChangeRegistration *userInterfaceStyleTraitChangeRegistration;
  void *v7;
  id v8;
  CHUISWidgetHostViewController *v9;
  CHUISWidgetHostViewController *widgetHostViewController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  CHUISWidgetHostViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)PRWidgetIconViewController;
  -[PRWidgetIconViewController viewDidLoad](&v33, sel_viewDidLoad);
  objc_initWeak(&location, self);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __41__PRWidgetIconViewController_viewDidLoad__block_invoke;
  v30 = &unk_1E2185EB0;
  objc_copyWeak(&v31, &location);
  -[PRWidgetIconViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v4, &v27);
  v5 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
  userInterfaceStyleTraitChangeRegistration = self->_userInterfaceStyleTraitChangeRegistration;
  self->_userInterfaceStyleTraitChangeRegistration = v5;

  if (self->_backgroundView)
  {
    -[PRWidgetIconViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_backgroundView);

  }
  v8 = objc_alloc(MEMORY[0x1E0D10310]);
  objc_msgSend(v8, "pr_initWithComplicationDescriptor:", self->_complicationDescriptor);
  v9 = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue();
  widgetHostViewController = self->_widgetHostViewController;
  self->_widgetHostViewController = v9;

  -[CHUISWidgetHostViewController setInteractionDisabled:](self->_widgetHostViewController, "setInteractionDisabled:", self->_widgetInteractionDisabled);
  -[CHUISWidgetHostViewController setDrawSystemBackgroundMaterialIfNecessary:](self->_widgetHostViewController, "setDrawSystemBackgroundMaterialIfNecessary:", 0);
  -[CHUISWidgetHostViewController setVisibility:](self->_widgetHostViewController, "setVisibility:", 2);
  -[CHUISWidgetHostViewController setContentType:](self->_widgetHostViewController, "setContentType:", self->_contentType);
  -[CHUISWidgetHostViewController setColorScheme:](self->_widgetHostViewController, "setColorScheme:", 2);
  -[CHUISWidgetHostViewController setSupportsLowLuminance:](self->_widgetHostViewController, "setSupportsLowLuminance:", 1);
  -[CHUISWidgetHostViewController setPrefersUnredactedContentInLowLuminanceEnvironment:](self->_widgetHostViewController, "setPrefersUnredactedContentInLowLuminanceEnvironment:", 1);
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[PRComplicationDescriptor widget](self->_complicationDescriptor, "widget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationDescriptor widget](self->_complicationDescriptor, "widget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v13, v15, v27, v28, v29, v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHUISWidgetHostViewController view](self->_widgetHostViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v16);

  -[CHUISWidgetHostViewController view](self->_widgetHostViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityValue:", CFSTR("Widget"));

  v19 = objc_alloc(MEMORY[0x1E0D10258]);
  objc_msgSend(MEMORY[0x1E0D01710], "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, v20, 2, 2, 1.0);

  -[CHUISWidgetHostViewController setTintParameters:](self->_widgetHostViewController, "setTintParameters:", v21);
  v22 = self->_widgetHostViewController;
  -[PRWidgetIconViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWidgetHostViewController setVibrancyConfiguration:](v22, "setVibrancyConfiguration:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 1, 1);
  -[CHUISWidgetHostViewController setRenderScheme:](self->_widgetHostViewController, "setRenderScheme:", v24);
  -[PRWidgetIconViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_widgetHostViewController);
  -[CHUISWidgetHostViewController setCanAppearInSecureEnvironment:](self->_widgetHostViewController, "setCanAppearInSecureEnvironment:", 1);
  -[CHUISWidgetHostViewController setShouldShareTouchesWithHost:](self->_widgetHostViewController, "setShouldShareTouchesWithHost:", 1);
  -[CHUISWidgetHostViewController setPresentationMode:](self->_widgetHostViewController, "setPresentationMode:", self->_presentationMode);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapRecognized_);
  -[PRWidgetIconViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addGestureRecognizer:", v25);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __41__PRWidgetIconViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[122];
    WeakRetained[122] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_updatePlatterStylingIfNeeded");
    WeakRetained = v3;
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRWidgetIconViewController;
  -[PRWidgetIconViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
    -[PRWidgetIconViewController _updatePlatterStylingIfNeeded](self, "_updatePlatterStylingIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  UIView *backgroundView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRWidgetIconViewController;
  -[PRWidgetIconViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  backgroundView = self->_backgroundView;
  -[PRWidgetIconViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");

  -[CHUISWidgetHostViewController metrics](self->_widgetHostViewController, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  -[CHUISWidgetHostViewController view](self->_widgetHostViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

}

- (CHUISWidgetHostViewController)widgetHostViewController
{
  -[PRWidgetIconViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_widgetHostViewController;
}

- (void)setUseMaterialBackground:(BOOL)a3
{
  UIView *backgroundView;
  void *v5;
  id v6;

  if (self->_useMaterialBackground != a3)
  {
    self->_useMaterialBackground = a3;
    -[PRWidgetIconViewController _recreateBackgroundView](self, "_recreateBackgroundView");
    -[PRWidgetIconViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    -[CHUISWidgetHostViewController view](self->_widgetHostViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", backgroundView, v5);

  }
}

- (void)_recreateBackgroundView
{
  UIView *v3;
  objc_class *v4;
  void *v5;
  UIView *backgroundView;

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  if (self->_useMaterialBackground)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 101);
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setGroupNameBase:](v3, "setGroupNameBase:", v5);

  }
  else
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_iconImageInfo.continuousCornerRadius);
  -[PRWidgetIconViewController _updatePlatterStylingIfNeeded](self, "_updatePlatterStylingIfNeeded");
  -[PRWidgetIconViewController _updateBackgroundViewAlpha](self, "_updateBackgroundViewAlpha");
}

- (id)_platterVisualStylingProvider
{
  MTVisualStylingProvider *platterVisualStylingProvider;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;

  platterVisualStylingProvider = self->_platterVisualStylingProvider;
  if (!platterVisualStylingProvider)
  {
    -[PRWidgetIconViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");
    v6 = CFSTR("widgetGalleryPlatterLight");
    if (v5 == 2)
      v6 = CFSTR("widgetGalleryPlatterDark");
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0D474B8];
    PRBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_visualStylingProviderForStyleSetNamed:inBundle:", v7, v9);
    v10 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();

    v11 = self->_platterVisualStylingProvider;
    self->_platterVisualStylingProvider = v10;

    platterVisualStylingProvider = self->_platterVisualStylingProvider;
  }
  return platterVisualStylingProvider;
}

- (void)_updatePlatterStylingIfNeeded
{
  UIView *backgroundView;
  void *v4;
  id v5;

  if (!self->_useMaterialBackground)
  {
    -[UIView mt_removeAllVisualStyling](self->_backgroundView, "mt_removeAllVisualStyling");
    backgroundView = self->_backgroundView;
    -[PRWidgetIconViewController _platterVisualStylingProvider](self, "_platterVisualStylingProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_visualStylingForStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](backgroundView, "mt_replaceVisualStyling:", v4);

  }
}

- (void)setBackgroundHidden:(BOOL)a3
{
  void *v4;
  UIView *backgroundView;
  void *v6;

  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    if (!self->_backgroundView)
    {
      -[PRWidgetIconViewController _recreateBackgroundView](self, "_recreateBackgroundView");
      -[PRWidgetIconViewController viewIfLoaded](self, "viewIfLoaded");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      backgroundView = self->_backgroundView;
      -[CHUISWidgetHostViewController view](self->_widgetHostViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertSubview:belowSubview:", backgroundView, v6);

    }
    -[PRWidgetIconViewController _updateBackgroundViewAlpha](self, "_updateBackgroundViewAlpha");
  }
}

- (BOOL)wantsLabelHidden
{
  return 1;
}

- (void)setWidgetInteractionDisabled:(BOOL)a3
{
  if (self->_widgetInteractionDisabled != a3)
  {
    self->_widgetInteractionDisabled = a3;
    -[CHUISWidgetHostViewController setInteractionDisabled:](self->_widgetHostViewController, "setInteractionDisabled:");
  }
}

- (void)_updateBackgroundViewAlpha
{
  _BOOL4 v3;
  double v4;

  v3 = -[PRWidgetIconViewController isBackgroundHidden](self, "isBackgroundHidden");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v4);
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  BSUIVibrancyConfiguration *v7;
  BSUIVibrancyConfiguration *vibrancyConfiguration;
  id v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSUIVibrancyConfiguration *)objc_msgSend(v4, "copyWithGroupName:", v6);

  vibrancyConfiguration = self->_vibrancyConfiguration;
  self->_vibrancyConfiguration = v7;

  -[PRWidgetIconViewController widgetHostViewController](self, "widgetHostViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVibrancyConfiguration:", self->_vibrancyConfiguration);

}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if ((SBIconImageInfoEqualToIconImageInfo() & 1) == 0)
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v7);
  }
}

- (void)_tapRecognized:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PRWidgetIconViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PRWidgetIconViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetIconViewControllerDidReceiveTap:", self);

  }
}

- (BOOL)isUserInteractionEnabled
{
  return !self->_widgetInteractionDisabled;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (PRWidgetIconViewControllerDelegate)delegate
{
  return (PRWidgetIconViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetHostViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_platterVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleTraitChangeRegistration, 0);
}

@end
