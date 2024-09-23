@implementation _RAPPrivacyInformationController

- (_RAPPrivacyInformationController)initWithCompletion:(id)a3
{
  id v4;
  _RAPPrivacyInformationController *v5;
  id v6;
  id completion;
  id v8;
  uint64_t v9;
  NSString *emailAddress;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_RAPPrivacyInformationController;
  v5 = -[_RAPPrivacyInformationController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = v6;

    v5->_isUserEnteredEmailAddress = 0;
    v8 = sub_1003DDA94();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v9;

  }
  return v5;
}

- (_RAPPrivacyInformationController)initWithCompletion:(id)a3 emailAddress:(id)a4 isUserEnteredEmailAddress:(BOOL)a5
{
  id v9;
  _RAPPrivacyInformationController *v10;
  _RAPPrivacyInformationController *v11;

  v9 = a4;
  v10 = -[_RAPPrivacyInformationController initWithCompletion:](self, "initWithCompletion:", a3);
  v11 = v10;
  if (v10)
  {
    v10->_isUserEnteredEmailAddress = a5;
    objc_storeStrong((id *)&v10->_emailAddress, a4);
  }

  return v11;
}

- (_RAPPrivacyInformationController)initWithShortcutType:(int64_t)a3 completion:(id)a4
{
  _RAPPrivacyInformationController *result;

  result = -[_RAPPrivacyInformationController initWithCompletion:](self, "initWithCompletion:", a4);
  if (result)
  {
    result->_appearance = 3;
    result->_shortcutType = a3;
  }
  return result;
}

- (_RAPPrivacyInformationController)initWithCoder:(id)a3
{
  return -[_RAPPrivacyInformationController initWithCompletion:](self, "initWithCompletion:", 0);
}

- (_RAPPrivacyInformationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_RAPPrivacyInformationController initWithCompletion:](self, "initWithCompletion:", 0, a4);
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
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
  int64_t shortcutType;
  uint64_t v18;
  UIImage *v19;
  UIImage *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  BOOL v35;
  UIImage *v36;
  UIImage *portraitIcon;
  UIImage *v38;
  UIImage *landscapeIcon;
  unsigned __int8 v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)_RAPPrivacyInformationController;
  v3 = -[_RAPPrivacyInformationController viewDidLoad](&v44, "viewDidLoad");
  if (MapsFeature_IsEnabled_RAPCommunityID(v3, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _obViewController](self, "_obViewController"));
    -[_RAPPrivacyInformationController addChildViewController:](self, "addChildViewController:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v6, "addSubview:", v7);

    objc_msgSend(v5, "didMoveToParentViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_constraintsForCenteringInView:", v10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  }
  else
  {
    -[_RAPPrivacyInformationController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
    objc_msgSend(v13, "setBackgroundColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController navigationController](self, "navigationController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v16, "setBackgroundColor:", v14);

    if (self->_appearance == 3)
    {
      shortcutType = self->_shortcutType;
      switch(shortcutType)
      {
        case 5:
          v18 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
          break;
        case 3:
          v18 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
          break;
        case 2:
          v18 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
          break;
        default:
          v18 = objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController defaultPOIStyleAttributes](self, "defaultPOIStyleAttributes"));
          break;
      }
      v27 = (void *)v18;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
      objc_msgSend(v31, "screenScale");
      v33 = v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController traitCollection](self, "traitCollection"));
      v35 = objc_msgSend(v34, "userInterfaceStyle") == (id)2;

      LOBYTE(v42) = v35;
      v36 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v27, 4, 1, 0, 0, 0, v33, v42));
      portraitIcon = self->_portraitIcon;
      self->_portraitIcon = v36;

      LOBYTE(v43) = v35;
      v38 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v27, 3, 1, 0, 0, 0, v33, v43));
      landscapeIcon = self->_landscapeIcon;
      self->_landscapeIcon = v38;

      v40 = +[RAPPrivacy hasReceivedPrivacyConsent](RAPPrivacy, "hasReceivedPrivacyConsent");
      self->_shouldShowPrivacy = v40 ^ 1;
      if ((v40 & 1) == 0 && -[NSString length](self->_emailAddress, "length"))
      {
        v41 = (sub_1003DE148() & 1) != 0 || sub_1003DE0CC(self->_emailAddress);
        self->_hasValidEmail = v41;
      }
    }
    else
    {
      v19 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPMapIcon")));
      v20 = self->_landscapeIcon;
      self->_landscapeIcon = v19;

      objc_storeStrong((id *)&self->_portraitIcon, v19);
      v21 = objc_alloc((Class)UIBarButtonItem);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Disagree [Report an Issue]"), CFSTR("localized string not found"), 0));
      v24 = objc_msgSend(v21, "initWithTitle:style:target:action:", v23, 0, self, "cancelPrivacyAgreement");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController navigationItem](self, "navigationItem"));
      objc_msgSend(v25, "setLeftBarButtonItem:", v24);

      v26 = objc_alloc((Class)UIBarButtonItem);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Agree [Report an Issue]"), CFSTR("localized string not found"), 0));
      v29 = objc_msgSend(v26, "initWithTitle:style:target:action:", v28, 0, self, "acceptPrivacyAgreement");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController navigationItem](self, "navigationItem"));
      objc_msgSend(v30, "setRightBarButtonItem:", v29);

    }
    self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled");
    -[_RAPPrivacyInformationController setupViews](self, "setupViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeDidChange:", UIContentSizeCategoryDidChangeNotification, 0);
  }

}

- (id)_obViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  const __CFString *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Report an Issue [Report an Issue]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Help improve Maps by reporting issues to Apple [Report an Issue]"), CFSTR("localized string not found"), 0));

  v7 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:symbolName:", v4, v6, CFSTR("exclamationmark.bubble.fill"));
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("RAPPrivacyConsentHeader"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonTray"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("RAPPrivacyConsentButtonTray"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Continue [Report an Issue]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v10, "setTitle:forState:", v12, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "acceptPrivacyAgreement", 64);
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("RAPPrivacyConsentAgreeButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Not Now [Report an Issue]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "cancelPrivacyAgreement", 64);
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("RAPPrivacyConsentDeclineButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonTray"));
  objc_msgSend(v16, "addButton:", v10);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonTray"));
  objc_msgSend(v17, "addButton:", v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonTray"));
  v21 = CFSTR("com.apple.onboarding.mapsrap");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v18, "setPrivacyLinkForBundles:", v19);

  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("RAPPrivacyConsentView"));
  return v7;
}

- (id)defaultPOIStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 5, 3, 6, 348, 65572, 1, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  UIImageView *iconView;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_RAPPrivacyInformationController;
  -[_RAPPrivacyInformationController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "verticalSizeClass");

  iconView = self->_iconView;
  if (iconView)
  {
    v8 = 5;
    if (v6 == (id)1)
      v8 = 6;
    -[UIImageView setImage:](iconView, "setImage:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v8]));
  }
  v9 = v6 == (id)1;
  v10 = 11;
  if (v6 == (id)1)
    v11 = 12;
  else
    v11 = 11;
  if (!v9)
    v10 = 12;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v10]));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v11]));
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_RAPPrivacyInformationController;
  -[_RAPPrivacyInformationController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  if (self->_appearance == 3)
  {
    -[UIView frame](self->_bottomView, "frame");
    v4 = v3;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    v6 = v5;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    v8 = v7;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v6, v8, v4);
  }
}

- (void)contentSizeDidChange:(id)a3
{
  int accessibilityEnabled;
  unsigned int v5;

  accessibilityEnabled = self->_accessibilityEnabled;
  v5 = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled", a3);
  self->_accessibilityEnabled = v5;
  if (accessibilityEnabled != v5)
  {
    -[_RAPPrivacyInformationController setSubtitleFont](self, "setSubtitleFont");
    -[_RAPPrivacyInformationController setSkipButtonFont](self, "setSkipButtonFont");
    -[_RAPPrivacyInformationController updateCenterYConstraintIfNeeded](self, "updateCenterYConstraintIfNeeded");
  }
}

- (id)titleFont
{
  return +[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 28.0);
}

- (void)setSubtitleFont
{
  double v3;
  id v4;

  v3 = 16.0;
  if (!self->_accessibilityEnabled)
    v3 = 17.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", v3));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

}

- (id)followUpLabelFont
{
  return +[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 17.0);
}

- (id)followUpDetailFont
{
  return +[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 12.0);
}

- (id)sendButtonFont
{
  return +[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 16.0);
}

- (void)setSkipButtonFont
{
  double v3;
  void *v4;
  id v5;

  v3 = 15.0;
  if (!self->_accessibilityEnabled)
    v3 = 16.0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_skipButton, "titleLabel"));
  objc_msgSend(v4, "setFont:", v5);

}

- (void)updateCenterYConstraintIfNeeded
{
  -[NSLayoutConstraint setActive:](self->_portraitAccessibilityConstraint, "setActive:", 0);
  if (self->_appearance == 3 && !self->_accessibilityEnabled && !self->_shouldShowPrivacy)
    -[NSLayoutConstraint setActive:](self->_portraitAccessibilityConstraint, "setActive:", 1);
}

- (void)setupViews
{
  NSMutableArray *v3;
  NSMutableArray *portraitSpecificConstraints;
  NSMutableArray *v5;
  NSMutableArray *landscapeSpecificConstraints;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  portraitSpecificConstraints = self->_portraitSpecificConstraints;
  self->_portraitSpecificConstraints = v3;

  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  landscapeSpecificConstraints = self->_landscapeSpecificConstraints;
  self->_landscapeSpecificConstraints = v5;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v8 = -[_RAPPrivacyInformationController _setupContainerViewInView:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:](self, "_setupContainerViewInView:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:", v7, v11, self->_portraitSpecificConstraints, self->_landscapeSpecificConstraints);

  if (self->_appearance == 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
    v10 = -[_RAPPrivacyInformationController _setupBottomViewInView:commonConstraints:portraitSpecificConstraints:landscapeSpecificConstraints:](self, "_setupBottomViewInView:commonConstraints:portraitSpecificConstraints:landscapeSpecificConstraints:", v9, v11, self->_portraitSpecificConstraints, self->_landscapeSpecificConstraints);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

}

- (id)_setupContainerViewInView:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
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
  _RAPPrivacyInformationController *v35;
  id v36;
  id v37;
  id v38;
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
  uint64_t v56;
  NSLayoutConstraint *portraitAccessibilityConstraint;
  NSDictionary *v58;
  void *v59;
  const __CFString *v60;
  NSDictionary *v61;
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
  _RAPPrivacyInformationController *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  id firstValue;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[2];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v91 = a3;
  v13 = objc_alloc_init((Class)UIScrollView);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  objc_msgSend(v14, "addSubview:", v13);

  objc_msgSend(v13, "setScrollEnabled:", 1);
  objc_msgSend(v13, "setShowsVerticalScrollIndicator:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "safeAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v33));
  objc_msgSend(v34, "setActive:", 1);

  v35 = self;
  objc_storeStrong((id *)&self->_scrollView, v13);
  v36 = objc_alloc_init((Class)UIView);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&v35->_containerView, v36);
  objc_msgSend(v13, "addSubview:", v36);
  v93 = v11;
  v37 = v11;
  v38 = v12;
  firstValue = (id)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController setupTitleViewsInContainer:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:](v35, "setupTitleViewsInContainer:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:", v36, v10, v37, v12));
  if (v35->_appearance == 3 && !v35->_shouldShowPrivacy)
  {
    v95 = 0;
    v39 = v10;
  }
  else
  {
    v39 = v10;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController setupContactViewsInContainer:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:](v35, "setupContactViewsInContainer:constraints:portraitSpecificConstraints:landscapeSpecificConstraints:", v36, v10, v93, v38));
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "safeAreaLayoutGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  objc_msgSend(v43, "setActive:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "safeAreaLayoutGuide"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
  objc_msgSend(v47, "setActive:", 1);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49));
  objc_msgSend(v50, "setActive:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v52));
  objc_msgSend(v53, "setActive:", 1);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
  portraitAccessibilityConstraint = v35->_portraitAccessibilityConstraint;
  v35->_portraitAccessibilityConstraint = (NSLayoutConstraint *)v56;

  -[_RAPPrivacyInformationController updateCenterYConstraintIfNeeded](v35, "updateCenterYConstraintIfNeeded");
  v92 = v36;
  v88 = v13;
  v89 = v38;
  if (v95)
  {
    v58 = _NSDictionaryOfVariableBindings(CFSTR("titleView, contactView"), firstValue, v95, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = CFSTR("V:|-40-[titleView]-40-[contactView]-|");
  }
  else
  {
    v61 = _NSDictionaryOfVariableBindings(CFSTR("titleView"), firstValue, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v60 = CFSTR("V:|-40-[titleView]-40-|");
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v60, 0, 0, v59));
  objc_msgSend(v39, "addObjectsFromArray:", v62);

  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](v35, "view"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "safeAreaLayoutGuide"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v64, 1.0));
  v97[0] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](v35, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "safeAreaLayoutGuide"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
  v84 = v35;
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v69, 1.0));
  v97[1] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 2));
  v90 = v39;
  objc_msgSend(v39, "addObjectsFromArray:", v71);

  v72 = v95;
  if (v95)
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "safeAreaLayoutGuide"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v74, 1.0));
    v96[0] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](v84, "view"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "safeAreaLayoutGuide"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "trailingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "safeAreaLayoutGuide"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v80, 1.0));
    v96[1] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 2));
    objc_msgSend(v90, "addObjectsFromArray:", v82);

    v72 = v95;
  }

  return v92;
}

- (id)setupTitleViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v8;
  id v9;
  id v10;
  UIImageView *v11;
  UIImageView *iconView;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  int64_t appearance;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  UILabel *v21;
  UILabel *subtitleLabel;
  uint64_t v23;
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
  NSDictionary *v35;
  void *v36;
  void *v37;
  NSDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSDictionary *v47;
  void *v48;
  void *v49;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)UIView);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", self->_portraitIcon);
  iconView = self->_iconView;
  self->_iconView = v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addSubview:", self->_iconView);
  v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController titleFont](self, "titleFont"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v15);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  appearance = self->_appearance;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = v17;
  if (appearance == 3)
    v19 = CFSTR("Report this Issue [Report an Issue] [Home/work Confirmation]");
  else
    v19 = CFSTR("Report an Issue [title]");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_titleLabel, "setText:", v20);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v21;

  -[_RAPPrivacyInformationController setSubtitleFont](self, "setSubtitleFont");
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  if (self->_appearance == 3)
    v23 = objc_claimAutoreleasedReturnValue(+[RAPPrivacy callToActionMessageForShortcutType:](RAPPrivacy, "callToActionMessageForShortcutType:", self->_shortcutType));
  else
    v23 = objc_claimAutoreleasedReturnValue(+[RAPPrivacy callToActionMessage](RAPPrivacy, "callToActionMessage"));
  v24 = (void *)v23;
  -[UILabel setText:](self->_subtitleLabel, "setText:", v23);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addSubview:", self->_titleLabel);
  objc_msgSend(v10, "addSubview:", self->_subtitleLabel);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_iconView, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
  objc_msgSend(v8, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_iconView, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  objc_msgSend(v8, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_subtitleLabel, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  objc_msgSend(v8, "addObject:", v34);

  v35 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), self->_titleLabel, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_titleLabel]-|"), 0, 0, v36));
  objc_msgSend(v8, "addObjectsFromArray:", v37);

  v38 = _NSDictionaryOfVariableBindings(CFSTR("_subtitleLabel"), self->_subtitleLabel, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-35-[_subtitleLabel]-35-|"), 0, 0, v39));
  objc_msgSend(v8, "addObjectsFromArray:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_iconView, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.0));
  objc_msgSend(v8, "addObject:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_iconView, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 20.0));
  objc_msgSend(v8, "addObject:", v46);

  v47 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _subtitleLabel"), self->_titleLabel, self->_subtitleLabel, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-(spacing)-[_subtitleLabel]|"), 0, &off_101274AC0, v48));
  objc_msgSend(v8, "addObjectsFromArray:", v49);

  return v10;
}

- (id)setupContactViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  NSDictionary *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  void *v28;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)UIView);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _createDetailsViewInView:constraints:](self, "_createDetailsViewInView:constraints:", v10, v8));
  v12 = _NSDictionaryOfVariableBindings(CFSTR("detailsView"), v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[detailsView]|"), 0, 0, v13));
  objc_msgSend(v8, "addObjectsFromArray:", v14);

  if (self->_isUserEnteredEmailAddress
    || !(v15 = sub_1003DE0CC(self->_emailAddress))
    || (MapsFeature_IsEnabled_RAPCommunityID(v15, v16) & 1) != 0)
  {
    v17 = _NSDictionaryOfVariableBindings(CFSTR("detailsView"), v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[detailsView]-|"), 0, 0, v18));
    objc_msgSend(v8, "addObjectsFromArray:", v19);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _createSwitchViewInView:constraints:](self, "_createSwitchViewInView:constraints:", v10, v8));
    v24 = _NSDictionaryOfVariableBindings(CFSTR("switchView"), v18, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[switchView]|"), 0, 0, v25));
    objc_msgSend(v8, "addObjectsFromArray:", v26);

    v27 = _NSDictionaryOfVariableBindings(CFSTR("switchView, detailsView"), v18, v11, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[switchView]-(spacing)-[detailsView]-|"), 0, &off_101274AE8, v19));
    objc_msgSend(v8, "addObjectsFromArray:", v28);

  }
  v20 = _NSDictionaryOfVariableBindings(CFSTR("contactView"), v10, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[contactView]-|"), 0, 0, v21));
  objc_msgSend(v8, "addObjectsFromArray:", v22);

  return v10;
}

- (id)_createSwitchViewInView:(id)a3 constraints:(id)a4
{
  id v6;
  id v7;
  UIView *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UISwitch *v16;
  UISwitch *followUpSwitch;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSDictionary *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIView *v44;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v8);

  v9 = objc_alloc_init((Class)UIView);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[UIView addSubview:](v8, "addSubview:", v9);
  v11 = objc_alloc_init((Class)UILabel);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController followUpLabelFont](self, "followUpLabelFont"));
  objc_msgSend(v11, "setFont:", v12);

  objc_msgSend(v11, "setNumberOfLines:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Follow up by email"), CFSTR("localized string not found"), 0));
  objc_msgSend(v11, "setText:", v14);

  objc_msgSend(v11, "setTextAlignment:", 4);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v11, "setTextColor:", v15);

  -[UIView addSubview:](v8, "addSubview:", v11);
  v16 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  followUpSwitch = self->_followUpSwitch;
  self->_followUpSwitch = v16;

  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_followUpSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISwitch setOn:](self->_followUpSwitch, "setOn:", 1);
  v44 = v8;
  -[UIView addSubview:](v8, "addSubview:", self->_followUpSwitch);
  v18 = objc_alloc_init((Class)UIView);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v18, "setBackgroundColor:", v19);

  -[UIView addSubview:](v8, "addSubview:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v6, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  objc_msgSend(v6, "addObject:", v27);

  v28 = _NSDictionaryOfVariableBindings(CFSTR("followUpLabel, _followUpSwitch"), v11, self->_followUpSwitch, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[followUpLabel]-(>=0)-[_followUpSwitch]-|"), 0, 0, v29));
  objc_msgSend(v6, "addObjectsFromArray:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  objc_msgSend(v6, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v6, "addObject:", v36);

  v37 = _NSDictionaryOfVariableBindings(CFSTR("topLineView, followUpLabel, bottomLineView"), v9, v11, v18, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[topLineView(1)]-(spacing)-[followUpLabel]-(spacing)-[bottomLineView(==topLineView)]|"), 0, &off_101274B10, v38));
  objc_msgSend(v6, "addObjectsFromArray:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch centerYAnchor](self->_followUpSwitch, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  objc_msgSend(v6, "addObject:", v42);

  return v44;
}

- (id)_createDetailsViewInView:(id)a3 constraints:(id)a4
{
  id v6;
  id v7;
  UIView *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *v19;
  void *v20;
  void *v21;
  UIView *v22;
  NSDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  NSDictionary *v34;
  void *v35;
  void *v36;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v8);

  v9 = _NSDictionaryOfVariableBindings(CFSTR("detailsView"), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[detailsView]|"), 0, 0, v10));
  objc_msgSend(v6, "addObjectsFromArray:", v11);

  v12 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController followUpDetailFont](self, "followUpDetailFont"));
  objc_msgSend(v12, "setFont:", v14);

  objc_msgSend(v12, "setNumberOfLines:", 0);
  if (self->_hasValidEmail)
    v15 = 4;
  else
    v15 = 1;
  objc_msgSend(v12, "setTextAlignment:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v12, "setTextColor:", v16);

  v17 = +[RAPPrivacy informationalMessageWithEmailAddress:isUserEnteredEmailAddress:isMac:](RAPPrivacy, "informationalMessageWithEmailAddress:isUserEnteredEmailAddress:isMac:", self->_emailAddress, self->_isUserEnteredEmailAddress, sub_1002A8AA0(self) == 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v12, "setText:", v18);

  -[UIView addSubview:](v8, "addSubview:", v12);
  v19 = _NSDictionaryOfVariableBindings(CFSTR("followUpDescription"), v12, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[followUpDescription]-|"), 0, 0, v20));
  objc_msgSend(v6, "addObjectsFromArray:", v21);

  v22 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v8, "addSubview:", v22);
  v23 = _NSDictionaryOfVariableBindings(CFSTR("privacyView"), v22, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[privacyView]|"), 0, 0, v24));
  objc_msgSend(v6, "addObjectsFromArray:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  -[_RAPPrivacyInformationController addChildViewController:](self, "addChildViewController:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v22, "addSubview:", v27);
  objc_msgSend(v26, "didMoveToParentViewController:", self);
  v28 = _NSDictionaryOfVariableBindings(CFSTR("privacyLinkView"), v27, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[privacyLinkView]|"), 0, 0, v29));
  objc_msgSend(v6, "addObjectsFromArray:", v30);

  v31 = _NSDictionaryOfVariableBindings(CFSTR("privacyLinkView"), v27, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[privacyLinkView]|"), 0, 0, v32));
  objc_msgSend(v6, "addObjectsFromArray:", v33);

  v34 = _NSDictionaryOfVariableBindings(CFSTR("followUpDescription, privacyView"), v12, v22, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[followUpDescription]-40-[privacyView]|"), 0, 0, v35));
  objc_msgSend(v6, "addObjectsFromArray:", v36);

  return v8;
}

- (id)_setupBottomViewInView:(id)a3 commonConstraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v10;
  id v11;
  UIView *v12;
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
  NSDictionary *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSDictionary *v40;
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
  UIView *bottomView;
  UIView *v56;
  UIView *v57;
  void *v59;
  id v60;
  id v61;

  v61 = a6;
  v60 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backgroundColor"));
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v14);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _createSendButton](self, "_createSendButton"));
  -[UIView addSubview:](v12, "addSubview:", v15);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _createSkipButton](self, "_createSkipButton"));
  -[UIView addSubview:](v12, "addSubview:", self->_skipButton);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v12, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v12, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v12, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  objc_msgSend(v27, "setActive:", 1);

  v28 = _NSDictionaryOfVariableBindings(CFSTR("sendButton"), v15, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[sendButton(288)]"), 0, 0, v29));
  objc_msgSend(v60, "addObjectsFromArray:", v30);

  v31 = _NSDictionaryOfVariableBindings(CFSTR("sendButton"), v15, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-44-[sendButton]-44-|"), 0, 0, v32));
  objc_msgSend(v61, "addObjectsFromArray:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v10, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  objc_msgSend(v10, "addObject:", v39);

  v40 = _NSDictionaryOfVariableBindings(CFSTR("sendButton"), v15, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[sendButton(50)]"), 0, 0, v41));
  objc_msgSend(v10, "addObjectsFromArray:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v12, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -25.0));
  objc_msgSend(v10, "addObject:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -20.0));
  objc_msgSend(v10, "addObject:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "lastBaselineAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v12, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -27.0));
  objc_msgSend(v10, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "widthAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  objc_msgSend(v10, "addObject:", v54);

  bottomView = self->_bottomView;
  self->_bottomView = v12;
  v56 = v12;

  v57 = self->_bottomView;
  return v57;
}

- (id)_createSendButton
{
  void *v3;
  void *v4;
  void *v5;
  UIImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t appearance;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v6 = objc_opt_new(UIImage);
  objc_msgSend(v3, "setBackgroundImage:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setTitleColor:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController sendButtonFont](self, "sendButtonFont"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(v3, "setTitleEdgeInsets:", 0.0, 10.0, 0.0, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  appearance = self->_appearance;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  if (appearance == 3)
    v14 = CFSTR("Report this issue to Apple [RAP Home/Work]");
  else
    v14 = CFSTR("Send [Report an Issue] [Confirmation]");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
  objc_msgSend(v3, "setTitle:forState:", v15, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, "_sendButtonTapped", 64);
  return v3;
}

- (id)_createSkipButton
{
  UIButton *v3;
  UIButton *skipButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t appearance;
  UIButton *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  skipButton = self->_skipButton;
  self->_skipButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_skipButton;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v6, 0);

  -[_RAPPrivacyInformationController setSkipButtonFont](self, "setSkipButtonFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_skipButton, "titleLabel"));
  objc_msgSend(v7, "setTextAlignment:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_skipButton, "titleLabel"));
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_skipButton, "titleLabel"));
  objc_msgSend(v9, "setNumberOfLines:", 0);

  appearance = self->_appearance;
  v11 = self->_skipButton;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  if (appearance == 3)
    v14 = CFSTR("Skip [Report an Issue Home/Work] [Confirmation]");
  else
    v14 = CFSTR("Skip [Report an Issue] [Confirmation]");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v11, "setTitle:forState:", v15, 0);

  -[UIButton setContentEdgeInsets:](self->_skipButton, "setContentEdgeInsets:", 15.0, 14.0, 15.0, 14.0);
  -[UIButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:", self, "_skipButtonTapped", 64);
  return self->_skipButton;
}

- (void)cancelPrivacyAgreement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPPrivacy emailAnalyticsEventForEmailAddress:isValidEmail:optedIn:](RAPPrivacy, "emailAnalyticsEventForEmailAddress:isValidEmail:optedIn:", self->_emailAddress, self->_hasValidEmail, -[UISwitch isOn](self->_followUpSwitch, "isOn")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10109, 1136, v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _maps_uiScene](self, "_maps_uiScene"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("RAPUserDidCancelPrivacyAgreementNotification"), v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BC2894;
  v8[3] = &unk_1011AC8B0;
  v8[4] = self;
  v9 = v3;
  v7 = v3;
  -[_RAPPrivacyInformationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (id)_getEvent
{
  return +[RAPPrivacy emailAnalyticsEventForEmailAddress:isValidEmail:optedIn:](RAPPrivacy, "emailAnalyticsEventForEmailAddress:isValidEmail:optedIn:", self->_emailAddress, self->_hasValidEmail, -[UISwitch isOn](self->_followUpSwitch, "isOn"));
}

- (void)acceptPrivacyAgreement
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _getEvent](self, "_getEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10110, 1136, v3);

  +[RAPPrivacy setPrivacyConsent:allowEmail:](RAPPrivacy, "setPrivacyConsent:allowEmail:", 1, -[UISwitch isOn](self->_followUpSwitch, "isOn"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BC29F8;
  v6[3] = &unk_1011AC8B0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[_RAPPrivacyInformationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)_sendButtonTapped
{
  void (**completion)(id, uint64_t, _BOOL8, id);
  _BOOL8 shouldShowPrivacy;
  id v5;

  if (self->_shouldShowPrivacy)
    +[RAPPrivacy setPrivacyConsent:allowEmail:](RAPPrivacy, "setPrivacyConsent:allowEmail:", 1, -[UISwitch isOn](self->_followUpSwitch, "isOn"));
  completion = (void (**)(id, uint64_t, _BOOL8, id))self->_completion;
  if (completion)
  {
    shouldShowPrivacy = self->_shouldShowPrivacy;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _getEvent](self, "_getEvent"));
    completion[2](completion, 1, shouldShowPrivacy, v5);

  }
}

- (void)_skipButtonTapped
{
  void (**completion)(id, _QWORD, _BOOL8, id);
  _BOOL8 shouldShowPrivacy;
  id v4;

  completion = (void (**)(id, _QWORD, _BOOL8, id))self->_completion;
  if (completion)
  {
    shouldShowPrivacy = self->_shouldShowPrivacy;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_RAPPrivacyInformationController _getEvent](self, "_getEvent"));
    completion[2](completion, 0, shouldShowPrivacy, v4);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_portraitAccessibilityConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeSpecificConstraints, 0);
  objc_storeStrong((id *)&self->_portraitSpecificConstraints, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_landscapeIcon, 0);
  objc_storeStrong((id *)&self->_portraitIcon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_followUpSwitch, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
