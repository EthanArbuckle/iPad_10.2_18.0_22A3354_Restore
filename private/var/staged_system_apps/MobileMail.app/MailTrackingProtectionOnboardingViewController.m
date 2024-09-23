@implementation MailTrackingProtectionOnboardingViewController

- (void)viewDidLoad
{
  MailTrackingProtectionOnboardingTableViewCellViewModel *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  MailTrackingProtectionOnboardingTableViewCellViewModel *v9;
  MailTrackingProtectionOnboardingTableViewCellViewModel *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  MailTrackingProtectionOnboardingTableViewCellViewModel *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  -[MailTrackingProtectionOnboardingViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[MailTrackingProtectionOnboardingViewController _configureOnboardingViewController](self, "_configureOnboardingViewController");
  v3 = [MailTrackingProtectionOnboardingTableViewCellViewModel alloc];
  v4 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_PROTECT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_PROTECT_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphProtectedEnvelope));
  v9 = -[MailTrackingProtectionOnboardingTableViewCellViewModel initWithTitle:detail:image:isSelected:preventTracking:accessibilityIdentifier:](v3, "initWithTitle:detail:image:isSelected:preventTracking:accessibilityIdentifier:", v5, v7, v8, 0, 1, CFSTR("MAIL_PRIVACY_PROTECTION_ENABLE"));
  v22[0] = v9;
  v10 = [MailTrackingProtectionOnboardingTableViewCellViewModel alloc];
  v11 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_ALLOW_TRACKING_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_ALLOW_TRACKING_DETAIL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphOpenEnvelope));
  v16 = -[MailTrackingProtectionOnboardingTableViewCellViewModel initWithTitle:detail:image:isSelected:preventTracking:accessibilityIdentifier:](v10, "initWithTitle:detail:image:isSelected:preventTracking:accessibilityIdentifier:", v12, v14, v15, 0, 0, CFSTR("MAIL_PRIVACY_PROTECTION_DISABLE"));
  v22[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  -[MailTrackingProtectionOnboardingViewController setViewModels:](self, "setViewModels:", v17);

  v18 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  objc_msgSend(v18, "appendSectionsWithIdentifiers:", &off_1005421A8);
  objc_msgSend(v18, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &off_1005421C0, &off_1005417A0);
  objc_msgSend(v18, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &off_1005421D8, &off_1005417B8);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController dataSource](self, "dataSource"));
  objc_msgSend(v19, "applySnapshot:animatingDifferences:", v18, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "_appDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController welcomeController](self, "welcomeController"));
  objc_msgSend(v21, "setModalPresentationStyle:", 2);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MailTrackingProtectionOnboardingViewController;
  -[MailTrackingProtectionOnboardingViewController dealloc](&v4, "dealloc");
}

- (void)_configureOnboardingViewController
{
  MailTrackingProtectionOnboardingViewControllerValues *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  id v39;
  void *v40;
  id v41;
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
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59[2];
  _QWORD v60[4];
  id v61;
  id location;
  _QWORD v63[5];

  v4 = objc_alloc_init(MailTrackingProtectionOnboardingViewControllerValues);
  -[MailTrackingProtectionOnboardingViewController setValues:](self, "setValues:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "icon"));

  v6 = objc_alloc((Class)OBWelcomeController);
  v7 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_DETAIL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v6, "initWithTitle:detailText:icon:contentLayout:", v8, v10, v47, 2);

  v50 = v11;
  -[MailTrackingProtectionOnboardingViewController setWelcomeController:](self, "setWelcomeController:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "learnMoreButton"));

  v13 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_LEARN_MORE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v48, "setTitle:forState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
  objc_msgSend(v15, "addAccessoryButton:", v48);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000FDF4C;
  v60[3] = &unk_10051D178;
  objc_copyWeak(&v61, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v60));
  objc_msgSend(v48, "addAction:forControlEvents:", v16, 64);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  objc_msgSend(v49, "setEnabled:", 0);
  v17 = sub_1000FD4F8(CFSTR("MAIL_TRACKING_PROTECTION_CONTINUE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v49, "setTitle:forState:", v18, 0);

  -[MailTrackingProtectionOnboardingViewController setContinueButton:](self, "setContinueButton:", v49);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000FE13C;
  v58[3] = &unk_10051ED00;
  objc_copyWeak(v59, &location);
  v59[1] = (id)a2;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v58));
  objc_msgSend(v49, "addAction:forControlEvents:", v19, 0x2000);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonTray"));
  objc_msgSend(v20, "addButton:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController _configuredCollectionView](self, "_configuredCollectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  objc_msgSend(v21, "addSubview:", v51);

  -[MailTrackingProtectionOnboardingViewController setCollectionView:](self, "setCollectionView:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "heightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 50.0));
  -[MailTrackingProtectionOnboardingViewController setCollectionViewHeightConstraint:](self, "setCollectionViewHeightConstraint:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  objc_msgSend(v25, "widthConstant");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:"));
  -[MailTrackingProtectionOnboardingViewController setCollectionViewWidthConstraint:](self, "setCollectionViewWidthConstraint:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  objc_msgSend(v30, "topConstant");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29));

  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v63[0] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", -50.0));
  v63[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  v63[2] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint"));
  v63[3] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController collectionViewWidthConstraint](self, "collectionViewWidthConstraint"));
  v63[4] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000FE3A8;
  v55[3] = &unk_10051AD90;
  objc_copyWeak(&v57, &location);
  v39 = v51;
  v56 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", CFSTR("contentSize"), 1, 1, v55));
  -[MailTrackingProtectionOnboardingViewController setContentSizeObserver:](self, "setContentSizeObserver:", v40);

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000FE4BC;
  v52[3] = &unk_10051AD90;
  objc_copyWeak(&v54, &location);
  v41 = v49;
  v53 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", CFSTR("bounds"), 1, 1, v52));
  -[MailTrackingProtectionOnboardingViewController setButtonBoundsObserver:](self, "setButtonBoundsObserver:", v42);

  -[MailTrackingProtectionOnboardingViewController _configureChildViewController:](self, "_configureChildViewController:", v50);
  objc_destroyWeak(&v54);

  objc_destroyWeak(&v57);
  objc_destroyWeak(v59);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

}

- (void)_configureChildViewController:(id)a3
{
  id v4;
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
  void *v28;
  _QWORD v29[4];

  v4 = a3;
  -[MailTrackingProtectionOnboardingViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "addSubview:", v6);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:"));
  v29[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:"));
  v29[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v8));
  v29[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v29[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (id)_configuredCollectionView
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  MailTrackingProtectionOnboardingViewController *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", &stru_10051ED40);
  v4 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setScrollEnabled:", 0);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_opt_class(_UICollectionViewListCell);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000FED14;
  v18[3] = &unk_10051ED68;
  objc_copyWeak(&v19, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v5, v18));
  v7 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000FED94;
  v15 = &unk_10051ED90;
  v8 = v6;
  v16 = v8;
  v17 = self;
  v9 = objc_msgSend(v7, "initWithCollectionView:cellProvider:", v4, &v12);
  -[MailTrackingProtectionOnboardingViewController setDataSource:](self, "setDataSource:", v9, v12, v13, v14, v15);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "setDataSource:", v10);

  objc_msgSend(v4, "setDelegate:", self);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v4;
}

- (void)_configureCell:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
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
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isSelected"))
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor")));
  else
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color")));
  v9 = objc_msgSend(v8, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v10, "setBorderColor:", v9);

  v11 = objc_msgSend(v7, "isSelected");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  v13 = v12;
  v14 = 1.0;
  if (v11)
    v14 = 2.0;
  objc_msgSend(v12, "setBorderWidth:", v14);

  v15 = objc_alloc_init((Class)_UICellAccessoryConfigurationMultiselect);
  v41 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  objc_msgSend(v6, "setTrailingAccessoryConfigurations:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cellConfiguration"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  objc_msgSend(v18, "setText:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryTextFont"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textProperties"));
  objc_msgSend(v22, "setFont:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detail"));
  objc_msgSend(v18, "setSecondaryText:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "secondaryTextPropertiesColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
  objc_msgSend(v26, "setColor:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "secondaryTextPropertiesFont"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
  objc_msgSend(v29, "setFont:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  objc_msgSend(v18, "setImage:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController values](self, "values"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "imageSymbolConfiguration"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageProperties"));
  objc_msgSend(v33, "setPreferredSymbolConfiguration:", v32);

  objc_msgSend(v18, "setImageToTextPadding:", 28.0);
  objc_msgSend(v18, "directionalLayoutMargins");
  objc_msgSend(v18, "setDirectionalLayoutMargins:", 14.0, 26.0, 14.0);
  objc_msgSend(v18, "setTextToSecondaryTextVerticalPadding:", 2.0);
  objc_msgSend(v6, "setContentConfiguration:", v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityIdentifier"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundConfiguration"));
  v36 = objc_msgSend(v35, "copy");
  v37 = v36;
  if (v36)
    v38 = v36;
  else
    v38 = (id)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v39 = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v39, "setBackgroundColor:", v40);

  objc_msgSend(v6, "setBackgroundConfiguration:", v39);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController selectedIndexPath](self, "selectedIndexPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController selectedIndexPath](self, "selectedIndexPath"));
    -[MailTrackingProtectionOnboardingViewController _updateSelectionForCellAtIndexPath:isSelected:](self, "_updateSelectionForCellAtIndexPath:isSelected:", v6, 0);

  }
  -[MailTrackingProtectionOnboardingViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v8);
  -[MailTrackingProtectionOnboardingViewController _updateSelectionForCellAtIndexPath:isSelected:](self, "_updateSelectionForCellAtIndexPath:isSelected:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController continueButton](self, "continueButton"));
  objc_msgSend(v7, "setEnabled:", 1);

}

- (void)_updateSelectionForCellAtIndexPath:(id)a3 isSelected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = sub_1000FE31C(self, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setSelected:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailTrackingProtectionOnboardingViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v10));

  -[MailTrackingProtectionOnboardingViewController _configureCell:viewModel:](self, "_configureCell:viewModel:", v9, v7);
}

- (void)_appDidBecomeActive:(id)a3
{
  unsigned __int8 v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults", a3));
  v4 = objc_msgSend(v5, "shouldPresentRemoteContentOptionsSheet");

  if ((v4 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MailTrackingProtectionOnboardingViewControllerDidCompleteNotification"), self);

  }
}

- (OBWelcomeController)welcomeController
{
  return (OBWelcomeController *)objc_loadWeakRetained((id *)&self->_welcomeController);
}

- (void)setWelcomeController:(id)a3
{
  objc_storeWeak((id *)&self->_welcomeController, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (OBTrayButton)continueButton
{
  return (OBTrayButton *)objc_loadWeakRetained((id *)&self->_continueButton);
}

- (void)setContinueButton:(id)a3
{
  objc_storeWeak((id *)&self->_continueButton, a3);
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, a3);
}

- (NSLayoutConstraint)collectionViewWidthConstraint
{
  return self->_collectionViewWidthConstraint;
}

- (void)setCollectionViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewWidthConstraint, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (EFCancelable)contentSizeObserver
{
  return self->_contentSizeObserver;
}

- (void)setContentSizeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeObserver, a3);
}

- (EFCancelable)buttonBoundsObserver
{
  return self->_buttonBoundsObserver;
}

- (void)setButtonBoundsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBoundsObserver, a3);
}

- (MailTrackingProtectionOnboardingViewControllerValues)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_buttonBoundsObserver, 0);
  objc_storeStrong((id *)&self->_contentSizeObserver, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_welcomeController);
}

@end
