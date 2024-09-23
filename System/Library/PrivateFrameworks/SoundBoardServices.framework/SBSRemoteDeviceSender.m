@implementation SBSRemoteDeviceSender

- (SBSRemoteDeviceSender)initWithDevice:(id)a3
{
  id v5;
  SBSRemoteDeviceSender *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *rapportQueue;
  RPCompanionLinkClient *v10;
  RPCompanionLinkClient *client;
  void *v12;
  NSObject *v13;
  RPCompanionLinkClient *v14;
  NSObject *v15;
  dispatch_time_t v16;
  _QWORD v18[4];
  NSObject *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBSRemoteDeviceSender;
  v6 = -[SBSRemoteDeviceSender init](&v20, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_destinationID, a3);
    v8 = dispatch_queue_create("com.apple.soundboardservices.RapportMessageHandlingQueue", v7);
    rapportQueue = v6->_rapportQueue;
    v6->_rapportQueue = (OS_dispatch_queue *)v8;

    v10 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    client = v6->_client;
    v6->_client = v10;

    -[SBSRemoteDeviceSender rapportQueue](v6, "rapportQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPCompanionLinkClient setDispatchQueue:](v6->_client, "setDispatchQueue:", v12);

    -[RPCompanionLinkClient setControlFlags:](v6->_client, "setControlFlags:", 8196);
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v14 = v6->_client;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __40__SBSRemoteDeviceSender_initWithDevice___block_invoke;
    v18[3] = &unk_24EB7DC48;
    v19 = v13;
    v15 = v13;
    -[RPCompanionLinkClient activateWithCompletion:](v14, "activateWithCompletion:", v18);
    v16 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v15, v16);

  }
  return v6;
}

- (void)getAllDebugInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getAllDebugInfo___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetAllDebugInfo"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v14 = CFSTR("keys");
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  -[SBSRemoteDeviceSender client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__SBSRemoteDeviceSender_getSelectDebugInfo_reply___block_invoke;
  v12[3] = &unk_24EB7DC70;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetSelectDebugInfo"), v8, v10, MEMORY[0x24BDBD1B8], v12);

}

- (void)getLEDInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SBSRemoteDeviceSender_getLEDInfo___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetLEDInfo"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)getTuningInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SBSRemoteDeviceSender_getTuningInfo___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetTuningInfo"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("box");
  v15[1] = CFSTR("at");
  v16[0] = v9;
  v16[1] = v8;
  v15[2] = CFSTR("withValue");
  *(float *)&v11 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetTuningInfoOnBox"), v13, v14, MEMORY[0x24BDBD1B8], &__block_literal_global_835);

}

- (void)playTone:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("tone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoPlayTone"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_20);

}

- (void)stopTone:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("tone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoStopTone"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_21);

}

- (void)getUserDefaults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getUserDefaults___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetUserDefaults"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("defaultKey");
  v11[1] = CFSTR("withValue");
  v12[0] = v7;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetUserDefaults"), v9, v10, MEMORY[0x24BDBD1B8], &__block_literal_global_24);

}

- (void)resetAllUserDefaults
{
  void *v3;
  id v4;

  -[SBSRemoteDeviceSender client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoResetAllUserDefaults"), MEMORY[0x24BDBD1B8], v3, MEMORY[0x24BDBD1B8], &__block_literal_global_25);

}

- (void)resetUserDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoResetUserDefault"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_26);

}

- (void)sendLEDCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSendLEDCommand"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_27);

}

- (void)triggerWiFiCoreCapture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.TriggerWiFiCoreCapture"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_28);

}

- (void)sendButtonCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSendButtonCommand"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_29);

}

- (void)injectSWUpdateToHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoInjectSWUpdateToHome"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_30);

}

- (void)setHomeUpdateState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("state");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_33);

}

- (void)clearHomeSWUpdate
{
  void *v3;
  id v4;

  -[SBSRemoteDeviceSender client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"), MEMORY[0x24BDBD1B8], v3, MEMORY[0x24BDBD1B8], &__block_literal_global_34);

}

- (void)setBootSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("defaultKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetBootSpinner"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_35);

}

- (void)setWifiEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("defaultKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetWifiEnabled"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_36);

}

- (void)disassociateCurrentNetwork
{
  void *v3;
  id v4;

  -[SBSRemoteDeviceSender client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoDisassociateCurrentNetwork"), MEMORY[0x24BDBD1B8], v3, MEMORY[0x24BDBD1B8], &__block_literal_global_37);

}

- (void)disassociateNetworkWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("defaultKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoDisassociateNetworkWithName"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_38);

}

- (void)getFeatureFlags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SBSRemoteDeviceSender_getFeatureFlags___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetFeatureFlags"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)setFeatureFlags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("featureFlags");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetFeatureFlags"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_41);

}

- (void)setLEDContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("LEDContents");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetLEDContents"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_44);

}

- (void)siriSay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("phrase");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSiriSay"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_47);

}

- (void)suScanForSoftwareUpdate
{
  void *v3;
  id v4;

  -[SBSRemoteDeviceSender client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSUScanForSoftwareUpdate"), MEMORY[0x24BDBD1B8], v3, MEMORY[0x24BDBD1B8], &__block_literal_global_48);

}

- (void)getVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SBSRemoteDeviceSender_getVolume___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoGetVolume"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)setVolume:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("volume");
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoSetVolume"), v8, v9, MEMORY[0x24BDBD1B8], &__block_literal_global_51);

}

- (void)render:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.DebugInfoRender"), v4, v5, MEMORY[0x24BDBD1B8], &__block_literal_global_52);

}

- (void)fetchLatestSignposts:(int64_t)a3 completionHandler:(id)a4
{
  NSLog(CFSTR("%s is not supported."), a2, a3, a4, "-[SBSRemoteDeviceSender fetchLatestSignposts:completionHandler:]");
}

- (void)handoffStartWithHandoffType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("handoffType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartKey"), v5, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_55);

}

- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "data");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v18[0] = CFSTR("artworkColors");
    v18[1] = CFSTR("handoffType");
    v19[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = (const __CFString **)v18;
    v12 = 2;
  }
  else
  {
    v16 = CFSTR("handoffType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
    v12 = 1;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey"), v13, v15, MEMORY[0x24BDBD1B8], &__block_literal_global_60);

}

- (void)handoffUpdateIntensity:(float)a3 handoffType:(unint64_t)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("handoffType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("intensity");
  v13[0] = v6;
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey"), v9, v11, MEMORY[0x24BDBD1B8], &__block_literal_global_65);

}

- (void)handoffCancelWithHandoffType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("handoffType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICancelKey"), v5, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_70);

}

- (void)handoffCompleteWithHandoffType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("handoffType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICompleteKey"), v5, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_75);

}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = a3;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SBSRemoteDeviceSender client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("withOptions");
  v12[0] = v8;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader"), v9, v10, MEMORY[0x24BDBD1B8], &__block_literal_global_84);

}

- (void)isDeviceStereoFollower:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SBSRemoteDeviceSender_isDeviceStereoFollower___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("started");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted"), v7, v8, MEMORY[0x24BDBD1B8], &__block_literal_global_89);

}

- (void)createSysdiagnose:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)reboot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("options");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.SystemReboot"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_93);

}

- (void)requestDeferredReboot
{
  void *v3;
  id v4;

  -[SBSRemoteDeviceSender client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.SystemRequestDeferredReboot"), MEMORY[0x24BDBD1B8], v3, MEMORY[0x24BDBD1B8], &__block_literal_global_94);

}

- (void)obliterate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("options");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.Obliterate"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_95);

}

- (void)identifyWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("options");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.Identify"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_96);

}

- (void)intercomWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("options");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.Intercom"), v6, v7, MEMORY[0x24BDBD1B8], &__block_literal_global_97);

}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
  NSLog(CFSTR("setTurnOffBrightnessFactor not supported."), a2, a3);
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SBSRemoteDeviceSender_getAllSyncedAlarmsAndTimers___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.SystemRequestFetchAlarmsAndTimers"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (BOOL)isMediaAlarm:(id)a3
{
  return 0;
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SBSRemoteDeviceSender client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("interval");
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__SBSRemoteDeviceSender_getPowerEstimateForInterval_reply___block_invoke;
  v13[3] = &unk_24EB7DC70;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v7, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.GetPowerEstimateForInterval"), v10, v11, MEMORY[0x24BDBD1B8], v13);

}

- (void)getInstalledProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SBSRemoteDeviceSender_getInstalledProfiles___block_invoke;
  v8[3] = &unk_24EB7DC70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.GetInstalledProfiles"), MEMORY[0x24BDBD1B8], v6, MEMORY[0x24BDBD1B8], v8);

}

- (void)installProfileData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("profileData");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__SBSRemoteDeviceSender_installProfileData_completion___block_invoke;
  v12[3] = &unk_24EB7DC70;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.InstallProfileData"), v9, v10, MEMORY[0x24BDBD1B8], v12);

}

- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SBSRemoteDeviceSender client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("identifier");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteDeviceSender destinationID](self, "destinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SBSRemoteDeviceSender_removeProfileByIdentifier_completion___block_invoke;
  v12[3] = &unk_24EB7DC70;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sbs.RemoveProfileByIdentifier"), v9, v10, MEMORY[0x24BDBD1B8], v12);

}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, MEMORY[0x24BDBD1B8], 0);
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, MEMORY[0x24BDBD1A8]);
}

- (RPCompanionLinkClient)client
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)rapportQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRapportQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __62__SBSRemoteDeviceSender_removeProfileByIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __55__SBSRemoteDeviceSender_installProfileData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __46__SBSRemoteDeviceSender_getInstalledProfiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __59__SBSRemoteDeviceSender_getPowerEstimateForInterval_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  id v12;

  v12 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(float, float))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("joulesEstimate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("period"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    (*(void (**)(uint64_t, float, float))(v6 + 16))(v6, v9, v11);

  }
}

void __53__SBSRemoteDeviceSender_getAllSyncedAlarmsAndTimers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __45__SBSRemoteDeviceSender_intercomWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __45__SBSRemoteDeviceSender_identifyWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __36__SBSRemoteDeviceSender_obliterate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __46__SBSRemoteDeviceSender_requestDeferredReboot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __32__SBSRemoteDeviceSender_reboot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __47__SBSRemoteDeviceSender_sysdiagnoseHasStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __48__SBSRemoteDeviceSender_isDeviceStereoFollower___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a2, "objectForKey:", CFSTR("reply"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !v6)
  {
    NSLog(CFSTR("Failed to receive role from companion link client '%@'"), v7);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "BOOLValue"));
  }

}

void __61__SBSRemoteDeviceSender_setDeviceAsStereoLeader_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __56__SBSRemoteDeviceSender_handoffCompleteWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending kSBSProximityHandoffUICompleteKey request to companion link client '%@'"), a4);
  else
    NSLog(CFSTR("kSBSProximityHandoffUICompleteKey sent successfully"));
}

void __54__SBSRemoteDeviceSender_handoffCancelWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending kSBSProximityHandoffUICancelKey request to companion link client '%@'"), a4);
  else
    NSLog(CFSTR("kSBSProximityHandoffUICancelKey sent successfully"));
}

void __60__SBSRemoteDeviceSender_handoffUpdateIntensity_handoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending ProximityHandoffUIUpdateIntensity request to companion link client '%@'"), a4);
  else
    NSLog(CFSTR("ProximityHandoffUIUpdateIntensity sent successfully"));
}

void __67__SBSRemoteDeviceSender_handoffStartWithArtworkColors_handoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending ProximityHandoffUIStartWithArtworkColors request to companion link client '%@'"), a4);
  else
    NSLog(CFSTR("ProximityHandoffUIStartWithArtworkColors sent successfully"));
}

void __53__SBSRemoteDeviceSender_handoffStartWithHandoffType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending ProximityHandoffUIStart request to companion link client '%@'"), a4);
  else
    NSLog(CFSTR("ProximityHandoffUIStart sent successfully"));
}

void __32__SBSRemoteDeviceSender_render___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __35__SBSRemoteDeviceSender_setVolume___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __35__SBSRemoteDeviceSender_getVolume___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(0.0);
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    (*(void (**)(uint64_t))(v6 + 16))(v6);

  }
}

void __48__SBSRemoteDeviceSender_suScanForSoftwareUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __33__SBSRemoteDeviceSender_siriSay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __40__SBSRemoteDeviceSender_setLEDContents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __41__SBSRemoteDeviceSender_setFeatureFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __41__SBSRemoteDeviceSender_getFeatureFlags___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __53__SBSRemoteDeviceSender_disassociateNetworkWithName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __51__SBSRemoteDeviceSender_disassociateCurrentNetwork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __40__SBSRemoteDeviceSender_setWifiEnabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __40__SBSRemoteDeviceSender_setBootSpinner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __42__SBSRemoteDeviceSender_clearHomeSWUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __44__SBSRemoteDeviceSender_setHomeUpdateState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __46__SBSRemoteDeviceSender_injectSWUpdateToHome___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __43__SBSRemoteDeviceSender_sendButtonCommand___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __48__SBSRemoteDeviceSender_triggerWiFiCoreCapture___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __40__SBSRemoteDeviceSender_sendLEDCommand___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __42__SBSRemoteDeviceSender_resetUserDefault___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __45__SBSRemoteDeviceSender_resetAllUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __51__SBSRemoteDeviceSender_setUserDefaults_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __41__SBSRemoteDeviceSender_getUserDefaults___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __34__SBSRemoteDeviceSender_stopTone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __34__SBSRemoteDeviceSender_playTone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __57__SBSRemoteDeviceSender_setTuningInfoOnBox_at_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
  else
    NSLog(CFSTR("companion sent correctly"));
}

void __39__SBSRemoteDeviceSender_getTuningInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __36__SBSRemoteDeviceSender_getLEDInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __50__SBSRemoteDeviceSender_getSelectDebugInfo_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __41__SBSRemoteDeviceSender_getAllDebugInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    NSLog(CFSTR("Error sending request companion link client '%@'"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    NSLog(CFSTR("companion sent correctly"));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __40__SBSRemoteDeviceSender_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _SBSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Error activating companion link client '%@'", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_222D7A000, v5, OS_LOG_TYPE_DEFAULT, "companion link client activated succcessfully", (uint8_t *)&v6, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
