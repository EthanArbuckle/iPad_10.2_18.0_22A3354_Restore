@implementation SBSCaptureButtonAppConfigurationClient

- (SBSCaptureButtonAppConfigurationClient)init
{
  SBSCaptureButtonAppConfigurationClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationClient;
  result = -[SBSCaptureButtonAppConfigurationClient init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)establishConnectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  -[SBSCaptureButtonAppConfigurationClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSCaptureButtonAppConfigurationServiceSpecification identifier](SBSCaptureButtonAppConfigurationServiceSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSCaptureButtonAppConfigurationClient _setConnection:](self, "_setConnection:", v8);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke;
    v9[3] = &unk_1E288D270;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "configureConnection:", v9);
    objc_msgSend(v8, "activate");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[SBSCaptureButtonAppConfigurationServiceSpecification serviceQuality](SBSCaptureButtonAppConfigurationServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSCaptureButtonAppConfigurationServiceSpecification interface](SBSCaptureButtonAppConfigurationServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_15);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_3;
  v6[3] = &unk_1E288D248;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);

}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCameraCaptureAppConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_3(uint64_t a1, void *a2)
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
  SBLogCameraCaptureAppConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient invalidated connection %@", (uint8_t *)&v6, 0xCu);
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
  BSServiceConnection *v4;
  BSServiceConnection *lock_connection;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (BSServiceConnection *)v6;
    os_unfair_lock_lock(&self->_lock);
    lock_connection = self->_lock_connection;
    self->_lock_connection = v4;

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBSCaptureButtonAppConfigurationClient _connection](self, "_connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentAssociatedAppUsingBundleIdentifier:", v4);

}

- (void)receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SBLogCameraCaptureAppConfiguration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient received initial or updated active app bundle identifier: %{public}@.", buf, 0xCu);
  }

  v5 = v3;
  BSDispatchMain();

}

void __95__SBSCaptureButtonAppConfigurationClient_receiveInitialOrUpdatedAssociatedAppBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureButtonAppConfigurationClient:receiveInitialOrUpdatedAssociatedAppBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)receiveInitialOrUpdatedEligibleAppsBundleIdentifiers:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SBLogCameraCaptureAppConfiguration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient received initial or updated eligible apps bundle identifiers: %{public}@.", buf, 0xCu);
  }

  v5 = v3;
  BSDispatchMain();

}

void __95__SBSCaptureButtonAppConfigurationClient_receiveInitialOrUpdatedEligibleAppsBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureButtonAppConfigurationClient:receiveInitialOrUpdatedEligibleAppsBundleIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (SBSCaptureButtonAppConfigurationClientDelegate)delegate
{
  return (SBSCaptureButtonAppConfigurationClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
