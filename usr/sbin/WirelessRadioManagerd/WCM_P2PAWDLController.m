@implementation WCM_P2PAWDLController

- (WCM_P2PAWDLController)init
{
  WCM_P2PAWDLController *v2;
  WCM_P2PAWDLController *v3;
  id v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCM_P2PAWDLController;
  v2 = -[WCM_Controller init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    BYTE4(v2->awdlStateMonitor) = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Creating AWDL State Monitor"));
    BYTE5(v3->awdlStateMonitor) = 0;
    v4 = objc_alloc_init((Class)WiFiP2PAWDLStateMonitor);
    *(_QWORD *)(&v3->super.mProcessId + 1) = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100077BFC;
    v6[3] = &unk_100202018;
    v6[4] = v3;
    objc_msgSend(v4, "setRealtimeModeUpdatedHandler:", v6);
  }
  objc_msgSend(*(id *)(&v3->super.mProcessId + 1), "beginMonitoring");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("P2PAWDLController Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(*(id *)(&self->super.mProcessId + 1), "endMonitoring");

  v3.receiver = self;
  v3.super_class = (Class)WCM_P2PAWDLController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received P2PAWDL message-id: %lld"), uint64);
    if (uint64 == 2700)
      -[WCM_P2PAWDLController handleAWDLOn:](self, "handleAWDLOn:", a3);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("P2P AWDL controller dropping message-id %lld"), uint64);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Received empty P2PAWDL messageId."));
  }
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("P2PAWDLController handleDisconnection"));
  -[WCM_P2PAWDLController setMAwdlEnabled:](self, "setMAwdlEnabled:", 0);
  -[WCM_P2PAWDLController setMRealTimeAwdlTrafficEnabled:](self, "setMRealTimeAwdlTrafficEnabled:", 0);
  objc_msgSend(*(id *)(&self->super.mProcessId + 1), "endMonitoring");

  *(_QWORD *)(&self->super.mProcessId + 1) = 0;
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 2702);
}

- (void)handleAWDLRealTimeMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WCM_P2PAWDLController mRealTimeAwdlTrafficEnabled](self, "mRealTimeAwdlTrafficEnabled") != a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Real Time AWDL State changed (%d -> %d)"), -[WCM_P2PAWDLController mRealTimeAwdlTrafficEnabled](self, "mRealTimeAwdlTrafficEnabled"), v3);
    -[WCM_P2PAWDLController setMRealTimeAwdlTrafficEnabled:](self, "setMRealTimeAwdlTrafficEnabled:", v3);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 2702);
  }
}

- (void)handleAWDLOn:(id)a3
{
  xpc_object_t dictionary;
  _BOOL8 v5;

  dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  v5 = xpc_dictionary_get_BOOL(dictionary, "kWCMP2PAWDLOn");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received from P2P AWDL Controller AWDLOn:(%d -> %d)"), -[WCM_P2PAWDLController mAwdlEnabled](self, "mAwdlEnabled"), v5);
  if (v5 != -[WCM_P2PAWDLController mAwdlEnabled](self, "mAwdlEnabled"))
  {
    -[WCM_P2PAWDLController setMAwdlEnabled:](self, "setMAwdlEnabled:", v5);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 2702);
  }
}

- (BOOL)mAwdlEnabled
{
  return BYTE4(self->awdlStateMonitor);
}

- (void)setMAwdlEnabled:(BOOL)a3
{
  BYTE4(self->awdlStateMonitor) = a3;
}

- (BOOL)mRealTimeAwdlTrafficEnabled
{
  return BYTE5(self->awdlStateMonitor);
}

- (void)setMRealTimeAwdlTrafficEnabled:(BOOL)a3
{
  BYTE5(self->awdlStateMonitor) = a3;
}

@end
