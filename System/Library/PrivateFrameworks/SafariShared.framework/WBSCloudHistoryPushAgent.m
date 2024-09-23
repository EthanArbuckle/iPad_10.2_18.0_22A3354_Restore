@implementation WBSCloudHistoryPushAgent

- (WBSCloudHistoryPushAgent)init
{
  WBSCloudHistoryPushAgent *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *pushNotificationStateQueue;
  uint64_t v5;
  NSXPCListener *xpcListener;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  APSConnection *pushConnection;
  WBSCloudHistoryPushAgent *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSCloudHistoryPushAgent;
  v2 = -[WBSCloudHistoryPushAgent init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WBSCloudHistoryPushAgent.State", 0);
    pushNotificationStateQueue = v2->_pushNotificationStateQueue;
    v2->_pushNotificationStateQueue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.SafariCloudHistoryPushAgent"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
    v7 = objc_alloc(MEMORY[0x1E0CFE148]);
    v8 = *MEMORY[0x1E0CFE130];
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11 = objc_msgSend(v7, "initWithEnvironmentName:namedDelegatePort:queue:", v8, CFSTR("com.apple.aps.SafariCloudHistoryPushAgent"), v9);
    pushConnection = v2->_pushConnection;
    v2->_pushConnection = (APSConnection *)v11;

    -[APSConnection setDelegate:](v2->_pushConnection, "setDelegate:", v2);
    v13 = v2;
  }

  return v2;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[WBSCloudHistoryPushAgent _pushTopic](self, "_pushTopic", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection _setEnabledTopics:](self->_pushConnection, "_setEnabledTopics:", v6);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  char v11;
  NSObject *v12;
  NSObject *pushNotificationStateQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = (void *)MEMORY[0x1E0C94F38];
  objc_msgSend(a4, "userInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationFromRemoteNotificationDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = "Ignoring push notification because notification is nil";
    goto LABEL_12;
  }
  objc_msgSend(v7, "containerIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SafariShared.History")))
  {
    v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SafariShared.WBSCloudHistoryStore"));

    if ((v11 & 1) != 0)
      goto LABEL_7;
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = "Ignoring push notification because it is not about history";
LABEL_12:
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_13;
  }

LABEL_7:
  v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "Received CloudHistory related push notification", buf, 2u);
  }
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSCloudHistoryPushAgent_connection_didReceiveIncomingMessage___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
LABEL_13:

}

void __65__WBSCloudHistoryPushAgent_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_setHasUnacknowledgedPushNotifications:", 1);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("com.apple.SafariShared.CloudHistory.PushReceived"), 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.safari.can-use-history-push-agent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE705CE8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
  }
  else
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistoryPushAgent listener:shouldAcceptNewConnection:].cold.1(v11, objc_msgSend(v5, "processIdentifier"), v9);

  }
  return v7;
}

- (void)getPushNotifications:(id)a3
{
  id v4;
  NSObject *pushNotificationStateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WBSCloudHistoryPushAgent_getPushNotifications___block_invoke;
  v7[3] = &unk_1E4B29E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(pushNotificationStateQueue, v7);

}

uint64_t __49__WBSCloudHistoryPushAgent_getPushNotifications___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_hasUnacknowledgedPushNotifications"), objc_msgSend(*(id *)(a1 + 32), "_hasAcknowledgedPushNotifications"));
}

- (void)queryMemoryFootprint:(id)a3
{
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v3 = (void (**)(id, void *, id))a3;
  v6 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C10]), "initWithError:", &v6);
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (void)acknowledgePendingPushNotifications
{
  NSObject *pushNotificationStateQueue;
  _QWORD block[5];

  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSCloudHistoryPushAgent_acknowledgePendingPushNotifications__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
}

uint64_t __63__WBSCloudHistoryPushAgent_acknowledgePendingPushNotifications__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasUnacknowledgedPushNotifications");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setHasUnacknowledgedPushNotifications:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_setHasAcknowlegedPushNotifications:", 1);
  }
  return result;
}

- (void)clearAcknowledgedPushNotifications
{
  NSObject *pushNotificationStateQueue;
  _QWORD block[5];

  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSCloudHistoryPushAgent_clearAcknowledgedPushNotifications__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
}

uint64_t __62__WBSCloudHistoryPushAgent_clearAcknowledgedPushNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHasAcknowlegedPushNotifications:", 0);
}

- (id)_pushTopic
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.icloud-container."), CFSTR("com.apple.mobilesafari"));
}

- (id)_userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SafariCloudHistoryPushAgent"));
}

- (BOOL)_hasUnacknowledgedPushNotifications
{
  void *v2;
  char v3;

  -[WBSCloudHistoryPushAgent _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UnacknowledgedPushNotifications"));

  return v3;
}

- (void)_setHasUnacknowledgedPushNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WBSCloudHistoryPushAgent _userDefaults](self, "_userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UnacknowledgedPushNotifications"));

}

- (BOOL)_hasAcknowledgedPushNotifications
{
  void *v2;
  char v3;

  -[WBSCloudHistoryPushAgent _userDefaults](self, "_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AcknowledgedPushNotifications"));

  return v3;
}

- (void)_setHasAcknowlegedPushNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WBSCloudHistoryPushAgent _userDefaults](self, "_userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("AcknowledgedPushNotifications"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushNotificationStateQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Connection to history push agent by %d was denied: Missing entitlement", buf, 8u);
}

@end
