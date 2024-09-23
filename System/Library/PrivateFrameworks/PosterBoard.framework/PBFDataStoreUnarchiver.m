@implementation PBFDataStoreUnarchiver

+ (id)fileManager
{
  if (fileManager_onceToken_53 != -1)
    dispatch_once(&fileManager_onceToken_53, &__block_literal_global_54_0);
  return (id)fileManager_fileManager_52;
}

void __37__PBFDataStoreUnarchiver_fileManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager_52;
  fileManager_fileManager_52 = v0;

}

+ (BOOL)unarchiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "fileManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_temporaryDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, a6))
  {
LABEL_10:
    v21 = 0;
    goto LABEL_13;
  }
  if (!PBFAppleArchiveDecompress(v10, v17))
  {
    if (a6)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB32F0];
      v29[0] = *MEMORY[0x1E0CB2D68];
      v29[1] = v23;
      v24 = CFSTR("(NULL archiveURL)");
      if (v10)
        v24 = v10;
      v30[0] = CFSTR("Unable to decompress data store url");
      v30[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pbf_generalErrorWithCode:userInfo:", 7, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "removeItemAtURL:error:", v17, 0);
    goto LABEL_10;
  }
  v18 = *MEMORY[0x1E0C99940];
  v19 = *MEMORY[0x1E0C99A10];
  v27[0] = *MEMORY[0x1E0C99938];
  v27[1] = v19;
  v28[0] = v18;
  v28[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pbf_recursivelyUpdateResourceValues:error:", v20, 0);
  if (+[PBFDataStoreArchivalUtilities transformDataStoreAtURL:options:error:](PBFDataStoreArchivalUtilities, "transformDataStoreAtURL:options:error:", v17, v12, a6))
  {
    v21 = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v17, v11, a6);
  }
  else
  {
    objc_msgSend(v13, "removeItemAtURL:error:", v17, 0);
    v21 = 0;
  }

LABEL_13:
  return v21;
}

- (PBFDataStoreUnarchiver)initWithArchivedDataStoreURL:(id)a3
{
  id v4;
  PBFDataStoreUnarchiver *v5;
  uint64_t v6;
  NSURL *archivedDataStoreURL;
  PBFDataStoreUnarchiver *result;
  void *v9;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PBFDataStoreUnarchiver;
    v5 = -[PBFDataStoreUnarchiver init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      archivedDataStoreURL = v5->_archivedDataStoreURL;
      v5->_archivedDataStoreURL = (NSURL *)v6;

      v5->_remapFocusConfigurations = 1;
    }

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[archivedDataStoreURL checkResourceIsReachableAndReturnError:nil]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataStoreUnarchiver initWithArchivedDataStoreURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (PBFDataStoreUnarchiver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)unarchiveToDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *archivedDataStoreURL;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id *v26;
  void *v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_archivedDataStoreURL, "checkResourceIsReachableAndReturnError:", a4))
  {
    objc_msgSend((id)objc_opt_class(), "fileManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pf_temporaryDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    archivedDataStoreURL = self->_archivedDataStoreURL;
    -[PBFDataStoreUnarchiver options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend((id)v12, "unarchiveDataStoreAtURL:toURL:options:error:", archivedDataStoreURL, v11, v14, a4);

    if ((v12 & 1) != 0)
    {
      if (-[PBFDataStoreUnarchiver remapFocusConfigurations](self, "remapFocusConfigurations"))
      {
        v26 = a4;
        v27 = v7;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v11, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          v19 = MEMORY[0x1E0C809B0];
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v21, "setupEnvironmentIfNecessary");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v24 = v22;
                if (v26)
                  *v26 = objc_retainAutorelease(v22);
                v7 = v27;
                objc_msgSend(v27, "removeItemAtURL:error:", v11, 0);

                v23 = 0;
                goto LABEL_19;
              }
              v28[0] = v19;
              v28[1] = 3221225472;
              v28[2] = __58__PBFDataStoreUnarchiver_unarchiveToDirectoryAtURL_error___block_invoke;
              v28[3] = &unk_1E86F4F20;
              v28[4] = self;
              objc_msgSend(v21, "enumerateConfigurationStoreCoordinators:", v28);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v17)
              continue;
            break;
          }
        }

        v7 = v27;
        a4 = v26;
      }
      v23 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v11, v6, a4);
    }
    else
    {
      objc_msgSend(v7, "removeItemAtURL:error:", v11, 0);
      v23 = 0;
    }
LABEL_19:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __58__PBFDataStoreUnarchiver_unarchiveToDirectoryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a2, "allPosterPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v7 = 0x1E0D7F000uLL;
    v24 = v3;
    v25 = a1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(v7 + 2896), "loadFocusConfigurationForPath:error:", v9, 0, v24, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = *(void **)(a1 + 32);
          objc_msgSend(v10, "activityUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "_focusActivityExistsForUUID:", v13);

          if ((v12 & 1) == 0)
          {
            v14 = *(void **)(a1 + 32);
            objc_msgSend(v11, "activityIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_activityForIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = objc_alloc(MEMORY[0x1E0D7FB08]);
              objc_msgSend(v16, "activityIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "activityUniqueIdentifier");
              v19 = v5;
              v20 = v7;
              v21 = v6;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v17, "initWithActivityIdentifier:activityUUID:", v18, v22);

              v6 = v21;
              v7 = v20;
              v5 = v19;

              v3 = v24;
              a1 = v25;
              objc_msgSend(*(id *)(v7 + 2896), "storeFocusConfigurationForPath:focusConfiguration:error:", v9, v23, 0);

            }
            else
            {
              objc_msgSend(*(id *)(v7 + 2896), "removeFocusConfigurationForPath:error:", v9, 0);
            }

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

}

- (id)_availableActivities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_focusActivityExistsForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBFDataStoreUnarchiver _availableActivities](self, "_availableActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PBFDataStoreUnarchiver__focusActivityExistsForUUID___block_invoke;
  v9[3] = &unk_1E86F2420;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __54__PBFDataStoreUnarchiver__focusActivityExistsForUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_activityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBFDataStoreUnarchiver _availableActivities](self, "_availableActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PBFDataStoreUnarchiver__activityForIdentifier___block_invoke;
  v9[3] = &unk_1E86F2420;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__PBFDataStoreUnarchiver__activityForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSURL)archivedDataStoreURL
{
  return self->_archivedDataStoreURL;
}

- (PRSDataStoreArchiveConfiguration)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  self->_options = (PRSDataStoreArchiveConfiguration *)a3;
}

- (BOOL)remapFocusConfigurations
{
  return self->_remapFocusConfigurations;
}

- (void)setRemapFocusConfigurations:(BOOL)a3
{
  self->_remapFocusConfigurations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedDataStoreURL, 0);
}

- (void)initWithArchivedDataStoreURL:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
