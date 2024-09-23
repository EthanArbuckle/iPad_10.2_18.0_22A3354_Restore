@implementation SBSSystemApertureScenePresentationSessionClient

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureScenePresentationSessionClient.m"), 45, CFSTR("Client must be invalidated before deallocating session"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSSystemApertureScenePresentationSessionClient;
  -[SBSSystemApertureScenePresentationSessionClient dealloc](&v5, sel_dealloc);
}

- (void)destroyScene
{
  void *v3;
  id v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSSystemApertureScenePresentationSessionClient identityToken](self, "identityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestSystemApertureSceneInvalidationWithIdentityToken:", v3);

}

- (void)requestScene
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  +[SBSSystemApertureScenePresentationSessionServer activeInstance](SBSSystemApertureScenePresentationSessionServer, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SBSSystemApertureScenePresentationSessionServer activeInstance](SBSSystemApertureScenePresentationSessionServer, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureScenePresentationSessionClient.m"), 80, CFSTR("In-process Jindo Presentations are not supported"));

    }
    +[SBSSystemApertureScenePresentationSessionServer activeInstance](SBSSystemApertureScenePresentationSessionServer, "activeInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestSystemApertureSceneForCurrentProcess");

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSystemApertureScenePresentationSessionServer identifier](SBSSystemApertureScenePresentationSessionServer, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpointForMachName:service:instance:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v10, "configureConnection:", &__block_literal_global_45);
    objc_msgSend(v10, "activate");
    objc_initWeak(&location, self);
    objc_msgSend(v10, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_11;
    v15[3] = &unk_1E288FD70;
    objc_copyWeak(&v17, &location);
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "requestSystemApertureScene:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  +[SBSSystemApertureScenePresentationSessionServer interface](SBSSystemApertureScenePresentationSessionServer, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v2);

  +[SBSSystemApertureScenePresentationSessionServer serviceQuality](SBSSystemApertureScenePresentationSessionServer, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v3);

  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_10);
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_2()
{
  NSObject *v0;

  SBLogSystemApertureHosting();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(v0);

}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v9);
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_2_12(id *a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 1, a1[4]);
    objc_storeStrong(v3 + 2, a1[5]);
    WeakRetained = v3;
  }

}

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
}

@end
