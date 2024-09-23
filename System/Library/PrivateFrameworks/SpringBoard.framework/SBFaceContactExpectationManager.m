@implementation SBFaceContactExpectationManager

- (void)updateFaceContactExpectation
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  unsigned __int8 v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  -[SBFaceContactExpectationManager _frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:](self, "_frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;
  if (self->_faceExpected != v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bs_map:", &__block_literal_global_328);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "scenes expecting face contact:%{public}@", buf, 0xCu);

    }
    self->_faceExpected = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorManager);
    -[SBFaceContactExpectationManager _proximitySensorClientID](self, "_proximitySensorClientID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "client:wantsProximityDetectionEnabled:disableGracePeriod:", v8, self->_faceExpected, v9);

  }
}

- (id)_frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:(BOOL *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  objc_msgSend(WeakRetained, "topmostForegroundUIScenesMatching:", &__block_literal_global_15_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_filter:", &__block_literal_global_17_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v10 |= -[SBFaceContactExpectationManager _sceneHasBypassEntitlement:](self, "_sceneHasBypassEntitlement:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  *a3 = v10 & 1;

  return v7;
}

unint64_t __102__SBFaceContactExpectationManager__frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a2, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "proximityDetectionModes") & 4) != 0)
    v3 = 1;
  else
    v3 = ((unint64_t)objc_msgSend(v2, "proximityDetectionModes") >> 3) & 1;

  return v3;
}

BOOL __102__SBFaceContactExpectationManager__frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "proximityDetectionModes") != 0;
}

- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBFaceContactExpectationManager *v7;

  v4 = (void *)SBApp;
  v5 = a3;
  objc_msgSend(v4, "proximitySensorManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBFaceContactExpectationManager initWithSceneManager:proximitySensorManager:](self, "initWithSceneManager:proximitySensorManager:", v5, v6);

  return v7;
}

- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3 proximitySensorManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBFaceContactExpectationManager *v10;
  id *p_isa;
  SBFaceContactExpectationManager *v12;
  void *v14;
  _QWORD block[4];
  SBFaceContactExpectationManager *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sceneManager != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBFaceContactExpectationManager initWithSceneManager:proximitySensorManager:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0C0E1B4);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxManager != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBFaceContactExpectationManager initWithSceneManager:proximitySensorManager:].cold.2(a2);
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBFaceContactExpectationManager;
  v10 = -[SBFaceContactExpectationManager init](&v17, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sceneManager, v7);
    objc_storeWeak(p_isa + 2, v9);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBFaceContactExpectationManager_initWithSceneManager_proximitySensorManager___block_invoke;
  block[3] = &unk_1E8E9DED8;
  v12 = p_isa;
  v16 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return v12;
}

uint64_t __79__SBFaceContactExpectationManager_initWithSceneManager_proximitySensorManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFaceContactExpectation");
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_faceExpected, CFSTR("_faceExpected"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __63__SBFaceContactExpectationManager_updateFaceContactExpectation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)_sceneHasBypassEntitlement:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v4)
  {
    objc_msgSend(v4, "auditToken", 0, 0, 0, 0);
    if ((BSAuditTokenTaskHasEntitlement() & 1) != 0)
      v5 = 1;
  }

  return v5;
}

- (id)_proximitySensorClientID
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximitySensorManager);
  objc_destroyWeak((id *)&self->_sceneManager);
}

- (void)initWithSceneManager:(const char *)a1 proximitySensorManager:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSceneManager:(const char *)a1 proximitySensorManager:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
