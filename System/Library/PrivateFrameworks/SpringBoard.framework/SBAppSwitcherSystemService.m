@implementation SBAppSwitcherSystemService

- (SBAppSwitcherSystemService)initWithRecentAppLayoutsController:(id)a3 commandTabController:(id)a4
{
  id v7;
  id v8;
  SBAppSwitcherSystemService *v9;
  SBAppSwitcherSystemService *v10;
  void *v11;
  uint64_t v12;
  FBServiceClientAuthenticator *requestAppearanceForHiddenAppAuthenticator;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBAppSwitcherSystemService;
  v9 = -[SBAppSwitcherSystemService init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentAppLayouts, a3);
    objc_storeStrong((id *)&v10->_commandTabController, a4);
    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAppSwitcherDelegate:", v10);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.requestAppSwitcherAppearanceForHiddenApp"));
    requestAppearanceForHiddenAppAuthenticator = v10->_requestAppearanceForHiddenAppAuthenticator;
    v10->_requestAppearanceForHiddenAppAuthenticator = (FBServiceClientAuthenticator *)v12;

  }
  return v10;
}

- (void)requestAppearanceForHiddenAppWithBundleIdentifier:(id)a3 assertionPort:(id)a4 forClient:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, BOOL);
  FBServiceClientAuthenticator *requestAppearanceForHiddenAppAuthenticator;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  SBAppSwitcherSystemService *v29;
  id v30;
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, BOOL))a6;
  BSDispatchQueueAssertMain();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSystemService.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  requestAppearanceForHiddenAppAuthenticator = self->_requestAppearanceForHiddenAppAuthenticator;
  objc_msgSend(v13, "processHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "auditToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v18 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](requestAppearanceForHiddenAppAuthenticator, "authenticateAuditToken:error:", v17, &v31);
  v19 = v31;

  if ((v18 & 1) != 0)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applicationWithBundleIdentifier:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[SBRecentAppLayouts _acquireAllowHiddenAppAssertionForBundleIdentifier:reason:](self->_recentAppLayouts, "_acquireAllowHiddenAppAssertionForBundleIdentifier:reason:", v11, CFSTR("SBAppSwitcherSystemService"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCommandTabController _allowAppToAppearWhileHidden:](self->_commandTabController, "_allowAppToAppearWhileHidden:", v11);
      v23 = (void *)MEMORY[0x1E0D01810];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke;
      v27[3] = &unk_1E8E9E270;
      v28 = v22;
      v29 = self;
      v30 = v11;
      v24 = v22;
      objc_msgSend(v23, "monitorSendRight:withHandler:", v12, v27);

    }
    v14[2](v14, v21 != 0);

  }
  else
  {
    SBLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBAppSwitcherSystemService requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:].cold.1(v19, v25);

    v14[2](v14, 0);
  }

}

void __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  BSDispatchMain();

}

uint64_t __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "_disallowAppFromAppearingWhileHidden:", *(_QWORD *)(a1 + 48));
}

- (void)systemServiceServer:(id)a3 requestAppearanceForHiddenAppWithBundleIdentifier:(id)a4 assertionPort:(id)a5 forClient:(id)a6 withCompletion:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v10 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v11 = v17;
  v12 = v16;
  v13 = v15;
  v14 = v10;
  BSDispatchMain();

}

uint64_t __139__SBAppSwitcherSystemService_systemServiceServer_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandTabController, 0);
  objc_storeStrong((id *)&self->_recentAppLayouts, 0);
  objc_storeStrong((id *)&self->_requestAppearanceForHiddenAppAuthenticator, 0);
}

- (void)requestAppearanceForHiddenAppWithBundleIdentifier:(void *)a1 assertionPort:(NSObject *)a2 forClient:withCompletion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[SBAppSwitcherSystemService requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:]";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);

}

@end
