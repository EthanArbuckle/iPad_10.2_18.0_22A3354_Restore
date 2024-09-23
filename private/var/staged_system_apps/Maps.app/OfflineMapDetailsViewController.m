@implementation OfflineMapDetailsViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (OfflineMapDetailsViewController)initWithSubscriptionInfo:(id)a3
{
  id v5;
  OfflineMapDetailsViewController *v6;
  OfflineMapDetailsViewController *v7;
  id v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OfflineMapDetailsViewController;
  v6 = -[OfflineMapDetailsViewController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    v8 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    -[OfflineMapDetailsViewController setSubscriptionManager:](v7, "setSubscriptionManager:", v8);

  }
  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfflineMapDetailsViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[OfflineMapDetailsViewController _setupViews](self, "_setupViews");
  -[OfflineMapDetailsViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapDetailsViewController;
  -[ContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  objc_msgSend(v4, "addObserver:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapDetailsViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_setupViews
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ModalCardHeaderView *v8;
  void *v9;
  ModalCardHeaderView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  OfflineMapDetailsSectionController *v46;
  void *v47;
  OfflineMapDetailsSectionController *v48;
  void *v49;
  void *v50;
  OfflineMapDeviceDetailsSectionController *v51;
  void *v52;
  OfflineMapDeviceDetailsSectionController *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  OfflineMapFooterActionsSectionController *v60;
  void *v61;
  OfflineMapFooterActionsSectionController *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *i;
  MUScrollableStackView *contentStackView;
  void *v71;
  void *v72;
  MUScrollableStackView *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  MUScrollableStackView *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  _BYTE v115[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setPresentedModally:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setTakesAvailableHeight:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = [ModalCardHeaderView alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v10 = -[ModalCardHeaderView initWithConfiguration:](v8, "initWithConfiguration:", v9);
  -[OfflineMapDetailsViewController setTitleHeaderView:](self, "setTitleHeaderView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subscription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
  v15 = objc_msgSend(v14, "length");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subscription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v18, "setTitle:", v17);

  if (v15)
  {

    v17 = v2;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "titleLabel"));
  objc_msgSend(v20, "setAlpha:", 0.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomHairline"));
  objc_msgSend(v22, "setAlpha:", 0.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v23, "setUseAdaptiveFont:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
  objc_msgSend(v25, "setAccessibilityElementsHidden:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
  objc_msgSend(v27, "setAccessibilityElementsHidden:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingButton"));
  v30 = sub_1009A992C();
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v29, "setTitle:forState:", v31, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingButton"));
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, "_dismiss", 0x2000);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v34, "addSubview:", v35);

  v36 = objc_msgSend(objc_alloc((Class)MUScrollableStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[OfflineMapDetailsViewController setContentStackView:](self, "setContentStackView:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v38, "setSpacing:", 16.0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v39, "setAlwaysBounceVertical:", 1);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v40, "setScrollEnabled:", 1);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v41, "setDelegate:", self);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v42, "setClipsToBounds:", 0);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v43, "addSubview:", v44);

  v45 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v46 = [OfflineMapDetailsSectionController alloc];
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
  v48 = -[OfflineMapDetailsSectionController initWithSubscriptionInfo:](v46, "initWithSubscriptionInfo:", v47);
  -[OfflineMapDetailsViewController setDetailsSectionController:](self, "setDetailsSectionController:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController detailsSectionController](self, "detailsSectionController"));
  objc_msgSend(v49, "setActionDelegate:", self);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController detailsSectionController](self, "detailsSectionController"));
  objc_msgSend(v45, "addObject:", v50);

  v51 = [OfflineMapDeviceDetailsSectionController alloc];
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
  v53 = -[OfflineMapDeviceDetailsSectionController initWithSubscriptionInfo:](v51, "initWithSubscriptionInfo:", v52);
  -[OfflineMapDetailsViewController setCurrentDeviceDetailsController:](self, "setCurrentDeviceDetailsController:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lastUpdatedDate"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
  objc_msgSend(v56, "setLastUpdatedDate:", v55);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
  objc_msgSend(v45, "addObject:", v57);

  -[OfflineMapDetailsViewController _updateActiveWatchSection:](self, "_updateActiveWatchSection:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
    objc_msgSend(v45, "addObject:", v59);

  }
  v60 = [OfflineMapFooterActionsSectionController alloc];
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
  v62 = -[OfflineMapFooterActionsSectionController initWithSubscriptionInfo:](v60, "initWithSubscriptionInfo:", v61);
  -[OfflineMapDetailsViewController setFooterSectionController:](self, "setFooterSectionController:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController footerSectionController](self, "footerSectionController"));
  objc_msgSend(v63, "setActionDelegate:", self);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController footerSectionController](self, "footerSectionController"));
  objc_msgSend(v45, "addObject:", v64);

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v65 = v45;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(_QWORD *)v111 != v68)
          objc_enumerationMutation(v65);
        contentStackView = self->_contentStackView;
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i), "sectionView"));
        -[MUScrollableStackView addArrangedSubview:](contentStackView, "addArrangedSubview:", v71);

      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
    }
    while (v67);
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
  if (v72)
  {
    v73 = self->_contentStackView;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "sectionView"));
    -[MUScrollableStackView setCustomSpacing:afterView:](v73, "setCustomSpacing:afterView:", v75, 24.0);

  }
  if (GEOConfigGetBOOL(MapsConfig_OfflineRegionDetailsShowFooterText, off_1014B5058))
  {
    v76 = objc_alloc_init((Class)UIView);
    v77 = objc_alloc_init((Class)UILabel);
    -[OfflineMapDetailsViewController setLegalDisclaimerLabel:](self, "setLegalDisclaimerLabel:", v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleFootnote, 0));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v79, "setFont:", v78);

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v81, "setTextColor:", v80);

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v82, "setNumberOfLines:", 0);

    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("REGION_DETAILS_FOOTER_TEXT"), CFSTR("localized string not found"), CFSTR("Offline")));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v85, "setText:", v84);

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    objc_msgSend(v76, "addSubview:", v87);

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "topAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v107));
    v114[0] = v106;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v103, 32.0));
    v114[1] = v102;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
    v88 = v76;
    v101 = v76;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v89, -32.0));
    v114[2] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController legalDisclaimerLabel](self, "legalDisclaimerLabel"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bottomAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v93));
    v114[3] = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v95);

    -[MUScrollableStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", v101);
    v96 = self->_contentStackView;
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "lastObject"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "sectionView"));
    -[MUScrollableStackView setCustomSpacing:afterView:](v96, "setCustomSpacing:afterView:", v98, 8.0);

  }
  -[OfflineMapDetailsViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("OfflineMapDetailsView"));

}

- (void)_updateActiveWatchSection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  MUScrollableStackView *contentStackView;
  void *v8;
  void *v9;
  MUScrollableStackView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  OfflineMapPairedDeviceDetailsSectionController *v16;
  void *v17;
  OfflineMapPairedDeviceDetailsSectionController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  MUScrollableStackView *v27;
  void *v28;
  void *v29;
  MUScrollableStackView *v30;
  void *v31;
  void *v32;
  MUScrollableStackView *v33;
  void *v34;
  void *v35;
  id v36;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));

    if (v5)
    {
      contentStackView = self->_contentStackView;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionView"));
      -[MUScrollableStackView removeArrangedSubview:](contentStackView, "removeArrangedSubview:", v9);

    }
    if ((MapsFeature_IsEnabled_StandaloneWatchOffline(v6) & 1) == 0)
    {
      v10 = self->_contentStackView;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionView"));
      -[MUScrollableStackView setCustomSpacing:afterView:](v10, "setCustomSpacing:afterView:", v12, 3.40282347e38);

LABEL_11:
      -[OfflineMapDetailsViewController setActiveWatchDetailsController:](self, "setActiveWatchDetailsController:", 0);
      return;
    }
  }
  else if ((MapsFeature_IsEnabled_StandaloneWatchOffline(self) & 1) == 0)
  {
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getActivePairedDeviceExcludingAltAccount"));

  if (v36
    && (v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D")), v15 = objc_msgSend(v36, "supportsCapability:", v14), v14, v15))
  {
    v16 = [OfflineMapPairedDeviceDetailsSectionController alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v18 = -[OfflineMapPairedDeviceDetailsSectionController initWithSubscriptionInfo:device:](v16, "initWithSubscriptionInfo:device:", v17, v36);
    -[OfflineMapDetailsViewController setActiveWatchDetailsController:](self, "setActiveWatchDetailsController:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
    objc_msgSend(v19, "setActionDelegate:", self);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastUpdatedDateForPairedDevice"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
    objc_msgSend(v22, "setLastUpdatedDate:", v21);

    if (v3)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sectionView"));
      v26 = (char *)objc_msgSend(v23, "indexOfObject:", v25) + 1;

      v27 = self->_contentStackView;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "sectionView"));
      -[MUScrollableStackView insertArrangedSubview:atIndex:](v27, "insertArrangedSubview:atIndex:", v29, v26);

      v30 = self->_contentStackView;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sectionView"));
      -[MUScrollableStackView setCustomSpacing:afterView:](v30, "setCustomSpacing:afterView:", v32, 24.0);

    }
  }
  else
  {
    if (v3)
    {
      v33 = self->_contentStackView;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sectionView"));
      -[MUScrollableStackView setCustomSpacing:afterView:](v33, "setCustomSpacing:afterView:", v35, 3.40282347e38);

    }
    -[OfflineMapDetailsViewController setActiveWatchDetailsController:](self, "setActiveWatchDetailsController:", 0);
  }

}

- (void)_setupConstraints
{
  void *v3;
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
  _QWORD v44[8];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v44[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v44[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v44[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v44[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v44[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v44[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v44[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController contentStackView](self, "contentStackView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v44[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_dismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController delegate](self, "delegate"));
  objc_msgSend(v2, "closeOfflineMapDetails");

}

- (void)_updateCurrentSubscriptionInfo:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscription"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
        {
          -[OfflineMapDetailsViewController setSubscriptionInfo:](self, "setSubscriptionInfo:", v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setSubscriptionInfo:(id)a3
{
  void *v3;
  MapDataSubscriptionInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  MapDataSubscriptionInfo *v22;

  v6 = (MapDataSubscriptionInfo *)a3;
  if (self->_subscriptionInfo != v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
    v10 = objc_msgSend(v9, "length");
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subscription"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v13, "setTitle:", v12);

    if (v10)
    {

      v12 = v3;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController detailsSectionController](self, "detailsSectionController"));
    objc_msgSend(v15, "setSubscriptionInfo:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
    objc_msgSend(v17, "setSubscriptionInfo:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
    objc_msgSend(v19, "setSubscriptionInfo:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController footerSectionController](self, "footerSectionController"));
    objc_msgSend(v21, "setSubscriptionInfo:", v20);

    v6 = v22;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double MinY;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  _QWORD v22[5];
  BOOL v23;
  CGRect v24;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v7 = objc_msgSend(v4, "clipsToBounds");
  if (v6 <= 0.0)
  {
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((v7 & 1) == 0)
LABEL_5:
    objc_msgSend(v4, "setClipsToBounds:", v6 > 0.0);
LABEL_6:
  objc_msgSend(v4, "contentOffset");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v10, "setScrollViewOffset:", v9);

  objc_msgSend(v4, "contentOffset");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController detailsSectionController](self, "detailsSectionController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionView"));
  objc_msgSend(v14, "frame");
  MinY = CGRectGetMinY(v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController detailsSectionController](self, "detailsSectionController"));
  objc_msgSend(v16, "regionNameBottomOffsetFromTop");
  v18 = MinY + v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController titleHeaderView](self, "titleHeaderView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "titleLabel"));
  objc_msgSend(v20, "alpha");
  LODWORD(v16) = v21 <= 0.0;

  if ((((v12 >= v18) ^ v16) & 1) == 0)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100A15A4C;
    v22[3] = &unk_1011ACE58;
    v22[4] = self;
    v23 = v12 >= v18;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v22, 0.2);
  }

}

- (void)offlineMapDetailsActionSectionControllerDidSelectDeleteMap:(id)a3
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
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionInfo](self, "subscriptionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscription"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedDeviceState"));
  if (!v10)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getActivePairedDevice"));

  if (!v12)
    goto LABEL_7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", NRDevicePropertyName));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DELETE_OFFLINE_MAP_CONFIRMATION_MESSAGE_PAIRED_DEVICE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v31, v17, v13));

  if (!v18)
  {
LABEL_7:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE_OFFLINE_MAP_CONFIRMATION_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v31));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DELETE_OFFLINE_MAP_CONFIRMATION_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v22, v18, 1));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("DELETE_OFFLINE_MAP_CONFIRMATION_ACTION_CANCEL"), CFSTR("localized string not found"), CFSTR("Offline")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 1, 0));

  objc_msgSend(v23, "addAction:", v26);
  objc_initWeak(&location, self);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETE_OFFLINE_MAP_CONFIRMATION_ACTION_DELETE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100A15F08;
  v32[3] = &unk_1011D9DC8;
  objc_copyWeak(&v34, &location);
  v29 = v4;
  v33 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 2, v32));

  objc_msgSend(v23, "addAction:", v30);
  objc_msgSend(v23, "setPreferredAction:", v30);
  -[OfflineMapDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectRenameMap:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController delegate](self, "delegate"));
  objc_msgSend(v8, "presentRenameOfflineMapForSubscriptionInfo:completionHandler:", v7, v6);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectResizeMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController delegate](self, "delegate"));
  objc_msgSend(v5, "presentOfflineMapRegionSelectorForSubscriptionInfo:", v4);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectPauseDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionManager](self, "subscriptionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v7, "cancelDownloadForSubscriptionIdentifier:", v6);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectAddToPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionManager](self, "subscriptionManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A16330;
  v9[3] = &unk_1011B1BE0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:", v7, 1, &_dispatch_main_q, v9);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectRemoveFromPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionManager](self, "subscriptionManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A164C4;
  v9[3] = &unk_1011B1BE0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:", v7, 0, &_dispatch_main_q, v9);

}

- (void)offlineMapDetailsActionSectionControllerDidSelectDownloadNowOnPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController subscriptionManager](self, "subscriptionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v7, "startDownloadForPairedDeviceSubscriptionIdentifier:mode:", v6, 1);

}

- (void)subscriptionInfosDidChange:(id)a3
{
  -[OfflineMapDetailsViewController _updateCurrentSubscriptionInfo:](self, "_updateCurrentSubscriptionInfo:", a3);
}

- (void)lastUpdatedDateDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController currentDeviceDetailsController](self, "currentDeviceDetailsController"));
  objc_msgSend(v5, "setLastUpdatedDate:", v4);

}

- (void)lastUpdatedDateForPairedDeviceDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDetailsViewController activeWatchDetailsController](self, "activeWatchDetailsController"));
  objc_msgSend(v5, "setLastUpdatedDate:", v4);

}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (OfflineMapsManagementActionCoordination)delegate
{
  return (OfflineMapsManagementActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ModalCardHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (MUScrollableStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (OfflineMapDetailsSectionController)detailsSectionController
{
  return self->_detailsSectionController;
}

- (void)setDetailsSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_detailsSectionController, a3);
}

- (OfflineMapDeviceDetailsSectionController)currentDeviceDetailsController
{
  return self->_currentDeviceDetailsController;
}

- (void)setCurrentDeviceDetailsController:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeviceDetailsController, a3);
}

- (OfflineMapPairedDeviceDetailsSectionController)activeWatchDetailsController
{
  return self->_activeWatchDetailsController;
}

- (void)setActiveWatchDetailsController:(id)a3
{
  objc_storeStrong((id *)&self->_activeWatchDetailsController, a3);
}

- (OfflineMapFooterActionsSectionController)footerSectionController
{
  return self->_footerSectionController;
}

- (void)setFooterSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_footerSectionController, a3);
}

- (UILabel)legalDisclaimerLabel
{
  return self->_legalDisclaimerLabel;
}

- (void)setLegalDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_legalDisclaimerLabel, a3);
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_legalDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_footerSectionController, 0);
  objc_storeStrong((id *)&self->_activeWatchDetailsController, 0);
  objc_storeStrong((id *)&self->_currentDeviceDetailsController, 0);
  objc_storeStrong((id *)&self->_detailsSectionController, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end
