@implementation HDSummariesHealthDaemonPluginProfileExtension

- (HDSummariesHealthDaemonPluginProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDSummariesHealthDaemonPluginProfileExtension *v5;
  HDSummariesHealthDaemonPluginProfileExtension *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HDNotificationSyncClient *notificationSyncClient;
  id WeakRetained;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSummariesHealthDaemonPluginProfileExtension;
  v5 = -[HDSummariesHealthDaemonPluginProfileExtension init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x24BE40B48]);
    HKCreateSerialDispatchQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithProfile:clientIdentifier:queue:", v4, CFSTR("SummariesHealthSharingNotificationSyncClientIdentifier"), v8);
    notificationSyncClient = v6->_notificationSyncClient;
    v6->_notificationSyncClient = (HDNotificationSyncClient *)v9;

    -[HDNotificationSyncClient setDelegate:](v6->_notificationSyncClient, "setDelegate:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "healthDaemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerDaemonReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void (**unitTest_didProcessNotificationInstruction)(void);
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3048];
  v8 = (void *)*MEMORY[0x24BDD3048];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKNotificationInstructionAction();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_247AD3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", (uint8_t *)&v15, 0x16u);

  }
  if (a4 == 1)
  {
    -[HDSummariesHealthDaemonPluginProfileExtension _handleDismissInstructionWithClient:](self, "_handleDismissInstructionWithClient:", v6);
  }
  else
  {
    _HKInitializeLogging();
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[HDSummariesHealthDaemonPluginProfileExtension notificationSyncClient:didReceiveInstructionWithAction:].cold.1((uint64_t)self, a4, v13);
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction)
    unitTest_didProcessNotificationInstruction[2]();

}

- (void)_handleDismissInstructionWithClient:(id)a3
{
  id v4;
  void **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  HDSummariesHealthDaemonPluginProfileExtension *v12;
  HDSummariesHealthDaemonPluginProfileExtension *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  HDSummariesHealthDaemonPluginProfileExtension *v23;
  HDSummariesHealthDaemonPluginProfileExtension *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  HDSummariesHealthDaemonPluginProfileExtension *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void **)MEMORY[0x24BDD3048];
  v6 = *MEMORY[0x24BDD3048];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_247AD3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling dismiss instruction", buf, 0xCu);
  }
  v26 = 0;
  objc_msgSend(v4, "pendingNotificationDismissInstructionsWithError:", &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  _HKInitializeLogging();
  v9 = *v5;
  v10 = *v5;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v9;
      v12 = (HDSummariesHealthDaemonPluginProfileExtension *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v7, "messageIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_247AD3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification dismiss instructions with identifiers: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v7, "categoryIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "notificationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeDeliveredNotificationsWithIdentifiers:", v16);

    v25 = v8;
    LODWORD(v18) = objc_msgSend(v4, "markPendingNotificationInstructionsAsProcessed:error:", v7, &v25);
    v19 = v25;

    _HKInitializeLogging();
    v20 = *v5;
    v21 = *v5;
    if ((_DWORD)v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v20;
        v23 = (HDSummariesHealthDaemonPluginProfileExtension *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v23;
        v29 = 2114;
        v30 = v16;
        v24 = v23;
        _os_log_impl(&dword_247AD3000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed notifications: %{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[HDSummariesHealthDaemonPluginProfileExtension _handleDismissInstructionWithClient:].cold.2(v20);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HDSummariesHealthDaemonPluginProfileExtension _handleDismissInstructionWithClient:].cold.1(v9);
    v19 = v8;
  }

}

- (HDPrimaryProfile)profile
{
  return (HDPrimaryProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (void)setNotificationSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSyncClient, a3);
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationSyncClient:(NSObject *)a3 didReceiveInstructionWithAction:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_1(&dword_247AD3000, a3, (uint64_t)a3, "[%{public}@] Unexpected notification instruction received: %ld", (uint8_t *)&v3);
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_247AD3000, v1, v5, "[%{public}@] Pending notification dismiss instructions returned nil with error = [%{public}@]", v6);

  OUTLINED_FUNCTION_2();
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_247AD3000, v1, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6);

  OUTLINED_FUNCTION_2();
}

@end
