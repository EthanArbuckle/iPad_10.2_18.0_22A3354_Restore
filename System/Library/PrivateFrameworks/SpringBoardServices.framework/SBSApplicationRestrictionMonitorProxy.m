@implementation SBSApplicationRestrictionMonitorProxy

- (void)dealloc
{
  objc_super v3;

  -[SBSApplicationRestrictionMonitorProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSApplicationRestrictionMonitorProxy;
  -[SBSApplicationRestrictionMonitorProxy dealloc](&v3, sel_dealloc);
}

- (id)initWithMonitor:(id *)a1
{
  id v4;
  id *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v4 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)SBSApplicationRestrictionMonitorProxy;
    v5 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.application-restriction-monitoring-service.connectionQueue-%p"), a1);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (const char *)objc_msgSend(v6, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create(v7, v8);
      v10 = a1[2];
      a1[2] = v9;

      -[SBSApplicationRestrictionMonitorProxy makeConnection](a1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[3];
      a1[3] = (id)v11;

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
  +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification identifier](SBSApplicationRestrictionMonitoringServiceInterfaceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke;
  v7[3] = &unk_1E288D270;
  v7[4] = a1;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "configureConnection:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)observeUpdateWithApplicationRestrictState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__SBSApplicationRestrictionMonitorProxy_observeUpdateWithApplicationRestrictState___block_invoke;
  v6[3] = &unk_1E288D940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __83__SBSApplicationRestrictionMonitorProxy_observeUpdateWithApplicationRestrictState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogApplicationRestrictionMonitoring();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "Notifying monitor of an application restriction update", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "monitorDidUpdateApplicationRestrictionState:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  NSObject *v3;
  BSServiceConnection *connection;
  uint8_t v5[16];

  SBLogApplicationRestrictionMonitoring();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Client invalidated connection", v5, 2u);
  }

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification interface](SBSApplicationRestrictionMonitoringServiceInterfaceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification serviceQuality](SBSApplicationRestrictionMonitoringServiceInterfaceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 16);
  else
    v7 = 0;
  objc_msgSend(v3, "setTargetQueue:", v7);
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_8;
  v8[3] = &unk_1E288CF08;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  objc_destroyWeak(&v9);

}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogApplicationRestrictionMonitoring();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  SBLogApplicationRestrictionMonitoring();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSApplicationRestrictionMonitorProxy didInvalidate]((uint64_t)WeakRetained);

}

- (void)didInvalidate
{
  _QWORD block[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SBSApplicationRestrictionMonitorProxy_didInvalidate__block_invoke;
    block[3] = &unk_1E288DFC0;
    block[4] = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __54__SBSApplicationRestrictionMonitorProxy_didInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "monitorDidLoseConnection");
}

- (uint64_t)monitor
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)connection
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
