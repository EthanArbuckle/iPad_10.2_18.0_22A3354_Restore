@implementation TRIClientNamespaceMetadataStorage

void __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loadNamespaceMetadataForNamespaceName:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (v4 = objc_msgSend(v2, "compatibilityVersion"),
        v4 == objc_msgSend(*(id *)(a1 + 48), "compatibilityVersion")))
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 48), "factorNamePurgeabilityLevels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke_2;
    v21[3] = &unk_1E9333350;
    v7 = v5;
    v22 = v7;
    objc_msgSend(v6, "enumerateKeysAndEnumsUsingBlock:", v21);

  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEBUG, "Found ClientNamespaceMetadata with different compatibility version, overwriting", buf, 2u);
    }

    v7 = *(id *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "urlForNamespaceMetadataForNamespaceName:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIClientNamespaceMetadataStorage+Server.m"), 51, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[mergedNamespaceMetadata data]"));

  }
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIClientNamespaceMetadataStorage+Server.m"), 52, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[metadataURL URLByDeletingLastPathComponent] path]"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v12) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v20 = 0;
  v13 = objc_msgSend(v10, "writeToURL:options:error:", v9, 268435457, &v20);
  v14 = v20;
  if ((v13 & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 48), "compatibilityVersion");
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      v25 = 1024;
      v26 = v17;
      v27 = 2114;
      v28 = v14;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to write TRIClientNamespaceMetadata for namespace %{public}@ and compatibility version %u: %{public}@", buf, 0x1Cu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "factorNamePurgeabilityLevels");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnum:forKey:", a3, v5);

}

void __121__TRIClientNamespaceMetadataStorage_Server__removeOutdatedNamespaceMetadataForNamespaceName_currentCompatibilityVersion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int *v12;
  char *v13;
  int v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v2, "loadNamespaceMetadataForNamespaceName:error:", v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (!v4 || objc_msgSend(v4, "compatibilityVersion") == *(_DWORD *)(a1 + 64))
  {
    v6 = 1;
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "urlForNamespaceMetadataForNamespaceName:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIClientNamespaceMetadataStorage+Server.m"), 91, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[self urlForNamespaceMetadataForNamespaceName:namespaceName] path]"));

  }
  v5 = objc_retainAutorelease(v8);
  if (unlink((const char *)objc_msgSend(v5, "fileSystemRepresentation")) && *__error() != 2)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "compatibilityVersion");
      v12 = __error();
      v13 = strerror(*v12);
      v14 = *__error();
      *(_DWORD *)buf = 138544130;
      v18 = v10;
      v19 = 1024;
      v20 = v11;
      v21 = 2080;
      v22 = v13;
      v23 = 1024;
      v24 = v14;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to delete outdated TRIClientNamespaceMetadata for namespace %{public}@ and compatibility version %u: %s (%d)", buf, 0x22u);

    }
    v6 = 0;
    goto LABEL_6;
  }
LABEL_7:

}

@end
