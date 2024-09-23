@implementation OBPrivacyCombinedController_iOS

- (OBPrivacyCombinedController_iOS)initWithBundles:(id)a3
{
  id v4;
  OBPrivacyCombinedController_iOS *v5;
  uint64_t v6;
  NSArray *bundles;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyCombinedController_iOS;
  v5 = -[OBPrivacyCombinedController initWithBundles:](&v9, sel_initWithBundles_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundles = v5->_bundles;
    v5->_bundles = (NSArray *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  unint64_t v29;
  OBPrivacyFlowGroup *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unint64_t v38;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
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
  id v79;
  id v80;
  void *v81;
  objc_super v82;
  objc_super v83;
  _QWORD v84[2];

  v84[1] = *MEMORY[0x1E0C80C00];
  v83.receiver = self;
  v83.super_class = (Class)OBPrivacyCombinedController_iOS;
  -[OBTableWelcomeController viewDidLoad](&v83, sel_viewDidLoad);
  -[OBWelcomeController setTemplateType:](self, "setTemplateType:", 1);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("COMBINED_SPLASH_TITLE"), CFSTR("Localizable"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackButtonTitle:", v6);

  -[OBPrivacyCombinedController_iOS bundles](self, "bundles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController_iOS setIsUnifiedAbout:](self, "setIsUnifiedAbout:", objc_msgSend(v7, "count") == 0);

  v8 = -[OBPrivacyCombinedController underlineLinks](self, "underlineLinks");
  -[OBWelcomeController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnderlineLinks:", v8);

  -[OBPrivacyCombinedController_iOS bundles](self, "bundles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0C99DE8];
    +[OBBundleManager sharedManager](OBBundleManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orderedPrivacyBundlesWithInclusionOptions:", 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[OBPrivacyCombinedController presentedFromPrivacyPane](self, "presentedFromPrivacyPane"))
      v16 = CFSTR("com.apple.onboarding.privacypanemini");
    else
      v16 = CFSTR("com.apple.onboarding.privacypane");
    +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertObject:atIndex:", v17, 0);
    -[OBPrivacyCombinedController_iOS setBundles:](self, "setBundles:", v15);

  }
  v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[OBPrivacyCombinedController_iOS bundles](self, "bundles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "count");

  if (v19)
  {
    v19 = 0;
    v81 = 0;
    v20 = 0;
    while (1)
    {
      -[OBPrivacyCombinedController_iOS bundles](self, "bundles");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "privacyFlow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OBPrivacyCombinedController_iOS isUnifiedAbout](self, "isUnifiedAbout"))
        v24 = objc_msgSend(v23, "showInCombinedList") ^ 1;
      else
        v24 = 0;
      if (objc_msgSend(v23, "platformSupported") && (v24 & 1) == 0)
      {
        objc_msgSend(v23, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.onboarding.imessagefacetime")) & 1) == 0)
        {
          objc_msgSend(v23, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.onboarding.activation"));

          if ((v27 & 1) != 0)
            goto LABEL_22;
          if (!-[OBPrivacyCombinedController_iOS isUnifiedAbout](self, "isUnifiedAbout") || v19)
            objc_msgSend(v80, "addObject:", v23);
          else
            v19 = v23;
          if (!objc_msgSend(v23, "isPersonallyIdentifiable"))
            goto LABEL_22;
          objc_msgSend(v23, "buttonIcon");
          v25 = v81;
          v81 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
LABEL_22:

      ++v20;
      -[OBPrivacyCombinedController_iOS bundles](self, "bundles");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v20 >= v29)
        goto LABEL_25;
    }
  }
  v81 = 0;
LABEL_25:
  if (-[OBPrivacyCombinedController_iOS isUnifiedAbout](self, "isUnifiedAbout"))
  {
    v30 = -[OBPrivacyFlowGroup initWithIdentifier:privacyFlows:]([OBPrivacyFlowGroup alloc], "initWithIdentifier:privacyFlows:", 0, v80);
    v84[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  }
  else
  {
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v30 = (OBPrivacyFlowGroup *)objc_claimAutoreleasedReturnValue();
    +[OBPrivacyFlowGroup groupFlowsByCombinedHeader:language:preferredDeviceType:](OBPrivacyFlowGroup, "groupFlowsByCombinedHeader:language:preferredDeviceType:", v80, v30, 0);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController_iOS setPrivacyFlowGroups:](self, "setPrivacyFlowGroups:", v31);

  -[OBWelcomeController headerView](self, "headerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("COMBINED_SPLASH_TITLE"), CFSTR("Localizable"), v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTitle:", v55);

    -[OBWelcomeController headerView](self, "headerView");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("COMBINED_SPLASH_DETAIL"), CFSTR("Localizable"), v37, v48);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDetailText:", v52);
    goto LABEL_39;
  }
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedTitleForLanguage:preferredDeviceType:", v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:", v34);

  v35 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedContentListForLanguage:preferredDeviceType:", v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v37, "count"))
  {
    v38 = 0;
    do
    {
      objc_msgSend(v37, "objectAtIndexedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "appendString:", v40);

      if (v38 < objc_msgSend(v37, "count") - 1)
        objc_msgSend(v35, "appendFormat:", CFSTR("\n\n"));

      ++v38;
    }
    while (v38 < objc_msgSend(v37, "count"));
  }
  if (!-[OBPrivacyCombinedController allowsOpeningSafari](self, "allowsOpeningSafari"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_WEB_DESCRIPTION"), CFSTR("Localizable"), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_WEB_LINK"), CFSTR("Localizable"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR(" %@\n%@"), v43, v46);

    v19 = v79;
  }
  -[OBWelcomeController headerView](self, "headerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDetailText:", v35);

  if (-[OBPrivacyCombinedController allowsOpeningSafari](self, "allowsOpeningSafari"))
  {
    +[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("MANAGE_YOUR_DATA"), CFSTR("Localizable"), v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTitle:forState:", v51, 0);

    objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel_showPrivacyGateway_, 0x2000);
    -[OBWelcomeController headerView](self, "headerView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addAccessoryButton:", v48);
LABEL_39:

    v19 = v79;
  }

  if (v81)
  {
    -[OBWelcomeController headerView](self, "headerView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_ICON_DESCRIPTION"), CFSTR("Localizable"), v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setIcon:accessibilityLabel:", v81, v59);

    v19 = v79;
    -[OBWelcomeController headerView](self, "headerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setIconInheritsTint:", 1);

  }
  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  if (v62)
  {
    v63 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v64 = (void *)objc_msgSend(v63, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBTableWelcomeController setTableView:](self, "setTableView:", v64);

    -[OBTableWelcomeController tableView](self, "tableView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setDelegate:", self);

    -[OBTableWelcomeController tableView](self, "tableView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setDataSource:", self);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setBackgroundColor:", v68);

    -[OBTableWelcomeController tableView](self, "tableView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setBackgroundView:", 0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("privacyTitle"));

    -[OBTableWelcomeController tableView](self, "tableView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("headerView"));

    -[OBTableWelcomeController tableView](self, "tableView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("footerView"));

  }
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHidden:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "reloadData");

  -[OBPrivacyCombinedController customTintColor](self, "customTintColor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v82.receiver = self;
    v82.super_class = (Class)OBPrivacyCombinedController_iOS;
    -[OBPrivacyCombinedController customTintColor](&v82, sel_customTintColor);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyCombinedController_iOS view](self, "view");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setTintColor:", v77);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  OBPrivacyCombinedController_iOS *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  objc_super v19;

  v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)OBPrivacyCombinedController_iOS;
  -[OBTableWelcomeController viewWillAppear:](&v19, sel_viewWillAppear_);
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[OBPrivacyCombinedController_iOS transitionCoordinator](self, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke;
      v17[3] = &unk_1E37AABD0;
      v17[4] = self;
      v18 = v6;
      v11 = v8;
      v12 = 3221225472;
      v13 = __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke_2;
      v14 = &unk_1E37AABD0;
      v15 = self;
      v16 = v18;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, &v11);

    }
    else
    {
      -[OBTableWelcomeController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, v3);

    }
  }
  -[OBBaseWelcomeController navigationItem](self, "navigationItem", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBPrivacyCombinedController_iOS;
  -[OBWelcomeController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[OBWelcomeController restoreNavigationBarAppearance](self, "restoreNavigationBarAppearance");
}

- (void)showPrivacyGateway:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_HTTP_WEB_LINK"), CFSTR("Localizable"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:options:completionHandler:", v8, MEMORY[0x1E0C9AA70], 0);

}

- (void)setCustomTintColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyCombinedController_iOS;
  -[OBPrivacyCombinedController setCustomTintColor:](&v6, sel_setCustomTintColor_, v4);
  if (-[OBPrivacyCombinedController_iOS isViewLoaded](self, "isViewLoaded"))
  {
    -[OBPrivacyCombinedController_iOS view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

  }
}

- (id)_privacyFlowForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyFlows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  OBPrivacySplashController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[OBPrivacyCombinedController_iOS _privacyFlowForIndexPath:](self, "_privacyFlowForIndexPath:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[OBPrivacySplashController initWithFlow:]([OBPrivacySplashController alloc], "initWithFlow:", v9);
  -[OBPrivacySplashController setUnderlineLinks:](v5, "setUnderlineLinks:", -[OBPrivacyCombinedController underlineLinks](self, "underlineLinks"));
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController setDisplayLanguage:](v5, "setDisplayLanguage:", v6);

  -[OBPrivacySplashController setShowsLinkToUnifiedAbout:](v5, "setShowsLinkToUnifiedAbout:", -[OBPrivacyCombinedController_iOS isUnifiedAbout](self, "isUnifiedAbout") ^ 1);
  -[OBPrivacyCombinedController customTintColor](self, "customTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController setCustomTintColor:](v5, "setCustomTintColor:", v7);

  -[OBWelcomeController setDarkMode:](v5, "setDarkMode:", -[OBWelcomeController darkMode](self, "darkMode"));
  -[OBPrivacyCombinedController_iOS navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v5, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyFlows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
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

  v6 = a3;
  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("headerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColor:", v12);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    objc_msgSend(v10, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTransform:", 0);

    objc_msgSend(v9, "setContentConfiguration:", v10);
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[OBPrivacyCombinedController_iOS privacyFlowGroups](self, "privacyFlowGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "privacyFlows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedCombinedFooterForLanguage:preferredDeviceType:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v44 = v8;
    v15 = (void *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setAttributedText:", v12);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v16);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v17);

    objc_msgSend(v15, "setScrollEnabled:", 0);
    objc_msgSend(v15, "setEditable:", 0);
    objc_msgSend(v15, "setSelectable:", 1);
    objc_msgSend(v15, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(v15, "textContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v13, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v15);

    v33 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v15, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v38;
    objc_msgSend(v15, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v32;
    objc_msgSend(v15, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v21;
    objc_msgSend(v15, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v13;
    objc_msgSend(v13, "contentView");
    v43 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v27);

    v12 = v43;
    v8 = v44;
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
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
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("privacyTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController_iOS _privacyFlowForIndexPath:](self, "_privacyFlowForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  objc_msgSend(v7, "setSelectionStyle:", 0);
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController displayLanguage](self, "displayLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedShortTitleForLanguage:preferredDeviceType:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend(v7, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 0);

  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "setSelectionStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v18);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CA5878];
  v7 = a4;
  objc_msgSend(v6, "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openSensitiveURL:withOptions:", v7, 0);

  return 0;
}

- (NSArray)bundles
{
  return self->_bundles;
}

- (void)setBundles:(id)a3
{
  objc_storeStrong((id *)&self->_bundles, a3);
}

- (NSArray)privacyFlowGroups
{
  return (NSArray *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setPrivacyFlowGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (BOOL)isUnifiedAbout
{
  return self->_isUnifiedAbout;
}

- (void)setIsUnifiedAbout:(BOOL)a3
{
  self->_isUnifiedAbout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyFlowGroups, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end
