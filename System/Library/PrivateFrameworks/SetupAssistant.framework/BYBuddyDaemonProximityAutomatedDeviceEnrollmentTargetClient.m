@implementation BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)init
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *connectionQueue;
  uint64_t v11;
  NSXPCConnection *daemonConnection;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v14.receiver = self;
  v14.super_class = (Class)BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient;
  v2 = -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient init](&v14, sel_init);
  if (v2)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)getDMTEnrollmentStatusViewModelClass_softClass;
    v23 = getDMTEnrollmentStatusViewModelClass_softClass;
    if (!getDMTEnrollmentStatusViewModelClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getDMTEnrollmentStatusViewModelClass_block_invoke;
      v18 = &unk_1E4E26900;
      v19 = &v20;
      __getDMTEnrollmentStatusViewModelClass_block_invoke((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v5 = (void *)getDMTEnrollmentCompletionViewModelClass_softClass;
    v23 = getDMTEnrollmentCompletionViewModelClass_softClass;
    if (!getDMTEnrollmentCompletionViewModelClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getDMTEnrollmentCompletionViewModelClass_block_invoke;
      v18 = &unk_1E4E26900;
      v19 = &v20;
      __getDMTEnrollmentCompletionViewModelClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v21[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v20, 8);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v9;

    -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionToMachService:](v2, "connectionToMachService:", CFSTR("com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc"));
    v11 = objc_claimAutoreleasedReturnValue();
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v11;

    -[NSXPCConnection resume](v2->_daemonConnection, "resume");
  }
  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78E8B0);
}

- (id)connectionToMachService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE799710);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend((id)objc_opt_class(), "clientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke;
  v14[3] = &unk_1E4E26958;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v5, "setInvalidationHandler:", v14);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke_65;
  v12[3] = &unk_1E4E26958;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v5, "setInterruptionHandler:", v12);

  return v5;
}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ invalidated", (uint8_t *)&v4, 0xCu);
  }

}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ interrupted", (uint8_t *)&v4, 0xCu);
  }

}

- (void)beginAdvertisingProximityAutomatedDeviceEnrollment
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __113__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_beginAdvertisingProximityAutomatedDeviceEnrollment__block_invoke;
  v4[3] = &unk_1E4E26980;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __113__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_beginAdvertisingProximityAutomatedDeviceEnrollment__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemonConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAdvertisingProximityAutomatedDeviceEnrollment");

}

- (void)endAdvertisingProximityAutomatedDeviceEnrollment
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_endAdvertisingProximityAutomatedDeviceEnrollment__block_invoke;
  v4[3] = &unk_1E4E26980;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __111__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_endAdvertisingProximityAutomatedDeviceEnrollment__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemonConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAdvertisingProximityAutomatedDeviceEnrollment");

}

- (void)shutdown
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_shutdown__block_invoke;
  v4[3] = &unk_1E4E26980;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_shutdown__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemonConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shutdown");

}

- (void)displayProximityPinCode:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayProximityPinCode___block_invoke;
  v10[3] = &unk_1E4E269A8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayProximityPinCode___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayProximityPinCode:", *(_QWORD *)(a1 + 32));

}

- (void)dismissProximityPinCodeWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_dismissProximityPinCodeWithError___block_invoke;
  v10[3] = &unk_1E4E269A8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __96__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_dismissProximityPinCodeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissProximityPinCodeWithError:", *(_QWORD *)(a1 + 32));

}

- (void)configuratorPairingSuccessfulWithViewModel:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_configuratorPairingSuccessfulWithViewModel___block_invoke;
  v10[3] = &unk_1E4E269A8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __106__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_configuratorPairingSuccessfulWithViewModel___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuratorPairingSuccessfulWithViewModel:", *(_QWORD *)(a1 + 32));

}

- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentHasStatusUpdateWithViewModel___block_invoke;
  v10[3] = &unk_1E4E269A8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __102__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentHasStatusUpdateWithViewModel___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollmentHasStatusUpdateWithViewModel:", *(_QWORD *)(a1 + 32));

}

- (void)fetchActivationStateWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_fetchActivationStateWithCompletion___block_invoke;
  v10[3] = &unk_1E4E269D0;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __98__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_fetchActivationStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchActivationStateWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)activateUsingWiFiWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_activateUsingWiFiWithCompletion___block_invoke;
  v9[3] = &unk_1E4E269D0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_activateUsingWiFiWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateUsingWiFiWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)enrollmentCompleteWithViewModel:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentCompleteWithViewModel___block_invoke;
  v9[3] = &unk_1E4E269A8;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentCompleteWithViewModel___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollmentCompleteWithViewModel:", *(_QWORD *)(a1 + 32));

}

- (void)displayShutdownUI
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient connectionQueue](self, "connectionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayShutdownUI__block_invoke;
  block[3] = &unk_1E4E26980;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __80__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayShutdownUI__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayShutdownUI");

}

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol)delegate
{
  return (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
