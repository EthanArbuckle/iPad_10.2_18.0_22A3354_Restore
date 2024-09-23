@implementation SKStepWiFiSetupServerCW

- (SKStepWiFiSetupServerCW)init
{
  SKStepWiFiSetupServerCW *v2;
  SKStepWiFiSetupServerCW *v3;
  SKStepWiFiSetupServerCW *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiSetupServerCW;
  v2 = -[SKStepWiFiSetupServerCW init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupServerCW;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKStepWiFiSetupServerCW;
  -[SKStepWiFiSetupServerCW dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SKStepWiFiSetupServerCW_activate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  CUMessaging *skMessaging;
  uint64_t v4;
  CUMessaging *v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];

  self->_startTicks = mach_absolute_time();
  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    self->_internetReachabilityEnabled = 1;
    v4 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke;
    v12[3] = &unk_24D22B118;
    v12[4] = skMessaging;
    v12[5] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_2;
    v11[3] = &unk_24D22B140;
    v11[4] = skMessaging;
    v11[5] = self;
    v5 = skMessaging;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:](v5, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_bjTS"), 0, v12, v11);
    v9[5] = self;
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_3;
    v10[3] = &unk_24D22B118;
    v10[4] = v5;
    v10[5] = self;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_4;
    v9[3] = &unk_24D22B140;
    v9[4] = v5;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:](v5, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_bjTD"), 0, v10, v9);
    v7[5] = self;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_5;
    v8[3] = &unk_24D22B118;
    v8[4] = v5;
    v8[5] = self;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_6;
    v7[3] = &unk_24D22B140;
    v7[4] = v5;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:](v5, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_wiSU"), 0, v8, v7);

  }
  else
  {
    NSErrorF_safe();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SKStepWiFiSetupServerCW _completeWithError:](self, "_completeWithError:", v6);

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SKStepWiFiSetupServerCW_invalidate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  id skCompletionHandler;
  void *v4;
  int var0;
  void (**v6)(id, void *);

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v6 = (void (**)(id, void *))_Block_copy(self->_skCompletionHandler);
    skCompletionHandler = self->_skCompletionHandler;
    self->_skCompletionHandler = 0;

    if (v6)
    {
      NSErrorF_safe();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v4);

    }
    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
}

- (void)_completeWithError:(id)a3
{
  id v4;
  double v5;
  int var0;
  void *v7;
  id responseHandler;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  self->_runState = 0;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricTotalSeconds = v5;
  var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = _Block_copy(self->_responseHandler);
  responseHandler = self->_responseHandler;
  self->_responseHandler = 0;

  if (v7)
  {
    if (v4)
      v9 = 0;
    else
      v9 = MEMORY[0x24BDBD1B8];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke;
    v11[3] = &unk_24D22B140;
    v11[4] = self;
    v12 = v4;
    (*((void (**)(void *, uint64_t, _QWORD, id, _QWORD *))v7 + 2))(v7, v9, 0, v12, v11);

  }
}

- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  int var0;
  void *v9;
  id v10;
  void *v11;
  OS_dispatch_source *bonjourTimeoutTimer;
  NSObject *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  _QWORD handler[6];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    v10 = objc_alloc_init(MEMORY[0x24BE29790]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v10);
    objc_msgSend(v10, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v10, "setDomain:", CFSTR("local."));
    objc_msgSend(v10, "setLabel:", CFSTR("WiFiSetup"));
    objc_msgSend(v10, "setName:", v9);
    objc_msgSend(v10, "setPort:", 9);
    objc_msgSend(v10, "setServiceType:", CFSTR("_bonjourtest._tcp"));
    v22 = CFSTR("bjID");
    v23[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTxtDictionary:", v11);

    objc_msgSend(v10, "activate");
    bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
    if (bonjourTimeoutTimer)
    {
      v13 = bonjourTimeoutTimer;
      dispatch_source_cancel(v13);
      v14 = self->_bonjourTimeoutTimer;
      self->_bonjourTimeoutTimer = 0;

    }
    v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v16 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = v15;
    v17 = v15;

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2;
    handler[3] = &unk_24D22AFC8;
    handler[4] = v17;
    handler[5] = self;
    dispatch_source_set_event_handler(v17, handler);
    CUDispatchTimerSet();
    dispatch_activate(v17);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0, &__block_literal_global_36);

  }
  else
  {
    NSErrorWithOSStatusF();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*((void (**)(id, _QWORD, _QWORD, id, void *))v7 + 2))(v7, 0, 0, v10, &__block_literal_global_27);
  }

}

- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4
{
  id v6;
  int var0;
  CUBonjourAdvertiser *bonjourAdvertiser;
  OS_dispatch_source *bonjourTimeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate", v12);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
  if (bonjourTimeoutTimer)
  {
    v10 = bonjourTimeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = 0;

  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, MEMORY[0x24BDBD1B8], 0, 0, &__block_literal_global_38);

}

- (void)_handleRequestWiFiSetup:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id wifiEAPConfig;
  void *v12;
  id wifiEAPTrustExceptions;
  NSString *v14;
  NSString *wifiPassword;
  NSData *v16;
  NSData *wifiPSK;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *wifiSSID;
  int var0;
  void *v23;
  void *v24;
  id responseHandler;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__449;
  v35 = __Block_byref_object_dispose__450;
  v36 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v30 = &v31;
  aBlock[4] = self;
  v8 = v7;
  v29 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_runState)
    goto LABEL_9;
  self->_wifiChannel = CFDictionaryGetInt64Ranged();
  self->_wifiDirected = CFDictionaryGetInt64() != 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_wiEC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  wifiEAPConfig = self->_wifiEAPConfig;
  self->_wifiEAPConfig = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_wiET"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
  self->_wifiEAPTrustExceptions = v12;

  self->_wifiHomeNetwork = CFDictionaryGetInt64() != 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiPassword = self->_wifiPassword;
  self->_wifiPassword = v14;

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  wifiPSK = self->_wifiPSK;
  self->_wifiPSK = v16;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = self->_wifiPassword;
  self->_wifiPassword = v18;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiSSID = self->_wifiSSID;
  self->_wifiSSID = v20;

  if (!self->_wifiSSID)
  {
LABEL_9:
    NSErrorF_safe();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v32[5];
    v32[5] = v26;

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObject();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v24 = _Block_copy(v8);
    responseHandler = self->_responseHandler;
    self->_responseHandler = v24;

    -[SKStepWiFiSetupServerCW _run](self, "_run");
  }
  v9[2](v9);

  _Block_object_dispose(&v31, 8);
}

- (void)_run
{
  unint64_t runState;
  int v4;
  NSError *stepError;
  NSError *v6;
  NSError *v7;
  SKStepWiFiSetupServerCW *v8;
  uint64_t wifiChannel;
  SKStepWiFiSetupServerCW *v10;
  uint64_t v11;
  SKStepWiFiSetupServerCW *v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  const char *v17;
  const char *v18;
  int v19;
  int v20;
  int var0;
  int v22;
  const char *v23;
  const char *v24;
  const char *v25;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          if (self->_responseHandler)
          {
            if (self->_wifiChannel < 1)
              goto LABEL_33;
            v4 = 11;
            goto LABEL_39;
          }
          goto LABEL_40;
        case 3:
          stepError = self->_stepError;
          if (!stepError)
          {
            NSErrorF_safe();
            v6 = (NSError *)objc_claimAutoreleasedReturnValue();
            v7 = self->_stepError;
            self->_stepError = v6;

            stepError = self->_stepError;
          }
          v8 = self;
          goto LABEL_11;
        case 4:
          v8 = self;
          stepError = 0;
LABEL_11:
          -[SKStepWiFiSetupServerCW _completeWithError:](v8, "_completeWithError:", stepError, v24);
          goto LABEL_40;
        case 11:
          self->_runState = 12;
          wifiChannel = self->_wifiChannel;
          v10 = self;
          goto LABEL_20;
        case 12:
          if (self->_scanResult)
          {
            v4 = 13;
            goto LABEL_39;
          }
          if (self->_stepDone)
            goto LABEL_33;
          var0 = self->_ucat->var0;
          if (var0 > 30)
            goto LABEL_40;
          if (var0 == -1)
            goto LABEL_74;
          v14 = 12;
          goto LABEL_70;
        case 13:
          self->_runState = 14;
          v11 = self->_wifiChannel;
          v12 = self;
          goto LABEL_24;
        case 14:
          if (self->_stepDone)
          {
            if (!self->_stepError)
              goto LABEL_27;
LABEL_33:
            v4 = 15;
            goto LABEL_39;
          }
          v13 = self->_ucat->var0;
          if (v13 > 30)
            goto LABEL_40;
          if (v13 != -1)
          {
            v14 = 14;
            goto LABEL_70;
          }
          goto LABEL_74;
        case 15:
          self->_runState = 16;
          v10 = self;
          wifiChannel = 0;
LABEL_20:
          -[SKStepWiFiSetupServerCW _runScanStart:](v10, "_runScanStart:", wifiChannel, v24);
          goto LABEL_40;
        case 16:
          if (self->_scanResult)
          {
            v4 = 17;
            goto LABEL_39;
          }
          if (self->_stepDone)
            goto LABEL_38;
          v22 = self->_ucat->var0;
          if (v22 > 30)
            goto LABEL_40;
          if (v22 == -1)
            goto LABEL_74;
          v14 = 16;
          goto LABEL_70;
        case 17:
          self->_runState = 18;
          v12 = self;
          v11 = 0;
LABEL_24:
          -[SKStepWiFiSetupServerCW _runJoinStart:](v12, "_runJoinStart:", v11, v24, v25);
          goto LABEL_40;
        case 18:
          if (self->_stepDone)
          {
            if (self->_stepError)
              goto LABEL_38;
LABEL_27:
            v4 = 19;
            goto LABEL_39;
          }
          v19 = self->_ucat->var0;
          if (v19 > 30)
            goto LABEL_40;
          if (v19 != -1)
          {
            v14 = 18;
            goto LABEL_70;
          }
          goto LABEL_74;
        case 19:
          self->_runState = 20;
          -[SKStepWiFiSetupServerCW _runInternetReachabilityStart](self, "_runInternetReachabilityStart");
          goto LABEL_40;
        case 20:
          if (!self->_stepDone)
          {
            v20 = self->_ucat->var0;
            if (v20 > 30)
              goto LABEL_40;
            if (v20 != -1)
            {
              v14 = 20;
              goto LABEL_70;
            }
LABEL_74:
            if (!_LogCategory_Initialize())
              goto LABEL_40;
            v14 = self->_runState;
            if (v14 < 0x15)
            {
LABEL_70:
              if (((0x1FF8FFuLL >> v14) & 1) == 0)
                goto LABEL_71;
              v23 = off_24D22AD10[v14];
            }
            else
            {
LABEL_71:
              if ((int)v14 <= 9)
                v23 = "?";
              else
                v23 = "User";
            }
            v24 = v23;
            LogPrintF();
            goto LABEL_40;
          }
          if (self->_stepError)
LABEL_38:
            v4 = 3;
          else
            v4 = 4;
LABEL_39:
          self->_runState = v4;
LABEL_40:
          v15 = self->_runState;
          if (v15 == runState)
            return;
          v16 = self->_ucat->var0;
          if (v16 > 30)
            continue;
          if (v16 != -1)
            goto LABEL_43;
          if (_LogCategory_Initialize())
          {
            v15 = self->_runState;
LABEL_43:
            if (runState < 0x15 && ((0x1FF8FFuLL >> runState) & 1) != 0)
            {
              v17 = off_24D22AD10[runState];
            }
            else if ((int)runState <= 9)
            {
              v17 = "?";
            }
            else
            {
              v17 = "User";
            }
            if (v15 < 0x15 && ((0x1FF8FFuLL >> v15) & 1) != 0)
            {
              v18 = off_24D22AD10[v15];
            }
            else if ((int)v15 <= 9)
            {
              v18 = "?";
            }
            else
            {
              v18 = "User";
            }
            v24 = v17;
            v25 = v18;
            LogPrintF();
          }
          break;
        default:
          goto LABEL_40;
      }
    }
  }
}

- (void)_runScanStart:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  int var0;
  NSError *stepError;
  CWFScanResult *scanResult;
  id v10;
  id v11;
  void *v12;
  NSString *v13;
  CWFInterface *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  int v18;
  _QWORD aBlock[6];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];

  v3 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__449;
  v25 = __Block_byref_object_dispose__450;
  v26 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke;
  aBlock[3] = &unk_24D22ACA0;
  aBlock[4] = self;
  aBlock[5] = &v21;
  v20 = a3;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v16 = v3;
    LogPrintF();
  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  scanResult = self->_scanResult;
  self->_scanResult = 0;

  v10 = objc_alloc_init(MEMORY[0x24BE29F28]);
  if ((int)v3 >= 1)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE29F08]);
    objc_msgSend(v11, "setChannel:", v3);
    objc_msgSend(v11, "setFlags:", 28);
    v27[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setChannels:", v12);

  }
  v13 = self->_wifiSSID;
  if (v13)
  {
    objc_msgSend(v10, "setSSID:", v13);
    v14 = self->_wifiInterface;
    if (!v14)
    {
      v14 = (CWFInterface *)objc_alloc_init(MEMORY[0x24BE29F18]);
      objc_storeStrong((id *)&self->_wifiInterface, v14);
      -[CWFInterface activate](v14, "activate");
    }
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2;
    v17[3] = &unk_24D22A310;
    v17[4] = self;
    v18 = v3;
    -[CWFInterface performScanWithParameters:reply:](v14, "performScanWithParameters:reply:", v10, v17, v16);
  }
  else
  {
    NSErrorF_safe();
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = (CWFInterface *)v22[5];
    v22[5] = v15;
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);

}

- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5
{
  NSError *v7;
  void *v8;
  int var0;
  void *scanResult;
  CWFScanResult *v11;
  NSError *stepError;
  id v13;

  v13 = a3;
  v7 = (NSError *)a4;
  objc_msgSend(v13, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucat->var0;
  if (!v7)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v13, "count");
      LogPrintF();
    }
    v11 = v8;
    scanResult = self->_scanResult;
    self->_scanResult = v11;
    goto LABEL_12;
  }
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    scanResult = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_12:

  }
  self->_stepDone = 1;
  stepError = self->_stepError;
  self->_stepError = v7;

  -[SKStepWiFiSetupServerCW _run](self, "_run");
}

- (void)_runJoinStart:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  int var0;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  NSError *stepError;
  CWFScanResult *v16;
  id v17;
  CWFInterface *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  _QWORD v27[5];
  int v28;
  _QWORD aBlock[6];
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = *(_QWORD *)&a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__449;
  v35 = __Block_byref_object_dispose__450;
  v36 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke;
  aBlock[3] = &unk_24D22ACA0;
  aBlock[4] = self;
  aBlock[5] = &v31;
  v30 = a3;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "yes";
    if (self->_wifiEAPConfig)
      v11 = "yes";
    else
      v11 = "no";
    if (self->_wifiEAPTrustExceptions)
      v12 = "yes";
    else
      v12 = "no";
    if (self->_wifiPassword)
      v13 = "yes";
    else
      v13 = "no";
    if (self->_wifiPSK)
      v14 = "yes";
    else
      v14 = "no";
    if (!self->_wifiHomeNetwork)
      v10 = "no";
    v25 = v14;
    v26 = v10;
    v23 = v12;
    v24 = v13;
    v21 = v3;
    v22 = v11;
    v20 = v8;
    LogPrintF();

  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v16 = self->_scanResult;
  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x24BE29F00]);
    objc_msgSend(v17, "setScanResult:", v16);
    objc_msgSend(v17, "setPassword:", self->_wifiPassword);
    v18 = self->_wifiInterface;
    if (!v18)
    {
      v18 = (CWFInterface *)objc_alloc_init(MEMORY[0x24BE29F18]);
      objc_storeStrong((id *)&self->_wifiInterface, v18);
      -[CWFInterface activate](v18, "activate");
    }
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2;
    v27[3] = &unk_24D22A338;
    v27[4] = self;
    v28 = v3;
    -[CWFInterface associateWithParameters:reply:](v18, "associateWithParameters:reply:", v17, v27, v20, v21, v22, v23, v24, v25, v26);

  }
  else
  {
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = (id)v32[5];
    v32[5] = v19;
  }

  v6[2](v6);
  _Block_object_dispose(&v31, 8);

}

- (void)_runInternetReachabilityStart
{
  int var0;
  NSError *stepError;
  CUReachabilityMonitor *v5;
  CUReachabilityMonitor *internetReachabilityMonitor;
  CUReachabilityMonitor *v7;
  NSError *v8;
  _QWORD v9[6];

  var0 = self->_ucat->var0;
  if (self->_internetReachabilityEnabled)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_stepDone = 0;
    stepError = self->_stepError;
    self->_stepError = 0;

    -[CUReachabilityMonitor invalidate](self->_internetReachabilityMonitor, "invalidate");
    v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x24BE29818]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    v7 = v5;

    -[CUReachabilityMonitor setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[CUReachabilityMonitor setTimeout:](v7, "setTimeout:", 20.0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke;
    v9[3] = &unk_24D22B140;
    v9[4] = v7;
    v9[5] = self;
    -[CUReachabilityMonitor setCompletionHandler:](v7, "setCompletionHandler:", v9);
    -[CUReachabilityMonitor activate](v7, "activate");

  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_stepDone = 1;
    v8 = self->_stepError;
    self->_stepError = 0;

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_skMessaging, a3);
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
  objc_storeWeak((id *)&self->_skSetupObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong(&self->_wifiEAPTrustExceptions, 0);
  objc_storeStrong(&self->_wifiEAPConfig, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_internetReachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

void __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 == *(void **)(v5 + 40))
  {
    *(_QWORD *)(v5 + 40) = 0;
    v12 = v3;

    if (v12)
    {
      NSErrorNestedF();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 104);
      *(_QWORD *)(v7 + 104) = v6;

      v9 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 112);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else
    {
      v10 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 112);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 96) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    v3 = v12;
  }

}

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v2 + 96) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 48))
  {
    v6 = **(_DWORD **)(v5 + 112);
    v8 = v4;
    if (v4)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), a2);
    objc_msgSend(*(id *)(a1 + 32), "_run");
    v4 = v8;
  }

}

void __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v2 + 96) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

_BYTE *__41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[48])
    return (_BYTE *)objc_msgSend(result, "_runScanResults:error:channel:", a3, a2, *(unsigned int *)(a1 + 40));
  return result;
}

uint64_t __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 112);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2 == *(void **)(v1 + 24))
  {
    if (v2)
    {
      v4 = v2;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;

      v1 = *(_QWORD *)(a1 + 40);
    }
    v7 = **(_DWORD **)(v1 + 112);
    if (v7 <= 90)
    {
      if (v7 != -1 || (v8 = _LogCategory_Initialize(), v1 = *(_QWORD *)(a1 + 40), v8))
      {
        LogPrintF();
        v1 = *(_QWORD *)(a1 + 40);
      }
    }
    objc_msgSend(*(id *)(v1 + 16), "invalidate");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = 0;

  }
}

void __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(void *, _QWORD);
  id v4;
  id v5;

  v5 = a2;
  v3 = (void (**)(void *, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 200));
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40))
      v4 = *(id *)(a1 + 40);
    else
      v4 = v5;
    ((void (**)(void *, id))v3)[2](v3, v4);
  }

}

void __37__SKStepWiFiSetupServerCW_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = **(_DWORD **)(v3 + 112);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    v20 = _Block_copy(*(const void **)(v3 + 64));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = 0;

    if (v20)
    {
      NSErrorF_safe();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *, void *))v20 + 2))(v20, 0, 0, v8, &__block_literal_global_510);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    if (v12)
    {
      v13 = v12;
      dispatch_source_cancel(v13);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(_QWORD *)(v14 + 24) = 0;

      v11 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v11 + 40), "invalidate");
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "deregisterRequestID:completionHandler:", CFSTR("_bjTS"), &__block_literal_global_16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "deregisterRequestID:completionHandler:", CFSTR("_bjTD"), &__block_literal_global_17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "deregisterRequestID:completionHandler:", CFSTR("_wiSU"), &__block_literal_global_18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "invalidate");
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 152);
    *(_QWORD *)(v18 + 152) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[26])
    return (_QWORD *)objc_msgSend(result, "_handleRequestBonjourTestStart:responseHandler:", a3, a5);
  return result;
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke_2(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result[4];
    result = (_QWORD *)result[5];
    if (v2 == result[26])
      return (_QWORD *)objc_msgSend(result, "_completeWithError:", a2);
  }
  return result;
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[26])
    return (_QWORD *)objc_msgSend(result, "_handleRequestBonjourTestDone:responseHandler:", a3, a5);
  return result;
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke_4(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result[4];
    result = (_QWORD *)result[5];
    if (v2 == result[26])
      return (_QWORD *)objc_msgSend(result, "_completeWithError:", a2);
  }
  return result;
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[26])
    return (_QWORD *)objc_msgSend(result, "_handleRequestWiFiSetup:responseHandler:", a3, a5);
  return result;
}

_QWORD *__36__SKStepWiFiSetupServerCW__activate__block_invoke_6(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result[4];
    result = (_QWORD *)result[5];
    if (v2 == result[26])
      return (_QWORD *)objc_msgSend(result, "_completeWithError:", a2);
  }
  return result;
}

uint64_t __35__SKStepWiFiSetupServerCW_activate__block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[14];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_activate");
}

@end
