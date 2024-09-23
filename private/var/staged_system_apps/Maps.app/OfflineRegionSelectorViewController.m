@implementation OfflineRegionSelectorViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  void *v8;

  v7.receiver = self;
  v7.super_class = (Class)OfflineRegionSelectorViewController;
  -[ContaineeViewController viewDidLoad](&v7, "viewDidLoad");
  -[OfflineRegionSelectorViewController _setupViews](self, "_setupViews");
  -[OfflineRegionSelectorViewController _setupConstraints](self, "_setupConstraints");
  v3 = objc_opt_self(UITraitPreferredContentSizeCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = -[OfflineRegionSelectorViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v5, "_updateLayoutForAX");

}

- (void)_setupViews
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
  id v14;
  double y;
  double width;
  double height;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  int64_t v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
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
  id v87;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setTakesAvailableWidth:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setAllowsSwipeToDismiss:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "setHideGrabber:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "setDefaultContaineeLayout:", 5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v9, "setEdgeAttachedRegularHeightDimmingBehavior:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v10, "setShouldHidePreviousCards:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController view](self, "view"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("RegionSelectorContentView"));

  v14 = objc_alloc((Class)MUScrollableStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v18 = objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineRegionSelectorViewController setContentStackView:](self, "setContentStackView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v20, "setAlignment:", 3);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v21, "setClipsToBounds:", 1);

  v22 = kMUPlacePlatterPadding;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v23, "setContentEdgeInsets:", v22, v22, 0.0, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  objc_msgSend(v24, "addSubview:", v25);

  v26 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineRegionSelectorViewController setSizeLabel:](self, "setSizeLabel:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v27, "setTextAlignment:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v29, "setTextColor:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v30, "setNumberOfLines:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("Size"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  LODWORD(v33) = 1132068864;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 0, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 1, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v36, &stru_1011BF1E8);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v37, "addArrangedSubview:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  objc_msgSend(v39, "setCustomSpacing:afterView:", v40, 12.0);

  if (GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled[0], GeoOfflineConfig_AutomaticUpdatesEnabled[1]))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v42 = objc_msgSend(v41, "BOOLForKey:", CFSTR("OfflineMapsAutoUpdateDisclaimerDisplayed"));

    if ((v42 & 1) == 0)
    {
      v43 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      -[OfflineRegionSelectorViewController setAutoUpdateDisclaimerLabel:](self, "setAutoUpdateDisclaimerLabel:", v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v44, "setTextAlignment:", 1);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v46, "setTextColor:", v45);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v47, "setNumberOfLines:", 0);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController _autoUpdateDisclaimerText](self, "_autoUpdateDisclaimerText"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v49, "setText:", v48);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      LODWORD(v51) = 1132068864;
      objc_msgSend(v50, "setContentCompressionResistancePriority:forAxis:", 0, v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      LODWORD(v53) = 1148846080;
      objc_msgSend(v52, "setContentCompressionResistancePriority:forAxis:", 1, v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v54, &stru_1011BF1E8);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v55, "setAccessibilityIdentifier:", CFSTR("AutoUpdateDisclaimer"));

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v56, "setAlpha:", 0.0);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v57, "setHidden:", 1);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v58, "addArrangedSubview:", v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      objc_msgSend(v60, "setCustomSpacing:afterView:", v61, 12.0);

    }
  }
  v62 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineRegionSelectorViewController setButtonStackView:](self, "setButtonStackView:", v62);

  v63 = -[OfflineRegionSelectorViewController _preferredButtonStackOrientation](self, "_preferredButtonStackOrientation");
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v64, "setAxis:", v63);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v65, "setDistribution:", 1);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v66, "setAlignment:", 0);

  v67 = kMUPlaceHorizontalStackSpacing;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v68, "setSpacing:", v67);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v69, "setAccessibilityIdentifier:", CFSTR("ButtonStackView"));

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v70, "addArrangedSubview:", v71);

  v87 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_secondaryCardFooterActionButtonConfiguration"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
  objc_msgSend(v87, "setTitle:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v87, 0));
  -[OfflineRegionSelectorViewController setCancelButton:](self, "setCancelButton:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v75, "addTarget:action:forControlEvents:", self, "_cancel", 0x2000);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v76, "setAccessibilityIdentifier:", CFSTR("Cancel"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "title"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v78, "setAccessibilityLabel:", v77);

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_primaryCardFooterActionButtonConfiguration"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Download [button title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  objc_msgSend(v79, "setTitle:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v79, 0));
  -[OfflineRegionSelectorViewController setDownloadButton:](self, "setDownloadButton:", v82);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
  objc_msgSend(v83, "setAccessibilityIdentifier:", CFSTR("Download"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "title"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
  objc_msgSend(v85, "setAccessibilityLabel:", v84);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
  objc_msgSend(v86, "addTarget:action:forControlEvents:", self, "_download", 0x2000);

  -[OfflineRegionSelectorViewController _addButtonsToStackView](self, "_addButtonsToStackView");
  -[OfflineRegionSelectorViewController _updateForCurrentState](self, "_updateForCurrentState");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  void *v22;
  void *v23;
  double v24;
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
  _QWORD v45[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 400.0));

  LODWORD(v6) = 1144750080;
  objc_msgSend(v5, "setPriority:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 400.0));

  LODWORD(v10) = 1144750080;
  objc_msgSend(v9, "setPriority:", v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 0.0));
  v45[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v45[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v45[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v11));
  v45[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v45[4] = v17;
  v45[5] = v5;
  v42 = v9;
  v43 = v5;
  v45[6] = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 7));
  v19 = objc_msgSend(v18, "mutableCopy");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 400.0));

    LODWORD(v24) = 1144750080;
    objc_msgSend(v23, "setPriority:", v24);
    v44 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v19, "addObjectsFromArray:", v25);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)_updateLayoutForAX
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  id v7;

  -[OfflineRegionSelectorViewController _updateForCurrentState](self, "_updateForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController _autoUpdateDisclaimerText](self, "_autoUpdateDisclaimerText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
  objc_msgSend(v4, "setText:", v3);

  v5 = -[OfflineRegionSelectorViewController _preferredButtonStackOrientation](self, "_preferredButtonStackOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView"));
  objc_msgSend(v6, "setAxis:", v5);

  -[OfflineRegionSelectorViewController _addButtonsToStackView](self, "_addButtonsToStackView");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "updateHeightForCurrentLayout");

}

- (id)_autoUpdateDisclaimerText
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (IsAccessibilityCategory)
    v7 = CFSTR("OFFLINE_REGION_SELECTOR_AUTO_UPDATES_DISCLAIMER_AX");
  else
    v7 = CFSTR("OFFLINE_REGION_SELECTOR_AUTO_UPDATES_DISCLAIMER");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), CFSTR("Offline")));

  return v8;
}

- (int64_t)_preferredButtonStackOrientation
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_addButtonsToStackView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController cancelButton](self, "cancelButton"));
  v33[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
  v33[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v10), "removeFromSuperview");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));

    v6 = (id)v15;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController buttonStackView](self, "buttonStackView", (_QWORD)v23));
        objc_msgSend(v22, "addArrangedSubview:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[OfflineRegionSelectorViewController heightForLayout:](self, "heightForLayout:", objc_msgSend(v9, "containeeLayout"));
  v11 = v10;

  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  else
    return 2;
}

- (void)_cancel
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "closeOfflineRegionSelector");

  if (-[OfflineRegionSelectorViewController downloadable](self, "downloadable"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 18, 89, v4);
}

- (void)_download
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("OfflineMapsAutoUpdateDisclaimerDisplayed"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "downloadSelectedOfflineRegion");

  if (v6)
    -[OfflineRegionSelectorViewController setState:](self, "setState:", 3);
}

- (BOOL)downloadable
{
  return (id)-[OfflineRegionSelectorViewController state](self, "state") == (id)1;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[OfflineRegionSelectorViewController _updateForCurrentState](self, "_updateForCurrentState");
  }
}

- (void)setEstimatedDiskSizeLabel:(int64_t)a3
{
  self->_estimatedDiskSize = a3;
  -[OfflineRegionSelectorViewController _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)_updateForCurrentState
{
  void *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  void *v16;
  NSString *v17;
  NSComparisonResult v18;
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
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  _QWORD v33[5];
  char v34;

  if (qword_1014D2CB8 != -1)
    dispatch_once(&qword_1014D2CB8, &stru_1011BF208);
  switch(-[OfflineRegionSelectorViewController state](self, "state"))
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Calculating...");
      goto LABEL_18;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
      if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8))
      {

LABEL_14:
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2CB0, "stringFromByteCount:", self->_estimatedDiskSize));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
        objc_msgSend(v20, "setText:", v19);
        goto LABEL_20;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "preferredContentSizeCategory"));
      v18 = UIContentSizeCategoryCompareToCategory(v17, UIContentSizeCategoryExtraExtraLarge);

      if (v18 == NSOrderedDescending)
        goto LABEL_14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Size of selected map: %@"), CFSTR("localized string not found"), CFSTR("Offline")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2CB0, "stringFromByteCount:", self->_estimatedDiskSize));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
      objc_msgSend(v25, "setText:", v24);

LABEL_20:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
      v6 = 1;
      objc_msgSend(v12, "setEnabled:", 1);
LABEL_21:

LABEL_22:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "text"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
      objc_msgSend(v28, "setAccessibilityLabel:", v27);

      v29 = objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
      if (v29)
      {
        v30 = (void *)v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController autoUpdateDisclaimerLabel](self, "autoUpdateDisclaimerLabel"));
        v32 = objc_msgSend(v31, "isHidden");

        if (v6 == v32)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10065E714;
          v33[3] = &unk_1011ACE58;
          v34 = v6;
          v33[4] = self;
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, 0, 0.25);
        }
      }
      return;
    case 2uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (IsAccessibilityCategory)
        v5 = CFSTR("Offline maps unavailable");
      else
        v5 = CFSTR("Offline maps aren’t available in this region yet");
      goto LABEL_17;
    case 3uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
      objc_msgSend(v12, "setEnabled:", 0);
      v6 = 1;
      goto LABEL_21;
    case 4uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController traitCollection](self, "traitCollection"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "preferredContentSizeCategory"));
      v15 = UIContentSizeCategoryIsAccessibilityCategory(v14);

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v15)
        v5 = CFSTR("Network error");
      else
        v5 = CFSTR("Network error: offline map not available");
LABEL_17:
      v3 = v4;
LABEL_18:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), CFSTR("Offline")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController sizeLabel](self, "sizeLabel"));
      objc_msgSend(v22, "setText:", v21);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController downloadButton](self, "downloadButton"));
      objc_msgSend(v12, "setEnabled:", 0);
      v6 = 0;
      goto LABEL_21;
    default:
      v6 = 0;
      goto LABEL_22;
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGRect v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController contentStackView](self, "contentStackView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v15));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "bottomSafeOffset");
  v10 = v9;

  if (v10 <= 0.0)
  {
    v13 = kMUPlacePlatterPadding;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v11, "bottomSafeOffset");
    v13 = v12 + 2.0;

  }
  return v7 + v13;
}

- (OfflineRegionSelectorActionCoordination)delegate
{
  return (OfflineRegionSelectorActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (MUScrollableStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sizeLabel, a3);
}

- (UILabel)autoUpdateDisclaimerLabel
{
  return self->_autoUpdateDisclaimerLabel;
}

- (void)setAutoUpdateDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabel, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)downloadButton
{
  return self->_downloadButton;
}

- (void)setDownloadButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadButton, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (NSArray)autoUpdateDisclaimerLabelVisibleConstraints
{
  return self->_autoUpdateDisclaimerLabelVisibleConstraints;
}

- (void)setAutoUpdateDisclaimerLabelVisibleConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)autoUpdateDisclaimerLabelHiddenConstraints
{
  return self->_autoUpdateDisclaimerLabelHiddenConstraints;
}

- (void)setAutoUpdateDisclaimerLabelHiddenConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabelHiddenConstraints, 0);
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabelVisibleConstraints, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
