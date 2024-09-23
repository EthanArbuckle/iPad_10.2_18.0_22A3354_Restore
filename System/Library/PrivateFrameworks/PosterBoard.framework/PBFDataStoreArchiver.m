@implementation PBFDataStoreArchiver

+ (id)fileManager
{
  if (fileManager_onceToken != -1)
    dispatch_once(&fileManager_onceToken, &__block_literal_global_33);
  return (id)fileManager_fileManager;
}

void __35__PBFDataStoreArchiver_fileManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager;
  fileManager_fileManager = v0;

}

+ (BOOL)archiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  NSClassFromString(CFSTR("NSURL"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB1444);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB14A8);
  }

  v14 = v11;
  NSClassFromString(CFSTR("NSURL"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB150CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB1570);
  }

  if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", a6))
  {
    v51 = 0;
    v15 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v51, *MEMORY[0x1E0C999D0], a6);
    v16 = v51;
    v17 = v16;
    if (v15 && (objc_msgSend(v16, "BOOLValue") & 1) == 0)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB32F0];
      v58[0] = *MEMORY[0x1E0CB2D68];
      v58[1] = v32;
      v59[0] = CFSTR("Data Store URLs are directories.");
      v59[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 1, v18);
      v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
    v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocale:", v19);

    objc_msgSend(v13, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberFromString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v22 <= 0x3A)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB32F0];
      v56[0] = *MEMORY[0x1E0CB2D68];
      v56[1] = v24;
      v57[0] = CFSTR("Data Store URLs are only valid from 59+");
      v57[1] = v13;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v57;
      v27 = v56;
LABEL_13:
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pbf_generalErrorWithCode:userInfo:", 1, v30);
      v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0))
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB32F0];
      v54[0] = *MEMORY[0x1E0CB2D68];
      v54[1] = v29;
      v55[0] = CFSTR("URL already exists. No going to overwrite.");
      v55[1] = v14;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v55;
      v27 = v54;
      goto LABEL_13;
    }
    v48 = v12;
    v50 = v17;
    objc_msgSend(a1, "fileManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pf_temporaryDirectoryURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "UUIDString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URLByAppendingPathComponent:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)v36;
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v36, v22);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "URLByDeletingLastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = objc_msgSend(v30, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v38, 1, 0, a6);

    if ((_DWORD)v34)
    {
      v17 = v50;
      v12 = v48;
      if (objc_msgSend(v30, "copyItemAtURL:toURL:error:", v13, v37, a6)
        && +[PBFDataStoreArchivalUtilities transformDataStoreAtURL:options:error:](PBFDataStoreArchivalUtilities, "transformDataStoreAtURL:options:error:", v37, v48, a6))
      {
        if (PBFAppleArchiveCompressDirectory(v37, v14))
        {
          v28 = 1;
LABEL_23:

          goto LABEL_24;
        }
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB32F0];
        v52[0] = *MEMORY[0x1E0CB2D68];
        v52[1] = v40;
        v53[0] = CFSTR("Failed to archive!");
        v53[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v39;
        v17 = v50;
        objc_msgSend(v42, "pbf_generalErrorWithCode:userInfo:", 1, v41);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v28 = 0;
      goto LABEL_23;
    }
    v28 = 0;
    v17 = v50;
    v12 = v48;
    goto LABEL_23;
  }
  v28 = 0;
LABEL_26:

  return v28;
}

- (PBFDataStoreArchiver)initWithDataStoreAtURL:(id)a3
{
  id v4;
  PBFDataStoreArchiver *v5;
  uint64_t v6;
  NSURL *dataStoreURL;
  uint64_t v8;
  PRSDataStoreArchiveConfiguration *options;
  PBFDataStoreArchiver *result;
  void *v11;
  objc_super v12;

  v4 = a3;
  if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)PBFDataStoreArchiver;
    v5 = -[PBFDataStoreArchiver init](&v12, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dataStoreURL = v5->_dataStoreURL;
      v5->_dataStoreURL = (NSURL *)v6;

      v8 = objc_opt_new();
      options = v5->_options;
      v5->_options = (PRSDataStoreArchiveConfiguration *)v8;

    }
    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[dataStoreURL checkResourceIsReachableAndReturnError:nil]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataStoreArchiver initWithDataStoreAtURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (PBFDataStoreArchiver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)archiveToFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSURL *dataStoreURL;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  dataStoreURL = self->_dataStoreURL;
  -[PBFDataStoreArchiver options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "archiveDataStoreAtURL:toURL:options:error:", dataStoreURL, v6, v9, a4);

  return (char)a4;
}

- (NSURL)dataStoreURL
{
  return self->_dataStoreURL;
}

- (PRSDataStoreArchiveConfiguration)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
}

+ (void)archiveDataStoreAtURL:toURL:options:error:.cold.1()
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

+ (void)archiveDataStoreAtURL:toURL:options:error:.cold.2()
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

- (void)initWithDataStoreAtURL:.cold.1()
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
