@implementation WFRemoteWidgetConnection

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[WFRemoteWidgetConnection nwBrowser](self, "nwBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[WFRemoteWidgetConnection nwListener](self, "nwListener"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[WFRemoteWidgetConnection connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_7;
  }
  getWFWidgetConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WFRemoteWidgetConnection dealloc]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s WFRemoteWidgetConnection deallocated without [invalidate] being called...", buf, 0xCu);
  }

LABEL_7:
  -[WFRemoteWidgetConnection invalidate](self, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)WFRemoteWidgetConnection;
  -[WFRemoteWidgetConnection dealloc](&v6, sel_dealloc);
}

- (WFRemoteWidgetConnection)initWithDeviceIdentifier:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  NSObject *v15;
  NSObject *application_service;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD handler[4];
  id v30;
  id v31;
  id location;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WFRemoteWidgetConnection;
  v6 = -[WFRemoteWidgetConnection init](&v33, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v9;

    objc_storeStrong((id *)v6 + 3, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.shortcuts.WFRemoteWidgetConnection", v12);
    v14 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v13;

    +[WFRemoteWidgetConnection _createBrowseParameters](WFRemoteWidgetConnection, "_createBrowseParameters");
    v15 = objc_claimAutoreleasedReturnValue();
    application_service = nw_browse_descriptor_create_application_service("com.apple.workflow.remotewidgets");
    nw_browse_descriptor_set_device_types();
    v17 = nw_browser_create(application_service, v15);
    nw_browser_set_state_changed_handler(v17, &__block_literal_global_39716);
    objc_initWeak(&location, v6);
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_6;
    handler[3] = &unk_1E7AF3438;
    objc_copyWeak(&v31, &location);
    v19 = v5;
    v30 = v19;
    nw_browser_set_browse_results_changed_handler(v17, handler);
    getWFWidgetConfigurationLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]";
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Starting NWBrowser. Looking for device with id %@", buf, 0x16u);
    }

    nw_browser_set_queue(v17, *((dispatch_queue_t *)v6 + 9));
    nw_browser_start(v17);
    v21 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v17;
    v22 = v17;

    v23 = dispatch_time(0, 20000000000);
    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_9;
    v27[3] = &unk_1E7AF94B0;
    v24 = v6;
    v28 = v24;
    dispatch_after(v23, MEMORY[0x1E0C80D38], v27);
    v25 = v24;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return (WFRemoteWidgetConnection *)v6;
}

- (WFRemoteWidgetConnection)init
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  NSObject *application_service;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)WFRemoteWidgetConnection;
  v2 = -[WFRemoteWidgetConnection init](&v20, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.shortcuts.WFRemoteWidgetConnection", v4);
    v6 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v5;

    +[WFRemoteWidgetConnection _createAdvertiseParameters](WFRemoteWidgetConnection, "_createAdvertiseParameters");
    v7 = objc_claimAutoreleasedReturnValue();
    application_service = nw_advertise_descriptor_create_application_service("com.apple.workflow.remotewidgets");
    v9 = nw_listener_create(v7);
    nw_listener_set_advertise_descriptor(v9, application_service);
    objc_initWeak(&location, v2);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __32__WFRemoteWidgetConnection_init__block_invoke;
    v17 = &unk_1E7AF3460;
    objc_copyWeak(&v18, &location);
    nw_listener_set_new_connection_handler(v9, &v14);
    MEMORY[0x1C3BB34F0](v9, &__block_literal_global_12);
    nw_listener_set_queue(v9, *((dispatch_queue_t *)v2 + 9));
    nw_listener_start(v9);
    getWFWidgetConfigurationLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFRemoteWidgetConnection init]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Listener started!", buf, 0xCu);
    }

    objc_storeStrong((id *)v2 + 7, v9);
    objc_msgSend(v2, "_setupWakeHandler", v14, v15, v16, v17);
    if (*((_QWORD *)v2 + 5))
    {
      objc_msgSend(v2, "_replyToWakeEvent:");
      v11 = (void *)*((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = 0;

    }
    v12 = v2;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (WFRemoteWidgetConnection *)v2;
}

- (void)_setupWakeHandler
{
  NSObject *v3;
  _QWORD handler[5];

  -[WFRemoteWidgetConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45__WFRemoteWidgetConnection__setupWakeHandler__block_invoke;
  handler[3] = &unk_1E7AF34A8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", v3, handler);

}

- (void)_replyToWakeEvent:(id)a3
{
  xpc_object_t reply;
  xpc_object_t original;

  original = a3;
  if (xpc_dictionary_get_BOOL(original, "replyRequired"))
  {
    reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_send_reply();

  }
}

- (void)_handleNewConnection:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  OS_nw_connection *connection;
  NSObject *v8;
  OS_nw_connection *v9;
  NSObject *v10;
  _QWORD handler[4];
  NSObject *v12;
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  OS_nw_connection *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__WFRemoteWidgetConnection__handleNewConnection___block_invoke;
  handler[3] = &unk_1E7AF34D0;
  objc_copyWeak(&v13, &location);
  v5 = v4;
  v12 = v5;
  nw_connection_set_state_changed_handler(v5, handler);
  if (self->_connection)
  {
    getWFWidgetConfigurationLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 136315650;
      v16 = "-[WFRemoteWidgetConnection _handleNewConnection:]";
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = connection;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s WFRemoteWidgetConnection has incoming connection %@, but already owns an incoming connection %@", buf, 0x20u);
    }

  }
  getWFWidgetConfigurationLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFRemoteWidgetConnection _handleNewConnection:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetConnection incoming connection %@", buf, 0x16u);
  }

  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  nw_connection_start(v5);
  v9 = self->_connection;
  self->_connection = (OS_nw_connection *)v5;
  v10 = v5;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  getWFWidgetConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFRemoteWidgetConnection invalidate]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidating WFRemoteWidgetConnection", buf, 0xCu);
  }

  if (-[WFRemoteWidgetConnection invalidated](self, "invalidated"))
  {
    getWFWidgetConfigurationLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFRemoteWidgetConnection invalidate]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetConnection already invalidated", buf, 0xCu);
    }

  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WFRemoteWidgetConnection completionHandlers](self, "completionHandlers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteWidgetConnectionErrorDomain"), 1, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    -[WFRemoteWidgetConnection completionHandlers](self, "completionHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[WFRemoteWidgetConnection nwBrowser](self, "nwBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[WFRemoteWidgetConnection nwBrowser](self, "nwBrowser");
      v14 = objc_claimAutoreleasedReturnValue();
      nw_browser_cancel(v14);

      -[WFRemoteWidgetConnection setNwBrowser:](self, "setNwBrowser:", 0);
    }
    -[WFRemoteWidgetConnection nwListener](self, "nwListener");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFRemoteWidgetConnection nwListener](self, "nwListener");
      v16 = objc_claimAutoreleasedReturnValue();
      nw_listener_cancel(v16);

      -[WFRemoteWidgetConnection setNwListener:](self, "setNwListener:", 0);
    }
    -[WFRemoteWidgetConnection connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[WFRemoteWidgetConnection connection](self, "connection");
      v18 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v18);

      -[WFRemoteWidgetConnection setConnection:](self, "setConnection:", 0);
    }
    -[WFRemoteWidgetConnection setConnectedToDevice:](self, "setConnectedToDevice:", 0);
    -[WFRemoteWidgetConnection setInvalidated:](self, "setInvalidated:", 1);
    -[WFRemoteWidgetConnection setDataToSend:](self, "setDataToSend:", 0);
  }
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *v16;
  size_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *message;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id location;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (-[WFRemoteWidgetConnection invalidated](self, "invalidated"))
  {
    getWFWidgetConfigurationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection that's invalidated", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteWidgetConnectionErrorDomain"), 1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
  }
  else if (-[WFRemoteWidgetConnection isConnectedToDevice](self, "isConnectedToDevice")
         || (-[WFRemoteWidgetConnection listenerDelegate](self, "listenerDelegate"),
             v10 = (void *)objc_claimAutoreleasedReturnValue(),
             v10,
             !v10))
  {
    if (-[WFRemoteWidgetConnection isConnectedToDevice](self, "isConnectedToDevice")
      && (-[WFRemoteWidgetConnection connection](self, "connection"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      getWFWidgetConfigurationLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection that is disconnected", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteWidgetConnectionErrorDomain"), 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v9);
    }
    else
    {
      -[WFRemoteWidgetConnection completionHandlers](self, "completionHandlers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = _Block_copy(v7);
      objc_msgSend(v13, "addObject:", v14);

      v15 = objc_retainAutorelease(v6);
      v16 = (const void *)objc_msgSend(v15, "bytes");
      v17 = objc_msgSend(v15, "length");
      v9 = dispatch_data_create(v16, v17, MEMORY[0x1E0C80D38], 0);
      objc_initWeak(&location, self);
      -[WFRemoteWidgetConnection connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = v18 == 0;

      if ((_DWORD)v16)
      {
        getWFWidgetConfigurationLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
          _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_DEFAULT, "%s Device not connected, waiting to send data...", buf, 0xCu);
        }

        -[WFRemoteWidgetConnection dataToSend](self, "dataToSend");
        message = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](message, "addObject:", v9);
      }
      else
      {
        getWFWidgetConfigurationLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_DEFAULT, "%s Device connected; sending data right away",
            buf,
            0xCu);
        }

        +[WFRemoteWidgetConnection _createFramer](WFRemoteWidgetConnection, "_createFramer");
        v20 = objc_claimAutoreleasedReturnValue();
        message = nw_framer_protocol_create_message(v20);

        v22 = nw_content_context_create("Request");
        nw_content_context_set_metadata_for_protocol(v22, message);
        -[WFRemoteWidgetConnection connection](self, "connection");
        v23 = objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __55__WFRemoteWidgetConnection_sendData_completionHandler___block_invoke;
        v26[3] = &unk_1E7AF34F8;
        objc_copyWeak(&v27, &location);
        nw_connection_send(v23, v9, v22, 1, v26);

        objc_destroyWeak(&v27);
      }

      objc_destroyWeak(&location);
    }
  }
  else
  {
    getWFWidgetConfigurationLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection not connected", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteWidgetConnectionErrorDomain"), 2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
  }

}

- (void)_browserDiscoveredDeviceEndpoint:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  nw_connection_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD handler[4];
  NSObject *v15;
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteWidgetConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFWidgetConfigurationLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Already connected to endpoint, ignoring...", buf, 0xCu);
    }
  }
  else
  {
    -[WFRemoteWidgetConnection nwBrowser](self, "nwBrowser");
    v7 = objc_claimAutoreleasedReturnValue();
    nw_browser_cancel(v7);

    +[WFRemoteWidgetConnection _createAdvertiseParameters](WFRemoteWidgetConnection, "_createAdvertiseParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = nw_connection_create(v4, v6);
    -[WFRemoteWidgetConnection setConnection:](self, "setConnection:", v8);

    -[WFRemoteWidgetConnection connection](self, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    -[WFRemoteWidgetConnection queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v9, v10);

    objc_initWeak(&location, self);
    -[WFRemoteWidgetConnection connection](self, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__WFRemoteWidgetConnection__browserDiscoveredDeviceEndpoint___block_invoke;
    handler[3] = &unk_1E7AF34D0;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    nw_connection_set_state_changed_handler(v11, handler);

    -[WFRemoteWidgetConnection connection](self, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    nw_connection_start(v12);

    getWFWidgetConfigurationLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]";
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection created", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)_sendPendingData
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *message;
  NSObject *v10;
  NSObject *v11;
  id obj;
  _QWORD completion[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  getWFWidgetConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFRemoteWidgetConnection _sendPendingData]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Sending pending data...", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFRemoteWidgetConnection dataToSend](self, "dataToSend");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(NSObject **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_initWeak((id *)buf, self);
        +[WFRemoteWidgetConnection _createFramer](WFRemoteWidgetConnection, "_createFramer");
        v8 = objc_claimAutoreleasedReturnValue();
        message = nw_framer_protocol_create_message(v8);

        v10 = nw_content_context_create("Request");
        nw_content_context_set_metadata_for_protocol(v10, message);
        -[WFRemoteWidgetConnection connection](self, "connection");
        v11 = objc_claimAutoreleasedReturnValue();
        completion[0] = MEMORY[0x1E0C809B0];
        completion[1] = 3221225472;
        completion[2] = __44__WFRemoteWidgetConnection__sendPendingData__block_invoke;
        completion[3] = &unk_1E7AF34F8;
        objc_copyWeak(&v14, (id *)buf);
        nw_connection_send(v11, v7, v10, 1, completion);

        objc_destroyWeak(&v14);
        objc_destroyWeak((id *)buf);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (void)_receiveRequestOnConnection
{
  NSObject *v3;
  _QWORD completion[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WFRemoteWidgetConnection connection](self, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke;
  completion[3] = &unk_1E7AF3548;
  objc_copyWeak(&v5, &location);
  completion[4] = self;
  nw_connection_receive_message(v3, completion);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_receiveResponseOnConnection
{
  NSObject *v3;
  _QWORD completion[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WFRemoteWidgetConnection connection](self, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __56__WFRemoteWidgetConnection__receiveResponseOnConnection__block_invoke;
  completion[3] = &unk_1E7AF3548;
  objc_copyWeak(&v5, &location);
  completion[4] = self;
  nw_connection_receive_message(v3, completion);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_tearDownConnection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFRemoteWidgetConnection completionHandlers](self, "completionHandlers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteWidgetConnectionErrorDomain"), 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  -[WFRemoteWidgetConnection completionHandlers](self, "completionHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[WFRemoteWidgetConnection listenerDelegate](self, "listenerDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[WFRemoteWidgetConnection invalidated](self, "invalidated");

    if (!v13)
    {
      -[WFRemoteWidgetConnection listenerDelegate](self, "listenerDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteWidgetConnectionConnectionLost:", self);

    }
  }
  -[WFRemoteWidgetConnection listenerDelegate](self, "listenerDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[WFRemoteWidgetConnection invalidate](self, "invalidate");
}

- (WFRemoteWidgetConnectionListenerDelegate)listenerDelegate
{
  return (WFRemoteWidgetConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_listenerDelegate);
}

- (void)setListenerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listenerDelegate, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (id)connectionTimeoutHandler
{
  return self->_connectionTimeoutHandler;
}

- (void)setConnectionTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isConnectedToDevice
{
  return self->_connectedToDevice;
}

- (void)setConnectedToDevice:(BOOL)a3
{
  self->_connectedToDevice = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (OS_xpc_object)unrepliedWakeEvent
{
  return self->_unrepliedWakeEvent;
}

- (void)setUnrepliedWakeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_unrepliedWakeEvent, a3);
}

- (OS_nw_browser)nwBrowser
{
  return self->_nwBrowser;
}

- (void)setNwBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_nwBrowser, a3);
}

- (OS_nw_listener)nwListener
{
  return self->_nwListener;
}

- (void)setNwListener:(id)a3
{
  objc_storeStrong((id *)&self->_nwListener, a3);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (NSMutableArray)dataToSend
{
  return self->_dataToSend;
}

- (void)setDataToSend:(id)a3
{
  objc_storeStrong((id *)&self->_dataToSend, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nwListener, 0);
  objc_storeStrong((id *)&self->_nwBrowser, 0);
  objc_storeStrong((id *)&self->_unrepliedWakeEvent, 0);
  objc_storeStrong(&self->_connectionTimeoutHandler, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_listenerDelegate);
}

void __56__WFRemoteWidgetConnection__receiveResponseOnConnection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    getWFWidgetConfigurationLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Remote widget incoming connection received message", (uint8_t *)&v19, 0xCu);
    }

    if (v8)
    {
      getWFWidgetConfigurationLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v19 = 136315394;
        v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
        v21 = 2112;
        v22 = (uint64_t)v8;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Remote widget incoming connection got error receiving data %@", (uint8_t *)&v19, 0x16u);
      }

      objc_msgSend(WeakRetained, "_tearDownConnection");
    }
    else
    {
      if (v7)
      {
        v12 = v7;
        getWFWidgetConfigurationLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = -[NSObject length](v12, "length");
          v19 = 136315394;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          v21 = 2050;
          v22 = v14;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Remote widget incoming connection received message; sending data via completion handler. Data is of size: %{public}ld",
            (uint8_t *)&v19,
            0x16u);
        }

        objc_msgSend(WeakRetained, "completionHandlers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 0);
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        getWFWidgetConfigurationLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v19 = 136315138;
            v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s Calling the completion handler with data", (uint8_t *)&v19, 0xCu);
          }

          ((void (**)(_QWORD, NSObject *, _QWORD))v16)[2](v16, v12, 0);
          objc_msgSend(WeakRetained, "completionHandlers");
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSObject removeObjectAtIndex:](v18, "removeObjectAtIndex:", 0);
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v19 = 136315138;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s Could not find completion handler for incoming response. Dropping data...", (uint8_t *)&v19, 0xCu);
        }

      }
      else
      {
        getWFWidgetConfigurationLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v19 = 136315394;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          v21 = 2112;
          v22 = 0;
          _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Remote widget incoming connection got error receiving data %@", (uint8_t *)&v19, 0x16u);
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "_receiveResponseOnConnection");
    }
  }

}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[6];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    getWFWidgetConfigurationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Remote widget outgoing connection received message", buf, 0xCu);
    }

    if (v10)
    {
      getWFWidgetConfigurationLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection got error receiving data %@", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "_tearDownConnection");
    }
    else
    {
      if (!v8)
      {
        getWFWidgetConfigurationLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
          _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection received message; no data",
            buf,
            0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "listenerDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (v16)
      {
        getWFWidgetConfigurationLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection received message; no listener delegate",
            buf,
            0xCu);
        }

      }
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "listenerDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (!v19)
        {
          v20 = v8;
          getWFWidgetConfigurationLogObject();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_INFO, "%s Remote widget outgoing connection received message; informing listener delegate",
              buf,
              0xCu);
          }

          objc_msgSend(WeakRetained, "listenerDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_20;
          v23[3] = &unk_1E7AF3520;
          v23[4] = *(_QWORD *)(a1 + 32);
          v23[5] = WeakRetained;
          objc_copyWeak(&v24, (id *)(a1 + 40));
          objc_msgSend(v22, "remoteWidgetConnection:didReceiveData:responseHandler:", WeakRetained, v20, v23);

          objc_destroyWeak(&v24);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_receiveRequestOnConnection");
    }
  }

}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_20(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  const void *v11;
  size_t v12;
  NSObject *v13;
  NSObject *message;
  NSObject *v15;
  NSObject *v16;
  _QWORD completion[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFWidgetConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Received a response from the listener delegate", buf, 0xCu);
  }

  objc_msgSend(a1[4], "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  getWFWidgetConfigurationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Connection lost, dropping response...", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v3, "length");
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      v21 = 2050;
      v22 = v9;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Sending response data received from the listener delegate; data is of size %{public}ld",
        buf,
        0x16u);
    }

    v10 = objc_retainAutorelease(v3);
    v11 = (const void *)objc_msgSend(v10, "bytes");
    v12 = objc_msgSend(v10, "length");
    v8 = dispatch_data_create(v11, v12, MEMORY[0x1E0C80D38], 0);
    +[WFRemoteWidgetConnection _createFramer](WFRemoteWidgetConnection, "_createFramer");
    v13 = objc_claimAutoreleasedReturnValue();
    message = nw_framer_protocol_create_message(v13);

    v15 = nw_content_context_create("Response");
    nw_content_context_set_metadata_for_protocol(v15, message);
    objc_msgSend(a1[5], "connection");
    v16 = objc_claimAutoreleasedReturnValue();
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_22;
    completion[3] = &unk_1E7AF34F8;
    objc_copyWeak(&v18, a1 + 6);
    nw_connection_send(v16, v8, v15, 1, completion);

    objc_destroyWeak(&v18);
  }

}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id v5;
  NSObject *WeakRetained;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (v4 = (id *)(a1 + 32), v5 = objc_loadWeakRetained(v4), v5, v5))
  {
    WeakRetained = objc_loadWeakRetained(v4);
    getWFWidgetConfigurationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Error when sending response data %@", (uint8_t *)&v8, 0x16u);
    }

    -[NSObject _tearDownConnection](WeakRetained, "_tearDownConnection");
  }
  else
  {
    getWFWidgetConfigurationLogObject();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C15B3000, WeakRetained, OS_LOG_TYPE_INFO, "%s Sent response data received from the listener delegate", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __44__WFRemoteWidgetConnection__sendPendingData__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFWidgetConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[WFRemoteWidgetConnection _sendPendingData]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s There was an error sending the data. Killing connection...", (uint8_t *)&v6, 0xCu);
    }

    if (WeakRetained)
      objc_msgSend(WeakRetained, "_tearDownConnection");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[WFRemoteWidgetConnection _sendPendingData]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Successfully sent data", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __61__WFRemoteWidgetConnection__browserDiscoveredDeviceEndpoint___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((a2 - 4) >= 2)
    {
      if (a2 == 3)
      {
        getWFWidgetConfigurationLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315138;
          v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
          _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection entered ready state.", (uint8_t *)&v12, 0xCu);
        }

        objc_msgSend(WeakRetained, "setConnectedToDevice:", 1);
        objc_msgSend(WeakRetained, "_receiveResponseOnConnection");
        objc_msgSend(WeakRetained, "_sendPendingData");
      }
      else if (v5)
      {
        getWFWidgetConfigurationLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = 136315906;
          v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
          v14 = 2112;
          v15 = v11;
          v16 = 2080;
          v17 = nw_connection_state_to_string();
          v18 = 2112;
          v19 = v5;
          _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection to endpoint %@ entered state %s, error=%@", (uint8_t *)&v12, 0x2Au);
        }

      }
    }
    else
    {
      getWFWidgetConfigurationLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v12 = 136315906;
        v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
        v14 = 2112;
        v15 = v8;
        v16 = 2080;
        v17 = nw_connection_state_to_string();
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection to endpoint %@ disconnected, state=%s, error=%@", (uint8_t *)&v12, 0x2Au);
      }

      objc_msgSend(WeakRetained, "_tearDownConnection");
    }
  }

}

void __55__WFRemoteWidgetConnection_sendData_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFWidgetConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[WFRemoteWidgetConnection sendData:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s There was an error sending the data.  Killing connection...", (uint8_t *)&v6, 0xCu);
    }

    if (WeakRetained)
      objc_msgSend(WeakRetained, "_tearDownConnection");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[WFRemoteWidgetConnection sendData:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Successfully sent data", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __49__WFRemoteWidgetConnection__handleNewConnection___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *WeakRetained;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 - 4) < 2)
  {
    getWFWidgetConfigurationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v17 = 136315650;
      v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Incoming connection failed or was canceled. Connection=%@ Error=%@", (uint8_t *)&v17, 0x20u);
    }

    v9 = objc_loadWeakRetained(WeakRetained + 2);
    -[NSObject remoteWidgetConnectionConnectionLost:](v9, "remoteWidgetConnectionConnectionLost:", WeakRetained);
LABEL_5:

    objc_msgSend(WeakRetained, "_tearDownConnection");
    goto LABEL_16;
  }
  if (a2 == 3)
  {
    getWFWidgetConfigurationLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Incoming connection entered the ready state.  Connection=%@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(WeakRetained, "_receiveRequestOnConnection");
  }
  else
  {
    getWFWidgetConfigurationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = nw_connection_state_to_string();
        v14 = *(void **)(a1 + 32);
        v17 = 136315906;
        v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
        v19 = 2080;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Incoming connection entered state %s.  Connection=%@, Error=%@", (uint8_t *)&v17, 0x2Au);
      }
      goto LABEL_5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = nw_connection_state_to_string();
      v16 = *(void **)(a1 + 32);
      v17 = 136315650;
      v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      v19 = 2080;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Incoming connection entered state %s.  Connection=%@", (uint8_t *)&v17, 0x20u);
    }

  }
LABEL_16:

}

void __45__WFRemoteWidgetConnection__setupWakeHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (void *)objc_msgSend(v4, "initWithCString:encoding:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]), 4);
  getWFWidgetConfigurationLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[WFRemoteWidgetConnection _setupWakeHandler]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Wake event received %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "nwListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v8, "_replyToWakeEvent:", v3);
  else
    objc_msgSend(v8, "setUnrepliedWakeEvent:", v3);

}

void __32__WFRemoteWidgetConnection_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleNewConnection:", v5);

}

void __32__WFRemoteWidgetConnection_init__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a2 == 2)
  {
    getWFWidgetConfigurationLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[WFRemoteWidgetConnection init]_block_invoke_2";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Listener entered the ready state", (uint8_t *)&v7, 0xCu);
    }

  }
  if (v4)
  {
    getWFWidgetConfigurationLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFRemoteWidgetConnection init]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Listener threw error %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  nw_endpoint_t v7;
  uint64_t device_id;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    v7 = nw_browse_result_copy_endpoint(v4);
    if (v7)
    {
      device_id = nw_endpoint_get_device_id();
      if (device_id)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", device_id, 4);
        getWFWidgetConfigurationLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315394;
          v13 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
          v14 = 2112;
          v15 = v9;
          _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Discovered device with id %@", (uint8_t *)&v12, 0x16u);
        }

        if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {
          v11 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v11, "_browserDiscoveredDeviceEndpoint:", v7);

        }
      }
    }

  }
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  void (**v6)(void);
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connectionTimeoutHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "isConnectedToDevice");

    if ((v4 & 1) == 0)
    {
      getWFWidgetConfigurationLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136315138;
        v8 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Timed out establishing connection to the target remote device", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "connectionTimeoutHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    getWFWidgetConfigurationLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
      v6 = "%s Browser state change returned an error!";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_1C15B3000, v7, v8, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    getWFWidgetConfigurationLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
      v6 = "%s Remote Widget browser entered the ready state.";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_7;
    }
LABEL_8:

  }
}

+ (id)connectionToDevice:(id)a3
{
  id v3;
  WFRemoteWidgetConnection *v4;

  v3 = a3;
  v4 = -[WFRemoteWidgetConnection initWithDeviceIdentifier:]([WFRemoteWidgetConnection alloc], "initWithDeviceIdentifier:", v3);

  return v4;
}

+ (id)startListeningForIncomingConfigurations
{
  return objc_alloc_init(WFRemoteWidgetConnection);
}

+ (id)_createFramer
{
  if (_createFramer_onceToken[0] != -1)
    dispatch_once(_createFramer_onceToken, &__block_literal_global_25);
  return (id)_createFramer_definition;
}

+ (id)_createBrowseParameters
{
  NSObject *application_service;
  xpc_object_t v3;
  xpc_object_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *options;

  application_service = nw_parameters_create_application_service();
  v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "com.apple.rapport.browse");
  v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "RapportBrowseAgent");
  nw_parameters_set_required_netagent_classes();
  v5 = nw_parameters_copy_default_protocol_stack(application_service);
  +[WFRemoteWidgetConnection _createFramer](WFRemoteWidgetConnection, "_createFramer");
  v6 = objc_claimAutoreleasedReturnValue();
  options = nw_framer_create_options(v6);
  nw_protocol_stack_prepend_application_protocol(v5, options);

  return application_service;
}

+ (id)_createAdvertiseParameters
{
  NSObject *application_service;
  NSObject *v3;
  NSObject *v4;
  NSObject *options;

  application_service = nw_parameters_create_application_service();
  v3 = nw_parameters_copy_default_protocol_stack(application_service);
  +[WFRemoteWidgetConnection _createFramer](WFRemoteWidgetConnection, "_createFramer");
  v4 = objc_claimAutoreleasedReturnValue();
  options = nw_framer_create_options(v4);
  nw_protocol_stack_prepend_application_protocol(v3, options);

  return application_service;
}

void __41__WFRemoteWidgetConnection__createFramer__block_invoke()
{
  nw_protocol_definition_t definition;
  void *v1;

  definition = nw_framer_create_definition("WFRemoteWidgetConnection", 0, &__block_literal_global_28);
  v1 = (void *)_createFramer_definition;
  _createFramer_definition = (uint64_t)definition;

}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;

  v2 = a2;
  nw_framer_set_input_handler(v2, &__block_literal_global_30);
  nw_framer_set_output_handler(v2, &__block_literal_global_33);

  return 1;
}

void __41__WFRemoteWidgetConnection__createFramer__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  const char *v9;
  __int16 v10;
  size_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (HIDWORD(a4))
  {
    getWFWidgetConfigurationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[WFRemoteWidgetConnection _createFramer]_block_invoke_5";
      v10 = 2050;
      v11 = a4;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Message length exceeds UINT32_MAX. Message length %{public}ld", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    v8 = bswap32(a4);
    nw_framer_write_output(v5, (const uint8_t *)&v8, 4uLL);
    nw_framer_write_output_no_copy(v6, a4);
  }

}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint8_t temp_buffer[4];

  v2 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v4 = 4;
  while (1)
  {
    *(_DWORD *)temp_buffer = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __41__WFRemoteWidgetConnection__createFramer__block_invoke_4;
    v8[3] = &unk_1E7AF3610;
    v8[4] = &v9;
    if (!nw_framer_parse_input(v2, 4uLL, 4uLL, temp_buffer, v8))
      break;
    v5 = nw_framer_message_create(v2);
    v6 = nw_framer_deliver_input_no_copy(v2, *((unsigned int *)v10 + 6), v5, 1);

    if (!v6)
    {
      v4 = 0;
      break;
    }
    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_4(uint64_t a1, unsigned int *a2, unint64_t a3)
{
  uint64_t result;

  result = 0;
  if (a2)
  {
    if (a3 >= 4)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = bswap32(*a2);
      return 4;
    }
  }
  return result;
}

@end
