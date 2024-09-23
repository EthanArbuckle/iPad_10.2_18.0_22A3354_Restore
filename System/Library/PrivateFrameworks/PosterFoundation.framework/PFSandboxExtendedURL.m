@implementation PFSandboxExtendedURL

+ (id)sandboxExtendedURLForURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  PFSandboxExtendedURL *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PFSandboxExtendedURL initWithURL:options:error:]([PFSandboxExtendedURL alloc], "initWithURL:options:error:", v7, v6, a5);

  return v8;
}

- (PFSandboxExtendedURL)initWithURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  id v8;
  PFSandboxExtendedURL *v9;
  uint64_t v10;
  BSAuditToken *sandboxExtensionAuditToken;
  uint64_t v12;
  NSURL *sandboxExtensionURL;
  PFSandboxExtendedURL *v14;
  objc_super v16;

  v8 = a3;
  if (objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", a5))
  {
    v16.receiver = self;
    v16.super_class = (Class)PFSandboxExtendedURL;
    v9 = -[PFSandboxExtendedURL init](&v16, sel_init);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE0BDB8], "tokenForCurrentProcess");
      v10 = objc_claimAutoreleasedReturnValue();
      sandboxExtensionAuditToken = v9->_sandboxExtensionAuditToken;
      v9->_sandboxExtensionAuditToken = (BSAuditToken *)v10;

      v12 = objc_msgSend(v8, "copy");
      sandboxExtensionURL = v9->_sandboxExtensionURL;
      v9->_sandboxExtensionURL = (NSURL *)v12;

      v9->_options = a4;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if ((self->_options & 2) != 0)
    -[PFSandboxExtendedURL invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PFSandboxExtendedURL;
  -[PFSandboxExtendedURL dealloc](&v3, sel_dealloc);
}

- (BOOL)isValid
{
  if (self->_sandboxExtensionAuditToken)
    return -[NSURL checkResourceIsReachableAndReturnError:](self->_sandboxExtensionURL, "checkResourceIsReachableAndReturnError:", 0);
  else
    return self->_sandboxExtensionHandle != -1;
}

- (void)invalidate
{
  int v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  v7 = *(_QWORD *)(a2 + 24);
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 2082;
  v10 = a1;
  v11 = 2114;
  v12 = v7;
  _os_log_error_impl(&dword_24462A000, a3, OS_LOG_TYPE_ERROR, "failed to release sandboxExtensionHandle with errno=%i (%{public}s) : %{public}@", (uint8_t *)v8, 0x1Cu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PFSandboxExtendedURL)initWithCoder:(id)a3
{
  id v4;
  PFSandboxExtendedURL *v5;
  PFSandboxExtendedURL *v6;
  uint64_t v7;
  NSURL *sandboxExtensionURL;
  void *v9;
  uint64_t v10;
  PFSandboxExtendedURL *v11;
  int *v13;
  NSObject *v14;
  int v15;
  objc_class *v16;
  void *v17;
  NSURL *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSURL *v29;
  char __strerrbuf[256];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PFSandboxExtendedURL;
  v5 = -[PFSandboxExtendedURL init](&v19, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  v5->_sandboxExtensionHandle = -1;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sandboxExtensionURL"));
  v7 = objc_claimAutoreleasedReturnValue();
  sandboxExtensionURL = v6->_sandboxExtensionURL;
  v6->_sandboxExtensionURL = (NSURL *)v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    v6->_options = 2;
LABEL_6:
    v11 = v6;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFF0], CFSTR("sandboxToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_string_get_string_ptr(v9);
  v10 = sandbox_extension_consume();
  v6->_sandboxExtensionHandle = v10;
  if (v10 != -1)
  {

    goto LABEL_5;
  }
  v13 = __error();
  strerror_r(*v13, __strerrbuf, 0x100uLL);
  PFLogPosterContents();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = *__error();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6->_sandboxExtensionURL;
    *(_DWORD *)buf = 138413314;
    v21 = v9;
    v22 = 1024;
    v23 = v15;
    v24 = 2082;
    v25 = __strerrbuf;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_24462A000, v14, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from coder with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);

  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  BSAuditToken *sandboxExtensionAuditToken;
  BSAuditToken *v7;
  const char *v8;
  char *v9;
  xpc_object_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_sandboxExtensionURL, CFSTR("_sandboxExtensionURL"));
    sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
    -[NSURL fileSystemRepresentation](self->_sandboxExtensionURL, "fileSystemRepresentation");
    if (sandboxExtensionAuditToken)
    {
      v7 = self->_sandboxExtensionAuditToken;
      if (v7)
        -[BSAuditToken realToken](v7, "realToken");
      v8 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      v8 = (const char *)sandbox_extension_issue_file();
    }
    v9 = (char *)v8;
    if (v8)
    {
      v10 = xpc_string_create(v8);
      free(v9);
      objc_msgSend(v5, "encodeXPCObject:forKey:", v10, CFSTR("sandboxToken"));

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p> can only be encoded by %@ rather than %@ : %@"), v13, self, v15, v17, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFSandboxExtendedURL encodeWithCoder:].cold.1(a2, (uint64_t)self, (uint64_t)v18);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PFSandboxExtendedURL)initWithBSXPCCoder:(id)a3
{
  id v4;
  PFSandboxExtendedURL *v5;
  PFSandboxExtendedURL *v6;
  uint64_t v7;
  NSURL *sandboxExtensionURL;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFSandboxExtendedURL;
  v5 = -[PFSandboxExtendedURL init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_sandboxExtensionHandle = -1;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sandboxExtensionURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionURL = v6->_sandboxExtensionURL;
    v6->_sandboxExtensionURL = (NSURL *)v7;

    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFF0], CFSTR("sandboxToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_string_get_string_ptr(v9);
    v6->_sandboxExtensionHandle = sandbox_extension_consume();
    v6->_options = 2;

  }
  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  BSAuditToken *sandboxExtensionAuditToken;
  BSAuditToken *v6;
  const char *v7;
  char *v8;
  xpc_object_t v9;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxExtensionURL, CFSTR("_sandboxExtensionURL"));
  sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
  -[NSURL fileSystemRepresentation](self->_sandboxExtensionURL, "fileSystemRepresentation");
  if (sandboxExtensionAuditToken)
  {
    v6 = self->_sandboxExtensionAuditToken;
    if (v6)
      -[BSAuditToken realToken](v6, "realToken");
    v7 = (const char *)sandbox_extension_issue_file_to_process();
  }
  else
  {
    v7 = (const char *)sandbox_extension_issue_file();
  }
  v8 = (char *)v7;
  if (v7)
  {
    v9 = xpc_string_create(v7);
    free(v8);
    objc_msgSend(v4, "encodeXPCObject:forKey:", v9, CFSTR("sandboxToken"));

  }
}

- (NSURL)URL
{
  return self->_sandboxExtensionURL;
}

- (unsigned)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionURL, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionAuditToken, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PFSandboxExtendedURL.m");
  v16 = 1024;
  v17 = 121;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
