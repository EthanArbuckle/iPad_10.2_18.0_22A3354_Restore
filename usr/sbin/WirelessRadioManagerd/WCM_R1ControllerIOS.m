@implementation WCM_R1ControllerIOS

- (WCM_R1ControllerIOS)init
{
  WCM_R1ControllerIOS *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_R1ControllerIOS;
  v2 = -[WCM_R1Controller init](&v4, "init");
  -[WCM_R1Controller setMRCU1NbBandMask:](v2, "setMRCU1NbBandMask:", 0);
  return v2;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  if (v3)
    objc_msgSend(v3, "updateWiFiRCU1ModeChanged:andChannelChanged:andMode:andChannel:", 1, 1, &off_100230750, &off_100230750);
  v4.receiver = self;
  v4.super_class = (Class)WCM_R1ControllerIOS;
  -[WCM_R1Controller dealloc](&v4, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[WCM_R1Controller setMRCU1NbBandMask:](self, "setMRCU1NbBandMask:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WCM_R1ControllerIOS;
  -[WCM_R1Controller handlePowerState:](&v5, "handlePowerState:", v3);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("In RCU1 Controller handleMessage messageId = %lld"), uint64);
  if (uint64 == 801)
  {
    -[WCM_R1ControllerIOS handleRCU1QueryStatus:](self, "handleRCU1QueryStatus:", a3);
  }
  else if (uint64 == 800)
  {
    -[WCM_R1ControllerIOS handleRCU1Connection:](self, "handleRCU1Connection:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("RCU1 controller dropping message-id %lld"), uint64);
  }
}

- (void)sendRCU1Message:(BOOL)a3 wifiBand:(unsigned __int8)a4 btPowerState:(BOOL)a5 btBand:(unsigned __int8)a6 isForce:(BOOL)a7
{
  unsigned int v7;
  BOOL v10;
  xpc_object_t v11;

  v7 = a4;
  v10 = byte_1002711E8 == a3 && dword_1002711EC == a4;
  if (v10 && byte_1002711F0 == a5 && byte_1002711F1 == a6 && !a7)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Don't send RCU1Message - No change in WiFi/BT state WiFiPower = (%d) WiFiband = (%d) btPower = (%d) btBand= (%d)force = [%d]"), a3, a4, a5, a6, 0);
  }
  else
  {
    byte_1002711E8 = a3;
    dword_1002711EC = a4;
    byte_1002711F0 = a5;
    byte_1002711F1 = a6;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("send RCU1Message WiFiPower = (%d) WiFiband = (%d) btPower = (%d) btBand= (%d)force = [%d]"), a3, a4, a5, a6, a7);
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v11, "kWCMHToRCU1wiFiPowerStatus", a3);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU15GStatus", v7);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU1DutyCycle", 0xAuLL);
    xpc_dictionary_set_BOOL(v11, "kWCMHToRCU1BTPowerStatus", byte_1002711F0);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU1BTBandStatus", byte_1002711F1);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1500, v11);
    xpc_release(v11);
  }
}

- (void)handleRCU1Connection:(id)a3
{
  xpc_object_t value;
  _BOOL8 v5;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  -[WCM_R1Controller setMRCU1PowerOn:](self, "setMRCU1PowerOn:", xpc_dictionary_get_BOOL(value, "kWCMRCU1PowerOn"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1ChannelNum"))
    -[WCM_R1Controller setMRCU1ChannelNum:](self, "setMRCU1ChannelNum:", xpc_dictionary_get_uint64(value, "kWCMRCU1ChannelNum"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1OnDuration"))
    -[WCM_R1Controller setMRCU1OnDuration:](self, "setMRCU1OnDuration:", xpc_dictionary_get_uint64(value, "kWCMRCU1OnDuration"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1CycleLength"))
    -[WCM_R1Controller setMRCU1CycleLength:](self, "setMRCU1CycleLength:", xpc_dictionary_get_uint64(value, "kWCMRCU1CycleLength"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1NumerOfCycles"))
    -[WCM_R1Controller setMRCU1NumberOfCycles:](self, "setMRCU1NumberOfCycles:", xpc_dictionary_get_uint64(value, "kWCMRCU1NumerOfCycles"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1FrameFormat"))
    -[WCM_R1Controller setMRCU1FrameFormat:](self, "setMRCU1FrameFormat:", xpc_dictionary_get_uint64(value, "kWCMRCU1FrameFormat"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1UseCaseNum"))
    -[WCM_R1Controller setMRCU1UseCaseNum:](self, "setMRCU1UseCaseNum:", xpc_dictionary_get_uint64(value, "kWCMRCU1UseCaseNum"));
  if (xpc_dictionary_get_value(value, "kWCMRCU1SideChBandMask"))
    -[WCM_R1Controller setMRCU1NbBandMask:](self, "setMRCU1NbBandMask:", xpc_dictionary_get_uint64(value, "kWCMRCU1SideChBandMask"));
  v5 = -[WCM_R1Controller mRCU1PowerOn](self, "mRCU1PowerOn")
    && (-[WCM_R1Controller mRCU1ChannelNum](self, "mRCU1ChannelNum") == 5
     || -[WCM_R1Controller mRCU1NbBandMask](self, "mRCU1NbBandMask"));
  -[WCM_R1Controller setMRCU15GHzInUse:](self, "setMRCU15GHzInUse:", v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received from RCU1 Controller Power = (%d) Channel Num = (%d) On Duration = (%d) Cycle Length = (%d) Number of Cycles = (%d) Frame Format = (%d) Use Case Num = (%d) Side Band Mask = (%d)"), -[WCM_R1Controller mRCU1PowerOn](self, "mRCU1PowerOn"), -[WCM_R1Controller mRCU1ChannelNum](self, "mRCU1ChannelNum"), -[WCM_R1Controller mRCU1OnDuration](self, "mRCU1OnDuration"), -[WCM_R1Controller mRCU1CycleLength](self, "mRCU1CycleLength"), -[WCM_R1Controller mRCU1NumberOfCycles](self, "mRCU1NumberOfCycles"), -[WCM_R1Controller mRCU1FrameFormat](self, "mRCU1FrameFormat"), -[WCM_R1Controller mRCU1UseCaseNum](self, "mRCU1UseCaseNum"), -[WCM_R1Controller mRCU1NbBandMask](self, "mRCU1NbBandMask"));
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1100);
  if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "cellularRc1PolicyManager"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Update RCU1 channel = %d, NBBandMask = %d"), -[WCM_R1Controller mRCU1ChannelNum](self, "mRCU1ChannelNum"), -[WCM_R1Controller mRCU1NbBandMask](self, "mRCU1NbBandMask"));
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "cellularRc1PolicyManager"), "updateRc1ChannelNumber:NbChannelBitmask:", -[WCM_R1Controller mRCU1ChannelNum](self, "mRCU1ChannelNum"), -[WCM_R1Controller mRCU1NbBandMask](self, "mRCU1NbBandMask"));
  }
}

- (void)handleRCU1QueryStatus:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  unint64_t v10;
  id v11;

  v4 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a3), "wifiController");
  v5 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
  objc_msgSend(v4, "wifiState");
  v6 = objc_msgSend(v4, "powerState");
  v7 = objc_msgSend(v5, "powerState");
  v8 = objc_msgSend(v5, "getAny5GHzBTDevicesConnected");
  v9 = objc_msgSend(v4, "wifiState");
  v10 = 0x202010000uLL >> (8 * v9);
  if (v9 >= 5)
    LOBYTE(v10) = 0;
  -[WCM_R1ControllerIOS sendRCU1Message:wifiBand:btPowerState:btBand:isForce:](self, "sendRCU1Message:wifiBand:btPowerState:btBand:isForce:", v6, v10 & 3, v7, v8, 1);
  v11 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "cellularRc1PolicyManager");
  if (v11)
    objc_msgSend(v11, "updateRc1OverallConfig");
}

@end
