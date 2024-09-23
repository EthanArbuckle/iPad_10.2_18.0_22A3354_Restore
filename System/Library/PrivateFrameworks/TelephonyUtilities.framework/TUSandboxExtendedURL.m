@implementation TUSandboxExtendedURL

- (TUSandboxExtendedURL)initWithURL:(id)a3
{
  id v5;
  TUSandboxExtendedURL *v6;
  TUSandboxExtendedURL *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUSandboxExtendedURL;
  v6 = -[TUSandboxExtendedURL init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URL, a3);

  return v7;
}

- (TUSandboxExtendedURL)initWithURL:(id)a3 withExtensionType:(int64_t)a4
{
  TUSandboxExtendedURL *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  NSString *sandboxExtensionClass;

  v5 = -[TUSandboxExtendedURL initWithURL:](self, "initWithURL:", a3);
  if (v5)
  {
    if (a4 == 1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (_QWORD *)MEMORY[0x1E0C80008];
      goto LABEL_6;
    }
    if (!a4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (_QWORD *)MEMORY[0x1E0C80000];
LABEL_6:
      objc_msgSend(v6, "stringWithUTF8String:", *v7);
      v8 = objc_claimAutoreleasedReturnValue();
      sandboxExtensionClass = v5->_sandboxExtensionClass;
      v5->_sandboxExtensionClass = (NSString *)v8;

    }
  }
  return v5;
}

- (TUSandboxExtendedURL)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUSandboxExtendedURL.m"), 52, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUSandboxExtendedURL init]");

  return 0;
}

- (void)dealloc
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "Releasing sandbox handle for URL: %@", (uint8_t *)&v3, 0xCu);
}

- (id)description
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
  -[TUSandboxExtendedURL sandboxExtensionClass](self, "sandboxExtensionClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p URL=%@ sandboxExtensionClass=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>"), v4, self, URL, v6, v7, -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[TUSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

    if (!v5)
    {
      -[TUSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "UTF8String");
      -[TUSandboxExtendedURL setSandboxExtensionHandle:](self, "setSandboxExtensionHandle:", sandbox_extension_consume());

      v7 = -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[TUSandboxExtendedURL URL].cold.1(self);
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        URL = self->_URL;
        v12 = 138412290;
        v13 = URL;
        _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Successfully consumed sandbox extension for URL %@", (uint8_t *)&v12, 0xCu);
      }

      -[TUSandboxExtendedURL setSandboxExtensionToken:](self, "setSandboxExtensionToken:", 0);
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
    && -[TUSandboxExtendedURL isEqualToSandboxExtendedURL:](self, "isEqualToSandboxExtendedURL:", v4);

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = a3;
  -[TUSandboxExtendedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sandboxExtensionToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");
      v10 = v9 == objc_msgSend(v4, "sandboxExtensionHandle");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[TUSandboxExtendedURL URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSandboxExtendedURL)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUSandboxExtendedURL *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *sandboxExtensionToken;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TUSandboxExtendedURL initWithURL:](self, "initWithURL:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtensionToken);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v8->_sandboxExtensionToken;
    v8->_sandboxExtensionToken = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  -[TUSandboxExtendedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUSandboxExtendedURL sandboxExtensionClass](self, "sandboxExtensionClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[TUSandboxExtendedURL pid](self, "pid");
    -[TUSandboxExtendedURL sandboxExtensionClass](self, "sandboxExtensionClass");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    -[TUSandboxExtendedURL URL](self, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "fileSystemRepresentation");
    if (v8)
    {
      -[TUSandboxExtendedURL pid](self, "pid");
      v12 = sandbox_extension_issue_file_to_process_by_pid();
    }
    else
    {
      v12 = sandbox_extension_issue_file();
    }
    v13 = (void *)v12;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_sandboxExtensionToken);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v14, v15);

      free(v13);
    }
    else
    {
      TUDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[TUSandboxExtendedURL encodeWithCoder:].cold.1(self);

    }
  }

}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
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
  OUTLINED_FUNCTION_0_5(&dword_19A50D000, v3, v4, "Unable to consume sandbox extension with token %@, received handle %lld", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_1();
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_5(&dword_19A50D000, v3, v4, "Unable to issue sandbox extension of class %@ for URL %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_1();
}

@end
