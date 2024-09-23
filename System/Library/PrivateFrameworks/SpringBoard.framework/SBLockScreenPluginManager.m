@implementation SBLockScreenPluginManager

- (SBLockScreenPluginManager)init
{
  SBLockScreenPluginManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *plugins;
  void *v5;
  void *v6;
  uint64_t v7;
  CSLockScreenTestPluginSettings *testSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenPluginManager;
  v2 = -[SBLockScreenPluginManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    plugins = v2->_plugins;
    v2->_plugins = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleUIRelock, CFSTR("SBLockScreenUIRelockedNotification"), 0);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "testPluginSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    testSettings = v2->_testSettings;
    v2->_testSettings = (CSLockScreenTestPluginSettings *)v7;

    -[CSLockScreenTestPluginSettings addKeyObserver:](v2->_testSettings, "addKeyObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_plugins, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_254);
  -[CSLockScreenTestPluginSettings removeKeyObserver:](self->_testSettings, "removeKeyObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenPluginManager;
  -[SBLockScreenPluginManager dealloc](&v4, sel_dealloc);
}

void __36__SBLockScreenPluginManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  objc_msgSend(a3, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)setDelegate:(id)a3
{
  SBLockScreenPluginManagerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[SBLockScreenPluginManager _refreshLockScreenPlugin](self, "_refreshLockScreenPlugin");
  }
}

- (BOOL)enableLockScreenPluginWithContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSMutableDictionary *plugins;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v4 = a3;
  v5 = -[SBLockScreenPluginManager _loadLockScreenPluginWithContext:](self, "_loadLockScreenPluginWithContext:", v4);
  if (v5)
  {
    plugins = self->_plugins;
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](plugins, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "auxiliaryAnimation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAuxiliaryActivationAnimationBlock:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pluginManager:didLoadPlugin:", self, v8);

    -[SBLockScreenPluginManager _refreshLockScreenPlugin](self, "_refreshLockScreenPlugin");
  }

  return v5;
}

- (BOOL)disableLockScreenPluginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_plugins, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBLockScreenPluginManager _handlePluginDisabled:withContext:](self, "_handlePluginDisabled:withContext:", v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)handleEvent:(int64_t)a3
{
  NSObject *v6;
  _QWORD v7[5];

  if (-[SBLockScreenPluginManager isEnabled](self, "isEnabled"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SBLockScreenPluginManager_handleEvent___block_invoke;
    v7[3] = &__block_descriptor_40_e28_B16__0__SBLockScreenPlugin_8l;
    v7[4] = a3;
    return -[SBLockScreenPluginManager _sendEventToPlugin:](self, "_sendEventToPlugin:", v7);
  }
  else
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBLockScreenPluginManager handleEvent:].cold.1(a3, v6);

    return 0;
  }
}

uint64_t __41__SBLockScreenPluginManager_handleEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pluginHandleEvent:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_sendEventToPlugin:(id)a3
{
  uint64_t (**v4)(_QWORD);
  char v5;

  v4 = (uint64_t (**)(_QWORD))a3;
  if ((((uint64_t (*)(uint64_t (**)(_QWORD), SBLockScreenPlugin *))v4[2])(v4, self->_activePlugin) & 1) != 0)
  {
    v5 = 1;
  }
  else if (self->_activePlugin == self->_displayedPlugin)
  {
    v5 = 0;
  }
  else
  {
    v5 = v4[2](v4);
  }

  return v5;
}

- (void)_handleUIRelock
{
  if (-[SBLockScreenPluginManager isEnabled](self, "isEnabled"))
    -[SBLockScreenPluginManager handleEvent:](self, "handleEvent:", 2);
}

- (id)_highestPriorityPluginIgnoringViewDisplay:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[SBLockScreenPluginManager isEnabled](self, "isEnabled"))
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_plugins, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  v10 = 0x8000000000000000;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "pluginPriority");
      if (v13 < v10 || a3)
      {
        if (v13 < v10)
          continue;
LABEL_12:
        v16 = v12;

        v10 = objc_msgSend(v16, "pluginPriority");
        v8 = v16;
        continue;
      }
      objc_msgSend(v12, "appearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isHidden");

      if ((v15 & 1) == 0)
        goto LABEL_12;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);
LABEL_18:

  return v8;
}

- (void)_refreshLockScreenPlugin
{
  void *v3;
  id v4;

  -[SBLockScreenPluginManager _highestPriorityPluginIgnoringViewDisplay:](self, "_highestPriorityPluginIgnoringViewDisplay:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginManager _highestPriorityPluginIgnoringViewDisplay:](self, "_highestPriorityPluginIgnoringViewDisplay:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginManager _setActivePlugin:displayedPlugin:](self, "_setActivePlugin:displayedPlugin:", v4, v3);

}

- (void)_setActivePlugin:(id)a3 displayedPlugin:(id)a4
{
  SBLockScreenPlugin *v7;
  SBLockScreenPlugin *activePlugin;
  SBLockScreenPlugin *displayedPlugin;
  SBLockScreenPlugin *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  SBLockScreenPlugin *v14;

  v14 = (SBLockScreenPlugin *)a3;
  v7 = (SBLockScreenPlugin *)a4;
  activePlugin = self->_activePlugin;
  if (activePlugin != v14)
    objc_storeStrong((id *)&self->_activePlugin, a3);
  displayedPlugin = self->_displayedPlugin;
  if (displayedPlugin == v7)
  {
    v10 = 0;
  }
  else
  {
    v10 = displayedPlugin;
    objc_storeStrong((id *)&self->_displayedPlugin, a4);
    -[SBLockScreenPlugin viewController](v10, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v12, "removeFromSuperview");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (activePlugin != v14)
    objc_msgSend(WeakRetained, "pluginManager:activePluginDidChange:", self, self->_activePlugin);
  if (displayedPlugin != v7)
    objc_msgSend(WeakRetained, "pluginManager:displayedPluginDidChangeFromPlugin:toPlugin:", self, v10, self->_displayedPlugin);

}

- (BOOL)_loadLockScreenPluginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a3;
  NSClassFromString(CFSTR("SBLockScreenPluginContext"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenPluginManager _loadLockScreenPluginWithContext:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B004D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBLockScreenPluginContextClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenPluginManager _loadLockScreenPluginWithContext:].cold.1();
    goto LABEL_15;
  }

  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_plugins, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    +[SBLockScreenPlugin pluginWithName:activationContext:](SBLockScreenPlugin, "pluginWithName:activationContext:", v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;
    if (v8)
    {
      -[NSMutableDictionary setObject:forKey:](self->_plugins, "setObject:forKey:", v8, v5);
      objc_msgSend(v8, "pluginWillActivateWithContext:", v4);
      objc_msgSend(v8, "setPluginAgent:", self);
      objc_msgSend(v4, "observer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "observer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLifecycleObserver:", v10);

      }
    }

  }
  return v7;
}

- (BOOL)_handlePluginDisabled:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSMutableDictionary *plugins;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v18;

  v6 = a3;
  v7 = a4;
  NSClassFromString(CFSTR("SBLockScreenPluginContext"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenPluginManager _handlePluginDisabled:withContext:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B00710);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBLockScreenPluginContextClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenPluginManager _handlePluginDisabled:withContext:].cold.1();
    goto LABEL_13;
  }

  if (v6
    && (v8 = self->_plugins,
        objc_msgSend(v6, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10 == v6))
  {
    plugins = self->_plugins;
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](plugins, "removeObjectForKey:", v13);

    objc_msgSend(v7, "auxiliaryAnimation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAuxiliaryDeactivationAnimationBlock:", v14);

    -[SBLockScreenPluginManager _refreshLockScreenPlugin](self, "_refreshLockScreenPlugin");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("SBLockScreenPluginWasDisabledNotification"), v6);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pluginManager:willUnloadPlugin:", self, v6);

    objc_msgSend(v6, "setPluginAgent:", 0);
    objc_msgSend(v6, "pluginDidDeactivateWithContext:", v7);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  int v5;
  void *v6;
  int v7;
  id v8;

  v5 = -[CSLockScreenTestPluginSettings enablePlugin](self->_testSettings, "enablePlugin", a3, a4);
  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", CFSTR("LockScreenTestPlugin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SBLockScreenPluginManager enableLockScreenPluginWithContext:](self, "enableLockScreenPluginWithContext:", v6);
  else
    -[SBLockScreenPluginManager disableLockScreenPluginWithContext:](self, "disableLockScreenPluginWithContext:", v6);

  v7 = -[CSLockScreenTestPluginSettings enableLostModePlugin](self->_testSettings, "enableLostModePlugin");
  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", CFSTR("FindMyiPhoneLockScreen"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[SBLockScreenPluginManager enableLockScreenPluginWithContext:](self, "enableLockScreenPluginWithContext:", v8);
  else
    -[SBLockScreenPluginManager disableLockScreenPluginWithContext:](self, "disableLockScreenPluginWithContext:", v8);

}

- (id)_pluginForPluginController:(id)a3
{
  id v4;
  NSMutableDictionary *plugins;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  v17 = 0;
  plugins = self->_plugins;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBLockScreenPluginManager__pluginForPluginController___block_invoke;
  v9[3] = &unk_1E8EB68C8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](plugins, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__SBLockScreenPluginManager__pluginForPluginController___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = v7;
  if (*(id *)(a1 + 32) == v7
    || (objc_msgSend(v7, "controller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = *(void **)(a1 + 32),
        v9,
        v9 == v10))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)activatePluginController:(id)a3
{
  void *v4;
  id v5;

  -[SBLockScreenPluginManager _pluginForPluginController:](self, "_pluginForPluginController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBLockScreenPluginManager _refreshLockScreenPlugin](self, "_refreshLockScreenPlugin");
    v4 = v5;
  }

}

- (void)deactivatePluginController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBLockScreenPluginManager _pluginForPluginController:](self, "_pluginForPluginController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DAC230];
    v8 = v4;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBLockScreenPluginManager _handlePluginDisabled:withContext:](self, "_handlePluginDisabled:withContext:", v8, v7);
    v4 = v8;
  }

}

- (void)pluginController:(id)a3 updateAppearance:(id)a4
{
  SBLockScreenPlugin *v5;
  SBLockScreenPlugin *displayedPlugin;
  id WeakRetained;

  v5 = (SBLockScreenPlugin *)a3;
  -[SBLockScreenPluginManager _refreshLockScreenPlugin](self, "_refreshLockScreenPlugin");
  displayedPlugin = self->_displayedPlugin;

  if (displayedPlugin == v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pluginManager:displayedPluginDidUpdateAppearance:", self, self->_displayedPlugin);

  }
}

- (BOOL)pluginController:(id)a3 sendAction:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id WeakRetained;

  v6 = a4;
  -[SBLockScreenPluginManager _pluginForPluginController:](self, "_pluginForPluginController:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(WeakRetained, "pluginManager:plugin:handleAction:", self, v8, v6);

  }
  return v9;
}

- (id)lockScreenActionContext
{
  void *v3;
  void *v4;
  void *v5;

  +[SBLockScreenActionContextFactory sharedInstance](SBLockScreenActionContextFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginManager activePlugin](self, "activePlugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockScreenActionContextForPlugin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBLockScreenPluginManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenPluginManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (id)objc_msgSend(v3, "appendClass:withName:", objc_opt_class(), CFSTR("delegateClass"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenPluginManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBLockScreenPluginManager *v11;

  v4 = a3;
  -[SBLockScreenPluginManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBLockScreenPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __67__SBLockScreenPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D01748];
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(v2, "succinctDescriptionForObject:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("delegate"), 1);

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("activePlugin"), 1);
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayedPlugin"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("plugins"), 1);
}

- (SBLockScreenPlugin)activePlugin
{
  return self->_activePlugin;
}

- (SBLockScreenPlugin)displayedPlugin
{
  return self->_displayedPlugin;
}

- (SBLockScreenPluginManagerDelegate)delegate
{
  return (SBLockScreenPluginManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedPlugin, 0);
  objc_storeStrong((id *)&self->_activePlugin, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

- (void)handleEvent:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "[SBLockScreenPluginManager] Ignoring event %d because plugins are disabled.", (uint8_t *)v2, 8u);
}

- (void)_loadLockScreenPluginWithContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handlePluginDisabled:withContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
