@implementation PUIReportSensorManager

+ (id)localizedStringForCategory:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D80CB0];
  v15[0] = *MEMORY[0x1E0D80C98];
  v15[1] = v4;
  v16[0] = CFSTR("LOCATION");
  v16[1] = CFSTR("PHOTOS");
  v5 = *MEMORY[0x1E0D80CA8];
  v15[2] = *MEMORY[0x1E0D80C88];
  v15[3] = v5;
  v16[2] = CFSTR("CAMERA");
  v16[3] = CFSTR("MICROPHONE");
  v6 = *MEMORY[0x1E0D80CA0];
  v15[4] = *MEMORY[0x1E0D80C90];
  v15[5] = v6;
  v16[4] = CFSTR("CONTACTS");
  v16[5] = CFSTR("MEDIALIBRARY");
  v15[6] = *MEMORY[0x1E0D80CB8];
  v16[6] = CFSTR("SCREEN_RECORDING");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForAppReport(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  v11 = v9;
  if (!v10)
  {
    _PUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[PUIReportSensorManager localizedStringForCategory:].cold.1();

    v11 = v3;
  }
  v13 = v11;

  return v13;
}

+ (id)iconForCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9AA70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[PUIReportSensorManager iconForCategory:].cold.1();

    PSBlankIconImage();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

+ (id)iconTypeIdentifierForCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke()
{
  if (PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_token_8 != -1)
    dispatch_once(&PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_token_8, &__block_literal_global_32);
  return (id)PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_8;
}

void __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D80CA8];
  v4[0] = *MEMORY[0x1E0D80C98];
  v4[1] = v0;
  v5[0] = CFSTR("com.apple.graphic-icon.location");
  v5[1] = CFSTR("com.apple.graphic-icon.microphone-access");
  v1 = *MEMORY[0x1E0D80C88];
  v4[2] = *MEMORY[0x1E0D80CB8];
  v4[3] = v1;
  v5[2] = CFSTR("com.apple.graphic-icon.screen-recording");
  v5[3] = CFSTR("com.apple.graphic-icon.camera");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_8;
  PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_8 = v2;

}

+ (id)applicationBundleIdentifierForCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke()
{
  if (PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_token_9 != -1)
    dispatch_once(&PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_token_9, &__block_literal_global_42);
  return (id)PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_9;
}

void __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D80CA0];
  v3[0] = *MEMORY[0x1E0D80C90];
  v3[1] = v0;
  v4[0] = CFSTR("com.apple.MobileAddressBook");
  v4[1] = CFSTR("com.apple.Music");
  v3[2] = *MEMORY[0x1E0D80CB0];
  v4[2] = CFSTR("com.apple.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_9;
  PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_9 = v1;

}

+ (id)_iconFromImage:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  CGImage *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  if (v3 && (objc_msgSend(objc_retainAutorelease(v3), "CGImage"), (v7 = LICreateIconForImage()) != 0))
  {
    v8 = (CGImage *)v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", v7, 0, v6);
    CGImageRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dataDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PUIReportSensorManagerDataHasChangedNotification"), 0);

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

- (void)reloadDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke;
  v7[3] = &unk_1EA26C488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "loadAllEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAllEvents:", v2);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke_2;
  v4[3] = &unk_1EA26C488;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dataDidChange");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)loadAllEvents
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PUIReportSensorManager loadAllEvents]";
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "%s: Starting query for SFNetworkDomainTracker data", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = (id)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getPAAccessReaderClass_softClass_0;
  v19 = getPAAccessReaderClass_softClass_0;
  if (!getPAAccessReaderClass_softClass_0)
  {
    *(_QWORD *)v25 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v25[8] = 3221225472;
    *(_QWORD *)&v25[16] = __getPAAccessReaderClass_block_invoke_0;
    v26 = &unk_1EA26B260;
    v27 = &v16;
    __getPAAccessReaderClass_block_invoke_0((uint64_t)v25);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "publisherForReportWithError:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v7)
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[PUIReportSensorManager loadAllEvents]";
      *(_WORD *)&v25[12] = 2112;
      *(_QWORD *)&v25[14] = v7;
      _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "%s: Error when fetching access records, %@", v25, 0x16u);
    }

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__PUIReportSensorManager_loadAllEvents__block_invoke_58;
    v14[3] = &unk_1EA26C6A8;
    v14[4] = &buf;
    v9 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_57, v14);
  }
  _PUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
    *(_DWORD *)v25 = 136315394;
    *(_QWORD *)&v25[4] = "-[PUIReportSensorManager loadAllEvents]";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = v11;
    _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s: Finished query for SFNetworkDomainTracker data: %lu items.", v25, 0x16u);
  }

  v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
  _Block_object_dispose(&buf, 8);

  return v12;
}

void __39__PUIReportSensorManager_loadAllEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state"))
  {
    _PUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 136315394;
      v6 = "-[PUIReportSensorManager loadAllEvents]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "%s: Error when sinking access records, %@", (uint8_t *)&v5, 0x16u);

    }
  }

}

uint64_t __39__PUIReportSensorManager_loadAllEvents__block_invoke_58(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)bundleIDsAndLatestDatesFromEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v27;
    *(_QWORD *)&v7 = 136315394;
    v25 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v11, "startTime", v25, (_QWORD)v26);
          v13 = v12;
          objc_msgSend(v11, "access");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject accessor](v14, "accessor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v19 = v18;

          if (v19 < v13)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject accessor](v14, "accessor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v22);

          }
        }
        else
        {
          _PUILoggingFacility();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v31 = "-[PUIReportSensorManager bundleIDsAndLatestDatesFromEvents:]";
            v32 = 2112;
            v33 = v11;
            _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record class, %@", buf, 0x16u);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(v4, "copy");
  return v23;
}

- (id)categoriesAndLatestDatesFromEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 136315394;
    v23 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v11, "startTime", v23, (_QWORD)v24);
          v13 = v12;
          objc_msgSend(v11, "access");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject category](v14, "category");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v18 = v17;

          if (v18 < v13)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject category](v14, "category");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

          }
        }
        else
        {
          _PUILoggingFacility();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v29 = "-[PUIReportSensorManager categoriesAndLatestDatesFromEvents:]";
            v30 = 2112;
            v31 = v11;
            _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record class, %@", buf, 0x16u);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  v21 = (void *)objc_msgSend(v4, "copy");
  return v21;
}

- (id)eventsFiltered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUIReportSensorManager allEvents](self, "allEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportSensorManager events:filtered:](self, "events:filtered:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)events:(id)a3 filtered:(id)a4
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

- (NSArray)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
  objc_storeStrong((id *)&self->_allEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEvents, 0);
}

+ (void)localizedStringForCategory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB1FB000, v0, v1, "%s: unknown category: %@", v2, v3, v4, v5, 2u);
}

+ (void)iconForCategory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB1FB000, v0, v1, "%s: no icon for category: %@", v2, v3, v4, v5, 2u);
}

@end
