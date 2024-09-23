@implementation WRM_IPTelephonyController

- (WRM_IPTelephonyController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_IPTelephonyController;
  return -[WCM_Controller init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_IPTelephonyController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (!uint64)
  {
    uint64 = xpc_dictionary_get_int64(a3, "kMessageId");
    if (uint64)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("Got a message with a INT64 instead of a UINT64. Please file a radar in Purple Radio Manager"));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Received IP Telephony message-id: %lld"), uint64);
  if ((uint64 & 0xFFFFFFFFFFFFFFFELL) == 0x2BC)
    -[WRM_IPTelephonyController handleIPTelephonyMetrics:](self, "handleIPTelephonyMetrics:", a3);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IP Telephony iRAT Manager Controller"));
}

- (void)handleIPTelephonyMetrics:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("IP Telephony event received"));
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
}

@end
