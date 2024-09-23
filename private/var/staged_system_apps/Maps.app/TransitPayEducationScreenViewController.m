@implementation TransitPayEducationScreenViewController

- (TransitPayEducationScreenViewController)initWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5
{
  id v8;
  id v9;
  id v10;
  TransitPayEducationScreenViewController *v11;
  TransitPayEducationScreenViewController *v12;
  uint64_t v13;
  UIImageView *mainImageView;
  uint64_t v15;
  UILabel *primaryLabel;
  uint64_t v17;
  UILabel *secondaryLabel;
  uint64_t v19;
  MUScrollableStackView *contentStackView;
  uint64_t v21;
  UIVisualEffectView *footerBlurView;
  uint64_t v23;
  UIButton *okButton;
  uint64_t v25;
  MapsLoopingVideoPlayerView *videoView;
  uint64_t v27;
  UIActivityIndicatorView *spinnerView;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSURL *assetURL;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)TransitPayEducationScreenViewController;
  v11 = -[TransitPayEducationScreenViewController init](&v34, "init");
  v12 = v11;
  if (v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createMainImageView](v11, "_createMainImageView"));
    mainImageView = v12->_mainImageView;
    v12->_mainImageView = (UIImageView *)v13;

    v15 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createPrimaryLabelWithText:](v12, "_createPrimaryLabelWithText:", v9));
    primaryLabel = v12->_primaryLabel;
    v12->_primaryLabel = (UILabel *)v15;

    v17 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createSecondaryLabelWithText:](v12, "_createSecondaryLabelWithText:", v10));
    secondaryLabel = v12->_secondaryLabel;
    v12->_secondaryLabel = (UILabel *)v17;

    v19 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createContentStackView](v12, "_createContentStackView"));
    contentStackView = v12->_contentStackView;
    v12->_contentStackView = (MUScrollableStackView *)v19;

    v21 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createFooterBlurView](v12, "_createFooterBlurView"));
    footerBlurView = v12->_footerBlurView;
    v12->_footerBlurView = (UIVisualEffectView *)v21;

    v23 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createOkButton](v12, "_createOkButton"));
    okButton = v12->_okButton;
    v12->_okButton = (UIButton *)v23;

    v25 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createVideoView](v12, "_createVideoView"));
    videoView = v12->_videoView;
    v12->_videoView = (MapsLoopingVideoPlayerView *)v25;

    v27 = objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _createSpinnerView](v12, "_createSpinnerView"));
    spinnerView = v12->_spinnerView;
    v12->_spinnerView = (UIActivityIndicatorView *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    objc_msgSend(v29, "screenScale");
    v30 = GEOAssetURLForScaleFactor(v8);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    assetURL = v12->_assetURL;
    v12->_assetURL = (NSURL *)v31;

    v12->_isAssetMovie = 1;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitPayEducationScreenViewController;
  -[TransitPayEducationScreenViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[TransitPayEducationScreenViewController _determineAssetCategory](self, "_determineAssetCategory");
  -[TransitPayEducationScreenViewController _setUpViews](self, "_setUpViews");
  -[TransitPayEducationScreenViewController _setUpConstraints](self, "_setUpConstraints");
  -[TransitPayEducationScreenViewController _loadAsset](self, "_loadAsset");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitPayEducationScreenViewController;
  -[TransitPayEducationScreenViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[TransitPayEducationScreenViewController _updateBlurViewVisibilityIfNeeded](self, "_updateBlurViewVisibilityIfNeeded");
}

- (id)_assetView
{
  uint64_t v2;

  v2 = 6;
  if (!self->_isAssetMovie)
    v2 = 0;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___TransitPayEducationScreenViewController__mainImageView[v2]));
}

- (void)_setUpViews
{
  id v3;
  void *v4;
  TransitPayEducationScreenTitleView *v5;
  void *v6;
  void *v7;
  MUScrollableStackView *contentStackView;
  void *v9;
  double Double;
  double v11;
  MUScrollableStackView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Passbook"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  v17 = objc_msgSend(v4, "copy");

  v5 = -[TransitPayEducationScreenTitleView initWithTitle:]([TransitPayEducationScreenTitleView alloc], "initWithTitle:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitleView:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_contentStackView);

  contentStackView = self->_contentStackView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _assetView](self, "_assetView"));
  -[MUScrollableStackView addArrangedSubview:](contentStackView, "addArrangedSubview:", v9);

  -[MUScrollableStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_primaryLabel);
  -[MUScrollableStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_secondaryLabel);
  Double = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenSpacingAfterMainImage, off_1014B4448);
  v11 = Double * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenSpacingAfterMainImageMultiplier, off_1014B4458);
  v12 = self->_contentStackView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _assetView](self, "_assetView"));
  -[MUScrollableStackView setCustomSpacing:afterView:](v12, "setCustomSpacing:afterView:", v13, v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _assetView](self, "_assetView"));
  objc_msgSend(v14, "addSubview:", self->_spinnerView);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", self->_footerBlurView);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_okButton);

}

- (void)_setUpConstraints
{
  double Double;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
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
  _QWORD v91[20];

  Double = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonBottomInset, off_1014B43C8);
  v4 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonBottomInsetMultiplier, off_1014B43D8);
  v5 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonHorizontalInset, off_1014B43E8);
  v6 = v5 * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonHorizontalInsetMultiplier, off_1014B43F8);
  v7 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenLabelHorizontalPadding, off_1014B4468);
  v8 = v7 * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenLabelHorizontalPaddingMultiplier, off_1014B4478);
  v58 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonTopSpacing, off_1014B4408);
  v9 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenButtonTopSpacingMultiplier, off_1014B4418);
  v10 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenPlaceholderImageAspectRatio, off_1014B4488);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController _assetView](self, "_assetView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView topAnchor](self->_contentStackView, "topAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "safeAreaLayoutGuide"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v87));
  v91[0] = v86;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView leadingAnchor](self->_contentStackView, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "safeAreaLayoutGuide"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v82));
  v91[1] = v81;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView trailingAnchor](self->_contentStackView, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "safeAreaLayoutGuide"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v77));
  v91[2] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView leadingAnchor](self->_contentStackView, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v91[3] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView trailingAnchor](self->_contentStackView, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v91[4] = v70;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView widthAnchor](self->_contentStackView, "widthAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:multiplier:", v67, 1.0 / v10));
  v91[5] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](self->_spinnerView, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerXAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v91[6] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_spinnerView, "centerYAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerYAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v91[7] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView widthAnchor](self->_spinnerView, "widthAnchor"));
  objc_msgSend(v69, "frame");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToConstant:", v11 * 0.5));
  v91[8] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView heightAnchor](self->_spinnerView, "heightAnchor"));
  objc_msgSend(v69, "frame");
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v12 * 0.5));
  v91[9] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_primaryLabel, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView widthAnchor](self->_contentStackView, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:constant:", v53, v8 * -2.0));
  v91[10] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_secondaryLabel, "widthAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView widthAnchor](self->_contentStackView, "widthAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:constant:", v50, v8 * -2.0));
  v91[11] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_footerBlurView, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v91[12] = v45;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_footerBlurView, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "safeAreaLayoutGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v41));
  v91[13] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_footerBlurView, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "safeAreaLayoutGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v36));
  v91[14] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_okButton, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "safeAreaLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v31, -(Double * v4)));
  v91[15] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_okButton, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v26, v6));
  v91[16] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_okButton, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v14, -v6));
  v91[17] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_footerBlurView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_okButton, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -(v58 * v9)));
  v91[18] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView bottomAnchor](self->_contentStackView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_okButton, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -(v58 * v9)));
  v91[19] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 20));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (id)_createContentStackView
{
  id v2;
  double Double;
  double v4;

  v2 = objc_alloc_init((Class)MUScrollableStackView);
  Double = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenStackViewSpacing, off_1014B4428);
  v4 = Double * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenStackViewSpacingMultiplier, off_1014B4438);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(v2, "setAlignment:", 3);
  objc_msgSend(v2, "setSpacing:", v4);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setClipsToBounds:", 0);
  return v2;
}

- (id)_createMainImageView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)UIImageView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setContentMode:", 2);
  return v2;
}

- (id)_createVideoView
{
  MapsLoopingVideoPlayerView *v2;

  v2 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MapsLoopingVideoPlayerView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (id)_createSpinnerView
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v2, "setColor:", v3);

  return v2;
}

- (id)_createPrimaryLabelWithText:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(v4, "setTextAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  return v4;
}

- (id)_createSecondaryLabelWithText:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(v4, "setTextAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightRegular));
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  return v4;
}

- (id)_createFooterBlurView
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6));
  v3 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v2);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v3;
}

- (id)_createOkButton
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OK [Transit + Pay Education Screen Dismissal]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, "_okPressed", 64);
  return v3;
}

- (void)_determineAssetCategory
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_assetURL, "absoluteString"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](self->_assetURL, "pathExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v5));

    if (objc_msgSend(v6, "conformsToType:", UTTypeMovie))
    {
      v7 = sub_10043253C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_assetURL, "absoluteString"));
        v18 = 138412290;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Asset is a movie and the URL is %@", (uint8_t *)&v18, 0xCu);

      }
      self->_isAssetMovie = 1;
    }
    else
    {
      v13 = objc_msgSend(v6, "conformsToType:", UTTypeImage);
      v14 = sub_10043253C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_assetURL, "absoluteString"));
          v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Asset is an image and the URL is %@", (uint8_t *)&v18, 0xCu);

        }
        self->_isAssetMovie = 0;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Received a URL with an extension that's neither a movie nor an image", (uint8_t *)&v18, 2u);
        }

      }
    }

  }
  else
  {
    v10 = sub_10043253C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_assetURL, "absoluteString"));
      v18 = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Asset is a movie because the URL length is zero: %@", (uint8_t *)&v18, 0xCu);

    }
    self->_isAssetMovie = 1;
  }
}

- (void)_loadAsset
{
  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  if (self->_isAssetMovie)
    -[TransitPayEducationScreenViewController _loadMovie](self, "_loadMovie");
  else
    -[TransitPayEducationScreenViewController _loadImage](self, "_loadImage");
}

- (void)_showMovieWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v13[1] = AVAssetReferenceRestrictionsKey;
  v14[0] = &__kCFBooleanFalse;
  v14[1] = &off_10126E728;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithData:contentType:options:](AVAsset, "assetWithData:contentType:options:", v4, AVFileTypeAppleM4V, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v6));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006CAD0C;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v10 = v7;
  v8 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_loadMovie
{
  id v3;
  NSObject *v4;
  NSURL *assetURL;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSURLSessionDataTask *v11;
  NSURLSessionDataTask *downloadTask;
  id v13;
  NSObject *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, void *);
  void *v19;
  __CFString *v20;
  id v21;
  id buf[2];

  v3 = sub_10043253C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Showing the education screen with a movie asset", (uint8_t *)buf, 2u);
  }

  assetURL = self->_assetURL;
  if (assetURL
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](assetURL, "absoluteString")),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    v8 = objc_alloc((Class)NSURLRequest);
    v9 = objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", self->_assetURL, 2, GEOConfigGetDouble(MapsConfig_TransitPayTimeoutIntervalForAssetDownload, off_1014B4378));
    objc_initWeak(buf, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_1006CAFB0;
    v19 = &unk_1011C0668;
    objc_copyWeak(&v21, buf);
    v20 = CFSTR("Transit_Pay");
    v11 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, &v16));
    downloadTask = self->_downloadTask;
    self->_downloadTask = v11;

    -[NSURLSessionDataTask resume](self->_downloadTask, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
  else
  {
    v13 = sub_10043253C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_assetURL is missing. Showing backup video.", (uint8_t *)buf, 2u);
    }

    v9 = objc_msgSend(objc_alloc((Class)NSDataAsset), "initWithName:", CFSTR("Transit_Pay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    -[TransitPayEducationScreenViewController _showMovieWithData:](self, "_showMovieWithData:", v15);

  }
}

- (void)_loadImage
{
  void *v3;
  NSURL *assetURL;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  assetURL = self->_assetURL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006CB1FC;
  v5[3] = &unk_1011C0690;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "loadAppImageAtURL:completionHandler:", assetURL, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_okPressed
{
  -[TransitPayEducationScreenViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateBlurViewVisibilityIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[MUScrollableStackView contentSize](self->_contentStackView, "contentSize");
  v4 = v3;
  -[MUScrollableStackView frame](self->_contentStackView, "frame");
  v6 = v4 - v5;
  -[MUScrollableStackView contentOffset](self->_contentStackView, "contentOffset");
  -[UIVisualEffectView setHidden:](self->_footerBlurView, "setHidden:", v7 >= v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerBlurView, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_mainImageView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

@end
