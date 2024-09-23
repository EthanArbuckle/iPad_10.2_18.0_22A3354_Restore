@implementation SBApplicationSupportServiceDelegate

- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4
{
  return +[SBApplicationSupportServiceRequestContext shouldOverrideClientInitialization:](SBApplicationSupportServiceRequestContext, "shouldOverrideClientInitialization:", a4);
}

- (SBApplicationSupportServiceDelegate)init
{
  SBApplicationSupportServiceDelegate *v2;
  uint64_t v3;
  UISApplicationSupportService *service;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationSupportServiceDelegate;
  v2 = -[SBApplicationSupportServiceDelegate init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5B90], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (UISApplicationSupportService *)v3;

    -[UISApplicationSupportService setDelegate:](v2->_service, "setDelegate:", v2);
    -[SBApplicationSupportServiceDelegate _rebuildDefaultContext](v2, "_rebuildDefaultContext");
    -[UISApplicationSupportService start](v2->_service, "start");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__rebuildDefaultContext, *MEMORY[0x1E0CEBDD0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSupportServiceSingleton.m"), 51, CFSTR("this object should not dealloc"));

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSupportServiceDelegate;
  -[SBApplicationSupportServiceDelegate dealloc](&v5, sel_dealloc);
}

- (void)_rebuildDefaultContext
{
  UISApplicationSupportService *service;
  id v3;

  service = self->_service;
  objc_msgSend(MEMORY[0x1E0DC5B60], "sb_embeddedDisplayDefaultContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISApplicationSupportService setDefaultContext:](service, "setDefaultContext:", v3);

}

- (void)service:(id)a3 initializeClient:(id)a4 withCompletion:(id)a5
{
  +[SBApplicationSupportServiceRequestContext initializationContextForClient:completion:](SBApplicationSupportServiceRequestContext, "initializationContextForClient:completion:", a4, a5);
}

- (void)requestPasscodeUnlockUIForClient:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processForPID:", objc_msgSend(v5, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received passcode unlock request from %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke;
  v12[3] = &unk_1E8E9F1E8;
  v13 = v5;
  v14 = v6;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend((id)SBApp, "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)SBApp, "lockScreenService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke_2;
    v6[3] = &unk_1E8E9F598;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "requestPasscodeUnlockUIForClient:options:description:withCompletion:", v5, 0, CFSTR("UISApplicationSupportService"), v6);

  }
}

uint64_t __87__SBApplicationSupportServiceDelegate_requestPasscodeUnlockUIForClient_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)requestPasscodeCheckUIForClient:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processForPID:", objc_msgSend(v5, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received passcode check request from %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke;
  v12[3] = &unk_1E8E9F1E8;
  v13 = v5;
  v14 = v6;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend((id)SBApp, "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)SBApp, "lockScreenService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke_2;
    v6[3] = &unk_1E8E9F598;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "requestPasscodeCheckUIForClient:options:description:withCompletion:", v5, 0, CFSTR("UISApplicationSupportService"), v6);

  }
}

uint64_t __86__SBApplicationSupportServiceDelegate_requestPasscodeCheckUIForClient_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 forClient:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void (**v28)(id, _QWORD, void *);
  unint64_t v29;
  BOOL v30;
  _QWORD block[4];
  id v32;
  id v33;
  void (**v34)(id, _QWORD, void *);
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = (void (**)(id, _QWORD, void *))a7;
  v14 = objc_msgSend(v12, "pid");
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processForPID:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v38 = v16;
    v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "[SBAppSupportService] Received destroy scenes request from %{public}@ for %{public}@", buf, 0x16u);
  }

  if (!v18
    || !+[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:withOptions:](SBSystemUIScenesCoordinator, "shouldHandleSceneRequestsForProcess:withOptions:", v18, 0))
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_8:
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D68];
        v36 = CFSTR("This functionality is not supported for this device idiom.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("SBApplicationSupportService"), 1, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, 0, v22);

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "userInterfaceIdiom");

      if (v24 != 1)
        goto LABEL_8;
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_2;
    v25[3] = &unk_1E8EAE7B0;
    v26 = v12;
    v27 = v11;
    v29 = a4;
    v30 = a5;
    v28 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v25);

    v20 = v26;
    goto LABEL_11;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  v32 = v16;
  v33 = v11;
  v34 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v20 = v32;
LABEL_11:

}

void __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "destroyScenesWithPersistentIdentifiers:processIdentity:completion:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2938];
    v9[0] = CFSTR("SpringBoard has not finished booting yet.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SBApplicationSupportService"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v7);

  }
}

void __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "realToken");
  SBRunningApplicationForAuditToken();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = a1;
  v5 = *(id *)(a1 + 40);
  v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v28)
  {
    v6 = *(_QWORD *)v32;
    v7 = (id *)off_1E8E98000;
    v26 = v5;
    v27 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*v7, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sceneManagerForPersistenceIdentifier:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "existingSceneHandleForPersistenceIdentifier:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_9;
        objc_msgSend(v3, "_sceneIdentifierForStoredPersistenceIdentifier:", v9);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v12 = 0;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v14);
        v16 = v4;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayIdentity");
        v18 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v3, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v18;
        objc_msgSend(v11, "fetchOrCreateApplicationSceneHandleForRequest:", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v16;
        v5 = v26;
        v6 = v27;

        if (v12)
        {
LABEL_9:
          objc_msgSend(v12, "application");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v3)
            objc_msgSend(v4, "addObject:", v12);
        }
LABEL_15:

      }
      v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v28);
  }

  if (objc_msgSend(v4, "count"))
  {
    SBApplicationSceneEntityDestructionMakeIntentFromServicesRequest(*(_QWORD *)(v25 + 56), *(unsigned __int8 *)(v25 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_3;
    v29[3] = &unk_1E8EAE788;
    v30 = *(id *)(v25 + 48);
    SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v4, v21, v29);
    v22 = v30;
  }
  else
  {
    v23 = *(_QWORD *)(v25 + 48);
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D68];
    v38 = CFSTR("No scene handles found for provided persistence IDs.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("SBApplicationSupportService"), 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v22);
  }

}

uint64_t __129__SBApplicationSupportServiceDelegate_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_forClient_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
