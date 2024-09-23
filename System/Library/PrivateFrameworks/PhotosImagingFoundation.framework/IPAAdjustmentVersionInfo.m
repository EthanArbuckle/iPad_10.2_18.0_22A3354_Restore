@implementation IPAAdjustmentVersionInfo

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IPAAdjustmentVersionInfo platform](self, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p platform=%@ buildNumber=%@ appVersion=%@ schemaRevision=%ld>"), v4, self, v5, v6, v7, -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[IPAAdjustmentVersionInfo platform](self, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlatform:", v5);

  -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuildNumber:", v6);

  -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppVersion:", v7);

  objc_msgSend(v4, "setSchemaRevision:", -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"));
  return v4;
}

- (id)archivalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[IPAAdjustmentVersionInfo platform](self, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IPAAdjustmentVersionInfo platform](self, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("platform"));

  }
  -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("buildNumber"));

  }
  -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appVersion"));

  }
  if (-[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("schemaRevision"));

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAAdjustmentVersionInfo isEqualToVersionInfo:](self, "isEqualToVersionInfo:", v4);

  return v5;
}

- (BOOL)isEqualToVersionInfo:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;

  v5 = a3;
  -[IPAAdjustmentVersionInfo platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "platform"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "platform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPAAdjustmentVersionInfo platform](self, "platform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v6)
    {

      if (!v9)
        goto LABEL_19;
    }
    else
    {

      if ((v9 & 1) == 0)
        goto LABEL_19;
    }
  }
  -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v5, "buildNumber"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "buildNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPAAdjustmentVersionInfo buildNumber](self, "buildNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v10)
    {

      if (!v13)
        goto LABEL_19;
    }
    else
    {

      if ((v13 & 1) == 0)
        goto LABEL_19;
    }
  }
  -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v5, "appVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_17;
  }
  objc_msgSend(v5, "appVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAAdjustmentVersionInfo appVersion](self, "appVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (!v14)
  {

    if ((v17 & 1) != 0)
      goto LABEL_17;
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }

  if (!v17)
    goto LABEL_19;
LABEL_17:
  v18 = objc_msgSend(v5, "schemaRevision");
  v19 = v18 == -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision");
LABEL_20:

  return v19;
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)schemaRevision
{
  return self->_schemaRevision;
}

- (void)setSchemaRevision:(int64_t)a3
{
  self->_schemaRevision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (id)currentVersionInfo
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPlatform:", CFSTR("OSX"));
  objc_msgSend(a1, "systemBuildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuildNumber:", v4);

  objc_msgSend(a1, "frameworkVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppVersion:", v5);

  objc_msgSend(v3, "setSchemaRevision:", 1);
  return v3;
}

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken != -1)
    dispatch_once(&systemBuildVersion_onceToken, &__block_literal_global);
  return (id)systemBuildVersion_buildVersion;
}

+ (id)frameworkVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__IPAAdjustmentVersionInfo_frameworkVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (frameworkVersion_onceToken != -1)
    dispatch_once(&frameworkVersion_onceToken, block);
  return (id)frameworkVersion_version;
}

+ (id)_frameworkVersion
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    IPAAdjustmentGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = a1;
      _os_log_impl(&dword_1D4CAA000, v6, OS_LOG_TYPE_ERROR, "Bundle not found for class: %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  objc_msgSend(v3, "infoDictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    IPAAdjustmentGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "bundlePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      v11 = "Failed to load Info.plist for bundle at path: %@";
LABEL_11:
      _os_log_impl(&dword_1D4CAA000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0xCu);

    }
LABEL_12:

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  -[NSObject objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IPAAdjustmentGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "bundlePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      v11 = "Failed to get version for bundle at path: %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v8 = (void *)v7;
LABEL_14:

  return v8;
}

+ (id)versionInfoFromArchivalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("platform"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setPlatform:", v5);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buildNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setBuildNumber:", v6);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setAppVersion:", v7);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("schemaRevision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setSchemaRevision:", objc_msgSend(v8, "integerValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __44__IPAAdjustmentVersionInfo_frameworkVersion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_frameworkVersion");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)frameworkVersion_version;
  frameworkVersion_version = v1;

}

void __46__IPAAdjustmentVersionInfo_systemBuildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = _CFCopySystemVersionDictionaryValue();
  v1 = (void *)systemBuildVersion_buildVersion;
  systemBuildVersion_buildVersion = v0;

}

@end
