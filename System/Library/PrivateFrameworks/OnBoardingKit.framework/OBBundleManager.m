@implementation OBBundleManager

- (id)bundleWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBBundleManager bundlesWithIdentifiers:](self, "bundlesWithIdentifiers:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_sharedInstance;
}

- (id)_bundleWithIdentifier:(id)a3 usingSearchPath:(id)a4 includePlaceholder:(BOOL)a5 isLinkBundle:(BOOL)a6 isReplacementBundle:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if ((v8 || v7) && v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Placeholder bundles are only supported for regular bundles."), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  objc_msgSend(v13, "stringByAppendingPathComponent:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("bundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

  if (!v18)
  {
    if (v9)
    {
      if (os_variant_has_internal_ui())
      {
        objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("com.apple.onboarding.internalplaceholder"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingPathExtension:", CFSTR("bundle"));
        v26 = objc_claimAutoreleasedReturnValue();

        +[OBBundle bundleAtPath:placeholderIdentifier:](OBBundle, "bundleAtPath:placeholderIdentifier:", v26, v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v26;
        if (v27)
          goto LABEL_17;
      }
    }
    goto LABEL_14;
  }
  -[OBBundleManager _providersByBundleNames](self, "_providersByBundleNames");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = v22;

    _OBLoggingFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412290;
      v33 = v23;
      _os_log_impl(&dword_199FE5000, v24, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Using bundle path %@", (uint8_t *)&v32, 0xCu);
    }

    v16 = v23;
  }
  else
  {
    v23 = v16;
  }
  +[OBBundle bundleAtPath:isLinkBundle:isReplacementBundle:](OBBundle, "bundleAtPath:isLinkBundle:isReplacementBundle:", v23, v8, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
LABEL_14:
    _OBLoggingFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412802;
      v33 = v12;
      v34 = 2112;
      v35 = v30;
      v36 = 2112;
      v37 = v14;
      _os_log_error_impl(&dword_199FE5000, v28, OS_LOG_TYPE_ERROR, "Failed to create bundle with identifier %@ including placeholder %@ using search path %@", (uint8_t *)&v32, 0x20u);

    }
    v27 = 0;
  }
LABEL_17:

  return v27;
}

- (id)_providersByBundleNames
{
  return 0;
}

- (id)_bundlesInSearchPath:(id)a3 withBundleCreationBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;

  if (v9)
  {
    _OBLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v11;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_199FE5000, v10, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Failed to get contents of %@ directory: %@", buf, 0x16u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (objc_msgSend(v8, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v8;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v23 = 0;
      v24 = v8;
      v25 = v5;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v16, "pathExtension", v23, v24, v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lowercaseString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("bundle"));

          if (v19)
          {
            objc_msgSend(v16, "stringByDeletingPathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v21);

          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
      v8 = v24;
      v5 = v25;
      v9 = v23;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v26;
}

uint64_t __40__OBBundleManager_allReplacementBundles__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:", a2, *(_QWORD *)(a1 + 40), 0, 0, 1);
}

- (id)bundlesWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OBBundleManager allReplacementBundles](self, "allReplacementBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v9);
  }

  v26 = v7;
  -[OBBundleManager _subarrayHavingPreconditionSatisfiedOfReplacementBundles:](self, "_subarrayHavingPreconditionSatisfiedOfReplacementBundles:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v6, "containsObject:", v18, v25))
        {
          _OBLoggingFacility();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v18;
            _os_log_impl(&dword_199FE5000, v19, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Client directly requested placeholder bundle %@", buf, 0xCu);
          }

          -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("ReplacementBundles"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBBundleManager _bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:](self, "_bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:", v18, v21, 0, 0, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            goto LABEL_18;
        }
        -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBBundleManager _bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:](self, "_bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:", v18, v23, 1, 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
LABEL_18:
          objc_msgSend(v13, "addObject:", v22);

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v25, "count"))
    -[OBBundleManager _modifyBundles:asNecessaryWithReplacementBundles:](self, "_modifyBundles:asNecessaryWithReplacementBundles:", v13, v25);

  return v13;
}

- (id)_bundleSearchPath
{
  void *v3;
  __CFString *v4;

  -[OBBundleManager overrideBundleSearchPath](self, "overrideBundleSearchPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBBundleManager overrideBundleSearchPath](self, "overrideBundleSearchPath");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("/System/Library/OnBoardingBundles");
  }
  return v4;
}

- (NSString)overrideBundleSearchPath
{
  return self->_overrideBundleSearchPath;
}

- (id)allReplacementBundles
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ReplacementBundles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__OBBundleManager_allReplacementBundles__block_invoke;
  v8[3] = &unk_1E37AAA88;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[OBBundleManager _bundlesInSearchPath:withBundleCreationBlock:](self, "_bundlesInSearchPath:withBundleCreationBlock:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_subarrayHavingPreconditionSatisfiedOfReplacementBundles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[OBBundleManager _isPreconditionSatisfiedForReplacementBundle:](self, "_isPreconditionSatisfiedForReplacementBundle:", v11, (_QWORD)v13))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_isPreconditionSatisfiedForReplacementBundle:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "replacementPreconditionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("chlorine"));

  if (!v5)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replacementPreconditionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Replacement bundle %@ has unsupported precondition %@"), v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "eligibleForChlorine");

  return v7;
}

void __32__OBBundleManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v0;

}

- (id)allBundles
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = (id)objc_opt_new();
  -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v27 = (void *)v3;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;

  if (v6)
  {
    _OBLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      v8 = "OBPrivacy: Error getting bundles list: %@";
      v9 = v7;
      v10 = 12;
LABEL_4:
      _os_log_impl(&dword_199FE5000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
    {
      _OBLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v8 = "OBPrivacy: No bundles";
      v9 = v7;
      v10 = 2;
      goto LABEL_4;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v5;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = v11;
      v25 = v5;
      v26 = 0;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "pathExtension", v25, v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("bundle"));

          if (v18)
          {
            -[OBBundleManager _providersByBundleNames](self, "_providersByBundleNames");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              _OBLoggingFacility();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v21;
                _os_log_impl(&dword_199FE5000, v22, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Using bundle path %@", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v27, "stringByAppendingPathComponent:", v15);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v23);

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
      v5 = v25;
      v6 = v26;
    }
  }
LABEL_23:

  return v28;
}

- (id)_allPrivacyBundles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[OBBundleManager allBundles](self, "allBundles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = objc_msgSend(v3, "count");
  if (v4 - 1 >= 0)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", --v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "privacyFlow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        objc_msgSend(v3, "removeObjectAtIndex:", v5);

    }
    while (v5 > 0);
  }
  return v3;
}

- (id)orderedPrivacyBundles
{
  return -[OBBundleManager orderedPrivacyBundlesWithInclusionOptions:](self, "orderedPrivacyBundlesWithInclusionOptions:", 3);
}

- (id)orderedPrivacyBundlesWithInclusionOptions:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  -[OBBundleManager _allPrivacyBundles](self, "_allPrivacyBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 2) == 0)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 - 1 >= 0)
    {
      v8 = v7;
      while (1)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", --v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.onboarding.privacypane")))
          break;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.onboarding.privacypanemini"));

        if (v12)
          goto LABEL_7;
LABEL_8:

        if (v8 <= 0)
          goto LABEL_9;
      }

LABEL_7:
      objc_msgSend(v6, "removeObjectAtIndex:", v8);
      goto LABEL_8;
    }
  }
LABEL_9:
  if ((v3 & 0x10) == 0)
  {
    if ((v3 & 4) == 0)
      goto LABEL_11;
LABEL_14:
    -[OBBundleManager allReplacementBundles](self, "allReplacementBundles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v14);

    if ((v3 & 8) == 0)
      goto LABEL_18;
    goto LABEL_15;
  }
  -[OBBundleManager _allLinkBundles](self, "_allLinkBundles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v13);

  if ((v3 & 4) != 0)
    goto LABEL_14;
LABEL_11:
  if ((v3 & 8) == 0)
    goto LABEL_18;
LABEL_15:
  -[OBBundleManager allReplacementBundles](self, "allReplacementBundles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBundleManager _subarrayHavingPreconditionSatisfiedOfReplacementBundles:](self, "_subarrayHavingPreconditionSatisfiedOfReplacementBundles:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
    -[OBBundleManager _modifyBundles:asNecessaryWithReplacementBundles:](self, "_modifyBundles:asNecessaryWithReplacementBundles:", v6, v16);

LABEL_18:
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_12);
  return v6;
}

uint64_t __61__OBBundleManager_orderedPrivacyBundlesWithInclusionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "privacyFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedShortTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "privacyFlow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedShortTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "localizedCompare:", v12);
  return v13;
}

- (id)privacyLinkBundleForBundles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "name", (_QWORD)v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBBundle identifierWithName:](OBBundle, "identifierWithName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("LinkBundles"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBBundleManager _bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:](self, "_bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:", v15, v17, 0, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v20;

  }
  return v5;
}

uint64_t __47__OBBundleManager_privacyLinkBundleForBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

- (id)_allLinkBundles
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  -[OBBundleManager _bundleSearchPath](self, "_bundleSearchPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("LinkBundles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__OBBundleManager__allLinkBundles__block_invoke;
  v8[3] = &unk_1E37AAA88;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[OBBundleManager _bundlesInSearchPath:withBundleCreationBlock:](self, "_bundlesInSearchPath:withBundleCreationBlock:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __34__OBBundleManager__allLinkBundles__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bundleWithIdentifier:usingSearchPath:includePlaceholder:isLinkBundle:isReplacementBundle:", a2, *(_QWORD *)(a1 + 40), 0, 1, 0);
}

- (void)_modifyBundles:(id)a3 asNecessaryWithReplacementBundles:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t m;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v74 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v9);
  }

  v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v45 = v6;
  v13 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v70 != v15)
          objc_enumerationMutation(v45);
        v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v17, "replaceeIdentifierSetsCache");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v66;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v66 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
              if (objc_msgSend(v23, "isSubsetOfSet:", v7))
              {
                objc_msgSend(v51, "unionSet:", v23);
                objc_msgSend(v52, "addObject:", v17);
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
          }
          while (v20);
        }

      }
      v14 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v52, "count"))
  {
    v24 = (void *)objc_msgSend(obj, "copy");
    objc_msgSend(obj, "removeAllObjects");
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v44 = v24;
    v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v62;
      v42 = *(_QWORD *)v62;
      do
      {
        v28 = 0;
        v43 = v26;
        do
        {
          if (*(_QWORD *)v62 != v27)
            objc_enumerationMutation(v44);
          v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v28);
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v51, "containsObject:", v30);

          if ((v31 & 1) != 0)
          {
            v46 = v28;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v47 = (id)objc_msgSend(v52, "copy");
            v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
            if (v50)
            {
              v49 = *(_QWORD *)v58;
              do
              {
                for (m = 0; m != v50; ++m)
                {
                  if (*(_QWORD *)v58 != v49)
                    objc_enumerationMutation(v47);
                  v33 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * m);
                  v53 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v56 = 0u;
                  objc_msgSend(v33, "replaceeIdentifierSetsCache");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
                  if (v35)
                  {
                    v36 = v35;
                    v37 = *(_QWORD *)v54;
                    do
                    {
                      for (n = 0; n != v36; ++n)
                      {
                        if (*(_QWORD *)v54 != v37)
                          objc_enumerationMutation(v34);
                        v39 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * n);
                        objc_msgSend(v29, "identifier");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v39, "containsObject:", v40))
                        {
                          v41 = objc_msgSend(v39, "isSubsetOfSet:", v7);

                          if (v41)
                          {
                            objc_msgSend(obj, "addObject:", v33);
                            objc_msgSend(v52, "removeObject:", v33);
                            goto LABEL_47;
                          }
                        }
                        else
                        {

                        }
                      }
                      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
                    }
                    while (v36);
                  }
LABEL_47:

                }
                v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
              }
              while (v50);
            }

            v27 = v42;
            v26 = v43;
            v28 = v46;
          }
          else
          {
            objc_msgSend(obj, "addObject:", v29);
          }
          ++v28;
        }
        while (v28 != v26);
        v26 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
      }
      while (v26);
    }

  }
}

- (void)setOverrideBundleSearchPath:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBundleSearchPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBundleSearchPath, 0);
}

@end
