@implementation PRSPosterConfigurationAttributes

- (PRSPosterConfigurationAttributes)initWithPath:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PRSPosterConfigurationAttributes *v15;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PFPosterPath"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithPath:extensionIdentifier:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AB76CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithPath:extensionIdentifier:].cold.1();
    goto LABEL_9;
  }

  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("PRS_STAGED"), "stringByAppendingPathComponent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PFTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PRSPosterConfigurationAttributes _initWithPath:extensionIdentifier:posterUUID:providerURL:fileManager:](self, "_initWithPath:extensionIdentifier:posterUUID:providerURL:fileManager:", v8, v7, v10, v14, v9);

  return v15;
}

- (PRSPosterConfigurationAttributes)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PRSPosterConfigurationAttributes *v17;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithConfiguration:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AB9C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49ABA24);
  }

  v7 = v5;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49ABA88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationAttributes initWithConfiguration:].cold.2();
    goto LABEL_22;
  }

  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v12, "posterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "provider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "providerURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PRSPosterConfigurationAttributes _initWithPath:extensionIdentifier:posterUUID:providerURL:fileManager:](self, "_initWithPath:extensionIdentifier:posterUUID:providerURL:fileManager:", v9, v15, v14, v16, v13);

  return v17;
}

- (id)_initWithPath:(id)a3 extensionIdentifier:(id)a4 posterUUID:(id)a5 providerURL:(id)a6 fileManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PRSPosterConfigurationAttributes *v17;
  PRSPosterConfigurationAttributes *v18;
  uint64_t v19;
  NSURL *identifierURL;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PRSPosterConfigurationAttributes;
  v17 = -[PRSPosterConfigurationAttributes init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_path, a3);
    objc_storeStrong((id *)&v18->_extensionIdentifier, a4);
    objc_storeStrong((id *)&v18->_posterUUID, a5);
    objc_storeStrong((id *)&v18->_providerURL, a6);
    objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v15, 3, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    identifierURL = v18->_identifierURL;
    v18->_identifierURL = (NSURL *)v19;

    objc_storeStrong((id *)&v18->_fileManager, a7);
  }

  return v18;
}

- (NSString)role
{
  return (NSString *)-[PFPosterPath role](self->_path, "role");
}

- (NSSet)snapshotURLs
{
  void *v3;
  NSFileManager *fileManager;
  NSURL *identifierURL;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  fileManager = self->_fileManager;
  identifierURL = self->_identifierURL;
  v6 = *MEMORY[0x1E0C99968];
  v27[0] = *MEMORY[0x1E0C99968];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke;
  v25[3] = &unk_1E4D42AF0;
  v25[4] = self;
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", identifierURL, v7, 20, v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = *MEMORY[0x1E0C99978];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v20 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v20, v6, 0);
        v16 = v20;
        if (objc_msgSend(v16, "isEqualToString:", v13)
          && objc_msgSend(v15, "prs_isPosterSnapshot"))
        {
          objc_msgSend(v15, "URLByStandardizingPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v17);

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v18;
}

uint64_t __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke_cold_1(a1, (uint64_t)v4, v5);

  return 1;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (NSURL)identifierURL
{
  return self->_identifierURL;
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierURL, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)initWithPath:extensionIdentifier:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfiguration:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfiguration:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A4996000, log, OS_LOG_TYPE_ERROR, "snapshotURLs %{public}@ encountered an error: %@", (uint8_t *)&v4, 0x16u);
}

@end
