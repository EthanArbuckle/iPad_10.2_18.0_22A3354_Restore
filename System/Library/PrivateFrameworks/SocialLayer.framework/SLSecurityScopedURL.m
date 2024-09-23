@implementation SLSecurityScopedURL

- (SLSecurityScopedURL)initWithURL:(id)a3
{
  id v5;
  SLSecurityScopedURL *v6;
  SLSecurityScopedURL *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLSecurityScopedURL;
  v6 = -[SLSecurityScopedURL init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URL, a3);

  return v7;
}

- (SLSecurityScopedURL)initWithURL:(id)a3 extensionType:(int64_t)a4
{
  SLSecurityScopedURL *v5;
  SLSecurityScopedURL *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  NSString *sandboxExtensionClass;

  v5 = -[SLSecurityScopedURL initWithURL:](self, "initWithURL:", a3);
  v6 = v5;
  if (v5)
  {
    if (a4 == 1)
    {
      v5->_readonly = 0;
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (_QWORD *)MEMORY[0x1E0C80008];
      goto LABEL_6;
    }
    if (!a4)
    {
      v5->_readonly = 1;
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (_QWORD *)MEMORY[0x1E0C80000];
LABEL_6:
      objc_msgSend(v7, "stringWithUTF8String:", *v8);
      v9 = objc_claimAutoreleasedReturnValue();
      sandboxExtensionClass = v6->_sandboxExtensionClass;
      v6->_sandboxExtensionClass = (NSString *)v9;

    }
  }
  return v6;
}

- (SLSecurityScopedURL)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return -[SLSecurityScopedURL initWithURL:extensionType:](self, "initWithURL:extensionType:", a3, !a4);
}

- (SLSecurityScopedURL)init
{

  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p URL=%@ isReadonly=%d>"), objc_opt_class(), self, self->_URL, -[SLSecurityScopedURL isReadonly](self, "isReadonly"));
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  NSURL *URL;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  URL = self->_URL;
  -[SLSecurityScopedURL sandboxExtensionClass](self, "sandboxExtensionClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p URL=%@ sandboxExtensionClass=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>"), v4, self, URL, v6, v7, -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSURL)URL
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  id v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSURL *URL;
  int v12;
  NSURL *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

    if (!v5)
    {
      -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "UTF8String");
      -[SLSecurityScopedURL setSandboxExtensionHandle:](self, "setSandboxExtensionHandle:", sandbox_extension_consume());

      v7 = -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");
      SLFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SLSecurityScopedURL URL].cold.1(self);
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        URL = self->_URL;
        v12 = 138412290;
        v13 = URL;
        _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_INFO, "Successfully consumed sandbox extension for URL: %@", (uint8_t *)&v12, 0xCu);
      }

      -[SLSecurityScopedURL setSandboxExtensionToken:](self, "setSandboxExtensionToken:", 0);
    }
  }
  return self->_URL;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SLSecurityScopedURL isEqualToSandboxExtendedURL:](self, "isEqualToSandboxExtendedURL:", v4);

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;
  uint64_t v18;
  void *v19;
  int v20;

  v9 = a3;
  -[SLSecurityScopedURL URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v9, "URL"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SLSecurityScopedURL URL](self, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v9, "sandboxExtensionToken"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sandboxExtensionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      v12 = 0;
      goto LABEL_15;
    }
    v20 = v11;
    v14 = v5;
    v15 = 1;
  }
  else
  {
    v20 = v11;
    v14 = v5;
    v19 = 0;
    v15 = 0;
  }
  v16 = -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle", v19);
  v12 = v16 == objc_msgSend(v9, "sandboxExtensionHandle");
  if (v15)
  {
    v5 = v14;
    v11 = v20;
LABEL_15:

    if (v13)
      goto LABEL_16;
    goto LABEL_22;
  }
  v5 = v14;
  v11 = v20;
  if (v13)
  {
LABEL_16:

    if (!v11)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_22:

  if ((v11 & 1) != 0)
    goto LABEL_17;
LABEL_18:
  if (!v10)

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SLSecurityScopedURL URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLSecurityScopedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

  return v7;
}

- (id)_issueSandboxExtension
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  -[SLSecurityScopedURL sandboxExtensionClass](self, "sandboxExtensionClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    v7 = 0;
    return v7;
  }
  -[SLSecurityScopedURL sandboxExtensionClass](self, "sandboxExtensionClass");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  -[NSURL path](self->_URL, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "fileSystemRepresentation");
  v6 = (void *)sandbox_extension_issue_file();

  if (!v6)
  {
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SLSecurityScopedURL _issueSandboxExtension].cold.1(self);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLSecurityScopedURL)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SLSecurityScopedURL *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *sandboxExtensionToken;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isReadonly);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", v8);

  v10 = -[SLSecurityScopedURL initWithURL:readonly:](self, "initWithURL:readonly:", v7, v9);
  if (v10)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtensionToken);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v10->_sandboxExtensionToken;
    v10->_sandboxExtensionToken = (NSString *)v13;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  -[SLSecurityScopedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLSecurityScopedURL _issueSandboxExtension](self, "_issueSandboxExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sandboxExtensionToken);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[SLSecurityScopedURL isReadonly](self, "isReadonly");
  NSStringFromSelector(sel_isReadonly);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLSecurityScopedURL)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SLSecurityScopedURL *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *sandboxExtensionToken;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isReadonly);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", v8);

  v10 = -[SLSecurityScopedURL initWithURL:readonly:](self, "initWithURL:readonly:", v7, v9);
  if (v10)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtensionToken);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v10->_sandboxExtensionToken;
    v10->_sandboxExtensionToken = (NSString *)v13;

  }
  return v10;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  -[SLSecurityScopedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLSecurityScopedURL _issueSandboxExtension](self, "_issueSandboxExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sandboxExtensionToken);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[SLSecurityScopedURL isReadonly](self, "isReadonly");
  NSStringFromSelector(sel_isReadonly);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (NSString)sandboxExtensionClass
{
  return self->_sandboxExtensionClass;
}

- (void)setSandboxExtensionClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionClass, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)URL
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "sandboxExtensionToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sandboxExtensionHandle");
  OUTLINED_FUNCTION_0_0(&dword_199EFF000, v3, v4, "Unable to consume sandbox extension with token %@, received handle %lld", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)_issueSandboxExtension
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "sandboxExtensionClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_199EFF000, v3, v4, "Unable to issue sandbox extension of class %@ for URL %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_9();
}

@end
