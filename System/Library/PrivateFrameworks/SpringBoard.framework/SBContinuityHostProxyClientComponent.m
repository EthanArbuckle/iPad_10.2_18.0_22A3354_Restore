@implementation SBContinuityHostProxyClientComponent

- (void)setScene:(id)a3
{
  uint64_t v5;
  BSServiceConnectionEndpointInjector *v6;
  BSServiceConnectionEndpointInjector *openAppInstanceInjector;
  _QWORD v8[5];
  _QWORD block[6];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBContinuityHostProxyClientComponent;
  -[FBSSceneComponent setScene:](&v10, sel_setScene_, a3);
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBContinuityHostProxyClientComponent_setScene___block_invoke;
  block[3] = &unk_1E8E9DE88;
  block[4] = self;
  block[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __49__SBContinuityHostProxyClientComponent_setScene___block_invoke_2;
  v8[3] = &unk_1E8EBA898;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0D23020], "injectorWithConfigurator:", v8);
  v6 = (BSServiceConnectionEndpointInjector *)objc_claimAutoreleasedReturnValue();
  openAppInstanceInjector = self->_openAppInstanceInjector;
  self->_openAppInstanceInjector = v6;

}

void __49__SBContinuityHostProxyClientComponent_setScene___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sceneManagerForDisplayIdentity:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addUserInterfaceStyleObserver:");
    objc_msgSend(*(id *)(a1 + 32), "sceneManager:didUpdateUserInterfaceStyle:withAnimationSettings:fence:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "userInterfaceStyle"), 0, 0);
    objc_msgSend((id)SBApp, "sceneRenderingEnvironmentManager");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBContinuityHostProxyClientComponent.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerParticipantForSceneWithIdentifier:displayConfiguration:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setSceneRenderingEnvironmentParticipant:", v15);

  }
}

void __49__SBContinuityHostProxyClientComponent_setScene___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D87DF8];
  v10 = a2;
  v4 = getpid();
  objc_msgSend(*(id *)(a1 + 32), "clientScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVisibilityEnvironmentForSceneIdentityToken();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetWithPid:environmentIdentifier:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTarget:", v8);

  objc_msgSend(v10, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0D23170], "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setService:", v9);

  objc_msgSend(v10, "setInstance:", *MEMORY[0x1E0DAB5C8]);
}

- (void)invalidate
{
  SBSceneManager *sceneManager;
  SBSceneManager *v4;
  objc_super v5;

  sceneManager = self->_sceneManager;
  if (sceneManager)
  {
    -[SBSceneManager removeUserInterfaceStyleObserver:](sceneManager, "removeUserInterfaceStyleObserver:", self);
    v4 = self->_sceneManager;
    self->_sceneManager = 0;

  }
  -[BSServiceConnectionEndpointInjector invalidate](self->_openAppInstanceInjector, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SBContinuityHostProxyClientComponent;
  -[FBSSceneComponent invalidate](&v5, sel_invalidate);
}

- (void)_setSceneRenderingEnvironmentParticipant:(id)a3
{
  SBSceneRenderingEnvironmentParticipant *v5;
  SBSceneRenderingEnvironmentParticipant *sceneRenderingEnvironmentParticipant;
  void *v7;
  SBSceneRenderingEnvironmentParticipant *v8;
  _QWORD v9[4];
  SBSceneRenderingEnvironmentParticipant *v10;

  v5 = (SBSceneRenderingEnvironmentParticipant *)a3;
  sceneRenderingEnvironmentParticipant = self->_sceneRenderingEnvironmentParticipant;
  v8 = v5;
  if (sceneRenderingEnvironmentParticipant != v5)
  {
    -[SBSceneRenderingEnvironmentParticipant invalidate](sceneRenderingEnvironmentParticipant, "invalidate");
    objc_storeStrong((id *)&self->_sceneRenderingEnvironmentParticipant, a3);
    -[FBSSceneComponent clientScene](self, "clientScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__SBContinuityHostProxyClientComponent__setSceneRenderingEnvironmentParticipant___block_invoke;
    v9[3] = &unk_1E8EBA8C0;
    v10 = v8;
    objc_msgSend(v7, "updateClientSettings:", v9);

  }
}

void __81__SBContinuityHostProxyClientComponent__setSceneRenderingEnvironmentParticipant___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "renderingEnvironmentIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHostProxySceneRenderingEnvironmentIdentifier:", v4);

}

- (void)sceneManager:(id)a3 didUpdateUserInterfaceStyle:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v9 = a5;
  v10 = a6;
  -[FBSSceneComponent clientScene](self, "clientScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__SBContinuityHostProxyClientComponent_sceneManager_didUpdateUserInterfaceStyle_withAnimationSettings_fence___block_invoke;
  v14[3] = &unk_1E8EBA8E8;
  v16 = v10;
  v17 = a4;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "updateClientSettings:", v14);

}

void __109__SBContinuityHostProxyClientComponent_sceneManager_didUpdateUserInterfaceStyle_withAnimationSettings_fence___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(a2, "setHostProxyUserInterfaceStyle:", a1[6]);
  if (a1[4])
    objc_msgSend(v5, "setAnimationSettings:");
  if (a1[5])
    objc_msgSend(v5, "setAnimationFence:");

}

- (void)continuitySessionDidUpdateScreenRecordingState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBContinuityHostProxyClientComponent continuitySessionDidUpdateScreenRecordingState:].cold.1(self, v4, v5);

  -[FBSSceneComponent clientScene](self, "clientScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__SBContinuityHostProxyClientComponent_continuitySessionDidUpdateScreenRecordingState___block_invoke;
  v8[3] = &unk_1E8EBA8C0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "updateClientSettings:", v8);

}

void __87__SBContinuityHostProxyClientComponent_continuitySessionDidUpdateScreenRecordingState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHostProxyIsCapturingContentForAdditionalRenderingDestination:", objc_msgSend(v2, "isActivelyScreenRecording"));

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previousSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  if (v16 != v9)
  {
    objc_msgSend((id)SBApp, "sceneRenderingEnvironmentManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityHostProxyClientComponent.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

    }
    -[FBSSceneComponent clientScene](self, "clientScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerParticipantForSceneWithIdentifier:displayConfiguration:", v13, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuityHostProxyClientComponent _setSceneRenderingEnvironmentParticipant:](self, "_setSceneRenderingEnvironmentParticipant:", v14);

    v10 = v16;
  }

}

- (void)sceneWillInvalidate:(id)a3
{
  SBSceneRenderingEnvironmentParticipant *sceneRenderingEnvironmentParticipant;

  -[SBSceneRenderingEnvironmentParticipant invalidate](self->_sceneRenderingEnvironmentParticipant, "invalidate", a3);
  sceneRenderingEnvironmentParticipant = self->_sceneRenderingEnvironmentParticipant;
  self->_sceneRenderingEnvironmentParticipant = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneRenderingEnvironmentParticipant, 0);
  objc_storeStrong((id *)&self->_openAppInstanceInjector, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)continuitySessionDidUpdateScreenRecordingState:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "clientScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 1024;
  v10 = objc_msgSend(a2, "isActivelyScreenRecording");
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Scene %{public}@ notified the session actively recording: %{BOOL}u", (uint8_t *)&v7, 0x12u);

}

@end
