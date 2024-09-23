@implementation SBKeyboardFocusAccessibilityResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "accessibilityKeyboardFocusOverrideTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v16, "auditHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "keyboardFocusTarget");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addItemWithFormat:", CFSTR("-- SBKeyboardFocusAccessibilityResolutionStage overriding keyboard arbiter target (policy was %@, override is %@)"), v14, v12);

      objc_msgSend(v16, "setKeyboardFocusTarget:", v12);
      *a5 = 1;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusAccessibilityResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.1(a2, (uint64_t)self, (uint64_t)v15);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider
{
  return (SBKeyboardFocusResolutionStageSceneProviding *)objc_loadWeakRetained((id *)&self->_sceneProvider);
}

- (void)setSceneProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sceneProvider, a3);
}

- (SBKeyboardFocusAccessibilityResolutionDeelgate)delegate
{
  return (SBKeyboardFocusAccessibilityResolutionDeelgate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneProvider);
}

- (void)resolveKeyboardFocusPolicy:(const char *)a1 context:(uint64_t)a2 stop:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusAccessibilityResolutionStage.m");
  v16 = 1024;
  v17 = 28;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
