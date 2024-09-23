@implementation PLAppUninstallNotificationHandler

- (PLAppUninstallNotificationHandler)initWithLibraryBundleController:(id)a3
{
  id v5;
  PLAppUninstallNotificationHandler *v6;
  PLAppUninstallNotificationHandler *v7;
  PLAppUninstallNotificationHandler *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLAppUninstallNotificationHandler;
  v6 = -[PLAppUninstallNotificationHandler init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Handling application uninstall event with %@", buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "applicationBundlesToValidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v6);

    v6 = v7;
  }
  if (objc_msgSend(v6, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v9)
    {
      v10 = v9;
      v29 = v6;
      v30 = v5;
      v31 = v3;
      v11 = *(_QWORD *)v36;
      v12 = *MEMORY[0x1E0CB2F90];
      v13 = 0x1E0CA5000uLL;
      while (1)
      {
        v14 = 0;
        v33 = v10;
        do
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          v16 = *(void **)(v13 + 2200);
          v34 = 0;
          objc_msgSend(v16, "bundleRecordWithApplicationIdentifier:error:", v15, &v34, v29, v30, v31);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v34;
          v19 = v18;
          if (!v17)
          {
            objc_msgSend(v18, "domain");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v20, "isEqualToString:", v12))
            {

LABEL_19:
              PLBackendGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v41 = v15;
                _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to validate application bundle for %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            v21 = v11;
            v22 = v13;
            v23 = v8;
            v24 = v12;
            v25 = objc_msgSend(v19, "code");

            v26 = v25 == -10814;
            v12 = v24;
            v8 = v23;
            v13 = v22;
            v11 = v21;
            v10 = v33;
            if (!v26)
              goto LABEL_19;
            PLBackendGetLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v41 = v15;
              _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Deleting application photo library for %{public}@", buf, 0xCu);
            }

            -[PLAppUninstallNotificationHandler _removeAppPhotoLibrariesForApplication:](self, "_removeAppPhotoLibrariesForApplication:", v15);
          }
LABEL_22:

          ++v14;
        }
        while (v10 != v14);
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (!v10)
        {
          v5 = v30;
          v3 = v31;
          v6 = v29;
          break;
        }
      }
    }
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Skipping app validation, no recognzied app bundles for application uninstall event with %@", buf, 0xCu);
    }
  }

}

- (void)_removeAppPhotoLibrariesForApplication:(id)a3
{
  id v5;
  PLPhotoLibrarySearchCriteria *v6;
  PLPhotoLibraryFinder *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  PLPhotoLibraryBundleController *libraryBundleController;
  void *v24;
  PLAppUninstallNotificationHandler *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  uint32_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint32_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  PLPhotoLibraryFinder *v53;
  PLPhotoLibrarySearchCriteria *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  NSObject *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAppUninstallNotificationHandler.m"), 83, CFSTR("%@ can only be called from assetsd"), v50);

  }
  v6 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
  -[PLPhotoLibrarySearchCriteria setDomain:](v6, "setDomain:", 3);
  -[PLPhotoLibrarySearchCriteria setContainerIdentifier:](v6, "setContainerIdentifier:", v5);
  v7 = -[PLPhotoLibraryFinder initWithSearchCriteria:]([PLPhotoLibraryFinder alloc], "initWithSearchCriteria:", v6);
  v65 = 0;
  -[PLPhotoLibraryFinder findMatchingPhotoLibraryIdentifiersAndReturnError:](v7, "findMatchingPhotoLibraryIdentifiersAndReturnError:", &v65);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v65;
  if (!objc_msgSend(v8, "count"))
  {
    PLBackendGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    v10 = v44;
    if (v8)
    {
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      *(_DWORD *)buf = 138412290;
      v69 = v5;
      v45 = "_removeAppPhotoLibrariesForApplication: No libraries found for %@";
      v46 = v10;
      v47 = OS_LOG_TYPE_DEFAULT;
      v48 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 138412546;
      v69 = v5;
      v70 = 2112;
      v71 = v9;
      v45 = "_removeAppPhotoLibrariesForApplication: Failed to find libraries for %@: %@";
      v46 = v10;
      v47 = OS_LOG_TYPE_ERROR;
      v48 = 22;
    }
    _os_log_impl(&dword_199541000, v46, v47, v45, buf, v48);
    goto LABEL_40;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = v8;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v11)
  {
    v12 = v11;
    v51 = v9;
    v52 = v8;
    v53 = v7;
    v54 = v6;
    v55 = v5;
    v13 = *(_QWORD *)v62;
    v56 = *MEMORY[0x1E0CB3308];
    v57 = *MEMORY[0x1E0D74498];
    while (1)
    {
      v14 = 0;
      v58 = v12;
      do
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v14), "libraryURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_libraryBundleController, "openBundleAtLibraryURL:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "libraryServicesManager");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v60 = 0;
            v20 = -[NSObject disableiCPLForLibraryDeletionWithError:](v18, "disableiCPLForLibraryDeletionWithError:", &v60);
            v21 = v60;
            v22 = v21;
            if (!v20)
            {
              PLBackendGetLog();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v69 = v15;
                v70 = 2112;
                v71 = v22;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "_removeAppPhotoLibrariesForApplication: unable to prepare library for iCPL disable at URL: %@, error: %@", buf, 0x16u);
              }

              goto LABEL_29;
            }

          }
          libraryBundleController = self->_libraryBundleController;
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v66 = v56;
          v67 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v25 = self;
          v26 = v13;
          v27 = v10;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", v57, 46020, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPhotoLibraryBundleController shutdownBundle:reason:](libraryBundleController, "shutdownBundle:reason:", v17, v29);

          v10 = v27;
          v13 = v26;
          self = v25;
          v12 = v58;
        }
        else
        {
          PLBackendGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v15;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "_removeAppPhotoLibrariesForApplication: No bundle found for libraryURL %@", buf, 0xCu);
          }
        }

        objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "fileExistsAtPath:", v31);

        if (v32)
        {
          PLBackendGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v15;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Deleting photo library from file system at %@", buf, 0xCu);
          }

          v59 = 0;
          v34 = +[PLPhotoLibraryOpener deleteLibraryFromFilesystemAtURL:error:](PLPhotoLibraryOpener, "deleteLibraryFromFilesystemAtURL:error:", v15, &v59);
          v35 = v59;
          PLBackendGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v34)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = v15;
              v38 = v37;
              v39 = OS_LOG_TYPE_DEFAULT;
              v40 = "_removeAppPhotoLibrariesForApplication deleted photo library bundle at URL: %@";
              v41 = 12;
              goto LABEL_24;
            }
          }
          else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v15;
            v70 = 2112;
            v71 = v35;
            v38 = v37;
            v39 = OS_LOG_TYPE_ERROR;
            v40 = "_removeAppPhotoLibrariesForApplication failed to delete photo library bundle at URL: %@, error: %@";
            v41 = 22;
LABEL_24:
            _os_log_impl(&dword_199541000, v38, v39, v40, buf, v41);
          }

          objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeSSBForLibraryURL:", v15);

          goto LABEL_31;
        }
LABEL_29:
        PLBackendGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v15;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "_removeAppPhotoLibrariesForApplication: No photo library bundle exists at libraryURL %@", buf, 0xCu);
        }
LABEL_31:

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (!v12)
      {
        v6 = v54;
        v5 = v55;
        v8 = v52;
        v7 = v53;
        v9 = v51;
        break;
      }
    }
  }
LABEL_40:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
}

+ (id)applicationBundlesToValidate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.GenerativePlayground"));
}

@end
