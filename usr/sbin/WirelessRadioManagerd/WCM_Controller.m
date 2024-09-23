@implementation WCM_Controller

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4
{
  xpc_object_t v7;
  uint64_t mProcessId;
  unsigned int v9;
  const char *v10;
  const char *v11;
  xpc_object_t values[2];
  char *keys[2];

  *(_OWORD *)keys = *(_OWORD *)&off_100204F10;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  mProcessId = self->mProcessId;
  v9 = self->mProcessId;
  if (self->mConnection)
  {
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> v9) & 1) != 0)
    {
      v10 = (&off_100204F20)[mProcessId];
    }
    else if (v9 == 42)
    {
      v10 = "WRMSOS";
    }
    else
    {
      v10 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending messageId(%lld) to %s %@"), a3, v10, v7);
    xpc_connection_send_message(self->mConnection, v7);
  }
  else
  {
    if (v9 < 0x2A && ((0x3EEEFFFFFFFuLL >> v9) & 1) != 0)
    {
      v11 = (&off_100204F20)[v9];
    }
    else
    {
      v11 = "INVALID_PROC_ID!!!";
      if ((_DWORD)mProcessId == 42)
        v11 = "WRMSOS";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("No XPC connection for %s !"), v11);
  }
  xpc_release(values[0]);
  xpc_release(v7);
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  xpc_object_t v10;
  unsigned int mProcessId;
  const char *v12;
  xpc_object_t values[3];
  char *keys[3];

  keys[0] = "kMessageId";
  keys[1] = "kMessageArgs";
  keys[2] = (char *)a5;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  values[2] = a6;
  v10 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (self->mConnection)
  {
    mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v12 = (&off_100204F20)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v12 = "WRMSOS";
    }
    else
    {
      v12 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending messageId(%lld) to %s %@"), a3, v12, v10);
    xpc_connection_send_message(self->mConnection, v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("No XPC connection !"));
  }
  xpc_release(values[0]);
  xpc_release(v10);
}

- (int)getProcessId
{
  return self->mProcessId;
}

- (WCM_Controller)init
{
  WCM_Controller *result;
  objc_super v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WCM controller init"));
  v4.receiver = self;
  v4.super_class = (Class)WCM_Controller;
  result = -[WCM_Controller init](&v4, "init");
  if (result)
  {
    result->mConnection = 0;
    result->mProcessId = 0;
  }
  return result;
}

- (void)dealloc
{
  OS_xpc_object *mConnection;
  objc_super v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WCM controller dealloc"));
  mConnection = self->mConnection;
  if (mConnection)
  {
    xpc_release(mConnection);
    self->mConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_Controller;
  -[WCM_Controller dealloc](&v4, "dealloc");
}

- (WCM_Controller)initWithConnection:(id)a3 processId:(int)a4
{
  const char *v6;

  self->mConnection = (OS_xpc_object *)a3;
  if (a3)
    xpc_retain(a3);
  self->mProcessId = a4;
  if (a4 < 0x2A && ((0x3EEEFFFFFFFuLL >> a4) & 1) != 0)
  {
    v6 = (&off_100204F20)[a4];
  }
  else
  {
    v6 = "INVALID_PROC_ID!!!";
    if (a4 == 42)
      v6 = "WRMSOS";
  }
  return (WCM_Controller *)+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Initialize %@ for %s"), self, v6);
}

- (void)releaseConnection
{
  unsigned int mProcessId;
  const char *v4;

  if (self->mConnection)
  {
    mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v4 = (&off_100204F20)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v4 = "WRMSOS";
    }
    else
    {
      v4 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Release mConnection for %s"), v4);
    xpc_release(self->mConnection);
    self->mConnection = 0;
  }
}

- (void)handlePowerState:(BOOL)a3
{
  unsigned int mProcessId;
  const char *v4;

  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v4 = (&off_100204F20)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v4 = "WRMSOS";
  }
  else
  {
    v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Controller(%s) handlePowerState default implementation"), v4);
}

- (void)handleMessage:(id)a3
{
  unsigned int mProcessId;
  const char *v4;

  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v4 = (&off_100204F20)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v4 = "WRMSOS";
  }
  else
  {
    v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Controller(%s) handleMessage default implementation"), v4);
}

- (void)handleDisconnection:(id)a3
{
  unsigned int mProcessId;
  const char *v4;

  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v4 = (&off_100204F20)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v4 = "WRMSOS";
  }
  else
  {
    v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Controller(%s) handleDisconnection default implementation (conn=%p)"), v4, a3);
}

+ (id)newControllerForProcessId:(int)a3
{
  unsigned int v4;
  __objc2_class **v5;
  void *v6;
  const char *v7;

  v4 = a3 - 1;
  v5 = off_1002004C8;
  switch(a3)
  {
    case 1:
      goto LABEL_17;
    case 2:
      v5 = off_100200490;
      goto LABEL_17;
    case 3:
      v5 = off_100200488;
      goto LABEL_17;
    case 4:
      v5 = off_100200480;
      goto LABEL_17;
    case 6:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCM_Controller created for test"));
      v5 = off_1002004D8;
      goto LABEL_17;
    case 7:
    case 8:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 33:
    case 34:
      v5 = off_1002004E8;
      goto LABEL_17;
    case 9:
      v5 = off_1002004E0;
      goto LABEL_17;
    case 10:
      v5 = off_1002004D0;
      goto LABEL_17;
    case 19:
    case 23:
    case 24:
    case 25:
    case 26:
      v5 = off_1002004F0;
      goto LABEL_17;
    case 27:
      v5 = &off_1002004F8;
      goto LABEL_17;
    case 29:
      v5 = off_1002004B0;
      goto LABEL_17;
    case 30:
      v5 = off_1002004B8;
      goto LABEL_17;
    case 35:
    case 40:
    case 41:
    case 42:
      v5 = off_1002004C0;
      goto LABEL_17;
    case 37:
      v5 = off_100200498;
      goto LABEL_17;
    case 38:
      v5 = off_1002004A0;
      goto LABEL_17;
    case 39:
      v5 = off_1002004A8;
LABEL_17:
      v6 = (void *)objc_opt_new(*v5);
      if (v6)
      {
        if (v4 < 0x29 && ((0x1F777FFFFFFuLL >> v4) & 1) != 0)
        {
          v7 = (&off_100205070)[v4];
        }
        else
        {
          v7 = "INVALID_PROC_ID!!!";
          if (a3 == 42)
            v7 = "WRMSOS";
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%@ was created for %s"), v6, v7);
      }
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Controller was not created for processId(%d)"), *(_QWORD *)&a3);
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)newTestControllerForProcessId:(int)a3
{
  id result;

  switch(a3)
  {
    case 1:
      result = objc_opt_new(WCM_WiFiControllerIOS);
      break;
    case 2:
      result = objc_opt_new(WCM_FTController);
      break;
    case 3:
      result = objc_opt_new(WCM_CellularController);
      break;
    case 4:
      result = objc_opt_new(WCM_BTControllerIOS);
      break;
    case 5:
    case 6:
      goto LABEL_5;
    case 7:
      result = objc_opt_new(WRM_iRATClientController);
      break;
    default:
      if (a3 == 29)
      {
        result = objc_opt_new(WCM_R1ControllerIOS);
      }
      else
      {
LABEL_5:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid ProcessId: %d"), *(_QWORD *)&a3);
        result = 0;
      }
      break;
  }
  return result;
}

@end
