@implementation UNSUserNotificationServerRemoteNotificationConnectionListener

- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_connectionsByBundleIdentifier, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v9);
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_bundleIdentifiersByConnection, "setObject:forKey:", v8, v9);
  }
  objc_msgSend(v8, "addObject:", v6);

}

- (void)requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a4;
  -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection](self, "_currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uns_clientBundleProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v8))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __141__UNSUserNotificationServerRemoteNotificationConnectionListener_requestTokenForRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D639EA8;
    block[4] = self;
    v12 = v6;
    v10 = v8;
    v13 = v10;
    dispatch_async(queue, block);
    -[UNSUserNotificationServerRemoteNotificationConnectionListener _requestTokenForRemoteNotificationsForBundleIdentifier:withCompletionHandler:](self, "_requestTokenForRemoteNotificationsForBundleIdentifier:withCompletionHandler:", v10, v5);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

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

- (void)_requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = *MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerRemoteNotificationConnectionListener _requestTokenForRemoteNotificationsForBundleIdentifier:withCompletionHandler:].cold.1((uint64_t)v6, v10);
      if (!v7)
        goto LABEL_7;
    }
    else if (!v7)
    {
      goto LABEL_7;
    }
    UNSLocalizedFormatStringForKey((uint64_t)CFSTR("%@"), CFSTR("REMOTE_NOTIFICATION_ENTITLEMENT_NSERROR_DESCRIPTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, CFSTR("aps-environment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3000, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v16);
    goto LABEL_7;
  }
  -[UNCRemoteNotificationServer requestRemoteNotificationTokenWithEnvironment:forBundleIdentifier:](self->_remoteNotificationService, "requestRemoteNotificationTokenWithEnvironment:forBundleIdentifier:", v9, v6);
  if (v7)
    v7[2](v7, 1, 0);
LABEL_7:

}

uint64_t __141__UNSUserNotificationServerRemoteNotificationConnectionListener_requestTokenForRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __107__UNSUserNotificationServerRemoteNotificationConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E6BEE0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E57628);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1;
  v15[4] = __Block_byref_object_dispose__1;
  v10 = v7;
  v16 = v10;
  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_24D63A298;
  v14[4] = self;
  v14[5] = v15;
  objc_msgSend(v10, "setInterruptionHandler:", v14);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke_64;
  v13[3] = &unk_24D63A298;
  v13[4] = self;
  v13[5] = v15;
  objc_msgSend(v10, "setInvalidationHandler:", v13);
  objc_msgSend(v10, "resume");
  _Block_object_dispose(v15, 8);

  return 1;
}

- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UNSUserNotificationServerRemoteNotificationConnectionListener _queue_observerConnectionsForBundleIdentifier:](self, "_queue_observerConnectionsForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 2048;
    v25 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending received device token to %ld connections", buf, 0x16u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "remoteObjectProxy", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "didReceiveDeviceToken:forBundleIdentifier:", v6, v7);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)_queue_observerConnectionsForBundleIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", a3);
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__UNSUserNotificationServerRemoteNotificationConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (UNSUserNotificationServerRemoteNotificationConnectionListener)initWithRemoteNotificationService:(id)a3
{
  id v5;
  UNSUserNotificationServerRemoteNotificationConnectionListener *v6;
  UNSUserNotificationServerRemoteNotificationConnectionListener *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *connectionsByBundleIdentifier;
  uint64_t v10;
  NSMapTable *bundleIdentifiersByConnection;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSXPCListener *listener;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UNSUserNotificationServerRemoteNotificationConnectionListener;
  v6 = -[UNSUserNotificationServerRemoteNotificationConnectionListener init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteNotificationService, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connectionsByBundleIdentifier = v7->_connectionsByBundleIdentifier;
    v7->_connectionsByBundleIdentifier = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    bundleIdentifiersByConnection = v7->_bundleIdentifiersByConnection;
    v7->_bundleIdentifiersByConnection = (NSMapTable *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.usernotificationsserver.ConnectionListener", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.usernotifications.remotenotificationservice"));
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v15;

    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UNSUserNotificationServerRemoteNotificationConnectionListener;
  -[UNSUserNotificationServerRemoteNotificationConnectionListener dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

uint64_t __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke_64(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  id v10;

  -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection](self, "_currentConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uns_clientBundleProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    -[UNSUserNotificationServerRemoteNotificationConnectionListener _invalidateTokenForRemoteNotificationsForBundleIdentifier:](self, "_invalidateTokenForRemoteNotificationsForBundleIdentifier:", v6);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __122__UNSUserNotificationServerRemoteNotificationConnectionListener_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke;
    block[3] = &unk_24D639EA8;
    block[4] = self;
    v9 = v4;
    v10 = v6;
    dispatch_async(queue, block);

  }
}

uint64_t __122__UNSUserNotificationServerRemoteNotificationConnectionListener_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
  -[UNCRemoteNotificationServer invalidateTokenForRemoteNotificationsForBundleIdentifier:](self->_remoteNotificationService, "invalidateTokenForRemoteNotificationsForBundleIdentifier:", a3);
}

- (void)getAllowsRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uns_clientBundleProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "un_applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v10))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __135__UNSUserNotificationServerRemoteNotificationConnectionListener_getAllowsRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D63A2C0;
    v14 = &v15;
    block[4] = self;
    v13 = v10;
    dispatch_sync(queue, block);

  }
  if (v7)
    v7[2](v7, *((unsigned __int8 *)v16 + 24));

  _Block_object_dispose(&v15, 8);
}

uint64_t __135__UNSUserNotificationServerRemoteNotificationConnectionListener_getAllowsRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_allowsRemoteNotificationsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_allowsRemoteNotificationsForBundleIdentifier:(id)a3
{
  return -[UNCRemoteNotificationServer allowsRemoteNotificationsForBundleIdentifier:](self->_remoteNotificationService, "allowsRemoteNotificationsForBundleIdentifier:", a3);
}

- (void)_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __106__UNSUserNotificationServerRemoteNotificationConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __106__UNSUserNotificationServerRemoteNotificationConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v9);
  if (!objc_msgSend(v7, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_connectionsByBundleIdentifier, "removeObjectForKey:", v6);
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v6);
  if (!objc_msgSend(v8, "count"))
    -[NSMapTable removeObjectForKey:](self->_bundleIdentifiersByConnection, "removeObjectForKey:", v9);

}

- (void)_queue_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[UNSUserNotificationServerRemoteNotificationConnectionListener _queue_removeConnection:forBundleIdentifier:](self, "_queue_removeConnection:forBundleIdentifier:", v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_requestTokenForRemoteNotificationsForBundleIdentifier:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 138543874;
  v3 = CFSTR("aps-environment");
  v4 = 2114;
  v5 = a1;
  v6 = 2114;
  v7 = 0;
  _os_log_error_impl(&dword_216DCB000, a2, OS_LOG_TYPE_ERROR, "No valid '%{public}@' entitlement string found for application '%{public}@': %{public}@.", (uint8_t *)&v2, 0x20u);
}

- (void)_currentConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216DCB000, log, OS_LOG_TYPE_ERROR, "XPC current connection is unexpectedly nil", v1, 2u);
}

@end
