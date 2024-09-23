@implementation PRSPosterUpdateSessionInfo

- (PRSPosterUpdateSessionInfo)init
{
  PRSPosterUpdateSessionInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateSessionInfo;
  result = -[PRSPosterUpdateSessionInfo init](&v3, sel_init);
  if (result)
    result->_shortcutsWallpaperConfigurationSandboxHandle = -1;
  return result;
}

- (BOOL)isEmpty
{
  return !self->_identifier && !self->_shortcutsWallpaperConfiguration && self->_userInfo == 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_shortcutsWallpaperConfigurationSandboxHandle != -1)
  {
    sandbox_extension_release();
    self->_shortcutsWallpaperConfigurationSandboxHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateSessionInfo;
  -[PRSPosterUpdateSessionInfo dealloc](&v3, sel_dealloc);
}

- (void)setUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *userInfo;
  id v6;

  v6 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_userInfo, "isEqualToDictionary:"))
  {
    _validateUserInfo(v6);
    v4 = (NSDictionary *)objc_msgSend(v6, "copy");
    userInfo = self->_userInfo;
    self->_userInfo = v4;

  }
}

- (void)setShortcutsWallpaperConfiguration:(id)a3
{
  OS_xpc_object *shortcutsWallpaperConfigurationSandboxToken;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  OS_xpc_object *v10;
  OS_xpc_object *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((-[WFWallpaperConfiguration isEqual:](self->_shortcutsWallpaperConfiguration, "isEqual:") & 1) == 0)
  {
    shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
    self->_shortcutsWallpaperConfigurationSandboxToken = 0;

    objc_storeStrong((id *)&self->_shortcutsWallpaperConfiguration, a3);
    objc_msgSend(v13, "assetURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v13, "assetURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startAccessingSecurityScopedResource");

      objc_msgSend(v13, "assetURL");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "fileSystemRepresentation");
      v9 = (char *)sandbox_extension_issue_file();

      if (v9)
      {
        v10 = (OS_xpc_object *)xpc_string_create(v9);
        v11 = self->_shortcutsWallpaperConfigurationSandboxToken;
        self->_shortcutsWallpaperConfigurationSandboxToken = v10;

        free(v9);
      }
      objc_msgSend(v13, "assetURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopAccessingSecurityScopedResource");

    }
  }

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  OS_xpc_object *shortcutsWallpaperConfigurationSandboxToken;
  NSDictionary *userInfo;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("i"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_shortcutsWallpaperConfiguration, CFSTR("wc"));
  shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
  if (shortcutsWallpaperConfigurationSandboxToken)
    objc_msgSend(v7, "encodeXPCObject:forKey:", shortcutsWallpaperConfigurationSandboxToken, CFSTR("wcse"));
  userInfo = self->_userInfo;
  if (userInfo)
  {
    PRSXPCDictionaryFromDictionary(userInfo);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeXPCObject:forKey:", v6, CFSTR("ui"));

  }
}

- (PRSPosterUpdateSessionInfo)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSPosterUpdateSessionInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  WFWallpaperConfiguration *shortcutsWallpaperConfiguration;
  uint64_t v12;
  OS_xpc_object *shortcutsWallpaperConfigurationSandboxToken;
  OS_xpc_object *v14;
  uint64_t v15;
  int *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *userInfo;
  OS_xpc_object *v23;
  int v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  OS_xpc_object *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  char __strerrbuf[256];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PRSPosterUpdateSessionInfo;
  v5 = -[PRSPosterUpdateSessionInfo init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("i"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("wc"));
    v10 = objc_claimAutoreleasedReturnValue();
    shortcutsWallpaperConfiguration = v5->_shortcutsWallpaperConfiguration;
    v5->_shortcutsWallpaperConfiguration = (WFWallpaperConfiguration *)v10;

    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81390], CFSTR("wcse"));
    v12 = objc_claimAutoreleasedReturnValue();
    shortcutsWallpaperConfigurationSandboxToken = v5->_shortcutsWallpaperConfigurationSandboxToken;
    v5->_shortcutsWallpaperConfigurationSandboxToken = (OS_xpc_object *)v12;

    v5->_shortcutsWallpaperConfigurationSandboxHandle = -1;
    if (v5->_shortcutsWallpaperConfiguration)
    {
      v14 = v5->_shortcutsWallpaperConfigurationSandboxToken;
      if (v14)
      {
        xpc_string_get_string_ptr(v14);
        v15 = sandbox_extension_consume();
        v5->_shortcutsWallpaperConfigurationSandboxHandle = v15;
        if (v15 == -1)
        {
          v16 = __error();
          strerror_r(*v16, __strerrbuf, 0x100uLL);
          PRSLogPosterContents();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v23 = v5->_shortcutsWallpaperConfigurationSandboxToken;
            v24 = *__error();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWallpaperConfiguration assetURL](v5->_shortcutsWallpaperConfiguration, "assetURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v30 = v23;
            v31 = 1024;
            v32 = v24;
            v33 = 2082;
            v34 = __strerrbuf;
            v35 = 2114;
            v36 = v26;
            v37 = 2114;
            v38 = v27;
            _os_log_error_impl(&dword_1A4996000, v17, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);

          }
        }
      }
    }
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("ui"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      PRSDictionaryFromXPCObject(v18);
      v20 = objc_claimAutoreleasedReturnValue();
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v20;

      _validateUserInfo(v5->_userInfo);
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  OS_xpc_object *shortcutsWallpaperConfigurationSandboxToken;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("i"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_shortcutsWallpaperConfiguration, CFSTR("wc"));
  shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
  if (shortcutsWallpaperConfigurationSandboxToken)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(shortcutsWallpaperConfigurationSandboxToken));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("wcse"));

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_userInfo, CFSTR("ui"));

}

- (PRSPosterUpdateSessionInfo)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateSessionInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  WFWallpaperConfiguration *shortcutsWallpaperConfiguration;
  void *v12;
  void *v13;
  id v14;
  OS_xpc_object *v15;
  OS_xpc_object *shortcutsWallpaperConfigurationSandboxToken;
  uint64_t v17;
  int *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *userInfo;
  OS_xpc_object *v27;
  int v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  OS_xpc_object *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  char __strerrbuf[256];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PRSPosterUpdateSessionInfo;
  v5 = -[PRSPosterUpdateSessionInfo init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("wc"));
    v10 = objc_claimAutoreleasedReturnValue();
    shortcutsWallpaperConfiguration = v5->_shortcutsWallpaperConfiguration;
    v5->_shortcutsWallpaperConfiguration = (WFWallpaperConfiguration *)v10;

    v5->_shortcutsWallpaperConfigurationSandboxHandle = -1;
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("wcse"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_retainAutorelease(v13);
      v15 = (OS_xpc_object *)xpc_string_create((const char *)objc_msgSend(v14, "UTF8String"));
      shortcutsWallpaperConfigurationSandboxToken = v5->_shortcutsWallpaperConfigurationSandboxToken;
      v5->_shortcutsWallpaperConfigurationSandboxToken = v15;

      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      v17 = sandbox_extension_consume();
      v5->_shortcutsWallpaperConfigurationSandboxHandle = v17;
      if (v17 == -1)
      {
        v18 = __error();
        strerror_r(*v18, __strerrbuf, 0x100uLL);
        PRSLogPosterContents();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v27 = v5->_shortcutsWallpaperConfigurationSandboxToken;
          v28 = *__error();
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWallpaperConfiguration assetURL](v5->_shortcutsWallpaperConfiguration, "assetURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v34 = v27;
          v35 = 1024;
          v36 = v28;
          v37 = 2082;
          v38 = __strerrbuf;
          v39 = 2114;
          v40 = v30;
          v41 = 2114;
          v42 = v31;
          _os_log_error_impl(&dword_1A4996000, v19, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);

        }
      }
    }
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("ui"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v24;

    _validateUserInfo(v5->_userInfo);
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WFWallpaperConfiguration)shortcutsWallpaperConfiguration
{
  return self->_shortcutsWallpaperConfiguration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_shortcutsWallpaperConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_shortcutsWallpaperConfigurationSandboxToken, 0);
}

@end
