@implementation PRPosterPathModelObjectCache

+ (id)modelObjectCacheLock
{
  if (modelObjectCacheLock_onceToken != -1)
    dispatch_once(&modelObjectCacheLock_onceToken, &__block_literal_global_30);
  return (id)modelObjectCacheLock_modelObjectCacheLock;
}

void __52__PRPosterPathModelObjectCache_modelObjectCacheLock__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)modelObjectCacheLock_modelObjectCacheLock;
  modelObjectCacheLock_modelObjectCacheLock = v0;

}

+ (id)modelObjectCacheForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isServerPosterPath"))
  {
    objc_msgSend(v4, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "modelObjectCacheLock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lock");

      objc_getAssociatedObject(v4, "modelObjectCache");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v7 = -[PRPosterPathModelObjectCache _initWithPath:]([PRPosterPathModelObjectCache alloc], "_initWithPath:", v4);
        if (v7)
          objc_setAssociatedObject(v4, "modelObjectCache", v7, (void *)0x301);
      }
      objc_msgSend(a1, "modelObjectCacheLock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unlock");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)invalidateModelObjectCacheForPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id object;

  object = a3;
  if (objc_msgSend(object, "isServerPosterPath"))
  {
    objc_msgSend(object, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "modelObjectCacheLock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lock");

      objc_getAssociatedObject(object, "modelObjectCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "invalidate");
      objc_setAssociatedObject(object, "modelObjectCache", 0, (void *)0x301);
      objc_msgSend(a1, "modelObjectCacheLock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unlock");

    }
  }

}

- (PRPosterPathModelObjectCache)init
{

  return 0;
}

- (id)_initWithPath:(id)a3
{
  id v4;
  PRPosterPathModelObjectCache *v5;
  uint64_t v6;
  PFServerPosterIdentity *identity;
  uint64_t v8;
  NSString *role;
  uint64_t v10;
  NSURL *pathURL;
  uint64_t v12;
  NSURL *pathInstanceURL;
  uint64_t v14;
  NSURL *pathContentsURL;
  uint64_t v16;
  NSURL *pathIdentifierURL;
  uint64_t v18;
  NSURL *pathSupplementURL;
  void *v20;
  char v21;
  PRPosterPathModelObjectCache *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *logPreamble;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PRPosterPathModelObjectCache;
  v5 = -[PRPosterPathModelObjectCache init](&v45, sel_init);
  if (!v5)
  {
LABEL_8:
    v22 = v5;
    goto LABEL_9;
  }
  objc_msgSend(v4, "identity");
  v6 = objc_claimAutoreleasedReturnValue();
  identity = v5->_identity;
  v5->_identity = (PFServerPosterIdentity *)v6;

  objc_msgSend(v4, "role");
  v8 = objc_claimAutoreleasedReturnValue();
  role = v5->_role;
  v5->_role = (NSString *)v8;

  objc_msgSend(v4, "containerURL");
  v10 = objc_claimAutoreleasedReturnValue();
  pathURL = v5->_pathURL;
  v5->_pathURL = (NSURL *)v10;

  objc_msgSend(v4, "instanceURL");
  v12 = objc_claimAutoreleasedReturnValue();
  pathInstanceURL = v5->_pathInstanceURL;
  v5->_pathInstanceURL = (NSURL *)v12;

  objc_msgSend(v4, "contentsURL");
  v14 = objc_claimAutoreleasedReturnValue();
  pathContentsURL = v5->_pathContentsURL;
  v5->_pathContentsURL = (NSURL *)v14;

  objc_msgSend(v4, "identifierURL");
  v16 = objc_claimAutoreleasedReturnValue();
  pathIdentifierURL = v5->_pathIdentifierURL;
  v5->_pathIdentifierURL = (NSURL *)v16;

  objc_msgSend(v4, "supplementURL");
  v18 = objc_claimAutoreleasedReturnValue();
  pathSupplementURL = v5->_pathSupplementURL;
  v5->_pathSupplementURL = (NSURL *)v18;

  -[NSURL path](v5->_pathInstanceURL, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsString:", CFSTR("_STAGED_"));

  if ((v21 & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    -[PFServerPosterIdentity provider](v5->_identity, "provider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "pathExtension");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFServerPosterIdentity type](v5->_identity, "type");
    NSStringFromPFServerPosterType();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFServerPosterIdentity descriptorIdentifier](v5->_identity, "descriptorIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFServerPosterIdentity posterUUID](v5->_identity, "posterUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "substringToIndex:", 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PFServerPosterIdentity version](v5->_identity, "version");
    v29 = -[PFServerPosterIdentity supplement](v5->_identity, "supplement");
    -[NSString stringByReplacingOccurrencesOfString:withString:](v5->_role, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PRPosterRole"), &stru_1E2186E08);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%llu_%llu:%@"), v42, v23, v24, v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    logPreamble = v5->_logPreamble;
    v5->_logPreamble = (NSString *)v31;

    PRLogModel();
    v33 = objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v30)
    {
      PRLogModel();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[PRPosterPathModelObjectCache _initWithPath:].cold.1((uint64_t)&v5->_logPreamble, v34, v35, v36, v37, v38, v39, v40);

    }
    goto LABEL_8;
  }
  v22 = 0;
LABEL_9:

  return v22;
}

- (void)invalidate
{
  OUTLINED_FUNCTION_16(&dword_18B634000, a2, a3, "[%{public}@ cache] invalidate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

- (void)dealloc
{
  OUTLINED_FUNCTION_16(&dword_18B634000, a2, a3, "[%{public}@ cache] dealloc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

- (PRPosterConfiguredProperties)configuredProperties
{
  PRPosterPathModelObjectCache *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PRPosterConfiguredProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *configuredProperties;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PRPosterConfiguredProperties *v18;
  NSObject *v19;
  _BOOL4 v20;
  PRPosterConfiguredProperties *v21;
  PRPosterConfiguredProperties *v23;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_configuredProperties)
  {
    PRLogModel();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
    {
      PRLogModel();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }
LABEL_14:

    }
  }
  else
  {
    if (-[NSString isEqual:](v2->_role, "isEqual:", CFSTR("PRPosterRoleAmbient")))
    {
      v6 = [PRPosterConfiguredProperties alloc];
      -[PRPosterPathModelObjectCache ambientConfiguration](v2, "ambientConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache ambientWidgetLayout](v2, "ambientWidgetLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache otherMetadata](v2, "otherMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PRPosterConfiguredProperties initWithAmbientConfiguration:widgetLayout:otherMetadata:](v6, "initWithAmbientConfiguration:widgetLayout:otherMetadata:", v7, v8, v9);
      configuredProperties = v2->_configuredProperties;
      v2->_configuredProperties = (PRPosterConfiguredProperties *)v10;
    }
    else
    {
      v23 = [PRPosterConfiguredProperties alloc];
      -[PRPosterPathModelObjectCache titleStyleConfiguration](v2, "titleStyleConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache focusConfiguration](v2, "focusConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache complicationLayout](v2, "complicationLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache renderingConfiguration](v2, "renderingConfiguration");
      configuredProperties = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache homeScreenConfiguration](v2, "homeScreenConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache colorVariationsConfiguration](v2, "colorVariationsConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache quickActionsConfiguration](v2, "quickActionsConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache suggestionMetadata](v2, "suggestionMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache otherMetadata](v2, "otherMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:](v23, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v7, v8, v9, configuredProperties, v12, v13, v14, v15, v16);
      v18 = v2->_configuredProperties;
      v2->_configuredProperties = (PRPosterConfiguredProperties *)v17;

    }
    PRLogModel();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v20)
    {
      if (v2->_configuredProperties)
      {
        PRLogModel();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.1();
        }
      }
      goto LABEL_14;
    }
  }
  v21 = v2->_configuredProperties;
  objc_sync_exit(v2);

  return v21;
}

- (void)resetConfiguredProperties
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 56);
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_18B634000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] %{public}@", (uint8_t *)&v6, 0x16u);

}

- (NSDictionary)userInfo
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSDictionary *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSDictionary *userInfo;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_userInfoLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_userInfo)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_userInfo;
  }
  else
  {
    +[PRPosterPathUtilities userInfoURLForPosterContentsURL:](PRPosterPathUtilities, "userInfoURLForPosterContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserInfoForURL:error:](PRPosterPathUtilities, "loadUserInfoForURL:error:", v11, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    userInfo = v3->_userInfo;
    v3->_userInfo = (NSDictionary *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_userInfo)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_userInfoLoadError->super;
        v3->_userInfoLoadError = v18;
      }

    }
    v7 = v3->_userInfo;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetUserInfo
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18B634000, "[%{public}@ cache] %{public}@", v4, v5);

  OUTLINED_FUNCTION_4_0();
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterTitleStyleConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_titleStyleConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_titleStyleConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_titleStyleConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities titleStyleConfigurationURLForPathInstanceURL:](PRPosterPathUtilities, "titleStyleConfigurationURLForPathInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 1, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    titleStyleConfiguration = v3->_titleStyleConfiguration;
    v3->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_titleStyleConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_titleStyleConfigurationLoadError->super;
        v3->_titleStyleConfigurationLoadError = v18;
      }

    }
    v7 = v3->_titleStyleConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetTitleStyleConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  NSError *titleStyleConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  titleStyleConfiguration = v3->_titleStyleConfiguration;
  v3->_titleStyleConfiguration = 0;

  titleStyleConfigurationLoadError = v3->_titleStyleConfigurationLoadError;
  v3->_titleStyleConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterRenderingConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterRenderingConfiguration *renderingConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_renderingConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_renderingConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_renderingConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities renderingConfigurationURLForPathInstanceURL:](PRPosterPathUtilities, "renderingConfigurationURLForPathInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 1, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    renderingConfiguration = v3->_renderingConfiguration;
    v3->_renderingConfiguration = (PRPosterRenderingConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_renderingConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_renderingConfigurationLoadError->super;
        v3->_renderingConfigurationLoadError = v18;
      }

    }
    v7 = v3->_renderingConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetRenderingConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterRenderingConfiguration *renderingConfiguration;
  NSError *renderingConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  renderingConfiguration = v3->_renderingConfiguration;
  v3->_renderingConfiguration = 0;

  renderingConfigurationLoadError = v3->_renderingConfigurationLoadError;
  v3->_renderingConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterConfigurableOptions)configurableOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterConfigurableOptions *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterConfigurableOptions *configurableOptions;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_configurableOptionsLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_configurableOptions)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_configurableOptions;
  }
  else
  {
    +[PRPosterPathUtilities configurableOptionsURLForContentsURL:](PRPosterPathUtilities, "configurableOptionsURLForContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 1, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    configurableOptions = v3->_configurableOptions;
    v3->_configurableOptions = (PRPosterConfigurableOptions *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_configurableOptions)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_configurableOptionsLoadError->super;
        v3->_configurableOptionsLoadError = v18;
      }

    }
    v7 = v3->_configurableOptions;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetConfigurableOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterConfigurableOptions *configurableOptions;
  NSError *configurableOptionsLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  configurableOptions = v3->_configurableOptions;
  v3->_configurableOptions = 0;

  configurableOptionsLoadError = v3->_configurableOptionsLoadError;
  v3->_configurableOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterHomeScreenConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterHomeScreenConfiguration *homeScreenConfiguration;
  id v15;
  void *v16;
  uint64_t v17;
  PRPosterHomeScreenConfiguration *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *p_super;
  NSObject *v24;
  NSError *v25;
  NSString *logPreamble;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_homeScreenConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_homeScreenConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_homeScreenConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities homeScreenConfigurationURLForSupplementURL:](PRPosterPathUtilities, "homeScreenConfigurationURLForSupplementURL:", v3->_pathSupplementURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v30);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v30;
    homeScreenConfiguration = v3->_homeScreenConfiguration;
    v3->_homeScreenConfiguration = (PRPosterHomeScreenConfiguration *)v12;

    if (v3->_homeScreenConfiguration)
    {
      v15 = 0;
    }
    else
    {
      +[PRPosterPathUtilities oldHomeScreenConfigurationURLForIdentifierURL:](PRPosterPathUtilities, "oldHomeScreenConfigurationURLForIdentifierURL:", v3->_pathIdentifierURL);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v16, objc_opt_class(), 0, &v29);
      v17 = objc_claimAutoreleasedReturnValue();
      v15 = v29;
      v18 = v3->_homeScreenConfiguration;
      v3->_homeScreenConfiguration = (PRPosterHomeScreenConfiguration *)v17;

    }
    if (v13)
      v19 = v13;
    else
      v19 = v15;
    v20 = v19;
    PRLogModel();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

    if (v22)
    {
      if (v3->_homeScreenConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v32 = logPreamble;
          v33 = 2114;
          v34 = v28;
          v35 = 2114;
          v36 = v20;
          _os_log_debug_impl(&dword_18B634000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v25 = (NSError *)v20;
        p_super = &v3->_homeScreenConfigurationLoadError->super;
        v3->_homeScreenConfigurationLoadError = v25;
      }

    }
    v7 = v3->_homeScreenConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetHomeScreenConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterHomeScreenConfiguration *homeScreenConfiguration;
  NSError *homeScreenConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  homeScreenConfiguration = v3->_homeScreenConfiguration;
  v3->_homeScreenConfiguration = 0;

  homeScreenConfigurationLoadError = v3->_homeScreenConfigurationLoadError;
  v3->_homeScreenConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterFocusConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterFocusConfiguration *focusConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_focusConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_focusConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_focusConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities focusConfigurationURLForIdentifierURL:](PRPosterPathUtilities, "focusConfigurationURLForIdentifierURL:", v3->_pathIdentifierURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    focusConfiguration = v3->_focusConfiguration;
    v3->_focusConfiguration = (PRPosterFocusConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_focusConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_focusConfigurationLoadError->super;
        v3->_focusConfigurationLoadError = v18;
      }

    }
    v7 = v3->_focusConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetFocusConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterFocusConfiguration *focusConfiguration;
  NSError *focusConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  focusConfiguration = v3->_focusConfiguration;
  v3->_focusConfiguration = 0;

  focusConfigurationLoadError = v3->_focusConfigurationLoadError;
  v3->_focusConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterComplicationLayout)complicationLayout
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterComplicationLayout *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterComplicationLayout *complicationLayout;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_complicationLayoutLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_complicationLayout)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_complicationLayout;
  }
  else
  {
    +[PRPosterPathUtilities complicationsLayoutURLForInstanceURL:](PRPosterPathUtilities, "complicationsLayoutURLForInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    complicationLayout = v3->_complicationLayout;
    v3->_complicationLayout = (PRPosterComplicationLayout *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_complicationLayout)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_complicationLayoutLoadError->super;
        v3->_complicationLayoutLoadError = v18;
      }

    }
    v7 = v3->_complicationLayout;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetComplicationLayout
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterComplicationLayout *complicationLayout;
  NSError *complicationLayoutLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  complicationLayout = v3->_complicationLayout;
  v3->_complicationLayout = 0;

  complicationLayoutLoadError = v3->_complicationLayoutLoadError;
  v3->_complicationLayoutLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterColorVariationsConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterColorVariationsConfiguration *colorVariationsConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_colorVariationsConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_colorVariationsConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_colorVariationsConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities colorVariationsConfigurationURLForInstanceURL:](PRPosterPathUtilities, "colorVariationsConfigurationURLForInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 1, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    colorVariationsConfiguration = v3->_colorVariationsConfiguration;
    v3->_colorVariationsConfiguration = (PRPosterColorVariationsConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_colorVariationsConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_colorVariationsConfigurationLoadError->super;
        v3->_colorVariationsConfigurationLoadError = v18;
      }

    }
    v7 = v3->_colorVariationsConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetColorVariationsConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterColorVariationsConfiguration *colorVariationsConfiguration;
  NSError *colorVariationsConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  colorVariationsConfiguration = v3->_colorVariationsConfiguration;
  v3->_colorVariationsConfiguration = 0;

  colorVariationsConfigurationLoadError = v3->_colorVariationsConfigurationLoadError;
  v3->_colorVariationsConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterQuickActionsConfiguration)quickActionsConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterQuickActionsConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterQuickActionsConfiguration *quickActionsConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_quickActionsConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_quickActionsConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_quickActionsConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities quickActionsConfigurationURLForInstanceURL:](PRPosterPathUtilities, "quickActionsConfigurationURLForInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    quickActionsConfiguration = v3->_quickActionsConfiguration;
    v3->_quickActionsConfiguration = (PRPosterQuickActionsConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_quickActionsConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_quickActionsConfigurationLoadError->super;
        v3->_quickActionsConfigurationLoadError = v18;
      }

    }
    v7 = v3->_quickActionsConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetQuickActionsConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterQuickActionsConfiguration *quickActionsConfiguration;
  NSError *quickActionsConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  quickActionsConfiguration = v3->_quickActionsConfiguration;
  v3->_quickActionsConfiguration = 0;

  quickActionsConfigurationLoadError = v3->_quickActionsConfigurationLoadError;
  v3->_quickActionsConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterSuggestionMetadata)suggestionMetadata
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterSuggestionMetadata *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterSuggestionMetadata *suggestionMetadata;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_suggestionMetadataLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_suggestionMetadata)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_suggestionMetadata;
  }
  else
  {
    +[PRPosterPathUtilities suggestionMetadataURLForIdentifierURL:](PRPosterPathUtilities, "suggestionMetadataURLForIdentifierURL:", v3->_pathIdentifierURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    suggestionMetadata = v3->_suggestionMetadata;
    v3->_suggestionMetadata = (PRPosterSuggestionMetadata *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_suggestionMetadata)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_suggestionMetadataLoadError->super;
        v3->_suggestionMetadataLoadError = v18;
      }

    }
    v7 = v3->_suggestionMetadata;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetSuggestionMetadata
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterSuggestionMetadata *suggestionMetadata;
  NSError *suggestionMetadataLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  suggestionMetadata = v3->_suggestionMetadata;
  v3->_suggestionMetadata = 0;

  suggestionMetadataLoadError = v3->_suggestionMetadataLoadError;
  v3->_suggestionMetadataLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterMetadata)otherMetadata
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterMetadata *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterMetadata *otherMetadata;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_otherMetadataLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_otherMetadata)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_otherMetadata;
  }
  else
  {
    +[PRPosterPathUtilities otherMetadataURLForContentsURL:](PRPosterPathUtilities, "otherMetadataURLForContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 1, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    otherMetadata = v3->_otherMetadata;
    v3->_otherMetadata = (PRPosterMetadata *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_otherMetadata)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_otherMetadataLoadError->super;
        v3->_otherMetadataLoadError = v18;
      }

    }
    v7 = v3->_otherMetadata;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetOtherMetadata
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterMetadata *otherMetadata;
  NSError *otherMetadataLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  otherMetadata = v3->_otherMetadata;
  v3->_otherMetadata = 0;

  otherMetadataLoadError = v3->_otherMetadataLoadError;
  v3->_otherMetadataLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterDescriptorGalleryOptions)galleryOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterDescriptorGalleryOptions *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterDescriptorGalleryOptions *galleryOptions;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_galleryOptionsLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_galleryOptions)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_galleryOptions;
  }
  else
  {
    +[PRPosterPathUtilities descriptorGalleryOptionsURLForContentsURL:](PRPosterPathUtilities, "descriptorGalleryOptionsURLForContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    galleryOptions = v3->_galleryOptions;
    v3->_galleryOptions = (PRPosterDescriptorGalleryOptions *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_galleryOptions)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_galleryOptionsLoadError->super;
        v3->_galleryOptionsLoadError = v18;
      }

    }
    v7 = v3->_galleryOptions;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetGalleryOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterDescriptorGalleryOptions *galleryOptions;
  NSError *galleryOptionsLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  galleryOptions = v3->_galleryOptions;
  v3->_galleryOptions = 0;

  galleryOptionsLoadError = v3->_galleryOptionsLoadError;
  v3->_galleryOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (ATXPosterDescriptorGalleryOptions)proactiveGalleryOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  ATXPosterDescriptorGalleryOptions *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  ATXPosterDescriptorGalleryOptions *proactiveGalleryOptions;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_proactiveGalleryOptionsLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_proactiveGalleryOptions)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_proactiveGalleryOptions;
  }
  else
  {
    +[PRPosterPathUtilities proactiveGalleryOptionsURLForContentsURL:](PRPosterPathUtilities, "proactiveGalleryOptionsURLForContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    proactiveGalleryOptions = v3->_proactiveGalleryOptions;
    v3->_proactiveGalleryOptions = (ATXPosterDescriptorGalleryOptions *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_proactiveGalleryOptions)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_proactiveGalleryOptionsLoadError->super;
        v3->_proactiveGalleryOptionsLoadError = v18;
      }

    }
    v7 = v3->_proactiveGalleryOptions;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetProactiveGalleryOptions
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  ATXPosterDescriptorGalleryOptions *proactiveGalleryOptions;
  NSError *proactiveGalleryOptionsLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  proactiveGalleryOptions = v3->_proactiveGalleryOptions;
  v3->_proactiveGalleryOptions = 0;

  proactiveGalleryOptionsLoadError = v3->_proactiveGalleryOptionsLoadError;
  v3->_proactiveGalleryOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterAmbientConfiguration *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterAmbientConfiguration *ambientConfiguration;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_ambientConfigurationLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_ambientConfiguration)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_ambientConfiguration;
  }
  else
  {
    +[PRPosterPathUtilities ambientConfigurationURLForContentsURL:](PRPosterPathUtilities, "ambientConfigurationURLForContentsURL:", v3->_pathContentsURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    ambientConfiguration = v3->_ambientConfiguration;
    v3->_ambientConfiguration = (PRPosterAmbientConfiguration *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_ambientConfiguration)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_ambientConfigurationLoadError->super;
        v3->_ambientConfigurationLoadError = v18;
      }

    }
    v7 = v3->_ambientConfiguration;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetAmbientConfiguration
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterAmbientConfiguration *ambientConfiguration;
  NSError *ambientConfigurationLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  ambientConfiguration = v3->_ambientConfiguration;
  v3->_ambientConfiguration = 0;

  ambientConfigurationLoadError = v3->_ambientConfigurationLoadError;
  v3->_ambientConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterAmbientWidgetLayout)ambientWidgetLayout
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterAmbientWidgetLayout *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PRPosterAmbientWidgetLayout *ambientWidgetLayout;
  NSObject *v15;
  NSObject *p_super;
  NSObject *v17;
  NSError *v18;
  NSString *logPreamble;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_ambientWidgetLayoutLoadError)
  {
    PRLogModel();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      PRLogModel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo].cold.3();
      }

    }
    v7 = 0;
  }
  else if (v3->_ambientWidgetLayout)
  {
    PRLogModel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      PRLogModel();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties].cold.3();
      }

    }
    v7 = v3->_ambientWidgetLayout;
  }
  else
  {
    +[PRPosterPathUtilities ambientWidgetLayoutURLForInstanceURL:](PRPosterPathUtilities, "ambientWidgetLayoutURLForInstanceURL:", v3->_pathInstanceURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRPosterPathUtilities loadUserObjectForURL:expectedClass:strict:error:](PRPosterPathUtilities, "loadUserObjectForURL:expectedClass:strict:error:", v11, objc_opt_class(), 0, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    ambientWidgetLayout = v3->_ambientWidgetLayout;
    v3->_ambientWidgetLayout = (PRPosterAmbientWidgetLayout *)v12;

    PRLogModel();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      if (v3->_ambientWidgetLayout)
      {
        PRLogModel();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties].cold.2();
        }
      }
      else
      {
        PRLogModel();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          v25 = 2114;
          v26 = v21;
          v27 = 2114;
          v28 = v13;
          _os_log_debug_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);

        }
        v18 = (NSError *)v13;
        p_super = &v3->_ambientWidgetLayoutLoadError->super;
        v3->_ambientWidgetLayoutLoadError = v18;
      }

    }
    v7 = v3->_ambientWidgetLayout;

  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetAmbientWidgetLayout
{
  PRPosterPathModelObjectCache *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  PRPosterAmbientWidgetLayout *ambientWidgetLayout;
  NSError *ambientWidgetLayoutLoadError;
  PRPosterConfiguredProperties *configuredProperties;

  v3 = self;
  objc_sync_enter(v3);
  PRLogModel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    PRLogModel();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo].cold.1();
    }

  }
  ambientWidgetLayout = v3->_ambientWidgetLayout;
  v3->_ambientWidgetLayout = 0;

  ambientWidgetLayoutLoadError = v3->_ambientWidgetLayoutLoadError;
  v3->_ambientWidgetLayoutLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveGalleryOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_proactiveGalleryOptions, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayoutLoadError, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_ambientConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_galleryOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_otherMetadata, 0);
  objc_storeStrong((id *)&self->_otherMetadataLoadError, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionMetadataLoadError, 0);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_quickActionsConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_complicationLayout, 0);
  objc_storeStrong((id *)&self->_complicationLayoutLoadError, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_focusConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_configurableOptions, 0);
  objc_storeStrong((id *)&self->_configurableOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userInfoLoadError, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_logPreamble, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_pathSupplementURL, 0);
  objc_storeStrong((id *)&self->_pathContentsURL, 0);
  objc_storeStrong((id *)&self->_pathIdentifierURL, 0);
  objc_storeStrong((id *)&self->_pathInstanceURL, 0);
  objc_storeStrong((id *)&self->_pathURL, 0);
}

- (void)_initWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_16(&dword_18B634000, a2, a3, "[%{public}@ cache] init", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

- (void)configuredProperties
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18B634000, "[%{public}@ cache] using cached value for %{public}@", v4, v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)userInfo
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18B634000, "[%{public}@ cache] bailing; previous loading error %{public}@", v4, v5);

  OUTLINED_FUNCTION_4_0();
}

@end
