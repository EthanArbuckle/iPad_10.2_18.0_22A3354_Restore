@implementation PBFPosterExtensionStoreCoordinator

- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4
{
  return -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:](self, "initWithContainerURL:extensionIdentifier:readonly:", a3, a4, 0);
}

- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4 readonly:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  PBFPosterExtensionStoreCoordinator *v11;
  uint64_t v12;
  NSString *extensionIdentifier;
  uint64_t v14;
  NSURL *containerURL;
  uint64_t v16;
  NSURL *providerInfoURL;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSURL *transientInternalInfoURL;
  uint64_t v30;
  NSURL *staticDescriptorsContainerURL;
  uint64_t v32;
  NSURL *descriptorsContainerURL;
  uint64_t v34;
  NSURL *configurationContainerURL;
  uint64_t v36;
  NSMutableDictionary *accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
  uint64_t v38;
  NSFileManager *fileManager;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v8 = a3;
  v9 = a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA8CB64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:].cold.1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA8CBC8);
  }

  v10 = v8;
  NSClassFromString(CFSTR("NSURL"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:].cold.2();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA8CC2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:].cold.2();
    goto LABEL_19;
  }

  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionStoreCoordinator;
  v11 = -[PBFPosterExtensionStoreCoordinator init](&v44, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    extensionIdentifier = v11->_extensionIdentifier;
    v11->_extensionIdentifier = (NSString *)v12;

    v11->_readonly = a5;
    objc_msgSend(v10, "URLByStandardizingPath");
    v14 = objc_claimAutoreleasedReturnValue();
    containerURL = v11->_containerURL;
    v11->_containerURL = (NSURL *)v14;

    objc_msgSend((id)objc_opt_class(), "providerInfoURLForContainerURL:", v11->_containerURL);
    v16 = objc_claimAutoreleasedReturnValue();
    providerInfoURL = v11->_providerInfoURL;
    v11->_providerInfoURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E0C99E98];
    PFTemporaryDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPath:isDirectory:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pbf_sha256Hash");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString pbf_sha256Hash](v11->_extensionIdentifier, "pbf_sha256Hash");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "pbf_bootInstanceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("TransientInfo-%@-%@-%@.plist"), v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    transientInternalInfoURL = v11->_transientInternalInfoURL;
    v11->_transientInternalInfoURL = (NSURL *)v28;

    objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 2);
    v30 = objc_claimAutoreleasedReturnValue();
    staticDescriptorsContainerURL = v11->_staticDescriptorsContainerURL;
    v11->_staticDescriptorsContainerURL = (NSURL *)v30;

    objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 1);
    v32 = objc_claimAutoreleasedReturnValue();
    descriptorsContainerURL = v11->_descriptorsContainerURL;
    v11->_descriptorsContainerURL = (NSURL *)v32;

    objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 3);
    v34 = objc_claimAutoreleasedReturnValue();
    configurationContainerURL = v11->_configurationContainerURL;
    v11->_configurationContainerURL = (NSURL *)v34;

    v36 = objc_opt_new();
    accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = v11->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
    v11->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = (NSMutableDictionary *)v36;

    v11->_accessLock._os_unfair_lock_opaque = 0;
    v38 = objc_opt_new();
    fileManager = v11->_fileManager;
    v11->_fileManager = (NSFileManager *)v38;

  }
  return v11;
}

- (PBFPosterExtensionStoreCoordinator)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFPosterExtensionStoreCoordinator *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PBFPosterExtensionStoreCoordinator *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please use initWithContainerURL:extensionIdentifier:readonly:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PBFPosterExtensionStoreCoordinator.m");
    v17 = 1024;
    v18 = 88;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFPosterExtensionStoreCoordinator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_extensionIdentifier, CFSTR("extensionIdentifier"));
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)setupEnvironmentIfNecessary
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_setupEnvironmentIfNecessary]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (id)_accessLock_setupEnvironmentIfNecessary
{
  int v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  char v13;
  void *v14;
  int v15;
  char v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;

  if (!a1)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 112), "getFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = *(unsigned __int8 *)(a1 + 124);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 8);
  v6 = *(id *)(a1 + 24);
  v7 = *(id *)(a1 + 16);
  v8 = *(id *)(a1 + 104);
  v9 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);
  if (!v3 && (v9 & 1) == 0)
  {
    PFFileProtectionNoneAttributes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, v10, &v25);
    v12 = v25;

    if (!v11)
      goto LABEL_21;

  }
  v13 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0);
  if (!v3 && (v13 & 1) == 0)
  {
    PFFileProtectionNoneAttributes();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v15 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v14, &v24);
    v12 = v24;

    if (!v15)
      goto LABEL_21;

  }
  v16 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0);
  if (!v3 && (v16 & 1) == 0)
  {
    PFFileProtectionNoneAttributes();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v18 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, v17, &v23);
    v12 = v23;

    if (!v18)
      goto LABEL_21;

  }
  v19 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0);
  if (v3 || (v19 & 1) != 0)
    goto LABEL_20;
  PFFileProtectionNoneAttributes();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v21 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v20, &v22);
  v12 = v22;

  if (v21)
  {

LABEL_20:
    -[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]((_QWORD *)a1);
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)deleteEnvironment
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_deleteEnvironment]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (id)_accessLock_deleteEnvironment
{
  uint64_t v2;
  id v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (*(_BYTE *)(a1 + 124))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 112), "getFlag"))
    {
      if (*(_BYTE *)(a1 + 124))
      {
        v5 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB2D68];
        v14 = CFSTR("Cannot delete environment; readonly extension store coordinator");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pbf_generalErrorWithCode:userInfo:", 1, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        return v7;
      }
      -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:]((_QWORD *)a1, &__block_literal_global_92_0);
      v8 = *(void **)(a1 + 104);
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 0;
      objc_msgSend(v8, "removeItemAtURL:error:", v9, &v12);
      v3 = v12;
      PBFLogReaper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v16 = a1;
        v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting environment %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 80), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 88), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 96), "removeAllObjects");
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  return v3;
}

- (void)invalidate
{
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_32);
    -[NSMutableDictionary removeAllObjects](self->_accessLock_posterDescriptorStoreCoordinatorsForUUID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_accessLock_staticPosterDescriptorStoreCoordinatorsForUUID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_accessLock_posterConfigurationStoreCoordinatorsForUUID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "removeAllObjects");
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

uint64_t __48__PBFPosterExtensionStoreCoordinator_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void)_accessLock_enumerateModelStoreCoordinators:(_QWORD *)a1
{
  void (**v3)(id, uint64_t, char *);
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[4];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 15);
    if (v3)
    {
      v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 1);
      v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 2);
      v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 3);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = MEMORY[0x1E0C9AA70];
      v8 = a1[9];
      v9 = a1[10];
      if (!v8)
        v8 = MEMORY[0x1E0C9AA70];
      if (!v9)
        v9 = MEMORY[0x1E0C9AA70];
      v33[0] = v8;
      v33[1] = v9;
      v10 = a1[11];
      if (!v10)
        v10 = MEMORY[0x1E0C9AA70];
      if (a1[12])
        v7 = a1[12];
      v33[2] = v10;
      v33[3] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v16, "objectEnumerator");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v25 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                  v23 = 0;
                  v3[2](v3, v22, &v23);
                  if (v23)
                  {

                    goto LABEL_28;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v19)
                  continue;
                break;
              }
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v13);
      }
LABEL_28:

    }
  }

}

- (void)reapEverythingExceptLatestVersion
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_readonly && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    os_unfair_lock_lock(&self->_accessLock);
    PBFLogReaper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "Reaping everything except latest version.", buf, 2u);
    }

    v4 = (void *)objc_opt_new();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__PBFPosterExtensionStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke;
    v19[3] = &unk_1E86F5CA0;
    v5 = v4;
    v20 = v5;
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, v19);
    -[NSMutableDictionary objectEnumerator](self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "posterUUID", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend((id)objc_opt_class(), "type");
          -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, v14, v13, 0);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v10);
    }

    -[NSMutableDictionary removeAllObjects](self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "removeAllObjects");
    os_unfair_lock_unlock(&self->_accessLock);

  }
}

void __71__PBFPosterExtensionStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "reapEverythingExceptLatestVersion");
  if ((objc_msgSend(v3, "hasKnownVersions") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  const __CFString **v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a1)
    goto LABEL_25;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (objc_msgSend(*(id *)(a1 + 112), "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      a1 = 0;
      *a4 = v8;
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 124))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    a1 = 0;
    goto LABEL_25;
  }
  -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v7, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    switch(a2)
    {
      case 0:
        if (!a4)
          goto LABEL_17;
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v23 = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v12;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v24;
        v15 = &v23;
        break;
      case 1:
        v17 = (id *)(a1 + 72);
        goto LABEL_22;
      case 2:
        v17 = (id *)(a1 + 80);
        goto LABEL_22;
      case 3:
        v17 = (id *)(a1 + 88);
        objc_msgSend(*(id *)(a1 + 88), "objectForKey:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18
          || (v17 = (id *)(a1 + 96),
              objc_msgSend(*(id *)(a1 + 96), "objectForKey:", v7),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v19))
        {
LABEL_22:
          objc_msgSend(*v17, "removeObjectForKey:", v7);
LABEL_23:
          v20 = *(void **)(a1 + 104);
          objc_msgSend(v10, "identifierURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = objc_msgSend(v20, "removeItemAtURL:error:", v21, a4);

          goto LABEL_24;
        }
        if (!a4)
          goto LABEL_17;
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v25 = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v12;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v26;
        v15 = &v25;
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
    if (!a4)
      goto LABEL_17;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v27 = CFSTR("posterUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (void **)v28;
    v15 = &v27;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1109, v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  a1 = 0;
LABEL_24:

LABEL_25:
  return a1;
}

- (void)enumerateDescriptorStoreCoordinators:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  os_unfair_lock_s *p_accessLock;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    os_unfair_lock_unlock(p_accessLock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v38[0] = v13;
    v38[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      v27 = v9;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          v19 = v17;
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v30 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
                v28 = 0;
                v4[2](v4, v26, &v28);
                if (v28)
                {

                  v9 = v27;
                  goto LABEL_25;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v23)
                continue;
              break;
            }
          }

          v17 = v19;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v9 = v27;
      }
      while (v16);
    }
LABEL_25:

  }
}

- (id)_accessLock_modelStoreCoordinatorSetForType:(_QWORD *)a3 error:
{
  void *v6;
  void *v7;
  void *v8;

  if (!a1)
    goto LABEL_6;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (!objc_msgSend(*(id *)(a1 + 112), "getFlag"))
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (!a3)
  {
LABEL_6:
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)enumerateConfigurationStoreCoordinators:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator configurationStoreCoordinatorsWithError:](self, "configurationStoreCoordinatorsWithError:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (void)enumerateDynamicDescriptorStoreCoordinators:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorsWithError:](self, "dynamicDescriptorStoreCoordinatorsWithError:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (void)enumerateStaticDescriptorStoreCoordinators:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator staticDescriptorStoreCoordinatorsWithError:](self, "staticDescriptorStoreCoordinatorsWithError:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (void)reapSnapshotsMatchingURLs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (!self->_readonly
    && objc_msgSend(v4, "count")
    && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    os_unfair_lock_lock(&self->_accessLock);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__PBFPosterExtensionStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke;
    v8[3] = &unk_1E86F5CA0;
    v9 = v6;
    v7 = v6;
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, v8);
    os_unfair_lock_unlock(&self->_accessLock);

  }
}

uint64_t __64__PBFPosterExtensionStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  void *v6;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "reapSnapshotsMatchingURLs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *a3 = result == 0;
  return result;
}

- (void)purgeSnapshotCache
{
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_34_0);
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

uint64_t __56__PBFPosterExtensionStoreCoordinator_purgeSnapshotCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purgeSnapshotCache");
}

- (id)ensureFileSystemIntegrity
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_35);
  -[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories](self);
  os_unfair_lock_unlock(p_accessLock);
  return 0;
}

id __63__PBFPosterExtensionStoreCoordinator_ensureFileSystemIntegrity__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "ensureFileSystemIntegrity");
}

- (void)_correctPermissionsForInternalDirectories
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  __int128 v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  NSObject *v38;
  _QWORD v39[6];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    PBFLogPosterContents();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)a1[4];
      *(_DWORD *)buf = 138412290;
      v36 = v3;
      _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "-[PBFPosterExtensionStoreCoordinator ensureFileSystemIntegrity]> Correcting filesystem permissions for URLs related to %@", buf, 0xCu);
    }

    v5 = a1[5];
    v4 = a1[6];
    v6 = a1[3];
    v39[0] = a1[4];
    v39[1] = v4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v39[2] = v5;
    v39[3] = v6;
    v7 = a1[2];
    v39[4] = a1[1];
    v39[5] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v32;
      v13 = *MEMORY[0x1E0C99940];
      *(_QWORD *)&v10 = 138412546;
      v27 = v10;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
          v30 = 0;
          v16 = objc_msgSend(v15, "pbf_setFileProtection:error:", v13, &v30, v27);
          v17 = v30;
          v18 = v17;
          if ((v16 & 1) == 0)
          {
            v19 = -[NSObject pf_isFileNotFoundError](v17, "pf_isFileNotFoundError");
            PBFLogPosterContents();
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v19)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v15;
                _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> skipping nonexistent file %@", buf, 0xCu);
              }
              goto LABEL_25;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v36 = v15;
              v37 = 2114;
              v38 = v18;
              _os_log_error_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file protection for file %@: %{public}@", buf, 0x16u);
            }

          }
          v29 = 0;
          v22 = objc_msgSend(v15, "pbf_setPurgable:error:", 0, &v29);
          v21 = v29;
          if ((v22 & 1) == 0)
          {
            PBFLogPosterContents();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v36 = v15;
              v37 = 2114;
              v38 = v21;
              _os_log_error_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct purgability for file %@: %{public}@", buf, 0x16u);
            }

          }
          v28 = 0;
          v24 = objc_msgSend(v15, "pbf_setExcludedFromBackup:error:", 0, &v28);
          v25 = v28;
          if ((v24 & 1) == 0)
          {
            PBFLogPosterContents();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v36 = v15;
              v37 = 2114;
              v38 = v25;
              _os_log_error_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct exclude from backup state for file %@: %{public}@", buf, 0x16u);
            }

          }
LABEL_25:

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v11);
    }

  }
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, objc_msgSend(v4, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pbf_posterSnapshotCoordinatorForIdentity:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_modelStoreCoordinatorsForType:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v4;
  void *v5;

  if (a1)
  {
    v4 = a1 + 30;
    os_unfair_lock_lock(a1 + 30);
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke;
  v13 = &unk_1E86F5D30;
  v5 = v4;
  v14 = v5;
  v15 = &v16;
  v6 = _Block_copy(&v10);
  -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorsWithError:](self, "dynamicDescriptorStoreCoordinatorsWithError:", 0, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v6);

  if (!*((_BYTE *)v17 + 24))
  {
    -[PBFPosterExtensionStoreCoordinator staticDescriptorStoreCoordinatorsWithError:](self, "staticDescriptorStoreCoordinatorsWithError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v6);

    if (!*((_BYTE *)v17 + 24))
    {
      -[PBFPosterExtensionStoreCoordinator configurationStoreCoordinatorsWithError:](self, "configurationStoreCoordinatorsWithError:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v6);

    }
  }

  _Block_object_dispose(&v16, 8);
}

void __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke_2;
  v6[3] = &unk_1E86F5D08;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v5, "pbf_enumerateSnapshotCoordinators:", v6);
  if (*((_BYTE *)v10 + 24))
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

- (id)modelStoreCoordinatorForPosterUUID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)_accessLock_modelStoreCoordinatorForPosterUUID:(uint64_t)a3 type:
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v5 = a1 + 120;
    v6 = a2;
    PBFDebug_os_unfair_lock_assert_owner(v5);
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)latestPosterConfigurationForUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PBFPosterExtensionStoreCoordinator configurationStoreCoordinatorForPosterUUID:](self, "configurationStoreCoordinatorForPosterUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathOfLatestVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)dynamicDescriptorStoreCoordinatorsWithError:(id *)a3
{
  return -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 1, a3);
}

- (id)_modelStoreCoordinatorSetForType:(_QWORD *)a3 error:
{
  os_unfair_lock_s *v6;
  void *v7;

  if (a1)
  {
    v6 = a1 + 30;
    os_unfair_lock_lock(a1 + 30);
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)a1, a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)dynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier___block_invoke;
  v10[3] = &unk_1E86F5D58;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __85__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)dynamicPosterDescriptorLatestVersionPaths
{
  void *v2;
  void *v3;

  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __79__PBFPosterExtensionStoreCoordinator_dynamicPosterDescriptorLatestVersionPaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pathOfLatestVersion");
}

- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 createIfNil:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  __CFString *v10;
  __CFString *v11;
  os_unfair_lock_s *p_accessLock;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  id v29;
  _QWORD v30[4];
  __CFString *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  const __CFString *v37;
  _QWORD v38[3];

  v7 = a5;
  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  if (-[__CFString length](v10, "length"))
  {
    if ((PFPosterRoleIsValid() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA8EF00);
    }
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    v32 = 0;
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 1, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (uint64_t)v32;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __108__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier_role_createIfNil_error___block_invoke;
    v30[3] = &unk_1E86F5D58;
    v15 = v10;
    v31 = v15;
    objc_msgSend(v13, "bs_firstObjectPassingTest:", v30);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_20;
    if (v16)
    {
      objc_msgSend((id)v16, "role");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v11);

      if ((v18 & 1) == 0)
      {

        v19 = (void *)MEMORY[0x1E0CB35C8];
        v35[0] = *MEMORY[0x1E0CB2D68];
        v35[1] = CFSTR("role");
        v20 = CFSTR("(null role)");
        if (v11)
          v20 = v11;
        v36[0] = CFSTR("Descriptor store coordinator exists but does not match the requested role");
        v36[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1107, v21);
        v14 = objc_claimAutoreleasedReturnValue();
        v16 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 1, v21, v15, v11, &v29);
        v16 = objc_claimAutoreleasedReturnValue();
        v14 = (uint64_t)v29;
LABEL_17:

LABEL_20:
        os_unfair_lock_unlock(p_accessLock);
        if (!(v16 | v14))
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v33[0] = *MEMORY[0x1E0CB2D68];
          v33[1] = CFSTR("role");
          v25 = CFSTR("(null role)");
          if (v11)
            v25 = v11;
          v34[0] = CFSTR("Descriptor store coordinator could not fulfill request for role");
          v34[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v26);
          v14 = objc_claimAutoreleasedReturnValue();

        }
        if (a6 && v14)
          *a6 = objc_retainAutorelease((id)v14);

        goto LABEL_28;
      }
      v16 = 0;
    }
    v14 = 0;
    goto LABEL_20;
  }
  if (a6)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    if (v10)
      v23 = v10;
    else
      v23 = CFSTR("(null descriptorIdentifier)");
    v37 = CFSTR("descriptorIdentifier");
    v38[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v14);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  v16 = 0;
LABEL_29:

  return (id)v16;
}

uint64_t __108__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier_role_createIfNil_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_accessLock_createModelStoreCoordinator:(void *)a3 posterUUID:(void *)a4 descriptorIdentifier:(void *)a5 role:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id *v27;
  uint64_t v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
    goto LABEL_9;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (!objc_msgSend(*(id *)(a1 + 112), "getFlag"))
  {
    if (*(_BYTE *)(a1 + 124))
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
LABEL_9:
      v15 = 0;
      goto LABEL_48;
    }
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v11, a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v15 = v16;
LABEL_47:

      goto LABEL_48;
    }
    if ((PFPosterRoleIsValid() & 1) != 0)
    {
      v18 = (uint64_t)v13;
    }
    else
    {
      PRPosterRoleLookupForExtensionBundleIdentifier(*(void **)(a1 + 128), v12);
      v18 = objc_claimAutoreleasedReturnValue();

      PBFLogPosterContents();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v57 = "-[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]";
        v58 = 2112;
        v59 = v18;
        _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "[Invalid Role][%{public}s] role was invalid, recovered: %@", buf, 0x16u);
      }

    }
    -[PBFPosterExtensionStoreCoordinator _containerURLForType:]((id *)a1, a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a2)
    {
      case 0:
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, 0);
          v15 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_46;
      case 1:
        v26 = v22;
        v48 = v18;
        objc_msgSend(MEMORY[0x1E0D7F8E0], "descriptorIdentityWithProvider:identifier:role:posterUUID:version:", *(_QWORD *)(a1 + 128), v12, v18, v11, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", *(_QWORD *)(a1 + 32), v25);
        v49 = 0;
        v27 = (id *)&v49;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFPosterDescriptorStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 72;
        goto LABEL_24;
      case 2:
        v26 = v22;
        v48 = v18;
        objc_msgSend(MEMORY[0x1E0D7F8E0], "staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:", *(_QWORD *)(a1 + 128), v12, v18, v11, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", *(_QWORD *)(a1 + 32), v25);
        v50 = 0;
        v27 = (id *)&v50;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFStaticPosterDescriptorStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 80;
        goto LABEL_24;
      case 3:
        v26 = v22;
        v48 = v18;
        objc_msgSend(MEMORY[0x1E0D7F8E0], "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", *(_QWORD *)(a1 + 128), v12, v18, v11, 0, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", *(_QWORD *)(a1 + 32), v25);
        v51 = 0;
        v27 = (id *)&v51;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFPosterConfigurationStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 88;
LABEL_24:
        v29 = *v27;
        v23 = *(id *)(a1 + v28);
        v22 = v26;
        if (!v29)
          goto LABEL_25;
        goto LABEL_40;
      default:
        v48 = v18;
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", *(_QWORD *)(a1 + 32), 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v24 = 0;
        v25 = 0;
LABEL_25:
        objc_msgSend(v24, "identifierURL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqual:", v22);

        if ((v31 & 1) == 0)
        {
          v45 = v25;
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v33 = *MEMORY[0x1E0CB2D68];
          v55[0] = CFSTR("unexpected identifierURL for model store coordinator");
          v34 = *MEMORY[0x1E0CB3308];
          v54[0] = v33;
          v54[1] = v34;
          v35 = (uint64_t)v22;
          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("file://null"));
            v35 = objc_claimAutoreleasedReturnValue();
          }
          v46 = v22;
          v55[1] = v35;
          v54[2] = *MEMORY[0x1E0CB32F0];
          objc_msgSend(v24, "identifierURL", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (!v36)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("file://null"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v55[2] = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v38);
          v29 = (id)objc_claimAutoreleasedReturnValue();

          if (!v36)
          v22 = v46;
          if (!v46)

          v25 = v45;
          if (v29)
            goto LABEL_40;
        }
        if (v23)
        {
          objc_msgSend(v23, "bs_setSafeObject:forKey:", v24, v11);
        }
        else
        {
          v39 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0CB2D68];
          v53 = CFSTR("model store coordinator could not be created");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v40 = v22;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v41);
          v29 = (id)objc_claimAutoreleasedReturnValue();

          v22 = v40;
          objc_msgSend(0, "bs_setSafeObject:forKey:", v24, v11);
          if (v29)
          {
            v23 = 0;
LABEL_40:
            if (a6)
              *a6 = objc_retainAutorelease(v29);
            PBFLogPosterContents();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:].cold.1();

            v15 = 0;
LABEL_45:

            v18 = v48;
LABEL_46:

            v13 = (id)v18;
            goto LABEL_47;
          }
        }
        v24 = v24;
        v15 = v24;
        goto LABEL_45;
    }
  }
  if (!a6)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = 0;
  *a6 = v14;
LABEL_48:

  return v15;
}

- (id)createDynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  if (-[__CFString length](v8, "length"))
  {
    os_unfair_lock_lock(&self->_accessLock);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 1, v10, v8, v9, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_accessLock);
  }
  else if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    if (v8)
      v12 = v8;
    else
      v12 = CFSTR("(null descriptorIdentifier)");
    v15 = CFSTR("descriptorIdentifier");
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (BOOL)teardownDynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;

  p_accessLock = &self->_accessLock;
  v7 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a4) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, 1, v7, a4);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a4;
}

- (void)teardownAllDynamicDescriptors
{
  -[PBFPosterExtensionStoreCoordinator _invalidateAndDeleteStoreCoordinatorsForType:]((uint64_t)self, 1);
}

- (void)_invalidateAndDeleteStoreCoordinatorsForType:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a1 && (objc_msgSend(*(id *)(a1 + 112), "getFlag") & 1) == 0 && !*(_BYTE *)(a1 + 124))
  {
    v4 = *(id *)(a1 + 104);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PBFPosterExtensionStoreCoordinator__invalidateAndDeleteStoreCoordinatorsForType___block_invoke;
    v9[3] = &unk_1E86F5E30;
    v8 = v4;
    v10 = v8;
    objc_msgSend(v5, "bs_each:", v9);

    -[PBFPosterExtensionStoreCoordinator _containerURLForType:]((id *)a1, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v6, 0);
    PFFileProtectionNoneAttributes();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v7, 0);

    if ((unint64_t)(a2 - 1) <= 2)
      objc_msgSend(*(id *)(a1 + 8 * (a2 - 1) + 72), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));

  }
}

- (id)staticDescriptorStoreCoordinatorsWithError:(id *)a3
{
  os_unfair_lock_s *p_accessLock;
  void *v6;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return v6;
}

- (id)posterStaticDescriptorLatestVersionPaths
{
  void *v2;
  void *v3;

  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_56);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __78__PBFPosterExtensionStoreCoordinator_posterStaticDescriptorLatestVersionPaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pathOfLatestVersion");
}

- (id)staticDescriptorStoreCoordinatorForPosterUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)staticDescriptorStoreCoordinatorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__PBFPosterExtensionStoreCoordinator_staticDescriptorStoreCoordinatorForIdentifier___block_invoke;
  v9[3] = &unk_1E86F5DE0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __84__PBFPosterExtensionStoreCoordinator_staticDescriptorStoreCoordinatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)createStaticDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  if (-[__CFString length](v8, "length"))
  {
    os_unfair_lock_lock(&self->_accessLock);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 2, v10, v8, v9, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_accessLock);
  }
  else if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    if (v8)
      v12 = v8;
    else
      v12 = CFSTR("(null descriptorIdentifier)");
    v15 = CFSTR("descriptorIdentifier");
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (void)teardownAllStaticDescriptorStoreCoordinators
{
  -[PBFPosterExtensionStoreCoordinator _invalidateAndDeleteStoreCoordinatorsForType:]((uint64_t)self, 2);
}

- (id)configurationStoreCoordinatorsWithError:(id *)a3
{
  return -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 3, a3);
}

- (id)configurationStoreCoordinatorForPosterUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6
{
  os_unfair_lock_s *p_accessLock;
  id v11;
  id v12;
  id v13;
  void *v14;

  p_accessLock = &self->_accessLock;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 3, v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessLock);
  return v14;
}

- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_accessLock;
  id v9;

  p_accessLock = &self->_accessLock;
  v9 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a5) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:version:error:]((uint64_t)self, 3, v9, a4, a5);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a5;
}

- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(uint64_t)a4 version:(_QWORD *)a5 error:
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a1)
    goto LABEL_9;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (!objc_msgSend(*(id *)(a1 + 112), "getFlag"))
  {
    if (*(_BYTE *)(a1 + 124))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
LABEL_9:
      v11 = 0;
      goto LABEL_29;
    }
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v9, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v31 = a1;
      v32 = a2;
      v33 = a5;
      v34 = v9;
      objc_msgSend(v12, "allPosterPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v20, "identity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "version");

            if (v22 == a4)
            {
              objc_msgSend(v20, "identity");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "supplement");
              objc_msgSend(v20, "identity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeSupplement:forVersion:error:", v24, objc_msgSend(v25, "version"), 0);

              ++v17;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }
      if ((objc_msgSend(v13, "hasKnownVersions") & 1) != 0)
      {
        v11 = v17 != 0;
        v9 = v34;
      }
      else
      {
        v9 = v34;
        v11 = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:](v31, v32, v34, v33);
      }
    }
    else
    {
      if (!a5)
      {
        v11 = 0;
        goto LABEL_28;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v40[0] = CFSTR("posterUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v14;
      v40[1] = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v27;
      v40[2] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1108, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }

LABEL_28:
    goto LABEL_29;
  }
  if (!a5)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = 0;
  *a5 = v10;
LABEL_29:

  return v11;
}

- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;

  p_accessLock = &self->_accessLock;
  v7 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a4) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, 3, v7, a4);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a4;
}

- (id)stageNewConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6
{
  os_unfair_lock_s *p_accessLock;
  id v11;
  id v12;
  id v13;
  void *v14;

  p_accessLock = &self->_accessLock;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:]((id *)&self->super.isa, v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessLock);
  return v14;
}

- (id)_accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:(void *)a3 descriptorIdentifier:(void *)a4 role:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 15);
    if (objc_msgSend(a1[14], "getFlag"))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        a1 = 0;
        *a5 = v12;
        goto LABEL_23;
      }
      goto LABEL_9;
    }
    if (*((_BYTE *)a1 + 124))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
LABEL_9:
      a1 = 0;
      goto LABEL_23;
    }
    -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)a1, v9, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      a1 = v13;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0C99E98];
      PFTemporaryDirectory();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("STAGED_CSC_%@_%f"), v29, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fileURLWithPath:isDirectory:", v19, 1);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7F8E0], "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", a1[16], v10, v11, v9, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v20;
      objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFPosterConfigurationStoreCoordinator, "createNewStoreCoordinatorWithPath:error:", v22, &v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;
      v25 = v24;
      if (v24)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v24);
        PBFLogPosterContents();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionStoreCoordinator _accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:].cold.1();

        a1 = 0;
      }
      else
      {
        if (v23)
          objc_msgSend(a1[12], "setObject:forKey:", v23, v9);
        a1 = v23;
      }

    }
  }
LABEL_23:

  return a1;
}

- (void)abortStaged
{
  NSFileManager *v3;
  NSMutableDictionary *accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
  NSFileManager *v5;
  _QWORD v6[4];
  NSFileManager *v7;

  if (!self->_readonly && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v3 = self->_fileManager;
    os_unfair_lock_lock(&self->_accessLock);
    accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__PBFPosterExtensionStoreCoordinator_abortStaged__block_invoke;
    v6[3] = &unk_1E86F5E08;
    v7 = v3;
    v5 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "enumerateKeysAndObjectsUsingBlock:", v6);
    -[NSMutableDictionary removeAllObjects](self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "removeAllObjects");
    os_unfair_lock_unlock(&self->_accessLock);

  }
}

void __49__PBFPosterExtensionStoreCoordinator_abortStaged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "identifierURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", v5, 0);
}

- (BOOL)commitStagedWithError:(id *)a3
{
  id *v3;
  void *v4;
  PBFPosterExtensionStoreCoordinator *v5;
  BOOL v6;
  NSFileManager *v7;
  os_unfair_lock_s *p_accessLock;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PBFPosterExtensionStoreCoordinator *v15;
  void *v16;
  NSURL *configurationContainerURL;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  PBFPosterConfigurationStoreCoordinator *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  os_unfair_lock_s *v41;
  id *v42;
  void *v43;
  NSMutableDictionary *obj;
  char v45;
  PBFPosterExtensionStoreCoordinator *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v3 = a3;
  v67 = *MEMORY[0x1E0C80C00];
  if (self->_readonly)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = 0;
      *v3 = v4;
      return v6;
    }
    return 0;
  }
  v5 = self;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    return 0;
  }
  v7 = v5->_fileManager;
  p_accessLock = &v5->_accessLock;
  os_unfair_lock_lock(&v5->_accessLock);
  v43 = (void *)objc_opt_new();
  v49 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
  v48 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v48)
  {
    obj = v9;
    v41 = &v5->_accessLock;
    v42 = v3;
    v10 = 0;
    v46 = v5;
    v47 = *(_QWORD *)v61;
    v45 = 1;
LABEL_11:
    v11 = 0;
    while (1)
    {
      v12 = v10;
      if (*(_QWORD *)v61 != v47)
        objc_enumerationMutation(obj);
      -[NSMutableDictionary objectForKey:](v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v11), v41, v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extensionIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posterUUID");
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidate");
      configurationContainerURL = v15->_configurationContainerURL;
      objc_msgSend(v16, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:isDirectory:](configurationContainerURL, "URLByAppendingPathComponent:isDirectory:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "identifierURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v12;
      v21 = -[NSFileManager moveItemAtURL:toURL:error:](v7, "moveItemAtURL:toURL:error:", v20, v19, &v59);
      v22 = v59;

      objc_msgSend(v49, "addObject:", v19);
      v50 = (void *)v14;
      if (v21)
      {
        v23 = -[PBFPosterModelStoreCoordinator initWithProvider:identifierURL:posterUUID:]([PBFPosterConfigurationStoreCoordinator alloc], "initWithProvider:identifierURL:posterUUID:", v14, v19, v16);
        -[PBFPosterModelStoreCoordinator checkEnvironmentConsistency](v23, "checkEnvironmentConsistency");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = v24;

          v27 = 2;
          v22 = v26;
        }
        else
        {
          objc_msgSend(v43, "setObject:forKey:", v23, v16);
          v27 = 0;
          v45 = 1;
        }

      }
      else
      {
        v45 = 0;
        v27 = 2;
      }
      v10 = v22;

      v5 = v46;
      if (v27)
        break;
      if (v48 == ++v11)
      {
        v48 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v48)
          goto LABEL_11;
        break;
      }
    }

    if ((v45 & 1) == 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[NSMutableDictionary keyEnumerator](v46->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "keyEnumerator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v56 != v31)
              objc_enumerationMutation(v28);
            -[NSMutableDictionary objectForKey:](v46->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "identifierURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSFileManager removeItemAtURL:error:](v7, "removeItemAtURL:error:", v34, 0);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        }
        while (v30);
      }

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v35 = v49;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v52 != v38)
              objc_enumerationMutation(v35);
            -[NSFileManager removeItemAtURL:error:](v7, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j), 0);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        }
        while (v37);
      }

      v6 = 0;
      p_accessLock = v41;
      v3 = v42;
      goto LABEL_42;
    }
    p_accessLock = v41;
    v3 = v42;
  }
  else
  {

    v10 = 0;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](v5->_accessLock_posterConfigurationStoreCoordinatorsForUUID, "addEntriesFromDictionary:", v43);
  v6 = 1;
LABEL_42:
  -[NSMutableDictionary removeAllObjects](v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "removeAllObjects");
  os_unfair_lock_unlock(p_accessLock);
  if (v3 && v10)
    *v3 = objc_retainAutorelease(v10);

  return v6;
}

- (NSDate)lastRefreshDescriptorDate
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshDescriptorDate]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return (NSDate *)v4;
}

- (id)_accessLock_lastRefreshDescriptorDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1 && (objc_msgSend(a1[14], "getFlag") & 1) == 0)
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastRefreshDescriptorDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BSBuildVersion)lastRefreshStashedBuildVersion
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshStashedBuildVersion]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return (BSBuildVersion *)v4;
}

- (id)_accessLock_lastRefreshStashedBuildVersion
{
  void *v2;
  void *v3;
  void *v4;

  if (a1 && (objc_msgSend(a1[14], "getFlag") & 1) == 0)
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastRefreshStashedBuildVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016F8]), "initWithString:", v4);
    else
      v2 = 0;

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)lastRefreshDescriptorReason
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshDescriptorReason]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  return (NSString *)v4;
}

- (id)_accessLock_lastRefreshDescriptorReason
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend(a1[14], "getFlag") & 1) != 0)
    {
      v1 = 0;
    }
    else
    {
      -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo](v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lastRefreshDescriptorReason"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
      v5 = CFSTR("(null)");
      if (v3)
        v5 = (__CFString *)v3;
      v1 = v5;

    }
  }
  return v1;
}

- (void)updateLastRefreshDescriptorDateWithReason:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (!self->_readonly)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    v5 = a3;
    objc_msgSend(v4, "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshDescriptorDate:reason:]((uint64_t)self, v6, v5);

    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_accessLock_bumpLastRefreshDescriptorDate:(void *)a3 reason:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (a1 && !*(_BYTE *)(a1 + 124) && (objc_msgSend(*(id *)(a1 + 112), "getFlag") & 1) == 0)
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshBuildVersion](a1);
    -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo]((id *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v10 = v9;

    if (v15)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("lastRefreshDescriptorDate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("lastRefreshDescriptorDate"));

    }
    v12 = objc_msgSend(v5, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("No reason!");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("lastRefreshDescriptorReason"));

    -[PBFPosterExtensionStoreCoordinator _accessLock_writeTransientInternalInfo:error:](a1, v10, 0);
  }

}

- (void)removeLastRefreshDescriptorDate
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  if (!self->_readonly)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshDescriptorDate:reason:]((uint64_t)self, v4, CFSTR("removeLastRefreshDescriptorDate"));

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (id)providerInfoObjectForKey:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  void *v7;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessLock_providerInfo
{
  id *v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  id v11;

  if (a1)
  {
    v1 = a1;
    if ((objc_msgSend(a1[14], "getFlag") & 1) != 0)
      return (id *)0;
    v3 = v1[7];
    if (!v3)
    {
      objc_msgSend(v1[6], "pbf_setFileProtection:error:", *MEMORY[0x1E0C99940], 0);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v1[6]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0CB3710];
        extensionStoreCoordinatorSupportedArchivableClassesForInfoFiles();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        v10 = v7;
      else
        v10 = (id)objc_opt_new();
      v11 = v1[7];
      v1[7] = v10;

      v3 = v1[7];
    }
    a1 = (id *)objc_msgSend(v3, "copy");
  }
  return a1;
}

- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4
{
  return -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:](self, "providerInfoSetObject:forKey:error:", a3, a4, 0);
}

- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  os_unfair_lock_s *p_accessLock;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!self->_readonly)
  {
    v12 = v9;
    NSClassFromString(CFSTR("NSString"));
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:].cold.1();
        objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA9125CLL);
      }

      v13 = v8;
      v14 = v13;
      if (!v13 || (objc_msgSend(v13, "conformsToProtocol:", &unk_1EFA072E0) & 1) != 0)
      {

        p_accessLock = &self->_accessLock;
        os_unfair_lock_lock(&self->_accessLock);
        v11 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]((uint64_t)self, v14, v12, (uint64_t)a5);
        os_unfair_lock_unlock(p_accessLock);
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(NSSecureCoding)]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA911F8);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (uint64_t)_accessLock_providerInfoSetObject:(void *)a3 forKey:(uint64_t)a4 error:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject **v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1 && !*(_BYTE *)(a1 + 124))
  {
    v9 = 0;
    if ((objc_msgSend(*(id *)(a1 + 112), "getFlag") & 1) == 0 && v8)
    {
      -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo]((id *)a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      v12 = v11;
      if (v11)
        v13 = v11;
      else
        v13 = (id)objc_opt_new();
      v14 = v13;

      if (v7)
        objc_msgSend(v14, "setObject:forKey:", v7, v8);
      else
        objc_msgSend(v14, "removeObjectForKey:", v8);
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (NSObject **)(a1 + 56);
        objc_storeStrong((id *)(a1 + 56), v15);
        v18 = *(_QWORD *)(a1 + 48);
        v25 = 0;
        v9 = objc_msgSend(v16, "writeToURL:options:error:", v18, 268435457, &v25);
        v19 = v25;
        PBFLogPosterContents();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((_DWORD)v9)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v22 = *(_QWORD *)(a1 + 128);
            *(_DWORD *)buf = 136315650;
            v27 = "-[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]";
            v28 = 2114;
            v29 = v22;
            v30 = 2114;
            v31 = v8;
            _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "%s> Updated provider info for '%{public}@' for key: %{public}@", buf, 0x20u);
          }

          v23 = v15;
          v21 = *v17;
          *v17 = v23;
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:].cold.1(a1, (uint64_t)v19, v21);
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deleteProviderInfo
{
  os_unfair_lock_s *p_accessLock;

  if (!self->_readonly)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_deleteProviderInfo]((uint64_t)self);
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (uint64_t)_accessLock_deleteProviderInfo
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 112), "getFlag");
    if ((result & 1) == 0 && !*(_BYTE *)(v1 + 124))
    {
      v2 = *(void **)(v1 + 56);
      *(_QWORD *)(v1 + 56) = MEMORY[0x1E0C9AA70];

      return objc_msgSend(*(id *)(v1 + 104), "removeItemAtURL:error:", *(_QWORD *)(v1 + 48), 0);
    }
  }
  return result;
}

- (id)_accessLock_transientInternalInfo
{
  id *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v1 = a1;
  if (!a1)
    return v1;
  if ((objc_msgSend(a1[14], "getFlag") & 1) != 0)
    return (id *)0;
  v3 = v1[8];
  if (v3)
  {
LABEL_11:
    v1 = (id *)v3;
    return v1;
  }
  if (!objc_msgSend(v1[5], "checkResourceIsReachableAndReturnError:", 0))
  {
    v9 = v1[8];
    v1[8] = (id)MEMORY[0x1E0C9AA70];

    v3 = v1[8];
    goto LABEL_11;
  }
  objc_msgSend(v1[5], "pbf_setFileProtection:error:", *MEMORY[0x1E0C99940], 0);
  v4 = v1[5];
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 2, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v6)
  {
    PBFLogPosterContents();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo].cold.2();

    v8 = v1[8];
    v1[8] = (id)MEMORY[0x1E0C9AA70];
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v5, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB3710];
    extensionStoreCoordinatorSupportedArchivableClassesForInfoFiles();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v5, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v8 = v16;

    if (v8)
    {
      PBFLogPosterContents();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo].cold.1();

    }
    v14 = v1[8];
    v1[8] = (id)v12;

    goto LABEL_19;
  }
LABEL_20:
  v15 = v1[8];

  return (id *)v15;
}

- (uint64_t)_accessLock_bumpLastRefreshBuildVersion
{
  id v3;
  void *v4;
  uint64_t v5;

  if (!a1 || *(_BYTE *)(a1 + 124) || (objc_msgSend(*(id *)(a1 + 112), "getFlag") & 1) != 0)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0D016F8]);
  objc_msgSend(v3, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:](a1, v4, CFSTR("lastRefreshStashedBuildVersion"), 0);

  return v5;
}

- (uint64_t)_accessLock_writeTransientInternalInfo:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 124))
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        a1 = 0;
        *a3 = v6;
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1 + 112), "getFlag"))
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
LABEL_9:
      a1 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "writeToURL:options:error:", *(_QWORD *)(a1 + 40), 268435457, a3))
    {
      v9 = objc_msgSend(v5, "copy");
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = (void *)MEMORY[0x1E0C9AA70];
      objc_storeStrong((id *)(a1 + 64), v11);

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }

  }
LABEL_18:

  return a1;
}

+ (id)providerInfoURLForContainerURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("ProviderInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessLock_modelStoreCoordinatorsForType:(uint64_t)a1
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PBFPosterDescriptorStoreCoordinator *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  PBFStaticPosterDescriptorStoreCoordinator *v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  PBFPosterConfigurationStoreCoordinator *v58;
  uint64_t v59;
  void *v60;
  BOOL v61;
  uint64_t v62;
  int v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  const char *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id obj;
  id obja;
  id objb;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  switch(a2)
  {
    case 0:
      return MEMORY[0x1E0C9AA70];
    case 1:
      v5 = *(void **)(a1 + 72);
      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 104), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(a1 + 8), 0, 5, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_new();
        v8 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v7;

        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        obj = v6;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
        if (v9)
        {
          v11 = v9;
          v12 = *(_QWORD *)v87;
          v13 = 0x1E0CB3000uLL;
          *(_QWORD *)&v10 = 138543874;
          v69 = v10;
          do
          {
            v14 = 0;
            v72 = v11;
            do
            {
              if (*(_QWORD *)v87 != v12)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v14);
              objc_msgSend(v15, "lastPathComponent", v69);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 2600)), "initWithUUIDString:", v16);
              if (v17)
              {
                v18 = -[PBFPosterModelStoreCoordinator initWithProvider:identifierURL:posterUUID:readonly:]([PBFPosterDescriptorStoreCoordinator alloc], "initWithProvider:identifierURL:posterUUID:readonly:", *(_QWORD *)(a1 + 128), v15, v17, *(unsigned __int8 *)(a1 + 124));
                -[PBFPosterModelStoreCoordinator checkEnvironmentConsistency](v18, "checkEnvironmentConsistency");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v18)
                  v21 = v19 == 0;
                else
                  v21 = 0;
                if (v21)
                {
                  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v18, v17);
                }
                else
                {
                  v22 = v12;
                  v23 = *(unsigned __int8 *)(a1 + 124);
                  PBFLogReaper();
                  v24 = objc_claimAutoreleasedReturnValue();
                  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
                  if (v23)
                  {
                    if (v25)
                    {
                      *(_DWORD *)buf = v69;
                      v93 = v18;
                      v94 = 2114;
                      v95 = v20;
                      v96 = 2114;
                      v97 = v15;
                      _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Consistency error for descriptor store coordinator '%{public}@': %{public}@... readonly... skipping... %{public}@", buf, 0x20u);
                    }

                  }
                  else
                  {
                    if (v25)
                    {
                      *(_DWORD *)buf = v69;
                      v93 = v18;
                      v94 = 2114;
                      v95 = v20;
                      v96 = 2114;
                      v97 = v15;
                      _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Consistency error for descriptor store coordinator '%{public}@': %{public}@... deleting %{public}@", buf, 0x20u);
                    }

                    objc_msgSend(*(id *)(a1 + 104), "removeItemAtURL:error:", v15, 0);
                  }
                  v12 = v22;
                  v13 = 0x1E0CB3000;
                  v11 = v72;
                }

              }
              ++v14;
            }
            while (v11 != v14);
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
          }
          while (v11);
        }

        v5 = *(void **)(a1 + 72);
      }
      return v5;
    case 2:
      v5 = *(void **)(a1 + 80);
      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 104), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(a1 + 16), 0, 5, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_new();
        v28 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v27;

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        obja = v26;
        v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
        if (v29)
        {
          v31 = v29;
          v32 = *(_QWORD *)v83;
          v33 = 0x1E0CB3000uLL;
          *(_QWORD *)&v30 = 138543874;
          v70 = v30;
          do
          {
            v34 = 0;
            v73 = v31;
            do
            {
              if (*(_QWORD *)v83 != v32)
                objc_enumerationMutation(obja);
              v35 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v34);
              objc_msgSend(v35, "lastPathComponent", v70);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(objc_alloc(*(Class *)(v33 + 2600)), "initWithUUIDString:", v36);
              if (v37)
              {
                v38 = -[PBFPosterModelStoreCoordinator initWithProvider:identifierURL:posterUUID:readonly:]([PBFStaticPosterDescriptorStoreCoordinator alloc], "initWithProvider:identifierURL:posterUUID:readonly:", *(_QWORD *)(a1 + 128), v35, v37, *(unsigned __int8 *)(a1 + 124));
                -[PBFPosterModelStoreCoordinator checkEnvironmentConsistency](v38, "checkEnvironmentConsistency");
                v39 = objc_claimAutoreleasedReturnValue();
                v40 = (void *)v39;
                if (v38)
                  v41 = v39 == 0;
                else
                  v41 = 0;
                if (v41)
                {
                  objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v38, v37);
                }
                else
                {
                  v42 = v32;
                  v43 = *(unsigned __int8 *)(a1 + 124);
                  PBFLogReaper();
                  v44 = objc_claimAutoreleasedReturnValue();
                  v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
                  if (v43)
                  {
                    if (v45)
                    {
                      *(_DWORD *)buf = v70;
                      v93 = v38;
                      v94 = 2114;
                      v95 = v40;
                      v96 = 2114;
                      v97 = v35;
                      _os_log_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_DEFAULT, "Consistency error for static descriptor store coordinator '%{public}@': %{public}@... readonly... skipping... %{public}@", buf, 0x20u);
                    }

                  }
                  else
                  {
                    if (v45)
                    {
                      *(_DWORD *)buf = v70;
                      v93 = v38;
                      v94 = 2114;
                      v95 = v40;
                      v96 = 2114;
                      v97 = v35;
                      _os_log_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_DEFAULT, "Consistency error for static descriptor store coordinator '%{public}@': %{public}@... deleting %{public}@", buf, 0x20u);
                    }

                    objc_msgSend(*(id *)(a1 + 104), "removeItemAtURL:error:", v35, 0);
                  }
                  v32 = v42;
                  v33 = 0x1E0CB3000;
                  v31 = v73;
                }

              }
              ++v34;
            }
            while (v31 != v34);
            v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
          }
          while (v31);
        }

        v5 = *(void **)(a1 + 80);
      }
      return v5;
    case 3:
      if (*(_QWORD *)(a1 + 88))
        goto LABEL_76;
      objc_msgSend(*(id *)(a1 + 104), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(a1 + 24), 0, 5, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_opt_new();
      v48 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v47;

      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      objb = v46;
      v49 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      if (!v49)
        goto LABEL_75;
      v51 = v49;
      v52 = *(_QWORD *)v79;
      v53 = 0x1E0CB3000uLL;
      *(_QWORD *)&v50 = 138543874;
      v71 = v50;
      break;
    default:
      return 0;
  }
  do
  {
    v54 = 0;
    v74 = v51;
    do
    {
      if (*(_QWORD *)v79 != v52)
        objc_enumerationMutation(objb);
      v55 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v54);
      objc_msgSend(v55, "lastPathComponent", v71);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(objc_alloc(*(Class *)(v53 + 2600)), "initWithUUIDString:", v56);
      if (v57)
      {
        v58 = -[PBFPosterModelStoreCoordinator initWithProvider:identifierURL:posterUUID:readonly:]([PBFPosterConfigurationStoreCoordinator alloc], "initWithProvider:identifierURL:posterUUID:readonly:", *(_QWORD *)(a1 + 128), v55, v57, *(unsigned __int8 *)(a1 + 124));
        -[PBFPosterModelStoreCoordinator checkEnvironmentConsistency](v58, "checkEnvironmentConsistency");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        if (v58)
          v61 = v59 == 0;
        else
          v61 = 0;
        if (v61)
        {
          objc_msgSend(*(id *)(a1 + 88), "setObject:forKey:", v58, v57);
        }
        else
        {
          v62 = v52;
          v63 = *(unsigned __int8 *)(a1 + 124);
          PBFLogReaper();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
          if (v63)
          {
            if (v65)
            {
              *(_DWORD *)buf = v71;
              v93 = v58;
              v94 = 2114;
              v95 = v60;
              v96 = 2114;
              v97 = v55;
              v66 = v64;
              v67 = "Consistency error for configuration store coordinator '%{public}@': %{public}@... readonly... skippi"
                    "ng... %{public}@";
              goto LABEL_70;
            }
          }
          else if (v65)
          {
            *(_DWORD *)buf = v71;
            v93 = v58;
            v94 = 2114;
            v95 = v60;
            v96 = 2114;
            v97 = v55;
            v66 = v64;
            v67 = "Consistency error for configuration store coordinator '%{public}@': %{public}@... deleting %{public}@";
LABEL_70:
            _os_log_impl(&dword_1CB9FA000, v66, OS_LOG_TYPE_DEFAULT, v67, buf, 0x20u);
          }

          v52 = v62;
          v53 = 0x1E0CB3000;
          v51 = v74;
        }

      }
      ++v54;
    }
    while (v51 != v54);
    v51 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  }
  while (v51);
LABEL_75:

LABEL_76:
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v68 = (void *)objc_msgSend(*(id *)(a1 + 96), "mutableCopy");
    objc_msgSend(v68, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 88));
    return v68;
  }
  else
  {
    v5 = *(void **)(a1 + 88);
    return v5;
  }
}

void __83__PBFPosterExtensionStoreCoordinator__invalidateAndDeleteStoreCoordinatorsForType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "invalidate");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identifierURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeItemAtURL:error:", v6, 0);
}

- (id)_containerURLForType:(id *)a1
{
  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 2)
      return (id *)0;
    a1 = (id *)a1[a2];
  }
  return a1;
}

uint64_t __67__PBFPosterExtensionStoreCoordinator__accessLock_deleteEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_posterConfigurationStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_staticPosterDescriptorStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_posterDescriptorStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_transientInfo, 0);
  objc_storeStrong((id *)&self->_accessLock_providerInfo, 0);
  objc_storeStrong((id *)&self->_providerInfoURL, 0);
  objc_storeStrong((id *)&self->_transientInternalInfoURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_configurationContainerURL, 0);
  objc_storeStrong((id *)&self->_staticDescriptorsContainerURL, 0);
  objc_storeStrong((id *)&self->_descriptorsContainerURL, 0);
}

- (id)determineRefreshStateWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PBFDataRefreshState *v25;
  double v26;
  const __CFString *v27;
  PBFDataRefreshState *v28;
  uint64_t v29;
  PBFDataRefreshState *v30;
  uint64_t v31;
  PBFDataRefreshState *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id result;
  void *v39;
  void *v40;
  double v41;
  PBFDataRefreshState *v42;
  const __CFString *v43;
  PBFDataRefreshState *v44;
  PBFDataRefreshState *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;

  v4 = a3;
  objc_msgSend(v4, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("extension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "posterExtensionBundleIdentifier");
  v66 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("refreshStrategy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("refreshStrategy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    v12 = 2;
  }

  objc_msgSend(v7, "posterExtensionInfoPlist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pbf_refreshDescriptorsFrequency");

  objc_msgSend(v7, "posterExtensionInfoPlist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "pbf_supportsDynamicDescriptors"))
    v16 = objc_msgSend(v7, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0);
  else
    v16 = 0;
  v17 = v5;

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PBFDataComponentStaticDescriptors")))
  {
    objc_msgSend(v7, "posterExtensionInfoPlist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pbf_staticDescriptorIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      -[PBFPosterExtensionStoreCoordinator staticDescriptorStoreCoordinatorsWithError:](self, "staticDescriptorStoreCoordinatorsWithError:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36)
      {
        v30 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 1, CFSTR("data store mismatch w/ number of identifiers; an update is needed!"));
        v22 = (void *)v66;
        v17 = v5;
LABEL_35:

        return v30;
      }
    }
    -[PBFPosterExtensionStoreCoordinator providerInfoObjectForKey:](self, "providerInfoObjectForKey:", CFSTR("StaticPersistentIdentifier"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v66;
    if (!v21)
    {
      v30 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 1, CFSTR("No persistent identifier; an update is needed!"));
      v17 = v5;
LABEL_31:

      goto LABEL_35;
    }
    objc_msgSend(v7, "persistentIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _LSPersistentIdentifierCompare();
    v25 = [PBFDataRefreshState alloc];
    if (!v24)
    {
      _LSPersistentIdentifierGetDebugDescription();
      v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      _LSPersistentIdentifierGetDebugDescription();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v25, "initWithNeedsRefresh:reason:", 1, CFSTR("Static descriptors are not up to date; persistent identifier was different -- an updated is needed! (old %@ vs new %@)"),
              *(_QWORD *)&v26,
              v37);

      goto LABEL_29;
    }
    _LSPersistentIdentifierGetDebugDescription();
    v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v58 = v26;
    v27 = CFSTR("Static descriptors are up to date (%@)");
    v28 = v25;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PBFDataComponentDynamicDescriptors")))
  {
    -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorsWithError:](self, "dynamicDescriptorStoreCoordinatorsWithError:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v18, "count");
    if ((v16 & 1) != 0)
    {
      if (v12)
      {
        if (v14)
        {
          if (v12 == 3)
          {
            v32 = [PBFDataRefreshState alloc];
            v22 = (void *)v66;
            v59 = v66;
            v33 = CFSTR("(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshAlways; so that's what we'll do.");
LABEL_22:
            v34 = 1;
LABEL_34:
            v30 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v32, "initWithNeedsRefresh:reason:", v34, v33, v59, *(_QWORD *)&v61);
            goto LABEL_35;
          }
          v21 = objc_alloc_init(MEMORY[0x1E0D016F8]);
          -[PBFPosterExtensionStoreCoordinator lastRefreshStashedBuildVersion](self, "lastRefreshStashedBuildVersion");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if ((objc_msgSend(v21, "isEqual:", v23) & 1) != 0)
            {
              v65 = v21;
              -[PBFPosterExtensionStoreCoordinator lastRefreshDescriptorDate](self, "lastRefreshDescriptorDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v39)
              {
                *(_QWORD *)&v41 = v39;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              }
              v26 = v41;

              objc_msgSend(v4, "now");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "timeIntervalSinceDate:", *(_QWORD *)&v26);
              v48 = v47;

              if (v12 != 1)
              {
                objc_msgSend(v4, "component");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                PBFDefaultUpdateIntervalForDataComponent(v54);
                v56 = v55;

                v28 = [PBFDataRefreshState alloc];
                v21 = v65;
                v22 = (void *)v66;
                if (v48 > v56)
                {
                  v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v28, "initWithNeedsRefresh:reason:", 1, CFSTR("Dynamic descriptors have exceeded expiration interval '%f' by %f seconds; needs update"),
                          *(_QWORD *)&v56,
                          v48 - v56);
                  goto LABEL_13;
                }
                v58 = v56 - v48;
                v27 = CFSTR("Dynamic descriptors are up to date, update needed in %f seconds");
LABEL_12:
                v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v28, "initWithNeedsRefresh:reason:", 0, v27, *(_QWORD *)&v58, *(_QWORD *)&v61);
LABEL_13:
                v30 = (PBFDataRefreshState *)v29;
LABEL_29:
                v17 = v5;
LABEL_30:

                goto LABEL_31;
              }
              v21 = v65;
              v22 = (void *)v66;
              v17 = v5;
              if (v48 <= 28800.0)
                goto LABEL_60;
              if (v31)
              {
                if (v31 == 1)
                {
                  objc_msgSend(v18, "anyObject");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "pathOfLatestVersion");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v50)
                  {
                    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v50);
                    if (objc_msgSend(v51, "pbf_isInitialPosterDescriptor"))
                    {
                      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                      v64 = v51;
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v53 = objc_msgSend(*(id *)&v26, "isEqual:", v52);

                      v51 = v64;
                      if ((v53 & 1) != 0)
                      {
                        v30 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 1, CFSTR("(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; There are no descriptors && no attempt to refresh descriptors has occured within the last 8 hours, so an update is needed!"),
                                v66);

                        v22 = (void *)v66;
                        v17 = v5;
                        v21 = v65;
                        goto LABEL_30;
                      }
                    }

                    v21 = v65;
                  }

                  v22 = (void *)v66;
                  v17 = v5;
                }
LABEL_60:
                v45 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 0, CFSTR("(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; extension hosts %lu dynamic descriptors & last refresh date was %@; next sync needed in %f"),
                        v22,
                        v31,
                        *(_QWORD *)&v26,
                        v48 + -28800.0);
                goto LABEL_44;
              }
              v44 = [PBFDataRefreshState alloc];
              v60 = v66;
              v43 = CFSTR("(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; There are no descriptors && no attempt to refresh descriptors has occured within the last 8 hours, so an update is needed!");
LABEL_43:
              v45 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v44, "initWithNeedsRefresh:reason:", 1, v43, v60, *(_QWORD *)&v61, v62, v63);
LABEL_44:
              v30 = v45;
              goto LABEL_30;
            }
            v42 = [PBFDataRefreshState alloc];
            PBFDescriptorRefreshStrategyToString(v12);
            v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v62 = v23;
            v63 = v21;
            v22 = (void *)v66;
            v60 = v66;
            v61 = v26;
            v43 = CFSTR("(%@) refreshStrategy is %@; stashed build version (%@) does not match current build version (%@)");
          }
          else
          {
            v42 = [PBFDataRefreshState alloc];
            PBFDescriptorRefreshStrategyToString(v12);
            v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v61 = v26;
            v62 = v21;
            v22 = (void *)v66;
            v60 = v66;
            v43 = CFSTR("(%@) refreshStrategy is %@; however there is no stashedBuildVersion, so we should proceed (%@)");
          }
          v44 = v42;
          v17 = v5;
          goto LABEL_43;
        }
        v32 = [PBFDataRefreshState alloc];
        v22 = (void *)v66;
        v59 = v66;
        v33 = CFSTR("(%@) Extension requested no automatic updates ever");
      }
      else
      {
        v32 = [PBFDataRefreshState alloc];
        v22 = (void *)v66;
        v59 = v66;
        v33 = CFSTR("(%@) Refresh Strategy was PBFDescriptorRefreshStrategyRefreshNo; skipping all refresh checks.");
      }
    }
    else
    {
      v32 = [PBFDataRefreshState alloc];
      if (v31)
      {
        v22 = (void *)v66;
        v59 = v66;
        v61 = *(double *)&v31;
        v33 = CFSTR("(%@) Dynamic descriptors are not supported, but the data store has %lu; an updated is needed!");
        goto LABEL_22;
      }
      v22 = (void *)v66;
      v59 = v66;
      v61 = 0.0;
      v33 = CFSTR("(%@) Dynamic descriptors are not supported, but the data store has %lu - no update is needed.");
    }
    v34 = 0;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unhandled component: %@"), v5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionStoreCoordinator(PBFDataFreshnessStateAdditions) determineRefreshStateWithContext:].cold.1();
  objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)initWithContainerURL:extensionIdentifier:readonly:.cold.1()
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

- (void)initWithContainerURL:extensionIdentifier:readonly:.cold.2()
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

- (void)dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:.cold.1()
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

- (void)_accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)providerInfoSetObject:forKey:error:.cold.1()
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

- (void)providerInfoSetObject:forKey:error:.cold.2()
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

- (void)_accessLock_providerInfoSetObject:(uint64_t)a1 forKey:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 128);
  v4 = 136315650;
  v5 = "-[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]";
  v6 = 2114;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "%s> error archiving provider info: data could not be written for extension '%{public}@': %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)_accessLock_transientInternalInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error reading transient info: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

@end
