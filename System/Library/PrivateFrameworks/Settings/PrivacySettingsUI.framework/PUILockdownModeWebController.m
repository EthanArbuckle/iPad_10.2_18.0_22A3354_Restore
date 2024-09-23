@implementation PUILockdownModeWebController

- (PUILockdownModeWebController)init
{
  PUILockdownModeWebController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUILockdownModeWebController;
  v2 = -[PUILockdownModeWebController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didBecomeActive, *MEMORY[0x1E0DC4750], 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUILockdownModeWebController;
  -[PUILockdownModeWebController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  -[PUILockdownModeWebController setSearchController:](self, "setSearchController:", v3);

  -[PUILockdownModeWebController searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchResultsUpdater:", self);

  -[PUILockdownModeWebController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObscuresBackgroundDuringPresentation:", 0);

  -[PUILockdownModeWebController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyboardType:", 0);

  -[PUILockdownModeWebController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILockdownModeWebController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchController:", v8);

  -[PUILockdownModeWebController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)refreshLinkStatusInParent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80618]));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]));

}

- (void)dataDidChange
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PUILockdownModeWebController_dataDidChange__block_invoke;
  v2[3] = &unk_1EA26CB38;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __45__PUILockdownModeWebController_dataDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeWebController;
  -[PUILockdownModeWebController dealloc](&v4, sel_dealloc);
}

- (void)didBecomeActive
{
  -[PUILockdownModeWebController set_allSpecifiers:](self, "set_allSpecifiers:", 0);
  -[PUILockdownModeWebController reloadSpecifiers](self, "reloadSpecifiers");
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)reloadSpecifiers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUILockdownModeWebController;
  -[PUILockdownModeWebController reloadSpecifiers](&v3, sel_reloadSpecifiers);
  -[PUILockdownModeWebController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", self->_searchController);
}

- (id)specifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  objc_class *v74;
  void *v75;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id obj;
  void *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint8_t v104[128];
  _BYTE buf[24];
  void *v106;
  uint64_t *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  -[PUILockdownModeWebController _allSpecifiers](self, "_allSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v81 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("LOCKDOWN_MODE_GROUP"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForLockdownMode(CFSTR("WEB_CONTENT_FOOTER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getLocalizedDeviceName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80848]);

    objc_msgSend(v81, "addObject:", v77);
    v84 = (void *)objc_opt_new();
    v99 = 0;
    v100 = &v99;
    v101 = 0x2020000000;
    v7 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
    v102 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
    if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
      v106 = &unk_1EA26B260;
      v107 = &v99;
      __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)buf);
      v7 = (uint64_t (*)(void))v100[3];
    }
    _Block_object_dispose(&v99, 8);
    if (!v7)
    {
      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      __break(1u);
    }
    v93 = (void *)v7();
    CFPreferencesCopyApplicationList((CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v96;
      v83 = *MEMORY[0x1E0D808C8];
      v82 = *MEMORY[0x1E0D80990];
      v79 = *MEMORY[0x1E0D808C0];
      v80 = *MEMORY[0x1E0D808D0];
      v78 = *MEMORY[0x1E0D80870];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v96 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1DF0AB164]();
          objc_msgSend(v11, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v93, "containsObject:", v13))
            goto LABEL_27;
          objc_msgSend(v11, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PUILockdownModeWebController shouldShowBundleID:](self, "shouldShowBundleID:", v14);

          if (v15 && (objc_msgSend(v11, "isWebBrowser") & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E0D804E8];
            objc_msgSend(v11, "localizedName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, sel_setAppLockdownModeEnabled_forSpecifier_, sel_isSpecifierEnabled_, 0, 6, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = (void *)MEMORY[0x1E0CA5898];
            objc_msgSend(v11, "bundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0;
            objc_msgSend(v18, "bundleRecordWithApplicationIdentifier:error:", v19, &v94);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v94;

            if (v90)
            {
              _PUILoggingFacility();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "bundleIdentifier");
                v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v22 = objc_msgSend(v21, "UTF8String");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[PUILockdownModeWebController specifiers]";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v22;
                _os_log_error_impl(&dword_1DB1FB000, v20, OS_LOG_TYPE_ERROR, "%s - could not get bundle record for %s", buf, 0x16u);

              }
            }
            else
            {
              objc_msgSend(v89, "dataContainerURL");
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v23 = objc_alloc(MEMORY[0x1E0C99EA0]);
                objc_msgSend(v89, "bundleIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "bundleIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v86, "containsObject:", v25))
                  v26 = 0;
                else
                  v26 = v20;
                v27 = (void *)objc_msgSend(v23, "_initWithSuiteName:container:", v24, v26);

                if (objc_msgSend(v27, "BOOLForKey:", CFSTR("WebKitCaptivePortalModeAlertShown")))
                {
                  -[NSObject path](v20, "path");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v83);
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v88, CFSTR("PUILockdownModeWebContainerPathKey"));
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PUILockdownModeUtilities isCaptivePortalModeIgnoredForContainerPath:](PUILockdownModeUtilities, "isCaptivePortalModeIgnoredForContainerPath:", v88) ^ 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, v82);

                  objc_msgSend(v11, "bundleIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilecal"));

                  if (v30)
                  {
                    v31 = objc_alloc(MEMORY[0x1E0D3A820]);
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v87 = (void *)objc_msgSend(v31, "initWithDate:calendar:format:", v32, v33, 0);

                    v34 = objc_alloc(MEMORY[0x1E0D3A830]);
                    PSBlankIconImage();
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "size");
                    v37 = v36;
                    v39 = v38;
                    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "scale");
                    v85 = (void *)objc_msgSend(v34, "initWithSize:scale:", v37, v39, v41);

                    v103 = v85;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "prepareImagesForImageDescriptors:", v42);

                    objc_msgSend(v87, "imageForDescriptor:", v85);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = (void *)MEMORY[0x1E0DC3870];
                    v45 = objc_msgSend(v43, "CGImage");
                    objc_msgSend(v43, "scale");
                    objc_msgSend(v44, "imageWithCGImage:scale:orientation:", v45, 0);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", v46, v78);

                  }
                  else
                  {
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v80);
                    objc_msgSend(v11, "bundleIdentifier");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", v87, v79);
                  }

                  objc_msgSend(v84, "addObject:", v13);
                }

              }
            }

LABEL_27:
          }
          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
      }
      while (v8);
    }

    -[PUILockdownModeWebController safariSettingsBundle](self, "safariSettingsBundle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = objc_msgSend(v47, "classNamed:", CFSTR("SafariLockdownModePerSitePreferenceSettingsController"));
      if (v49)
      {
        objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
        v50 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObject:", v50);
        v51 = (void *)MEMORY[0x1E0D804E8];
        PUI_LocalizedStringForLockdownMode(CFSTR("WEBSITES"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, self, 0, 0, v49, 2, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v81, "addObject:", v53);
      }
      else
      {
        _PUILoggingFacility();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          -[PUILockdownModeWebController specifiers].cold.3(v50, v61, v62, v63, v64, v65, v66, v67);
      }
    }
    else
    {
      _PUILoggingFacility();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        -[PUILockdownModeWebController specifiers].cold.2(v50, v54, v55, v56, v57, v58, v59, v60);
    }

    if (objc_msgSend(v84, "count"))
    {
      v68 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForLockdownMode(CFSTR("APPS_SECTION"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "groupSpecifierWithID:name:", CFSTR("APPS_GROUP"), v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "addObject:", v70);
      objc_msgSend(v84, "sortUsingFunction:context:", PUICompareSpecifiersByName, 0);
      objc_msgSend(v81, "addObjectsFromArray:", v84);

    }
    -[PUILockdownModeWebController set_allSpecifiers:](self, "set_allSpecifiers:", v81);

  }
  -[PUILockdownModeWebController searchController](self, "searchController");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "isActive");

  if (v72)
  {
    v73 = (int)*MEMORY[0x1E0D80590];
  }
  else
  {
    -[PUILockdownModeWebController _allSpecifiers](self, "_allSpecifiers");
    v74 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v73 = (int)*MEMORY[0x1E0D80590];
    v75 = *(Class *)((char *)&self->super.super.super.super.super.isa + v73);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v73) = v74;

  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + v73);
}

- (id)isSpecifierEnabled:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

- (void)setAppLockdownModeEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D80990];
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0D80990]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v8) & 1) == 0)
  {
    v9 = objc_msgSend(v5, "BOOLValue");
    _PUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[PUILockdownModeWebController setAppLockdownModeEnabled:forSpecifier:]";
      v14 = 1024;
      v15 = v9;
      _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s - enable for app: %d", (uint8_t *)&v12, 0x12u);
    }

    objc_msgSend(v6, "setProperty:forKey:", v5, v7);
    objc_msgSend(v6, "propertyForKey:", CFSTR("PUILockdownModeWebContainerPathKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUILockdownModeUtilities setCaptivePortalModeIgnoredForContainerPath:ignored:](PUILockdownModeUtilities, "setCaptivePortalModeIgnoredForContainerPath:ignored:", v11, v9 ^ 1u);

  }
}

- (void)presentAboutController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = objc_alloc(MEMORY[0x1E0D651A8]);
  PUI_LocalizedStringForLockdownMode(CFSTR("WEB_CONTENT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:detailText:symbolName:contentLayout:", v4, 0, 0, 2);

  PUI_LocalizedStringForLockdownMode(CFSTR("LEARN_MORE_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSectionWithHeader:content:", 0, v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PUILockdownModeWebController_presentAboutController__block_invoke;
  v14[3] = &unk_1EA26BF60;
  v15 = v5;
  v9 = v5;
  objc_msgSend(v8, "actionWithHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 0, v10);

  objc_msgSend(v9, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  -[PUILockdownModeWebController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v13, 3);

}

void __54__PUILockdownModeWebController_presentAboutController__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)safariSettingsBundle
{
  if (safariSettingsBundle_onceToken != -1)
    dispatch_once(&safariSettingsBundle_onceToken, &__block_literal_global_19);
  return (id)safariSettingsBundle_bundle;
}

void __52__PUILockdownModeWebController_safariSettingsBundle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  SFRuntimeAbsoluteFilePathForPath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safariSettingsBundle_bundle;
  safariSettingsBundle_bundle = v1;

}

- (BOOL)shouldShowBundleID:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = shouldShowBundleID__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldShowBundleID__onceToken, &__block_literal_global_58);
  v5 = objc_msgSend((id)shouldShowBundleID__bundleIDs, "containsObject:", v4);

  return v5 ^ 1;
}

void __51__PUILockdownModeWebController_shouldShowBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)shouldShowBundleID__bundleIDs;
  shouldShowBundleID__bundleIDs = (uint64_t)&unk_1EA27EB10;

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v5 = (void *)objc_opt_new();
    -[PUILockdownModeWebController _allSpecifiers](self, "_allSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PUILockdownModeWebController_updateSearchResultsForSearchController___block_invoke;
    v9[3] = &unk_1EA26B768;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    -[PUILockdownModeWebController setSpecifiers:](self, "setSpecifiers:", v7);
  }
  else
  {
    -[PUILockdownModeWebController _allSpecifiers](self, "_allSpecifiers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUILockdownModeWebController setSpecifiers:](self, "setSpecifiers:", v7);
  }

}

void __71__PUILockdownModeWebController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "cellType") == 6)
  {
    objc_msgSend(v5, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (NSArray)_allSpecifiers
{
  return self->__allSpecifiers;
}

- (void)set_allSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->__allSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0_3(&dword_1DB1FB000, a1, a3, "%s Error getting Safari LockdownMode class", a5, a6, a7, a8, 2u);
}

@end
