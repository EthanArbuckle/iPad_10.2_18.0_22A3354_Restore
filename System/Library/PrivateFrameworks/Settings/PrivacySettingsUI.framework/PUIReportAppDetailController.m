@implementation PUIReportAppDetailController

- (PUIReportAppDetailController)init
{
  PUIReportAppDetailController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIReportAppDetailController;
  v2 = -[PUIReportAppDetailController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_dataDidChange, *MEMORY[0x1E0DC4750], 0);

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
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PUIReportAppDetailController specifier](self, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PUIReportAppIDKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportAppDetailController setBundleID:](self, "setBundleID:", v8);

    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v10, v11, 0);

    v12 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v13, 0, 0);

    objc_msgSend(v14, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("APP_GROUP"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PUIReportAppDetailController shouldShowOtherContent](self, "shouldShowOtherContent"))
    {
      PUI_LocalizedStringForAppReport(CFSTR("APP_UPDATE_FOOTER"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D80848]);

    }
    objc_msgSend(v5, "addObject:", v16);
    v18 = (void *)MEMORY[0x1E0D804E8];
    v19 = objc_msgSend(v15, "length");
    v20 = v15;
    if (!v19)
    {
      -[PUIReportAppDetailController bundleID](self, "bundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, sel_valueForSpecifier_, 0, 4, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)

    objc_msgSend(v21, "setIdentifier:", CFSTR("APP"));
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D808C0]);

    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D808D0]);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v14, "iTunesMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "artistName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForAppReport(CFSTR("OWNED_BY_%@"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iTunesMetadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "artistName");
      v50 = v3;
      v29 = v14;
      v30 = v15;
      v31 = v16;
      v32 = v5;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D80990]);

      v5 = v32;
      v16 = v31;
      v15 = v30;
      v14 = v29;
      v3 = v50;

    }
    objc_msgSend(v5, "addObject:", v21);
    if (-[PUIReportAppDetailController shouldShowOtherContent](self, "shouldShowOtherContent"))
      v35 = CFSTR("DOMAINS_CONTACTED_DIRECTLY_BY_APP");
    else
      v35 = CFSTR("DOMAINS_CONTACTED_BY_APP");
    v36 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "groupSpecifierWithID:name:", CFSTR("DOMAINS_GROUP"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController setDomainHeader:](self, "setDomainHeader:", v38);

    v39 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("WEBSITES_VISITED_IN_APP"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "groupSpecifierWithID:name:", CFSTR("WEBSITES_GROUP"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController setWebsiteHeader:](self, "setWebsiteHeader:", v41);

    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D80818]);

    v45 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("DOMAINS_CONTACTED_DIRECTLY_BY_OTHER_CONTENT"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "groupSpecifierWithID:name:", CFSTR("OTHER_GROUP"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController setOtherHeader:](self, "setOtherHeader:", v47);

    v48 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  os_signpost_id_t v22;
  _QWORD block[5];
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD v28[5];
  NSObject *v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[PUIReportAppDetailController dataDidChange]";
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  PUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, "PUIReportAppDetailController.load");

  PUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportAppDetailController.load", (const char *)&unk_1DB263E12, buf, 2u);
  }
  v22 = v5;

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = (void *)objc_opt_new();
  v10 = *MEMORY[0x1E0DB04C8];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA27E750, *MEMORY[0x1E0DB04C8]);
  v11 = *MEMORY[0x1E0DB04A8];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA27E768, *MEMORY[0x1E0DB04A8]);
  -[PUIReportAppDetailController bundleID](self, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DB0490];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DB0490]);

  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke;
  v28[3] = &unk_1EA26C600;
  v28[4] = self;
  v15 = v8;
  v29 = v15;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v9, v28);
  dispatch_group_enter(v15);
  v16 = (void *)objc_opt_new();
  v21 = v10;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1EA27E780, v10);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1EA27E768, v11);
  -[PUIReportAppDetailController bundleID](self, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v13);

  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_42;
  v26[3] = &unk_1EA26C600;
  v26[4] = self;
  v18 = v15;
  v27 = v18;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v16, v26);
  if (-[PUIReportAppDetailController shouldShowOtherContent](self, "shouldShowOtherContent"))
  {
    dispatch_group_enter(v18);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA27E798, v21);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA27E768, v11);
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v13);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_45;
    v24[3] = &unk_1EA26C600;
    v24[4] = self;
    v25 = v18;
    +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v19, v24);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v22;
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "domainsSpecifiersFromResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDomainRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_42(uint64_t a1, void *a2)
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
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_43;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_43(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWebsiteRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_45(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "otherSpecifiersFromResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_46;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_46(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOtherRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_3(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportAppDetailController.load", (const char *)&unk_1DB263E12, (uint8_t *)&v6, 2u);
  }

  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUIReportAppDetailController dataDidChange]_block_invoke";
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
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  char v28;
  objc_class *v29;
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
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  void *v53;
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  -[PUIReportAppDetailController specifierForID:](self, "specifierForID:", CFSTR("APP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController domainRows](self, "domainRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController domainRowsAwaitingDisplay](self, "domainRowsAwaitingDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController domainHeader](self, "domainHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v4, v5, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportAppDetailController domainRowsAwaitingDisplay](self, "domainRowsAwaitingDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController setDomainRows:](self, "setDomainRows:", v9);

  -[PUIReportAppDetailController websiteRows](self, "websiteRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController websiteRowsAwaitingDisplay](self, "websiteRowsAwaitingDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v10, v11, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportAppDetailController websiteRowsAwaitingDisplay](self, "websiteRowsAwaitingDisplay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController setWebsiteRows:](self, "setWebsiteRows:", v15);

  if (-[PUIReportAppDetailController shouldShowOtherContent](self, "shouldShowOtherContent"))
  {
    -[PUIReportAppDetailController otherRows](self, "otherRows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController otherRowsAwaitingDisplay](self, "otherRowsAwaitingDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController otherHeader](self, "otherHeader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v16, v17, v19, v14);
    v20 = objc_claimAutoreleasedReturnValue();

    -[PUIReportAppDetailController otherRowsAwaitingDisplay](self, "otherRowsAwaitingDisplay");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppDetailController setOtherRows:](self, "setOtherRows:", v21);

    v14 = (void *)v20;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[PUIReportAppDetailController websiteRows](self, "websiteRows");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PUITrackerBarShowAppAttributedBadgeKey"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLValue");

        if ((v28 & 1) != 0)
        {

          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D80818]);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("PUIAttributedStringTextViewDelegateKey"));

          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appstore"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "imageWithRenderingMode:", 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (void *)MEMORY[0x1E0CB3940];
          PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", v36, CFSTR("SF_SYMBOL_APPSTORE"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v37);
          v39 = +[PUIAttributedStringFooter string:replacingSubstring:withImage:](PUIAttributedStringFooter, "string:replacingSubstring:withImage:", v38, CFSTR("SF_SYMBOL_APPSTORE"), v22);
          v40 = objc_alloc(MEMORY[0x1E0CB3778]);
          PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v40, "initWithString:", v41);

          v43 = *MEMORY[0x1E0DC1160];
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1EA26D430);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addAttribute:value:range:", v43, v44, 0, objc_msgSend(v42, "length"));

          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
          objc_msgSend(v38, "appendAttributedString:", v45);

          objc_msgSend(v38, "appendAttributedString:", v42);
          -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v38, CFSTR("PUIAttributedStringFooterStringKey"));

          goto LABEL_13;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_13:

  -[PUIReportAppDetailController websiteHeader](self, "websiteHeader");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportAppDetailController reloadSpecifier:](self, "reloadSpecifier:", v47);

}

- (id)domainsSpecifiersFromResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PUIReportAppDetailController bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIReportDomainListController domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:](PUIReportDomainListController, "domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:", v4, 1, 0, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "count");
  if (v10 >= 5)
    v11 = 5;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v9 >= 6)
  {
    v14 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("SHOW_ALL_DOMAIN"));
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("PUIReportDomainListEntries"));

    objc_msgSend(v13, "addObject:", v16);
  }
  objc_msgSend(v5, "addObjectsFromArray:", v13);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)websiteSpecifiersFromResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[PUIReportWebsiteListController websiteSpecifiersFromResults:showDetail:](PUIReportWebsiteListController, "websiteSpecifiersFromResults:showDetail:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v7, "count");
  if (v9 >= 5)
    v10 = 5;
  else
    v10 = v9;
  objc_msgSend(v7, "subarrayWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v8 >= 6)
  {
    v13 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, objc_opt_class(), 2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("SHOW_ALL_WEBSITE"));
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("PUIReportWebsiteListApp"));

    objc_msgSend(v12, "addObject:", v15);
  }
  objc_msgSend(v5, "addObjectsFromArray:", v12);
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)otherSpecifiersFromResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PUIReportAppDetailController bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIReportDomainListController domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:](PUIReportDomainListController, "domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:", v4, 1, 0, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "count");
  if (v10 >= 5)
    v11 = 5;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v9 >= 6)
  {
    v14 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("SHOW_ALL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("SHOW_ALL_OTHER"));
    -[PUIReportAppDetailController bundleID](self, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("PUIReportDomainListAppOther"));

    objc_msgSend(v13, "addObject:", v16);
  }
  objc_msgSend(v5, "addObjectsFromArray:", v13);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v7 = objc_alloc(MEMORY[0x1E0D651A8]);
  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:detailText:symbolName:contentLayout:", v8, 0, 0, 2);

  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TEXT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", 0, v10);

  v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v12 = (void *)MEMORY[0x1E0DC3428];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PUIReportAppDetailController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v19[3] = &unk_1EA26BF60;
  v20 = v9;
  v13 = v9;
  objc_msgSend(v12, "actionWithHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithBarButtonSystemItem:primaryAction:", 0, v14);

  objc_msgSend(v13, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
  -[PUIReportAppDetailController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v17, 3);

  return 0;
}

void __83__PUIReportAppDetailController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)shouldShowOtherContent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PUIReportAppDetailController bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  objc_msgSend(v5, "SDKVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "compare:options:", CFSTR("15.0"), 64);
  return v7 >= 0;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (PSSpecifier)domainHeader
{
  return self->_domainHeader;
}

- (void)setDomainHeader:(id)a3
{
  objc_storeStrong((id *)&self->_domainHeader, a3);
}

- (NSArray)domainRows
{
  return self->_domainRows;
}

- (void)setDomainRows:(id)a3
{
  objc_storeStrong((id *)&self->_domainRows, a3);
}

- (NSArray)domainRowsAwaitingDisplay
{
  return self->_domainRowsAwaitingDisplay;
}

- (void)setDomainRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_domainRowsAwaitingDisplay, a3);
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

- (PSSpecifier)otherHeader
{
  return self->_otherHeader;
}

- (void)setOtherHeader:(id)a3
{
  objc_storeStrong((id *)&self->_otherHeader, a3);
}

- (NSArray)otherRows
{
  return self->_otherRows;
}

- (void)setOtherRows:(id)a3
{
  objc_storeStrong((id *)&self->_otherRows, a3);
}

- (NSArray)otherRowsAwaitingDisplay
{
  return self->_otherRowsAwaitingDisplay;
}

- (void)setOtherRowsAwaitingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_otherRowsAwaitingDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_otherRows, 0);
  objc_storeStrong((id *)&self->_otherHeader, 0);
  objc_storeStrong((id *)&self->_websiteRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteRows, 0);
  objc_storeStrong((id *)&self->_websiteHeader, 0);
  objc_storeStrong((id *)&self->_domainRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainRows, 0);
  objc_storeStrong((id *)&self->_domainHeader, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
