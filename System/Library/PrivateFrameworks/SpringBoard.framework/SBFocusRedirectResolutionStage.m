@implementation SBFocusRedirectResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "auditHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemWithFormat:", CFSTR("-- SBFocusRedirectResolutionStage --"));

  objc_msgSend(v6, "keyboardFocusTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "keyboardFocusRedirectionForTarget:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "toToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v11, objc_msgSend(v10, "toProcessIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setKeyboardFocusTarget:", v12);
    objc_msgSend(v6, "setShouldSuppressRemoteDeferring:", 1);
    objc_msgSend(v6, "auditHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItemWithFormat:", CFSTR("target REDIRECTION reason:%@"), v14);

    SBLogKeyboardFocus();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "reason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v16;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "policy: REDIRECTION target:%{public}@ reason: %{public}@", buf, 0x16u);

    }
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

- (SBFocusRedirectResolutionStageDelegate)delegate
{
  return (SBFocusRedirectResolutionStageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
