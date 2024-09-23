@implementation PLDemoModeUtilities

- (NSString)demoContentPhotoLibraryStagingPath
{
  void *v2;
  void *v3;

  -[PLDemoModeUtilities demoContentStagingBasePath](self, "demoContentStagingBasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("DemoPhotoLibrary_STAGED.photoslibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)demoContentPhotoLibraryPrestagingPath
{
  void *v2;
  void *v3;

  -[PLDemoModeUtilities demoContentPhotoLibraryStagingPath](self, "demoContentPhotoLibraryStagingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-inprogress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PLDemoModeUtilities)initWithDemoContentTemplatePath:(id)a3 stagingBasePath:(id)a4 targetPhotoLibraryPathManager:(id)a5 options:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  PLDemoModeUtilities *v15;
  PLDemoModeUtilities *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDemoModeUtilities.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stagingBase"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDemoModeUtilities.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("templatePath"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDemoModeUtilities.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PLDemoModeUtilities;
  v15 = -[PLDemoModeUtilities init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_demoContentPhotoLibraryTemplatePath, a3);
    objc_storeStrong((id *)&v16->_demoContentStagingBasePath, a4);
    objc_storeStrong((id *)&v16->_targetPhotoLibraryPathManager, a5);
    v16->_options = a6;
  }

  return v16;
}

- (BOOL)_evalSystemSafetyCheck:(id)a3
{
  if ((self->_options & 1) != 0)
    return 1;
  else
    return (*((uint64_t (**)(id))a3 + 2))(a3);
}

- (BOOL)replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  -[PLDemoModeUtilities _evalSystemSafetyCheck:](self, "_evalSystemSafetyCheck:", &__block_literal_global_77933);
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)warmUpDemoLibraryInstalledFromStagedTemplate
{
  NSObject *v2;
  uint8_t buf[16];

  PLStoreDemoModeGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Performing demo library post processing after installation [warmUpDemoLibraryInstalledFromStagedTemplate]", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  PLSafeRunWithUnfairLock();
}

- (BOOL)prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate
{
  PLDemoModeUtilities *v2;
  void *v3;
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v11 = -[PLDemoModeUtilities _evalSystemSafetyCheck:](self, "_evalSystemSafetyCheck:", &__block_literal_global_66_77921);
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDemoModeUtilities demoContentPhotoLibraryTemplatePath](v2, "demoContentPhotoLibraryTemplatePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v4;
  PLSafeRunWithUnfairLock();
  LOBYTE(v2) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (void)kickstartStagedDemoContentInstallationByKillingAllClients
{
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = -[PLDemoModeUtilities _evalSystemSafetyCheck:](self, "_evalSystemSafetyCheck:", &__block_literal_global_67_77917);
  PLStoreDemoModeGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Killing all connected photos clients to kickstart demo content installation.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setSqliteErrorForRebuildReason:allowsExit:](v4, "setSqliteErrorForRebuildReason:allowsExit:", 3, 1);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Safety check failed: kickstartStagedDemoContentInstallationByKillingAllClients requires store demo mode", v5, 2u);
  }

}

- (int64_t)markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  const __CFString *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[PLDemoModeUtilities targetPhotoLibraryPathManager](self, "targetPhotoLibraryPathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent:]", v5, 0, &v16);
  v7 = v16;

  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__PLDemoModeUtilities_markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent___block_invoke;
    v12[3] = &unk_1E3671990;
    v15 = v3;
    v13 = v6;
    v14 = &v17;
    objc_msgSend(v13, "performBlockAndWait:", v12);

    v8 = v18[3];
  }
  else
  {
    PLStoreDemoModeGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2114;
      v24 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to update target library assets as demo content = %@, unable to load photo library %{public}@", buf, 0x16u);
    }

    v8 = -1;
    v18[3] = -1;
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)fetchDemoContentResultsInLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PLDemoContentResults *v24;
  NSObject *v25;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v27) = 256;
  v8 = objc_msgSend(MEMORY[0x1E0D73310], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, objc_msgSend(v3, "isCloudPhotoLibraryEnabled"), v27);
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v9);
  v40 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v40;
  v12 = v11;
  if (v10)
  {
    v28 = v11;
    v30 = v9;
    v31 = v7;
    v32 = v4;
    v33 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v29 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      v17 = *MEMORY[0x1E0D73F10];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v19, "mainFileURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)buf = 0;
          objc_msgSend(v22, "getUInt16:forKey:", buf, v17);
          if (*(_WORD *)buf)
          {
            if (objc_msgSend(v19, "hasAdjustments"))
              objc_msgSend(v34, "addObject:", v19);
          }
          else
          {
            objc_msgSend(v19, "objectID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v35, "addObject:", v23);

          }
          objc_autoreleasePoolPop(v20);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v15);
    }

    v24 = objc_alloc_init(PLDemoContentResults);
    v25 = v35;
    -[PLDemoContentResults setAssetIDsToDelete:](v24, "setAssetIDsToDelete:", v35);
    -[PLDemoContentResults setAssetsToRevert:](v24, "setAssetsToRevert:", v34);

    v4 = v32;
    v3 = v33;
    v9 = v30;
    v7 = v31;
    v12 = v28;
    v10 = v29;
  }
  else
  {
    PLStoreDemoModeGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v12;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Fetching demo assets failed %{public}@", buf, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v7 = -[PLDemoModeUtilities _evalSystemSafetyCheck:](self, "_evalSystemSafetyCheck:", &__block_literal_global_77_77867);
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (NSString)demoContentPhotoLibraryTemplatePath
{
  return self->_demoContentPhotoLibraryTemplatePath;
}

- (NSString)demoContentStagingBasePath
{
  return self->_demoContentStagingBasePath;
}

- (PLPhotoLibraryPathManager)targetPhotoLibraryPathManager
{
  return self->_targetPhotoLibraryPathManager;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPhotoLibraryPathManager, 0);
  objc_storeStrong((id *)&self->_demoContentPhotoLibraryTemplatePath, 0);
  objc_storeStrong((id *)&self->_demoContentStagingBasePath, 0);
}

void __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  PLPhotoLibraryOptions *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PLStoreDemoModeGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Starting legacy clean up for Store Demo Mode", buf, 2u);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = objc_alloc_init(PLPhotoLibraryOptions);
      -[PLPhotoLibraryOptions setRequiredState:](v3, "setRequiredState:", 6);
      -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v3, "setAutomaticallyPinToFirstFetch:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "targetPhotoLibraryPathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary]_block_invoke", v5, v3, &v17);
    v7 = v17;

    if (v6)
    {

      v8 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v6, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_79;
      v13[3] = &unk_1E3676EC8;
      v13[4] = *(_QWORD *)(a1 + 32);
      v10 = v6;
      v14 = v10;
      v15 = v9;
      v16 = *(_QWORD *)(a1 + 40);
      v11 = v9;
      objc_msgSend(v11, "performBlockAndWait:", v13);

      objc_autoreleasePoolPop(v8);
      goto LABEL_14;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    PLStoreDemoModeGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to cleanup demo library, unable to load photo library %{public}@", buf, 0xCu);
    }

  }
  PLStoreDemoModeGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Safety check failed: finalizeStoreDemoModeByRemovingNonDemoContentFromLibrary requires store demo mode", buf, 2u);
  }
LABEL_14:

}

void __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  char v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  char v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "fetchDemoContentResultsInLibrary:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoreDemoModeGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "assetsToRevert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v79 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Reverting %lu demo content assets that have adjustments", buf, 0xCu);

  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v3, "assetsToRevert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v73 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "revertToOriginal");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v9);
  }

  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v71 = 0;
  v14 = objc_msgSend(v12, "safeSave:error:", v13, &v71);
  v15 = v71;
  if ((v14 & 1) == 0)
  {
    PLStoreDemoModeGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Save failed reverting assets %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  PLStoreDemoModeGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "assetIDsToDelete");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134217984;
    v79 = v19;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Deleting %lu assets that are not demo content", buf, 0xCu);

  }
  objc_msgSend(v3, "assetIDsToDelete");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[cleanupForStoreDemoMode] Deleting assets that are not demo content."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(a1 + 40);
    v24 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v3, "assetIDsToDelete");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:", CFSTR("self IN %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v27 = objc_msgSend(v23, "batchDeleteAssetsWithPredicate:reason:error:", v26, v22, &v70);
    v28 = v70;

    if ((v27 & 1) == 0)
    {
      PLStoreDemoModeGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v79 = (uint64_t)v28;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Error deleting non-demo assets %{public}@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
  objc_autoreleasePoolPop(v2);
  v30 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Album"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((kind = %d) OR (kind = %d)) AND (assets.@count = 0)"), 2, 12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPredicate:", v32);

  v33 = *(void **)(a1 + 48);
  v69 = 0;
  objc_msgSend(v33, "executeFetchRequest:error:", v31, &v69);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v69;
  if (!v34)
  {
    PLStoreDemoModeGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v35;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Fetching empty albums failed %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  PLStoreDemoModeGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(v34, "count");
    *(_DWORD *)buf = 134217984;
    v79 = v38;
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Deleting %lu empty albums", buf, 0xCu);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v39 = v34;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "delete");
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v41);
  }

  v44 = *(void **)(a1 + 40);
  v45 = *(_QWORD *)(a1 + 48);
  v64 = 0;
  v46 = objc_msgSend(v44, "safeSave:error:", v45, &v64);
  v47 = v64;
  if ((v46 & 1) == 0)
  {
    PLStoreDemoModeGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v47;
      _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Save failed deleting albums %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

  objc_autoreleasePoolPop(v30);
  PLStoreDemoModeGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "Forcing refresh on image well", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "cameraPreviewWellManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "refreshPreviewWellImageWithContext:avoidNotificationIfLinkIsAlreadySet:", *(_QWORD *)(a1 + 48), 0);

  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pathManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "photoDirectoryWithType:", 28);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "stringByAppendingPathComponent:", CFSTR("MISC"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D732E0], "cameraRollPlistName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringByAppendingPathComponent:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  PLStoreDemoModeGetLog();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v79 = (uint64_t)v57;
    _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEFAULT, "Removing DCIM image naming plist %{public}@", buf, 0xCu);
  }

  v63 = 0;
  v59 = objc_msgSend(v52, "removeItemAtPath:error:", v57, &v63);
  v60 = v63;
  if ((v59 & 1) == 0)
  {
    PLStoreDemoModeGetLog();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v60;
      _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "Failed to remove DCIM image naming plist %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v54, "stringByAppendingPathComponent:", CFSTR("Metadata/DCIM"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "removeItemAtPath:error:", v62, 0);

}

void __81__PLDemoModeUtilities_markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D73310], "maskForStoreDemoContent");
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsWithValidatedSavedAssetTypeMask:inManagedObjectContext:](PLManagedAsset, "assetsWithValidatedSavedAssetTypeMask:inManagedObjectContext:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = *MEMORY[0x1E0D73F10];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x19AEC1554](v6);
        objc_msgSend(v11, "mainFileURL", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUInt16:forKey:", *(unsigned __int8 *)(a1 + 48), v9);
        objc_msgSend(v14, "persist");
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v7 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v6;
    }
    while (v6);
  }

}

void __85__PLDemoModeUtilities_prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  NSObject *v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      PLStoreDemoModeGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v40 = v4;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Staging demo library content from template %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "demoContentPhotoLibraryStagingPath");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "demoContentPhotoLibraryPrestagingPath");
      v30 = (void *)v5;
      v31 = objc_claimAutoreleasedReturnValue();
      v46[0] = v5;
      v46[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v36 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v12))
            {
              PLStoreDemoModeGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v40 = v12;
                _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Removing demo library content from staging folder: %{public}@", buf, 0xCu);
              }

              v14 = *(void **)(a1 + 32);
              v34 = v9;
              v15 = objc_msgSend(v14, "removeItemAtPath:error:", v12, &v34);
              v16 = v34;

              if ((v15 & 1) == 0)
              {
                PLStoreDemoModeGetLog();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v40 = v12;
                  v41 = 2114;
                  v42 = (uint64_t)v16;
                  _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to remove demo library content from %{public}@: %{public}@", buf, 0x16u);
                }

              }
              v9 = v16;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v33 = v9;
      v22 = (void *)v31;
      v23 = objc_msgSend(v20, "copyItemAtPath:toPath:error:", v21, v31, &v33);
      v24 = v33;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v23;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v25 = *(void **)(a1 + 32);
        v32 = v24;
        v26 = v30;
        v27 = objc_msgSend(v25, "moveItemAtPath:toPath:error:", v31, v30, &v32);
        v18 = v32;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v27;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
LABEL_33:

          goto LABEL_34;
        }
        PLStoreDemoModeGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v40 = v31;
          v41 = 2114;
          v42 = (uint64_t)v30;
          v43 = 2114;
          v44 = v18;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to move demo library content from prestaging %{public}@ to staging folder %{public}@: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        PLStoreDemoModeGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v26 = v30;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v40 = v29;
          v41 = 2114;
          v42 = v31;
          v43 = 2114;
          v44 = v24;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to copy demo content from %{public}@ into pre-stage folder %{public}@: %{public}@", buf, 0x20u);
        }
        v18 = v24;
      }

      v22 = (void *)v31;
      goto LABEL_33;
    }
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v2 + 24) = 0;
  PLStoreDemoModeGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v40 = v19;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "No demo library content template found at %{public}@", buf, 0xCu);
  }
LABEL_34:

}

void __67__PLDemoModeUtilities_warmUpDemoLibraryInstalledFromStagedTemplate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "targetPhotoLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities warmUpDemoLibraryInstalledFromStagedTemplate]_block_invoke", v3, 0, &v13);
  v5 = v13;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    PLStoreDemoModeGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v7 - *(double *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v15 = v9;
      v10 = "Successfully opened demo library in %2.2fs";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199541000, v11, v12, v10, buf, 0xCu);
    }
  }
  else
  {
    PLStoreDemoModeGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = *(double *)&v5;
      v10 = "Failed to open demo library %{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

}

void __77__PLDemoModeUtilities_replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _QWORD v65[2];
  _QWORD v66[2];
  uint8_t buf[4];
  NSObject *v68;
  __int16 v69;
  NSObject *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "demoContentPhotoLibraryStagingPath");
  v3 = objc_claimAutoreleasedReturnValue();
  v51 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "fileExistsAtPath:", v3);
  }
  else
  {
    PLStoreDemoModeGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "targetPhotoLibraryPathManager");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "demoContentPhotoLibraryStagingPath");
      v6 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v5;
      v69 = 2114;
      v70 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "System does not allow installing staged demo photo library content. Ignoring request to replace target library %{public}@ with staged demo library %{public}@", buf, 0x16u);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v50 = a1;
    objc_msgSend(*(id *)(a1 + 32), "targetPhotoLibraryPathManager");
    v7 = objc_claimAutoreleasedReturnValue();
    PLStoreDemoModeGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v68 = v7;
      v69 = 2112;
      v70 = v3;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Overwriting target library %@ with staged demo library %@", buf, 0x16u);
    }

    -[NSObject photoDirectoryWithType:](v7, "photoDirectoryWithType:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v9;
    -[NSObject photoDirectoryWithType:](v7, "photoDirectoryWithType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject iTunesPhotosDirectory](v7, "iTunesPhotosDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v12;
    v48 = v7;
    -[NSObject photoStreamsDataDirectory](v7, "photoStreamsDataDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v14 = objc_claimAutoreleasedReturnValue();

    v49 = v11;
    v47 = (void *)v14;
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          v20 = *(NSObject **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if (objc_msgSend(v2, "fileExistsAtPath:", v20))
          {
            v58 = 0;
            v21 = objc_msgSend(v2, "removeItemAtPath:error:", v20, &v58);
            v22 = v58;
            if ((v21 & 1) == 0)
            {
              PLStoreDemoModeGetLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v68 = v20;
                v69 = 2114;
                v70 = v22;
                _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to remove target photo library folder %{public}@: %{public}@", buf, 0x16u);
              }

            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v17);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v24 = v15;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    v26 = v51;
    if (v25)
    {
      v27 = v25;
      v28 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v24);
          v30 = *(NSObject **)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[NSObject lastPathComponent](v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringByAppendingPathComponent:](v26, "stringByAppendingPathComponent:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "fileExistsAtPath:", v32))
          {
            PLStoreDemoModeGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v32;
              _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Copying demo content from %{public}@...", buf, 0xCu);
            }

            v53 = 0;
            v34 = objc_msgSend(v2, "copyItemAtPath:toPath:error:", v32, v30, &v53);
            v35 = v53;
            if ((v34 & 1) == 0)
            {
              PLStoreDemoModeGetLog();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v68 = v30;
                v69 = 2114;
                v70 = v35;
                _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Error copying demo content to %{public}@ folder: %{public}@", buf, 0x16u);
              }
              goto LABEL_37;
            }
            goto LABEL_38;
          }
          if (objc_msgSend(v49, "containsObject:", v30))
          {
            PLStoreDemoModeGetLog();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v32;
              _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "No demo content exists for required folder %{public}@", buf, 0xCu);
            }
            v35 = 0;
LABEL_37:

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 40) + 8) + 24) = 0;
LABEL_38:
            v26 = v51;
            goto LABEL_40;
          }
          v35 = 0;
LABEL_40:

        }
        v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v27);
    }

    v52 = 0;
    v37 = objc_msgSend(v2, "removeItemAtPath:error:", v26, &v52);
    v38 = v52;
    v39 = v48;
    if ((v37 & 1) == 0)
    {
      PLStoreDemoModeGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v68 = v51;
        v69 = 2114;
        v70 = v38;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "Error removing staged demo content from %{public}@: %{public}@", buf, 0x16u);
      }

    }
    v41 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v50 + 40) + 8) + 24);
    PLStoreDemoModeGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v44 = "Demo library content installation complete";
        v45 = v43;
        v46 = OS_LOG_TYPE_DEFAULT;
LABEL_53:
        _os_log_impl(&dword_199541000, v45, v46, v44, buf, 2u);
      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v44 = "Demo library content installation failed";
      v45 = v43;
      v46 = OS_LOG_TYPE_ERROR;
      goto LABEL_53;
    }

    v3 = v51;
    goto LABEL_55;
  }
  PLStoreDemoModeGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Staged demo content library does not exist, ignoring request to replace target library", buf, 2u);
  }
LABEL_55:

}

+ (NSString)systemDemoContentPhotoLibraryTemplatePath
{
  return (NSString *)CFSTR("/var/mobile/Documents/DemoPhotoLibraryTemplate");
}

+ (NSString)systemDemoContentStagingBasePath
{
  return (NSString *)CFSTR("/var/mobile/Library/Photos/Libraries");
}

+ (id)newDemoModeUtilitiesWithDefaultSystemPaths
{
  void *v3;
  void *v4;
  void *v5;
  PLDemoModeUtilities *v6;

  objc_msgSend(a1, "systemDemoContentPhotoLibraryTemplatePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemDemoContentStagingBasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLDemoModeUtilities initWithDemoContentTemplatePath:stagingBasePath:targetPhotoLibraryPathManager:options:]([PLDemoModeUtilities alloc], "initWithDemoContentTemplatePath:stagingBasePath:targetPhotoLibraryPathManager:options:", v3, v4, v5, 0);

  return v6;
}

@end
