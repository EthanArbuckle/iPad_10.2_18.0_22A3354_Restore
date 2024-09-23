@implementation PLResourceDataStoreKey

+ (BOOL)refreshSandboxExtensionForURL:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "libraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "refreshSandboxExtensionForURL:libraryID:assetUUID:error:", v9, v10, v11, a5);
  return (char)a5;
}

+ (BOOL)refreshSandboxExtensionForURL:(id)a3 libraryID:(id)a4 assetUUID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  char v50;
  id v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((PLIsAssetsd() & 1) != 0
    || !PLIsLimitedLibraryClient()
    || !objc_msgSend(v9, "isFileURL"))
  {
    v21 = 1;
    goto LABEL_8;
  }
  v12 = (void *)MEMORY[0x1E0C99E98];
  MEMORY[0x19AEC0750](v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v53 = *MEMORY[0x1E0CB2938];
    v54 = CFSTR("no library url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 44001, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v21 = 0;
    goto LABEL_22;
  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleForLibraryURL:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "clientSandboxExtensionCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsURL:", v9);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v16, "assetsdClient");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resourceClient");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v26;
    if (v26)
    {
      objc_msgSend(v9, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v52 = 0;
      v28 = objc_msgSend(v26, "sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:", v11, &v52, &v51);
      v19 = v52;
      v29 = v51;
      v20 = v29;
      if (v28)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __82__PLResourceDataStoreKey_refreshSandboxExtensionForURL_libraryID_assetUUID_error___block_invoke;
        v47[3] = &unk_1E3668C08;
        v50 = 0;
        v45 = v27;
        v42 = v27;
        v48 = v42;
        v30 = v16;
        v49 = v30;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v47);
        objc_msgSend(v30, "clientSandboxExtensionCache");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v31, "containsURL:", v9);

        if ((v21 & 1) == 0)
        {
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v39 = *MEMORY[0x1E0D74498];
          v59 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sandbox extension not in the cache after requesting them for path: %@"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", v39, 44001, v32);
          v41 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v41;
        }

        v33 = v48;
        goto LABEL_20;
      }
      if (!v29)
      {
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0D74498];
        v57 = *MEMORY[0x1E0CB2938];
        v45 = v27;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown error getting sandbox extension for path: %@"), v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v37, 44001, v38);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0;
LABEL_20:

        v36 = v45;
        goto LABEL_21;
      }
      v36 = v27;
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0D74498];
      v55 = *MEMORY[0x1E0CB2938];
      v56 = CFSTR("no resource client");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 44001, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    v21 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v19 = 0;
  v20 = 0;
  v21 = 1;
LABEL_22:

  if (a6)
    *a6 = objc_retainAutorelease(v20);

LABEL_8:
  return v21;
}

void __82__PLResourceDataStoreKey_refreshSandboxExtensionForURL_libraryID_assetUUID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 48) || objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732D0]), "initFileURLWithPath:sandboxExtensionToken:consume:", v5, v6, 1);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "clientSandboxExtensionCache");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject insertSandboxedURL:](v8, "insertSandboxedURL:", v7);
    }
    else
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to generate sandboxedURL for path: %@", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)descriptionForAssetID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

  return 0;
}

- (id)fileURLForAssetID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

  return 0;
}

- (PLResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return 0;
}

- (BOOL)isEqualToKey:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

  return 0;
}

- (id)keyData
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (id)uniformTypeIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

@end
