@implementation WCM_AirplayController

- (WCM_AirplayController)init
{
  WCM_AirplayController *v2;
  WCM_AirplayController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_AirplayController;
  v2 = -[WCM_Controller init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super.mProcessId + 4) = 0;
    *(_DWORD *)&v2->_mAirplayIsCritical = 0;
    *((_WORD *)&v2->super.mProcessId + 3) = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("AirplayController Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("AirplayController Dealloc. Force send critical false."));
  -[WCM_AirplayController setMAirplayIsCritical:](self, "setMAirplayIsCritical:", 0);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1901);
  v3.receiver = self;
  v3.super_class = (Class)WCM_AirplayController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received airplay message-id: %lld"), uint64);
    if (uint64 == 1900)
      -[WCM_AirplayController handleAirplayCritical:](self, "handleAirplayCritical:", a3);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Airplay controller dropping message-id %lld"), uint64);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Received empty airplay messageId."));
  }
}

- (void)handleAirplayCritical:(id)a3
{
  xpc_object_t dictionary;

  dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  -[WCM_AirplayController setMAirplayIsCritical:](self, "setMAirplayIsCritical:", xpc_dictionary_get_BOOL(dictionary, "kWCMAirplayCritical"));
  if (xpc_dictionary_get_value(dictionary, "kWCMAirplayDuration"))
    -[WCM_AirplayController setMAirplayDuration:](self, "setMAirplayDuration:", xpc_dictionary_get_uint64(dictionary, "kWCMAirplayDuration"));
  if (xpc_dictionary_get_value(dictionary, "kWCMAirplayCriticalityPercentage"))
    -[WCM_AirplayController setMAirplayCriticalityPercentage:](self, "setMAirplayCriticalityPercentage:", (unsigned __int16)xpc_dictionary_get_uint64(dictionary, "kWCMAirplayCriticalityPercentage"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received from Airplay Controller critical = (%d) duration (ms) = (%d) criticality percentage = (%d)"), -[WCM_AirplayController mAirplayIsCritical](self, "mAirplayIsCritical"), -[WCM_AirplayController mAirplayDuration](self, "mAirplayDuration"), -[WCM_AirplayController mAirplayCriticalityPercentage](self, "mAirplayCriticalityPercentage"));
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1901);
}

- (BOOL)mAirplayIsCritical
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (void)setMAirplayIsCritical:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (unsigned)mAirplayDuration
{
  return *(_DWORD *)&self->_mAirplayIsCritical;
}

- (void)setMAirplayDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_mAirplayIsCritical = a3;
}

- (unsigned)mAirplayCriticalityPercentage
{
  return *((_WORD *)&self->super.mProcessId + 3);
}

- (void)setMAirplayCriticalityPercentage:(unsigned __int16)a3
{
  *((_WORD *)&self->super.mProcessId + 3) = a3;
}

@end
