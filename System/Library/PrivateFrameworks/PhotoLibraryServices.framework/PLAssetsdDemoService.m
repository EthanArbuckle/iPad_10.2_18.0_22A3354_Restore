@implementation PLAssetsdDemoService

- (PLAssetsdDemoService)initWithConnectionAuthorization:(id)a3
{
  id v5;
  PLAssetsdDemoService *v6;
  PLAssetsdDemoService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdDemoService;
  v6 = -[PLAssetsdDemoService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);

  return v7;
}

- (void)cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:(id)a3
{
  void (**v3)(id, uint64_t, void *);
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  int v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  const char *Name;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, void *))a3;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v26) = v4;
  if (v4)
  {
    *((_QWORD *)&v26 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = +[PLDemoModeUtilities newDemoModeUtilitiesWithDefaultSystemPaths](PLDemoModeUtilities, "newDemoModeUtilitiesWithDefaultSystemPaths");
  PLStoreDemoModeGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Cleanup for store demo mode [requested by SpringBoard]", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "demoContentPhotoLibraryTemplatePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    PLStoreDemoModeGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "demoContentPhotoLibraryTemplatePath");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Found demo content template, staging photo library from %{public}@", buf, 0xCu);

    }
    if ((objc_msgSend(v6, "prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate") & 1) != 0)
    {
      v13 = 0;
      v14 = 0;
LABEL_14:
      v16 = 1;
      goto LABEL_18;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2938];
    v32 = CFSTR("unable to stage demo library content from template");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLStoreDemoModeGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "No demo content template found, performing legacy demo library content cleanup by resetting library", buf, 2u);
    }

    if ((objc_msgSend(v6, "cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary") & 1) != 0)
    {
      v14 = 0;
      v13 = 1;
      goto LABEL_14;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    v30 = CFSTR("unable to remove non-demo content");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (char *)v19;

  v16 = 0;
  v13 = 1;
LABEL_18:

  objc_autoreleasePoolPop(v5);
  if ((v16 & 1) == 0)
  {
    PLStoreDemoModeGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v14;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to cleanup demo library, %{public}@", buf, 0xCu);
    }

  }
  v3[2](v3, v16, v14);
  if (((v13 | v16 ^ 1) & 1) == 0)
  {
    PLStoreDemoModeGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Cleanup for store demo mode force exiting photos clients to kickstart staged library installation", buf, 2u);
    }

    objc_msgSend(v6, "kickstartStagedDemoContentInstallationByKillingAllClients");
  }

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v27, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)hasCompletedRestorePostProcessingWithReply:(id)a3
{
  void (**v3)(id, uint64_t);
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  __int128 v10;
  char v11;
  __int128 v12;
  SEL sel[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t))a3;
  v12 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: hasCompletedRestorePostProcessingWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL", (_QWORD)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdDemoService hasCompletedRestorePostProcessingWithReply:]", v5, 0, 0);

  v3[2](v3, objc_msgSend(v6, "hasCompletedRestorePostProcessing"));
  if (v11)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  if ((_QWORD)v12)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)hasCompletedMomentAnalysisWithReply:(id)a3
{
  void (**v3)(id, uint64_t);
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  __int128 v10;
  char v11;
  __int128 v12;
  SEL sel[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t))a3;
  v12 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: hasCompletedMomentAnalysisWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL", (_QWORD)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdDemoService hasCompletedMomentAnalysisWithReply:]", v5, 0, 0);

  v3[2](v3, objc_msgSend(v6, "hasCompletedMomentAnalysis"));
  if (v11)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  if ((_QWORD)v12)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

@end
