@implementation SCSharingReminderXPCService

- (SCSharingReminderXPCService)init
{
  SCSharingReminderXPCClient *v3;
  SCSharingReminderXPCService *v4;

  v3 = objc_alloc_init(SCSharingReminderXPCClient);
  v4 = -[SCSharingReminderXPCService initWithClient:](self, "initWithClient:", v3);

  return v4;
}

- (SCSharingReminderXPCService)initWithClient:(id)a3
{
  id v4;
  SCSharingReminderXPCService *v5;
  SCSharingReminderManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCSharingReminderXPCService;
  v5 = -[SCSharingReminderXPCService init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SCSharingReminderManager);
    -[SCSharingReminderXPCService setSharingReminderManager:](v5, "setSharingReminderManager:", v6);

    -[SCSharingReminderXPCService setServiceClient:](v5, "setServiceClient:", v4);
  }

  return v5;
}

+ (id)tasks
{
  SCSharingReminderMaintenanceTask *v2;
  SCSharingReminderDeliveryTask *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(SCSharingReminderMaintenanceTask);
  v6[0] = v2;
  v3 = objc_alloc_init(SCSharingReminderDeliveryTask);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)userOpenedSafetyCheckWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasAccess"),
        v6,
        v5,
        v7))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userOpenedSafetyCheckWithCompletion:", v9);

  }
  else
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("userOpenedSafetyCheck"), v9);
  }

}

- (void)handleSignals:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasAccess"),
        v9,
        v8,
        v10))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleSignals:completion:", v12, v6);

  }
  else
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("handleSignals"), v6);
  }

}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasFeatureAccess"),
        v7,
        v6,
        v8))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchStatusWithCompletion:", v4);

  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__SCSharingReminderXPCService_fetchStatusWithCompletion___block_invoke;
    v10[3] = &unk_251662850;
    v11 = v4;
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("fetchStatus"), v10);

  }
}

void __57__SCSharingReminderXPCService_fetchStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  v14 = 0;
  v15 = 0;
  v16 = 0;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v12, v6, v7, v8, v9, v10, v11);

}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasFeatureAccess"),
        v6,
        v5,
        v7))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postWifiSyncNotificationWithCompletion:", v9);

  }
  else
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("postWifiSyncNotification"), v9);
  }

}

- (void)resetFeatureWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasFeatureAccess"),
        v6,
        v5,
        v7))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetFeatureWithCompletion:", v9);

  }
  else
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("resetFeatureWithCompletion"), v9);
  }

}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[SCSharingReminderXPCService serviceClient](self, "serviceClient"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasFeatureAccess"),
        v9,
        v8,
        v10))
  {
    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setReminderDelays:completion:", v12, v6);

  }
  else
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:](self, "rejectRequest:withCompletion:", CFSTR("setReminderDelays"), v6);
  }

}

- (void)rejectRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[SCSharingReminderXPCService serviceClient](self, "serviceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SCLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10)
      -[SCSharingReminderXPCService rejectRequest:withCompletion:].cold.2((uint64_t)v6, self, v9);
  }
  else if (v10)
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:].cold.1((uint64_t)v6, v9, v11, v12, v13, v14, v15, v16);
  }

  +[SCDaemonError errorWithCode:](SCDaemonError, "errorWithCode:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v17);

}

- (id)interestedEvents
{
  return &unk_251665C30;
}

- (void)handleXPCEventWithName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCSharingReminderXPCService interestedEvents](self, "interestedEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  SCLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_2454C0000, v8, OS_LOG_TYPE_INFO, "\"Handling event with name: %@\", (uint8_t *)&v15, 0xCu);
    }

    -[SCSharingReminderXPCService sharingReminderManager](self, "sharingReminderManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleNotificationEventWithName:](v8, "handleNotificationEventWithName:", v4);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SCSharingReminderXPCService handleXPCEventWithName:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (SCSharingReminderManager)sharingReminderManager
{
  return self->_sharingReminderManager;
}

- (void)setSharingReminderManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharingReminderManager, a3);
}

- (SCSharingReminderXPCClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_serviceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_sharingReminderManager, 0);
}

- (void)rejectRequest:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "@\"Rejecting %@ request, client is nil\", a5, a6, a7, a8, 2u);
}

- (void)rejectRequest:(NSObject *)a3 withCompletion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_2454C0000, a3, OS_LOG_TYPE_ERROR, "@\"Rejecting %@ request from: %@, client is not entitled\", (uint8_t *)&v7, 0x16u);

}

- (void)handleXPCEventWithName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "\"Unrecognized Darwin notification: %@\", a5, a6, a7, a8, 2u);
}

@end
