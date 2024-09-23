@implementation WCM_FTController

- (WCM_FTController)init
{
  WCM_FTController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_FTController;
  result = -[WCM_Controller init](&v3, "init");
  *(unint64_t *)((char *)&result->_currentCallTargetBitRate + 4) = 0;
  *(_QWORD *)(&result->super.mProcessId + 1) = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_FTController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FT Current Bit Rates Target: %lld"), -[WCM_FTController currentCallTargetBitRate](self, "currentCallTargetBitRate"));
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 == 200)
    -[WCM_FTController handleFaceTimeCallConfig:](self, "handleFaceTimeCallConfig:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Unknown FT Message id: %lld"), uint64);
}

- (void)handleFaceTimeCallConfig:(id)a3
{
  xpc_object_t value;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
    -[WCM_FTController setCurrentCallTargetBitRate:](self, "setCurrentCallTargetBitRate:", xpc_dictionary_get_uint64(value, "kWCMFTCallConfig_TargetBitRate"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("FT Current Bit RateTarget: %lld"), -[WCM_FTController currentCallTargetBitRate](self, "currentCallTargetBitRate"));
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 200);
}

- (void)updateFTRate:(unint64_t)a3
{
  xpc_object_t v5;
  void *v6;

  if (-[WCM_FTController currentBitRate](self, "currentBitRate") == a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already at FT Rate :%lld"), a3);
  }
  else
  {
    -[WCM_FTController setCurrentBitRate:](self, "setCurrentBitRate:", a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Modulating FT data rate to %lld"), a3);
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v5, "kWCMFTCallConfig_BitrateCapability", a3);
      xpc_dictionary_set_uint64(v6, "kWCMFTCallConfig_InterferenceLevel", 0);
      -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1101, v6);
      xpc_release(v6);
    }
  }
}

- (void)getFaceTimeCallConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Asking for FT data rate"));
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1100, 0);
}

- (BOOL)getFTState
{
  return 1;
}

- (unint64_t)currentCallTargetBitRate
{
  return *(_QWORD *)(&self->super.mProcessId + 1);
}

- (void)setCurrentCallTargetBitRate:(unint64_t)a3
{
  *(_QWORD *)(&self->super.mProcessId + 1) = a3;
}

- (unint64_t)currentBitRate
{
  return *(unint64_t *)((char *)&self->_currentCallTargetBitRate + 4);
}

- (void)setCurrentBitRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_currentCallTargetBitRate + 4) = a3;
}

@end
