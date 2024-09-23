@implementation PGLibraryChangeListenerStateStore

- (PGLibraryChangeListenerStateStore)initWithPhotoLibrary:(id)a3
{
  id v4;
  PGLibraryChangeListenerStateStore *v5;
  void *v6;
  uint64_t v7;
  NSURL *changeTokenURL;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGLibraryChangeListenerStateStore;
  v5 = -[PGLibraryChangeListenerStateStore init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pg_urlForGraphApplicationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("changetoken.plist"));
    v7 = objc_claimAutoreleasedReturnValue();
    changeTokenURL = v5->_changeTokenURL;
    v5->_changeTokenURL = (NSURL *)v7;

  }
  return v5;
}

- (void)setChangeToken:(id)a3
{
  NSURL *v4;
  void *v5;
  id v6;
  void *v7;
  NSURL *changeTokenURL;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSURL *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  NSURL *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (NSURL *)a3;
  if (v4)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    v7 = v6;
    if (v5)
    {
      changeTokenURL = self->_changeTokenURL;
      v16 = v6;
      v9 = objc_msgSend(v5, "writeToURL:options:error:", changeTokenURL, 1, &v16);
      v10 = v16;

      if ((v9 & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_changeTokenURL;
        *(_DWORD *)buf = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Writing change token to file (%@) failed with error: %@", buf, 0x16u);
      }
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Archiving change token (%@) failed with error: %@", buf, 0x16u);
      }
      v10 = v7;
    }

    goto LABEL_11;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v14, "removeItemAtURL:error:", self->_changeTokenURL, 0);

LABEL_12:
}

- (PHPersistentChangeToken)changeToken
{
  void *v2;
  void *v3;

  if (self->_changeTokenURL)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0D71800], "secureUnarchivedObjectWithData:ofClass:", v2, objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return (PHPersistentChangeToken *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeTokenURL, 0);
}

@end
