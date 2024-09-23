@implementation SBFSceneWorkspaceController

- (id)sceneFromIdentityToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFSceneWorkspaceController sceneFromIdentityTokenStringRepresentation:](self, "sceneFromIdentityTokenStringRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenString"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SBFSceneWorkspaceController_sceneFromIdentityTokenStringRepresentation___block_invoke;
  v10[3] = &unk_1E200E528;
  v6 = v5;
  v11 = v6;
  v12 = &v13;
  -[SBFSceneWorkspaceController enumerateScenesWithBlock:](self, "enumerateScenesWithBlock:", v10);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, BOOL *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, BOOL *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FBSceneWorkspace allScenes](self->_sceneWorkspace, "allScenes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), &v16);
      if (v16)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v10 = v16;
  return v10;
}

void __74__SBFSceneWorkspaceController_sceneFromIdentityTokenStringRepresentation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SBFSceneWorkspaceController)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBFSceneWorkspaceController *v10;
  SBFSceneWorkspaceController *v11;
  uint64_t v12;
  FBSceneWorkspace *sceneWorkspace;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)SBFSceneWorkspaceController;
  v10 = -[SBFSceneWorkspaceController init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", v7);
    sceneWorkspace = v11->_sceneWorkspace;
    v11->_sceneWorkspace = (FBSceneWorkspace *)v12;

    -[FBSceneWorkspace setDelegate:](v11->_sceneWorkspace, "setDelegate:", v9);
  }

  return v11;
}

- (NSString)sceneWorkspaceIdentifier
{
  return (NSString *)-[FBSceneWorkspace identifier](self->_sceneWorkspace, "identifier");
}

- (void)createSceneForProcessIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  FBSceneWorkspace *sceneWorkspace;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  SBFSceneWorkspaceController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_3:
  sceneWorkspace = self->_sceneWorkspace;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke;
  v24[3] = &unk_1E200E4D8;
  v14 = v10;
  v25 = v14;
  v26 = v9;
  v15 = v9;
  -[FBSceneWorkspace createScene:](sceneWorkspace, "createScene:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke_2;
  v22[3] = &unk_1E200E500;
  v23 = v14;
  v17 = v14;
  objc_msgSend(v16, "configureParameters:", v22);
  SBLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFSceneWorkspaceController sceneWorkspaceIdentifier](self, "sceneWorkspaceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v28 = self;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v16;
    _os_log_impl(&dword_18AB69000, v18, OS_LOG_TYPE_DEFAULT, "SceneWorkspace[%p-%{public}@] di create App scene: %{public}@", buf, 0x20u);

  }
  if (v11)
    v11[2](v11, v16, 0);

}

void __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpecification:", v6);

  objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentity:", v7);

}

void __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "initialClientSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientSettings:", v4);

}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBSceneWorkspace allScenes](self->_sceneWorkspace, "allScenes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setDelegate:", 0);
        objc_msgSend(v8, "invalidate");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[FBSceneWorkspace setDelegate:](self->_sceneWorkspace, "setDelegate:", 0);
  -[FBSceneWorkspace invalidate](self->_sceneWorkspace, "invalidate");
}

- (NSString)debugDescription
{
  return (NSString *)-[SBFSceneWorkspaceController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFSceneWorkspaceController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFSceneWorkspaceController sceneWorkspaceIdentifier](self, "sceneWorkspaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFSceneWorkspaceController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  FBSceneWorkspace *sceneWorkspace;
  void *v8;
  id v9;

  -[SBFSceneWorkspaceController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace delegate](self->_sceneWorkspace, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("FB workspace Delegate"));

  if (-[FBSceneWorkspace conformsToProtocol:](self->_sceneWorkspace, "conformsToProtocol:", &unk_1EDF98F18))sceneWorkspace = self->_sceneWorkspace;
  else
    sceneWorkspace = 0;
  -[FBSceneWorkspace succinctDescription](sceneWorkspace, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("FB workspace minus scenes"));

  return v4;
}

- (SBFSceneWorkspaceControllerDelegate)delegate
{
  return (SBFSceneWorkspaceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

@end
