@implementation UIPointerLockState

- (UIPointerLockState)initWithScene:(id)a3
{
  id v5;
  UIPointerLockState *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPointerLockState;
  v6 = -[UIPointerLockState init](&v11, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "_hostsWindows") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UIPointerLockState.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene _hostsWindows]"));

    }
    objc_storeWeak((id *)&v6->_scene, v5);
    -[UIPointerLockState windowHostingScene](v6, "windowHostingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_effectiveUISettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_status = objc_msgSend(v8, "pointerLockStatus");

  }
  return v6;
}

- (BOOL)isLocked
{
  return self->_status == 1;
}

- (id)windowHostingScene
{
  return objc_loadWeakRetained((id *)&self->_scene);
}

- (id)_windowScene
{
  void *v2;
  void *v3;
  id v4;

  -[UIPointerLockState windowHostingScene](self, "windowHostingScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_preferredPointerLockStatusUpdated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIPointerLockState windowHostingScene](self, "windowHostingScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_effectivePointerLockViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = objc_msgSend(v5, "prefersPointerLocked");
    else
      v6 = 0;
    v7 = _preferredPointerLockStatusUpdated___s_category;
    if (!_preferredPointerLockStatusUpdated___s_category)
    {
      v7 = __UILogCategoryGetNode("PointerLockState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_preferredPointerLockStatusUpdated___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v2, "succinctDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("_UIPointerLockStatusLocked");
      if (!v6)
        v11 = CFSTR("_UIPointerLockStatusUnlocked");
      v12 = v11;
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "preferredPointerLockStatus updated: scene: %@; viewController: %@; preferredPointerLockStatus: %@",
        buf,
        0x20u);

    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__UIPointerLockState__preferredPointerLockStatusUpdated__block_invoke;
    v13[3] = &__block_descriptor_40_e89_B24__0__UIMutableApplicationSceneClientSettings_8__UIApplicationSceneTransitionContext_16l;
    v13[4] = v6;
    objc_msgSend(v2, "_updateUIClientSettingsWithUITransitionBlock:", v13);

  }
}

uint64_t __56__UIPointerLockState__preferredPointerLockStatusUpdated__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPreferredPointerLockStatus:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (void)_pointerLockStatusUpdated
{
  void *v3;
  void *v4;
  int64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIPointerLockState windowHostingScene](self, "windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveUISettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pointerLockStatus");

  if (self->_status != v5)
  {
    -[UIPointerLockState willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("locked"));
    self->_status = v5;
    v6 = _pointerLockStatusUpdated___s_category;
    if (!_pointerLockStatusUpdated___s_category)
    {
      v6 = __UILogCategoryGetNode("PointerLockState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_pointerLockStatusUpdated___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[UIPointerLockState windowHostingScene](self, "windowHostingScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "succinctDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_status)
        v11 = CFSTR("_UIPointerLockStatusLocked");
      else
        v11 = CFSTR("_UIPointerLockStatusUnlocked");
      v12 = v11;
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "pointerLockStatus updated: scene: %@; pointerLockStatus: %@",
        buf,
        0x16u);

    }
    -[UIPointerLockState didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("locked"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPointerLockState windowHostingScene](self, "windowHostingScene", CFSTR("scene"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("UIPointerLockStateDidChangeNotification"), self, v15);

  }
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
