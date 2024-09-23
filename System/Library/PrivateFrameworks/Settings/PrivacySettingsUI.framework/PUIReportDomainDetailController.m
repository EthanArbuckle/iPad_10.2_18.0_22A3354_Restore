@implementation PUIReportDomainDetailController

- (PUIReportDomainDetailController)init
{
  PUIReportDomainDetailController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportDomainDetailController;
  v2 = -[PUIReportDomainDetailController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_dataDidChange, *MEMORY[0x1E0DC4750], 0);

    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v5, 0, 0);

  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
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
  void *v39;
  void *v40;
  NSRange v41;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[PUIReportDomainDetailController domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PUIReportDomainDetailController specifier](self, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PUIReportDomainKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportDomainDetailController setDomain:](self, "setDomain:", v8);

    }
    -[PUIReportDomainDetailController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUIReportDomainDetailTrackerTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    -[PUIReportDomainDetailController specifier](self, "specifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PUIReportDomainDetailOwnerKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIReportDomainDetailController domain](self, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("OWNED_BY_GROUP"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForAppReport(CFSTR("OWNED_BY_FOOTER_LINK"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    if (v11 == 1)
      v17 = CFSTR("OWNED_BY_TRACKER_FOOTER");
    else
      v17 = CFSTR("OWNED_BY_FOOTER");
    PUI_LocalizedStringForAppReport(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ %@"), v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", v19, *MEMORY[0x1E0D80838]);
    v40 = (void *)v15;
    v41.location = objc_msgSend(v19, "rangeOfString:", v15);
    NSStringFromRange(v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", v20, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", v21, *MEMORY[0x1E0D80830]);

    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", v23, *MEMORY[0x1E0D80818]);

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("didTapLearnMore"), *MEMORY[0x1E0D80820]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D80848]);
    v24 = v5;
    objc_msgSend(v5, "addObject:", v14);
    v25 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("DOMAIN"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, sel_valueForSpecifier_, 0, 4, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setIdentifier:", CFSTR("DOMAIN"));
    objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D80990]);
    if (objc_msgSend(v39, "length"))
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForAppReport(CFSTR("OWNED_BY_%@"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v29, v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("PUITrackerCellSubtitleTextKey"));

    }
    objc_msgSend(v24, "addObject:", v27);
    v31 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("APPS_CONTACTING_DOMAIN"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "groupSpecifierWithID:name:", CFSTR("APPS_CONTACTING_TRACKER_GROUP"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportDomainDetailController setAppHeader:](self, "setAppHeader:", v33);

    v34 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SITES_CONTACTING_DOMAIN"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "groupSpecifierWithID:name:", CFSTR("SITES_CONTACTING_TRACKER_GROUP"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportDomainDetailController setWebsiteHeader:](self, "setWebsiteHeader:", v36);

    v37 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v24;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dataDidChange
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  _QWORD v19[5];
  NSObject *v20;
  _QWORD v21[5];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PUIReportDomainDetailController dataDidChange]";
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  PUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, "PUIReportDomainDetailController.load");

  PUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportDomainDetailController.load", (const char *)&unk_1DB263E12, buf, 2u);
  }

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = (void *)objc_opt_new();
  v10 = *MEMORY[0x1E0DB04C8];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA27E7B0, *MEMORY[0x1E0DB04C8]);
  -[PUIReportDomainDetailController domain](self, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DB04A0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DB04A0]);

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke;
  v21[3] = &unk_1EA26C600;
  v21[4] = self;
  v14 = v8;
  v22 = v14;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v9, v21);
  dispatch_group_enter(v14);
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1EA27E7C8, v10);
  -[PUIReportDomainDetailController domain](self, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v12);

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_76;
  v19[3] = &unk_1EA26C600;
  v19[4] = self;
  v20 = v14;
  v17 = v14;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v15, v19);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v5;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appSpecifiersFromResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAppRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_76(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "websiteSpecifiersFromResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2_77;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2_77(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWebsiteRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_3(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportDomainDetailController.load", (const char *)&unk_1DB263E12, (uint8_t *)&v6, 2u);
  }

  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUIReportDomainDetailController dataDidChange]_block_invoke";
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }

}

- (void)reloadAsyncSpecifiers
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PUIReportDomainDetailController specifierForID:](self, "specifierForID:", CFSTR("DOMAIN"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController appRows](self, "appRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController appRowsAwaitingDisplay](self, "appRowsAwaitingDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController appHeader](self, "appHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v4, v5, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportDomainDetailController appRowsAwaitingDisplay](self, "appRowsAwaitingDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController setAppRows:](self, "setAppRows:", v9);

  -[PUIReportDomainDetailController websiteRows](self, "websiteRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController websiteRowsAwaitingDisplay](self, "websiteRowsAwaitingDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController websiteHeader](self, "websiteHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v10, v11, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportDomainDetailController websiteRowsAwaitingDisplay](self, "websiteRowsAwaitingDisplay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainDetailController setWebsiteRows:](self, "setWebsiteRows:", v15);

}

- (id)appSpecifiersFromResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v23 = *(_QWORD *)v26;
    v22 = *MEMORY[0x1E0D808C0];
    v7 = *MEMORY[0x1E0D808D0];
    v8 = *MEMORY[0x1E0D80990];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D804E8];
        -[PUIReportDomainDetailController nameForAppID:](self, "nameForAppID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, sel_valueForSpecifier_, 0, 4, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setIdentifier:", v11);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v22);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);
        v15 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxTimeStamp"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v16, "integerValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUIReportDomainDetailController timeStringForDate:](self, "timeStringForDate:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v8);

        objc_msgSend(v24, "addObject:", v14);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v19 = (void *)objc_msgSend(v24, "copy");
  return v19;
}

- (id)websiteSpecifiersFromResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v24;
    v7 = *MEMORY[0x1E0D80990];
    v8 = *MEMORY[0x1E0D80870];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("context"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_valueForSpecifier_, 0, 4, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdentifier:", v11);
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxTimeStamp"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v14, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUIReportDomainDetailController timeStringForDate:](self, "timeStringForDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v7);

        -[PUIReportDomainDetailController iconForContext:](self, "iconForContext:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v8);

        objc_msgSend(v22, "addObject:", v12);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v22, "copy");
  return v18;
}

- (void)didTapLearnMore
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
  v14[2] = __50__PUIReportDomainDetailController_didTapLearnMore__block_invoke;
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
  -[PUIReportDomainDetailController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v13, 3);

}

void __50__PUIReportDomainDetailController_didTapLearnMore__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)nameForAppID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v3, 0);
  objc_msgSend(v4, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v3;

  return v5;
}

- (id)timeStringForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(v4, "setDateStyle:", 1);
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
}

- (id)iconForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  PUIWebsiteIconView();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringWithRange:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  PUIImageFromLabel(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (PSSpecifier)appHeader
{
  return self->_appHeader;
}

- (void)setAppHeader:(id)a3
{
  objc_storeStrong((id *)&self->_appHeader, a3);
}

- (NSArray)appRows
{
  return self->_appRows;
}

- (void)setAppRows:(id)a3
{
  objc_storeStrong((id *)&self->_appRows, a3);
}

- (NSArray)appRowsAwaitingDisplay
{
  return self->_appRowsAwaitingDisplay;
}

- (void)setAppRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_appRowsAwaitingDisplay, a3);
}

- (PSSpecifier)websiteHeader
{
  return self->_websiteHeader;
}

- (void)setWebsiteHeader:(id)a3
{
  objc_storeStrong((id *)&self->_websiteHeader, a3);
}

- (NSArray)websiteRows
{
  return self->_websiteRows;
}

- (void)setWebsiteRows:(id)a3
{
  objc_storeStrong((id *)&self->_websiteRows, a3);
}

- (NSArray)websiteRowsAwaitingDisplay
{
  return self->_websiteRowsAwaitingDisplay;
}

- (void)setWebsiteRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_websiteRowsAwaitingDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteRows, 0);
  objc_storeStrong((id *)&self->_websiteHeader, 0);
  objc_storeStrong((id *)&self->_appRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appRows, 0);
  objc_storeStrong((id *)&self->_appHeader, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
