@implementation WCM_BSPMonitorIOS

- (WCM_BSPMonitorIOS)init
{
  WCM_BSPMonitorIOS *v2;
  WCM_BSPMonitorIOS *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCM_BSPMonitorIOS;
  v2 = -[WCM_BSPMonitor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[WCM_BSPMonitorIOS initWiFiStatus](v2, "initWiFiStatus");
    -[WCM_BSPMonitorIOS initBTStatus](v3, "initBTStatus");
    v3->mBSPState = 0;
    v3->mLastGetBandSwitchStatusTs = 0.0;
    v3->mLastGetChannelQualityInfoTs = 0.0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10004B5F4, kRegulatoryDomainUpdateNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[WCM_BSPMonitorIOS readRDCountryCode](v3, "readRDCountryCode");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BSPMonitor Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BSPMonitor Dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)WCM_BSPMonitorIOS;
  -[WCM_BSPMonitorIOS dealloc](&v3, "dealloc");
}

- (void)initWiFiStatus
{
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_Low.timestamp = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_High.quality = 0u;
  *(_OWORD *)&self->mWiFiStatus.powerState = 0u;
  *(_OWORD *)&self->mWiFiStatus.allowedBands = 0u;
  *(_OWORD *)&self->mWiFiStatus.frequencyBandForBTInfo.timestamp = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_2_4G.quality = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_Low.band = 0u;
  *(_QWORD *)&self->mWiFiStatus.coexMode = 0;
  self->mWiFiStatus.allowedBands = 19;
  self->mWiFiStatus.chqInfo_2_4G.quality = -1;
  self->mWiFiStatus.chqInfo_5G_Low.quality = -1;
  self->mWiFiStatus.chqInfo_5G_High.quality = -1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s"), "-[WCM_BSPMonitorIOS initWiFiStatus]");
}

- (void)initBTStatus
{
  WCMBSP_BTStatus *p_mBTStatus;
  NSString *countryCode;

  p_mBTStatus = &self->mBTStatus;
  countryCode = self->mBTStatus.countryCode;
  if (countryCode)

  *(_OWORD *)&p_mBTStatus->powerState = 0u;
  *(_OWORD *)&p_mBTStatus->countryCode = 0u;
  self->mBTConfig.targetBand = 0;
  p_mBTStatus->allowedBands = 1;
  p_mBTStatus->frequencyBand = -1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s"), "-[WCM_BSPMonitorIOS initBTStatus]");
}

- (void)printStatus:(const char *)a3 withLogLevel:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", a4, CFSTR("BSP(%s): mBSPState=%d, mCountryCode=%@, mCountryCodeTimeStampUnixSec=%lld, WiFi(pwrState=0x%x, state=%d, channel=%d, bandForBT=0x%x, allowedBands=0x%x), BT(debugMode=%d, pwrState=0x%x, curBand=0x%x, ullaMode=%d, countryCode=%@, allowedBands=0x%x, targetBand=0x%x)"), a3, self->mBSPState, self->mCountryCode, self->mCountryCodeTimeStampUnixSec, self->mWiFiStatus.powerState, self->mWiFiStatus.wifiState, self->mWiFiStatus.wifiChannel, self->mWiFiStatus.frequencyBandForBTInfo.band, self->mWiFiStatus.allowedBands, self->mBTStatus.debugMode, self->mBTStatus.powerState, self->mBTStatus.frequencyBand, self->mBTStatus.ullaMode, self->mBTStatus.countryCode, self->mBTStatus.allowedBands,
    self->mBTConfig.targetBand);
}

- (void)printStatus:(const char *)a3
{
  -[WCM_BSPMonitorIOS printStatus:withLogLevel:](self, "printStatus:withLogLevel:", a3, 2);
}

- (int)selectBand_preferred:(int)a3 prohibited:(int)a4
{
  char v7;
  char v8;

  if (!self->mWiFiStatus.powerState
    && (self->mBTStatus.allowedBands & 0x40) == 0
    && ((self->mBTStatus.allowedBands & 0x12) == 2 || (self->mBTStatus.allowedBands & 0x12) == 16))
  {
    return 1;
  }
  if (a3)
    v7 = a3;
  else
    v7 = -1;
  v8 = self->mBTStatus.allowedBands & v7;
  if ((a4 & 0x40) == 0 && (v8 & 0x40) != 0)
    return 64;
  if ((a4 & 0x10) == 0 && (v8 & 0x10) != 0)
    return 16;
  if ((((a4 & 2) == 0) & ((v8 & 2) >> 1)) != 0)
    return 2;
  return 1;
}

- (int)selectBandWithPreferredBands:(int)a3
{
  return -[WCM_BSPMonitorIOS selectBand_preferred:prohibited:](self, "selectBand_preferred:prohibited:", *(_QWORD *)&a3, 0);
}

- (void)readRDCountryCode
{
  _UNKNOWN **v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  int64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  id v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  NSString *mCountryCode;
  NSString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  WCM_BSPMonitorIOS *v33;
  WCM_BSPMonitorIOS *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = &ADClientAddValueForScalarKey_ptr;
  v4 = +[RDEstimate currentEstimates](RDEstimate, "currentEstimates");
  if (v4
    && (v5 = v4, objc_msgSend(v4, "count"))
    && (v41 = 0u,
        v42 = 0u,
        v39 = 0u,
        v40 = 0u,
        (v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16)) != 0))
  {
    v7 = v6;
    v33 = self;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "countryCode");
        if (v13)
        {
          v14 = v13;
          if (objc_msgSend(v13, "length"))
          {
            if (v8)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: currentCountryCode count = %d, ignore %@"), "-[WCM_BSPMonitorIOS readRDCountryCode]", objc_msgSend(v5, "count"), objc_msgSend(v12, "countryCode"), v32);
            }
            else
            {
              v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s%@"), "CC", ":", v14);
              objc_msgSend(objc_msgSend(v12, "timestamp"), "timeIntervalSince1970");
              v9 = (uint64_t)v15;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: currentCountryCode = %@, timestamp = %@, timeStampUnixTimeSec = %lld"), "-[WCM_BSPMonitorIOS readRDCountryCode]", objc_msgSend(v12, "countryCode"), objc_msgSend(v12, "timestamp"), (uint64_t)v15);
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
    self = v33;
    v3 = &ADClientAddValueForScalarKey_ptr;
    if (v8)
      goto LABEL_37;
  }
  else
  {
    v9 = 0;
  }
  v16 = objc_msgSend(v3[140], "lastKnownEstimates");
  if (!v16)
    goto LABEL_33;
  v17 = v16;
  if (!objc_msgSend(v16, "count"))
    goto LABEL_33;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (!v18)
    goto LABEL_33;
  v19 = v18;
  v34 = self;
  v8 = 0;
  v20 = *(_QWORD *)v36;
  do
  {
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
      v23 = objc_msgSend(v22, "countryCode");
      if (v23)
      {
        v24 = v23;
        if (objc_msgSend(v23, "length"))
        {
          if (v8)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: lastKnownCountryCode count = %d, ignore %@"), "-[WCM_BSPMonitorIOS readRDCountryCode]", objc_msgSend(v17, "count"), objc_msgSend(v22, "countryCode"), v32);
          }
          else
          {
            v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s%@"), "LKC", ":", v24);
            objc_msgSend(objc_msgSend(v22, "timestamp"), "timeIntervalSince1970");
            v9 = (uint64_t)v25;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: lastKnownCountryCode = %@, timestamp = %@, timeStampUnixTimeSec = %lld"), "-[WCM_BSPMonitorIOS readRDCountryCode]", objc_msgSend(v22, "countryCode"), objc_msgSend(v22, "timestamp"), (uint64_t)v25);
          }
        }
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  }
  while (v19);
  self = v34;
  if (!v8)
  {
LABEL_33:
    v26 = (void *)MGCopyAnswer(CFSTR("RegionCode"), 0);
    if (!v26)
      goto LABEL_51;
    v27 = v26;
    if (!objc_msgSend(v26, "length"))
      goto LABEL_51;
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s%@"), "RC", ":", v27);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: regionCode = %@"), "-[WCM_BSPMonitorIOS readRDCountryCode]", v27);
    if (!v8)
      goto LABEL_51;
    v9 = 0;
  }
LABEL_37:
  if (!-[NSString length](v8, "length")
    || !-[NSString hasPrefix:](v8, "hasPrefix:", CFSTR("CC:"))
    && !-[NSString hasPrefix:](v8, "hasPrefix:", CFSTR("RC:"))
    && !-[NSString hasPrefix:](v8, "hasPrefix:", CFSTR("LKC:")))
  {
LABEL_51:
    self->mCountryCode = 0;
    self->mCountryCodeTimeStampUnixSec = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s: invalid countryCode"), "-[WCM_BSPMonitorIOS readRDCountryCode]", v30, v31);
    return;
  }
  mCountryCode = self->mCountryCode;
  if (!mCountryCode)
  {
LABEL_50:
    self->mCountryCode = v8;
    self->mCountryCodeTimeStampUnixSec = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s final read RD country code: %@, mCountryCodeTimeStampUnixSec: %lld"), "-[WCM_BSPMonitorIOS readRDCountryCode]", self->mCountryCode, v9);
    return;
  }
  if (!-[NSString length](mCountryCode, "length")
    || !-[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("CC:"))
    && !-[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("RC:"))
    && !-[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("LKC:"))
    || !-[NSString isEqualToString:](self->mCountryCode, "isEqualToString:", v8)
    || self->mCountryCodeTimeStampUnixSec != v9)
  {
    v29 = self->mCountryCode;
    if (v29)

    goto LABEL_50;
  }
}

- (void)sendSetFrequencyBandToBT:(int)a3 forced:(BOOL)a4
{
  id v5;
  int frequencyBand;
  BOOL v7;

  if (a3 == 1 || self->mBTStatus.powerState)
  {
    self->mBTConfig.targetBand = a3;
    if (a4
      || (frequencyBand = self->mBTStatus.frequencyBand, frequencyBand != a3)
      && (frequencyBand != -1 ? (v7 = self->mBSPState == 4) : (v7 = 1), !v7 && self->mBTStatus.countryCode))
    {
      v5 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
      if (v5)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCMBSP:%s sending new targetBand=0x%x to BT."), "-[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:forced:]", self->mBTConfig.targetBand);
        objc_msgSend(v5, "bspSetFrequencyBandToUse:allowedBands:");
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:forced:]");
      }
    }
  }
}

- (void)sendSetFrequencyBandToBT:(int)a3
{
  -[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:forced:](self, "sendSetFrequencyBandToBT:forced:", *(_QWORD *)&a3, 0);
}

- (void)sendWiFiStatusToBT
{
  id v3;

  if (self->mBTStatus.powerState)
  {
    v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
    if (v3)
      objc_msgSend(v3, "bspUpdateWiFiStatus:", self->mWiFiStatus.powerState);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendWiFiStatusToBT]");
  }
}

- (void)sendChannelQualityToBT:(int)a3 quality:(unint64_t)a4
{
  uint64_t v5;
  id v6;

  if (self->mBTStatus.powerState)
  {
    v5 = *(_QWORD *)&a3;
    v6 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
    if (v6)
      objc_msgSend(v6, "bspNotifyChannelQuality:quality:", v5, a4);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendChannelQualityToBT:quality:]");
  }
}

- (void)sendBTStatusRequestToBT
{
  id v2;

  v2 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
  if (v2)
    objc_msgSend(v2, "bspStatusRequest");
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendBTStatusRequestToBT]");
}

- (void)sendBandSwitchRejectToBT:(int)a3 targetBand:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
  if (v6)
    objc_msgSend(v6, "bspBandSwitchReject:targetBand:", v5, v4);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendBandSwitchRejectToBT:targetBand:]");
}

- (void)sendRegulatoryInfoRequestToBT
{
  id v3;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "btController");
  if (v3)
    objc_msgSend(v3, "bspRegulatoryInfoRequest:timeStamp:", self->mCountryCode, self->mCountryCodeTimeStampUnixSec);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s btController not available"), "-[WCM_BSPMonitorIOS sendRegulatoryInfoRequestToBT]");
}

- (void)checkBTRegulatoryInfo
{
  NSString *mCountryCode;
  NSString *countryCode;

  mCountryCode = self->mCountryCode;
  if (mCountryCode
    && -[NSString length](mCountryCode, "length")
    && (-[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("CC:"))
     || -[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("RC:"))
     || -[NSString hasPrefix:](self->mCountryCode, "hasPrefix:", CFSTR("LKC:")))
    && ((countryCode = self->mBTStatus.countryCode) == 0
     || !-[NSString length](countryCode, "length")
     || !-[NSString hasPrefix:](self->mBTStatus.countryCode, "hasPrefix:", CFSTR("CC:"))
     && !-[NSString hasPrefix:](self->mBTStatus.countryCode, "hasPrefix:", CFSTR("RC:"))
     && !-[NSString hasPrefix:](self->mBTStatus.countryCode, "hasPrefix:", CFSTR("LKC:"))
     || !-[NSString isEqualToString:](self->mCountryCode, "isEqualToString:", self->mBTStatus.countryCode)))
  {
    -[WCM_BSPMonitorIOS sendRegulatoryInfoRequestToBT](self, "sendRegulatoryInfoRequestToBT");
  }
}

- (void)sendGetRegulatoryInfoToWiFi
{
  id v2;

  if (self->mWiFiStatus.powerState)
  {
    v2 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v2)
      objc_msgSend(v2, "bspRegulatoryInfoRequest");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendGetRegulatoryInfoToWiFi]");
  }
}

- (void)sendGetNanPhsStateToWiFi
{
  id v2;

  if (self->mWiFiStatus.powerState)
  {
    v2 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v2)
      objc_msgSend(v2, "bspNanPhsStateRequest");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendGetNanPhsStateToWiFi]");
  }
}

- (void)sendGetBandSwitchStatusToWiFi
{
  id v2;

  if (self->mWiFiStatus.powerState)
  {
    v2 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v2)
      objc_msgSend(v2, "bspGetBandSwitchStatus");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendGetBandSwitchStatusToWiFi]");
  }
}

- (void)sendGetChannelQualityInfoToWiFi
{
  id v2;

  if (self->mWiFiStatus.powerState)
  {
    v2 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v2)
      objc_msgSend(v2, "bspGetChannelQualityInfo");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendGetChannelQualityInfoToWiFi]");
  }
}

- (void)sendBTStatusToWiFi
{
  id v3;

  if (self->mWiFiStatus.powerState)
  {
    v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v3)
      objc_msgSend(v3, "bspUpdateBTStatus_powerState:frequencyBand:ullaMode:", self->mBTStatus.powerState, self->mBTStatus.frequencyBand, self->mBTStatus.ullaMode);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendBTStatusToWiFi]");
  }
}

- (void)sendBandSwitchRequestToWiFi:(int)a3 targetBand:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (self->mWiFiStatus.powerState)
  {
    v4 = *(_QWORD *)&a4;
    v5 = *(_QWORD *)&a3;
    v6 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v6)
      objc_msgSend(v6, "bspBandSwitchRequest:targetBand:", v5, v4);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendBandSwitchRequestToWiFi:targetBand:]");
  }
}

- (void)sendSetCoexModeToWiFi:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;

  if (self->mWiFiStatus.powerState)
  {
    v8 = *(_QWORD *)&a8;
    v9 = a7;
    v10 = *(_QWORD *)&a6;
    v11 = *(_QWORD *)&a5;
    v12 = *(_QWORD *)&a4;
    v13 = a3;
    v14 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
    if (v14)
      objc_msgSend(v14, "bspSetCoexMode:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:", v13, v12, v11, v10, v9, v8);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMBSP:%s wifiController not available"), "-[WCM_BSPMonitorIOS sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:]");
  }
}

- (void)updateFrequencyBandForBT
{
  int mBSPState;
  uint64_t v4;
  int allowedBands;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int wifiChannel;

  mBSPState = self->mBSPState;
  if (!mBSPState)
    goto LABEL_4;
  if (mBSPState != 4)
  {
    if (mBSPState == 2)
    {
LABEL_4:
      v4 = -[WCM_BSPMonitorIOS selectBandWithPreferredBands:](self, "selectBandWithPreferredBands:", 0);
LABEL_21:
      -[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:](self, "sendSetFrequencyBandToBT:", v4);
      return;
    }
    allowedBands = self->mBTStatus.allowedBands;
    if ((allowedBands & 0x40) != 0)
    {
      v7 = 64;
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    v6 = self->mWiFiStatus.allowedBands & 0x12;
    switch(v6)
    {
      case 18:
        if ((~allowedBands & 0x12) != 0)
        {
          v7 = 0;
          v8 = 18;
          goto LABEL_20;
        }
        if (self->mWiFiStatus.wifiState != 3)
          goto LABEL_18;
        wifiChannel = self->mWiFiStatus.wifiChannel;
        if (wifiChannel - 32 <= 0x24)
          goto LABEL_10;
        if (wifiChannel == 163 || wifiChannel - 166 < 0xFFFFFFBA)
          goto LABEL_18;
        break;
      case 16:
        break;
      case 2:
LABEL_10:
        v7 = 16;
        v8 = 2;
LABEL_20:
        v4 = -[WCM_BSPMonitorIOS selectBand_preferred:prohibited:](self, "selectBand_preferred:prohibited:", v7, v8);
        goto LABEL_21;
      default:
LABEL_18:
        v7 = 0;
        goto LABEL_19;
    }
    v7 = 2;
    v8 = 16;
    goto LABEL_20;
  }
}

- (void)didEnterBSPActiveState
{
  -[WCM_BSPMonitorIOS sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:](self, "sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:", 1, self->mWiFiStatus.allowedBands, self->mBTStatus.frequencyBand, 19, 0, -[WCM_BSPMonitor getTimeToTSTForULLAMode:](self, "getTimeToTSTForULLAMode:", self->mBTStatus.ullaMode));
}

- (void)ULLAModeTransition
{
  -[WCM_BSPMonitorIOS sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:](self, "sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:", 1, self->mWiFiStatus.allowedBands, self->mBTConfig.targetBand, 19, 1, -[WCM_BSPMonitor getTimeToTSTForULLAMode:](self, "getTimeToTSTForULLAMode:", self->mBTStatus.ullaMode));
}

- (void)willLeaveBSPActiveState
{
  -[WCM_BSPMonitorIOS sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:](self, "sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:", 0, 0, 0, 0, 0, -[WCM_BSPMonitor getTimeToTSTForULLAMode:](self, "getTimeToTSTForULLAMode:", 0));
}

- (void)updateBSPState
{
  int mBSPState;
  WCMBSP_BTStatus *p_mBTStatus;
  int v5;

  mBSPState = self->mBSPState;
  p_mBTStatus = &self->mBTStatus;
  if (self->mWiFiStatus.powerState)
  {
    if (self->mBTStatus.powerState)
    {
      if ((~self->mWiFiStatus.allowedBands & 0x12) == 0
        && (self->mBTStatus.allowedBands & 0x52) == 0x12
        && self->mBTStatus.ullaMode)
      {
        self->mBSPState = 4;
        if (mBSPState == 4)
        {
          if (self->mBTStatus.ullaModeTransitioned)
          {
            -[WCM_BSPMonitorIOS ULLAModeTransition](self, "ULLAModeTransition");
            p_mBTStatus->ullaModeTransitioned = 0;
          }
        }
        else
        {
          -[WCM_BSPMonitorIOS didEnterBSPActiveState](self, "didEnterBSPActiveState");
        }
        return;
      }
      v5 = 3;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 2 * self->mBTStatus.powerState;
  }
  self->mBSPState = v5;
  if (mBSPState == 4)
  {
    -[WCM_BSPMonitorIOS willLeaveBSPActiveState](self, "willLeaveBSPActiveState");
    if (p_mBTStatus->powerState)
      -[WCM_BSPMonitorIOS requestBTStatus](self, "requestBTStatus");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCMBSP:%s Not sending requestBTStatus due to Durant powered off."), "-[WCM_BSPMonitorIOS updateBSPState]");
  }
}

- (void)handleWiFiStatusUpdateEvent:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004CA74;
  v3[3] = &unk_100201E38;
  v4 = a3;
  v3[4] = self;
  sub_10004CA08((uint64_t)v3);
}

- (void)handleWiFiFrequencyBandForBTEvent:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004CC30;
  v3[3] = &unk_1002026C0;
  v4 = a3;
  v3[4] = self;
  sub_10004CA08((uint64_t)v3);
}

- (void)handleWiFiChannelQualityEvent:(int)a3 quality:(unint64_t)a4
{
  _QWORD v4[6];
  int v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CD9C;
  v4[3] = &unk_100201F00;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  sub_10004CA08((uint64_t)v4);
}

- (void)handleWiFiRegulatoryInfoEvent:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004CFB4;
  v3[3] = &unk_100201BB8;
  v3[4] = self;
  v3[5] = a3;
  sub_10004CA08((uint64_t)v3);
}

- (void)handleWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4 isNanPhs:(BOOL)a5
{
  _QWORD v5[5];
  int v6;
  unsigned int v7;
  BOOL v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004D0EC;
  v5[3] = &unk_100201D70;
  v6 = a3;
  v7 = a4;
  v8 = a5;
  v5[4] = self;
  sub_10004CA08((uint64_t)v5);
}

- (void)handleWiFiCountryCodeChangedEvent
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004D29C;
  v2[3] = &unk_1002019E8;
  v2[4] = self;
  sub_10004CA08((uint64_t)v2);
}

- (void)handleBandSwitchStatusUpdatedEvent
{
  double mLastGetBandSwitchStatusTs;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  mLastGetBandSwitchStatusTs = self->mLastGetBandSwitchStatusTs;
  v4 = mLastGetBandSwitchStatusTs + 1.0;
  v6 = (mLastGetBandSwitchStatusTs - v5 + 1.0) * 1000.0;
  if (v5 >= v4)
    v7 = 0;
  else
    v7 = (unint64_t)v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D460;
  v8[3] = &unk_1002019E8;
  v8[4] = self;
  sub_10004D384(v7, (uint64_t)v8);
}

- (void)handleChannelQualityInfoUpdatedEvent
{
  double mLastGetChannelQualityInfoTs;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  mLastGetChannelQualityInfoTs = self->mLastGetChannelQualityInfoTs;
  v4 = mLastGetChannelQualityInfoTs + 1.0;
  v6 = (mLastGetChannelQualityInfoTs - v5 + 1.0) * 1000.0;
  if (v5 >= v4)
    v7 = 0;
  else
    v7 = (unint64_t)v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D568;
  v8[3] = &unk_1002019E8;
  v8[4] = self;
  sub_10004D384(v7, (uint64_t)v8);
}

- (void)handleBandSwitchStatusEvent:(BOOL)a3 btSubband:(int)a4 successCount:(unint64_t)a5 failCount:(unint64_t)a6
{
  _QWORD v6[7];
  int v7;
  BOOL v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D630;
  v6[3] = &unk_1002026E8;
  v8 = a3;
  v7 = a4;
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = self;
  sub_10004CA08((uint64_t)v6);
}

- (void)updateChannelQualityInfo:(WCMBSP_ChannelQualityInfo *)a3 bandCode:(int)a4 chqInfoDict:(__CFDictionary *)a5 ts:(double)a6
{
  uint64_t v8;
  CFStringRef v10;
  CFStringRef v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  BOOL v16;
  const __CFNumber *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t valuePtr;

  v8 = *(_QWORD *)&a4;
  v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%lu"), a4);
  if (v10)
  {
    v11 = v10;
    Value = (const __CFDictionary *)CFDictionaryGetValue(a5, v10);
    if (Value)
    {
      v13 = Value;
      v20 = 0;
      valuePtr = 0;
      v14 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("BSP_ChqAgeMs"));
      v15 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("BSP_ChqHealth"));
      if (v14)
        v16 = v15 == 0;
      else
        v16 = 1;
      if (!v16)
      {
        v17 = v15;
        CFNumberGetValue(v14, kCFNumberLongLongType, &valuePtr);
        CFNumberGetValue(v17, kCFNumberLongLongType, &v20);
        v18 = v20;
        v19 = valuePtr;
        a3->quality = v20;
        a3->timestamp = a6 + (double)v19 / -1000.0;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCMBSP:%s bandCode:%d, quality:0x%llx age:%llums"), "-[WCM_BSPMonitorIOS updateChannelQualityInfo:bandCode:chqInfoDict:ts:]", v8, v18, v19);
      }
    }
    CFRelease(v11);
  }
}

- (void)handleChannelQualityInfoEvent:(__CFDictionary *)a3
{
  CFDictionaryRef Copy;
  _QWORD v5[6];

  Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, a3);
  if (Copy)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10004D850;
    v5[3] = &unk_100201BB8;
    v5[4] = self;
    v5[5] = Copy;
    sub_10004CA08((uint64_t)v5);
  }
}

- (void)handleCoexModeFailEvent:(int)a3 btSubband:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D928;
  v4[3] = &unk_100201BB8;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  sub_10004CA08((uint64_t)v4);
}

- (void)handleBandSwitchRejectEvent:(int)a3 btTargetBand:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004DAC8;
  v4[3] = &unk_100201BB8;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  sub_10004CA08((uint64_t)v4);
}

- (void)requestBTStatus
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004DB70;
  v2[3] = &unk_1002019E8;
  v2[4] = self;
  sub_10004CA08((uint64_t)v2);
}

- (void)handleShowUCMStatusEvent
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004DC0C;
  v2[3] = &unk_1002019E8;
  v2[4] = self;
  sub_10004CA08((uint64_t)v2);
}

- (void)handleBTStatusUpdateEvent:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  BOOL v5;
  _QWORD v6[5];
  int v7;
  int v8;
  BOOL v9;

  if ((a5 & 0x100) != 0)
  {
    v5 = 1;
LABEL_7:
    a5 &= 0xFFFF00FF;
    self->mBTStatus.debugMode = v5;
    goto LABEL_8;
  }
  if ((a5 & 0x200) != 0)
  {
    v5 = 0;
    goto LABEL_7;
  }
  if (self->mBTStatus.debugMode)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCMBSP:%s Ignored [powerState=0x%x, band=0x%x, ullaMode=%d]"), "-[WCM_BSPMonitorIOS handleBTStatusUpdateEvent:frequencyBand:ullaMode:]", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    return;
  }
LABEL_8:
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004DDA0;
  v6[3] = &unk_100201D70;
  v6[4] = self;
  v7 = a4;
  v8 = a5;
  v9 = a3;
  sub_10004CA08((uint64_t)v6);
}

- (void)handleBTBandSwitchRequestEvent:(int)a3 targetBand:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E00C;
  v4[3] = &unk_100201BB8;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  sub_10004CA08((uint64_t)v4);
}

- (void)handleBTRegulatoryInfoEvent:(id)a3 allowedBands:(int)a4
{
  _QWORD v4[6];
  int v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E18C;
  v4[3] = &unk_100202090;
  v5 = a4;
  v4[4] = a3;
  v4[5] = self;
  sub_10004CA08((uint64_t)v4);
}

- (void)handleRDCountryCodeChangedEvent
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004E3E8;
  v2[3] = &unk_1002019E8;
  v2[4] = self;
  sub_10004CA08((uint64_t)v2);
}

@end
