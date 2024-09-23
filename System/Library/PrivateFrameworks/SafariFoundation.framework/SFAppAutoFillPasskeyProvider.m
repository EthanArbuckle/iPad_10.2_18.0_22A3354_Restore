@implementation SFAppAutoFillPasskeyProvider

- (SFAppAutoFillPasskeyProvider)init
{
  SFAppAutoFillPasskeyProvider *v2;
  WBSAuthenticationServicesAgentProxy *v3;
  WBSAuthenticationServicesAgentProxy *proxy;
  SFAppAutoFillPasskeyProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFAppAutoFillPasskeyProvider;
  v2 = -[SFAppAutoFillPasskeyProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x24BE82C98]);
    proxy = v2->_proxy;
    v2->_proxy = v3;

    v5 = v2;
  }

  return v2;
}

- (void)getAvailablePasskeysForAppWithAuditToken:(id *)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, MEMORY[0x24BDBD1A8]);
}

- (void)getAvailablePasskeysForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  WBSAuthenticationServicesAgentProxy *proxy;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  proxy = self->_proxy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForApplicationIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_24C935730;
  v10 = v6;
  v8 = v6;
  -[WBSAuthenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:](proxy, "getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:", a3, v9);

}

void __95__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_22);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)getAvailablePasskeysForWebPageIdentifier:(id)a3 frameID:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  WBSAuthenticationServicesAgentProxy *proxy;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BE82CE0];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithPageID:frameID:", v11, v10);

  proxy = self->_proxy;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForWebPageIdentifier_frameID_completionHandler___block_invoke;
  v15[3] = &unk_24C935730;
  v16 = v8;
  v14 = v8;
  -[WBSAuthenticationServicesAgentProxy getPasskeysForRunningAssertionWithWebFrameIdentifier:completionHandler:](proxy, "getPasskeysForRunningAssertionWithWebFrameIdentifier:completionHandler:", v12, v15);

}

void __99__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForWebPageIdentifier_frameID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_22);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)userSelectedPasskey:(id)a3 authenticatedLAContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  WBSAuthenticationServicesAgentProxy *proxy;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "corePasskey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "operationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138478339;
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    v20 = 2113;
    v21 = v7;
    _os_log_impl(&dword_20E365000, v9, OS_LOG_TYPE_DEFAULT, "User completed passkey AutoFill with identifier %{private}@ for operation %{public}@, didAuthenticate: %{private}@", (uint8_t *)&v16, 0x20u);

  }
  proxy = self->_proxy;
  objc_msgSend(v6, "corePasskey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE82DC0], "defaultContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAuthenticationServicesAgentProxy userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:](proxy, "userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:", v14, v7, v15, &__block_literal_global_1);

}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 inAppWithBundleIdentifier:(id)a5
{
  -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](self->_proxy, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", a3, a4, *MEMORY[0x24BE82F68], a5);
}

- (void)didFillExternalCredential:(id)a3 inAppWithBundleIdentifier:(id)a4
{
  id v6;
  WBSAuthenticationServicesAgentProxy *proxy;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  objc_msgSend(a3, "externalCredential");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  proxy = self->_proxy;
  objc_msgSend(v12, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "site");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "owningExtensionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](proxy, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v8, v9, v11, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
