@implementation SFCredentialProviderExtensionHelperProxy

- (SFCredentialProviderExtensionHelperProxy)init
{
  SFCredentialProviderExtensionHelperProxy *v2;
  SFCredentialProviderExtensionHelperProxy *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  SFCredentialProviderExtensionHelperProxy *v34;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)SFCredentialProviderExtensionHelperProxy;
  v2 = -[SFCredentialProviderExtensionHelperProxy init](&v39, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SafariFoundation.CredentialProviderExtensionHelper"));
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1A6B8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion_, 0, 1);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_fetchPasswordCredentialIdentitiesMatchingDomains_completion_, 0, 1);

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_fetchPasskeyCredentialIdentitiesMatchingDomains_completion_, 0, 1);

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_fetchAllPaskeyCredentialIdentitiesWithCompletion_, 0, 1);

    v21 = (void *)MEMORY[0x24BDBCF20];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion_, 0, 1);

    v24 = (void *)MEMORY[0x24BDBCF20];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_fetchAllCredentialIdentitiesMatchingDomains_completion_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion_, 0, 1);

    v28 = (void *)MEMORY[0x24BDBCF20];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion_, 0, 1);

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v3->_connection, "setRemoteObjectInterface:", v6);
    objc_initWeak(&location, v3);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __48__SFCredentialProviderExtensionHelperProxy_init__block_invoke;
    v36[3] = &unk_24C935838;
    objc_copyWeak(&v37, &location);
    -[NSXPCConnection setInvalidationHandler:](v3->_connection, "setInvalidationHandler:", v36);
    -[NSXPCConnection resume](v3->_connection, "resume");
    v34 = v3;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __48__SFCredentialProviderExtensionHelperProxy_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&v4[2]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  -[NSXPCConnection invalidate](v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)SFCredentialProviderExtensionHelperProxy;
  -[SFCredentialProviderExtensionHelperProxy dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  -[NSXPCConnection invalidate](v4, "invalidate");

}

- (id)_proxyObject
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v3);

}

- (void)getCredentialProviderExtensionStateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v8 = v4;
    -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "getCredentialProviderExtensionStateWithCompletion:", v8);
    }
    else
    {
      +[SFCredentialProviderExtensionState credentialProviderExtensionWithDisabledState](SFCredentialProviderExtensionState, "credentialProviderExtensionWithDisabledState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v7);

    }
    v4 = v8;
  }

}

- (void)saveCredentialIdentities:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || v7)
  {
    objc_msgSend(v7, "saveCredentialIdentities:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
}

- (void)removeCredentialIdentities:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || v7)
  {
    objc_msgSend(v7, "removeCredentialIdentities:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
}

- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v7 = (void (**)(id, _QWORD, void *))a3;
  -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v7 || v4)
  {
    objc_msgSend(v4, "removeAllCredentialIdentitiesWithCompletion:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v6);

  }
}

- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || v7)
  {
    objc_msgSend(v7, "replaceCredentialIdentitiesWithIdentities:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __117__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_24C935860;
    v12 = v10;
    v15 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v11, "remoteObjectProxyWithErrorHandler:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "fetchPasswordCredentialIdentitiesMatchingDomains:forExtension:completion:", v8, v9, v12);
    else
      (*((void (**)(id, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1A8]);

  }
}

void __117__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __104__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_24C935860;
    v9 = v7;
    v12 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "fetchPasswordCredentialIdentitiesMatchingDomains:completion:", v6, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1A8]);

  }
}

void __104__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __103__SFCredentialProviderExtensionHelperProxy_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_24C935860;
    v9 = v7;
    v12 = v9;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "fetchPasskeyCredentialIdentitiesMatchingDomains:completion:", v6, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1A8]);

  }
}

void __103__SFCredentialProviderExtensionHelperProxy_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchAllPaskeyCredentialIdentitiesWithCompletion:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __93__SFCredentialProviderExtensionHelperProxy_fetchAllPaskeyCredentialIdentitiesWithCompletion___block_invoke;
    v8[3] = &unk_24C935860;
    v6 = v4;
    v9 = v6;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "fetchAllPaskeyCredentialIdentitiesWithCompletion:", v6);
    else
      (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1A8]);

  }
}

void __93__SFCredentialProviderExtensionHelperProxy_fetchAllPaskeyCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __112__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_24C935860;
    v12 = v10;
    v15 = v12;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "fetchAllCredentialIdentitiesMatchingDomains:forExtension:completion:", v8, v9, v12);
    else
      (*((void (**)(id, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1A8]);

  }
}

void __112__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_24C935860;
    v9 = v7;
    v12 = v9;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "fetchAllCredentialIdentitiesMatchingDomains:completion:", v6, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1A8]);

  }
}

void __99__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __120__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_24C935860;
    v12 = v10;
    v15 = v12;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "fetchOneTimeCodeCredentialIdentitiesMatchingDomains:forExtension:completion:", v8, v9, v12);
    else
      (*((void (**)(id, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1A8]);

  }
}

void __120__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __107__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_24C935860;
    v9 = v7;
    v12 = v9;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "fetchOneTimeCodeCredentialIdentitiesMatchingDomains:completion:", v6, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1A8]);

  }
}

void __107__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)removeCredentialIdentityStoreForApplication:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[SFCredentialProviderExtensionHelperProxy _proxyObject](self, "_proxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || v7)
  {
    objc_msgSend(v7, "removeCredentialIdentityStoreForApplication:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
}

- (void)fetchCredentialIdentitiesForService:(id)a3 serviceIdentifierType:(int64_t)a4 credentialIdentityTypes:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSXPCConnection *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a3;
  v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  v12 = self->_connection;
  os_unfair_lock_unlock(&self->_lock);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __137__SFCredentialProviderExtensionHelperProxy_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion___block_invoke;
  v15[3] = &unk_24C935860;
  v13 = v11;
  v16 = v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "fetchCredentialIdentitiesForService:serviceIdentifierType:credentialIdentityTypes:completion:", v10, a4, a5, v13);
  else
    (*((void (**)(id, _QWORD))v13 + 2))(v13, MEMORY[0x24BDBD1A8]);

}

void __137__SFCredentialProviderExtensionHelperProxy_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v3, v4, "Failed to get a remote proxy object with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
