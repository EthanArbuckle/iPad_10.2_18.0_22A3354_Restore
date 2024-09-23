@implementation WCM_RCU2Controller

- (WCM_CtrXPCClient)threadClient
{
  return *(WCM_CtrXPCClient **)((char *)&self->_mRCU2ChannelActivity + 4);
}

- (WCM_RCU2Controller)init
{
  WCM_RCU2Controller *v2;
  WCM_RCU2Controller *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_RCU2Controller;
  v2 = -[WCM_Controller init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super.mProcessId + 4) = 0;
    *(_DWORD *)&v2->_mRCU2PowerOn = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2Controller Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2Controller Dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2Controller;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC2 updateContentionFreeWiFiInfoToRC2 default implemetation"));
}

- (id)getRC2CoexMode
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC2 coex mode default implemetation"));
  return 0;
}

- (id)getRC2PMProtectionMode
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC2 PMProtection mode default implemetation"));
  return 0;
}

- (id)getRC2WiFiTimingParam
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC2 timing params default implemetation"));
  return 0;
}

- (id)getRC2BTTimingParam
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC2 BT timing params default implemetation"));
  return 0;
}

- (BOOL)mRCU2PowerOn
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (void)setMRCU2PowerOn:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (unsigned)mRCU2ChannelNum
{
  return *(_DWORD *)&self->_mRCU2PowerOn;
}

- (void)setMRCU2ChannelNum:(unsigned int)a3
{
  *(_DWORD *)&self->_mRCU2PowerOn = a3;
}

- (unint64_t)mRCU2ChannelActivity
{
  return *(_QWORD *)&self->_mRCU2ChannelNum;
}

- (void)setMRCU2ChannelActivity:(unint64_t)a3
{
  *(_QWORD *)&self->_mRCU2ChannelNum = a3;
}

- (void)setThreadClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 36);
}

@end
