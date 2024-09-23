@implementation UNSUserNotificationServerSettingsConnectionListener

- (void)settingsService:(id)a3 didUpdateNotificationSourcesForBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_connections;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_connections;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxy", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateNotificationSourcesWithBundleIdentifiers:", v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (UNSUserNotificationServerSettingsConnectionListener)initWithNotificationSettingsService:(id)a3
{
  id v5;
  UNSUserNotificationServerSettingsConnectionListener *v6;
  NSMutableArray *v7;
  NSMutableArray *connections;
  id v9;
  uint64_t v10;
  NSXPCListener *listener;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNSUserNotificationServerSettingsConnectionListener;
  v6 = -[UNSUserNotificationServerSettingsConnectionListener init](&v13, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connections = v6->_connections;
    v6->_connections = v7;

    objc_storeStrong((id *)&v6->_settingsService, a3);
    -[UNSNotificationSettingsService addObserver:](v6->_settingsService, "addObserver:", v6);
    v9 = objc_alloc(MEMORY[0x24BDD1998]);
    v10 = objc_msgSend(v9, "initWithMachServiceName:", *MEMORY[0x24BEBFA00]);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[UNSNotificationSettingsService removeObserver:](self->_settingsService, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UNSUserNotificationServerSettingsConnectionListener;
  -[UNSUserNotificationServerSettingsConnectionListener dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *v11;
  _QWORD v13[4];
  id v14[2];
  _QWORD v15[4];
  id v16[2];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBF9F8], "clientInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(MEMORY[0x24BEBF9F8], "serverInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24D63A720;
  objc_copyWeak(v16, &location);
  v16[1] = v7;
  objc_msgSend(v7, "setInterruptionHandler:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_24D63A720;
  objc_copyWeak(v14, &location);
  v14[1] = v7;
  objc_msgSend(v7, "setInvalidationHandler:", v13);
  objc_msgSend(v7, "resume");
  v11 = self->_connections;
  objc_sync_enter(v11);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v7);
  objc_sync_exit(v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return 1;
}

void __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleClientConnectionInterrupted:", *(_QWORD *)(a1 + 40));

}

void __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleClientConnectionInvalidated:", *(_QWORD *)(a1 + 40));

}

- (void)getNotificationSource:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "uns_isAllowedToReadSettings"))
  {
    -[UNSNotificationSettingsService notificationSourceForBundleIdentifier:](self->_settingsService, "notificationSourceForBundleIdentifier:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  if (v6)
LABEL_5:
    v6[2](v6, v8);
LABEL_6:

}

- (void)getNotificationSources:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "uns_isAllowedToReadSettings"))
  {
    -[UNSNotificationSettingsService notificationSourcesForBundleIdentifiers:](self->_settingsService, "notificationSourcesForBundleIdentifiers:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  if (v6)
LABEL_5:
    v6[2](v6, v8);
LABEL_6:

}

- (void)getAllNotificationSourcesWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "uns_isAllowedToReadSettings"))
  {
    -[UNSNotificationSettingsService allNotificationSources](self->_settingsService, "allNotificationSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v6)
    v6[2](v6, v5);

}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "uns_isAllowedToWriteSettings"))
  {
    -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:](self->_settingsService, "authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:", a3, v11, v8);
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);

  }
}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "uns_isAllowedToWriteSettings"))
    -[UNSNotificationSettingsService replaceNotificationSettings:forNotificationSourceIdentifier:](self->_settingsService, "replaceNotificationSettings:forNotificationSourceIdentifier:", v8, v6);

}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uns_isAllowedToWriteSettings"))
    -[UNSNotificationSettingsService replaceNotificationTopicSettings:forNotificationSourceIdentifier:topicIdentifier:](self->_settingsService, "replaceNotificationTopicSettings:forNotificationSourceIdentifier:topicIdentifier:", v11, v8, v9);

}

- (void)getNotificationSystemSettingsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "uns_isAllowedToReadSettings"))
  {
    -[UNSNotificationSettingsService notificationSystemSettings](self->_settingsService, "notificationSystemSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v6)
    v6[2](v6, v5);

}

- (void)setNotificationSystemSettings:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "uns_isAllowedToWriteSettings"))
    -[UNSNotificationSettingsService setNotificationSystemSettings:](self->_settingsService, "setNotificationSystemSettings:", v5);

}

- (void)resetScheduledDeliverySetting
{
  id v3;

  -[UNSUserNotificationServerSettingsConnectionListener _currentConnection](self, "_currentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "uns_isAllowedToWriteSettings"))
    -[UNSNotificationSettingsService resetScheduledDeliverySetting](self->_settingsService, "resetScheduledDeliverySetting");

}

- (id)_currentConnection
{
  void *v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection].cold.1(v3);
  }
  return v2;
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  v6 = self->_connections;
  objc_sync_enter(v6);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);
  objc_sync_exit(v6);

}

- (void)settingsService:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_connections;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_connections;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxy", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateNotificationSystemSettings:", v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsService, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
