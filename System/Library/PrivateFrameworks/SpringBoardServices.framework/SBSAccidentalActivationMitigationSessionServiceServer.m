@implementation SBSAccidentalActivationMitigationSessionServiceServer

- (SBSAccidentalActivationMitigationSessionServiceServer)initWithDelegate:(id)a3
{
  id v4;
  SBSAccidentalActivationMitigationSessionServiceServer *v5;
  SBSAccidentalActivationMitigationSessionServiceServer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceServer;
  v5 = -[SBSAccidentalActivationMitigationSessionServiceServer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)startServer
{
  BSServiceConnectionListener *v3;
  BSServiceConnectionListener *connectionListener;
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SBSAccidentalActivationMitigationSessionServiceServer_startServer__block_invoke;
  v5[3] = &unk_1E288FCD0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D03460], "listenerWithConfigurator:", v5);
  v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
  connectionListener = self->_connectionListener;
  self->_connectionListener = v3;

  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

void __68__SBSAccidentalActivationMitigationSessionServiceServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  +[SBSAccidentalActivationMitigationSessionServiceSpecification identifier](SBSAccidentalActivationMitigationSessionServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceServer;
  -[SBSAccidentalActivationMitigationSessionServiceServer dealloc](&v3, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  SBSAccidentalActivationMitigationSessionServiceServer *v25;
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SBSAccidentalActivationMitigationSessionServiceServer _hostSession](self, "_hostSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    objc_msgSend(v9, "remoteProcess");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auditToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.private.accidental-mitigation-session-service")))
    {

    }
    else
    {
      objc_msgSend(v9, "remoteProcess");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "auditToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasEntitlement:", CFSTR("com.apple.springboard.private.3CAD882F-D615-43E4-89A9-34720441BC23"));

      if (!v19)
      {
        SBLogCameraCaptureAccidentalActivationMitigationSession();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_5;
        *(_DWORD *)buf = 138412290;
        v29 = v9;
        v14 = "Invalidating connection because client process is missing required entitlement %@.";
        goto LABEL_4;
      }
    }
    v20 = MEMORY[0x1E0C809B0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke;
    v24 = &unk_1E288D270;
    v25 = self;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v9, "configureConnection:", &v21);
    BSDispatchMain();
    -[SBSAccidentalActivationMitigationSessionServiceServer _setConnection:](self, "_setConnection:", v9, v20, 3221225472, __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_16, &unk_1E288DFC0, self, v21, v22, v23, v24, v25);
    objc_msgSend(v9, "activate");
    objc_destroyWeak(&v26);
    goto LABEL_10;
  }
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    v14 = "Refuse to connect since there is already a host session %@.";
LABEL_4:
    _os_log_impl(&dword_18EB52000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
  }
LABEL_5:

  objc_msgSend(v9, "invalidate");
LABEL_10:
  objc_destroyWeak(&location);

}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  +[SBSAccidentalActivationMitigationSessionServiceSpecification serviceQuality](SBSAccidentalActivationMitigationSessionServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSAccidentalActivationMitigationSessionServiceSpecification interface](SBSAccidentalActivationMitigationSessionServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_49);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_10;
  v9 = &unk_1E288FDF0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_14, v6, v7, v8, v9);
  objc_destroyWeak(&v11);

}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }

}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setConnection:", 0);
    v6 = WeakRetained;
    BSDispatchMain();

  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_hostSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverDidRequestDestroyNonActiveHostSessionUponDisconnection:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "_setHostSession:", 0);
  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_2_13(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Activated connection %@", (uint8_t *)&v4, 0xCu);
  }

}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_16(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverDidRequestCreateHostSessionUponConnection:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_setHostSession:", v3);
  objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));

}

- (BSServiceConnection)_connection
{
  os_unfair_lock_s *p_lock;
  BSServiceConnection *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setConnection:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[SBSAccidentalActivationMitigationSessionServiceServer _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_connection, a3);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (SBAccidentalActivationMitigationHostSession)_hostSession
{
  os_unfair_lock_s *p_lock;
  SBAccidentalActivationMitigationHostSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_host_session;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setHostSession:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[SBSAccidentalActivationMitigationSessionServiceServer _hostSession](self, "_hostSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_host_session, a3);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SBSAccidentalActivationMitigationSessionServiceServer _hostSession](self, "_hostSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqual:", v4);

  if (v5)
  {
    -[SBSAccidentalActivationMitigationSessionServiceServer _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mitigationSessionDidTransitionToState:", v8);

    if ((objc_msgSend(v10, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[SBSAccidentalActivationMitigationSessionServiceServer _setHostSession:](self, "_setHostSession:", 0);
      -[SBSAccidentalActivationMitigationSessionServiceServer _connection](self, "_connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

    }
  }

}

- (void)activateSessionForBundleIdentifier:(id)a3 durationNum:(id)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "doubleValue");
  v10 = v9;
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_18EB52000, v11, OS_LOG_TYPE_DEFAULT, "Activate host session with bundle identifier: %@ with duration: %f and accidental activation mitigation session cancellation policy: %@", buf, 0x20u);
  }

  v14 = v7;
  v12 = v8;
  v13 = v7;
  BSDispatchMain();

}

void __169__SBSAccidentalActivationMitigationSessionServiceServer_activateSessionForBundleIdentifier_durationNum_accidentalActivationMitigationSessionCancellationPolicyClassName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_hostSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateSessionForBundleIdentifier:duration:accidentalActivationMitigationSessionCancellationPolicyClassName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)requestSessionCancellation
{
  NSObject *v2;
  uint8_t buf[16];

  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "Request session cancellation", buf, 2u);
  }

  BSDispatchMain();
}

void __83__SBSAccidentalActivationMitigationSessionServiceServer_requestSessionCancellation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_hostSession");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestSessionCancellation");

}

- (SBSAccidentalActivationMitigationSessionServiceServerDelegate)delegate
{
  return (SBSAccidentalActivationMitigationSessionServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_lock_host_session, 0);
}

@end
