@implementation SBSceneRenderingEnvironmentManager

- (SBSceneRenderingEnvironmentManager)init
{
  SBSceneRenderingEnviromentManagerDefaultBKSInterface *v3;
  SBSceneRenderingEnvironmentManager *v4;

  v3 = objc_alloc_init(SBSceneRenderingEnviromentManagerDefaultBKSInterface);
  v4 = -[SBSceneRenderingEnvironmentManager initWithBKSInterface:](self, "initWithBKSInterface:", v3);

  return v4;
}

- (SBSceneRenderingEnvironmentManager)initWithBKSInterface:(id)a3
{
  id v6;
  SBSceneRenderingEnvironmentManager *v7;
  SBSceneRenderingEnvironmentManager *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *displayUUIDToAssertion;
  NSMutableDictionary *v11;
  NSMutableDictionary *displayUUIDToIdentifier;
  id v13;
  uint64_t v14;
  BSInvalidatable *stateDumpHandle;
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bksInterface"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBSceneRenderingEnvironmentManager;
  v7 = -[SBSceneRenderingEnvironmentManager init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bksInterface, a3);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayUUIDToAssertion = v8->_displayUUIDToAssertion;
    v8->_displayUUIDToAssertion = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayUUIDToIdentifier = v8->_displayUUIDToIdentifier;
    v8->_displayUUIDToIdentifier = v11;

    objc_initWeak(&location, v8);
    v13 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v18, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v14 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v8->_stateDumpHandle;
    v8->_stateDumpHandle = (BSInvalidatable *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __59__SBSceneRenderingEnvironmentManager_initWithBKSInterface___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E0D01750];
    objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionForRootObject:withStyle:", WeakRetained, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayUUIDToAssertion, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_240);
  v3.receiver = self;
  v3.super_class = (Class)SBSceneRenderingEnvironmentManager;
  -[SBSceneRenderingEnvironmentManager dealloc](&v3, sel_dealloc);
}

uint64_t __45__SBSceneRenderingEnvironmentManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (id)registerParticipantForSceneWithIdentifier:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SBSceneRenderingEnvironmentParticipant *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __CFString *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentManager.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentManager.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

LABEL_3:
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v8, "hardwareIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hardwareIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("main");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  -[NSMutableDictionary objectForKey:](self->_displayUUIDToAssertion, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogShellScene();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      v39 = 2114;
      v40 = v12;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Generated scene rendering environment identifier %{public}@ for displayUUID %{public}@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v17 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSceneRenderingEnvironmentManager-%@"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke;
    v32[3] = &unk_1E8EAB5F8;
    objc_copyWeak(&v36, (id *)buf);
    v19 = v14;
    v33 = v19;
    v34 = v31;
    v20 = v12;
    v35 = v20;
    objc_msgSend(v17, "assertionWithIdentifier:stateDidChangeHandler:", v18, v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogShellScene();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLog:", v21);

    -[NSMutableDictionary setObject:forKey:](self->_displayUUIDToIdentifier, "setObject:forKey:", v19, v20);
    -[NSMutableDictionary setObject:forKey:](self->_displayUUIDToAssertion, "setObject:forKey:", v13, v20);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);

  }
  objc_msgSend(v13, "acquireForReason:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_displayUUIDToIdentifier, "objectForKey:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentManager.m"), 118, CFSTR("environment identifier is nil for sanitizedDisplayUUID %@ existing identifiers: %@"), v12, self->_displayUUIDToIdentifier);

  }
  v25 = -[SBSceneRenderingEnvironmentParticipant initWithRenderingEnvironmentIdentifier:assertion:]([SBSceneRenderingEnvironmentParticipant alloc], "initWithRenderingEnvironmentIdentifier:assertion:", v24, v22);

  return v25;
}

void __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "isActive"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v4 = (void *)WeakRetained[1];
      v5 = (void *)MEMORY[0x1E0C99E60];
      v10 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayIdentifiers:forDisplayUUID:", v7, *(_QWORD *)(a1 + 40));

      WeakRetained = v10;
    }

  }
  else
  {
    SBLogShellScene();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup of scene rendering environments for displayUUID %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke_25;
    block[3] = &unk_1E8E9F280;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
  }
}

void __101__SBSceneRenderingEnvironmentManager_registerParticipantForSceneWithIdentifier_displayConfiguration___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupForPotentiallyInvalidAssertionForSanitizedDisplayUUID:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_cleanupForPotentiallyInvalidAssertionForSanitizedDisplayUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKey:](self->_displayUUIDToAssertion, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");
  SBLogShellScene();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "No cleanup of scene rendering environment for displayUUID %{public}@ necessary - it is still active", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up scene rendering environment for displayUUID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v9 = v4;
    if (objc_msgSend(CFSTR("main"), "isEqualToString:", v9))
      v10 = 0;
    else
      v10 = v9;
    v7 = v10;

    -[SBSceneRenderingEnvironmentManagerBKSInterface setDisplayIdentifiers:forDisplayUUID:](self->_bksInterface, "setDisplayIdentifiers:forDisplayUUID:", 0, v7);
    objc_msgSend(v5, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_displayUUIDToAssertion, "removeObjectForKey:", v9);
    -[NSMutableDictionary removeObjectForKey:](self->_displayUUIDToIdentifier, "removeObjectForKey:", v9);
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBSceneRenderingEnvironmentManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBSceneRenderingEnvironmentManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __64__SBSceneRenderingEnvironmentManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("displayUUIDToAssertion"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayUUIDToIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_displayUUIDToIdentifier, 0);
  objc_storeStrong((id *)&self->_displayUUIDToAssertion, 0);
  objc_storeStrong((id *)&self->_bksInterface, 0);
}

@end
