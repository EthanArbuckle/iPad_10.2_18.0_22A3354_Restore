@implementation SBSALayoutModeSupportingProvider

- (id)preferencesFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "elementContexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v9, "bs_firstObjectPassingTest:", &__block_literal_global_313);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = 3;
      }
      else if (v11 > 1)
      {
        v13 = 1;
      }
      else
      {
        objc_msgSend(v9, "sbsa_onlyObjectOrNil");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "layoutMode");

        if (v18 == 1)
          v13 = 1;
        else
          v13 = 2;
      }
      -[SBSALayoutModeSupportingProvider _transitionToLayoutModeIfNecessary:context:](self, "_transitionToLayoutModeIfNecessary:context:", v13, v8);

    }
    else
    {
      SBLogSystemAperturePreferencesStackElements();
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
        -[SBSALayoutModeSupportingProvider preferencesFromContext:].cold.1(v8, v14);

      WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionProvider);
      objc_msgSend(WeakRetained, "removeFromParentProvider");
      objc_storeWeak((id *)&self->_activeTransitionProvider, 0);
      -[SBSABasePreferencesProvider firstChildPreferenceProviderRespondingToSelector:](self, "firstChildPreferenceProviderRespondingToSelector:", sel_supportedElementLayoutMode);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromParentProvider");

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SBSALayoutModeSupportingProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v21, sel_preferencesFromContext_, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

BOOL __59__SBSALayoutModeSupportingProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutMode") == 3;
}

- (void)_transitionToLayoutModeIfNecessary:(int64_t)a3 context:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  char *v14;
  uint64_t v15;
  int v16;
  SBSALayoutTransitionProvider *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionProvider);
  -[SBSABasePreferencesProvider firstChildPreferenceProviderRespondingToSelector:](self, "firstChildPreferenceProviderRespondingToSelector:", sel_supportedElementLayoutMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "supportedElementLayoutMode") == a3)
  {
    v9 = v8;
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v6, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isCollisionImminent");

      if (!v12)
        goto LABEL_18;
      SBLogSystemAperturePreferencesStackElements();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v19 = 134349570;
        v20 = objc_msgSend(v6, "queryIteration");
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = WeakRetained;
        _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "[%{public}lu] Layout provider for desired layout mode exists, but collision required – removing layout provider '%@', transition provider '%@'", (uint8_t *)&v19, 0x20u);
      }

      objc_msgSend(v10, "removeFromParentProvider");
      objc_msgSend(WeakRetained, "removeFromParentProvider");

      objc_storeWeak((id *)&self->_activeTransitionProvider, 0);
      WeakRetained = 0;
    }
  }
  SBLogSystemAperturePreferencesStackElements();
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    -[SBSALayoutModeSupportingProvider _transitionToLayoutModeIfNecessary:context:].cold.2(v6, v14);

  v15 = objc_msgSend(WeakRetained, "targetElementLayoutMode");
  v16 = objc_msgSend(WeakRetained, "isInitialized") ^ 1;
  if (v15 == a3)
    LOBYTE(v16) = 1;
  if (!WeakRetained || (v16 & 1) == 0)
  {
    v17 = objc_alloc_init(SBSALayoutTransitionProvider);
    objc_storeWeak((id *)&self->_activeTransitionProvider, v17);
    -[SBSABasePreferencesProvider setChildProvider:](self, "setChildProvider:", v17);
    SBLogSystemAperturePreferencesStackElements();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutModeSupportingProvider _transitionToLayoutModeIfNecessary:context:].cold.1(v6, (const char *)v17, v18);

    objc_msgSend(WeakRetained, "removeFromParentProvider");
  }
  v10 = 0;
LABEL_18:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeTransitionProvider);
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] No elements – removing all transition and element providers", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)_transitionToLayoutModeIfNecessary:(NSObject *)a3 context:.cold.1(void *a1, const char *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;

  v5 = 134349314;
  v6 = OUTLINED_FUNCTION_3_0(a1, a2);
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added new transition provider: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2_2();
}

- (void)_transitionToLayoutModeIfNecessary:(void *)a1 context:(const char *)a2 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] No layout provider for desired layout mode – transition required", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_2_2();
}

@end
