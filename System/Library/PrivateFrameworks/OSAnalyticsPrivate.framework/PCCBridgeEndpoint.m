@implementation PCCBridgeEndpoint

- (PCCBridgeEndpoint)init
{
  PCCBridgeEndpoint *v2;
  BOOL v3;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PCCBridgeEndpoint *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *initializationQueue;
  dispatch_queue_t v31;
  OS_dispatch_queue *eventQueue;
  uint64_t v33;
  NSMutableDictionary *remoteDevices;
  uint64_t v35;
  NSMutableDictionary *remoteCRKeys;
  uint64_t v37;
  NSMutableDictionary *outgoingConnections;
  uint64_t v39;
  NSMutableSet *interruptedDevices;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v2 = self;
  if (MEMORY[0x1E0D86FE0])
    v3 = MEMORY[0x1E0D87008] == 0;
  else
    v3 = 1;
  if (v3
    || MEMORY[0x1E0D87030] == 0
    || MEMORY[0x1E0D87050] == 0
    || MEMORY[0x1E0D87070] == 0
    || MEMORY[0x1E0D87090] == 0
    || MEMORY[0x1E0D870B0] == 0
    || MEMORY[0x1E0D870C0] == 0
    || MEMORY[0x1E0D870D8] == 0
    || MEMORY[0x1E0D870E8] == 0
    || MEMORY[0x1E0D870F0] == 0
    || MEMORY[0x1E0D87358] == 0
    || MEMORY[0x1E0D87368] == 0
    || MEMORY[0x1E0D87380] == 0
    || MEMORY[0x1E0D87398] == 0
    || MEMORY[0x1E0D873D0] == 0
    || MEMORY[0x1E0D873D8] == 0
    || MEMORY[0x1E0D873F0] == 0)
  {
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v20)
      -[PCCBridgeEndpoint init].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_62;
  }
  v50.receiver = self;
  v50.super_class = (Class)PCCBridgeEndpoint;
  v28 = -[PCCBridgeEndpoint init](&v50, sel_init, MEMORY[0x1E0D87090], MEMORY[0x1E0D87070], MEMORY[0x1E0D87050], MEMORY[0x1E0D87030]);
  v2 = v28;
  if (v28)
  {
    v29 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.initialization", 0);
    initializationQueue = v2->_initializationQueue;
    v2->_initializationQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.events", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v31;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    remoteDevices = v2->_remoteDevices;
    v2->_remoteDevices = (NSMutableDictionary *)v33;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    remoteCRKeys = v2->_remoteCRKeys;
    v2->_remoteCRKeys = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = objc_claimAutoreleasedReturnValue();
    outgoingConnections = v2->_outgoingConnections;
    v2->_outgoingConnections = (NSMutableDictionary *)v37;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39 = objc_claimAutoreleasedReturnValue();
    interruptedDevices = v2->_interruptedDevices;
    v2->_interruptedDevices = (NSMutableSet *)v39;

  }
  if ((OSAIsRSDHost() & 1) == 0 && (OSAIsRSDDevice() & 1) == 0)
  {
    v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v41)
      -[PCCBridgeEndpoint init].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);
LABEL_62:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_outgoingConnections;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v5 = 138412290;
    v12 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          v19 = v10;
          _os_log_impl(&dword_1D3A90000, v8, OS_LOG_TYPE_DEFAULT, "canceling remote connection with %@", buf, 0xCu);
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v10, v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_remote_connection_cancel();

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  if (self->_listeningConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "canceling listening connection", buf, 2u);
    }
    xpc_remote_connection_cancel();
  }
  if (self->_device_browser)
    remote_device_browser_cancel();
  v13.receiver = self;
  v13.super_class = (Class)PCCBridgeEndpoint;
  -[PCCBridgeEndpoint dealloc](&v13, sel_dealloc);
}

- (void)runWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PCCBridgeEndpoint;
  -[PCCEndpoint runWithDelegate:](&v4, sel_runWithDelegate_, a3);
  -[PCCBridgeEndpoint setupDeviceStateChangeHandler](self, "setupDeviceStateChangeHandler");
  -[PCCBridgeEndpoint setupIncomingEventListener](self, "setupIncomingEventListener");
}

- (void)setupIncomingEventListener
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Couldn't create the listener connection for %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)MEMORY[0x1E0C81260];
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      v9 = v7;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "incoming connection from %s is DOWN", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      v9 = v6;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "incoming connection from %s is UP", buf, 0xCu);
    }
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
  }

}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const char *string;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  xpc_object_t reply;
  const char *v17;
  size_t v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  uint8_t v31[16];
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1D8250F70]();
  if (v4 != MEMORY[0x1E0C81310])
  {
    if (v4 != MEMORY[0x1E0C812F8])
    {
LABEL_32:
      v25 = (void *)MEMORY[0x1D8250EE0](v3);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_1();
      if (v25)
        free(v25);
      goto LABEL_36;
    }
    v7 = (void *)MEMORY[0x1D8250B74]();
    xpc2ns();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kOSASender"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    v35 = 0;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Registering new sender from incoming message.", v31, 2u);
      }
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_15;
      v28[3] = &unk_1E954CC30;
      v29 = v9;
      v30 = buf;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v28);
      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40)
        || (objc_msgSend(*(id *)(a1 + 32), "exitInterruptedStateFrom:"), !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = v11 == 0,
            v11,
            v12))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "UNEXPECTED: incoming msg BEFORE outgoing connection established! *** consider deferring listener initialization ***", v31, 2u);
        }
      }

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("<file>")))
    {
      NSTemporaryDirectory();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("bridge-xfer.XXXXXX"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      reply = objc_retainAutorelease(v15);
      v17 = (const char *)objc_msgSend(reply, "fileSystemRepresentation");
      v18 = strlen(v17);
      v19 = (char *)malloc_type_malloc(v18 + 1, 0x4BDC5B76uLL);
      v20 = strcpy(v19, v17);
      if (mkstemp(v20) < 0)
      {
        free(v19);
      }
      else
      {
        xpc_dictionary_get_value(v3, "<file_xfer>");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v8;
        v27 = v3;
        xpc_file_transfer_write_to_fd();

      }
      goto LABEL_29;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("kOSAFetchCrashReporterKey")))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Handling request to fetch crash reporter key", v31, 2u);
      }
      reply = xpc_dictionary_create_reply(v3);
      if (!reply)
      {
        v24 = "failed to create reply message to fetch crash reporter key";
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "crashReporterKey");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(reply, "crashReporterKey", (const char *)objc_msgSend(v23, "UTF8String"));

      xpc_dictionary_send_reply();
LABEL_29:
      v24 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_2();
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        reply = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(reply, "handleMessage:from:", v8, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        goto LABEL_29;
      }
      v24 = "received message with missing/unknown sender";
    }
    else
    {
      v24 = "received unknown dictionary";
    }
LABEL_31:

    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(v7);
    if (!v24)
      goto LABEL_36;
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = string;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "incoming connection from %s ERROR %s\n", buf, 0x16u);
  }
LABEL_36:

}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_15(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint8_t v7[16];

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a1 + 64), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("fileMetadata"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_2(v3);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(WeakRetained, "handleFile:from:metadata:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);

      goto LABEL_12;
    }
    v6 = (void *)MEMORY[0x1D8250EE0](*(_QWORD *)(a1 + 48));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_1((uint64_t)v4);
      if (!v6)
        goto LABEL_12;
    }
    else if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    free(v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to write tmp remote file", v7, 2u);
  }
LABEL_13:
  unlink(*(const char **)(a1 + 64));
  free(*(void **)(a1 + 64));
}

- (void)setupDeviceStateChangeHandler
{
  OS_remote_device_browser *started;
  OS_remote_device_browser *device_browser;
  uint8_t buf[16];

  if (self->_device_browser)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Browser is already up; skipping setup",
        buf,
        2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Browser is down; proceeding with setup",
        buf,
        2u);
    }
    started = (OS_remote_device_browser *)remote_device_start_browsing();
    device_browser = self->_device_browser;
    self->_device_browser = started;

  }
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t type;
  uint64_t description;
  uint64_t name;
  void *v12;
  NSObject *v13;
  const char *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    if (v5)
    {
      type = remote_device_get_type();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        description = remote_device_type_get_description();
        name = remote_device_get_name();
        remote_device_get_state();
        *(_DWORD *)buf = 136315650;
        v19 = description;
        v20 = 2080;
        v21 = name;
        v22 = 2080;
        v23 = remote_device_state_get_description();
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Browser found %s-%s: %s", buf, 0x20u);
      }
      if (+[PCCBridgeEndpoint isSupportedRemoteDeviceType:](PCCBridgeEndpoint, "isSupportedRemoteDeviceType:", type))
      {
        remote_device_set_connected_callback();
        dispatch_get_global_queue(0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        remote_device_set_disconnected_callback();

        goto LABEL_15;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v17 = remote_device_type_get_description();
      *(_DWORD *)buf = 136315138;
      v19 = v17;
      v13 = MEMORY[0x1E0C81028];
      v14 = "Ignoring device of type %s";
      v15 = OS_LOG_TYPE_INFO;
      v16 = 12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v13 = MEMORY[0x1E0C81028];
      v14 = "Got a NULL device from the remote device browser";
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 2;
    }
    _os_log_impl(&dword_1D3A90000, v13, v15, v14, buf, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Browser was canceled", buf, 2u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

LABEL_15:
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t description;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  remote_device_get_type();
  description = remote_device_type_get_description();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = description;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device '%s' in connected state; attempting to establish service",
      (uint8_t *)&v5,
      0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "setupOutgoingConnection:", v3);

}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t name;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    name = remote_device_get_name();
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device %s is disconnected", buf, 0xCu);
  }
  +[PCCBridgeEndpoint identifierForRemoteDevice:](PCCBridgeEndpoint, "identifierForRemoteDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      name = (uint64_t)v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Tearing down connections for disconnected device %@.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "removing registered device", buf, 2u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", 0, v4);
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      name = (uint64_t)v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device %@ disconnected before registration.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        name = (uint64_t)v4;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "canceling remote connection for %@.", buf, 0xCu);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_remote_connection_cancel();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", 0, v4);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(NSObject **)(v18 + 40);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_43;
      v20[3] = &unk_1E954CCD0;
      v20[4] = v18;
      v21 = v4;
      dispatch_async(v19, v20);

    }
    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      name = (uint64_t)v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device %@ disconnected before outgoing connections were set up.", buf, 0xCu);
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_43(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "handleConnection:from:", 0, *(_QWORD *)(a1 + 40));

}

- (id)deviceIds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t name;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_remoteDevices;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v24[0] = CFSTR("uuid");
        v24[1] = CFSTR("nearby");
        v25[0] = v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PCCBridgeEndpoint isDeviceNearby:](self, "isDeviceNearby:", v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:](self, "stashCrashReporterKeyForIdentifier:", v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteCRKeys, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("crashreporter_key"));

        +[PCCBridgeEndpoint remoteDeviceForIdentifier:](PCCBridgeEndpoint, "remoteDeviceForIdentifier:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          name = remote_device_get_name();
          if (name)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", name);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("name"));

          }
        }
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isDeviceNearby:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)synchronize:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB35C8];
  if (v8)
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("No remote device found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = 4;
  }
  else
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("No remote connection to target device");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = 1;
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ProxyBridgeErrorDomain"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

- (void)enterInterruptedStateFrom:(id)a3
{
  id v4;
  NSObject *eventQueue;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_interruptedDevices, "containsObject:", v4) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ is already in interruped state; passing",
        buf,
        0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ is entering interrupted state; disconnecting",
        buf,
        0xCu);
    }
    -[NSMutableSet addObject:](self->_interruptedDevices, "addObject:", v4);
    eventQueue = self->_eventQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke;
    v6[3] = &unk_1E954CCD0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(eventQueue, v6);

  }
}

void __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "handleConnection:from:", 0, *(_QWORD *)(a1 + 40));

}

- (void)exitInterruptedStateFrom:(id)a3
{
  id v4;
  NSObject *eventQueue;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_interruptedDevices, "containsObject:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ is exiting interruped state; reconnecting",
        buf,
        0xCu);
    }
    -[NSMutableSet removeObject:](self->_interruptedDevices, "removeObject:", v4);
    eventQueue = self->_eventQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke;
    v6[3] = &unk_1E954CCD0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(eventQueue, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ is not in interruped state; passing",
      buf,
      0xCu);
  }

}

void __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "handleConnection:from:", 1, *(_QWORD *)(a1 + 40));

}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PCCBridgeEndpoint connectionForIdentifier:](self, "connectionForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ns2xpc();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PCCBridgeEndpoint addSenderToMessage:](PCCBridgeEndpoint, "addSenderToMessage:", v12);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_remote_connection_send_message();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("messageType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sent %@", buf, 0xCu);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("messageType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No connection to %@ on which to send message of type %@", buf, 0x16u);

      }
      if (a5)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x1E0CB35C8];
        if (v16)
        {
          v24 = *MEMORY[0x1E0CB2D50];
          v25 = CFSTR("No remote connection to target device");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v20 = 1;
        }
        else
        {
          v22 = *MEMORY[0x1E0CB2D50];
          v23 = CFSTR("No remote device found");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v20 = 4;
        }
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ProxyBridgeErrorDomain"), v20, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
  }

  return 0;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
    goto LABEL_27;
  }
  -[PCCBridgeEndpoint connectionForIdentifier:](self, "connectionForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v13;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No connection to %@ on which to send file", buf, 0xCu);
    }
    if (a6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB35C8];
      if (v17)
      {
        v41 = *MEMORY[0x1E0CB2D50];
        v42 = CFSTR("No remote connection to target device");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = 1;
      }
      else
      {
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = CFSTR("No remote device found");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = 4;
      }
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ProxyBridgeErrorDomain"), v21, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_27:
    v27 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a6;
  if (OSAIsRSDDisplay())
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("display"), CFSTR("deviceType"));
  v49[0] = CFSTR("messageType");
  v49[1] = CFSTR("fileMetadata");
  v50[0] = CFSTR("<file>");
  v50[1] = v22;
  v35 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ns2xpc();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_retainAutorelease(v11);
  objc_msgSend(v25, "fileSystemRepresentation");
  v26 = v25;
  v36 = v26;
  v27 = v16;
  v37 = v27;
  v28 = v13;
  v38 = v28;
  v29 = (void *)xpc_file_transfer_create_with_path();
  if (v29)
  {
    xpc_dictionary_set_value(v24, "<file_xfer>", v29);
    +[PCCBridgeEndpoint addSenderToMessage:](PCCBridgeEndpoint, "addSenderToMessage:", v24);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v26;
      v47 = 2114;
      v48 = v27;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "sent %{public}@, tracking: %{public}@", buf, 0x16u);
    }
  }
  else
  {

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v26;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to create xpc file xfer object for %{public}@", buf, 0xCu);
    }
    if (v34)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Unable to transfer file");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ProxyBridgeErrorDomain"), 3, v32);
      *v34 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0;
  }

LABEL_28:
  return v27;
}

void __46__PCCBridgeEndpoint_send_file_metadata_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2080;
      v16 = strerror(a2);
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to transfer log file at %@, error: %s", buf, 0x16u);
    }
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(a2), v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ProxyBridgeErrorDomain"), 2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "ack:result:error:", *(_QWORD *)(a1 + 48), 0, v8);

  }
  else
  {
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v10, "ack:result:error:", *(_QWORD *)(a1 + 48), 1, 0);

    objc_msgSend(*(id *)(a1 + 40), "exitInterruptedStateFrom:", *(_QWORD *)(a1 + 56));
  }
}

+ (BOOL)isSupportedRemoteDeviceType:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E9552328, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "addObject:", &unk_1E9552340);
  objc_msgSend(v5, "addObject:", &unk_1E9552358);
  if (OSAIsDebugEnabledForRSD())
  {
    objc_msgSend(v4, "addObject:", &unk_1E9552370);
    objc_msgSend(v5, "addObject:", &unk_1E9552388);
  }
  if (OSAIsRSDHost())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
  }
  else
  {
    if (!OSAIsRSDDevice())
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
  }
  v8 = objc_msgSend(v7, "containsObject:", v6);

LABEL_9:
  return v8;
}

+ (id)remoteDeviceForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Bridge")))
  {
    v4 = (void *)remote_device_copy_unique_of_type();
  }
  else
  {
    v7[0] = 0;
    v7[1] = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
    objc_msgSend(v5, "getUUIDBytes:", v7);
    v4 = (void *)remote_device_copy_device_with_uuid();

  }
  return v4;
}

+ (id)identifierForRemoteDevice:(id)a3
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  const char *v6;
  unsigned __int8 *v7;
  void *v9;
  __int16 v10;
  unsigned __int8 uu[8];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      v4 = 0;
      goto LABEL_11;
    }
    *(_WORD *)uu = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "Remote device was NULL";
    v7 = uu;
LABEL_9:
    _os_log_impl(&dword_1D3A90000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_10;
  }
  if (remote_device_get_type() != 3)
  {
    *(_QWORD *)uu = 0;
    v12 = 0;
    remote_device_copy_uuid();
    if (!uuid_is_null(uu))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
      objc_msgSend(v9, "UUIDString");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v10 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "Got a NULL UUID; remote device may not be connected.";
    v7 = (unsigned __int8 *)&v10;
    goto LABEL_9;
  }
  v4 = CFSTR("Bridge");
LABEL_11:

  return v4;
}

+ (id)UDIDForRemoteDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const char *string_ptr;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint8_t v12[16];
  __int16 v13;
  uint8_t buf[2];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)remote_device_copy_property();
    v5 = v4;
    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "UDID string was not available in property";
        v10 = buf;
        goto LABEL_12;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v8 = MEMORY[0x1E0C81028];
      v9 = "Failed to copy UDID property from remote device.";
      v10 = (uint8_t *)&v13;
LABEL_12:
      _os_log_impl(&dword_1D3A90000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
    v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to fetch UDID: remote device was NULL.", v12, 2u);
  }
  v7 = 0;
LABEL_15:

  return v7;
}

- (id)identifierForTarget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (OSAIsRSDHost())
    {
      v7 = (void *)remote_device_copy_unique_of_type();
      if (!v7)
      {
        v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v26)
          -[PCCBridgeEndpoint identifierForTarget:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
        v6 = 0;
        goto LABEL_18;
      }
      +[PCCBridgeEndpoint identifierForRemoteDevice:](PCCBridgeEndpoint, "identifierForRemoteDevice:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v6 = (id)v8;
LABEL_18:

      goto LABEL_22;
    }
    if (OSAIsRSDDevice())
    {
      v9 = -[NSMutableDictionary count](self->_outgoingConnections, "count");
      if (v9 == 1)
      {
        -[NSMutableDictionary allKeys](self->_outgoingConnections, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (v9)
      {
        v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v34)
          -[PCCBridgeEndpoint identifierForTarget:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      else
      {
        v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v10)
          -[PCCBridgeEndpoint identifierForTarget:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v18)
        -[PCCBridgeEndpoint identifierForTarget:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    v6 = 0;
    goto LABEL_22;
  }
  v6 = v4;
LABEL_22:

  return v6;
}

- (void)setupOutgoingConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *eventQueue;
  _QWORD block[5];
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  PCCBridgeEndpoint *v30;
  id v31;
  const char *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PCCBridgeEndpoint identifierForRemoteDevice:](PCCBridgeEndpoint, "identifierForRemoteDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCCBridgeEndpoint UDIDForRemoteDevice:](PCCBridgeEndpoint, "UDIDForRemoteDevice:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9)
        -[PCCBridgeEndpoint setupOutgoingConnection:].cold.3(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else if (v9)
    {
      -[PCCBridgeEndpoint setupOutgoingConnection:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v5;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Outgoing connection to %@ is already valid", buf, 0xCu);
      }
    }
    else
    {
      if (OSAIsRSDHost())
        v18 = "com.apple.osanalytics.logTransfer";
      else
        v18 = "com.apple.osanalytics.logRelay";
      v19 = (void *)remote_device_copy_service();
      if (v19)
      {
        v20 = (void *)xpc_remote_connection_create_with_remote_service();
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v5;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Registering connection to remote device: %@", buf, 0xCu);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outgoingConnections, "setObject:forKeyedSubscript:", v20, v5);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteDevices, "setObject:forKeyedSubscript:", v7, v5);
          v21 = MEMORY[0x1E0C809B0];
          v26 = MEMORY[0x1E0C809B0];
          v27 = 3221225472;
          v28 = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke;
          v29 = &unk_1E954CD48;
          v32 = v18;
          v30 = self;
          v22 = v5;
          v31 = v22;
          xpc_remote_connection_set_event_handler();
          xpc_remote_connection_activate();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "remote connection active", buf, 2u);
          }
          eventQueue = self->_eventQueue;
          block[0] = v21;
          block[1] = 3221225472;
          block[2] = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_76;
          block[3] = &unk_1E954CCD0;
          block[4] = self;
          v25 = v22;
          dispatch_async(eventQueue, block);

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[PCCBridgeEndpoint setupOutgoingConnection:].cold.2();
        }

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint setupOutgoingConnection:].cold.1();
      }

    }
  }

}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  uint64_t v12;
  const char *string;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 != (id)MEMORY[0x1E0C81258])
  {
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v8 = *(_QWORD *)(a1 + 48);
      v14 = 136315138;
      v15 = v8;
      v9 = MEMORY[0x1E0C81028];
      v10 = "Got XPC_ERROR_CONNECTION_INVALID from %s\n";
      v11 = 12;
    }
    else
    {
      if (MEMORY[0x1D8250F70](v3) != MEMORY[0x1E0C81310])
      {
        v5 = (char *)MEMORY[0x1D8250EE0](v4);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 48);
          v14 = 136315394;
          v15 = v6;
          v16 = 2080;
          v17 = v5;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got unexpected xpc message from %s: %s\n", (uint8_t *)&v14, 0x16u);
        }
        if (v5)
          free(v5);
        goto LABEL_16;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v12 = *(_QWORD *)(a1 + 48);
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      v14 = 136315394;
      v15 = v12;
      v16 = 2080;
      v17 = string;
      v9 = MEMORY[0x1E0C81028];
      v10 = "Got xpc error message from %s: %s\n";
      v11 = 22;
    }
    _os_log_impl(&dword_1D3A90000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v11);
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v14 = 136315138;
    v15 = v7;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got XPC_ERROR_CONNECTION_INTERRUPTED from %s\n", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "enterInterruptedStateFrom:", *(_QWORD *)(a1 + 40));
LABEL_16:

}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_76(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "handleConnection:from:", 1, *(_QWORD *)(a1 + 40));

}

- (id)connectionForIdentifier:(id)a3
{
  id v4;
  NSObject *initializationQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  PCCBridgeEndpoint *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  initializationQueue = self->_initializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke;
  block[3] = &unk_1E954CD70;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(initializationQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKeyedSubscript:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      +[PCCBridgeEndpoint remoteDeviceForIdentifier:](PCCBridgeEndpoint, "remoteDeviceForIdentifier:", *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        objc_msgSend(*(id *)(a1 + 40), "setupOutgoingConnection:", v3);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

+ (void)addSenderToMessage:(id)a3
{
  id v3;
  const char *v4;
  xpc_object_t xdict;

  xdict = a3;
  v3 = objc_retainAutorelease((id)MGCopyAnswer());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  xpc_dictionary_set_string(xdict, "kOSASender", v4);
}

- (void)stashCrashReporterKeyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  xpc_object_t empty;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteCRKeys, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[PCCBridgeEndpoint remoteDeviceForIdentifier:](PCCBridgeEndpoint, "remoteDeviceForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && remote_device_get_type() == 3)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteCRKeys, "setObject:forKeyedSubscript:", CFSTR("Bridge"), v4);
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = dispatch_semaphore_create(0);
        empty = xpc_dictionary_create_empty();
        xpc_dictionary_set_string(empty, (const char *)objc_msgSend(CFSTR("messageType"), "UTF8String"), "kOSAFetchCrashReporterKey");
        +[PCCBridgeEndpoint addSenderToMessage:](PCCBridgeEndpoint, "addSenderToMessage:", empty);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v4;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sending request to stash crash reporter key for %@", buf, 0xCu);
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v4;
        v11 = v8;
        xpc_remote_connection_send_message_with_reply();

        v12 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v11, v12) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:].cold.2();

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:].cold.1();
      }
    }

  }
}

intptr_t __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *string;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  if (MEMORY[0x1D8250F70]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v3, "crashReporterKey");

    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1D8250EE0](v3);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2();
      if (!v4)
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      goto LABEL_4;
    }
    if (v4)
LABEL_4:
      free(v4);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptedDevices, 0);
  objc_storeStrong((id *)&self->_listeningConnection, 0);
  objc_storeStrong((id *)&self->_outgoingConnections, 0);
  objc_storeStrong((id *)&self->_remoteCRKeys, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong((id *)&self->_initializationQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_device_browser, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Not setting up endpoint for unsupported device.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "%s '%s'", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "received message '%@'", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = a1;
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unexpected metadata from RemoteXPC: '%@'\nOriginal xpc message %s", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3A90000, MEMORY[0x1E0C81028], v2, "received file '%@'", v3, v4, v5, v6, v7);

}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Failed to find UUID from disconnected device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)synchronize:withOptions:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Identifier not available for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)identifierForTarget:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Unable to fetch identifier from remote bridge.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)identifierForTarget:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "RSD device unexpectedly has more than one outgoing connection: need to specify a target.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)identifierForTarget:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "No identifier for %@ because there are no outgoing connections.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)identifierForTarget:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Cannot find identifier: local system is neither an RSD device nor host.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setupOutgoingConnection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Failed to copy remote service %s of connected device", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupOutgoingConnection:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Failed to connect to remote service %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Set up failed: remote UDID was unavailable.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Set up failed: RSD UUID was unavailable.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Missing identifier with which to fetch remote connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)stashCrashReporterKeyForIdentifier:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Failed to fetch CR key due to no outgoing connection for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)stashCrashReporterKeyForIdentifier:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Timed out waiting for remote device CR key.", v0, 2u);
  OUTLINED_FUNCTION_2();
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Crash reporter key was not available in reply from %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1D3A90000, MEMORY[0x1E0C81028], v0, "Received unexpected reply message from %@: %s", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

@end
