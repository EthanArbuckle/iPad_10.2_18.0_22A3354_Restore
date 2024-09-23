@implementation SBSABasePreferencesProvider

void __84__SBSABasePreferencesProvider_newAnimatedTransitionDescriptionWithBehaviorSettings___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (!v15)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v9 = a1[6];
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSABasePreferencesProvider.m"), 78, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimatedTransitionIdentifier:", v13);

  objc_msgSend(v6, "setBehaviorSettings:", a1[4]);
  objc_msgSend((id)a1[6], "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponsibleProviderDebugString:", v14);

}

- (id)firstChildPreferenceProviderOfClass:(Class)a3
{
  SBSABasePreferencesProvider *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = self;
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v4, "childProvider");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
      if (!v5)
        goto LABEL_5;
    }
    v6 = v4;
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (SBSAStackablePreferencesProviding)childProvider
{
  return self->_childProvider;
}

+ (id)newAnimatedTransitionDescriptionWithBehaviorSettings:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__SBSABasePreferencesProvider_newAnimatedTransitionDescriptionWithBehaviorSettings___block_invoke;
    v9[3] = &unk_1E8EA2CC8;
    v11 = a2;
    v12 = a1;
    v10 = v5;
    +[SBSAAnimatedTransitionDescription instanceWithBlock:](SBSAAnimatedTransitionDescription, "instanceWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  -[SBSABasePreferencesProvider defaultTransitionSettings](self, "defaultTransitionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    v11 = objc_opt_class();
    v12 = v7;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    if (v14)
    {
      if (BSEqualStrings())
      {
        objc_msgSend(v14, "sensorObscuringShadowBehaviorSettings");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        v16 = (void *)v15;
        goto LABEL_36;
      }
      if ((objc_msgSend(v4, "hasPrefix:", CFSTR("leadingView")) & 1) != 0
        || (objc_msgSend(v4, "hasPrefix:", CFSTR("trailingView")) & 1) != 0
        || objc_msgSend(v4, "hasPrefix:", CFSTR("minimalView")))
      {
        objc_msgSend(v14, "subcomponentBehaviorSettings");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("customContent")))
      {
        objc_msgSend(v14, "customContentBehaviorSettings");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("snapshotView")))
      {
        objc_msgSend(v14, "snapshotBehaviorSettings");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    v16 = 0;
LABEL_36:

    if (v16)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (BSEqualStrings())
  {
    objc_msgSend(v9, "centerBehaviorSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (BSEqualStrings())
  {
    objc_msgSend(v9, "cornerRadiusBehaviorSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (BSEqualStrings())
  {
    objc_msgSend(v9, "alphaBehaviorSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!BSEqualStrings())
    {
LABEL_29:
      objc_msgSend(v7, "defaultBehaviorSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    objc_msgSend(v9, "backgroundColorBehaviorSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v10;
  if (!v10)
    goto LABEL_29;
LABEL_30:

  return v16;
}

+ (SBSystemApertureSettings)settings
{
  if (settings_onceToken_0 != -1)
    dispatch_once(&settings_onceToken_0, &__block_literal_global_31);
  return (SBSystemApertureSettings *)(id)settings___settings;
}

- (SBSAStackablePreferencesProviding)parentProvider
{
  return (SBSAStackablePreferencesProviding *)objc_loadWeakRetained((id *)&self->_parentProvider);
}

- (SBSystemApertureTransitionSettings)defaultTransitionSettings
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultInterfaceElementTransitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemApertureTransitionSettings *)v3;
}

- (id)newAnimatedTransitionDescriptionForProperty:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  if (a4)
    -[SBSABasePreferencesProvider behaviorSettingsForProperty:](self, "behaviorSettingsForProperty:", v6);
  else
    objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v8);

  return v9;
}

- (id)newAnimatedTransitionDescriptionForProperty:(id)a3
{
  return -[SBSABasePreferencesProvider newAnimatedTransitionDescriptionForProperty:animated:](self, "newAnimatedTransitionDescriptionForProperty:animated:", a3, 1);
}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  SBSAStackablePreferencesProviding *childProvider;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  childProvider = self->_childProvider;
  if (childProvider)
  {
    -[SBSAStackablePreferencesProviding preferencesFromContext:](childProvider, "preferencesFromContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_class();
    v8 = v4;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "preferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)firstChildPreferenceProviderRespondingToSelector:(SEL)a3
{
  SBSABasePreferencesProvider *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = self;
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v4, "childProvider");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
      if (!v5)
        goto LABEL_5;
    }
    v6 = v4;
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

void __39__SBSABasePreferencesProvider_settings__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)settings___settings;
  settings___settings = v0;

}

+ (id)newUnanimatedTransitionDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v3);

  return v4;
}

- (SBSABasePreferencesProvider)initWithParentProvider:(id)a3
{
  id v4;
  SBSABasePreferencesProvider *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSABasePreferencesProvider;
  v5 = -[SBSABasePreferencesProvider init](&v7, sel_init);
  if (v5)
    objc_msgSend(v4, "setChildProvider:", v5);

  return v5;
}

- (SBSABasePreferencesProvider)init
{
  return -[SBSABasePreferencesProvider initWithParentProvider:](self, "initWithParentProvider:", 0);
}

- (void)setChildProvider:(id)a3
{
  SBSAStackablePreferencesProviding *v6;
  NSObject *v7;
  SBSABasePreferencesProvider *v8;
  SBSAStackablePreferencesProviding *childProvider;
  uint64_t v10;
  SBSAStackablePreferencesProviding *v11;
  SBSAStackablePreferencesProviding *v12;
  id *v13;
  uint64_t v14;
  SBSAStackablePreferencesProviding *v15;
  SBSAStackablePreferencesProviding *v16;
  id *v17;
  void *v18;

  v6 = (SBSAStackablePreferencesProviding *)a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    SBLogSystemAperturePreferencesStackMutation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBSABasePreferencesProvider setChildProvider:].cold.1((uint64_t)v6, (uint64_t)self, v7);

    v8 = self;
    objc_sync_enter(v8);
    childProvider = v8->_childProvider;
    if (childProvider != v6)
    {
      v10 = objc_opt_class();
      v11 = childProvider;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      objc_storeStrong((id *)&v8->_childProvider, a3);
      v14 = objc_opt_class();
      v15 = v6;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;

      objc_storeWeak(v17 + 2, v8);
      objc_storeStrong(v17 + 3, v12);
      if (v13)
        objc_storeWeak(v13 + 2, v17);

    }
    objc_sync_exit(v8);

  }
}

- (void)removeFromParentProvider
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Removing Provider: %@", (uint8_t *)&v2, 0xCu);
}

- (id)stackDepiction
{
  SBSABasePreferencesProvider *v2;
  void *v3;
  SBSABasePreferencesProvider *v4;
  SBSABasePreferencesProvider *v5;
  void *v6;
  SBSABasePreferencesProvider *v7;
  SBSABasePreferencesProvider *v8;
  id v9;
  SBSABasePreferencesProvider *v10;
  SBSABasePreferencesProvider *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;

  v2 = self;
  -[SBSABasePreferencesProvider parentProvider](v2, "parentProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v2;
  if (v3)
  {
    v5 = v2;
    do
    {
      -[SBSABasePreferencesProvider parentProvider](v5, "parentProvider");
      v4 = (SBSABasePreferencesProvider *)objc_claimAutoreleasedReturnValue();

      -[SBSABasePreferencesProvider parentProvider](v4, "parentProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v4;
    }
    while (v6);
  }
  v7 = v4;
  v8 = v2;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = v7;
  v11 = v10;
  if (v10)
  {
    v12 = CFSTR("@ ");
    v13 = v10;
    while (1)
    {
      objc_msgSend(v13, "descriptionForStackDepiction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = BSEqualObjects() ? CFSTR("* ") : (__CFString *)v12;
      objc_msgSend(v15, "insertString:atIndex:", v16, 0);
      objc_msgSend(v13, "childProvider");
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
        break;
      objc_msgSend(v15, "appendString:", CFSTR("\n"));
      objc_msgSend(v9, "appendString:", v15);

      v13 = (void *)v17;
      v12 = CFSTR("| ");
    }
    objc_msgSend(v9, "appendString:", v15);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childProvider, 0);
  objc_destroyWeak((id *)&self->_parentProvider);
  objc_storeStrong((id *)&self->_childProviders, 0);
}

- (void)setChildProvider:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Inserting Provider: %@ as child of %@", (uint8_t *)&v3, 0x16u);
}

@end
