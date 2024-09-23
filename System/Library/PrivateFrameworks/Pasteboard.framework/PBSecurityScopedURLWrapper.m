@implementation PBSecurityScopedURLWrapper

- (PBSecurityScopedURLWrapper)initWithFPItem:(id)a3
{
  id v5;
  PBSecurityScopedURLWrapper *v6;
  PBSecurityScopedURLWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBSecurityScopedURLWrapper;
  v6 = -[PBSecurityScopedURLWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fpItem, a3);
    *(_WORD *)&v7->_readonly = 257;
  }

  return v7;
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3
{
  return -[PBSecurityScopedURLWrapper initWithURL:readonly:](self, "initWithURL:readonly:", a3, 0);
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return -[PBSecurityScopedURLWrapper initWithURL:readonly:extensionClass:](self, "initWithURL:readonly:extensionClass:", a3, a4, 0);
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5
{
  return -[PBSecurityScopedURLWrapper initWithURL:issueExtension:readonly:extensionClass:](self, "initWithURL:issueExtension:readonly:extensionClass:", a3, 1, a4, a5);
}

- (PBSecurityScopedURLWrapper)initWithURLWithoutIssuingExtension:(id)a3
{
  return -[PBSecurityScopedURLWrapper initWithURL:issueExtension:readonly:extensionClass:](self, "initWithURL:issueExtension:readonly:extensionClass:", a3, 0, 1, 0);
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 issueExtension:(BOOL)a4 readonly:(BOOL)a5 extensionClass:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  PBSecurityScopedURLWrapper *v13;
  PBSecurityScopedURLWrapper *v14;
  void *v15;
  void *OnlySandboxExtensionTypeForURL;
  uint64_t v17;
  id v18;
  NSData *scope;
  NSObject *v20;
  id v22;
  id v23;
  int v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v7 = a5;
  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PBSecurityScopedURLWrapper;
  v13 = -[PBSecurityScopedURLWrapper init](&v26, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_15;
  objc_storeStrong((id *)&v13->_url, a3);
  v14->_readonly = v7;
  if (softLinkFPIsFileProviderBookmark((uint64_t)v11, 0))
  {
    v14->_backedByFileProvider = 1;
    goto LABEL_15;
  }
  if (!v8)
    goto LABEL_15;
  if (v12)
  {
    v15 = (void *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  }
  else
  {
    if (!v7)
    {
      v22 = v11;
      if (v22)
      {
        getpid();
        objc_msgSend(v22, "path");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v23, "fileSystemRepresentation");
        v24 = sandbox_check();

        if (v24)
          OnlySandboxExtensionTypeForURL = _bestReadOnlySandboxExtensionTypeForURL(v22);
        else
          OnlySandboxExtensionTypeForURL = (void *)*MEMORY[0x1E0C80008];
      }
      else
      {
        OnlySandboxExtensionTypeForURL = 0;
      }

      goto LABEL_10;
    }
    v15 = _bestReadOnlySandboxExtensionTypeForURL(v11);
  }
  OnlySandboxExtensionTypeForURL = v15;
LABEL_10:
  v25 = 0;
  _issueSandboxExtension(v11, (uint64_t)OnlySandboxExtensionTypeForURL, &v25);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v25;
  scope = v14->_scope;
  v14->_scope = (NSData *)v17;

  if (v18)
  {
    _PBLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_fault_impl(&dword_18C53A000, v20, OS_LOG_TYPE_FAULT, "Could not create sandbox extension. Error: %@", buf, 0xCu);
    }

  }
LABEL_15:

  return v14;
}

- (PBSecurityScopedURLWrapper)initWithNSURLWrapper:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PBSecurityScopedURLWrapper *v14;
  objc_super v16;

  v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PBSecurityScopedURLWrapper;
    v5 = -[PBSecurityScopedURLWrapper init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      v8 = (void *)*((_QWORD *)v5 + 3);
      *((_QWORD *)v5 + 3) = v7;

      *((_BYTE *)v5 + 16) = objc_msgSend(v4, "isReadonly");
      objc_msgSend(v4, "_scope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      v11 = (void *)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v10;

      objc_getAssociatedObject(v4, &kFPItemObjectKey);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v5 + 4);
      *((_QWORD *)v5 + 4) = v12;

      if (*((_QWORD *)v5 + 4))
        *((_BYTE *)v5 + 17) = 1;
      else
        *((_BYTE *)v5 + 17) = softLinkFPIsFileProviderBookmark(*((_QWORD *)v5 + 3), 0);
    }
    self = (PBSecurityScopedURLWrapper *)v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)nsURLWrapper
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (self->_fpItem)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3910]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("fpitem://"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithURL:readonly:", v4, 1);

    objc_setAssociatedObject(v5, &kFPItemObjectKey, self->_fpItem, (void *)0x301);
  }
  else
  {
    if (self->_scope || self->_backedByFileProvider)
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:scope:", self->_url, self->_readonly, self->_scope);
    else
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", self->_url, self->_readonly);
    v5 = (void *)v6;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBSecurityScopedURLWrapper;
  -[PBSecurityScopedURLWrapper description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("URL: %@\n"), self->_url);
  objc_msgSend(v4, "appendFormat:", CFSTR("Readonly: %d\n"), self->_readonly);
  objc_msgSend(v4, "appendFormat:", CFSTR("Has security scope: %d\n"), self->_scope != 0);
  objc_msgSend(v4, "appendFormat:", CFSTR("Is backed by FP: %d\n"), self->_backedByFileProvider);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  FPItem *fpItem;
  NSURL *url;
  NSData *scope;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_readonly, CFSTR("readonly"));
  if (!self->_backedByFileProvider)
  {
    url = self->_url;
    if (url)
      objc_msgSend(v4, "encodeObject:forKey:", url, CFSTR("url"));
    scope = self->_scope;
    if (scope)
      objc_msgSend(v4, "encodeObject:forKey:", scope, CFSTR("scope"));
    -[PBSecurityScopedURLWrapper url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)_CFURLPromiseCopyPhysicalURL();

    if (v9)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("promiseURL"));
      v10 = (void *)MEMORY[0x18D782B20](v9);
      if (v10
        || (_issueSandboxExtension(v9, *MEMORY[0x1E0C80008], 0),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("promiseScope"));

      }
    }
    goto LABEL_18;
  }
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isFileProviderFile"));
  fpItem = self->_fpItem;
  if (!fpItem)
  {
    cf = 0;
    v9 = (void *)((uint64_t (*)(uint64_t, uint64_t))softLinkFPCreateBookmarkableStringFromDocumentURL[0])((uint64_t)self->_url, (uint64_t)&cf);
    if (cf)
    {
      _PBLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = cf;
        _os_log_fault_impl(&dword_18C53A000, v11, OS_LOG_TYPE_FAULT, "Could not create bookmarkable string from file provider URL. Error: %@", buf, 0xCu);
      }

      CFRelease(cf);
    }
    if (v9)
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("bookmarkableString"));
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v4, "encodeObject:forKey:", fpItem, CFSTR("FPItem"));
LABEL_19:

}

- (PBSecurityScopedURLWrapper)initWithCoder:(id)a3
{
  id v4;
  PBSecurityScopedURLWrapper *v5;
  int v6;
  uint64_t v7;
  FPItem *fpItem;
  uint64_t v9;
  void *v10;
  NSURL *v11;
  NSURL *v12;
  NSObject *v13;
  uint64_t v14;
  NSURL *url;
  uint64_t v16;
  NSData *scope;
  void *v18;
  CFTypeRef cf;
  objc_super v21;
  uint8_t buf[4];
  CFTypeRef v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PBSecurityScopedURLWrapper;
  v5 = -[PBSecurityScopedURLWrapper init](&v21, sel_init);
  if (v5)
  {
    v5->_readonly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("readonly"));
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFileProviderFile"));
    v5->_backedByFileProvider = v6;
    if (!v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
      v14 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scope"));
      v16 = objc_claimAutoreleasedReturnValue();
      scope = v5->_scope;
      v5->_scope = (NSData *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promiseURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promiseScope"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5->_url)
      {
        if (v5->_scope)
          MEMORY[0x18D782B14]();
        if (v10 && v18)
          MEMORY[0x18D782B14](v10, v18);
        _CFURLPromiseSetPhysicalURL();
      }

      goto LABEL_17;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FPItem"));
    v7 = objc_claimAutoreleasedReturnValue();
    fpItem = v5->_fpItem;
    v5->_fpItem = (FPItem *)v7;

    if (!v5->_fpItem)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkableString"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        cf = 0;
        ((void (*)(uint64_t, uint64_t))softLinkFPCreateDocumentURLFromBookmarkableString[0])(v9, (uint64_t)&cf);
        v11 = v5->_url;
        v5->_url = v12;

        if (cf)
        {
          _PBLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = cf;
            _os_log_fault_impl(&dword_18C53A000, v13, OS_LOG_TYPE_FAULT, "Could not resolve file provider-backed URL. Error: %@", buf, 0xCu);
          }

          CFRelease(cf);
        }
      }
LABEL_17:

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isBackedByFileProvider
{
  return self->_backedByFileProvider;
}

- (FPItem)fpItem
{
  return self->_fpItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpItem, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end
