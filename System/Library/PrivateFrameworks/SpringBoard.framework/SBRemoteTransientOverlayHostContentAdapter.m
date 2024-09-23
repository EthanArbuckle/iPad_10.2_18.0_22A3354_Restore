@implementation SBRemoteTransientOverlayHostContentAdapter

- (id)_initWithContentViewController:(id)a3
{
  id v5;
  SBRemoteTransientOverlayHostContentAdapter *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  v6 = -[SBRemoteTransientOverlayHostContentAdapter init](&v9, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hostRemoteViewController, a3);
    objc_msgSend(p_isa[13], "setDelegate:", p_isa);
  }

  return p_isa;
}

- (id)_initWithSceneController:(id)a3 processIdentity:(id)a4 configurationIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBRemoteTransientOverlayHostContentAdapter *v12;
  id *p_isa;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  v12 = -[SBRemoteTransientOverlayHostContentAdapter init](&v22, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sceneController, a3);
    objc_msgSend(p_isa[7], "setPresenter:", p_isa);
    objc_storeStrong(p_isa + 6, a4);
    objc_msgSend(p_isa[7], "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", p_isa);
    v15 = objc_opt_class();
    objc_msgSend(v14, "componentForExtension:ofClass:", v15, objc_opt_class());
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = p_isa[8];
    p_isa[8] = (id)v16;

    objc_msgSend(p_isa[8], "setDelegate:", p_isa);
    objc_msgSend(p_isa[8], "setConfigurationIdentifier:", v11);
    v18 = objc_opt_class();
    objc_msgSend(v14, "componentForExtension:ofClass:", v18, objc_opt_class());
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = p_isa[9];
    p_isa[9] = (id)v19;

    objc_msgSend(p_isa[9], "setDelegate:", p_isa);
  }

  return p_isa;
}

- (void)dealloc
{
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  void *v4;
  objc_super v5;

  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    -[SBRemoteTransientOverlayHostViewController setDelegate:](hostRemoteViewController, "setDelegate:", 0);
  }
  else
  {
    -[SBSUIRemoteAlertSceneHostComponent setDelegate:](self->_remoteAlertHostComponent, "setDelegate:", 0);
    -[SBSUIFeaturePolicyHostComponent setDelegate:](self->_featurePolicyHostComponent, "setDelegate:", 0);
    -[SBSingleSceneController scene](self->_sceneController, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[SBSingleSceneController invalidate](self->_sceneController, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  -[SBRemoteTransientOverlayHostContentAdapter dealloc](&v5, sel_dealloc);
}

+ (void)requestContentAdaptersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  SBSingleSceneController *v27;
  double v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SBSingleSceneController *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  SBSingleSceneController *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  _QWORD *v56;
  uint64_t *v57;
  _QWORD v58[4];
  id v59;
  _QWORD *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint8_t buf[4];
  SBSingleSceneController *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a4;
  v9 = a5;
  objc_msgSend(v8, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__111;
  v77 = __Block_byref_object_dispose__111;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__111;
  v71 = __Block_byref_object_dispose__111;
  v72 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__111;
  v65[4] = __Block_byref_object_dispose__111;
  v66 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke;
  v62[3] = &unk_1E8EBDB40;
  v12 = v8;
  v63 = v12;
  v13 = v10;
  v64 = v13;
  v58[0] = v11;
  v58[1] = 3221225472;
  v58[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_2;
  v58[3] = &unk_1E8EBDB68;
  v61 = a1;
  v14 = (id)MEMORY[0x1D17E5550](v62);
  v59 = v14;
  v60 = v65;
  v15 = (void *)MEMORY[0x1D17E5550](v58);
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v12, "viewControllerClassName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v11;
    v50[1] = 3221225472;
    v50[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_3;
    v50[3] = &unk_1E8EBDBB8;
    v53 = v15;
    v55 = &v73;
    v56 = v65;
    v51 = v12;
    v52 = v13;
    v57 = &v67;
    v54 = v9;
    v17 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SBRemoteTransientOverlayHostViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v16, v52, v50);

    v18 = v53;
  }
  else
  {
    objc_msgSend(v12, "sceneProvidingProcess");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v48 = objc_alloc_init(MEMORY[0x1E0CEA948]);
      v19 = objc_alloc_init(MEMORY[0x1E0DAC540]);
      objc_msgSend(v48, "setSpecification:", v19);

      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@-RemoteAlert"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setIdentifier:", v23);

      objc_msgSend(v48, "specification");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v24, "defaultExtensions");

      v26 = objc_alloc_init(MEMORY[0x1E0CEA788]);
      objc_msgSend(v26, "setPreferredSceneDeactivationReason:", &unk_1E91D2018);
      objc_msgSend(v48, "setInitialClientSettings:", v26);
      v46 = v26;
      v27 = [SBSingleSceneController alloc];
      v28 = *MEMORY[0x1E0CEBBD0] + 5.0;
      v47 = -[SBSingleSceneController initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:](v27, "initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:", v49, v48, v18, v28);
      SBLogTransientOverlay();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[SBSingleSceneController scene](v47, "scene");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v47;
        v81 = 2114;
        v82 = v30;
        _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "created singleSceneController %{public}@ with scene %{public}@", buf, 0x16u);

      }
      v31 = objc_alloc((Class)a1);
      objc_msgSend(v12, "configurationIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "_initWithSceneController:processIdentity:configurationIdentifier:", v47, v18, v32);
      v34 = (void *)v74[5];
      v74[5] = v33;

      (*((void (**)(id, uint64_t))v14 + 2))(v14, v74[5]);
      if (SBFIsChamoisExternalDisplayControllerAvailable()
        && objc_msgSend(v12, "supportsMultipleDisplayPresentations"))
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "UUIDString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-RemoteAlert"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setIdentifier:", v38);

        v39 = -[SBSingleSceneController initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:]([SBSingleSceneController alloc], "initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:", v49, v48, v18, CFSTR("SBTraitsParticipantRoleTransientOverlay"), v28);
        SBLogTransientOverlay();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          -[SBSingleSceneController scene](v39, "scene");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v39;
          v81 = 2114;
          v82 = v41;
          _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "created secondary singleSceneController %{public}@ with scene %{public}@", buf, 0x16u);

        }
        v42 = objc_alloc((Class)a1);
        objc_msgSend(v12, "secondaryConfigurationIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "_initWithSceneController:processIdentity:configurationIdentifier:", v39, v18, v43);
        v45 = (void *)v68[5];
        v68[5] = v44;

        (*((void (**)(id, uint64_t))v14 + 2))(v14, v68[5]);
      }

    }
    (*((void (**)(id, uint64_t, uint64_t, _QWORD))v9 + 2))(v9, v74[5], v68[5], 0);
  }

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isForCarPlay");
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.InCallService")))
    {
      objc_msgSend(v6, "setShouldEnableFadeInAnimation:", 1);
      objc_msgSend(v6, "setShouldEnableFadeOutAnimation:", 1);
      objc_msgSend(v6, "setSwitcherEligible:", 1);
LABEL_8:
      v4 = v6;
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.RemoteAlertTestUIService")))
    {
      objc_msgSend(v6, "setAllowsCustomPresentationDismissalAnimations:", 1);
      goto LABEL_8;
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));
    v4 = v6;
    if (v5)
    {
      objc_msgSend(v6, "setIsScreenshotMarkup:", 1);
      goto LABEL_8;
    }
  }
LABEL_9:

}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_2(uint64_t a1, _QWORD *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id obj;

  obj = a4;
  v7 = a3;
  v8 = objc_opt_class();
  SBSafeCast(v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "_initWithContentViewController:", v9));
    *a2 = v10;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_3:

    goto LABEL_7;
  }
  *a2 = 0;
  v10 = obj;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBRemoteTransientOverlayViewControllerErrorDomain"), -1001, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
  if (!obj)
    goto LABEL_3;
LABEL_7:

}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), v15);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    && SBFIsChamoisExternalDisplayControllerAvailable()
    && (objc_msgSend(*(id *)(a1 + 32), "secondaryViewControllerClassName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "secondaryViewControllerClassName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_4;
    v10[3] = &unk_1E8EBDB90;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 80);
    v11 = v7;
    v13 = v8;
    v12 = *(id *)(a1 + 56);
    v14 = *(_OWORD *)(a1 + 64);
    v9 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SBRemoteTransientOverlayHostViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, v6, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (id)_contentViewController
{
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;

  hostRemoteViewController = self->_hostRemoteViewController;
  if (!hostRemoteViewController)
    hostRemoteViewController = (SBRemoteTransientOverlayHostViewController *)self->_sceneViewController;
  return hostRemoteViewController;
}

- (id)contentViewControllerForPresentationEmbeddedInSceneView:(BOOL)a3
{
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  SBRemoteTransientOverlayHostViewController *v5;

  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
    goto LABEL_6;
  if (a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    hostRemoteViewController = (SBRemoteTransientOverlayHostViewController *)self->_sceneViewController;
LABEL_6:
    v5 = hostRemoteViewController;
    return v5;
  }
  -[UIViewController contentViewController](self->_sceneViewController, "contentViewController");
  v5 = (SBRemoteTransientOverlayHostViewController *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (int)serviceProcessIdentifier
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    return -[_UIRemoteViewController serviceProcessIdentifier](self->_hostRemoteViewController, "serviceProcessIdentifier");
  -[SBSUIRemoteAlertSceneHostComponent hostScene](remoteAlertHostComponent, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pid");

  return v7;
}

- (NSString)serviceBundleIdentifier
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
  {
    -[SBSUIRemoteAlertSceneHostComponent hostScene](remoteAlertHostComponent, "hostScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "hasConsistentLaunchdJob"))
    {
      objc_msgSend(v6, "consistentJobLabel");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isDaemon"))
      {
        if (objc_msgSend(v6, "isApplication"))
        {
          objc_msgSend(v6, "bundle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v8 = 0;
        }
        goto LABEL_8;
      }
      objc_msgSend(v6, "daemonJobLabel");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
LABEL_8:

    return (NSString *)v8;
  }
  -[_UIRemoteViewController serviceBundleIdentifier](self->_hostRemoteViewController, "serviceBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v8;
}

- (FBSSceneIdentityToken)clientSceneIdentityToken
{
  void *v2;
  void *v3;

  -[SBSUIRemoteAlertSceneHostComponent hostScene](self->_remoteAlertHostComponent, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSSceneIdentityToken *)v3;
}

- (NSString)associatedSceneIdentifierToSuppressInSystemAperture
{
  void *v2;
  void *v3;

  -[SBSUIRemoteAlertSceneHostComponent hostScene](self->_remoteAlertHostComponent, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  return (NSString *)-[SBRemoteTransientOverlayHostContentAdapter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBRemoteTransientOverlayHostContentAdapter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *hostRemoteViewController;
  const __CFString *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    v6 = CFSTR("remoteViewController");
  }
  else
  {
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_remoteAlertHostComponent, CFSTR("remoteAlertSceneHostComponent"));
    hostRemoteViewController = self->_featurePolicyHostComponent;
    v6 = CFSTR("featurePolicyHostComponent");
  }
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", hostRemoteViewController, v6);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBRemoteTransientOverlayHostContentAdapter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
    return -[SBSUIRemoteAlertSceneHostComponent allowsAlertStacking](remoteAlertHostComponent, "allowsAlertStacking");
  else
    return -[SBRemoteTransientOverlayHostViewController allowsStackingOverlayContentAbove](self->_hostRemoteViewController, "allowsStackingOverlayContentAbove");
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
    -[SBSUIRemoteAlertSceneHostComponent preferredSceneDeactivationReason](remoteAlertHostComponent, "preferredSceneDeactivationReason");
  else
    -[SBRemoteTransientOverlayHostViewController preferredSceneDeactivationReasonValue](self->_hostRemoteViewController, "preferredSceneDeactivationReasonValue");
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)preferredStatusBarStyle
{
  void *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(remoteAlertHostComponent, "preferredStatusBarStyle");
}

- (int)preferredStatusBarVisibility
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
    return -[SBSUIRemoteAlertSceneHostComponent preferredStatusBarVisibility](remoteAlertHostComponent, "preferredStatusBarVisibility");
  else
    return -[SBRemoteTransientOverlayHostViewController _preferredStatusBarVisibility](self->_hostRemoteViewController, "_preferredStatusBarVisibility");
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
    -[SBSUIRemoteAlertSceneHostComponent backgroundActivitiesToSuppress](remoteAlertHostComponent, "backgroundActivitiesToSuppress");
  else
    -[SBRemoteTransientOverlayHostViewController preferredBackgroundActivitiesToSuppress](self->_hostRemoteViewController, "preferredBackgroundActivitiesToSuppress");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  void *v3;
  int64_t v4;

  if (self->_preferredWhitePointAdaptivityStyleValue)
    return -[NSNumber integerValue](self->_preferredWhitePointAdaptivityStyleValue, "integerValue");
  -[SBRemoteTransientOverlayHostContentAdapter _contentViewController](self, "_contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredWhitePointAdaptivityStyle");

  return v4;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = self->_launchingInterfaceOrientation;
  if (!result)
  {
    -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:", self);

    return v5;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    return -[_UIRemoteViewController supportedInterfaceOrientations](self->_hostRemoteViewController, "supportedInterfaceOrientations");
  v4 = -[SBSUIRemoteAlertSceneHostComponent supportedInterfaceOrientations](remoteAlertHostComponent, "supportedInterfaceOrientations");
  if (v4)
    return v4;
  -[SBSingleSceneController scene](self->_sceneController, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return -[SBSingleSceneController initialSupportedInterfaceOrientations](self->_sceneController, "initialSupportedInterfaceOrientations");
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWithBundleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "supportedInterfaceOrientations");

  if (v4)
    return v4;
  else
    return -[SBSingleSceneController initialSupportedInterfaceOrientations](self->_sceneController, "initialSupportedInterfaceOrientations");
}

- (BOOL)shouldDisableOrientationUpdates
{
  void *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(remoteAlertHostComponent, "shouldDisableOrientationUpdates");
}

- (BOOL)shouldIgnoreContentOverlayInsetUpdates
{
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;

  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
    LOBYTE(hostRemoteViewController) = -[SBRemoteTransientOverlayHostViewController shouldIgnoreContentOverlayInsetUpdates](hostRemoteViewController, "shouldIgnoreContentOverlayInsetUpdates");
  return (char)hostRemoteViewController;
}

- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController setShouldIgnoreContentOverlayInsetUpdates:](self->_hostRemoteViewController, "setShouldIgnoreContentOverlayInsetUpdates:", a3);
}

- (void)setIsScreenshotMarkup:(BOOL)a3
{
  id v4;

  if (self->_isScreenshotMarkup != a3)
  {
    self->_isScreenshotMarkup = a3;
    -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

  }
}

- (BOOL)shouldDisableBanners
{
  void *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent)
    featurePolicyHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(featurePolicyHostComponent, "shouldDisableBanners");
}

- (BOOL)shouldDisableControlCenter
{
  void *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent)
    featurePolicyHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(featurePolicyHostComponent, "shouldDisableControlCenter");
}

- (BOOL)shouldDisableReachability
{
  void *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent)
    featurePolicyHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(featurePolicyHostComponent, "shouldDisableReachability");
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  void *featurePolicyHostComponent;

  if (self->_isScreenshotMarkup)
    return 1;
  if (self->_featurePolicyHostComponent)
    featurePolicyHostComponent = self->_featurePolicyHostComponent;
  else
    featurePolicyHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(featurePolicyHostComponent, "shouldDisableInteractiveScreenshotGesture");
}

- (BOOL)shouldDisableSiri
{
  void *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent)
    featurePolicyHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(featurePolicyHostComponent, "shouldDisableSiri");
}

- (BOOL)shouldPendAlertItems
{
  SBSUIFeaturePolicyHostComponent *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent)
    return -[SBSUIFeaturePolicyHostComponent shouldDisableAlertItems](featurePolicyHostComponent, "shouldDisableAlertItems");
  else
    return -[SBRemoteTransientOverlayHostViewController shouldPendAlertItems](self->_hostRemoteViewController, "shouldPendAlertItems");
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return self->_remoteAlertHostComponent != 0;
}

- (BOOL)shouldUpdateSceneBasedViewController
{
  return self->_remoteAlertHostComponent != 0;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    return 0;
  v4 = a3;
  -[SBSUIRemoteAlertSceneHostComponent hostScene](remoteAlertHostComponent, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  return v8;
}

- (id)keyboardFocusTarget
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[SBSUIRemoteAlertSceneHostComponent hostScene](self->_remoteAlertHostComponent, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pid");

  if (v5 < 1)
  {
    v6 = 0;
  }
  else
  {
    +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    -[SBRemoteTransientOverlayHostViewController configureWithContext:completion:](hostRemoteViewController, "configureWithContext:completion:", v9, v6);
  }
  else
  {
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
    if (remoteAlertHostComponent)
    {
      -[SBSUIRemoteAlertSceneHostComponent setConfigurationContext:](remoteAlertHostComponent, "setConfigurationContext:", v9);
      if (v6)
        v6[2](v6);
    }
  }

}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 windowScene:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  void *v16;
  id v17;
  void *v18;
  id sceneViewControllerReadyBlock;
  SBSingleSceneController *sceneController;
  void *v21;
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "isActivatingForSiri"))
    self->_activatingForSiri = 1;
  if (objc_msgSend(v10, "isSwitcherEligible"))
  {
    -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self, "serviceBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (prepareForActivationWithContext_presentationMode_windowScene_completion__oOnceToken != -1)
        dispatch_once(&prepareForActivationWithContext_presentationMode_windowScene_completion__oOnceToken, &__block_literal_global_357);
      if (objc_msgSend((id)prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs, "containsObject:", v13)&& !self->_switcherEligible)
      {
        self->_switcherEligible = 1;
        -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredGestureDismissalStyles](self, "_updatePreferredGestureDismissalStyles");
      }
    }

  }
  if (objc_msgSend(v10, "shouldInvalidateWhenDeactivated"))
    v14 = !self->_switcherEligible;
  else
    v14 = 0;
  self->_shouldInvalidateWhenDeactivated = v14;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    -[SBRemoteTransientOverlayHostViewController prepareForActivationWithContext:presentationMode:completion:](hostRemoteViewController, "prepareForActivationWithContext:presentationMode:completion:", v10, a4, v12);
  }
  else if (self->_remoteAlertHostComponent)
  {
    objc_msgSend(v10, "setPresentationMode:", a4);
    -[SBSUIRemoteAlertSceneHostComponent setActivationContext:](self->_remoteAlertHostComponent, "setActivationContext:", v10);
    -[SBSUIRemoteAlertSceneHostComponent setDefaultStatusBarHeightsForWindowScene:](self->_remoteAlertHostComponent, "setDefaultStatusBarHeightsForWindowScene:", v11);
    v16 = (void *)objc_msgSend(v12, "copy");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke_2;
    v22[3] = &unk_1E8E9F598;
    v23 = v16;
    v17 = v16;
    v18 = (void *)MEMORY[0x1D17E5550](v22);
    sceneViewControllerReadyBlock = self->_sceneViewControllerReadyBlock;
    self->_sceneViewControllerReadyBlock = v18;

    -[SBSingleSceneController setInitialSupportedInterfaceOrientations:](self->_sceneController, "setInitialSupportedInterfaceOrientations:", objc_msgSend(v10, "initialSupportedInterfaceOrientations"));
    sceneController = self->_sceneController;
    objc_msgSend(v11, "_fbsDisplayConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSingleSceneController setTargetDisplayConfiguration:](sceneController, "setTargetDisplayConfiguration:", v21);

  }
}

void __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.RemoteAlertTestUIService");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs;
  prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs = v2;

}

uint64_t __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didDeactivateForRemoteAlertSessionDeactivation
{
  _QWORD block[5];

  if (self->_sceneController
    && !self->_invalidating
    && !-[SBRemoteTransientOverlayHostContentAdapter shouldInvalidateWhenDeactivated](self, "shouldInvalidateWhenDeactivated"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__SBRemoteTransientOverlayHostContentAdapter_didDeactivateForRemoteAlertSessionDeactivation__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __92__SBRemoteTransientOverlayHostContentAdapter_didDeactivateForRemoteAlertSessionDeactivation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTargetDisplayConfiguration:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setSceneActive:", 0);
}

- (void)didInvalidateForRemoteAlert
{
  SBSUIRemoteAlertSceneHostComponent *remoteAlertHostComponent;
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
  {
    -[SBSUIRemoteAlertSceneHostComponent didInvalidateForRemoteAlertServiceInvalidation](remoteAlertHostComponent, "didInvalidateForRemoteAlertServiceInvalidation");
  }
  else
  {
    hostRemoteViewController = self->_hostRemoteViewController;
    if (hostRemoteViewController)
      -[SBRemoteTransientOverlayHostViewController didInvalidateForRemoteAlert](hostRemoteViewController, "didInvalidateForRemoteAlert");
  }
}

- (void)handlePictureInPictureDidBegin
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  SBRemoteTransientOverlayHostContentAdapter *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received %{public}@, invalidating...", (uint8_t *)&v7, 0x16u);

  }
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTransientOverlayHostContentAdapterRequestsInvalidation:", self);

}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController preserveInputViewsAnimated:](self->_hostRemoteViewController, "preserveInputViewsAnimated:", a3);
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController restoreInputViewsAnimated:](self->_hostRemoteViewController, "restoreInputViewsAnimated:", a3);
}

- (BOOL)isAttachedToWindowedAccessory
{
  void *remoteAlertHostComponent;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  return objc_msgSend(remoteAlertHostComponent, "isAttachedToWindowedAccessory");
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  void *remoteAlertHostComponent;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  objc_msgSend(remoteAlertHostComponent, "windowedAccessoryCutoutFrameInScreen");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  void *remoteAlertHostComponent;

  if (self->_remoteAlertHostComponent)
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
  else
    remoteAlertHostComponent = self->_hostRemoteViewController;
  objc_msgSend(remoteAlertHostComponent, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)setMediaOverridePID:(int)a3
{
  -[_UIRemoteViewController __setMediaOverridePID:](self->_hostRemoteViewController, "__setMediaOverridePID:", *(_QWORD *)&a3);
}

- (void)setShouldPresentEmbeddedInTargetSceneIfRequested:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;

  v3 = a3;
  self->_shouldPresentEmbeddedInTargetSceneIfRequested = a3;
  -[SBSingleSceneController setShouldPresentAnyContentState:](self->_sceneController, "setShouldPresentAnyContentState:");
  v5 = !v3;
  -[SBSingleSceneController setShouldActivateForDisplayConfiguration:](self->_sceneController, "setShouldActivateForDisplayConfiguration:", v5);
  -[SBSingleSceneController setShouldForegroundForDisplayConfiguration:](self->_sceneController, "setShouldForegroundForDisplayConfiguration:", v5);
}

- (BOOL)hidEventDeferringDisabled
{
  return -[SBSUIRemoteAlertSceneHostComponent hidEventDeferringDisabled](self->_remoteAlertHostComponent, "hidEventDeferringDisabled");
}

- (BOOL)shouldEnableFadeInAnimation
{
  return -[SBRemoteTransientOverlayHostViewController shouldEnableFadeInAnimation](self->_hostRemoteViewController, "shouldEnableFadeInAnimation");
}

- (void)setShouldEnableFadeInAnimation:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController setShouldEnableFadeInAnimation:](self->_hostRemoteViewController, "setShouldEnableFadeInAnimation:", a3);
}

- (BOOL)shouldEnableFadeOutAnimation
{
  return -[SBRemoteTransientOverlayHostViewController shouldEnableFadeOutAnimation](self->_hostRemoteViewController, "shouldEnableFadeOutAnimation");
}

- (void)setShouldEnableFadeOutAnimation:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController setShouldEnableFadeOutAnimation:](self->_hostRemoteViewController, "setShouldEnableFadeOutAnimation:", a3);
}

- (BOOL)allowsCustomPresentationDismissalAnimations
{
  return -[SBRemoteTransientOverlayHostViewController allowsCustomPresentationDismissalAnimations](self->_hostRemoteViewController, "allowsCustomPresentationDismissalAnimations");
}

- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3
{
  -[SBRemoteTransientOverlayHostViewController setAllowsCustomPresentationDismissalAnimations:](self->_hostRemoteViewController, "setAllowsCustomPresentationDismissalAnimations:", a3);
}

- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  void (**v8)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    v8 = v6;
    -[SBRemoteTransientOverlayHostViewController presentForTransientOverlayAnimated:completion:](hostRemoteViewController, "presentForTransientOverlayAnimated:completion:", v4, v6);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
    v6[2](v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  SBRemoteTransientOverlayHostViewController *hostRemoteViewController;
  void (**v8)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    v8 = v6;
    -[SBRemoteTransientOverlayHostViewController dismissForTransientOverlayAnimated:completion:](hostRemoteViewController, "dismissForTransientOverlayAnimated:completion:", v4, v6);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
    v6[2](v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)handleDoubleHeightStatusBarTap
{
  return -[SBRemoteTransientOverlayHostViewController handleDoubleHeightStatusBarTap](self->_hostRemoteViewController, "handleDoubleHeightStatusBarTap");
}

- (BOOL)handleHomeButtonPress
{
  _BOOL4 v3;
  id WeakRetained;

  if ((-[SBRemoteTransientOverlayHostContentAdapter _desiredHardwareButtonEvents](self, "_desiredHardwareButtonEvents") & 0x10) != 0)
  {
    LOBYTE(v3) = -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", 16);
  }
  else
  {
    v3 = -[SBRemoteTransientOverlayHostContentAdapter _allowsHomeButtonDismissal](self, "_allowsHomeButtonDismissal");
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (-[SBRemoteTransientOverlayHostContentAdapter isSwitcherEligible](self, "isSwitcherEligible"))
        objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapterRequestsDeactivation:", self);
      else
        objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapterRequestsInvalidation:", self);

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return (-[SBRemoteTransientOverlayHostContentAdapter _desiredHardwareButtonEvents](self, "_desiredHardwareButtonEvents") & 1) != 0&& -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", 1);
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return (-[SBRemoteTransientOverlayHostContentAdapter _desiredHardwareButtonEvents](self, "_desiredHardwareButtonEvents") & 2) != 0&& -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", 2);
}

- (BOOL)handleVolumeDownButtonPress
{
  return (-[SBRemoteTransientOverlayHostContentAdapter _desiredHardwareButtonEvents](self, "_desiredHardwareButtonEvents") & 4) != 0&& -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", 4);
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBRemoteTransientOverlayHostContentAdapter _desiredHardwareButtonEvents](self, "_desiredHardwareButtonEvents");
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      v6 = 8;
      return -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", v6);
    }
    return 0;
  }
  if ((v5 & 0x20) == 0)
    return 0;
  v6 = 32;
  return -[SBRemoteTransientOverlayHostContentAdapter _performButtonEvents:](self, "_performButtonEvents:", v6);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", self);
}

- (int64_t)idleTimerDuration
{
  if (self->_shouldUseLockedIdleTimerDuration)
    return 1;
  else
    return 12;
}

- (int64_t)idleTimerMode
{
  if (-[NSMutableSet count](self->_idleTimerDisabledReasons, "count"))
    return 3;
  if (self->_shouldUseLockedIdleTimerDuration)
    return 2;
  return 1;
}

- (int64_t)idleWarnMode
{
  if (self->_shouldDisableIdleWarn)
    return 1;
  else
    return 2;
}

- (double)customIdleExpirationTimeout
{
  return self->_customIdleExpirationTimeout;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  void (**v5)(_QWORD);
  _BOOL4 v6;
  void *v7;
  UIViewController *v8;
  UIViewController *sceneViewController;
  UIViewController *v10;
  UIViewController *v11;
  void *v12;
  void *v13;

  v5 = (void (**)(_QWORD))a4;
  v6 = -[SBRemoteTransientOverlayHostContentAdapter shouldPresentEmbeddedInTargetSceneIfRequested](self, "shouldPresentEmbeddedInTargetSceneIfRequested");
  v5[2](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v7, "traitsOrientedResizableViewController");
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    sceneViewController = self->_sceneViewController;
    self->_sceneViewController = v8;

    -[UIViewController setGeometryDelegate:](self->_sceneViewController, "setGeometryDelegate:", self);
  }
  else
  {
    objc_msgSend(v7, "traitsOrientedViewController");
    v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sceneViewController;
    self->_sceneViewController = v10;

  }
  if (self->_sceneViewControllerReadyBlock)
  {
    -[SBSingleSceneController scene](self->_sceneController, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isValid")
      && (objc_msgSend(v12, "clientHandle"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
    {
      self->_sceneViewControllerWaitingForClientConnection = 1;
    }
    else
    {
      -[SBRemoteTransientOverlayHostContentAdapter _callSceneViewControllerReadyBlockWithError:](self, "_callSceneViewControllerReadyBlockWithError:", 0);
    }

  }
  return 0;
}

- (id)dismissScene:(id)a3
{
  void *v4;
  UIViewController *sceneViewController;

  -[UIViewController parentViewController](self->_sceneViewController, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_removeChildViewController:", self->_sceneViewController);

  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = 0;

  return 0;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  if (self->_sceneViewControllerWaitingForClientConnection)
  {
    if (self->_sceneViewControllerReadyBlock)
    {
      self->_sceneViewControllerWaitingForClientConnection = 0;
      -[SBRemoteTransientOverlayHostContentAdapter _callSceneViewControllerReadyBlockWithError:](self, "_callSceneViewControllerReadyBlockWithError:", 0, a4);
    }
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    if (self->_sceneViewControllerWaitingForClientConnection && self->_sceneViewControllerReadyBlock)
    {
      self->_sceneViewControllerWaitingForClientConnection = 0;
      -[SBRemoteTransientOverlayHostContentAdapter _callSceneViewControllerReadyBlockWithError:](self, "_callSceneViewControllerReadyBlockWithError:", v6);
    }
    else
    {
      -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteTransientOverlayHostContentAdapter:didTerminateWithError:", self, v6);

    }
  }

}

- (void)featurePolicyHostComponentDidChangeShouldDisableBanners:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)featurePolicyHostComponentDidChangeShouldDisableAlertItems:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)featurePolicyHostComponentDidChangeShouldDisableControlCenter:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)featurePolicyHostComponentDidChangeShouldDisableSiri:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)featurePolicyHostComponentDidChangeShouldDisableInteractiveScreenshotGesture:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)remoteAlertSceneHostComponentDidDeactivate:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterRequestsDeactivation:", self);

}

- (void)remoteAlertSceneHostComponentDidInvalidate:(id)a3
{
  id v4;

  self->_invalidating = 1;
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterRequestsInvalidation:", self);

}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangeWallpaperStyleWithAnimationSettings:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredBackgroundStyleWithAnimationSettings:](self, "_updatePreferredBackgroundStyleWithAnimationSettings:", a4);
}

- (void)remoteAlertSceneHostComponentDidChangeSwipeDismissalStyle:(id)a3
{
  -[SBRemoteTransientOverlayHostContentAdapter _handleUpdatedSwipeDismissalStyle:](self, "_handleUpdatedSwipeDismissalStyle:", objc_msgSend(a3, "swipeDismissalStyle"));
}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _updateBackgroundActivitiesToSuppressWithAnimationSettings:](self, "_updateBackgroundActivitiesToSuppressWithAnimationSettings:", a4);
}

- (void)remoteAlertSceneHostComponent:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5
{
  -[SBRemoteTransientOverlayHostContentAdapter _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:", a4, a5);
}

- (void)remoteAlertSceneHostComponentDidChangeDesiredAutoLockDuration:(id)a3
{
  objc_msgSend(a3, "desiredAutoLockDuration");
  -[SBRemoteTransientOverlayHostContentAdapter _setDesiredAutoLockDuration:](self, "_setDesiredAutoLockDuration:");
}

- (void)remoteAlertSceneHostComponentDidChangeDesiredIdleTimerSettings:(id)a3
{
  id v4;

  objc_msgSend(a3, "desiredIdleTimerSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRemoteTransientOverlayHostContentAdapter _setDesiredIdleTimerSettings:](self, "_setDesiredIdleTimerSettings:", v4);

}

- (void)remoteAlertSceneHostComponentDidChangeShouldDisableOrientationUpdates:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeShouldDisableOrientationUpdates:", self);

}

- (void)remoteAlertSceneHostComponentDidChangeSupportedInterfaceOrientations:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeSupportedInterfaceOrientations:", self);

}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTransientOverlayHostContentAdapter:needsStatusBarAppearanceUpdateWithAnimationSettings:", self, v5);

}

- (void)remoteAlertSceneHostComponentDidChangeWhitePointAdaptivityStyle:(id)a3
{
  -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredWhitePointAdaptivityStyle:](self, "_updatePreferredWhitePointAdaptivityStyle:", objc_msgSend(a3, "whitePointAdaptivityStyle"));
}

- (void)remoteAlertSceneHostComponentDidChangePreferredSceneDeactivationReason:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangePreferredSceneDeactivationReasonValue:", self);

}

- (void)remoteAlertSceneHostComponentDidChangeHIDEventDeferringDisabled:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeHIDEventDeferringDisabled:", self);

}

- (void)remoteTransientOverlayHostViewControllerDidChangePrefersWallpaperTunnel:(id)a3
{
  -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredBackgroundStyleWithAnimationSettings:](self, "_updatePreferredBackgroundStyleWithAnimationSettings:", 0);
}

- (void)remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:(id)a3 withAnimationSettings:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredBackgroundStyleWithAnimationSettings:](self, "_updatePreferredBackgroundStyleWithAnimationSettings:", a4);
}

- (void)remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:", self);

}

- (void)remoteTransientOverlayHostViewControllerDidChangeSwipeDismissalStyle:(id)a3
{
  -[SBRemoteTransientOverlayHostContentAdapter _handleUpdatedSwipeDismissalStyle:](self, "_handleUpdatedSwipeDismissalStyle:", objc_msgSend(a3, "swipeDismissalStyle"));
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeWhitePointAdaptivityStyle:(int64_t)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredWhitePointAdaptivityStyle:](self, "_updatePreferredWhitePointAdaptivityStyle:", a4);
}

- (void)remoteTransientOverlayHostViewControllerDidChangePreferredSceneDeactivationReasonValue:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangePreferredSceneDeactivationReasonValue:", self);

}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _updateBackgroundActivitiesToSuppressWithAnimationSettings:](self, "_updateBackgroundActivitiesToSuppressWithAnimationSettings:", a4);
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeLaunchingInterfaceOrientation:(int64_t)a4
{
  self->_launchingInterfaceOrientation = a4;
}

- (void)remoteTransientOverlayHostViewControllerDidChangeShouldDisableOrientationUpdates:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterDidChangeShouldDisableOrientationUpdates:", self);

}

- (void)remoteTransientOverlayHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5
{
  -[SBRemoteTransientOverlayHostContentAdapter _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:", a4, a5);
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didSetDesiredIdleTimerSettings:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter _setDesiredIdleTimerSettings:](self, "_setDesiredIdleTimerSettings:", a4);
}

- (void)remoteTransientOverlayHostViewControllerRequestsDeactivation:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterRequestsDeactivation:", self);

}

- (void)remoteTransientOverlayHostViewControllerRequestsInvalidation:(id)a3
{
  id v4;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTransientOverlayHostContentAdapterRequestsInvalidation:", self);

}

- (void)remoteTransientOverlayHostViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTransientOverlayHostContentAdapter:didTerminateWithError:", self, v5);

}

- (void)remoteTransientOverlayHostViewController:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTransientOverlayHostContentAdapter:requestsWallpaperEffectUpdateWithAnimationSettings:", self, v5);

}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostViewController:(id)a3
{
  void *v4;
  int64_t v5;

  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:", self);

  return v5;
}

- (CGRect)adjustedBoundsForContentViewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBRemoteTransientOverlayHostContentAdapter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedBoundsForContentBounds:inRemoteTransientOverlayHostContentAdapter:", self, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldInvalidateForSecureDrawingMode
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;

  -[SBSUIRemoteAlertSceneHostComponent hostScene](self->_remoteAlertHostComponent, "hostScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sb_canDrawWhileLocked");

  objc_msgSend((id)SBApp, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSingleSceneController targetDisplayConfiguration](self->_sceneController, "targetDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowSceneForDisplayIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "secureDisplayStateProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = objc_msgSend(v14, "isInSecureDisplayMode") & (v6 ^ 1);
  return v15;
}

- (void)_callSceneViewControllerReadyBlockWithError:(id)a3
{
  id v4;
  id sceneViewControllerReadyBlock;
  id v6;

  v4 = a3;
  if (self->_sceneViewControllerReadyBlock)
  {
    if (!v4)
    {
      if (-[SBRemoteTransientOverlayHostContentAdapter _shouldInvalidateForSecureDrawingMode](self, "_shouldInvalidateForSecureDrawingMode"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBRemoteTransientOverlayViewControllerErrorDomain"), -1000, 0);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
    }
    v6 = v4;
    (*((void (**)(void))self->_sceneViewControllerReadyBlock + 2))();
    sceneViewControllerReadyBlock = self->_sceneViewControllerReadyBlock;
    self->_sceneViewControllerReadyBlock = 0;

    v4 = v6;
  }

}

- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *idleTimerDisabledReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v6 = a4;
  idleTimerDisabledReasons = self->_idleTimerDisabledReasons;
  v14 = v6;
  if (v4)
  {
    if (!idleTimerDisabledReasons)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = self->_idleTimerDisabledReasons;
      self->_idleTimerDisabledReasons = v8;

      v6 = v14;
      idleTimerDisabledReasons = self->_idleTimerDisabledReasons;
    }
    -[NSMutableSet addObject:](idleTimerDisabledReasons, "addObject:", v6);
  }
  else
  {
    -[NSMutableSet removeObject:](idleTimerDisabledReasons, "removeObject:", v6);
    if (!-[NSMutableSet count](self->_idleTimerDisabledReasons, "count"))
    {
      v10 = self->_idleTimerDisabledReasons;
      self->_idleTimerDisabledReasons = 0;

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  -[SBRemoteTransientOverlayHostContentAdapter coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(WeakRetained, "idleTimerProvider:didProposeBehavior:forReason:", self, v12, v14);

}

- (void)_setDesiredAutoLockDuration:(double)a3
{
  void *v4;
  id v5;
  id WeakRetained;

  self->_customIdleExpirationTimeout = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  -[SBRemoteTransientOverlayHostContentAdapter coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(WeakRetained, "idleTimerProvider:didProposeBehavior:forReason:", self, v4, CFSTR("SBRemoteTransientOverlayHostContentAdapterSetDesiredAutoLockDuration"));

}

- (void)_setDesiredIdleTimerSettings:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id WeakRetained;

  v4 = a3;
  self->_shouldUseLockedIdleTimerDuration = objc_msgSend(v4, "usesLockScreenRules");
  self->_shouldDisableIdleWarn = objc_msgSend(v4, "disablesWarn");
  objc_msgSend(v4, "autoLockTimeout");
  v6 = v5;

  self->_customIdleExpirationTimeout = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  -[SBRemoteTransientOverlayHostContentAdapter coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(WeakRetained, "idleTimerProvider:didProposeBehavior:forReason:", self, v7, CFSTR("SBRemoteTransientOverlayHostContentAdapterSetDesiredIdleTimerSettings"));

}

- (unint64_t)_desiredHardwareButtonEvents
{
  SBSUIFeaturePolicyHostComponent *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent)
    return -[SBSUIFeaturePolicyHostComponent desiredHardwareButtonEvents](featurePolicyHostComponent, "desiredHardwareButtonEvents");
  else
    return -[SBRemoteTransientOverlayHostViewController preferredHardwareButtonEvents](self->_hostRemoteViewController, "preferredHardwareButtonEvents");
}

- (BOOL)_allowsHomeButtonDismissal
{
  SBSUIFeaturePolicyHostComponent *featurePolicyHostComponent;

  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent)
    return -[SBSUIFeaturePolicyHostComponent allowsMenuButtonDismissal](featurePolicyHostComponent, "allowsMenuButtonDismissal");
  else
    return -[SBRemoteTransientOverlayHostViewController allowsHomeButtonDismissal](self->_hostRemoteViewController, "allowsHomeButtonDismissal");
}

- (BOOL)_performButtonEvents:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *remoteAlertHostComponent;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapter:requestsActionForHandlingButtonEvents:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
    if (!remoteAlertHostComponent)
      remoteAlertHostComponent = self->_hostRemoteViewController;
    objc_msgSend(remoteAlertHostComponent, "handleButtonActions:", v7);
  }

  return v6 != 0;
}

- (void)_handleUpdatedSwipeDismissalStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  int v6;

  if (a3 != 1)
    goto LABEL_6;
  -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    if (_handleUpdatedSwipeDismissalStyle__oOnceToken != -1)
      dispatch_once(&_handleUpdatedSwipeDismissalStyle__oOnceToken, &__block_literal_global_37_6);
    v6 = objc_msgSend((id)_handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs, "containsObject:", v5);

    if (v6)
LABEL_6:
      -[SBRemoteTransientOverlayHostContentAdapter _updatePreferredGestureDismissalStyles](self, "_updatePreferredGestureDismissalStyles");
  }
}

void __80__SBRemoteTransientOverlayHostContentAdapter__handleUpdatedSwipeDismissalStyle___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.InCallService");
  v4[1] = CFSTR("com.apple.PassbookUIService");
  v4[2] = CFSTR("com.apple.TVRemoteUIService");
  v4[3] = CFSTR("com.apple.RemoteAlertTestUIService");
  v4[4] = CFSTR("com.apple.GameCenterRemoteAlert");
  v4[5] = CFSTR("com.apple.SystemExperienceAutomationAngel.sessions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs;
  _handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs = v2;

}

- (void)_updatePreferredGestureDismissalStyles
{
  void *remoteAlertHostComponent;
  uint64_t v4;
  void *hostRemoteViewController;
  uint64_t v6;
  SBSUIFeaturePolicyHostComponent *featurePolicyHostComponent;
  int v8;
  int v9;
  SBSUIFeaturePolicyHostComponent *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  id WeakRetained;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  v4 = objc_msgSend(remoteAlertHostComponent, "dismissalAnimationStyle");
  hostRemoteViewController = self->_remoteAlertHostComponent;
  if (!hostRemoteViewController)
    hostRemoteViewController = self->_hostRemoteViewController;
  v6 = objc_msgSend(hostRemoteViewController, "swipeDismissalStyle");
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent)
    v8 = -[SBSUIFeaturePolicyHostComponent allowsMenuButtonDismissal](featurePolicyHostComponent, "allowsMenuButtonDismissal");
  else
    v8 = -[SBRemoteTransientOverlayHostViewController allowsHomeButtonDismissal](self->_hostRemoteViewController, "allowsHomeButtonDismissal");
  v9 = v8;
  v10 = self->_featurePolicyHostComponent;
  if (v10)
    v11 = -[SBSUIFeaturePolicyHostComponent desiredHardwareButtonEvents](v10, "desiredHardwareButtonEvents");
  else
    v11 = -[SBRemoteTransientOverlayHostViewController preferredHardwareButtonEvents](self->_hostRemoteViewController, "preferredHardwareButtonEvents");
  v12 = v11;
  if (v4 == 2 && -[SBRemoteTransientOverlayHostContentAdapter isSwitcherEligible](self, "isSwitcherEligible"))
  {
    v13 = 3;
    v14 = 2;
  }
  else
  {
    v13 = 2;
    v15 = (v12 >> 4) & 1;
    v16 = v9 | v15;
    if (v6 == 1)
      v14 = 2;
    else
      v14 = v9 | v15;
    if (v6 != 1)
      v13 = v16;
  }
  if (self->_preferredUnlockedGestureDismissalStyle != v13 || self->_preferredLockedGestureDismissalStyle != v14)
  {
    self->_preferredLockedGestureDismissalStyle = v14;
    self->_preferredUnlockedGestureDismissalStyle = v13;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapterDidChangeGestureDismissalStyles:", self);

  }
}

- (void)_updatePreferredWhitePointAdaptivityStyle:(int64_t)a3
{
  NSNumber *preferredWhitePointAdaptivityStyleValue;
  void *v6;
  BOOL v7;
  NSNumber *v8;
  NSNumber *v9;
  id v10;

  preferredWhitePointAdaptivityStyleValue = self->_preferredWhitePointAdaptivityStyleValue;
  if (!preferredWhitePointAdaptivityStyleValue
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[NSNumber isEqualToNumber:](preferredWhitePointAdaptivityStyleValue, "isEqualToNumber:", v6),
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_preferredWhitePointAdaptivityStyleValue;
    self->_preferredWhitePointAdaptivityStyleValue = v8;

    -[SBRemoteTransientOverlayHostContentAdapter _contentViewController](self, "_contentViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsWhitePointAdaptivityStyleUpdate");

  }
}

- (void)_updateBackgroundActivitiesToSuppressWithAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithEmptyParameters");
  if (v4)
  {
    objc_msgSend(v4, "duration");
    objc_msgSend(v5, "setDuration:");
    objc_msgSend(v4, "delay");
    objc_msgSend(v5, "setDelay:");
    objc_msgSend(v5, "setStyleAnimation:", 1);
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationFactory:", v6);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__SBRemoteTransientOverlayHostContentAdapter__updateBackgroundActivitiesToSuppressWithAnimationSettings___block_invoke;
  v7[3] = &unk_1E8E9DED8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEAA08], "animateWithParameters:animations:completion:", v5, v7, 0);

}

void __105__SBRemoteTransientOverlayHostContentAdapter__updateBackgroundActivitiesToSuppressWithAnimationSettings___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_contentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_updateContentOpaqueProperty
{
  void *remoteAlertHostComponent;
  _BOOL4 v4;
  id WeakRetained;

  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
    remoteAlertHostComponent = self->_hostRemoteViewController;
  v4 = (objc_msgSend(remoteAlertHostComponent, "isContentOpaque") & 1) != 0
    || -[SBRemoteTransientOverlayHostContentAdapter preferredBackgroundStyle](self, "preferredBackgroundStyle") != 0;
  if (self->_contentOpaque != v4)
  {
    self->_contentOpaque = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapterDidChangeContentOpaque:", self);

  }
}

- (void)_updatePreferredBackgroundStyleWithAnimationSettings:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  _BOOL4 v10;
  int64_t v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v4 = objc_opt_class();
  -[SBSUIRemoteAlertSceneHostComponent hostScene](self->_remoteAlertHostComponent, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "backgroundStyle");
  v9 = v8;
  if (self->_remoteAlertHostComponent)
  {
    v10 = v8 != 0;
  }
  else
  {
    v10 = -[SBRemoteTransientOverlayHostViewController prefersWallpaperTunnelActive](self->_hostRemoteViewController, "prefersWallpaperTunnelActive");
    if (!self->_remoteAlertHostComponent)
      v9 = -[SBRemoteTransientOverlayHostViewController requestedBackgroundStyle](self->_hostRemoteViewController, "requestedBackgroundStyle");
  }
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  if (self->_preferredBackgroundStyle != v11)
  {
    self->_preferredBackgroundStyle = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostContentAdapter:requestsWallpaperEffectUpdateWithAnimationSettings:", self, v13);

    -[SBRemoteTransientOverlayHostContentAdapter _updateContentOpaqueProperty](self, "_updateContentOpaqueProperty");
  }

}

- (SBRemoteTransientOverlayHostContentAdapterDelegate)delegate
{
  return (SBRemoteTransientOverlayHostContentAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isActivatingForSiri
{
  return self->_activatingForSiri;
}

- (void)setActivatingForSiri:(BOOL)a3
{
  self->_activatingForSiri = a3;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return self->_preferredLockedGestureDismissalStyle;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return self->_preferredUnlockedGestureDismissalStyle;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (_UILegibilitySettings)preferredStatusBarLegibilitySettings
{
  return self->_preferredStatusBarLegibilitySettings;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return self->_shouldInvalidateWhenDeactivated;
}

- (BOOL)isScreenshotMarkup
{
  return self->_isScreenshotMarkup;
}

- (BOOL)isSwitcherEligible
{
  return self->_switcherEligible;
}

- (void)setSwitcherEligible:(BOOL)a3
{
  self->_switcherEligible = a3;
}

- (BOOL)shouldPresentEmbeddedInTargetSceneIfRequested
{
  return self->_shouldPresentEmbeddedInTargetSceneIfRequested;
}

- (void)setHidEventDeferringDisabled:(BOOL)a3
{
  self->_hidEventDeferringDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredStatusBarLegibilitySettings, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostRemoteViewController, 0);
  objc_storeStrong(&self->_sceneViewControllerReadyBlock, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_featurePolicyHostComponent, 0);
  objc_storeStrong((id *)&self->_remoteAlertHostComponent, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_sceneProcessIdentity, 0);
  objc_storeStrong((id *)&self->_preferredWhitePointAdaptivityStyleValue, 0);
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
}

@end
