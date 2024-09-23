@implementation WCM_CA_BTConnectedDevicesHandler

- (WCM_CA_BTConnectedDevicesHandler)init
{
  WCM_CA_BTConnectedDevicesHandler *v2;
  WCM_CA_BTConnectedDevicesHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_CA_BTConnectedDevicesHandler;
  v2 = -[WCM_CA_BTConnectedDevicesHandler init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->mWiFiState = 0;
    v2->mConnectedDevicesMetricsArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mBTCoexStatsMetrics.isActive = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_CA_BTConnectedDevicesHandler;
  -[WCM_CA_BTConnectedDevicesHandler dealloc](&v3, "dealloc");
}

- (void)resetBTCoexStatsMetrics
{
  self->mBTCoexStatsMetrics.btrssiCoexAccum = 0;
  *(_OWORD *)&self->mBTCoexStatsMetrics.btDurAirMs = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.btrssiValidCnt = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.hybridCnt = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.totDurMs = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.isActive = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.profileIndex = 0u;
  self->mBTCoexStatsMetrics.isActive = 0;
}

- (BOOL)isAnyDeviceConnected
{
  return -[NSMutableArray count](self->mConnectedDevicesMetricsArray, "count") != 0;
}

- (id)getProfileName:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)(a3 + 1) > 0xE)
    v3 = CFSTR("Other");
  else
    v3 = (const __CFString *)*((_QWORD *)&off_100203BD8 + a3 + 1);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_2.4G"), v3);
}

- (void)submitEvent:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  const __CFString *v9;
  _QWORD v10[7];

  v4 = objc_msgSend(a3, "getEnumerationString");
  objc_msgSend(a3, "getDuration");
  v6 = (unint64_t)v5;
  objc_msgSend(a3, "getDurationInWiFi2G");
  if (v6 < 0x1F)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Ignore CA event: BT_ConnectedDevices, (%@) duration is too short, %llu seconds"), v4, v6);
  }
  else
  {
    v8 = 100 * (unint64_t)v7 / v6;
    v9 = &stru_100219FA0;
    if (v6 > 0x77)
      v9 = CFSTR("s");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Submit CA event: BT_ConnectedDevices, (%@) for %llu minute%@, %llu %% in WiFi 2G band"), v4, v6 / 0x3C, v9, 100 * (unint64_t)v7 / v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008CB84;
    v10[3] = &unk_100203B90;
    v10[4] = v4;
    v10[5] = v6 / 0x3C;
    v10[6] = v8;
    AnalyticsSendEventLazy(CFSTR("com.apple.WirelessCoexManager.BT_ConnectedDevices"), v10);
  }
}

- (void)enableCoexStatsMetrics:(int64_t)a3 at:(double)a4
{
  if (!self->mBTCoexStatsMetrics.isActive)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] enableCoexStatsMetrics:%@"), -[WCM_CA_BTConnectedDevicesHandler getProfileName:](self, "getProfileName:"));
    self->mBTCoexStatsMetrics.profileIndex = a3;
    self->mBTCoexStatsMetrics.timestamp = a4;
    self->mBTCoexStatsMetrics.isActive = 1;
  }
}

- (void)disableCoexStatsMetricsAt:(double)a3
{
  id v5;
  unint64_t v6;
  unint64_t totDurMs;
  uint64_t hybridCnt;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t wlrssiValidCnt;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t btrssiValidCnt;
  unint64_t v20;
  int64_t v21;
  _QWORD v22[13];

  if (self->mBTCoexStatsMetrics.isActive)
  {
    v5 = -[WCM_CA_BTConnectedDevicesHandler getProfileName:](self, "getProfileName:", self->mBTCoexStatsMetrics.profileIndex);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] disableCoexStatsMetrics:%@"), v5);
    v6 = (unint64_t)(a3 - self->mBTCoexStatsMetrics.timestamp);
    totDurMs = self->mBTCoexStatsMetrics.totDurMs;
    if (v6 >= 0x1F
      && totDurMs
      && (hybridCnt = self->mBTCoexStatsMetrics.hybridCnt, *(_OWORD *)&self->mBTCoexStatsMetrics.tddCnt != 0))
    {
      v9 = (v6 * (unsigned __int128)0x8888888888888889) >> 64;
      v10 = 100 * hybridCnt;
      v11 = hybridCnt + self->mBTCoexStatsMetrics.tddCnt;
      v12 = 100 * self->mBTCoexStatsMetrics.parallelCnt;
      wlrssiValidCnt = self->mBTCoexStatsMetrics.wlrssiValidCnt;
      if (wlrssiValidCnt)
        v14 = self->mBTCoexStatsMetrics.wlrssiCoexAccum / wlrssiValidCnt;
      else
        v14 = 0;
      v15 = v9 >> 5;
      v16 = 100 * self->mBTCoexStatsMetrics.btDurMs / totDurMs;
      v17 = v10 / v11;
      v18 = v12 / v11;
      btrssiValidCnt = self->mBTCoexStatsMetrics.btrssiValidCnt;
      v20 = 100 * self->mBTCoexStatsMetrics.btDurAirMs / totDurMs;
      if (btrssiValidCnt)
        v21 = self->mBTCoexStatsMetrics.btrssiCoexAccum / btrssiValidCnt;
      else
        v21 = 0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Submit CA event: BTCoexStats, profileName=%@, durMin=%llu, btDurPercent=%llu, hybridPercent=%llu, parallelPercent=%llu, btDurAirPercent=%llu, wlrssiCoexAvg=%lld, btrssiCoexAvg=%lld"), v5, v15, v16, v10 / v11, v12 / v11, v20, v14, v21);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10008CE80;
      v22[3] = &unk_100203BB8;
      v22[4] = v5;
      v22[5] = v15;
      v22[6] = v16;
      v22[7] = v17;
      v22[8] = v18;
      v22[9] = v20;
      v22[10] = v14;
      v22[11] = v21;
      AnalyticsSendEventLazy(CFSTR("com.apple.WirelessCoexManager.BTCoexStats"), v22);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Ignore CA event: BTCoexStats, durSec=%llu, tddCnt=%llu, hybridCnt=%llu, parallelCnt=%llu, btDurMs=%llu, btDurAirMs=%llu, wlrssiCoexAccum=%lld, wlrssiValidCnt=%llu, btrssiCoexAccum=%lld, btrssiValidCnt=%llu, totDurMs=%llu"), v6, self->mBTCoexStatsMetrics.tddCnt, self->mBTCoexStatsMetrics.hybridCnt, self->mBTCoexStatsMetrics.parallelCnt, self->mBTCoexStatsMetrics.btDurMs, self->mBTCoexStatsMetrics.btDurAirMs, self->mBTCoexStatsMetrics.wlrssiCoexAccum, self->mBTCoexStatsMetrics.wlrssiValidCnt, self->mBTCoexStatsMetrics.btrssiCoexAccum, self->mBTCoexStatsMetrics.btrssiValidCnt, totDurMs);
    }
    -[WCM_CA_BTConnectedDevicesHandler resetBTCoexStatsMetrics](self, "resetBTCoexStatsMetrics");
  }
}

- (void)updateBTCoexWiFiState:(int)a3 wifiChannel:(unsigned int)a4 at:(double)a5
{
  const char *v9;
  int mWiFiState;
  NSMutableArray *mConnectedDevicesMetricsArray;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (a3 >= 4)
  {
    v9 = "INVALID_STATE!!!";
    if (a3 == 4)
      v9 = "ASSOCIATED_6G";
  }
  else
  {
    v9 = off_100203C50[a3];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] updateBTCoexWifiState=%s wifiChannel=%u"), v9, *(_QWORD *)&a4);
  mWiFiState = self->mWiFiState;
  if (a3 != 2 || mWiFiState == 2)
  {
    if (a3 != 2 && mWiFiState == 2)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      mConnectedDevicesMetricsArray = self->mConnectedDevicesMetricsArray;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mConnectedDevicesMetricsArray, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(mConnectedDevicesMetricsArray);
            v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v16, "isTimerActive"))
              objc_msgSend(v16, "stopWiFi2GTimer:wifi2GStartTime:", a5, self->mWiFi2GStartTime);
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mConnectedDevicesMetricsArray, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }
      self->mWiFi2GStartTime = 0.0;
    }
    self->mWiFiState = a3;
    self->mWiFiChannel = a4;
    if (a3 != 2)
      -[WCM_CA_BTConnectedDevicesHandler disableCoexStatsMetricsAt:](self, "disableCoexStatsMetricsAt:", a5);
  }
  else
  {
    self->mWiFi2GStartTime = a5;
    self->mWiFiState = 2;
    self->mWiFiChannel = a4;
  }
}

- (void)updateBTCoexStats_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10 activeProfileFor2G:(int64_t)a11 btPowerState:(BOOL)a12 at:(double)a13
{
  int mWiFiState;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  if (!a12)
  {
    if (!self->mBTCoexStatsMetrics.isActive)
      return;
    goto LABEL_9;
  }
  mWiFiState = self->mWiFiState;
  if (!self->mBTCoexStatsMetrics.isActive)
  {
    if (mWiFiState != 2)
      return;
LABEL_13:
    -[WCM_CA_BTConnectedDevicesHandler enableCoexStatsMetrics:at:](self, "enableCoexStatsMetrics:at:", a11, a13);
    return;
  }
  if (mWiFiState != 2)
  {
LABEL_9:
    -[WCM_CA_BTConnectedDevicesHandler disableCoexStatsMetricsAt:](self, "disableCoexStatsMetricsAt:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a13);
    return;
  }
  if (self->mBTCoexStatsMetrics.profileIndex != a11)
  {
    -[WCM_CA_BTConnectedDevicesHandler disableCoexStatsMetricsAt:](self, "disableCoexStatsMetricsAt:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a13);
    goto LABEL_13;
  }
  v16 = *(_QWORD *)&a8;
  v17 = *(_QWORD *)&a7;
  v18 = *(_QWORD *)&a6;
  v19 = *(_QWORD *)&a5;
  v20 = *(_QWORD *)&a4;
  v21 = *(_QWORD *)&a3;
  v22 = -[WCM_CA_BTConnectedDevicesHandler getProfileName:](self, "getProfileName:", a11);
  if (v19 <= v18)
  {
    v25 = self->mWiFiState;
    if (v18 >> 4 < 0x753)
    {
      if (v25 >= 4)
      {
        if ((_DWORD)v25 == 4)
          v27 = "ASSOCIATED_6G";
        else
          v27 = "INVALID_STATE!!!";
      }
      else
      {
        v27 = off_100203C50[v25];
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] updateBTCoexStats with tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d"), v21, v20, v17, v19, v18, v22, v27, self->mWiFiChannel, v16, a9, a10);
      v28 = self->mBTCoexStatsMetrics.totDurMs + v18;
      self->mBTCoexStatsMetrics.btDurMs += v19;
      self->mBTCoexStatsMetrics.totDurMs = v28;
      v29 = self->mBTCoexStatsMetrics.hybridCnt + v20;
      self->mBTCoexStatsMetrics.tddCnt += v21;
      self->mBTCoexStatsMetrics.hybridCnt = v29;
      v30 = self->mBTCoexStatsMetrics.btDurAirMs + v16;
      self->mBTCoexStatsMetrics.parallelCnt += v17;
      self->mBTCoexStatsMetrics.btDurAirMs = v30;
      v31 = self->mBTCoexStatsMetrics.btrssiValidCnt + ((a10 >> 7) & 1);
      self->mBTCoexStatsMetrics.wlrssiValidCnt += (a9 >> 7) & 1;
      self->mBTCoexStatsMetrics.btrssiValidCnt = v31;
      *(int64x2_t *)&self->mBTCoexStatsMetrics.wlrssiCoexAccum = vaddw_s32(*(int64x2_t *)&self->mBTCoexStatsMetrics.wlrssiCoexAccum, vmin_s32((int32x2_t)__PAIR64__(a10, a9), 0));
    }
    else
    {
      if (v25 >= 4)
      {
        if ((_DWORD)v25 == 4)
          v26 = "ASSOCIATED_6G";
        else
          v26 = "INVALID_STATE!!!";
      }
      else
      {
        v26 = off_100203C50[v25];
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] filtering out CoexStats in system idle state, tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d"), v21, v20, v17, v19, v18, v22, v26, self->mWiFiChannel, v16, a9, a10);
    }
  }
  else
  {
    v23 = self->mWiFiState;
    if (v23 >= 4)
    {
      if ((_DWORD)v23 == 4)
        v24 = "ASSOCIATED_6G";
      else
        v24 = "INVALID_STATE!!!";
    }
    else
    {
      v24 = off_100203C50[v23];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] abnormal CoexStats sample, tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d"), v21, v20, v17, v19, v18, v22, v24, self->mWiFiChannel, v16, a9, a10);
  }
}

- (void)updateBTCoexConnectedDevices:(WCM_BTConnections *)a3 at:(double)a4
{
  id v7;
  unint64_t v8;
  NSMutableArray *mConnectedDevicesMetricsArray;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  WCM_BTConnectedDevicesMetrics *v16;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] updateConnectedDevices with numA2DP=%lu, numLLA=%lu, numHID=%lu, numSCO=%lu, numeSCO=%lu, numLE=%lu, numLEA=%lu"), a3->numA2DP, a3->numLLA, a3->numHID, a3->numSCO, a3->numeSCO, a3->numLE, a3->numLEA);
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = vaddvq_s64(vaddq_s64(*(int64x2_t *)&a3->numA2DP, *(int64x2_t *)&a3->numHID))
     + a3->numeSCO
     + a3->numLE
     + a3->numLEA;
  v17 = v8 != 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  mConnectedDevicesMetricsArray = self->mConnectedDevicesMetricsArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mConnectedDevicesMetricsArray, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(mConnectedDevicesMetricsArray);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v14, "numConnections");
        if (v8 <= (unint64_t)v15)
        {
          if (v8 < (unint64_t)v15 || !objc_msgSend(v14, "isEqualTo:", a3))
          {
LABEL_15:
            objc_msgSend(v14, "stopTimer:wifi2GStartTime:", a4, self->mWiFi2GStartTime);
            -[WCM_CA_BTConnectedDevicesHandler submitEvent:](self, "submitEvent:", v14);
            objc_msgSend(v7, "addObject:", v14);
            continue;
          }
          if ((objc_msgSend(v14, "isTimerActive") & 1) == 0)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Resume timer: (%@)"), objc_msgSend(v14, "getEnumerationString"));
            objc_msgSend(v14, "startTimer:", a4);
          }
          v17 = 0;
        }
        else
        {
          if (!objc_msgSend(v14, "isSubsetOf:", a3))
            goto LABEL_15;
          if (objc_msgSend(v14, "isTimerActive"))
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Pause timer: (%@)"), objc_msgSend(v14, "getEnumerationString"));
            objc_msgSend(v14, "stopTimer:wifi2GStartTime:", a4, self->mWiFi2GStartTime);
          }
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mConnectedDevicesMetricsArray, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v7, "count"))
    -[NSMutableArray removeObjectsInArray:](self->mConnectedDevicesMetricsArray, "removeObjectsInArray:", v7);
  if (v17)
  {
    v16 = -[WCM_BTConnectedDevicesMetrics initWithBTConnections:at:]([WCM_BTConnectedDevicesMetrics alloc], "initWithBTConnections:at:", a3, a4);
    -[NSMutableArray addObject:](self->mConnectedDevicesMetricsArray, "addObject:", v16);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("[BTCoexCA] Start timer: (%@)"), -[WCM_BTConnectedDevicesMetrics getEnumerationString](v16, "getEnumerationString"));

  }
}

@end
