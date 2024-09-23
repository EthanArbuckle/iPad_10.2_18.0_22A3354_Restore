@implementation SBKeyboardArbiterResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  objc_msgSend(v22, "auditHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addItemWithFormat:", CFSTR("-- SBKeyboardArbiterResolutionStage --"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(v22, "keyboardFocusTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12
      || (objc_msgSend(v12, "sceneIdentityToken"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v11, "shouldPreventFocusForSceneWithIdentityToken:", v14),
          v14,
          v15))
    {
      objc_msgSend(v11, "mostRecentKeyboardArbiterSuggestedTarget");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "auditHistory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        objc_msgSend(v17, "addItemWithFormat:", CFSTR("no keyboard arbiter current suggestion, falling back to MRU suggestion"));

        objc_msgSend(v22, "setKeyboardFocusTarget:", v16);
      }
      else
      {
        objc_msgSend(v17, "addItemWithFormat:", CFSTR("no keyboard arbiter suggestion, falling back to SB scene"));

        v19 = objc_loadWeakRetained((id *)&self->_sceneProvider);
        objc_msgSend(v19, "springBoardSceneFocusTarget");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setKeyboardFocusTarget:", v20);

      }
      objc_msgSend(v22, "setAdvicePolicy:", 2);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate != ((void *)0)"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardArbiterResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.1(a2, (uint64_t)self, (uint64_t)v21);
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
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

- (SBKeyboardArbiterResolutionStageDelegate)delegate
{
  return (SBKeyboardArbiterResolutionStageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  v15 = CFSTR("SBKeyboardArbiterResolutionStage.m");
  v16 = 1024;
  v17 = 30;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
