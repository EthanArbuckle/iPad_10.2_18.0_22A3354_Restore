@implementation WCM_RCU2ControllerIOS

- (WCM_RCU2ControllerIOS)init
{
  WCM_RCU2ControllerIOS *v2;
  WCM_CtrXPCClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_RCU2ControllerIOS;
  v2 = -[WCM_RCU2Controller init](&v5, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_RCU2ControllerIOS:Init - Enter"));
  v3 = objc_alloc_init(WCM_CtrXPCClient);
  -[WCM_RCU2Controller setThreadClient:](v2, "setThreadClient:", v3);

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_RCU2ControllerIOS:Init - Exit"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WCM_RCU2Controller setThreadClient:](self, "setThreadClient:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2ControllerIOS;
  -[WCM_RCU2Controller dealloc](&v3, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2ControllerIOS;
  -[WCM_RCU2Controller handlePowerState:](&v3, "handlePowerState:", a3);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;
  id v5;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("In RCU2 Controller handleMessage messageId = %lld"), uint64);
  if (uint64 == 1402)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[WCM_RCU2Controller threadClient](self, "threadClient"));
    objc_msgSend(v5, "HandleThreadStop");
    goto LABEL_5;
  }
  if (uint64 == 1401)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[WCM_RCU2Controller threadClient](self, "threadClient"));
    objc_msgSend(v5, "HandleThreadStart");
LABEL_5:

    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("RCU2 controller dropping message-id %lld"), uint64);
}

@end
