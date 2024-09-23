@implementation UISceneSession

- (UISceneSessionRole)role
{
  return self->_role;
}

- (unint64_t)hash
{
  NSString *persistentIdentifier;

  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
    return -[NSString hash](persistentIdentifier, "hash") + 113569;
  else
    return 337;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneSession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  UISceneConfiguration *configuration;
  void *v11;
  UISceneConfiguration *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  id v16;
  NSDictionary *userInfo;
  void *v18;
  NSDictionary *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_role, CFSTR("role"));
  objc_msgSend(v3, "appendString:withName:", self->_persistentIdentifier, CFSTR("persistentIdentifier"));
  v4 = objc_loadWeakRetained((id *)&self->_scene);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }

  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("scene"));
  configuration = self->_configuration;
  if (configuration)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = configuration;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("(nil)");
  }
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("configuration"));

  userInfo = self->_userInfo;
  if (userInfo)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = userInfo;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v19);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = CFSTR("(nil)");
  }
  v23 = (id)objc_msgSend(v3, "appendObject:withName:", v22, CFSTR("userInfo"));

  return v3;
}

- (UISceneConfiguration)configuration
{
  return (UISceneConfiguration *)(id)-[UISceneConfiguration copy](self->_configuration, "copy");
}

- (void)_setScene:(id)a3
{
  char sessionFlags;
  id v6;
  id v7;
  char v8;
  int v9;
  char v10;
  void *v11;

  sessionFlags = (char)self->_sessionFlags;
  v6 = objc_storeWeak((id *)&self->_scene, a3);
  v7 = a3;
  if (a3)
  {
    if ((sessionFlags & 0x40) != 0)
    {
      v8 = objc_msgSend(a3, "_isInternal");
      v7 = a3;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISceneSession.m"), 694, CFSTR("Internal session given a non-internal scene: self: %@, scene:"), self, a3);

        v7 = a3;
      }
    }
    v9 = objc_msgSend(v7, "_isInternal");
    v7 = a3;
    if (v9)
      v10 = 64;
    else
      v10 = 0;
    *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xBF | v10;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneSession descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  char has_internal_diagnostics;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  UISceneSession *v13;
  char v14;

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v4);

  objc_msgSend(v6, "appendString:withName:", self->_role, CFSTR("role"));
  objc_msgSend(v6, "appendString:withName:", self->_persistentIdentifier, CFSTR("persistentIdentifier"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B4008;
  v7 = v6;
  v14 = has_internal_diagnostics;
  v12 = v7;
  v13 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", v11);
  v9 = v7;

  return v9;
}

- (NSDictionary)userInfo
{
  -[UISceneSession _loadUserInfo](self, "_loadUserInfo");
  return (NSDictionary *)(id)-[NSDictionary copy](self->_userInfo, "copy");
}

- (void)_loadUserInfo
{
  void *v3;
  NSDictionary *v4;
  id v5;
  NSDictionary *userInfo;
  unint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_sessionFlags & 1) == 0)
  {
    -[UISceneSession persistentIdentifier](self, "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    +[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:](_UICanvasUserActivityManager, "_getUserInfoForPersistentIdentifier:error:", v3, &v9);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    userInfo = self->_userInfo;
    self->_userInfo = v4;

    if (v5)
    {
      v7 = _loadUserInfo___s_category;
      if (!_loadUserInfo___s_category)
      {
        v7 = __UILogCategoryGetNode("SceneSession", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_loadUserInfo___s_category);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v11 = v5;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "failed to load state user info: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      *(_BYTE *)&self->_sessionFlags |= 1u;
    }

  }
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  v6 = userInfo;
  if (!-[NSDictionary isEqualToDictionary:](self->_userInfo, "isEqualToDictionary:"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v6, 100);
    v4 = (NSDictionary *)-[NSDictionary copy](v6, "copy");
    v5 = self->_userInfo;
    self->_userInfo = v4;

    -[UISceneSession _setUserInfoIsDirty:](self, "_setUserInfoIsDirty:", 1);
    +[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:](_UICanvasUserActivityManager, "_scheduleDataSaveForSceneSession:saveRestorationActivity:", self, 0);
  }

}

- (void)_setUserInfoIsDirty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 33;
  else
    v3 = 1;
  *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xDF | v3;
}

- (BOOL)_configurationNeedsReevalulation
{
  return -[UISceneConfiguration _hadResolutionErrorsOnLoad](self->_configuration, "_hadResolutionErrorsOnLoad");
}

- (void)_updateConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  UISceneConfiguration *v7;
  UISceneConfiguration *configuration;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[UISceneConfiguration isEqual:](self->_configuration, "isEqual:", v4))
  {
    objc_msgSend(v4, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_role);

    if ((v6 & 1) != 0)
    {
LABEL_3:
      v7 = -[UISceneConfiguration _initWithConfiguration:]([UISceneConfiguration alloc], "_initWithConfiguration:", v4);
      configuration = self->_configuration;
      self->_configuration = v7;

      *(_BYTE *)&self->_sessionFlags |= 0x10u;
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
      objc_msgSend(v4, "role");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISceneSession role](self, "role");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Attempting to define a mismatched UISceneSessionRole! This will be an assert in future UIKit releases! Assigning a UISceneConfiguration with role \"%@\" for a UISceneSession with role \"%@\".", (uint8_t *)&v14, 0x16u);
    }
    else
    {
      v9 = _updateConfiguration____s_category;
      if (!_updateConfiguration____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_updateConfiguration____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_3;
      v11 = v10;
      objc_msgSend(v4, "role");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISceneSession role](self, "role");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Attempting to define a mismatched UISceneSessionRole! This will be an assert in future UIKit releases! Assigning a UISceneConfiguration with role \"%@\" for a UISceneSession with role \"%@\".", (uint8_t *)&v14, 0x16u);
    }

LABEL_11:
    goto LABEL_3;
  }
LABEL_4:

}

- (NSUserActivity)stateRestorationActivity
{
  -[UISceneSession _loadStateRestorationActivityIfNeeded](self, "_loadStateRestorationActivityIfNeeded");
  return self->_stateRestorationActivity;
}

- (void)_loadStateRestorationActivityIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSUserActivity *v6;
  id v7;
  NSUserActivity *stateRestorationActivity;
  unint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_sessionFlags & 4) == 0)
  {
    -[UISceneSession persistentIdentifier](self, "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:](_UICanvasUserActivityManager, "_restorationUserActivityAvailableForSceneIdentifier:", v3);

    if (v4)
    {
      -[UISceneSession persistentIdentifier](self, "persistentIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      +[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:](_UICanvasUserActivityManager, "_getRestorationUserActivityForPersistentIdentifier:error:", v5, &v11);
      v6 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      stateRestorationActivity = self->_stateRestorationActivity;
      self->_stateRestorationActivity = v6;

      if (v7)
      {
        v9 = _loadStateRestorationActivityIfNeeded___s_category;
        if (!_loadStateRestorationActivityIfNeeded___s_category)
        {
          v9 = __UILogCategoryGetNode("SceneSession", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&_loadStateRestorationActivityIfNeeded___s_category);
        }
        if ((*(_BYTE *)v9 & 1) != 0)
        {
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v13 = v7;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "failed to load state restoration activity: %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xF9 | 4;
      }

    }
  }
}

- (BOOL)_userInfoIsDirty
{
  return (*(_BYTE *)&self->_sessionFlags >> 5) & 1;
}

- (BOOL)_configurationIsDirty
{
  return (*(_BYTE *)&self->_sessionFlags >> 4) & 1;
}

- (void)_setConfigurationIsDirty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xEF | v3;
}

- (void)_resetStateRestorationToActivity:(id)a3
{
  *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xFB | (4 * (a3 != 0));
  objc_storeStrong((id *)&self->_stateRestorationActivity, a3);
}

- (void)_setStateRestorationActivityIsDirty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xFD | v3;
}

- (void)_clearAllDirtyFlags
{
  *(_BYTE *)&self->_sessionFlags &= 0xCDu;
}

- (NSString)debugDescription
{
  return (NSString *)-[UISceneSession debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_stateRestorationActivity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (id)_initWithPersistentIdentifier:(id)a3 sessionRole:(id)a4 configurationName:(id)a5
{
  id v9;
  id v10;
  id v11;
  UISceneSession *v12;
  UISceneSession *v13;
  NSDictionary *userInfo;
  uint64_t v15;
  UISceneConfiguration *configuration;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UISceneSession;
  v12 = -[UISceneSession init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistentIdentifier, a3);
    objc_storeStrong((id *)&v13->_role, a4);
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];

    +[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", v11, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    configuration = v13->_configuration;
    v13->_configuration = (UISceneConfiguration *)v15;

    *(_BYTE *)&v13->_sessionFlags = *(_BYTE *)&v13->_sessionFlags & 0xAA | 0x15;
  }

  return v13;
}

- (UIScene)scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0
    || objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle"))
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("_UISceneSessionSceneConfiguration"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_role, CFSTR("_UISceneSessionRole"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_persistentIdentifier, CFSTR("_UISceneSessionPersistentIdentifier"));

}

- (id)_copyWithoutUserInfo
{
  id *v3;
  id v4;

  v3 = -[UISceneSession _init]([UISceneSession alloc], "_init");
  objc_storeStrong(v3 + 3, self->_persistentIdentifier);
  objc_storeStrong(v3 + 2, self->_role);
  objc_storeStrong(v3 + 4, self->_configuration);
  v4 = v3[6];
  v3[6] = (id)MEMORY[0x1E0C9AA70];

  return v3;
}

- (UISceneSession)initWithCoder:(id)a3
{
  id v4;
  UISceneSession *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *role;
  UISceneConfiguration *v10;
  void *configuration;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  UISceneConfiguration *v18;
  UISceneConfiguration *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *persistentIdentifier;

  v4 = a3;
  v5 = -[UISceneSession _init](self, "_init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_UICDPersistentIdentifierEncoderKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_storeStrong((id *)&v5->_persistentIdentifier, v7);
      _UICanvasFrameSystemTypeFromCanvasType(objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UICDSystemTypeEncoderKey")));
      v8 = objc_claimAutoreleasedReturnValue();
      role = v5->_role;
      v5->_role = (NSString *)v8;

      v10 = -[UISceneConfiguration _initWithLoadErrorForSessionRole:]([UISceneConfiguration alloc], "_initWithLoadErrorForSessionRole:", v5->_role);
      configuration = v5->_configuration;
      v5->_configuration = v10;
    }
    else
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("_UISceneSessionRole"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v5->_role;
      v5->_role = (NSString *)v13;

      if ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
        || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
      {
        objc_opt_self();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("_UISceneSessionSceneConfiguration"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = v16;
        else
          v18 = -[UISceneConfiguration _initWithLoadErrorForSessionRole:]([UISceneConfiguration alloc], "_initWithLoadErrorForSessionRole:", v5->_role);
        v19 = v5->_configuration;
        v5->_configuration = v18;

      }
      else
      {
        +[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", 0, v5->_role);
        v20 = objc_claimAutoreleasedReturnValue();
        v15 = v5->_configuration;
        v5->_configuration = (UISceneConfiguration *)v20;
      }

      objc_opt_self();
      configuration = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", configuration, CFSTR("_UISceneSessionPersistentIdentifier"));
      v21 = objc_claimAutoreleasedReturnValue();
      persistentIdentifier = v5->_persistentIdentifier;
      v5->_persistentIdentifier = (NSString *)v21;

    }
    *(_BYTE *)&v5->_sessionFlags &= 0xFAu;

  }
  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISceneSession;
  return -[UISceneSession init](&v3, sel_init);
}

- (BOOL)_isInternal
{
  return (*(_BYTE *)&self->_sessionFlags >> 6) & 1;
}

void __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B4008;
  v9 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

uint64_t __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "activeMultilinePrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v15[3] = &unk_1E16B1B50;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v16 = v4;
    v17 = v5;
    objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sessionFlags"), v3, v15);

  }
  v6 = *(void **)(a1 + 32);
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(nil)");
  }

  v12 = (id)objc_msgSend(v6, "appendObject:withName:", v11, CFSTR("scene"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("configuration"));
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("userInfo"), 1);
}

- (void)setStateRestorationActivity:(NSUserActivity *)stateRestorationActivity
{
  NSUserActivity *v5;

  objc_storeStrong((id *)&self->_stateRestorationActivity, stateRestorationActivity);
  v5 = stateRestorationActivity;
  *(_BYTE *)&self->_sessionFlags |= 6u;
  +[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:](_UICanvasUserActivityManager, "_scheduleDataSaveForSceneSession:saveRestorationActivity:", self, 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneSession descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 56) >> 6) & 1, CFSTR("isInternal"));
}

- (BOOL)isEqual:(id)a3
{
  UISceneSession *v4;
  void *v5;
  unint64_t v6;
  NSString *persistentIdentifier;
  char v8;

  v4 = (UISceneSession *)a3;
  if (v4 == self)
    goto LABEL_8;
  v5 = (void *)objc_opt_class();
  if (!objc_msgSend(v5, "isEqual:", objc_opt_class()))
    goto LABEL_7;
  v6 = -[UISceneSession hash](self, "hash");
  if (v6 != -[UISceneSession hash](v4, "hash"))
    goto LABEL_7;
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier == v4->_persistentIdentifier)
  {
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  if (!persistentIdentifier)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = -[NSString isEqualToString:](persistentIdentifier, "isEqualToString:");
LABEL_9:

  return v8;
}

- (BOOL)_trackingRefreshRequest
{
  return (*(_BYTE *)&self->_sessionFlags >> 3) & 1;
}

- (void)_setTrackingRefreshRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_sessionFlags = *(_BYTE *)&self->_sessionFlags & 0xF7 | v3;
}

- (BOOL)_stateRestorationActivityIsDirty
{
  return (*(_BYTE *)&self->_sessionFlags >> 1) & 1;
}

+ (id)defaultCanvasRepresentation
{
  return objc_alloc_init(_UICanvasDefinition);
}

+ (id)canvasRepresentationForSystemType:(int64_t)a3
{
  void *v3;
  id v4;

  _UICanvasFrameSystemTypeFromCanvasType(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UISceneSession _initWithPersistentIdentifier:sessionRole:configurationName:]([UISceneSession alloc], "_initWithPersistentIdentifier:sessionRole:configurationName:", &stru_1E16EDF20, v3, 0);

  return v4;
}

- (int64_t)systemType
{
  void *v2;
  int64_t v3;

  -[UISceneSession role](self, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UICanvasCanvasSystemTypeFromFrameType(v2);

  return v3;
}

- (Class)canvasSubclass
{
  void *v2;
  void *v3;

  -[UISceneSession configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)delegateClass
{
  void *v2;
  void *v3;

  -[UISceneSession configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_UIMutableCanvasDefinition initWithRepresentation:](+[_UIMutableCanvasDefinition allocWithZone:](_UIMutableCanvasDefinition, "allocWithZone:", a3), "initWithRepresentation:", self);
}

@end
