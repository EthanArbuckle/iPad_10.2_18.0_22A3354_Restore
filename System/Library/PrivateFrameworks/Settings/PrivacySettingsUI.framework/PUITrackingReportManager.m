@implementation PUITrackingReportManager

+ (BOOL)queryWithOptions:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  void *v28;
  os_signpost_id_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0DB02B0]);
  v8 = (void *)objc_msgSend(v7, "initWorkspaceWithService:", *MEMORY[0x1E0DB0528]);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0698]), "initWithWorkspace:", v8);
  v9 = *MEMORY[0x1E0DB04C8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DB04C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "integerValue");

  }
  _PUILoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "+[PUITrackingReportManager queryWithOptions:reply:]";
    v38 = 2048;
    v39 = v10;
    _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "%s: Starting query for NetworkDomainQueryType %ld data", buf, 0x16u);
  }

  PUILogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, "PUIReportAppListController.queryWithOptions");

  PUILogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PUIReportAppListController.queryWithOptions", (const char *)&unk_1DB263E12, buf, 2u);
  }

  v17 = (void *)v31[5];
  v18 = *MEMORY[0x1E0DB06D0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__PUITrackingReportManager_queryWithOptions_reply___block_invoke;
  v25[3] = &unk_1EA26C460;
  v28 = v10;
  v29 = v14;
  v19 = v6;
  v26 = v19;
  v27 = &v30;
  v20 = objc_msgSend(v17, "networkDomainsToDateWithOptionsFor:nameKind:domainType:startTime:options:reply:", 0, v18, 1, 0, v5, v25);
  if ((v20 & 1) == 0)
  {
    if (v19)
      (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
    _PUILoggingFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "+[PUITrackingReportManager queryWithOptions:reply:]";
      _os_log_impl(&dword_1DB1FB000, v21, OS_LOG_TYPE_DEFAULT, "%s: failed to get analytics data", buf, 0xCu);
    }

    PUILogForCategory(1uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v23, OS_SIGNPOST_INTERVAL_END, v14, "PUIReportAppListController.queryWithOptions", (const char *)&unk_1DB263E12, buf, 2u);
    }

  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __51__PUITrackingReportManager_queryWithOptions_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("result_count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = a1[6];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("result_count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "+[PUITrackingReportManager queryWithOptions:reply:]_block_invoke";
      v21 = 2048;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "integerValue");
      _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "%s: Finished query for NetworkDomainQueryType %ld data. result_count = %ld", (uint8_t *)&v19, 0x20u);

    }
  }
  else if (v9)
  {
    v12 = a1[6];
    v19 = 136315394;
    v20 = "+[PUITrackingReportManager queryWithOptions:reply:]_block_invoke";
    v21 = 2048;
    v22 = v12;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "%s: Finished query for NetworkDomainQueryType %ld data", (uint8_t *)&v19, 0x16u);
  }

  PUILogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = a1[7];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PUIReportAppListController.queryWithOptions", (const char *)&unk_1DB263E12, (uint8_t *)&v19, 2u);
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

}

- (PUITrackingReportManager)init
{
  PUITrackingReportManager *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUITrackingReportManager;
  v2 = -[PUITrackingReportManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DB02B0]);
    v4 = (void *)objc_msgSend(v3, "initWorkspaceWithService:", *MEMORY[0x1E0DB0528]);
    -[PUITrackingReportManager setWorkspace:](v2, "setWorkspace:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DB0698]);
    -[PUITrackingReportManager workspace](v2, "workspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithWorkspace:", v6);
    -[PUITrackingReportManager setFeed:](v2, "setFeed:", v7);

  }
  return v2;
}

- (void)reloadWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PUITrackingReportManager_reloadWithCompletion___block_invoke;
  v6[3] = &unk_1EA26C488;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUITrackingReportManager reloadEnabledWithCompletion:](self, "reloadEnabledWithCompletion:", v6);

}

uint64_t __49__PUITrackingReportManager_reloadWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)reloadEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  PUITrackingReportManager *v14;
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  -[PUITrackingReportManager feed](self, "feed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0DB0500];
  v21[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke;
  v13 = &unk_1EA26C4D8;
  objc_copyWeak(&v16, &location);
  v14 = self;
  v7 = (void (**)(_QWORD))v4;
  v15 = v7;
  v8 = objc_msgSend(v5, "getNetworkDomainsOptions:reply:", v6, &v10);

  if ((v8 & 1) == 0)
  {
    _PUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[PUITrackingReportManager reloadEnabledWithCompletion:]";
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "%s: failed to refresh analytics value", buf, 0xCu);
    }

    -[PUITrackingReportManager dataDidChange](self, "dataDidChange", v10, v11, v12, v13, v14);
    if (v7)
      v7[2](v7);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke_2;
  v6[3] = &unk_1EA26C4B0;
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v5 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v10);
}

uint64_t __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t result;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v13 = 136315394;
    v14 = "-[PUITrackingReportManager reloadEnabledWithCompletion:]_block_invoke_2";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "%s: reply: %@", (uint8_t *)&v13, 0x16u);
  }

  v4 = *MEMORY[0x1E0DB0500];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0DB0500]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0510]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0508]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setDate:", v9);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBool:forKey:", v7, CFSTR("PSUITrackerAnalyticsEnabledKey"));

  objc_msgSend(*(id *)(a1 + 40), "dataDidChange");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reloadDataWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19[2];
  id location;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (-[PUITrackingReportManager trackingReportEnabled](self, "trackingReportEnabled"))
  {
    objc_initWeak(&location, self);
    _PUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
      _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting query for SFNetworkDomainTracker data", buf, 0xCu);
    }

    PUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (char *)os_signpost_id_make_with_pointer(v6, "PUITrackingReportManager.reloadDataWithCompletion");

    PUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "PUITrackingReportManager.reloadDataWithCompletion", (const char *)&unk_1DB263E12, buf, 2u);
    }

    -[PUITrackingReportManager feed](self, "feed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke;
    v17[3] = &unk_1EA26C528;
    objc_copyWeak(v19, &location);
    v11 = *MEMORY[0x1E0DB06D0];
    v17[4] = self;
    v12 = v4;
    v18 = v12;
    v19[1] = v7;
    LOBYTE(v11) = objc_msgSend(v10, "networkDomainsToDateWithOptionsFor:nameKind:domainType:startTime:options:reply:", 0, v11, 1, 0, 0, v17);

    if ((v11 & 1) == 0)
    {
      if (v12)
        v12[2](v12);
      _PUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
        _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "%s: failed to get analytics data", buf, 0xCu);
      }

      PUILogForCategory(1uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v15, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v7, "PUITrackingReportManager.reloadDataWithCompletion", (const char *)&unk_1DB263E12, buf, 2u);
      }

    }
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    _PUILoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
      _os_log_impl(&dword_1DB1FB000, v16, OS_LOG_TYPE_DEFAULT, "%s: did not query, tracker analytics is off.", buf, 0xCu);
    }

    if (v4)
      v4[2](v4);
  }

}

void __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43[2];
  char v44;

  v3 = (id *)(a1 + 6);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "appsToTrackersWithoutHiddenApps:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "appsToTrackersInAppOnlyFromAppsToTrackers:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained(v3);
  objc_msgSend(v9, "trackersToAppsDictFromAppsToTrackersDict:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "trackersToAppsDictFromAppsToTrackersDict:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "appsToWebsitesDictFromAppsToTrackersDict:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained(v3);
  objc_msgSend(v13, "trackersToWebsitesDictFromAppsToTrackersDict:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained(v3);
  objc_msgSend(v15, "allEntriesFromAppsToTrackers:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained(v3);
  objc_msgSend(v17, "appsToTrackers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "isEqualToDictionary:", v18) ^ 1;

  block[1] = 3221225472;
  block[2] = __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1EA26C500;
  block[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(v43, v3);
  v34 = v6;
  v35 = v8;
  v36 = v31;
  v37 = v32;
  v38 = v12;
  v39 = v14;
  v44 = v19;
  v20 = a1[4];
  v21 = (void *)a1[5];
  v40 = v16;
  v41 = v20;
  v22 = v21;
  v23 = (void *)a1[7];
  v42 = v22;
  v43[1] = v23;
  v24 = v16;
  v25 = v14;
  v26 = v12;
  v27 = v32;
  v28 = v31;
  v29 = v8;
  v30 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v43);
}

void __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 104);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(WeakRetained, "setAppsToTrackers:", v2);

  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setAppsToTrackersInAppOnly:", v5);

  v7 = *(_QWORD *)(a1 + 48);
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "setTrackersToApps:", v7);

  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "setTrackersToAppsInAppOnly:", v9);

  v11 = *(_QWORD *)(a1 + 64);
  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "setAppsToWebsitesToTrackers:", v11);

  v13 = *(_QWORD *)(a1 + 72);
  v14 = objc_loadWeakRetained(v3);
  objc_msgSend(v14, "setTrackersToWebsitesToTrackers:", v13);

  v15 = *(_QWORD *)(a1 + 80);
  v16 = objc_loadWeakRetained(v3);
  objc_msgSend(v16, "setAllEntries:", v15);

  v17 = objc_loadWeakRetained(v3);
  objc_msgSend(v17, "appsToTrackers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count") != 0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBool:forKey:", v20, CFSTR("PSUITrackerHasDataKey"));

  if (*(_BYTE *)(a1 + 120))
    objc_msgSend(*(id *)(a1 + 88), "dataDidChange");
  v22 = *(_QWORD *)(a1 + 96);
  if (v22)
    (*(void (**)(void))(v22 + 16))();
  _PUILoggingFacility();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[PUITrackingReportManager reloadDataWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1DB1FB000, v23, OS_LOG_TYPE_DEFAULT, "%s: Finished query for SFNetworkDomainTracker data", (uint8_t *)&v27, 0xCu);
  }

  PUILogForCategory(1uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 112);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB1FB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PUITrackingReportManager.reloadDataWithCompletion", (const char *)&unk_1DB263E12, (uint8_t *)&v27, 2u);
  }

}

- (void)dataDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PSUITrackingReportDataHasChanged"), 0);

}

- (BOOL)shouldIncludeBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  objc_msgSend(v5, "appTags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("hidden")) ^ 1;

  return v7;
}

- (id)appsToTrackersWithoutHiddenApps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[PUITrackingReportManager shouldIncludeBundleID:](self, "shouldIncludeBundleID:", v11, (_QWORD)v14))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)allEntriesFromAppsToTrackers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (id)entriesFiltered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUITrackingReportManager allEntries](self, "allEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackingReportManager entries:filtered:](self, "entries:filtered:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)entries:(id)a3 filtered:(id)a4
{
  id v5;
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int (**)(id, _QWORD))a4;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v6[2](v6, v13))
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (id)valuesAndCountsForKey:(id)a3 entries:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v25 = *(_QWORD *)v27;
    v24 = *MEMORY[0x1E0DB0470];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "objectForKeyedSubscript:", v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");
          objc_msgSend(v11, "objectForKeyedSubscript:", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v18, "integerValue") + v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v20);

        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v21 = (void *)objc_msgSend(v7, "copy");
  return v21;
}

- (id)valuesForKey:(id)a3 withLargestValueForKey:(id)a4 entries:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v32 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_9;
          objc_msgSend(v14, "objectForKeyedSubscript:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v8);
          v21 = v8;
          v22 = v12;
          v23 = v10;
          v24 = v7;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v20, "compare:", v25);

          v7 = v24;
          v10 = v23;
          v12 = v22;
          v8 = v21;

          if (v31 == 1)
          {
LABEL_9:
            objc_msgSend(v14, "objectForKeyedSubscript:", v8);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v7);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, v27);

          }
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }

  v28 = (void *)objc_msgSend(v10, "copy");
  return v28;
}

- (id)appsToTrackersInAppOnlyFromAppsToTrackers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    v5 = *MEMORY[0x1E0DB0478];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v23 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v13, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AppInitiated"));

              if (v15)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v16)
                {
                  v17 = (void *)objc_opt_new();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v7);

                }
                objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v13);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v10);
        }

        v6 = v23 + 1;
      }
      while (v23 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  return v4;
}

- (id)trackersToAppsDictFromAppsToTrackersDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
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
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    v5 = *MEMORY[0x1E0DB0468];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v22 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v13, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                v16 = (void *)objc_opt_new();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v14);

              }
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v13);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }

        v6 = v22 + 1;
      }
      while (v22 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  return v4;
}

- (id)appsToWebsitesDictFromAppsToTrackersDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v36;
    v5 = *MEMORY[0x1E0DB0460];
    v30 = *MEMORY[0x1E0DB0478];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        v28 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v6);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v25);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v32 != v10)
                objc_enumerationMutation(v29);
              v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKeyedSubscript:", v5);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "length"))
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", v30);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NonAppInitiated"));

                if (v15)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v16)
                  {
                    v17 = (void *)objc_opt_new();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v7);

                  }
                  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "objectForKeyedSubscript:", v13);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v19)
                  {
                    v20 = (void *)objc_opt_new();
                    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v13);

                  }
                  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", v13);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "addObject:", v12);

                }
              }

            }
            v9 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v9);
        }

        v6 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v26);
  }

  return v4;
}

- (id)trackersToWebsitesDictFromAppsToTrackersDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v38;
    v32 = *MEMORY[0x1E0DB0460];
    v5 = *MEMORY[0x1E0DB0468];
    v31 = *MEMORY[0x1E0DB0478];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v34 != v10)
                objc_enumerationMutation(v30);
              v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKeyedSubscript:", v32);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "length"))
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", v31);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("NonAppInitiated"));

                if (v16)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v17)
                  {
                    v18 = (void *)objc_opt_new();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v14);

                  }
                  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", v13);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v20)
                  {
                    v21 = (void *)objc_opt_new();
                    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v13);

                  }
                  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", v13);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v12);

                }
              }

            }
            v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v9);
        }

        v6 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v27);
  }

  return v4;
}

- (BOOL)hadDataInLastQuery
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PSUITrackerHasDataKey"));

  return v3;
}

- (BOOL)trackingReportEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PSUITrackerAnalyticsEnabledKey"));

  return v3;
}

- (void)setTrackingReportEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("PSUITrackerHasDataKey"));

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, CFSTR("PSUITrackerAnalyticsEnabledKey"));

  objc_initWeak(&location, self);
  -[PUITrackingReportManager feed](self, "feed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0DB04F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke;
  v12[3] = &unk_1EA26C578;
  objc_copyWeak(&v13, &location);
  v10 = objc_msgSend(v7, "setNetworkDomainsOptions:reply:", v9, v12);

  if ((v10 & 1) == 0)
  {
    _PUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[PUITrackingReportManager setTrackingReportEnabled:]";
      _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "%s: failed to set analytics value", buf, 0xCu);
    }

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke_2;
  v5[3] = &unk_1EA26C550;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v7);

}

void __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[PUITrackingReportManager setTrackingReportEnabled:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "%s: reply: %@", (uint8_t *)&v5, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataDidChange");

}

- (void)exportToStream:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  -[PUITrackingReportManager allData](self, "allData");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  v5 = 0;
  if (v22)
  {
    v21 = *(_QWORD *)v36;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v6);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v21);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
        if (v29)
        {
          v28 = *(_QWORD *)v32;
          do
          {
            v8 = 0;
            v9 = v5;
            do
            {
              if (*(_QWORD *)v32 != v28)
                objc_enumerationMutation(v26);
              v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
              v11 = (void *)MEMORY[0x1DF0AB164]();
              v12 = (void *)objc_msgSend(v10, "mutableCopy");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("networkActivity"), CFSTR("type"));
              v30 = v9;
              v13 = v27;
              +[PUIJSONSerialization dataWithJSONObject:options:error:](PUIJSONSerialization, "dataWithJSONObject:options:error:", v12, 0, &v30);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14
                && (v16 = objc_retainAutorelease(v14),
                    v17 = v13,
                    LODWORD(v16) = PUIWriteBytesToStream(v17, objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), &v30), v17, (_DWORD)v16))
              {
                v18 = v17;
                v19 = PUIWriteBytesToStream(v18, objc_msgSend(CFSTR("\n"), "UTF8String"), objc_msgSend(CFSTR("\n"), "lengthOfBytesUsingEncoding:", 4), &v30);

              }
              else
              {
                v19 = 0;
              }

              v5 = v30;
              if (!v19)
              {
                _PUILoggingFacility();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v40 = "-[PUITrackingReportManager exportToStream:error:]";
                  v41 = 2112;
                  v42 = v5;
                  v43 = 2112;
                  v44 = v10;
                  _os_log_error_impl(&dword_1DB1FB000, v20, OS_LOG_TYPE_ERROR, "%s: Error writing to stream: %@, for object %@", buf, 0x20u);
                }

                *a4 = objc_retainAutorelease(v5);
              }

              objc_autoreleasePoolPop(v11);
              ++v8;
              v9 = v5;
            }
            while (v29 != v8);
            v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
          }
          while (v29);
        }

        v6 = v24 + 1;
      }
      while (v24 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v22);
  }

}

- (int64_t)highestNumberOfTrackerDataPerAppInAppOnly:(BOOL)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[PUITrackingReportManager appsToTrackersInAppOnly](self, "appsToTrackersInAppOnly");
  else
    -[PUITrackingReportManager appsToTrackers](self, "appsToTrackers");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10 > v6)
          v6 = v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)highestNumberOfTrackerDataPerTrackerInAppOnly:(BOOL)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[PUITrackingReportManager trackersToAppsInAppOnly](self, "trackersToAppsInAppOnly");
  else
    -[PUITrackingReportManager trackersToApps](self, "trackersToApps");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10 > v6)
          v6 = v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)appsIDsContactingTrackersInAppOnly:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
    -[PUITrackingReportManager appsToTrackersInAppOnly](self, "appsToTrackersInAppOnly");
  else
    -[PUITrackingReportManager appsToTrackers](self, "appsToTrackers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trackerDataForAppID:(id)a3 inAppOnly:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4)
    -[PUITrackingReportManager appsToTrackersInAppOnly](self, "appsToTrackersInAppOnly");
  else
    -[PUITrackingReportManager appsToTrackers](self, "appsToTrackers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)trackerDomainsInAppOnly:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
    -[PUITrackingReportManager trackersToAppsInAppOnly](self, "trackersToAppsInAppOnly");
  else
    -[PUITrackingReportManager trackersToApps](self, "trackersToApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trackerDataForTrackerDomain:(id)a3 inAppOnly:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4)
    -[PUITrackingReportManager trackersToAppsInAppOnly](self, "trackersToAppsInAppOnly");
  else
    -[PUITrackingReportManager trackersToApps](self, "trackersToApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)websiteDomainsForAppID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUITrackingReportManager appsToWebsitesToTrackers](self, "appsToWebsitesToTrackers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)trackerDataForAppID:(id)a3 websiteDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PUITrackingReportManager appsToWebsitesToTrackers](self, "appsToWebsitesToTrackers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)websiteDomainsForTrackerDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUITrackingReportManager trackersToWebsitesToTrackers](self, "trackersToWebsitesToTrackers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)trackerDataForTrackerDomain:(id)a3 websiteDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PUITrackingReportManager trackersToWebsitesToTrackers](self, "trackersToWebsitesToTrackers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UsageFeed)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
  objc_storeStrong((id *)&self->_feed, a3);
}

- (AnalyticsWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (NSDictionary)appsToTrackers
{
  return self->_appsToTrackers;
}

- (void)setAppsToTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_appsToTrackers, a3);
}

- (NSDictionary)trackersToApps
{
  return self->_trackersToApps;
}

- (void)setTrackersToApps:(id)a3
{
  objc_storeStrong((id *)&self->_trackersToApps, a3);
}

- (NSDictionary)appsToTrackersInAppOnly
{
  return self->_appsToTrackersInAppOnly;
}

- (void)setAppsToTrackersInAppOnly:(id)a3
{
  objc_storeStrong((id *)&self->_appsToTrackersInAppOnly, a3);
}

- (NSDictionary)trackersToAppsInAppOnly
{
  return self->_trackersToAppsInAppOnly;
}

- (void)setTrackersToAppsInAppOnly:(id)a3
{
  objc_storeStrong((id *)&self->_trackersToAppsInAppOnly, a3);
}

- (NSDictionary)appsToWebsitesToTrackers
{
  return self->_appsToWebsitesToTrackers;
}

- (void)setAppsToWebsitesToTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_appsToWebsitesToTrackers, a3);
}

- (NSDictionary)trackersToWebsitesToTrackers
{
  return self->_trackersToWebsitesToTrackers;
}

- (void)setTrackersToWebsitesToTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_trackersToWebsitesToTrackers, a3);
}

- (NSArray)allEntries
{
  return self->_allEntries;
}

- (void)setAllEntries:(id)a3
{
  objc_storeStrong((id *)&self->_allEntries, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_allEntries, 0);
  objc_storeStrong((id *)&self->_trackersToWebsitesToTrackers, 0);
  objc_storeStrong((id *)&self->_appsToWebsitesToTrackers, 0);
  objc_storeStrong((id *)&self->_trackersToAppsInAppOnly, 0);
  objc_storeStrong((id *)&self->_appsToTrackersInAppOnly, 0);
  objc_storeStrong((id *)&self->_trackersToApps, 0);
  objc_storeStrong((id *)&self->_appsToTrackers, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_feed, 0);
}

@end
