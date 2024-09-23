@implementation TRIStandardPaths

+ (id)sharedSystemPaths
{
  if (qword_1ECED7E70 != -1)
    dispatch_once(&qword_1ECED7E70, &__block_literal_global_48);
  return (id)qword_1ECED7E68;
}

- (id)subjectDataFile
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("subject.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)namespaceDescriptorsDir
{
  return -[TRIStandardPaths namespaceDescriptorsDirUsingGlobal:](self, "namespaceDescriptorsDirUsingGlobal:", 0);
}

- (id)treatmentsDir
{
  return -[TRIStandardPaths treatmentsDirUsingGlobal:](self, "treatmentsDirUsingGlobal:", 0);
}

- (id)namespaceDescriptorsDefaultDir
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("com.apple.triald.namespacedescriptor.path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TRILogCategory_ClientFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19B89C000, v7, OS_LOG_TYPE_DEFAULT, "Overriding namespaceDescriptorsDefaultDir to %@", buf, 0xCu);
    }

    v8 = v6;
  }
  else if (self->_container)
  {
    -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("default"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPaths.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syslib"));

    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    v16[0] = v11;
    v16[1] = CFSTR("Trial");
    v16[2] = CFSTR("NamespaceDescriptors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathWithComponents:", v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)resolveHardCodedPath:(id)a3
{
  return a3;
}

- (id)treatmentsDirUsingGlobal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths trialRootDirUsingGlobal:](self, "trialRootDirUsingGlobal:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Treatments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)namespaceDescriptorsDirUsingGlobal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths trialRootDirUsingGlobal:](self, "trialRootDirUsingGlobal:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("NamespaceDescriptors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)trialRootDir
{
  void *v4;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = 0;
  -[TRIStandardPaths trialRootDirWithError:](self, "trialRootDirWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = CFSTR("could not find Trial root directory");
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPaths.m"), 232, v9);

  }
  return v4;
}

- (id)trialRootDirWithError:(id *)a3
{
  void **v3;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  atomic_flag *p_loggedRootDir;
  unsigned __int8 v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  TRIAppContainer *container;
  __CFString *v20;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  TRIStandardPaths *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  void **v29;
  _QWORD v30[4];

  v3 = a3;
  v30[3] = *MEMORY[0x1E0C80C00];
  if (self->_container)
  {
    v5 = self->_containerPath;
    if (v5)
    {
      v6 = v5;
      v7 = (void *)MEMORY[0x1E0CB3940];
      v30[0] = v5;
      v30[1] = CFSTR("Library");
      v30[2] = CFSTR("Trial");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pathWithComponents:", v8);
      v3 = (void **)objc_claimAutoreleasedReturnValue();

    }
    else if (v3)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[TRIAppContainer identifier](self->_container, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("could not find path for container %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIStandardPaths _pathErrorWithDescription:](self, "_pathErrorWithDescription:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *v3;
      *v3 = (void *)v12;

      v3 = 0;
    }
  }
  else
  {
    -[TRIStandardPaths _trialSystemRootDirWithError:](self, "_trialSystemRootDirWithError:", a3);
    v3 = (void **)objc_claimAutoreleasedReturnValue();
  }
  p_loggedRootDir = &self->_loggedRootDir;
  do
    v15 = __ldaxr((unsigned __int8 *)p_loggedRootDir);
  while (__stlxr(1u, (unsigned __int8 *)p_loggedRootDir));
  if ((v15 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      container = self->_container;
      if (container)
        v20 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(container %@)"), self->_container);
      else
        v20 = CFSTR("(no container)");
      *(_DWORD *)buf = 138413058;
      v23 = v18;
      v24 = 2048;
      v25 = self;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_19B89C000, v16, OS_LOG_TYPE_DEFAULT, "%@ %p %@: using Trial root dir %@", buf, 0x2Au);
      if (container)

    }
  }
  return v3;
}

- (id)_trialSystemRootDirWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  if (!geteuid())
  {
    v10 = CFSTR("/var/mobile/Library");
LABEL_11:
    v11 = (void *)MEMORY[0x1E0CB3940];
    v17[0] = CFSTR("/private");
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathWithComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Trial"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (qword_1ECED7E60 != -1)
    dispatch_once(&qword_1ECED7E60, &__block_literal_global_15);
  if (_MergedGlobals_12)
  {
    -[TRIStandardPaths _realHomeDirectory](self, "_realHomeDirectory");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v18[0] = v6;
      v18[1] = CFSTR("Library");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathWithComponents:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
    goto LABEL_11;
  if (!a3)
  {
    v14 = 0;
    goto LABEL_13;
  }
  -[TRIStandardPaths _pathErrorWithDescription:](self, "_pathErrorWithDescription:", CFSTR("library path is nil"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13 = *a3;
  *a3 = v16;
LABEL_12:

LABEL_13:
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (id)_realHomeDirectory
{
  return CFSTR("/var/mobile");
}

- (id)namespaceDescriptorsRolloutDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("rollout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)namespaceDescriptorsExperimentDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("experiment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)namespaceDescriptorsDevOverrideDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("devOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

void __37__TRIStandardPaths_sharedSystemPaths__block_invoke()
{
  void *v0;
  TRIStandardPaths *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = -[TRIStandardPaths initWithCurrentSchemaVersion]([TRIStandardPaths alloc], "initWithCurrentSchemaVersion");
  v2 = (void *)qword_1ECED7E68;
  qword_1ECED7E68 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3
{
  TRIStandardPaths *v4;
  void *v6;

  v4 = -[TRIStandardPaths initWithSchemaVersion:container:asClientProcess:](self, "initWithSchemaVersion:container:asClientProcess:", *(_QWORD *)&a3, 0, 0);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("TRIPaths.m"), 334, CFSTR("initWithSchemaVersion is expected to initialize to non-nil"));

  }
  return v4;
}

- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3 container:(id)a4 asClientProcess:(BOOL)a5
{
  id v9;
  TRIStandardPaths *v10;
  TRIStandardPaths *v11;
  void *v12;
  uint64_t v13;
  NSString *containerPath;
  TRIStandardPaths *v15;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TRIStandardPaths;
  v10 = -[TRIStandardPaths init](&v17, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  v10->_schemaVersion = a3;
  objc_storeStrong((id *)&v10->_container, a4);
  v11->_isClient = a5;
  atomic_store(0, (unsigned __int8 *)&v11->_loggedRootDir);
  if (!v9)
    goto LABEL_7;
  if (a5)
    objc_msgSend(v9, "containerURLAsOwner");
  else
    objc_msgSend(v9, "containerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = objc_claimAutoreleasedReturnValue();
  containerPath = v11->_containerPath;
  v11->_containerPath = (NSString *)v13;

  if (!v11->_containerPath)
    v15 = 0;
  else
LABEL_7:
    v15 = v11;

  return v15;
}

- (TRIStandardPaths)initWithCurrentSchemaVersion
{
  return -[TRIStandardPaths initWithSchemaVersion:](self, "initWithSchemaVersion:", 7);
}

void __49__TRIStandardPaths__trialSystemRootDirWithError___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_ClientFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.private.security.storage.triald"), v2))
  {
    _MergedGlobals_12 = 1;
  }
  else
  {
    +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_12 = v3 != 0;

  }
  objc_autoreleasePoolPop(v0);
}

- (id)_pathErrorWithDescription:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB28A8];
  v12 = *MEMORY[0x1E0CB2D50];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E3C00710, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_trialSystemRootDir
{
  void *v4;
  void *v6;

  -[TRIStandardPaths _trialSystemRootDirWithError:](self, "_trialSystemRootDirWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPaths.m"), 139, CFSTR("Trial system root dir is nil"));

  }
  return v4;
}

- (BOOL)validateWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[TRIStandardPaths trialRootDirWithError:](self, "trialRootDirWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)trialVolume
{
  void *v3;
  void *v4;

  -[TRIStandardPaths trialRootDir](self, "trialRootDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIStandardPaths volumeForDirectory:](self, "volumeForDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)volumeForDirectory:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  statfs v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v11, 0, 512);
  v3 = objc_retainAutorelease(a3);
  if (statfs((const char *)objc_msgSend(v3, "UTF8String"), &v11))
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_19B89C000, v4, OS_LOG_TYPE_ERROR, "Could not resolve the volume for directory: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11.f_mntonname);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_19B89C000, v4, OS_LOG_TYPE_INFO, "Found the following volume: %@ for the given directory: %@", (uint8_t *)&v7, 0x16u);
    }
  }

  return v5;
}

- (id)container
{
  return self->_container;
}

- (id)containerDir
{
  if (self->_container)
    return self->_containerPath;
  else
    return CFSTR("/");
}

+ (unsigned)currentSchemaVersion
{
  return 7;
}

+ (unsigned)legacySchemaVersion
{
  return 0;
}

+ (unsigned)resetStorageRequestSchemaVersion
{
  return -1;
}

+ (id)schemaVersionFile
{
  void *v2;
  TRIStandardPaths *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AC6B8C](a1, a2);
  v3 = -[TRIStandardPaths initWithCurrentSchemaVersion]([TRIStandardPaths alloc], "initWithCurrentSchemaVersion");
  -[TRIStandardPaths _trialSystemRootDir](v3, "_trialSystemRootDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("schemaVersion.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)pathsForContainer:(id)a3 asClientProcess:(BOOL)a4
{
  _BOOL8 v4;
  TRIAppContainer *v6;
  TRIAppContainer *container;
  TRIStandardPaths *v8;
  TRIStandardPaths *v9;

  v4 = a4;
  v6 = (TRIAppContainer *)a3;
  if (self->_isClient == v4
    && ((container = self->_container, container == v6)
     || -[TRIAppContainer isEqualToContainer:](container, "isEqualToContainer:", v6)))
  {
    v8 = self;
  }
  else
  {
    v8 = -[TRIStandardPaths initWithSchemaVersion:container:asClientProcess:]([TRIStandardPaths alloc], "initWithSchemaVersion:container:asClientProcess:", self->_schemaVersion, v6, v4);
  }
  v9 = v8;

  return v9;
}

- (id)_versionSpecificSystemStorageDir
{
  void *v3;
  unsigned int schemaVersion;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  schemaVersion = self->_schemaVersion;
  v5 = +[TRIStandardPaths legacySchemaVersion](TRIStandardPaths, "legacySchemaVersion");
  -[TRIStandardPaths _trialSystemRootDir](self, "_trialSystemRootDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (schemaVersion != v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("v%u"), self->_schemaVersion);
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)_versionSpecificStorageDir
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths trialRootDir](self, "trialRootDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("v%u"), self->_schemaVersion);
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)_versionSpecificStorageDirUsingGlobal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths trialRootDirUsingGlobal:](self, "trialRootDirUsingGlobal:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("v%u"), self->_schemaVersion);
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)logDir
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Logs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Trial"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v6;
}

- (id)databaseDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths _versionSpecificSystemStorageDir](self, "_versionSpecificSystemStorageDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)namespaceDescriptorsPathForLayer:(unint64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 1uLL:
      -[TRIStandardPaths namespaceDescriptorsDefaultDir](self, "namespaceDescriptorsDefaultDir");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      -[TRIStandardPaths namespaceDescriptorsRolloutDir](self, "namespaceDescriptorsRolloutDir");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return (id)(id)a2;
    case 4uLL:
      goto LABEL_5;
    case 8uLL:
      -[TRIStandardPaths namespaceDescriptorsDevOverrideDir](self, "namespaceDescriptorsDevOverrideDir");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      if (a3 == 16)
      {
        -[TRIStandardPaths namespaceDescriptorsBMLTDir](self, "namespaceDescriptorsBMLTDir");
        v3 = (const char *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 32)
          return (id)(id)a2;
LABEL_5:
        -[TRIStandardPaths namespaceDescriptorsExperimentDir](self, "namespaceDescriptorsExperimentDir");
        v3 = (const char *)objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
      a2 = v3;
      return (id)(id)a2;
  }
}

- (id)namespaceDescriptorsBMLTDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("bmlt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)systemDataFile
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("system.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)deviceIdentifierFile
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths namespaceDescriptorsDir](self, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)experimentsDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths trialRootDir](self, "trialRootDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Experiments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)localTempDir
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths _versionSpecificStorageDir](self, "_versionSpecificStorageDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tmp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)assetStore
{
  return -[TRIStandardPaths assetStoreUsingGlobal:](self, "assetStoreUsingGlobal:", 1);
}

- (id)assetStoreUsingGlobal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIStandardPaths _versionSpecificStorageDirUsingGlobal:](self, "_versionSpecificStorageDirUsingGlobal:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("AssetStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)decryptionKeyDirForAppleInternal:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  if (v3)
    v5 = CFSTR("/AppleInternal/Library/Trial/NamespaceKeys");
  else
    v5 = CFSTR("/System/Library/Trial/NamespaceKeys");
  +[TRIStandardPaths resolveHardCodedPath:](TRIStandardPaths, "resolveHardCodedPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
