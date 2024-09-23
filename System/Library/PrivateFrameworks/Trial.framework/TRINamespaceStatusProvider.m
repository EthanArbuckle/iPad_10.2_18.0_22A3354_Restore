@implementation TRINamespaceStatusProvider

- (TRINamespaceStatusProvider)initWithPaths:(id)a3
{
  id v5;
  TRINamespaceStatusProvider *v6;
  TRINamespaceStatusProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceStatusProvider;
  v6 = -[TRINamespaceStatusProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paths, a3);

  return v7;
}

- (id)urlForStatusWithNamespaceName:(id)a3
{
  id v5;
  TRITreatmentInfo *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v6 = -[TRITreatmentInfo initWithPaths:]([TRITreatmentInfo alloc], "initWithPaths:", self->_paths);
  -[TRITreatmentInfo baseUrlForTreatmentsWithNamespaceName:](v6, "baseUrlForTreatmentsWithNamespaceName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("namespace-status.pb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 91, CFSTR("URL for namespace status is nil for %@"), v5);

  }
  return v8;
}

- (id)statusForNamespaceWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRINamespaceStatusProvider urlForStatusWithNamespaceName:](self, "urlForStatusWithNamespaceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRINamespaceStatusProvider loadNamespaceStatusFromURL:](self, "loadNamespaceStatusFromURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "namespaceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "namespaceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "status has mismatched namespace name: %@ != %@", (uint8_t *)&v13, 0x16u);

      }
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)saveStatus:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status.namespaceName"));

  }
  objc_msgSend(v5, "namespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRINamespaceStatusProvider urlForStatusWithNamespaceName:](self, "urlForStatusWithNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TRINamespaceStatusProvider saveNamespaceStatus:toURL:](self, "saveNamespaceStatus:toURL:", v5, v8);
  return v9;
}

- (BOOL)updateStatusForNamespaceWithName:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  char v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[TRINamespaceStatusProvider statusForNamespaceWithName:](self, "statusForNamespaceWithName:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!(v8 | v9))
  {
    v10 = 1;
    goto LABEL_11;
  }
  if (!v9)
  {
    v13 = -[TRINamespaceStatusProvider deleteStatusForNamespaceWithName:](self, "deleteStatusForNamespaceWithName:", v6);
    goto LABEL_7;
  }
  objc_msgSend((id)v9, "namespaceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = -[TRINamespaceStatusProvider saveStatus:](self, "saveStatus:", v9);
LABEL_7:
    v10 = v13;
    goto LABEL_11;
  }
  TRILogCategory_ClientFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)v9, "namespaceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v16;
    _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "status has mismatched namespace name: %@ != %@", (uint8_t *)&v17, 0x16u);

  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)deleteStatusForNamespaceWithName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  -[TRINamespaceStatusProvider urlForStatusWithNamespaceName:](self, "urlForStatusWithNamespaceName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v13);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "failed to remove status file for namespace %@ -- %@", buf, 0x16u);
    }

  }
  return v8;
}

- (id)loadNamespaceStatusFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[TRINamespaceStatus statusFromData:](TRINamespaceStatus, "statusFromData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (BOOL)saveNamespaceStatus:(id)a3 toURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  BOOL v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v7, "asData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "namespaceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 156, CFSTR("failed to serialize status for namespace: %@"), v22);

  }
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentUrl"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v25);
  v14 = v25;

  if (!v13
    || (v24 = v14,
        v15 = 1,
        v16 = objc_msgSend(v10, "writeToURL:options:error:", v8, 1, &v24),
        v17 = v24,
        v14,
        v14 = v17,
        (v16 & 1) == 0))
  {
    TRILogCategory_ClientFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "namespaceName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v14;
      _os_log_error_impl(&dword_19B89C000, v18, OS_LOG_TYPE_ERROR, "failed to write status for namespace %@ -- %@", buf, 0x16u);

    }
    v15 = 0;
  }

  objc_autoreleasePoolPop(v9);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
