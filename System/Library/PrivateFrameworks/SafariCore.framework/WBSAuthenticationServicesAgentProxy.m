@implementation WBSAuthenticationServicesAgentProxy

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSAuthenticationServicesAgentProxy)init
{
  WBSAuthenticationServicesAgentProxy *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  WBSAuthenticationServicesAgentProxy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSAuthenticationServicesAgentProxy;
  v2 = -[WBSAuthenticationServicesAgentProxy init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.AuthenticationServices.AutoFill"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    -[WBSAuthenticationServicesAgentProxy _setUpConnection:](v2, "_setUpConnection:", v2->_connection);
    v5 = v2;
  }

  return v2;
}

- (void)_setUpConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WBSAuthenticationServicesAgentInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __56__WBSAuthenticationServicesAgentProxy__setUpConnection___block_invoke;
  v11 = &unk_1E649B5B0;
  objc_copyWeak(&v12, &location);
  v6 = _Block_copy(&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v6, v8, v9, v10, v11);
  objc_msgSend(v4, "setInterruptionHandler:", v6);
  WBSAuthenticationServicesAgentDelegateInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v7);

  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(v4, "resume");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.AuthenticationServices.AutoFill"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[WBSAuthenticationServicesAgentProxy _setUpConnection:](self, "_setUpConnection:", self->_connection);
    connection = self->_connection;
  }
  return connection;
}

- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  SEL v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Asking daemon for passkeys.", buf, 2u);
  }
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E649B5F8;
  v18 = a2;
  v12 = v8;
  v17 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke_56;
    v14[3] = &unk_1E649B688;
    v15 = v12;
    objc_msgSend(v13, "getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:", v7, v14);

  }
}

void __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  SEL v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Asking daemon for passkeys for %{public}@.", buf, 0xCu);
  }
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E649B5F8;
  v18 = a2;
  v12 = v8;
  v17 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke_58;
    v14[3] = &unk_1E649B688;
    v15 = v12;
    objc_msgSend(v13, "getPasskeysForRunningAssertionWithWebFrameIdentifier:completionHandler:", v7, v14);

  }
}

void __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  SEL v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    objc_msgSend(v11, "operationUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v17;
    _os_log_impl(&dword_1B2621000, v16, OS_LOG_TYPE_INFO, "Informing daemon that user selected passkey for operation %{public}@.", buf, 0xCu);

  }
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke;
  v25[3] = &unk_1E649B5F8;
  v27 = a2;
  v20 = v14;
  v26 = v20;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke_59;
    v22[3] = &unk_1E649B6B0;
    v23 = v12;
    v24 = v20;
    objc_msgSend(v21, "userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:", v11, v23, v13, v22);

  }
}

void __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  SEL v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v7, "operationUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_impl(&dword_1B2621000, v10, OS_LOG_TYPE_INFO, "Informing daemon that user selected nearby device for operation %{public}@.", buf, 0xCu);

  }
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __90__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillNearbyDevice_completionHandler___block_invoke;
  v18 = &unk_1E649B5F8;
  v20 = a2;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "userSelectedAutoFillNearbyDevice:completionHandler:", v7, v13, v15, v16, v17, v18);

}

void __90__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillNearbyDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  SEL v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v18, OS_LOG_TYPE_INFO, "Test runner asking daemon to create passkey.", buf, 2u);
  }
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __134__WBSAuthenticationServicesAgentProxy_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke;
  v25 = &unk_1E649B5F8;
  v27 = a2;
  v20 = v17;
  v26 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v21, "test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:", v13, v14, v15, v16, v20, v22, v23, v24, v25);

}

void __134__WBSAuthenticationServicesAgentProxy_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  SEL v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __140__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
  v21 = &unk_1E649B5F8;
  v23 = a2;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v17, "getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v11, v12, v13, v16, v18, v19, v20, v21);

}

void __140__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  SEL v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __143__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
  v21 = &unk_1E649B5F8;
  v23 = a2;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v17, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v11, v12, v13, v16, v18, v19, v20, v21);

}

void __143__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __172__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForWebFrameIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a2;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v22, "completeAssertionWithExternalPasskeyForWebFrameIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:", v15, v16, v17, v18, v19, v20);

}

void __172__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForWebFrameIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __175__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForApplicationIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a2;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v22, "completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:", v15, v16, v17, v18, v19, v20);

}

void __175__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForApplicationIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __115__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForWebFrameIdentifier_completionHandler___block_invoke;
  v15 = &unk_1E649B5F8;
  v17 = a2;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "getPasskeyAssertionRequestParametersForWebFrameIdentifier:completionHandler:", v7, v10, v12, v13, v14, v15);

}

void __115__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForWebFrameIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __118__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForApplicationIdentifier_completionHandler___block_invoke;
  v15 = &unk_1E649B5F8;
  v17 = a2;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v7, v10, v12, v13, v14, v15);

}

void __118__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __105__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler___block_invoke;
  v12 = &unk_1E649B5F8;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:", v7, v9, v10, v11, v12);

}

void __105__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __138__WBSAuthenticationServicesAgentProxy_getIsPasskeyAssertionRequestRunningForWebFrameIdentifier_orApplicationIdentifier_completionHandler___block_invoke;
  v18 = &unk_1E649B5F8;
  v20 = a2;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:orApplicationIdentifier:completionHandler:", v9, v10, v13, v15, v16, v17, v18);

}

void __138__WBSAuthenticationServicesAgentProxy_getIsPasskeyAssertionRequestRunningForWebFrameIdentifier_orApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __135__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forHost_fromProviderWithBundleIdentifier_inAppWithBundleIdentifier___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a2;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v16, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v11, v12, v13, v14);

}

void __135__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forHost_fromProviderWithBundleIdentifier_inAppWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __138__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forURL_fromProviderWithBundleIdentifier_inBrowserWithBundleIdentifier___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a2;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v16, "didFillCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:", v11, v12, v13, v14);

}

void __138__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forURL_fromProviderWithBundleIdentifier_inBrowserWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[WBSAuthenticationServicesAgentProxy connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __98__WBSAuthenticationServicesAgentProxy_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke;
  v18 = &unk_1E649B5F8;
  v20 = a2;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v9, v10, v13, v15, v16, v17, v18);

}

void __98__WBSAuthenticationServicesAgentProxy_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 141558530;
    v8 = 1752392040;
    v9 = 2112;
    v10 = WeakRetained;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1B2621000, v6, OS_LOG_TYPE_INFO, "Notifying %{mask.hash}@ of new passkeys for %{public}@", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(WeakRetained, "newPasskeysAvailableForApplicationIdentifier:", v4);

}

void __56__WBSAuthenticationServicesAgentProxy__setUpConnection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained[1], "invalidate");
    v3 = WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSAuthenticationServicesAgentProxy;
  -[WBSAuthenticationServicesAgentProxy dealloc](&v3, sel_dealloc);
}

- (WBSAuthenticationServicesAgentDelegate)delegate
{
  return (WBSAuthenticationServicesAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
