@implementation CryptexSession

- (void)cancelPeerConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;

  v3 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling peer connections: %zu", buf, 0xCu);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array", 0));
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
        xpc_connection_cancel(*(xpc_connection_t *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)sessionStart
{
  void *v3;
  int uid;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t overrides;
  void *v11;
  CFIndex v12;
  CFIndex v13;
  int v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  int v18;
  CryptexSession *v19;
  __int16 v20;
  unsigned int v21;

  -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  uid = cryptex_session_core_get_uid();

  v5 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_enter(v6);

  v7 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Searching for LaunchAgents to add to the session", (uint8_t *)&v18, 2u);
  }

  v8 = sub_100014FE0();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  overrides = cryptex_session_core_get_overrides();
  v11 = (void *)objc_claimAutoreleasedReturnValue(overrides);

  v12 = sub_1000161B0((uint64_t)v8, uid, v11);
  if ((_DWORD)v12)
  {
    v13 = v12;
    -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 32);
    -[CryptexSession setError:](self, "setError:", v13);
    v14 = *__error();
    v15 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = -[CryptexSession error](self, "error");
      v18 = 138412546;
      v19 = self;
      v20 = 1024;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to start session %@: %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }

    *__error() = v14;
    v17 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_leave(v17);

  }
  else
  {
    cryptex_async_f(v8, self, sub_10000ADDC);
  }

}

- (void)sessionMessageReply:(id)a3
{
  xpc_object_t reply;
  NSObject *v5;
  int64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD v17[2];

  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    if (-[CryptexSession error](self, "error"))
    {
      v5 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109120;
        v17[1] = -[CryptexSession error](self, "error");
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session has an error (code %d), reporting it.", (uint8_t *)v17, 8u);
      }

      xpc_dictionary_set_int64(reply, "STATE", 1);
      v6 = -[CryptexSession error](self, "error");
      v7 = "ERROR";
      v8 = reply;
    }
    else
    {
      v7 = "STATE";
      v8 = reply;
      v6 = 0;
    }
    xpc_dictionary_set_int64(v8, v7, v6);
    xpc_dictionary_send_reply(reply);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003E7A8(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)sessionStopWithReason:(int64_t)a3 exitCode:(unint64_t)a4
{
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t overrides;
  void *v29;
  void *v30;
  int uid;
  NSObject *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;

  v7 = sub_100014FE0();
  v8 = *__error();
  v9 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = -[CryptexSession error](self, "error");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "sessionStopWithReason occurred.: %{darwin.errno}d", buf, 8u);
  }

  *__error() = v8;
  if (!-[CryptexSession session_removal_begun](self, "session_removal_begun"))
  {
    -[CryptexSession setSession_removal_begun:](self, "setSession_removal_begun:", 1);
    v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    v11 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_enter(v11);

    -[CryptexSession setExitReason:withCode:](self, "setExitReason:withCode:", a3, a4);
    -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
        v16 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134217984;
        v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Taking down quires: count %zu", buf, 0xCu);

      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v36;
        *(_QWORD *)&v19 = 134217984;
        v34 = v19;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v24 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log", v34));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v41 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "unmounting %p", buf, 0xCu);
            }

            v25 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
            dispatch_group_enter(v25);

            sub_10001783C((uint64_t)v7, v23, 1uLL, (uint64_t)self, (uint64_t)sub_10000B454);
          }
          v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v20);
      }

    }
    else
    {
      -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 16);
      -[CryptexSession cancelPeerConnections](self, "cancelPeerConnections");
    }
    v26 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Searching for LaunchAgents to remove from the session", buf, 2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    overrides = cryptex_session_core_get_overrides();
    v29 = (void *)objc_claimAutoreleasedReturnValue(overrides);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    uid = cryptex_session_core_get_uid();

    sub_100016360((uint64_t)v7, uid);
    v32 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_leave(v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
    objc_msgSend(v33, "removeCryptexSession:", self);

  }
}

- (void)sessionAddParseXPC:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t dictionary;
  void *v7;
  void *v8;
  xpc_object_t array;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  int v15;
  NSObject *v16;
  _QWORD applier[5];
  uint8_t buf[4];
  unsigned int v19;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[CryptexSession setError:](self, "setError:", 22);
    v12 = *__error();
    v13 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = -[CryptexSession error](self, "error");
      v14 = "No payload sent for add.: %{darwin.errno}d";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 8u);
    }
LABEL_10:

    *__error() = v12;
    goto LABEL_15;
  }
  dictionary = xpc_dictionary_get_dictionary(v4, "PAYLOAD");
  v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (!v7)
  {
    -[CryptexSession setError:](self, "setError:", 22);
    v12 = *__error();
    v13 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = -[CryptexSession error](self, "error");
      v14 = "Payload format incorrect: %{darwin.errno}d";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v8 = v7;
  array = xpc_dictionary_get_array(v7, "CRYPTEXES");
  v10 = (void *)objc_claimAutoreleasedReturnValue(array);
  if (v10)
  {
    v11 = v10;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10000B7D8;
    applier[3] = &unk_100055538;
    applier[4] = self;
    xpc_array_apply(v10, applier);

  }
  else
  {
    -[CryptexSession setError:](self, "setError:", 22);
    v15 = *__error();
    v16 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = -[CryptexSession error](self, "error");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "session_add incorrectly formatted: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v15;
  }

LABEL_15:
}

- (BOOL)sessionAddCptxWithBundleID:(const char *)a3 withType:(int64_t)a4 dmgFd:(int *)a5 trustCacheFD:(int *)a6 manifestFD:(int *)a7 volumeHashFD:(int *)a8 infoPlistFd:(int *)a9 cx1Properties:(id)a10
{
  id v17;
  void *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int uid;
  _QWORD *v28;
  void *v29;
  int v31;
  const char *v32;
  __int16 v33;
  CryptexSession *v34;

  v17 = a10;
  v18 = (void *)cryptex_core_create(0);
  v19 = cryptex_core_set_assets_from_fds(v18, a4, a5, a6, a9, a7, a8);
  if ((_DWORD)v19)
  {
    -[CryptexSession setError:](self, "setError:", v19);
    v20 = *__error();
    v21 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v31 = 67109120;
      LODWORD(v32) = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to add cryptex assets: %{darwin.errno}d", (uint8_t *)&v31, 8u);
    }

    *__error() = v20;
  }
  else
  {
    if (v17)
      cryptex_core_set_cryptex1_properties(v18);
    v22 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_enter(v22);

    v23 = (void *)cryptex_host_create(0, 1);
    cryptex_core_attach_host(v18, v23);
    v24 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315394;
      v32 = a3;
      v33 = 2112;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Installing cryptex %s to %@", (uint8_t *)&v31, 0x16u);
    }

    v25 = sub_100014FE0();
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    uid = cryptex_session_core_get_uid();
    v28 = sub_100037F90(v25, 0, self, uid, 0, (uint64_t)sub_10000BF74);

    sub_100016474(v25, v18, (uint64_t)v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    cryptex_session_core_append_to_array(v29, a3);

  }
  return (_DWORD)v19 == 0;
}

- (void)parseCommandFromMessage:(id)a3 fromPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  xpc_type_t type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t value;
  void *v19;
  int64_t int64;
  uint64_t v21;
  NSObject *v22;
  const char *string;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  CryptexSession *v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138412290;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(daemon) delivering to %@", (uint8_t *)&v29, 0xCu);
  }

  type = xpc_get_type(v6);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
    goto LABEL_4;
  value = xpc_dictionary_get_value(v6, "COMMAND");
  v19 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v19)
  {
    if (xpc_dictionary_get_BOOL(v6, "REMOVE"))
    {
      v24 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Recieved Peer Remove Message", (uint8_t *)&v29, 2u);
      }

      v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
      -[NSObject removeObject:](v10, "removeObject:", v7);
      goto LABEL_20;
    }
LABEL_4:
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136315138;
        v30 = (CryptexSession *)string;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recieved error from peer - %s", (uint8_t *)&v29, 0xCu);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10003E95C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_20:

    goto LABEL_31;
  }
  int64 = xpc_dictionary_get_int64(v6, "COMMAND");
  if (int64 == 3)
  {
    v25 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412290;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: ADD", (uint8_t *)&v29, 0xCu);
    }

    -[CryptexSession sessionAddParseXPC:](self, "sessionAddParseXPC:", v6);
  }
  else
  {
    v21 = int64;
    if (int64 == 2)
    {
      v26 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: STOP", (uint8_t *)&v29, 0xCu);
      }

      -[CryptexSession sessionStopWithReason:exitCode:](self, "sessionStopWithReason:exitCode:", 4, 0);
    }
    else if (int64 == 1)
    {
      v22 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: START", (uint8_t *)&v29, 0xCu);
      }

      -[CryptexSession sessionStart](self, "sessionStart");
    }
    else
    {
      v27 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        sub_10003E990(v21, v27);

    }
  }
  v28 = objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

  -[CryptexSession sessionMessageReply:](self, "sessionMessageReply:", v6);
LABEL_31:

}

- (void)setupHandler
{
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_endpoint_t v6;
  void *v7;
  _QWORD handler[5];

  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C6D8;
  handler[3] = &unk_100055588;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  xpc_connection_activate(v4);

  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  v6 = xpc_endpoint_create(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_set_endpoint(v7, v6);

}

- (CryptexSession)initWithCore:(id)a3
{
  id v4;
  CryptexSession *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  xpc_connection_t v15;
  dispatch_group_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CryptexSession;
  v5 = -[CryptexSession init](&v18, "init");
  if (v5)
  {
    v6 = sub_100014FE0();
    v7 = (void *)cryptex_session_core_copy_name(v4);
    -[CryptexSession setCs:](v5, "setCs:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    -[CryptexSession setName:](v5, "setName:", v8);

    v9 = os_log_create("com.apple.libcryptex", "session_item");
    -[CryptexSession setLog:](v5, "setLog:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CryptexSession setPeer_array:](v5, "setPeer_array:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CryptexSession setQuire_array:](v5, "setQuire_array:", v11);

    -[CryptexSession setError:](v5, "setError:", 0);
    v12 = cryptex_queue_create_with_target("session_handler", 0, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CryptexSession setDq:](v5, "setDq:", v13);

    v14 = objc_claimAutoreleasedReturnValue(-[CryptexSession dq](v5, "dq"));
    v15 = xpc_connection_create(0, v14);
    -[CryptexSession setListener:](v5, "setListener:", v15);

    v16 = dispatch_group_create();
    -[CryptexSession setSession_work_group:](v5, "setSession_work_group:", v16);

    -[CryptexSession setSession_removal_begun:](v5, "setSession_removal_begun:", 0);
    free(v7);

  }
  return v5;
}

- (void)sessionEventNotify:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  _xpc_connection_s *v17;
  void *v18;
  void *v19;
  void *v20;
  xpc_object_t v21;
  int64_t v22;
  id obj;
  uint64_t value;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  int64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  int64_t v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  value = cryptex_session_core_get_state();

  LODWORD(v5) = -[CryptexSession error](self, "error");
  v6 = objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  v7 = (void *)v6;
  v25 = a3;
  if ((_DWORD)v5)
    v8 = 32;
  else
    v8 = a3;
  v9 = cryptex_session_core_transition(v6, v8);

  v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v32 = a3;
    v33 = 2048;
    v34 = -[CryptexSession exit_code](self, "exit_code");
    v35 = 2048;
    v36 = -[CryptexSession stop_reason](self, "stop_reason");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionNotify event:%lld code: %llu reason: %lld", buf, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_xpc_connection_s **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v18 = objc_autoreleasePoolPush();
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
          v20 = (void *)cryptex_session_core_copy_xpc_object(v19);

          v21 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_value(v21, "object", v20);
          v22 = v25;
          if (v9 == 6)
          {
            xpc_dictionary_set_int64(v21, "error_event", -[CryptexSession error](self, "error"));
            v22 = 32;
          }
          xpc_dictionary_set_int64(v21, "start", value);
          xpc_dictionary_set_int64(v21, "event", v22);
          xpc_dictionary_set_int64(v21, "reason", -[CryptexSession stop_reason](self, "stop_reason"));
          xpc_dictionary_set_uint64(v21, "code", -[CryptexSession exit_code](self, "exit_code"));
          xpc_dictionary_set_int64(v21, "state", v9);
          xpc_connection_send_message(v17, v21);

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

  }
}

- (int)activate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  uint8_t buf[4];
  CryptexSession *v23;
  __int16 v24;
  int v25;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CryptexSession name](self, "name")));
  objc_msgSend(v3, "UTF8String");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  v5 = (void *)cryptex_session_core_copy_homedir();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_get_attributes();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_get_homedir_size();

  v8 = sub_10000E3B8();
  if ((_DWORD)v8)
  {
    v9 = *__error();
    v10 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 1024;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create user for %@: %{darwin.errno}d", buf, 0x12u);
    }

    v11 = 0;
    *__error() = v9;
  }
  else
  {
    v12 = sub_10000E3C0();
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
      cryptex_session_core_set_homedir(v13, v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
      cryptex_session_core_set_uid(v14, 0);

      v15 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = (CryptexSession *)v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created homedir %s", buf, 0xCu);
      }

      v8 = sub_1000380F4();
      if ((_DWORD)v8)
      {
        v16 = *__error();
        v17 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = self;
          v24 = 1024;
          v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to create launchd session for %@: %{darwin.errno}d", buf, 0x12u);
        }

        *__error() = v16;
      }
      else
      {
        sub_10001F2F4();
        v8 = 0;
      }
      v11 = (void *)v12;
    }
    else
    {
      v18 = *__error();
      v19 = objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = 22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to find homedir for user.: %{darwin.errno}d", buf, 8u);
      }

      v11 = 0;
      *__error() = v18;
      v8 = 22;
    }
  }
  -[CryptexSession setError:](self, "setError:", v8);
  -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 1);
  v20 = -[CryptexSession error](self, "error");
  free(v11);
  free(v5);
  return v20;
}

- (char)copySessionName
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  v3 = (char *)cryptex_session_core_copy_name(v2);

  return v3;
}

- (void)setExitReason:(int64_t)a3 withCode:(unint64_t)a4
{
  if (!-[CryptexSession stop_reason](self, "stop_reason"))
  {
    -[CryptexSession setStop_reason:](self, "setStop_reason:", a3);
    -[CryptexSession setExit_code:](self, "setExit_code:", a4);
  }
}

- (OS_session_core)cs
{
  return self->_cs;
}

- (void)setCs:(id)a3
{
  objc_storeStrong((id *)&self->_cs, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
  objc_storeStrong((id *)&self->_dq, a3);
}

- (NSMutableArray)peer_array
{
  return self->_peer_array;
}

- (void)setPeer_array:(id)a3
{
  objc_storeStrong((id *)&self->_peer_array, a3);
}

- (NSMutableArray)quire_array
{
  return self->_quire_array;
}

- (void)setQuire_array:(id)a3
{
  objc_storeStrong((id *)&self->_quire_array, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (OS_dispatch_group)session_work_group
{
  return self->_session_work_group;
}

- (void)setSession_work_group:(id)a3
{
  objc_storeStrong((id *)&self->_session_work_group, a3);
}

- (BOOL)session_removal_begun
{
  return self->_session_removal_begun;
}

- (void)setSession_removal_begun:(BOOL)a3
{
  self->_session_removal_begun = a3;
}

- (int64_t)stop_reason
{
  return self->_stop_reason;
}

- (void)setStop_reason:(int64_t)a3
{
  self->_stop_reason = a3;
}

- (unint64_t)exit_code
{
  return self->_exit_code;
}

- (void)setExit_code:(unint64_t)a3
{
  self->_exit_code = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session_work_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_quire_array, 0);
  objc_storeStrong((id *)&self->_peer_array, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cs, 0);
}

@end
