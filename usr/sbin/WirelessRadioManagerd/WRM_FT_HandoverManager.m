@implementation WRM_FT_HandoverManager

- (BOOL)doesIRATClientSubscriptionContextExist
{
  id v3;
  NSMutableArray *miRATClientContexts;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  id v9;
  NSMutableArray *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  obj = self->miRATClientContexts;
  objc_sync_enter(obj);
  v3 = -[NSMutableArray count](self->miRATClientContexts, "count");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: iRAT client count:%d."), "-[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR(" No iRAT client available."));
    goto LABEL_11;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(miRATClientContexts);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "getHandoverContexts");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: iRAT client Context count:%d."), "-[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist]", objc_msgSend(v9, "count"));
      v6 |= objc_msgSend(v9, "count") != 0;
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
LABEL_12:
  objc_sync_exit(obj);
  return v6 & 1;
}

+ (id)WRM_FT_HandoverManagerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A50C;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271118 != -1)
    dispatch_once(&qword_100271118, block);
  return (id)qword_100271120;
}

- (void)setWiFiLinkDown:(BOOL)a3
{
  byte_100271128 = a3;
}

- (BOOL)needWiFiLQM
{
  _BOOL4 v2;
  const char *v3;

  v2 = -[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist");
  v3 = "NO";
  if (v2)
    v3 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: needWiFiLQM? %s "), "-[WRM_FT_HandoverManager needWiFiLQM]", v3);
  return v2;
}

- (void)handleMotionUpdate:(id)a3
{
  int64_t int64;

  int64 = xpc_dictionary_get_int64(a3, "kWRMM_MOTION_STATE");
  -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("handleMotionUpdate received: %s: motion state: %d"), "-[WRM_FT_HandoverManager(privateFunctions) handleMotionUpdate:]", int64);
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64;
  xpc_object_t value;

  uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  value = xpc_dictionary_get_value(a3, "kInternalMessageArgs");
  if (uint64 == 1040 || uint64 == 1003)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("handleInternalMessage:handleWiFiLinkQualityUpdate"));
    -[WRM_FT_HandoverManager handleWiFiLinkQualityUpdate:](self, "handleWiFiLinkQualityUpdate:", value);
  }
  else if (uint64 == 1001)
  {
    -[WRM_FT_HandoverManager handleMotionUpdate:](self, "handleMotionUpdate:", value);
  }
}

- (BOOL)isCellularRadioMetricsGoodEnoughForIMSVoIP:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  const __CFString *v9;
  const __CFString *v10;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isCellularRadioMetricsGoodEnoughForIMSVoIP"), *(_QWORD *)&a5, a6);
  if (a4 - 1 > 1)
  {
    v9 = CFSTR("isCellularRadioMetricsGoodEnoughForIMSVoIP: application category not supported");
    goto LABEL_11;
  }
  if ((a5 - 1) > 1)
  {
    if (!-[WRM_FT_HandoverManager isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular](self, "isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular"))
    {
      v9 = CFSTR("isCellularExitCriteriaMetForIMSFaceCallCurrentLinkCellular false");
      goto LABEL_11;
    }
    v10 = CFSTR("isCellularExitCriteriaMetForIMSFaceCallCurrentLinkCellular true");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v10);
    return 0;
  }
  if (!-[WRM_FT_HandoverManager isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi](self, "isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi"))
  {
    v10 = CFSTR("isCellularEntryCriteriaMetForIMSFaceTimeCallCurrentLinkWiFi false");
    goto LABEL_9;
  }
  v9 = CFSTR("isCellularEntryCriteriaMetForIMSFaceTimeVoIPCallCurrentLinkWiFi true");
LABEL_11:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v9);
  return 1;
}

- (BOOL)isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi
{
  id v3;
  id v4;
  unsigned int v5;
  char *v6;
  unsigned int v7;
  double v8;
  double v9;
  id v10;
  id v11;
  char *v12;
  BOOL v13;
  char *v14;
  char *v16;

  v3 = -[WRM_FT_HandoverManager getSCService](self, "getSCService");
  v4 = -[WRM_FT_HandoverManager getCTService](self, "getCTService");
  v5 = objc_msgSend(v4, "getServingCellType");
  v6 = (char *)objc_msgSend(v4, "getCurrentSignalBars");
  v7 = v5 - 1;
  if (v7)
    objc_msgSend(v4, "getNrRSRP");
  else
    objc_msgSend(v4, "getServingCellRSRP");
  v9 = v8;
  v10 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v11 = objc_msgSend(v3, "getCellularDataLQM");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi,LQM: %d, Signal Bars: %d"), v11, v6);
  switch(v7)
  {
    case 1u:
      v16 = (char *)objc_msgSend(v10, "minSigBarTh2");
      if ((int)v11 > 49 || (uint64_t)v6 >= (uint64_t)(v16 - 1))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("UMTS entry conditions are met bars:%ld"), v6);
        return 1;
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("UMTS entry conditions are not met bars:%ld"), v6);
        return 0;
      }
    case 2u:
    case 7u:
      if (byte_100270F60)
      {
        v12 = (char *)objc_msgSend(v10, "minSigBarTh2");
        if ((int)v11 > 49 || (uint64_t)v6 >= (uint64_t)(v12 - 1))
        {
          byte_100270F60 = 0;
          v13 = 1;
LABEL_21:
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x400000);
          return v13;
        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FaceTime not supported on 2G radio:%ld"), v6);
      }
      v13 = 0;
      goto LABEL_21;
    case 8u:
      v13 = v9 >= -110.0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FaceTime entry criteria met on 5G radio:%f, status:%d"), *(_QWORD *)&v9, v9 >= -110.0);
      return v13;
    default:
      v14 = (char *)objc_msgSend(v10, "minSigBarTh2") - 1;
      return (int)v11 > 49 || (uint64_t)v6 >= (uint64_t)v14;
  }
}

- (BOOL)isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular
{
  id v3;
  unsigned int v4;
  char *v5;
  unsigned int v6;
  double v7;
  double v8;
  id v9;
  id v10;
  BOOL v11;

  v3 = -[WRM_FT_HandoverManager getCTService](self, "getCTService");
  v4 = objc_msgSend(v3, "getServingCellType");
  v5 = (char *)objc_msgSend(v3, "getCurrentSignalBars");
  v6 = v4 - 1;
  if (v4 == 1)
    objc_msgSend(v3, "getServingCellRSRP");
  else
    objc_msgSend(v3, "getNrRSRP");
  v8 = v7;
  v9 = objc_msgSend(-[WRM_FT_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v10 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular,LQM: %d, Signal Bars: %d"), v9, v5);
  switch(v6)
  {
    case 2u:
    case 7u:
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x400000);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular:%ld"), v5);
      goto LABEL_11;
    case 8u:
      v11 = v8 < -121.0;
      if (v8 < -121.0)
        -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x100000);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FaceTime exit criteria met on 5G radio: %f, status:%d"), *(_QWORD *)&v8, v8 < -121.0);
      break;
    default:
      if ((uint64_t)v5 <= (uint64_t)((char *)objc_msgSend(v10, "minSigBarTh1") + 1) && (int)v9 < 11
        || (uint64_t)v5 <= (uint64_t)objc_msgSend(v10, "minSigBarTh1"))
      {
        -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x80000);
        -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x40000);
LABEL_11:
        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
      break;
  }
  return v11;
}

- (BOOL)isWiFiDataRateIndicatorGoodForFaceTime:(unint64_t)a3 :(int)a4
{
  id v6;
  WCM_WiFiService *v7;
  unint64_t v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  _OWORD v20[2];
  uint64_t v21;

  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v6 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3), "getiRATConfigController");
  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "getEstimatedWiFiBandwidth:", v20);
  v8 = *(_QWORD *)&v20[0];
  v9 = (float)*(unint64_t *)&v20[0];
  -[WCM_WiFiService getRxRetryPercent](v7, "getRxRetryPercent");
  v11 = v10;
  -[WCM_WiFiService getTxRetryPercent](v7, "getTxRetryPercent");
  v13 = v12;
  -[WCM_WiFiService getRxPhyRate](v7, "getRxPhyRate");
  v15 = (1.0 - v11) * v14;
  -[WCM_WiFiService getTxPhyRate](v7, "getTxPhyRate");
  v17 = (1.0 - v13) * v16;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Estimated BW: %.2f, Calculated Available Rx PHY Rate: %.2f, Calculated Available TX Rate: %.2f"), v9, v15, v17);
  if (a4 == 1)
    return v9 >= (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiThroughputTh1")
        && v15 >= (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh1")
        && v17 >= (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh1");
  return !a4 && v8 > 0x8FB;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "WRM_FT_HandoverManagerSingleton", a3);
}

- (void)addiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[NSMutableArray addObject:](self->miRATClientContexts, "addObject:", a3);
  -[WRM_FT_HandoverManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[WRM_FT_HandoverManager existingContexts](self, "existingContexts");
  -[NSMutableArray removeObject:](self->miRATClientContexts, "removeObject:", a3);
  -[WRM_FT_HandoverManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3;
  NSMutableArray *miRATClientContexts;
  id v6;

  v3 = *(_QWORD *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v6 = -[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", v3);
  if (v6)
    -[WRM_FT_HandoverManager removeiRatClient:](self, "removeiRatClient:", v6);
  objc_sync_exit(miRATClientContexts);
  -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_FT_HandoverManager needWiFiLQM](self, "needWiFiLQM"));
}

- (void)evaluateCellAleratedState:(unint64_t)a3
{
  unsigned int v4;
  _BOOL8 mInAleratedState;
  id v6;
  id v7;
  unsigned int v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  _BOOL4 v17;
  uint64_t v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v25;
  id v27;

  v4 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a3), "platformManager"), "wrmPlatformId");
  if ((objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice") & 1) == 0&& v4 - 3 > 6)
  {
    return;
  }
  mInAleratedState = self->mInAleratedState;
  v6 = -[WRM_FT_HandoverManager getCTService](self, "getCTService");
  v7 = objc_msgSend(v6, "getServingCellType");
  v8 = v7;
  switch((_DWORD)v7)
  {
    case 1:
      objc_msgSend(v6, "getServingCellRSRP");
      v10 = v9;
      objc_msgSend(v6, "getServingCellSNR");
      v12 = v11;
      objc_msgSend(v6, "getServingCellRSRQ");
      break;
    case 2:
      objc_msgSend(v6, "getServingCellECIO");
      v22 = v21;
      objc_msgSend(v6, "getServingCellRSCP");
      v16 = v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("RSCP :%lf, ECIO: %lf"), *(_QWORD *)&v23, v22);
      v10 = 0.0;
      goto LABEL_10;
    case 9:
      objc_msgSend(v6, "getNrRSRP");
      v10 = v14;
      objc_msgSend(v6, "getNrSNR");
      v12 = v15;
      objc_msgSend(v6, "getNrRSRQ");
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR(" RAT type: %d"), v7);
      v10 = 0.0;
      goto LABEL_9;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("RSRP: %lf, SNR: %lf, RSRQ: %lf"), *(_QWORD *)&v10, v12, v13);
LABEL_9:
  v16 = 0.0;
LABEL_10:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateCellAleratedState,state:%d"), mInAleratedState);
  if (self->mInAleratedState)
  {
    v17 = v8 == 1 && v10 > -110.0 || v8 == 9 && v10 > -105.0 || v16 > -105.0 && v8 == 2;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isExitCriteriaMet : %d"), v17);
    v25 = mInAleratedState && !v17;
  }
  else
  {
    v18 = 1;
    if (v8 > 9)
    {
      v19 = 1;
    }
    else
    {
      v19 = 1;
      if (((1 << v8) & 0x207) != 0)
      {
        v20 = v8 == 9 || v8 == 1;
        if (v20 && v10 < -121.0)
        {
          v18 = 0;
        }
        else
        {
          v18 = 0;
          v19 = v16 < -115.0 && v8 == 2;
        }
      }
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isEntryCriteriaMetRatType met: %d, isEntryCriteriaMet: %d"), v18, v19);
    v25 = mInAleratedState || v19;
  }
  if (self->mInAleratedState != (_DWORD)v25)
  {
    v27 = -[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", 7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("updating evaluateCellAleratedState: state: %d"), v25);
    objc_msgSend(v27, "alertWRMClient::::", v25, self->mCTService, -[WCM_WiFiController wifiService](self->mWiFi, "wifiService"), 0);
  }
  self->mInAleratedState = v25;
}

- (void)evaluateWiFiAleratedState:(unint64_t)a3
{
  id v4;
  _BOOL4 mInAleratedState;
  WCM_WiFiService *v6;
  uint64_t v7;
  id v8;
  signed int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  unsigned __int8 v17;
  id v18;
  float v19;
  float v20;
  id v21;
  unsigned __int8 v22;
  BOOL v23;
  double v24;
  uint64_t v25;
  char v26;
  _BOOL4 v27;
  id v28;

  v4 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController", a3);
  mInAleratedState = self->mInAleratedState;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateWiFiAleratedState,state:%d"), self->mInAleratedState);
  v6 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v7 = -[WCM_WiFiService getRSSI](v6, "getRSSI");
  v8 = -[WCM_WiFiService getCCA](v6, "getCCA");
  v9 = -[WCM_WiFiService getConnectedStationCount](v6, "getConnectedStationCount");
  -[WCM_WiFiService getTxPer](v6, "getTxPer");
  v11 = v10;
  -[WCM_WiFiService getMovingAverageTxPer](v6, "getMovingAverageTxPer");
  v13 = v12;
  v14 = -[WCM_WiFiService isMovingAverageTxPerValid](v6, "isMovingAverageTxPerValid");
  -[WCM_WiFiService getRxRatio](v6, "getRxRatio");
  v16 = v15;
  v17 = -[WCM_WiFiService isRxRatioValid](v6, "isRxRatioValid");
  v18 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  objc_msgSend(v18, "deltaVideoErasure");
  v20 = v19;
  if (v7 >= (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeRssiTh0"))
  {
    v23 = 0;
  }
  else if (v14 && (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeTxPer1") <= (uint64_t)(v13 * 100.0))
  {
    v23 = 1;
  }
  else
  {
    v21 = objc_msgSend(v4, "faceTimeAleratedModeCCATh0");
    if (v16 >= 0.3)
      v22 = v17;
    else
      v22 = 0;
    v23 = 1;
    if ((uint64_t)v8 <= (uint64_t)v21 && (v22 & 1) == 0)
    {
      objc_msgSend(v18, "movAvgRxPktLoss");
      v23 = v24 >= 3.0;
    }
  }
  if (self->mInAleratedState)
  {
    if (v7 >= (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeRssiTh0")
      && (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeTxPer0") >= (uint64_t)(v11 * 100.0))
    {
      v25 = mInAleratedState & ((uint64_t)v8 > (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeCCATh0"));
    }
    else
    {
      v25 = mInAleratedState;
    }
  }
  else
  {
    v26 = v7 <= (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeRssiTh1") || v23;
    if ((v26 & 1) != 0
      || (uint64_t)v8 >= (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeCCATh1")
      && (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeVideoErasures") < (uint64_t)v20)
    {
      v27 = 1;
    }
    else
    {
      v27 = (uint64_t)v8 >= (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeCCATh1")
         && (uint64_t)objc_msgSend(v4, "faceTimeAleratedModeStationCount") <= v9;
    }
    v25 = mInAleratedState || v27;
  }
  if (self->mInAleratedState != (_DWORD)v25)
  {
    v28 = -[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", 7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateWiFiAleratedState: state: %d"), v25);
    objc_msgSend(v28, "alertWRMClient::::", v25, self->mCTService, -[WCM_WiFiController wifiService](self->mWiFi, "wifiService"), 1);
    self->mWrmiRATFaceTimeMetrics->alertedMode = v25;
  }
  if ((unint64_t)(v7 + 60) <= 0xFFFFFFFFFFFFFFF6)
    -[WRM_FT_HandoverManager toggleFastLQMReport:](self, "toggleFastLQMReport:", v7 < -69);
  self->mInAleratedState = v25;
}

- (id)getiRATClientFromList:(int)a3
{
  NSMutableArray *miRATClientContexts;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->miRATClientContexts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if (objc_msgSend(v10, "getMyClientType") == a3)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (void)existingContexts
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("WRM_FT_Handover_Manager: Number of active iRAT clients: %lu"), -[NSMutableArray count](self->miRATClientContexts, "count"));
}

- (unint64_t)retainCount
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager: retain count:%lu "), -1);
  return -1;
}

- (WRM_FT_HandoverManager)autorelease
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager: auto release "));
  return self;
}

- (WRM_FT_HandoverManager)init
{
  WRM_FT_HandoverManager *v2;
  WRM_IdsMetricsController *v3;
  WRM_MetricsService *v4;
  CXCallObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WRM_FT_HandoverManager;
  v2 = -[WRM_FT_HandoverManager init](&v7, "init");
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue");
    *(_OWORD *)&v2->mCTService = 0u;
    *(_OWORD *)&v2->mWiFi = 0u;
    v2->mAVConferenceController = objc_opt_new(WRM_AVConferenceController);
    v3 = +[WRM_IdsMetricsController WRM_IdsMetricsControllerSingleton](WRM_IdsMetricsController, "WRM_IdsMetricsControllerSingleton");
    v2->mMotionController = 0;
    v2->mIDSMetricsController = v3;
    byte_100271128 = 0;
    byte_100271129 = 1;
    byte_10027112A = 0;
    v2->mDiscardRTPMetrics = 0;
    byte_10027112B = 0;
    v2->miRATConfig = (WRM_iRATConfig *)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mMotionController = (WRM_MotionController *)+[WRM_MotionController singleton](WRM_MotionController, "singleton");
    v4 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
    v2->mMetrics = v4;
    if (v4)
      -[WRM_MetricsService initFaceTimeHandoverMetrics](v4, "initFaceTimeHandoverMetrics");
    if (NSClassFromString(CFSTR("CXCallObserver")))
    {
      v5 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
      v2->mCallObserver = v5;
      -[CXCallObserver setDelegate:queue:](v5, "setDelegate:queue:", v2, &_dispatch_main_q);
    }
    else
    {
      v2->mCallObserver = 0;
    }
    -[WRM_FT_HandoverManager initCallNotifications](v2, "initCallNotifications");
    v2->mWrmiRATFaceTimeMetrics = -[WRM_MetricsService getWRMFaceTimeHandover](v2->mMetrics, "getWRMFaceTimeHandover");
    v2->mStartTime = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mPrevTimeSinceStart = 0.0;
    v2->mAudioEvaluationTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mTimeSinceAudioEvaluationStarted = 0.0;
    v2->mLatteContextStartedTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mTimeSinceLatteContextStarted = 0.0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager: Handover manager initialized"));
    byte_10027112C = 0;
    v2->mInAleratedState = 0;
  }
  return v2;
}

- (void)dealloc
{
  CXCallObserver *mCallObserver;
  WRM_AVConferenceController *mAVConferenceController;
  NSMutableArray *miRATClientContexts;
  NSDate *mStartTime;
  NSDate *mAudioEvaluationTimer;
  NSDate *mLatteContextStartedTimer;
  objc_super v9;

  self->miRATConfig = 0;
  self->mIDSMetricsController = 0;
  *(_OWORD *)&self->mQueue = 0u;
  *(_OWORD *)&self->mSCService = 0u;
  self->mBT = 0;
  mCallObserver = self->mCallObserver;
  if (mCallObserver)
  {
    -[CXCallObserver setDelegate:queue:](mCallObserver, "setDelegate:queue:", 0, 0);

    self->mCallObserver = 0;
  }
  mAVConferenceController = self->mAVConferenceController;
  if (mAVConferenceController)
  {

    self->mAVConferenceController = 0;
  }
  self->mIDSMetricsController = 0;
  self->mDiscardRTPMetrics = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager: Dealloc called for handover manager "));
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts)

  mStartTime = self->mStartTime;
  if (mStartTime)
  {

    self->mStartTime = 0;
    self->mPrevTimeSinceStart = 0.0;
  }
  mAudioEvaluationTimer = self->mAudioEvaluationTimer;
  if (mAudioEvaluationTimer)
  {

    self->mAudioEvaluationTimer = 0;
    self->mTimeSinceAudioEvaluationStarted = 0.0;
  }
  mLatteContextStartedTimer = self->mLatteContextStartedTimer;
  if (mLatteContextStartedTimer)
  {

    self->mLatteContextStartedTimer = 0;
    self->mTimeSinceLatteContextStarted = 0.0;
  }
  v9.receiver = self;
  v9.super_class = (Class)WRM_FT_HandoverManager;
  -[WRM_FT_HandoverManager dealloc](&v9, "dealloc");
}

- (id)getQueue
{
  return self->mQueue;
}

- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4
{
  NSObject *mQueue;
  _QWORD block[7];

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B160;
  block[3] = &unk_100201DE8;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(mQueue, block);
}

- (void)updateControllerState:(id)a3
{
  NSObject *mQueue;
  _QWORD v4[6];

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005B4C4;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64;
  uint64_t v6;
  xpc_object_t value;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 <= 401)
  {
    if (uint64 > 200)
    {
      if (uint64 == 201)
      {
        -[WRM_FT_HandoverManager handleRTPEvent:](self, "handleRTPEvent:", a3);
      }
      else if (uint64 == 202)
      {
        -[WRM_FT_HandoverManager handlePeriodicRTPMetrics:](self, "handlePeriodicRTPMetrics:", a3);
      }
    }
    else if (uint64 == 100)
    {
      -[WRM_FT_HandoverManager handleWiFiConfig](self, "handleWiFiConfig", v6);
    }
    else if (uint64 == 103)
    {
      -[WRM_FT_HandoverManager handleWiFiStateChaneEvents:](self, "handleWiFiStateChaneEvents:", a3);
    }
  }
  else
  {
    switch(uint64)
    {
      case 402:
        -[WRM_FT_HandoverManager handleLinkPrefSubscribeIDS:](self, "handleLinkPrefSubscribeIDS:", a3);
        goto LABEL_16;
      case 403:
        -[WRM_FT_HandoverManager handleSubscribeStatusUpdateIDS::](self, "handleSubscribeStatusUpdateIDS::", a3);
        break;
      case 404:
      case 405:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
        return;
      case 406:
        -[WRM_FT_HandoverManager handleLinkPrefSubscribe:](self, "handleLinkPrefSubscribe:", a3);
LABEL_16:
        -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_FT_HandoverManager needWiFiLQM](self, "needWiFiLQM"));
        -[WRM_FT_HandoverManager registerForCTNotifications](self, "registerForCTNotifications");
        -[WRM_FT_HandoverManager registerForSCNotifications](self, "registerForSCNotifications");
        break;
      case 407:
        -[WRM_FT_HandoverManager handleSubscribeStatusUpdate::](self, "handleSubscribeStatusUpdate::", a3, 1);
        break;
      case 408:
        -[WRM_FT_HandoverManager handleCellularLinkQualityUpdate:](self, "handleCellularLinkQualityUpdate:", a3);
        break;
      case 415:
        -[WRM_FT_HandoverManager handleGetMetrcisMessage:](self, "handleGetMetrcisMessage:", a3);
        break;
      default:
        if (uint64 == 600)
        {
          -[WRM_FT_HandoverManager handlaIDSMetrics:](self, "handlaIDSMetrics:", a3);
        }
        else if (uint64 == 1000)
        {
          value = xpc_dictionary_get_value(a3, "kMessageArgs");
          -[WRM_FT_HandoverManager handleInternalMessage:](self, "handleInternalMessage:", value);
        }
        break;
    }
  }
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if (-[WRM_FT_HandoverManager enableiRATManager](self, "enableiRATManager"))
  {
    if ((uint64_t)a3 > 11)
    {
      if (a3 == 12)
      {
        -[WRM_FT_HandoverManager handleIDSToolRegisterd](self, "handleIDSToolRegisterd");
      }
      else if (a3 == 14)
      {
        -[WRM_FT_HandoverManager handleFTConfig](self, "handleFTConfig");
      }
    }
    else if (a3 == 1)
    {
      -[WRM_FT_HandoverManager handleWiFiConfig](self, "handleWiFiConfig");
    }
    else if (a3 == 11)
    {
      -[WRM_FT_HandoverManager handleIDSRegisterd](self, "handleIDSRegisterd");
    }
  }
}

- (void)handleIDSToolRegisterd
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS Tool registration status changed."));
}

- (void)handleIDSRegisterd
{
  if (-[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", 4))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS Link Manager: configureIDSMetricsReporting."));
    -[WRM_FT_HandoverManager configureIDSMetricsReporting](self, "configureIDSMetricsReporting");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS registration status changed."));
}

- (void)configureIDSMetricsReporting
{
  -[WRM_IdsMetricsController resetIDSMetrics](self->mIDSMetricsController, "resetIDSMetrics");
  -[WRM_IdsMetricsController resetCumulativeIdsMetrics](self->mIDSMetricsController, "resetCumulativeIdsMetrics");
  -[WRM_IdsMetricsController configureIDSMetricsReporting](self->mIDSMetricsController, "configureIDSMetricsReporting");
}

- (void)handlaIDSMetrics:(id)a3
{
  WCM_WiFiController *mWiFi;
  const __CFString *v6;

  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    if (-[WCM_WiFiController wifiService](mWiFi, "wifiService"))
    {
      -[WRM_IdsMetricsController handlePeriodicIDSMetrics:](self->mIDSMetricsController, "handlePeriodicIDSMetrics:", a3);
      return;
    }
    v6 = CFSTR("handlaIDSMetrics: WiFi service not initialized.");
  }
  else
  {
    v6 = CFSTR("handlaIDSMetrics: WiFi not initialized.");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v6);
}

- (void)handleFTConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FaceTime Calling Client config changed."));
  -[WRM_FT_HandoverManager configureRTPMetricsReporting](self, "configureRTPMetricsReporting");
}

- (void)handleWiFiConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("WiFi config changed."));
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
}

- (BOOL)handoverEvaluationRequired
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  -[NSDate timeIntervalSinceNow](self->mStartTime, "timeIntervalSinceNow");
  v5 = v4;
  v6 = self->mPrevTimeSinceStart - v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("HO Evaluation time duration is: %lf"), *(_QWORD *)&v6);
  v7 = (double)(uint64_t)objc_msgSend(v3, "pingPongAvoidanceThresholdStationary");
  if (v6 * 1000.0 >= v7)
    self->mPrevTimeSinceStart = v5;
  return v6 * 1000.0 >= v7;
}

- (BOOL)isWiFiLinkEvaluationDesired
{
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v4;
  WCM_WiFiService *v5;
  unsigned int v6;
  int64_t v7;
  const __CFString *v8;

  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    v8 = CFSTR("isWiFiLinkEvaluationDesired: WiFi not initialized.");
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, v8);
    LOBYTE(v6) = 0;
    return v6;
  }
  v4 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (!v4)
  {
    v8 = CFSTR("isWiFiLinkEvaluationDesired: WiFi service not initialized.");
    goto LABEL_7;
  }
  v5 = v4;
  v6 = -[WCM_WiFiService isWiFiPrimaryInterface](v4, "isWiFiPrimaryInterface");
  if (v6)
  {
    v7 = -[WCM_WiFiService getRSSI](v5, "getRSSI");
    LOBYTE(v6) = v7 >= (uint64_t)objc_msgSend(-[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController"), "faceTimeMinActiveWiFiRssiTh0");
  }
  return v6;
}

- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  int v11;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v13;
  const __CFString *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v20;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  if (a6 == 1 && byte_100271129 == 1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("iRAT restarted, WiFi not yet initalized"));
    v11 = 1;
    goto LABEL_16;
  }
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    v13 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
    if (v13)
    {
      if (byte_100271128)
      {
        -[WRM_FT_HandoverManager evaluateCellAleratedState:](self, "evaluateCellAleratedState:", a4);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate link: WiFi link not associated.  mLinkDown:%d"), byte_100271128);
LABEL_14:
        -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
        goto LABEL_15;
      }
      if (-[WCM_WiFiService isWiFiPrimaryInterface](v13, "isWiFiPrimaryInterface"))
      {
        byte_10027112D = 0;
        -[WRM_FT_HandoverManager evaluateWiFiAleratedState:](self, "evaluateWiFiAleratedState:", a4);
        v11 = -[WRM_FT_HandoverManager evaluateLinkWiFiPreferred::::](self, "evaluateLinkWiFiPreferred::::", a3, a4, v7, v6);
        goto LABEL_16;
      }
      -[WRM_FT_HandoverManager evaluateCellAleratedState:](self, "evaluateCellAleratedState:", a4);
      byte_10027112D = 1;
      v14 = CFSTR("Evaluate link: WiFi link not primary yet. ");
    }
    else
    {
      v14 = CFSTR("Evaluate link: WiFi service not initialized.");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v14, v20);
    goto LABEL_14;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate link: WiFi not initialized."));
  -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
  -[WRM_FT_HandoverManager evaluateCellAleratedState:](self, "evaluateCellAleratedState:", a4);
LABEL_15:
  v11 = 0;
LABEL_16:
  v15 = "DATA";
  v16 = "VOICE";
  v17 = "UNKNOWN_APP!!!";
  if (a4 == 2)
    v17 = "VIDEO";
  if (a4 != 1)
    v16 = v17;
  if (a4)
    v15 = v16;
  v18 = "WIFI";
  if (!v11)
    v18 = "CELLULAR";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}iRAT: Evaluate link preferred: %s"), v15, v18);
  return v11;
}

- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6;
  _BOOL8 v7;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  if (a5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate link: Call active."));
    if (-[WRM_FT_HandoverManager canWiFiMeetActiveApplicationRequirements:::](self, "canWiFiMeetActiveApplicationRequirements:::", a3, a4, v6))
    {
      return 1;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate link: Call Idle."));
    if (-[WRM_FT_HandoverManager canWiFiMeetIdleApplicationRequirements:::](self, "canWiFiMeetIdleApplicationRequirements:::", a3, a4, v6))
    {
      return 1;
    }
  }
  return !-[WRM_FT_HandoverManager canCellularMeetApplicationRequirement:::::](self, "canCellularMeetApplicationRequirement:::::", a3, a4, v7, v6, 0);
}

- (id)getWiFiController
{
  return self->mWiFi;
}

- (void)evaluateHandover
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  WRM_FT_HandoverManager *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  const char *v20;
  unsigned int v21;
  _BOOL8 v22;
  const char *v23;
  BOOL v24;
  char v25;
  const char *v26;
  double v27;
  double v28;
  double v29;
  const char *v30;
  const char *v31;
  id v32;
  unint64_t v33;
  double v34;
  double v35;
  const char *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableArray *obj;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  WRM_FT_HandoverManager *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v3 = -[NSMutableArray count](self->miRATClientContexts, "count");
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate Handover: No iRAT client available."));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate Handover: Total number of iRAT clients %zu."), v3);
  -[WRM_FT_HandoverManager updateSlotInfoCTServie](self, "updateSlotInfoCTServie");
  v46 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = self->miRATClientContexts;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v43)
  {
LABEL_98:
    v38 = "ClientFaceTimeCalling";
    goto LABEL_99;
  }
  v47 = self;
  v42 = *(_QWORD *)v57;
  do
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)v57 != v42)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v4);
      v6 = objc_msgSend(v5, "getMyClientType");
      v7 = "ClientCommCenter";
      v8 = v47;
      if ((_DWORD)v6 != 1)
      {
        if (((_DWORD)v6 - 2) >= 0x14)
        {
          v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if ((_DWORD)v6 == 22)
            v7 = "ClientCoreMediaStreaming";
        }
        else
        {
          v7 = off_100202C10[(int)v6 - 2];
        }
      }
      v45 = v4;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("<%s>Evaluate Handover: BEGIN."), v7);
      v44 = v5;
      v9 = objc_msgSend(v5, "getHandoverContexts");
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v48 = v9;
      v51 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v51)
      {
        v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
        if ((_DWORD)v6 == 22)
          v10 = "ClientCoreMediaStreaming";
        v49 = v10;
        v50 = *(_QWORD *)v53;
        v11 = (int)v6 - 2;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v53 != v50)
              objc_enumerationMutation(v48);
            v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v12);
            v14 = objc_msgSend(v13, "getBandwidth");
            v15 = objc_msgSend(v13, "getApplicationType");
            v16 = objc_msgSend(v13, "getCallState");
            v17 = objc_msgSend(v13, "getConnectedLinkType");
            if (objc_msgSend(v13, "getSubscriptionType") != (id)1)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluate Handover: SubscriptionType != WIFI_CELL, HO Eval Required: %d"), 0, v39);
              goto LABEL_81;
            }
            v18 = "ClientCommCenter";
            if ((_DWORD)v6 != 1)
            {
              v18 = v49;
              if (v11 <= 0x13)
                v18 = off_100202C10[v11];
            }
            if (v15)
            {
              v19 = "VOICE";
              if (v15 != (id)1)
              {
                v19 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v19 = "VIDEO";
              }
            }
            else
            {
              v19 = "DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("<%s>{%s}Evaluate Handover: BEGIN."), v18, v19);
            if ((_DWORD)v17 || (byte_10027112D & 1) != 0)
              goto LABEL_32;
            if (byte_10027112E == 1)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluate_handover: connectedLinkType == WRM_CELLULAR"));
              objc_msgSend(v13, "getDeltaTimeSinceLastCellularRecommendation");
              v28 = v27;
              if ((_DWORD)v16)
              {
                v29 = v27 * 1000.0;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("state: active, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf"), v27 * 1000.0);
                if (v29 < (double)(uint64_t)objc_msgSend(v46, "faceTimeCellularStickinessThreaholdActive"))
                  goto LABEL_84;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("WiFi link evaluation criteria met: FaceTimeCellularStickinessThreaholdStationaryActive"));
LABEL_32:
                objc_msgSend(v13, "updatePrevTimeStamp");
                goto LABEL_33;
              }
              v32 = objc_msgSend(v13, "getPingPongAvoidanceTimerMultiplier");
              v33 = (_QWORD)objc_msgSend(v46, "faceTimeCellularStickinessThreaholdActive") * (_QWORD)v32;
              v34 = v28 * 1000.0;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("state: idle, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effective blockout:%lld"), *(_QWORD *)&v34, v33);
              v35 = (double)v33;
              v8 = v47;
              if (v34 < v35)
              {
LABEL_84:
                if (v15)
                {
                  v36 = "VOICE";
                  if (v15 != (id)1)
                  {
                    v36 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2)
                      v36 = "VIDEO";
                  }
                }
                else
                {
                  v36 = "DATA";
                }
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}Skipping link evaluation for client connected on cellular link"), v36);
                objc_msgSend(v13, "setLinkPreferenceNotificationRequired:", 0);
                goto LABEL_71;
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("WiFi link evaluation criteria met: FaceTimeCellularStickinessThreaholdStationary"));
              objc_msgSend(v13, "updatePrevTimeStamp");
              objc_msgSend(v13, "setPingPongAvoidanceTimerMultiplier:", 1);
            }
LABEL_33:
            -[WRM_FT_HandoverManager initHandoverReasonCode](v8, "initHandoverReasonCode");
            if (v15)
            {
              v20 = "VOICE";
              if (v15 != (id)1)
              {
                v20 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v20 = "VIDEO";
              }
            }
            else
            {
              v20 = "DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}invoking evaluate link"), v20);
            v21 = -[WRM_FT_HandoverManager evaluateLink::::](v8, "evaluateLink::::", v14, v15, v16, v17);
            v22 = v21 == 1;
            if (objc_msgSend(v13, "getConnectedLinkType") != v22)
            {
              if ((_DWORD)v17)
                v24 = 0;
              else
                v24 = v21 == 1;
              v25 = v24;
              if (!v24)
              {
                if ((_DWORD)v17 == 1 && v21 != 1)
                {
                  -[WRM_MetricsService updateiRATMetricWifiToCell::::](v47->mMetrics, "updateiRATMetricWifiToCell::::", v16, v15, 5, v47->mReasons);
LABEL_57:
                  byte_10027112E = v25 ^ 1;
                }
                objc_msgSend(v13, "setLinkPreferenceNotificationRequired:", 1);
                objc_msgSend(v13, "setConnectedLinkType:", v22);
                v8 = v47;
                objc_msgSend(v13, "setHandoverReasonType:", v47->mReasons);
                if (v15)
                {
                  v26 = "VOICE";
                  if (v15 != (id)1)
                  {
                    v26 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2)
                      v26 = "VIDEO";
                  }
                }
                else
                {
                  v26 = "DATA";
                }
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}Link preference changed for application type =%lld for client =%d"), v26, v15, v6, v40);
                goto LABEL_71;
              }
              -[WRM_MetricsService updateiRATMetricCellToWifi::::](v47->mMetrics, "updateiRATMetricCellToWifi::::", v16, v15, 5, v47->mReasons);
              goto LABEL_57;
            }
            objc_msgSend(v13, "setLinkPreferenceNotificationRequired:", 0);
            if (v15)
            {
              v23 = "VOICE";
              if (v15 != (id)1)
              {
                v23 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v23 = "VIDEO";
              }
            }
            else
            {
              v23 = "DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}Link preference did not change for application type =%lld for client =%d current link type =%d "), v23, v15, v6, v22);
LABEL_71:
            v30 = "ClientCommCenter";
            if ((_DWORD)v6 != 1)
            {
              v30 = v49;
              if (v11 <= 0x13)
                v30 = off_100202C10[v11];
            }
            if (v15)
            {
              v31 = "VOICE";
              if (v15 != (id)1)
              {
                v31 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v31 = "VIDEO";
              }
            }
            else
            {
              v31 = "DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("<%s>{%s}Evaluate Handover: END."), v30, v31);
LABEL_81:
            v12 = (char *)v12 + 1;
          }
          while (v51 != v12);
          v37 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          v51 = v37;
        }
        while (v37);
      }
      objc_msgSend(v44, "handleLinkPreferenceNotificationInternetDataVoiceVideo:::", 0, v8->mCTService, -[WCM_WiFiController wifiService](v8->mWiFi, "wifiService"));
      v4 = v45 + 1;
    }
    while ((id)(v45 + 1) != v43);
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  }
  while (v43);
  v38 = "ClientCommCenter";
  switch((int)v6)
  {
    case 1:
      break;
    case 2:
      v38 = "ClientCommCenter1";
      break;
    case 3:
      v38 = "ClientNetworkd";
      break;
    case 4:
      v38 = "ClientIDS";
      break;
    case 5:
      v38 = "ClientIDSTool";
      break;
    case 6:
      v38 = "ClientIMGVideo";
      break;
    case 7:
      goto LABEL_98;
    case 8:
      v38 = "ClientCallKitTelephony";
      break;
    case 9:
      v38 = "ClientLocationd";
      break;
    case 10:
      v38 = "ClientCarousel";
      break;
    case 11:
      v38 = "ClientMusic";
      break;
    case 12:
      v38 = "ClientIMGVideoTest";
      break;
    case 13:
      v38 = "ClientTerminus";
      break;
    case 14:
      v38 = "ClientSiri";
      break;
    case 15:
      v38 = "ClientWebkit";
      break;
    case 16:
      v38 = "ClientWebkitMail";
      break;
    case 17:
      v38 = "ClientWebkitNotification";
      break;
    case 18:
      v38 = "ClientWirelessStress";
      break;
    case 19:
      v38 = "ClientCoreDuet";
      break;
    case 20:
      v38 = "ClientJTRNt";
      break;
    case 21:
      v38 = "ClientNPT";
      break;
    default:
      v38 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      if ((_DWORD)v6 == 22)
        v38 = "ClientCoreMediaStreaming";
      break;
  }
LABEL_99:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("<%s>Evaluate Handover: END."), v38);
}

- (id)getCTService
{
  return self->mCTService;
}

- (id)getSCService
{
  return self->mSCService;
}

- (id)getAVConferenceController
{
  return self->mAVConferenceController;
}

- (id)getiRATConfigController
{
  return self->miRATConfig;
}

- (void)handleWiFiLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager received WiFi link metrics"));
  byte_100271129 = 0;
  if (-[WRM_FT_HandoverManager handoverEvaluationRequired](self, "handoverEvaluationRequired"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluating WiFi versus Cellular link preference."));
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("No need of Handover Evaluation: Evaluation Criteria not met."));
  }
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value;
  int64_t int64;
  int64_t v6;
  int64_t v7;
  WCM_WiFiService *v8;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager received WiFi link state change event"));
  if (value)
  {
    byte_10027112B = 0;
    int64 = xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS");
    byte_10027112E = 0;
    if (int64)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager:Link down event received"));
      byte_100271128 = 1;
    }
    else
    {
      byte_100271128 = 0;
      v6 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      v7 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager:Linkup event received"));
      v8 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
      -[WCM_WiFiService updateTxStats:::](v8, "updateTxStats:::", 0, 0, 0);
      -[WCM_WiFiService updateTxPer](v8, "updateTxPer");
      -[WCM_WiFiService updateFwTxStats:::](v8, "updateFwTxStats:::", 0, 0, 0);
      -[WCM_WiFiService updateFwTxPer](v8, "updateFwTxPer");
      -[WCM_WiFiService updateRxStats::](v8, "updateRxStats::", 0, 0);
      -[WCM_WiFiService updateRxRatio](v8, "updateRxRatio");
      -[WCM_WiFiService updateRxBeacons::](v8, "updateRxBeacons::", 0, 0);
      -[WCM_WiFiService updateRxBeaconPer](v8, "updateRxBeaconPer");
      -[WCM_WiFiService setRSSI:](v8, "setRSSI:", v6);
      -[WCM_WiFiService setSNR:](v8, "setSNR:", v7);
    }
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager:Empty message received"));
  }
}

- (void)handleCellularLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FT Handover Manager received Cellular link metrics"));
  if (-[WRM_FT_HandoverManager handoverEvaluationRequired](self, "handoverEvaluationRequired"))
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
}

- (void)updateRSSITh:(int64_t)a3
{
  if ((unint64_t)(a3 + 79) >= 0xFFFFFFFFFFFFFFF7)
    -[WRM_iRATConfig updateFaceTimeRSSITh:](self->miRATConfig, "updateFaceTimeRSSITh:");
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  xpc_object_t value;
  id v6;
  __objc2_class **p_superclass;
  uint64_t uint64;
  const char *v9;
  size_t count;
  size_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t int64;
  __objc2_class **v17;
  WRM_Mobility_Context *v18;
  size_t v19;
  xpc_object_t xarray;
  id v21;

  byte_10027112C = 1;
  dword_100271130 = 0;
  byte_10027112E = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("HandoverManager: handleIWLANRadioLinkPreferenceRequest."));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v6 = a3;
  p_superclass = WRM_SCService.superclass;
  uint64 = xpc_dictionary_get_uint64(v6, "kClientType");
  v21 = -[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  if ((uint64 - 1) >= 0x15)
  {
    v9 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v9 = "ClientCoreMediaStreaming";
  }
  else
  {
    v9 = off_100202CB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Message received from client %d(%s) "), uint64, v9);
  xarray = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(xarray);
  objc_msgSend(v21, "removeAllMobilityContextsFromList");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Removing all contexts from iRAT client."));
  v19 = count;
  if (count)
  {
    if (!self->mWiFi)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    v11 = 0;
    do
    {
      v12 = xpc_array_get_value(xarray, v11);
      v13 = xpc_dictionary_get_uint64(v12, "kWRMApplicationType");
      v14 = xpc_dictionary_get_uint64(v12, "kWRMDesiredLinkQoS");
      v15 = xpc_dictionary_get_uint64(v12, "kWRMDesiredBandwidth");
      objc_msgSend(p_superclass + 279, "logLevel:message:", 29, CFSTR("%s: Record#= %d Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu,Service Status=%llu"), "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", v11, v13, v14, v15, 0);
      if (xpc_dictionary_get_value(v12, "kWRMRSSITh"))
      {
        int64 = xpc_dictionary_get_int64(v12, "kWRMRSSITh");
        objc_msgSend(p_superclass + 279, "logLevel:message:", 29, CFSTR("%s: Enabling AVC test: RSSI: TH: %lld "), "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", int64);
        -[WRM_FT_HandoverManager updateRSSITh:](self, "updateRSSITh:", int64);
      }
      v17 = p_superclass;
      objc_msgSend(p_superclass + 279, "logLevel:message:", 29, CFSTR("%s: AVC RSSI TH1: %lld, RSSI: TH0: %lld "), "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh1](self->miRATConfig, "faceTimeMinActiveWiFiRssiTh1"), -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh0](self->miRATConfig, "faceTimeMinActiveWiFiRssiTh0"));
      v18 = objc_alloc_init(WRM_Mobility_Context);
      -[WRM_Mobility_Context setLinkQoS:](v18, "setLinkQoS:", v14);
      -[WRM_Mobility_Context setBandwidth:](v18, "setBandwidth:", v15);
      -[WRM_Mobility_Context setApplicationType:](v18, "setApplicationType:", v13);
      -[WRM_Mobility_Context activateMobilityContext:](v18, "activateMobilityContext:", 1);
      -[WRM_Mobility_Context setSubscriptionType:](v18, "setSubscriptionType:", 1);
      -[WRM_Mobility_Context setCallState:](v18, "setCallState:", byte_10027112C);
      objc_msgSend(v21, "addMobilityContextToList:", v18);

      p_superclass = v17;
      ++v11;
    }
    while (v19 != v11);
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
    objc_msgSend(v21, "handleLinkPreferenceNotificationInternetDataVoiceVideo:::", 1, self->mCTService, -[WCM_WiFiController wifiService](self->mWiFi, "wifiService"));
    objc_msgSend(v17 + 279, "logLevel:message:", 29, CFSTR("Send Link Preference Notification at connection setup"));
    if ((objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "mobilityStateAwarenessEnabled") & 1) != 0)
    {
      -[WRM_MotionController stopAllAlarms](self->mMotionController, "stopAllAlarms");
      -[WRM_MotionController startMonitoringAlarms](self->mMotionController, "startMonitoringAlarms");
    }
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  WRM_FT_HandoverManager *v5;
  uint64_t uint64;
  __objc2_class **p_superclass;
  const char *v8;
  xpc_object_t value;
  xpc_object_t v10;
  size_t count;
  size_t v12;
  size_t i;
  xpc_object_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  _BOOL4 v20;
  BOOL v21;
  uint64_t v22;
  WRMMetricsiRATFaceTimeHandover *mWrmiRATFaceTimeMetrics;
  const __CFString *v24;
  WRMMetricsiRATFaceTimeHandover *v25;
  BOOL v26;
  int v27;
  int v28;
  WRM_FT_HandoverManager *v29;
  _BYTE v30[128];

  v5 = self;
  objc_msgSend(-[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController", a3, a4), "resetRTPMetrics");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  p_superclass = WRM_SCService.superclass;
  if ((uint64 - 1) >= 0x15)
  {
    v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v8 = "ClientCoreMediaStreaming";
  }
  else
  {
    v8 = off_100202CB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("FaceTime HandoverManager: Message received from client %d(%s)"), uint64, v8);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v10);
  if (count)
  {
    v12 = count;
    v29 = v5;
    for (i = 0; i != v12; ++i)
    {
      v14 = xpc_array_get_value(v10, i);
      v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      v16 = xpc_dictionary_get_uint64(v14, "kWRMFaceTimeReactionType");
      v17 = xpc_dictionary_get_uint64(v14, "kWRMFaceTimeTimeDuration");
      v18 = xpc_dictionary_get_uint64(v14, "kWRMLinkType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: Record#=%d, Application Type=%llu, FaceTimeReactionType=%llu FaceTimeDuration  %d "), "-[WRM_FT_HandoverManager handleSubscribeStatusUpdate::]", i, v15, v16, v17);
    }
    v5 = v29;
    p_superclass = (__objc2_class **)(WRM_SCService + 8);
  }
  else
  {
    LODWORD(v17) = 0;
    v16 = 0;
    v18 = 2;
    v15 = 1;
  }
  v19 = objc_msgSend(objc_msgSend(-[WRM_FT_HandoverManager getiRATClientFromList:](v5, "getiRATClientFromList:", 7), "getMobilityContextFromList:", v15), "getConnectedLinkType");
  if (v16 == 5)
  {
    v20 = 0;
    byte_10027112E = 0;
LABEL_15:
    v21 = 1;
    goto LABEL_16;
  }
  v20 = v16 == 2;
  if (v16 == 2)
    goto LABEL_15;
  if (v16)
    goto LABEL_17;
  v21 = v18 == 1;
LABEL_16:
  byte_10027112A = v21;
LABEL_17:
  if (!-[WCM_WiFiService isWiFiPrimaryInterface](-[WCM_WiFiController wifiService](v5->mWiFi, "wifiService"), "isWiFiPrimaryInterface"))goto LABEL_23;
  if (v20)
  {
    v22 = 1;
  }
  else
  {
    if (v16 - 3 > 2)
      goto LABEL_23;
    v22 = 0;
  }
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "notifyDuplicationState:", v22);
LABEL_23:
  mWrmiRATFaceTimeMetrics = v5->mWrmiRATFaceTimeMetrics;
  mWrmiRATFaceTimeMetrics->faceTimeAction = v16;
  v24 = CFSTR("Cellular");
  mWrmiRATFaceTimeMetrics->facetimeDelay = v17;
  if (v19 == 1)
    v24 = CFSTR("WiFi");
  mWrmiRATFaceTimeMetrics->iRATRecommendation = &v24->isa;
  -[WRM_MetricsService getReasonStr::](v5->mMetrics, "getReasonStr::", v5->mReasons, v30);
  v5->mWrmiRATFaceTimeMetrics->iRATRecommendationReason = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v30);
  -[WRM_FT_HandoverManager feedAWDMetricsWiFiStats](v5, "feedAWDMetricsWiFiStats");
  -[WRM_FT_HandoverManager feedAWDMetricsCellularStats](v5, "feedAWDMetricsCellularStats");
  v25 = v5->mWrmiRATFaceTimeMetrics;
  v26 = v25->alertedMode || v5->mInAleratedState;
  v25->alertedMode = v26;
  v27 = v16 == 3 || v20;
  if (v27 == 1)
  {
    v28 = dword_100271130;
    v25->counter = dword_100271130;
    dword_100271130 = v28 + 1;
    objc_msgSend(-[WRM_MetricsService getAWDService](v5->mMetrics, "getAWDService"), "submitMetricsFaceTimeHandover");
    objc_msgSend(p_superclass + 279, "logLevel:message:", 29, CFSTR("FT HandoverManager: submitMetricsFaceTimeHandover"));
  }
  objc_msgSend(p_superclass + 279, "logLevel:message:", 29, CFSTR("FT HandoverManager: handleSubscribeStatusUpdate."));
}

- (void)handleLinkPrefSubscribeIDS:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;
  id v7;
  const char *v8;
  xpc_object_t v9;
  size_t count;
  size_t v11;
  size_t v12;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  WRM_Mobility_Context *v16;
  WRM_FT_HandoverManager *v17;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS WiFi-Cell Link Eval Manager: handleLinkPrefSubscribe."));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  v7 = -[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  if ((uint64 - 1) >= 0x15)
  {
    v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v8 = "ClientCoreMediaStreaming";
  }
  else
  {
    v8 = off_100202CB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Message received from client %d(%s)"), uint64, v8);
  v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v9);
  if (count)
  {
    v11 = count;
    v17 = self;
    objc_msgSend(v7, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Removing all contexts from iRAT client."));
    v12 = 0;
    v13 = 2;
    do
    {
      v14 = xpc_array_get_value(v9, v12);
      v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v14, "kWRMLinkType"))
        v13 = xpc_dictionary_get_uint64(v14, "kWRMLinkType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: Record#= %d Application Type=%llu"), "-[WRM_FT_HandoverManager handleLinkPrefSubscribeIDS:]", v12, v15);
      v16 = objc_alloc_init(WRM_Mobility_Context);
      -[WRM_Mobility_Context setApplicationType:](v16, "setApplicationType:", v15);
      -[WRM_Mobility_Context setSubscriptionType:](v16, "setSubscriptionType:", 1);
      -[WRM_Mobility_Context setConnectedLinkType:](v16, "setConnectedLinkType:", v13);
      -[WRM_Mobility_Context activateMobilityContext:](v16, "activateMobilityContext:", 1);
      objc_msgSend(v7, "addMobilityContextToList:", v16);

      ++v12;
    }
    while (v11 != v12);
    goto LABEL_13;
  }
  if (-[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist"))
  {
    v17 = self;
    objc_msgSend(v7, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Removing all contexts from iRAT client."));
LABEL_13:
    -[WRM_FT_HandoverManager evaluateHandover](v17, "evaluateHandover");
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Ignoring un-subscribe message from a client for which subscription does not exist"));
}

- (void)handleGetMetrcisMessage:(id)a3
{
  uint64_t uint64;
  const char *v5;
  NSObject *mQueue;
  _QWORD block[5];

  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    v5 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v5 = "ClientCoreMediaStreaming";
  }
  else
  {
    v5 = off_100202CB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s Message received from client %d(%s) "), "-[WRM_FT_HandoverManager handleGetMetrcisMessage:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D1D8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleSubscribeStatusUpdateIDS:(id)a3 :(BOOL)a4
{
  uint64_t uint64;
  const char *v7;
  xpc_object_t value;
  xpc_object_t v9;
  size_t count;
  size_t v11;
  size_t i;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v7 = "ClientCoreMediaStreaming";
  }
  else
  {
    v7 = off_100202CB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS WiFi versus Cell Link Eval Mgr: Message received from client %d(%s)"), uint64, v7);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v9);
  if (count)
  {
    v11 = count;
    v15 = uint64;
    for (i = 0; i != v11; ++i)
    {
      v13 = xpc_array_get_value(v9, i);
      v14 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("%s: Record#=%d, IDS Application Type=%llu, IDS Connected Link Type=%llu"), "-[WRM_FT_HandoverManager handleSubscribeStatusUpdateIDS::]", i, v14, xpc_dictionary_get_uint64(v13, "kWRMLinkType"));
    }
    uint64 = v15;
  }
  else
  {
    v14 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS Link Eval Manager: handleSubscribeStatusUpdate."));
  if (objc_msgSend(-[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64), "getMobilityContextFromList:", v14))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IDS Link Eval Manager: handleSubscribeStatusUpdate."));
    -[WRM_IdsMetricsController resetIDSMetrics](self->mIDSMetricsController, "resetIDSMetrics");
  }
}

- (void)configureRTPMetricsReporting
{
  WRM_AVConferenceController *mAVConferenceController;

  mAVConferenceController = self->mAVConferenceController;
  if (mAVConferenceController)
  {
    -[WRM_AVConferenceController configureFaceTimeRTPMetricsReporting](mAVConferenceController, "configureFaceTimeRTPMetricsReporting");
    -[WRM_AVConferenceController resetPeriodicRTPStats](self->mAVConferenceController, "resetPeriodicRTPStats");
  }
}

- (void)handleRTPEvent:(id)a3
{
  id v5;

  v5 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  objc_msgSend(v5, "handleRTPEvent:", a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("handleRTPEvent, poor connection =%lld, mediaStall = %lld"), objc_msgSend(v5, "poorConnectionDetected"), objc_msgSend(v5, "mediaStallDetected"));
  -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  objc_msgSend(v5, "setPoorConnectionDetected:", 0);
  objc_msgSend(v5, "setMediaStallDetected:", 0);
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  id v5;

  v5 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  objc_msgSend(v5, "handlePeriodicRTPMetrics:", a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Rx periodic Average RTP packet loss=%lld"), objc_msgSend(v5, "avgRxPktLoss"));
  -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
  objc_msgSend(v5, "resetRTPMetrics");
}

- (BOOL)isWiFiLinkActive
{
  return 0;
}

- (int64_t)getSNRHysteresis
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t result;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  switch(-[WRM_MotionController getMobilityState](self->mMotionController, "getMobilityState"))
  {
    case 0:
      v4 = CFSTR("Device motion: STATIONARY");
      goto LABEL_7;
    case 1:
      v5 = CFSTR("Device motion: WALKING");
      goto LABEL_9;
    case 2:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Device motion: RUNNING"));
      return (int64_t)objc_msgSend(v3, "snrHysterisisRunning");
    case 3:
      v4 = CFSTR("Device motion: VEHICULAR");
      goto LABEL_7;
    case 4:
      v5 = CFSTR("Device motion: PEDESTRIAN");
LABEL_9:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v5);
      result = (int64_t)objc_msgSend(v3, "snrHysterisisWalking");
      break;
    default:
      v4 = CFSTR("Device motion: UNKNOWN");
LABEL_7:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v4);
      result = 0;
      break;
  }
  return result;
}

- (int64_t)getRSSIHysteresis
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t result;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  switch(-[WRM_MotionController getMobilityState](self->mMotionController, "getMobilityState"))
  {
    case 0:
      v4 = CFSTR("Device motion: STATIONARY");
      goto LABEL_7;
    case 1:
      v5 = CFSTR("Device motion: WALKING");
      goto LABEL_9;
    case 2:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Device  motion: RUNNING"));
      return (int64_t)objc_msgSend(v3, "rssiHysterisisRunning");
    case 3:
      v4 = CFSTR("Device motion: VEHICULAR");
      goto LABEL_7;
    case 4:
      v5 = CFSTR("Device motion: PEDESTRIAN");
LABEL_9:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v5);
      result = (int64_t)objc_msgSend(v3, "rssiHysterisisWalking");
      break;
    default:
      v4 = CFSTR("Device motion: UNKNOWN");
LABEL_7:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v4);
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isWiFiBeaconLossQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  WCM_WiFiService *v7;
  id v8;
  double v9;
  uint64_t v10;
  id v11;

  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService", a3, a4);
  if (!-[WCM_WiFiService isBeaconPerValid](v7, "isBeaconPerValid"))
    return 1;
  v8 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  -[WCM_WiFiService getBeaconPer](v7, "getBeaconPer");
  v10 = (uint64_t)(v9 * 100.0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR(" Beacon PER %lld"), v10);
  if (!a5)
  {
    v11 = objc_msgSend(v8, "minWiFiBeaconPerTh0");
    return (uint64_t)v11 >= v10;
  }
  if (a5 != 1)
    return 1;
  v11 = objc_msgSend(v8, "minWiFiBeaconPerTh1");
  return (uint64_t)v11 >= v10;
}

- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  _BOOL4 v7;
  WCM_WiFiService *v9;
  id v10;
  id v11;
  id v12;

  v7 = a5;
  v9 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService", a3, a4);
  v10 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v11 = -[WCM_WiFiService getCCA](v9, "getCCA");
  if (a6 == 1)
  {
    if (!v7)
    {
      v12 = objc_msgSend(v10, "minIdleWiFiCcaTh1");
      goto LABEL_8;
    }
    return 1;
  }
  if (a6)
    return 1;
  if (v7)
    v12 = objc_msgSend(v10, "minActiveWiFiCcaTh0");
  else
    v12 = objc_msgSend(v10, "minIdleWiFiCcaTh0");
LABEL_8:
  if ((uint64_t)v11 < (uint64_t)v12)
    return 1;
  -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 32);
  return 0;
}

- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  WCM_WiFiService *v7;
  double v8;
  uint64_t v9;
  unsigned int v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  unsigned int v20;
  double v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  char v31;
  char v32;
  WRM_FT_HandoverManager *v34;
  id v35;
  _BOOL4 v38;

  v38 = a6;
  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService", a3);
  v34 = self;
  v35 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  -[WCM_WiFiService getTxPer](v7, "getTxPer");
  v9 = (uint64_t)(v8 * 100.0);
  v10 = -[WCM_WiFiService isTxPerValid](v7, "isTxPerValid");
  -[WCM_WiFiService getTxFail](v7, "getTxFail");
  v12 = (uint64_t)v11;
  -[WCM_WiFiService getFwTxPer](v7, "getFwTxPer");
  v14 = (uint64_t)(v13 * 100.0);
  v15 = -[WCM_WiFiService isFwTxPerValid](v7, "isFwTxPerValid");
  -[WCM_WiFiService getRxRatio](v7, "getRxRatio");
  v17 = v16 * 100.0;
  -[WCM_WiFiService getCumulativeTxPer](v7, "getCumulativeTxPer");
  v19 = (uint64_t)(v18 * 100.0);
  v20 = -[WCM_WiFiService isCumulativeTxPerValid](v7, "isCumulativeTxPerValid");
  -[WCM_WiFiService getCumulativeFwTxPer](v7, "getCumulativeFwTxPer");
  v22 = (uint64_t)(v21 * 100.0);
  v23 = -[WCM_WiFiService isCumulativeFwTxPerValid](v7, "isCumulativeFwTxPerValid");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Actual Tx PER %lld, FW Tx PER %lld TX Fail %lld, RX Ratio=%lf CumTxPER %lld CumFwTxPer %lld"), v9, v14, v12, *(_QWORD *)&v17, v19, v22);
  if (v10)
    v24 = v9;
  else
    v24 = 0;
  if (v15)
    v25 = v14;
  else
    v25 = 0;
  if (v20)
    v26 = v19;
  else
    v26 = 0;
  if (v23)
    v27 = v22;
  else
    v27 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Effective Tx PER %lld, FW Tx PER %lld TX Fail %lld, RX Ratio=%lf CumTxPER %lld CumFwTxPer %lld"), v24, v25, v12, *(_QWORD *)&v17, v26, v27);
  if (v38)
  {
    if ((v10 & 1) == 0 || a4 != 2 && a4 != 1)
      return 1;
    if (!a5)
    {
      v28 = objc_msgSend(v35, "minActiveWiFiTxPktLossRateTh0");
LABEL_35:
      if ((uint64_t)v28 >= v9)
        return 1;
LABEL_33:
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](v34, "updateHandoverReasonCode:", 16);
      return 0;
    }
    if (a5 == 1)
    {
      v28 = objc_msgSend(v35, "minActiveWiFiTxPktLossRateTh1");
      goto LABEL_35;
    }
  }
  else if (((v10 | v15) & 1) != 0)
  {
    if (a5)
    {
      if (a5 != 1)
        return 1;
      v29 = v35;
      v30 = objc_msgSend(v35, "minIdleWiFiTxPktLossRateTh1");
    }
    else
    {
      v29 = v35;
      v30 = objc_msgSend(v35, "minIdleWiFiTxPktLossRateTh0");
    }
    if ((uint64_t)v30 >= v9)
      v31 = v10;
    else
      v31 = 0;
    if ((v31 & 1) != 0)
      return 1;
    v32 = (uint64_t)objc_msgSend(v29, "minIdleWiFiFwTxPktLossRateTh1") >= v14 ? v15 : 0;
    if ((v32 & 1) != 0)
      return 1;
    goto LABEL_33;
  }
  return 1;
}

- (BOOL)canWiFiRadioMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  WCM_WiFiService *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  const __CFString *v16;
  char v18;
  int64_t v19;
  int64_t v20;
  id v21;

  v5 = *(_QWORD *)&a5;
  v21 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v9 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v10 = -[WCM_WiFiService getRSSI](v9, "getRSSI");
  v11 = -[WCM_WiFiService getSNR](v9, "getSNR");
  v12 = -[WCM_WiFiService isWiFiNetworkCaptive](v9, "isWiFiNetworkCaptive");
  v20 = -[WRM_FT_HandoverManager getSNRHysteresis](self, "getSNRHysteresis");
  v19 = -[WRM_FT_HandoverManager getRSSIHysteresis](self, "getRSSIHysteresis");
  v13 = -[WRM_FT_HandoverManager isWiFiArqQualityIndicatorGood::::](self, "isWiFiArqQualityIndicatorGood::::", a3, a4, v5, 0);
  v14 = -[WRM_FT_HandoverManager isWiFiBeaconLossQualityIndicatorGood:::](self, "isWiFiBeaconLossQualityIndicatorGood:::", a3, a4, v5);
  v15 = -[WRM_FT_HandoverManager isWiFiLoadQualityIndicatorGood::::](self, "isWiFiLoadQualityIndicatorGood::::", a3, a4, 0, v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetIdleApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d Beacon Quality =%d Load Quality =%d WiFi Captive Status: %d"), v10, v11, v13, v14, v15, v12);
  if (a4 - 1 >= 2)
  {
    if (a4)
      v16 = CFSTR("canWiFiRadioMeetIdleApplicationRequirements: Application category not supported");
    else
      v16 = CFSTR("canWiFiRadioMeetIdleApplicationRequirements: DATA");
    goto LABEL_15;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetIdleApplicationRequirements: VOICE"));
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_WIFI"));
      if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh1") + v20)
        || (uint64_t)v10 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh1") + v19)
        || ((v15 ^ 1) & 1) != 0
        || ((v14 ^ 1) & 1) != 0
        || v13 != 1)
      {
        if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh1") + v20))
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 4);
        if ((uint64_t)v10 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh1") + v19))
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 8);
        return 0;
      }
      return 1;
    }
    v16 = CFSTR("VOICE: connectedLinkType == NO Context");
LABEL_15:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v16);
    return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_CELLULAR"));
  if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh0") + v20))
    return 0;
  if ((uint64_t)v10 >= (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh0") + v19))
    v18 = v15;
  else
    v18 = 0;
  return v18 & v13 & v14;
}

- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  _BOOL4 v6;

  if (a5 == 1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluating IDS transport metrics: Connected link WiFi, status: %d"), 1);
    v6 = -[WRM_IdsMetricsController isIDSTransportMetricsGoodEnough::](self->mIDSMetricsController, "isIDSTransportMetricsGoodEnough::", 1, 1);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Evaluated IDS transport metrics: Connected link WiFi, status: %d"), v6);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)canWiFiRadioMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  id v9;
  WCM_WiFiService *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int64_t v16;
  int64_t v17;
  int64_t v19;
  const __CFString *v20;
  char v21;
  const __CFString *v22;
  char v23;

  v5 = *(_QWORD *)&a5;
  v9 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v10 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v11 = -[WCM_WiFiService getRSSI](v10, "getRSSI");
  v12 = -[WCM_WiFiService getSNR](v10, "getSNR");
  v13 = -[WRM_FT_HandoverManager isWiFiArqQualityIndicatorGood::::](self, "isWiFiArqQualityIndicatorGood::::", a3, a4, v5, 1);
  v14 = -[WRM_FT_HandoverManager isWiFiBeaconLossQualityIndicatorGood:::](self, "isWiFiBeaconLossQualityIndicatorGood:::", a3, a4, v5);
  v15 = -[WRM_FT_HandoverManager isWiFiLoadQualityIndicatorGood::::](self, "isWiFiLoadQualityIndicatorGood::::", a3, a4, 1, v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetActiveApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d Beacon Quality =%d Load Quality =%d, BW Quality =%d"), v11, v12, v13, v14, v15, -[WRM_FT_HandoverManager isWiFiDataRateIndicatorGoodForFaceTime::](self, "isWiFiDataRateIndicatorGoodForFaceTime::", a4, v5));
  v16 = -[WRM_FT_HandoverManager getSNRHysteresis](self, "getSNRHysteresis");
  v17 = -[WRM_FT_HandoverManager getRSSIHysteresis](self, "getRSSIHysteresis");
  switch(a4)
  {
    case 2uLL:
      v19 = v17;
      v20 = CFSTR("canWiFiRadioMeetActiveApplicationRequirements: VIDEO");
      break;
    case 1uLL:
      v19 = v17;
      v20 = CFSTR("canWiFiRadioMeetActiveApplicationRequirements: VOICE");
      break;
    case 0uLL:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetActiveApplicationRequirements: DATA"));
      return -[WRM_IdsMetricsController isIDSTransportMetricsGoodEnough::](self->mIDSMetricsController, "isIDSTransportMetricsGoodEnough::", v5, 1);
    default:
      v22 = CFSTR("Application category not supported");
      goto LABEL_20;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v20);
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 != 1)
    {
      v22 = CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == No Context");
LABEL_20:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v22);
      return 1;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_WIFI"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("minActiveWiFiSnrTh1 = %lld, faceTimeMinActiveWiFiRssiTh1 =%lld"), objc_msgSend(v9, "minActiveWiFiSnrTh1"), objc_msgSend(v9, "faceTimeMinActiveWiFiRssiTh1"));
    if ((uint64_t)v12 >= (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh1") + v16))
    {
      v21 = (uint64_t)v11 >= (uint64_t)((char *)objc_msgSend(v9, "faceTimeMinActiveWiFiRssiTh1") + v19) ? v13 : 0;
      if ((v21 & 1) != 0)
        return 1;
    }
    if ((uint64_t)v12 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh1") + v16))
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 4);
    if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v9, "faceTimeMinActiveWiFiRssiTh1") + v19))
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 8);
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_CELLULAR"));
  if ((uint64_t)v12 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh0") + v16))
    return 0;
  if ((uint64_t)v11 >= (uint64_t)((char *)objc_msgSend(v9, "faceTimeMinActiveWiFiRssiTh0") + v19))
    v23 = v15;
  else
    v23 = 0;
  return v23 & v13;
}

- (BOOL)isWiFiVoIPQualityGoodEnough
{
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v4;
  uint64_t v5;
  double v6;
  double v7;
  unsigned __int8 v8;
  double v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  double v19;
  id v20;
  id v21;
  int v22;
  unsigned __int8 v23;

  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    v4 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
    v5 = -[WCM_WiFiService getRSSI](v4, "getRSSI");
    -[WCM_WiFiService getRxRatio](v4, "getRxRatio");
    v7 = v6;
    v8 = -[WCM_WiFiService isRxRatioValid](v4, "isRxRatioValid");
    -[WCM_WiFiService getTxPer](v4, "getTxPer");
    v10 = (uint64_t)(v9 * 100.0);
    v11 = -[WCM_WiFiService isTxPerValid](v4, "isTxPerValid");
    v12 = -[WCM_WiFiService getCCA](v4, "getCCA");
    v13 = v11 ^ 1;
  }
  else
  {
    v5 = 0;
    v8 = 0;
    v10 = 0;
    v12 = 0;
    v7 = 0.0;
    v13 = 1;
  }
  v14 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  if (!v14)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isWiFiVoIPQualityGoodEnough: ptrAVConferenceController == NULL"));
    objc_msgSend(0, "resetRTPMetrics");
    objc_msgSend(0, "resetCumulativeRTPMetrics");
    v17 = 0;
LABEL_11:
    objc_msgSend(v17, "resetPeriodicRTPStats");
    return 1;
  }
  v15 = v14;
  if ((byte_10027112A & 1) == 0)
  {
    v16 = CFSTR("isWiFiVoIPQualityGoodEnough: Call not on WiFI");
    goto LABEL_10;
  }
  if (self->mDiscardRTPMetrics)
  {
    v16 = CFSTR("isWiFiVoIPQualityGoodEnough:discard RTP metrics ");
LABEL_10:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v16);
    objc_msgSend(v15, "resetRTPMetrics");
    objc_msgSend(v15, "resetCumulativeRTPMetrics");
    v17 = v15;
    goto LABEL_11;
  }
  -[NSDate timeIntervalSinceNow](self->mLatteContextStartedTimer, "timeIntervalSinceNow");
  if (self->mTimeSinceLatteContextStarted - v19 < 3.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isWiFiVoIPQualityGoodEnough: ignoring inital RTP metrics to avoid false alarm"));
    return 1;
  }
  v20 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Rx Pkt loss: %lld, nominal buffer delay %lld"), objc_msgSend(v15, "rxPktLoss"), objc_msgSend(v15, "nominalJitterBufferDelay"));
  v21 = objc_msgSend(v15, "rxPktLoss");
  if (v21 < objc_msgSend(v20, "faceTimeHandoverRxPktLossThreshold")
    || v12 <= 87
    && v5 >= -75
    && (v10 < 6 ? (v22 = 1) : (v22 = v13), v7 >= 0.3 ? (v23 = v8) : (v23 = 0), v22 == 1 && (v23 & 1) == 0))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isWiFiVoIPQualityGoodEnough: true"));
    byte_100270F60 = 0;
    return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isWiFiVoIPQualityGoodEnough: false"));
  byte_100270F60 = 1;
  -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 256);
  return 0;
}

- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  id v8;

  v8 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController", a3);
  if (a4 - 1 >= 2)
  {
    if (a4)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Application category not supported"));
  }
  else if (a5 == 1 && objc_msgSend(v8, "rtpMetricsEnabled"))
  {
    return -[WRM_FT_HandoverManager isWiFiVoIPQualityGoodEnough](self, "isWiFiVoIPQualityGoodEnough");
  }
  return 1;
}

- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  _BOOL4 v9;

  v5 = *(_QWORD *)&a5;
  v9 = -[WRM_FT_HandoverManager canWiFiRadioMeetActiveApplicationRequirements:::](self, "canWiFiRadioMeetActiveApplicationRequirements:::");
  if (v9)
  {
    v9 = -[WRM_FT_HandoverManager canWiFiTransportMeetActiveApplicationRequirements:::](self, "canWiFiTransportMeetActiveApplicationRequirements:::", a3, a4, v5);
    if (v9)
    {
      v9 = -[WRM_FT_HandoverManager isMovingAverageUplinkAudioQualityOfCurrentCallGood:](self, "isMovingAverageUplinkAudioQualityOfCurrentCallGood:", v5);
      if (v9)
      {
        v9 = -[WRM_FT_HandoverManager isMovingAverageDownlinkAudioQualityOfCurrentCallGood:](self, "isMovingAverageDownlinkAudioQualityOfCurrentCallGood:", v5);
        if (v9)
        {
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x10000);
          LOBYTE(v9) = 1;
        }
      }
    }
  }
  return v9;
}

- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  _BOOL4 v9;

  v5 = *(_QWORD *)&a5;
  v9 = -[WRM_FT_HandoverManager canWiFiRadioMeetIdleApplicationRequirements:::](self, "canWiFiRadioMeetIdleApplicationRequirements:::");
  if (v9)
  {
    v9 = -[WRM_FT_HandoverManager canWiFiTransportMeetIdleApplicationRequirements:::](self, "canWiFiTransportMeetIdleApplicationRequirements:::", a3, a4, v5);
    if (v9)
    {
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x10000);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)updateSlotInfoCTServie
{
  -[WRM_CTService setActiveSlot:](self->mCTService, "setActiveSlot:", -[WRM_CTService getUserDataPreferredSlot](self->mCTService, "getUserDataPreferredSlot"));
}

- (void)registerForCTNotifications
{
  WRM_CTService *v3;

  if (self->mCTService)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("CT already registered."));
  }
  else
  {
    v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    self->mCTService = v3;
    -[WRM_CTService initCoreTelephonyClient](v3, "initCoreTelephonyClient");
  }
  -[WRM_CTService tiggerEnhanceLQMConfiguration](self->mCTService, "tiggerEnhanceLQMConfiguration");
}

- (void)registerForSCNotifications
{
  if (self->mSCService)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("SC already registered."));
  else
    self->mSCService = (WRM_SCService *)+[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton");
}

- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(BOOL)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v12;
  unsigned int v13;
  id v14;
  double v15;
  id v16;
  unsigned int v17;
  _BOOL8 v18;
  _BOOL8 mDeviceAttachedWithCellularNetwork;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const __CFString *v36;
  unsigned int v38;
  const __CFString *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v7 = *(_QWORD *)&a6;
  v8 = a5;
  v12 = -[WRM_FT_HandoverManager getCTService](self, "getCTService", a3, a4, a5, *(_QWORD *)&a6, a7);
  v13 = objc_msgSend(v12, "getServingCellType");
  v14 = -[WRM_FT_HandoverManager getSCService](self, "getSCService");
  objc_msgSend(v12, "getServingCellFilteredMeasurements");
  v44 = (uint64_t)v15;
  v16 = objc_msgSend(v12, "getCurrentSignalBars");
  self->mDeviceAttachedWithCellularNetwork = objc_msgSend(v12, "dataAttachedWithCellularNetwork");
  self->mDeviceRegisteredWithCellularNetwork = objc_msgSend(v12, "registeredWithCellularNetwork");
  v17 = objc_msgSend(v12, "cellularDataEnabled");
  v18 = -[WRM_FT_HandoverManager isCellularRadioMetricsGoodEnoughForIMSVoIP::::](self, "isCellularRadioMetricsGoodEnoughForIMSVoIP::::", a3, a4, v7, v8);
  mDeviceAttachedWithCellularNetwork = self->mDeviceAttachedWithCellularNetwork;
  v20 = "UNKNOWN_RADIO ";
  switch(v13)
  {
    case 1u:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d"), v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, "LTE Radio", v17);
      objc_msgSend(v12, "getServingCellRSRP");
      v22 = v21;
      objc_msgSend(v12, "getServingCellSNR");
      v24 = v23;
      objc_msgSend(v12, "getServingCellRSRQ");
      goto LABEL_16;
    case 2u:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d"), v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, "UMTS_RADIO", v17);
      objc_msgSend(v12, "getServingCellECIO");
      v27 = v26;
      objc_msgSend(v12, "getServingCellRSCP");
      v29 = v28;
      v30 = objc_msgSend(v14, "getCellularDataLQM");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("CT RSCP: %ld, QMI RSCP :%lf, QMI ECIO: %lf Data LQM %d"), v44, v29, v27, v30, v42, v43);
      goto LABEL_17;
    case 3u:
      v20 = "CDMA1X_RADIO";
      goto LABEL_10;
    case 4u:
      v20 = "CDMAEVDO";
      goto LABEL_10;
    case 5u:
      v20 = "CDMAHybrid";
      goto LABEL_10;
    case 6u:
      v20 = "eHRPD_RADIO";
      goto LABEL_10;
    case 7u:
      v20 = "TDSCDMA_RADIO";
      goto LABEL_10;
    case 8u:
      v20 = "GSM_RADIO";
      goto LABEL_10;
    case 0xAu:
LABEL_10:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d"), v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, v20, v17);
      goto LABEL_11;
    default:
      v31 = "UNKNOWN_RADIO!!!";
      if (v13 == 9)
        v31 = "N_RADIO";
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d"), v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, v31, v17);
      if (v13 == 9)
      {
        objc_msgSend(v12, "getNrRSRP");
        v22 = v32;
        objc_msgSend(v12, "getNrSNR");
        v24 = v33;
        objc_msgSend(v12, "getNrRSRQ");
LABEL_16:
        v34 = v25;
        v35 = objc_msgSend(v12, "getLteVoiceLQM");
        v30 = objc_msgSend(v14, "getCellularDataLQM");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("CT RSRP: %ld, QMI RSRP:%lf, SNR: %lf, RSRQ:%lf Voice LQM: %d Data LQM %d"), v44, v22, v24, v34, v35, v30);
      }
      else
      {
LABEL_11:
        v30 = objc_msgSend(v14, "getCellularDataLQM");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Data LQM %d"), v30);
      }
LABEL_17:
      if (a4 - 1 >= 2)
      {
        if (a4)
        {
          v40 = CFSTR("Application category not supported");
        }
        else
        {
          if (!self->mDeviceAttachedWithCellularNetwork || v13 == 10)
            v38 = 0;
          else
            v38 = v17;
          if (v30 >= 0x14 && v38)
          {
            v41 = v30;
            v36 = CFSTR("DATA: Data Status:true,LQM: %d");
            goto LABEL_31;
          }
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x20000);
          v40 = CFSTR("DATA: Data Status:false, Cellular Quality BAD");
        }
      }
      else
      {
        if (v18 && self->mDeviceRegisteredWithCellularNetwork)
        {
          v36 = CFSTR(" VOICE: FaceTimeVoIPStatus:true");
LABEL_31:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v36, v41);
          -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 512);
          return 1;
        }
        v40 = CFSTR(" VOICE: FaceTimeVoIPStatus:false");
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v40);
      return 0;
  }
}

- (void)feedAWDMetricsWiFiStats
{
  WCM_WiFiService *v3;
  float v4;
  float v5;
  double v6;
  double v7;

  v3 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  self->mWrmiRATFaceTimeMetrics->wifiRssi = (int)-[WCM_WiFiService getRSSI](v3, "getRSSI");
  self->mWrmiRATFaceTimeMetrics->wifiSNR = (int)-[WCM_WiFiService getSNR](v3, "getSNR");
  -[WCM_WiFiService getRxPhyRate](v3, "getRxPhyRate");
  self->mWrmiRATFaceTimeMetrics->wifiRxPhyRate = (int)v4;
  -[WCM_WiFiService getTxPhyRate](v3, "getTxPhyRate");
  self->mWrmiRATFaceTimeMetrics->wifiTxPhyRate = (int)v5;
  self->mWrmiRATFaceTimeMetrics->cca = -[WCM_WiFiService getCCA](v3, "getCCA");
  self->mWrmiRATFaceTimeMetrics->qbssLoad = -[WCM_WiFiService getChannelUtlization](v3, "getChannelUtlization");
  -[WCM_WiFiService getRxRatio](v3, "getRxRatio");
  self->mWrmiRATFaceTimeMetrics->wifiRxRetry = (int)(v6 * 100.0);
  -[WCM_WiFiService getTxPer](v3, "getTxPer");
  self->mWrmiRATFaceTimeMetrics->wifiTxPER = (int)(v7 * 100.0);
  self->mWrmiRATFaceTimeMetrics->captiveNetworks = -[WCM_WiFiService isWiFiNetworkCaptive](v3, "isWiFiNetworkCaptive");
  self->mWrmiRATFaceTimeMetrics->stationCount = -[WCM_WiFiService getConnectedStationCount](v3, "getConnectedStationCount");
}

- (void)feedAWDMetricsCellularStatsWithUUID:(id)a3
{
  objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "feedCellularMetricsWithUUID:", a3);
}

- (void)feedAWDMetricsCellularStats
{
  id v3;
  id v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  WRMMetricsiRATFaceTimeHandover *mWrmiRATFaceTimeMetrics;
  double v13;
  double v14;
  WRMMetricsiRATFaceTimeHandover *v15;
  const __CFString *v16;
  double v17;
  double v18;

  v3 = -[WRM_FT_HandoverManager getCTService](self, "getCTService");
  v4 = -[WRM_FT_HandoverManager getSCService](self, "getSCService");
  v5 = objc_msgSend(v3, "getCTDataIndictor");
  v6 = objc_msgSend(v3, "isVoiceLQMValid");
  if (v6)
    v6 = objc_msgSend(v3, "getLteVoiceLQM");
  self->mWrmiRATFaceTimeMetrics->voiceLQM = v6;
  v7 = objc_msgSend(v4, "isDataLQMValid");
  if (v7)
    v7 = objc_msgSend(v4, "getCellularDataLQM");
  self->mWrmiRATFaceTimeMetrics->dataLQM = v7;
  v8 = objc_msgSend(v3, "dataAttachedWithCellularNetwork");
  self->mDeviceAttachedWithCellularNetwork = v8;
  if (v8)
    v8 = objc_msgSend(v3, "getCurrentSignalBars");
  self->mWrmiRATFaceTimeMetrics->signalBar = v8;
  switch(objc_msgSend(v3, "getServingCellType"))
  {
    case 1u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)CFSTR("LTE");
      objc_msgSend(v3, "getServingCellRSRP");
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v9;
      objc_msgSend(v3, "getServingCellRSRQ");
      self->mWrmiRATFaceTimeMetrics->cellRsrq = (int)v10;
      objc_msgSend(v3, "getServingCellSNR");
      mWrmiRATFaceTimeMetrics = self->mWrmiRATFaceTimeMetrics;
      mWrmiRATFaceTimeMetrics->cellSnr = (int)v11;
      mWrmiRATFaceTimeMetrics->isNSAMode = v5 <= 0x12 && ((1 << v5) & 0x70100) != 0;
      return;
    case 2u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)CFSTR("UMTS");
      objc_msgSend(v3, "getServingCellRSCP");
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v13;
      objc_msgSend(v3, "getServingCellECIO");
      goto LABEL_19;
    case 3u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("CDMA1X");
      goto LABEL_21;
    case 4u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("CDMAEVDO");
      goto LABEL_21;
    case 5u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("CDMAHybrid");
      goto LABEL_21;
    case 6u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("eHRPD_RADIO");
      goto LABEL_21;
    case 7u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("TDSCDMA");
      goto LABEL_21;
    case 8u:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("GSM");
      goto LABEL_21;
    case 9u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)CFSTR("N_RADIO");
      objc_msgSend(v3, "getNrRSRP");
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v17;
      objc_msgSend(v3, "getNrRSRQ");
      self->mWrmiRATFaceTimeMetrics->cellRsrq = (int)v18;
      objc_msgSend(v3, "getNrSNR");
LABEL_19:
      self->mWrmiRATFaceTimeMetrics->cellSnr = (int)v14;
      return;
    default:
      v15 = self->mWrmiRATFaceTimeMetrics;
      v16 = CFSTR("UNKNOWN");
LABEL_21:
      v15->ratType = &v16->isa;
      return;
  }
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  objc_msgSend(objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", *(_QWORD *)&a3), "sendMessage:", a4);
}

- (void)initHandoverReasonCode
{
  self->mReasons = 0;
}

- (void)updateHandoverReasonCode:(int)a3
{
  self->mReasons |= a3;
}

- (void)resetActiveCallEvaluationMetrics
{
  double v3;
  id v4;
  WCM_WiFiController *mWiFi;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("resetActiveCallEvaluationMetrics"));
  -[NSDate timeIntervalSinceNow](self->mAudioEvaluationTimer, "timeIntervalSinceNow");
  self->mTimeSinceAudioEvaluationStarted = v3;
  v4 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  mWiFi = self->mWiFi;
  if (mWiFi && (mWiFi = -[WCM_WiFiController wifiService](mWiFi, "wifiService")) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("resetActiveCallEvaluationMetrics: ptrWiFiService==NULL"));
  }
  else
  {
    -[WCM_WiFiController resetCumulativeCounters](mWiFi, "resetCumulativeCounters");
    objc_msgSend(v4, "resetCumulativeRTPMetrics");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("resetActiveCallEvaluationMetrics: exit"));
}

- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5
{
  objc_msgSend(objc_msgSend(-[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", *(_QWORD *)&a4), "getMobilityContextFromList:", a5), "setPingPongAvoidanceTimerMultiplier:", a3);
}

- (void)evaluateActiveCallQuality
{
  double v3;
  double v4;
  double v5;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  BOOL v16;

  -[NSDate timeIntervalSinceNow](self->mAudioEvaluationTimer, "timeIntervalSinceNow");
  v4 = v3;
  v5 = self->mTimeSinceAudioEvaluationStarted - v3;
  if (v5 <= 30.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateActiveCallQuality: not evaluating audio quality, call too short duration:%lf"), *(_QWORD *)&v5);
    self->mTimeSinceAudioEvaluationStarted = v4;
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateActiveCallQuality: evaluating audio quality, call duration:%lf"), *(_QWORD *)&v5);
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v7 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (v7)
  {
LABEL_7:
    -[WCM_WiFiService getCumulativeTxPer](v7, "getCumulativeTxPer");
    v9 = (uint64_t)(v8 * 100.0);
    v10 = -[WCM_WiFiService getRSSI](v7, "getRSSI");
    v11 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
    v12 = (uint64_t)objc_msgSend(v11, "averagedNominalJitterBufferDelay");
    objc_msgSend(v11, "movAvgRxPktLoss");
    v14 = (uint64_t)v13;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateActiveCallQuality: Avg RSSI: %lld CumTX PER: %lld, AVG Nominal Jitter Buffer:%lld, RTP pkt loss:%lld "), v10, v9, v12, (uint64_t)v13);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Handover Manager: Checking active call Quality evaluation criteria"));
    v16 = v12 <= 1000 && v14 <= 20 && v9 <= 20;
    if (!v16 && v10 >= -65)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Handover Manager: Audio Quality was good"));
    -[WRM_FT_HandoverManager evaluateHandover](self, "evaluateHandover");
    goto LABEL_17;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateActiveCallQuality: ptrWiFiService==NULL"));
LABEL_17:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("evaluateActiveCallQuality: exit"));
}

- (BOOL)isMovingAverageUplinkAudioQualityOfCurrentCallGood:(int)a3
{
  id v5;
  void *v6;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v8;
  BOOL v9;
  const __CFString *v10;
  double v11;
  unint64_t v12;
  unsigned int v13;
  id v14;

  v5 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (a3 == 1)
  {
    v6 = v5;
    mWiFi = self->mWiFi;
    if (mWiFi)
    {
      v8 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
      if (!v8)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageUplinkAudioQualityOfCurrentCallGood: ptrWiFiService==NULL"));
        v9 = 1;
LABEL_10:
        v10 = CFSTR("isMovingAverageUplinklinkAudioQualityOfCurrentCallGood exit");
        goto LABEL_11;
      }
    }
    else
    {
      v8 = 0;
    }
    -[WCM_WiFiService getMovingAverageTxPer](v8, "getMovingAverageTxPer");
    v12 = (unint64_t)(v11 * 100.0);
    v13 = -[WCM_WiFiService isMovingAverageTxPerValid](v8, "isMovingAverageTxPerValid");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageUplinkAudioQualityOfCurrentCallGood: TX PER (Mov Avg): %lld, Moving Avg Valid:%d"), v12, v13);
    v14 = objc_msgSend(v6, "faceTimeMinActiveWiFiAvgTxPktLossRateTh");
    v9 = 1;
    v10 = CFSTR("isMovingAverageUplinklinkAudioQualityOfCurrentCallGood exit");
    if (v13 && (unint64_t)v14 < v12)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Handover Manager: Moving average uplink audio quality was bad"));
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 32);
      v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v9 = 1;
    v10 = CFSTR("isMovingAverageUplinkAudioQualityOfCurrentCallGood: returned");
  }
LABEL_11:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v10);
  return v9;
}

- (BOOL)isVideoQualityGood:(int)a3
{
  id v3;
  float v4;
  uint64_t v5;
  float v6;

  v3 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController", *(_QWORD *)&a3);
  objc_msgSend(v3, "totalVideoPacketLossRate");
  v5 = (uint64_t)(float)(v4 * 100.0);
  objc_msgSend(v3, "deltaVideoErasure");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isVideoQualityGood, Vid erasure supported: %d, Delta videoErasure: %d , Video packet loss: %d"), objc_msgSend(v3, "videoErasureSupported"), (uint64_t)v6, v5);
  return 1;
}

- (BOOL)isMovingAverageDownlinkAudioQualityOfCurrentCallGood:(int)a3
{
  id v5;
  id v6;
  const __CFString *v7;
  _BOOL8 v8;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  double v15;
  id v16;
  double v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  float v21;
  float v22;
  float v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  double v28;
  double v29;
  float v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  int v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;

  v5 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  v6 = -[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if ((byte_10027112A & 1) == 0)
  {
    v7 = CFSTR("isMovingAverageDownlinkAudioQualityOfCurrentCallGood: Call not on WiFI");
    goto LABEL_5;
  }
  if (self->mDiscardRTPMetrics)
  {
    v7 = CFSTR("isMovingAverageDownlinkAudioQualityOfCurrentCallGood: discard RTP metrics");
LABEL_5:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v7);
    objc_msgSend(v5, "resetRTPMetrics");
    objc_msgSend(v5, "resetCumulativeRTPMetrics");
    objc_msgSend(v5, "resetPeriodicRTPStats");
LABEL_6:
    LOBYTE(v8) = 1;
    return v8;
  }
  v10 = v6;
  if (!self->mWiFi)
  {
    v27 = objc_msgSend(0, "wifiService");
    v11 = (uint64_t)objc_msgSend(v27, "getRSSI");
    objc_msgSend(v27, "getRxRatio");
    v15 = v28;
    v12 = objc_msgSend(v27, "isRxRatioValid");
    objc_msgSend(v27, "getTxPer");
    v13 = (uint64_t)(v29 * 100.0);
    v14 = objc_msgSend(v27, "isTxPerValid") ^ 1;
    if (a3)
      goto LABEL_10;
LABEL_23:
    objc_msgSend(v5, "primaryAudioPacketLossRate");
    v31 = (uint64_t)v30;
    objc_msgSend(v5, "primaryVideoPacketLossRate");
    v33 = (uint64_t)v32;
    v8 = v31 < 1 && v33 < 1;
    if (v8)
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x10000);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageDownlinkAudioQualityOfCurrentCallGood: returned, Audio Quality good : %lld, WiFi Audo Loss Rate: %lld, WiFi Video Loss Rate: %lld"), v8, v31, v33);
    return v8;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 1;
  v15 = 0.0;
  if (!a3)
    goto LABEL_23;
LABEL_10:
  if (a3 != 1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageDownlinkAudioQualityOfCurrentCallGood: returned"));
    goto LABEL_6;
  }
  v40 = v12;
  v16 = objc_msgSend(v5, "movAvgNominalJitterBufferDelay");
  objc_msgSend(v5, "movAvgRxPktLoss");
  v18 = (uint64_t)v17;
  v19 = -[WRM_FT_HandoverManager isVideoQualityGood:](self, "isVideoQualityGood:", 1);
  v20 = objc_msgSend(v5, "poorConnectionDetected");
  self->mWrmiRATFaceTimeMetrics->isPCDetected = objc_msgSend(v5, "poorConnectionDetected");
  self->mWrmiRATFaceTimeMetrics->isStallDetected = objc_msgSend(v5, "mediaStallDetected");
  objc_msgSend(v5, "primaryAudioPacketLossRate");
  self->mWrmiRATFaceTimeMetrics->audioErasure = (float)(v21 * 100.0);
  objc_msgSend(v5, "deltaVideoErasure");
  self->mWrmiRATFaceTimeMetrics->videoErasure = v22;
  objc_msgSend(v5, "totalVideoPacketLossRate");
  self->mWrmiRATFaceTimeMetrics->facetimePacketLoss = (float)(v23 * 100.0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageDownlinkAudioQualityOfCurrentCallGood: Moving Avg RTP packet loss:%lld, Mov Jitter Buffer Delay: %lld, video good : %lld, Bad connection deteted: %lld"), v18, v16, v19, v20);
  if ((uint64_t)objc_msgSend(v10, "faceTimeHandoverAvgRxPktLossThreshold") < v18
    || v20 && (v11 < -75 || (v13 < 6 ? (v35 = 1) : (v35 = v14), v15 >= 0.3 ? (v36 = v40) : (v36 = 0), v35 != 1 || v36)))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Handover Manager: Moving average audio quality was bad or poor connection detected"));
    v24 = objc_msgSend(v5, "mediaStallDetected");
    if (v24)
      v25 = 64;
    else
      v25 = 1;
    if ((v24 & 1) == 0 && ((v19 ^ 1) & 1) == 0)
    {
      if (objc_msgSend(v5, "poorConnectionDetected", v25))
        v26 = 128;
      else
        v26 = 16;
      -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", v26);
      v25 = 256;
    }
    -[WRM_FT_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", v25);
    LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: exit"), v37, v38, v39);
  return v8;
}

- (void)toggleFastLQMReport:(BOOL)a3
{
  _BOOL4 v3;
  WCM_WiFiService *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  v4 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  if (byte_10027112B != 1)
  {
    if (!v3)
      return;
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005F82C;
    v5[3] = &unk_100201E38;
    v6 = v3;
    v5[4] = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)resetActiveCallTimer
{
  double v3;

  -[NSDate timeIntervalSinceNow](self->mLatteContextStartedTimer, "timeIntervalSinceNow");
  self->mTimeSinceLatteContextStarted = v3;
}

- (unsigned)faceTimeCallType
{
  id v2;
  id v3;

  v2 = -[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController");
  v3 = objc_msgSend(v2, "callType");
  if (v3 != (id)2)
  {
    if (objc_msgSend(v2, "callType") == (id)4)
    {
      LOBYTE(v3) = 2;
    }
    else
    {
      v3 = objc_msgSend(v2, "callType");
      if (v3 != (id)1)
        LOBYTE(v3) = objc_msgSend(v2, "callType") == (id)3;
    }
  }
  return v3;
}

- (BOOL)isAVCFaceTimeCallActive
{
  return byte_10027112C;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = objc_msgSend(objc_msgSend(a3, "calls"), "count");
  if ((unint64_t)v6 > 1)
  {
    v7 = 1;
LABEL_26:
    self->mDiscardRTPMetrics = v7;
    goto LABEL_27;
  }
  if (v6 != (id)1)
  {
    v7 = 0;
    goto LABEL_26;
  }
  v8 = objc_msgSend(a3, "calls");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v9)
    goto LABEL_27;
  v10 = v9;
  v11 = *(_QWORD *)v17;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
      if ((objc_msgSend(v13, "isOutgoing") & 1) == 0
        && (objc_msgSend(v13, "hasConnected") & 1) == 0
        && !objc_msgSend(v13, "hasEnded")
        || (objc_msgSend(v13, "hasConnected") & 1) != 0)
      {
        v14 = 0;
LABEL_17:
        self->mDiscardRTPMetrics = v14;
        goto LABEL_18;
      }
      if ((objc_msgSend(v13, "isOnHold") & 1) != 0
        || objc_msgSend(v13, "isOutgoing")
        && (objc_msgSend(v13, "hasConnected") & 1) == 0
        && (objc_msgSend(v13, "hasEnded") & 1) == 0)
      {
        v14 = 1;
        goto LABEL_17;
      }
LABEL_18:
      v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v10 = v15;
  }
  while (v15);
LABEL_27:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("callObserver: discard RTP metrics: %d"), self->mDiscardRTPMetrics);
}

- (void)initCallNotifications
{
  NSNotificationCenter *v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("TUCallCenterCallStatusChangedNotification register"));
  +[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance");
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "handleCallNotification:", TUCallCenterCallStatusChangedNotification, 0);
}

- (void)handleCallNotification:(id)a3
{
  id v5;
  id v6;
  WRMMetricsiRATFaceTimeHandover *mWrmiRATFaceTimeMetrics;
  unsigned int v8;
  WRMMetricsiRATFaceTimeHandover *v9;
  int v10;
  id v11;
  unsigned int v12;
  NSObject *mQueue;
  _QWORD block[6];
  id v15;
  unsigned int v16;
  id location;

  v5 = objc_msgSend(a3, "name");
  if (objc_msgSend(v5, "isEqualToString:", TUCallCenterCallStatusChangedNotification))
  {
    v6 = objc_msgSend(a3, "object");
    if (objc_msgSend(v6, "status") == 6
      && ((objc_msgSend(objc_msgSend(v6, "provider"), "isTelephonyProvider") & 1) != 0
       || objc_msgSend(objc_msgSend(v6, "provider"), "isFaceTimeProvider")))
    {
      mWrmiRATFaceTimeMetrics = self->mWrmiRATFaceTimeMetrics;
      if (mWrmiRATFaceTimeMetrics)
      {
        mWrmiRATFaceTimeMetrics->callType = 0;
        if (objc_msgSend(objc_msgSend(v6, "provider"), "isFaceTimeProvider"))
        {
          v8 = objc_msgSend(v6, "isVideo");
          v9 = self->mWrmiRATFaceTimeMetrics;
          if (v8)
            v10 = 2;
          else
            v10 = 3;
          goto LABEL_19;
        }
        if (objc_msgSend(objc_msgSend(v6, "provider"), "isTelephonyProvider"))
        {
          if (objc_msgSend(v6, "providerContext")
            && objc_msgSend(objc_msgSend(objc_msgSend(v6, "providerContext"), "objectForKeyedSubscript:", CFSTR("kCallSubType")), "isEqualToString:", CFSTR("kCallSubTypeVoLTE")))
          {
            goto LABEL_18;
          }
          if (objc_msgSend(v6, "providerContext")
            && objc_msgSend(objc_msgSend(objc_msgSend(v6, "providerContext"), "objectForKeyedSubscript:", CFSTR("kCallSubType")), "isEqualToString:", CFSTR("kCallSubTypeWifi")))
          {
            v9 = self->mWrmiRATFaceTimeMetrics;
            v10 = 5;
LABEL_19:
            v9->callType = v10;
            goto LABEL_20;
          }
          if (objc_msgSend(v6, "providerContext")
            && objc_msgSend(objc_msgSend(objc_msgSend(v6, "providerContext"), "objectForKeyedSubscript:", CFSTR("kCallSubType")), "isEqualToString:", CFSTR("kCallSubTypeVoNR")))
          {
LABEL_18:
            v9 = self->mWrmiRATFaceTimeMetrics;
            v10 = 4;
            goto LABEL_19;
          }
          if (objc_msgSend(v6, "providerContext")
            && objc_msgSend(objc_msgSend(objc_msgSend(v6, "providerContext"), "objectForKeyedSubscript:", CFSTR("kCallSubType")), "isEqualToString:", CFSTR("kCallSubTypeTelephony")))
          {
            v9 = self->mWrmiRATFaceTimeMetrics;
            v10 = 1;
            goto LABEL_19;
          }
        }
LABEL_20:
        if (objc_msgSend(v6, "localSenderIdentityUUID"))
          v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(objc_msgSend(v6, "localSenderIdentityUUID"), "UUIDString"));
        else
          v11 = 0;
        v12 = objc_msgSend(v6, "disconnectedReason");
        objc_initWeak(&location, self);
        mQueue = self->mQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10005FDA8;
        block[3] = &unk_100202BF0;
        objc_copyWeak(&v15, &location);
        block[4] = v11;
        block[5] = self;
        v16 = v12;
        dispatch_async(mQueue, block);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
}

@end
