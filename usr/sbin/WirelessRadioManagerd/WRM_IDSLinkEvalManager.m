@implementation WRM_IDSLinkEvalManager

- (BOOL)doesIRATClientSubscriptionContextExist
{
  NSMutableArray *miRATClientContexts;
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  BOOL v16;
  const __CFString *v17;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v4 = -[NSMutableArray count](self->miRATClientContexts, "count");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: iRAT client count:%d."), "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", v4);
  if (!v4)
  {
    v17 = CFSTR(" No iRAT client available.");
LABEL_24:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v17);
    goto LABEL_25;
  }
  v19 = miRATClientContexts;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->miRATClientContexts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "getHandoverContexts");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: iRAT client Context count:%d."), "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", objc_msgSend(v9, "count"));
        if (objc_msgSend(v9, "count"))
        {
          v16 = 1;
          miRATClientContexts = v19;
          goto LABEL_26;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  miRATClientContexts = v19;
  v10 = -[NSMutableArray count](-[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts"), "count");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: iRAT Proximity client count:%d."), "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", v10);
  if (!v10)
  {
    v17 = CFSTR("No iRAT proximity client available");
    goto LABEL_24;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = -[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts");
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v12)
  {
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  v13 = *(_QWORD *)v21;
  while (2)
  {
    for (j = 0; j != v12; j = (char *)j + 1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
      if (v15
        && objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), "mTerminusContext")
        && (objc_msgSend(objc_msgSend(v15, "mTerminusContext"), "mTerminusIsRegistered") & 1) != 0)
      {
        v16 = 1;
        goto LABEL_26;
      }
    }
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    v16 = 0;
    if (v12)
      continue;
    break;
  }
LABEL_26:
  objc_sync_exit(miRATClientContexts);
  return v16;
}

+ (id)WRM_IDSLinkEvalManagerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067478;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271170 != -1)
    dispatch_once(&qword_100271170, block);
  return (id)qword_100271178;
}

- (BOOL)needWiFiLQM
{
  _BOOL4 v2;
  const char *v3;

  v2 = -[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist");
  v3 = "NO";
  if (v2)
    v3 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: needWiFiLQM? %s "), "-[WRM_IDSLinkEvalManager needWiFiLQM]", v3);
  return v2;
}

- (unint64_t)getMovingAvgBTRssi
{
  return -[WCM_BTController getMovingAvgBTRssi](self->mBT, "getMovingAvgBTRssi");
}

- (unint64_t)getBtTxPer
{
  double v2;

  -[WCM_BTController getBtTxPer](self->mBT, "getBtTxPer");
  return (unint64_t)(v2 * 100.0);
}

- (unint64_t)getBtRxPer
{
  return 0;
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: internalMsg: %@"), "-[WRM_IDSLinkEvalManager(privateFunctions) handleInternalMessage:]", a3);
  uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  if (uint64 == 1040)
    goto LABEL_4;
  if (uint64 == 1003)
  {
    byte_100270FA9 = 0;
    byte_100270FA8 = 1;
LABEL_4:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("handleInternalMessage:evaluateBTWiFiLink"));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("handleInternalMessage:default"));
  -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](self, "evaluateBTWiFiLink");
}

- (int)getBTLQMScore
{
  return self->mCurrentBTLQMScore;
}

- (BOOL)canBTMeetTerminusRequirement
{
  return -[WRM_IDSLinkEvalManager getBTLQMScore](self, "getBTLQMScore") != 1;
}

- (BOOL)canWiFiRadioMeetTerminusRequirementsForCompanionLink:(id)a3
{
  id v5;
  WCM_WiFiService *v6;
  unsigned int v7;
  id v8;
  id v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v22;
  unsigned int v23;

  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v6 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v7 = -[WCM_WiFiService isLSMWiFiQualityGood](v6, "isLSMWiFiQualityGood");
  v23 = -[WRM_IDSP2PController isRemoteWiFiGood](self->mIDSP2PController, "isRemoteWiFiGood");
  v8 = -[WCM_WiFiService getRSSI](v6, "getRSSI");
  v9 = -[WCM_WiFiService getSNR](v6, "getSNR");
  v22 = -[WCM_WiFiService isWiFiConnected](v6, "isWiFiConnected");
  v10 = -[WRM_IDSLinkEvalManager canBTMeetTerminusRequirement](self, "canBTMeetTerminusRequirement");
  v11 = (id)-[WCM_WiFiService getBadVideoCounter](v6, "getBadVideoCounter");
  v12 = (id)-[WCM_WiFiService getGoodVideoCounter](v6, "getGoodVideoCounter");
  if (!objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "mCompanionWifiLinkIsRecommended"))
  {
    if ((uint64_t)v9 > (uint64_t)objc_msgSend(v5, "idsMinWiFiSnrTh0"))
    {
      v13 = objc_msgSend(v5, "idsMinWiFiRssiTh0");
      goto LABEL_6;
    }
LABEL_12:
    v14 = v11;
    v16 = v7;
    v18 = v8;
    v19 = 0;
    goto LABEL_13;
  }
  if ((uint64_t)v9 <= (uint64_t)objc_msgSend(v5, "idsMinWiFiSnrTh1"))
    goto LABEL_12;
  v13 = objc_msgSend(v5, "idsMinWiFiRssiTh1");
LABEL_6:
  v14 = v11;
  v15 = (int)v12 < (int)v11;
  v16 = v7;
  if (v15)
    v17 = 0;
  else
    v17 = v7;
  v18 = v8;
  if ((uint64_t)v8 > (uint64_t)v13)
    v19 = v17;
  else
    v19 = 0;
LABEL_13:
  if ((v22 & v23) == 1)
    v20 = v19 | v10 ^ 1;
  else
    v20 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: RSSI %lld, SNR %lld isWifi available %d isAssociated %d, LSM Quality: %d, isCompanionWiFiGood: %d, infra WiFi good: %d, BT good: %d,badCounter: %d, goodCounter:%d, wifi entry criteria met: %d"), "-[WRM_IDSLinkEvalManager(privateFunctions) canWiFiRadioMeetTerminusRequirementsForCompanionLink:]", v18, v9, -[WCM_WiFiService isWiFiPrimaryInterface](v6, "isWiFiPrimaryInterface"), v22, v16, v23, v20, v10, v14, v12, v19);
  return v20;
}

- (BOOL)canWiFiRadioMeetTerminusRequirements:(id)a3
{
  id v5;
  WCM_WiFiService *v6;
  unsigned int v7;
  id v8;
  id v9;
  double v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  char v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;

  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v6 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v7 = -[WCM_WiFiService isLSMWiFiQualityGood](v6, "isLSMWiFiQualityGood");
  v8 = -[WCM_WiFiService getRSSI](v6, "getRSSI");
  v9 = -[WCM_WiFiService getSNR](v6, "getSNR");
  -[WCM_WiFiService getAdjustedBeaconPer](v6, "getAdjustedBeaconPer");
  v11 = v10;
  v12 = -[WCM_WiFiService isWiFiConnected](v6, "isWiFiConnected");
  v13 = -[WCM_WiFiService isBeaconSchedValid](v6, "isBeaconSchedValid");
  if (v12)
  {
    v14 = v13;
    if ((uint64_t)v9 > (uint64_t)objc_msgSend(v5, "dataMinWifiSnrTh0")
      && (uint64_t)v8 > (uint64_t)objc_msgSend(v5, "dataMinWifiRssiTh0"))
    {
      if (v14)
      {
        if (v11 * 100.0 <= (double)(uint64_t)objc_msgSend(v5, "dataMinWifiBeaconPerTh0"))
          v15 = v7;
        else
          v15 = 0;
        if ((v15 & 1) != 0)
          goto LABEL_9;
      }
      else if ((v7 & 1) != 0)
      {
LABEL_9:
        v16 = 1;
        goto LABEL_12;
      }
    }
  }
  v16 = 0;
LABEL_12:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: RSSI %lld, SNR %lld Beacon PER %llf isWifi available %d isAssociated %d,LSM Quality: %d, direct WiFi good:%d"), "-[WRM_IDSLinkEvalManager(privateFunctions) canWiFiRadioMeetTerminusRequirements:]", v8, v9, *(_QWORD *)&v11, -[WCM_WiFiService isWiFiPrimaryInterface](v6, "isWiFiPrimaryInterface"), v12, v7, v16);
  v17 = objc_msgSend(a3, "mTerminusContext");
  if (v12)
  {
    objc_msgSend(v17, "setWifiRSSI:", v8);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setWifiSNR:", v9);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setWifiCCA:", -[WCM_WiFiService getCCA](v6, "getCCA"));
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setBeaconPER:", (int)(v11 * 100.0));
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setNwType:", (char)-[WCM_WiFiService getPointOfInterest](v6, "getPointOfInterest"));
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setLsmRecommendationBe:", -[WCM_WiFiService getBEDecision](v6, "getBEDecision"));
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setExpectedThroughputVIBE:", -[WCM_WiFiService getTxThroughputVI](v6, "getTxThroughputVI"));
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setPacketLifetimeVIBE:", -[WCM_WiFiService getLifeTimeVI](v6, "getLifeTimeVI"));
    v18 = -[WCM_WiFiService getTxLossRateVI](v6, "getTxLossRateVI");
  }
  else
  {
    objc_msgSend(v17, "setWifiRSSI:", -600);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setWifiSNR:", -600);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setWifiCCA:", 0);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setBeaconPER:", 0);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setNwType:", 3);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setLsmRecommendationBe:", -1);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setExpectedThroughputVIBE:", 0);
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setPacketLifetimeVIBE:", 0);
    v18 = 0;
  }
  objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "setPacketLossRateVIBE:", v18);
  return v16;
}

- (BOOL)canWiFiRadioMeetMinRequirements
{
  id v3;
  WCM_WiFiService *v4;
  id v5;
  id v6;
  unsigned int v7;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v4 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v5 = -[WCM_WiFiService getRSSI](v4, "getRSSI");
  v6 = -[WCM_WiFiService getSNR](v4, "getSNR");
  v7 = -[WCM_WiFiService isWiFiConnected](v4, "isWiFiConnected");
  if (v7)
    LOBYTE(v7) = (uint64_t)v6 > (uint64_t)objc_msgSend(v3, "dataMinWifiSnrTh1")
              && (uint64_t)v5 > (uint64_t)objc_msgSend(v3, "dataMinWifiRssiTh1");
  return v7;
}

- (BOOL)canWiFiRadioMeetIDSRequirements:(unint64_t)a3 :(int)a4
{
  uint64_t v4;
  id v7;
  WCM_WiFiService *v8;
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  char v13;

  v4 = *(_QWORD *)&a4;
  v7 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v8 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v9 = -[WCM_WiFiService getRSSI](v8, "getRSSI");
  v10 = -[WCM_WiFiService getSNR](v8, "getSNR");
  v11 = -[WRM_IDSLinkEvalManager isWiFiArqQualityIndicatorGoodForIDS::](self, "isWiFiArqQualityIndicatorGoodForIDS::", a3, v4);
  v12 = -[WRM_IDSLinkEvalManager isWiFiDataRateIndicatorGoodForIDS::](self, "isWiFiDataRateIndicatorGoodForIDS::", a3, v4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("RSSI %lld, SNR %lld ARQ Quality Indicator %d, Data Rate Quality Indictor %d"), v9, v10, v11, v12);
  if ((_DWORD)v4 == 3)
    return (uint64_t)v10 >= (uint64_t)objc_msgSend(v7, "idsMinWiFiSnrTh0")
        && (uint64_t)v9 >= (uint64_t)objc_msgSend(v7, "idsMinWiFiRssiTh0")
        && ((v11 ^ 1) & 1) == 0
        && v12 == 1;
  if ((uint64_t)v10 < (uint64_t)objc_msgSend(v7, "idsMinWiFiSnrTh1"))
    return 0;
  if ((uint64_t)v9 >= (uint64_t)objc_msgSend(v7, "idsMinWiFiRssiTh1"))
    v13 = v11;
  else
    v13 = 0;
  return v12 & v13;
}

- (BOOL)isWiFiArqQualityIndicatorGoodForIDS:(unint64_t)a3 :(int)a4
{
  uint64_t v4;
  id v6;
  WCM_WiFiService *v7;
  double v8;
  unint64_t v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  uint64_t v13;
  const char *v14;

  v4 = *(_QWORD *)&a4;
  v6 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3), "getiRATConfigController");
  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  -[WCM_WiFiService getMovingAverageTxPer](v7, "getMovingAverageTxPer");
  v9 = (unint64_t)(v8 * 100.0);
  v10 = -[WCM_WiFiService isMovingAverageTxPerValid](v7, "isMovingAverageTxPerValid");
  -[WCM_WiFiService getTxPer](v7, "getTxPer");
  v12 = v11 * 100.0;
  v13 = (uint64_t)v12;
  v14 = "Not BLUETOOTH";
  if ((_DWORD)v4 == 2)
    v14 = "BLUETOOTH";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Moving Avg Tx PER %lld, Tx PER %lld,connectedLinkType: %d, Link: %s"), v9, (uint64_t)v12, v4, v14);
  if ((_DWORD)v4 == 3)
    return (uint64_t)objc_msgSend(v6, "idsMinAvgWiFiTxPktLossRateTh0") >= v13;
  if ((unint64_t)objc_msgSend(v6, "idsMinAvgWiFiTxPktLossRateTh1") > v9)
    return 1;
  return v10 ^ 1;
}

- (BOOL)isWiFiDataRateIndicatorGoodForIDS:(unint64_t)a3 :(int)a4
{
  id v6;
  WCM_WiFiService *v7;
  unsigned int v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  float v20;
  const char *v21;
  id v22;
  const char *v23;
  id v25;
  id v26;

  v6 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3), "getiRATConfigController");
  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v8 = -[WCM_WiFiService isQBSSLoadValid](v7, "isQBSSLoadValid");
  -[WCM_WiFiService getCalculatedAvailableRxPhyBandwidth](v7, "getCalculatedAvailableRxPhyBandwidth");
  v10 = v9;
  -[WCM_WiFiService getCalculatedAvailableTxPhyBandwidth](v7, "getCalculatedAvailableTxPhyBandwidth");
  v12 = v11;
  v13 = v11;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WIFI Throughput Estimation, Calculated Rx PHY Rate: %.2f, Calculated TX Rate: %.2f"), v10, v11);
  if (v8)
  {
    LODWORD(v14) = 1151500288;
    *(float *)&v15 = v10;
    -[WCM_WiFiService getL3Bandwidth::](v7, "getL3Bandwidth::", v14, v15);
    v17 = v16;
    LODWORD(v18) = 1151500288;
    *(float *)&v19 = v12;
    -[WCM_WiFiService getL3Bandwidth::](v7, "getL3Bandwidth::", v18, v19);
    v12 = v20;
    v21 = "WIFI";
    if (a4 == 2)
      v21 = "BLUETOOTH";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WIFI Throughput Estimation using QBSS load, Calculated L3 Rx PHY BW: %.2f, Calculated L3 TX PHY BW: %.2f, Recommended Link:%s"), v17, v20, v21);
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        v12 = v12 + v12;
        v22 = objc_msgSend(v6, "idsMinWiFiThroughputTh1");
        return v12 >= (float)(uint64_t)v22;
      }
      if (v17 < (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiThroughputTh1"))
        return 0;
      v26 = objc_msgSend(v6, "idsMinWiFiThroughputTh1");
      return v12 >= (float)(uint64_t)v26;
    }
    if (v17 >= (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiThroughputTh0"))
      return 1;
    v25 = objc_msgSend(v6, "idsMinWiFiThroughputTh0");
  }
  else
  {
    v23 = "WIFI";
    if (a4 == 2)
      v23 = "BLUETOOTH";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WIFI rate Estimation without QBSS load, Effective Rx Phy Rate: %.2f, Effective Tx Phy Rate: %.2f, Recommended Link: %s"), v10, *(_QWORD *)&v13, v23);
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        v22 = objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh1");
        return v12 >= (float)(uint64_t)v22;
      }
      if (v10 < (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh1"))
        return 0;
      v26 = objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh1");
      return v12 >= (float)(uint64_t)v26;
    }
    if (v10 >= (float)(uint64_t)objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh0"))
      return 1;
    v25 = objc_msgSend(v6, "idsMinWiFiEffectivePhyRateTh0");
  }
  return v12 >= (float)(uint64_t)v25;
}

- (BOOL)canWiFiTransportMeetIDSApplicationRequirements:(unint64_t)a3 :(int)a4 :(int)a5
{
  id v8;
  WRM_IdsMetricsController *mIDSMetricsController;
  double v10;
  double v11;
  unsigned int v12;
  double v13;
  double v14;
  unsigned int v15;
  double v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  BOOL result;
  char v31;
  char v32;
  unsigned int v33;
  void *v34;
  int v35;
  id v36;

  v8 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3), "getiRATConfigController");
  mIDSMetricsController = self->mIDSMetricsController;
  if (!mIDSMetricsController)
    return 1;
  v35 = a5;
  v34 = v8;
  v36 = (id)-[WRM_IdsMetricsController getRTT](mIDSMetricsController, "getRTT");
  -[WRM_IdsMetricsController getTxPer](self->mIDSMetricsController, "getTxPer");
  v11 = v10 * 100.0;
  v12 = -[WRM_IdsMetricsController getTxPerValid](self->mIDSMetricsController, "getTxPerValid");
  -[WRM_IdsMetricsController getAnticipiatedTxPer](self->mIDSMetricsController, "getAnticipiatedTxPer");
  v14 = v13 * 100.0;
  v15 = -[WRM_IdsMetricsController getAnticipiatedTxPerValid](self->mIDSMetricsController, "getAnticipiatedTxPerValid");
  -[WRM_IdsMetricsController getTxPerAnticipatedMovAvg](self->mIDSMetricsController, "getTxPerAnticipatedMovAvg");
  v17 = v16 * 100.0;
  v18 = -[WRM_IdsMetricsController getTxPerAnticipatedMovAvgValid](self->mIDSMetricsController, "getTxPerAnticipatedMovAvgValid");
  v19 = -[WRM_IdsMetricsController getAvgTxPDUSize](self->mIDSMetricsController, "getAvgTxPDUSize");
  v20 = -[WRM_IdsMetricsController getAvgRxPDUSize](self->mIDSMetricsController, "getAvgRxPDUSize");
  -[WRM_IdsMetricsController evaluateDLThroughput](self->mIDSMetricsController, "evaluateDLThroughput");
  v22 = v21;
  -[WRM_IdsMetricsController evaluateULThroughput](self->mIDSMetricsController, "evaluateULThroughput");
  v24 = v23;
  v25 = -[WRM_IdsMetricsController getRTTMovAvg](self->mIDSMetricsController, "getRTTMovAvg");
  -[WRM_IdsMetricsController getTxPerMovAvg](self->mIDSMetricsController, "getTxPerMovAvg");
  v27 = v26 * 100.0;
  v28 = -[WRM_IdsMetricsController getAvgTxPDUSizeMovAvg](self->mIDSMetricsController, "getAvgTxPDUSizeMovAvg");
  v29 = -[WRM_IdsMetricsController getAvgRxPDUSizeMovAvg](self->mIDSMetricsController, "getAvgRxPDUSizeMovAvg");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Ant PER: %.2f,  Ant PER Valid: %d, Ant Mov PER: %.2f, Ant Mov PER Valid:%d"), *(_QWORD *)&v14, v15, *(_QWORD *)&v17, v18);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Metrics, RTT: %d, M_avg RTT: %d, TX PER: %.2f, Tx PER Valid: %d, M_avg TX PER: %.2f, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f"), v36, v25, *(_QWORD *)&v11, v12, *(_QWORD *)&v27, v20, v29, v22, v19, v28, *(_QWORD *)&v24);
  result = 1;
  if (a4 == 1 && v35 != 3 && v24 < 1000.0)
  {
    if ((uint64_t)objc_msgSend(v34, "idsWiFiMinRttTh1") <= (int)v36)
      return 0;
    v31 = v14 >= (double)(uint64_t)objc_msgSend(v34, "idsWiFiMinPerTh1") ? v15 : 0;
    if ((v31 & 1) != 0)
      return 0;
    v32 = v17 >= (double)(uint64_t)objc_msgSend(v34, "idsMovAvgWiFiMinPerTh1") ? v18 : 0;
    if ((v32 & 1) != 0)
      return 0;
    v33 = v11 >= (double)(uint64_t)objc_msgSend(v34, "idsAvgWiFiMinPerTh1") ? v12 : 0;
    return v33 != 1;
  }
  return result;
}

- (BOOL)canWiFiMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v9 = -[WRM_IDSLinkEvalManager canWiFiRadioMeetIDSRequirements::](self, "canWiFiRadioMeetIDSRequirements::");
  if (v9)
    LOBYTE(v9) = -[WRM_IDSLinkEvalManager canWiFiTransportMeetIDSApplicationRequirements:::](self, "canWiFiTransportMeetIDSApplicationRequirements:::", a3, v6, v5);
  return v9;
}

- (BOOL)canBTMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5
{
  id v8;
  WRM_IdsMetricsController *mIDSMetricsController;
  id v10;
  double v11;
  double v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  BOOL result;
  unsigned int v23;

  v8 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3), "getiRATConfigController");
  mIDSMetricsController = self->mIDSMetricsController;
  if (!mIDSMetricsController)
    return 1;
  v10 = (id)-[WRM_IdsMetricsController getRTT](mIDSMetricsController, "getRTT");
  -[WRM_IdsMetricsController getTxPer](self->mIDSMetricsController, "getTxPer");
  v12 = v11 * 100.0;
  v13 = -[WRM_IdsMetricsController getTxPerValid](self->mIDSMetricsController, "getTxPerValid");
  v14 = -[WRM_IdsMetricsController getAvgTxPDUSize](self->mIDSMetricsController, "getAvgTxPDUSize");
  v15 = -[WRM_IdsMetricsController getAvgRxPDUSize](self->mIDSMetricsController, "getAvgRxPDUSize");
  -[WRM_IdsMetricsController evaluateDLThroughput](self->mIDSMetricsController, "evaluateDLThroughput");
  v17 = v16;
  -[WRM_IdsMetricsController evaluateDLThroughput](self->mIDSMetricsController, "evaluateDLThroughput");
  v19 = v18;
  v20 = -[WRM_IdsMetricsController getRTTMovAvg](self->mIDSMetricsController, "getRTTMovAvg");
  -[WRM_IdsMetricsController getTxPerMovAvg](self->mIDSMetricsController, "getTxPerMovAvg");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Metrics, RTT: %d, M_avg RTT: %d, TX PER: %.2f, M_avg TX PER: %.2f, Tx PER Valid: %d, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f"), v10, v20, *(_QWORD *)&v12, v13, v21 * 100.0, v15, -[WRM_IdsMetricsController getAvgRxPDUSizeMovAvg](self->mIDSMetricsController, "getAvgRxPDUSizeMovAvg"), v17, v14, -[WRM_IdsMetricsController getAvgTxPDUSizeMovAvg](self->mIDSMetricsController, "getAvgTxPDUSizeMovAvg"), v19);
  result = 1;
  if (a4 == 3 && a5 != 1)
  {
    if ((uint64_t)objc_msgSend(v8, "idsBTMinRttTh1") <= (int)v10)
      return 0;
    v23 = v12 >= (double)(uint64_t)objc_msgSend(v8, "idsBTMinPerTh1") ? v13 : 0;
    return v23 != 1;
  }
  return result;
}

- (void)handleBTLQMEval:(id)a3
{
  dispatch_time_t v4;
  NSObject *mQueueTerminus;
  _QWORD block[5];

  v4 = dispatch_time(0, 5000000000);
  mQueueTerminus = self->mQueueTerminus;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000656E0;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_after(v4, mQueueTerminus, block);
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64;
  xpc_object_t value;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s:Recevied message: %lld"), "-[WRM_IDSLinkEvalManager(privateFunctions) handleSessionNotification:]", uint64);
  if (uint64 > 413)
  {
    if (uint64 > 599)
    {
      if (uint64 == 600)
      {
        -[WRM_IDSLinkEvalManager handlaIDSMetrics:](self, "handlaIDSMetrics:", a3);
      }
      else if (uint64 == 1000)
      {
        value = xpc_dictionary_get_value(a3, "kMessageArgs");
        -[WRM_IDSLinkEvalManager handleInternalMessage:](self, "handleInternalMessage:", value);
      }
    }
    else if (uint64 == 414)
    {
      -[WRM_IDSLinkEvalManager handleTerminusSubscribeStatusUpdate:](self, "handleTerminusSubscribeStatusUpdate:", a3);
    }
    else if (uint64 == 421)
    {
      -[WRM_IDSLinkEvalManager handleBTLQMEval:](self, "handleBTLQMEval:", a3);
    }
  }
  else if (uint64 > 402)
  {
    if (uint64 == 403)
    {
      -[WRM_IDSLinkEvalManager handleSubscribeStatusUpdate::](self, "handleSubscribeStatusUpdate::", a3, 1);
    }
    else if (uint64 == 413)
    {
      -[WRM_IDSLinkEvalManager handleTerminusLinkPrefSubscribe:](self, "handleTerminusLinkPrefSubscribe:", a3);
    }
  }
  else if (uint64 == 103)
  {
    -[WRM_IDSLinkEvalManager handleWiFiStateChaneEvents:](self, "handleWiFiStateChaneEvents:", a3);
  }
  else if (uint64 == 402)
  {
    -[WRM_IDSLinkEvalManager handleLinkPrefSubscribe:](self, "handleLinkPrefSubscribe:", a3);
  }
}

- (void)handleTerminusLinkPrefSubscribe:(id)a3
{
  NSObject *mQueueTerminus;
  _QWORD v4[6];

  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065950;
  v4[3] = &unk_100201B18;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(mQueueTerminus, v4);
}

- (void)handleLinkPrefSubscribe:(id)a3
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
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  WRM_Mobility_Context *v17;
  WRM_IDSLinkEvalManager *v18;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Eval Manager: handleLinkPrefSubscribe."));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  v7 = -[WRM_IDSLinkEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  if ((uint64 - 1) >= 0x15)
  {
    v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v8 = "ClientCoreMediaStreaming";
  }
  else
  {
    v8 = off_100202FB0[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Message received from client %d(%s) "), uint64, v8);
  v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v9);
  byte_100270FA8 = 0;
  if (count)
  {
    v11 = count;
    v18 = self;
    objc_msgSend(v7, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Removing all contexts from iRAT client."));
    v12 = 0;
    v13 = 0;
    v14 = 2;
    do
    {
      v15 = xpc_array_get_value(v9, v12);
      v16 = xpc_dictionary_get_uint64(v15, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v15, "kWRMSubscriptionType"))
        v13 = xpc_dictionary_get_uint64(v15, "kWRMSubscriptionType");
      if (xpc_dictionary_get_value(v15, "kWRMLinkType"))
        v14 = xpc_dictionary_get_uint64(v15, "kWRMLinkType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: Record#= %d Application Type=%llu"), "-[WRM_IDSLinkEvalManager(privateFunctions) handleLinkPrefSubscribe:]", v12, v16);
      v17 = objc_alloc_init(WRM_Mobility_Context);
      -[WRM_Mobility_Context setApplicationType:](v17, "setApplicationType:", v16);
      -[WRM_Mobility_Context setConnectedLinkType:](v17, "setConnectedLinkType:", v14);
      -[WRM_Mobility_Context setSubscriptionType:](v17, "setSubscriptionType:", v13);
      -[WRM_Mobility_Context activateMobilityContext:](v17, "activateMobilityContext:", 1);
      objc_msgSend(v7, "addMobilityContextToList:", v17);

      ++v12;
    }
    while (v11 != v12);
    goto LABEL_15;
  }
  if (-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist"))
  {
    v18 = self;
    objc_msgSend(v7, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Removing all contexts from iRAT client."));
LABEL_15:
    -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](v18, "evaluateBTWiFiLink");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Send IDS Notification at connection setup"));
    -[WCM_WiFiController toggleWiFiLQMIfNeeded:](v18->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_IDSLinkEvalManager needWiFiLQM](v18, "needWiFiLQM"));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Ignoring un-subscribe message from a client for which subscription does not exist"));
}

- (void)handleTerminusSubscribeStatusUpdate:(id)a3
{
  NSObject *mQueueTerminus;
  _QWORD v4[6];

  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065E84;
  v4[3] = &unk_100201B18;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(mQueueTerminus, v4);
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  uint64_t uint64;
  __objc2_class **p_superclass;
  const char *v8;
  xpc_object_t value;
  size_t count;
  size_t v11;
  size_t v12;
  BOOL v13;
  BOOL v14;
  __objc2_class **v15;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  void *v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  WRM_IDSLinkEvalManager *v31;
  xpc_object_t xarray;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

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
    v8 = off_100202FB0[(int)uint64 - 1];
  }
  v30 = uint64;
  v31 = self;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Eval Mgr: Message received from client %d(%s)"), uint64, v8);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xarray = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(xarray);
  if (count)
  {
    v11 = count;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = p_superclass;
      v16 = xpc_array_get_value(xarray, v12);
      v17 = xpc_dictionary_get_uint64(v16, "kWRMApplicationType");
      v18 = xpc_dictionary_get_uint64(v16, "kWRMLinkType");
      if (xpc_dictionary_get_value(v16, "kWRMConnected"))
        v14 = xpc_dictionary_get_uint64(v16, "kWRMConnected") != 0;
      if (xpc_dictionary_get_value(v16, "kWRMNearByOverBT"))
        v13 = xpc_dictionary_get_uint64(v16, "kWRMNearByOverBT") != 0;
      p_superclass = v15;
      if (v18 >= 3)
      {
        v19 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if ((_DWORD)v18 == 3)
          v19 = "WRM_IWLAN_BLUETOOTH";
      }
      else
      {
        v19 = off_100202EF8[(int)v18];
      }
      objc_msgSend(v15 + 279, "logLevel:message:", 27, CFSTR("%s: Record#=%d, IDS Application Type=%llu, IDS Connected Link Type=%llu (%s) isConnected %d, isGizmoNearbyOverBt %d"), "-[WRM_IDSLinkEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", v12++, v17, v18, v19, v14, v13);
    }
    while (v11 != v12);
  }
  else
  {
    v17 = 0;
    v14 = 0;
    v13 = 0;
    v18 = 2;
  }
  objc_msgSend(p_superclass + 279, "logLevel:message:", 27, CFSTR("IDS Link Eval Manager: handleSubscribeStatusUpdate."));
  v20 = objc_msgSend(-[WRM_IDSLinkEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", v30), "getMobilityContextFromList:", v17);
  if (v20)
  {
    v21 = v20;
    objc_msgSend(p_superclass + 279, "logLevel:message:", 27, CFSTR("IDS Link Eval Manager: handleSubscribeStatusUpdate."));
    -[WRM_IdsMetricsController resetIDSMetrics](v31->mIDSMetricsController, "resetIDSMetrics");
    objc_msgSend(v21, "setRecommendedLinkType:", v18);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = -[WRM_IDSLinkEvalManager miRATProximityClientContexts](v31, "miRATProximityClientContexts");
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if (v27 && objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "mTerminusContext"))
        {
          objc_msgSend(objc_msgSend(v27, "mTerminusContext"), "setRecommendedLinkType:", v18);
          if ((_DWORD)v18)
          {
            if ((_DWORD)v18 == 2 || (_DWORD)v18 == 3)
            {
              v28 = objc_msgSend(v27, "mTerminusContext");
              v29 = 0;
            }
            else
            {
              v28 = objc_msgSend(v27, "mTerminusContext");
              if (v14)
                v29 = 1;
              else
                v29 = 2;
            }
          }
          else
          {
            v28 = objc_msgSend(v27, "mTerminusContext");
            v29 = 3;
          }
          objc_msgSend(v28, "setMCurrentActiveLink:", v29);
          objc_msgSend(objc_msgSend(v27, "mTerminusContext"), "setIsGizmoNearbyOverBt:", v13);
        }
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v24);
  }
}

- (void)configureIDSMetricsReporting
{
  -[WRM_IdsMetricsController resetIDSMetrics](self->mIDSMetricsController, "resetIDSMetrics");
  -[WRM_IdsMetricsController resetCumulativeIdsMetrics](self->mIDSMetricsController, "resetCumulativeIdsMetrics");
  -[WRM_IdsMetricsController configureIDSMetricsReporting](self->mIDSMetricsController, "configureIDSMetricsReporting");
  -[WRM_IDSP2PController InitService](self->mIDSP2PController, "InitService");
}

- (void)handlaIDSMetrics:(id)a3
{
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v6;
  WCM_WiFiService *v7;
  const __CFString *v8;

  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    v8 = CFSTR("handlaIDSMetrics: WiFi not initialized.");
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v8);
    return;
  }
  v6 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (!v6)
  {
    v8 = CFSTR("handlaIDSMetrics: WiFi service not initialized.");
    goto LABEL_7;
  }
  v7 = v6;
  -[WRM_IdsMetricsController handlePeriodicIDSMetrics:](self->mIDSMetricsController, "handlePeriodicIDSMetrics:", a3);
  if (!-[WCM_WiFiService isWiFiPrimaryInterface](v7, "isWiFiPrimaryInterface"))
    -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](self, "evaluateBTWiFiLink");
}

- (void)sendiRATRecommendationToWatch:(int)a3
{
  const __CFString *v5;
  const __CFString *v6;

  if (objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "p2pAssistanceEnabled"))
  {
    if (!-[WRM_IDSP2PController IsIDSInitDone](self->mIDSP2PController, "IsIDSInitDone"))
      -[WRM_IDSP2PController InitService](self->mIDSP2PController, "InitService");
    v5 = CFSTR("WRM_IWLAN_NOT_INIT");
    if (a3 == 1)
      v5 = CFSTR("WRM_IWLAN_WIFI");
    if (a3 == 3)
      v6 = CFSTR("WRM_IWLAN_BLUETOOTH");
    else
      v6 = v5;
    -[WRM_IDSP2PController WrmSendp2pMessage:MessageBody:withOptions:](self->mIDSP2PController, "WrmSendp2pMessage:MessageBody:withOptions:", CFSTR("BT versus WiFi pref"), v6, 0);
  }
}

- (void)evaluateBTWiFiLink
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  const char *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const __CFString *v27;
  NSMutableArray *obj;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  WRM_IDSLinkEvalManager *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = -[NSMutableArray count](self->miRATClientContexts, "count");
  if (!v3)
  {
    v27 = CFSTR("Evaluate BT-WIFI Link: No IDS client available.");
LABEL_71:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v27);
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Evaluate BT-WIFI: Total number of IDS clients %zu."), v3);
  if (!byte_100270FA8)
  {
    v27 = CFSTR("Do not evaluate WiFi link, LQM not received yet");
    goto LABEL_71;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = self;
  obj = self->miRATClientContexts;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v30)
    return;
  v29 = *(_QWORD *)v41;
  do
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)v41 != v29)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v4);
      v6 = objc_msgSend(v5, "getMyClientType");
      v7 = "ClientCommCenter";
      if (v6 != 1)
      {
        if (v6 - 2 >= 0x14)
        {
          v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if (v6 == 22)
            v7 = "ClientCoreMediaStreaming";
        }
        else
        {
          v7 = off_100202F10[v6 - 2];
        }
      }
      v32 = v4;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("<%s>Evaluate BT-WiFi Link: BEGIN."), v7);
      v31 = v5;
      v8 = objc_msgSend(v5, "getHandoverContexts");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v33 = v8;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v9)
      {
        v10 = v9;
        v35 = *(_QWORD *)v37;
        if (v6 == 22)
          v11 = "ClientCoreMediaStreaming";
        else
          v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
        v12 = (int)(v6 - 2);
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v35)
              objc_enumerationMutation(v33);
            v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v15 = objc_msgSend(v14, "getApplicationType");
            v16 = objc_msgSend(v14, "getConnectedLinkType");
            v17 = objc_msgSend(v14, "getRecommenedLinkType");
            if (objc_msgSend(v14, "getSubscriptionType") == (id)1)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Do not evaluate, WiFi versus BT because subscription is for WiFi versus Cellular, %d"), 0);
              continue;
            }
            v18 = "ClientCommCenter";
            if (v6 != 1)
            {
              v18 = v11;
              if (v12 <= 0x13)
                v18 = off_100202F10[v12];
            }
            if (v15)
            {
              v19 = "CT_VOICE";
              if (v15 != (id)1)
              {
                v19 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v19 = "CT_Th_Call";
              }
            }
            else
            {
              v19 = "CT_DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("<%s>{%s}Evaluate Link: BEGIN."), v18, v19);
            if ((_DWORD)v16 != 3)
              goto LABEL_44;
            if (-[WRM_IDSLinkEvalManager canBTMeetIDSRequirement:::](v34, "canBTMeetIDSRequirement:::", v15, 3, v17))
            {
              objc_msgSend(v14, "getDeltaTimeSinceLastCellularRecommendation");
              v21 = v20 * 1000.0;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("getDeltaTimeSinceLastBTRecommendation: delta time:%lf, effectiveBlockout time:%lld "), v20 * 1000.0, 30000);
              if (v21 < 30000.0)
              {
                v22 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v22 = "CT_Th_Call";
                if (v15 == (id)1)
                  v22 = "CT_VOICE";
                if (!v15)
                  v22 = "CT_DATA";
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("{%s}Skipping link evaluation for client connected on BT link"), v22);
                objc_msgSend(v14, "setLinkPreferenceNotificationRequired:", 0);
                continue;
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS WiFi link evaluation criteria met"));
LABEL_44:
              objc_msgSend(v14, "updatePrevTimeStamp");
              goto LABEL_45;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Continue to evaluate WiFi link: BT link bad"));
LABEL_45:
            if (-[WRM_IDSLinkEvalManager evaluateLink:::](v34, "evaluateLink:::", v15, v16, v17) == 1)
              v23 = 1;
            else
              v23 = 3;
            if ((_DWORD)v23 == objc_msgSend(v14, "getConnectedLinkType"))
            {
              objc_msgSend(v14, "setLinkPreferenceNotificationRequired:", 0);
            }
            else
            {
              objc_msgSend(v14, "setLinkPreferenceNotificationRequired:", 1);
              -[WRM_IdsMetricsController resetIDSMetrics](v34->mIDSMetricsController, "resetIDSMetrics");
              -[WRM_IDSLinkEvalManager sendiRATRecommendationToWatch:](v34, "sendiRATRecommendationToWatch:", v23);
            }
            objc_msgSend(v14, "setConnectedLinkType:", v23);
            v24 = "ClientCommCenter";
            if (v6 != 1)
            {
              v24 = v11;
              if (v12 <= 0x13)
                v24 = off_100202F10[v12];
            }
            if (v15)
            {
              v25 = "CT_VOICE";
              if (v15 != (id)1)
              {
                v25 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v25 = "CT_Th_Call";
              }
            }
            else
            {
              v25 = "CT_DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("<%s>{%s}Evaluate BT-WIFI Link: END."), v24, v25);
            v26 = "ClientCommCenter";
            if (v6 != 1)
            {
              v26 = v11;
              if (v12 <= 0x13)
                v26 = off_100202F10[v12];
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("<%s>Evaluate BT-WiFi Link: END."), v26);
          }
          v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v10);
      }
      objc_msgSend(v31, "handleLinkPreferenceNotificationIDS:", 0);
      v4 = v32 + 1;
    }
    while ((id)(v32 + 1) != v30);
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v30);
}

- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5
{
  uint64_t v5;
  uint64_t v6;
  int v9;
  const char *v10;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v12;
  const __CFString *v13;
  const char *v14;
  const char *v15;
  const char *v16;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (a4 == 1 && byte_100270FA9)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("iRAT restarted, WiFi not yet initalized"));
    v9 = 1;
    v10 = "WIFI";
    goto LABEL_14;
  }
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    v13 = CFSTR("Evaluate link: WiFi not initialized.");
LABEL_12:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v13);
    v9 = 2;
    v10 = "BLUETOOTH";
    goto LABEL_14;
  }
  v12 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (!v12)
  {
    v13 = CFSTR("Evaluate link: WiFi service not initialized.");
    goto LABEL_12;
  }
  v10 = "BLUETOOTH";
  if (-[WCM_WiFiService isWiFiPrimaryInterface](v12, "isWiFiPrimaryInterface"))
  {
    if (-[WRM_IDSLinkEvalManager canWiFiMeetIDSRequirement:::](self, "canWiFiMeetIDSRequirement:::", a3, v6, v5))
    {
      v10 = "WIFI";
      v9 = 1;
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 2;
  }
LABEL_14:
  v14 = "CT_DATA";
  v15 = "CT_VOICE";
  v16 = "UNKNOWN_APP!!!";
  if (a3 == 2)
    v16 = "CT_Th_Call";
  if (a3 != 1)
    v15 = v16;
  if (a3)
    v14 = v15;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("{%s}iRAT: Evaluate link preferred: %s"), v14, v10);
  return v9;
}

- (void)evaluateBandwidth
{
  id v2;
  id v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  float v17;
  float v18;
  double v19;
  double v20;
  float v21;

  v2 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSymptomsService");
  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getWiFiController");
  if (v3)
  {
    v4 = objc_msgSend(v3, "wifiService");
    objc_msgSend(v4, "getEstimatedAvailableRxPhyBandwidth");
    v6 = v5;
    objc_msgSend(v4, "getCalculatedAvailableRxPhyBandwidth");
    v8 = v7;
    objc_msgSend(v4, "getCalculatedAvailableTxPhyBandwidth");
    v10 = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WIFI Throughput Estimation, Estimated Rx PHY BW: %.2f, Calculated Rx PHY BW: %.2f, Calculated TX BW: %.2f"), v6, v8, v9);
    LODWORD(v11) = 1151500288;
    *(float *)&v12 = v6;
    objc_msgSend(v4, "getL3Bandwidth::", v11, v12);
    v14 = v13;
    LODWORD(v15) = 1151500288;
    *(float *)&v16 = v8;
    objc_msgSend(v4, "getL3Bandwidth::", v15, v16);
    v18 = v17;
    LODWORD(v19) = 1151500288;
    *(float *)&v20 = v10;
    objc_msgSend(v4, "getL3Bandwidth::", v19, v20);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WIFI Throughput Estimation, Estimated L3 Rx PHY BW: %.2f, Calculated L3 Rx PHY BW: %.2f, Calculated L3 TX BW: %.2f"), v14, v18, v21);
  }
  if (v2)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("L3 Bandwidth BW: %.2f"), 0);
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value;
  id v5;
  WRM_IDSP2PController **p_mIDSP2PController;
  const __CFString *v7;
  int64_t int64;
  int64_t v9;
  WCM_WiFiService *v10;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WRM IDS Link Eval Manager received WiFi link state change event"));
  if (!value)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Eval Manager:Empty message received"));
    return;
  }
  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  if (!xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS"))
  {
    int64 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
    v9 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Eval Mgr :Linkup event received"));
    v10 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
    -[WCM_WiFiService setRSSI:](v10, "setRSSI:", int64);
    -[WCM_WiFiService setSNR:](v10, "setSNR:", v9);
    if (!objc_msgSend(v5, "p2pAssistanceEnabled"))
      goto LABEL_11;
    p_mIDSP2PController = &self->mIDSP2PController;
    v7 = CFSTR("LinkUP");
    if (-[WRM_IDSP2PController IsIDSInitDone](self->mIDSP2PController, "IsIDSInitDone"))
      goto LABEL_6;
    goto LABEL_5;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Eval Manager:Link down event received"));
  if (objc_msgSend(v5, "p2pAssistanceEnabled"))
  {
    p_mIDSP2PController = &self->mIDSP2PController;
    v7 = CFSTR("LinkDown");
    if (-[WRM_IDSP2PController IsIDSInitDone](self->mIDSP2PController, "IsIDSInitDone"))
    {
LABEL_6:
      -[WRM_IDSP2PController WrmSendp2pMessage:MessageBody:withOptions:](*p_mIDSP2PController, "WrmSendp2pMessage:MessageBody:withOptions:", CFSTR("WiFi status"), v7, 0);
      goto LABEL_11;
    }
LABEL_5:
    -[WRM_IDSP2PController InitService](*p_mIDSP2PController, "InitService");
    goto LABEL_6;
  }
LABEL_11:
  -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](self, "evaluateBTWiFiLink");
}

- (void)addProximityiRatClient:(id)a3
{
  NSObject *mQueueTerminus;
  _QWORD v4[6];

  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100066F90;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (void)removeProximityiRatClient:(id)a3
{
  if (objc_msgSend(a3, "queue"))
    dispatch_release((dispatch_object_t)objc_msgSend(a3, "queue"));
  objc_msgSend(a3, "setQueue:", 0);
  if (objc_msgSend(a3, "mTerminusContext"))
  {

    objc_msgSend(a3, "setMTerminusContext:", 0);
  }
  -[NSMutableArray removeObject:](-[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts"), "removeObject:", a3);
}

- (void)deleteProximityiRATClient:(int)a3
{
  NSObject *mQueueTerminus;
  _QWORD v4[5];
  int v5;

  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100067088;
  v4[3] = &unk_1002026C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (void)addiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[NSMutableArray addObject:](self->miRATClientContexts, "addObject:", a3);
  -[WRM_IDSLinkEvalManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[WRM_IDSLinkEvalManager existingContexts](self, "existingContexts");
  -[NSMutableArray removeObject:](self->miRATClientContexts, "removeObject:", a3);
  -[WRM_IDSLinkEvalManager existingContexts](self, "existingContexts");
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
  v6 = -[WRM_IDSLinkEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", v3);
  if (v6)
    -[WRM_IDSLinkEvalManager removeiRatClient:](self, "removeiRatClient:", v6);
  objc_sync_exit(miRATClientContexts);
  -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_IDSLinkEvalManager needWiFiLQM](self, "needWiFiLQM"));
}

- (void)existingContexts
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WRM_IDS_BTWiFEvalManager: Number of active iRAT clients: %lu"), -[NSMutableArray count](self->miRATClientContexts, "count"));
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if (-[WRM_IDSLinkEvalManager enableiRATManager](self, "enableiRATManager"))
  {
    if ((uint64_t)a3 > 10)
    {
      if (a3 == 12)
      {
        -[WRM_IDSLinkEvalManager handleIDSToolRegisterd](self, "handleIDSToolRegisterd");
      }
      else if (a3 == 11)
      {
        -[WRM_IDSLinkEvalManager handleIDSRegisterd](self, "handleIDSRegisterd");
      }
    }
    else if (a3 == 1)
    {
      -[WRM_IDSLinkEvalManager handleWiFiRegistered](self, "handleWiFiRegistered");
    }
    else if (a3 == 4)
    {
      -[WRM_IDSLinkEvalManager handleBTRegistered](self, "handleBTRegistered");
    }
  }
}

- (void)handleIDSToolRegisterd
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Tool registration status changed."));
}

- (void)handleIDSRegisterd
{
  if (-[WRM_IDSLinkEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", 4))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Link Manager: configureIDSMetricsReporting."));
    -[WRM_IDSLinkEvalManager configureIDSMetricsReporting](self, "configureIDSMetricsReporting");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS registration status changed."));
}

- (void)handleBTRegistered
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s BT registration status changed. State: %d"), "-[WRM_IDSLinkEvalManager(privateFunctions) handleBTRegistered]", -[WCM_BTController getBTState](self->mBT, "getBTState"));
  -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](self, "evaluateBTWiFiLink");
}

- (void)handleWiFiRegistered
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WiFi registration status changed."));
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    -[WRM_IDSLinkEvalManager evaluateBTWiFiLink](self, "evaluateBTWiFiLink");
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "WRM_IDSLinkEvalManagerSingleton", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Linkeval Manager: Inside Copy with Zone "));
  return self;
}

- (unint64_t)retainCount
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("BE Manager: retain count:%lu "), -1);
  return -1;
}

- (WRM_IDSLinkEvalManager)autorelease
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("BE Manager: auto release "));
  return self;
}

- (WRM_IDSLinkEvalManager)init
{
  WRM_IDSLinkEvalManager *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_IDSLinkEvalManager;
  v2 = -[WRM_IDSLinkEvalManager init](&v5, "init");
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue");
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->mQueueTerminus = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.IDSLinkEvalMgr", v3);
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    -[WRM_IDSLinkEvalManager setMiRATProximityClientContexts:](v2, "setMiRATProximityClientContexts:", objc_alloc_init((Class)NSMutableArray));
    v2->mIDSMetricsController = (WRM_IdsMetricsController *)+[WRM_IdsMetricsController WRM_IdsMetricsControllerSingleton](WRM_IdsMetricsController, "WRM_IdsMetricsControllerSingleton");
    v2->mIDSP2PController = (WRM_IDSP2PController *)+[WRM_IDSP2PController wrm_IDSP2PControllerSingleton](WRM_IDSP2PController, "wrm_IDSP2PControllerSingleton");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Linkeval Manager: IDS Eval manager initialized"));
    qword_100270F98 = 0;
    v2->mWiFi = 0;
    v2->mBT = 0;
    byte_100270FA9 = 1;
    v2->mCurrentBTLQMScore = -1;
    v2->mBtLQMUpdateNeeded = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *miRATClientContexts;
  WRM_IdsMetricsController *mIDSMetricsController;
  WRM_IDSP2PController *mIDSP2PController;
  objc_super v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Handover Manager: Dealloc called for IDS Linkeval manager "));
  -[NSMutableArray removeAllObjects](-[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts"), "removeAllObjects");
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts)

  if (-[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts"))
  self->mWiFi = 0;
  self->mBT = 0;
  mIDSMetricsController = self->mIDSMetricsController;
  if (mIDSMetricsController)

  self->mIDSMetricsController = 0;
  mIDSP2PController = self->mIDSP2PController;
  if (mIDSP2PController)

  self->mIDSP2PController = 0;
  v6.receiver = self;
  v6.super_class = (Class)WRM_IDSLinkEvalManager;
  -[WRM_IDSLinkEvalManager dealloc](&v6, "dealloc");
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
  block[2] = sub_1000677A8;
  block[3] = &unk_100201DE8;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(mQueue, block);
}

- (void)updateControllerState:(id)a3
{
  NSObject *mQueueTerminus;
  _QWORD v4[6];

  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100067C04;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (id)getiRATClientFromList:(int)a3
{
  NSMutableArray *miRATClientContexts;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  const char *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->miRATClientContexts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "getMyClientType") == a3)
        {
          if ((a3 - 1) >= 0x15)
          {
            v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (a3 == 22)
              v11 = "ClientCoreMediaStreaming";
          }
          else
          {
            v11 = off_100202FB0[a3 - 1];
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: Found valid irat context for %s"), "-[WRM_IDSLinkEvalManager getiRATClientFromList:]", v11);
          goto LABEL_15;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_15:
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (id)getiRATProximityClientFromList:(int)a3
{
  NSMutableArray *miRATClientContexts;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  const char *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts");
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "getMyClientType") == a3)
        {
          if ((a3 - 1) >= 0x15)
          {
            v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (a3 == 22)
              v11 = "ClientCoreMediaStreaming";
          }
          else
          {
            v11 = off_100202FB0[a3 - 1];
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: Found valid context for %s"), "-[WRM_IDSLinkEvalManager getiRATProximityClientFromList:]", v11);
          goto LABEL_15;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_15:
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (BOOL)isPingPongAvoidanceTimerSatisfied:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;

  v4 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "getDeltaTimeSinceLastCellularRecommendation");
  v6 = v5;
  v7 = objc_msgSend(v4, "dataBtStickinessTimeThreshMs");
  v8 = v6 * 1000.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("delta time:%lf, effectiveBlockout time:%lld "), *(_QWORD *)&v8, v7);
  if (v8 >= (double)(unint64_t)v7)
    objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "updatePrevTimeStamp");
  return v8 >= (double)(unint64_t)v7;
}

- (void)updateBTLQMScore
{
  id v3;
  void *v4;
  WCM_BTController *mBT;
  id v6;
  unsigned int v7;
  int v8;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  if (!self->mIDSMetricsController)
    goto LABEL_8;
  v4 = v3;
  mBT = self->mBT;
  if (!mBT)
    goto LABEL_8;
  v6 = -[WCM_BTController getMovingAvgBTRssi](mBT, "getMovingAvgBTRssi");
  v7 = -[WCM_BTController isBTMetricsValid](self->mBT, "isBTMetricsValid");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("btMetricsValid: %d btMovingAvg RSSI %llu"), v7, v6);
  if (!v6)
  {
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:
    v8 = -1;
    goto LABEL_10;
  }
  if (v6 >= objc_msgSend(v4, "dataMinBtRssiTh1"))
    goto LABEL_9;
  if (v6 >= objc_msgSend(v4, "dataMinBtRssiTh0"))
    v8 = 2;
  else
    v8 = 3;
LABEL_10:
  self->mCurrentBTLQMScore = v8;
}

- (BOOL)isMarconiDevice
{
  return 1;
}

- (void)postBluetoothLQMScore:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("postBluetoothLQMScore: mBtLQMUpdateNeeded %d"), self->mBtLQMUpdateNeeded);
  if (self->mBtLQMUpdateNeeded || v3)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = v6;
      xpc_dictionary_set_int64(v6, "WRMLinkPrefBTScore_LQMScore", self->mCurrentBTLQMScore);
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = -[WRM_IDSLinkEvalManager miRATProximityClientContexts](self, "miRATProximityClientContexts");
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "sendMessage:withArgs:", 1309, v7);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("BT LQMScore has changed, post: LQMScore %d"), self->mCurrentBTLQMScore);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }
      xpc_release(v7);
    }
  }
}

- (void)evaluateBTWiFiLinkForTerminus
{
  NSObject *mQueueTerminus;
  _QWORD block[5];

  mQueueTerminus = self->mQueueTerminus;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068294;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueueTerminus, block);
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  objc_msgSend(objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", *(_QWORD *)&a3), "sendMessage:", a4);
}

- (BOOL)isBTLinkQualityGood
{
  WRM_IDSLinkEvalManager *v2;
  unint64_t v3;
  id v4;

  v2 = self;
  v3 = -[WCM_BTController getMovingAvgBTRssi](self->mBT, "getMovingAvgBTRssi");
  LODWORD(v2) = -[WCM_BTController isBTMetricsValid](v2->mBT, "isBTMetricsValid");
  v4 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  return (_DWORD)v2 && v3 < (unint64_t)objc_msgSend(v4, "commCenterBTlpmThreasholdBTProximity");
}

- (unint64_t)getWiFiRssi
{
  return -[WCM_WiFiService getRSSI](-[WCM_WiFiController wifiService](self->mWiFi, "wifiService"), "getRSSI");
}

- (NSMutableArray)miRATProximityClientContexts
{
  return self->_miRATProximityClientContexts;
}

- (void)setMiRATProximityClientContexts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
