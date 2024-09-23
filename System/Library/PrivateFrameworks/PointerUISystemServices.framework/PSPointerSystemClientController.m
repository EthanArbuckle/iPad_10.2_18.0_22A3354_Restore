@implementation PSPointerSystemClientController

- (PSPointerSystemClientController)init
{
  PSPointerSystemClientController *v2;
  uint64_t v3;
  RBSProcessIdentity *pointerUIDProcessIdentity;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSPointerSystemClientController;
  v2 = -[PSPointerSystemClientController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForDaemonJobLabel:", CFSTR("com.apple.PointerUI.pointeruid"));
    v3 = objc_claimAutoreleasedReturnValue();
    pointerUIDProcessIdentity = v2->_pointerUIDProcessIdentity;
    v2->_pointerUIDProcessIdentity = (RBSProcessIdentity *)v3;

  }
  return v2;
}

- (void)prepareScenesForPointerForDisplayConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hardwareIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D12C3000, v5, OS_LOG_TYPE_DEFAULT, "Preparing scenes for display with hardware identifier: %{public}@ displayConfiguration: %@", (uint8_t *)&v7, 0x16u);

  }
  -[PSPointerSystemClientController _prepareSceneForIdentifierPrefix:displayConfiguration:](self, "_prepareSceneForIdentifierPrefix:displayConfiguration:", CFSTR("com.apple.PointerUI.pointeruid.pointerRenderingScene"), v4);
  -[PSPointerSystemClientController _prepareSceneForIdentifierPrefix:displayConfiguration:](self, "_prepareSceneForIdentifierPrefix:displayConfiguration:", CFSTR("com.apple.PointerUI.pointeruid.systemPointerScene"), v4);

}

- (void)_prepareSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  id v7;
  FBSceneWorkspace *v8;
  FBSceneWorkspace *sceneWorkspace;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  RBSProcessIdentity *v21;
  FBSceneWorkspace *v22;
  uint64_t v23;
  RBSProcessIdentity *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  double v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  RBSProcessIdentity *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_sceneWorkspace)
  {
    v8 = (FBSceneWorkspace *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", CFSTR("PSPointerClientControllerWorkspaceIdentifier"));
    sceneWorkspace = self->_sceneWorkspace;
    self->_sceneWorkspace = v8;

    -[FBSceneWorkspace setDelegate:](self->_sceneWorkspace, "setDelegate:", self);
  }
  -[PSPointerSystemClientController _sceneIdentifierForIdentifierPrefix:displayConfiguration:](self, "_sceneIdentifierForIdentifierPrefix:displayConfiguration:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace sceneWithIdentifier:](self->_sceneWorkspace, "sceneWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PSLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v10;
      _os_log_impl(&dword_1D12C3000, v12, OS_LOG_TYPE_DEFAULT, "Activating existing scene with identifier: %{public}@", buf, 0xCu);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_12;
    v27[3] = &unk_1E91E3128;
    v28 = v7;
    v14 = v7;
    objc_msgSend(v11, "updateSettingsWithBlock:", v27);
    objc_msgSend(v11, "activateWithTransitionContext:", 0);
    objc_msgSend(v11, "setDelegate:", self);
    -[PSPointerSystemClientController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointerClientController:sceneDidActivate:", self, v11);

    v16 = v28;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v10;
      _os_log_impl(&dword_1D12C3000, v12, OS_LOG_TYPE_DEFAULT, "Creating new scene with identifier: %{public}@", buf, 0xCu);
    }

    v17 = (void *)objc_opt_new();
    if (objc_msgSend(v10, "containsString:", CFSTR("com.apple.PointerUI.pointeruid.pointerRenderingScene")))v18 = -1000.0;
    else
      v18 = 10000015.5;
    objc_msgSend(v17, "setPreferredLevel:", v18);
    objc_msgSend(v17, "setPreferredInterfaceOrientation:", 1);
    objc_msgSend(MEMORY[0x1E0D23150], "settings");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisplayConfiguration:", v7);
    objc_msgSend(v7, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v14, "setLevel:", v18);
    objc_msgSend(v14, "setInterfaceOrientation:", 1);
    objc_msgSend(v14, "setForeground:", 1);
    v19 = (void *)MEMORY[0x1E0D23148];
    objc_msgSend(MEMORY[0x1E0D23240], "specification");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parametersForSpecification:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSettings:", v14);
    objc_msgSend(v16, "setClientSettings:", v17);
    v21 = self->_pointerUIDProcessIdentity;
    v22 = self->_sceneWorkspace;
    v23 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke;
    v34[3] = &unk_1E91E30B0;
    v35 = v10;
    v36 = v21;
    v24 = v21;
    -[FBSceneWorkspace createScene:](v22, "createScene:", v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_2;
    v29[3] = &unk_1E91E3100;
    v30 = v17;
    v31 = v7;
    v32 = v18;
    v33 = 1;
    v25 = v7;
    v26 = v17;
    objc_msgSend(v11, "configureParameters:", v29);
    objc_msgSend(v11, "activateWithTransitionContext:", 0);

  }
}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentity:", v5);

  objc_msgSend(MEMORY[0x1E0D23240], "specification");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpecification:", v6);

}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setClientSettings:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_3;
  v5[3] = &unk_1E91E30D8;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "updateSettingsWithBlock:", v5);

}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setLevel:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setInterfaceOrientation:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setForeground:", 1);

}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)invalidateScenesForPointerForDisplayConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hardwareIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D12C3000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating scenes for display with hardware identifier: %{public}@ displayConfiguration: %@", (uint8_t *)&v7, 0x16u);

  }
  -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:](self, "_invalidateSceneForIdentifierPrefix:displayConfiguration:", CFSTR("com.apple.PointerUI.pointeruid.pointerRenderingScene"), v4);
  -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:](self, "_invalidateSceneForIdentifierPrefix:displayConfiguration:", CFSTR("com.apple.PointerUI.pointeruid.systemPointerScene"), v4);

}

- (void)_invalidateSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (self->_sceneWorkspace)
  {
    -[PSPointerSystemClientController _sceneIdentifierForIdentifierPrefix:displayConfiguration:](self, "_sceneIdentifierForIdentifierPrefix:displayConfiguration:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[FBSceneWorkspace sceneWithIdentifier:](self->_sceneWorkspace, "sceneWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "invalidate");
    }
    else
    {
      PSLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:].cold.2((uint64_t)v6, v11);

    }
  }
  else
  {
    PSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:].cold.1((uint64_t)v6, v7, v8);
  }

}

- (id)_sceneIdentifierForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "hardwareIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("Main");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  objc_msgSend(a4, "setDelegate:", self);
}

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  objc_msgSend(a4, "handle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_pointerUIDProcessIdentity);

  if (v7)
  {
    PSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D12C3000, v8, OS_LOG_TYPE_DEFAULT, "pointeruid wants workspace handshake", v10, 2u);
    }

    -[FBSceneWorkspace allScenes](self->_sceneWorkspace, "allScenes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global);

  }
}

void __75__PSPointerSystemClientController_workspace_clientDidConnectWithHandshake___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_msgSend(v2, "isActive") & 1) == 0)
  {
    PSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D12C3000, v3, OS_LOG_TYPE_DEFAULT, "reactivating scene: %{public}@", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(v2, "activateWithTransitionContext:", 0);
  }

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSPointerSystemClientController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointerClientController:sceneDidActivate:", self, v4);

}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PSPointerSystemClientController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointerClientController:sceneWillDeactivate:", self, v5);

}

- (PSPointerSystemClientControllerDelegate)delegate
{
  return (PSPointerSystemClientControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerUIDProcessIdentity, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

- (void)_invalidateSceneForIdentifierPrefix:(NSObject *)a3 displayConfiguration:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D12C3000, a3, OS_LOG_TYPE_ERROR, "Scene workspace is not avaialble when invalidating scene %@ for %@", (uint8_t *)&v6, 0x16u);

}

- (void)_invalidateSceneForIdentifierPrefix:(uint64_t)a1 displayConfiguration:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D12C3000, a2, OS_LOG_TYPE_ERROR, "Could not find scene with %{public}@ to invalidate", (uint8_t *)&v2, 0xCu);
}

@end
