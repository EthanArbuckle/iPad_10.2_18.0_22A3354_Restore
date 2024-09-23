@implementation SBSpringBoardOutboundFocusResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "auditHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addItemWithFormat:", CFSTR("-- SBSpringBoardOutboundFocusResolutionStage --"));

  LODWORD(v9) = objc_msgSend(v8, "isScreenDim");
  if ((_DWORD)v9 && !objc_msgSend(v7, "advicePolicy"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
    objc_msgSend(WeakRetained, "springBoardSceneFocusTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setKeyboardFocusTarget:", v11);
    objc_msgSend(v7, "auditHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addItemWithFormat:", CFSTR("rejecting policy: screen is dim -- deferring to SB"));

    SBLogKeyboardFocus();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "policy: outbound rule not allowed -- deferring to SB", v14, 2u);
    }

    objc_msgSend(v7, "setShouldSuppressRemoteDeferring:", 1);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneProvider);
}

@end
