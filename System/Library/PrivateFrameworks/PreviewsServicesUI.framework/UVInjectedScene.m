@implementation UVInjectedScene

- (id)_initWithScene:(id)a3
{
  id v5;
  UVInjectedScene *v6;
  UVInjectedScene *v7;
  CGSize v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVInjectedScene;
  v6 = -[UVInjectedScene init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scene, a3);
    v7->_maximized = 1;
    v8 = (CGSize)*MEMORY[0x24BDBF148];
    v7->_overrideSceneSize = (CGSize)*MEMORY[0x24BDBF148];
    v7->_overrideMaximumSize = v8;
    -[FBScene setDelegate:](v7->_scene, "setDelegate:", v7);
  }

  return v7;
}

- (NSString)sceneIdentifier
{
  return (NSString *)-[FBScene identifier](self->_scene, "identifier");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene identifier](self->_scene, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_22AE41000, a2, OS_LOG_TYPE_FAULT, "%@ deallocated without being invalidated: %@", (uint8_t *)&v6, 0x16u);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**invalidationHandler)(void);
  id v9;
  id sceneResizeHandler;
  id actionHandler;
  int v12;
  UVInjectedScene *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated)
  {
    UVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_22AE41000, v3, OS_LOG_TYPE_DEFAULT, "Invalidation of %@", (uint8_t *)&v12, 0xCu);
    }

    self->_invalidated = 1;
    -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
    objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene identifier](self->_scene, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[FBScene identifier](self->_scene, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "destroyScene:withTransitionContext:", v7, 0);

    }
    -[UVInjectedScene _setParentScene:](self, "_setParentScene:", 0);
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v9 = self->_invalidationHandler;
    }
    else
    {
      v9 = 0;
    }
    self->_invalidationHandler = 0;

    sceneResizeHandler = self->_sceneResizeHandler;
    self->_sceneResizeHandler = 0;

    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

  }
}

- (void)setInvalidationHandler:(id)a3
{
  void (**v4)(void);
  void *v5;
  id invalidationHandler;
  void (**v7)(void);

  v4 = (void (**)(void))a3;
  if (!self->_invalidated)
  {
    v7 = v4;
    v5 = _Block_copy(v4);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = v5;

    goto LABEL_5;
  }
  if (v4)
  {
    v7 = v4;
    v4[2]();
LABEL_5:
    v4 = v7;
  }

}

- (void)setSceneResizeHandler:(id)a3
{
  void *v4;
  id sceneResizeHandler;

  if (!self->_invalidated)
  {
    v4 = _Block_copy(a3);
    sceneResizeHandler = self->_sceneResizeHandler;
    self->_sceneResizeHandler = v4;

  }
}

- (void)setActionHandler:(id)a3
{
  void *v4;
  id actionHandler;

  if (!self->_invalidated)
  {
    v4 = _Block_copy(a3);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v4;

  }
}

- (void)sendAction:(id)a3
{
  FBScene *scene;
  id v4;

  scene = self->_scene;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](scene, "sendActions:", v4);

}

- (void)_handleActionsFromHostedScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_actionHandler)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            (*((void (**)(void))self->_actionHandler + 2))();
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  -[UVInjectedScene _handleActionsFromHostedScene:](self, "_handleActionsFromHostedScene:", a4);
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7;

  objc_msgSend(a6, "actions", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UVInjectedScene _handleActionsFromHostedScene:](self, "_handleActionsFromHostedScene:", v7);

}

- (void)sceneDidInvalidate:(id)a3
{
  NSObject *v4;
  int v5;
  UVInjectedScene *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  UVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_22AE41000, v4, OS_LOG_TYPE_DEFAULT, "Scene triggered invalidation of %@", (uint8_t *)&v5, 0xCu);
  }

  -[UVInjectedScene invalidate](self, "invalidate");
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a7;
  objc_msgSend(a4, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UVInjectedScene _computeSceneSettingsUsing:error:](self, "_computeSceneSettingsUsing:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v12, "setActions:", 0);
    -[UVInjectedScene _updateSceneSettings:transitionContext:](self, "_updateSceneSettings:transitionContext:", v11, v12);
    v13 = v12;
  }

}

- (void)_setParentScene:(id)a3
{
  UIWindowScene *v5;
  UIWindowScene *parentScene;
  void *v7;
  UIWindowScene *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = (UIWindowScene *)a3;
  parentScene = self->_parentScene;
  if (parentScene != v5)
  {
    -[FBScene identifier](self->_scene, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _unregisterSettingsDiffActionArrayForKey:](parentScene, "_unregisterSettingsDiffActionArrayForKey:", v7);

    objc_storeStrong((id *)&self->_parentScene, a3);
    v8 = self->_parentScene;
    v11[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene identifier](self->_scene, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _registerSettingsDiffActionArray:forKey:](v8, "_registerSettingsDiffActionArray:forKey:", v9, v10);

  }
}

- (BOOL)setMaximizedWithParent:(id)a3 error:(id *)a4
{
  -[UVInjectedScene _setParentScene:](self, "_setParentScene:", a3);
  self->_maximized = 1;
  return -[UVInjectedScene _computeAndUpdateSceneSettings:](self, "_computeAndUpdateSceneSettings:", a4);
}

- (BOOL)setMinimizedWithParent:(id)a3 size:(CGSize)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  -[UVInjectedScene _setParentScene:](self, "_setParentScene:", a3);
  self->_maximized = 0;
  self->_overrideSceneSize.width = v10;
  self->_overrideSceneSize.height = v9;
  self->_overrideMaximumSize.width = width;
  self->_overrideMaximumSize.height = height;
  return -[UVInjectedScene _computeAndUpdateSceneSettings:](self, "_computeAndUpdateSceneSettings:", a6);
}

- (CGSize)sceneSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[FBScene settings](self->_scene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_computeAndUpdateSceneSettings:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[UIWindowScene _FBSScene](self->_parentScene, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UVInjectedScene _computeSceneSettingsUsing:error:](self, "_computeSceneSettingsUsing:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[UVInjectedScene _updateSceneSettings:transitionContext:](self, "_updateSceneSettings:transitionContext:", v7, 0);

  return v7 != 0;
}

- (id)_computeSceneSettingsUsing:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  UVMutablePreviewSceneSettings *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  int IsLandscape;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v6 = a3;
  v14 = v6;
  if (v6)
  {
    v15 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "displayConfiguration");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        if (self->_maximized)
        {
          v24 = -[FBSSettings initWithSettings:]([UVMutablePreviewSceneSettings alloc], "initWithSettings:", v15);
          -[UVMutablePreviewSceneSettings frame](v24, "frame");
          -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v24, "setPreviewMaximumSize:", v25, v26);
          -[UVMutablePreviewSceneSettings setInterruptionPolicy:](v24, "setInterruptionPolicy:", 1);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_baseSceneSettings:sceneIdentifier:parentSettings:", v23, 0, 0);
          v24 = (UVMutablePreviewSceneSettings *)objc_claimAutoreleasedReturnValue();
          -[UVMutablePreviewSceneSettings setInterruptionPolicy:](v24, "setInterruptionPolicy:", 1);
          -[UVMutablePreviewSceneSettings setForeground:](v24, "setForeground:", objc_msgSend(v15, "isForeground"));
          -[UVMutablePreviewSceneSettings setUserInterfaceStyle:](v24, "setUserInterfaceStyle:", objc_msgSend(v15, "userInterfaceStyle"));
          -[UVMutablePreviewSceneSettings setInterfaceOrientation:](v24, "setInterfaceOrientation:", objc_msgSend(v15, "interfaceOrientation"));
          -[UVMutablePreviewSceneSettings setDeviceOrientation:](v24, "setDeviceOrientation:", objc_msgSend(v15, "deviceOrientation"));
          -[UVMutablePreviewSceneSettings interfaceOrientation](v24, "interfaceOrientation");
          IsLandscape = BSInterfaceOrientationIsLandscape();
          v41 = 40;
          if (IsLandscape)
            v42 = 32;
          else
            v42 = 40;
          if (!IsLandscape)
            v41 = 32;
          -[UVMutablePreviewSceneSettings setFrame:](v24, "setFrame:", 0.0, 0.0, *(double *)((char *)&self->super.isa + v41), *(double *)((char *)&self->super.isa + v42));
          -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v24, "setPreviewMaximumSize:", self->_overrideMaximumSize.width, self->_overrideMaximumSize.height);
        }
        v28 = (void *)-[UVMutablePreviewSceneSettings copy](v24, "copy");

        goto LABEL_28;
      }
      UVPreviewsServicesError(CFSTR("cannot compute settings from parent settings with nil display config"), v16, v17, v18, v19, v20, v21, v22, v44);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      UVLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[UVInjectedScene _computeSceneSettingsUsing:error:].cold.1(v38);

      if (a4)
        *a4 = objc_retainAutorelease(v38);

    }
    else
    {
      v29 = objc_opt_class();
      UVPreviewsServicesError(CFSTR("cannot compute settings from parent scene with non-UI settings: %@"), v30, v31, v32, v33, v34, v35, v36, v29);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      UVLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[UVInjectedScene _computeSceneSettingsUsing:error:].cold.1(v23);

      if (a4)
      {
        v23 = objc_retainAutorelease(v23);
        v28 = 0;
        *a4 = v23;
LABEL_28:

        goto LABEL_29;
      }
    }
    v28 = 0;
    goto LABEL_28;
  }
  UVPreviewsServicesError(CFSTR("cannot compute settings without parent settings"), v7, v8, v9, v10, v11, v12, v13, v44);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  UVLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    -[UVInjectedScene _computeSceneSettingsUsing:error:].cold.1(v15);

  v28 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v15);
LABEL_29:

  return v28;
}

- (id)_prepareSceneSettingsForUpdate:(id)a3
{
  return a3;
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void (**sceneResizeHandler)(void);
  id v15;

  v6 = a4;
  v7 = a3;
  -[UVInjectedScene sceneSize](self, "sceneSize");
  v9 = v8;
  v11 = v10;
  -[UVInjectedScene _prepareSceneSettingsForUpdate:](self, "_prepareSceneSettingsForUpdate:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[FBScene updateSettings:withTransitionContext:](self->_scene, "updateSettings:withTransitionContext:", v15, v6);
  -[UVInjectedScene sceneSize](self, "sceneSize");
  if (v9 != v13 || v11 != v12)
  {
    sceneResizeHandler = (void (**)(void))self->_sceneResizeHandler;
    if (sceneResizeHandler)
      sceneResizeHandler[2]();
  }

}

+ (id)_baseSceneSettings:(id)a3 sceneIdentifier:(id)a4 parentSettings:(id)a5
{
  id v7;
  id v8;
  id v9;
  UVMutablePreviewSceneSettings *v10;
  const char *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[FBSSettings initWithSettings:]([UVMutablePreviewSceneSettings alloc], "initWithSettings:", v8);

  if (v7)
  {
    UVSceneIdentifierToPersistenceIdentifier(v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UVMutablePreviewSceneSettings setPersistenceIdentifier:](v10, "setPersistenceIdentifier:", v12);

  }
  -[UVMutablePreviewSceneSettings setDisplayConfiguration:](v10, "setDisplayConfiguration:", v9);
  -[UVMutablePreviewSceneSettings setLevel:](v10, "setLevel:", 1.0);
  -[UVMutablePreviewSceneSettings setForeground:](v10, "setForeground:", 1);
  -[UVMutablePreviewSceneSettings setInterfaceOrientation:](v10, "setInterfaceOrientation:", 1);
  -[UVMutablePreviewSceneSettings setStatusBarDisabled:](v10, "setStatusBarDisabled:", 1);
  objc_msgSend(v9, "bounds");
  -[UVMutablePreviewSceneSettings setFrame:](v10, "setFrame:");
  objc_msgSend(v9, "bounds");
  v14 = v13;
  v16 = v15;

  -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v10, "setPreviewMaximumSize:", v14, v16);
  return v10;
}

+ (id)injectInRunningTarget:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE80C78], "handleForPredicate:error:", v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    objc_msgSend(a1, "_injectInProcessHandle:error:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get process handle for %@: %@"), v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[UVInjectedScene injectInRunningTarget:error:].cold.1();

    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0FC8];
      v18[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("UVErrorDomain"), 1, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

+ (id)injectInProcess:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v5 = *(_QWORD *)&a3;
  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    objc_msgSend(a1, "_injectInProcessHandle:error:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get process handle for pid %d: %@"), v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[UVInjectedScene injectInRunningTarget:error:].cold.1();

    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0FC8];
      v18[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("UVErrorDomain"), 1, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

+ (id)_injectInProcessHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id *v31;
  void *v32;
  void *v33;
  _OWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE38070], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  v31 = a4;
  if (v6)
    objc_msgSend(v6, "auditToken");
  else
    memset(v34, 0, sizeof(v34));
  objc_msgSend(v7, "registerProcessForAuditToken:", v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE384A8];
  objc_msgSend(v8, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityForProcessIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = getpid();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-(%d)-%d"), CFSTR("UV-InjectedScene"), v13, ++_NextIdentifier_identifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneSpecification specification](UVInjectedSceneSpecification, "specification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38468], "parametersForSpecification:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayConfiguration");
  v18 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v18;
  objc_msgSend(a1, "_baseSceneSettings:sceneIdentifier:parentSettings:", v18, v14, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v16, "setSettings:", v20);

  objc_msgSend(MEMORY[0x24BE38460], "definition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE384C8], "identityForIdentifier:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIdentity:", v22);

  objc_msgSend(v21, "setClientIdentity:", v11);
  objc_msgSend(v21, "setSpecification:", v15);
  objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "createSceneWithDefinition:initialParameters:", v21, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = -[UVInjectedScene _initWithScene:]([UVInjectedScene alloc], "_initWithScene:", v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create scene for process %@"), v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    UVLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[UVInjectedScene injectInRunningTarget:error:].cold.1();

    if (v31)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      v36[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("UVErrorDomain"), 2, v28);
      *v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
  }

  return v25;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)sceneResizeHandler
{
  return self->_sceneResizeHandler;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_sceneResizeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_parentScene, 0);
}

- (void)_computeSceneSettingsUsing:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22AE41000, v2, v3, "%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)injectInRunningTarget:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22AE41000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
