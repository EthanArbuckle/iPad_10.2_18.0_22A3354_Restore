@implementation PLThumbnailManager

+ (id)masterThumbFilename
{
  if (masterThumbFilename_s_onceToken != -1)
    dispatch_once(&masterThumbFilename_s_onceToken, &__block_literal_global_152);
  return (id)masterThumbFilename_s_string;
}

- (id)dataForPhoto:(id)a3 format:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 width:(int *)a6 height:(int *)a7 bytesPerRow:(int *)a8 dataWidth:(int *)a9 dataHeight:(int *)a10 imageDataOffset:(int *)a11
{
  uint64_t v14;
  id v16;
  _BOOL4 v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v23;
  unsigned __int16 v24;

  v23 = a5;
  v14 = a4;
  v16 = a3;
  v24 = v14;
  v17 = +[PLImageLoadingUtilities canAccessImageForAsset:](PLImageLoadingUtilities, "canAccessImageForAsset:", v16);
  if (v17)
  {
    -[PLThumbnailManager _dataForAsset:format:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:imageDataFormat:](self, "_dataForAsset:format:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:imageDataFormat:", v16, v14, a6, a7, a8, a9, a10, a11, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  if (v23 && !v18)
  {
    v19 = objc_msgSend(v16, "effectiveThumbnailIndex") != 0x7FFFFFFFFFFFFFFFLL && v17;
    if (v19 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v18 = 0;
    }
    else
    {
      +[PLPlaceholderThumbnailManager sharedManager](PLPlaceholderThumbnailManager, "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;
      objc_msgSend(v16, "imageSize");
      objc_msgSend(v20, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v21, a6, a7, a8, a9, a10, a11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v18;
}

- (id)_dataForAsset:(id)a3 format:(unsigned __int16)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10 imageDataFormat:(unsigned __int16 *)a11
{
  uint64_t v15;
  id v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  NSMutableSet *v24;
  NSMutableSet *previouslyRequestedThumbnailFixOIDs;
  NSMutableSet *v26;
  void *v27;
  NSMutableSet *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  NSMutableSet *requestedThumbnailFixAssets;
  NSMutableSet *v40;
  NSMutableSet *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  int *v52;
  int *v53;
  int *v54;
  int *v55;
  char v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v15 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  if (!v17)
  {
    v23 = 0;
    goto LABEL_46;
  }
  v18 = -[PLThumbnailManager _supportedThumbnailFormatIDFromGeneralFormatID:](self, "_supportedThumbnailFormatIDFromGeneralFormatID:", v15);
  -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "usesThumbIdentifiers");
  if (!v19)
  {
    v23 = 0;
    if (!a11)
      goto LABEL_45;
    goto LABEL_44;
  }
  v21 = v20;
  v57 = objc_msgSend(v17, "effectiveThumbnailIndex");
  v56 = v21;
  if (objc_msgSend(v19, "usesThumbIdentifiers") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "thumbnailIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v53 = a5;
  v54 = a6;
  v55 = a7;
  objc_msgSend(v19, "imageDataWithIdentifier:orIndex:width:height:bytesPerRow:dataWidth:dataHeight:dataOffset:", v22, v57, a5, a6, a7, a8, a9, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isReadOnly") && !v23 && objc_msgSend(v17, "cloudPlaceholderKind") != 2)
  {
    if (!self->_previouslyRequestedThumbnailFixOIDs)
    {
      v24 = (NSMutableSet *)objc_opt_new();
      previouslyRequestedThumbnailFixOIDs = self->_previouslyRequestedThumbnailFixOIDs;
      self->_previouslyRequestedThumbnailFixOIDs = v24;

    }
    if ((v56 & 1) != 0
      || !-[PLThumbnailManager _thumbnailLoadingAssetIsHiddenOrTrashed:](self, "_thumbnailLoadingAssetIsHiddenOrTrashed:", v17))
    {
      v26 = self->_previouslyRequestedThumbnailFixOIDs;
      objc_msgSend(v17, "objectID");
      v52 = a8;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v26) = -[NSMutableSet containsObject:](v26, "containsObject:", v27);

      a8 = v52;
      if ((v26 & 1) == 0)
      {
        v28 = self->_previouslyRequestedThumbnailFixOIDs;
        objc_msgSend(v17, "objectID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v28, "addObject:", v29);

        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "objectID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        PLThumbnailsGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v57 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v32;
            v35 = "Requesting thumbnail for %{public}@";
            v36 = v34;
            v37 = OS_LOG_TYPE_ERROR;
            v38 = 12;
LABEL_22:
            _os_log_impl(&dword_199541000, v36, v37, v35, buf, v38);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v60 = v32;
          v61 = 2048;
          v62 = v57;
          v35 = "Fixing thumbnail for %{public}@ at index %lu";
          v36 = v34;
          v37 = OS_LOG_TYPE_DEFAULT;
          v38 = 22;
          goto LABEL_22;
        }

        -[NSLock lock](self->_fixLock, "lock");
        requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
        if (!requestedThumbnailFixAssets)
        {
          v40 = (NSMutableSet *)objc_opt_new();
          v41 = self->_requestedThumbnailFixAssets;
          self->_requestedThumbnailFixAssets = v40;

          requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
        }
        -[NSMutableSet addObject:](requestedThumbnailFixAssets, "addObject:", v17);
        -[NSLock unlock](self->_fixLock, "unlock");
        objc_msgSend(v17, "pl_photoLibrary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_time(0, 1000000000);
        v58 = v42;
        v43 = v42;
        pl_dispatch_after();

        a8 = v52;
      }
    }
  }
  if ((objc_msgSend(v19, "isReadOnly") & 1) != 0)
    goto LABEL_43;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "uuid");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v23 && (!v44 || (objc_msgSend(v19, "validateData:withToken:", v23, v44) & 1) != 0))
      goto LABEL_42;
LABEL_33:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v17;
      v47 = v46;
      v48 = v57;
      if (v57 == 0x7FFFFFFFFFFFFFFFLL)
        v49 = 1;
      else
        v49 = v56;
      if ((v49 & 1) != 0
        || (objc_msgSend(v46, "hidden") & 1) == 0 && (v48 = v57, !objc_msgSend(v47, "trashedState")))
      {
        objc_msgSend(v47, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
        objc_msgSend(v19, "imageDataWithIdentifier:orIndex:width:height:bytesPerRow:dataWidth:dataHeight:dataOffset:", v22, v48, v53, v54, v55, a8, a9, a10);
        v50 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v50;
      }

    }
    goto LABEL_42;
  }
  v45 = 0;
  if (!v23)
    goto LABEL_33;
LABEL_42:

LABEL_43:
  if (a11)
LABEL_44:
    *a11 = v18;
LABEL_45:

LABEL_46:
  return v23;
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3 readOnly:(BOOL)a4
{
  return -[PLThumbnailManagerCore thumbManagerForFormatID:thumbFileManagerClass:readOnly:](self, "thumbManagerForFormatID:thumbFileManagerClass:readOnly:", a3, objc_opt_class(), a4);
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3
{
  return -[PLThumbnailManager thumbManagerForFormatID:readOnly:](self, "thumbManagerForFormatID:readOnly:", a3, PLIsAssetsd() ^ 1);
}

- (unsigned)_supportedThumbnailFormatIDFromGeneralFormatID:(unsigned __int16)a3
{
  unsigned __int16 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = a3;
  if (a3 == 3039)
  {
    PLThumbnailsGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Low res full screen format is unsupported, clients should use the image manager and specifiy an image size", v8, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "masterThumbnailFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "formatID");

  }
  return v3;
}

- (PLThumbnailManager)initWithPhotoLibraryPathManager:(id)a3 storeFromMigration:(id)a4
{
  id v7;
  id v8;
  PLThumbnailManager *v9;
  PLThumbnailManager *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSLock *v18;
  NSLock *fixLock;
  id v20;
  id v21;
  uint64_t v22;
  PLLazyObject *slowPersistenceManagers;
  PLThumbnailCascadingDownscaleContext *v24;
  PLThumbnailCascadingDownscaleContext *downscaleContext;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbnailManager.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v33.receiver = self;
  v33.super_class = (Class)PLThumbnailManager;
  v9 = -[PLThumbnailManagerCore initWithPhotoLibraryPathManager:](&v33, sel_initWithPhotoLibraryPathManager_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_migrationStore, v8);
    if (!v8)
    {
      v11 = objc_msgSend((id)objc_opt_class(), "requiredThumbnailResetTypeWithPathManager:comparedToConfigPhase:", v7, 1);
      if ((PLIsAssetsd() & 1) != 0 || (MEMORY[0x19AEC0720]() & 1) != 0)
      {
        -[PLThumbnailManager _contextForConfigurationChanges](v10, "_contextForConfigurationChanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLThumbnailManager resetThumbnailsWithResetType:deferHintChanges:inContext:](v10, "resetThumbnailsWithResetType:deferHintChanges:inContext:", v11, 0, v12);

      }
      else
      {
        -[PLThumbnailManager resetThumbnailsWithResetType:deferHintChanges:inContext:](v10, "resetThumbnailsWithResetType:deferHintChanges:inContext:", v11, 0, 0);
      }
    }
    v13 = PLIsAssetsd();
    v14 = MEMORY[0x1E0C809B0];
    if ((v13 & 1) == 0)
    {
      objc_initWeak(&location, v10);
      DCIM_applicationBackgroundedNotificationName();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke;
      v30[3] = &unk_1E3671BB0;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v15, 0, 0, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLThumbnailManager setObserverToken:](v10, "setObserverToken:", v17);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    v18 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    fixLock = v10->_fixLock;
    v10->_fixLock = v18;

    v20 = objc_initWeak(&location, v10);
    v21 = objc_alloc(MEMORY[0x1E0D73248]);
    v28[0] = v14;
    v28[1] = 3221225472;
    v28[2] = __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke_2;
    v28[3] = &unk_1E36759D8;
    objc_copyWeak(&v29, &location);
    v22 = objc_msgSend(v21, "initWithBlock:", v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    slowPersistenceManagers = v10->_slowPersistenceManagers;
    v10->_slowPersistenceManagers = (PLLazyObject *)v22;

    v24 = objc_alloc_init(PLThumbnailCascadingDownscaleContext);
    downscaleContext = v10->_downscaleContext;
    v10->_downscaleContext = v24;

  }
  return v10;
}

- (void)setObserverToken:(id)a3
{
  objc_storeStrong(&self->_observerToken, a3);
}

- (BOOL)resetThumbnailsWithResetType:(int64_t)a3 deferHintChanges:(BOOL)a4 inContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  BOOL v23;
  NSObject *v24;
  _DWORD v26[2];
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumbnailConfigurationDictWithPathManager:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 == 3)
    {
      v16 = (void *)objc_opt_class();
      -[PLThumbnailManagerCore pathManager](self, "pathManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stampThumbnailConfiguration:toFile:withPathManager:", v11, 0, v17);

    }
    v18 = 1;
  }
  else if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]())
  {
    PLThumbnailsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v26[0] = 67109120;
      v26[1] = a3 != 2;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Removing unwanted thumbnail tables (unsupportedOnly: %d)...", (uint8_t *)v26, 8u);
    }

    v13 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeThumbnailTablesUnsupportedOnly:withPathManager:", a3 != 2, v14);

    if (a3 == 2)
    {
      PLThumbnailsGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Deleting master thumbs...", (uint8_t *)v26, 2u);
      }

      -[PLThumbnailManager _removeMasterThumbDirectoriesWithFileManagerDelegate:](self, "_removeMasterThumbDirectoriesWithFileManagerDelegate:", 0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:", v11);
    }
    v19 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stampThumbnailConfiguration:toFile:withPathManager:", v11, 1, v20);

    PLThumbnailsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a3 == 2)
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Resetting all thumbnail indexes for full rebuild...", (uint8_t *)v26, 2u);
      }

      v23 = +[PLModelMigrator resetThumbnailIndexesAndInitiateThumbnailRebuildRequestIfSuccessfulForForThumbnailManager:deferHintChanges:inContext:](PLModelMigrator, "resetThumbnailIndexesAndInitiateThumbnailRebuildRequestIfSuccessfulForForThumbnailManager:deferHintChanges:inContext:", self, v5, v8);
    }
    else
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Marking assets with thumbs for table rebuild...", (uint8_t *)v26, 2u);
      }

      v23 = +[PLModelMigrator markAssetsWithThumbsForTableRebuildInContext:](PLModelMigrator, "markAssetsWithThumbsForTableRebuildInContext:", v8);
    }
    v18 = v23;
  }
  else
  {
    PLThumbnailsGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Only assetsd can reset thumbnails", (uint8_t *)v26, 2u);
    }

    v18 = 0;
  }

  return v18;
}

void __41__PLThumbnailManager_masterThumbFilename__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "masterThumbnailFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v5, "formatID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".JPG"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)masterThumbFilename_s_string;
  masterThumbFilename_s_string = v3;

}

+ (BOOL)hasRebuildingThumbnailsIndicatorAndRebuildingWithPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  PLIsAssetsd();
  objc_msgSend(a1, "_thumbnailRebuildIndicatorPathWithPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  v11 = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", PLThumbnailRequestRetriesLeftKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (v10 > 0)
      v11 = 1;
  }

  return v11;
}

+ (id)_thumbnailRebuildIndicatorPathWithPathManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("rebuild"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_contextForConfigurationChanges
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v15;
  uint8_t buf[16];
  _QWORD v17[4];
  id v18;
  PLThumbnailManager *v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_migrationStore);
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLThumbnailManager _contextForConfigurationChanges]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(WeakRetained, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersistentStoreCoordinator:", v6);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__PLThumbnailManager__contextForConfigurationChanges__block_invoke;
    v17[3] = &unk_1E3677C18;
    v7 = v4;
    v18 = v7;
    v19 = self;
    objc_msgSend(v7, "performBlockAndWait:", v17);

  }
  else
  {
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lookupOrCreateBundleForLibraryURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "state") > 5
      || PLIsAssetsdProxyService() && !PLIsMigrationService()
      || MEMORY[0x19AEC0720]())
    {
      v13 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLThumbnailManager _contextForConfigurationChanges]", v11);
      objc_msgSend(v13, "managedObjectContext");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLThumbnailsGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "thumbnailManager must be initialized with a migrationStore when being used before library is opened.", buf, 2u);
      }

      v7 = 0;
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *previouslyRequestedThumbnailFixOIDs;
  NSMutableSet *requestedThumbnailFixAssets;
  NSLock *fixLock;
  PLThumbnailCascadingDownscaleContext *downscaleContext;
  objc_super v10;

  -[PLThumbnailManager observerToken](self, "observerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThumbnailManager observerToken](self, "observerToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  previouslyRequestedThumbnailFixOIDs = self->_previouslyRequestedThumbnailFixOIDs;
  self->_previouslyRequestedThumbnailFixOIDs = 0;

  requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
  self->_requestedThumbnailFixAssets = 0;

  fixLock = self->_fixLock;
  self->_fixLock = 0;

  downscaleContext = self->_downscaleContext;
  self->_downscaleContext = 0;

  v10.receiver = self;
  v10.super_class = (Class)PLThumbnailManager;
  -[PLThumbnailManagerCore dealloc](&v10, sel_dealloc);
}

- (id)imageTableForFormat:(unsigned __int16)a3
{
  return -[PLThumbnailManager imageTableForFormat:readOnly:](self, "imageTableForFormat:readOnly:", a3, PLIsAssetsd() ^ 1);
}

- (id)imageTableForFormat:(unsigned __int16)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isTable"))
  {
    -[PLThumbnailManager thumbManagerForFormatID:readOnly:](self, "thumbManagerForFormatID:readOnly:", v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)removeObsoleteMetadata
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned __int16 v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  obj = v2;
  objc_msgSend(v2, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  PLAssetFormatsAllKnownFormatIDs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v39;
    v7 = *MEMORY[0x1E0D74898];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "intValue");
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = v9;
        v12 = obj;
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%d.%@"), v11, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v5);
  }

  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoDirectoryWithType:createIfNeeded:error:", 12, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend((id)objc_opt_class(), "thumbnailConfigurationPathWithPathManager:", obj);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  objc_msgSend((id)objc_opt_class(), "_thumbnailRebuildIndicatorPathWithPathManager:", obj);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v32, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        if ((objc_msgSend(v3, "containsObject:", v29) & 1) == 0)
        {
          objc_msgSend(v32, "stringByAppendingPathComponent:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeItemAtPath:error:", v30, 0);

        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v26);
  }

  objc_sync_exit(obj);
}

- (BOOL)wantsTableOnlyRebuild
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailConfigurationDictWithPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "wantsTableOnlyRebuildForThumbnailConfigDict:", v5);
  return (char)self;
}

- (void)reStampConfigAsNeedingTableThumbMigration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailConfigurationDictWithPathManager:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:", v7);
  v5 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stampThumbnailConfiguration:toFile:withPathManager:", v7, 1, v6);

}

- (void)_removeMasterThumbDirectoriesWithFileManagerDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "setDelegate:", v4);
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PLThumbnailManager__removeMasterThumbDirectoriesWithFileManagerDelegate___block_invoke;
  v13[3] = &unk_1E36626C0;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "enumerateBundleScopesWithBlock:", v13);

  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDCIM");

  if (v10)
  {
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoDirectoryWithType:createIfNeeded:error:", 12, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v12, 0);

  }
  objc_sync_exit(v5);

}

- (BOOL)resetThumbnailsForced:(BOOL)a3 isMissingTables:(BOOL)a4 inContext:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v8 = a5;
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  if (a3)
  {
    v10 = 2;
  }
  else
  {
    v11 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "requiredThumbnailResetTypeWithPathManager:comparedToConfigPhase:", v12, 1);

    if (v13 < 1 && a4)
      v10 = 1;
    else
      v10 = v13;
  }
  v14 = -[PLThumbnailManager resetThumbnailsWithResetType:deferHintChanges:inContext:](self, "resetThumbnailsWithResetType:deferHintChanges:inContext:", v10, 0, v8);
  objc_sync_exit(v9);

  return v14;
}

- (int64_t)removeAllThumbnailsInContextForUrgentCacheDeleteRequest:(id)a3 dryRun:(BOOL)a4 count:(unint64_t *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v27;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke;
    v30[3] = &unk_1E36626C0;
    v12 = v9;
    v31 = v12;
    objc_msgSend(v10, "enumerateBundleScopesWithBlock:", v30);

    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isDCIM");

    if (v14)
    {
      -[PLThumbnailManagerCore pathManager](self, "pathManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "photoDirectoryWithType:createIfNeeded:error:", 12, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x2020000000;
    v34 = 0;
    v17 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "allocatedFileSizeOfThumbnailTablesWithPathManager:", v18);

    v34 = v19;
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_2;
    v29[3] = &unk_1E3662710;
    v29[4] = &buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v29);
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    PLThumbnailsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Reset image request hints and thumbnail indexes...", (uint8_t *)&buf, 2u);
    }

    if (!+[PLResourceInstaller resetImageRequestHintsInContext:allowOneTimeThumbRebuild:](PLResourceInstaller, "resetImageRequestHintsInContext:allowOneTimeThumbRebuild:", v8, 1))
    {
      v20 = 0;
      goto LABEL_18;
    }
    -[PLThumbnailManager addRebuildThumbnailsRequest](self, "addRebuildThumbnailsRequest");
    v12 = objc_alloc_init(MEMORY[0x1E0D731E8]);
    PLThumbnailsGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Deleting thumbnail tables ...", (uint8_t *)&buf, 2u);
    }

    v23 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeThumbnailTablesUnsupportedOnly:withPathManager:fileManagerDelegate:", 0, v24, v12);

    PLThumbnailsGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Deleting master thumbs...", (uint8_t *)&buf, 2u);
    }

    -[PLThumbnailManager _removeMasterThumbDirectoriesWithFileManagerDelegate:](self, "_removeMasterThumbDirectoriesWithFileManagerDelegate:", v12);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLPhotoLibraryForceClientExitNotification, 0, 0, 0);
    v20 = objc_msgSend(v12, "totalFileAllocatedSize");
    PLThumbnailsGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "thumbnail tables and master thumbnail allocated size removed: %lld", (uint8_t *)&buf, 0xCu);
    }

    if (a5)
      *a5 = objc_msgSend(v12, "count");
  }

LABEL_18:
  return v20;
}

- (void)addRebuildThumbnailsRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
    MEMORY[0x19AEC0720]();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (!self->_shouldRebuildThumbnails)
  {
    v4 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_thumbnailRebuildIndicatorPathWithPathManager:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = PLThumbnailRequestDateKey;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = PLThumbnailRequestRetriesLeftKey;
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
    v9 = objc_claimAutoreleasedReturnValue();
    v27[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    LOBYTE(v9) = objc_msgSend(v11, "removeItemAtPath:error:", v6, &v21);
    v12 = v21;

    if ((v9 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v16 = objc_msgSend(v14, "code") == 2;

      if (v16)
      {
LABEL_12:

LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "writeToFile:options:error:", v6, 1073741825, 0) & 1) != 0)
        {
          PLThumbnailsGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v6;
            v20 = "Wrote thumbnail rebuild indicator file %@";
LABEL_18:
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
          }
        }
        else
        {
          PLThumbnailsGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v6;
            v20 = "Failed to write thumbnail rebuild indicator file %@";
            goto LABEL_18;
          }
        }

        self->_shouldRebuildThumbnails = 1;
        goto LABEL_20;
      }
    }
    else
    {

    }
    PLThumbnailsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to remove previous thumbnail rebuild indicator file %@ %@", buf, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_20:
  objc_sync_exit(v3);

}

- (BOOL)hasRebuildThumbnailsRequest
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  _BOOL4 shouldRebuildThumbnails;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  PLIsAssetsd();
  if (self->_shouldRebuildThumbnails)
    return 1;
  if (self->_didCheckShouldRebuildThumbnails)
    return 0;
  v4 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_thumbnailRebuildIndicatorPathWithPathManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    PLThumbnailsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Found thumbnail rebuild indicator file on disk at %@, indicates an incomplete thumbnail rebuild on a previous run of assetsd.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", PLThumbnailRequestRetriesLeftKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    v13 = (v12 - 1);
    if ((int)v12 < 1)
    {
      v25 = objc_msgSend(v10, "count", v13);
      PLThumbnailsGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138543362;
          v31 = v10;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Thumbnail rebuild indicator file on disk has no retries left.  Will not attempt thumbnail rebuild: %{public}@", buf, 0xCu);
        }

        self->_hasExceededThumbnailRebuildRequestLimit = 1;
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Thumbnail rebuild indicator file on disk is corrupt.  Will not attempt thumbnail rebuild", buf, 2u);
        }

      }
      self->_shouldRebuildThumbnails = 0;
      notify_post("PLThumbnailRebuildDidStop");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v14, PLThumbnailRequestRetriesLeftKey);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)PLThumbnailRequestDateKey, "stringByAppendingFormat:", CFSTR("(%d retries left)"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v16, v17);

      PLThumbnailsGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v10;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Updating thumbnail rebuild request indicator file:\n%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v20 = objc_msgSend(v19, "removeItemAtPath:error:", v6, &v29);
      v21 = v29;

      if ((v20 & 1) == 0)
      {
        PLThumbnailsGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v21;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to remove previous thumbnail rebuild indicator file %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "writeToFile:options:error:", v6, 1073741825, 0) & 1) == 0)
      {
        PLThumbnailsGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v6;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to write updated thumbnail rebuild indicator file %@", buf, 0xCu);
        }

      }
      self->_shouldRebuildThumbnails = 1;
    }

  }
  self->_didCheckShouldRebuildThumbnails = 1;
  shouldRebuildThumbnails = self->_shouldRebuildThumbnails;

  return shouldRebuildThumbnails;
}

- (void)removeRebuildThumbnailsRequest:(const char *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  char v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
    MEMORY[0x19AEC0720]();
  self->_shouldRebuildThumbnails = 0;
  v5 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_thumbnailRebuildIndicatorPathWithPathManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v7);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v10 = objc_msgSend(v9, "removeItemAtPath:error:", v7, &v18);
  v11 = (char *)v18;

  PLThumbnailsGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = a3;
      v21 = 2112;
      v22 = v8;
      v14 = "Removed thumbnail rebuild indicator file (%s): %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 22;
LABEL_8:
      _os_log_impl(&dword_199541000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v11;
    v21 = 2080;
    v22 = a3;
    v23 = 2112;
    v24 = v8;
    v14 = "Failed to remove thumbnail rebuild indicator file %@ (%s): %@";
    v15 = v13;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
    goto LABEL_8;
  }

  notify_post("PLThumbnailRebuildDidStop");
}

- (void)_recordRebuildThumbnailsAttempt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_thumbnailRebuildIndicatorPathWithPathManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoDirectoryWithType:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v11, "setDateFormat:", CFSTR("yyyyMMdd-HHmmssZZZZZ"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("RebuildThumbnails_"), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    LOBYTE(v12) = objc_msgSend(v16, "copyItemAtPath:toPath:error:", v6, v15, &v20);
    v17 = v20;

    if ((v12 & 1) == 0)
    {
      PLThumbnailsGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to copy thumbnail rebuild indicator file to the caches directory, error (%@)", buf, 0xCu);
      }

    }
  }

  objc_sync_exit(v3);
}

- (void)_discardAlreadyFailedAssetObjectIDsForRebuild
{
  NSMutableArray *alreadyFailedAssetObjectIDsForRebuild;

  -[NSLock lock](self->_fixLock, "lock");
  alreadyFailedAssetObjectIDsForRebuild = self->_alreadyFailedAssetObjectIDsForRebuild;
  self->_alreadyFailedAssetObjectIDsForRebuild = 0;

  -[NSLock unlock](self->_fixLock, "unlock");
}

- (id)_missingThumbnailPredicate
{
  pl_dispatch_once();
  return (id)_missingThumbnailPredicate_pl_once_object_37;
}

- (int64_t)_rebuildAssetThumbnailsWithLimit:(int)a3 library:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  int64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  PLThumbnailManager *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint8_t *v20;
  int v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((unint64_t)-[NSMutableArray count](self->_alreadyFailedAssetObjectIDsForRebuild, "count") < 0x2711)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__10532;
    v26 = __Block_byref_object_dispose__10533;
    v27 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__PLThumbnailManager__rebuildAssetThumbnailsWithLimit_library_error___block_invoke;
    v15[3] = &unk_1E3662758;
    v21 = a3;
    v16 = v8;
    v17 = self;
    v18 = &v32;
    v19 = &v28;
    v20 = buf;
    objc_msgSend(v16, "performTransactionAndWait:", v15);
    v11 = (void *)*((_QWORD *)v23 + 5);
    if (v11)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      PLThumbnailsGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *((_QWORD *)v23 + 5);
        *(_DWORD *)v36 = 138412290;
        v37 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error rebuilding thumbnails: %@", v36, 0xCu);
      }

    }
    if (*((_BYTE *)v29 + 24))
      v10 = -1;
    else
      v10 = v33[3];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    PLThumbnailsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to rebuild thumbnails for too many assets. Ending thumbnail rebuild now", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)hasMissingThumbnailsInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFetchLimit:", 1);
  -[PLThumbnailManager _missingThumbnailPredicate](self, "_missingThumbnailPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PLThumbnailManager_hasMissingThumbnailsInLibrary___block_invoke;
  v13[3] = &unk_1E3676EA0;
  v16 = &v17;
  v10 = v5;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v4, "performBlockAndWait:", v13);
  LOBYTE(v8) = v18[3] != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (id)_rebuildThumbnailsQueue
{
  if (_rebuildThumbnailsQueue_onceToken != -1)
    dispatch_once(&_rebuildThumbnailsQueue_onceToken, &__block_literal_global_94_10527);
  return (id)_rebuildThumbnailsQueue_rebuildThumbsQueue;
}

- (void)continueRebuildingTableThumbsInLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  PLThumbnailsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Continuing table only thumbnail rebuild...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLThumbnailManager continueRebuildingTableThumbsInLibrary:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLThumbnailManager _rebuildThumbnailsQueue](self, "_rebuildThumbnailsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PLThumbnailManager_continueRebuildingTableThumbsInLibrary___block_invoke;
  block[3] = &unk_1E3677530;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(v7, block);

}

- (void)rebuildAllMissingThumbnailsInLibrary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = PLIsAssetsd();
  v6 = (void *)MEMORY[0x19AEC1554](v5);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLThumbnailManager rebuildAllMissingThumbnailsInLibrary:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLThumbnailManager _rebuildThumbnailsQueue](self, "_rebuildThumbnailsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLThumbnailManager_rebuildAllMissingThumbnailsInLibrary___block_invoke;
  block[3] = &unk_1E3677530;
  block[4] = self;
  v9 = v4;
  v12 = v9;
  v13 = v7;
  v10 = v7;
  dispatch_async(v8, block);

  objc_autoreleasePoolPop(v6);
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (BOOL)hasExceededRebuildThumbnailRequestLimit
{
  return !-[PLThumbnailManager hasRebuildThumbnailsRequest](self, "hasRebuildThumbnailsRequest")
      && self->_hasExceededThumbnailRebuildRequestLimit;
}

- (void)handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  PLIsAssetsd();
  -[PLThumbnailManager _recordRebuildThumbnailsAttempt](self, "_recordRebuildThumbnailsAttempt");
  -[PLThumbnailManager removeRebuildThumbnailsRequest:](self, "removeRebuildThumbnailsRequest:", "-[PLThumbnailManager handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:]");
  PLThumbnailsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Rebuilding thumbs has failed too many time, possible an asset is crashing assetsd when we attempt to generate thumbs.  Trigger rebuilding the database by marking the database as corrupt via sqlite error file.", v7, 2u);
  }

  objc_msgSend(v4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSqliteErrorForRebuildReason:allowsExit:", 9, 1);
}

- (CGImage)newImageForAsset:(id)a3 format:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CGImage *v9;

  v6 = a3;
  -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", -[PLThumbnailManager _supportedThumbnailFormatIDFromGeneralFormatID:](self, "_supportedThumbnailFormatIDFromGeneralFormatID:", objc_msgSend(a4, "formatID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "usesThumbIdentifiers"))
  {
    objc_msgSend(v6, "thumbnailIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (CGImage *)objc_msgSend(v7, "createImageWithIdentifier:orIndex:", v8, objc_msgSend(v6, "effectiveThumbnailIndex"));

  return v9;
}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)objc_msgSend(v12, "intValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v5, "setObject:forKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)objc_msgSend(v14, "intValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:withToken:", v6, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (id)newSlowPersistenceManagers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "intValue");
        objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isTable") & 1) == 0)
        {
          -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  PLThumbnailsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "#### slowThumbPersistenceManagers %@", buf, 0xCu);
  }

  return v3;
}

- (void)discardCachedThumbnailDownscalerContexts
{
  -[PLThumbnailCascadingDownscaleContext discardContexts](self->_downscaleContext, "discardContexts");
}

- (BOOL)_performUncompressedTableDownscaleIntoDatas:(id)a3 image:(id)a4 assetUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_class();
  -[PLThumbnailManagerCore pathManager](self, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uncompressedImageTableSpecificationsWithPathManager:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v9, "ioSurface");
  PLThumbnailsGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Unable to extract io surface for HW downscale for asset %@", buf, 0xCu);
    }
    v18 = v8;
LABEL_13:

    PLThumbnailsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Attempting SW downscale to generate table thumbs for asset %@", buf, 0xCu);
    }

    v22 = objc_msgSend(v9, "CGImage");
    if (v22)
    {
      v23 = v22;
      v15 = 0;
    }
    else
    {
      objc_msgSend(v9, "data");
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_26;
      PLThumbnailsGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Decoding PLImageContainer data to image in order to attempt SW downscale to generate table thumbs for asset %@", buf, 0xCu);
      }

      objc_msgSend(v9, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = DCIM_newPLImageWithData();

      if (!v15 || (v23 = DCIM_CGImageRefFromPLImage()) == 0)
      {
LABEL_26:
        PLThumbnailsGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "SW downscale failed for asset %@, unable to resolve a source image.", buf, 0xCu);
        }
        v20 = 0;
        v25 = v18;
        goto LABEL_32;
      }
    }
    v31 = v18;
    v24 = +[PLThumbnailUtilities performSWCascadingDownscaleTo5551OnImage:withSpecifications:destinationData:](PLThumbnailUtilities, "performSWCascadingDownscaleTo5551OnImage:withSpecifications:destinationData:", v23, v13, &v31);
    v25 = v31;

    PLThumbnailsGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "SW downscale succeeded for asset %@", buf, 0xCu);
      }
      v20 = 1;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "SW downscale failed for asset %@", buf, 0xCu);
      }
      v20 = 0;
    }
LABEL_32:

    v18 = v25;
    goto LABEL_33;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Attempting HW downscale to generate table thumbs for asset %@", buf, 0xCu);
  }

  v32 = v8;
  v17 = +[PLThumbnailUtilities performHWCascadingDownscaleTo5551OnIOSurface:withSpecifications:destinationData:usingContext:](PLThumbnailUtilities, "performHWCascadingDownscaleTo5551OnIOSurface:withSpecifications:destinationData:usingContext:", v14, v13, &v32, self->_downscaleContext);
  v18 = v32;

  PLThumbnailsGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (!v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "HW downscale failed for asset %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "HW downscale succeeded for asset %@", buf, 0xCu);
  }
  v20 = 1;
LABEL_33:

  return v20;
}

- (BOOL)_downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6
{
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFData *v53;
  CGImageSourceRef v54;
  void *v55;
  id v56;
  NSObject *v57;
  const char *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  BOOL v64;
  PLThumbnailManager *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  uint64_t *v80;
  unint64_t v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  uint8_t v96[128];
  uint8_t buf[4];
  uint64_t v98;
  __int16 v99;
  id v100;
  __int16 v101;
  id v102;
  __int16 v103;
  int v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v9 = a5;
  v72 = a6;
  v70 = v9;
  objc_msgSend(v9, "pixelSize");
  v11 = v10;
  v13 = v12;
  v66 = self;
  -[PLThumbnailManagerCore fastThumbPersistenceManagers](self, "fastThumbPersistenceManagers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 1;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v89 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v20, "format");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "thumbnailKind") == 1;

        if (v22)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v20, "entryLength"));
          objc_msgSend(v15, "addObject:", v23);

        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v16, "count"))
  {
    if (objc_msgSend(v15, "count"))
    {
      v24 = -[PLThumbnailManager _performUncompressedTableDownscaleIntoDatas:image:assetUUID:](v66, "_performUncompressedTableDownscaleIntoDatas:image:assetUUID:", v15, v70, v72);
      *((_BYTE *)v93 + 24) = v24;
      if (v24)
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v25 = v16;
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v84, v105, 16);
        if (v26)
        {
          v27 = 0;
          v67 = *(_QWORD *)v85;
          while (2)
          {
            v68 = v26;
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v85 != v67)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
              objc_msgSend(v29, "format");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "thumbnailKind") == 1;

              if (v31)
              {
                objc_msgSend(v15, "objectAtIndex:", v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v29, "formatSideLen");
                objc_msgSend(MEMORY[0x1E0D73160], "centeredRectForSourceSize:destinationSize:", v11, v13, (double)v33, (double)v33);
                v35 = v34;
                v37 = v36;
                v38 = PLUUIDBytesFromString();
                v40 = v39;
                v41 = objc_retainAutorelease(v32);
                v42 = objc_msgSend(v41, "mutableBytes");
                v43 = objc_msgSend(v41, "length") + v42;
                *(_QWORD *)(v43 - 28) = v38;
                *(_QWORD *)(v43 - 20) = v40;
                *(_DWORD *)(v43 - 12) = v35;
                *(_QWORD *)(v43 - 8) = v37;
                v44 = objc_msgSend(v29, "writeEntryData:toIndex:", v41, a4);
                *((_BYTE *)v93 + 24) = v44;
                if (!v44)
                {
                  PLThumbnailsGetLog();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  {
                    v46 = objc_msgSend(v41, "length");
                    v47 = objc_msgSend(v29, "formatSideLen");
                    *(_DWORD *)buf = 134218754;
                    v98 = v46;
                    v99 = 2048;
                    v100 = (id)MEMORY[0x1E0C83948];
                    v101 = 2114;
                    v102 = v72;
                    v103 = 1024;
                    v104 = v47;
                    _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "Failed to write table entry data (len: %lu), to index: %lu for asset uuid %{public}@ in format with side len: %d", buf, 0x26u);
                  }

                  goto LABEL_29;
                }

                ++v27;
              }
            }
            v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v84, v105, 16);
            if (v26)
              continue;
            break;
          }
        }
      }
      else
      {
        PLThumbnailsGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v98 = (uint64_t)v72;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to downscale thumbnail image container into table datas for asset uuid: %{public}@", buf, 0xCu);
        }
      }
LABEL_29:

    }
    v48 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](v66, "pathManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "_pl_filter:", &__block_literal_global_121);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v51, "count"))
      goto LABEL_49;
    objc_msgSend(v70, "data");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v70, "data");
      v53 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v54 = CGImageSourceCreateWithData(v53, 0);

      if (v54)
      {
        v83 = 0;
        +[PLTableThumbnailEncoder encodeThumbnailSource:toFormats:withUUID:error:](PLTableThumbnailEncoder, "encodeThumbnailSource:toFormats:withUUID:error:", v54, v51, v72, &v83);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v83;
        CFRelease(v54);
        if (!v55)
        {
          PLThumbnailsGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v98 = (uint64_t)v72;
            v99 = 2112;
            v100 = v56;
            v58 = "Failed to encode thumbnail image data source into compressed tables for asset uuid: %{public}@, error: %@";
LABEL_40:
            _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
      }
      else
      {
        v55 = 0;
        v56 = 0;
      }
    }
    else
    {
      if (!objc_msgSend(v70, "CGImage"))
      {
        PLThumbnailsGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v98 = (uint64_t)v72;
          _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Failed to downscale thumbnail image container into compressed table datas for asset uuid: %{public}@, image container missing data or imageRef", buf, 0xCu);
        }
        v56 = 0;
        goto LABEL_45;
      }
      v82 = 0;
      +[PLTableThumbnailEncoder encodeThumbnailImage:toFormats:withUUID:error:](PLTableThumbnailEncoder, "encodeThumbnailImage:toFormats:withUUID:error:", objc_msgSend(v70, "CGImage"), v51, v72, &v82);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v82;
      if (!v55)
      {
        PLThumbnailsGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v98 = (uint64_t)v72;
          v99 = 2112;
          v100 = v56;
          v58 = "Failed to encode thumbnail image into compressed table datas for asset uuid: %{public}@, error: %@";
          goto LABEL_40;
        }
LABEL_45:

        v55 = 0;
        *((_BYTE *)v93 + 24) = 0;
      }
    }
    if (*((_BYTE *)v93 + 24))
    {
      objc_msgSend(v16, "_pl_filter:", &__block_literal_global_125);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_2;
      v77[3] = &unk_1E36627E0;
      v78 = v55;
      v81 = a4;
      v79 = v72;
      v80 = &v92;
      objc_msgSend(v59, "enumerateObjectsUsingBlock:", v77);

    }
LABEL_49:

  }
  if (*((_BYTE *)v93 + 24))
  {
    -[PLLazyObject objectValue](v66->_slowPersistenceManagers, "objectValue");
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v74;
      while (2)
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v74 != v62)
            objc_enumerationMutation(v60);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "setImageForEntry:withIdentifier:orIndex:photoUUID:options:", v70, v69, a4, v72, 0) & 1) == 0)
          {
            *((_BYTE *)v93 + 24) = 0;
            goto LABEL_61;
          }
        }
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
        if (v61)
          continue;
        break;
      }
    }
LABEL_61:

    v64 = *((_BYTE *)v93 + 24) != 0;
  }
  else
  {
    v64 = 0;
  }

  _Block_object_dispose(&v92, 8);
  return v64;
}

- (void)setThumbnailsForAsset:(id)a3 withImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "effectiveThumbnailIndex");
  objc_msgSend(v6, "thumbnailIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "kind");
  objc_msgSend(v6, "pathForOriginalFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLThumbnailManager setThumbnailsForThumbIdentifier:thumbnailIndex:assetUUID:kind:extension:withImage:](self, "setThumbnailsForThumbIdentifier:thumbnailIndex:assetUUID:kind:extension:withImage:", v9, v8, v10, v11, v14, v7);

  PLThumbnailsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v17;
    v27 = 1024;
    v28 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Wrote thumbnails for asset %@ with success: %d", (uint8_t *)&v25, 0x12u);

  }
  v18 = v8 == 0x7FFFFFFFFFFFFFFFLL || v15;
  if ((v18 & 1) == 0)
  {
    PLThumbnailsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Removing existing thumbnailIndex for asset uuid: %{public}@...", (uint8_t *)&v25, 0xCu);

    }
    objc_msgSend(v6, "thumbnailIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThumbnailManager deleteThumbnailsWithIdentifier:orIndex:uuid:](self, "deleteThumbnailsWithIdentifier:orIndex:uuid:", v21, v8, v22);

    objc_msgSend(v6, "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v8);
    objc_msgSend(v6, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLThumbnailIndexes recycleThumbnailIndexes:inLibrary:](PLThumbnailIndexes, "recycleThumbnailIndexes:inLibrary:", v23, v24);

  }
}

- (BOOL)setThumbnailsForThumbIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 assetUUID:(id)a5 kind:(signed __int16)a6 extension:(id)a7 withImage:(id)a8
{
  unsigned int v10;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  CGImage *v36;
  CGImage *v37;
  double width;
  double height;
  void *v40;
  void *v41;
  void *v42;
  const __CFAttributedString *v43;
  const __CTLine *v44;
  const __CTLine *v45;
  double v46;
  double v47;
  NSObject *v48;
  BOOL v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  CGColorSpace *DeviceRGB;
  CGContext *v55;
  CGColor *v56;
  CGImage *Image;
  PLImageContainer *v58;
  NSObject *v59;
  void *v61;
  void *v62;
  PLThumbnailManager *v63;
  NSObject *v64;
  unint64_t v65;
  id v66;
  _BYTE buf[12];
  __int16 v68;
  id v69;
  uint64_t v70;
  CGRect BoundsWithOptions;
  CGRect v72;
  CGRect v73;

  v10 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbnailManager.m"), 1326, CFSTR("Can only set thumbnails from assetsd"));

  }
  objc_msgSend(v18, "pixelSize");
  if (v20 <= 0.0 || v19 <= 0.0)
  {
    if (v10 < 2)
    {
      v21 = 0;
      goto LABEL_36;
    }
    v65 = a4;
    PLThumbnailsGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Writing generic thumbnails for non image/video asset uuid: %{public}@...", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "masterThumbnailFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "formatID");

    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v25);
    v64 = objc_claimAutoreleasedReturnValue();
    -[NSObject size](v64, "size");
    v27 = v26;
    v29 = v28;
    v66 = 0;
    *(_QWORD *)buf = 0;
    PLGenericImageNameForExtension(v17, (const __CFString **)buf, &v66);
    v30 = *(id *)buf;
    v31 = v66;
    v32 = v30;
    PLPhotoLibraryServicesFrameworkBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pathForResource:ofType:", v32, CFSTR("png"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v32;

    DCIM_newPLImageWithContentsOfFile();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (CGImage *)DCIM_CGImageRefFromPLImage();
    v37 = CGImageRetain(v36);

    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (v31)
    {
      PLPhysicalScreenScale();
      DCIM_boldSystemFontOfSize();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_blackColor();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_labelAttributesWithFontAndColor();
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v31, v42);
      v44 = CTLineCreateWithAttributedString(v43);
      v45 = v44;
      if (v44)
      {
        BoundsWithOptions = CTLineGetBoundsWithOptions(v44, 0x10uLL);
        width = BoundsWithOptions.size.width;
        height = BoundsWithOptions.size.height;
      }

      if (v37)
        goto LABEL_14;
    }
    else
    {
      v45 = 0;
      if (v37)
      {
LABEL_14:
        v46 = (double)CGImageGetWidth(v37);
        v47 = (double)CGImageGetHeight(v37);
LABEL_21:
        v63 = self;
        v49 = v46 <= v27 && v47 <= v29;
        v50 = v31;
        if (!v49)
        {
          PLSizeFromCGSize();
          PLSizeFromCGSize();
          PLCGSizeScaledToFitSize();
          v46 = v51;
          v47 = v52;
        }
        v53 = (v29 - (height + v47)) * 0.5;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v55 = CGBitmapContextCreate(0, (unint64_t)v27, (unint64_t)v29, 8uLL, 0, DeviceRGB, 5u);
        v56 = CGColorCreate(DeviceRGB, kGenericImageBackgroundColor);
        CGContextSetFillColorWithColor(v55, v56);
        CGColorRelease(v56);
        CGColorSpaceRelease(DeviceRGB);
        v72.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
        v72.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
        v72.size.width = v27;
        v72.size.height = v29;
        CGContextFillRect(v55, v72);
        if (v37)
        {
          CGContextSetBlendMode(v55, kCGBlendModeMultiply);
          CGContextSetAlpha(v55, 0.25);
          v73.origin.x = round((v27 - v46) * 0.5);
          v73.origin.y = height + v53;
          v73.size.width = v46;
          v73.size.height = v47;
          CGContextDrawImage(v55, v73, v37);
          CGImageRelease(v37);
        }
        if (v45)
        {
          CGContextSetTextPosition(v55, round((v27 - width) * 0.5), v53);
          CTLineDraw(v45, v55);
          CFRelease(v45);
        }
        Image = CGBitmapContextCreateImage(v55);
        CGContextRelease(v55);

        v58 = -[PLImageContainer initWithCGImage:]([PLImageContainer alloc], "initWithCGImage:", Image);
        CGImageRelease(Image);
        v21 = -[PLThumbnailManager _downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:](v63, "_downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:", v15, v65, v58, v16);
        if ((v21 & 1) == 0)
        {
          PLThumbnailsGetLog();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_ERROR, "Error writing generic thumbnails for asset uuid: %{public}@.", buf, 0xCu);
          }

        }
        v48 = v64;
        goto LABEL_35;
      }
    }
    v46 = *MEMORY[0x1E0C9D820];
    v47 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_21;
  }
  if (!-[PLThumbnailManager _downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:](self, "_downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:", v15, a4, v18, v16))
  {
    PLThumbnailsGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      v68 = 2114;
      v69 = v18;
      _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Error writing thumbnails for asset uuid: %{public}@ from image container: %{public}@.", buf, 0x16u);
    }
    v21 = 0;
LABEL_35:

    goto LABEL_36;
  }
  v21 = 1;
LABEL_36:

  return v21;
}

- (void)deleteThumbnailsWithIdentifier:(id)a3 orIndex:(unint64_t)a4 uuid:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "intValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "deleteEntryWithIdentifier:orIndex:uuid:", v8, a4, v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v16, "deleteEntryWithIdentifier:", v8);
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)preheatThumbnailDataWithFormat:(unsigned __int16)a3 thumbnailIndexes:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", -[PLThumbnailManager _supportedThumbnailFormatIDFromGeneralFormatID:](self, "_supportedThumbnailFormatIDFromGeneralFormatID:", v4));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preheatDataForThumbnailIndexes:", v6);

}

- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10
{
  double height;
  double width;
  uint64_t v17;
  void *v18;
  void *v19;

  height = a4.height;
  width = a4.width;
  v17 = a3;
  +[PLPlaceholderThumbnailManager sharedManager](PLPlaceholderThumbnailManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v17, a5, a6, a7, a8, a9, width, height, a10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_tableDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "intValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v3, "appendString:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (int64_t)_diskFootprintOfTableThumbnailTables
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLThumbnailManagerCore pathManager](self, "pathManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue");
        objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isTable"))
        {
          -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 += objc_msgSend(v12, "fileLength");

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)indexStatisticsForLibrary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLThumbnailIndexes occupiedThumbnailIndexesWithLibrary:fetchTimestampToUpdate:](PLThumbnailIndexes, "occupiedThumbnailIndexesWithLibrary:fetchTimestampToUpdate:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeCount");
  v7 = objc_msgSend(v5, "count");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFetchRequest fetchRequestWithEntityName:](PLFetchRequest, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  v37[0] = CFSTR("objectID");
  v37[1] = CFSTR("dateCreated");
  v37[2] = CFSTR("thumbnailIndex");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("thumbnailIndex"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v13);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke;
  v28[3] = &unk_1E3676EA0;
  v14 = v4;
  v29 = v14;
  v15 = v9;
  v30 = v15;
  v31 = &v32;
  objc_msgSend(v14, "performBlockAndWait:", v28);
  v16 = objc_msgSend(v5, "count");
  v17 = v33[3];
  v18 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v20 = (float)v6 / (float)v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("fragmentation"));

  *(float *)&v22 = (float)((float)v16 - (float)v17) / (float)v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("orderedness"));

  -[PLThumbnailManagerCore fastThumbPersistenceManagers](self, "fastThumbPersistenceManagers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "fileStatistics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addEntriesFromDictionary:", v26);

  }
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (id)thumbnailJPEGPathForPhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "masterThumbnailFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "formatID");

  -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "usesThumbIdentifiers"))
  {
    objc_msgSend(v4, "thumbnailIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thumbnailPathForThumbIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_thumbnailLoadingAssetIsHiddenOrTrashed:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "isTrashed");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)observerToken
{
  return self->_observerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_slowPersistenceManagers, 0);
  objc_destroyWeak((id *)&self->_migrationStore);
  objc_storeStrong((id *)&self->_downscaleContext, 0);
  objc_storeStrong((id *)&self->_fixLock, 0);
  objc_storeStrong((id *)&self->_alreadyFailedAssetObjectIDsForRebuild, 0);
  objc_storeStrong((id *)&self->_requestedThumbnailFixAssets, 0);
  objc_storeStrong((id *)&self->_previouslyRequestedThumbnailFixOIDs, 0);
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_2;
  v2[3] = &unk_1E3677C18;
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  objc_msgSend((id)v1.i64[0], "performBlock:", v2);

}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "unlock");
  v2 = objc_msgSend(v15, "count");
  v3 = v15;
  if (v2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = v5;
      v7 = v5 - v4;
      if (v7 < 0x14)
      {
        v11 = v15;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "assetsdClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "libraryClient");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "subarrayWithRange:", v4, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateThumbnailsForPhotos:assignNewIndex:forceRefresh:completionHandler:", v10, 1, 0, &__block_literal_global_165);

        v11 = v15;
        v4 = v6;
      }
      v5 = v6 + 1;
    }
    while (v6 + 1 < objc_msgSend(v11, "count"));
    v3 = v15;
    if (v6 >= v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "assetsdClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "libraryClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subarrayWithRange:", v4, v5 - v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateThumbnailsForPhotos:assignNewIndex:forceRefresh:completionHandler:", v14, 1, 0, &__block_literal_global_167);

      v3 = v15;
    }
  }

}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_166(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Failed to update thumbnails for photos, error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Failed to update thumbnails for photos, error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[6];
  _QWORD v7[3];
  int v8;
  uint64_t v9;

  v9 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke_2;
  v6[3] = &unk_1E3662808;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = v7;
  v6[5] = v4;
  v5 = (id)objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", v3, &v9, 10000, v6);

  _Block_object_dispose(v7, 8);
}

void __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("thumbnailIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (a3 && v6 < *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
}

void __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_3;
  v19[3] = &unk_1E3671CE0;
  v9 = v7;
  v20 = v9;
  objc_msgSend(v8, "_pl_filter:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "entryDataForEntryLength:", objc_msgSend(v6, "entryLength"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "writeEntryData:toIndex:", v12, a1[7]) & 1) == 0)
    {
      PLThumbnailsGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(v12, "length");
        v15 = a1[5];
        v16 = objc_msgSend(v9, "formatID");
        *(_DWORD *)buf = 134218498;
        v22 = v14;
        v23 = 2114;
        v24 = v15;
        v25 = 2048;
        v26 = v16;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to write compressed thumbnail image of len: %ld, for asset uuid: %{public}@, to table format: %ld", buf, 0x20u);
      }

      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }

  }
  else
  {
    PLThumbnailsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = a1[5];
      *(_DWORD *)buf = 138543618;
      v22 = (uint64_t)v6;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Can't match a PLPositionalImageTable: %{public}@ to a PLTableThumbnailEncoderResult for asset uuid: %{public}@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

uint64_t __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "imageFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToFormat:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_123(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "thumbnailKind") == 4)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "thumbnailKind") == 3;

  }
  return v4;
}

BOOL __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "thumbnailKind") == 4 || objc_msgSend(v2, "thumbnailKind") == 3;

  return v3;
}

uint64_t __59__PLThumbnailManager_rebuildAllMissingThumbnailsInLibrary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned int v3;
  __int128 v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  __int128 v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[PLModelMigrator waitForDataMigratorToExit](PLModelMigrator, "waitForDataMigratorToExit");
  PLThumbnailsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Starting rebuild all missing thumbnails", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
  v3 = 10;
  *(_QWORD *)&v4 = 67109634;
  v19 = v4;
  while (1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 10;
    do
    {
      v8 = v6;
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v20 = v5;
      v11 = objc_msgSend(v9, "_rebuildAssetThumbnailsWithLimit:library:error:", 23, v10, &v20, v19);
      v12 = v20;

      v13 = v8 + v11;
      if (v11 >= 0)
        v6 = v8 + v11;
      else
        v6 = v8;
      v7 += v11 >> 63;
      if (v11)
        v14 = v7 == 0;
      else
        v14 = 1;
      v5 = v12;
    }
    while (!v14);
    if ((v11 & 0x8000000000000000) == 0)
      break;
    PLThumbnailsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v19;
      v22 = v8;
      v23 = 1024;
      v24 = v3;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to complete thumbnail rebuild (%d rebuilt, %d tries left) %@", buf, 0x18u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
    if (v3 < 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_discardAlreadyFailedAssetObjectIDsForRebuild");
      goto LABEL_25;
    }
    if (v3 <= 8)
      v16 = 42;
    else
      v16 = 2;
    sleep(v16);

    --v3;
  }
  PLThumbnailsGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v13;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Rebuilt %d thumbnails", buf, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
LABEL_25:

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_recordRebuildThumbnailsAttempt");
  objc_msgSend(*(id *)(a1 + 32), "removeRebuildThumbnailsRequest:", "-[PLThumbnailManager rebuildAllMissingThumbnailsInLibrary:]_block_invoke");
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  return objc_msgSend(*(id *)(a1 + 48), "stillAlive");
}

void __61__PLThumbnailManager_continueRebuildingTableThumbsInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PLTableThumbnailMigrator *v10;

  +[PLModelMigrator waitForDataMigratorToExit](PLModelMigrator, "waitForDataMigratorToExit");
  v10 = objc_alloc_init(PLTableThumbnailMigrator);
  v2 = (void *)MEMORY[0x1E0D732F8];
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableThumbnailFormatsForConfigPhase:withPathManager:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLTableThumbnailMigrator migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:](v10, "migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:", *(_QWORD *)(a1 + 40), v4, 0);
  if (!+[PLTableThumbnailMigrator countOfAssetsPendingTableThumbRebuildInLibrary:](PLTableThumbnailMigrator, "countOfAssetsPendingTableThumbRebuildInLibrary:", *(_QWORD *)(a1 + 40)))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailConfigurationDictWithPathManager:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "markThumbnailConfigurationTableOnlyRebuildFinishedForThumbnailConfigDict:", v7);
    v8 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stampThumbnailConfiguration:toFile:withPathManager:", v7, 1, v9);

  }
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __45__PLThumbnailManager__rebuildThumbnailsQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.assetsd.RebuildThumbnailQueue", attr);
  v2 = (void *)_rebuildThumbnailsQueue_rebuildThumbsQueue;
  _rebuildThumbnailsQueue_rebuildThumbsQueue = (uint64_t)v1;

}

void __52__PLThumbnailManager_hasMissingThumbnailsInLibrary___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &v7);
  v5 = v7;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLThumbnailsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to get missing thumbnail count: %@", buf, 0xCu);
    }

  }
}

void __69__PLThumbnailManager__rebuildAssetThumbnailsWithLimit_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  void *v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v30, "setFetchLimit:", *(int *)(a1 + 72));
  objc_msgSend((id)objc_opt_class(), "entityInManagedObjectContext:", v29);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEntity:", v2);

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count");
  v4 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v4[12], "lock");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (self IN %@)"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(*(id *)(a1 + 40), "_missingThumbnailPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v7;
    v40[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "unlock");
  }
  else
  {
    objc_msgSend(v4, "_missingThumbnailPredicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v30, "setPredicate:", v28);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSortDescriptors:", v9);

  v35 = 0;
  objc_msgSend(v29, "executeFetchRequest:error:", v30, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v26 = v35;
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "count");
    PLThumbnailsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Rebuilding thumbs for batch of %d assets", buf, 8u);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          PLThumbnailsGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v18, "uuid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = v20;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Rebuilding thumbs for asset uuid: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v18, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
          if ((objc_msgSend(v18, "hasAllThumbs") & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "lock");
            v21 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
            if (!v21)
            {
              v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v23 = *(_QWORD *)(a1 + 40);
              v24 = *(void **)(v23 + 88);
              *(_QWORD *)(v23 + 88) = v22;

              v21 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
            }
            objc_msgSend(v18, "objectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v25);

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "unlock");
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v15);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v11);
  }

}

void __48__PLThumbnailManager__missingThumbnailPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %d || %K == %d) && %K != %d && %K != %d"), CFSTR("thumbnailIndex"), 0xFFFFFFFFLL, CFSTR("thumbnailIndex"), 4294967293, CFSTR("complete"), 0, CFSTR("cloudPlaceholderKind"), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_missingThumbnailPredicate_pl_once_object_37;
  _missingThumbnailPredicate_pl_once_object_37 = v0;

}

void __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a4, "photoDirectoryWithType:", 12);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_3;
  v3[3] = &unk_1E36626E8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0D73208], "calculateTotalSizeOfFilesAtPath:calculatePurgeable:allocatedSize:result:", a2, 0, 1, v3);
}

uint64_t __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __75__PLThumbnailManager__removeMasterThumbDirectoriesWithFileManagerDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a4, "photoDirectoryWithType:", 12);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

}

void __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[9], "removeAllObjects");
    WeakRetained = v2;
  }

}

id __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSlowPersistenceManagers");
  else
    v3 = 0;

  return v3;
}

void __53__PLThumbnailManager__contextForConfigurationChanges__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "pathManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

}

+ (id)thumbnailIdentifierWithAssetUUID:(id)a3 directory:(id)a4 filename:(id)a5 bundleScope:(unsigned __int16)a6 pathManager:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(a7, "shouldUseFileIdentifierForBundleScope:", v8))
  {
    objc_msgSend(MEMORY[0x1E0D732F0], "thumbnailIdentifierURLComponentsForUBFWithAssetUUID:bundleScope:", v11, v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v14, "setScheme:", *MEMORY[0x1E0D74890]);
    if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPath:", v15);

    }
  }
  objc_msgSend(v14, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(v14, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
