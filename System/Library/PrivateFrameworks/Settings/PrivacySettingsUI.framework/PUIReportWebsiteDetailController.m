@implementation PUIReportWebsiteDetailController

- (PUIReportWebsiteDetailController)init
{
  PUIReportWebsiteDetailController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportWebsiteDetailController;
  v2 = -[PUIReportWebsiteDetailController init](&v7, sel_init);
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

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[PUIReportWebsiteDetailController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PUIReportWebsiteDetailController specifier](self, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PUIReportWebsiteKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportWebsiteDetailController setContext:](self, "setContext:", v8);

    }
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("CONTEXT_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);
    v10 = (void *)MEMORY[0x1E0D804E8];
    -[PUIReportWebsiteDetailController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_valueForSpecifier_, 0, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIdentifier:", CFSTR("CONTEXT"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    -[PUIReportWebsiteDetailController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportWebsiteDetailController iconForContext:](self, "iconForContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D80870]);

    objc_msgSend(v5, "addObject:", v12);
    v15 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("DOMAINS_CONTACTED_BY_WEBSITE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "groupSpecifierWithID:name:", CFSTR("DOMAINS_GROUP"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportWebsiteDetailController setDomainHeader:](self, "setDomainHeader:", v17);

    v18 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("APPS_YOU_VIEWED_THIS_WEBSITE_IN"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "groupSpecifierWithID:name:", CFSTR("APPS_GROUP"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportWebsiteDetailController setAppHeader:](self, "setAppHeader:", v20);

    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
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
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD block[5];
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[5];
  NSObject *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PUIReportWebsiteDetailController dataDidChange]";
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  PUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, "PUIReportWebsiteDetailController.load");

  PUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportWebsiteDetailController.load", (const char *)&unk_1DB263E12, buf, 2u);
  }

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = (void *)objc_opt_new();
  v10 = *MEMORY[0x1E0DB04C8];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA27E7E0, *MEMORY[0x1E0DB04C8]);
  -[PUIReportWebsiteDetailController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DB04D0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DB04D0]);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke;
  v26[3] = &unk_1EA26C600;
  v26[4] = self;
  v13 = v8;
  v27 = v13;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v9, v26);
  dispatch_group_enter(v13);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA27E7F8, v10);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA27E810, *MEMORY[0x1E0DB04A8]);
  -[PUIReportWebsiteDetailController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v12);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_34;
  v24[3] = &unk_1EA26C600;
  v24[4] = self;
  v16 = v13;
  v25 = v16;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v14, v24);
  dispatch_group_enter(v16);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1EA27E828, v10);
  -[PUIReportWebsiteDetailController context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v12);

  v19 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_37;
  v22[3] = &unk_1EA26C600;
  v22[4] = self;
  v23 = v16;
  v20 = v16;
  +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v17, v22);
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v5;
  dispatch_group_notify(v20, MEMORY[0x1E0C80D38], block);

}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("CONTEXT"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  PUI_LocalizedStringForAppReport(CFSTR("VISITED_N_TIMES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sumHits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80990]);

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_34(uint64_t a1, void *a2)
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
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_35;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_35(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDomainRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_37(uint64_t a1, void *a2)
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
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_38;
  block[3] = &unk_1EA26B638;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAppRowsAwaitingDisplay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadAsyncSpecifiers");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_3(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportWebsiteDetailController.load", (const char *)&unk_1DB263E12, (uint8_t *)&v6, 2u);
  }

  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUIReportWebsiteDetailController dataDidChange]_block_invoke";
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
  -[PUIReportWebsiteDetailController specifierForID:](self, "specifierForID:", CFSTR("CONTEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController domainRows](self, "domainRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController domainRowsAwaitingDisplay](self, "domainRowsAwaitingDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController domainHeader](self, "domainHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v4, v5, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportWebsiteDetailController domainRowsAwaitingDisplay](self, "domainRowsAwaitingDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController setDomainRows:](self, "setDomainRows:", v9);

  -[PUIReportWebsiteDetailController appRows](self, "appRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController appRowsAwaitingDisplay](self, "appRowsAwaitingDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController appHeader](self, "appHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController pui_replaceRows:withRows:header:insertPoint:](self, "pui_replaceRows:withRows:header:insertPoint:", v10, v11, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIReportWebsiteDetailController appRowsAwaitingDisplay](self, "appRowsAwaitingDisplay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportWebsiteDetailController setAppRows:](self, "setAppRows:", v15);

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
  -[PUIReportWebsiteDetailController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIReportDomainListController domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:](PUIReportDomainListController, "domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:", v4, 1, 0, 0, 0, v6);
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
    -[PUIReportWebsiteDetailController context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("PUIReportDomainListWebsite"));

    objc_msgSend(v13, "addObject:", v16);
  }
  objc_msgSend(v5, "addObjectsFromArray:", v13);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)appSpecifiersFromResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *MEMORY[0x1E0D808C0];
    v26 = *(_QWORD *)v29;
    v24 = *MEMORY[0x1E0D808D0];
    v7 = *MEMORY[0x1E0D80990];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
        objc_msgSend(v11, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0D804E8];
        if (objc_msgSend(v12, "length"))
          v14 = v12;
        else
          v14 = v10;
        objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_valueForSpecifier_, 0, 4, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIdentifier:", v10);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v25);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v24);
        v16 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxTimeStamp"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v17, "integerValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUIReportWebsiteDetailController timeStringForDate:](self, "timeStringForDate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v7);

        objc_msgSend(v27, "addObject:", v15);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  objc_msgSend(v27, "sortUsingComparator:", &__block_literal_global_16);
  objc_msgSend(v22, "addObjectsFromArray:", v27);
  v20 = (void *)objc_msgSend(v22, "copy");

  return v20;
}

uint64_t __61__PUIReportWebsiteDetailController_appSpecifiersFromResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *MEMORY[0x1E0D80990];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
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

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appRows, 0);
  objc_storeStrong((id *)&self->_appHeader, 0);
  objc_storeStrong((id *)&self->_domainRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainRows, 0);
  objc_storeStrong((id *)&self->_domainHeader, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
