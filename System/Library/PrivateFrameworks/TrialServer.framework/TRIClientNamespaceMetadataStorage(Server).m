@implementation TRIClientNamespaceMetadataStorage(Server)

- (BOOL)mergeNamespaceMetadata:()Server forNamespaceName:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  _BOOL8 v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  objc_msgSend(a1, "urlForNamespaceMetadataForNamespaceName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC0AA0];
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientNamespaceMetadataStorage+Server.m"), 29, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[namespaceMetadataUrl path]"));

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke;
  v18[3] = &unk_1E9333378;
  v18[4] = a1;
  v12 = v8;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v21 = &v23;
  v22 = a2;
  v14 = objc_msgSend(v10, "acquireLockOnPath:fileLockMode:blocking:andRunBlock:", v11, 1, 1, v18);

  if (v14)
    v15 = 0;
  else
    v15 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (BOOL)removeOutdatedNamespaceMetadataForNamespaceName:()Server currentCompatibilityVersion:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  _BOOL8 v13;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  objc_msgSend(a1, "urlForNamespaceMetadataForNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC0AA0];
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientNamespaceMetadataStorage+Server.m"), 75, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[namespaceMetadataUrl path]"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __121__TRIClientNamespaceMetadataStorage_Server__removeOutdatedNamespaceMetadataForNamespaceName_currentCompatibilityVersion___block_invoke;
  v16[3] = &unk_1E93333A0;
  v16[4] = a1;
  v11 = v7;
  v17 = v11;
  v18 = &v21;
  v20 = a4;
  v19 = a2;
  v12 = objc_msgSend(v9, "acquireLockOnPath:fileLockMode:blocking:andRunBlock:", v10, 1, 1, v16);

  if (v12)
    v13 = 0;
  else
    v13 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
  return v13;
}

@end
