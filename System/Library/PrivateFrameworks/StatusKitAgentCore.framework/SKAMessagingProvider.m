@implementation SKAMessagingProvider

- (SKAMessagingProvider)initWithDelegate:(id)a3 serviceIdentifier:(id)a4 pushManager:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKAMessagingProvider *v14;
  NSObject *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *registeredIDSDeviceChangedObservers;
  uint64_t v19;
  IDSService *service;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKAMessagingProvider;
  v14 = -[SKAMessagingProvider init](&v22, sel_init);
  if (v14)
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Initializing messaging provider with service %@ and delegate %@", buf, 0x16u);
    }

    if (-[SKAMessagingProvider _keysharingIsDisabledByServer](v14, "_keysharingIsDisabledByServer"))
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SKAMessagingProvider initWithDelegate:serviceIdentifier:pushManager:queue:].cold.1();

    }
    else
    {
      objc_storeWeak((id *)&v14->_delegate, v10);
      objc_storeStrong((id *)&v14->_serviceIdentifier, a4);
      objc_storeStrong((id *)&v14->_pushManager, a5);
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      registeredIDSDeviceChangedObservers = v14->_registeredIDSDeviceChangedObservers;
      v14->_registeredIDSDeviceChangedObservers = v17;

      v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v11);
      service = v14->_service;
      v14->_service = (IDSService *)v19;

      -[IDSService addDelegate:queue:](v14->_service, "addDelegate:queue:", v14, v13);
    }
  }

  return v14;
}

- (BOOL)sendMessage:(id)a3 toHandle:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8
{
  _BOOL8 v10;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  uint64_t v21;

  v10 = a6;
  v21 = *MEMORY[0x24BDAC8D0];
  v20 = a4;
  v14 = (void *)MEMORY[0x24BDBCE30];
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a8) = -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:](self, "sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:", v17, v18, v15, v10, a7, a8, v20, v21);
  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  IDSService *service;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  id *v33;
  NSObject *v34;
  void *v35;
  SKAMessagingProvider *v37;
  void *v39;
  id v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (-[SKAMessagingProvider _keysharingIsDisabledByServer](self, "_keysharingIsDisabledByServer"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.1();
    LOBYTE(v15) = 0;
  }
  else
  {
    v37 = self;
    v39 = v13;
    v40 = v11;
    v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v21, "idsDestination", v37);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "length"))
          {
            -[NSObject addObject:](v14, "addObject:", v22);
          }
          else
          {
            +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v21;
              _os_log_error_impl(&dword_2188DF000, v23, OS_LOG_TYPE_ERROR, "Failed to generate IDS destination for handle: %@", buf, 0xCu);
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v18);
    }

    if (-[NSObject count](v14, "count"))
    {
      objc_msgSend(v39, "idsDestination");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v54 = *MEMORY[0x24BE4FAC8];
      v55 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v49 = v40;
        v50 = 2112;
        v51 = v14;
        v52 = 2112;
        v53 = v26;
        _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, "Sending message %@ to destinations %@ options: %@", buf, 0x20u);
      }

      service = v37->_service;
      v42 = 0;
      v43 = 0;
      v15 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v40, v14, 300, v26, &v43, &v42);
      v29 = v43;
      v30 = v42;
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v15)
      {
        v33 = a8;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v29;
          _os_log_impl(&dword_2188DF000, v32, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation message, assigned message identifier: %@", buf, 0xCu);
        }
      }
      else
      {
        v33 = a8;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.3();
      }

      if (a7)
        *a7 = objc_retainAutorelease(v29);
      v13 = v39;
      if (v33)
        *v33 = objc_retainAutorelease(v30);

      v11 = v40;
    }
    else
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v34 = objc_claimAutoreleasedReturnValue();
      v13 = v39;
      v11 = v40;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.2();

      +[SKAMessagingProvider _noValidIDSDetintationError](SKAMessagingProvider, "_noValidIDSDetintationError");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v35;
      if (a8)
      {
        v24 = objc_retainAutorelease(v35);
        LOBYTE(v15) = 0;
        *a8 = v24;
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }

  }
  return v15;
}

- (BOOL)sendMessageToSelfDevices:(id)a3 limitToPresenceCapable:(BOOL)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  NSObject *v20;
  IDSService *service;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  NSObject *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (-[SKAMessagingProvider _selfSharingIsDisabledByServer](self, "_selfSharingIsDisabledByServer"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:].cold.1();
    LOBYTE(v11) = 0;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[SKAMessagingProvider service](self, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "devices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)IDSCopyIDForDevice();
          if (v18)
            -[NSObject addObject:](v10, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v15);
    }

    if (-[NSObject count](v10, "count"))
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v36 = v9;
        v37 = 2112;
        v38 = v10;
        v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Sending message %@ to destinations %@ options: %@", buf, 0x20u);
      }

      service = self->_service;
      v29 = 0;
      v30 = 0;
      v11 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v9, v10, 300, v19, &v30, &v29);
      v22 = v30;
      v23 = v29;
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v11)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v22;
          _os_log_impl(&dword_2188DF000, v25, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation message, assigned message identifier: %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.3();
      }

      if (a5)
        *a5 = objc_retainAutorelease(v22);
      if (a6)
        *a6 = objc_retainAutorelease(v23);

    }
    else
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SKAMessagingProvider sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:].cold.2();

      +[SKAMessagingProvider _noValidIDSDetintationError](SKAMessagingProvider, "_noValidIDSDetintationError");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v27;
      if (a6)
      {
        v19 = objc_retainAutorelease(v27);
        LOBYTE(v11) = 0;
        *a6 = v19;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }

  }
  return v11;
}

- (void)isHandleMessageable:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[SKAMessagingProvider _keysharingIsDisabledByServer](self, "_keysharingIsDisabledByServer"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.1();

    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend(v6, "idsDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAMessagingProvider serviceIdentifier](self, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%p"), v13, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE4FC40], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__SKAMessagingProvider_isHandleMessageable_completion___block_invoke;
    v16[3] = &unk_24D9766C0;
    v17 = v7;
    objc_msgSend(v15, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v9, v10, v14, MEMORY[0x24BDAC9B8], v16);

  }
}

uint64_t __55__SKAMessagingProvider_isHandleMessageable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isHandleMessageableForPresence:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[SKAMessagingProvider _keysharingIsDisabledByServer](self, "_keysharingIsDisabledByServer"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:].cold.1();

    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend(v6, "idsDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAMessagingProvider serviceIdentifier](self, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%p"), v13, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE4FC40], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__SKAMessagingProvider_isHandleMessageableForPresence_completion___block_invoke;
    v16[3] = &unk_24D9766C0;
    v17 = v7;
    objc_msgSend(v15, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v9, v10, v14, MEMORY[0x24BDAC9B8], v16);

  }
}

uint64_t __66__SKAMessagingProvider_isHandleMessageableForPresence_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isHandleAvailableToMessageFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE4FE70]);
  objc_msgSend(v4, "normalizedHandleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUnprefixedURI:", v6);

  -[SKAMessagingProvider service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "isEqualToURI:", v7, (_QWORD)v19))
        {
          +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v4;
            _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Sender handle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
          }

          v16 = 1;
          v15 = v10;
          goto LABEL_15;
        }
      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Sender handle \"%@\" is not a valid sender handle for active iCloud account", buf, 0xCu);
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)isFromIDFromSelfAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SKAMessagingProvider service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForFromID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  SKAMessagingProvidingDelegate **p_delegate;
  id WeakRetained;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Received incoming message: %@ fromID: %@", (uint8_t *)&v20, 0x16u);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (-[SKAMessagingProvider _keysharingIsDisabledByServer](self, "_keysharingIsDisabledByServer"))
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SKAMessagingProvider service:account:incomingMessage:fromID:context:].cold.1();
    }
    else
    {
      objc_msgSend(v12, "serviceIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originalGUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "toID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v19, "service:didReceiveIncomingMessage:fromID:toID:messageGuid:", v16, v10, v11, v18, v17);

    }
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v9 = a6;
  v24 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a8;
  v14 = a3;
  +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v12;
    v22 = 1024;
    v23 = v9;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Message: %@ did send with success: %d", (uint8_t *)&v20, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v14, "serviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fromID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "service:outgoingMessageWithIdentifier:fromID:toID:didSendWithSuccess:", v17, v12, v18, v19, v9);
}

- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  NSObject *v5;
  SKAMessagingProvidingDelegate **p_delegate;
  id WeakRetained;
  id v8;
  uint8_t v9[16];

  +[SKAMessagingProvider logger](SKAMessagingProvider, "logger", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Received didHintCheckingTransportLogWithReason", v9, 2u);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "networkBecameReachable");

  }
}

- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  NSObject *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[IDSService URIs](self->_service, "URIs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unprefixedURI", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_msgSend(v8, "copy");
    v16 = (void *)_IDSCopyCallerID();

    if (objc_msgSend(v16, "length"))
    {
      v17 = IDSCopyRawAddressForDestination();
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Resolved default caller ID: %@", buf, 0xCu);
      }

      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v17);
    }
    else
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SKAMessagingProvider resolveSenderHandleWithPreferredSenderHandle:].cold.1();
      v6 = 0;
    }

  }
  return v6;
}

- (id)tokenURI
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[IDSService URIs](self->_service, "URIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "unprefixedURI", (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  v12 = (void *)_IDSCopyCallerID();

  -[SKAMessagingProvider deviceToken](self, "deviceToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v13 && v12)
  {
    v25 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)_IDSCopyOrderedAliases();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x219A1D0FC](v13, v17);
    v14 = v18;
    if (v18)
      v19 = v18;

  }
  return v14;
}

- (BOOL)isValidURI:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  NSObject *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (-[NSObject isTokenURI](v4, "isTokenURI"))
    {
      +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v5;
        _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Stripping token from: %@", buf, 0xCu);
      }

      -[NSObject tokenFreeURI](v5, "tokenFreeURI");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    -[IDSService accounts](self->_service, "accounts");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
LABEL_8:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        if (-[NSObject IDSIDType](v5, "IDSIDType") == 7)
        {
          v42 = 0uLL;
          v43 = 0uLL;
          v40 = 0uLL;
          v41 = 0uLL;
          objc_msgSend(v13, "pseudonyms");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v15)
          {
            v16 = v15;
            v35 = v11;
            v17 = *(_QWORD *)v41;
LABEL_14:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v41 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v18), "URI");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToURI:", v5);

              if ((v20 & 1) != 0)
                break;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
                if (v16)
                  goto LABEL_14;
                v11 = v35;
                goto LABEL_29;
              }
            }
LABEL_34:

            v26 = 1;
            v25 = v8;
            goto LABEL_35;
          }
        }
        else
        {
          v38 = 0uLL;
          v39 = 0uLL;
          v36 = 0uLL;
          v37 = 0uLL;
          objc_msgSend(v13, "handles");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v37;
LABEL_23:
            v24 = 0;
            while (1)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v14);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v24), "isEqualToURI:", v5) & 1) != 0)
                goto LABEL_34;
              if (v22 == ++v24)
              {
                v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                if (v22)
                  goto LABEL_23;
                break;
              }
            }
          }
        }
LABEL_29:

        if (++v12 == v10)
        {
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          if (v10)
            goto LABEL_8;
          break;
        }
      }
    }

    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider isValidURI:].cold.2();
    v26 = 0;
LABEL_35:

  }
  else
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider isValidURI:].cold.1(v5, v27, v28, v29, v30, v31, v32, v33);
    v26 = 0;
  }

  return v26;
}

- (id)selfAddressedURIForURI:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE4FE50]);
  -[SKAMessagingProvider deviceToken](self, "deviceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:", v6);

  if (v7 && (objc_msgSend(v7, "rawToken"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if (objc_msgSend(v4, "isTokenURI"))
    {
      objc_msgSend(v4, "tokenFreeURI");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v9;
    }
    objc_msgSend(v4, "URIByAddingPushToken:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prefixedURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider selfAddressedURIForURI:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (id)deviceToken
{
  return (id)-[SKAPushManaging pushToken](self->_pushManager, "pushToken");
}

- (id)deviceTokenForTokenURI:(id)a3
{
  id v3;

  v3 = (id)IDSCopyTokenAndIDForTokenWithID();
  return 0;
}

- (id)handleForTokenURI:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)IDSCopyRawAddressForDestination();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v3);

  return v4;
}

- (void)signPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SKAMessagingProvider service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__SKAMessagingProvider_signPayload_completion___block_invoke;
  v10[3] = &unk_24D9766E8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "signData:withAlgorithm:completion:", v7, 2, v10);

}

uint64_t __47__SKAMessagingProvider_signPayload_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifySignedPayload:(id)a3 matchesPayload:(id)a4 fromTokenURI:(id)a5 completion:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BE4FE70];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v11 alloc], "initWithPrefixedURI:", v12);

  -[SKAMessagingProvider service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__SKAMessagingProvider_verifySignedPayload_matchesPayload_fromTokenURI_completion___block_invoke;
  v18[3] = &unk_24D976710;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v16, "verifySignedData:matchesExpectedData:withTokenURI:forAlgorithm:completion:", v14, v13, v15, 2, v18);

}

void __83__SKAMessagingProvider_verifySignedPayload_matchesPayload_fromTokenURI_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Signature verification returned with result: %d", (uint8_t *)v7, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SKAMessagingProvider registeredIDSDeviceChangedObservers](self, "registeredIDSDeviceChangedObservers", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (id)_noValidIDSDetintationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10D0];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("No valid IDS destinations could be determined");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -4002, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_keysharingIsDisabledByServer
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status-kit-keysharing-disabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "BOOLValue"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider _keysharingIsDisabledByServer].cold.1();

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_selfSharingIsDisabledByServer
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status-kit-selfsharing-disabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "BOOLValue"))
  {
    +[SKAMessagingProvider logger](SKAMessagingProvider, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAMessagingProvider _selfSharingIsDisabledByServer].cold.1();

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)idsDevices
{
  return (NSArray *)-[IDSService devices](self->_service, "devices");
}

- (id)registerIDSDeviceChangedObserver:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = _Block_copy(v5);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredIDSDeviceChangedObservers, "setObject:forKeyedSubscript:", v7, v6);
  return v6;
}

- (void)unregisterIDSDeviceChangedObserver:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredIDSDeviceChangedObservers, "setObject:forKeyedSubscript:", 0, a3);
}

+ (id)logger
{
  if (logger_onceToken_6 != -1)
    dispatch_once(&logger_onceToken_6, &__block_literal_global_6);
  return (id)logger__logger_6;
}

void __30__SKAMessagingProvider_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAMessagingProvider");
  v1 = (void *)logger__logger_6;
  logger__logger_6 = (uint64_t)v0;

}

- (SKAMessagingProvidingDelegate)delegate
{
  return (SKAMessagingProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
  objc_storeStrong((id *)&self->_pushManager, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (NSMutableDictionary)registeredIDSDeviceChangedObservers
{
  return self->_registeredIDSDeviceChangedObservers;
}

- (void)setRegisteredIDSDeviceChangedObservers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredIDSDeviceChangedObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredIDSDeviceChangedObservers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:serviceIdentifier:pushManager:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Keysharing has been disabled by the server! Not initializing messaging service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Keysharing has been disabled by the server! Not sending message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "No valid IDS destinations generated from handles: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to send invitation message with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Self sharing has been disabled by the server! Not sending message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "No destinations for self devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Keysharing has been disabled by the server! Dropping incoming message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)resolveSenderHandleWithPreferredSenderHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unable to determine default caller ID among URIs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isValidURI:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a1, a3, "Invalid URI: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)isValidURI:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not validate URI %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)selfAddressedURIForURI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Device token is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_keysharingIsDisabledByServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Keysharing has been disabled in the server bag!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_selfSharingIsDisabledByServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Self sharing has been disabled in the server bag!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
