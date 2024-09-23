@implementation NetworkQualityHTTPServer

- (NetworkQualityHTTPServer)initWithLaunchd
{
  NetworkQualityHTTPServer *result;

  result = -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", 0, 1, 4, 1);
  if (result)
    result->launchdInvoked = 1;
  return result;
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3
{
  return -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", *(_QWORD *)&a3, 1, 4, 1);
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 enableHTTP3:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 5;
  else
    v4 = 4;
  return -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", *(_QWORD *)&a3, 1, v4, 1);
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 tlsEnabled:(BOOL)a4 httpVersion:(int)a5 bonjourEnabled:(BOOL)a6
{
  NetworkQualityHTTPServer *v10;
  unsigned int v11;
  dispatch_data_t v12;
  OS_dispatch_data *small_response_data;
  void *v14;
  dispatch_data_t v15;
  OS_dispatch_data *large_response_data;
  NetworkQualityHTTPServer *v17;
  CFArrayRef v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NetworkQualityHTTPServer;
  v10 = -[NetworkQualityHTTPServer init](&v20, sel_init);
  if (!v10)
    goto LABEL_7;
  v11 = +[NetworkQualityServerConfiguration defaultIdleTimeout](NetworkQualityServerConfiguration, "defaultIdleTimeout");
  v10->port = a3;
  v10->idleTimeoutSeconds = v11;
  v10->hasStarted = 0;
  v10->tlsEnabled = a4;
  v10->bonjourEnabled = a6;
  v10->httpVersion = a5;
  v12 = dispatch_data_create("X", 1uLL, 0, 0);
  small_response_data = v10->small_response_data;
  v10->small_response_data = (OS_dispatch_data *)v12;

  v14 = malloc_type_malloc(0x100000uLL, 0x7A54704CuLL);
  memset(v14, 88, 0x100000uLL);
  v15 = dispatch_data_create(v14, 0x100000uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  large_response_data = v10->large_response_data;
  v10->large_response_data = (OS_dispatch_data *)v15;

  v19 = 0;
  if (!CreateSelfSignedIdentity(CFSTR("networkquality"), (void **)&v10->sec_identity, &v19))
  {

LABEL_7:
    v17 = v10;
    goto LABEL_8;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:].cold.1();

  v17 = 0;
LABEL_8:

  return v17;
}

- (NetworkQualityHTTPServer)initWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  NetworkQualityHTTPServer *v6;

  v4 = a3;
  if (objc_msgSend(v4, "httpProtocol") == 1)
    v5 = 5;
  else
    v5 = 4;
  v6 = -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", objc_msgSend(v4, "listenPort"), objc_msgSend(v4, "tlsEnabled"), v5, objc_msgSend(v4, "bonjourEnabled"));
  if (v6)
  {
    v6->idleTimeoutSeconds = objc_msgSend(v4, "idleTimeoutSeconds");
    v6->mirrorIP = objc_msgSend(v4, "mirrorServerIP");
  }

  return v6;
}

- (NetworkQualityHTTPServer)init
{
  return -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", 0, 1, 4, 1);
}

- (void)setCommmonParameters:(id)a3
{
  NSObject *parameters;

  parameters = a3;
  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();
  nw_parameters_set_reuse_local_address(parameters, 1);
  nw_parameters_set_receive_any_interface();

}

- (id)HTTP2ParametersForServer
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *options;
  NSObject *secure_tcp;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v3 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke;
  v13[3] = &unk_24C976860;
  v13[4] = self;
  v4 = (void *)MEMORY[0x212BC1F98](v13, a2);
  v5 = (void *)MEMORY[0x212BC1F98](*MEMORY[0x24BDE0880]);
  if (self->tlsEnabled)
  {
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke_2;
    v11[3] = &unk_24C976888;
    v12 = v4;
    v6 = MEMORY[0x212BC1F98](v11);

    v5 = (void *)v6;
  }
  options = nw_http_messaging_create_options();
  nw_http2_set_idle_timeout();
  secure_tcp = nw_parameters_create_secure_tcp(v5, (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
  -[NetworkQualityHTTPServer setCommmonParameters:](self, "setCommmonParameters:", secure_tcp);
  v9 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  nw_protocol_stack_prepend_application_protocol(v9, options);
  nw_parameters_set_prohibit_joining_protocols();
  nw_parameters_set_attach_protocol_listener();

  return secure_tcp;
}

void __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  const char *v4;
  NSObject *options;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) - 3;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_24C9769C0[v3];
  options = a2;
  sec_protocol_options_add_tls_application_protocol(options, v4);
  sec_protocol_options_set_peer_authentication_required(options, 0);
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(*(_QWORD *)(a1 + 32) + 64));
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);

}

void __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke_2(uint64_t a1, id a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)HTTP3ParametersForServer
{
  uint64_t v3;
  void *v4;
  NSObject *options;
  id v6;
  NSObject *quic_stream;
  NSObject *v8;
  void *v10;
  _QWORD v11[5];

  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke;
  v11[3] = &unk_24C976860;
  v11[4] = self;
  v4 = (void *)MEMORY[0x212BC1F98](v11, a2);
  options = nw_http_messaging_create_options();
  nw_http3_set_idle_timeout();
  v10 = v4;
  v6 = v4;
  quic_stream = nw_parameters_create_quic_stream();
  -[NetworkQualityHTTPServer setCommmonParameters:](self, "setCommmonParameters:", quic_stream, v3, 3221225472, __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke_2, &unk_24C976888);
  v8 = nw_parameters_copy_default_protocol_stack(quic_stream);
  nw_protocol_stack_prepend_application_protocol(v8, options);
  nw_parameters_set_prohibit_joining_protocols();
  nw_parameters_set_attach_protocol_listener();

  return quic_stream;
}

void __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  const char *v4;
  NSObject *options;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) - 3;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_24C9769C0[v3];
  options = a2;
  sec_protocol_options_add_tls_application_protocol(options, v4);
  sec_protocol_options_set_peer_authentication_required(options, 0);
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(*(_QWORD *)(a1 + 32) + 64));
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);

}

void __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)nw_quic_connection_copy_sec_protocol_options();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)start:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  NSObject *v8;
  OS_nw_listener *v9;
  OS_nw_listener *listener;
  OS_nw_listener *v11;
  OS_nw_listener *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *bonjour_service;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSString *name;
  id *p_name;
  NSObject *v22;
  NSString *v23;
  _BOOL4 bonjourEnabled;
  CFStringRef v25;
  CFStringRef v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  NSString *v32;
  void *v33;
  void *v34;
  unsigned int port;
  unsigned int v36;
  NSString *v37;
  NSObject *v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  _QWORD v42[5];
  _QWORD handler[5];
  NSObject *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  NSString *v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (OS_dispatch_queue *)dispatch_queue_create("networkQuality", MEMORY[0x24BDAC9C0]);
  queue = self->queue;
  self->queue = v5;

  if (self->httpVersion == 5)
    -[NetworkQualityHTTPServer HTTP3ParametersForServer](self, "HTTP3ParametersForServer");
  else
    -[NetworkQualityHTTPServer HTTP2ParametersForServer](self, "HTTP2ParametersForServer");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->launchdInvoked)
  {
    v9 = (OS_nw_listener *)nw_listener_create_with_launchd_key();
LABEL_6:
    listener = self->listener;
    self->listener = v9;
    goto LABEL_9;
  }
  if (!self->port)
  {
    v9 = (OS_nw_listener *)nw_listener_create(v7);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), self->port);
  listener = (OS_nw_listener *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (OS_nw_listener *)nw_listener_create_with_port((const char *)-[OS_nw_listener UTF8String](listener, "UTF8String"), v8);
  v12 = self->listener;
  self->listener = v11;

LABEL_9:
  if (self->listener)
  {
    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    if (self->bonjourEnabled)
    {
      bonjour_service = nw_advertise_descriptor_create_bonjour_service(0, "_nq._tcp", "local");
      nw_listener_set_advertise_descriptor((nw_listener_t)self->listener, bonjour_service);
      dispatch_group_enter(v13);
      v16 = self->listener;
      handler[0] = v14;
      handler[1] = 3221225472;
      handler[2] = __34__NetworkQualityHTTPServer_start___block_invoke;
      handler[3] = &unk_24C9768B0;
      handler[4] = self;
      v44 = v13;
      nw_listener_set_advertised_endpoint_changed_handler(v16, handler);

    }
    v17 = self->listener;
    v42[0] = v14;
    v42[1] = 3221225472;
    v42[2] = __34__NetworkQualityHTTPServer_start___block_invoke_18;
    v42[3] = &unk_24C976900;
    v42[4] = self;
    nw_listener_set_new_connection_handler(v17, v42);
    dispatch_group_enter(v13);
    v18 = self->listener;
    v40[0] = v14;
    v40[1] = 3221225472;
    v40[2] = __34__NetworkQualityHTTPServer_start___block_invoke_3;
    v40[3] = &unk_24C9768D8;
    v19 = v13;
    v41 = v19;
    nw_listener_set_state_changed_handler(v18, v40);
    nw_listener_set_queue((nw_listener_t)self->listener, (dispatch_queue_t)self->queue);
    nw_listener_start((nw_listener_t)self->listener);
    if (!self->launchdInvoked)
      dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    p_name = (id *)&self->name;
    name = self->name;
    self->name = (NSString *)CFSTR("localhost");

    netqual_log_init();
    v22 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
    {
      v23 = self->name;
      bonjourEnabled = self->bonjourEnabled;
      *(_DWORD *)buf = 136315906;
      v46 = "-[NetworkQualityHTTPServer start:]";
      v47 = 1024;
      v48 = 262;
      v49 = 2112;
      v50 = v23;
      v51 = 1024;
      v52 = bonjourEnabled;
      _os_log_impl(&dword_20E622000, v22, OS_LOG_TYPE_INFO, "%s:%u - Default servername=%@ bonjourEnabled=%d", buf, 0x22u);
    }
    if (self->bonjourEnabled)
    {
      v25 = SCDynamicStoreCopyLocalHostName(0);
      if (v25)
      {
        v26 = v25;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v25);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *p_name;
        *p_name = (id)v27;

        CFRelease(v26);
        if ((objc_msgSend(*p_name, "hasSuffix:", CFSTR(".local")) & 1) == 0)
        {
          objc_msgSend(*p_name, "stringByAppendingString:", CFSTR(".local"));
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *p_name;
          *p_name = (id)v29;

        }
        netqual_log_init();
        v31 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
        {
          v32 = (NSString *)*p_name;
          *(_DWORD *)buf = 136315650;
          v46 = "-[NetworkQualityHTTPServer start:]";
          v47 = 1024;
          v48 = 273;
          v49 = 2112;
          v50 = v32;
          _os_log_impl(&dword_20E622000, v31, OS_LOG_TYPE_INFO, "%s:%u - New servername=%@", buf, 0x1Cu);
        }
      }
      else
      {
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
          -[NetworkQualityHTTPServer start:].cold.2();
      }
    }
    port = nw_listener_get_port((nw_listener_t)self->listener);
    if (self->launchdInvoked)
      v36 = 56666;
    else
      v36 = port;
    self->port = v36;
    -[NetworkQualityHTTPServer urlForType:withAddress:mirrorIP:](self, "urlForType:withAddress:mirrorIP:", CFSTR(".well-known/nq"), self->name, 0);
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    netqual_log_init();
    v38 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v46 = "-[NetworkQualityHTTPServer start:]";
      v47 = 1024;
      v48 = 286;
      v49 = 2112;
      v50 = v37;
      _os_log_impl(&dword_20E622000, v38, OS_LOG_TYPE_INFO, "%s:%u - Available for server @ %@", buf, 0x1Cu);
    }
    -[NetworkQualityHTTPServer urlForType:withAddress:mirrorIP:](self, "urlForType:withAddress:mirrorIP:", CFSTR(".well-known/nq"), self->name, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v39, 0);

  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[NetworkQualityHTTPServer start:].cold.1();
    v33 = (void *)MEMORY[0x24BDD1540];
    v53 = *MEMORY[0x24BDD0FC8];
    v54[0] = CFSTR("Could not create listener for server");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1007, v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v34);

  }
}

void __34__NetworkQualityHTTPServer_start___block_invoke(uint64_t a1, nw_endpoint_t endpoint, int a3)
{
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_endpoint_get_bonjour_service_name(endpoint));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  netqual_log_init();
  v6 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v10 = "-[NetworkQualityHTTPServer start:]_block_invoke";
    v7 = "removed";
    v11 = 1024;
    v12 = 223;
    v9 = 136316674;
    v13 = 2080;
    if (a3)
      v7 = "added";
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v5;
    v19 = 2080;
    v20 = "_nq._tcp";
    v21 = 2080;
    v22 = "local";
    _os_log_impl(&dword_20E622000, v6, OS_LOG_TYPE_INFO, "%s:%u - Listener %s on %@ (%@.%s.%s)\n", (uint8_t *)&v9, 0x44u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 16))
  {
    *(_BYTE *)(v8 + 16) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __34__NetworkQualityHTTPServer_start___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __34__NetworkQualityHTTPServer_start___block_invoke_2;
  handler[3] = &unk_24C9768D8;
  v6 = v3;
  v4 = v3;
  nw_connection_set_state_changed_handler(v4, handler);
  nw_connection_set_queue(v4, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 32), "receiveLoop:", v4);
  nw_connection_start(v4);

}

void __34__NetworkQualityHTTPServer_start___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 4)
    nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
}

void __34__NetworkQualityHTTPServer_start___block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 2)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)stop
{
  OS_nw_listener *listener;

  nw_listener_cancel((nw_listener_t)self->listener);
  listener = self->listener;
  self->listener = 0;

}

- (void)mirrorIP:(BOOL)a3
{
  self->mirrorIP = a3;
}

- (void)receiveLoop:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke;
  v6[3] = &unk_24C9769A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  nw_connection_receive(v5, 0, 0xFFFFFFFF, v6);

}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  nw_connection_t *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  NSObject *v18;
  nw_protocol_metadata_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  char v23;
  NSObject *v24;
  size_t size;
  NSObject *v26;
  NSObject *metadata_for_response;
  BodyWriter *v28;
  NSObject *v29;
  void *v30;
  void *well_known;
  nw_protocol_metadata_t v32;
  _QWORD completion[4];
  BodyWriter *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  id v50;
  char v51;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_2;
  v47[3] = &unk_24C976928;
  v51 = a4;
  v13 = v11;
  v15 = (nw_connection_t *)(a1 + 40);
  v14 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v48 = v13;
  v49 = v16;
  v50 = v14;
  v17 = (void (**)(_QWORD))MEMORY[0x212BC1F98](v47);
  if (!v13)
  {
    v18 = nw_protocol_copy_http_definition();
    v19 = nw_content_context_copy_protocol_metadata(v10, v18);

    v32 = v19;
    if (!v19)
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_1();
      nw_connection_cancel(*v15);
      goto LABEL_35;
    }
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    v45 = __Block_byref_object_dispose__1;
    v46 = 0;
    v36 = v12;
    v37 = 3221225472;
    v38 = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_28;
    v39 = &unk_24C976950;
    v40 = &v41;
    v30 = (void *)nw_http_metadata_copy_request();
    nw_http_request_access_path();
    if (!v42[5])
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_2();
      goto LABEL_34;
    }
    well_known = (void *)nw_http_response_create_well_known();
    v20 = (void *)v42[5];
    if (!v20)
      goto LABEL_23;
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("/small")))
    {
      nw_http_fields_append();
      v21 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    }
    else
    {
      if (objc_msgSend((id)v42[5], "isEqualToString:", CFSTR("/large")))
      {
        nw_http_fields_append();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zu"), 0x300000000);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v22, "UTF8String");
        nw_http_fields_append();
        v23 = 1;
        goto LABEL_26;
      }
      if ((objc_msgSend((id)v42[5], "isEqualToString:", CFSTR("/")) & 1) == 0
        && (objc_msgSend((id)v42[5], "isEqualToString:", CFSTR("/config")) & 1) == 0
        && !objc_msgSend((id)v42[5], "isEqualToString:", CFSTR("/.well-known/nq")))
      {
        if (!objc_msgSend((id)v42[5], "isEqualToString:", CFSTR("/slurp")))
        {
          netqual_log_init();
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
            __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_3();
          goto LABEL_23;
        }
        if (v9)
          dispatch_data_get_size(v9);
        v24 = *(id *)(*(_QWORD *)(a1 + 32) + 40);

        nw_http_fields_append();
LABEL_22:
        v9 = v24;
LABEL_23:
        if (!v9 || (size = dispatch_data_get_size(v9)) == 0)
        {
          v23 = 0;
          if (!a4)
            goto LABEL_27;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zu"), size);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v22, "UTF8String");
        nw_http_fields_append();
        v23 = 0;
LABEL_26:

        if (!a4)
        {
LABEL_27:
          v17[2](v17);
LABEL_33:

LABEL_34:
          _Block_object_dispose(&v41, 8);

LABEL_35:
          goto LABEL_36;
        }
LABEL_29:
        nw_http_response_set_status_code();
        v26 = nw_content_context_create("response");
        metadata_for_response = nw_http_create_metadata_for_response();
        nw_content_context_set_metadata_for_protocol(v26, metadata_for_response);

        if ((v23 & 1) != 0)
        {
          v28 = objc_alloc_init(BodyWriter);
          -[BodyWriter setConnection:](v28, "setConnection:", *v15);
          -[BodyWriter setPostData:](v28, "setPostData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
          -[BodyWriter setBytesLeftToPost:](v28, "setBytesLeftToPost:", 0x300000000);
          -[BodyWriter sendBodyDataWithContext:](v28, "sendBodyDataWithContext:", v26);
        }
        else
        {
          v29 = *v15;
          completion[0] = v12;
          completion[1] = 3221225472;
          completion[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_50;
          completion[3] = &unk_24C976978;
          v34 = well_known;
          v35 = *v15;
          nw_connection_send(v29, v9, v26, 1, completion);

          v28 = v34;
        }

        goto LABEL_33;
      }
      nw_http_fields_append();
      objc_msgSend(*(id *)(a1 + 32), "configForConnection:mirrorIP:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 20));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v24 = v21;

    goto LABEL_22;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_4();
LABEL_36:

}

uint64_t __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 56) && !*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "receiveLoop:", *(_QWORD *)(result + 48));
  return result;
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_50(uint64_t a1)
{
  if (nw_http_response_get_status_code() >= 0x190)
    nw_connection_cancel(*(nw_connection_t *)(a1 + 40));
}

- (id)urlFormatAddress:(id)a3
{
  NSObject *v3;
  const sockaddr *address;
  char *v5;
  unsigned int port;
  int sa_family;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = a3;
  address = nw_endpoint_get_address(v3);
  v5 = nw_endpoint_copy_address_string(v3);
  port = nw_endpoint_get_port(v3);

  sa_family = address->sa_family;
  if (sa_family == 30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("::1")) & 1) == 0)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDD1690]);
      objc_msgSend(v10, "addCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyz0123456789:"));
      objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]:%d"), v9, port);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (sa_family == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), v5, port);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  free(v5);
  return v8;
}

- (id)configForConnection:(id)a3 mirrorIP:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  NSObject *v7;
  nw_endpoint_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  dispatch_data_t v20;
  id v21;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = nw_connection_copy_parameters((nw_connection_t)a3);
  v7 = v6;
  if (v6)
  {
    v8 = nw_parameters_copy_local_endpoint(v6);
    if (v8)
    {
      -[NetworkQualityHTTPServer urlFormatAddress:](self, "urlFormatAddress:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  netqual_log_init();
  v10 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[NetworkQualityHTTPServer configForConnection:mirrorIP:]";
    v30 = 1024;
    v31 = 473;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_20E622000, v10, OS_LOG_TYPE_INFO, "%s:%u - testEndPoint: %@", buf, 0x1Cu);
  }
  v11 = objc_alloc(MEMORY[0x24BDBCED8]);
  v26[1] = CFSTR("urls");
  v27[0] = &unk_24C97CCD0;
  v26[0] = CFSTR("version");
  v24[0] = CFSTR("small_download_url");
  -[NetworkQualityHTTPServer urlForType:withAddress:mirrorIP:](self, "urlForType:withAddress:mirrorIP:", CFSTR("small"), v9, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v24[1] = CFSTR("large_download_url");
  -[NetworkQualityHTTPServer urlForType:withAddress:mirrorIP:](self, "urlForType:withAddress:mirrorIP:", CFSTR("large"), v9, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  v24[2] = CFSTR("upload_url");
  -[NetworkQualityHTTPServer urlForType:withAddress:mirrorIP:](self, "urlForType:withAddress:mirrorIP:", CFSTR("slurp"), v9, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v11, "initWithDictionary:", v16);

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v17, 11, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;
  if (v19)
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[NetworkQualityHTTPServer configForConnection:mirrorIP:].cold.1();
    v20 = 0;
  }
  else
  {
    v21 = objc_retainAutorelease(v18);
    v20 = dispatch_data_create((const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 0, 0);
  }

  return v20;
}

- (id)urlForType:(id)a3 withAddress:(id)a4 mirrorIP:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSString *v9;
  NSString *name;
  NSString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v5 = a5;
  v8 = a3;
  v9 = (NSString *)a4;
  name = v9;
  if (!v5)
    name = self->name;
  v11 = name;
  if (self->tlsEnabled)
    v12 = CFSTR("https");
  else
    v12 = CFSTR("http");
  v13 = v12;
  v14 = objc_msgSend(v8, "isEqualToString:", CFSTR("config"));
  if (v5)
  {
    if (v14)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@"), v13, v11, v17, v18);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@/%@"), v13, v11, v8, v18);
  }
  else if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@:%d"), v13, v11, self->port, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@:%d/%@"), v13, v11, self->port, v8);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->sec_identity, 0);
  objc_storeStrong((id *)&self->config_response_data, 0);
  objc_storeStrong((id *)&self->large_response_data, 0);
  objc_storeStrong((id *)&self->small_response_data, 0);
  objc_storeStrong((id *)&self->name, 0);
}

- (void)initWithPort:tlsEnabled:httpVersion:bonjourEnabled:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  _WORD v3[10];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315650;
  OUTLINED_FUNCTION_2();
  *(_DWORD *)&v3[7] = 92;
  v3[9] = v0;
  v4 = v1;
  _os_log_error_impl(&dword_20E622000, v2, OS_LOG_TYPE_ERROR, "%s:%u - Failed to create self signed identity: %d", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_2_0();
}

- (void)start:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - NULL listener", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)start:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Could not lookup local host name, serving with %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Received non-HTTP message, cancelling %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - No path for request", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - unhandled path: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - saw error %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)configForConnection:mirrorIP:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[7];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_20E622000, v2, OS_LOG_TYPE_ERROR, "%s:%u - Error serializing data (%@): %@", (uint8_t *)v3, 0x26u);
  OUTLINED_FUNCTION_4();
}

@end
