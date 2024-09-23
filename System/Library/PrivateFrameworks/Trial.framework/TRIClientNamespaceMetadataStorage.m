@implementation TRIClientNamespaceMetadataStorage

- (TRIClientNamespaceMetadataStorage)initWithPaths:(id)a3
{
  id v5;
  TRIClientNamespaceMetadataStorage *v6;
  TRIClientNamespaceMetadataStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIClientNamespaceMetadataStorage;
  v6 = -[TRIClientNamespaceMetadataStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paths, a3);

  return v7;
}

- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TRIClientNamespaceMetadataStorage urlForNamespaceMetadataForNamespaceName:](self, "urlForNamespaceMetadataForNamespaceName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v7, 1, &v21);
  v9 = v21;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 == (void *)*MEMORY[0x1E0CB28A8])
    {
      v16 = objc_msgSend(v10, "code");

      if (v16 == 260)
      {
        TRILogCategory_ClientFramework();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_debug_impl(&dword_19B89C000, v17, OS_LOG_TYPE_DEBUG, "No namespace metadata found for namespace name %@", buf, 0xCu);
        }

        goto LABEL_19;
      }
    }
    else
    {

    }
    TRILogCategory_ClientFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_error_impl(&dword_19B89C000, v18, OS_LOG_TYPE_ERROR, "Unable to read metadata URL: %@", buf, 0xCu);
    }

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v13 = 0;
      *a4 = v10;
      goto LABEL_20;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }

  v20 = 0;
  +[TRIPBMessage parseFromData:error:](TRIClientNamespaceMetadata, "parseFromData:error:", v8, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize TRIClientNamespaceMetadata data with error %@", buf, 0xCu);
    }

    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v13 = v11;
  }

LABEL_20:
  return v13;
}

- (id)urlForNamespaceMetadataForNamespaceName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = v5;
  v12[2] = CFSTR("metadata.pb");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPathComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientNamespaceMetadataStorage.m"), 73, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[NSURL fileURLWithPathComponents:@[[_paths treatmentsDir], namespaceName, @\"metadata.pb\"]]"));

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
