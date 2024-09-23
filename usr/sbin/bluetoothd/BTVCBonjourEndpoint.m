@implementation BTVCBonjourEndpoint

- (BTVCBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  BTVCBonjourEndpoint *v14;
  BTVCBonjourEndpoint *v15;
  nw_endpoint_t v16;
  OS_nw_endpoint *remoteEndpoint;
  NSMutableSet *v18;
  NSMutableSet *remoteAdvDataSet;
  BTVCBonjourEndpoint *v20;
  NSObject *v21;
  const char *v22;
  __int16 v24[8];
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BTVCBonjourEndpoint;
  v14 = -[BTVCBonjourEndpoint init](&v25, "init");
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
        -[BTVCBonjourEndpoint _startConnection](v15, "_startConnection");
        if (!v15->_isAdvToBrowserConnection)
        {
          v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          remoteAdvDataSet = v15->_remoteAdvDataSet;
          v15->_remoteAdvDataSet = v18;

        }
        goto LABEL_8;
      }
      v21 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid remoteEndpoint ";
        goto LABEL_13;
      }
    }
    else
    {
      v21 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid arguments to BTVCBonjourEndpoint";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
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
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, int, void *);
  void *v9;
  BTVCBonjourEndpoint *v10;
  __int128 *p_buf;
  id v12;
  id location;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourEndpoint] Started connecting to %@", (uint8_t *)&buf, 0xCu);
  }
  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_queue);
  location = 0;
  objc_initWeak(&location, self);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = sub_100062644;
  v17 = sub_1000623D8;
  v18 = 0;
  v6 = _NSConcreteStackBlock;
  v5 = self->_connection;
  v8 = sub_1004B6300;
  v9 = &unk_1009325F0;
  v7 = 3221225472;
  objc_copyWeak(&v12, &location);
  v10 = self;
  p_buf = &buf;
  nw_connection_set_state_changed_handler(v5, &v6);
  -[BTVCBonjourEndpoint _handleUUIDHeaders](self, "_handleUUIDHeaders", v6, v7, v8, v9);
  nw_connection_start((nw_connection_t)self->_connection);
  objc_destroyWeak(&v12);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
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
  _QWORD enumerator[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_100062644;
    v19 = sub_1000623D8;
    v20 = 0;
    v8 = nw_protocol_copy_ws_definition();
    v9 = nw_connection_copy_protocol_metadata(v6, v8);

    v10 = nw_ws_metadata_copy_server_response(v9);
    v11 = v10;
    if (v10)
    {
      enumerator[0] = _NSConcreteStackBlock;
      enumerator[1] = 3221225472;
      enumerator[2] = sub_1004B693C;
      enumerator[3] = &unk_100932618;
      enumerator[4] = &v15;
      nw_ws_response_enumerate_additional_headers(v10, enumerator);
    }
    v12 = (void *)v16[5];
    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
        sub_1006F8D5C();
      v12 = (void *)v16[5];
    }
    v7 = v12;

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

- (void)_handleUUIDHeaders
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD handler[4];
  id v9;
  id location;
  _QWORD iterate_block[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = nw_connection_copy_parameters((nw_connection_t)self->_connection);
  v4 = nw_parameters_copy_default_protocol_stack(v3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100062644;
  v16 = sub_1000623D8;
  v17 = 0;
  iterate_block[0] = _NSConcreteStackBlock;
  iterate_block[1] = 3221225472;
  iterate_block[2] = sub_1004B6B84;
  iterate_block[3] = &unk_100932640;
  iterate_block[4] = &v12;
  nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
  v5 = v13[5];
  if (v5)
  {
    if (self->_isAdvToBrowserConnection)
    {
      location = 0;
      objc_initWeak(&location, self);
      v6 = v13[5];
      queue = self->_queue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1004B6C38;
      handler[3] = &unk_100932690;
      objc_copyWeak(&v9, &location);
      nw_ws_options_set_client_request_handler(v6, queue, handler);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      nw_ws_options_add_additional_header(v5, "BTVCBonjourEndpointClientUUIDHeader", -[NSString UTF8String](self->_localUniqueIDString, "UTF8String"));
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
  {
    sub_1006F8D88();
  }
  _Block_object_dispose(&v12, 8);

}

- (void)cancel
{
  NSObject *connection;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
  }
  else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
  {
    sub_1006F8DB4();
  }
}

- (void)receiveNextMessage
{
  NSObject *connection;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    location = 0;
    objc_initWeak(&location, self);
    connection = self->_connection;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1004B6ED8;
    v4[3] = &unk_1009326B8;
    objc_copyWeak(&v5, &location);
    nw_connection_receive_message(connection, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
  {
    sub_1006F8DE0();
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
  _QWORD completion[4];
  id v15;
  id v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = dispatch_data_create(objc_msgSend(v8, "bytes"), (size_t)objc_msgSend(v8, "length"), 0, 0);
    metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
    v11 = nw_content_context_create("send");
    nw_content_context_set_metadata_for_protocol(v11, metadata);
    connection = self->_connection;
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472;
    completion[2] = sub_1004B7320;
    completion[3] = &unk_1009326E0;
    v15 = v8;
    v16 = v7;
    nw_connection_send(connection, v9, v11, 1, completion);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Unable to send message, nil connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6700, v13));

    (*((void (**)(id, NSObject *))v7 + 2))(v7, v9);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)createConnectionParameters
{
  NSObject *secure_tcp;
  NSObject *v3;
  NSObject *options;
  NSObject *v5;
  NSObject *v6;

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, &stru_100932720);
  v3 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  options = nw_ws_create_options(nw_ws_version_13);
  nw_ws_options_set_auto_reply_ping(options, 1);
  nw_protocol_stack_prepend_application_protocol(v3, options);
  v5 = nw_interface_create_with_name("en0");
  nw_parameters_require_interface(secure_tcp, v5);

  v6 = nw_interface_create_with_name("lo0");
  nw_parameters_prohibit_interface(secure_tcp, v6);

  return secure_tcp;
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

@end
