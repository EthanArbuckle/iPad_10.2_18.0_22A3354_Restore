@implementation PLSearchIndexingEngineLibraryServicesProvider

- (PLSearchIndexingEngineLibraryServicesProvider)initWithLSM:(id)a3
{
  id v5;
  PLSearchIndexingEngineLibraryServicesProvider *v6;
  PLSearchIndexingEngineLibraryServicesProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchIndexingEngineLibraryServicesProvider;
  v6 = -[PLSearchIndexingEngineLibraryServicesProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lsm, a3);

  return v7;
}

- (BOOL)isUnitTesting
{
  return 0;
}

- (int64_t)libraryIdentifier
{
  return -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self->_lsm, "wellKnownPhotoLibraryIdentifier");
}

- (id)pathManager
{
  return -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
}

- (id)libraryWithName:(const char *)a3
{
  void *v4;
  void *v5;

  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", a3);

  return v5;
}

- (NSString)description
{
  return -[PLLibraryServicesManager description](self->_lsm, "description");
}

- (id)createLogger
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  __int128 *v12;
  __int128 *v13;
  _BOOL4 v14;
  __CFString *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  __CFString *v19;
  __int128 *v20;
  void *v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  int v26;
  __CFString *v27;
  __int16 v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    switch(-[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self, "libraryIdentifier"))
    {
      case 0:
        v14 = -[PLLibraryServicesManager isAppPhotoLibrary](self->_lsm, "isAppPhotoLibrary");
        v15 = CFSTR("UBF_USER");
        if (v14)
          v15 = CFSTR("UBF_APPX");
        v6 = v15;
        break;
      case 1:
        -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self, "pathManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isDCIM");
        v24 = CFSTR("UBF_SPLX");
        if (v23)
          v24 = CFSTR("DCIM_SPL");
        v6 = v24;

        break;
      case 2:
        v6 = CFSTR("UBF_MSGX");
        break;
      case 3:
        v6 = CFSTR("UBF_SYND");
        break;
      default:
        v6 = 0;
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0D731E0], "setupWithLibraryIdentifier:type:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnableAutoFlush:", 1);
  if (v6)
  {
    if (v7)
    {
      PLSearchBackendIndexStatusGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        PLSearchBackendIndexStatusGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        objc_msgSend(v4, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v6;
        v28 = 2114;
        v29 = v11;
        LODWORD(v25) = 22;
        v12 = (__int128 *)_os_log_send_and_compose_impl();

        objc_msgSend(v7, "logWithMessage:fromCodeLocation:type:", v12, "PLSearchIndexingEngine.m", 150, 0, &v26, v25);
        if (v12 != &v30)
        {
          v13 = v12;
LABEL_15:
          free(v13);
        }
      }
    }
  }
  else if (v7)
  {
    PLSearchBackendIndexStatusGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      PLSearchBackendIndexStatusGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      objc_msgSend(v4, "lastPathComponent");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v19;
      LODWORD(v25) = 12;
      v20 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v7, "logWithMessage:fromCodeLocation:type:", v20, "PLSearchIndexingEngine.m", 152, 16, &v26, v25);
      if (v20 != &v30)
      {
        v13 = v20;
        goto LABEL_15;
      }
    }
  }

  return v7;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D73208];
  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoDirectoryWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redactedDescriptionForPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self->_lsm, "wellKnownPhotoLibraryIdentifier");
  PLStringFromWellKnownPhotoLibraryIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> [%@] [%@]"), v8, self, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsm, 0);
}

@end
