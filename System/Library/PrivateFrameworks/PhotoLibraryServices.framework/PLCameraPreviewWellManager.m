@implementation PLCameraPreviewWellManager

- (void)_fetchPreviewWellAssetUsingContext:(id)a3 withAssetHandler:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int16 v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int16 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PLCameraPreviewWellAssetInfo *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  _PLCameraPreviewWellAssetFetchRequest();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeFetchRequest:error:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid"));
      v39 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("directory"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("filename"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleScope"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v7;
      v15 = objc_msgSend(v14, "shortValue");
      objc_msgSend(v5, "pathManager");
      v41 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLThumbnailManager thumbnailIdentifierWithAssetUUID:directory:filename:bundleScope:pathManager:](PLThumbnailManager, "thumbnailIdentifierWithAssetUUID:directory:filename:bundleScope:pathManager:", v11, v12, v13, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v37 = [PLCameraPreviewWellAssetInfo alloc];
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uuid"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sortToken"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v19 = v18;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("addedDate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hidden"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v36, "BOOLValue");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("visibilityState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v34, "longValue");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("trashedState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v14) = objc_msgSend(v31, "longValue");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("avalanchePickType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "longValue");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "longValue");
      objc_msgSend(v41, "pathManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v17;
      v25 = (void *)v17;
      LOWORD(v28) = v23;
      v7 = v40;
      v26 = -[PLCameraPreviewWellAssetInfo initWithUUID:sortToken:addedDate:hidden:visibilityState:trashedState:avalanchePickType:savedAssetType:thumbnailIdentifier:pathManager:](v37, "initWithUUID:sortToken:addedDate:hidden:visibilityState:trashedState:avalanchePickType:savedAssetType:thumbnailIdentifier:pathManager:", v35, v33, v32, v30, (__int16)v14, v21, v19, v28, v29, v24);

      v5 = v41;
      v8 = v39;

    }
    else
    {
      v26 = 0;
    }

    v6[2](v6, 1, v26);
    v6 = (void (**)(id, uint64_t, uint64_t))v26;
  }
  else
  {
    PLThumbnailsGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v8;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Error fetching assets for camera preview well metadata: %@", buf, 0xCu);
    }

    v6[2](v6, 0, 0);
  }

}

- (void)_clearPreviewWellAndNotify
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73140], "cameraPreviewWellImageFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v3, "removeItemAtURL:error:", v2, &v12);
  v5 = v12;

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == 2)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

    }
    PLThumbnailsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "failed to remove camera preview image: %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
  PLThumbnailsGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Posting camera preview image change notification for clearing preview", buf, 2u);
  }

  notify_post("cameraPreviewImageWellChanged");
}

- (void)_updateLinkAndNotifyForAssetInfo:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v5 = a3;
  v4 = PLIsAssetsd();
  if ((v4 & 1) != 0 || MEMORY[0x19AEC0720](v4))
  {
    v6 = v5;
    PLRunWithUnfairLock();

  }
}

- (PLCameraPreviewWellManager)init
{
  PLCameraPreviewWellManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCameraPreviewWellManager;
  result = -[PLCameraPreviewWellManager init](&v3, sel_init);
  if (result)
    result->_linkUpdateLock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)shouldReconsiderCameraPreviewWellImageForUpdatedAsset:(id)a3 thumbnailWasGenerated:(BOOL)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;

  LODWORD(v4) = a4;
  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    v8 = MEMORY[0x19AEC0720]();

    if ((v8 & 1) == 0)
    {
      PLThumbnailsGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Camera preview well skipping asset with missing path manager", buf, 2u);
      }

      LOBYTE(v4) = 0;
      goto LABEL_19;
    }
  }
  if (!objc_msgSend(v5, "isInserted") || (_DWORD)v4)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2020000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9 = v5;
    PLRunWithUnfairLock();
    if (v22[24])
    {
      if (!*((_BYTE *)v14 + 24) || (v4 & 1) != 0)
      {
LABEL_17:
        LOBYTE(v4) = 1;
        goto LABEL_18;
      }
    }
    else
    {
      if (!*((_BYTE *)v18 + 24))
        goto LABEL_17;
      if (*((_BYTE *)v14 + 24))
      {
        _PLAllowedForCameraPreviewWellPredicate();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "evaluateWithObject:", v9) & (v4 ^ 1);

        if ((v11 & 1) == 0)
          goto LABEL_17;
      }
    }
    LOBYTE(v4) = 0;
LABEL_18:

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);
  }
LABEL_19:

  return v4;
}

- (void)refreshPreviewWellImageWithContext:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __101__PLCameraPreviewWellManager_refreshPreviewWellImageWithContext_avoidNotificationIfLinkIsAlreadySet___block_invoke;
  v4[3] = &unk_1E3662510;
  v4[4] = self;
  v5 = a4;
  -[PLCameraPreviewWellManager _fetchPreviewWellAssetUsingContext:withAssetHandler:](self, "_fetchPreviewWellAssetUsingContext:withAssetHandler:", a3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locked_lastLinkedInfo, 0);
}

void __101__PLCameraPreviewWellManager_refreshPreviewWellImageWithContext_avoidNotificationIfLinkIsAlreadySet___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          objc_msgSend(v6, "thumbnailIdentifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      PLThumbnailsGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Camera preview well updating...", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_updateLinkAndNotifyForAssetInfo:avoidNotificationIfLinkIsAlreadySet:", v6, *(unsigned __int8 *)(a1 + 40));
    }
    else
    {
      PLThumbnailsGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Camera preview well clearing...", v12, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_clearPreviewWellAndNotify");
    }
  }

}

void __106__PLCameraPreviewWellManager_shouldReconsiderCameraPreviewWellImageForUpdatedAsset_thumbnailWasGenerated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_asset:sortsGreaterThanAssetInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uuid");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "isEqual:", v2);

  }
}

void __99__PLCameraPreviewWellManager__updateLinkAndNotifyForAssetInfo_avoidNotificationIfLinkIsAlreadySet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  const std::__fs::filesystem::path *v4;
  void *v5;
  id v6;
  const std::__fs::filesystem::path *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  size_t v13;
  void *v14;
  std::error_code *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  int *v21;
  char *v22;
  NSObject *v23;
  char *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  int *v30;
  char *v31;
  int v32;
  char *v33;
  stat __s1[7];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = +[PLPrimaryResourceDataStore currentDeviceMasterThumbRecipeID](PLPrimaryResourceDataStore, "currentDeviceMasterThumbRecipeID");
  objc_msgSend(MEMORY[0x1E0D73140], "cameraPreviewWellImageFileURL");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const std::__fs::filesystem::path *)objc_msgSend(v3, "fileSystemRepresentation");

  objc_msgSend(MEMORY[0x1E0D73138], "photoDataMiscDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PreviewWellImage_temp.jpg"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const std::__fs::filesystem::path *)objc_msgSend(v6, "fileSystemRepresentation");

  v8 = (void *)MEMORY[0x1E0D732F0];
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v9, v10, v2, 0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

  if (readlink((const char *)v4, (char *)__s1, 0x400uLL) >= 1
    && (v13 = strlen(v12), !strncmp((const char *)__s1, v12, v13)))
  {
    PLThumbnailsGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v24;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Camera preview well link already points to specified asset (%@)", (uint8_t *)&v32, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_19;
    PLThumbnailsGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __s1[0].st_dev = 138412290;
      *(_QWORD *)&__s1[0].st_mode = v26;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "Camera preview well skipping notification because already points to correct asset. (%@)", (uint8_t *)__s1, 0xCu);

    }
  }
  else
  {
    memset(__s1, 0, 144);
    if (!lstat((const char *)v7, __s1))
      unlink((const char *)v7);
    if (symlink(v12, (const char *)v7) == -1)
    {
      PLThumbnailsGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = __error();
        v22 = strerror(*v21);
        v32 = 136315138;
        v33 = v22;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to create camera preview well temp symlink with error: %s", (uint8_t *)&v32, 0xCu);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D73200];
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "persistString:forKey:fileURL:", v18, CFSTR("com.apple.assetsd.thumbnailCameraPreviewImageAssetID"), v16);

      }
      rename(v7, v4, v15);
      if (v19 != -1)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
LABEL_19:
        PLThumbnailsGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          __s1[0].st_dev = 138412290;
          *(_QWORD *)&__s1[0].st_mode = v28;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Posting camera preview well image change notification for asset uuid (%@)", (uint8_t *)__s1, 0xCu);

        }
        notify_post("cameraPreviewImageWellChanged");
        return;
      }
      PLThumbnailsGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = __error();
        v31 = strerror(*v30);
        v32 = 136315138;
        v33 = v31;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Camera preview well failed to rename temp link to final link with error: %s", (uint8_t *)&v32, 0xCu);
      }

      unlink((const char *)v7);
    }
  }
}

+ (BOOL)_asset:(id)a3 sortsGreaterThanAssetInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCameraPreviewWellManager.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetToTest"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    v15 = 1;
    goto LABEL_9;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  _PLAllowedForCameraPreviewWellPredicate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "evaluateWithObject:", v9))
  {
    v18[0] = v9;
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _PLAllowedForCameraPreviewSortDescriptors();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v7);

  }
  else
  {
    v15 = 0;
  }

LABEL_9:
  return v15;
}

@end
