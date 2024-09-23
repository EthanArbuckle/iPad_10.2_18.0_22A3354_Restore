@implementation VUITabBarController

- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  NSObject *v63;
  int v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  VUITabBarController *v82;
  unsigned int v83;
  unint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  id obj;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  void *v111;
  _BYTE v112[128];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v6 = a4;
  v122 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v77 = a5;
  VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarUpdateItems", ", buf, 2u);
  }

  -[VUITabBarController tabBarItems](self, "tabBarItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "shouldIgnoreLastSelectedTabIndex") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringForKey:", CFSTR("lastSelectedTabBarItemIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("library")) & 1) == 0)
    {
      +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldPostAppLaunchData:", 1);

    }
    objc_msgSend(v11, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("ppt"));

    if (!v15)
      goto LABEL_12;

  }
  v11 = 0;
LABEL_12:
  v16 = -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex");
  v76 = v8;
  v81 = v11;
  v82 = self;
  if (!v11 || (v17 = v16, v16 == 0x7FFFFFFFFFFFFFFFLL) || v16 >= objc_msgSend(v8, "count"))
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dropOnTabConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dropOnTabIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v21 = v8;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    if (v22)
    {
      v23 = v22;
      v92 = v10;
      v24 = 0;
      v25 = *(_QWORD *)v107;
      while (2)
      {
        v26 = 0;
        v27 = v24 + v23;
        do
        {
          if (*(_QWORD *)v107 != v25)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v26), "vui_stringForKey:", CFSTR("identifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v20);

          if ((v29 & 1) != 0)
          {
            v17 = v24 + v26;
            goto LABEL_25;
          }
          ++v26;
        }
        while (v23 != v26);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
        v24 = v27;
        if (v23)
          continue;
        break;
      }
      v17 = 0;
LABEL_25:
      v8 = v76;
      self = v82;
      v10 = v92;
    }
    else
    {
      v17 = 0;
    }

  }
  v84 = v17;
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v10;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v103 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v35, "vui_stringForKey:", CFSTR("identifier"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:", v35, v36);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    }
    while (v32);
  }

  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v99 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
        objc_msgSend(v43, "vuiViewControllerIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(v43, "vuiViewControllerIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", v43, v45);

        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    }
    while (v40);
  }
  v80 = v37;

  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "launchedToTest");

  if (v48)
  {
    v117[0] = CFSTR("identifier");
    v117[1] = CFSTR("documentRef");
    v118[0] = CFSTR("pptstack");
    v118[1] = CFSTR("PPTStackScroll");
    v117[2] = CFSTR("title");
    v118[2] = CFSTR("pptstack");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v49);

    v115[0] = CFSTR("identifier");
    v115[1] = CFSTR("documentRef");
    v116[0] = CFSTR("pptsports");
    v116[1] = CFSTR("PPTSportsScroll");
    v115[2] = CFSTR("title");
    v116[2] = CFSTR("pptsports");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v50);

    v113[0] = CFSTR("identifier");
    v113[1] = CFSTR("documentRef");
    v114[0] = CFSTR("pptshowproduct");
    v114[1] = CFSTR("PPTShowScrollController");
    v113[2] = CFSTR("title");
    v114[2] = CFSTR("pptshowproduct");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v51);

  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v87 = v46;
  v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
  if (!v91)
  {
    v86 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_79;
  }
  v89 = 0;
  v90 = *(_QWORD *)v95;
  v86 = 0x7FFFFFFFFFFFFFFFLL;
  v85 = v30;
  do
  {
    v52 = 0;
    do
    {
      if (*(_QWORD *)v95 != v90)
        objc_enumerationMutation(v87);
      v53 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v52);
      objc_msgSend(v53, "vui_stringForKey:", CFSTR("identifier"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "vui_stringForKey:", CFSTR("documentRef"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v53, "vui_BOOLForKey:defaultValue:", CFSTR("isNonServerTab"), 0);
      objc_msgSend(v53, "vui_dictionaryForKey:", CFSTR("contextData"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "vui_stringForKey:", CFSTR("title"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "vui_stringForKey:", CFSTR("iconResource"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "vui_arrayForKey:", CFSTR("childItems"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "vui_dictionaryForKey:", CFSTR("uiConfiguration"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "length") && objc_msgSend(v55, "length") && objc_msgSend(v57, "length"))
      {
        v83 = v56;
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "isRunningTest");

        if (v62 && objc_msgSend(v53, "vui_BOOLForKey:defaultValue:", CFSTR("isSideBarItem"), 0))
        {
          VUIDefaultLogObject();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v111 = v53;
            _os_log_impl(&dword_1D96EE000, v63, OS_LOG_TYPE_INFO, "VUITabBarController - Tab bar item is a sidebar item. Will ignore when running PPT. TabBarItem: %@", buf, 0xCu);
          }
          goto LABEL_71;
        }
        v64 = objc_msgSend(v81, "isEqualToString:", v54);
        v65 = v84;
        if (v64)
          v65 = v89;
        v84 = v65;
        v66 = v86;
        if (v64)
          v66 = v89;
        v86 = v66;
        objc_msgSend(v85, "objectForKey:", v54);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v67, "mutableCopy");

        if (!v63)
          v63 = objc_msgSend(v53, "mutableCopy");
        objc_msgSend(v80, "objectForKey:", v54);
        v68 = objc_claimAutoreleasedReturnValue();
        if (v68)
        {
          v69 = v68;
          -[NSObject setObject:forKey:](v63, "setObject:forKey:", v57, CFSTR("title"));
          -[VUITabBarController _updateTabbarChildViewController:withTitle:iconResource:](v82, "_updateTabbarChildViewController:withTitle:iconResource:", v69, v57, v58);
          goto LABEL_69;
        }
        -[VUITabBarController _tabBarChildViewControllerWithIdentifier:documentRef:isNonServerTab:title:isSelectedTab:appContext:iconResource:contextData:childItems:uiConfigDict:](v82, "_tabBarChildViewControllerWithIdentifier:documentRef:isNonServerTab:title:isSelectedTab:appContext:iconResource:contextData:childItems:uiConfigDict:", v54, v55, v83, v57, v86 == v89, v77, v58, v93, v59, v60);
        v69 = objc_claimAutoreleasedReturnValue();
        if (v69)
        {
LABEL_69:
          objc_msgSend(v79, "addObject:", v63);
          objc_msgSend(v78, "addObject:", v69);
          ++v89;
        }
        else
        {
          VUIDefaultLogObject();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v111 = v53;
            _os_log_impl(&dword_1D96EE000, v69, OS_LOG_TYPE_INFO, "VUITabBarController - Unable to create view controller for tab bar item. Will ignore: TabBarItem: %@", buf, 0xCu);
          }
        }

LABEL_71:
        v30 = v85;
        goto LABEL_72;
      }
      VUIDefaultLogObject();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v111 = v53;
        _os_log_impl(&dword_1D96EE000, v63, OS_LOG_TYPE_INFO, "VUITabBarController - Tab bar item has a zero length identifier, documentRef or title. Will ignore. TabBarItem: %@", buf, 0xCu);
      }
LABEL_72:

      ++v52;
    }
    while (v91 != v52);
    v70 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
    v91 = v70;
  }
  while (v70);
LABEL_79:

  v71 = (void *)objc_msgSend(v79, "copy");
  -[VUITabBarController setTabBarItems:](v82, "setTabBarItems:", v71);

  v72 = (void *)objc_msgSend(v78, "copy");
  -[VUITabBarController setVuiViewControllers:](v82, "setVuiViewControllers:", v72);

  -[VUITabBarController setPreviousSelectedIndex:](v82, "setPreviousSelectedIndex:", v86);
  -[VUITabBarController setVuiSelectedIndex:](v82, "setVuiSelectedIndex:", v84);
  -[VUITabBarController tabBar](v82, "tabBar");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setNeedsLayout");

  -[VUITabBarController updatingDelegate](v82, "updatingDelegate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "tabBarControllerDidUpdateTabBarItems:", v82);

  -[VUITabBarController _addAndPresentBubbleTipIfAny:](v82, "_addAndPresentBubbleTipIfAny:", v76);
  VUISignpostLogObject();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v75))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v75, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarUpdateItems", ", buf, 2u);
  }

}

- (id)_tabBarChildViewControllerWithIdentifier:(id)a3 documentRef:(id)a4 isNonServerTab:(BOOL)a5 title:(id)a6 isSelectedTab:(BOOL)a7 appContext:(id)a8 iconResource:(id)a9 contextData:(id)a10 childItems:(id)a11 uiConfigDict:(id)a12
{
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  VUIDocumentDataSource *v23;
  VUIDocumentUIConfiguration *v24;
  VUIDocumentUIConfiguration *v25;
  uint64_t v26;
  void *v27;
  VUIDocumentContextData *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  VUIDocumentDataSource *v38;
  void *v39;
  void *v40;
  void *v41;
  VUIAppNavigationController *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v47;
  id v48;
  id v49;
  void *v50;
  VUIDocumentUIConfiguration *v51;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  VUIDocumentDataSource *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  const __CFString *v64;
  id v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v13 = a7;
  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v56 = a6;
  v54 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v57 = a12;
  VUISignpostLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v17;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarChildViewCreate", "id:%@", buf, 0xCu);
  }

  v23 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", v18);
  v24 = objc_alloc_init(VUIDocumentUIConfiguration);
  v58 = v23;
  if (v57)
  {
    v25 = v24;
    +[VUIDocumentUIConfiguration uiConfigurationWithDict:](VUIDocumentUIConfiguration, "uiConfigurationWithDict:");
    v26 = objc_claimAutoreleasedReturnValue();

    v24 = (VUIDocumentUIConfiguration *)v26;
    v23 = v58;
  }
  v27 = v56;
  v51 = v24;
  -[VUIDocumentDataSource setUiConfiguration:](v23, "setUiConfiguration:", v24);
  -[VUIDocumentDataSource setShouldLoadPageImmediately:](v23, "setShouldLoadPageImmediately:", v13);
  if (objc_msgSend(v17, "length"))
  {
    v64 = CFSTR("tabIdentifier");
    v65 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
  }
  v53 = v19;
  v55 = v18;
  if (!a5)
  {
    -[VUIDocumentDataSource setDocumentType:](v23, "setDocumentType:", CFSTR("default"));
    -[VUIDocumentDataSource setControllerRef:](v23, "setControllerRef:", v18);
    -[VUIDocumentDataSource setTitle:](v23, "setTitle:", v56);
    if (v20)
    {
      v28 = -[VUIDocumentContextData initWithDictionary:]([VUIDocumentContextData alloc], "initWithDictionary:", v20);
      -[VUIDocumentDataSource setContextData:](v58, "setContextData:", v28);

      v23 = v58;
    }
    if (v21 && objc_msgSend(v21, "count"))
    {
      v48 = v20;
      v49 = v17;
      v29 = (void *)objc_opt_new();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v47 = v21;
      v30 = v21;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v60 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            +[VUIDocumentDataSource documentDataSourceWithDictionary:](VUIDocumentDataSource, "documentDataSourceWithDictionary:", v35, v47);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setDocumentType:", CFSTR("default"));
            objc_msgSend(v35, "vui_stringForKey:", CFSTR("documentRef"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setControllerRef:", v37);

            if (v36)
              objc_msgSend(v29, "addObject:", v36);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v32);
      }

      v23 = v58;
      -[VUIDocumentDataSource setChildDocumentDataSources:](v58, "setChildDocumentDataSources:", v29);

      v20 = v48;
      v17 = v49;
      v27 = v56;
      v21 = v47;
    }
  }
  -[VUIDocumentDataSource uiConfiguration](v23, "uiConfiguration", v47);
  v38 = v23;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setViewControllerDocumentIdentifier:", v17);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "viewControllerWithDocumentDataSource:appContext:documentOptions:", v38, v54, v50);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = -[_VUITVAppNavigationController initWithRootViewController:]([VUIAppNavigationController alloc], "initWithRootViewController:", v41);
  -[_VUITVAppNavigationController setMaxNavControllerStackDepth:](v42, "setMaxNavControllerStackDepth:", 6);
  -[VUIAppNavigationController setVuiViewControllerIdentifier:](v42, "setVuiViewControllerIdentifier:", v17);
  -[VUIAppNavigationController vuiTabBarItem](v42, "vuiTabBarItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("UIA.TV.Tab."), "stringByAppendingString:", v17);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityIdentifier:", v44);

  -[VUITabBarController _updateTabbarChildViewController:withTitle:iconResource:](self, "_updateTabbarChildViewController:withTitle:iconResource:", v42, v27, v53);
  VUISignpostLogObject();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarChildViewCreate", ", buf, 2u);
  }

  return v42;
}

- (void)_updateTabbarChildViewController:(id)a3 withTitle:(id)a4 iconResource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_tabBarImageForResource:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "tabBarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v12);

  -[VUITabBarController _updateTabBarChildViewController:withTitle:](self, "_updateTabBarChildViewController:withTitle:", v10, v9);
}

- (void)_updateTabBarChildViewController:(id)a3 withTitle:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTitle:", v5);
  objc_msgSend(v6, "tabBarItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitle:", v5);
}

+ (id)_tabBarImageForResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("symbol://")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("symbol://"), &stru_1E9FF3598);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMonochrome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_systemImageNamed:withConfiguration:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_imageThatSuppressesAccessibilityHairlineThickening");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("resource://");
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("resource://")))
    {
      v9 = CFSTR("resource-symbol://");
      if (!objc_msgSend(v3, "hasPrefix:", CFSTR("resource-symbol://")))
      {
        v8 = 0;
        goto LABEL_7;
      }
    }
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E9FF3598);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "vuiImageNamed:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v8;
}

- (void)_setSelectedViewController:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v5 = -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex");
  -[VUITabBarController vuiSelectedViewController](self, "vuiSelectedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v4)
    +[VideosUI notifyAppearingViewControllerOfTabSwitch:](_TtC8VideosUI8VideosUI, "notifyAppearingViewControllerOfTabSwitch:", v4);
  -[VUITabBarController setPreviousSelectedIndex:](self, "setPreviousSelectedIndex:", v5);
  v7.receiver = self;
  v7.super_class = (Class)VUITabBarController;
  -[VUITabBarController _setSelectedViewController:](&v7, sel__setSelectedViewController_, v4);
  if (v5 != -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex")
    || !-[VUITabBarController hasSetTabBarIndex](self, "hasSetTabBarIndex"))
  {
    -[VUITabBarController _handleSelectedViewControllerDidChange](self, "_handleSelectedViewControllerDidChange");
    if (!-[VUITabBarController hasSetTabBarIndex](self, "hasSetTabBarIndex"))
      -[VUITabBarController setHasSetTabBarIndex:](self, "setHasSetTabBarIndex:", 1);
  }

}

- (void)setPreviousSelectedIndex:(unint64_t)a3
{
  self->_previousSelectedIndex = a3;
}

- (BOOL)hasSetTabBarIndex
{
  return self->_hasSetTabBarIndex;
}

- (void)_handleSelectedViewControllerDidChange
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex");
  -[VUITabBarController tabBarItems](self, "tabBarItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (v3 >= objc_msgSend(v4, "count"))
      v5 = 0;
    else
      v5 = v3;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("identifier"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("pageContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E9FF3598;
    if (v7)
      v10 = v7;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    v15 = CFSTR("VUIMetricsTabBarItemNotificationKey");
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v7, CFSTR("lastSelectedTabBarItemIdentifier"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification"), self, v12);
  }

}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)setVuiSelectedIndex:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUITabBarController;
  -[VUITabBarController setVuiSelectedIndex:](&v5, sel_setVuiSelectedIndex_, a3);
  -[VUITabBarController updatingDelegate](self, "updatingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabBarControllerDidUpdateSelectedIndex:", self);

}

- (VUITabBarControllerUpdatingDelegate)updatingDelegate
{
  return (VUITabBarControllerUpdatingDelegate *)objc_loadWeakRetained((id *)&self->_updatingDelegate);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUITabBarController;
  -[VUITabBarController setViewControllers:animated:](&v4, sel_setViewControllers_animated_, a3, a4);
}

- (void)setTabBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarItems, a3);
}

- (void)setHasSetTabBarIndex:(BOOL)a3
{
  self->_hasSetTabBarIndex = a3;
}

- (void)_addAndPresentBubbleTipIfAny:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  VUITabBarController *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v33 = self;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v35;
    v10 = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "vui_stringForKey:", CFSTR("tipPlacementId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && objc_msgSend(v12, "length"))
        {
          v10 = v7 + i;
          v14 = v13;

          v8 = v14;
        }

      }
      v7 += v6;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
    if (v10 != -1)
    {
      +[VideosUI getTipViewControllerIfAny:](_TtC8VideosUI8VideosUI, "getTipViewControllerIfAny:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[VUITabBarController tabBar](v33, "tabBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v25 = objc_msgSend(v4, "count");
        if (v25 <= 1)
          v26 = 1;
        else
          v26 = v25;
        v27 = v22 / (double)v26;
        objc_msgSend(v15, "setModalPresentationStyle:", 7);
        objc_msgSend(v15, "popoverPresentationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUITabBarController tabBar](v33, "tabBar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSourceView:", v29);

        objc_msgSend(v15, "popoverPresentationController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSourceRect:", v18 + (double)(unint64_t)(v10 * (int)v27), v20, v27, v24);

        objc_msgSend(v15, "setDelegate:", v33);
        objc_msgSend(v15, "popoverPresentationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setDelegate:", v33);

        -[VUITabBarController presentViewController:animated:completion:](v33, "presentViewController:animated:completion:", v15, 1, 0);
      }
      else
      {
        VUIDefaultLogObject();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v8;
          _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::No TipViewController found for %@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUITabBarController;
  -[VUITabBarController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITabBarController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVuiBackgroundColor:", v3);

}

+ (BOOL)shouldIgnoreLastSelectedTabIndex
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t (**v8)(void *, uint64_t, void *);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  BOOL v22;
  void *v24;
  _QWORD aBlock[4];
  id v26;
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastActiveDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastPlaybackDate"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__VUITabBarController_shouldIgnoreLastSelectedTabIndex__block_invoke;
  aBlock[3] = &unk_1E9FA17B8;
  v7 = v6;
  v26 = v7;
  v8 = (uint64_t (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dropOnTabConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "daysWithoutPlaybackThreshold");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "daysWithoutOpeningThreshold");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8[2](v8, v5, v11);
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v12;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v11;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "DropOnTab: isPastPlaybackThreshold = %i for %@ days since date of %@ ", buf, 0x1Cu);
  }
  v14 = (void *)v5;

  v15 = v8[2](v8, (uint64_t)v3, v24);
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v15;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v24;
    v29 = 2112;
    v30 = (uint64_t)v3;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "DropOnTab: isPastAppOpeningThreshold = %i for %@ days since date of %@ ", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v7, CFSTR("lastActiveDate"));

  if (!v3)
  {
    VUIDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v28 = v7;
      v21 = "DropOnTab: shouldIgnoreLastSelectedTabIndex=YES. no lastActiveDate, setting lastActiveDate and lastPlaybackDate to %@";
      goto LABEL_11;
    }
LABEL_12:

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v19, "setObject:forKey:", v7, CFSTR("lastPlaybackDate"));
    v22 = 1;
    goto LABEL_16;
  }
  v18 = v12 | v15;
  VUIDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18 == 1)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v28 = v7;
      v21 = "DropOnTab: shouldIgnoreLastSelectedTabIndex=YES. Updating lastActiveDate and lastPlaybackDate to %@";
LABEL_11:
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v28 = v7;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "DropOnTab: shouldIgnoreLastSelectedTabIndex=NO. Updating lastActiveDate to %@", buf, 0xCu);
  }
  v22 = 0;
LABEL_16:

  return v22;
}

BOOL __55__VUITabBarController_shouldIgnoreLastSelectedTabIndex__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  double v8;
  _BOOL8 v9;

  if (!a2)
    return 0;
  v5 = a2;
  v6 = objc_msgSend(a3, "intValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, (double)(86400 * v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v7);
  v9 = v8 > 0.0;

  return v9;
}

- (VUITabBarController)init
{
  VUITabBarController *v2;
  VUITabBarController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUITabBarController;
  v2 = -[VUITabBarController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUITabBarController tabBar](v2, "tabBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    -[VUITabBarController setVuiDelegate:](v3, "setVuiDelegate:", v3);
    v3->_previousSelectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(v3, "presentedViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v3, "presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1F0327B58) & 1) != 0)
      {
        objc_msgSend(v3, "presentedViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isBeingPresented");

        if ((v11 & 1) != 0)
          goto LABEL_6;
        objc_msgSend(v3, "presentedViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "overridesOrientationLock"))
          v6 = 26;
        else
          v6 = 2;
      }
      else
      {

        v6 = 2;
      }

      goto LABEL_12;
    }
LABEL_6:
    v6 = 2;
    goto LABEL_12;
  }
  v6 = 30;
LABEL_12:

  return v6;
}

- (UINavigationController)currentNavigationController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (UINavigationController *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[VUITabBarController setVuiDelegate:](self, "setVuiDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUITabBarController;
  -[VUITabBarController dealloc](&v3, sel_dealloc);
}

- (BOOL)isTabBarHidden
{
  void *v2;
  char v3;

  -[VUITabBarController tabBar](self, "tabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setTabBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VUITabBarController tabBar](self, "tabBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)removeAllChildViewControllers
{
  -[VUITabBarController setViewControllers:](self, "setViewControllers:", 0);
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3
{
  -[VUITabBarController setSelectedIndexForTabBarItemIdentifier:clearStack:](self, "setSelectedIndexForTabBarItemIdentifier:clearStack:", a3, 0);
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __74__VUITabBarController_setSelectedIndexForTabBarItemIdentifier_clearStack___block_invoke;
  v11 = &unk_1E9FA1790;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);
  if ((v15[3] & 0x8000000000000000) == 0)
    -[VUITabBarController setVuiSelectedIndex:](self, "setVuiSelectedIndex:", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
}

void __74__VUITabBarController_setSelectedIndexForTabBarItemIdentifier_clearStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "vuiViewControllerIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v7, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (unint64_t)indexForTabBarItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  unint64_t v13;

  v4 = a3;
  -[VUITabBarController tabBarItems](self, "tabBarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[VUITabBarController tabBarItems](self, "tabBarItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if ((v11 & 1) != 0)
        break;
      ++v7;
      -[VUITabBarController tabBarItems](self, "tabBarItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v7 >= v13)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = -1;
  }

  return v7;
}

- (id)viewControllerWithTabIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "vuiViewControllerIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v10, "caseInsensitiveCompare:", v4))
        {
          v6 = v9;

          goto LABEL_12;
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "originalRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action dialogResult: %@, request: %@", (uint8_t *)&v16, 0x16u);

  }
  -[VUITabBarController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v7, "originalRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedActionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locateActionWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "deepLink");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[VideosUI processDeeplink:](_TtC8VideosUI8VideosUI, "processDeeplink:", v13);
    }
    else
    {
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action Deeplink does not exist", (uint8_t *)&v16, 2u);
      }

    }
    +[VideosUI messageViewController:didSelectActionWith:](_TtC8VideosUI8VideosUI, "messageViewController:didSelectActionWith:", v6, v7);
  }
  else
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "selectedActionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action Could not find action for %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (UIViewController)currentViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VUITabBarController vuiSelectedIndex](self, "vuiSelectedIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1F0283FC8))
    {
      objc_msgSend(v5, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    objc_msgSend(0, "currentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;
LABEL_10:

  return (UIViewController *)v7;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VUITabBarController vuiViewControllers](self, "vuiViewControllers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VUITabBarController _saveLastSelectedAndScrollToTop:selectedIndex:previousSelectedIndex:](self, "_saveLastSelectedAndScrollToTop:selectedIndex:previousSelectedIndex:", v5, objc_msgSend(v6, "indexOfObjectIdenticalTo:", v5), -[VUITabBarController previousSelectedIndex](self, "previousSelectedIndex"));

}

- (void)_saveLastSelectedAndScrollToTop:(id)a3 selectedIndex:(unint64_t)a4 previousSelectedIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = v7;
  if (v7 && a5 != a4)
  {
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "vuiViewControllerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("lastSelectedTabBarItemIdentifier"));
    goto LABEL_4;
  }
  if (v7)
  {
    if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v7;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v8 = v17;
      if ((isKindOfClass & 1) != 0)
      {
        v9 = v17;
        objc_msgSend(v9, "viewControllers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 1)
        {
          objc_msgSend(v9, "visibleViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_5;
          objc_msgSend(v9, "visibleViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "documentCreator");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scrollViewControllerToTop:animated:needsFocusUpdate:", v10, 1, 1);

          +[VideosUI notifyAppearingViewControllerOfTabSelection:](_TtC8VideosUI8VideosUI, "notifyAppearingViewControllerOfTabSelection:", v9);
        }
LABEL_4:

LABEL_5:
        v8 = v17;
      }
    }
  }

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)setUpdatingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updatingDelegate, a3);
}

- (id)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (unint64_t)previousSelectedIndex
{
  return self->_previousSelectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong(&self->_longPressHandler, 0);
  objc_destroyWeak((id *)&self->_updatingDelegate);
}

@end
