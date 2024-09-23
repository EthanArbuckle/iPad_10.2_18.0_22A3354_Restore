@implementation SBWorkspaceTransitionRequest

- (FBSDisplayIdentity)displayIdentity
{
  return (FBSDisplayIdentity *)-[FBSDisplayConfiguration identity](self->_displayConfiguration, "identity");
}

- (void)finalize
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_finalized)
  {
    self->_finalized = 1;
    if (!self->_displayConfiguration)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionRequest.m"), 129, CFSTR("must have a display"));

    }
    if (!self->_workspace)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionRequest.m"), 130, CFSTR("must have a workspace"));

    }
    -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequest:", self);

    -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finalize");

  }
}

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBWorkspaceTransitionRequest *v11;
  SBWorkspaceTransitionRequest *v12;
  void *v13;
  uint64_t v14;
  NSUUID *uniqueID;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBLayoutStateTransitionCoordinator *layoutStateTransitionCoordinator;
  SBWorkspaceApplicationSceneTransitionContext *v21;
  SBWorkspaceApplicationSceneTransitionContext *applicationContext;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionRequest.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspace"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionRequest.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SBWorkspaceTransitionRequest;
  v11 = -[SBWorkspaceTransitionRequest init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workspace, a3);
    objc_storeStrong((id *)&v12->_displayConfiguration, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    uniqueID = v12->_uniqueID;
    v12->_uniqueID = (NSUUID *)v14;

    objc_msgSend((id)SBApp, "windowSceneManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowSceneForDisplayIdentity:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutStateTransitionCoordinator");
    v19 = objc_claimAutoreleasedReturnValue();
    layoutStateTransitionCoordinator = v12->_layoutStateTransitionCoordinator;
    v12->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v19;

    v12->_interfaceOrientation = 0;
    v21 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    applicationContext = v12->_applicationContext;
    v12->_applicationContext = v21;

    -[SBWorkspaceTransitionContext setRequest:](v12->_applicationContext, "setRequest:", v12);
  }

  return v12;
}

- (void)setApplicationContext:(id)a3
{
  SBWorkspaceApplicationSceneTransitionContext *v5;
  SBWorkspaceApplicationSceneTransitionContext *applicationContext;
  SBWorkspaceApplicationSceneTransitionContext *v7;

  v5 = (SBWorkspaceApplicationSceneTransitionContext *)a3;
  applicationContext = self->_applicationContext;
  if (applicationContext != v5)
  {
    v7 = v5;
    -[SBWorkspaceTransitionContext setRequest:](applicationContext, "setRequest:", 0);
    objc_storeStrong((id *)&self->_applicationContext, a3);
    -[SBWorkspaceTransitionContext setRequest:](self->_applicationContext, "setRequest:", self);
    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientOverlayContext, 0);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (SBWorkspaceTransientOverlayTransitionContext)transientOverlayContext
{
  return self->_transientOverlayContext;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return -[SBLayoutStateTransitionCoordinator previousLayoutStateForApplicationTransitionContext:](self->_layoutStateTransitionCoordinator, "previousLayoutStateForApplicationTransitionContext:", a3);
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  return -[SBLayoutStateTransitionCoordinator layoutStateForApplicationTransitionContext:](self->_layoutStateTransitionCoordinator, "layoutStateForApplicationTransitionContext:", a3);
}

- (SBWorkspaceApplicationSceneTransitionContext)applicationContext
{
  return self->_applicationContext;
}

- (NSString)eventLabel
{
  return self->_eventLabel;
}

- (SBWorkspace)workspace
{
  return self->_workspace;
}

- (void)setEventLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setTransientOverlayContext:(id)a3
{
  objc_storeStrong((id *)&self->_transientOverlayContext, a3);
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v6 = a3;
  v7 = a4;
  -[SBLayoutStateTransitionCoordinator sceneEntityFrameProvider](self->_layoutStateTransitionCoordinator, "sceneEntityFrameProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "layoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneEntityFrameForWorkspaceEntity:inLayoutState:", v7, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)compactDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_eventLabel, CFSTR("eventLabel"), 1);
  -[FBSDisplayConfiguration identity](self->_displayConfiguration, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("display"));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SBWorkspaceTransitionRequest_compactDescriptionBuilder__block_invoke;
  v11[3] = &unk_1E8E9E820;
  v11[4] = self;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWorkspaceTransitionRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBWorkspaceTransitionRequest *v11;

  v4 = a3;
  -[SBWorkspaceTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBWorkspaceTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __70__SBWorkspaceTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("displayConfiguration"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("applicationContext"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("transientOverlayContext"), 1);
}

void __57__SBWorkspaceTransitionRequest_compactDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "activeMultilinePrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "compactDescriptionBuilderWithMultilinePrefix:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("applicationContext"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  v9 = *(void **)(v2 + 80);
  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v10, "activeMultilinePrefix");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "compactDescriptionBuilderWithMultilinePrefix:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "build");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "appendObject:withName:", v12, CFSTR("transientOverlayContext"));

  }
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)modifyApplicationContext:(id)a3
{
  id v4;
  SBWorkspaceApplicationSceneTransitionContext *applicationContext;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    applicationContext = self->_applicationContext;
    v7 = v4;
    if (!applicationContext)
    {
      +[SBWorkspaceTransitionContext context](SBWorkspaceApplicationSceneTransitionContext, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceTransitionRequest setApplicationContext:](self, "setApplicationContext:", v6);

      v4 = v7;
      applicationContext = self->_applicationContext;
    }
    (*((void (**)(id, SBWorkspaceApplicationSceneTransitionContext *))v4 + 2))(v7, applicationContext);
    v4 = v7;
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_eventLabel, CFSTR("eventLabel"), 1);
  -[FBSDisplayConfiguration identity](self->_displayConfiguration, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("display"));

  return v3;
}

- (NSSet)toApplicationSceneEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSString)description
{
  return (NSString *)-[SBWorkspaceTransitionRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)declineWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_finalized)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBWorkspaceTransitionRequest succinctDescription](self, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Transition request %{public}@ was declined: %{public}@", buf, 0x16u);

    }
    -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FBSOpenApplicationErrorCreate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendActivationResultError:", v8, v4);

  }
}

- (void)setOriginatingProcess:(id)a3
{
  objc_storeStrong((id *)&self->_originatingProcess, a3);
}

- (void)setEventLabelWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[SBWorkspaceTransitionRequest setEventLabel:](self, "setEventLabel:", v6);
}

- (SBWorkspaceTransitionRequest)init
{
  return (SBWorkspaceTransitionRequest *)-[SBWorkspaceTransitionRequest _initWithWorkspace:displayConfiguration:](self, "_initWithWorkspace:displayConfiguration:", 0, 0);
}

- (void)modifyTransientOverlayContext:(id)a3
{
  id v4;
  SBWorkspaceTransientOverlayTransitionContext *transientOverlayContext;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    transientOverlayContext = self->_transientOverlayContext;
    v7 = v4;
    if (!transientOverlayContext)
    {
      +[SBWorkspaceTransitionContext context](SBWorkspaceTransientOverlayTransitionContext, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceTransitionRequest setTransientOverlayContext:](self, "setTransientOverlayContext:", v6);

      v4 = v7;
      transientOverlayContext = self->_transientOverlayContext;
    }
    (*((void (**)(id, SBWorkspaceTransientOverlayTransitionContext *))v4 + 2))(v7, transientOverlayContext);
    v4 = v7;
  }

}

- (void)setDisplayConfiguration:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  SBLayoutStateTransitionCoordinator *v8;
  SBLayoutStateTransitionCoordinator *layoutStateTransitionCoordinator;
  FBSDisplayConfiguration *v10;

  v10 = (FBSDisplayConfiguration *)a3;
  if (self->_displayConfiguration != v10)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSDisplayConfiguration identity](v10, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutStateTransitionCoordinator");
    v8 = (SBLayoutStateTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
    layoutStateTransitionCoordinator = self->_layoutStateTransitionCoordinator;
    self->_layoutStateTransitionCoordinator = v8;

  }
}

- (BOOL)isMainWorkspaceTransitionRequest
{
  return 0;
}

- (NSSet)fromApplicationSceneEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

@end
