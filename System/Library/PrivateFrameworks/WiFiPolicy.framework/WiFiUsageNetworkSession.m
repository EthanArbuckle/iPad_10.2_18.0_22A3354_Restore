@implementation WiFiUsageNetworkSession

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSMutableSet *neighborBssList;
  void *v13;
  NSMutableSet *otherBssList;
  void *v15;
  objc_super v16;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession scanningStateDidChange:client:neighborBSS:otherBSS:](&v16, sel_scanningStateDidChange_client_neighborBSS_otherBSS_, v8, a4, v10, v11);
  if (self->_linkUp)
  {
    if (v10)
    {
      neighborBssList = self->_neighborBssList;
      objc_msgSend(v10, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](neighborBssList, "addObjectsFromArray:", v13);

    }
    if (v11)
    {
      otherBssList = self->_otherBssList;
      objc_msgSend(v11, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](otherBssList, "addObjectsFromArray:", v15);

    }
  }

}

- (WiFiUsageNetworkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  WiFiUsageNetworkSession *v4;
  WiFiUsageNetworkDetails *lastNetworkDetails;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *WiFiLinkStateBiomeEventQueue;
  OS_dispatch_queue *v9;
  uint64_t v10;
  NSMutableSet *neighborBssList;
  uint64_t v12;
  NSMutableSet *otherBssList;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WiFiUsageNetworkSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v15, sel_initWithSessionType_andInterfaceName_andCapabilities_, 3, a3, a4);
  lastNetworkDetails = v4->_lastNetworkDetails;
  v4->_lastNetworkDetails = 0;

  v4->_linkUp = 0;
  v4->_networkUsageDuration = 0.0;
  v4->_dnuEnabled = 0;
  v4->_dnuEnabled = DiagnosticLogSubmissionEnabled();
  if (_os_feature_enabled_impl())
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.WiFiLinkState-Biome-Event", v6);
    WiFiLinkStateBiomeEventQueue = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = (OS_dispatch_queue *)v7;

  }
  else
  {
    v9 = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = 0;

    NSLog(CFSTR("%s: Do Not allocate _WiFiLinkStateBiomeEventQueue as WiFiDirectDonation Feature Flag Disabled!"), "-[WiFiUsageNetworkSession initWithInterfaceName:andCapabilities:]");
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = objc_claimAutoreleasedReturnValue();
  neighborBssList = v4->_neighborBssList;
  v4->_neighborBssList = (NSMutableSet *)v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = objc_claimAutoreleasedReturnValue();
  otherBssList = v4->_otherBssList;
  v4->_otherBssList = (NSMutableSet *)v12;

  return v4;
}

- (void)displayStateDidChange:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession displayStateDidChange:](&v5, sel_displayStateDidChange_);
  if (!a3 && !-[WiFiUsageSession poweredOn](self, "poweredOn"))
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog(CFSTR("%s: network session ended"), "-[WiFiUsageNetworkSession displayStateDidChange:]");
      -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    }
  }
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12;
  id v13;
  WiFiUsageNetworkDetails *lastNetworkDetails;
  BOOL v15;
  int v16;
  _BOOL4 v17;
  BOOL v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  WiFiUsageNetworkDetails *v22;
  WiFiUsageNetworkDetails *v23;
  objc_super v24;

  v12 = a3;
  v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:](&v24, sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_, v12, a4, a5, a6, v13);
  lastNetworkDetails = self->_lastNetworkDetails;
  if (v12)
    v15 = lastNetworkDetails == 0;
  else
    v15 = 0;
  v16 = v15;
  if (v15)
  {
    v17 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    lastNetworkDetails = self->_lastNetworkDetails;
    if (!lastNetworkDetails)
    {
      if (!v17)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_20:
    -[WiFiUsageNetworkDetails networkName](lastNetworkDetails, "networkName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v12);

    v21 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    if (v20)
    {
      if (((v16 | !v21) & 1) == 0)
        goto LABEL_26;
LABEL_25:
      NSLog(CFSTR("%s: network session started"), "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
      -[WiFiUsageNetworkSession sessionDidStart](self, "sessionDidStart");
      goto LABEL_26;
    }
    if (!v21 && !v17)
      goto LABEL_25;
LABEL_24:
    NSLog(CFSTR("%s: network session ended"), "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    goto LABEL_25;
  }
  if (v12 || !lastNetworkDetails)
  {
    if (!v12 || !lastNetworkDetails)
      goto LABEL_26;
    v17 = 0;
    goto LABEL_20;
  }
  v18 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
  if (!a6 && v18)
  {
    NSLog(CFSTR("%s: network session ended"), "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
  }
LABEL_26:
  if (v13)
  {
    v22 = (WiFiUsageNetworkDetails *)objc_msgSend(v13, "copy");
    v23 = self->_lastNetworkDetails;
    self->_lastNetworkDetails = v22;

  }
}

- (void)processForgetNetwork:(id)a3
{
  id v4;
  void *v5;
  NSObject *WiFiLinkStateBiomeEventQueue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      objc_msgSend(v4, "networkName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        WiFiLinkStateBiomeEventQueue = self->_WiFiLinkStateBiomeEventQueue;
        if (WiFiLinkStateBiomeEventQueue)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke;
          block[3] = &unk_1E881C8E8;
          v8 = v4;
          dispatch_async(WiFiLinkStateBiomeEventQueue, block);

        }
        else
        {
          NSLog(CFSTR("%s: _WiFiLinkStateBiomeEventQueue NUll!"), "-[WiFiUsageNetworkSession processForgetNetwork:]");
        }
      }
      else
      {
        NSLog(CFSTR("%s: networkName NUll!"), "-[WiFiUsageNetworkSession processForgetNetwork:]");
      }
    }
    else
    {
      NSLog(CFSTR("%s: WiFiUsageNetworkDetails NUll!"), "-[WiFiUsageNetworkSession processForgetNetwork:]");
    }
  }
  else
  {
    NSLog(CFSTR("%s: Do Nothing as WiFiDirectDonation Feature Flag Disabled!"), "-[WiFiUsageNetworkSession processForgetNetwork:]");
  }

}

void __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  __softlink__BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Wireless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "WiFi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "pruner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_18;
      v8[3] = &unk_1E881D930;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v6, "deleteEventsPassingTest:", v8);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "networkName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
      v12 = 2160;
      v13 = 1752392040;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: BMPruner NUll - SSID:%{mask.hash}@ ", buf, 0x20u);

    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "networkName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
    v12 = 2160;
    v13 = 1752392040;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: BMStream NUll - SSID:%{mask.hash}@ ", buf, 0x20u);
LABEL_8:

  }
}

uint64_t __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  _BOOL8 v8;
  id v10;
  void *v11;
  _BOOL4 linkUp;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  int v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  WiFiUsageNetworkDetails *v26;
  WiFiUsageNetworkDetails *lastNetworkDetails;
  NSObject *WiFiLinkStateBiomeEventQueue;
  int64_t v29;
  _BOOL8 v30;
  NSObject *v31;
  const char *v32;
  WiFiUsageNetworkDetails *v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  void *v38;
  objc_super v39;
  _QWORD block[4];
  id v41;
  BOOL v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v36 = a4;
  v8 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  linkUp = self->_linkUp;
  v13 = !self->_linkUp && v8;
  v14 = !v8;
  if (!self->_linkUp)
    v14 = 0;
  v38 = v11;
  v35 = v14;
  if (v13)
  {
    objc_storeStrong((id *)&self->_lastLinkUpTime, v11);
    self->_linkUp = 1;
    objc_msgSend(v10, "networkName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails networkName](self->_lastNetworkDetails, "networkName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastLinkUpTime, "timeIntervalSinceDate:", self->_lastLinkDownTime);
      v18 = v17;

      if (v18 < (double)0x14uLL)
      {
        v19 = 0;
        v20 = !-[WiFiUsageSession isSessionActive](self, "isSessionActive");
        goto LABEL_17;
      }
    }
    else
    {

    }
    -[WiFiUsageNetworkDetails networkName](self->_lastNetworkDetails, "networkName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    v19 = v23 != 0;
    objc_msgSend(v10, "networkName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      v26 = (WiFiUsageNetworkDetails *)objc_msgSend(v10, "copy");
      lastNetworkDetails = self->_lastNetworkDetails;
      self->_lastNetworkDetails = v26;

    }
  }
  else if (v14)
  {
    objc_storeStrong((id *)&self->_lastLinkDownTime, v11);
    -[NSDate timeIntervalSinceDate:](self->_lastLinkDownTime, "timeIntervalSinceDate:", self->_lastLinkUpTime);
    v19 = 0;
    self->_networkUsageDuration = v21 + self->_networkUsageDuration;
    self->_linkUp = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = 1;
LABEL_17:
  if (!_os_feature_enabled_impl())
  {
    v29 = a5;
    v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    v45 = 2113;
    v46 = v10;
    v47 = 1024;
    v48 = v13;
    v49 = 1024;
    v50 = v35;
    v31 = MEMORY[0x1E0C81028];
    v32 = "%s: Do Nothing as WiFiDirectDonation Feature Flag Disabled! details:%{private}@ linkWentUp:%d linkWentDown:%d ";
    goto LABEL_27;
  }
  if (!v10 || linkUp == v8)
  {
    v29 = a5;
    v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    v45 = 2113;
    v46 = v10;
    v47 = 1024;
    v48 = v13;
    v49 = 1024;
    v50 = v35;
    v31 = MEMORY[0x1E0C81028];
    v32 = "%s: InValid inputs details:%{private}@ linkWentUp:%d linkWentDown:%d";
LABEL_27:
    _os_log_impl(&dword_1CC44E000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x22u);
LABEL_28:
    if (!v19)
      goto LABEL_35;
    goto LABEL_29;
  }
  WiFiLinkStateBiomeEventQueue = self->_WiFiLinkStateBiomeEventQueue;
  v29 = a5;
  v30 = v36;
  if (!WiFiLinkStateBiomeEventQueue)
  {
    NSLog(CFSTR("%s: _WiFiLinkStateBiomeEventQueue NUll!"), "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    if (!v19)
      goto LABEL_35;
LABEL_29:
    if (-[WiFiUsageSession isAssociated](self, "isAssociated"))
    {
      v33 = self->_lastNetworkDetails;
      if (v33)
      {
        v34 = (void *)-[WiFiUsageNetworkDetails copy](v33, "copy");
        -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", v34);

      }
    }
    v39.receiver = self;
    v39.super_class = (Class)WiFiUsageNetworkSession;
    -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:](&v39, sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_, v8, v30, v29, a6, v10);
    NSLog(CFSTR("%s: network session ended"), "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    if (v20)
      goto LABEL_36;
    goto LABEL_37;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke;
  block[3] = &unk_1E881C960;
  v41 = v10;
  v42 = v13;
  dispatch_async(WiFiLinkStateBiomeEventQueue, block);

  if (v19)
    goto LABEL_29;
LABEL_35:
  v39.receiver = self;
  v39.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:](&v39, sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_, v8, v30, v29, a6, v10);
  if (v20)
  {
LABEL_36:
    NSLog(CFSTR("%s: network session started"), "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidStart](self, "sessionDidStart");
  }
LABEL_37:

}

void __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getBMDeviceWiFiClass_softClass;
  v23 = getBMDeviceWiFiClass_softClass;
  if (!getBMDeviceWiFiClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getBMDeviceWiFiClass_block_invoke;
    v25 = &unk_1E881D958;
    v26 = &v20;
    __getBMDeviceWiFiClass_block_invoke((uint64_t)buf);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  v4 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "networkName", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSSID:starting:", v5, v6);

  if (v7)
  {
    __softlink__BiomeLibrary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "Device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "Wireless");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "WiFi");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "sendEvent:", v7);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "networkName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSub"
                               "reason:withNetworkDetails:]_block_invoke";
          *(_WORD *)&buf[12] = 2160;
          *(_QWORD *)&buf[14] = 1752392040;
          *(_WORD *)&buf[22] = 2112;
          v25 = v18;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = v19;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: BMSource NUll - SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);

        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "networkName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreas"
                           "on:withNetworkDetails:]_block_invoke";
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v25 = v16;
      LOWORD(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 2) = v17;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: BMStream NUll - SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "networkName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason"
                         ":withNetworkDetails:]_block_invoke";
    *(_WORD *)&buf[12] = 2160;
    *(_QWORD *)&buf[14] = 1752392040;
    *(_WORD *)&buf[22] = 2112;
    v25 = v14;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = v15;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: BMDeviceWiFi Allocation failed SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);

  }
}

- (void)sessionDidStart
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession sessionDidStart](&v3, sel_sessionDidStart);
  self->_networkUsageDuration = 0.0;
  -[NSMutableSet removeAllObjects](self->_neighborBssList, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_otherBssList, "removeAllObjects");
}

- (void)sessionDidEnd
{
  WiFiUsageConnectionQualityRecord *v3;
  WiFiUsageConnectionQualityRecord *v4;
  objc_super v5;

  if (self->_networkUsageDuration != 0.0)
  {
    -[WiFiUsageSession setSessionDuration:](self, "setSessionDuration:");
    -[WiFiUsageSession setSessionStartTime:](self, "setSessionStartTime:", 0);
  }
  -[WiFiUsageSession setNeighborBssCount:](self, "setNeighborBssCount:", -[NSMutableSet count](self->_neighborBssList, "count"));
  -[WiFiUsageSession setOtherBssCount:](self, "setOtherBssCount:", -[NSMutableSet count](self->_otherBssList, "count"));
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession sessionDidEnd](&v5, sel_sessionDidEnd);
  if (-[WiFiUsageNetworkSession isSessionHarvestable](self, "isSessionHarvestable"))
  {
    v3 = -[WiFiUsageConnectionQualityRecord initWithUsageSession:andNeighborBssList:andOtherBssList:]([WiFiUsageConnectionQualityRecord alloc], "initWithUsageSession:andNeighborBssList:andOtherBssList:", self, self->_neighborBssList, self->_otherBssList);
    v4 = v3;
    if (v3)
      -[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi](v3, "queryNetworkPerformanceFeedAndSubmitToGeoWiFi");

  }
}

- (BOOL)isSessionHarvestable
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  BOOL v9;

  -[WiFiUsageSession networkDetails](self, "networkDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiUsageSession privacyRestrictionDisabled](self, "privacyRestrictionDisabled"))
    goto LABEL_16;
  if (!self->_dnuEnabled || v3 == 0)
    goto LABEL_25;
  if (objc_msgSend(v3, "isHidden"))
  {
    NSLog(CFSTR("%s: hidden network. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "isHome"))
  {
    NSLog(CFSTR("%s: home network. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "hasNoMap"))
  {
    NSLog(CFSTR("%s: private network. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "isPersonalHotspot"))
  {
    NSLog(CFSTR("%s: personal hotspot. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  objc_msgSend(v3, "connectedBss");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "networkAccessCode") != 2)
  {
    objc_msgSend(v3, "connectedBss");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "networkAccessCode");

    if (v7 == 3)
      goto LABEL_16;
    if (objc_msgSend(v3, "usageRank") <= 3)
    {
      NSLog(CFSTR("%s: top network. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
    }
    else
    {
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      if (v8 <= 60.0)
      {
        NSLog(CFSTR("%s: short data session. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }
      else
      {
        if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 0))
        {
          goto LABEL_16;
        }
        NSLog(CFSTR("%s: loss coin toss. Not harvesting."), "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }
    }
LABEL_25:
    v9 = 0;
    goto LABEL_17;
  }

LABEL_16:
  v9 = 1;
LABEL_17:

  return v9;
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.linksession");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_WiFiLinkStateBiomeEventQueue, 0);
  objc_storeStrong((id *)&self->_otherBssList, 0);
  objc_storeStrong((id *)&self->_neighborBssList, 0);
  objc_storeStrong((id *)&self->_lastLinkDownTime, 0);
  objc_storeStrong((id *)&self->_lastLinkUpTime, 0);
  objc_storeStrong((id *)&self->_lastNetworkDetails, 0);
}

@end
