@implementation PUIReportController

- (PUIReportController)init
{
  PUIReportController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUIReportController;
  v2 = -[PUIReportController init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PUIReportController setReportManager:](v2, "setReportManager:", v3);

    v4 = (void *)objc_opt_new();
    -[PUIReportController setSensorManager:](v2, "setSensorManager:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_didBecomeActive, *MEMORY[0x1E0DC4750], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_dataDidChange, CFSTR("PSUITrackingReportDataHasChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_dataDidChange, CFSTR("PUIReportSensorManagerDataHasChangedNotification"), 0);

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v9, 0, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  -[PUIReportController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  -[PUIReportController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIReportController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("APP_PRIVACY_REPORT"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/PRIVACY_REPORT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.app-privacy-report"), v7, v11, v12);

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PUIReportController setReportEnabled:](self, "setReportEnabled:", -[PUIReportController isRecordActivityEnabled](self, "isRecordActivityEnabled"));
    -[PUIReportController setHasData:](self, "setHasData:", -[PUIReportController eitherSourceHasData](self, "eitherSourceHasData"));
    if (_os_feature_enabled_impl())
      -[PUIReportController specifiersForAppPrivacyReport](self, "specifiersForAppPrivacyReport");
    else
      -[PUIReportController specifiersForRecordAppActivity](self, "specifiersForRecordAppActivity");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    -[PUIReportController reloadAppAndTrackingData](self, "reloadAppAndTrackingData");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)specifiersForRecordAppActivity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("RECORD_APP_ACTIVITY_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForTrackers(CFSTR("RECORD_APP_ACTIVITY_FOOTER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D80848];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D80848]);

  objc_msgSend(v3, "addObject:", v4);
  v7 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForTrackers(CFSTR("RECORD_APP_ACTIVITY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setRecordActivityEnabled_specifier_, sel_isRecordActivityEnabled_, 0, 6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIdentifier:", CFSTR("RECORD_APP_ACTIVITY"));
  objc_msgSend(v3, "addObject:", v9);
  if (-[PUIReportController reportEnabled](self, "reportEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SAVE_APP_ACTIVITY_GROUP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController saveAppActivityFooterText](self, "saveAppActivityFooterText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

    objc_msgSend(v3, "addObject:", v10);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForTrackers(CFSTR("SAVE_APP_ACTIVITY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setIdentifier:", CFSTR("SAVE_APP_ACTIVITY"));
    objc_msgSend(v14, "setButtonAction:", sel_didTapSave);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUIReportController hasData](self, "hasData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D80808]);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    -[PUIReportController setSaveAppActivitySpecifier:](self, "setSaveAppActivitySpecifier:", v14);
    objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

- (void)dataDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PUIReportController_dataDidChange__block_invoke;
  block[3] = &unk_1EA26B358;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __36__PUIReportController_dataDidChange__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "reportEnabled");
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "isRecordActivityEnabled")
    && (v3 = objc_msgSend(*(id *)(a1 + 32), "hasData"),
        v3 == objc_msgSend(*(id *)(a1 + 32), "eitherSourceHasData")))
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "reloadSensorAndNetworkSpecifiersAnimated:", 0);
    }
    else
    {
      _PUILoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[PUIReportController dataDidChange]_block_invoke";
        _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s: only reloading time interval footer: state hasn't changed", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("SAVE_APP_ACTIVITY_GROUP"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "saveAppActivityFooterText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80848]);

      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", v6);
    }
  }
  else
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[PUIReportController dataDidChange]_block_invoke";
      _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading: state changed", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
}

- (void)reloadSensorAndNetworkSpecifiersAnimated:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (-[PUIReportController controllerMode](self, "controllerMode", a3) == 2)
  {
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke;
    block[3] = &unk_1EA26B358;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "dataAccessSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appNetworkActivityRowsAwaitingDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "websiteNetworkActivityRowsAwaitingDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domainNetworkActivityRowsAwaitingDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke_2;
  block[3] = &unk_1EA26BF38;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  int v26;
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
  id v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "learnMoreHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "sensorActivityRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sensorActivityHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_replaceRows:withRows:header:insertPoint:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setSensorActivityRows:", *(_QWORD *)(a1 + 40));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "appNetworkActivityRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "appNetworkActivityHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pui_replaceRows:withRows:header:insertPoint:", v10, v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setAppNetworkActivityRows:", *(_QWORD *)(a1 + 48));
  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "websiteNetworkActivityRows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "websiteNetworkActivityHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pui_replaceRows:withRows:header:insertPoint:", v15, v16, v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setWebsiteNetworkActivityRows:", *(_QWORD *)(a1 + 56));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "websiteNetworkActivityRows");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PUITrackerBarShowAppAttributedBadgeKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "BOOLValue");

        if ((v25 & 1) != 0)
        {
          v26 = 1;
          goto LABEL_11;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v21)
        continue;
      break;
    }
  }
  v26 = 0;
LABEL_11:

  objc_msgSend(*(id *)(a1 + 32), "websiteNetworkActivityHeader");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_NETWORK_ACTIVITY_FOOTER"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", *(_QWORD *)(a1 + 32));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("PUIAttributedStringTextViewDelegateKey"));

    v31 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;
    objc_msgSend(v31, "stringWithFormat:", v32, CFSTR("SF_SYMBOL_APPSTORE"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v29, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v34);
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appstore"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageWithRenderingMode:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = +[PUIAttributedStringFooter string:replacingSubstring:withImage:](PUIAttributedStringFooter, "string:replacingSubstring:withImage:", v35, CFSTR("SF_SYMBOL_APPSTORE"), v37);
    v39 = objc_alloc(MEMORY[0x1E0CB3778]);
    PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithString:", v40);

    v42 = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1EA26D430);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addAttribute:value:range:", v42, v43, 0, objc_msgSend(v41, "length"));

    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v35, "appendAttributedString:", v44);

    objc_msgSend(v35, "appendAttributedString:", v41);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("PUIAttributedStringFooterStringKey"));
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", v28);

    v18 = v51;
  }
  else
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v29);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, CFSTR("PUIAttributedStringFooterStringKey"));

    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", v28);
  }
  v46 = *(void **)(a1 + 32);
  objc_msgSend(v46, "domainNetworkActivityRows");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "domainNetworkActivityHeader");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "pui_replaceRows:withRows:header:insertPoint:", v47, v48, v49, v18);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDomainNetworkActivityRows:", *(_QWORD *)(a1 + 64));
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  -[PUIReportController presentAboutController](self, "presentAboutController", a3, a4, a5.location, a5.length, a6);
  return 0;
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
  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:detailText:symbolName:contentLayout:", v4, 0, 0, 2);

  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSectionWithHeader:content:", 0, v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__PUIReportController_presentAboutController__block_invoke;
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
  -[PUIReportController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v13, 3);

}

void __45__PUIReportController_presentAboutController__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)specifiersForAppPrivacyReport
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
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

  v3 = (void *)objc_opt_new();
  -[PUIReportController setCurrentControllerMode:](self, "setCurrentControllerMode:", -[PUIReportController controllerMode](self, "controllerMode"));
  v4 = -[PUIReportController controllerMode](self, "controllerMode");
  v5 = (_QWORD *)MEMORY[0x1E0D806F8];
  v6 = (_QWORD *)MEMORY[0x1E0D80700];
  if (!v4)
  {
    -[PUIReportController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", 0);

    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("PUIOnboardingCellDelegateKey"));

    objc_msgSend(v11, "setIdentifier:", CFSTR("ONBOARDING"));
    objc_msgSend(v3, "addObject:", v11);
    v14 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("ENABLE_REPORT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("ENABLE_REPORT"));
    objc_msgSend(v16, "setButtonAction:", sel_didTapTurnOnAppPrivacyReport);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1EA27E630, *v5);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v6);
    objc_msgSend(v3, "addObject:", v16);
LABEL_7:

    goto LABEL_8;
  }
  if (-[PUIReportController controllerMode](self, "controllerMode") != 1)
  {
    if (-[PUIReportController controllerMode](self, "controllerMode") != 2)
      goto LABEL_9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_didTapSave);
    -[PUIReportController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v11);

    -[PUIReportController headerSpecifiers](self, "headerSpecifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController setLearnMoreHeader:](self, "setLearnMoreHeader:", v18);

    -[PUIReportController learnMoreHeader](self, "learnMoreHeader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v19);

    -[PUIReportController dataAccessGroupSpecifiers](self, "dataAccessGroupSpecifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController setSensorActivityHeader:](self, "setSensorActivityHeader:", v20);

    -[PUIReportController appNetworkActivityGroupSpecifiers](self, "appNetworkActivityGroupSpecifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController setAppNetworkActivityHeader:](self, "setAppNetworkActivityHeader:", v21);

    -[PUIReportController websiteNetworkActivityGroupSpecifiers](self, "websiteNetworkActivityGroupSpecifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController setWebsiteNetworkActivityHeader:](self, "setWebsiteNetworkActivityHeader:", v22);

    -[PUIReportController mostContactedDomainsGroupSpecifiers](self, "mostContactedDomainsGroupSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportController setDomainNetworkActivityHeader:](self, "setDomainNetworkActivityHeader:", v16);
    goto LABEL_7;
  }
  -[PUIReportController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", 0);

  -[PUIReportController headerSpecifiers](self, "headerSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController setLearnMoreHeader:](self, "setLearnMoreHeader:", v8);

  -[PUIReportController learnMoreHeader](self, "learnMoreHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("NO_DATA_HEADER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("NO_DATA"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v3, "addObject:", v11);
LABEL_8:

LABEL_9:
  if (-[PUIReportController controllerMode](self, "controllerMode"))
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("DISABLE_REPORT_GROUP"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);
    v24 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("DISABLE_REPORT"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, 0, 0, 13, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setIdentifier:", CFSTR("DISABLE_REPORT"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1EA27E630, *v5);
    objc_msgSend(v26, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v6);
    objc_msgSend(v26, "setButtonAction:", sel_didTapTurnOffAppPrivacyReport);
    objc_msgSend(v3, "addObject:", v26);

  }
  return v3;
}

- (id)headerSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  NSRange v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("HEADER_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForAppReport(CFSTR("APP_REPORT_HEADER_TEXT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForAppReport(CFSTR("APP_REPORT_LINK_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x1E0D80838]);
  v13.location = objc_msgSend(v7, "rangeOfString:", v6);
  NSStringFromRange(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("presentAboutController"), *MEMORY[0x1E0D80820]);
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)dataAccessGroupSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForAppReport(CFSTR("DATA_SENSOR_ACCESS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("DATA_GROUP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PUI_LocalizedStringForAppReport(CFSTR("DATA_SENSOR_ACCESS_FOOTER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80848]);

  objc_msgSend(v2, "addObject:", v5);
  return v2;
}

- (id)dataAccessSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[PUIReportController sensorManager](self, "sensorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIReportSensorListController appSpecifiersFromManager:](PUIReportSensorListController, "appSpecifiersFromManager:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v5, "count");
  if (v7 >= 5)
    v8 = 5;
  else
    v8 = v7;
  objc_msgSend(v5, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6 >= 6)
  {
    v11 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, objc_opt_class(), 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setIdentifier:", CFSTR("SHOW_ALL_SENSOR"));
    -[PUIReportController sensorManager](self, "sensorManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PUIReportSensorManagerKey"));

    objc_msgSend(v10, "addObject:", v13);
  }
  return v10;
}

- (id)appNetworkActivityGroupSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForAppReport(CFSTR("APP_NETWORK_ACTIVITY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("APP_NETWORK_ACTIVITY_GROUP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PUI_LocalizedStringForAppReport(CFSTR("APP_NETWORK_ACTIVITY_FOOTER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80848]);

  objc_msgSend(v2, "addObject:", v5);
  return v2;
}

- (void)reloadAppNetworkActivitySpecifiersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PUIReportController_reloadAppNetworkActivitySpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1EA26BF88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[PUIReportAppListController appSpecifiersWithLimit:completion:](PUIReportAppListController, "appSpecifiersWithLimit:completion:", 6, v6);

}

void __72__PUIReportController_reloadAppNetworkActivitySpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v4, "count");
  if (v6 >= 5)
    v7 = 5;
  else
    v7 = v6;
  objc_msgSend(v3, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v8, "mutableCopy");
  if (v5 >= 6)
  {
    v9 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, *(_QWORD *)(a1 + 32), 0, 0, objc_opt_class(), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("SHOW_ALL_APP_NETWORK"));
    objc_msgSend(v14, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAppNetworkActivityRowsAwaitingDisplay:", v12);

  objc_msgSend(*(id *)(a1 + 32), "dataDidChange");
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

- (id)websiteNetworkActivityGroupSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_NETWORK_ACTIVITY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("WEBSITE_NETWORK_ACTIVITY_GROUP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80818]);

  objc_msgSend(v2, "addObject:", v5);
  return v2;
}

- (void)reloadWebsiteNetworkActivitySpecifiersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PUIReportController_reloadWebsiteNetworkActivitySpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1EA26BF88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[PUIReportWebsiteListController websiteSpecifiersWithLimit:showDetail:completion:](PUIReportWebsiteListController, "websiteSpecifiersWithLimit:showDetail:completion:", 6, 0, v6);

}

void __76__PUIReportController_reloadWebsiteNetworkActivitySpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v4, "count");
  if (v6 >= 5)
    v7 = 5;
  else
    v7 = v6;
  objc_msgSend(v3, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v8, "mutableCopy");
  if (v5 >= 6)
  {
    v9 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, *(_QWORD *)(a1 + 32), 0, 0, objc_opt_class(), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("SHOW_ALL_WEBSITES"));
    objc_msgSend(v14, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setWebsiteNetworkActivityRowsAwaitingDisplay:", v12);

  objc_msgSend(*(id *)(a1 + 32), "dataDidChange");
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

- (id)mostContactedDomainsGroupSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForAppReport(CFSTR("MOST_CONTACTED_DOMAINS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("DOMAINS_GROUP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PUI_LocalizedStringForAppReport(CFSTR("MOST_CONTACTED_DOMAINS_FOOTER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80848]);

  objc_msgSend(v2, "addObject:", v5);
  return v2;
}

- (void)reloadMostContactedDomainsSpecifiersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PUIReportController_reloadMostContactedDomainsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1EA26BF88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[PUIReportDomainListController domainSpecifiersWithLimit:showDates:showAppAndWebsiteCounts:showIPAddresses:completion:](PUIReportDomainListController, "domainSpecifiersWithLimit:showDates:showAppAndWebsiteCounts:showIPAddresses:completion:", 6, 0, 1, 0, v6);

}

void __74__PUIReportController_reloadMostContactedDomainsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = objc_msgSend(v3, "count");
  v5 = objc_msgSend(v3, "count");
  if (v5 >= 5)
    v6 = 5;
  else
    v6 = v5;
  objc_msgSend(v3, "subarrayWithRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "mutableCopy");

  if (v4 >= 6)
  {
    v8 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, *(_QWORD *)(a1 + 32), 0, 0, objc_opt_class(), 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIdentifier:", CFSTR("SHOW_ALL_DOMAIN"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PUIReportDomainListShowWebsiteAndAppCounts"));
    objc_msgSend(v13, "addObject:", v10);

  }
  v11 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setDomainNetworkActivityRowsAwaitingDisplay:", v11);

  objc_msgSend(*(id *)(a1 + 32), "dataDidChange");
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(void))(v12 + 16))();

}

- (void)didTapTurnOnAppPrivacyReport
{
  -[PUIReportController setRecordActivityEnabled:specifier:](self, "setRecordActivityEnabled:specifier:", MEMORY[0x1E0C9AAB0], 0);
}

- (void)didTapTurnOffAppPrivacyReport
{
  -[PUIReportController setRecordActivityEnabled:specifier:](self, "setRecordActivityEnabled:specifier:", MEMORY[0x1E0C9AAA0], 0);
}

- (unint64_t)controllerMode
{
  void *v3;
  int v4;

  -[PUIReportController reportManager](self, "reportManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "trackingReportEnabled");

  if (!v4)
    return 0;
  if (-[PUIReportController eitherSourceHasData](self, "eitherSourceHasData"))
    return 2;
  return 1;
}

- (void)reloadAppAndTrackingData
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_group_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  dispatch_group_t v12;
  os_signpost_id_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[PUIReportController reloadAppAndTrackingData]";
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  PUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, "PUIReportController.load");

  PUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportController.load", (const char *)&unk_1DB263E12, buf, 2u);
  }

  v8 = dispatch_group_create();
  -[PUIReportController reportManager](self, "reportManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke;
  v11[3] = &unk_1EA26BFB0;
  v11[4] = self;
  v12 = v8;
  v13 = v5;
  v10 = v8;
  objc_msgSend(v9, "reloadEnabledWithCompletion:", v11);

}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_2;
  v5[3] = &unk_1EA26BFB0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "reloadAppAccessHasDataWithCompletion:", v5);

}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_3;
  v15[3] = &unk_1EA26B358;
  v3 = *(void **)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v3, "reloadAppNetworkActivitySpecifiersWithCompletion:", v15);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_4;
  v13[3] = &unk_1EA26B358;
  v4 = *(void **)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v4, "reloadWebsiteNetworkActivitySpecifiersWithCompletion:", v13);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_5;
  v11[3] = &unk_1EA26B358;
  v5 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v5, "reloadMostContactedDomainsSpecifiersWithCompletion:", v11);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "sensorManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_6;
  v9[3] = &unk_1EA26B358;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v6, "reloadDataWithCompletion:", v9);

  v7 = *(NSObject **)(a1 + 32);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportController.load", (const char *)&unk_1DB263E12, (uint8_t *)&v6, 2u);
  }

  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUIReportController reloadAppAndTrackingData]_block_invoke";
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }

}

- (id)saveAppActivityFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  if (-[PUIReportController hasData](self, "hasData"))
  {
    -[PUIReportController reportManager](self, "reportManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enabledDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v10 = &stru_1EA26D430;
      return v10;
    }
    -[PUIReportController reportManager](self, "reportManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enabledDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = fabs(v7);

    if (v8 <= 604800.0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForTrackers(CFSTR("SAVE_APP_ACTIVITY_FOOTER"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v12, (unint64_t)(v8 / 86400.0));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
    v9 = CFSTR("SAVE_APP_ACTIVITY_FOOTER_7_DAYS");
  }
  else
  {
    v9 = CFSTR("SAVE_APP_ACTIVITY_NO_DATA_FOOTER");
  }
  PUI_LocalizedStringForTrackers(v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  -[PUIReportController viewDidLoad](&v4, sel_viewDidLoad);
  PUI_LocalizedStringForPrivacy(CFSTR("APP_PRIVACY_REPORT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportController;
  -[PUIReportController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D8D658], "trackingRecordAppActivityVisited");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", CFSTR("AppTrackingTTRActivity"));
    objc_msgSend(v6, "setEligibleForHandoff:", 0);
    objc_msgSend(v6, "setUserInfo:", &unk_1EA27EAA8);
    -[PUIReportController setUserActivity:](self, "setUserActivity:", v6);

  }
}

- (BOOL)eitherSourceHasData
{
  void *v3;
  BOOL v4;

  -[PUIReportController reportManager](self, "reportManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "hadDataInLastQuery") & 1) != 0
    || -[PUIReportController appAccessHasData](self, "appAccessHasData");

  return v4;
}

- (BOOL)appAccessHasData
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PUIReportAppAccessHasData"));

  return v3;
}

- (void)reloadAppAccessHasDataWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke;
  block[3] = &unk_1EA26B718;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD v13[3];
  char v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  objc_msgSend(getPAAccessReaderClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publisherForAll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80C50], "accessPublisherWithoutHiddenOrMissingApps:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C50], "accessPublisherWithoutUnknownCategoryAccesses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80C50], "accessPublisherWithoutOutOfProcessPickerAccesses:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_3;
  v12[3] = &unk_1EA26C018;
  v12[4] = v13;
  v8 = (id)objc_msgSend(v6, "sinkWithCompletion:shouldContinue:", &__block_literal_global_5, v12);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_4;
  block[3] = &unk_1EA26C040;
  v11 = v13;
  v10 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v13, 8);
}

uint64_t __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_4(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v9 = 136315138;
    v10 = "-[PUIReportController reloadAppAccessHasDataWithCompletion:]_block_invoke_4";
    v5 = "%s: PAAccessReader has data";
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    v9 = 136315138;
    v10 = "-[PUIReportController reloadAppAccessHasDataWithCompletion:]_block_invoke";
    v5 = "%s: PAAccessReader has no data";
  }
  _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, 0xCu);
LABEL_7:

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), CFSTR("PUIReportAppAccessHasData"));

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  return result;
}

+ (BOOL)isRecordActivityEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "trackingReportEnabled"))
  {
    objc_msgSend(getPAAccessReaderClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "loggingEnabled");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isRecordActivityEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PUIReportController reportManager](self, "reportManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "trackingReportEnabled"))
  {
    objc_msgSend(getPAAccessReaderClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "loggingEnabled");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)isRecordActivityEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUIReportController isRecordActivityEnabled](self, "isRecordActivityEnabled", a3));
}

- (void)setRecordActivityEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
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
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD);
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke;
  v25[3] = &unk_1EA26C068;
  v25[4] = self;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0AB308](v25);
  if (objc_msgSend(v6, "BOOLValue"))
  {
    v9[2](v9, objc_msgSend(v6, "BOOLValue"));
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3450];
    PUI_LocalizedStringForTrackers(CFSTR("STOP_RECORDING_ALERT_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForTrackers(CFSTR("STOP_RECORDING_ALERT_MESSAGE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForTrackers(CFSTR("STOP_RECORDING_ALERT_CANCEL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_2;
    v23[3] = &unk_1EA26B688;
    v23[4] = self;
    v24 = v7;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForTrackers(CFSTR("STOP_RECORDING_ALERT_OK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_3;
    v20[3] = &unk_1EA26C090;
    v22 = v9;
    v21 = v6;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v19);

    -[PUIReportController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

void __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "reportManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrackingReportEnabled:", a2);

  objc_msgSend(getPAAccessReaderClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoggingEnabled:", a2);

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("PUIReportAppAccessHasData"));

  }
  objc_msgSend(*(id *)(a1 + 32), "reloadAppAndTrackingData");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PUIReportActivityEnabledChanged"), 0);

}

uint64_t __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
}

- (void)didTapSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D8D658], "trackingAppActivitySaved");
  -[PUIReportController saveAppActivitySpecifier](self, "saveAppActivitySpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PUIActivityButtonCellIsActive"));

  PUI_LocalizedStringForTrackers(CFSTR("SAVING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController saveAppActivitySpecifier](self, "saveAppActivitySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

  -[PUIReportController saveAppActivitySpecifier](self, "saveAppActivitySpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController reloadSpecifier:](self, "reloadSpecifier:", v6);

  -[PUIReportController reportManager](self, "reportManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__PUIReportController_didTapSave__block_invoke;
  v8[3] = &unk_1EA26B358;
  v8[4] = self;
  objc_msgSend(v7, "reloadDataWithCompletion:", v8);

}

void __33__PUIReportController_didTapSave__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PUIReportController didTapSave]_block_invoke";
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "%s: trackingReportManager export started", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PUIReportController_didTapSave__block_invoke_228;
  block[3] = &unk_1EA26B358;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

void __33__PUIReportController_didTapSave__block_invoke_228(uint64_t a1)
{
  void *v2;
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
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getPAAccessReaderClass(), "fileNameForExport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "open");
  objc_msgSend(getPAAccessReaderClass(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publisherForAll");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80C50], "accessPublisherWithoutHiddenOrMissingApps:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C50], "accessPublisherWithoutUnknownCategoryAccesses:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(getPAAccessReaderClass(), "exportFromPublisher:toStream:error:", v12, v8, &v25);
  v13 = v25;
  if (v13)
  {
    _PUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __33__PUIReportController_didTapSave__block_invoke_228_cold_2();

  }
  objc_msgSend(*(id *)(a1 + 32), "reportManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v15, "exportToStream:error:", v8, &v24);
  v16 = v24;

  _PUILoggingFacility();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __33__PUIReportController_didTapSave__block_invoke_228_cold_1();
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PUIReportController didTapSave]_block_invoke";
    _os_log_impl(&dword_1DB1FB000, v18, OS_LOG_TYPE_DEFAULT, "%s: trackingReportManager export completed", buf, 0xCu);
  }

  objc_msgSend(v8, "close");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PUIReportController_didTapSave__block_invoke_232;
  block[3] = &unk_1EA26B438;
  v19 = *(_QWORD *)(a1 + 32);
  v22 = v7;
  v23 = v19;
  v20 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __33__PUIReportController_didTapSave__block_invoke_232(uint64_t a1)
{
  id v2;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D96D28]);
  v21[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v3, 0);

  objc_msgSend(*(id *)(a1 + 40), "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBarButtonItem:", v9);

  }
  else
  {
    objc_msgSend(v7, "specifierForID:", CFSTR("SAVE_APP_ACTIVITY"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D80940]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "view");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v14;

    objc_msgSend(v4, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceView:", v8);
  }

  v15 = *MEMORY[0x1E0D96DC8];
  v20[0] = *MEMORY[0x1E0D96D90];
  v20[1] = v15;
  v16 = *MEMORY[0x1E0D96E08];
  v20[2] = *MEMORY[0x1E0D96D80];
  v20[3] = v16;
  v20[4] = *MEMORY[0x1E0D96E00];
  v20[5] = CFSTR("com.apple.reminders.RemindersEditorExtension");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExcludedActivityTypes:", v17);

  v18 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__PUIReportController_didTapSave__block_invoke_2;
  v19[3] = &unk_1EA26B358;
  v19[4] = v18;
  objc_msgSend(v18, "presentViewController:animated:completion:", v4, 1, v19);

}

void __33__PUIReportController_didTapSave__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "saveAppActivitySpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PUIActivityButtonCellIsActive"));

  PUI_LocalizedStringForTrackers(CFSTR("SAVE_APP_ACTIVITY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "saveAppActivitySpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v3);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "saveAppActivitySpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifier:", v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PUIReportController;
  v6 = a4;
  -[PUIReportController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v20.receiver, v20.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = *MEMORY[0x1E0D80868];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D80868]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DISABLE_REPORT"));

    if (v12)
    {
      v13 = v7;
      if (objc_msgSend(v13, "type") == 13)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTextColor:", v14);

        goto LABEL_9;
      }

    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ONBOARDING"));

  if (v17)
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  v18 = v7;
LABEL_9:

  return v7;
}

- (PUITrackingReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportManager, a3);
}

- (PUIReportSensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
  objc_storeStrong((id *)&self->_sensorManager, a3);
}

- (BOOL)reportEnabled
{
  return self->_reportEnabled;
}

- (void)setReportEnabled:(BOOL)a3
{
  self->_reportEnabled = a3;
}

- (BOOL)hasData
{
  return self->_hasData;
}

- (void)setHasData:(BOOL)a3
{
  self->_hasData = a3;
}

- (PSSpecifier)saveAppActivitySpecifier
{
  return self->_saveAppActivitySpecifier;
}

- (void)setSaveAppActivitySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_saveAppActivitySpecifier, a3);
}

- (unint64_t)currentControllerMode
{
  return self->_currentControllerMode;
}

- (void)setCurrentControllerMode:(unint64_t)a3
{
  self->_currentControllerMode = a3;
}

- (NSArray)learnMoreHeader
{
  return self->_learnMoreHeader;
}

- (void)setLearnMoreHeader:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreHeader, a3);
}

- (NSArray)sensorActivityHeader
{
  return self->_sensorActivityHeader;
}

- (void)setSensorActivityHeader:(id)a3
{
  objc_storeStrong((id *)&self->_sensorActivityHeader, a3);
}

- (NSArray)sensorActivityRows
{
  return self->_sensorActivityRows;
}

- (void)setSensorActivityRows:(id)a3
{
  objc_storeStrong((id *)&self->_sensorActivityRows, a3);
}

- (NSArray)appNetworkActivityHeader
{
  return self->_appNetworkActivityHeader;
}

- (void)setAppNetworkActivityHeader:(id)a3
{
  objc_storeStrong((id *)&self->_appNetworkActivityHeader, a3);
}

- (NSArray)appNetworkActivityRows
{
  return self->_appNetworkActivityRows;
}

- (void)setAppNetworkActivityRows:(id)a3
{
  objc_storeStrong((id *)&self->_appNetworkActivityRows, a3);
}

- (NSArray)appNetworkActivityRowsAwaitingDisplay
{
  return self->_appNetworkActivityRowsAwaitingDisplay;
}

- (void)setAppNetworkActivityRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_appNetworkActivityRowsAwaitingDisplay, a3);
}

- (NSArray)websiteNetworkActivityHeader
{
  return self->_websiteNetworkActivityHeader;
}

- (void)setWebsiteNetworkActivityHeader:(id)a3
{
  objc_storeStrong((id *)&self->_websiteNetworkActivityHeader, a3);
}

- (NSArray)websiteNetworkActivityRows
{
  return self->_websiteNetworkActivityRows;
}

- (void)setWebsiteNetworkActivityRows:(id)a3
{
  objc_storeStrong((id *)&self->_websiteNetworkActivityRows, a3);
}

- (NSArray)websiteNetworkActivityRowsAwaitingDisplay
{
  return self->_websiteNetworkActivityRowsAwaitingDisplay;
}

- (void)setWebsiteNetworkActivityRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_websiteNetworkActivityRowsAwaitingDisplay, a3);
}

- (NSArray)domainNetworkActivityHeader
{
  return self->_domainNetworkActivityHeader;
}

- (void)setDomainNetworkActivityHeader:(id)a3
{
  objc_storeStrong((id *)&self->_domainNetworkActivityHeader, a3);
}

- (NSArray)domainNetworkActivityRows
{
  return self->_domainNetworkActivityRows;
}

- (void)setDomainNetworkActivityRows:(id)a3
{
  objc_storeStrong((id *)&self->_domainNetworkActivityRows, a3);
}

- (NSArray)domainNetworkActivityRowsAwaitingDisplay
{
  return self->_domainNetworkActivityRowsAwaitingDisplay;
}

- (void)setDomainNetworkActivityRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_domainNetworkActivityRowsAwaitingDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_domainNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_sensorActivityRows, 0);
  objc_storeStrong((id *)&self->_sensorActivityHeader, 0);
  objc_storeStrong((id *)&self->_learnMoreHeader, 0);
  objc_storeStrong((id *)&self->_saveAppActivitySpecifier, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
}

void __33__PUIReportController_didTapSave__block_invoke_228_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB1FB000, v0, v1, "%s: trackingReportManager export error: %@", v2, v3, v4, v5, 2u);
}

void __33__PUIReportController_didTapSave__block_invoke_228_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB1FB000, v0, v1, "%s: PAAccessReader error: %@", v2, v3, v4, v5, 2u);
}

@end
