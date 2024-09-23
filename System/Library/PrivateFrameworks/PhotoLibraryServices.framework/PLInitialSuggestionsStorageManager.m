@implementation PLInitialSuggestionsStorageManager

+ (id)initialSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLInitialSuggestionsStorageManager.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(a1, "_initialSuggestionsFilePathForPhotoLibrary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) != 0)
  {
    v27 = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v8, 0, &v27);
    v12 = v27;
    v13 = v12;
    if (v11)
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v18, v11, &v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v26;

      if (!v19)
      {
        PLSearchBackendInitialSuggestionsGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v7;
          v30 = 2112;
          v31 = v20;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to unarchive search suggestions for photoLibrary: %@, error: %@", buf, 0x16u);
        }

      }
      if (!a4)
        goto LABEL_11;
    }
    else
    {
      v19 = 0;
      v20 = v12;
      if (!a4)
        goto LABEL_11;
    }
    *a4 = objc_retainAutorelease(v20);
LABEL_11:
    v22 = (void *)MEMORY[0x1E0C9AA60];
    if (v19)
      v22 = v19;
    v23 = v22;
    goto LABEL_17;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "No initial suggestions found at path: \"%@\".", buf, 0xCu);
  }
  v20 = 0;
  v19 = 0;
  v23 = (id)MEMORY[0x1E0C9AA60];
LABEL_17:

  return v23;
}

+ (BOOL)saveInitialSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_initialSuggestionsFilePathForPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  v13 = v12;
  if (v11)
  {
    v21 = v12;
    v14 = objc_msgSend(v11, "writeToFile:options:error:", v10, 1073741825, &v21);
    v15 = v21;

    if (v14)
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = 1;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134218242;
        v24 = v18;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Successfully saved %tu initial suggestions for photoLibrary: %@", buf, 0x16u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    v15 = v12;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134218498;
    v24 = v19;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Error saving %tu initial suggestions for photoLibrary: %@, %@", buf, 0x20u);
  }
  v17 = 0;
LABEL_9:

  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v17;
}

+ (BOOL)deleteInitialSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a1, "_initialSuggestionsFilePathForPhotoLibrary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "_deleteInitialSuggestionsAtFilePath:error:", v6, a4);

  return (char)a4;
}

+ (BOOL)deleteInitialSuggestionsForPathManager:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "searchInitialSearchSuggestionsFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "_deleteInitialSuggestionsAtFilePath:error:", v6, a4);

  return (char)a4;
}

+ (BOOL)_deleteInitialSuggestionsAtFilePath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v5, &v18);
    v10 = v18;

    PLSearchBackendInitialSuggestionsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v9 & 1) != 0)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412546;
      v20 = v5;
      v21 = 2112;
      v22 = v10;
      v13 = "Failed to delete initial suggestions at path: \"%@\" with error: %@.";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      v13 = "Successfully deleted initial suggestions at path: \"%@\".";
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 12;
    }
    _os_log_impl(&dword_199541000, v14, v15, v13, buf, v16);
LABEL_11:

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
    goto LABEL_13;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "No initial suggestions found at path: \"%@\", nothing to delete.", buf, 0xCu);
  }
  v9 = 1;
LABEL_13:

  return v9;
}

+ (id)_initialSuggestionsFilePathForPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchInitialSearchSuggestionsFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
