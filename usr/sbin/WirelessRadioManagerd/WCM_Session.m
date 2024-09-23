@implementation WCM_Session

- (void)handleXPCMessage:(id)a3
{
  xpc_type_t type;
  char *v6;
  uint64_t uint64;
  xpc_object_t value;
  unsigned int mProcessId;
  const char *v10;
  WCM_Controller *mController;
  id v12;
  uint64_t v13;
  WCM_Controller *v14;
  const __CFString *v15;
  uint64_t v16;

  type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("WCM_Session: XPC server error: %s"), xpc_dictionary_get_string(a3, _xpc_error_key_description));
    -[WCM_Session handleDisconnection](self, "handleDisconnection");
    return;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = xpc_copy_description(a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Unexpected XPC server event: %s"), v6);
    free(v6);
    return;
  }
  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!uint64)
  {
    uint64 = xpc_dictionary_get_int64(a3, "kMessageId");
    if (!uint64)
      goto LABEL_10;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Got a message with a INT64 instead of a UINT64. Please file a radar in Purple Coex Manager"));
  }
  if (uint64 == 301)
    return;
LABEL_10:
  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v10 = (&off_1002055F0)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v10 = "WRMSOS";
  }
  else
  {
    v10 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received messageId(%lld) from %s %@"), uint64, v10, a3);
  if (uint64 == 1)
  {
    -[WCM_Session handleCoexProcessRegistration:](self, "handleCoexProcessRegistration:", value);
    -[WCM_Session handleiRATProcessRegistration:](self, "handleiRATProcessRegistration:");
    return;
  }
  mController = self->mController;
  if (mController)
    goto LABEL_33;
  if (uint64 - 404 <= 8 && ((1 << (uint64 + 108)) & 0x103) != 0)
  {
    self->mProcessId = 13;
    self->mController = (WCM_Controller *)+[WCM_Controller newControllerForProcessId:](WCM_Controller, "newControllerForProcessId:", 13);
    objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
    mController = self->mController;
LABEL_33:
    -[WCM_Controller handleMessage:](mController, "handleMessage:", a3);
    return;
  }
  if (uint64 == 2600)
  {
    v14 = (WCM_Controller *)objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "getControllerOfId:", 3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("XPC message received for WCMTestCellularNetworkConfiguration"));
    if (v14)
    {
      mController = v14;
      goto LABEL_33;
    }
    v15 = CFSTR("No Cellular Controller, drop message WCMTestCellularNetworkConfiguration");
    v16 = 3;
LABEL_38:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v16, v15);
    return;
  }
  if (uint64 != 2601)
  {
    if (uint64 - 1401 <= 1)
    {
      if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2SupportIntegrated")))
      {
        v12 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
        v13 = 30;
        goto LABEL_32;
      }
      v15 = CFSTR("RCU2 Controller - HandleThreadStart - RCU2_SUPPORT_INTEGRATED - Feature not enabled");
      goto LABEL_37;
    }
    if (uint64 != 2602)
    {
      v15 = CFSTR("WCM_Session dropping - No Controllers");
LABEL_37:
      v16 = 2;
      goto LABEL_38;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Session handling WCMTestWifiCoexConfiguration"));
  }
  v12 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v13 = 1;
LABEL_32:
  mController = (WCM_Controller *)objc_msgSend(v12, "getControllerOfId:", v13);
  if (mController)
    goto LABEL_33;
}

- (void)handleMessage:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000184E0;
  v3[3] = &unk_100201B18;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), v3);
}

- (WCM_Session)init
{
  WCM_Session *result;
  objc_super v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Session init"));
  v4.receiver = self;
  v4.super_class = (Class)WCM_Session;
  result = -[WCM_Session init](&v4, "init");
  if (result)
  {
    result->mConnection = 0;
    result->mController = 0;
    result->mProcessId = 0;
  }
  return result;
}

- (void)dealloc
{
  WCM_Controller *mController;
  OS_xpc_object *mConnection;
  objc_super v5;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Session dealloc"));
  mController = self->mController;
  if (mController)

  mConnection = self->mConnection;
  if (mConnection)
    xpc_release(mConnection);
  v5.receiver = self;
  v5.super_class = (Class)WCM_Session;
  -[WCM_Session dealloc](&v5, "dealloc");
}

- (id)description
{
  unsigned int mProcessId;
  const char *v3;

  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v3 = (&off_1002055F0)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v3 = "WRMSOS";
  }
  else
  {
    v3 = "INVALID_PROC_ID!!!";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WCM_Session(%s)"), v3);
}

- (void)suspendExternalConnection
{
  unsigned int v3;

  v3 = -[WCM_Session getProcessId](self, "getProcessId");
  if (v3 != 6)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Suspending XPC with Process %d Connection %@"), v3, -[WCM_Session getConnection](self, "getConnection"));
}

- (WCM_Session)initWithConnection:(id)a3
{
  WCM_Session *result;
  _QWORD handler[5];

  self->mConnection = (OS_xpc_object *)a3;
  xpc_retain(a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000184D4;
  handler[3] = &unk_100203460;
  handler[4] = self;
  xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
  xpc_connection_resume(self->mConnection);
  return result;
}

- (void)handleDisconnection
{
  unsigned int mProcessId;
  const char *v4;
  WCM_Controller *mController;
  WCM_Controller *v6;
  _QWORD block[5];

  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v4 = (&off_1002055F0)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v4 = "WRMSOS";
  }
  else
  {
    v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle disconnection with %s"), v4);
  mController = self->mController;
  if (mController)
  {
    if (mController == objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "getControllerOfId:", self->mProcessId))objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
    v6 = self->mController;
    if (v6 == objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "getControllerOfId:", self->mProcessId))objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
    {
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
      objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
      objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
      objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerSession:ofId:", 0, self->mProcessId);
    }
    -[WCM_Controller handleDisconnection:](self->mController, "handleDisconnection:", self->mConnection);
  }
  if (-[WCM_Session getProcessId](self, "getProcessId") == 6)
    objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "exitTestMode");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CB094;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)sendMessage:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CB1A0;
  v3[3] = &unk_100201B18;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), v3);
}

- (void)handleCoexProcessRegistration:(id)a3
{
  uint64_t int64;
  id v6;
  const char *v7;
  unsigned int mProcessId;
  WCM_Controller *mController;
  const char *v10;

  if (a3)
  {
    int64 = xpc_dictionary_get_int64(a3, "kWCMRegisterProcess_ProcessId");
    if (!(_DWORD)int64)
      int64 = xpc_dictionary_get_uint64(a3, "kWCMRegisterProcess_ProcessId");
    v6 = objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", int64);
    if (v6)
    {
      if (int64 < 0x2A && ((0x3EEEFFFFFFFuLL >> int64) & 1) != 0)
      {
        v7 = (&off_1002055F0)[(int)int64];
      }
      else
      {
        v7 = "INVALID_PROC_ID!!!";
        if ((_DWORD)int64 == 42)
          v7 = "WRMSOS";
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Server already has a existing session(%p) for %s, new session(%p)"), v6, v7, self);
    }
    self->mProcessId = int64;
    if ((objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "coexSupported") & 1) != 0|| (mProcessId = self->mProcessId, mProcessId == 6))
    {
      if (self->mController)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Controller already exists for this session"));
      }
      else
      {
        mController = +[WCM_Controller newControllerForProcessId:](WCM_Controller, "newControllerForProcessId:", self->mProcessId);
        self->mController = mController;
        if (self->mProcessId == 6)
        {
          objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "enterTestMode");
          mController = self->mController;
        }
        if (mController)
        {
          objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
          -[WCM_Controller initWithConnection:processId:](self->mController, "initWithConnection:processId:", self->mConnection, self->mProcessId);
          objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "initControllerPolicy:", self->mProcessId);
        }
      }
      objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
    }
    else
    {
      if (mProcessId < 0x2A && ((0x3EEEFFFFFBFuLL >> mProcessId) & 1) != 0)
      {
        v10 = (&off_1002054A0)[mProcessId];
      }
      else if (mProcessId == 42)
      {
        v10 = "WRMSOS";
      }
      else
      {
        v10 = "INVALID_PROC_ID!!!";
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("WCM_Session: Coex not active on this platform, not registering for %s"), v10);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Session: Invalid register message"));
  }
}

- (void)handleiRATProcessRegistration:(id)a3
{
  int int64;
  unsigned int mProcessId;
  const char *v7;
  unsigned int v8;
  const char *v9;

  if (a3)
  {
    int64 = xpc_dictionary_get_int64(a3, "kWCMRegisterProcess_ProcessId");
    self->mProcessId = int64;
    if (!int64)
      self->mProcessId = xpc_dictionary_get_uint64(a3, "kWCMRegisterProcess_ProcessId");
    if ((objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported") & 1) != 0)
    {
      if (!self->mController)
      {
        mProcessId = self->mProcessId;
        if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
        {
          v7 = (&off_1002055F0)[mProcessId];
        }
        else if (mProcessId == 42)
        {
          v7 = "WRMSOS";
        }
        else
        {
          v7 = "INVALID_PROC_ID!!!";
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WCM_Session: iRAT registering for %s"), v7);
        self->mController = (WCM_Controller *)+[WCM_Controller newControllerForProcessId:](WCM_Controller, "newControllerForProcessId:", self->mProcessId);
        if (self->mProcessId == 6)
          objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "enterTestMode");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WCM_Session: mConnection %@"), self->mConnection);
        -[WCM_Controller initWithConnection:processId:](self->mController, "initWithConnection:processId:", self->mConnection, self->mProcessId);
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCM_Session: Registed with Handover Manager, updating controller"));
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
      objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
      objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
      objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerSession:ofId:", self->mController, self->mProcessId);
    }
    else
    {
      v8 = self->mProcessId;
      if (v8 < 0x2A && ((0x3EEEFFFFFFFuLL >> v8) & 1) != 0)
      {
        v9 = (&off_1002055F0)[v8];
      }
      else if (v8 == 42)
      {
        v9 = "WRMSOS";
      }
      else
      {
        v9 = "INVALID_PROC_ID!!!";
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("WCM_Session: iRAT not active on this platform, not registering for %s."), v9);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid register message"));
  }
}

- (id)getConnection
{
  return self->mConnection;
}

- (int)getProcessId
{
  return self->mProcessId;
}

- (id)getController
{
  return self->mController;
}

@end
