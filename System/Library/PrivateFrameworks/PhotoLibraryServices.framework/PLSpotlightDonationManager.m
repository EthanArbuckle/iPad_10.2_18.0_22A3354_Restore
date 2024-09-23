@implementation PLSpotlightDonationManager

- (PLSpotlightDonationManager)initWithPhotoLibrary:(id)a3
{
  id v6;
  PLSpotlightDonationManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  CSSearchableIndex *spotlightIndex;
  NSObject *v18;
  CSSearchableIndex *v19;
  uint64_t v20;
  CSManagedSearchableIndex *managedSpotlightIndex;
  void *v22;
  _BOOL8 v23;
  CSManagedSearchableIndex *v24;
  CSManagedSearchableIndex *v25;
  NSObject *p_super;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  BOOL v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  CSSearchableIndex *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationManager.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v37.receiver = self;
  v37.super_class = (Class)PLSpotlightDonationManager;
  v7 = -[PLSpotlightDonationManager init](&v37, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier");

    +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v11;

    -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v7->_spotlightSandboxExtensionHandle = -1;
    if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", v9))
    {
      objc_msgSend(v6, "pathManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "spotlightSearchIndexPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v16 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v36);
      spotlightIndex = (CSSearchableIndex *)v36;

      if ((v16 & 1) != 0)
      {
        -[PLSpotlightDonationManager _acquireSpotlightSandboxExtensionIfNeeded](v7, "_acquireSpotlightSandboxExtensionIfNeeded");
        PLSearchBackendDonationsGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[PLSpotlightDonationManager photoLibraryTypeDescription](v7, "photoLibraryTypeDescription");
          v19 = (CSSearchableIndex *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v14;
          v40 = 2114;
          v41 = v19;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Opening Spotlight index at path: %@ for %{public}@", buf, 0x16u);

        }
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AF8]), "initWithPath:", v14);
        managedSpotlightIndex = v7->_managedSpotlightIndex;
        v7->_managedSpotlightIndex = (CSManagedSearchableIndex *)v20;

        -[PLPhotoLibrary libraryServicesManager](v7->_photoLibrary, "libraryServicesManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "wellKnownPhotoLibraryIdentifier") == 1;

        v24 = v7->_managedSpotlightIndex;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __51__PLSpotlightDonationManager_initWithPhotoLibrary___block_invoke;
        v34[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
        v35 = v23;
        -[CSManagedSearchableIndex setUISearchEnabled:completionHandler:](v24, "setUISearchEnabled:completionHandler:", v23, v34);
        v25 = v7->_managedSpotlightIndex;
        p_super = &v7->_spotlightIndex->super;
        v7->_spotlightIndex = (CSSearchableIndex *)v25;
      }
      else
      {
        PLSearchBackendDonationsGetLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          -[PLSpotlightDonationManager photoLibraryTypeDescription](v7, "photoLibraryTypeDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v28;
          v40 = 2112;
          v41 = spotlightIndex;
          _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_ERROR, "Failed to create Spotlight index directory for %{public}@, error: %@", buf, 0x16u);

        }
      }

      if (!v7->_spotlightIndex)
      {
        PLSearchBackendIndexingEngineGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_FAULT, "Unable to create managed spotlight index", buf, 2u);
        }

      }
    }
    else
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B38]), "initWithName:", v10);
      spotlightIndex = v7->_spotlightIndex;
      v7->_spotlightIndex = (CSSearchableIndex *)v27;
    }

    if (!v7->_spotlightIndex)
    {
      PLSearchBackendDonationsGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[PLSpotlightDonationManager photoLibraryTypeDescription](v7, "photoLibraryTypeDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v31;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Failed to open Spotlight index for %{public}@.", buf, 0xCu);

      }
    }

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PLSpotlightDonationManager _releaseSpotlightSandboxExtension](self, "_releaseSpotlightSandboxExtension");
  v3.receiver = self;
  v3.super_class = (Class)PLSpotlightDonationManager;
  -[PLSpotlightDonationManager dealloc](&v3, sel_dealloc);
}

- (void)disableUISearch
{
  -[CSManagedSearchableIndex setUISearchEnabled:completionHandler:](self->_managedSpotlightIndex, "setUISearchEnabled:completionHandler:", 0, &__block_literal_global_52515);
}

- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  int v17;
  int v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_spotlightSandboxExtensionHandle == -1)
  {
    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "spotlightSearchIndexPath");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "fileSystemRepresentation");

    v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = sandbox_extension_consume();
      self->_spotlightSandboxExtensionHandle = v8;
      PLSearchBackendDonationsGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v17 = *__error();
          v19 = 67109378;
          v20 = v17;
          v21 = 2080;
          v22 = v5;
          v11 = "Failed to consume sandbox extension token, errno: %{darwin.errno}d, path: %s";
          v12 = v10;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v11 = "Acquired sandbox extension";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEBUG;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v19, v14);
      }

      free(v7);
      return self->_spotlightSandboxExtensionHandle != -1;
    }
    PLSearchBackendDonationsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *__error();
      v19 = 67109378;
      v20 = v16;
      v21 = 2080;
      v22 = v5;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token, errno: %{darwin.errno}d, path: %s", (uint8_t *)&v19, 0x12u);
    }

  }
  return self->_spotlightSandboxExtensionHandle != -1;
}

- (void)_releaseSpotlightSandboxExtension
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_spotlightSandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_spotlightSandboxExtensionHandle = -1;
    PLSearchBackendDonationsGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Released sandbox extension", v4, 2u);
    }

  }
}

- (void)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  PLSpotlightDonationOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "_pl_map:", &__block_literal_global_43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "length");
    PLSearchBackendDonationsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v6, "count");
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134349826;
        v19 = v12;
        v20 = 2114;
        v21 = v7;
        v22 = 2114;
        v23 = v8;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Creating operation to donate %{public}lu items to Spotlight, bundleIdentifier: %{public}@, items: %{public}@ for %{public}@", (uint8_t *)&v18, 0x2Au);

      }
      v14 = [PLSpotlightDonationOperation alloc];
      -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PLSpotlightDonationOperation initWithPhotoLibrary:spotlightSearchableIndex:searchableItems:bundleIdentifier:](v14, "initWithPhotoLibrary:spotlightSearchableIndex:searchableItems:bundleIdentifier:", v15, v16, v6, v7);

      -[NSObject setSignpostDelegate:](v11, "setSignpostDelegate:", self);
      -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addOperation:", v11);
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = (uint64_t)v8;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Missing bundleIdentifier for searchable items donation: %{public}@ for %{public}@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  PLSpotlightDeletionOperation *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wellKnownPhotoLibraryIdentifier");

    PLSearchBackendDonationsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v4, "count");
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134349314;
        v16 = v10;
        v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Creating operation to delete %{public}lu items from Spotlight for %{public}@.", (uint8_t *)&v15, 0x16u);

      }
      v12 = [PLSpotlightDeletionOperation alloc];
      -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PLSpotlightDeletionOperation initWithPhotoLibrary:spotlightSearchableIndex:searchableItemIdentifiers:](v12, "initWithPhotoLibrary:spotlightSearchableIndex:searchableItemIdentifiers:", v5, v13, v4);

      -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addOperation:", v9);
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = (uint64_t)v4;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unsupported PhotoLibrary. Ignoring request to delete items: %{public}@ for %{public}@", (uint8_t *)&v15, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)deleteAllSearchableItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchBackendDonationsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = (uint64_t)v5;
    v31 = 2112;
    v32 = v7;
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems [Begin]. PhotoLibrary: %@, CSSearchableIndex: %@ for %{public}@", buf, 0x20u);

  }
  objc_msgSend(v5, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wellKnownPhotoLibraryIdentifier");

  PLSearchBackendDonationsGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "operationCount");
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v30 = v14;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems. Cancelling all (%ld) in flight Spotlight operations for %{public}@.", buf, 0x16u);

    }
    -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelAllOperations");

    PLSearchBackendDonationsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = (uint64_t)v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems. Deleting Spotlight donation progress plist in preparation for deletion of all searchable items from Core Spotlight for %{public}@.", buf, 0xCu);

    }
    objc_msgSend(v5, "pathManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightProgressManager setSpotlightIndexNeedsReindexing:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "setSpotlightIndexNeedsReindexing:forPhotoLibraryPathManager:", 0, v19);

    objc_msgSend(v5, "libraryServicesManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v20, "wellKnownPhotoLibraryIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();

    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__PLSpotlightDonationManager_deleteAllSearchableItemsWithCompletion___block_invoke;
    v25[3] = &unk_1E36778D0;
    v25[4] = self;
    v26 = v5;
    v27 = v4;
    objc_msgSend(v22, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:", v23, 0, v21, 0, v25);

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = (uint64_t)v24;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "Unsupported %{public}@. Ignoring request to delete all items.", buf, 0xCu);

  }
}

- (void)setSpotlightOperationQueueSuspended:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSuspended");

  PLSearchBackendDonationsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v8 = CFSTR("paused");
    else
      v8 = CFSTR("unpaused");
    if (v6)
      v9 = CFSTR("paused");
    else
      v9 = CFSTR("unpaused");
    -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Setting donation operation queue to [%{public}@] from [%{public}@] for %{public}@", (uint8_t *)&v12, 0x20u);

  }
  -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuspended:", v3);

}

- (unint64_t)pendingOperationCount
{
  void *v2;
  unint64_t v3;

  -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationCount");

  return v3;
}

- (void)addOperationCountObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v4, CFSTR("operationCount"), 1, 0);

}

- (void)removeOperationCountObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLSpotlightDonationManager operationQueue](self, "operationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", v4, CFSTR("operationCount"), 0);

}

- (id)spotlightDonationManagerLog
{
  if (spotlightDonationManagerLog_onceToken != -1)
    dispatch_once(&spotlightDonationManagerLog_onceToken, &__block_literal_global_57_52487);
  return (id)spotlightDonationManagerLog_spotlightDonationManagerLog;
}

- (void)beginSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4
{
  -[PLSpotlightDonationManager _signPostIntervalForOperationType:searchableItemCount:isBegin:](self, "_signPostIntervalForOperationType:searchableItemCount:isBegin:", a3, a4, 1);
}

- (void)endSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4
{
  -[PLSpotlightDonationManager _signPostIntervalForOperationType:searchableItemCount:isBegin:](self, "_signPostIntervalForOperationType:searchableItemCount:isBegin:", a3, a4, 0);
}

- (void)_signPostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4 isBegin:(BOOL)a5
{
  _BOOL4 v5;
  const __CFString *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_type_t v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v8 = CFSTR("donation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationManager.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationType == PLSpotlightOperationTypeDonation"));

    v8 = CFSTR("unsupported");
  }
  -[PLSpotlightDonationManager spotlightDonationManagerLog](self, "spotlightDonationManagerLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);
  v11 = CFSTR("End");
  if (v5)
    v11 = CFSTR("Begin");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ operation to Spotlight for batch containing %lu items"), v11, v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v13;
  if (v5)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      v15 = v14;
      v16 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, v16, v10, "PLSpotlightDonationManager", "%@", buf, 0xCu);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    v15 = v14;
    v16 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_12;
  }

}

- (NSString)photoLibraryTypeDescription
{
  NSString *photoLibraryTypeDescription;
  void *v4;
  NSString *v5;
  NSString *v6;

  photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  if (!photoLibraryTypeDescription)
  {
    -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotolibraryWellKnownIdentifierDescriptionForPhotoLibrary(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_photoLibraryTypeDescription;
    self->_photoLibraryTypeDescription = v5;

    photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  }
  return photoLibraryTypeDescription;
}

- (unint64_t)donateSearchableItemsToSpotlight:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  _QWORD v22[4];
  id v23;
  PLSpotlightDonationManager *v24;
  id v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "_pl_map:", &__block_literal_global_76_52460);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchBackendDonationsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = (uint64_t)v7;
      v34 = 2112;
      v35 = v10;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Preparing to donate items for Bundle: %{public}@ for %@. Items: %{public}@", buf, 0x20u);

    }
    v11 = dispatch_semaphore_create(0);
    -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke_77;
    v22[3] = &unk_1E366BF28;
    v27 = &v28;
    v13 = v6;
    v23 = v13;
    v24 = self;
    v14 = v8;
    v25 = v14;
    v15 = v11;
    v26 = v15;
    objc_msgSend(v12, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v13, 0, 0, 0, v7, 0, v22);

    v16 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      PLSearchBackendDonationsGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v13, "count");
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134349570;
        v33 = v18;
        v34 = 2114;
        v35 = v19;
        v36 = 2114;
        v37 = v14;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Timed-out trying to donate %{public}ld items for %{public}@. Items %{public}@", buf, 0x20u);

      }
      v20 = 3;
      v29[3] = 3;
    }
    else
    {
      v20 = v29[3];
    }

  }
  else
  {
    v20 = v29[3];
  }
  _Block_object_dispose(&v28, 8);

  return v20;
}

- (unint64_t)deleteItemsFromSpotlightWithSearchableItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  PLSpotlightDonationManager *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (objc_msgSend(v4, "count"))
  {
    -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wellKnownPhotoLibraryIdentifier") == 1;

    if (v7)
    {
      PLSearchBackendDonationsGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v9;
        v33 = 2114;
        v34 = v4;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Preparing to delete items for %@ from Spotlight. Items: %{public}@", buf, 0x16u);

      }
      v10 = dispatch_semaphore_create(0);
      +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __84__PLSpotlightDonationManager_deleteItemsFromSpotlightWithSearchableItemIdentifiers___block_invoke;
      v22[3] = &unk_1E366BF50;
      v26 = &v27;
      v13 = v4;
      v23 = v13;
      v24 = self;
      v14 = v10;
      v25 = v14;
      objc_msgSend(v12, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", 0, v13, 0, 0, v11, 0, v22);

      v15 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(v14, v15))
      {
        PLSearchBackendDonationsGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v17;
          v33 = 2114;
          v34 = v13;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Timed-out trying to delete items for %@ from Spotlight. Items: %{public}@", buf, 0x16u);

        }
        v18 = 3;
        v28[3] = 3;
      }
      else
      {
        v18 = v28[3];
      }

    }
    else
    {
      PLSearchBackendDonationsGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2114;
        v34 = v4;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Unsupported PhotoLibrary. Ignoring request to delete items for %{public}@. Items: %{public}@", buf, 0x16u);

      }
      v18 = v28[3];
    }

  }
  else
  {
    v18 = v28[3];
  }
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (unint64_t)deleteAllSearchableItemsFromSpotlight
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  PLSpotlightDonationManager *v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[PLSpotlightDonationManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier") == 3;

  if (v5)
  {
    PLSearchBackendDonationsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Unsupported %{public}@. Ignoring request to delete all items.", buf, 0xCu);

    }
    v8 = v30[3];
  }
  else
  {
    PLSearchBackendDonationsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Preparing to delete all items from Spotlight for %{public}@", buf, 0xCu);

    }
    v11 = dispatch_semaphore_create(0);
    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v13, "wellKnownPhotoLibraryIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLSpotlightDonationManager spotlightIndex](self, "spotlightIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __67__PLSpotlightDonationManager_deleteAllSearchableItemsFromSpotlight__block_invoke;
    v25 = &unk_1E366BF78;
    v28 = &v29;
    v26 = self;
    v17 = v11;
    v27 = v17;
    objc_msgSend(v15, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:", v16, 0, v12, 0, &v22);

    v18 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      PLSearchBackendDonationsGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[PLSpotlightDonationManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription", v22, v23, v24, v25, v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v20;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Timed-out trying to delete all items from Spotlight for %{public}@", buf, 0xCu);

      }
      v8 = 3;
      v30[3] = 3;
    }
    else
    {
      v8 = v30[3];
    }

  }
  _Block_object_dispose(&v29, 8);
  return v8;
}

- (CSSearchableIndex)spotlightIndex
{
  return self->_spotlightIndex;
}

- (CSManagedSearchableIndex)managedSpotlightIndex
{
  return self->_managedSpotlightIndex;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setPhotoLibraryTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_managedSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_spotlightIndex, 0);
}

void __67__PLSpotlightDonationManager_deleteAllSearchableItemsFromSpotlight__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 1;
  if (v3)
    v4 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  PLSearchBackendDonationsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      v9 = "Successfully deleted all items from Spotlight for %{public}@.";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_199541000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v3;
    v9 = "Failed to delete all items from Spotlight for %{public}@. Error: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __84__PLSpotlightDonationManager_deleteItemsFromSpotlightWithSearchableItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 1;
  if (v3)
    v4 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  PLSearchBackendDonationsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134349314;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted %{public}lu items from Spotlight for %{public}@.", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543874;
    v13 = (uint64_t)v10;
    v14 = 2114;
    v15 = v3;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to delete items from Spotlight for %{public}@. Error: %{public}@. Items: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 1;
  if (v3)
    v4 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  PLSearchBackendDonationsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 48);
      v15 = 134349570;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v11 = "Successfully donated %{public}lu items to Spotlight for %{public}@. Items: %{public}@";
      v12 = v7;
      v13 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v15, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134349570;
    v16 = v14;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v3;
    v11 = "Failed to donate %{public}lu searchable items to Spotlight for %{public}@. Error: %{public}@.";
    v12 = v7;
    v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __57__PLSpotlightDonationManager_spotlightDonationManagerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.search.spotlight", "PLSpotlightDonationManager");
  v1 = (void *)spotlightDonationManagerLog_spotlightDonationManagerLog;
  spotlightDonationManagerLog_spotlightDonationManagerLog = (uint64_t)v0;

}

void __69__PLSpotlightDonationManager_deleteAllSearchableItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendDonationsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v6;
    v24 = 2112;
    v25 = v3;
    v7 = "deleteAllSearchableItems. [Failed]. Failed to delete all searchable items from Core Spotlight for %{public}@. Error: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v6;
    v7 = "deleteAllSearchableItems. [Success]. Deleted all searchable items from Core Spotlight for %{public}@";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
  }
  _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v22, v10);

LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[PLSpotlightProgressManager spotlightResetOperationCompletedForPhotoLibraryPathManager:success:](PLSpotlightProgressManager, "spotlightResetOperationCompletedForPhotoLibraryPathManager:success:", v11, v3 == 0);

  PLSearchBackendDonationsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v15;
      v16 = "deleteAllSearchableItems. Successfully updated re-indexing flag in progress plist for %{public}@";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
LABEL_12:
      _os_log_impl(&dword_199541000, v17, v18, v16, (uint8_t *)&v22, 0xCu);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v15;
    v16 = "deleteAllSearchableItems. Failed to manage progress for Core Spotlight re-indexing, progress may not be accura"
          "tely represented on disk for %{public}@.";
    v17 = v14;
    v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_12;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v19, v20, v21);
}

uint64_t __69__PLSpotlightDonationManager_donateSearchableItems_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __45__PLSpotlightDonationManager_disableUISearch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLSearchBackendDonationsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v2;
      v5 = "Failed to disable UI search with error: %@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_199541000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "Disabled UI search";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }

}

void __51__PLSpotlightDonationManager_initWithPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendDonationsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = CFSTR("enable");
      if (!*(_BYTE *)(a1 + 32))
        v6 = CFSTR("disable");
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "Failed to %{public}@ UI search with error: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v11 = CFSTR("enabled");
    else
      v11 = CFSTR("disabled");
    v12 = 138543362;
    v13 = v11;
    v7 = "%{public}@ UI search";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
LABEL_11:
    _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v12, v10);
  }

}

+ (void)handleDeletionForPhotoLibraryWithURL:(id)a3 completion:(id)a4
{
  objc_class *v4;
  void (**v5)(id, _QWORD, void *);
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB35C8];
  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0D74498];
  v12 = *MEMORY[0x1E0CB2938];
  v13[0] = CFSTR("Received unexpected notification from Spotlight of photolibrary deletion for a non macOS platform");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 0, v8);

  PLSearchBackendDonationsGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Received unexpected notification from Spotlight of PhotoLibrary deletion for a non macOS platform. Ignoring request.", v11, 2u);
  }

  v5[2](v5, 0, v9);
}

+ (BOOL)_deleteAllSearchableItemsForSystemPhotoLibraryWithError:(id *)a3
{
  return 0;
}

+ (id)_photolibraryDatabaseUUIDForPhotolibraryWithURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D73280];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLibraryURL:", v4);

  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "photosDatabasePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0C979E8];
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v9, v8, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v11)
  {
    PLSearchBackendDonationsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to get database UUID for database with url %@. Error: %@.", buf, 0x16u);
    }

    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
