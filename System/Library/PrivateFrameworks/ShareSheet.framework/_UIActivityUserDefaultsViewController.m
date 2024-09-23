@implementation _UIActivityUserDefaultsViewController

- (_UIActivityUserDefaultsViewController)initWithActivities:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  _UIActivityUserDefaultsViewController *v8;
  void *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  void *v12;
  objc_class *v13;
  SFUIActivityImageProvider *v14;
  SFUIActivityImageProvider *activityImageProvider;
  uint64_t v16;
  _UIActivityUserDefaultsViewController *v17;
  objc_super v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIActivityUserDefaultsViewController;
  v8 = -[_UIActivityUserDefaultsViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v10;

    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v12 = (void *)getSFUIActivityImageProviderClass_softClass;
    v24 = getSFUIActivityImageProviderClass_softClass;
    if (!getSFUIActivityImageProviderClass_softClass)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getSFUIActivityImageProviderClass_block_invoke;
      v20[3] = &unk_1E4001370;
      v20[4] = &v21;
      __getSFUIActivityImageProviderClass_block_invoke((uint64_t)v20);
      v12 = (void *)v22[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v21, 8);
    v14 = (SFUIActivityImageProvider *)objc_alloc_init(v13);
    activityImageProvider = v8->_activityImageProvider;
    v8->_activityImageProvider = v14;

    if (v7)
    {
      objc_msgSend(v7, "activitiesOrderedByUserActivityOrderForActivities:", v6);
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v16;
    }
    -[_UIActivityUserDefaultsViewController setActivities:](v8, "setActivities:", v6);
    -[_UIActivityUserDefaultsViewController setUserDefaults:](v8, "setUserDefaults:", v7);
    -[_UIActivityUserDefaultsViewController setPreferredContentSize:](v8, "setPreferredContentSize:", 0.0, 184.0);
    v17 = v8;
  }

  return v8;
}

- (_UIActivityUserDefaultsViewController)initWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 activitiesByUUID:(id)a5 applicationActivityTypes:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _UIActivityUserDefaultsViewController *v22;
  _UIActivityUserDefaultsViewController *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = -[_UIActivityUserDefaultsViewController initWithActivities:userDefaults:](self, "initWithActivities:userDefaults:", 0, 0);
  v23 = v22;
  if (v22)
  {
    v47 = v21;
    v48 = v20;
    v49 = v19;
    v50 = v18;
    -[_UIActivityUserDefaultsViewController setFavoritesProxies:](v22, "setFavoritesProxies:", v16);
    v24 = (void *)objc_opt_new();
    -[_UIActivityUserDefaultsViewController setFavoritesByUUID:](v23, "setFavoritesByUUID:", v24);

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v56 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          -[_UIActivityUserDefaultsViewController favoritesByUUID](v23, "favoritesByUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v30, v32);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v27);
    }

    -[_UIActivityUserDefaultsViewController setSuggestionProxies:](v23, "setSuggestionProxies:", v17);
    v33 = (void *)objc_opt_new();
    -[_UIActivityUserDefaultsViewController setSuggestionsByUUID:](v23, "setSuggestionsByUUID:", v33);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v34 = v17;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v52 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          -[_UIActivityUserDefaultsViewController suggestionsByUUID](v23, "suggestionsByUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKey:", v39, v41);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v36);
    }

    v18 = v50;
    -[_UIActivityUserDefaultsViewController setActivitiesByUUID:](v23, "setActivitiesByUUID:", v50);
    -[_UIActivityUserDefaultsViewController setActivityCategory:](v23, "setActivityCategory:", a9);
    v19 = v49;
    -[_UIActivityUserDefaultsViewController setApplicationActivityTypes:](v23, "setApplicationActivityTypes:", v49);
    v20 = v48;
    -[_UIActivityUserDefaultsViewController setOrderedUUIDs:](v23, "setOrderedUUIDs:", v48);
    v21 = v47;
    -[_UIActivityUserDefaultsViewController setExcludedActivityTypes:](v23, "setExcludedActivityTypes:", v47);
    -[_UIActivityUserDefaultsViewController setIsPresentedModally:](v23, "setIsPresentedModally:", a10);
    _ShareSheetBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (a9 == 1)
      v44 = CFSTR("Apps");
    else
      v44 = CFSTR("Actions");
    objc_msgSend(v42, "localizedStringForKey:value:table:", v44, v44, CFSTR("Localizable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActivityUserDefaultsViewController setTitle:](v23, "setTitle:", v45);
  }

  return v23;
}

- (void)setHostAuditToken:(id)a3
{
  BSAuditToken *v5;
  NSString *v6;
  NSString *bundleIdentifier;

  v5 = (BSAuditToken *)a3;
  if (self->_hostAuditToken != v5)
  {
    objc_storeStrong((id *)&self->_hostAuditToken, a3);
    if (v5)
    {
      -[BSAuditToken realToken](v5, "realToken", 0, 0, 0, 0);
      _ShareSheetBundleIDFromAuditToken();
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = v6;

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id *v89;
  id v90;
  _UIActivityUserDefaultsDataSource *v91;
  void *v92;
  id v93;
  _UIActivityUserDefaultsDataSource *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  _UIActivityUserDefaultsActivityCell *(*v98)(id *, void *, uint64_t, void *);
  void *v99;
  _UIActivityUserDefaultsViewController *v100;
  id v101;
  id v102;
  id location;
  objc_super v104;

  v104.receiver = self;
  v104.super_class = (Class)_UIActivityUserDefaultsViewController;
  -[_UIActivityUserDefaultsViewController viewDidLoad](&v104, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
    -[_UIActivityUserDefaultsViewController setBackgroundView:](self, "setBackgroundView:", v6);
    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIActivityUserDefaultsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  v10 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (void *)objc_msgSend(v10, "initWithFrame:style:", 2);
  -[_UIActivityUserDefaultsViewController setTableView:](self, "setTableView:", v12);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", 0);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[_UIActivityUserDefaultsViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v18 = (void *)objc_opt_new();
  -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v29);

    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v34);

    -[_UIActivityUserDefaultsViewController backgroundView](self, "backgroundView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v39);

  }
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v44);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v49);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v54);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v59);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "reloadData");

  v61 = *MEMORY[0x1E0DC53D8];
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setRowHeight:", v61);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setEstimatedRowHeight:", 52.0);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSectionHeaderHeight:", v61);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setEstimatedSectionHeaderHeight:", 30.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setBackgroundColor:", v66);

  v68 = -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory");
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setEditing:", v68 == 0);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setBackgroundColor:", 0);

  v71 = (void *)objc_opt_new();
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setTableFooterView:", v71);

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("userDefaultsCell"));

  v74 = objc_alloc(MEMORY[0x1E0DC34F0]);
  if (v68)
  {
    v75 = (void *)objc_msgSend(v74, "initWithBarButtonSystemItem:target:action:", 2, self, sel_editUserDefaults);
    -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setRightBarButtonItem:", v75);

    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissUserDefaults);
    -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setLeftBarButtonItem:", v77);
  }
  else
  {
    v77 = (void *)objc_msgSend(v74, "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissUserDefaults);
    -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setRightBarButtonItem:", v77);
  }

  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "_setManualScrollEdgeAppearanceEnabled:", 1);

  v80 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v80, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setShadowColor:", v81);

  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setScrollEdgeAppearance:", v80);

  v83 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v83, "configureWithDefaultBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setShadowColor:", v84);

  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setStandardAppearance:", v83);

  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "_setManualScrollEdgeAppearanceProgress:", 1.0);

  -[_UIActivityUserDefaultsViewController traitCollection](self, "traitCollection");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "layoutDirection");

  v89 = (id *)MEMORY[0x1E0CD2FA0];
  if (v88 != 1)
    v89 = (id *)MEMORY[0x1E0CD2F80];
  v90 = *v89;
  location = 0;
  objc_initWeak(&location, self);
  v91 = [_UIActivityUserDefaultsDataSource alloc];
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = MEMORY[0x1E0C809B0];
  v97 = 3221225472;
  v98 = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke;
  v99 = &unk_1E40014D0;
  objc_copyWeak(&v102, &location);
  v100 = self;
  v93 = v90;
  v101 = v93;
  v94 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v91, "initWithTableView:cellProvider:", v92, &v96);
  -[_UIActivityUserDefaultsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v94, v96, v97, v98, v99, v100);

  -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setDataSourceProxy:", self);

  -[_UIActivityUserDefaultsViewController updateUserDefaultsAnimated:](self, "updateUserDefaultsAnimated:", 0);
  objc_destroyWeak(&v102);
  objc_destroyWeak(&location);

}

- (void)updateUserDefaultsAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void **v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  int v38;
  void *v39;
  void *v40;
  int v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  uint64_t v58;
  int v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  _BYTE v74[128];
  void *v75;
  void *v76;
  _BYTE v77[128];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v57 = a3;
  v80 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[_UIActivityUserDefaultsViewController bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v5;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    v59 = 1;
  else
    v59 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.SafariViewService"), v5);
  v6 = -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory", v55);
  -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != 1)
  {
    if (v8)
    {
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E403F050);
      -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueForKey:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"));

    }
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E403F068);
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E403F080);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[_UIActivityUserDefaultsViewController suggestionProxies](self, "suggestionProxies");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (!v17)
    {
LABEL_41:

      goto LABEL_42;
    }
    v18 = v17;
    v19 = *(_QWORD *)v70;
    v58 = *(_QWORD *)v70;
LABEL_13:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v19)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v20);
      -[_UIActivityUserDefaultsViewController activitiesByUUID](self, "activitiesByUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIActivityUserDefaultsViewController excludedActivityTypes](self, "excludedActivityTypes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activityType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "containsObject:", v26);

      if ((v27 & 1) != 0)
        goto LABEL_39;
      if (v59
        && (objc_msgSend(v24, "activityType"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AddToReadingList")),
            v28,
            v29))
      {
        objc_msgSend(v21, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v30;
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = &v78;
      }
      else
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        +[_UIActivityHelper builtinActivityClasses](_UIActivityHelper, "builtinActivityClasses");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v66;
          while (2)
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v66 != v36)
                objc_enumerationMutation(v33);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = 0;
                goto LABEL_30;
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
            if (v35)
              continue;
            break;
          }
          v38 = 1;
LABEL_30:
          v19 = v58;
        }
        else
        {
          v38 = 1;
        }

        if (!v24)
          goto LABEL_37;
        -[_UIActivityUserDefaultsViewController applicationActivityTypes](self, "applicationActivityTypes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "activityType");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v38 & objc_msgSend(v39, "containsObject:", v40);

        v42 = v41 == 1;
        v19 = v58;
        if (!v42)
        {
LABEL_37:
          objc_msgSend(v21, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v4;
          v45 = v43;
          v46 = CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_OTHER");
          goto LABEL_38;
        }
        objc_msgSend(v21, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v30;
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = &v76;
      }
      objc_msgSend(v31, "arrayWithObjects:count:", v32, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v4;
      v45 = v43;
      v46 = CFSTR("App Actions");
LABEL_38:
      objc_msgSend(v44, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v45, v46);

LABEL_39:
      if (++v20 == v18)
      {
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (!v18)
          goto LABEL_41;
        goto LABEL_13;
      }
    }
  }
  if (v8)
  {
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E403F020);
    -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"));

  }
  -[_UIActivityUserDefaultsViewController suggestionProxies](self, "suggestionProxies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E403F038);
    -[_UIActivityUserDefaultsViewController suggestionProxies](self, "suggestionProxies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_SUGGESTIONS"));

  }
LABEL_42:
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v4, "sectionIdentifiers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v62 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
        if (!objc_msgSend(v4, "numberOfItemsInSection:", v52))
        {
          v73 = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "deleteSectionsWithIdentifiers:", v53);

        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v49);
  }

  -[_UIActivityUserDefaultsViewController setCurrentSnapshot:](self, "setCurrentSnapshot:", v4);
  -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySnapshot:animatingDifferences:", v4, v57);

}

- (void)configureSwitchForCell:(id)a3 activityProxy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "setEditingAccessoryView:", 0);
  }
  else
  {
    v10 = objc_msgSend(v6, "canHide");
    objc_msgSend(v13, "editingAccessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 && v10)
    {
      v12 = objc_alloc(MEMORY[0x1E0DC3D18]);
      v11 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_toggleActivityHiddenForControl_, 4096);
      objc_msgSend(v13, "setEditingAccessoryView:", v11);
    }
    if ((v10 & 1) == 0)
      objc_msgSend(v13, "setEditingAccessoryView:", 0);
    objc_msgSend(v11, "setOn:", objc_msgSend(v6, "isHidden") ^ 1);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActivityUserDefaultsViewController;
  -[_UIActivityUserDefaultsViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)editUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:animated:", 1, 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneEditingUserDefaults);
  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", 0);

}

- (void)doneEditingUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:animated:", 0, 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editUserDefaults);
  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissUserDefaults);
  -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

}

- (void)dismissUserDefaults
{
  -[_UIActivityUserDefaultsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController userDefaultsDelegate](self, "userDefaultsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userDefaultsViewController:didSelectActivityWithIdentifier:activityCategory:disabled:", self, v9, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"), objc_msgSend(v10, "isDisabled"));
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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

  -[_UIActivityUserDefaultsViewController titleForSection:](self, "titleForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  v6 = (void *)MEMORY[0x1E0DC37E8];
  v7 = *MEMORY[0x1E0DC4B60];
  objc_msgSend(MEMORY[0x1E0DC37F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B60], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledFontForFont:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v11);

  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v12, "addSubview:", v5);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v5, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  objc_msgSend(v5, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v21);

  objc_msgSend(v5, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 26.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v24);

  objc_msgSend(v5, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -8.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
  return v12;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "section");
  if (v9 == objc_msgSend(v8, "section"))
  {
    -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "canMove") & 1) == 0)
    {
      v13 = v7;

      goto LABEL_7;
    }

    v12 = v8;
  }
  else
  {
    v12 = v7;
  }
  v13 = v12;
LABEL_7:

  return v13;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v9, "mutableCopy");

  -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "row");
  objc_msgSend(v15, "removeObjectAtIndex:", v12);
  v13 = objc_msgSend(v7, "row");

  objc_msgSend(v15, "insertObject:atIndex:", v11, v13);
  -[_UIActivityUserDefaultsViewController setFavoritesProxies:](self, "setFavoritesProxies:", v15);
  -[_UIActivityUserDefaultsViewController updateUserDefaultsAnimated:](self, "updateUserDefaultsAnimated:", 1);
  -[_UIActivityUserDefaultsViewController userDefaultsDelegate](self, "userDefaultsDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userDefaultsViewController:didUpdateFavoritesProxies:activityCategory:", self, v15, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
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
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 == 2)
  {
    -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "itemIdentifierForIndexPath:", v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActivityUserDefaultsViewController suggestionProxies](self, "suggestionProxies");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "mutableCopy");

    objc_msgSend(v44, "removeObject:", v42);
    -[_UIActivityUserDefaultsViewController setSuggestionProxies:](self, "setSuggestionProxies:", v44);
    -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "arrayByAddingObject:", v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController setFavoritesProxies:](self, "setFavoritesProxies:", v46);

    -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectForKey:", v48);

    -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v42, v50);

    -[_UIActivityUserDefaultsViewController updateUserDefaultsAnimated:](self, "updateUserDefaultsAnimated:", 1);
    objc_msgSend(v42, "identifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController cellForItemIdentifier:](self, "cellForItemIdentifier:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController configureSwitchForCell:activityProxy:](self, "configureSwitchForCell:activityProxy:", v52, v42);

    -[_UIActivityUserDefaultsViewController userDefaultsDelegate](self, "userDefaultsDelegate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "userDefaultsViewController:didFavoriteActivity:withIdentifier:activityCategory:", self, 1, v54, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));

  }
  else if (a4 == 1)
  {
    v57 = v8;
    -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemIdentifierForIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v56 = v9;
    objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v9, "row"));
    v55 = v15;
    -[_UIActivityUserDefaultsViewController setFavoritesProxies:](self, "setFavoritesProxies:", v15);
    -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v17);

    v18 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[_UIActivityUserDefaultsViewController orderedUUIDs](self, "orderedUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v59;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v23);
          -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            objc_msgSend(v13, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v24, "isEqual:", v27);

            if (v28)
            {
              objc_msgSend(v18, "addObject:", v13);
            }
            else
            {
              -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v24);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v24);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v32);

              }
            }
          }
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v21);
    }

    -[_UIActivityUserDefaultsViewController setSuggestionProxies:](self, "setSuggestionProxies:", v18);
    -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v13, v34);

    -[_UIActivityUserDefaultsViewController updateUserDefaultsAnimated:](self, "updateUserDefaultsAnimated:", 1);
    objc_msgSend(v13, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController cellForItemIdentifier:](self, "cellForItemIdentifier:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController configureSwitchForCell:activityProxy:](self, "configureSwitchForCell:activityProxy:", v36, v13);

    -[_UIActivityUserDefaultsViewController userDefaultsDelegate](self, "userDefaultsDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "userDefaultsViewController:didFavoriteActivity:withIdentifier:activityCategory:", self, 0, v38, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));

    v9 = v56;
    v8 = v57;
  }

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v5 = a4;
  -[_UIActivityUserDefaultsViewController currentSnapshot](self, "currentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES")))
  {
    -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifierForIndexPath:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "canEdit");
  }
  else
  {
    v13 = 2;
  }

  return v13;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a4;
  -[_UIActivityUserDefaultsViewController currentSnapshot](self, "currentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES")))
  {
    -[_UIActivityUserDefaultsViewController favoritesByUUID](self, "favoritesByUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifierForIndexPath:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "canEdit"))
      v13 = objc_msgSend(v12, "canMove");
    else
      v13 = 0;

  }
  else
  {
    v13 = -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory") == 1;
  }

  return v13;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a4;
  -[_UIActivityUserDefaultsViewController activities](self, "activities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIActivityUserDefaultsViewController activityForRowAtIndexPath:](self, "activityForRowAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop")) & 1) != 0)
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      objc_msgSend(v7, "activityType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Share")) ^ 1;

    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a4;
  -[_UIActivityUserDefaultsViewController currentSnapshot](self, "currentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"))
    && (-[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10 >= 2))
  {
    -[_UIActivityUserDefaultsViewController favoritesProxies](self, "favoritesProxies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "canMove");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  _ShareSheetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_DEFAULTS_REMOVE_BUTTON_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v15 = a3;
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15)
  {
LABEL_7:

    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();

  if (v5)
  {
    -[_UIActivityUserDefaultsViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;

    objc_msgSend(v15, "contentOffset");
    if (v10 <= -v9)
    {
      -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = 0.0;
    }
    else
    {
      objc_msgSend(v15, "contentOffset");
      v12 = fmin((v9 + v11) * 10.0, 100.0) / 100.0;
      -[_UIActivityUserDefaultsViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = v12;
    }
    objc_msgSend(v13, "_setManualScrollEdgeAppearanceProgress:", v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)cellForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)activityForRowAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[_UIActivityUserDefaultsViewController activities](self, "activities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v9 = 0;
  }
  else
  {
    -[_UIActivityUserDefaultsViewController activities](self, "activities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)toggleActivityHiddenForControl:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  v7 = v6;
  v9 = v8;

  -[_UIActivityUserDefaultsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaultsViewController diffableDataSource](self, "diffableDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIdentifierForIndexPath:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaultsViewController suggestionsByUUID](self, "suggestionsByUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIsHidden:", objc_msgSend(v14, "isHidden") ^ 1);
  -[_UIActivityUserDefaultsViewController userDefaultsDelegate](self, "userDefaultsDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userDefaultsViewController:didToggleActivityWithIdentifier:activityCategory:", self, v12, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));

}

- (void)toggleActivityHiddenForRowAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[_UIActivityUserDefaultsViewController activityForRowAtIndexPath:](self, "activityForRowAtIndexPath:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UIActivityUserDefaultsViewController userDefaults](self, "userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "activityIsHidden:", v7) ^ 1;

    -[_UIActivityUserDefaultsViewController userDefaults](self, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActivity:asHidden:", v7, v5);

  }
}

- (int64_t)preferredActivityCategory
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIActivityUserDefaultsViewController activities](self, "activities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend((id)objc_opt_class(), "activityCategory");
  return v4;
}

- (id)titleForSection:(int64_t)a3
{
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[_UIActivityUserDefaultsViewController currentSnapshot](self, "currentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("App Actions")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "childViewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_hostApplicationBundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;

      }
      else
      {
        -[_UIActivityUserDefaultsViewController bundleIdentifier](self, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
LABEL_9:

          goto LABEL_10;
        }
      }
      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedNameForContext:", 0);
        v18 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v18;
      }
      goto LABEL_9;
    }
  }
  else
  {
    _ShareSheetBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v7, &stru_1E4004990, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v9;
}

- (_UIActivityUserDefaultsViewControllerDelegate)userDefaultsDelegate
{
  return (_UIActivityUserDefaultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_userDefaultsDelegate);
}

- (void)setUserDefaultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_userDefaultsDelegate, a3);
}

- (BSAuditToken)hostAuditToken
{
  return self->_hostAuditToken;
}

- (SFUIActivityImageProvider)activityImageProvider
{
  return self->_activityImageProvider;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSArray)favoritesProxies
{
  return self->_favoritesProxies;
}

- (void)setFavoritesProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSMutableDictionary)favoritesByUUID
{
  return self->_favoritesByUUID;
}

- (void)setFavoritesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesByUUID, a3);
}

- (NSArray)suggestionProxies
{
  return self->_suggestionProxies;
}

- (void)setSuggestionProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSMutableDictionary)suggestionsByUUID
{
  return self->_suggestionsByUUID;
}

- (void)setSuggestionsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsByUUID, a3);
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activitiesByUUID, a3);
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivityTypes, a3);
}

- (NSArray)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (void)setOrderedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_orderedUUIDs, a3);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (_UIActivityUserDefaultsDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_suggestionsByUUID, 0);
  objc_storeStrong((id *)&self->_suggestionProxies, 0);
  objc_storeStrong((id *)&self->_favoritesByUUID, 0);
  objc_storeStrong((id *)&self->_favoritesProxies, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityImageProvider, 0);
  objc_storeStrong((id *)&self->_hostAuditToken, 0);
  objc_destroyWeak((id *)&self->_userDefaultsDelegate);
}

@end
