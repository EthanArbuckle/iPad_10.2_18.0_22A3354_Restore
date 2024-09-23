@implementation SFBonjourEndpoint

- (SFBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  SFBonjourEndpoint *v14;
  SFBonjourEndpoint *v15;
  nw_endpoint_t v16;
  OS_nw_endpoint *remoteEndpoint;
  NSMutableSet *v18;
  NSMutableSet *remoteAdvDataSet;
  SFBonjourEndpoint *v20;
  NSObject *v21;
  const char *v22;
  __int16 v24[8];
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SFBonjourEndpoint;
  v14 = -[SFBonjourEndpoint init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v12 && v11 && v13)
    {
      objc_storeStrong((id *)&v14->_queue, a6);
      objc_storeStrong((id *)&v15->_connection, a3);
      v16 = nw_connection_copy_endpoint((nw_connection_t)v15->_connection);
      remoteEndpoint = v15->_remoteEndpoint;
      v15->_remoteEndpoint = (OS_nw_endpoint *)v16;

      if (v15->_remoteEndpoint)
      {
        v15->_isAdvToBrowserConnection = a4;
        objc_storeStrong((id *)&v15->_localUniqueIDString, a5);
        -[SFBonjourEndpoint _startConnection](v15, "_startConnection");
        if (!v15->_isAdvToBrowserConnection)
        {
          v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          remoteAdvDataSet = v15->_remoteAdvDataSet;
          v15->_remoteAdvDataSet = v18;

        }
        goto LABEL_8;
      }
      daemon_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "Invalid remoteEndpoint ";
        goto LABEL_13;
      }
    }
    else
    {
      daemon_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "Invalid arguments to SFBonjourEndpoint";
LABEL_13:
        _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
      }
    }

    v20 = 0;
    goto LABEL_15;
  }
LABEL_8:
  v20 = v15;
LABEL_15:

  return v20;
}

- (void)_startConnection
{
  NSObject *v3;
  OS_nw_connection *connection;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int, void *);
  void *v9;
  SFBonjourEndpoint *v10;
  __int128 *p_buf;
  id v12;
  id location;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  daemon_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = connection;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Started connecting to %@", (uint8_t *)&buf, 0xCu);
  }

  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_queue);
  location = 0;
  objc_initWeak(&location, self);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v5 = self->_connection;
  v8 = __37__SFBonjourEndpoint__startConnection__block_invoke;
  v9 = &unk_1E4833F28;
  v7 = 3221225472;
  objc_copyWeak(&v12, &location);
  v10 = self;
  p_buf = &buf;
  nw_connection_set_state_changed_handler(v5, &v6);
  -[SFBonjourEndpoint _handleUUIDHeaders](self, "_handleUUIDHeaders", v6, v7, v8, v9);
  nw_connection_start((nw_connection_t)self->_connection);
  objc_destroyWeak(&v12);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void __37__SFBonjourEndpoint__startConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int error_code;
  NSObject *v12;
  const char *hostname;
  int port;
  int v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(void);
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  int v27;
  void *v28;
  NSObject *v29;
  CFErrorRef v30;
  NSObject *v31;
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  _BYTE v39[20];
  _DWORD v40[4];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = nw_connection_copy_endpoint(v9);

    if (v6)
      error_code = nw_error_get_error_code(v6);
    else
      error_code = 0;
    *__error() = error_code;
    daemon_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      hostname = nw_endpoint_get_hostname(v10);
      port = nw_endpoint_get_port(v10);
      v15 = *__error();
      v38 = 67109890;
      *(_DWORD *)v39 = a2;
      *(_WORD *)&v39[4] = 2080;
      *(_QWORD *)&v39[6] = hostname;
      *(_WORD *)&v39[14] = 1024;
      *(_DWORD *)&v39[16] = port;
      LOWORD(v40[0]) = 1024;
      *(_DWORD *)((char *)v40 + 2) = v15;
      _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "Connection state changed to %d (host %s port %u error %d)", (uint8_t *)&v38, 0x1Eu);
    }

    switch(a2)
    {
      case 5:
        daemon_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *((_QWORD *)v8 + 6);
          v26 = nw_endpoint_get_hostname(v10);
          v27 = nw_endpoint_get_port(v10);
          v38 = 138412802;
          *(_QWORD *)v39 = v25;
          *(_WORD *)&v39[8] = 2080;
          *(_QWORD *)&v39[10] = v26;
          *(_WORD *)&v39[18] = 1024;
          v40[0] = v27;
          _os_log_impl(&dword_1A2830000, v24, OS_LOG_TYPE_DEFAULT, "Connection (%@) to %s port %u cancelled", (uint8_t *)&v38, 0x1Cu);
        }

        objc_msgSend(v8, "didDisconnectHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          if (v29)
            v30 = nw_error_copy_cf_error(v29);
          else
            v30 = 0;
          objc_msgSend(v8, "didDisconnectHandler");
          v33 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, CFErrorRef))v33)[2](v33, v30);

        }
        v34 = (void *)*((_QWORD *)v8 + 6);
        *((_QWORD *)v8 + 6) = 0;

        v35 = (void *)*((_QWORD *)v8 + 5);
        *((_QWORD *)v8 + 5) = 0;

        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = 0;

        break;
      case 4:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
        objc_msgSend(v8, "connection");
        v31 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v31);

        break;
      case 3:
        daemon_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *((_QWORD *)v8 + 6);
          v18 = nw_endpoint_get_hostname(v10);
          v19 = nw_endpoint_get_port(v10);
          v38 = 138412802;
          *(_QWORD *)v39 = v17;
          *(_WORD *)&v39[8] = 2080;
          *(_QWORD *)&v39[10] = v18;
          *(_WORD *)&v39[18] = 1024;
          v40[0] = v19;
          _os_log_impl(&dword_1A2830000, v16, OS_LOG_TYPE_DEFAULT, "Connection (%@) to %s port %u succeeded! begin receiving messages", (uint8_t *)&v38, 0x1Cu);
        }

        if ((objc_msgSend(v8, "isAdvToBrowserConnection") & 1) == 0)
        {
          objc_msgSend(v8, "_getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), objc_msgSend(*(id *)(a1 + 32), "isAdvToBrowserConnection"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setRemoteUniqueIDString:", v20);

        }
        objc_msgSend(v8, "remoteUniqueIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v8, "didConnectHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v8, "didConnectHandler");
            v23 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v23[2]();

          }
          objc_msgSend(v8, "receiveNextMessage");
        }
        else
        {
          daemon_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            __37__SFBonjourEndpoint__startConnection__block_invoke_cold_1();

          nw_connection_cancel(*((nw_connection_t *)v8 + 6));
        }
        break;
    }

  }
}

- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD enumerator[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__16;
    v20 = __Block_byref_object_dispose__16;
    v21 = 0;
    v8 = nw_protocol_copy_ws_definition();
    v9 = nw_connection_copy_protocol_metadata(v6, v8);

    v10 = nw_ws_metadata_copy_server_response(v9);
    v11 = v10;
    if (v10)
    {
      enumerator[0] = MEMORY[0x1E0C809B0];
      enumerator[1] = 3221225472;
      enumerator[2] = __89__SFBonjourEndpoint__getServerRemoteUUIDFromConnectionMetadata_isAdvToBrowserConnection___block_invoke;
      enumerator[3] = &unk_1E4833F50;
      enumerator[4] = &v16;
      nw_ws_response_enumerate_additional_headers(v10, enumerator);
    }
    v12 = (void *)v17[5];
    if (!v12)
    {
      daemon_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SFBonjourEndpoint _getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:].cold.1();

      v12 = (void *)v17[5];
    }
    v7 = v12;

    _Block_object_dispose(&v16, 8);
  }

  return v7;
}

uint64_t __89__SFBonjourEndpoint__getServerRemoteUUIDFromConnectionMetadata_isAdvToBrowserConnection___block_invoke(uint64_t a1, char *__s1, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!strcmp(__s1, "SFBonjourEndpointServerUUIDHeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return 1;
}

- (void)_handleUUIDHeaders
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "WebSocket protocol not found in connection parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke(uint64_t a1, void *a2)
{
  nw_protocol_definition_t v4;
  nw_protocol_definition_t v5;
  int v6;
  NSObject *options;

  options = a2;
  v4 = nw_protocol_copy_ws_definition();
  v5 = nw_protocol_options_copy_definition(options);
  v6 = MEMORY[0x1A8588CF8](v4, v5);

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

NSObject *__39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_85(uint64_t a1, void *a2)
{
  NSObject *v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  _QWORD enumerator[5];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    enumerator[0] = MEMORY[0x1E0C809B0];
    enumerator[1] = 3221225472;
    enumerator[2] = __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_2;
    enumerator[3] = &unk_1E4833FA0;
    enumerator[4] = WeakRetained;
    nw_ws_request_enumerate_additional_headers(v3, enumerator);
    v6 = nw_ws_response_create(nw_ws_response_status_accept, 0);
    nw_ws_response_add_additional_header(v6, "SFBonjourEndpointServerUUIDHeader", (const char *)objc_msgSend(v5[7], "UTF8String"));
  }
  else
  {
    v6 = nw_ws_response_create(nw_ws_response_status_reject, 0);
  }

  return v6;
}

uint64_t __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_2(uint64_t a1, char *__s1, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!strcmp(__s1, "SFBonjourEndpointClientUUIDHeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v5;

  }
  return 1;
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "cancel called on nil connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)receiveNextMessage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "receiveNextMessage called on nil connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__SFBonjourEndpoint_receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  nw_connection_t *WeakRetained;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  nw_connection_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  int v18;
  nw_connection_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = (nw_connection_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "receiveNextMessage data %@ error:%@", (uint8_t *)&v18, 0x16u);
    }

    v13 = v8;
    if (v9 && nw_content_context_get_is_final(v9))
    {
      daemon_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = WeakRetained[6];
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "receiveNextMessage got connection closed %@", (uint8_t *)&v18, 0xCu);
      }

      nw_connection_cancel(WeakRetained[6]);
    }
    else if (!v10)
    {
      -[nw_connection_t didReceiveDataHandler](WeakRetained, "didReceiveDataHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && v16)
      {
        -[nw_connection_t didReceiveDataHandler](WeakRetained, "didReceiveDataHandler");
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NSObject *))v17)[2](v17, v13);

      }
      -[nw_connection_t receiveNextMessage](WeakRetained, "receiveNextMessage");
    }

  }
}

- (void)sendDataMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *metadata;
  NSObject *v11;
  NSObject *connection;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD completion[4];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = dispatch_data_create((const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 0, 0);
    metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
    v11 = nw_content_context_create("send");
    nw_content_context_set_metadata_for_protocol(v11, metadata);
    connection = self->_connection;
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __48__SFBonjourEndpoint_sendDataMessage_completion___block_invoke;
    completion[3] = &unk_1E4834018;
    v17 = v8;
    v18 = v7;
    nw_connection_send(connection, v9, v11, 1, completion);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2F90];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("Unable to send message, nil connection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -6700, v15);
    v9 = objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, NSObject *))v7 + 2))(v7, v9);
    goto LABEL_5;
  }
LABEL_6:

}

void __48__SFBonjourEndpoint_sendDataMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  CFErrorRef v7;
  int v8;
  NSObject *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  daemon_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "length");
    v8 = 138412546;
    v9 = v3;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "nw_connection_send completed with error: %@, bytes :%lu", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v3)
    {
      v7 = nw_error_copy_cf_error(v3);
      v6 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(uint64_t, CFErrorRef))(v6 + 16))(v6, v7);

  }
}

+ (id)createConnectionParameters
{
  NSObject *secure_tcp;
  NSObject *v3;
  NSObject *options;
  NSObject *v5;
  NSObject *v6;

  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], &__block_literal_global_65);
  v3 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  options = nw_ws_create_options(nw_ws_version_13);
  nw_ws_options_set_auto_reply_ping(options, 1);
  nw_protocol_stack_prepend_application_protocol(v3, options);
  v5 = nw_interface_create_with_name();
  nw_parameters_require_interface(secure_tcp, v5);

  v6 = nw_interface_create_with_name();
  nw_parameters_prohibit_interface(secure_tcp, v6);

  return secure_tcp;
}

void __47__SFBonjourEndpoint_createConnectionParameters__block_invoke(uint64_t a1, void *a2)
{
  NSObject *options;

  options = a2;
  nw_tcp_options_set_enable_keepalive(options, 1);
  nw_tcp_options_set_keepalive_idle_time(options, 2u);
  nw_tcp_options_set_no_delay(options, 1);
  nw_tcp_options_set_enable_fast_open(options, 1);

}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didDisconnectHandler
{
  return self->_didDisconnectHandler;
}

- (void)setDidDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didReceiveDataHandler
{
  return self->_didReceiveDataHandler;
}

- (void)setDidReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_nw_endpoint)remoteEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 40, 1);
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isAdvToBrowserConnection
{
  return self->_isAdvToBrowserConnection;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)localUniqueIDString
{
  return self->_localUniqueIDString;
}

- (void)setLocalUniqueIDString:(id)a3
{
  objc_storeStrong((id *)&self->_localUniqueIDString, a3);
}

- (NSString)remoteUniqueIDString
{
  return self->_remoteUniqueIDString;
}

- (void)setRemoteUniqueIDString:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUniqueIDString, a3);
}

- (NSMutableSet)remoteAdvDataSet
{
  return self->_remoteAdvDataSet;
}

- (void)setRemoteAdvDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAdvDataSet, a3);
}

- (BOOL)initiatedConnection
{
  return self->_initiatedConnection;
}

- (void)setInitiatedConnection:(BOOL)a3
{
  self->_initiatedConnection = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteAdvDataSet, 0);
  objc_storeStrong((id *)&self->_remoteUniqueIDString, 0);
  objc_storeStrong((id *)&self->_localUniqueIDString, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong(&self->_didReceiveDataHandler, 0);
  objc_storeStrong(&self->_didDisconnectHandler, 0);
  objc_storeStrong(&self->_didConnectHandler, 0);
}

void __37__SFBonjourEndpoint__startConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "No remote UUID found, cancelling connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "No Server UUID header found in WS response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
