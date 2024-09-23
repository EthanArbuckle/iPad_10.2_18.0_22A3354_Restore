@implementation SBRemoteTransientOverlaySession

- (id)_initWithSessionID:(id)a3 definition:(id)a4 sceneWorkspaceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBRemoteTransientOverlaySession *v11;
  uint64_t v12;
  SBSRemoteAlertDefinition *definition;
  uint64_t v14;
  NSString *sessionID;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBRemoteTransientOverlaySession;
  v11 = -[SBRemoteTransientOverlaySession init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    definition = v11->_definition;
    v11->_definition = (SBSRemoteAlertDefinition *)v12;

    v14 = objc_msgSend(v8, "copy");
    sessionID = v11->_sessionID;
    v11->_sessionID = (NSString *)v14;

    v11->_valid = 1;
    objc_storeStrong((id *)&v11->_sceneWorkspaceController, a5);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SBRemoteTransientOverlayViewController setDelegate:](self->_containerViewController, "setDelegate:", 0);
  -[SBRemoteTransientOverlayViewController setDelegate:](self->_secondaryViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlaySession;
  -[SBRemoteTransientOverlaySession dealloc](&v3, sel_dealloc);
}

- (void)remoteTransientOverlayViewControllerRequestsDeactivation:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  SBRemoteTransientOverlaySession *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[SBRemoteTransientOverlaySession deactivate](self, "deactivate");
}

- (BOOL)remoteTransientOverlayViewController:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4
{
  SBRemoteTransientOverlaySession *v4;
  SBRemoteTransientOverlaySessionHostDelegate **p_hostDelegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_hostDelegate = &self->_hostDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_hostDelegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "remoteTransientOverlaySession:prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:", v4, v6);

  return (char)v4;
}

- (id)remoteTransientOverlayViewController:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  int v10;
  SBRemoteTransientOverlaySession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[SBRemoteTransientOverlaySession _actionForHandlingButtonEvents:](self, "_actionForHandlingButtonEvents:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remoteTransientOverlayViewControllerDidInvalidate:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  SBRemoteTransientOverlaySession *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[SBRemoteTransientOverlaySession _invalidateWithReason:error:](self, "_invalidateWithReason:error:", 3, 0);
}

- (void)remoteTransientOverlayViewControllerRequestsInvalidation:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  SBRemoteTransientOverlaySession *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[SBRemoteTransientOverlaySession _requestInvalidationWithReason:error:](self, "_requestInvalidationWithReason:error:", 2, 0);
}

- (void)remoteTransientOverlayViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  SBRemoteTransientOverlaySession *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogTransientOverlay();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1D0540000, v8, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
    goto LABEL_6;
  }

  -[SBRemoteTransientOverlaySession _requestInvalidationWithReason:error:](self, "_requestInvalidationWithReason:error:", 5, v6);
}

- (void)remoteTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
  NSObject *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  int v10;
  SBRemoteTransientOverlaySession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  v9 = objc_msgSend(WeakRetained, "activeWallpaperVariantForRemoteTransientOverlaySession:", self);

  -[SBRemoteTransientOverlayViewController setWallpaperVariant:](self->_containerViewController, "setWallpaperVariant:", v9);
  -[SBRemoteTransientOverlayViewController setWallpaperVariant:](self->_secondaryViewController, "setWallpaperVariant:", v9);
}

- (void)remoteTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4
{
  id v5;
  int v6;

  v5 = a3;
  -[SBRemoteTransientOverlaySession _didDeactivate](self, "_didDeactivate");
  v6 = objc_msgSend(v5, "shouldInvalidateWhenDeactivated");

  if (v6)
    -[SBRemoteTransientOverlaySession _requestInvalidationWithReason:error:](self, "_requestInvalidationWithReason:error:", 3, 0);
}

- (void)activateWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  SBRemoteTransientOverlaySession *v18;
  id v19;
  id v20[2];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_prepared)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRemoteTransientOverlaySession.m"), 122, CFSTR("Session must be prepared before it can be activated."));

  }
  SBLogTransientOverlay();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = self;
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);

  }
  -[SBRemoteTransientOverlaySession hostDelegate](self, "hostDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "remoteTransientOverlaySession:shouldActivateWithContext:", self, v5);

  if ((v9 & 1) != 0)
  {
    self->_hasInitiatedPresentation = 1;
    objc_initWeak((id *)buf, self);
    v10 = objc_alloc(MEMORY[0x1E0D016F0]);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke;
    v17 = &unk_1E8EBB330;
    objc_copyWeak(v20, (id *)buf);
    v18 = self;
    v20[1] = (id)a2;
    v19 = v5;
    v11 = (void *)objc_msgSend(v10, "initWithBlock:", &v14);
    objc_msgSend(v11, "setDebugName:", CFSTR("activateWithContext"), v14, v15, v16, v17, v18);
    -[SBRemoteTransientOverlaySession _addTransaction:](self, "_addTransaction:", v11);

    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    SBLogTransientOverlay();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not activating due to hostDelegate preventing it", buf, 0xCu);
    }

    -[SBRemoteTransientOverlaySession _invalidateWithReason:error:](self, "_invalidateWithReason:error:", 4, 0);
  }

}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  _BOOL4 v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void (**v49)(id, uint64_t);
  _QWORD block[4];
  id *v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  void (**v57)(id, uint64_t);
  _BYTE *v58;
  uint64_t v59;
  char v60;
  BOOL v61;
  BOOL v62;
  _QWORD v63[4];
  id *v64;
  NSObject *v65;
  _BYTE *v66;
  _QWORD v67[4];
  id *v68;
  NSObject *v69;
  _BYTE *v70;
  _BYTE buf[24];
  char v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v48 = a2;
  v49 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0)
  {
    v46 = WeakRetained[2];
    if (!v46)
    {
      SBLogTransientOverlay();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: canceling activation transaction because there is no container view controller", buf, 0x16u);

      }
      v49[2](v49, 1);
      goto LABEL_39;
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hostDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddedDisplayWindowSceneForRemoteTransientOverlaySession:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v7;
    objc_msgSend(v44, "activeDisplayWindowScene");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentationTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scenePersistentIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "prefersEmbeddedDisplayPresentation"))
    {
      v45 = v47;
      v10 = v43;
      if (v43)
      {
LABEL_15:
        v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "prefersEmbeddedDisplayPresentation");
        v18 = v47;
        if (!v17)
          v18 = v10;
        v19 = v18;
        if (objc_msgSend(v19, "isExternalDisplayWindowScene"))
          v20 = WeakRetained[3] != 0;
        else
          v20 = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v72 = 0;
        v21 = dispatch_group_create();
        dispatch_group_enter(v21);
        v41 = v20;
        if (v20)
        {
          if (objc_msgSend(v10, "isExternalDisplayWindowScene", v19))
            v22 = 3;
          else
            v22 = 2;
        }
        else
        {
          v22 = objc_msgSend(v10, "isExternalDisplayWindowScene", v19);
        }
        v42 = v8 != 0;
        v23 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v23 + 24)
          || (v24 = v8 != 0, objc_msgSend(*(id *)(v23 + 80), "prefersEmbeddedDisplayPresentation")))
        {
          v25 = objc_msgSend(v10, "isEqual:", v47);
          if (v8)
            v24 = v25;
          else
            v24 = 0;
        }
        v26 = v24 & ~objc_msgSend(v8, "requiresFullscreenPresentation");
        v27 = *(_QWORD *)(a1 + 40);
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_12;
        v67[3] = &unk_1E8EBB2E0;
        v28 = WeakRetained;
        v68 = v28;
        v70 = buf;
        v29 = v21;
        v69 = v29;
        objc_msgSend(v46, "prepareForActivationWithContext:presentationMode:presentEmbedded:windowScene:completion:", v27, v22, v26, v10, v67);
        if (v41)
        {
          dispatch_group_enter(v29);
          if (objc_msgSend(v45, "isExternalDisplayWindowScene"))
            v30 = 5;
          else
            v30 = 4;
          if (!objc_msgSend(v45, "isEqual:", v47)
            || objc_msgSend(v8, "requiresFullscreenPresentation"))
          {
            v42 = 0;
          }
          v31 = v28[3];
          v32 = *(_QWORD *)(a1 + 40);
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_2;
          v63[3] = &unk_1E8EBB2E0;
          v64 = v28;
          v66 = buf;
          v65 = v29;
          objc_msgSend(v31, "prepareForActivationWithContext:presentationMode:presentEmbedded:windowScene:completion:", v32, v30, v42, v45, v63);

        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_3;
        block[3] = &unk_1E8EBB308;
        v58 = buf;
        v51 = v28;
        v33 = *(id *)(a1 + 40);
        v34 = *(_QWORD *)(a1 + 32);
        v52 = v33;
        v53 = v34;
        v54 = v10;
        v55 = v8;
        v60 = v26;
        v35 = *(_QWORD *)(a1 + 56);
        v61 = v41;
        v59 = v35;
        v56 = v45;
        v62 = v42;
        v57 = v49;
        v36 = v45;
        v37 = v8;
        v38 = v10;
        dispatch_group_notify(v29, MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(buf, 8);
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      v45 = v43;
      if (v40)
      {
        objc_msgSend(v44, "windowSceneForPersistentIdentifier:", v40);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v43;
        if (v10)
          goto LABEL_15;
      }
    }
    v10 = v47;
    goto LABEL_15;
  }
  SBLogTransientOverlay();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: canceling activation transaction because session is no longer valid", buf, 0x16u);

  }
  v49[2](v49, 1);
LABEL_40:

}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBRemoteTransientOverlayViewControllerErrorDomain")))
    {
      v5 = objc_msgSend(v3, "code");

      if (v5 == -1000)
      {
        v6 = 1;
LABEL_7:
        objc_msgSend(*(id *)(a1 + 32), "_invalidateWithReason:error:", v6, v3);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = 4;
    goto LABEL_7;
  }
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBRemoteTransientOverlayViewControllerErrorDomain")))
    {
      v5 = objc_msgSend(v3, "code");

      if (v5 == -1000)
      {
        v6 = 1;
LABEL_7:
        objc_msgSend(*(id *)(a1 + 32), "_invalidateWithReason:error:", v6, v3);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = 4;
    goto LABEL_7;
  }
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;
  SBRemoteTransientOverlayPresentationRequest *v4;
  void *v5;
  id v6;
  SBRemoteTransientOverlayPresentationRequest *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    if (v2)
    {
      v4 = -[SBRemoteTransientOverlayPresentationRequest initWithViewController:]([SBRemoteTransientOverlayPresentationRequest alloc], "initWithViewController:", v2);
      -[SBRemoteTransientOverlayPresentationRequest setShouldDismissPresentedBanners:](v4, "setShouldDismissPresentedBanners:", objc_msgSend(*(id *)(a1 + 40), "shouldDismissPresentedBanners"));
      -[SBRemoteTransientOverlayPresentationRequest setShouldStashPictureInPictureIfNeeded:](v4, "setShouldStashPictureInPictureIfNeeded:", objc_msgSend(*(id *)(a1 + 40), "shouldStashPictureInPictureIfNeeded"));
      if (objc_msgSend(v2, "isActivatingForSiri"))
        -[SBRemoteTransientOverlayPresentationRequest setShouldDismissSiri:](v4, "setShouldDismissSiri:", 0);
      -[SBRemoteTransientOverlayPresentationRequest setIsScreenshotMarkup:](v4, "setIsScreenshotMarkup:", objc_msgSend(v2, "isScreenshotMarkup"));
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)
        || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "prefersEmbeddedDisplayPresentation"))
      {
        -[SBRemoteTransientOverlayPresentationRequest setWindowScene:](v4, "setWindowScene:", *(_QWORD *)(a1 + 56));
      }
      -[SBRemoteTransientOverlayPresentationRequest setPresentationTarget:](v4, "setPresentationTarget:", *(_QWORD *)(a1 + 64));
      -[SBRemoteTransientOverlayPresentationRequest setShouldPresentEmbeddedInTargetScene:](v4, "setShouldPresentEmbeddedInTargetScene:", *(unsigned __int8 *)(a1 + 104));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "sceneProvidingProcess");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRemoteTransientOverlayPresentationRequest setIsSceneBacked:](v4, "setIsSceneBacked:", v5 != 0);

      if ((objc_msgSend(WeakRetained, "remoteTransientOverlaySession:performPresentationRequest:", *(_QWORD *)(a1 + 32), v4) & 1) != 0)
      {

        if (*(_BYTE *)(a1 + 105))
        {
          v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
          if (v6)
          {
            v7 = -[SBRemoteTransientOverlayPresentationRequest initWithViewController:]([SBRemoteTransientOverlayPresentationRequest alloc], "initWithViewController:", v6);
            -[SBRemoteTransientOverlayPresentationRequest setShouldDismissPresentedBanners:](v7, "setShouldDismissPresentedBanners:", objc_msgSend(*(id *)(a1 + 40), "shouldDismissPresentedBanners"));
            if (objc_msgSend(v6, "isActivatingForSiri"))
              -[SBRemoteTransientOverlayPresentationRequest setShouldDismissSiri:](v7, "setShouldDismissSiri:", 0);
            -[SBRemoteTransientOverlayPresentationRequest setIsScreenshotMarkup:](v7, "setIsScreenshotMarkup:", objc_msgSend(v6, "isScreenshotMarkup"));
            -[SBRemoteTransientOverlayPresentationRequest setPresentationTarget:](v7, "setPresentationTarget:", *(_QWORD *)(a1 + 64));
            -[SBRemoteTransientOverlayPresentationRequest setWindowScene:](v7, "setWindowScene:", *(_QWORD *)(a1 + 72));
            -[SBRemoteTransientOverlayPresentationRequest setShouldPresentEmbeddedInTargetScene:](v7, "setShouldPresentEmbeddedInTargetScene:", *(unsigned __int8 *)(a1 + 106));
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "sceneProvidingProcess");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBRemoteTransientOverlayPresentationRequest setIsSceneBacked:](v7, "setIsSceneBacked:", v8 != 0);

            v9 = objc_msgSend(WeakRetained, "remoteTransientOverlaySession:performPresentationRequest:", *(_QWORD *)(a1 + 32), v7);
            if ((v9 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 32), "_invalidateWithReason:error:", 4, 0);

          }
          else
          {
            SBLogTransientOverlay();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(_QWORD *)(a1 + 48);
              NSStringFromSelector(*(SEL *)(a1 + 96));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = 138543618;
              v18 = v14;
              v19 = 2114;
              v20 = v15;
              _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: can't perform secondary presentation, view controller is nil", (uint8_t *)&v17, 0x16u);

            }
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }
        v12 = 1;
        goto LABEL_26;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWithReason:error:", 4, 0);
    }
    else
    {
      SBLogTransientOverlay();
      v4 = (SBRemoteTransientOverlayPresentationRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 48);
        NSStringFromSelector(*(SEL *)(a1 + 96));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1D0540000, &v4->super, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: can't perform presentation, primary container view controller is nil", (uint8_t *)&v17, 0x16u);

      }
    }

    v12 = 0;
    v9 = 0;
LABEL_26:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = v12;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = v9;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (void)addSessionObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);

}

- (void)deactivate
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogTransientOverlay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v6 = objc_alloc(MEMORY[0x1E0D016F0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke;
  v8[3] = &unk_1E8EAE0A0;
  objc_copyWeak(&v9, (id *)buf);
  v7 = (void *)objc_msgSend(v6, "initWithBlock:", v8);
  objc_msgSend(v7, "setDebugName:", CFSTR("deactivate"));
  -[SBRemoteTransientOverlaySession _addTransaction:](self, "_addTransaction:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id v6;
  id v7;
  NSObject *v8;
  SBRemoteTransientOverlayDismissalRequest *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  SBRemoteTransientOverlayDismissalRequest *v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0)
  {
    v6 = WeakRetained[2];
    if (v6)
    {
      v7 = objc_loadWeakRetained(WeakRetained + 13);
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      v9 = -[SBRemoteTransientOverlayDismissalRequest initWithViewController:]([SBRemoteTransientOverlayDismissalRequest alloc], "initWithViewController:", v6);
      v10 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_2;
      v18[3] = &unk_1E8E9DED8;
      v11 = v8;
      v19 = v11;
      -[SBRemoteTransientOverlayDismissalRequest setCompletionHandler:](v9, "setCompletionHandler:", v18);
      objc_msgSend(v7, "remoteTransientOverlaySession:performDismissalRequest:", WeakRetained, v9);
      v12 = WeakRetained[3];
      if (v12)
      {
        dispatch_group_enter(v11);
        v13 = -[SBRemoteTransientOverlayDismissalRequest initWithViewController:]([SBRemoteTransientOverlayDismissalRequest alloc], "initWithViewController:", v12);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_3;
        v16[3] = &unk_1E8E9DED8;
        v17 = v11;
        -[SBRemoteTransientOverlayDismissalRequest setCompletionHandler:](v13, "setCompletionHandler:", v16);
        objc_msgSend(v7, "remoteTransientOverlaySession:performDismissalRequest:", WeakRetained, v13);

      }
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_4;
      block[3] = &unk_1E8E9E8D0;
      v15 = v4;
      dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getActionForHandlingButtonEvents:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id v15[2];
  id location;

  v6 = a4;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D016F0]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke;
  v13 = &unk_1E8EBB380;
  objc_copyWeak(v15, &location);
  v8 = v6;
  v14 = v8;
  v15[1] = (id)a3;
  v9 = (void *)objc_msgSend(v7, "initWithBlock:", &v10);
  objc_msgSend(v9, "setDebugName:", CFSTR("getActionForHandlingButtonEvents"), v10, v11, v12, v13);
  -[SBRemoteTransientOverlaySession _addTransaction:](self, "_addTransaction:", v9);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke_2;
  v12 = &unk_1E8EBB358;
  v13 = v4;
  v14 = *(id *)(a1 + 32);
  v6 = v4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](&v9);
  if ((objc_msgSend(WeakRetained, "isValid", v9, v10, v11, v12) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_actionForHandlingButtonEvents:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v8, 0);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

void __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _BOOL8 v5;
  void (*v6)(uint64_t, _BOOL8);
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3 != 0;
  v6 = *(void (**)(uint64_t, _BOOL8))(v4 + 16);
  v7 = a2;
  v6(v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)hasPendingButtonEvents:(unint64_t)a3
{
  NSMutableDictionary *identifierToHandlingButtonEvents;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SBRemoteTransientOverlaySession_hasPendingButtonEvents___block_invoke;
  v6[3] = &unk_1E8EBB3A8;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identifierToHandlingButtonEvents, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__SBRemoteTransientOverlaySession_hasPendingButtonEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "integerValue");
  if ((*(_QWORD *)(a1 + 40) & result) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasServiceProcessIdentifier:(int)a3
{
  return -[SBRemoteTransientOverlayViewController hasServiceProcessIdentifier:](self->_containerViewController, "hasServiceProcessIdentifier:", *(_QWORD *)&a3);
}

- (NSString)serviceBundleIdentifier
{
  return (NSString *)-[SBRemoteTransientOverlayViewController serviceBundleIdentifier](self->_containerViewController, "serviceBundleIdentifier");
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return -[SBRemoteTransientOverlayViewController isPresentedFromSceneWithIdentityTokenString:](self->_containerViewController, "isPresentedFromSceneWithIdentityTokenString:", a3);
}

- (BOOL)isPresentedOnWindowScene:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[UIViewController _sbWindowScene](self->_containerViewController, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isMainDisplayWindowScene") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[UIViewController _sbWindowScene](self->_secondaryViewController, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isMainDisplayWindowScene");

  }
  return v5;
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  -[SBRemoteTransientOverlaySession _requestInvalidationWithReason:error:](self, "_requestInvalidationWithReason:error:", 2, 0);
}

- (BOOL)isSwitcherEligible
{
  return -[SBRemoteTransientOverlayViewController isSwitcherEligible](self->_containerViewController, "isSwitcherEligible");
}

- (void)prepareWithConfigurationContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  SBRemoteTransientOverlaySession *v14;
  id v15;
  id v16[2];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_prepared)
  {
    SBLogTransientOverlay();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = self;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);

    }
    self->_prepared = 1;
    objc_initWeak((id *)buf, self);
    v8 = objc_alloc(MEMORY[0x1E0D016F0]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke;
    v13 = &unk_1E8EBB330;
    objc_copyWeak(v16, (id *)buf);
    v14 = self;
    v16[1] = (id)a2;
    v15 = v5;
    v9 = (void *)objc_msgSend(v8, "initWithBlock:", &v10);
    objc_msgSend(v9, "setDebugName:", CFSTR("prepareWithConfigurationContext"), v10, v11, v12, v13, v14);
    -[SBRemoteTransientOverlaySession _addTransaction:](self, "_addTransaction:", v9);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }

}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_28;
    v12[3] = &unk_1E8EBB3D0;
    v13 = v6;
    v14 = WeakRetained;
    v15 = *(id *)(a1 + 40);
    v16 = v4;
    v8 = v6;
    +[SBRemoteTransientOverlayViewController requestViewControllersForAlertDefinition:sceneWorkspaceController:connectionHandler:](SBRemoteTransientOverlayViewController, "requestViewControllersForAlertDefinition:sceneWorkspaceController:connectionHandler:", v8, v7, v12);

  }
  else
  {
    SBLogTransientOverlay();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: bailing out early because session is no longer valid", buf, 0x16u);

    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v8
    && (!SBFIsChamoisExternalDisplayControllerAvailable()
     || (objc_msgSend(*(id *)(a1 + 32), "secondaryViewControllerClassName"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v11,
         v9)
     || !v11))
  {
    +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isConnectedToWindowedAccessory");

    if (v13)
    {
      +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "visibleScreenCoordinatesForWindowedAccessory");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      objc_msgSend(v8, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", 1, v16, v18, v20, v22);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), a2);
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 40));
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v24 = *(_QWORD *)(a1 + 48);
    v25 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_2;
    v32[3] = &unk_1E8E9DED8;
    v26 = v23;
    v33 = v26;
    objc_msgSend(v8, "configureWithContext:completion:", v24, v32);
    if (v9)
    {
      dispatch_group_enter(v26);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), a3);
      objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v8, "setPairedRemoteTransientOverlay:", v9);
      objc_msgSend(v9, "setPairedRemoteTransientOverlay:", v8);
      v27 = *(_QWORD *)(a1 + 48);
      v30[0] = v25;
      v30[1] = 3221225472;
      v30[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_3;
      v30[3] = &unk_1E8E9DED8;
      v31 = v26;
      objc_msgSend(v9, "configureWithContext:completion:", v27, v30);

    }
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_4;
    block[3] = &unk_1E8E9E8D0;
    v29 = *(id *)(a1 + 56);
    dispatch_group_notify(v26, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidateWithReason:error:", 4, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeSessionObserver:(id)a3
{
  id v4;
  NSHashTable *observers;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)_addTransaction:(id)a3
{
  NSMutableArray *pendingTransactions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  if (self->_activeTransaction)
  {
    pendingTransactions = self->_pendingTransactions;
    if (!pendingTransactions)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_pendingTransactions;
      self->_pendingTransactions = v6;

      pendingTransactions = self->_pendingTransactions;
    }
    -[NSMutableArray addObject:](pendingTransactions, "addObject:", v8);
  }
  else
  {
    objc_storeStrong((id *)&self->_activeTransaction, a3);
    -[SBRemoteTransientOverlaySession _registerObserversForTransaction:](self, "_registerObserversForTransaction:", self->_activeTransaction);
    -[BSTransaction begin](self->_activeTransaction, "begin");
  }

}

- (void)_didActivate
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_activated)
  {
    SBLogTransientOverlay();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    self->_activated = 1;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "remoteTransientOverlaySessionDidActivate:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_didDeactivate
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_activated)
  {
    SBLogTransientOverlay();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    -[SBRemoteTransientOverlayViewController didDeactivate](self->_containerViewController, "didDeactivate");
    -[SBRemoteTransientOverlayViewController didDeactivate](self->_secondaryViewController, "didDeactivate");
    self->_activated = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "remoteTransientOverlaySessionDidDeactivate:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (id)_actionForHandlingButtonEvents:(unint64_t)a3
{
  void *v5;
  NSMutableDictionary *identifierToHandlingButtonEvents;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  unint64_t v16;

  BSDispatchQueueAssertMain();
  if (!self->_containerViewController)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
  if (!identifierToHandlingButtonEvents)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v8 = self->_identifierToHandlingButtonEvents;
    self->_identifierToHandlingButtonEvents = v7;

    identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](identifierToHandlingButtonEvents, "setObject:forKey:", v9, v5);

  v10 = objc_alloc(MEMORY[0x1E0DAC658]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke;
  v14[3] = &unk_1E8EBB3F8;
  v14[4] = self;
  v15 = v5;
  v16 = a3;
  v11 = v5;
  v12 = (void *)objc_msgSend(v10, "initWithButtonEvents:withHandler:", a3, v14);

  return v12;
}

void __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  BSDispatchMain();

}

void __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (!v4 || (objc_msgSend(v4, "error"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    if (!v5)
      return;
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "unHandledButtonEvents"))
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(WeakRetained, "remoteTransientOverlaySession:requestsHandlingForButtonEvents:viewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)_invalidateWithReason:(int64_t)a3 error:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SBRemoteTransientOverlayViewController *containerViewController;
  SBRemoteTransientOverlayViewController *secondaryViewController;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id WeakRetained;
  NSError *v21;
  NSError *error;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  BSDispatchQueueAssertMain();
  self->_pendingInvalidation = 0;
  SBLogTransientOverlay();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    SBSRemoteAlertHandleInvalidationErrorDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = self;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v11;
    v45 = 2114;
    v46 = v7;
    _os_log_error_impl(&dword_1D0540000, v9, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    SBSRemoteAlertHandleInvalidationErrorDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = self;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
  }

LABEL_7:
  -[SBRemoteTransientOverlayViewController didInvalidate](self->_containerViewController, "didInvalidate");
  containerViewController = self->_containerViewController;
  self->_containerViewController = 0;

  -[SBRemoteTransientOverlayViewController didInvalidate](self->_secondaryViewController, "didInvalidate");
  secondaryViewController = self->_secondaryViewController;
  self->_secondaryViewController = 0;

  if (self->_activated)
  {
    self->_activated = 0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v19, "remoteTransientOverlaySessionDidDeactivate:", self);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v16);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlaySession:didInvalidateWithReason:error:", self, a3, v7);

  if (self->_valid)
  {
    self->_valid = 0;
    v21 = (NSError *)objc_msgSend(v7, "copy");
    error = self->_error;
    self->_error = v21;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v28, "remoteTransientOverlaySession:didInvalidateWithReason:error:", self, a3, v7);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v25);
    }

  }
}

- (void)_requestInvalidationWithReason:(int64_t)a3 error:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  uint8_t buf[4];
  SBRemoteTransientOverlaySession *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_valid && !self->_pendingInvalidation)
    self->_pendingInvalidation = 1;
  SBLogTransientOverlay();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
      SBSRemoteAlertHandleInvalidationErrorDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = self;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v7;
      _os_log_error_impl(&dword_1D0540000, v9, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    SBSRemoteAlertHandleInvalidationErrorDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v14 = objc_alloc(MEMORY[0x1E0D016F0]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke;
  v17[3] = &unk_1E8EBB448;
  objc_copyWeak(v19, (id *)buf);
  v19[1] = (id)a3;
  v15 = v7;
  v18 = v15;
  v16 = (void *)objc_msgSend(v14, "initWithBlock:", v17);
  objc_msgSend(v16, "setDebugName:", CFSTR("_requestInvalidationWithReason"));
  -[SBRemoteTransientOverlaySession _addTransaction:](self, "_addTransaction:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);

}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  id v12;
  NSObject *v13;
  SBRemoteTransientOverlayDismissalRequest *v14;
  NSObject *v15;
  SBRemoteTransientOverlayDismissalRequest *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD, _QWORD);
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  id *v24;
  id v25;
  id v26;
  uint64_t v27;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_2;
  v23[3] = &unk_1E8EBB420;
  v7 = (id *)WeakRetained;
  v8 = *(_QWORD *)(a1 + 48);
  v24 = v7;
  v27 = v8;
  v25 = *(id *)(a1 + 32);
  v9 = v4;
  v26 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v23);
  if ((objc_msgSend(v7, "isValid") & 1) != 0)
  {
    v11 = v7[2];
    if (v11 && *((_BYTE *)v7 + 33))
    {
      v12 = objc_loadWeakRetained(v7 + 13);
      v13 = dispatch_group_create();
      dispatch_group_enter(v13);
      v14 = -[SBRemoteTransientOverlayDismissalRequest initWithViewController:]([SBRemoteTransientOverlayDismissalRequest alloc], "initWithViewController:", v11);
      -[SBRemoteTransientOverlayDismissalRequest setShouldInvalidatePresentation:](v14, "setShouldInvalidatePresentation:", 1);
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_3;
      v21[3] = &unk_1E8E9DED8;
      v15 = v13;
      v22 = v15;
      -[SBRemoteTransientOverlayDismissalRequest setCompletionHandler:](v14, "setCompletionHandler:", v21);
      objc_msgSend(v12, "remoteTransientOverlaySession:performDismissalRequest:", v7, v14);
      if (v7[3])
      {
        dispatch_group_enter(v15);
        v16 = -[SBRemoteTransientOverlayDismissalRequest initWithViewController:]([SBRemoteTransientOverlayDismissalRequest alloc], "initWithViewController:", v7[3]);
        -[SBRemoteTransientOverlayDismissalRequest setShouldInvalidatePresentation:](v16, "setShouldInvalidatePresentation:", 1);
        v19[0] = v6;
        v19[1] = 3221225472;
        v19[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_4;
        v19[3] = &unk_1E8E9DED8;
        v20 = v15;
        -[SBRemoteTransientOverlayDismissalRequest setCompletionHandler:](v16, "setCompletionHandler:", v19);
        objc_msgSend(v12, "remoteTransientOverlaySession:performDismissalRequest:", v7, v16);

      }
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_5;
      v17[3] = &unk_1E8E9E8D0;
      v18 = v10;
      dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v17);

    }
    else
    {
      v10[2](v10, 1);
    }

  }
  else
  {
    v10[2](v10, 1);
  }

}

uint64_t __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWithReason:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_processPendingTransactions
{
  NSMutableArray *pendingTransactions;
  id obj;

  -[NSMutableArray firstObject](self->_pendingTransactions, "firstObject");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
    -[NSMutableArray removeObjectAtIndex:](self->_pendingTransactions, "removeObjectAtIndex:", 0);
  objc_storeStrong((id *)&self->_activeTransaction, obj);
  if (self->_activeTransaction)
  {
    -[SBRemoteTransientOverlaySession _registerObserversForTransaction:](self, "_registerObserversForTransaction:");
    -[BSTransaction begin](self->_activeTransaction, "begin");
  }
  if (!-[NSMutableArray count](self->_pendingTransactions, "count"))
  {
    pendingTransactions = self->_pendingTransactions;
    self->_pendingTransactions = 0;

  }
}

- (void)_registerObserversForTransaction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke;
  v5[3] = &unk_1E8EBB498;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerBlockObserver:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke_2;
  v4[3] = &unk_1E8EBB470;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v3, "addTransactionDidCompleteBlock:", v4);
  objc_destroyWeak(&v5);

}

void __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_processPendingTransactions");
    WeakRetained = v2;
  }

}

- (SBSRemoteAlertDefinition)definition
{
  return self->_definition;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)isPrepared
{
  return self->_prepared;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isPendingInvalidation
{
  return self->_pendingInvalidation;
}

- (SBRemoteTransientOverlaySessionHostDelegate)hostDelegate
{
  return (SBRemoteTransientOverlaySessionHostDelegate *)objc_loadWeakRetained((id *)&self->_hostDelegate);
}

- (void)setHostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostDelegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identifierToHandlingButtonEvents, 0);
  objc_storeStrong((id *)&self->_secondaryViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
}

@end
