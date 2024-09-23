@implementation RSDRemoteDevice

- (unsigned)state
{
  return self->_state;
}

- (OS_xpc_remote_connection)connection
{
  return self->_connection;
}

- (unint64_t)messaging_protocol_version
{
  return self->_messaging_protocol_version;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), self->_device_name);
}

- (RSDRemoteDevice)initWithName:(char *)a3
{
  RSDRemoteDevice *v4;
  RSDRemoteDevice *v5;
  id v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  NSMutableArray *v10;
  NSMutableArray *pended_requests;
  uint64_t v12;
  OS_os_transaction *transaction;
  RSDRemoteDevice *v14;

  v4 = -[RSDRemoteDevice init](self, "init");
  v5 = v4;
  if (v4)
  {
    ++qword_1000575D8;
    -[RSDRemoteDevice setDevice_id:](v4, "setDevice_id:");
    -[RSDRemoteDevice setHeartbeat_sequence_number:](v5, "setHeartbeat_sequence_number:", 1);
    v6 = objc_alloc_init((Class)NSMutableSet);
    -[RSDRemoteDevice setDevice_peers:](v5, "setDevice_peers:", v6);

    v7 = objc_alloc_init((Class)NSMutableArray);
    -[RSDRemoteDevice setHeartbeat_requests:](v5, "setHeartbeat_requests:", v7);

    v8 = xpc_dictionary_create(0, 0, 0);
    -[RSDRemoteDevice setProperties:](v5, "setProperties:", v8);

    v9 = xpc_dictionary_create(0, 0, 0);
    -[RSDRemoteDevice setPublic_properties:](v5, "setPublic_properties:", v9);

    -[RSDRemoteDevice setLatestConnectError:](v5, "setLatestConnectError:", 0xFFFFFFFFLL);
    -[RSDRemoteDevice setTlsEnabled:](v5, "setTlsEnabled:", 0);
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pended_requests = v5->_pended_requests;
    v5->_pended_requests = v10;

    v5->_device_name = strdup(a3);
    v12 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v12;

    *(_WORD *)&v5->_requested_tls = 0;
    v14 = v5;
  }

  return v5;
}

- (unint64_t)tlsRequirement
{
  return 1;
}

+ (id)tlsOidsRequiredOfPeer
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100052EF0);
}

- (BOOL)isHost
{
  OS_xpc_remote_connection *connection;

  connection = self->_connection;
  if (connection)
    LOBYTE(connection) = xpc_remote_connection_is_server(connection, a2);
  return (char)connection;
}

- (void)setUuid:(char *)a3
{
  char *uuid;
  uint64_t v6;
  _OWORD v7[5];

  uuid = self->_uuid;
  if (!uuid)
  {
    uuid = (char *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    self->_uuid = uuid;
    if (!uuid)
      sub_100031308(&v6, v7);
  }
  uuid_copy((unsigned __int8 *)uuid, (const unsigned __int8 *)a3);
  uuid_unparse((const unsigned __int8 *)self->_uuid, self->_uuidString);
}

- (const)uuidString
{
  return self->_uuidString;
}

- (const)heartbeat_stats
{
  return &self->_heartbeat_stats;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_uuid);
  free(self->_device_name);
  free(self->_device_alias);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDevice;
  -[RSDRemoteDevice dealloc](&v3, "dealloc");
}

- (id)serviceWithName:(const char *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice services](self, "services", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!strcmp((const char *)objc_msgSend(v9, "name"), a3))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)type
{
  unsigned int result;

  result = _os_crash("Must overwrite -[RSDRemoteDevice type] in subclass", a2);
  __break(1u);
  return result;
}

- (const)remote_address
{
  const in6_addr *result;

  result = (const in6_addr *)_os_crash("Must overwrite -[RSDRemoteDevice remote_address] in subclass", a2);
  __break(1u);
  return result;
}

- (const)local_address
{
  const in6_addr *result;

  result = (const in6_addr *)_os_crash("Must overwrite -[RSDRemoteDevice remote_address] in subclass", a2);
  __break(1u);
  return result;
}

- (int)interface_index
{
  int result;

  result = _os_crash("Must overwrite -[RSDRemoteDevice interface_index] in subclass", a2);
  __break(1u);
  return result;
}

- (void)needsConnect
{
  _os_crash("Must overwrite -[RSDRemoteDevice needsConnect] in subclass", a2);
  __break(1u);
}

- (void)pollConnect:(int)a3 onQueue:(id)a4 withLog:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = *(_QWORD *)&a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006694;
  v10[3] = &unk_1000510F8;
  v10[4] = self;
  v11 = a6;
  v9 = v11;
  remote_socket_poll_connect_async(v8, a4, a5, a4, v10);

}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v11;
  unsigned __int16 v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  RSDRemoteDevice *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;

  v13 = -1;
  v12 = 0;
  v7 = sub_10001DB04(&v13, (__n128 *)-[RSDRemoteDevice local_address](self, "local_address"), &v12, -[RSDRemoteDevice interface_index](self, "interface_index"), (uint64_t)&unk_1000410BC);
  if (v7)
  {
    v8 = v7;
    v9 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2080;
      v18 = a3;
      v19 = 1024;
      v20 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start listener for \"%s\": %{errno}d", buf, 0x1Cu);
    }
    return -1;
  }
  else
  {
    if (asprintf(a4, "%d", v12) < 0)
      sub_100031370(&v14, buf);
    v11 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2080;
      v18 = a3;
      v19 = 1024;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@> listenForService \"%s\" returning port %d", buf, 0x1Cu);
    }
    return v13;
  }
}

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  unsigned __int16 v6;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v12;
  uint8_t buf[4];
  RSDRemoteDevice *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  v12 = -1;
  v6 = atoi(a3);
  v7 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 1024;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@> Attempting to connect to service on port %d", buf, 0x12u);
  }
  v8 = sub_10001D5D0(&v12, (__n128 *)-[RSDRemoteDevice remote_address](self, "remote_address"), v6, -[RSDRemoteDevice interface_index](self, "interface_index"), (uint64_t)a4);
  if (!v8)
    return v12;
  v9 = v8;
  v10 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v14 = self;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@> Unable to open socket to service on port %d: %{darwin.errno}d", buf, 0x18u);
  }
  return -1;
}

- (BOOL)connectable
{
  return -[RSDRemoteDevice state](self, "state") == 3 && !self->_resetting && !self->_being_reset;
}

- (void)attach
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint8_t buf[88];

  if (!-[RSDRemoteDevice type](self, "type"))
    sub_1000313F0(&v11, buf);
  v3 = objc_alloc_init((Class)NSMutableSet);
  -[RSDRemoteDevice setService_listeners:](self, "setService_listeners:", v3);

  v4 = objc_alloc_init((Class)NSMutableSet);
  -[RSDRemoteDevice setServices:](self, "setServices:", v4);

  objc_msgSend((id)qword_100057CB0, "addObject:", self);
  v5 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Attached", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    v7 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      sub_1000314C0((uint64_t)self);
    free(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    v9 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      sub_100031458((uint64_t)self);
    free(v9);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006C4C;
  v10[3] = &unk_1000510D0;
  v10[4] = self;
  dispatch_async((dispatch_queue_t)qword_100057CB8, v10);
  sub_1000215E0(self);
}

- (NSSet)tlsOidsPopulatedOnPeer
{
  id v3;
  void *v4;
  xpc_object_t array;
  void *v6;
  id v7;
  _QWORD applier[4];
  id v10;

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  array = xpc_dictionary_get_array(v4, "EncryptedRemoteXPCPopulatedOIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v6)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100006D1C;
    applier[3] = &unk_100051080;
    v10 = v3;
    xpc_array_apply(v6, applier);

  }
  v7 = objc_msgSend(v3, "copy");

  return (NSSet *)v7;
}

- (void)triggerNeedsConnect
{
  NSObject *v3;
  const char *v4;
  int v5;
  RSDRemoteDevice *v6;

  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    v3 = qword_100057FE0;
    if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      return;
    v5 = 138543362;
    v6 = self;
    v4 = "%{public}@> Device gone, not attempting reconnect";
    goto LABEL_7;
  }
  if (-[RSDRemoteDevice state](self, "state") != 3)
  {
    -[RSDRemoteDevice needsConnect](self, "needsConnect");
    return;
  }
  v3 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    v4 = "%{public}@> Already connected, not triggering needsConnect";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)negotiateTls
{
  xpc_object_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  RSDRemoteDevice *v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  if (-[RSDRemoteDevice state](self, "state") == 2)
  {
    v4 = sub_1000194E4();

    if (v4)
    {
      if ((id)-[RSDRemoteDevice tlsRequirement](self, "tlsRequirement") != (id)1)
      {
        v9 = objc_msgSend((id)objc_opt_class(self), "tlsOidsRequiredOfPeer");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v10));

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice tlsOidsPopulatedOnPeer](self, "tlsOidsPopulatedOnPeer"));
        objc_msgSend(v8, "minusSet:", v11);

        if (objc_msgSend(v8, "count"))
        {
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
            sub_100031588();
          v7 = 0;
        }
        else
        {
          v7 = 1;
        }
        goto LABEL_17;
      }
      v5 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        v14 = 138543362;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> TLS is disabled for this backend.", (uint8_t *)&v14, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
    {
      sub_100031528();
    }
    v7 = 0;
    v8 = 0;
LABEL_17:
    xpc_dictionary_set_string(v3, "MessageType", "StartTls");
    xpc_dictionary_set_BOOL(v3, "YesNo", v7);
    xpc_dictionary_set_uint64(v3, "TlsPolicy", -[RSDRemoteDevice tlsRequirement](self, "tlsRequirement"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_send_message(v12, v3);

    goto LABEL_18;
  }
  v6 = (void *)qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
    sub_1000315E8(self, v6);
  v7 = 0;
LABEL_18:

  return v7;
}

- (void)handshakeCompleted:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  RSDRemoteDevice *v11;

  v5 = -[RSDRemoteDevice tlsRequirement](self, "tlsRequirement");
  if ((a3 == 3 || v5 == 3) && !self->_enable_tls)
  {
    v7 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> TLS is required by self and/or peer and was not enabled. Connect failed.", (uint8_t *)&v10, 0xCu);
    }
    -[RSDRemoteDevice setState:](self, "setState:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      xpc_remote_connection_cancel();

      -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
    }
  }
  else
  {
    v6 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> Handshake complete.", (uint8_t *)&v10, 0xCu);
    }
    -[RSDRemoteDevice setState:](self, "setState:", 3);
    -[RSDRemoteDevice connected](self, "connected");
    -[RSDRemoteDevice fetchDeviceAlias](self, "fetchDeviceAlias");
    sub_1000216DC(self);
    -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
  }
}

- (id)handleReset:(id)a3
{
  id v4;
  xpc_object_t reply;

  v4 = a3;
  if ((xpc_dictionary_expects_reply(v4) & 1) != 0)
  {
    self->_being_reset = 1;
    reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Result", "Ok");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100031678();
    reply = 0;
  }

  return reply;
}

- (void)handleResetGoAhead
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  RSDRemoteDevice *v7;

  v3 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got reset goahead. Cancel this connection and proceed to reset", (uint8_t *)&v6, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel();

    -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
  }
}

- (void)connect:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  RSDRemoteDevice *v13;
  void *v14;
  _BOOL8 enable_tls;
  dispatch_time_t v16;
  id v17;
  xpc_object_t v18;
  id v19;
  RSDRemoteDevice *v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  const char *v44;
  id v45;
  void *v46;
  NSObject *v47;
  id v48;
  xpc_object_t v49;
  id v50;
  xpc_object_t xdict;
  id obj;
  RSDRemoteDevice *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void **v66;
  uint64_t v67;
  void (*v68)(uint64_t, void *);
  void *v69;
  RSDRemoteDevice *v70;
  id v71;
  _QWORD v72[5];
  uint64_t v73;
  _QWORD block[5];
  _BYTE v75[128];
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  RSDRemoteDevice *v79;
  __int16 v80;
  id v81;

  v4 = a3;
  v5 = -[RSDRemoteDevice state](self, "state");
  if (v4)
  {
    if (v5 == 5)
    {
      v6 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@> Device already gone, giving up the connection", buf, 0xCu);
      }
      xpc_remote_connection_cancel(v4);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

      if (v8)
        sub_1000316F0(&v73, buf);
      -[RSDRemoteDevice setConnection:](self, "setConnection:", v4);
      if (!-[RSDRemoteDevice state](self, "state"))
        self->_being_reset = 0;
      -[RSDRemoteDevice setState:](self, "setState:", 1);
      v53 = self;
      if (self->_enable_tls)
      {
        v9 = sub_1000194E4();
        if (!v9)
          sub_1000316D8(0, v10);
        v11 = v9;
        v12 = qword_100057FE0;
        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v79 = self;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@> Applying TLS to RemoteXPC connection.", buf, 0xCu);
        }
        v13 = self;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_100007B68;
        v72[3] = &unk_100051120;
        v72[4] = self;
        xpc_remote_connection_set_tls(v14, v11, v72, qword_100057CB8);

        enable_tls = self->_enable_tls;
      }
      else
      {
        enable_tls = 0;
        v13 = self;
      }
      -[RSDRemoteDevice setTlsEnabled:](v13, "setTlsEnabled:", enable_tls);
      -[RSDRemoteDevice refreshServiceListeners](v13, "refreshServiceListeners");
      xpc_remote_connection_set_target_queue(v4, qword_100057CB8);
      v66 = _NSConcreteStackBlock;
      v67 = 3221225472;
      v68 = sub_100007BB8;
      v69 = &unk_100051170;
      v70 = v13;
      v50 = v4;
      v17 = v4;
      v71 = v17;
      xpc_remote_connection_set_event_handler();
      v48 = v17;
      xpc_remote_connection_activate(v17);
      v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v18, "MessageType", "Handshake");
      xpc_dictionary_set_uint64(v18, "MessagingProtocolVersion", 5uLL);
      xpc_dictionary_set_uuid(v18, "UUID", (const unsigned __int8 *)&xmmword_100057FE8);
      v49 = v18;
      xpc_dictionary_set_value(v18, "Properties", (xpc_object_t)qword_100057FF8);
      xdict = xpc_dictionary_create(0, 0, 0);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = (id)qword_100058000;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
      v20 = v13;
      if (v19)
      {
        v21 = v19;
        v22 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](v20, "service_listeners"));
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v59;
LABEL_28:
              v29 = 0;
              while (1)
              {
                if (*(_QWORD *)v59 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "service"));

                if (v31 == v24)
                  break;
                if (v27 == (id)++v29)
                {
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
                  if (v27)
                    goto LABEL_28;
                  goto LABEL_34;
                }
              }
              v32 = v30;

              if (!v32)
                goto LABEL_37;
              v33 = (const char *)objc_msgSend(v24, "name");
              v34 = objc_msgSend(v32, "copyServiceDescription");
              xpc_dictionary_set_value(xdict, v33, v34);

              v20 = v53;
            }
            else
            {
LABEL_34:

LABEL_37:
              v35 = (void *)qword_100057FE0;
              v20 = v53;
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
              {
                v36 = v35;
                v37 = objc_msgSend(v24, "name");
                *(_DWORD *)buf = 138543618;
                v79 = v53;
                v80 = 2080;
                v81 = v37;
                _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@> No listener for \"%s\", buf, 0x16u);

              }
            }
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
        }
        while (v21);
      }

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v38 = (id)qword_100058008;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(_QWORD *)v55 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
            v44 = (const char *)objc_msgSend(v43, "name");
            v45 = objc_msgSend(v43, "copyServiceDescription");
            xpc_dictionary_set_value(xdict, v44, v45);

          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
        }
        while (v40);
      }

      xpc_dictionary_set_value(v49, "Services", xdict);
      xpc_remote_connection_send_message(v48, v49);
      v46 = (void *)xpc_copy_clean_description(v49);
      v47 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v79 = v20;
        v80 = 2080;
        v81 = v46;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%{public}@> Sending handshake message: %s", buf, 0x16u);
      }
      free(v46);

      v4 = v50;
    }
  }
  else
  {
    v7 = qword_100057FE0;
    if (v5 == 5)
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@> Device connection failed, device already gone, giving up", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection failed", buf, 0xCu);
      }
      v16 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007B60;
      block[3] = &unk_1000510D0;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)qword_100057CB8, block);
    }
  }

}

- (void)heartbeatWithCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  RSDRemoteDevice *v22;
  __int16 v23;
  uint64_t v24;

  v4 = a3;
  if (-[RSDRemoteDevice state](self, "state") == 3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
        v5,
        v5))
  {
    if (-[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version"))
    {
      v6 = -[RSDRemoteDevice heartbeat_sequence_number](self, "heartbeat_sequence_number");
      -[RSDRemoteDevice setHeartbeat_sequence_number:](self, "setHeartbeat_sequence_number:", (char *)-[RSDRemoteDevice heartbeat_sequence_number](self, "heartbeat_sequence_number") + 1);
      v7 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        v23 = 2048;
        v24 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Sending heartbeat request %llu", buf, 0x16u);
      }
      self->_heartbeat_stats.times.outstanding_start = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      ++self->_heartbeat_stats.counts.sent;
      v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v8, "MessageType", "Heartbeat");
      xpc_dictionary_set_uint64(v8, "SequenceNumber", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      v10 = qword_100057CB8;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100009084;
      v14[3] = &unk_1000511C0;
      v14[4] = self;
      v16 = v6;
      v15 = v4;
      xpc_remote_connection_send_message_with_reply(v9, v8, v10, v14);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        sub_100031DAC();
      v13 = qword_100057CB8;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100009074;
      v17[3] = &unk_100051198;
      v18 = v4;
      dispatch_async(v13, v17);
      v8 = v18;
    }
  }
  else
  {
    v11 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> Heartbeat failed: not connected", buf, 0xCu);
    }
    v12 = qword_100057CB8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009064;
    block[3] = &unk_100051198;
    v20 = v4;
    dispatch_async(v12, block);
    v8 = v20;
  }

}

- (void)timesyncWithCallback:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  id v11;
  void *v12;
  xpc_object_t empty;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  int v18;
  int v19;
  uint8_t buf[4];
  RSDRemoteDevice *v21;

  v4 = a3;
  if (-[RSDRemoteDevice state](self, "state") == 3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
        v5,
        v5))
  {
    v6 = -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version");
    v7 = qword_100057FE0;
    if (v6 > 2)
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> sending timesync request", buf, 0xCu);
      }
      v8 = sub_10000E270();
      v9 = v8;
      v10 = HIDWORD(v8);
      v11 = sub_10000E2F8(v8, (void *)qword_100057FE0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Timesync");
      xpc_dictionary_set_value(empty, "TimesyncPayload", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      v15 = qword_100057CB8;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100009488;
      v16[3] = &unk_1000511C0;
      v16[4] = self;
      v17 = v4;
      v18 = v9;
      v19 = v10;
      xpc_remote_connection_send_message_with_reply(v14, empty, v15, v16);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        sub_100031EF8();
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 43);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100031E98();
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 57);
  }

}

- (void)goodByeWithCallback:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t empty;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (-[RSDRemoteDevice type](self, "type") == 14)
  {
    if (-[RSDRemoteDevice state](self, "state") == 3
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
          v5,
          v5))
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Goodbye");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      v8 = qword_100057CB8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000096FC;
      v9[3] = &unk_1000511E8;
      v9[4] = self;
      v10 = v4;
      xpc_remote_connection_send_message_with_reply(v7, empty, v8, v9);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        sub_100032020();
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 57);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100032080();
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 43);
  }

}

- (void)disconnect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  -[RSDRemoteDevice setState:](self, "setState:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v4);

    -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9), "cancel");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice services](self, "services", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "cancel");
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  -[RSDRemoteDevice setService_listeners:](self, "setService_listeners:", 0);
  -[RSDRemoteDevice setServices:](self, "setServices:", 0);
  -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
  sub_10002184C(self);
  objc_msgSend((id)qword_100057CB0, "removeObject:", self);
}

- (void)reset
{
  _QWORD v3[5];

  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_1000320E0();
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009A98;
    v3[3] = &unk_1000510D0;
    v3[4] = self;
    -[RSDRemoteDevice invokeWhenConnectable:](self, "invokeWhenConnectable:", v3);
  }
}

- (void)refreshServiceListeners
{
  id v3;
  __int128 v4;
  id v5;
  void *j;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  __int128 v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  RSDRemoteDevice *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];

  if ((id)-[RSDRemoteDevice tlsRequirement](self, "tlsRequirement") == (id)3
    && !-[RSDRemoteDevice tlsEnabled](self, "tlsEnabled"))
  {
    v19 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v41 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@> TLS required and not yet enabled. Postpone listening for services.", buf, 0xCu);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "cancel");
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v22);
    }

    obj = (id)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
    objc_msgSend(obj, "removeAllObjects");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)qword_100058000;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v3)
    {
      v5 = v3;
      v27 = *(_QWORD *)v33;
      *(_QWORD *)&v4 = 138543618;
      v25 = v4;
      do
      {
        for (j = 0; j != v5; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners", v25));
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v29;
LABEL_10:
            v12 = 0;
            while (1)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service"));

              if (v14 == v7)
                break;
              if (v10 == (id)++v12)
              {
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
                if (v10)
                  goto LABEL_10;
                goto LABEL_16;
              }
            }
            v15 = v13;

            if (v15)
              goto LABEL_21;
          }
          else
          {
LABEL_16:

          }
          v16 = (void *)qword_100057FE0;
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
          {
            v17 = v16;
            v18 = objc_msgSend(v7, "name");
            *(_DWORD *)buf = v25;
            v41 = self;
            v42 = 2080;
            v43 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@> Trying to listen for new service \"%s\", buf, 0x16u);

          }
          -[RSDRemoteDevice listenForService:](self, "listenForService:", v7);
          v15 = 0;
LABEL_21:

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v5);
    }
  }

}

- (void)_resetNow
{
  unint64_t v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  RSDRemoteDevice *v9;

  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_1000320E0();
  }
  else
  {
    v3 = -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version");
    v4 = qword_100057FE0;
    if (v3 > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v9 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@> About to reset", buf, 0xCu);
      }
      self->_resetting = 1;
      v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v5, "MessageType", "Reset");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100009F94;
      v7[3] = &unk_100050F08;
      v7[4] = self;
      xpc_remote_connection_send_message_with_reply(v6, v5, qword_100057CB8, v7);

    }
    else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
    {
      sub_100032140();
    }
  }
}

- (void)drainPendedRequests
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A190;
  block[3] = &unk_1000510D0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100057CB8, block);
}

- (void)invokeWhenConnectable:(id)a3
{
  NSMutableArray *pended_requests;
  void (**v5)(void);
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (-[RSDRemoteDevice connectable](self, "connectable"))
  {
    v6[2]();
  }
  else
  {
    pended_requests = self->_pended_requests;
    v5 = objc_retainBlock(v6);

    -[NSMutableArray addObject:](pended_requests, "addObject:", v5);
    v6 = v5;
  }

}

- (void)setBackendProperty:(const char *)a3 withUint:(unint64_t)a4
{
  void *v7;
  void *v8;
  const char *v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_uint64(v7, a3, a4);

  v9 = a3;
  if (lfind(&v9, &off_100051250, &qword_1000410E8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000B7A0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_uint64(v8, a3, a4);

  }
}

- (void)setBackendProperty:(const char *)a3 withBool:(BOOL)a4
{
  void *v7;
  void *v8;
  const char *v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_BOOL(v7, a3, a4);

  v9 = a3;
  if (lfind(&v9, &off_100051250, &qword_1000410E8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000B7A0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_BOOL(v8, a3, a4);

  }
}

- (void)setBackendProperty:(const char *)a3 withString:(const char *)a4
{
  void *v7;
  void *v8;
  const char *v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_string(v7, a3, a4);

  v9 = a3;
  if (lfind(&v9, &off_100051250, &qword_1000410E8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000B7A0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_string(v8, a3, a4);

  }
}

- (void)listenForService:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  RSDLocalServiceListener *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint8_t buf[4];
  RSDRemoteDevice *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  if ((objc_msgSend(v4, "shouldBeExposedToDevice:", self) & 1) != 0)
  {
    v17 = 0xAAAAAAAAAAAAAAAALL;
    v5 = -[RSDRemoteDevice listenForService:port:](self, "listenForService:port:", objc_msgSend(v4, "name"), &v17);
    if ((_DWORD)v5 != -1)
    {
      v6 = v5;
      if (fcntl(v5, 4, 4) == -1)
        sub_100032228(&v16, buf);
      v7 = [RSDLocalServiceListener alloc];
      v8 = -[RSDLocalServiceListener initWithService:forDevice:withPort:onSocket:](v7, "initWithService:forDevice:withPort:onSocket:", v4, self, v17, v6);
      v9 = (void *)qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = objc_msgSend(v4, "name");
        v12 = -[NSObject port](v8, "port");
        *(_DWORD *)buf = 138543874;
        v19 = self;
        v20 = 2080;
        v21 = v11;
        v22 = 2080;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@> Listening for \"%s\" on port %s.", buf, 0x20u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
      objc_msgSend(v13, "addObject:", v8);

      goto LABEL_9;
    }
    v15 = (void *)qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_1000321A0((uint64_t)self, v15, v4);
  }
  else
  {
    v14 = (void *)qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
    {
      v8 = v14;
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2080;
      v21 = objc_msgSend(v4, "name");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@> Won't expose \"%s\" to the device", buf, 0x16u);
LABEL_9:

    }
  }

}

- (void)fetchDeviceAlias
{
  void *v3;
  xpc_object_t value;
  void *v5;
  const char *string_ptr;
  const char *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CFStringRef v10;
  const __CFString *v11;
  const __CFString *v12;
  char *v13;
  uint64_t v14;
  _OWORD v15[5];

  if (!-[RSDRemoteDevice device_alias](self, "device_alias"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    value = xpc_dictionary_get_value(v3, "UniqueDeviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v5)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        v7 = string_ptr;
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", CFSTR("device_name_map")));
        if (v8)
        {
          v9 = (const __CFDictionary *)v8;
          v10 = CFStringCreateWithCString(kCFAllocatorDefault, v7, 0x8000100u);
          v11 = (const __CFString *)CFDictionaryGetValue(v9, v10);
          if (v11)
          {
            v12 = v11;
            v13 = (char *)malloc_type_malloc(0x80uLL, 0x18EC0261uLL);
            if (!v13)
              sub_100032368(&v14, v15);
            self->_device_alias = v13;
            CFStringGetCString(v12, v13, 128, 0x8000100u);
          }
          CFRelease(v10);
          CFRelease(v9);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      {
        sub_100032308();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
    {
      sub_1000322A8();
    }

  }
}

- (void)setDevice_alias:(char *)a3
{
  void *v5;
  xpc_object_t value;
  void *v7;
  const char *string_ptr;
  const char *v9;
  const __CFDictionary *v10;
  __CFDictionary *Mutable;
  CFStringRef v12;
  CFStringRef v13;
  char *v14;
  uint64_t v15;
  _OWORD v16[5];

  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    value = xpc_dictionary_get_value(v5, "UniqueDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v7)
    {
      string_ptr = xpc_string_get_string_ptr(v7);
      if (string_ptr)
      {
        v9 = string_ptr;
        v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", CFSTR("device_name_map")));
        if (!v10 || (Mutable = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v10)) == 0)
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v12 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
        v13 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
        CFDictionarySetValue(Mutable, v13, v12);
        objc_msgSend((id)qword_100057FD8, "setValue:forKey:", Mutable, CFSTR("device_name_map"));
        objc_msgSend((id)qword_100057FD8, "synchronize");
        free(self->_device_alias);
        if (_dispatch_is_multithreaded())
        {
          while (1)
          {
            v14 = strdup(a3);
            if (v14)
              break;
            __os_temporary_resource_shortage();
          }
        }
        else
        {
          v14 = strdup(a3);
          if (!v14)
            sub_10003248C(a3, &v15, v16);
        }
        self->_device_alias = v14;
        CFRelease(v13);
        CFRelease(v12);
        CFRelease(Mutable);
        if (v10)
          CFRelease(v10);
      }
      else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      {
        sub_100032308();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
    {
      sub_1000322A8();
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
  {
    sub_10003242C();
  }
}

- (const)device_name
{
  return self->_device_name;
}

- (char)device_alias
{
  return self->_device_alias;
}

- (unint64_t)device_id
{
  return self->_device_id;
}

- (void)setDevice_id:(unint64_t)a3
{
  self->_device_id = a3;
}

- (char)uuid
{
  return self->_uuid;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int)latestConnectError
{
  return self->_latestConnectError;
}

- (void)setLatestConnectError:(int)a3
{
  self->_latestConnectError = a3;
}

- (unint64_t)heartbeat_sequence_number
{
  return self->_heartbeat_sequence_number;
}

- (void)setHeartbeat_sequence_number:(unint64_t)a3
{
  self->_heartbeat_sequence_number = a3;
}

- (void)setMessaging_protocol_version:(unint64_t)a3
{
  self->_messaging_protocol_version = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (OS_xpc_object)public_properties
{
  return self->_public_properties;
}

- (void)setPublic_properties:(id)a3
{
  objc_storeStrong((id *)&self->_public_properties, a3);
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSMutableSet)service_listeners
{
  return self->_service_listeners;
}

- (void)setService_listeners:(id)a3
{
  objc_storeStrong((id *)&self->_service_listeners, a3);
}

- (BOOL)tlsEnabled
{
  return self->_tlsEnabled;
}

- (void)setTlsEnabled:(BOOL)a3
{
  self->_tlsEnabled = a3;
}

- (OS_xpc_object)device_listener
{
  return self->_device_listener;
}

- (void)setDevice_listener:(id)a3
{
  objc_storeStrong((id *)&self->_device_listener, a3);
}

- (NSMutableSet)device_peers
{
  return self->_device_peers;
}

- (void)setDevice_peers:(id)a3
{
  objc_storeStrong((id *)&self->_device_peers, a3);
}

- (NSMutableArray)heartbeat_requests
{
  return self->_heartbeat_requests;
}

- (void)setHeartbeat_requests:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeat_requests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeat_requests, 0);
  objc_storeStrong((id *)&self->_device_peers, 0);
  objc_storeStrong((id *)&self->_device_listener, 0);
  objc_storeStrong((id *)&self->_service_listeners, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_public_properties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_pended_requests, 0);
}

- (id)copyClientDescriptionWithSensitiveProperties:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  xpc_connection_t v15;
  _xpc_connection_s *v16;
  _xpc_connection_s *v17;
  _xpc_connection_s *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint8_t buf[88];

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "device_type", -[RSDRemoteDevice type](self, "type"));
  xpc_dictionary_set_uint64(v5, "device_id", -[RSDRemoteDevice device_id](self, "device_id"));
  xpc_dictionary_set_string(v5, "device_name", -[RSDRemoteDevice device_name](self, "device_name"));
  if (-[RSDRemoteDevice device_alias](self, "device_alias"))
    xpc_dictionary_set_string(v5, "device_alias", -[RSDRemoteDevice device_alias](self, "device_alias"));
  xpc_dictionary_set_uint64(v5, "device_messaging_protocol_version", -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version"));
  xpc_dictionary_set_BOOL(v5, "device_tls_enabled", -[RSDRemoteDevice tlsEnabled](self, "tlsEnabled"));
  if (-[RSDRemoteDevice uuid](self, "uuid"))
    xpc_dictionary_set_uuid(v5, "UUID", (const unsigned __int8 *)-[RSDRemoteDevice uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));

  if (v6)
  {
    v7 = os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
        sub_100038B88();
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    }
    else
    {
      if (v7)
        sub_100038C50();
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));

      if (!v9)
        sub_100038BE8(&v21, buf);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    }
    v10 = v8;
    xpc_dictionary_set_value(v5, "properties", v8);

  }
  v11 = -[RSDRemoteDevice state](self, "state") - 3;
  if (v11 > 2)
    v12 = 1;
  else
    v12 = qword_100041168[v11];
  xpc_dictionary_set_uint64(v5, "device_state", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));

  if (!v13)
  {
    v14 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@> Creating device listener", buf, 0xCu);
    }
    v15 = xpc_connection_create(0, (dispatch_queue_t)qword_100057EA0);
    -[RSDRemoteDevice setDevice_listener:](self, "setDevice_listener:", v15);

    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001F82C;
    v20[3] = &unk_100050F08;
    v20[4] = self;
    xpc_connection_set_event_handler(v16, v20);

    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
    xpc_connection_activate(v17);

  }
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
  xpc_dictionary_set_connection(v5, "endpoint", v18);

  return v5;
}

@end
