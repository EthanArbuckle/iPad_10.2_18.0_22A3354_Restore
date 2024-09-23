@implementation SBSAccidentalActivationMitigationSessionServiceClient

- (SBSAccidentalActivationMitigationSessionServiceClient)init
{
  SBSAccidentalActivationMitigationSessionServiceClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceClient;
  result = -[SBSAccidentalActivationMitigationSessionServiceClient init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)_createConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;

  v3 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSAccidentalActivationMitigationSessionServiceSpecification identifier](SBSAccidentalActivationMitigationSessionServiceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSAccidentalActivationMitigationSessionServiceClient _setConnection:](self, "_setConnection:", v7);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke;
  v9[3] = &unk_1E288D270;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "configureConnection:", v9);
  objc_msgSend(v7, "activate");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  +[SBSAccidentalActivationMitigationSessionServiceSpecification serviceQuality](SBSAccidentalActivationMitigationSessionServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSAccidentalActivationMitigationSessionServiceSpecification interface](SBSAccidentalActivationMitigationSessionServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_2;
  v9[3] = &unk_1E288D248;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_3;
  v7[3] = &unk_1E288D248;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained)
    objc_msgSend(v3, "activate");

}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained)
    objc_msgSend(WeakRetained, "_setConnection:", 0);

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
  -[SBSAccidentalActivationMitigationSessionServiceClient _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_connection, a3);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a3;
  v10 = -[SBSAccidentalActivationMitigationSessionServiceClient _createConnection](self, "_createConnection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSAccidentalActivationMitigationSessionServiceClient _connection](self, "_connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateSessionForBundleIdentifier:durationNum:accidentalActivationMitigationSessionCancellationPolicyClassName:", v9, v13, v8);

}

- (void)requestSessionCancellation
{
  void *v2;
  id v3;

  -[SBSAccidentalActivationMitigationSessionServiceClient _connection](self, "_connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSessionCancellation");

}

- (void)mitigationSessionDidTransitionToState:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "integerValue");
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBSAccidentalActivationMitigationSessionState(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "Mitigation session did transition to state %@", buf, 0xCu);

  }
  BSDispatchMain();
}

void __95__SBSAccidentalActivationMitigationSessionServiceClient_mitigationSessionDidTransitionToState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mitigationSessionServiceClient:mitigationSessionDidTransitionToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (SBSAccidentalActivationMitigationSessionServiceClientDelegate)delegate
{
  return (SBSAccidentalActivationMitigationSessionServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end
