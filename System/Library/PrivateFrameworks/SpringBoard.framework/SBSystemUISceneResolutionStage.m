@implementation SBSystemUISceneResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v14, "keyboardFocusTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_sceneProvider);
  objc_msgSend(v9, "sceneForFocusTarget:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "auditHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addItemWithFormat:", CFSTR("-- SBSystemUISceneResolutionStage --"));

  objc_msgSend(WeakRetained, "systemUISceneRequestingFocus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && objc_msgSend(v10, "isEqual:", v12))
  {
    objc_msgSend(v14, "auditHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItemWithFormat:", CFSTR("policy: high priority scene"));

    *a5 = 1;
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

- (SBSystemUISceneResolutionStageDelegate)delegate
{
  return (SBSystemUISceneResolutionStageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
