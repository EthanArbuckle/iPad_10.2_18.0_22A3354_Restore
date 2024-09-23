@implementation NESMSession

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NESMSession *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100076800;
  v20[4] = sub_100076810;
  v21 = (id)os_transaction_create("com.apple.nesessionmanager.networkDescriptionChange");
  v12 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100076818;
  v15[3] = &unk_1000BE688;
  v16 = v10;
  v17 = self;
  v18 = v9;
  v19 = v20;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, v15);

  _Block_object_dispose(v20, 8);
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4 sessionQueue:(id)a5 messageQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NESMSession *v15;
  NESMSession *v16;
  NSDate *firstFailedConnectTime;
  NSMutableArray *v18;
  NSMutableArray *clients;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *description;
  NESMPolicySession *policySession;
  OS_dispatch_queue *v29;
  NSObject *queue;
  dispatch_queue_attr_t v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *v33;
  OS_dispatch_queue *v34;
  NSObject *messageQueue;
  dispatch_queue_attr_t v36;
  dispatch_queue_t v37;
  OS_dispatch_queue *v38;
  objc_super v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)NESMSession;
  v15 = -[NESMSession init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    firstFailedConnectTime = v15->_firstFailedConnectTime;
    v15->_failedConnectCountWithinInterval = 0;
    v15->_firstFailedConnectTime = 0;
    v15->_connectedCount = 0;
    v15->_disconnectedCount = 0;
    v15->_connectCount = 0;

    v16->_status = 1;
    v18 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    clients = v16->_clients;
    v16->_clients = v18;

    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v16->_server, a4);
    v20 = (objc_class *)objc_opt_class(v16);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration name](v16->_configuration, "name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration identifier](v16->_configuration, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@:%@]"), v22, v23, v25));
    description = v16->_description;
    v16->_description = (NSString *)v26;

    policySession = v16->_policySession;
    v16->_policySession = 0;

    if (v13)
    {
      v29 = (OS_dispatch_queue *)v13;
      queue = v16->_queue;
      v16->_queue = v29;
    }
    else
    {
      v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      queue = objc_claimAutoreleasedReturnValue(v31);
      v32 = dispatch_queue_create("NetworkExtension session queue", queue);
      v33 = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v32;

    }
    if (v14)
    {
      v34 = (OS_dispatch_queue *)v14;
      messageQueue = v16->_messageQueue;
      v16->_messageQueue = v34;
    }
    else
    {
      v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      messageQueue = objc_claimAutoreleasedReturnValue(v36);
      v37 = dispatch_queue_create("NetworkExtension session message queue", messageQueue);
      v38 = v16->_messageQueue;
      v16->_messageQueue = (OS_dispatch_queue *)v37;

    }
  }

  return v16;
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  return -[NESMSession initWithConfiguration:andServer:sessionQueue:messageQueue:](self, "initWithConfiguration:andServer:sessionQueue:messageQueue:", a3, a4, 0, 0);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  NESMSession *v9;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: deallocating", buf, 0xCu);
  }

  sub_10007BC60(self);
  sub_10007885C(self);
  sub_10007BD2C(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession onDemandPauseTimerSource](self, "onDemandPauseTimerSource"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NESMSession onDemandPauseTimerSource](self, "onDemandPauseTimerSource"));
    dispatch_source_cancel(v6);

    -[NESMSession setOnDemandPauseTimerSource:](self, "setOnDemandPauseTimerSource:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)NESMSession;
  -[NESMSession dealloc](&v7, "dealloc");
}

- (id)description
{
  return self->_description;
}

- (void)addClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NESMSession *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093060;
  v7[3] = &unk_1000BEB58;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAllClients
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092EC0;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NESMServer *server;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](self, "messageQueue"));
  dispatch_suspend(v8);

  server = self->_server;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100092CB4;
  v12[3] = &unk_1000BEBD0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  -[NESMServer registerSession:withCompletionHandler:](server, "registerSession:withCompletionHandler:", self, v12);

}

- (void)handleCommand:(id)a3 fromClient:(id)a4
{
  id v6;
  _QWORD *v7;
  int64_t int64;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  xpc_object_t value;
  xpc_type_t type;
  uint64_t v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  xpc_object_t reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  int64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  xpc_object_t v60;
  xpc_object_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  _BYTE v66[22];
  __int16 v67;
  _QWORD *v68;
  __int16 v69;
  uint64_t v70;

  v6 = a3;
  v7 = a4;
  int64 = xpc_dictionary_get_int64(v6, "SessionCommandType");
  v10 = int64;
  if (!v7
    || (v7[3] & 1) == 0
    || (int64 == 6 || int64 == 1)
    && (v11 = objc_opt_class(NESMFlowDivertSession),
        int64 = objc_opt_isKindOfClass(self, v11),
        (int64 & 1) != 0))
  {
    switch(v10)
    {
      case 1:
        v12 = ne_log_obj(int64, v9);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = 138412546;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2112;
          *(_QWORD *)&v66[14] = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: Received a status query from %@", v66, 0x16u);
        }

        kdebug_trace(726990876, 0, 0, 0, 0);
        -[NESMSession handleGetStatusMessage:](self, "handleGetStatusMessage:", v6);
        break;
      case 2:
        kdebug_trace(726990880, 0, 0, 0, 0);
        value = xpc_dictionary_get_value(v6, "SessionOptions");
        type = (xpc_type_t)objc_claimAutoreleasedReturnValue(value);
        v17 = type;
        if (type && (type = xpc_get_type(type), type == (xpc_type_t)&_xpc_type_dictionary))
        {
          v19 = xpc_dictionary_get_BOOL(v17, "stop-current-session");
          type = (xpc_type_t)xpc_dictionary_get_BOOL(v17, "restart");
          v18 = (int)type;
        }
        else
        {
          v18 = 0;
          v19 = 0;
        }
        v41 = ne_log_obj(type, v16);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v66 = 138412802;
          *(_QWORD *)&v66[4] = self;
          if (v19 | v18)
            v43 = "re";
          else
            v43 = "";
          *(_WORD *)&v66[12] = 2080;
          *(_QWORD *)&v66[14] = v43;
          v67 = 2112;
          v68 = v7;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: Received a %sstart command from %@", v66, 0x20u);
        }

        if (-[NESMSession status](self, "status") != 1 && -[NESMSession status](self, "status") && v19 | v18)
        {
          v44 = -[NESMSession restartPending](self, "restartPending");
          if (v44)
          {
            v46 = ne_log_obj(v44, v45);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v66 = 138412546;
              *(_QWORD *)&v66[4] = self;
              *(_WORD *)&v66[12] = 2112;
              *(_QWORD *)&v66[14] = v7;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@: Ignore restart command from %@, a pending start command already exists", v66, 0x16u);
            }

LABEL_69:
            sub_100092BAC(v7, v48);
            goto LABEL_71;
          }
          -[NESMSession setRestartPending:](self, "setRestartPending:", 1);
          v61 = xpc_copy(v6);
          -[NESMSession setStartMessage:](self, "setStartMessage:", v61);

          if (v19)
          {
            v64 = ne_log_obj(v62, v63);
            v65 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v66 = 138412546;
              *(_QWORD *)&v66[4] = self;
              *(_WORD *)&v66[12] = 2112;
              *(_QWORD *)&v66[14] = v7;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%@: Stop current session as requested by an overriding restart command from %@", v66, 0x16u);
            }

            -[NESMSession handleStopMessageWithReason:](self, "handleStopMessageWithReason:", 36);
          }
        }
        else
        {
          if (-[NESMSession failedConnectCountWithinInterval](self, "failedConnectCountWithinInterval", *(_OWORD *)v66) >= 4
            && -[NESMSession status](self, "status") == 1)
          {
            v49 = sub_100092C34((uint64_t)self, v6);
            if ((_DWORD)v49)
            {
              if (!self
                || (v49 = -[NESMSession onDemandPauseLevelInternal](self, "onDemandPauseLevelInternal"), v49 != 2))
              {
                v51 = ne_log_obj(v49, v50);
                v52 = objc_claimAutoreleasedReturnValue(v51);
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v66 = 138412290;
                  *(_QWORD *)&v66[4] = self;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@: Damping VOD request: too many consecutive VPN connection attempts failed.", v66, 0xCu);
                }

                sub_10007C090(self, (id)2);
              }
            }
          }
          v53 = -[NESMSession status](self, "status");
          if ((_DWORD)v53 != 1
            || (v55 = sub_100092C34((uint64_t)self, v6), self)
            && v55
            && (v53 = -[NESMSession onDemandPauseLevelInternal](self, "onDemandPauseLevelInternal"), v53 == 2))
          {
            v56 = ne_log_obj(v53, v54);
            v57 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              if (v19 | v18)
                v58 = "re";
              else
                v58 = "";
              v59 = ne_session_status_to_string(-[NESMSession status](self, "status"));
              *(_DWORD *)v66 = 138413058;
              *(_QWORD *)&v66[4] = self;
              *(_WORD *)&v66[12] = 2080;
              *(_QWORD *)&v66[14] = v58;
              v67 = 2112;
              v68 = v7;
              v69 = 2080;
              v70 = v59;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@: Skip a %sstart command from %@: session in state %s", v66, 0x2Au);
            }

            goto LABEL_69;
          }
          v60 = xpc_copy(v6);
          -[NESMSession setStartMessage:](self, "setStartMessage:", v60);

          -[NESMSession registerSession:fromClient:](self, "registerSession:fromClient:", v6, v7);
        }
LABEL_71:

        break;
      case 3:
        v20 = xpc_dictionary_get_int64(v6, "SessionStopReason");
        v22 = ne_log_obj(v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v66 = 138412802;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2112;
          *(_QWORD *)&v66[14] = v7;
          v67 = 1024;
          LODWORD(v68) = v20;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Received a stop command from %@ with reason %d", v66, 0x1Cu);
        }

        kdebug_trace(726990884, 0, 0, 0, 0);
        if (!-[NESMSession status](self, "status") || -[NESMSession status](self, "status") == 1)
          sub_100092BAC(v7, v24);
        -[NESMSession handleStopMessageWithReason:](self, "handleStopMessageWithReason:", v20);
        break;
      case 4:
        v25 = ne_log_obj(int64, v9);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v66 = 138412546;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2112;
          *(_QWORD *)&v66[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: Received an IPC establish request from %@", v66, 0x16u);
        }

        kdebug_trace(726990888, 0, 0, 0, 0);
        -[NESMSession handleEstablishIPCMessage:](self, "handleEstablishIPCMessage:", v6);
        break;
      case 5:
        v27 = ne_log_obj(int64, v9);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v66 = 138412546;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2112;
          *(_QWORD *)&v66[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Received a security session info request from %@", v66, 0x16u);
        }

        kdebug_trace(726990892, 0, 0, 0, 0);
        -[NESMSession handleSecuritySessionInfoRequest:](self, "handleSecuritySessionInfoRequest:", v6);
        break;
      case 6:
        v29 = xpc_dictionary_get_int64(v6, "SessionInfoType");
        v31 = ne_log_obj(v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = 138412802;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2080;
          *(_QWORD *)&v66[14] = ne_session_info_type_to_string(v29);
          v67 = 2112;
          v68 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@: Received a info fetch request with type \"%s\" from %@", v66, 0x20u);
        }

        kdebug_trace(726990896, 0, 0, 0, 0);
        if (!v7)
          goto LABEL_33;
        v33 = v7[3];
        if ((v33 & 1) != 0 && (_DWORD)v29 != 4)
          goto LABEL_34;
        if ((v33 & 2) == 0)
        {
LABEL_33:
          if ((_DWORD)v29 == 4)
            goto LABEL_34;
        }
        -[NESMSession handleGetInfoMessage:withType:](self, "handleGetInfoMessage:withType:", v6, v29);
        break;
      case 7:
        v37 = xpc_dictionary_get_int64(v6, "SessionInfoType");
        v39 = ne_log_obj(v37, v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = 138412802;
          *(_QWORD *)&v66[4] = self;
          *(_WORD *)&v66[12] = 2080;
          *(_QWORD *)&v66[14] = ne_session_info_type_to_string(v37);
          v67 = 2112;
          v68 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%@: Received a send info request with type \"%s\" from %@", v66, 0x20u);
        }

        kdebug_trace(726990988, 0, 0, 0, 0);
        -[NESMSession handleSendInfoMessage:withType:](self, "handleSendInfoMessage:withType:", v6, v37);
        break;
      default:
        break;
    }
  }
  else if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
LABEL_34:
    reply = xpc_dictionary_create_reply(v6);
    remote_connection = xpc_dictionary_get_remote_connection(v6);
    v36 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v36, reply);

  }
}

- (void)handleGetStatusMessage:(id)a3
{
  id v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(xdict, "SessionStatus", -[NESMSession status](self, "status"));
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  xpc_connection_send_message(v6, xdict);
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  xpc_object_t value;
  void *v8;
  int64_t int64;
  int64_t euid;
  int v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  const char *string;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t is_debug_logging_enabled;
  int v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int *v31;
  char *v32;
  int v33;
  NESMSession *v34;
  __int16 v35;
  int *p_buffer;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  int buffer;
  NESMSession *v42;
  __int16 v43;
  void *v44;

  v4 = a3;
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  value = xpc_dictionary_get_value(v4, "SessionOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  int64 = xpc_dictionary_get_int64(v4, "SessionGroupID");
  euid = xpc_dictionary_get_int64(v4, "SessionUserID");
  v11 = xpc_dictionary_get_int64(v4, "SessionPID");

  if (v6)
  {
    if ((_DWORD)int64)
    {
      if ((_DWORD)euid)
        goto LABEL_4;
LABEL_8:
      euid = xpc_connection_get_euid(v6);
      if (!v8)
        goto LABEL_6;
      goto LABEL_5;
    }
    int64 = xpc_connection_get_egid(v6);
    if (!(_DWORD)euid)
      goto LABEL_8;
  }
LABEL_4:
  if (!v8)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_5:
  if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
    goto LABEL_6;
  v12 = xpc_dictionary_get_BOOL(v8, "is-on-demand");
LABEL_11:
  -[NESMSession setIsOnDemand:](self, "setIsOnDemand:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", euid));
  -[NESMSession setUID:](self, "setUID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", int64));
  -[NESMSession setGid:](self, "setGid:", v14);

  self->_lastStopReason = 0;
  if (-[NESMSession type](self, "type") == 1)
    sub_10007C090(self, 0);
  if (-[NESMSession isOnDemand](self, "isOnDemand"))
  {
    string = xpc_dictionary_get_string(v8, "match-hostname");
    v16 = (char *)proc_name(v11, &buffer, 0x100u);
    if ((int)v16 <= 0)
    {
      v18 = ne_log_obj(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v31 = __error();
        v32 = strerror(*v31);
        v33 = 138412546;
        v34 = self;
        v35 = 2080;
        p_buffer = (int *)v32;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ failed to obtain the triggering process' name: %s", (uint8_t *)&v33, 0x16u);
      }

      v16 = strncpy((char *)&buffer, "<unknown>", 0x100uLL);
    }
    v20 = ne_log_obj(v16, v17);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "<none>";
      v33 = 138413058;
      if (string)
        v22 = string;
      v34 = self;
      v35 = 2080;
      p_buffer = &buffer;
      v37 = 1024;
      v38 = v11;
      v39 = 2080;
      v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ starting on demand from process %s (%d) matching hostname %s", (uint8_t *)&v33, 0x26u);
    }

  }
  is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  v24 = is_debug_logging_enabled;
  v25 = ne_log_large_obj(is_debug_logging_enabled);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      buffer = 138412546;
      v42 = self;
      v43 = 2112;
      v44 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@ starting with configuration: %@", (uint8_t *)&buffer, 0x16u);

    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "descriptionWithOptions:", 2));
    buffer = 138412546;
    v42 = self;
    v43 = 2112;
    v44 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@ starting with configuration: %@", (uint8_t *)&buffer, 0x16u);

  }
  -[NESMSession setStatus:](self, "setStatus:", 2);

}

- (void)handleStopMessageWithReason:(int)a3
{
  -[NESMSession setLastStopReason:](self, "setLastStopReason:");
  if (a3 != 36)
  {
    if (a3 == 1 && -[NESMSession type](self, "type") == 1)
      sub_10007C090(self, (id)1);
    -[NESMSession setRestartPending:](self, "setRestartPending:", 0);
    -[NESMSession setStartMessage:](self, "setStartMessage:", 0);
  }
}

- (BOOL)canSleep
{
  return 1;
}

- (BOOL)handleSleep
{
  return 0;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  NSObject *v6;
  _QWORD block[5];

  v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", a3, a4, a5));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092A78;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  id v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  xpc_object_t message;

  v4 = a3;
  message = xpc_dictionary_create_reply(v4);
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  xpc_connection_send_message(v6, message);
}

- (id)copyExtendedStatus
{
  void *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession startMessage](self, "startMessage"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession startMessage](self, "startMessage"));
  v5 = xpc_copy(v4);

  xpc_dictionary_set_value(v5, "SessionBootstrapPort", 0);
  xpc_dictionary_set_value(v5, "SessionAuditSessionPort", 0);
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  if ((isa_nsdictionary(v7) & 1) == 0)
  {

    return 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SessionOptions")));
  v9 = isa_nsdictionary(v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SessionOptions")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

    v12 = kSCEntNetVPN;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kSCEntNetVPN));
    v14 = isa_nsdictionary(v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v15));

      if (isa_nsdictionary(v16))
      {
        v17 = kSCPropNetVPNAuthPassword;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kSCPropNetVPNAuthPassword));

        if (v18)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("****"), v17);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v12);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("SessionOptions"));
        }
      }

    }
  }
  v21 = CFSTR("StartMessage");
  v22 = v7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  return v19;
}

- (void)handleNetworkPrepareResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NESMSession *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: Network available via interface %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: No network available", (uint8_t *)&v9, 0xCu);
  }

}

- (void)satisfyPathResult:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092A6C;
  v7[3] = &unk_1000BEB58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)prepareNetwork
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[5];

  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  if (v3)
    v4 = v3[6];
  else
    v4 = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryPhysicalInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interfaceName"));

  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 1 || !v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100092A54;
    v12[3] = &unk_1000BEB80;
    v12[4] = self;
    dispatch_async(v9, v12);
LABEL_10:

    goto LABEL_11;
  }
  if (v4 == 3)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    -[NSObject satisfyPathForSession:](v9, "satisfyPathForSession:", self);
    goto LABEL_10;
  }
  if (v4 == 1)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100092A60;
    block[3] = &unk_1000BEB58;
    block[4] = self;
    v11 = v7;
    dispatch_async(v8, block);

  }
LABEL_11:

}

- (void)notifyChangedExtendedStatus
{
  xpc_object_t v3;
  const char *v4;
  id Property;
  id v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if (v12)
          v12 = objc_getProperty(v12, v8, 16, 1);
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return a3 < 2;
}

- (void)setStatus:(int)a3
{
  uint64_t v3;
  unsigned int status;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t isKindOfClass;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  SEL v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  SEL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  NESMSession *v37;
  void *v38;
  unsigned int v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  uint64_t v52;
  id v53;
  SEL v54;
  id v55;
  id v56;
  const char *v57;
  id v58;
  uint64_t v59;
  void *i;
  id Property;
  uint64_t v62;
  NESMSession *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  NSNumber *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  BOOL v84;
  uint8_t v85[128];
  _BYTE buf[24];
  void *v87;
  __CFString *v88;
  id v89;
  uint8_t v90[4];
  NESMSession *v91;
  __int16 v92;
  id v93;

  v3 = *(_QWORD *)&a3;
  status = self->_status;
  v6 = -[NESMSession shouldBeIdleForStatus:](self, "shouldBeIdleForStatus:", status);
  v7 = -[NESMSession shouldBeIdleForStatus:](self, "shouldBeIdleForStatus:", v3);
  v8 = self->_status;
  self->_status = v3;
  if (status != (_DWORD)v3)
  {
    v9 = v7;
    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = objc_opt_class(NESMVPNSession);
    isKindOfClass = objc_opt_isKindOfClass(self, v11);
    if ((isKindOfClass & 1) != 0)
    {
      isKindOfClass = (uint64_t)-[NESMSession parentType](self, "parentType");
      v14 = isKindOfClass == 2;
    }
    else
    {
      v14 = 0;
    }
    if (((v6 ^ 1 | v9) & 1) == 0 && !v14)
    {
      v15 = ne_log_obj(isKindOfClass, v13);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ is no longer idle, beginning transaction", buf, 0xCu);
      }

      v17 = objc_alloc((Class)NSString);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
      v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("com.apple.nesessionmanager.activeSession.%@"), v19);

      v21 = (void *)os_transaction_create(objc_msgSend(v20, "UTF8String"));
      objc_setProperty_atomic(self, v22, v21, 56);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      sub_10005190C(v23, 1);

    }
    if (((v6 | v9 ^ 1 | v14) & 1) == 0)
    {
      v24 = ne_log_obj(isKindOfClass, v13);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ is now idle, ending transaction", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v26, 0, 56);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      sub_10005190C(v27, -1);

    }
    v28 = -[NESMSession type](self, "type");
    if ((_DWORD)v28 == 2 && (v3 - 5) <= 0xFFFFFFFD && v8 == 2)
    {
      v30 = ne_log_obj(v28, v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@ Per-app VPN failed to connect, pausing VPN On Demand", buf, 0xCu);
      }

      v28 = (uint64_t)sub_10007C090(self, (id)2);
    }
    if ((_DWORD)v3 != 1)
    {
      if ((_DWORD)v3 == 3)
      {
        kdebug_trace(726990940, 0, 0, 0, 0);
        -[NESMSession setConnectedCount:](self, "setConnectedCount:", (char *)-[NESMSession connectedCount](self, "connectedCount") + 1);
        -[NESMSession setFailedConnectCountWithinInterval:](self, "setFailedConnectCountWithinInterval:", 0);
        v28 = (uint64_t)-[NESMSession setFirstFailedConnectTime:](self, "setFirstFailedConnectTime:", 0);
      }
      else if ((_DWORD)v3 == 2)
      {
        v28 = (uint64_t)-[NESMSession setConnectCount:](self, "setConnectCount:", (char *)-[NESMSession connectCount](self, "connectCount") + 1);
      }
LABEL_32:
      if (qword_1000CF970 != -1)
        dispatch_once(&qword_1000CF970, &stru_1000BEC30);
      v39 = self->_status;
      if (v39 == 1)
      {
        -[NESMSession setLastConnectedDuration:](self, "setLastConnectedDuration:", 0);
        if (-[NESMSession connectTime](self, "connectTime"))
        {
          v40 = (unint64_t)(*(double *)&qword_1000CF968 * (double)mach_absolute_time());
          v41 = v40 - -[NESMSession connectTime](self, "connectTime");
          if (-[NESMSession maxConnectTime](self, "maxConnectTime") < v41)
            -[NESMSession setMaxConnectTime:](self, "setMaxConnectTime:", v41);
          -[NESMSession setLastConnectedDuration:](self, "setLastConnectedDuration:", v41);
        }
        -[NESMSession setConnectTime:](self, "setConnectTime:", 0);
        v42 = -[NESMSession lastStopReason](self, "lastStopReason") == 32;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_100092978;
        v83[3] = &unk_1000BEC58;
        v84 = v42;
        v83[4] = self;
        sub_100052CA0((uint64_t)v43, self, v83);

      }
      else
      {
        if (v39 != 3)
          goto LABEL_43;
        -[NESMSession setConnectTime:](self, "setConnectTime:", (unint64_t)(*(double *)&qword_1000CF968 * (double)mach_absolute_time()));
        v28 = (uint64_t)-[NESMSession setLastStopReason:](self, "setLastStopReason:", 0);
      }
      v39 = self->_status;
LABEL_43:
      v44 = ne_log_obj(v28, v29);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
      if (v39 > 1)
      {
        if (!v46)
          goto LABEL_49;
        v52 = ne_session_status_to_string(self->_status);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v52;
        v49 = "%@: status changed to %s";
        v50 = v45;
        v51 = 22;
      }
      else
      {
        if (!v46)
          goto LABEL_49;
        v47 = ne_session_status_to_string(self->_status);
        v48 = ne_session_stop_reason_to_string(-[NESMSession lastStopReason](self, "lastStopReason"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2080;
        v87 = (void *)v48;
        v49 = "%@: status changed to %s, last stop reason %s";
        v50 = v45;
        v51 = 32;
      }
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
LABEL_49:

      v53 = objc_alloc_init((Class)NSDate);
      -[NESMSession setLastStatusChangeTime:](self, "setLastStatusChangeTime:", v53);

      xpc_dictionary_set_int64(v10, "SessionNotificationType", 1);
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v55 = objc_getProperty(self, v54, 48, 1);
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      if (v56)
      {
        v58 = v56;
        v59 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v58; i = (char *)i + 1)
          {
            if (*(_QWORD *)v80 != v59)
              objc_enumerationMutation(v55);
            Property = *(id *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
            if (Property)
              Property = objc_getProperty(Property, v57, 16, 1);
            xpc_connection_send_message((xpc_connection_t)Property, v10);
          }
          v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        }
        while (v58);

        if (!self)
          goto LABEL_78;
      }
      else
      {

      }
      v62 = objc_opt_class(NESMVPNSession);
      if ((objc_opt_isKindOfClass(self, v62) & 1) != 0)
      {
        v63 = self;
        if ((-[NESMSession type](v63, "type") == 1
           || -[NESMSession type](v63, "type") == 2
           || -[NESMSession type](v63, "type") == 3)
          && -[NESMSession status](v63, "status"))
        {
          if (qword_1000CF960 != -1)
            dispatch_once(&qword_1000CF960, &stru_1000BEC10);
          v64 = objc_alloc_init((Class)NSMutableDictionary);
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v63, "configuration"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v66, CFSTR("identifier"));

          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession status](v63, "status")));
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v67, CFSTR("status"));

          objc_msgSend(v64, "setObject:forKeyedSubscript:", &stru_1000BF2E8, CFSTR("tunnel-intf"));
          objc_msgSend(v64, "setObject:forKeyedSubscript:", &stru_1000BF2E8, CFSTR("delegate-intf"));
          objc_msgSend(v64, "setObject:forKeyedSubscript:", &stru_1000BF2E8, CFSTR("delegate-intf-type"));
          objc_msgSend(v64, "setObject:forKeyedSubscript:", &off_1000C1840, CFSTR("duration"));
          v68 = -[NESMSession copyTunnelInterfaceName](v63, "copyTunnelInterfaceName");
          if (v68)
          {
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v68, CFSTR("tunnel-intf"));
            v69 = (void *)NEVirtualInterfaceCopyDelegateInterfaceName(-[NESMSession virtualInterface](v63, "virtualInterface"));
            if (v69)
            {
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v69, CFSTR("delegate-intf"));
              v70 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", NEVirtualInterfaceGetDelegateInterfaceFunctionalType(-[NESMSession virtualInterface](v63, "virtualInterface")));
              v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v71, CFSTR("delegate-intf-type"));

            }
          }
          v72 = (id)-[NESMSession status](v63, "status");
          if ((_DWORD)v72 == 1)
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NESMSession lastConnectedDuration](v63, "lastConnectedDuration")));
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v74, CFSTR("duration"));

          }
          v75 = ne_log_obj(v72, v73);
          v76 = objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v90 = 138412546;
            v91 = v63;
            v92 = 2112;
            v93 = v64;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%@: submitting event dictionary to powerlog %@", v90, 0x16u);
          }

          v77 = qword_1000CF958;
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_10009298C;
          v87 = &unk_1000BEB58;
          v88 = CFSTR("VPN status change");
          v89 = v64;
          v78 = v64;
          dispatch_async(v77, buf);

        }
      }
LABEL_78:

      goto LABEL_79;
    }
    -[NESMSession setDisconnectedCount:](self, "setDisconnectedCount:", (char *)-[NESMSession disconnectedCount](self, "disconnectedCount") + 1);
    v28 = (uint64_t)sub_100076E38(self);
    if (!(_DWORD)v28)
      goto LABEL_32;
    if (-[NESMSession failedConnectCountWithinInterval](self, "failedConnectCountWithinInterval"))
    {
      v28 = objc_claimAutoreleasedReturnValue(-[NESMSession firstFailedConnectTime](self, "firstFailedConnectTime"));
      if (!v28)
        goto LABEL_32;
      v32 = (void *)v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession firstFailedConnectTime](self, "firstFailedConnectTime"));
      objc_msgSend(v33, "timeIntervalSinceNow");
      v35 = v34 + 1.0;

      if (v35 < 0.0)
        goto LABEL_32;
      v36 = -[NESMSession failedConnectCountWithinInterval](self, "failedConnectCountWithinInterval") + 1;
      v37 = self;
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NESMSession setFirstFailedConnectTime:](self, "setFirstFailedConnectTime:", v38);

      v37 = self;
      v36 = 1;
    }
    v28 = (uint64_t)-[NESMSession setFailedConnectCountWithinInterval:](v37, "setFailedConnectCountWithinInterval:", v36);
    goto LABEL_32;
  }
LABEL_79:
  sub_1000788C8(self);
}

- (void)setUID:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *uid;

  v4 = a3;
  if (v4)
  {

    v5 = (NSNumber *)&off_1000C1840;
  }
  else
  {
    v5 = 0;
  }
  uid = self->_uid;
  self->_uid = v5;

}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  return 0;
}

- (int)lastStopReason
{
  NESMSession *v2;
  int lastStopReason;

  v2 = self;
  objc_sync_enter(v2);
  lastStopReason = v2->_lastStopReason;
  objc_sync_exit(v2);

  return lastStopReason;
}

- (void)setLastStopReason:(int)a3
{
  uint64_t v3;
  NESMSession *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _DWORD v10[2];

  v3 = *(_QWORD *)&a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  if ((v3 & 0xFFFFFFDF) == 0 || !v4->_lastStopReason)
  {
    v7 = ne_log_obj(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting last stop reason to %d", (uint8_t *)v10, 8u);
    }

    v4->_lastStopReason = v3;
    if ((_DWORD)v3 != 3)
    {
      v9 = +[NEVPNConnection createDisconnectErrorWithDomain:code:](NEVPNConnection, "createDisconnectErrorWithDomain:code:", CFSTR("NEVPNConnectionErrorDomainPlugin"), v3);
      -[NESMSession setLastDisconnectError:](v4, "setLastDisconnectError:", v9);

    }
  }
  objc_sync_exit(v4);

}

- (NSError)lastDisconnectError
{
  NESMSession *v2;
  NSError *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastDisconnectError;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLastDisconnectError:(id)a3
{
  NSError *v5;
  NESMSession *v6;
  NSError *lastDisconnectError;
  NSError **p_lastDisconnectError;
  void *v9;
  NSError *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSError *v20;
  id v21;
  uint8_t buf[4];
  NSError *v23;
  __int16 v24;
  void *v25;

  v5 = (NSError *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_lastDisconnectError = &v6->_lastDisconnectError;
  lastDisconnectError = v6->_lastDisconnectError;
  if (lastDisconnectError != v5 && (-[NSError isEqual:](lastDisconnectError, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_lastDisconnectError, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v6, "auxiliaryDataKey"));

    if (v9)
    {
      v10 = *p_lastDisconnectError;
      if (*p_lastDisconnectError)
      {
        v21 = 0;
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v21));
        v12 = v21;
        v14 = v12;
        if (v11)
        {

LABEL_11:
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v6, "auxiliaryDataKey"));
          objc_msgSend(v17, "setAuxiliaryData:forKey:", v11, v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
          objc_msgSend(v19, "commit");

          goto LABEL_12;
        }
        v15 = ne_log_obj(v12, v13);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v20 = *p_lastDisconnectError;
          *(_DWORD *)buf = 138412546;
          v23 = v20;
          v24 = 2112;
          v25 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error (%@): %@", buf, 0x16u);
        }

      }
      v11 = objc_alloc_init((Class)NSData);
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_sync_exit(v6);

}

- (void)setupFromAuxiliaryData
{
  NESMSession *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v2, "auxiliaryDataKey"));
  v5 = objc_msgSend(v3, "copyAuxiliaryDataForKey:", v4);

  if (isa_nsdata(v5) && objc_msgSend(v5, "length"))
  {
    v9 = 0;
    v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSError), v5, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v9;
    if (v7)
      objc_storeStrong((id *)&v2->_lastDisconnectError, v7);

  }
  objc_sync_exit(v2);

}

- (int)SCNCStatus
{
  return SCNetworkConnectionGetStatusFromNEStatus(-[NESMSession status](self, "status"));
}

- (void)handleUpdateConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NESMSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000922F0;
  block[3] = &unk_1000BECA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t is_debug_logging_enabled;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  char v14;
  void *v15;
  int v17;
  NESMSession *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "generateSignature"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configurationSignature](self, "configurationSignature"));
    v8 = objc_msgSend(v7, "isEqualToData:", v6);

    if ((v8 & 1) == 0)
    {
      is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      v10 = is_debug_logging_enabled;
      v11 = ne_log_large_obj(is_debug_logging_enabled);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v17 = 138412546;
          v18 = self;
          v19 = 2112;
          v20 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: handling configuration changed: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "descriptionWithOptions:", 2));
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: handling configuration changed: %@", (uint8_t *)&v17, 0x16u);

      }
      -[NESMSession setConfiguration:](self, "setConfiguration:", v5);
      -[NESMSession setConfigurationSignature:](self, "setConfigurationSignature:", v6);
      sub_10007B40C((uint64_t)self, 1);
    }
    v14 = v8 ^ 1;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)installWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000922B4;
  v7[3] = &unk_1000BECD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)installPendedOnQueue
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000922AC;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)uninstallOnQueue
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000922A4;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopIfNecessaryWithReason:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100092004;
  v6[3] = &unk_1000BECF8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  NESMSession *v8;
  __int16 v9;
  const char *v10;

  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[NESMSession stopIfNecessaryWithReason:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: %s not supported", (uint8_t *)&v7, 0x16u);
  }

}

- (NSString)pluginType
{
  return 0;
}

- (BOOL)isActive
{
  return -[NESMSession status](self, "status") == 3
      || -[NESMSession status](self, "status") == 2
      || -[NESMSession status](self, "status") == 4;
}

- (void)invalidate
{
  NESMServer *server;

  self->_status = 0;
  server = self->_server;
  self->_server = 0;

}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  id v6;
  xpc_object_t v7;
  int int64;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  BOOL v14;

  v6 = a3;
  v7 = v6;
  if (!v6)
    v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "SessionCommandType", 2);
  int64 = xpc_dictionary_get_int64(v7, "SessionPID");
  if (!int64)
    int64 = getpid();
  v9 = objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091E34;
  block[3] = &unk_1000BED48;
  v14 = a4;
  block[4] = self;
  v12 = v7;
  v13 = int64;
  v10 = v7;
  dispatch_async(v9, block);

}

- (void)restartSession
{
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  v6 = v4;
  if (v4)
  {
    xpc_dictionary_set_BOOL(v4, "restart", 1);
  }
  else
  {
    v7 = ne_log_obj(0, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", v9, 2u);
    }

  }
  xpc_dictionary_set_value(v3, "SessionOptions", v6);
  -[NESMSession startWithCommand:isOnDemand:](self, "startWithCommand:isOnDemand:", v3, 0);

}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  return 0;
}

- (id)getIDSNetworkAgentDomain
{
  uint64_t v2;
  __CFString *v3;

  v2 = NEGetConsoleUserUID(self, a2);
  if ((_DWORD)v2)
    v3 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("ids%d"), v2);
  else
    v3 = CFSTR("ids501");
  return v3;
}

- (BOOL)disableDefaultDropAfterBoot
{
  return 0;
}

- (BOOL)supportsDefaultDrop
{
  return 0;
}

- (BOOL)waitForPerApp
{
  return 0;
}

- (void)sendConfigurationChangeHandledNotification
{
  xpc_object_t v3;
  const char *v4;
  id Property;
  id v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if (v12)
          v12 = objc_getProperty(v12, v8, 16, 1);
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)pauseOnDemand
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NESMSession *v6;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: pause VPN OnDemand", (uint8_t *)&v5, 0xCu);
  }

  sub_10007C090(self, (id)3);
}

- (void)unpauseOnDemand
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NESMSession *v6;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: unpause VPN OnDemand", (uint8_t *)&v5, 0xCu);
  }

  sub_10007C090(self, 0);
}

- (int)status
{
  return self->_status;
}

- (int)type
{
  return self->_type;
}

- (NESMServer)server
{
  return (NESMServer *)objc_getProperty(self, a2, 64, 1);
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)configurationSignature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConfigurationSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)configurationUserUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigurationUserUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)uid
{
  return self->_uid;
}

- (NSNumber)gid
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setGid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)isOnDemand
{
  return self->_isOnDemand;
}

- (void)setIsOnDemand:(BOOL)a3
{
  self->_isOnDemand = a3;
}

- (unint64_t)connectTime
{
  return self->_connectTime;
}

- (void)setConnectTime:(unint64_t)a3
{
  self->_connectTime = a3;
}

- (unint64_t)lastConnectedDuration
{
  return self->_lastConnectedDuration;
}

- (void)setLastConnectedDuration:(unint64_t)a3
{
  self->_lastConnectedDuration = a3;
}

- (int64_t)connectCount
{
  return self->_connectCount;
}

- (void)setConnectCount:(int64_t)a3
{
  self->_connectCount = a3;
}

- (int64_t)connectedCount
{
  return self->_connectedCount;
}

- (void)setConnectedCount:(int64_t)a3
{
  self->_connectedCount = a3;
}

- (int64_t)disconnectedCount
{
  return self->_disconnectedCount;
}

- (void)setDisconnectedCount:(int64_t)a3
{
  self->_disconnectedCount = a3;
}

- (unint64_t)maxConnectTime
{
  return self->_maxConnectTime;
}

- (void)setMaxConnectTime:(unint64_t)a3
{
  self->_maxConnectTime = a3;
}

- (NESMPolicySession)policySession
{
  return (NESMPolicySession *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPolicySession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (int64_t)failedConnectCountWithinInterval
{
  return self->_failedConnectCountWithinInterval;
}

- (void)setFailedConnectCountWithinInterval:(int64_t)a3
{
  self->_failedConnectCountWithinInterval = a3;
}

- (NSDate)firstFailedConnectTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFirstFailedConnectTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)lastStatusChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastStatusChangeTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)auxiliaryDataKey
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAuxiliaryDataKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NEPolicySession)controlPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 216, 1);
}

- (void)setControlPolicySession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NEPolicySession)highPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 224, 1);
}

- (void)setHighPolicySession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NWNetworkAgentRegistration)networkAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 232, 1);
}

- (void)setNetworkAgentRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NENetworkAgent)networkAgent
{
  return (NENetworkAgent *)objc_getProperty(self, a2, 240, 1);
}

- (void)setNetworkAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NWMonitor)onDemandMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOnDemandMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NEOnDemandRule)matchedRule
{
  return (NEOnDemandRule *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMatchedRule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSMutableArray)networkAgentInterfaces
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setNetworkAgentInterfaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSArray)registeredNetworkAgentInterfaces
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setRegisteredNetworkAgentInterfaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (int64_t)onDemandPauseLevelInternal
{
  return self->_onDemandPauseLevelInternal;
}

- (void)setOnDemandPauseLevelInternal:(int64_t)a3
{
  self->_onDemandPauseLevelInternal = a3;
}

- (OS_dispatch_source)onDemandPauseTimerSource
{
  return self->_onDemandPauseTimerSource;
}

- (void)setOnDemandPauseTimerSource:(id)a3
{
  self->_onDemandPauseTimerSource = (OS_dispatch_source *)a3;
}

- (NSMutableArray)staleOnDemandDNSKeys
{
  return (NSMutableArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setStaleOnDemandDNSKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NWResolver)dnsRedirectionDetector
{
  return (NWResolver *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDnsRedirectionDetector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (OS_os_transaction)dnsRedirectionTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDnsRedirectionTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)lastPrimaryInterface
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLastPrimaryInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSMutableArray)onDemandDomainCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setOnDemandDomainCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (BOOL)restartPending
{
  return self->_restartPending;
}

- (void)setRestartPending:(BOOL)a3
{
  self->_restartPending = a3;
}

- (OS_xpc_object)startMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336, 1);
}

- (void)setStartMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (BOOL)disableOnDemand
{
  return self->_disableOnDemand;
}

- (void)setDisableOnDemand:(BOOL)a3
{
  self->_disableOnDemand = a3;
}

- (int64_t)defaultDropType
{
  return self->_defaultDropType;
}

- (void)setDefaultDropType:(int64_t)a3
{
  self->_defaultDropType = a3;
}

- (BOOL)isDropPersistent
{
  return self->_isDropPersistent;
}

- (void)setIsDropPersistent:(BOOL)a3
{
  self->_isDropPersistent = a3;
}

- (BOOL)isDeregisteredEnterpriseVPNSession
{
  return self->_isDeregisteredEnterpriseVPNSession;
}

- (void)setIsDeregisteredEnterpriseVPNSession:(BOOL)a3
{
  self->_isDeregisteredEnterpriseVPNSession = a3;
}

- (BOOL)isDeregisteredAppVPNSession
{
  return self->_isDeregisteredAppVPNSession;
}

- (void)setIsDeregisteredAppVPNSession:(BOOL)a3
{
  self->_isDeregisteredAppVPNSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startMessage, 0);
  objc_storeStrong((id *)&self->_onDemandDomainCache, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterface, 0);
  objc_storeStrong((id *)&self->_dnsRedirectionTransaction, 0);
  objc_storeStrong((id *)&self->_dnsRedirectionDetector, 0);
  objc_storeStrong((id *)&self->_staleOnDemandDNSKeys, 0);
  objc_storeStrong((id *)&self->_registeredNetworkAgentInterfaces, 0);
  objc_storeStrong((id *)&self->_networkAgentInterfaces, 0);
  objc_storeStrong((id *)&self->_matchedRule, 0);
  objc_storeStrong((id *)&self->_onDemandMonitor, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
  objc_storeStrong((id *)&self->_networkAgentRegistration, 0);
  objc_storeStrong((id *)&self->_highPolicySession, 0);
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_auxiliaryDataKey, 0);
  objc_storeStrong((id *)&self->_lastStatusChangeTime, 0);
  objc_storeStrong((id *)&self->_firstFailedConnectTime, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_gid, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationUserUUIDs, 0);
  objc_storeStrong((id *)&self->_configurationSignature, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_lastDisconnectError, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (id)sessionWithConfiguration:(id)a3 andType:(int)a4 andServer:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NESMIKEv2VPNSession *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  NESMIKEv2VPNFallbackSession *v24;
  void *v25;
  void *v26;
  NESMFlowDivertSession *v27;
  void *v28;
  void *v29;
  id v30;
  NESMLegacySession *v31;
  NESMLegacySession *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  _BOOL8 v37;
  uint64_t v38;
  __objc2_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NESMDNSProxySession *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL8 v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NESMLegacySession *v60;
  void *v61;
  void *v62;
  id v63;
  NESMFlowDivertSession *v64;
  void *v65;
  void *v66;
  unsigned __int8 v67;
  void *v68;
  void *v69;
  id v70;
  __objc2_class *v71;
  NESMVPNSession *v72;
  NESMVPNSession *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NESMVPNSession *v79;
  _BYTE buf[22];
  __int16 v82;
  void *v83;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = ne_session_type_to_string(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    v82 = 2112;
    v83 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating session with type %s, id %@ (%@)", buf, 0x20u);

  }
  switch((int)v6)
  {
    case 1:
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "protocol"));
        v18 = (char *)objc_msgSend(v17, "type");

        if ((unint64_t)(v18 - 1) < 2)
        {
          v60 = [NESMLegacySession alloc];
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
          v32 = v60;
          v33 = v7;
          v34 = v8;
          v35 = v26;
          v36 = 1;
          goto LABEL_49;
        }
        if (v18 == (char *)4)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "protocol"));

          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
          v70 = objc_msgSend(v69, "tunnelType");

          if (v70 == (id)1)
            v71 = NESMVPNSession;
          else
            v71 = NESMTransparentProxySession;
          v79 = (NESMVPNSession *)[v71 alloc];
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pluginType"));
          v73 = v79;
          v74 = v7;
          v75 = v8;
          v76 = v25;
          v77 = v26;
          v78 = 1;
          goto LABEL_65;
        }
        if (v18 != (char *)5)
          goto LABEL_47;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "protocol"));
        if ((objc_msgSend(v20, "enableFallback") & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "protocol"));
          v23 = objc_msgSend(v22, "includeAllNetworks");

          if ((v23 & 1) == 0)
          {
            v24 = [NESMIKEv2VPNFallbackSession alloc];
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
            v27 = (NESMFlowDivertSession *)sub_100085DB8(v24, v7, v8, v26);
            goto LABEL_66;
          }
        }
        else
        {

        }
        v15 = [NESMIKEv2VPNSession alloc];
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
        if (v15)
        {
          *(_QWORD *)buf = v15;
          *(_QWORD *)&buf[8] = NESMIKEv2VPNSession;
          v27 = (NESMFlowDivertSession *)objc_msgSendSuper2((objc_super *)buf, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:", v7, v8, v26, CFSTR("com.apple.NetworkExtension.IKEv2Provider"), 1, 0, 0, 1, 0);
          goto LABEL_66;
        }
        goto LABEL_67;
      }
      goto LABEL_68;
    case 2:
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));

      if (v15)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "protocol"));
        v30 = objc_msgSend(v29, "type");

        if (v30 == (id)5)
        {
          v15 = [NESMIKEv2VPNSession alloc];
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
          if (!v15)
            goto LABEL_67;
          *(_QWORD *)buf = v15;
          *(_QWORD *)&buf[8] = NESMIKEv2VPNSession;
          v27 = (NESMFlowDivertSession *)objc_msgSendSuper2((objc_super *)buf, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:", v7, v8, v26, CFSTR("com.apple.NetworkExtension.IKEv2Provider"), 2, 0, 0, 1, 0);
        }
        else if (v30 == (id)4)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "protocol"));

          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
          v63 = objc_msgSend(v62, "tunnelType");

          if (v63 == (id)2)
          {
            v64 = [NESMFlowDivertSession alloc];
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pluginType"));
            v27 = -[NESMFlowDivertSession initWithConfiguration:andServer:andProtocol:andPluginType:](v64, "initWithConfiguration:andServer:andProtocol:andPluginType:", v7, v8, v25, v26);
          }
          else
          {
            v72 = [NESMVPNSession alloc];
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pluginType"));
            v73 = v72;
            v74 = v7;
            v75 = v8;
            v76 = v25;
            v77 = v26;
            v78 = 2;
LABEL_65:
            v27 = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:](v73, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:", v74, v75, v76, v77, v78);
          }
        }
        else
        {
          if (v30 != (id)1)
            goto LABEL_47;
          v31 = [NESMLegacySession alloc];
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
          v32 = v31;
          v33 = v7;
          v34 = v8;
          v35 = v26;
          v36 = 2;
LABEL_49:
          v27 = (NESMFlowDivertSession *)sub_100063740(v32, v33, v34, v35, v36);
        }
LABEL_66:
        v15 = (NESMIKEv2VPNSession *)v27;
        goto LABEL_67;
      }
      goto LABEL_68;
    case 3:
      v37 = +[NESMAlwaysOnSession hasRequiredFrameworks](NESMAlwaysOnSession, "hasRequiredFrameworks");
      if (!v37)
      {
        v54 = ne_log_obj(v37, v38);
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          goto LABEL_46;
        *(_WORD *)buf = 0;
        v56 = "Cannot create an Always On VPN session, some required frameworks are missing";
        goto LABEL_70;
      }
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alwaysOnVPN"));

      if (v15)
      {
        v39 = NESMAlwaysOnSession;
        goto LABEL_38;
      }
      goto LABEL_68;
    case 4:
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentFilter"));
      if (!v15)
        goto LABEL_68;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentFilter"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "provider"));
      if ((objc_msgSend(v41, "filterBrowsers") & 1) != 0)
        goto LABEL_23;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentFilter"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "provider"));
      if ((objc_msgSend(v43, "filterSockets") & 1) != 0)
      {

LABEL_23:
LABEL_24:
        v39 = NESMFilterSession;
        goto LABEL_38;
      }
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentFilter"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "provider"));
      v67 = objc_msgSend(v66, "filterPackets");

      if ((v67 & 1) != 0)
        goto LABEL_24;
LABEL_47:
      v15 = 0;
LABEL_68:
      -[NESMVPNSession handleInitializeState](v15, "handleInitializeState");

      return v15;
    case 5:
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathController"));

      if (!v15)
        goto LABEL_68;
      v39 = NESMPathControllerSession;
      goto LABEL_38;
    case 6:
      v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dnsProxy"));

      if (v15)
      {
        v44 = [NESMDNSProxySession alloc];
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dnsProxy"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "protocol"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dnsProxy"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "protocol"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pluginType"));
        v15 = -[NESMDNSProxySession initWithConfiguration:andServer:andProtocol:andPluginType:](v44, "initWithConfiguration:andServer:andProtocol:andPluginType:", v7, v8, v26, v47);

LABEL_67:
      }
      goto LABEL_68;
    case 7:
      v48 = +[NESMDNSSettingsSession hasRequiredFrameworks](NESMDNSSettingsSession, "hasRequiredFrameworks");
      if (v48)
      {
        v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dnsSettings"));

        if (!v15)
          goto LABEL_68;
        v39 = NESMDNSSettingsSession;
        goto LABEL_38;
      }
      v57 = ne_log_obj(v48, v49);
      v55 = objc_claimAutoreleasedReturnValue(v57);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        goto LABEL_46;
      *(_WORD *)buf = 0;
      v56 = "Cannot create a DNS Settings session, some required frameworks are missing";
      goto LABEL_70;
    case 8:
      v50 = +[NESMAppPushSession hasRequiredFrameworks](NESMAppPushSession, "hasRequiredFrameworks");
      if (v50)
      {
        v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appPush"));

        if (!v15)
          goto LABEL_68;
        v39 = NESMAppPushSession;
        goto LABEL_38;
      }
      v58 = ne_log_obj(v50, v51);
      v55 = objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        goto LABEL_46;
      *(_WORD *)buf = 0;
      v56 = "Cannot create an App Push session, some required frameworks are missing";
      goto LABEL_70;
    case 9:
      v52 = +[NESMRelaySession hasRequiredFrameworks](NESMRelaySession, "hasRequiredFrameworks");
      if (v52)
      {
        v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relay"));

        if (v15)
        {
          v39 = NESMRelaySession;
LABEL_38:
          v15 = (NESMIKEv2VPNSession *)objc_msgSend([v39 alloc], "initWithConfiguration:andServer:", v7, v8);
        }
        goto LABEL_68;
      }
      v59 = ne_log_obj(v52, v53);
      v55 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v56 = "Cannot create an Relay session, some required frameworks are missing";
LABEL_70:
        _os_log_fault_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, v56, buf, 2u);
      }
LABEL_46:

      goto LABEL_47;
    default:
      goto LABEL_47;
  }
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

+ (__CFDictionary)copyRouteCacheFromRoutes:(__CFArray *)a3 isIPv6:(BOOL)a4
{
  return (__CFDictionary *)NEVirtualInterfaceCopyRouteCacheFromRoutes(a3, a4);
}

+ (__CFDictionary)copyDefaultRouteCacheIsIPv6:(BOOL)a3
{
  __CFDictionary *Mutable;
  __CFArray *v5;
  __CFArray *v6;
  UInt8 *v7;
  CFDataRef v8;
  UInt8 v10[8];
  UInt8 bytes[8];
  uint64_t v12;
  __CFArray *v13;
  __CFArray *v14;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v14 = v5;
  v6 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v13 = v6;
  if (a3)
  {
    *(_QWORD *)bytes = 0;
    v12 = 0;
    *(_QWORD *)v10 = CFDataCreate(kCFAllocatorDefault, bytes, 16);
    CFArrayAppendValue(v5, *(const void **)v10);
    CFArrayAppendValue(v6, *(const void **)v10);
    v7 = v10;
  }
  else
  {
    *(_DWORD *)v10 = 0;
    v8 = CFDataCreate(kCFAllocatorDefault, v10, 4);
    *(_QWORD *)bytes = v8;
    CFArrayAppendValue(v5, v8);
    CFArrayAppendValue(v6, v8);
    v7 = bytes;
  }
  myCFRelease(v7);
  CFDictionarySetValue(Mutable, CFSTR("subnet-addresses"), v5);
  CFDictionarySetValue(Mutable, CFSTR("subnet-masks"), v6);
  myCFRelease(&v14);
  myCFRelease(&v13);
  return Mutable;
}

@end
