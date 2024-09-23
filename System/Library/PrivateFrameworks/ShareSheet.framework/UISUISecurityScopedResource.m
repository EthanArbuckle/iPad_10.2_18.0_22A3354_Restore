@implementation UISUISecurityScopedResource

+ (id)scopedResourceWithAbsolutePath:(id)a3 allowedAccess:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "isAbsolutePath"))
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    canonicalPathForPath(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "scopedResourceWithFileURL:allowedAccess:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)scopedResourceWithFileURL:(id)a3 allowedAccess:(int64_t)a4
{
  id v6;
  void *v7;
  Class FPSandboxingURLWrapperClass;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "isFileURL"))
    goto LABEL_5;
  if (!a4)
    goto LABEL_9;
  if (!objc_msgSend(a1, "_isValidURLForIssuingSandboxExtension:", v6))
  {
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring URL %{public}@ for sandbox purposes since the corresponding file doesn't exist", (uint8_t *)&v14, 0xCu);
    }

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "_sandboxExtensionClassForAllowedAccess:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  v9 = objc_retainAutorelease(v7);
  -[objc_class wrapperWithURL:extensionClass:error:](FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v6, objc_msgSend(v9, "UTF8String"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_10:
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAbsoluteURL:sandboxExtensionWrapper:allowedAccess:", v6, v10, a4);

    goto LABEL_11;
  }
LABEL_5:
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)sandboxingURLWrapperWithFileURL:(id)a3 allowedAccess:(int64_t)a4
{
  void *v4;
  void *v5;

  +[UISUISecurityScopedResource scopedResourceWithFileURL:allowedAccess:](UISUISecurityScopedResource, "scopedResourceWithFileURL:allowedAccess:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sandboxExtensionWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)scopedResourceWithURL:(id)a3 allowedAccess:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(a1, "scopedResourceWithFileURL:allowedAccess:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAbsoluteURL:sandboxExtensionWrapper:allowedAccess:", v6, 0, a4);
  }
  v8 = (void *)v7;

  return v8;
}

- (UISUISecurityScopedResource)initWithAbsoluteURL:(id)a3 sandboxExtensionWrapper:(id)a4 allowedAccess:(int64_t)a5
{
  id v8;
  id v9;
  UISUISecurityScopedResource *v10;
  uint64_t v11;
  NSURL *url;
  uint64_t v13;
  NSURL *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISUISecurityScopedResource;
  v10 = -[UISUISecurityScopedResource init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    objc_storeStrong((id *)&v10->_sandboxExtensionWrapper, a4);
    v10->_allowedAccess = a5;
    if (v10->_sandboxExtensionWrapper)
    {
      objc_msgSend(v9, "url");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v10->_url;
      v10->_url = (NSURL *)v13;

    }
  }

  return v10;
}

- (BOOL)isContentManaged
{
  return -[NSURL ui_isContentManaged](self->_url, "ui_isContentManaged");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUISecurityScopedResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UISUISecurityScopedResource *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (FileProviderLibrary_sOnce != -1)
    dispatch_once(&FileProviderLibrary_sOnce, &__block_literal_global_19);
  getFPSandboxingURLWrapperClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityScopedData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedAccess"));
  objc_msgSend(v5, "ui_setIsContentManaged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContentManaged")));
  v8 = -[UISUISecurityScopedResource initWithAbsoluteURL:sandboxExtensionWrapper:allowedAccess:](self, "initWithAbsoluteURL:sandboxExtensionWrapper:allowedAccess:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UISUISecurityScopedResource url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("url"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_sandboxExtensionWrapper, CFSTR("securityScopedData"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UISUISecurityScopedResource allowedAccess](self, "allowedAccess"), CFSTR("allowedAccess"));
  objc_msgSend(v5, "encodeBool:forKey:", -[UISUISecurityScopedResource isContentManaged](self, "isContentManaged"), CFSTR("isContentManaged"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UISUISecurityScopedResource url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sandboxExtensionClassForAllowedAccess:", -[UISUISecurityScopedResource allowedAccess](self, "allowedAccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UISUISecurityScopedResource hasActiveAccessAssertion](self, "hasActiveAccessAssertion");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> path = %@, allowedAccess = %@, accessActive = %@"), v4, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)startAccessing
{
  void *v3;

  if (!-[UISUISecurityScopedResource hasActiveAccessAssertion](self, "hasActiveAccessAssertion"))
  {
    -[UISUISecurityScopedResource url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUISecurityScopedResource setHasActiveAccessAssertion:](self, "setHasActiveAccessAssertion:", objc_msgSend(v3, "startAccessingSecurityScopedResource"));

  }
  return -[UISUISecurityScopedResource hasActiveAccessAssertion](self, "hasActiveAccessAssertion");
}

- (void)stopAccessing
{
  id v3;

  if (-[UISUISecurityScopedResource hasActiveAccessAssertion](self, "hasActiveAccessAssertion"))
  {
    -[UISUISecurityScopedResource setHasActiveAccessAssertion:](self, "setHasActiveAccessAssertion:", 0);
    -[UISUISecurityScopedResource url](self, "url");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
}

+ (id)readonlySandboxExtensionClassString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80000]);
}

+ (id)readwriteSandboxExtensionClassString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80008]);
}

- (BOOL)_isEqualAccessToSecurityScopedResource:(id)a3
{
  id v4;
  NSURL *url;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  url = self->_url;
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSURL isEqual:](url, "isEqual:", v6))
  {
    objc_msgSend((id)objc_opt_class(), "_sandboxExtensionClassForAllowedAccess:", self->_allowedAccess);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_sandboxExtensionClassForAllowedAccess:", objc_msgSend(v4, "allowedAccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_isValidURLForIssuingSandboxExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)_CFURLPromiseCopyPhysicalURL();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)_sandboxExtensionClassForAllowedAccess:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    objc_msgSend(a1, "readwriteSandboxExtensionClassString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(a1, "readonlySandboxExtensionClassString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)uniquedSecurityScopedResources:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke;
  v20[3] = &unk_1E4002BF0;
  v6 = v5;
  v21 = v6;
  v7 = v4;
  v22 = v7;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AE9514](v20);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v11);
  }

  v14 = v7;
  return v14;
}

void __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke_2;
  v13[3] = &unk_1E4002BC8;
  v12 = v3;
  v14 = v12;
  if (objc_msgSend(v9, "indexOfObjectPassingTest:", v13) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }

}

uint64_t __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isEqualAccessToSecurityScopedResource:", a2);
}

+ (id)_scopedResourcesForAncestorsOfItemWithAbsolutePath:(id)a3 traversalStopPaths:(id)a4 allowedAccess:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isAbsolutePath"))
  {
    canonicalPathForPath(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v8;
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          canonicalPathForPath(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "addObject:", CFSTR("/"));
    objc_msgSend(v12, "addObject:", &stru_1E4004990);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v8 = v23;
      while ((objc_msgSend(v12, "containsObject:", v10) & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "scopedResourceWithAbsolutePath:allowedAccess:", v10, a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v19, "insertObject:atIndex:", v20, 0);
        objc_msgSend(v10, "stringByDeletingLastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v21;
        if (!objc_msgSend(v21, "length"))
          goto LABEL_19;
      }
      v21 = v10;
    }
    else
    {
      v21 = v10;
      v8 = v23;
    }
LABEL_19:

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)allowedAccess
{
  return self->_allowedAccess;
}

- (void)setAllowedAccess:(int64_t)a3
{
  self->_allowedAccess = a3;
}

- (FPSandboxingURLWrapper)sandboxExtensionWrapper
{
  return self->_sandboxExtensionWrapper;
}

- (void)setSandboxExtensionWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionWrapper, a3);
}

- (BOOL)hasActiveAccessAssertion
{
  return self->_hasActiveAccessAssertion;
}

- (void)setHasActiveAccessAssertion:(BOOL)a3
{
  self->_hasActiveAccessAssertion = a3;
}

- (int64_t)underlyingSandboxAssertionHandle
{
  return self->_underlyingSandboxAssertionHandle;
}

- (void)setUnderlyingSandboxAssertionHandle:(int64_t)a3
{
  self->_underlyingSandboxAssertionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
