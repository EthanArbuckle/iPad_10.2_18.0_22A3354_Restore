@implementation SKSetupCaptiveNetworkJoinClient

- (SKSetupCaptiveNetworkJoinClient)init
{
  SKSetupCaptiveNetworkJoinClient *v2;
  SKSetupCaptiveNetworkJoinClient *v3;
  SKSetupCaptiveNetworkJoinClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupCaptiveNetworkJoinClient);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_invalidate
{
  objc_super v3;

  -[SKSetupCaptiveNetworkJoinClient _networkRelayEnsureStopped](self, "_networkRelayEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_captiveProbeRequest
{
  int var0;
  void *v4;
  _QWORD v5[5];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v6 = CFSTR("timeoutSeconds");
  v7[0] = &unk_24D233778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke;
  v5[3] = &unk_24D22ADF0;
  v5[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:](self, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_cnPb"), MEMORY[0x24BDBD1B8], v4, v5);

}

- (void)_captiveProbeResponse:(id)a3
{
  CFDictionaryGetInt64Ranged();
}

- (void)_networkRelayEnsureStopped
{
  CUBonjourBrowser *awdlBrowser;
  OS_dispatch_source *awdlTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *networkRelayTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  NRDeviceIdentifier *v10;
  BOOL v11;
  int var0;
  NRDeviceIdentifier *nrDeviceIdentifier;
  NRDeviceManager *nrDeviceManager;
  NRDeviceMonitor *nrDeviceMonitor;
  uint64_t v16;
  void *v17;
  NRDeviceManager *v18;

  -[CUBonjourBrowser invalidate](self->_awdlBrowser, "invalidate");
  awdlBrowser = self->_awdlBrowser;
  self->_awdlBrowser = 0;

  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    v5 = awdlTimer;
    dispatch_source_cancel(v5);
    v6 = self->_awdlTimer;
    self->_awdlTimer = 0;

  }
  networkRelayTimer = self->_networkRelayTimer;
  if (networkRelayTimer)
  {
    v8 = networkRelayTimer;
    dispatch_source_cancel(v8);
    v9 = self->_networkRelayTimer;
    self->_networkRelayTimer = 0;

  }
  v18 = self->_nrDeviceManager;
  v10 = self->_nrDeviceIdentifier;
  if (v18)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[NRDeviceIdentifier nrDeviceIdentifier](v10, "nrDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v17);
    }
    else
    {
      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v16);
    }
  }
  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0;

}

- (void)_postEvent:(id)a3
{
  id v4;
  int var0;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "eventType") == 201)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SKSetupCaptiveNetworkJoinClient _captiveProbeRequest](self, "_captiveProbeRequest", v4);
    }
    else
    {
      -[SKSetupCaptiveNetworkJoinClient _captiveProbeRequest](self, "_captiveProbeRequest", v6);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
    -[SKSetupBase _postEvent:](&v7, sel__postEvent_, v4);
  }

}

- (void)_run
{
  const char *v3;
  const char *v4;
  char **v5;
  const char *v6;
  const char *v7;
  int runState;
  int v9;
  int v10;
  uint64_t v11;
  OS_dispatch_source *awdlTimer;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  char **v18;
  NSObject *v19;
  void *v20;
  int var0;

  if (!self->super._invalidateCalled)
  {
    v3 = "?";
    v4 = "User";
    v5 = off_24D22A3F0;
    v6 = "-[SKSetupCaptiveNetworkJoinClient _run]";
    v7 = "State: %s -> %s";
    while (1)
    {
      runState = self->super._runState;
      switch(runState)
      {
        case 0:
          v9 = 11;
          goto LABEL_27;
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", 0, 1, 1, &__block_literal_global_675);
          goto LABEL_25;
        case 12:
          v10 = -[SKConnection state](self->super._skCnx, "state");
          v9 = self->super._runState;
          if (v10 != 1)
            break;
          goto LABEL_26;
        case 13:
          -[SKSetupCaptiveNetworkJoinClient _runAWDLStart](self, "_runAWDLStart");
          goto LABEL_25;
        case 14:
          if (self->_awdlAdvertiserPeerStarted)
          {
            v9 = 15;
            goto LABEL_27;
          }
          v9 = 14;
          break;
        case 15:
          -[SKSetupCaptiveNetworkJoinClient _runAWDLFoundTimerStart](self, "_runAWDLFoundTimerStart");
          goto LABEL_25;
        case 16:
          if (!self->_awdlPeerDevice)
          {
            v9 = 16;
            break;
          }
          v11 = 240;
          awdlTimer = self->_awdlTimer;
          if (awdlTimer)
            goto LABEL_23;
          v9 = 16;
          goto LABEL_26;
        case 17:
          v13 = -[SKSetupCaptiveNetworkJoinClient _runNetworkRelayPeerStart](self, "_runNetworkRelayPeerStart");
          v9 = self->super._runState;
          if (!v13)
            break;
          goto LABEL_26;
        case 18:
          if (self->_networkRelayPeerIPStr)
          {
            v9 = 19;
            goto LABEL_27;
          }
          v9 = 18;
          break;
        case 19:
          -[SKSetupCaptiveNetworkJoinClient _runNetworkRelaySelfStart](self, "_runNetworkRelaySelfStart");
          goto LABEL_25;
        case 20:
          if (!self->_networkRelayProxyInterface)
          {
            v9 = 20;
            break;
          }
          v11 = 264;
          awdlTimer = self->_networkRelayTimer;
          if (awdlTimer)
          {
LABEL_23:
            v14 = v4;
            v15 = v3;
            v16 = v7;
            v17 = v6;
            v18 = v5;
            v19 = awdlTimer;
            dispatch_source_cancel(v19);
            v20 = *(Class *)((char *)&self->super.super.isa + v11);
            *(Class *)((char *)&self->super.super.isa + v11) = 0;

            v5 = v18;
            v6 = v17;
            v7 = v16;
            v3 = v15;
            v4 = v14;
LABEL_25:
            v9 = self->super._runState;
          }
          else
          {
            v9 = 20;
          }
LABEL_26:
          ++v9;
          goto LABEL_27;
        case 21:
          -[SKSetupCaptiveNetworkJoinClient _runCaptiveNetworkLoginStart](self, "_runCaptiveNetworkLoginStart");
          goto LABEL_25;
        case 22:
          if (self->_captiveNetworkLoginDone)
          {
            v9 = 23;
            goto LABEL_27;
          }
          v9 = 22;
          break;
        case 23:
          if (self->_captiveNetworkProbingSuccess)
          {
            v9 = 24;
LABEL_27:
            self->super._runState = v9;
          }
          else
          {
            v9 = 23;
          }
          break;
        case 24:
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0);
          v9 = self->super._runState;
          break;
        default:
          return;
      }
      if (v9 == runState)
        break;
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

- (void)_runAWDLStart
{
  CUBonjourBrowser **p_awdlBrowser;
  CUBonjourDevice *awdlPeerDevice;
  id v5;
  uint64_t v6;
  int var0;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];
  _QWORD v15[6];
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  p_awdlBrowser = &self->_awdlBrowser;
  -[CUBonjourBrowser invalidate](self->_awdlBrowser, "invalidate");
  awdlPeerDevice = self->_awdlPeerDevice;
  self->_awdlPeerDevice = 0;

  v5 = objc_alloc_init(MEMORY[0x24BE29798]);
  objc_storeStrong((id *)p_awdlBrowser, v5);
  objc_msgSend(v5, "setChangeFlags:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setDispatchQueue:", self->super._dispatchQueue);
  objc_msgSend(v5, "setDomain:", CFSTR("local."));
  objc_msgSend(v5, "setInterfaceName:", CFSTR("awdl0"));
  objc_msgSend(v5, "setServiceType:", CFSTR("_setupkit._tcp"));
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke;
  v15[3] = &unk_24D22A380;
  v15[4] = v5;
  v15[5] = self;
  objc_msgSend(v5, "setDeviceFoundHandler:", v15);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2;
  v14[3] = &unk_24D22A3A8;
  v14[4] = v5;
  v14[5] = self;
  objc_msgSend(v5, "setDeviceChangedHandler:", v14);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  objc_msgSend(v5, "activate");
  *(_QWORD *)((char *)v20 + 5) = 0;
  v20[0] = 0;
  RandomString();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v20);
  objc_storeStrong((id *)&self->_awdlName, v8);
  v9 = self->super._ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
  {
    v12 = v8;
    LogPrintF();
  }
  self->_awdlAdvertiserPeerStarted = 0;
  v18 = CFSTR("_nm");
  v19 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("timeoutSeconds");
  v17 = &unk_24D233778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3;
  v13[3] = &unk_24D22ADF0;
  v13[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:](self, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_awSt"), v10, v11, v13);

}

- (void)_runAWDLFoundTimerStart
{
  OS_dispatch_source *v3;
  OS_dispatch_source *awdlTimer;
  NSObject *v5;
  _QWORD v6[6];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  awdlTimer = self->_awdlTimer;
  self->_awdlTimer = v3;
  v5 = v3;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke;
  v6[3] = &unk_24D22AFC8;
  v6[4] = v5;
  v6[5] = self;
  dispatch_source_set_event_handler(v5, v6);
  CUDispatchTimerSet();
  dispatch_activate(v5);

}

- (void)_runAWDLFoundDevice:(id)a3
{
  void *v5;
  NSString *awdlName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  int v11;
  int var0;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  awdlName = self->_awdlName;
  v7 = v5;
  v8 = awdlName;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if ((v7 == 0) == (v8 != 0))
    {

LABEL_13:
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      goto LABEL_11;
    }
    v10 = -[NSString isEqual:](v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_13;
  }
  v11 = self->super._ucat->var0;
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  objc_storeStrong((id *)&self->_awdlPeerDevice, a3);
  -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
LABEL_11:

}

- (BOOL)_runNetworkRelayPeerStart
{
  int v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  int var0;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = 0;
  v18 = 0;
  v17 = 0;
  if (CUGetInterfaceAddresses())
  {
    NSErrorF_safe();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v11);

    return 0;
  }
  else
  {
    v3 = SockAddrToString();
    v4 = v3 == 0;
    if (v3)
    {
      NSErrorF_safe();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("_ip");
      v22 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("timeoutSeconds");
      v20 = &unk_24D233778;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectOneLine();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke;
      v13[3] = &unk_24D22A3D0;
      v13[4] = self;
      v14 = v5;
      v9 = v5;
      -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:](self, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_ntRl"), v6, v7, v13);

    }
  }
  return v4;
}

- (void)_runNetworkRelaySelfStart
{
  void (**v3)(_QWORD);
  NRDeviceManager *v4;
  NRDeviceIdentifier **p_nrDeviceIdentifier;
  NRDeviceIdentifier *v6;
  int var0;
  NRDeviceIdentifier *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  SKConnection *skCnx;
  id *v15;
  id v16;
  void *v17;
  int v18;
  OS_dispatch_queue *dispatchQueue;
  dispatch_source_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  _QWORD handler[6];
  _QWORD v35[5];
  id obj;
  uint64_t v37;
  _QWORD v38[3];
  int v39;
  _QWORD aBlock[6];
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[32];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__626;
  v45 = __Block_byref_object_dispose__627;
  v46 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v41;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  v4 = self->_nrDeviceManager;
  if (!v4)
  {
    v4 = (NRDeviceManager *)objc_msgSend(MEMORY[0x24BE6B6C0], "copySharedDeviceManager");
    if (!v4)
    {
      NSErrorF_safe();
      v30 = objc_claimAutoreleasedReturnValue();
      v4 = (NRDeviceManager *)v42[5];
      v42[5] = (id)v30;
      goto LABEL_27;
    }
    objc_storeStrong((id *)&self->_nrDeviceManager, v4);
  }
  p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
  v6 = self->_nrDeviceIdentifier;
  if (v6)
  {
    var0 = self->super._ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[NRDeviceIdentifier nrDeviceIdentifier](v6, "nrDeviceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[NRDeviceManager unregisterDevice:](v4, "unregisterDevice:", v6, v32);
    v8 = *p_nrDeviceIdentifier;
    *p_nrDeviceIdentifier = 0;

  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BE6B6B8], "newEphemeralDeviceIdentifier");
  if (v9)
  {
    objc_storeStrong((id *)&self->_nrDeviceIdentifier, v9);
    v10 = objc_alloc_init(MEMORY[0x24BE6B6E0]);
    v11 = -[NSString UTF8String](self->_networkRelayPeerIPStr, "UTF8String");
    if (v11)
    {
      memset(v38, 0, sizeof(v38));
      v39 = 0;
      v37 = 0;
      if (StringToSockAddr())
      {
        NSErrorF_safe();
        v24 = objc_claimAutoreleasedReturnValue();
        v13 = v42[5];
        v42[5] = (id)v24;
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v38, v37);
        objc_msgSend(v10, "setAwdlAddressData:", v12);

        if (-[NSData length](self->super._pskData, "length"))
        {
          -[NSData bytes](self->super._pskData, "bytes");
          -[NSData length](self->super._pskData, "length");
          CryptoHKDF();
          v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v47, 32, v47);
        }
        else
        {
          skCnx = self->super._skCnx;
          v15 = v42;
          obj = v42[5];
          -[SKConnection deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:](skCnx, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:", "NetworkRelaySalt", 16, "NetworkRelayInfo", 16, 32, &obj);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v15 + 5, obj);
        }
        if (v13)
        {
          objc_msgSend(v10, "setOutOfBandKey:", v13);
          v16 = objc_alloc_init(MEMORY[0x24BE6B6D8]);
          objc_msgSend(v16, "setAllowedLinkTypes:", &unk_24D233670);
          objc_msgSend(v16, "setAllowedLinkSubtypes:", &unk_24D233688);
          objc_msgSend(v16, "setProxyCapability:", 2);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6C8]), "initWithDeviceIdentifier:delegate:queue:", *p_nrDeviceIdentifier, self, self->super._dispatchQueue);
          if (v17)
          {
            objc_storeStrong((id *)&self->_nrDeviceMonitor, v17);
            v18 = self->super._ucat->var0;
            if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
            {
              v32 = v9;
              v33 = v11;
              LogPrintF();
            }
            dispatchQueue = self->super._dispatchQueue;
            v35[0] = MEMORY[0x24BDAC760];
            v35[1] = 3221225472;
            v35[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_74;
            v35[3] = &unk_24D22A9C8;
            v35[4] = self;
            -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:](v4, "registerDevice:properties:operationalproperties:queue:completionBlock:", v9, v10, v16, dispatchQueue, v35, v32, v33);
            v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
            objc_storeStrong((id *)&self->_networkRelayTimer, v20);
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 3221225472;
            handler[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2;
            handler[3] = &unk_24D22AFC8;
            handler[4] = v20;
            handler[5] = self;
            dispatch_source_set_event_handler(v20, handler);
            CUDispatchTimerSet();
            dispatch_activate(v20);

          }
          else
          {
            NSErrorF_safe();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v42[5];
            v42[5] = (id)v28;

          }
        }
        else
        {
          v25 = v42;
          v26 = v42[5];
          if (v26)
          {
            v27 = v26;
            v16 = v25[5];
            v25[5] = v27;
          }
          else
          {
            NSErrorF_safe();
            v31 = objc_claimAutoreleasedReturnValue();
            v16 = v42[5];
            v42[5] = (id)v31;
          }
        }

      }
    }
    else
    {
      NSErrorF_safe();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v42[5];
      v42[5] = (id)v22;

    }
  }
  else
  {
    NSErrorF_safe();
    v21 = objc_claimAutoreleasedReturnValue();
    v10 = v42[5];
    v42[5] = (id)v21;
  }

LABEL_27:
  v3[2](v3);

  _Block_object_dispose(&v41, 8);
}

- (void)_runCaptiveNetworkLoginStart
{
  int var0;
  void *v4;
  _QWORD v5[5];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v6 = CFSTR("timeoutSeconds");
  v7[0] = &unk_24D233778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke;
  v5[3] = &unk_24D22ADF0;
  v5[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:](self, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_cnLg"), MEMORY[0x24BDBD1B8], v4, v5);

}

- (void)_runCaptiveNetworkLoginResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  SKEventCaptiveNetworkPresent *v8;
  id v9;

  v9 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
      if (v6)
      {
        v7 = self->_networkRelayProxyInterface;
        if (v7)
        {
          v8 = -[SKEventCaptiveNetworkPresent initWithCaptiveURL:interfaceIdentifier:ssid:]([SKEventCaptiveNetworkPresent alloc], "initWithCaptiveURL:interfaceIdentifier:ssid:", v6, v7, v4);
          -[SKSetupBase _reportEvent:](self, "_reportEvent:", v8);
          self->_captiveNetworkLoginDone = 1;
          -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
        }
        else
        {
          NSErrorF_safe();
          v8 = (SKEventCaptiveNetworkPresent *)objc_claimAutoreleasedReturnValue();
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", v8);
        }

      }
      else
      {
        NSErrorF_safe();
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[SKSetupBase _completeWithError:](self, "_completeWithError:", v7, v5);
      }

    }
    else
    {
      NSErrorF_safe();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v6);
    }

  }
  else
  {
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v5);
  }

}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int var0;
  void *StringFromNRLinkType;
  void *StringFromNRLinkSubtype;
  id v10;

  v4 = a4;
  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  objc_msgSend(v10, "proxyServiceInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v10, "linkType");
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    objc_msgSend(v10, "linkSubtype");
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();

  }
  if (v4 && !self->_networkRelayProxyInterface && objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, v6);
    -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
  }

}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int var0;
  void *StringFromNRLinkSubtype;
  id StringFromNRLinkType;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    StringFromNRLinkType = (id)createStringFromNRLinkType();
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();

  }
}

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  id v6;
  int var0;
  void *v8;
  const char *v9;
  void *StringFromNRLinkType;
  void *StringFromNRLinkSubtype;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    v8 = v16;
    if (var0 != -1)
    {
LABEL_3:
      if (objc_msgSend(v8, "isConnected"))
        v9 = "yes";
      else
        v9 = "no";
      objc_msgSend(v16, "linkType");
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      objc_msgSend(v16, "linkSubtype");
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
      objc_msgSend(v16, "proxyServiceInterfaceName");
      v14 = StringFromNRLinkSubtype;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = StringFromNRLinkType;
      LogPrintF();

      goto LABEL_8;
    }
    if (_LogCategory_Initialize())
    {
      v8 = v16;
      goto LABEL_3;
    }
  }
LABEL_8:
  if (objc_msgSend(v16, "isConnected", v12, v13, v14, v15)
    && !self->_networkRelayProxyInterface
    && objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, a4);
    -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_nrDeviceManager, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkRelayTimer, 0);
  objc_storeStrong((id *)&self->_networkRelayProxyInterface, 0);
  objc_storeStrong((id *)&self->_networkRelayPeerIPStr, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);
  objc_storeStrong((id *)&self->_awdlPeerDevice, 0);
  objc_storeStrong((id *)&self->_awdlName, 0);
  objc_storeStrong((id *)&self->_awdlBrowser, 0);
}

void __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _DWORD **v11;
  int v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v11 = *(_DWORD ***)(a1 + 32);
  v12 = *v11[18];
  v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (v15 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v11 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v9)
    {
      objc_msgSend(v11, "_completeWithError:", v9);
    }
    else
    {
      NSErrorF_safe();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_completeWithError:", v16);

    }
  }
  else
  {
    v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (v14 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        CUPrintNSObjectOneLine();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v13 = v19;
        v11 = *(_DWORD ***)(a1 + 32);
      }
      else
      {
        v13 = v19;
      }
    }
    objc_msgSend(v11, "_runCaptiveNetworkLoginResponse:", v13, v17);
  }

}

uint64_t __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(_QWORD *)(v2 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    return objc_msgSend(v3, "_completeWithError:", *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_74(uint64_t a1, void *a2)
{
  void *v3;
  _DWORD **v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = v10;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[18];
  if (v10)
  {
    if (v5 <= 90 && (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6)))
    {
      CUPrintNSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v10, v9);
    }
    else
    {
      objc_msgSend(v4, "_completeWithError:", v10, v8);
    }
    goto LABEL_10;
  }
  if (v5 <= 30)
  {
    if (v5 != -1 || (v7 = _LogCategory_Initialize(), v3 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      v3 = v10;
    }
  }

}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v1 == (void *)v2[33])
  {
    if (v1)
    {
      v4 = v1;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 264);
      *(_QWORD *)(v5 + 264) = 0;

      v2 = *(_QWORD **)(a1 + 40);
    }
    NSErrorF_safe();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_completeWithError:", v7);

  }
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  _DWORD **v12;
  int v13;
  _DWORD **v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  v7 = a3;
  v8 = a4;
  if (!v24 || v8)
  {
    v14 = *(_DWORD ***)(a1 + 32);
    v15 = *v14[18];
    if (v15 <= 90)
    {
      if (v15 != -1 || (v16 = _LogCategory_Initialize(), v14 = *(_DWORD ***)(a1 + 32), v16))
      {
        CUPrintNSError();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v14 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v8)
    {
      objc_msgSend(v14, "_completeWithError:", v8);
    }
    else
    {
      NSErrorF_safe();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_completeWithError:", v17);

    }
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");
    v11 = *(id **)(a1 + 32);
    if (v10)
    {
      objc_storeStrong(v11 + 31, v9);
      v12 = *(_DWORD ***)(a1 + 32);
      v13 = *v12[18];
      if (v13 <= 30 && (v13 != -1 || (v18 = _LogCategory_Initialize(), v12 = *(_DWORD ***)(a1 + 32), v18)))
      {
        v21 = *(_QWORD *)(a1 + 40);
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 32), "_run", v21, v9);
      }
      else
      {
        objc_msgSend(v12, "_run", v20, v23);
      }
    }
    else
    {
      NSErrorF_safe();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_completeWithError:", v19);

    }
  }

}

void __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v1 == (void *)v2[30])
  {
    if (v1)
    {
      v4 = v1;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 240);
      *(_QWORD *)(v5 + 240) = 0;

      v2 = *(_QWORD **)(a1 + 40);
    }
    NSErrorF_safe();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_completeWithError:", v7);

  }
}

_QWORD *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[27])
    return (_QWORD *)objc_msgSend(result, "_runAWDLFoundDevice:", a2);
  return result;
}

_QWORD *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[27])
    return (_QWORD *)objc_msgSend(result, "_runAWDLFoundDevice:", a2);
  return result;
}

void __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = **(_DWORD **)(v9 + 144);
  if (!v15 || v8)
  {
    if (v10 <= 90)
    {
      if (v10 != -1 || (v12 = _LogCategory_Initialize(), v9 = *(_QWORD *)(a1 + 32), v12))
      {
        CUPrintNSError();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v9 = *(_QWORD *)(a1 + 32);
      }
    }
    if (v8)
    {
      objc_msgSend((id)v9, "_completeWithError:", v8);
    }
    else
    {
      NSErrorF_safe();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "_completeWithError:", v13);

    }
  }
  else
  {
    if (v10 <= 30)
    {
      if (v10 != -1 || (v11 = _LogCategory_Initialize(), v9 = *(_QWORD *)(a1 + 32), v11))
      {
        LogPrintF();
        v9 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v9 + 210) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

void __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _DWORD **v11;
  int v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v11 = *(_DWORD ***)(a1 + 32);
  v12 = *v11[18];
  v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (v15 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v11 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v9)
    {
      objc_msgSend(v11, "_completeWithError:", v9);
    }
    else
    {
      NSErrorF_safe();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_completeWithError:", v16);

    }
  }
  else
  {
    v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (v14 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        CUPrintNSObjectOneLine();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v13 = v19;
        v11 = *(_DWORD ***)(a1 + 32);
      }
      else
      {
        v13 = v19;
      }
    }
    objc_msgSend(v11, "_captiveProbeResponse:", v13, v17);
  }

}

@end
