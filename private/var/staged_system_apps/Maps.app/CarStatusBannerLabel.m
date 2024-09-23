@implementation CarStatusBannerLabel

- (CarStatusBannerLabel)initWithChromeViewController:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  CarStatusBannerLabel *v8;
  CarStatusBannerLabel *v9;
  id v10;
  MUBlurView *v11;
  MUBlurView *blurView;
  MapsFadingLabel *v13;
  MapsFadingLabel *titleLabel;
  double v15;
  double v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *chevronImageView;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *widthConstraint;
  id WeakRetained;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *topConstraint;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *bottomConstraint;
  void *v40;
  void *v41;
  uint64_t v42;
  NSLayoutConstraint *leadingConstraint;
  void *v44;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *trailingConstraint;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  id v74;
  objc_super v75;
  _QWORD v76[12];
  _QWORD v77[2];

  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)CarStatusBannerLabel;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[CarFocusableBlurControl initWithFrame:](&v75, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[CarFocusableBlurControl setCastsShadow:](v8, "setCastsShadow:", 0);
    -[CarFocusableBlurControl setHidesBlur:](v9, "setHidesBlur:", 1);
    -[CarStatusBannerLabel setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("CarStatusBannerLabel"));
    v10 = objc_storeWeak((id *)&v9->_chromeViewController, v4);
    v9->_sceneType = (int64_t)objc_msgSend(v4, "sceneType");
    v74 = v4;

    v11 = (MUBlurView *)objc_msgSend(objc_alloc((Class)MUBlurView), "initWithVariableBlurWithRadius:maskImage:", -[CarStatusBannerLabel maskImage](v9, "maskImage"), 2.0);
    blurView = v9->_blurView;
    v9->_blurView = v11;

    -[MUBlurView setTranslatesAutoresizingMaskIntoConstraints:](v9->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarFocusableControl addSubview:](v9, "addSubview:", v9->_blurView);
    v13 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v13;

    -[MapsFadingLabel setAccessibilityIdentifier:](v9->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MapsFadingLabel setNumberOfLines:](v9->_titleLabel, "setNumberOfLines:", 1);
    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[MapsFadingLabel setContentHuggingPriority:forAxis:](v9->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v15);
    LODWORD(v16) = 1132068864;
    -[MapsFadingLabel setContentCompressionResistancePriority:forAxis:](v9->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    -[MapsFadingLabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
    -[MapsFadingLabel setFont:](v9->_titleLabel, "setFont:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsFadingLabel setBackgroundColor:](v9->_titleLabel, "setBackgroundColor:", v18);

    -[MapsFadingLabel setBaselineAdjustment:](v9->_titleLabel, "setBaselineAdjustment:", 1);
    v19 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevronImageView = v9->_chevronImageView;
    v9->_chevronImageView = v19;

    -[UIImageView setAccessibilityIdentifier:](v9->_chevronImageView, "setAccessibilityIdentifier:", CFSTR("ChevronImageView"));
    -[UIImageView setContentMode:](v9->_chevronImageView, "setContentMode:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
    -[UIImageView setTintColor:](v9->_chevronImageView, "setTintColor:", v21);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v22) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v9->_chevronImageView, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v9->_chevronImageView, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    -[UIImageView setHidden:](v9->_chevronImageView, "setHidden:", 1);
    v24 = objc_alloc((Class)UIStackView);
    v77[0] = v9->_titleLabel;
    v77[1] = v9->_chevronImageView;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2));
    v26 = objc_msgSend(v24, "initWithArrangedSubviews:", v25);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "setAxis:", 0);
    objc_msgSend(v26, "setDistribution:", 0);
    objc_msgSend(v26, "setSpacing:", 3.0);
    objc_msgSend(v26, "setAlignment:", 3);
    -[CarFocusableControl addSubview:](v9, "addSubview:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView widthAnchor](v9->_blurView, "widthAnchor"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 165.0));
    widthConstraint = v9->_widthConstraint;
    v9->_widthConstraint = (NSLayoutConstraint *)v28;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_chromeViewController);
    v31 = objc_msgSend(WeakRetained, "sceneType");

    if (v31 == (id)1)
      -[NSLayoutConstraint setActive:](v9->_widthConstraint, "setActive:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView topAnchor](v9->_blurView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel topAnchor](v9, "topAnchor"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    topConstraint = v9->_topConstraint;
    v9->_topConstraint = (NSLayoutConstraint *)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView bottomAnchor](v9->_blurView, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel bottomAnchor](v9, "bottomAnchor"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
    bottomConstraint = v9->_bottomConstraint;
    v9->_bottomConstraint = (NSLayoutConstraint *)v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel leadingAnchor](v9, "leadingAnchor"));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 6.0));
    leadingConstraint = v9->_leadingConstraint;
    v9->_leadingConstraint = (NSLayoutConstraint *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel trailingAnchor](v9, "trailingAnchor"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", v45, -6.0));
    trailingConstraint = v9->_trailingConstraint;
    v9->_trailingConstraint = (NSLayoutConstraint *)v46;

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView leadingAnchor](v9->_blurView, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel leadingAnchor](v9, "leadingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v76[0] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView trailingAnchor](v9->_blurView, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel trailingAnchor](v9, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v76[1] = v68;
    v76[2] = v9->_topConstraint;
    v76[3] = v9->_bottomConstraint;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel topAnchor](v9, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v76[4] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel bottomAnchor](v9, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
    v76[5] = v62;
    v76[6] = v9->_leadingConstraint;
    v76[7] = v9->_trailingConstraint;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel centerXAnchor](v9, "centerXAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v76[8] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "heightAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:", 20.0));
    v76[9] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v9->_chevronImageView, "widthAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", 14.0));
    v76[10] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v9->_chevronImageView, "heightAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 14.0));
    v76[11] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    objc_msgSend(v56, "addObserver:", v9);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_OfflineOnlyData, off_1014B4C08, &_dispatch_main_q, v9);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v57, "addObserver:forKeyPath:options:context:", v9, CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"), 0, &off_1011B0088);

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9->_navigationGuidanceSignStyle = (int64_t)objc_msgSend(v58, "integerForKey:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

    v9->_disableBlur = GEOConfigGetBOOL(MapsConfig_DisableCarStatusBannerOverlayBlur, off_1014B4BF8);
    -[CarStatusBannerLabel reloadContent](v9, "reloadContent");

    v4 = v74;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v3, "removeObserver:", self);

  GEOConfigRemoveDelegateListenerForAllKeys(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

  v6.receiver = self;
  v6.super_class = (Class)CarStatusBannerLabel;
  -[CarStatusBannerLabel dealloc](&v6, "dealloc");
}

- (CGImage)maskImage
{
  void *v2;
  UIImage *ImageFromCurrentImageContext;
  void *v4;
  id v5;
  CGImage *v6;
  CGSize v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("OfflineBannerBlur")));
  v8.width = 195.0;
  v8.height = 50.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, 195.0, 50.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v5 = objc_retainAutorelease(v4);
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10
    && a6 == &off_1011B0088
    && objc_msgSend(v10, "isEqualToString:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    self->_navigationGuidanceSignStyle = (int64_t)objc_msgSend(v13, "integerForKey:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

    -[CarStatusBannerLabel reloadContent](self, "reloadContent");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CarStatusBannerLabel;
    -[CarStatusBannerLabel observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CarStatusBannerLabel *v7;
  CarStatusBannerLabel *v8;
  CarStatusBannerLabel *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarStatusBannerLabel;
  -[CarFocusableControl didUpdateFocusInContext:withAnimationCoordinator:](&v10, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (CarStatusBannerLabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v7 == self)
  {

LABEL_5:
    -[CarStatusBannerLabel reloadContent](self, "reloadContent");
    goto LABEL_6;
  }
  v8 = v7;
  v9 = (CarStatusBannerLabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)reloadContent
{
  void *v3;
  _BOOL4 v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  double v9;
  void *v10;
  uint64_t BOOL;
  const __CFString *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  MUBlurView **p_blurView;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  id v29;

  if (self->_navigationGuidanceSignStyle == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    if (objc_msgSend(v3, "isInNavigatingState"))
      v4 = self->_sceneType == 1;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  if ((-[CarStatusBannerLabel isFocused](self, "isFocused") & 1) != 0
    || (-[CarStatusBannerLabel isSelected](self, "isSelected") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = -[CarStatusBannerLabel isHighlighted](self, "isHighlighted");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v4)
    v8 = CFSTR("Offline");
  else
    v8 = CFSTR("Using Offline Maps");
  if (v4)
    v9 = 100.0;
  else
    v9 = 165.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found")));
  -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v10);

  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v9);
  BOOL = GEOConfigGetBOOL(MapsConfig_OfflineOnlyData, off_1014B4C08);
  -[CarFocusableControl setEnabled:](self, "setEnabled:", BOOL);
  -[UIImageView setHidden:](self->_chevronImageView, "setHidden:", BOOL ^ 1);
  if (v5)
    v12 = CFSTR("chevron.forward.circle.fill");
  else
    v12 = CFSTR("chevron.forward");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v12));
  -[UIImageView setImage:](self->_chevronImageView, "setImage:", v13);

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lightLevelController"));
  if ((objc_msgSend(v15, "shouldUseNightMode") & 1) != 0)
    v16 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v16 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  v29 = (id)v16;

  v17 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lightLevelController"));
  if ((objc_msgSend(v18, "shouldUseNightMode") & 1) != 0)
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  else
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v20 = (void *)v19;

  if (v5)
    v21 = v20;
  else
    v21 = v29;
  -[MapsFadingLabel setTextColor:](self->_titleLabel, "setTextColor:", v21);
  -[UIImageView setTintColor:](self->_chevronImageView, "setTintColor:", v21);
  if ((v5 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    p_blurView = &self->_blurView;
    -[MUBlurView setNonBlurredColor:](self->_blurView, "setNonBlurredColor:", v22);

    v24 = 0.0;
    v25 = -4.0;
    v26 = 2;
    v27 = 0.0;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    p_blurView = &self->_blurView;
    -[MUBlurView setNonBlurredColor:](self->_blurView, "setNonBlurredColor:", v28);

    v26 = 2 * self->_disableBlur;
    v27 = -15.0;
    v24 = 15.0;
    v25 = -6.0;
  }
  -[MUBlurView setStyle:](*p_blurView, "setStyle:", v26);
  -[MUBlurView _setContinuousCornerRadius:](*p_blurView, "_setContinuousCornerRadius:", 10.0);
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v27);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", v24);
  -[NSLayoutConstraint setConstant:](self->_trailingConstraint, "setConstant:", v25);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_OfflineOnlyData && a3.var1 == off_1014B4C08)
    -[CarStatusBannerLabel reloadContent](self, "reloadContent");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
