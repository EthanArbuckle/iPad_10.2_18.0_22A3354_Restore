@implementation PKLinkedAppContentView

- (PKLinkedAppContentView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKLinkedAppContentView init](self, "init");
}

- (PKLinkedAppContentView)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return -[PKLinkedAppContentView init](self, "init");
}

- (PKLinkedAppContentView)initWithLinkedApplication:(id)a3
{
  PKLinkedApplication *v4;
  PKLinkedAppContentView *v5;
  PKLinkedApplication *v6;
  ASCLockupView *v7;
  ASCLockupView *lockupView;
  void *v9;
  objc_super v11;

  v4 = (PKLinkedApplication *)a3;
  v11.receiver = self;
  v11.super_class = (Class)PKLinkedAppContentView;
  v5 = -[PKLinkedAppContentView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = v4;
    if (!v4)
      v6 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithStoreIDs:defaultLaunchURL:", 0, 0);
    objc_storeStrong((id *)&v5->_linkedApplication, v6);
    if (!v4)

    -[PKLinkedApplication addObserver:](v5->_linkedApplication, "addObserver:", v5);
    v7 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E0CF9BC8]);
    lockupView = v5->_lockupView;
    v5->_lockupView = v7;

    -[ASCLockupView setDelegate:](v5->_lockupView, "setDelegate:", v5);
    -[ASCLockupView setShowsPlaceholderContent:](v5->_lockupView, "setShowsPlaceholderContent:", 0);
    -[ASCLockupView setAutomaticallyPresentsProductDetails:](v5->_lockupView, "setAutomaticallyPresentsProductDetails:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v5, sel_appLockupViewTapped);
    -[ASCLockupView addGestureRecognizer:](v5->_lockupView, "addGestureRecognizer:", v9);
    -[PKLinkedAppContentView _configureAppLockUpIfNecessary](v5, "_configureAppLockUpIfNecessary");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLinkedApplication removeObserver:](self->_linkedApplication, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppContentView;
  -[PKLinkedAppContentView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppContentView;
  -[PKLinkedAppContentView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKLinkedAppContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ASCLockupView intrinsicContentSize](self->_lockupView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[ASCLockupView sizeThatFits:](self->_lockupView, "sizeThatFits:", a3.width + -28.0, 1.79769313e308);
  v5 = v4 + 24.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppContentView;
  -[PKLinkedAppContentView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = -[PKLinkedApplication state](self->_linkedApplication, "state");
  switch(v3)
  {
    case 2:
      -[PKLinkedAppContentView _layoutNotAvailableView](self, "_layoutNotAvailableView");
      break;
    case 1:
      -[PKLinkedAppContentView _layoutLockupView](self, "_layoutLockupView");
      break;
    case 0:
      -[PKLinkedAppContentView _layoutLoadingView](self, "_layoutLoadingView");
      break;
  }
}

- (void)_layoutLoadingView
{
  id *p_activityIndicator;
  UIActivityIndicatorView *activityIndicator;
  uint64_t v5;
  id v6;
  void *v7;
  UILabel **p_loadingLabel;
  double v9;
  double v10;
  double v11;
  id *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGRect v29;
  CGRect remainder;
  CGRect slice;
  CGRect v32;
  CGRect v33;

  -[PKLinkedAppContentView _cleanupViews](self, "_cleanupViews");
  p_activityIndicator = (id *)&self->_activityIndicator;
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v6 = *p_activityIndicator;
    *p_activityIndicator = (id)v5;

    objc_msgSend(*p_activityIndicator, "sizeToFit");
    objc_msgSend(*p_activityIndicator, "startAnimating");
    activityIndicator = (UIActivityIndicatorView *)*p_activityIndicator;
  }
  -[PKLinkedAppContentView addSubview:](self, "addSubview:", activityIndicator);
  PKLocalizedString(CFSTR("LOADING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedAppContentView setLoadingText:](self, "setLoadingText:", v7);

  p_loadingLabel = &self->_loadingLabel;
  -[PKLinkedAppContentView addSubview:](self, "addSubview:", self->_loadingLabel);
  objc_msgSend(*p_activityIndicator, "frame");
  -[UILabel frame](self->_loadingLabel, "frame");
  objc_msgSend(*p_activityIndicator, "frame");
  v10 = v9;
  -[UILabel frame](self->_loadingLabel, "frame");
  if (v10 <= v11)
    v12 = (id *)&self->_loadingLabel;
  else
    v12 = (id *)&self->_activityIndicator;
  objc_msgSend(*v12, "frame");
  -[PKLinkedAppContentView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(*p_activityIndicator, "frame", 0, 0, 0, 0, 0, 0, 0, 0);
  v22 = v21;
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  CGRectDivide(v32, &slice, &remainder, v22, CGRectMinXEdge);
  -[UILabel frame](*p_loadingLabel, "frame");
  v24 = v23;
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  CGRectDivide(v33, &remainder, &v29, v24, CGRectMaxXEdge);
  UIRectCenteredYInRect();
  remainder.origin.x = v25;
  remainder.origin.y = v26;
  remainder.size.width = v27;
  remainder.size.height = v28;
  objc_msgSend(*p_activityIndicator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel setFrame:](*p_loadingLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (void)_layoutNotAvailableView
{
  void *v3;
  double v4;
  double v5;

  -[PKLinkedAppContentView _cleanupViews](self, "_cleanupViews");
  PKLocalizedString(CFSTR("NOT_AVAILABLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedAppContentView setLoadingText:](self, "setLoadingText:", v3);

  -[UILabel setTextAlignment:](self->_loadingLabel, "setTextAlignment:", 1);
  -[PKLinkedAppContentView addSubview:](self, "addSubview:", self->_loadingLabel);
  -[PKLinkedAppContentView bounds](self, "bounds");
  UIRectInset();
  -[UILabel sizeThatFits:](self->_loadingLabel, "sizeThatFits:", v4, v5);
  UIRectCenteredIntegralRect();
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:");
}

- (void)_layoutLockupView
{
  ASCLockupView *lockupView;
  CGRect v4;
  CGRect v5;

  -[PKLinkedAppContentView _cleanupViews](self, "_cleanupViews");
  -[PKLinkedAppContentView addSubview:](self, "addSubview:", self->_lockupView);
  -[PKLinkedAppContentView _configureAppLockUpIfNecessary](self, "_configureAppLockUpIfNecessary");
  -[PKLinkedAppContentView bounds](self, "bounds");
  v5 = CGRectInset(v4, 14.0, 12.0);
  -[ASCLockupView sizeThatFits:](self->_lockupView, "sizeThatFits:", v5.size.width, 1.79769313e308);
  lockupView = self->_lockupView;
  PKSizeAlignedInRect();
  -[ASCLockupView setFrame:](lockupView, "setFrame:");
}

- (void)_cleanupViews
{
  -[UILabel removeFromSuperview](self->_loadingLabel, "removeFromSuperview");
  -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
  -[ASCLockupView removeFromSuperview](self->_lockupView, "removeFromSuperview");
}

- (void)_configureAppLockUpIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ASCLockupView request](self->_lockupView, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PKLinkedApplication storeIdentifier](self->_linkedApplication, "storeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = v4;
      _PKCreateASCLookupRequestForStoreID(v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", v5);

      v4 = v6;
    }

  }
}

- (void)reloadApplicationStateIfNecessary
{
  -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
}

- (NSArray)storeIDs
{
  return -[PKLinkedApplication storeIDs](self->_linkedApplication, "storeIDs");
}

- (void)setStoreIDs:(id)a3
{
  -[PKLinkedApplication setStoreIDs:](self->_linkedApplication, "setStoreIDs:", a3);
}

- (NSURL)appLaunchURL
{
  return -[PKLinkedApplication defaultLaunchURL](self->_linkedApplication, "defaultLaunchURL");
}

- (void)setAppLaunchURL:(id)a3
{
  -[PKLinkedApplication setDefaultLaunchURL:](self->_linkedApplication, "setDefaultLaunchURL:", a3);
}

- (void)setCustomProductPageIdentifier:(id)a3
{
  -[PKLinkedApplication setCustomProductPageIdentifier:](self->_linkedApplication, "setCustomProductPageIdentifier:", a3);
}

- (void)setLoadingText:(id)a3
{
  id v4;
  UILabel *loadingLabel;
  id v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v4 = a3;
  loadingLabel = self->_loadingLabel;
  v13 = v4;
  if (!loadingLabel)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_loadingLabel;
    self->_loadingLabel = v7;

    v9 = self->_loadingLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC48D8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setNumberOfLines:](self->_loadingLabel, "setNumberOfLines:", 3);
    v11 = self->_loadingLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    v4 = v13;
    loadingLabel = self->_loadingLabel;
  }
  -[UILabel setText:](loadingLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");

}

- (void)appLockupViewTapped
{
  void *v3;
  PKLinkedApplication *linkedApplication;
  id v5;

  -[PKLinkedApplication customProductPageIdentifier](self->_linkedApplication, "customProductPageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    linkedApplication = self->_linkedApplication;
    -[PKLinkedAppContentView _presentingViewController](self, "_presentingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKLinkedApplication openApplication:](linkedApplication, "openApplication:", v5);

  }
  else
  {
    -[ASCLockupView presentProductDetailsViewController](self->_lockupView, "presentProductDetailsViewController");
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "state"))
  {
    -[PKLinkedAppContentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v5, "reloadApplicationStateIfNecessary");
  }
  -[PKLinkedAppContentView _configureAppLockUpIfNecessary](self, "_configureAppLockUpIfNecessary");
  -[PKLinkedAppContentView setNeedsLayout](self, "setNeedsLayout");
  -[PKLinkedAppContentView lockupViewDidInvalidateIntrinsicContentSize:](self, "lockupViewDidInvalidateIntrinsicContentSize:", self->_lockupView);

}

- (id)_presentingViewController
{
  void *v2;
  void *v3;

  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_frontMostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = a4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: failed to load app with error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  double v4;
  double width;
  double height;
  double v7;
  id WeakRetained;

  if (-[PKLinkedApplication state](self->_linkedApplication, "state", a3) == 1)
  {
    -[ASCLockupView intrinsicContentSize](self->_lockupView, "intrinsicContentSize");
    width = self->_previousIntrinsicContentSize.width;
    height = self->_previousIntrinsicContentSize.height;
    self->_previousIntrinsicContentSize.width = v7;
    self->_previousIntrinsicContentSize.height = v4;
    if (width != v7 || height != v4)
    {
      -[PKLinkedAppContentView setNeedsLayout](self, "setNeedsLayout");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "appViewContentSizeChanged:", self);

    }
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  ASCLockupView *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = (ASCLockupView *)a3;
  if (self->_lockupView == v4)
  {
    -[PKLinkedApplication defaultLaunchURL](self->_linkedApplication, "defaultLaunchURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || !-[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled"))
      goto LABEL_6;
    v6 = -[PKLinkedApplication state](self->_linkedApplication, "state");

    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E0CF9BE0];
      PKLocalizedString(CFSTR("OPEN_BUTTON"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textMetadataWithTitle:subtitle:", v8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v9 = objc_alloc(MEMORY[0x1E0CF9BA8]);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __53__PKLinkedAppContentView_lockupViewDidFinishRequest___block_invoke;
      v16 = &unk_1E3E61310;
      objc_copyWeak(&v17, &location);
      v10 = (void *)objc_msgSend(v9, "initWithMetadata:action:", v5, &v13);
      -[ASCLockupView lockup](v4, "lockup", v13, v14, v15, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lockupWithOffer:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupView setLockup:](v4, "setLockup:", v12);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
LABEL_6:

    }
  }

}

void __53__PKLinkedAppContentView_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[57];
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openApplication:", v3);

    WeakRetained = v4;
  }

}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (PKLinkedAppViewDelegate)delegate
{
  return (PKLinkedAppViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
