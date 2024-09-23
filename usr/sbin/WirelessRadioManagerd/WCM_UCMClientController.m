@implementation WCM_UCMClientController

- (int)getMyClientType
{
  unsigned int v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("getMyClientType,myProcessID: %d"), -[WCM_Controller getProcessId](self, "getProcessId"));
  v3 = -[WCM_Controller getProcessId](self, "getProcessId") - 35;
  if (v3 < 8 && ((0xE1u >> v3) & 1) != 0)
    return dword_1001DEF08[v3];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("myClientType: UCMClientUnknown"));
  return 0;
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;
  id v5;
  uint64_t v6;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received UCMClient message-id: %lld"), uint64);
    switch(uint64)
    {
      case 0xAF2uLL:
        objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "getHomeKitBtLoad:", a3);
        break;
      case 0xAF3uLL:
      case 0xAF6uLL:
        goto LABEL_7;
      case 0xAF4uLL:
        objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "enableHomeKitTimer:", a3);
        break;
      case 0xAF5uLL:
        objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "enableFrequencyUpdatesForMic:", a3);
        break;
      case 0xAF7uLL:
        objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "enableULFrequencyUpdates:", a3);
        break;
      default:
        if (uint64 == 2300)
        {
          v5 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton");
          objc_msgSend(v5, "postBTConnectedDevices", v6);
        }
        else
        {
LABEL_7:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("UCMClient controller dropping message-id %lld"), uint64);
        }
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Received empty UCMClient messageId."));
  }
}

@end
