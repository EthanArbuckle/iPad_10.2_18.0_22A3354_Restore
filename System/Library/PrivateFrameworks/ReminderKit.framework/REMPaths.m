@implementation REMPaths

+ (id)createTemporaryFileDirectoryURLIfNeededWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (rem_feature_enabled(CFSTR("Reminders"), CFSTR("dataSeparation")))
    objc_msgSend(a1, "dataSeparationEnabled_applicationDocumentsURL");
  else
    objc_msgSend(a1, "legacy_applicationDocumentsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)legacy_centralizedDataPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Reminders/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)legacy_applicationDocumentsURL
{
  void *v3;
  _QWORD block[5];

  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_38);
  v3 = (void *)legacy_applicationDocumentsURL;
  if (!legacy_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__REMPaths_legacy_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)creationQueue, block);
    v3 = (void *)legacy_applicationDocumentsURL;
  }
  return v3;
}

void __42__REMPaths_legacy_applicationDocumentsURL__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;

}

void __42__REMPaths_legacy_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!legacy_applicationDocumentsURL)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "_legacy_shouldUseCentralizedDataPath");
    v3 = *(void **)(a1 + 32);
    if (v2)
      objc_msgSend(v3, "legacy_centralizedDataPath");
    else
      objc_msgSend(v3, "URLForGroupContainerWithIdentifier:", CFSTR("group.com.apple.reminders"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)legacy_applicationDocumentsURL;
    legacy_applicationDocumentsURL = v4;

    if (!legacy_applicationDocumentsURL)
    {
      objc_msgSend(*(id *)(a1 + 32), "legacy_centralizedDataPath");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)legacy_applicationDocumentsURL;
      legacy_applicationDocumentsURL = v6;

    }
  }
}

+ (id)dataSeparationEnabled_applicationDocumentsURL
{
  void *v3;
  _QWORD block[5];

  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_13_0);
  v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
  if (!dataSeparationEnabled_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)creationQueue, block);
    v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
  }
  return v3;
}

void __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;

}

void __57__REMPaths_dataSeparationEnabled_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!dataSeparationEnabled_applicationDocumentsURL)
  {
    objc_msgSend(*(id *)(a1 + 32), "URLForGroupContainerWithIdentifier:", CFSTR("group.com.apple.reminders"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)dataSeparationEnabled_applicationDocumentsURL;
    dataSeparationEnabled_applicationDocumentsURL = v2;

    if (!dataSeparationEnabled_applicationDocumentsURL)
    {
      objc_msgSend(*(id *)(a1 + 32), "legacy_applicationDocumentsURL");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)dataSeparationEnabled_applicationDocumentsURL;
      dataSeparationEnabled_applicationDocumentsURL = v4;

    }
  }
}

+ (id)URLForGroupContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE buf[24];
  void *v57;
  uint64_t *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2050000000;
  v5 = (void *)getUMUserManagerClass_softClass_0;
  v55 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUMUserManagerClass_block_invoke_0;
    v57 = &unk_1E67FA198;
    v58 = &v52;
    __getUMUserManagerClass_block_invoke_0((uint64_t)buf);
    v5 = (void *)v53[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v52, 8);
  objc_msgSend(v6, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProxy");
  v51 = 0;
  v47 = objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v51);
  v10 = v51;
  v11 = v10;
  if (v10)
    v12 = 0;
  else
    v12 = v9;
  if (v12 == 1)
  {
    v13 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "URLForGroupContainer: Temporarily adopting personal persona context instead of system proxy", buf, 2u);
    }

    v52 = 0;
    v53 = &v52;
    v54 = 0x2050000000;
    v14 = (void *)getUMUserPersonaAttributesClass_softClass_0;
    v55 = getUMUserPersonaAttributesClass_softClass_0;
    if (!getUMUserPersonaAttributesClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getUMUserPersonaAttributesClass_block_invoke_0;
      v57 = &unk_1E67FA198;
      v58 = &v52;
      __getUMUserPersonaAttributesClass_block_invoke_0((uint64_t)buf);
      v14 = (void *)v53[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v52, 8);
    objc_msgSend(v15, "personaAttributesForPersonaType:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject userPersonaUniqueString](v16, "userPersonaUniqueString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v17);

  }
  else
  {
    if (!v10)
      goto LABEL_16;
    v16 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[REMPaths URLForGroupContainerWithIdentifier:].cold.3((uint64_t)v11, v16, v19, v20, v21, v22, v23, v24);
  }

LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v47);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerURLForSecurityApplicationGroupIdentifier:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v27 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v27, OS_LOG_TYPE_INFO, "URLForGroupContainer: NSFileManager failed to return our group container, falling back to bundle proxy", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", CFSTR("com.apple.reminders"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "groupContainerURLs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v12)
    v30 = (id)objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v48);
  if (v26)
  {
    v50 = 0;
    v31 = objc_msgSend(v26, "checkResourceIsReachableAndReturnError:", &v50);
    v32 = v50;
    if ((v31 & 1) == 0)
    {
      v33 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1B4A39000, v33, OS_LOG_TYPE_DEFAULT, "URLForGroupContainer: %@ group container URL is not reachable. URL=%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attributesForGroupContainerDirectory");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      v36 = objc_msgSend(v34, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 1, v35, &v49);
      v37 = v49;

      if ((v36 & 1) == 0)
      {
        v38 = os_log_create("com.apple.reminderkit", "default");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          +[REMPaths URLForGroupContainerWithIdentifier:].cold.2((uint64_t)v4, (uint64_t)v37, v38);

      }
    }
  }
  else
  {
    v32 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[REMPaths URLForGroupContainerWithIdentifier:].cold.1((uint64_t)v4, v32, v39, v40, v41, v42, v43, v44);
  }

  v45 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_1B4A39000, v45, OS_LOG_TYPE_INFO, "URLForGroupContainer: Group container URL: %@", buf, 0xCu);
  }

  return v26;
}

+ (BOOL)_legacy_shouldUseCentralizedDataPath
{
  if (_legacy_shouldUseCentralizedDataPath_onceToken != -1)
    dispatch_once(&_legacy_shouldUseCentralizedDataPath_onceToken, &__block_literal_global_17_0);
  return _legacy_shouldUseCentralizedDataPath_sResult;
}

void __48__REMPaths__legacy_shouldUseCentralizedDataPath__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqual:", CFSTR("remindd")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("xctest")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("remindtool"));
  }
  _legacy_shouldUseCentralizedDataPath_sResult = v1;

}

+ (id)attributesForGroupContainerDirectory
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2AA8];
  v4[0] = &unk_1E6837018;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)unitTest_setLegacyApplicationDocumentsURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_38_0);
  v4 = creationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke_2;
  block[3] = &unk_1E67F8A58;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("REMPathsCreateApplicationDocumentsURLs", v2);
  v1 = (void *)creationQueue;
  creationQueue = (uint64_t)v0;

}

void __65__REMPaths_UnitTests__unitTest_setLegacyApplicationDocumentsURL___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)&legacy_applicationDocumentsURL, *(id *)(a1 + 32));
}

+ (void)URLForGroupContainerWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "URLForGroupContainer: Failed to get group container URL (maybe simulator) for \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)URLForGroupContainerWithIdentifier:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "URLForGroupContainer: Error creating %@ group container: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)URLForGroupContainerWithIdentifier:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "URLForGroupContainer: Error saving persona context {error: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

@end
