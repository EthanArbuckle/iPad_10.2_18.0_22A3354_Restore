@implementation PLDiagnostics

+ (id)logDirectoryURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *MEMORY[0x1E0D11258], 1);
}

+ (id)diagnosticsURLs
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PLDiagnostics_diagnosticsURLs__block_invoke;
  v6[3] = &unk_1E36772C0;
  v4 = v3;
  v7 = v4;
  objc_msgSend(a1, "enumerateDiagnosticsURLsIncludingPropertyiesForKeys:handler:", 0, v6);

  return v4;
}

+ (void)enumerateDiagnosticsURLsIncludingPropertyiesForKeys:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, void *, uint64_t);
  uint64_t v31;
  id obj;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = (void (**)(id, void *, uint64_t))a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C999D0];
  v9 = *MEMORY[0x1E0C99A90];
  v41[0] = *MEMORY[0x1E0C999D0];
  v41[1] = v9;
  v31 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v29 = v6;
  if (v6)
  {
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(a1, "logDirectoryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  v28 = v7;
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, v11, 7, &__block_literal_global_99012);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "matchingNameExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "excludingNameExpression");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x19AEC1554]();
        v35 = 0;
        objc_msgSend(v20, "getResourceValue:forKey:error:", &v35, v8, 0);
        v22 = v35;
        if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
        {
          v34 = 0;
          objc_msgSend(v20, "getResourceValue:forKey:error:", &v34, v31, 0);
          v23 = v34;
          v24 = v23;
          if (!v15
            || (objc_msgSend(v15, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            if (!v33
              || (objc_msgSend(v33, "firstMatchInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length")),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  v26,
                  !v26))
            {
              v30[2](v30, v20, objc_msgSend(v22, "BOOLValue"));
            }
          }

        }
        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v17);
  }

}

+ (id)matchingNameExpression
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("(CPL-diagnostics|%@)-.*.tgz"), *MEMORY[0x1E0D11260]);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error creating matchingExpression %{public}@", buf, 0xCu);

  }
  return v4;
}

+ (id)excludingNameExpression
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (id)*MEMORY[0x1E0D11250];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v2, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error creating excludingExpression %{public}@", buf, 0xCu);

  }
  return v3;
}

+ (unint64_t)addOSStateHandlerWithTitle:(id)a3 queue:(id)a4 propertyListHandler:(id)a5
{
  id v6;
  id v7;
  unint64_t v8;
  id v10;
  id v11;

  v10 = a3;
  v11 = a5;
  v6 = v10;
  v7 = v11;
  v8 = os_state_add_handler();

  return v8;
}

+ (BOOL)tapToRadarKitDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PLPhotosDiagnosticsTapToRadarKitDisabled"));

  return v3;
}

+ (void)tapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 displayReason:(id)a6 attachments:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if ((objc_msgSend(a1, "tapToRadarKitDisabled") & 1) != 0)
    goto LABEL_6;
  if (!TapToRadarKitLibraryCore_frameworkLibrary)
  {
    v16 = xmmword_1E3677410;
    v17 = 0;
    TapToRadarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TapToRadarKitLibraryCore_frameworkLibrary)
LABEL_6:
    objc_msgSend(a1, "_fallBackTapToRadarWithTitle:description:radarComponent:", v12, v13, a5, v16, v17, v18);
  else
    objc_msgSend(a1, "_tapToRadarKitDraftWithTitle:description:radarComponent:displayReason:attachments:", v12, v13, a5, v14, v15);

}

+ (void)_tapToRadarKitDraftWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 displayReason:(id)a6 attachments:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  int64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v16 = (void *)getRadarDraftClass_softClass;
  v43 = getRadarDraftClass_softClass;
  v17 = MEMORY[0x1E0C809B0];
  if (!getRadarDraftClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getRadarDraftClass_block_invoke;
    v38 = &unk_1E3677580;
    v39 = &v40;
    __getRadarDraftClass_block_invoke((uint64_t)&v35);
    v16 = (void *)v41[3];
  }
  v18 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v40, 8);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setTitle:", v12);
  objc_msgSend(v19, "setProblemDescription:", v13);
  objc_msgSend(v19, "setClassification:", 6);
  objc_msgSend(v19, "setReproducibility:", 6);
  objc_msgSend(v19, "setAutoDiagnostics:", 0);
  objc_msgSend(v19, "setIsUserInitiated:", 0);
  objc_msgSend(v19, "setKeywords:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v19, "setAttachments:", v15);
  objc_msgSend(v19, "setDiagnosticExtensionIDs:", &unk_1E37641F0);
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __99__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_displayReason_attachments___block_invoke;
  v32[3] = &unk_1E3677350;
  v20 = v19;
  v33 = v20;
  v34 = a1;
  objc_msgSend(a1, "_radarComponentDetailsForComponent:reply:", a5, v32);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v21 = (void *)getTapToRadarServiceClass_softClass;
  v43 = getTapToRadarServiceClass_softClass;
  if (!getTapToRadarServiceClass_softClass)
  {
    v35 = v17;
    v36 = 3221225472;
    v37 = __getTapToRadarServiceClass_block_invoke;
    v38 = &unk_1E3677580;
    v39 = &v40;
    __getTapToRadarServiceClass_block_invoke((uint64_t)&v35);
    v21 = (void *)v41[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v22, "shared");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tapToRadarProcessName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __99__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_displayReason_attachments___block_invoke_2;
  v27[3] = &unk_1E3677378;
  v28 = v12;
  v29 = v13;
  v30 = a1;
  v31 = a5;
  v25 = v13;
  v26 = v12;
  objc_msgSend(v23, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v20, v24, v14, v27);

}

+ (id)_tapToRadarProcessName
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("assetsd")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("photolibraryd")) & 1) != 0)
  {
    v4 = CFSTR("Photos Library Service");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photoanalysisd")) & 1) != 0)
  {
    v4 = CFSTR("Photos Analysis Service");
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (int64_t)_deviceClassesFromDeviceClassesString:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPhone")))
        {
          v6 |= 1uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPad")))
        {
          v6 |= 2uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Watch")))
        {
          v6 |= 4uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("AppleTV")))
        {
          v6 |= 8uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("HomePod")))
        {
          v6 |= 0x10uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Mac")))
        {
          v6 |= 0x20uLL;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_fallBackTapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__98926;
  v29 = __Block_byref_object_dispose__98927;
  v10 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke;
  v24[3] = &unk_1E36773A0;
  v24[4] = &v25;
  objc_msgSend(a1, "_radarComponentDetailsForComponent:reply:", a5, v24);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = (void *)v26[5];
  v19 = v10;
  v20 = 3221225472;
  v21 = __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke_2;
  v22 = &unk_1E36773C8;
  v13 = v11;
  v23 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v19);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), v8, v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"), v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setQueryItems:", v13);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openURL:configuration:completionHandler:", v18, 0, 0);

  _Block_object_dispose(&v25, 8);
}

+ (void)_radarComponentDetailsForComponent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if ((unint64_t)a3 > 3)
  {
    v6 = 0;
    v7 = &stru_1E36789C0;
    v8 = &stru_1E36789C0;
    v9 = &stru_1E36789C0;
  }
  else
  {
    v6 = qword_199B9FC70[a3];
    v7 = off_1E3677428[a3];
    v8 = off_1E3677448[a3];
    v9 = off_1E3677468[a3];
  }
  (*((void (**)(id, uint64_t, const __CFString *, const __CFString *, const __CFString *))a4 + 2))(a4, v6, v7, v8, v9);
}

+ (BOOL)shouldSuppressRadarUserNotificationWithMessage:(id)a3 radarTitle:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((MEMORY[0x19AEC04BC]() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("PhotoDiagnosticsIgnoreUntil"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = -[NSObject compare:](v8, "compare:", v9),
          v9,
          v10 != 1))
    {
      v12 = 0;
      goto LABEL_12;
    }
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring Radar user notification request with ignore date=%@ for %@: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring Radar user notification request on a customer install for %@: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6
{
  objc_msgSend(a1, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:radarComponent:diagnosticTTRType:attachments:extensionItem:", a3, a4, a5, a6, 0, 0, MEMORY[0x1E0C9AA60], 0);
}

+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 radarComponent:(int64_t)a7 diagnosticTTRType:(signed __int16)a8 attachments:(id)a9 extensionItem:(id)a10
{
  int v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __CFUserNotification *v40;
  void (__cdecl *v41)(CFUserNotificationRef, CFOptionFlags);
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v43;
  __CFRunLoop *Main;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  id v49;
  SInt32 error;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  int64_t v56;
  id v57;
  _QWORD v58[9];
  _QWORD v59[9];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v10 = a8;
  v64 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  if ((objc_msgSend(a1, "shouldSuppressRadarUserNotificationWithMessage:radarTitle:", v17, v18) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_userNotificationLock);
    if (s_userNotificationHandler)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&s_userNotificationLock);
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v18;
        v62 = 2112;
        v63 = v19;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "user notification already running: ignoring %@: %@", buf, 0x16u);
      }
      goto LABEL_29;
    }
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __148__PLDiagnostics_fileRadarUserNotificationWithHeader_message_radarTitle_radarDescription_radarComponent_diagnosticTTRType_attachments_extensionItem___block_invoke;
    v51[3] = &unk_1E36773F0;
    v52 = v20;
    v53 = v18;
    v54 = v19;
    v56 = a7;
    v23 = v16;
    v55 = v23;
    v24 = MEMORY[0x19AEC174C](v51);
    v25 = (void *)s_userNotificationHandler;
    s_userNotificationHandler = v24;

    os_unfair_lock_unlock((os_unfair_lock_t)&s_userNotificationLock);
    v26 = CFSTR("Never for Photos Issues");
    if (v10 == 1)
      v26 = CFSTR("File Radar with Image and intermediates");
    v27 = *MEMORY[0x1E0C9B810];
    v58[0] = *MEMORY[0x1E0C9B800];
    v58[1] = v27;
    v28 = *MEMORY[0x1E0C9B838];
    v59[1] = v17;
    v59[2] = CFSTR("File Radar");
    v29 = *MEMORY[0x1E0C9B830];
    v58[2] = v28;
    v58[3] = v29;
    v30 = *MEMORY[0x1E0C9B868];
    v59[3] = CFSTR("Not Now");
    v59[4] = v26;
    v31 = *MEMORY[0x1E0C9B820];
    v58[4] = v30;
    v58[5] = v31;
    v32 = *MEMORY[0x1E0DABC38];
    v59[5] = MEMORY[0x1E0C9AAB0];
    v59[6] = MEMORY[0x1E0C9AAB0];
    v33 = *MEMORY[0x1E0DABC40];
    v58[6] = v32;
    v58[7] = v33;
    v58[8] = *MEMORY[0x1E0DABB98];
    v59[0] = v23;
    v59[7] = MEMORY[0x1E0C9AAB0];
    v59[8] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 9);
    v34 = objc_claimAutoreleasedReturnValue();
    v22 = v34;
    v49 = v16;
    if (v10 == 1 && v21)
    {
      v35 = -[NSObject mutableCopy](v34, "mutableCopy");
      objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobileslideshow.DestructiveChangeConfirmation"), *MEMORY[0x1E0DABBB8]);
      v48 = v23;
      v36 = (void *)MEMORY[0x1E0CB36F8];
      v57 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "archivedDataWithRootObject:requiringSecureCoding:error:", v37, 1, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0DABBC0]);

      v23 = v48;
      v39 = objc_msgSend(v35, "copy");

      v22 = v39;
    }
    error = 0;
    v40 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v22);
    if (!v40 || error)
    {
      PLBackendGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v61) = error;
        _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "could not create user notification: %d", buf, 8u);
      }

      if (!v40)
        goto LABEL_28;
    }
    else
    {
      if (v10 == 1)
        v41 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))PLDiagnosticsUserNotificationSharePhotoCallback;
      else
        v41 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))PLDiagnosticsUserNotificationCallback;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v40, v41, 0);
      if (RunLoopSource)
      {
        v43 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v43, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(v43);
        PLBackendGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v23;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, "running user notification: %@", buf, 0xCu);
        }

        goto LABEL_28;
      }
      PLBackendGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v61) = error;
        _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_ERROR, "could not create user notification runloop: %d", buf, 8u);
      }

    }
    CFRelease(v40);
LABEL_28:
    v16 = v49;
LABEL_29:

  }
}

+ (id)_memoriesRelatedOutputPathBaseDirectoryWithPathManager:(id)a3
{
  return (id)objc_msgSend(a3, "privateCacheDirectoryWithSubType:", 12);
}

+ (id)memoriesAndRelatedDiagnosticsOutputURLWithPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "_memoriesRelatedOutputPathBaseDirectoryWithPathManager:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Memories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", v4))
  {
    v16 = 0;
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v3, &v16);
    v7 = v16;
    if ((v6 & 1) == 0)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "ERROR (%@) : Photo Diagnostics failed deleting snapshot output path (%@).", buf, 0x16u);

      }
    }
  }
  else
  {
    v7 = 0;
  }
  if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v10 = v7;
  }
  else
  {
    v15 = v7;
    v11 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v15);
    v10 = v15;

    if ((v11 & 1) == 0 && v10)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "ERROR (%@) : Photo Diagnostics failed creating snapshot output path (%@).", buf, 0x16u);

      }
    }
  }

  return v10;
}

+ (void)collectMomentsStatWithLibraryContext:(id)a3 completionBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
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
  void (**v44)(id, void *, _QWORD);
  id v45;
  unint64_t v46;
  unint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  void *v54;
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLMoment entityName](PLMoment, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(v10, "setPropertiesToFetch:", &unk_1E3764208);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cachedCount"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v12);

  v52 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v10, &v52);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v52;
  if (!v14 && v13)
  {
    v42 = v10;
    v43 = v7;
    v44 = v6;
    v45 = v5;
    v47 = objc_msgSend(v13, "count");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v40 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = 0;
      v20 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("cachedCount"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "unsignedIntegerValue");

          v18 += v25;
          if (v25 == 1)
            ++v19;
          objc_autoreleasePoolPop(v23);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }

    v26 = v47;
    objc_msgSend(v15, "valueForKeyPath:", CFSTR("cachedCount"), v40);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v46 = v18 / v47;
    if (objc_msgSend(v27, "count"))
    {
      v5 = v45;
      if (objc_msgSend(v27, "count") == 1)
      {
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");
        v13 = v41;
      }
      else
      {
        objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "count");
        v31 = (unint64_t)objc_msgSend(v28, "count") >> 1;
        if ((v30 & 1) != 0)
        {
          objc_msgSend(v28, "objectAtIndex:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v32, "integerValue");
        }
        else
        {
          objc_msgSend(v28, "objectAtIndex:", v31 - 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v32;
          objc_msgSend(v28, "objectAtIndex:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "valueForKeyPath:", CFSTR("@avg.self"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v35, "integerValue");

        }
        v13 = v41;

        v26 = v47;
      }

      v7 = v43;
      v6 = v44;
      v10 = v42;
    }
    else
    {
      v29 = 0;
      v6 = v44;
      v5 = v45;
      v10 = v42;
      v7 = v43;
      v13 = v41;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v36, CFSTR("numberOfMoments"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v37, CFSTR("averageNumberOfAssetsInMoments"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v38, CFSTR("medianNumberOfAssetsInMoments"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v39, CFSTR("numberOfMomentsWithSingleAsset"));

    v14 = 0;
    if (v6)
      v6[2](v6, v7, 0);
  }

}

void __148__PLDiagnostics_fileRadarUserNotificationWithHeader_message_radarTitle_radarDescription_radarComponent_diagnosticTTRType_attachments_extensionItem___block_invoke(uint64_t a1, int a2)
{
  id v3;
  id v4;

  if (a2)
    v3 = *(id *)(a1 + 32);
  else
    v3 = (id)MEMORY[0x1E0C9AA60];
  v4 = v3;
  +[PLDiagnostics tapToRadarWithTitle:description:radarComponent:displayReason:attachments:](PLDiagnostics, "tapToRadarWithTitle:description:radarComponent:displayReason:attachments:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v3);

}

void __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
  v18[1] = CFSTR("Serious Bug");
  v18[2] = CFSTR("Not Applicable");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%ld"), a2, CFSTR("ExtensionIdentifiers"), CFSTR("Classification"), CFSTR("Reproducibility"), CFSTR("ComponentID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v18[4] = v12;
  v17[4] = CFSTR("ComponentName");
  v17[5] = CFSTR("ComponentVersion");
  v17[6] = CFSTR("DeviceClasses");
  v18[5] = v11;
  v18[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

void __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __99__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_displayReason_attachments___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v12 = (void *)getRadarComponentClass_softClass;
  v19 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getRadarComponentClass_block_invoke;
    v15[3] = &unk_1E3677580;
    v15[4] = &v16;
    __getRadarComponentClass_block_invoke((uint64_t)v15);
    v12 = (void *)v17[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v16, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithName:version:identifier:", v9, v10, a2);
  objc_msgSend(*(id *)(a1 + 32), "setComponent:", v14);

  objc_msgSend(*(id *)(a1 + 32), "setRemoteDeviceClasses:", objc_msgSend(*(id *)(a1 + 40), "_deviceClassesFromDeviceClassesString:", v11));
}

void __99__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_displayReason_attachments___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "TapToRadarService returned error: (%@)", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "_fallBackTapToRadarWithTitle:description:radarComponent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "TapToRadarService draft submitted", (uint8_t *)&v6, 2u);
    }

  }
}

_DWORD *__70__PLDiagnostics_addOSStateHandlerWithTitle_queue_propertyListHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  _DWORD *v11;
  uint64_t v12;
  _DWORD *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (v3)
    {
      v5 = objc_msgSend(v3, "length");
      v6 = v5;
      if (v5 <= 0x8000)
      {
        v13 = malloc_type_malloc(v5 + 200, 0x9FCE8B6DuLL);
        v11 = v13;
        if (v13)
        {
          bzero(v13, v6 + 200);
          *v11 = 1;
          v11[1] = v6;
          objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
          __strlcpy_chk();
          objc_msgSend(v3, "getBytes:length:", v11 + 50, v6);
        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        v8 = MEMORY[0x1E0C81028];
        v9 = "state information archive for %@ too large";
        v10 = 12;
LABEL_9:
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v4;
      v8 = MEMORY[0x1E0C81028];
      v9 = "unable to archive process state information for %@: %@";
      v10 = 22;
      goto LABEL_9;
    }
    v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

uint64_t __77__PLDiagnostics_enumerateDiagnosticsURLsIncludingPropertyiesForKeys_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 260)
      goto LABEL_7;
  }
  else
  {

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "enumerate diagnostics error: %@\n", (uint8_t *)&v8, 0xCu);

  }
LABEL_7:

  return 1;
}

uint64_t __32__PLDiagnostics_diagnosticsURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
