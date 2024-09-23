@implementation UGCCommunityAcknowledgementViewController

- (UGCCommunityAcknowledgementViewController)initWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  UGCCommunityAcknowledgementViewController *v9;
  UGCCommunityAcknowledgementViewController *v10;
  id v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UGCCommunityAcknowledgementViewController;
  v9 = -[UGCCommunityAcknowledgementViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    v11 = objc_msgSend(v8, "copy");
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UGCCommunityAcknowledgementViewController;
  -[UGCCommunityAcknowledgementViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("RAPAcknowledgementViewControllerDidAppearNotification"), self);

  if (-[UGCCommunityAcknowledgementOptions shouldDismissAutomatically](self->_options, "shouldDismissAutomatically"))
  {
    if ((objc_opt_respondsToSelector(self->_options, "timeToAutomaticDismissal") & 1) != 0)
    {
      objc_initWeak(&location, self);
      -[UGCCommunityAcknowledgementViewController _cancelDismissTimer](self, "_cancelDismissTimer");
      -[UGCCommunityAcknowledgementOptions timeToAutomaticDismissal](self->_options, "timeToAutomaticDismissal");
      v6 = v5;
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472;
      v10 = sub_1007395D0;
      v11 = &unk_1011ADF20;
      objc_copyWeak(&v12, &location);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v8, v6));
      -[UGCCommunityAcknowledgementViewController setDismissTimer:](self, "setDismissTimer:", v7, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UGCCommunityAcknowledgementViewController;
  -[UGCCommunityAcknowledgementViewController viewDidLoad](&v9, "viewDidLoad");
  -[UGCCommunityAcknowledgementViewController _setupViews](self, "_setupViews");
  -[UGCCommunityAcknowledgementViewController _setupConstraints](self, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("localized string not found"), 0));
  v7 = objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, "done");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  if (-[UGCCommunityAcknowledgementOptions acknowledgementOptionsType](self->_options, "acknowledgementOptionsType") == (id)1)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 66, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  int IsAccessibilityCategory;
  NSString *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UGCCommunityAcknowledgementViewController;
  v4 = a3;
  -[UGCCommunityAcknowledgementViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(v8);
  if (IsAccessibilityCategory != (_DWORD)v4)
    -[UGCCommunityAcknowledgementViewController _updateLayoutForCurrentContentSize](self, "_updateLayoutForCurrentContentSize");
}

- (void)_setupViews
{
  UIVisualEffectView *v3;
  UIVisualEffectView *blurView;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UIScrollView *v10;
  UIScrollView *scrollView;
  void *v12;
  MUStackView *v13;
  MUStackView *stackView;
  PersonalizedImageView *v15;
  PersonalizedImageView *personalizedMapIconView;
  UILabel *v17;
  UILabel *titleLabel;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *messageLabel;
  void *v23;
  void *v24;
  Block_layout *v25;
  id v26;
  unsigned int v27;
  UILabel *v28;
  UILabel *internalUILabel;
  void *v30;
  void *v31;
  UITextView *v32;
  UITextView *linkTextView;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  MapsThemeButton *v39;
  MapsThemeButton *primaryButton;
  MapsThemeButton *v41;
  void *v42;
  id v43;

  v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  blurView = self->_blurView;
  self->_blurView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_blurView);

  v6 = objc_alloc((Class)UIScrollView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (UIScrollView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_scrollView);

  v13 = (MUStackView *)objc_msgSend(objc_alloc((Class)MUStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  stackView = self->_stackView;
  self->_stackView = v13;

  -[MUStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[MUStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_stackView);
  v43 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPMapIcon")));
  v15 = -[PersonalizedImageView initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:]([PersonalizedImageView alloc], "initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:", v43, 100.0, 100.0, 44.0, 10.0);
  personalizedMapIconView = self->_personalizedMapIconView;
  self->_personalizedMapIconView = v15;

  -[PersonalizedImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_personalizedMapIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUStackView addArrangedSubview:withCustomSpacing:](self->_stackView, "addArrangedSubview:withCustomSpacing:", self->_personalizedMapIconView, 20.0);
  v17 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v17;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementOptions title](self->_options, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v20);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, &stru_1011E7B98);
  -[MUStackView addArrangedSubview:withCustomSpacing:](self->_stackView, "addArrangedSubview:withCustomSpacing:", self->_titleLabel, 4.0);
  v21 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v21;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementOptions message](self->_options, "message"));
  -[UILabel setText:](self->_messageLabel, "setText:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v24);

  if (sub_1002A8AA0(self) == 5)
    v25 = &stru_1011E7A38;
  else
    v25 = &stru_1011E7A78;
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_messageLabel, v25);
  -[MUStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_messageLabel);
  v26 = (id)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v26, "isInternalInstall")
    && GEOConfigGetBOOL(MapsConfig_ShowRAPFeedbackPortalInternalUI, off_1014B3388)
    && (objc_opt_respondsToSelector(self->_options, "showsInternalStatusLink") & 1) != 0)
  {
    v27 = -[UGCCommunityAcknowledgementOptions showsInternalStatusLink](self->_options, "showsInternalStatusLink");

    if (!v27)
      goto LABEL_10;
    v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    internalUILabel = self->_internalUILabel;
    self->_internalUILabel = v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_internalUILabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_internalUILabel, "setTextColor:", v30);

    -[UILabel setNumberOfLines:](self->_internalUILabel, "setNumberOfLines:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system12Bold](UIFont, "system12Bold"));
    -[UILabel setFont:](self->_internalUILabel, "setFont:", v31);

    -[UILabel setText:](self->_internalUILabel, "setText:", CFSTR("INTERNAL UI ONLY"));
    v32 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    linkTextView = self->_linkTextView;
    self->_linkTextView = v32;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_linkTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_linkTextView, "setBackgroundColor:", v34);

    -[UITextView setTextAlignment:](self->_linkTextView, "setTextAlignment:", 1);
    -[UITextView setDataDetectorTypes:](self->_linkTextView, "setDataDetectorTypes:", 2);
    -[UITextView setUserInteractionEnabled:](self->_linkTextView, "setUserInteractionEnabled:", 1);
    -[UITextView setSelectable:](self->_linkTextView, "setSelectable:", 1);
    -[UITextView setEditable:](self->_linkTextView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](self->_linkTextView, "setScrollEnabled:", 0);
    v26 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", CFSTR("View internal report status"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://feedback.geo.apple.com")));
    objc_msgSend(v26, "addAttribute:value:range:", NSLinkAttributeName, v35, 0, objc_msgSend(v26, "length"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    objc_msgSend(v26, "addAttribute:value:range:", NSFontAttributeName, v36, 0, objc_msgSend(v26, "length"));

    -[UITextView setAttributedText:](self->_linkTextView, "setAttributedText:", v26);
    -[MUStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_messageLabel, 20.0);
    -[MUStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_internalUILabel);
    -[MUStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_linkTextView);
  }

LABEL_10:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementOptions primaryButtonTitle](self->_options, "primaryButtonTitle"));
  v38 = objc_msgSend(v37, "length");

  if (v38)
  {
    v39 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    primaryButton = self->_primaryButton;
    self->_primaryButton = v39;

    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeButton setTitleColorProvider:](self->_primaryButton, "setTitleColorProvider:", &stru_1011C5120);
    -[MapsThemeButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, "done", 64);
    v41 = self->_primaryButton;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementOptions primaryButtonTitle](self->_options, "primaryButtonTitle"));
    -[MapsThemeButton setTitle:forState:](v41, "setTitle:forState:", v42, 0);

    -[MUStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_primaryButton);
  }

}

- (void)_setupConstraints
{
  id v3;
  UIVisualEffectView *blurView;
  void *v5;
  id v6;
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
  id v17;
  MUStackView *stackView;
  double v19;
  MUSizeLayout *v20;
  MUSizeLayout *stackSizeLayout;
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
  _QWORD v57[11];
  id v58;

  v3 = objc_alloc((Class)MUEdgeLayout);
  blurView = self->_blurView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v6 = objc_msgSend(v3, "initWithItem:container:", blurView, v5);
  v58 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v7);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "safeAreaLayoutGuide"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v53));
  v57[0] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v57[1] = v48;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v57[2] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v57[3] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v36));
  v57[4] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView centerYAnchor](self->_stackView, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v57[5] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView topAnchor](self->_stackView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v28));
  v57[6] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v24));
  v57[7] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView centerXAnchor](self->_stackView, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v8));
  v57[8] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 16.0));
  v57[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", v14, -16.0));
  v57[10] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  v17 = objc_alloc((Class)MUSizeLayout);
  stackView = self->_stackView;
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v20 = (MUSizeLayout *)objc_msgSend(v17, "initWithItem:size:", stackView, 240.0, v19);
  stackSizeLayout = self->_stackSizeLayout;
  self->_stackSizeLayout = v20;

  -[UGCCommunityAcknowledgementViewController _updateLayoutForCurrentContentSize](self, "_updateLayoutForCurrentContentSize");
}

- (void)_updateLayoutForCurrentContentSize
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  MUSizeLayout *v7;
  MUSizeLayout *stackSizeLayout;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    stackSizeLayout = self->_stackSizeLayout;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stackSizeLayout, 1));
    +[NSLayoutConstraint _mapsui_deactivateLayouts:](NSLayoutConstraint, "_mapsui_deactivateLayouts:", v6);
  }
  else
  {
    v7 = self->_stackSizeLayout;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v6);
  }

}

- (void)_addFooterView
{
  MacFooterView *v3;
  void *v4;
  void *v5;
  void *v6;
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
  _QWORD v28[4];

  v3 = -[MacFooterView initWithNoBlurRightSideButtonsOfType:]([MacFooterView alloc], "initWithNoBlurRightSideButtonsOfType:", 8);
  -[UGCCommunityAcknowledgementViewController setFooterView:](self, "setFooterView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  objc_msgSend(v6, "addSubview:", v7);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v25));
  v28[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v28[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v28[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController footerView](self, "footerView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v28[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_cancelDismissTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController dismissTimer](self, "dismissTimer"));
  objc_msgSend(v3, "invalidate");

  -[UGCCommunityAcknowledgementViewController setDismissTimer:](self, "setDismissTimer:", 0);
}

- (void)done
{
  void *v3;
  void *v4;
  void (**v5)(void);

  if (!self->_didRunCompletion)
  {
    self->_didRunCompletion = 1;
    -[UGCCommunityAcknowledgementViewController _cancelDismissTimer](self, "_cancelDismissTimer");
    if (-[UGCCommunityAcknowledgementOptions acknowledgementOptionsType](self->_options, "acknowledgementOptionsType") == (id)1)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 66, 0);
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10110, -[UGCCommunityAcknowledgementViewController analyticTarget](self, "analyticTarget"), 0);

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController completion](self, "completion"));

    if (v4)
    {
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController completion](self, "completion"));
      v5[2]();

    }
  }
}

- (int)analyticTarget
{
  return 1137;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 1;
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[UGCCommunityAcknowledgementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UGCCommunityAcknowledgementOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (MacFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_stackSizeLayout, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_linkTextView, 0);
  objc_storeStrong((id *)&self->_internalUILabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_personalizedMapIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
