@implementation SBSHomeScreenConfigurationServiceProxy

- (id)initWithInvalidationHandler:(id *)a1
{
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBSHomeScreenConfigurationServiceProxy;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create("com.apple.springboard.home-screen-configuration.connectionQueue", v4);
      v6 = a1[1];
      a1[1] = v5;

      v7 = MEMORY[0x193FF87DC](v3);
      v8 = a1[2];
      a1[2] = (id)v7;

      -[SBSHomeScreenConfigurationServiceProxy makeConnection](a1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[3];
      a1[3] = (id)v9;

      objc_msgSend(a1[3], "activate");
    }
  }

  return a1;
}

- (id)makeConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id location;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSHomeScreenConfigurationServiceInterfaceSpecification identifier](SBSHomeScreenConfigurationServiceInterfaceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke;
  v7[3] = &unk_1E288D270;
  v7[4] = a1;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "configureConnection:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)beginConfigurationSessionWithCompletion:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  id v5;

  if (self)
    connection = self->_connection;
  else
    connection = 0;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginConfigurationSessionWithCompletion:", v4);

}

- (void)applyConfiguration:(id)a3 completion:(id)a4
{
  BSServiceConnection *connection;
  id v6;
  id v7;
  id v8;

  if (self)
    connection = self->_connection;
  else
    connection = 0;
  v6 = a4;
  v7 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyConfiguration:completion:", v7, v6);

}

- (void)endConfigurationSessionWithCompletion:(id)a3
{
  const char *v4;
  id v5;
  BSServiceConnection *connection;
  BSServiceConnection *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v4, 0, 16);
    connection = self->_connection;
  }
  else
  {
    connection = 0;
  }
  v7 = connection;
  -[BSServiceConnection remoteTarget](v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBSHomeScreenConfigurationServiceProxy_endConfigurationSessionWithCompletion___block_invoke;
  v10[3] = &unk_1E288D768;
  v10[4] = self;

  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "endConfigurationSessionWithCompletion:", v10);

}

- (void)setInvalidationHandler:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

void __80__SBSHomeScreenConfigurationServiceProxy_endConfigurationSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)connectionDidInvalidate
{
  SEL v2;
  void *v3;
  id v4;

  if (a1)
  {
    v4 = a1[2];
    objc_setProperty_nonatomic_copy(a1, v2, 0, 16);
    v3 = v4;
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
      v3 = v4;
    }

  }
}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[SBSHomeScreenConfigurationServiceInterfaceSpecification interface](SBSHomeScreenConfigurationServiceInterfaceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSHomeScreenConfigurationServiceInterfaceSpecification serviceQuality](SBSHomeScreenConfigurationServiceInterfaceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 8);
  else
    v7 = 0;
  objc_msgSend(v3, "setTargetQueue:", v7);
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_42);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_5;
  v8[3] = &unk_1E288CF08;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  objc_destroyWeak(&v9);

}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogHomeScreenConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;

  v3 = a2;
  SBLogHomeScreenConfiguration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v3, v4);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSHomeScreenConfigurationServiceProxy connectionDidInvalidate](WeakRetained);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
