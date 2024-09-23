@implementation TRINamespaceStatusProvider(Tasks)

+ (uint64_t)updateStatusFetchSuccess:()Tasks forNamespaceName:withContext:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  char v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "namespaceDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dynamicNamespaceRecordWithNamespaceName:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "appContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathsForContainer:asClientProcess:", v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }

  if (v12)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B18]), "initWithPaths:", v12);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__TRINamespaceStatusProvider_Tasks__updateStatusFetchSuccess_forNamespaceName_withContext___block_invoke;
    v20[3] = &__block_descriptor_33_e48___TRINamespaceStatus_16__0__TRINamespaceStatus_8l;
    v21 = a3;
    v16 = -[NSObject updateStatusForNamespaceWithName:usingBlock:](v15, "updateStatusForNamespaceWithName:usingBlock:", v7, v20);
  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "appContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "updateStatusFetchSuccess skipping missing app container: %{public}@", buf, 0xCu);

    }
    v16 = 0;
  }

  return v16;
}

@end
