@implementation SBSystemAperturePortalSourceInfoRequestServer

- (SBSystemAperturePortalSourceInfoRequestServer)initWithPortalSource:(id)a3
{
  id v4;
  SBSystemAperturePortalSourceInfoRequestServer *v5;
  uint64_t v6;
  SBSPortalSource *rootSystemApertureWindowPortalSource;
  uint64_t v8;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v10;
  SBSystemAperturePortalSourceInfoRequestServer *v11;
  uint64_t v12;
  BSServiceConnectionListener *connectionListener;
  _QWORD v15[4];
  SBSystemAperturePortalSourceInfoRequestServer *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemAperturePortalSourceInfoRequestServer;
  v5 = -[SBSystemAperturePortalSourceInfoRequestServer init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rootSystemApertureWindowPortalSource = v5->_rootSystemApertureWindowPortalSource;
    v5->_rootSystemApertureWindowPortalSource = (SBSPortalSource *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.springboard.system-aperture-portaling"));
    serviceClientAuthenticator = v5->_serviceClientAuthenticator;
    v5->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v8;

    v10 = (void *)MEMORY[0x1E0D23030];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__SBSystemAperturePortalSourceInfoRequestServer_initWithPortalSource___block_invoke;
    v15[3] = &unk_1E8E9EFA0;
    v11 = v5;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;

  }
  return v5;
}

void __70__SBSystemAperturePortalSourceInfoRequestServer_initWithPortalSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAFF8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)startListener
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemAperturePortalSourceInfoRequestServer;
  -[SBSystemAperturePortalSourceInfoRequestServer dealloc](&v3, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[6];
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogSystemApertureHosting();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBSSystemAperturePortalSourceInfoRequestServer received connection %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__57;
  v17 = __Block_byref_object_dispose__57;
  v12 = v9;
  v18 = v12;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke;
  v13[3] = &unk_1E8EAF678;
  v13[4] = self;
  v13[5] = &buf;
  objc_msgSend(v12, "configureConnection:", v13);
  objc_msgSend(v12, "activate");
  _Block_object_dispose(&buf, 8);

}

void __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DAAFF8];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(MEMORY[0x1E0DAAFF8], "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E8EAF650;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setInvalidationHandler:", v7);

}

void __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogSystemApertureHosting();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBSSystemAperturePortalSourceInfoRequestServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)rootWindowPortalSourceWithCompletion:(id)a3
{
  void (**v4)(id, SBSPortalSource *, _QWORD);
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v4 = (void (**)(id, SBSPortalSource *, _QWORD))a3;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v8, &v11);
  v10 = v11;

  if (v9)
  {
    if (v4)
      v4[2](v4, self->_rootSystemApertureWindowPortalSource, 0);
  }
  else if (v4)
  {
    ((void (**)(id, SBSPortalSource *, id))v4)[2](v4, 0, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_rootSystemApertureWindowPortalSource, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
