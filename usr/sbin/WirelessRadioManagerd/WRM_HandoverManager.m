@implementation WRM_HandoverManager

- (BOOL)isWiFiArqQualityIndicatorGoodUserData:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  _BOOL4 v6;
  unsigned int v10;
  WCM_WiFiService *v11;
  id v12;
  double v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  const __CFString *v21;
  id v22;

  v6 = a6;
  v10 = -[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType", a3);
  if (v10 != 1)
  {
    v11 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
    v12 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
    -[WCM_WiFiService getTxPer](v11, "getTxPer");
    v14 = (uint64_t)(v13 * 100.0);
    v15 = -[WCM_WiFiService isTxPerValid](v11, "isTxPerValid");
    -[WCM_WiFiService getTxFail](v11, "getTxFail");
    v17 = (uint64_t)v16;
    -[WCM_WiFiService getRxRatio](v11, "getRxRatio");
    v19 = v18 * 100.0;
    -[WCM_WiFiService getCumulativeTxPer](v11, "getCumulativeTxPer");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Actual Tx PER %lld, TX Fail %lld, RX Ratio=%lf, CumTxPER %lld, TX PER valid: %d"), v14, v17, *(_QWORD *)&v19, (uint64_t)(v20 * 100.0), v15);
    if (!v15)
      goto LABEL_18;
    if (v6)
    {
      if (a4 != 1)
        goto LABEL_18;
      if (a5)
      {
        if (a5 == 1 && (uint64_t)objc_msgSend(v12, "minActiveWiFiTxPktLossRateTh1") < v14)
        {
          v21 = CFSTR("iRAT detected WiFi bad because of WiFi_Metrics: TX PER THREASHOLD: %lld");
LABEL_13:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v21, objc_msgSend(v12, "minActiveWiFiTxPktLossRateTh1"));
LABEL_17:
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
          LOBYTE(v10) = 0;
          return v10;
        }
        goto LABEL_18;
      }
      v22 = objc_msgSend(v12, "minActiveWiFiTxPktLossRateTh0");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("TX PER THREASHOLD: %lld"), objc_msgSend(v12, "minActiveWiFiTxPktLossRateTh1"));
      if (a5)
      {
        if (a5 == 1 && (uint64_t)objc_msgSend(v12, "minIdleWiFiTxPktLossRateTh1") < v14)
        {
          v21 = CFSTR("iRAT detected WiFi bad because of WiFi_Metrics: TX PER THREASHOLD:%lld");
          goto LABEL_13;
        }
LABEL_18:
        LOBYTE(v10) = 1;
        return v10;
      }
      v22 = objc_msgSend(v12, "minIdleWiFiTxPktLossRateTh0");
    }
    if ((uint64_t)v22 < v14)
      goto LABEL_17;
    goto LABEL_18;
  }
  return v10;
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64;
  dispatch_time_t v6;
  NSObject *mQueue;
  xpc_object_t value;
  uint64_t v9;
  _QWORD block[5];

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 <= 407)
  {
    if (uint64 > 201)
    {
      switch(uint64)
      {
        case 202:
          -[WRM_HandoverManager handlePeriodicRTPMetrics:](self, "handlePeriodicRTPMetrics:", a3);
          break;
        case 400:
          -[WRM_HandoverManager handleLinkPrefSubscribe:](self, "handleLinkPrefSubscribe:", a3);
          -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_HandoverManager needWiFiLQM](self, "needWiFiLQM"));
          -[WRM_HandoverManager registerForCTNotifications](self, "registerForCTNotifications");
          -[WRM_HandoverManager registerForSCNotifications](self, "registerForSCNotifications");
          break;
        case 401:
          -[WRM_HandoverManager handleSubscribeStatusUpdate::](self, "handleSubscribeStatusUpdate::", a3, 1);
          break;
      }
    }
    else if (uint64 == 100)
    {
      -[WRM_HandoverManager monitorTransportMetrics](self, "monitorTransportMetrics");
      -[WRM_HandoverManager handleWiFiConfig](self, "handleWiFiConfig", v9);
    }
    else if (uint64 == 103)
    {
      -[WRM_HandoverManager monitorTransportMetrics](self, "monitorTransportMetrics");
      -[WRM_HandoverManager handleWiFiStateChaneEvents:](self, "handleWiFiStateChaneEvents:", a3);
    }
    else if (uint64 == 109 && -[WRM_HandoverManager isRecentDevice](self, "isRecentDevice"))
    {
      v6 = dispatch_time(0, 2000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B8AE0;
      block[3] = &unk_1002019E8;
      block[4] = self;
      dispatch_after(v6, mQueue, block);
    }
  }
  else if (uint64 <= 419)
  {
    switch(uint64)
    {
      case 408:
        -[WRM_HandoverManager handleCellularLinkQualityUpdate:](self, "handleCellularLinkQualityUpdate:", a3);
        break;
      case 411:
        -[WRM_HandoverManager handleBBAssertionBGAppActiveRequest:](self, "handleBBAssertionBGAppActiveRequest:", a3);
        break;
      case 416:
        -[WRM_HandoverManager handleIWLANMetrics:](self, "handleIWLANMetrics:", a3);
        break;
    }
  }
  else if (uint64 > 700)
  {
    if (uint64 == 701)
    {
      -[WRM_HandoverManager handleSIPMetricsRecevied:](self, "handleSIPMetricsRecevied:", a3);
    }
    else if (uint64 == 1000)
    {
      value = xpc_dictionary_get_value(a3, "kMessageArgs");
      -[WRM_HandoverManager handleInternalMessage:](self, "handleInternalMessage:", value);
    }
  }
  else if (uint64 == 420)
  {
    -[WRM_HandoverManager handleSIPStalledMetricsRecevied:](self, "handleSIPStalledMetricsRecevied:", a3);
  }
  else if (uint64 == 700)
  {
    -[WRM_HandoverManager handleIPTelephonyMetrics:](self, "handleIPTelephonyMetrics:", a3);
  }
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64;
  xpc_object_t value;

  uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  value = xpc_dictionary_get_value(a3, "kInternalMessageArgs");
  if (uint64 == 1003)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("handleInternalMessage:handleWiFiLinkQualityUpdate"));
    -[WRM_HandoverManager monitorTransportMetrics](self, "monitorTransportMetrics");
    -[WRM_HandoverManager handleWiFiLinkQualityUpdate:](self, "handleWiFiLinkQualityUpdate:", value);
  }
  else if (uint64 == 1001)
  {
    -[WRM_HandoverManager handleMotionUpdate:](self, "handleMotionUpdate:", value);
  }
}

- (BOOL)can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3
{
  id v5;
  unsigned int v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;

  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = objc_msgSend(v5, "getServingCellType");
  v7 = objc_msgSend(v5, "getCurrentSignalBars");
  if ((objc_msgSend(v5, "isVoLTESupported") & 1) == 0)
  {
    v9 = CFSTR("canMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, VoLTE not enabled,preferWiFi");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v9);
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, signal bars:%d, VoLTE enabled: %d"), v7, 1);
  if ((v6 & 0xFFFFFFF7) != 1)
    return 0;
  if (a3 == 2)
  {
    if (-[WRM_HandoverManager isLteEntryCriteriaMetCurrentLinkNone](self, "isLteEntryCriteriaMetCurrentLinkNone")
      || -[WRM_HandoverManager isNrEntryCriteriaMetCurrentLinkNone](self, "isNrEntryCriteriaMetCurrentLinkNone"))
    {
      v8 = CFSTR("EntryCriteriaMetCurrentLinkNone true");
      goto LABEL_17;
    }
    v9 = CFSTR("EntryCriteriaMetCurrentLinkNone false");
    goto LABEL_9;
  }
  if (a3 != 1)
  {
    if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:](self, "isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:", 0))
    {
      v8 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false");
      goto LABEL_17;
    }
    v9 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true");
    goto LABEL_9;
  }
  if (!-[WRM_HandoverManager isLteEntryCriteriaMetCurrentLinkWiFi:](self, "isLteEntryCriteriaMetCurrentLinkWiFi:", 2)
    && !-[WRM_HandoverManager isNrEntryCriteriaMetCurrentLinkWiFi:](self, "isNrEntryCriteriaMetCurrentLinkWiFi:", 2))
  {
    v9 = CFSTR("EntryCriteriaMetCurrentLinkWiFi false");
    goto LABEL_9;
  }
  v8 = CFSTR("EntryCriteriaMetCurrentLinkWiFi true");
LABEL_17:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v8);
  return 1;
}

- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7 :(int)a8
{
  uint64_t v8;
  WCM_WiFiController *mWiFi;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  WCM_WiFiService *v16;
  const __CFString *v17;
  unsigned int v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  _QWORD block[5];

  v8 = *(_QWORD *)&a8;
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    v17 = CFSTR("Evaluate link: WiFi not initialized.");
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v17, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
    goto LABEL_14;
  }
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = a5;
  v16 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (!v16)
  {
    v17 = CFSTR("Evaluate link: WiFi service not initialized.");
    goto LABEL_13;
  }
  if (byte_100271014)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B90A0;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_14:
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
    v19 = 0;
    goto LABEL_15;
  }
  if (!-[WCM_WiFiService isWiFiPrimaryInterface](v16, "isWiFiPrimaryInterface"))
  {
    byte_100270DEA = 0;
    v17 = CFSTR("Evaluate link: WiFi link not primary yet. ");
    goto LABEL_13;
  }
  if (!byte_100270DE8)
    -[WRM_HandoverManager toggleSAState:](self, "toggleSAState:", 1);
  byte_100270DEA = 1;
  if ((_DWORD)v12)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate link: Using Non-WIFI_Preferred algorithm. "));
    v18 = -[WRM_HandoverManager evaluateLinkNonWiFiPreferred:::::](self, "evaluateLinkNonWiFiPreferred:::::", a3, a4, v14, v13, v12);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate link: Using WiFi-Preferred algorithm. "));
    v18 = -[WRM_HandoverManager evaluateLinkWiFiPreferred::::](self, "evaluateLinkWiFiPreferred::::", a3, a4, v14, v13);
  }
  v19 = v18;
LABEL_15:
  v20 = "CT_DATA";
  v21 = "CT_VOICE";
  v22 = "UNKNOWN_APP!!!";
  if (a4 == 2)
    v22 = "CT_Th_Call";
  if (a4 != 1)
    v21 = v22;
  if (a4)
    v20 = v21;
  v23 = "WIFI";
  if (!v19)
    v23 = "CELLULAR";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}iRAT: Evaluate link preferred:slot:%d: %s"), v20, v8, v23);
  return v19;
}

- (BOOL)isNrEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3
{
  id v5;
  char *v6;
  float v7;
  float v8;
  unsigned int v9;
  id v10;
  unsigned int v11;
  BOOL v12;
  const __CFString *v13;
  id v14;

  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = (char *)objc_msgSend(v5, "getCurrentSignalBars");
  objc_msgSend(v5, "getCurrentMovAvgSignalBars");
  v8 = v7;
  v9 = objc_msgSend(v5, "isVoiceLQMValid");
  v10 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v11 = -[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported");
  v12 = 0;
  v13 = CFSTR("isEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met");
  if (v11 && v9)
  {
    v14 = objc_msgSend(v5, "getLteVoiceLQM");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isEntryCriteriaMetCurrentLinkWiFi, Voice LQM: %d, Signal Bars: %d, Mov Avg Sig Bars:%f"), v14, v6, v8);
    if (((_DWORD)v14 - 50) <= 0xFFFFFFCE
      && (float)(v8 * 10.0) > (float)(uint64_t)objc_msgSend(v10, "minMovSigBarTh0")
      && (uint64_t)v6 >= (uint64_t)((char *)objc_msgSend(v10, "minSigBarTh0") - a3))
    {
      v12 = 1;
      v13 = CFSTR("isEntryCriteriaMetCurrentLinkWiFi: LQM better than kPOOR");
    }
    else
    {
      v12 = 0;
      v13 = CFSTR("isEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met");
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v13);
  return v12;
}

- (BOOL)isLteEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3
{
  id v5;
  id v6;
  char *v7;
  unsigned int v8;
  float v9;
  float v10;
  unsigned int v11;
  id v12;
  id v13;
  BOOL v14;
  const __CFString *v15;

  v5 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v6 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v7 = (char *)objc_msgSend(v6, "getCurrentSignalBars");
  v8 = objc_msgSend(v5, "getCellularDataLQM");
  objc_msgSend(v6, "getCurrentMovAvgSignalBars");
  v10 = v9;
  v11 = objc_msgSend(v6, "isVoiceLQMValid");
  v12 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (!-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported") || !v11)
  {
    if (v8 - 50 <= 0xFFFFFFCE
      && (float)(v10 * 10.0) > (float)(uint64_t)objc_msgSend(v12, "minMovSigBarTh0")
      && (uint64_t)v7 >= (uint64_t)((char *)objc_msgSend(v12, "minSigBarTh0") - a3))
    {
      v14 = 1;
      v15 = CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi: Data LQM better than kPOOR");
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v13 = objc_msgSend(v6, "getLteVoiceLQM");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isLteEntryCriteriaMetCurrentLinkWiFi, Voice LQM: %d, Signal Bars: %d, Mov Avg Sig Bars:%f"), v13, v7, v10);
  if (((_DWORD)v13 - 50) > 0xFFFFFFCE
    || (float)(v10 * 10.0) <= (float)(uint64_t)objc_msgSend(v12, "minMovSigBarTh0")
    || (uint64_t)v7 < (uint64_t)((char *)objc_msgSend(v12, "minSigBarTh0") - a3))
  {
LABEL_10:
    v14 = 0;
    v15 = CFSTR("isLteEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met");
    goto LABEL_11;
  }
  v14 = 1;
  v15 = CFSTR("isLteEntryCriteriaMetCurrentLinkWiFi: LQM better than kPOOR");
LABEL_11:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v15);
  return v14;
}

- (BOOL)handoverEvaluationRequired
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  const __CFString *v11;
  double v12;

  v3 = -[WRM_HandoverManager getMotionController](self, "getMotionController");
  v4 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  -[NSDate timeIntervalSinceNow](self->mStartTime, "timeIntervalSinceNow");
  v6 = v5;
  v7 = self->prevTimeSinceStart - v5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HO Evaluation time duration is: %lf"), *(_QWORD *)&v7);
  switch(objc_msgSend(v3, "getMobilityState"))
  {
    case 0u:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Device motion: STATIONARY"));
      if (v7 * 1000.0 < (double)(uint64_t)objc_msgSend(v4, "pingPongAvoidanceThresholdStationary"))
        goto LABEL_18;
      self->prevTimeSinceStart = v6;
      goto LABEL_20;
    case 1u:
      v8 = (double)(uint64_t)objc_msgSend(v4, "pingPongAvoidanceThresholdWalking");
      v9 = v7 * 1000.0;
      v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8)
        self->prevTimeSinceStart = v6;
      v11 = CFSTR("Device motion: WALKING");
      goto LABEL_16;
    case 2u:
      v8 = (double)(uint64_t)objc_msgSend((id)objc_opt_self(v4), "pingPongAvoidanceThresholdRunning");
      v9 = v7 * 1000.0;
      v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8)
        self->prevTimeSinceStart = v6;
      v11 = CFSTR("Device motion: RUNNING");
      goto LABEL_16;
    case 3u:
      v8 = (double)(uint64_t)objc_msgSend(v4, "pingPongAvoidanceThresholdStationary");
      v9 = v7 * 1000.0;
      v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8)
        self->prevTimeSinceStart = v6;
      v11 = CFSTR("Device motion: VEHICULAR");
      goto LABEL_16;
    case 4u:
      v8 = (double)(uint64_t)objc_msgSend(v4, "pingPongAvoidanceThresholdWalking");
      v9 = v7 * 1000.0;
      v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8)
        self->prevTimeSinceStart = v6;
      v11 = CFSTR("Device motion: PEDESTRIAN");
LABEL_16:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11, v8, v9);
      break;
    default:
      v12 = (double)(uint64_t)objc_msgSend(v4, "pingPongAvoidanceThresholdStationary");
      if (v7 * 1000.0 >= v12)
      {
        self->prevTimeSinceStart = v6;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Device motion: UNKNOWN"), v12, v7 * 1000.0);
LABEL_20:
        v10 = 1;
      }
      else
      {
LABEL_18:
        v10 = 0;
      }
      break;
  }
  return v10;
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
  const __CFString *v17;
  char v18;
  int64_t v19;
  int64_t v20;
  id v21;

  v5 = *(_QWORD *)&a5;
  v21 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v9 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v10 = -[WCM_WiFiService getRSSI](v9, "getRSSI");
  v11 = -[WCM_WiFiService getSNR](v9, "getSNR");
  v12 = -[WCM_WiFiService isWiFiNetworkCaptive](v9, "isWiFiNetworkCaptive");
  v20 = -[WRM_HandoverManager getSNRHysteresis](self, "getSNRHysteresis");
  v19 = -[WRM_HandoverManager getRSSIHysteresis](self, "getRSSIHysteresis");
  v13 = -[WRM_HandoverManager isWiFiArqQualityIndicatorGood::::](self, "isWiFiArqQualityIndicatorGood::::", a3, a4, v5, 0);
  v14 = -[WRM_HandoverManager isWiFiBeaconLossQualityIndicatorGood:::](self, "isWiFiBeaconLossQualityIndicatorGood:::", a3, a4, v5);
  v15 = -[WRM_HandoverManager isWiFiLoadQualityIndicatorGood::::](self, "isWiFiLoadQualityIndicatorGood::::", a3, a4, 0, v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetIdleApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d, Beacon Quality =%d, Load Quality =%d, WiFi Captive Status: %d, connected link type: %d"), v10, v11, v13, v14, v15, v12, v5);
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetIdleApplicationRequirements: CT_DATA"));
      return byte_100270FF9 == 0;
    }
    v17 = CFSTR("canWiFiRadioMeetIdleApplicationRequirements: Application category not supported");
    goto LABEL_15;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetIdleApplicationRequirements: CT_VOICE"));
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_WIFI"));
      if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh1") + v20)
        || (uint64_t)v10 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh1") + v19)
        || ((v15 ^ 1) & 1) != 0
        || ((v14 ^ 1) & 1) != 0
        || v13 != 1)
      {
        if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh1") + v20))
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 4);
        if ((uint64_t)v10 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh1") + v19))
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 8);
        return 0;
      }
      return 1;
    }
    v17 = CFSTR("CT_VOICE: connectedLinkType == NO Context");
LABEL_15:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v17);
    return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_CELLULAR"));
  if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiSnrTh0") + v20))
    return 0;
  if ((uint64_t)v10 >= (uint64_t)((char *)objc_msgSend(v21, "minIdleWiFiRssiTh0") + v19))
    v18 = v15;
  else
    v18 = 0;
  return v18 & v13 & v14;
}

- (BOOL)isWiFiArqQualityIndicatorGoodControlFW:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  unsigned int v8;
  WCM_WiFiService *v9;
  id v10;
  double v11;
  uint64_t v12;
  unsigned int v13;
  double v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;

  v8 = -[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType", a3, a4, *(_QWORD *)&a5, a6);
  if (v8 != 1)
  {
    v9 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
    v10 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
    -[WCM_WiFiService getFwTxPer](v9, "getFwTxPer");
    v12 = (uint64_t)(v11 * 100.0);
    v13 = -[WCM_WiFiService isFwTxPerValid](v9, "isFwTxPerValid");
    -[WCM_WiFiService getCumulativeFwTxPer](v9, "getCumulativeFwTxPer");
    v15 = (uint64_t)(v14 * 100.0);
    v16 = -[WCM_WiFiService isCumulativeFwTxPerValid](v9, "isCumulativeFwTxPerValid");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Actual FW TxPER %lld, CumFwTxPer %lld, FWTxPER valid: %d "), v12, v15, v13);
    if (v13)
      v17 = v12;
    else
      v17 = 0;
    if (v16)
      v18 = v15;
    else
      v18 = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Effective FW TxPER %lld, CumFwTxPer %lld"), v17, v18, v18);
    if (v13)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("FW TX PER THREASHOLD: %lld"), objc_msgSend(v10, "minIdleWiFiFwTxPktLossRateTh1"));
      if (a5)
      {
        if (a5 == 1 && (uint64_t)objc_msgSend(v10, "minIdleWiFiFwTxPktLossRateTh1") < v12)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT detected WiFi bad because of WiFi_Metrics: FW TX PER THREASHOLD: %lld"), objc_msgSend(v10, "minIdleWiFiFwTxPktLossRateTh1"));
LABEL_14:
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
          LOBYTE(v8) = 0;
          return v8;
        }
      }
      else if ((uint64_t)objc_msgSend(v10, "minIdleWiFiFwTxPktLossRateTh1") < v12)
      {
        goto LABEL_14;
      }
    }
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (void)handleWiFiLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager received WiFi link metrics"));
  byte_100270FA9 = 0;
  -[WRM_HandoverManager updateCellularMetricsMovAverage](self, "updateCellularMetricsMovAverage");
  if (-[WRM_HandoverManager isRecentDevice](self, "isRecentDevice"))
    -[WRM_HandoverManager evaluateWiFiVersusCell](self, "evaluateWiFiVersusCell");
  if (-[WRM_HandoverManager handoverEvaluationRequired](self, "handoverEvaluationRequired"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluating WiFi versus Cellular link preference."));
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("No need of Handover Evaluation: Evaluation Criteria not met."));
  }
}

- (int)evaluateLinkNonWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  const __CFString *v13;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v15;
  int result;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = a5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Using evaluateLinkNonWiFiPreferred: algorithm type: %d"), *(_QWORD *)&a7);
  if (-[WRM_HandoverManager canCellularMeetApplicationRequirement:::::](self, "canCellularMeetApplicationRequirement:::::", a3, a4, v9, v8, v7))
  {
    v13 = CFSTR("Cellular can meet application requirements");
LABEL_10:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v13);
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Cellular can not meet application requirements"));
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
    v13 = CFSTR("Evaluate link: WiFi not initialized.");
    goto LABEL_10;
  }
  v15 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
  if (!v15)
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
    v13 = CFSTR("Evaluate link: WiFi service not initialized.");
    goto LABEL_10;
  }
  if (-[WCM_WiFiService isWiFiPrimaryInterface](v15, "isWiFiPrimaryInterface"))
  {
    byte_100270DEA = 1;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WiFi link is primary."));
    if (v9)
      return -[WRM_HandoverManager canWiFiMeetActiveApplicationRequirements::::](self, "canWiFiMeetActiveApplicationRequirements::::", a3, a4, v8, v7);
    else
      return -[WRM_HandoverManager canWiFiMeetIdleApplicationRequirements:::](self, "canWiFiMeetIdleApplicationRequirements:::", a3, a4, v8);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WiFi link is not primary: recommend cellular"));
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 2);
    result = 0;
    byte_100270DEA = 0;
  }
  return result;
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCalling:(BOOL)a3 :(int)a4 :(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  _BOOL4 v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v9 = -[WRM_HandoverManager getCTService](self, "getCTService");
  self->deviceRegisteredWithCellularNetwork = objc_msgSend(v9, "registeredWithCellularNetwork");
  v10 = objc_msgSend(v9, "dataAttachedWithCellularNetwork");
  v11 = objc_msgSend(v9, "isIMSPreferenceEnabled");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeWiFiCalling, algorithm: %d, reg status:%d, attach status:%d, IMS preference: %d"), v5, self->deviceRegisteredWithCellularNetwork, v10, v11);
  if ((_DWORD)v5 == 2)
  {
    v12 = -[WRM_HandoverManager evaluateCellularLinkForWiFiCallingCellPreferredPolicy::](self, "evaluateCellularLinkForWiFiCallingCellPreferredPolicy::", v6, v7);
  }
  else if ((_DWORD)v5 == 1)
  {
    v12 = -[WRM_HandoverManager evaluateCellularLinkForWiFiCallingIMSPreferredPolicy::](self, "evaluateCellularLinkForWiFiCallingIMSPreferredPolicy::", v6, v7);
  }
  else
  {
    v12 = -[WRM_HandoverManager evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy::](self, "evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy::", v6, v7);
  }
  v13 = v12;
  if (!self->deviceRegisteredWithCellularNetwork && (v10 & v11 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeWiFiCalling:device not registered or attached with cellular network with IMS preference"));
    v13 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeWiFiCalling:CellualrEval Status:%d"), v13);
  return v13;
}

+ (id)WRM_HandoverManagerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B7BC4;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271328 != -1)
    dispatch_once(&qword_100271328, block);
  return (id)qword_100271330;
}

- (id)getQueue
{
  return self->mQueue;
}

- (void)updateAppState:(int)a3 Category:(id)a4 sessionType:(int)a5
{
  dword_100270F30 = a5;
  byte_100270F43 = ((a3 - 4) & 0xFFFFFFFB) == 0;
  -[WRM_HandoverManager triggerBWEval](self, "triggerBWEval");
  -[WRM_HandoverManager evaluateWiFiVersusCell](self, "evaluateWiFiVersusCell");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("updateAppState: active: %d, category: %@"), byte_100270F43, a4);
}

- (void)triggerBWEval
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = 0;
  if (byte_100270F43
    && -[WRM_HandoverManager highThroughputRequired:](self, "highThroughputRequired:", dword_100270F30))
  {
    qword_100270F38 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton");
    v2 = objc_msgSend((id)qword_100270F38, "getPredictedWiFiBandwidth:", &v4);
    if (v2)
    {
      v3 = v4;
      qword_100270F28 = v4;
    }
    else
    {
      v3 = qword_100270F28;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("triggerBWEval: predicted BW: %f, status: %d"), v3, v2 != 0);
  }
}

- (void)evaluateWiFiVersusCell
{
  NSObject *mQueue;
  _QWORD block[5];

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F4C;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (BOOL)highThroughputRequired:(int)a3
{
  return a3 == 1 || a3 == 4;
}

- (void)evaluateHandover
{
  id v3;
  const __CFString *v4;
  id v5;
  NSMutableArray *miRATClientContexts;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  BOOL v20;
  char v21;
  WRM_HandoverManager *v22;
  const char *v23;
  const char *v24;
  id v25;
  unsigned int v26;
  _BOOL8 v27;
  const char *v28;
  id v29;
  BOOL v30;
  WRM_HandoverManager *v31;
  uint64_t v32;
  double v33;
  double v34;
  const __CFString *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  id v39;
  unint64_t v40;
  const __CFString *v41;
  double v42;
  double v43;
  double v44;
  id v45;
  unint64_t v46;
  double v47;
  id v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id obj;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unsigned int v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  WRM_HandoverManager *v63;
  const char *v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  id v77;

  v52 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
  v3 = -[NSMutableArray count](self->miRATClientContexts, "count");
  if (!v3)
  {
    v4 = CFSTR("Evaluate Handover: No iRAT client available.");
    goto LABEL_5;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate Handover: Total number of iRAT clients %zu."), v3);
  if (byte_100270FA9)
  {
    v4 = CFSTR("Do not evaluate link yet, did not receive LQM event from WiFi Manager yet");
LABEL_5:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v4);
    return;
  }
  v58 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v57 = objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState");
  v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("mActive"), 0);
  miRATClientContexts = self->miRATClientContexts;
  v51 = v5;
  v77 = v5;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = -[NSMutableArray sortedArrayUsingDescriptors:](miRATClientContexts, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (!v55)
    goto LABEL_131;
  v54 = *(_QWORD *)v72;
  v63 = self;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v72 != v54)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v7);
      if (-[WRM_HandoverManager isEnhancedCTServiceNeeded](self, "isEnhancedCTServiceNeeded"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate Handover: device, slot id: %d"), objc_msgSend(v8, "getActiveSlot"));
        objc_msgSend(v52, "setActiveSlot:", objc_msgSend(v8, "getActiveSlot"));
      }
      v9 = objc_msgSend(v8, "getMyClientType");
      v10 = "ClientCommCenter";
      if ((_DWORD)v9 != 1)
      {
        if (((_DWORD)v9 - 2) >= 0x14)
        {
          v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if ((_DWORD)v9 == 22)
            v10 = "ClientCoreMediaStreaming";
        }
        else
        {
          v10 = (&off_100204DC8)[(int)v9 - 2];
        }
      }
      v56 = v7;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("<%s>Evaluate Handover: BEGIN."), v10);
      v59 = objc_msgSend(v8, "getHandoverContexts");
      v60 = objc_msgSend(v8, "getHandoverAlgorithmType:", 1);
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v62 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (v62)
      {
        v61 = *(_QWORD *)v68;
        v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
        if ((_DWORD)v9 == 22)
          v11 = "ClientCoreMediaStreaming";
        v64 = v11;
        v65 = v9;
        v66 = (int)v9 - 2;
        do
        {
          v12 = 0;
          do
          {
            v13 = v8;
            if (*(_QWORD *)v68 != v61)
              objc_enumerationMutation(v59);
            v9 = *(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v12);
            v14 = objc_msgSend(v9, "getBandwidth");
            v15 = objc_msgSend(v9, "getApplicationType");
            v16 = objc_msgSend(v9, "getCallState");
            v17 = objc_msgSend(v9, "getConnectedLinkType");
            if ((_DWORD)v65 == 1)
              v18 = "ClientCommCenter";
            else
              v18 = v64;
            if ((_DWORD)v65 != 1 && v66 <= 0x13)
              v18 = (&off_100204DC8)[v66];
            if (v15)
            {
              v19 = "CT_VOICE";
              if (v15 != (id)1)
              {
                if (v15 == (id)2)
                  v19 = "CT_Th_Call";
                else
                  v19 = "UNKNOWN_APP!!!";
              }
            }
            else
            {
              v19 = "CT_DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("<%s>{%s}Slot: %d Evaluate Handover: BEGIN."), v18, v19, objc_msgSend(v13, "getActiveSlot"));
            if ((_DWORD)v17)
              v20 = 1;
            else
              v20 = byte_100270DEA == 0;
            v21 = v20;
            v22 = v63;
            if (!v20 && ((v16 ^ 1) & 1) == 0 && byte_100270FC1)
            {
LABEL_46:
              if (v15)
              {
                v23 = "CT_VOICE";
                if (v15 != (id)1)
                {
                  v23 = "UNKNOWN_APP!!!";
                  if (v15 == (id)2)
                    v23 = "CT_Th_Call";
                }
              }
              else
              {
                v23 = "CT_DATA";
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}Skipping link evaluation for client connected on cellular link"), v23);
              objc_msgSend(v9, "setLinkPreferenceNotificationRequired:", 0);
              v8 = v13;
              LODWORD(v9) = (_DWORD)v65;
              goto LABEL_100;
            }
            if ((v21 & 1) != 0)
              goto LABEL_52;
            if (-[WRM_HandoverManager canCellularMeetApplicationRequirement:::::](v63, "canCellularMeetApplicationRequirement:::::", v14, v15, v16, 0, v60))
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirement ok, appType: %d, callActive: %d, alg: %d"), v15, v16, v60);
            }
            else if (-[WRM_HandoverManager isWiFiLinkEvaluationDesired](v63, "isWiFiLinkEvaluationDesired"))
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Continue to evaluate WiFi link: Cellular link bad, appType: %d, callActive: %d, alg: %d"), v15, v16, v60);
              goto LABEL_53;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluate_handover: connectedLinkType == WRM_CELLULAR, appType: %d, call active: %d"), v15, v16);
            if (v57 != 5 && v57)
            {
              objc_msgSend(v9, "getDeltaTimeSinceLastCellularRecommendation");
              v43 = v42;
              if ((_DWORD)v16)
              {
                v44 = v42 * 1000.0;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("active: getDeltaTimeSinceLastCellularRecommendation: delta time:%lf"), v42 * 1000.0);
                if (v44 < (double)(uint64_t)objc_msgSend(v58, "cellularStickinessThreaholdIdle"))
                  goto LABEL_46;
                v35 = CFSTR("WiFi link evaluation criteria met: Motion state not stationary, active");
                goto LABEL_119;
              }
              v45 = objc_msgSend(v9, "getPingPongAvoidanceTimerMultiplier");
              v46 = (_QWORD)objc_msgSend(v58, "cellularStickinessThreaholdIdle") * (_QWORD)v45;
              v22 = v63;
              v47 = v43 * 1000.0;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("idle: getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effectiveBlockout time:%lld "), *(_QWORD *)&v47, v46);
              if (v47 < (double)v46)
                goto LABEL_46;
              v41 = CFSTR("WiFi link evaluation criteria met: Motion state not stationary, idle");
            }
            else
            {
              objc_msgSend(v9, "getDeltaTimeSinceLastCellularRecommendation");
              v34 = v33 * 1000.0;
              if ((_DWORD)v16)
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("state: active, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf"), v33 * 1000.0);
                if (v34 < (double)(uint64_t)objc_msgSend(v58, "cellularStickinessThreaholdStationaryActive"))
                  goto LABEL_46;
                v35 = CFSTR("WiFi link evaluation criteria met: CellularStickinessThreaholdStationaryActive");
LABEL_119:
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v35);
LABEL_52:
                objc_msgSend(v9, "updatePrevTimeStamp");
                goto LABEL_53;
              }
              v39 = objc_msgSend(v9, "getPingPongAvoidanceTimerMultiplier");
              v40 = (_QWORD)objc_msgSend(v58, "cellularStickinessThreaholdStationary") * (_QWORD)v39;
              v22 = v63;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("state: idle, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effective blockout:%lld"), *(_QWORD *)&v34, v40);
              if (v34 < (double)v40)
                goto LABEL_46;
              v41 = CFSTR("WiFi link evaluation criteria met: CellularStickinessThreaholdStationary");
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v41);
            objc_msgSend(v9, "updatePrevTimeStamp");
            objc_msgSend(v9, "setPingPongAvoidanceTimerMultiplier:", 1);
LABEL_53:
            -[WRM_HandoverManager initHandoverReasonCode](v22, "initHandoverReasonCode");
            if (v15)
            {
              v24 = "CT_VOICE";
              v25 = v60;
              if (v15 != (id)1)
              {
                v24 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v24 = "CT_Th_Call";
              }
            }
            else
            {
              v24 = "CT_DATA";
              v25 = v60;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}invoking evaluate link"), v24);
            v26 = -[WRM_HandoverManager evaluateLink::::::](v22, "evaluateLink::::::", v14, v15, v16, v17, v25, objc_msgSend(v13, "getActiveSlot"));
            v27 = v26 == 1;
            if (objc_msgSend(v9, "getConnectedLinkType") == v27)
            {
              objc_msgSend(v9, "setLinkPreferenceNotificationRequired:", 0);
              if (v15)
              {
                v28 = "CT_VOICE";
                v8 = v13;
                v9 = v65;
                if (v15 != (id)1)
                {
                  v28 = "UNKNOWN_APP!!!";
                  if (v15 == (id)2)
                    v28 = "CT_Th_Call";
                }
              }
              else
              {
                v28 = "CT_DATA";
                v8 = v13;
                v9 = v65;
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}Link preference did not change for application type =%lld for client =%d current link type =%d "), v28, v15, v9, v27);
              goto LABEL_100;
            }
            v29 = objc_msgSend(-[WRM_HandoverManager getMotionController](v22, "getMotionController"), "getMobilityState");
            if ((_DWORD)v17)
              v30 = 0;
            else
              v30 = v26 == 1;
            v31 = v22;
            v32 = v30;
            if (v30)
            {
              -[WRM_MetricsService updateiRATMetricCellToWifi::::](v31->mMetrics, "updateiRATMetricCellToWifi::::", v16, v15, v29, v31->mReasons);
LABEL_88:
              if (byte_10027100E && v15 == (id)1)
                -[WRM_HandoverManager showHOAlertUI:](v63, "showHOAlertUI:", v32);
              goto LABEL_91;
            }
            if ((_DWORD)v17 == 1 && v26 != 1)
            {
              -[WRM_MetricsService updateiRATMetricWifiToCell::::](v63->mMetrics, "updateiRATMetricWifiToCell::::", v16, v15, v29, v63->mReasons);
              goto LABEL_88;
            }
LABEL_91:
            objc_msgSend(v9, "setLinkPreferenceNotificationRequired:", 1);
            objc_msgSend(v9, "setConnectedLinkType:", v27);
            objc_msgSend(v9, "setHandoverReasonType:", v63->mReasons);
            if (v15)
            {
              v36 = "CT_VOICE";
              v8 = v13;
              v9 = v65;
              if (v15 != (id)1)
              {
                v36 = "UNKNOWN_APP!!!";
                if (v15 == (id)2)
                  v36 = "CT_Th_Call";
              }
            }
            else
            {
              v36 = "CT_DATA";
              v8 = v13;
              v9 = v65;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}Link preference changed for application type =%lld for client =%d"), v36, v15, v9, v50);
LABEL_100:
            if ((_DWORD)v9 == 1)
              v37 = "ClientCommCenter";
            else
              v37 = v64;
            if ((_DWORD)v9 != 1 && v66 <= 0x13)
              v37 = (&off_100204DC8)[v66];
            if (v15)
            {
              v38 = "CT_VOICE";
              if (v15 != (id)1)
              {
                if (v15 == (id)2)
                  v38 = "CT_Th_Call";
                else
                  v38 = "UNKNOWN_APP!!!";
              }
            }
            else
            {
              v38 = "CT_DATA";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("<%s>{%s}Slot:%d Evaluate Handover: END."), v37, v38, objc_msgSend(v8, "getActiveSlot"));
            v12 = (char *)v12 + 1;
          }
          while (v62 != v12);
          v48 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          v62 = v48;
        }
        while (v48);
      }
      objc_msgSend(v8, "handleLinkPreferenceNotification:", 0);
      v49 = "ClientCommCenter";
      self = v63;
      if ((_DWORD)v9 != 1)
      {
        if (((_DWORD)v9 - 2) >= 0x14)
        {
          v49 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if ((_DWORD)v9 == 22)
            v49 = "ClientCoreMediaStreaming";
        }
        else
        {
          v49 = (&off_100204DC8)[(int)v9 - 2];
        }
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("<%s>Evaluate Handover: END."), v49);
      v7 = v56 + 1;
    }
    while ((id)(v56 + 1) != v55);
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  }
  while (v55);
LABEL_131:

}

- (BOOL)isEnhancedCTServiceNeeded
{
  return 1;
}

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
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: iRAT client count:%d."), "-[WRM_HandoverManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR(" No iRAT client available."));
    goto LABEL_13;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
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
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: iRAT client Context count:%d."), "-[WRM_HandoverManager doesIRATClientSubscriptionContextExist]", objc_msgSend(v9, "count"));
      if (objc_msgSend(v9, "count"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("doesIRATClientSubscriptionContextExist: Subscription Context found"));
        v6 = 1;
      }
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
LABEL_14:
  objc_sync_exit(obj);
  return v6 & 1;
}

- (int)getIWLANServiceType
{
  return -[WRM_iRATConfig ctServiceType](self->miRATConfig, "ctServiceType");
}

- (void)monitorNetworkSymptoms:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  const char *v6;
  const char *v7;

  v3 = *(_QWORD *)&a3;
  if (-[WRM_iRATConfig symtompsMetricsEnabled](self->miRATConfig, "symtompsMetricsEnabled")
    && -[WRM_SymptomsService updateAllNetworkSymptoms:](self->mSymtomsService, "updateAllNetworkSymptoms:", v3))
  {
    v5 = -[WRM_SymptomsService getNetworkScore:](self->mSymtomsService, "getNetworkScore:", v3);
    v6 = "WRM_NETWORK_TYPE_INVALID!!!";
    if ((_DWORD)v3 == 1)
      v6 = "CELLULAR";
    if (!(_DWORD)v3)
      v6 = "WIFI";
    if (v5 + 1 >= 5)
    {
      if (v5 == -2)
        v7 = "WRM_NETWORK_SCORE_ERROR         ";
      else
        v7 = "WRM_NETWORK_SCORE_INVALID_VALUE!!!";
    }
    else
    {
      v7 = off_100202790[v5 + 1];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: check symtoms service done. %s score %s "), v6, v7);
  }
}

- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForIdleApplication:(unint64_t)a3 :(int)a4
{
  unsigned int v6;
  const char *v7;

  if (-[WRM_SymptomsService isBackhaulGood](self->mSymtomsService, "isBackhaulGood", a3, *(_QWORD *)&a4))
  {
    if (a3 - 1 >= 2)
    {
      if (!a3)
      {
        v6 = -[WRM_SymptomsService isConnectedLinkGood:](self->mSymtomsService, "isConnectedLinkGood:", 0);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}isWiFiSymtompsIndicatorGoodEnoughForIdleApplication: return %d"), "CT_DATA", v6);
        goto LABEL_15;
      }
      v6 = 1;
    }
    else
    {
      v6 = -[WRM_SymptomsService isConnectedLinkGood:](self->mSymtomsService, "isConnectedLinkGood:", 0);
    }
  }
  else
  {
    v6 = 0;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      v7 = "CT_VOICE";
    }
    else
    {
      v7 = "UNKNOWN_APP!!!";
      if (a3 == 2)
        v7 = "CT_Th_Call";
    }
  }
  else
  {
    v7 = "CT_DATA";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}isWiFiSymtompsIndicatorGoodEnoughForIdleApplication: return %d"), v7, v6);
LABEL_15:
  if ((v6 & 1) != 0)
    return 1;
  if (-[WRM_SymptomsService dpdFailureDetected](self->mSymtomsService, "dpdFailureDetected"))
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 1);
  if (-[WRM_SymptomsService sipTimeOutDetected](self->mSymtomsService, "sipTimeOutDetected"))
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 64);
  -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 128);
  return 0;
}

- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  _BOOL4 v7;
  unsigned int v9;
  WCM_WiFiService *v10;
  id v11;
  id v12;
  id v13;

  v7 = a5;
  v9 = -[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType", a3, a4);
  if (v9 != 1)
  {
    v10 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
    v11 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
    v12 = -[WCM_WiFiService getCCA](v10, "getCCA");
    if (a6 == 1)
    {
      if (!v7)
      {
        v13 = objc_msgSend(v11, "minIdleWiFiCcaTh1");
        goto LABEL_9;
      }
    }
    else if (!a6)
    {
      if (v7)
        v13 = objc_msgSend(v11, "minActiveWiFiCcaTh0");
      else
        v13 = objc_msgSend(v11, "minIdleWiFiCcaTh0");
LABEL_9:
      if ((uint64_t)v12 >= (uint64_t)v13)
      {
        -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 32);
        LOBYTE(v9) = 0;
        return v9;
      }
    }
    LOBYTE(v9) = 1;
  }
  return v9;
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
  v8 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  -[WCM_WiFiService getBeaconPer](v7, "getBeaconPer");
  v10 = (uint64_t)(v9 * 100.0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR(" Beacon PER %lld"), v10);
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

- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  unsigned int v11;
  unsigned int v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v11 = -[WRM_HandoverManager isWiFiArqQualityIndicatorGoodUserData::::](self, "isWiFiArqQualityIndicatorGoodUserData::::");
  v12 = -[WRM_HandoverManager isWiFiArqQualityIndicatorGoodControlFW::::](self, "isWiFiArqQualityIndicatorGoodControlFW::::", a3, a4, v7, v6);
  LOBYTE(v6) = v12;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isWiFiArqQualityIndicatorGood: %d, isWiFiArqQualityIndicatorGoodControlFW:%d"), v11, v12);
  return v11 & v6;
}

- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  if (objc_msgSend(-[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController", a3), "symtompsMetricsEnabled"))return -[WRM_HandoverManager isWiFiSymtompsIndicatorGoodEnoughForIdleApplication::](self, "isWiFiSymtompsIndicatorGoodEnoughForIdleApplication::", a4, v5);
  else
    return 1;
}

- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  uint64_t v9;
  _BOOL4 v10;

  v5 = *(_QWORD *)&a5;
  if (!-[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType")
    && objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService"), "getServingCellType") == 10)
  {
    v9 = 0x20000;
LABEL_7:
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", v9);
    LOBYTE(v10) = 1;
    return v10;
  }
  v10 = -[WRM_HandoverManager canWiFiRadioMeetIdleApplicationRequirements:::](self, "canWiFiRadioMeetIdleApplicationRequirements:::", a3, a4, v5);
  if (v10)
  {
    v10 = -[WRM_HandoverManager canWiFiTransportMeetIdleApplicationRequirements:::](self, "canWiFiTransportMeetIdleApplicationRequirements:::", a3, a4, v5);
    if (v10)
    {
      v9 = 0x10000;
      goto LABEL_7;
    }
  }
  return v10;
}

- (void)postLinkPreference:(unint64_t)a3
{
  notify_set_state(dword_100270F50, a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("preference: notifyRecommendations: %d"), a3);
  notify_post("com.apple.WRM.iRAT_event.linkRecommendation");
}

- (void)notifyRecommendations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = dword_100270B48;
  v4 = byte_100270F20;
  v5 = byte_100270F21;
  v6 = byte_100270F22;
  v7 = byte_100270F23;
  v8 = byte_100270F25 & 1;
  v9 = ((unint64_t)byte_100270F24 << 40) & 0xFFFEFFFFFFFFFFFFLL | (v8 << 48) | ((unint64_t)byte_100270F23 << 32) | ((unint64_t)byte_100270F22 << 24) | ((unint64_t)byte_100270F21 << 16) | ((unint64_t)byte_100270F20 << 8) | dword_100270B48;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("notifyRecommendations updated: m5GAvailable: %d"), byte_100270F24);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("notifyRecommendations updated: mUsingPrivateNetwork: %d"), v8);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("notifyRecommendations updated: preferred link: %d, wifiscore: %d, wifi conf: %d, cell score: %d, cell conf:%d, Private network Enabled:%d, preference:%d"), v3, v4, v5, v6, v7, v8, v9);
  -[WRM_HandoverManager postLinkPreference:](self, "postLinkPreference:", v9);
  byte_100270F41 = 0;
}

- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  unsigned int v11;
  _BOOL4 v12;

  if (a4)
  {
    v8 = *(_QWORD *)&a7;
    v9 = *(_QWORD *)&a6;
    v10 = a5;
    v11 = -[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType", a3);
    if (v11)
    {
      if (v11 != 1)
      {
        if (v11 == 2)
          -[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeThumper:::](self, "canCellularMeetApplicationRequirementsAppTypeThumper:::", v10, v9, v8);
        goto LABEL_7;
      }
    }
    else
    {
      v12 = -[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeWiFiCalling:::](self, "canCellularMeetApplicationRequirementsAppTypeWiFiCalling:::", v10, v9, v8);
      if (!v12)
        return v12;
    }
LABEL_9:
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 512);
    LOBYTE(v12) = 1;
    return v12;
  }
  if (-[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeData](self, "canCellularMeetApplicationRequirementsAppTypeData", a3, 0, a5, *(_QWORD *)&a6, *(_QWORD *)&a7))
  {
    goto LABEL_9;
  }
LABEL_7:
  LOBYTE(v12) = 0;
  return v12;
}

- (BOOL)isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  unsigned int v7;
  char *v8;
  float v9;
  float v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v17;
  const __CFString *v18;
  uint64_t v19;
  char *v20;
  double v21;

  v3 = a3;
  v5 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v6 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v7 = objc_msgSend(v6, "getServingCellType");
  v8 = (char *)objc_msgSend(v6, "getCurrentSignalBars");
  objc_msgSend(v6, "getCurrentMovAvgSignalBars");
  v10 = v9;
  v11 = objc_msgSend(v5, "getCellularDataLQM");
  v12 = objc_msgSend(v6, "isAudioQualityGood");
  v13 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v14 = v13;
  if (v3)
    v15 = 0;
  else
    v15 = 2;
  switch(v7)
  {
    case 1u:
      return -[WRM_HandoverManager isLteEntryCriteriaMetCurrentLinkWiFi:](self, "isLteEntryCriteriaMetCurrentLinkWiFi:", v15);
    case 2u:
      if ((uint64_t)v8 >= (uint64_t)((char *)objc_msgSend(v13, "minSigBarTh0") - v15)
        && (float)(v10 * 10.0) > (float)(uint64_t)objc_msgSend(v14, "minMovSigBarTh0")
        && v11 - 1 >= 0x31
        && ((v12 ^ 1) & 1) == 0)
      {
        v17 = 1;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi met: LQM POOR. CS Audio Quality: %d, SigBars:%d, MovAvgBars:%f"), 1, v8, v10);
        return v17;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi Entry Criteria not met, CS Audio Quality:%d, SigBars:%d, MovAvgBars:%f"), v12, v8, v10);
      return 0;
    case 9u:
      return -[WRM_HandoverManager isNrEntryCriteriaMetCurrentLinkWiFi:](self, "isNrEntryCriteriaMetCurrentLinkWiFi:", v15);
    case 0xAu:
      v18 = CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi not met: ServingCell not known");
      goto LABEL_20;
    default:
      if ((uint64_t)v8 < (uint64_t)((char *)objc_msgSend(v13, "minSigBarTh0") - v15)
        || (float)(v10 * 10.0) <= (float)(uint64_t)objc_msgSend(v14, "minMovSigBarTh0")
        || v11 - 1 < 0x31
        || ((v12 ^ 1) & 1) != 0)
      {
        v21 = v10;
        v19 = v12;
        v20 = v8;
        v18 = CFSTR("default: isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi not met. CS Audio Quality: %d,SigBars:%d,MovAvgBars:%f");
LABEL_20:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v18, v19, v20, *(_QWORD *)&v21);
        return 0;
      }
      else
      {
        v17 = 1;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("default: isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi met. CS Audio Quality: %d, SigBars:%d,MovAvgBars:%f"), 1, v8, v10);
      }
      return v17;
  }
}

- (BOOL)evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:(int)a3 :(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  _BOOL8 v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService"), "isVoLTESupported");
  if (v4)
    return -[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:](self, "canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:", v5);
  v8 = v7;
  v9 = -[WRM_HandoverManager can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:](self, "can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:", v5) & v7;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:CellualrEval Status:%d, VoLTE enabled:%d"), v9, v8);
  return v9;
}

- (BOOL)evaluateCellularLinkForWiFiCallingCellPreferredPolicy:(int)a3 :(BOOL)a4
{
  if (a4)
    return -[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:](self, "canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:", *(_QWORD *)&a3);
  else
    return -[WRM_HandoverManager canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:](self, "canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:", *(_QWORD *)&a3);
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3
{
  id v5;
  unsigned int v6;
  char *v7;
  id v8;
  unsigned int v9;
  id v10;
  const char *v11;
  const __CFString *v12;
  const __CFString *v13;
  char *v15;
  id v16;

  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = objc_msgSend(v5, "getServingCellType");
  v7 = (char *)objc_msgSend(v5, "getCurrentSignalBars");
  v8 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v9 = objc_msgSend(v5, "isVoLTESupported");
  v10 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, VoLTE enabled: %d"), v9);
  if (v6 == 10)
  {
    v11 = "UNKNOWN_RADIO ";
  }
  else if (v6 - 1 >= 8)
  {
    v11 = "UNKNOWN_RADIO!!!";
    if (v6 == 9)
      v11 = "N_RADIO";
  }
  else
  {
    v11 = off_100202750[v6 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Signal BARs =%ld, Registration Status = %d, Serving Cell Type: %s, Data LQM=%d"), v7, self->deviceRegisteredWithCellularNetwork, v11, v8);
  if (a3 == 2)
  {
    if (-[WRM_HandoverManager isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone](self, "isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone"))
    {
      v12 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone true");
      goto LABEL_32;
    }
    v13 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone false");
    goto LABEL_35;
  }
  if (a3 == 1)
  {
    if (-[WRM_HandoverManager isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:](self, "isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:", 0))
    {
      v12 = CFSTR("isCellularEntryCriteriaMetForCellularCallCurrentLinkWiFi true");
LABEL_32:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v12, v15, v16);
      return 1;
    }
    v13 = CFSTR("isCellularEntryCriteriaMetForCellulaVoiceCurrentLinkWiFi false");
    goto LABEL_35;
  }
  switch(v6)
  {
    case 1u:
      if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:](self, "isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:", 0))
      {
        v12 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false");
        goto LABEL_32;
      }
      v13 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true");
      goto LABEL_35;
    case 2u:
      if (!-[WRM_HandoverManager isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS](self, "isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS"))
      {
        v12 = CFSTR("isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS not met");
        goto LABEL_32;
      }
      v13 = CFSTR("isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS met");
      goto LABEL_35;
    case 9u:
      if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:](self, "isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:", 0))
      {
        v12 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkNR false");
        goto LABEL_32;
      }
      v13 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkNR true");
      goto LABEL_35;
  }
  if (v6 != 10)
  {
    if (((uint64_t)v7 > (uint64_t)((char *)objc_msgSend(v10, "minSigBarTh1") + 1) || (int)v8 >= 11)
      && (uint64_t)v7 > (uint64_t)objc_msgSend(v10, "minSigBarTh1"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("signal bar: %d, data LQM: %d"), v7, v8);
      return 1;
    }
    v15 = v7;
    v16 = v8;
    v13 = CFSTR("signal bar: %d, data LQM: %d");
LABEL_35:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v13, v15, v16);
  }
  return 0;
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeData
{
  id v3;
  id v4;
  unsigned int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 v9;
  char v10;
  BOOL v11;
  const __CFString *v12;

  v3 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v4 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v5 = objc_msgSend(v3, "getServingCellType");
  v6 = objc_msgSend(v3, "dataAttachedWithCellularNetwork");
  v7 = objc_msgSend(v3, "cellularDataEnabled");
  v8 = objc_msgSend(v4, "getCellularDataLQM");
  if (v5 == 10)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9 & v7;
  if (v8 > 0x31)
    v11 = v10;
  else
    v11 = 0;
  if (v11)
  {
    v12 = CFSTR("CT_DATA meet application requirements");
  }
  else
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x20000);
    v12 = CFSTR("CT_DATA can't meet application requirements");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v12);
  return v11;
}

- (void)updateHandoverReasonCode:(int)a3
{
  self->mReasons |= a3;
}

- (void)updateControllerState:(id)a3
{
  NSObject *mQueue;
  _QWORD v4[6];

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000193FC;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)updateCellularMetricsMovAverage
{
  id v2;

  v2 = -[WRM_HandoverManager getCTService](self, "getCTService");
  if (v2)
    objc_msgSend(v2, "updateMovAverageOfSignalBar");
}

- (void)toggleSAState:(BOOL)a3
{
  NSObject *mQueue;
  _QWORD v4[5];
  BOOL v5;

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007038;
  v4[3] = &unk_100201E38;
  v5 = a3;
  v4[4] = self;
  dispatch_async(mQueue, v4);
}

- (void)setWiFiLinkDown:(BOOL)a3
{
  byte_100271014 = a3;
}

- (void)notifyEHBState:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = a3;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyEHBState : mQMINasClientPrimary: %x"), self->mQMINasClientPrimary);
    -[WRM_QMINasClient notifyStreamingEBHState:](self->mQMINasClientPrimary, "notifyStreamingEBHState:", v3);
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyEHBState : mIBIClient: %x"), self->mIBIClient);
    -[WRM_IceClientDriver notifyStreamingEBHState::](self->mIBIClient, "notifyStreamingEBHState::", 1);
  }
}

- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = a4;
  v5 = a3;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyAVStatus : mQMINasClientPrimary: %x"), self->mQMINasClientPrimary);
    -[WRM_QMINasClient notifyAVStatus::](self->mQMINasClientPrimary, "notifyAVStatus::", v5, v4);
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyAVStatus : mIBIClient: %x"), self->mIBIClient);
    -[WRM_IceClientDriver notifyAVStatus:::](self->mIBIClient, "notifyAVStatus:::", 1, v5);
  }
}

- (BOOL)needWiFiLQM
{
  _BOOL4 v2;
  const char *v3;

  v2 = -[WRM_HandoverManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist");
  v3 = "NO";
  if (v2)
    v3 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: needWiFiLQM? %s "), "-[WRM_HandoverManager needWiFiLQM]", v3);
  return v2;
}

- (void)monitorTransportMetrics
{
  -[WRM_HandoverManager monitorNetworkSymptoms:](self, "monitorNetworkSymptoms:", 0);
}

- (BOOL)isRecentDevice
{
  unsigned int v2;
  int32x4_t v3;
  char v4;
  BOOL v6;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v3 = vdupq_n_s32(v2);
  v4 = vmaxvq_u8((uint8x16_t)vorrq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED70), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED60)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED50), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED40))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DEDB0), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DEDA0)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED90), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DED80))))) | (v2 == 170);
  v6 = v2 == 172 || v2 - 13 < 2;
  return (v4 | v6) & 1;
}

- (BOOL)isQmiSdmSupported
{
  return !-[WRM_HandoverManager disableQMIClient](self, "disableQMIClient");
}

- (BOOL)isActiveHandoverSupported
{
  return byte_10027100C;
}

- (void)initHandoverReasonCode
{
  self->mReasons = 0;
}

- (id)getiRATConfigController
{
  return self->miRATConfig;
}

- (id)getWiFiController
{
  return self->mWiFi;
}

- (id)getSymptomsService
{
  return self->mSymtomsService;
}

- (int64_t)getSNRHysteresis
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t result;

  v3 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  switch(objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState"))
  {
    case 0u:
      v4 = CFSTR("Device motion: STATIONARY");
      goto LABEL_7;
    case 1u:
      v5 = CFSTR("Device motion: WALKING");
      goto LABEL_9;
    case 2u:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Device motion: RUNNING"));
      return (int64_t)objc_msgSend(v3, "snrHysterisisRunning");
    case 3u:
      v4 = CFSTR("Device motion: VEHICULAR");
      goto LABEL_7;
    case 4u:
      v5 = CFSTR("Device motion: PEDESTRIAN");
LABEL_9:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v5);
      result = (int64_t)objc_msgSend(v3, "snrHysterisisWalking");
      break;
    default:
      v4 = CFSTR("Device motion: UNKNOWN");
LABEL_7:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v4);
      result = 0;
      break;
  }
  return result;
}

- (id)getSCService
{
  return self->mSCService;
}

- (int64_t)getRSSIHysteresis
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t result;

  v3 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  switch(objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState"))
  {
    case 0u:
      v4 = CFSTR("Device motion: STATIONARY");
      goto LABEL_7;
    case 1u:
      v5 = CFSTR("Device motion: WALKING");
      goto LABEL_9;
    case 2u:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Device  motion: RUNNING"));
      return (int64_t)objc_msgSend(v3, "rssiHysterisisRunning");
    case 3u:
      v4 = CFSTR("Device motion: VEHICULAR");
      goto LABEL_7;
    case 4u:
      v5 = CFSTR("Device motion: PEDESTRIAN");
LABEL_9:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v5);
      result = (int64_t)objc_msgSend(v3, "rssiHysterisisWalking");
      break;
    default:
      v4 = CFSTR("Device motion: UNKNOWN");
LABEL_7:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v4);
      result = 0;
      break;
  }
  return result;
}

- (id)getMotionController
{
  return self->mMotionController;
}

- (id)getCTService
{
  return self->mCTService;
}

- (BOOL)disableQMIClient
{
  unsigned int v2;
  BOOL result;
  BOOL v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  result = 0;
  v4 = v2 > 0x39 || ((1 << v2) & 0x3FC000003EFF800) == 0;
  if (v4)
  {
    v5 = v2 - 131;
    v6 = v5 >= 0x29;
    v4 = v5 == 41;
    v7 = (1 << v5) & 0x2AA8D92A001;
    if (!v4 && v6 || v7 == 0)
      return 1;
  }
  return result;
}

- (void)initWiFiCellDataEval
{
  qword_100270F58 = -[WRM_MetricsService getWRM5GVersusWiFiLinkPreferenceMetrics](self->mMetrics, "getWRM5GVersusWiFiLinkPreferenceMetrics");
  *(_BYTE *)(qword_100270F58 + 148) = 0;
  byte_100270F43 = 0;
  notify_register_check("com.apple.WRM.iRAT_event.linkRecommendation", &dword_100270F50);
  -[WRM_HandoverManager registerSFRestartNotification](self, "registerSFRestartNotification");
  -[WRM_HandoverManager registerSFOutrankDecisionNotification](self, "registerSFOutrankDecisionNotification");
  -[WRM_HandoverManager registerThermalTimeToThrottleNotification](self, "registerThermalTimeToThrottleNotification");
  -[WRM_HandoverManager registerThermalNotificationReasonToThrottle](self, "registerThermalNotificationReasonToThrottle");
}

- (void)forceActiveModeEval:(BOOL)a3
{
  NSObject *mQueue;
  _QWORD block[4];
  BOOL v5;

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043DB4;
  block[3] = &unk_100201FF0;
  v5 = a3;
  dispatch_async(mQueue, block);
}

- (void)triggerHarvestDataEval
{
  id v2;

  v2 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  objc_msgSend(v2, "triggerHarvestedCellEval");
  objc_msgSend(v2, "triggerLocationUpdate");
}

- (BOOL)isWiFiAppEntryCriteriaMet
{
  _BOOL4 v2;
  double v4;

  v4 = 0.0;
  if (byte_100270F43
    && (qword_100270F38 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), objc_msgSend((id)qword_100270F38, "getPredictedWiFiBandwidth:", &v4)))
  {
    qword_100270F28 = *(_QWORD *)&v4;
    v2 = v4 > 10.0;
  }
  else
  {
    v2 = 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isWiFiAppEntryCriteriaMet: BW:%f, eval status: %d, appActive:%d"), qword_100270F28, v2, byte_100270F43);
  return v2;
}

- (BOOL)isWiFiAppExitCriteriaMet
{
  return 0;
}

- (BOOL)isAppQualityGoodOnWiFi:(int)a3
{
  id v5;

  v5 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton");
  qword_100270F38 = (uint64_t)v5;
  if (dword_100270F30 != 1)
  {
    if (a3 == 1)
      return 1;
LABEL_5:
    -[WRM_HandoverManager isWiFiAppEntryCriteriaMet](self, "isWiFiAppEntryCriteriaMet");
    return 1;
  }
  if (a3 != 1)
    goto LABEL_5;
  objc_msgSend(v5, "isWiFiStreamingExitCriteriaMet");
  return 1;
}

- (BOOL)isCellularThroughputGood
{
  return 1;
}

- (void)handleAVGStreamingThroughput:(float)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Streaming Th: %f"), a3);
}

- (void)registerSFOutrankDecisionNotification
{
  const __CFString *v2;
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100043FE4;
  handler[3] = &unk_100201FD0;
  handler[4] = self;
  if (notify_register_dispatch("com.apple.symptoms.celloutrankrecommendation", &dword_100270F44, (dispatch_queue_t)&_dispatch_main_q, handler))
  {
    v2 = CFSTR("registerSFOutrankDecisionNotification returned error");
  }
  else
  {
    v2 = CFSTR("registerSFOutrankDecisionNotification did not return error");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v2);
}

- (void)registerSFRestartNotification
{
  _QWORD v2[5];
  int out_token;

  out_token = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000441E0;
  v2[3] = &unk_100201FD0;
  v2[4] = self;
  if (notify_register_dispatch("com.apple.symptoms.managed_events.startup", &out_token, (dispatch_queue_t)&_dispatch_main_q, v2))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerSFRestartNotification returned error"));
  }
}

- (void)registerThermalTimeToThrottleNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalTimeToThrottleNotification: start"));
  if (notify_register_dispatch("com.apple.thermal.timeToMitigate", &dword_100270F4C, (dispatch_queue_t)&_dispatch_main_q, &stru_100202358))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalTimeToThrottleNotification returned error"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalTimeToThrottleNotification returned: %d"), 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100044368, CFSTR("com.apple.thermal.timeToMitigate"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)registerThermalNotificationReasonToThrottle
{
  __CFNotificationCenter *DarwinNotifyCenter;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalNotificationReasonToThrottle: start"));
  if (notify_register_dispatch("com.apple.thermal.mitigationReasonCode", &dword_100270F48, (dispatch_queue_t)&_dispatch_main_q, &stru_100202378))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalNotificationReasonToThrottle returned error"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerThermalNotificationReasonToThrottle did not return error"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100044500, CFSTR("com.apple.thermal.mitigationReasonCode"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)handleDataPlanUpdate:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleDataPlanUpdate recevied"));
}

- (void)submitWiFiVersusCellAWDMetrics
{
  WCM_WiFiService *v3;
  id v4;
  id v5;
  unsigned int v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  double v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  float v38;
  unsigned int v39;
  unsigned int v40;
  double v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;

  v3 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v4 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSCService");
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    v5 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    v6 = objc_msgSend(v5, "getCTDataIndictor");
    v7 = objc_msgSend(v5, "getFR2Status");
    *(_BYTE *)(qword_100270F58 + 149) = v7;
    v8 = objc_msgSend(v5, "getLocationDBFR1Count");
    *(_DWORD *)(qword_100270F58 + 152) = v8;
    v9 = objc_msgSend(v5, "getLocationDBFR2Count");
    v10 = qword_100270F58;
    *(_DWORD *)(qword_100270F58 + 156) = v9;
    *(_DWORD *)(v10 + 184) = byte_100270F23;
    v11 = objc_msgSend(v5, "getRadioCoverage");
    *(_DWORD *)(qword_100270F58 + 188) = v11;
    v12 = objc_msgSend(v5, "getRadioFrequency");
    v13 = qword_100270F58;
    *(_DWORD *)(qword_100270F58 + 164) = *(double *)&qword_100270F28;
    v14 = byte_100270F21;
    *(_DWORD *)(v13 + 172) = byte_100270F20;
    *(_DWORD *)(v13 + 176) = v14;
    *(_DWORD *)(v13 + 180) = byte_100270F22;
    v15 = dword_100270F30;
    v16 = byte_100270F54;
    *(_DWORD *)(v13 + 192) = v12;
    *(_DWORD *)(v13 + 196) = v16;
    *(_DWORD *)(v13 + 200) = v15;
    *(_BYTE *)(v13 + 160) = byte_100270F42;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateWiFiVersusCell: send metric: locationDBFR1Count %d"), *(unsigned int *)(v13 + 152), objc_msgSend(v5, "getLocationDBFR1Count"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateWiFiVersusCell: send metric: locationDBFR2Count %d"), *(unsigned int *)(qword_100270F58 + 156), objc_msgSend(v5, "getLocationDBFR2Count"));
  }
  else
  {
    v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
    v6 = 0;
  }
  *(_DWORD *)(qword_100270F58 + 88) = dword_100270B48;
  v17 = objc_msgSend(v4, "getCellularDataLQM");
  *(_DWORD *)(qword_100270F58 + 8) = v17;
  objc_msgSend(v5, "getMeasureBWDataSlot");
  *(_QWORD *)(qword_100270F58 + 12) = v18;
  v19 = objc_msgSend(v5, "getDataSlotLoad");
  v20 = qword_100270F58;
  *(_DWORD *)(qword_100270F58 + 20) = v19;
  *(_DWORD *)(v20 + 24) = 0;
  *(_QWORD *)(v20 + 40) = 0;
  *(_DWORD *)(v20 + 48) = 0;
  v21 = objc_msgSend(v5, "getRRCState");
  v22 = qword_100270F58;
  *(_DWORD *)(qword_100270F58 + 80) = v21;
  *(_DWORD *)(v22 + 84) = 0;
  if (objc_msgSend(v5, "getServingCellType") == 9)
  {
    *(_QWORD *)(qword_100270F58 + 72) = CFSTR("N_RADIO");
    objc_msgSend(v5, "getNrRSRP");
    *(_DWORD *)(qword_100270F58 + 56) = (uint64_t)v23;
    objc_msgSend(v5, "getNrRSRQ");
    *(_DWORD *)(qword_100270F58 + 60) = (uint64_t)v24;
    objc_msgSend(v5, "getNrSNR");
    *(_DWORD *)(qword_100270F58 + 64) = (uint64_t)v25;
    v26 = objc_msgSend(v5, "isDeviceUsingFR2Radio");
    v27 = qword_100270F58;
    if (v26)
    {
LABEL_6:
      *(_DWORD *)(v27 + 52) = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "getServingCellType") == 1)
  {
    *(_QWORD *)(qword_100270F58 + 72) = CFSTR("LTE_RADIO");
    objc_msgSend(v5, "getServingCellRSRP");
    *(_DWORD *)(qword_100270F58 + 28) = (uint64_t)v28;
    objc_msgSend(v5, "getServingCellRSRQ");
    *(_DWORD *)(qword_100270F58 + 32) = (uint64_t)v29;
    objc_msgSend(v5, "getServingCellSNR");
    *(_DWORD *)(qword_100270F58 + 36) = (uint64_t)v30;
    if (v6 > 0x12 || ((1 << v6) & 0x70100) == 0)
      goto LABEL_13;
    objc_msgSend(v5, "getNrRSRP");
    *(_DWORD *)(qword_100270F58 + 56) = (uint64_t)v31;
    objc_msgSend(v5, "getNrRSRQ");
    *(_DWORD *)(qword_100270F58 + 60) = (uint64_t)v32;
    objc_msgSend(v5, "getNrSNR");
    v27 = qword_100270F58;
    *(_DWORD *)(qword_100270F58 + 64) = (uint64_t)v33;
    *(_DWORD *)(v27 + 68) = 1;
    if ((v6 & 0xFFFFFFFE) == 0x10)
      goto LABEL_6;
LABEL_11:
    *(_DWORD *)(v27 + 52) = 0;
    goto LABEL_13;
  }
  *(_QWORD *)(qword_100270F58 + 72) = CFSTR("UNKNOWN_RADIO");
LABEL_13:
  if (-[WCM_WiFiService isWiFiPrimaryInterface](v3, "isWiFiPrimaryInterface"))
  {
    v34 = -[WCM_WiFiService getPointOfInterest](v3, "getPointOfInterest");
    *(_DWORD *)(qword_100270F58 + 92) = v34;
    v35 = -[WCM_WiFiService getCCA](v3, "getCCA");
    *(_DWORD *)(qword_100270F58 + 96) = v35;
    v36 = -[WCM_WiFiService getChannelUtlization](v3, "getChannelUtlization");
    *(_DWORD *)(qword_100270F58 + 104) = v36;
    v37 = -[WCM_WiFiService getRSSI](v3, "getRSSI");
    *(_DWORD *)(qword_100270F58 + 108) = v37;
    -[WCM_WiFiService getRxPhyRate](v3, "getRxPhyRate");
    *(_DWORD *)(qword_100270F58 + 112) = (int)v38;
    v39 = -[WCM_WiFiService getSNR](v3, "getSNR");
    *(_DWORD *)(qword_100270F58 + 116) = v39;
    v40 = -[WCM_WiFiService getConnectedStationCount](v3, "getConnectedStationCount");
    *(_DWORD *)(qword_100270F58 + 120) = v40;
    -[WCM_WiFiService getTxPer](v3, "getTxPer");
    *(_DWORD *)(qword_100270F58 + 124) = (v41 * 100.0);
    v42 = -[WCM_WiFiService getWghtAverageRXPhyRate](v3, "getWghtAverageRXPhyRate");
    *(_DWORD *)(qword_100270F58 + 128) = v42;
    v43 = -[WCM_WiFiService getWghtAverageSNR](v3, "getWghtAverageSNR");
    *(_DWORD *)(qword_100270F58 + 132) = v43;
    v44 = -[WCM_WiFiService getWghtAverageTXPhyRate](v3, "getWghtAverageTXPhyRate");
    *(_DWORD *)(qword_100270F58 + 136) = v44;
    v45 = -[WCM_WiFiService getWghtAverageRSSI](v3, "getWghtAverageRSSI");
    v46 = qword_100270F58;
    *(_DWORD *)(qword_100270F58 + 100) = 0;
    *(_QWORD *)(v46 + 140) = v45;
  }
  else
  {
    v47 = qword_100270F58;
    *(_OWORD *)(qword_100270F58 + 92) = 0u;
    *(_OWORD *)(v47 + 108) = 0u;
    *(_OWORD *)(v47 + 124) = 0u;
    *(_QWORD *)(v47 + 140) = 0;
  }
  objc_msgSend(-[WRM_MetricsService getAWDService](self->mMetrics, "getAWDService"), "submitMeric5GVersusWiFiLinkMetrics");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateWiFiVersusCell: submitAWDMetrics"));
}

- (void)evalExitForceOutranking
{
  NSObject *mQueue;
  _QWORD block[5];

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044A48;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)evalFR2CoverageLikely:(BOOL)a3
{
  if (byte_100270F24 != a3)
  {
    byte_100270F24 = a3;
    -[WRM_HandoverManager notifyRecommendations](self, "notifyRecommendations");
  }
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeThumper:(BOOL)a3 :(int)a4 :(int)a5
{
  id v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  const __CFString *v11;
  _BOOL8 v12;
  const __CFString *v13;
  unsigned int v14;
  const char *v15;

  v7 = -[WRM_HandoverManager getCTService](self, "getCTService", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = objc_msgSend(v7, "cellularDataEnabled");
  v9 = objc_msgSend(v7, "dataAttachedWithCellularNetwork");
  v10 = objc_msgSend(v7, "getServingCellType");
  if ((a4 - 1) > 1)
  {
    if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular](self, "isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular")&& ((v9 ^ 1) & 1) == 0&& ((v8 ^ 1) & 1) == 0)
    {
      v11 = CFSTR("isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular false");
      goto LABEL_8;
    }
    v13 = CFSTR("isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular true");
LABEL_11:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v13);
    v12 = 0;
    goto LABEL_12;
  }
  if ((-[WRM_HandoverManager isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi](self, "isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi") & v9 & v8) != 1)
  {
    v13 = CFSTR("isCellularEntryCriteriaMetForIMSThCallCurrentLinkWiFi false");
    goto LABEL_11;
  }
  v11 = CFSTR("isCellularEntryCriteriaMetForIMSThVoIPCallCurrentLinkWiFi true");
LABEL_8:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11);
  v12 = 1;
LABEL_12:
  v14 = v10 - 1;
  if (v10 - 1 < 0xA && ((0x2FFu >> v14) & 1) != 0)
  {
    v15 = off_100202668[v14];
  }
  else
  {
    v15 = "UNKNOWN_RADIO!!!";
    if (v10 == 9)
      v15 = "N_RADIO";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Cell Link Eval Status: %d, Attach Status: %d Serving Cell Type: %s, Cellular Data Enabled: %d"), v12, self->deviceAttachedWithCellularNetwork, v15, v8);
  if ((v9 & v8 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeThumper false because cellular not ready"));
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x20000);
  }
  return v12;
}

- (BOOL)isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi
{
  id v3;
  id v4;
  unsigned int v5;
  char *v6;
  id v7;
  id v8;
  char *v9;
  BOOL v11;
  char *v12;
  char *v13;

  v3 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v4 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v5 = objc_msgSend(v4, "getServingCellType");
  v6 = (char *)objc_msgSend(v4, "getCurrentSignalBars");
  v7 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v8 = objc_msgSend(v3, "getCellularDataLQM");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularEntryCriteriaMetForIMSThCallCurrentLinkWiFi,LQM: %d, Signal Bars: %d"), v8, v6);
  switch(v5)
  {
    case 2u:
      v13 = (char *)objc_msgSend(v7, "minSigBarTh2");
      if ((int)v8 > 49 || (uint64_t)v6 >= (uint64_t)(v13 - 1))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("UMTS entry conditions are met bars:%ld"), v6);
        return 1;
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("UMTS entry conditions are not met bars:%ld"), v6);
        return 0;
      }
    case 3u:
    case 8u:
      if (byte_100270FC2)
      {
        v12 = (char *)objc_msgSend(v7, "minSigBarTh2");
        if ((int)v8 > 49 || (uint64_t)v6 >= (uint64_t)(v12 - 1))
        {
          byte_100270FC2 = 0;
          v11 = 1;
LABEL_17:
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x400000);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Thumper not supported on 2G radio:%ld"), v6);
          return v11;
        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Thumper not supported on 2G radio:%ld"), v6);
      }
      v11 = 0;
      goto LABEL_17;
    default:
      v9 = (char *)objc_msgSend(v7, "minSigBarTh2") - 1;
      return (int)v8 > 49 || (uint64_t)v6 >= (uint64_t)v9;
  }
}

- (BOOL)isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular
{
  id v3;
  unsigned int v4;
  char *v5;
  id v6;
  id v7;

  v3 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v4 = objc_msgSend(v3, "getServingCellType");
  v5 = (char *)objc_msgSend(v3, "getCurrentSignalBars");
  v6 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v7 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular,LQM: %d, Signal Bars: %d"), v6, v5);
  switch(v4)
  {
    case 3u:
    case 8u:
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x400000);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular:%ld"), v5);
      return 1;
    default:
      if (((uint64_t)v5 > (uint64_t)((char *)objc_msgSend(v7, "minSigBarTh1") + 1) || (int)v6 >= 11)
        && (uint64_t)v5 > (uint64_t)objc_msgSend(v7, "minSigBarTh1"))
      {
        return 0;
      }
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x80000);
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x40000);
      return 1;
  }
}

- (BOOL)evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy:(int)a3 :(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v6 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v7 = objc_msgSend(v6, "getServingCellType");
  v8 = objc_msgSend(v6, "isVoLTESupported");
  v9 = objc_msgSend(v6, "getCurrentSignalBars");
  v10 = objc_msgSend(v6, "getLteVoiceLQM");
  if ((_DWORD)v5 == 1 && v4)
  {
    if ((v7 & 0xFFFFFFF7) == 1)
      v11 = v8;
    else
      v11 = 0;
  }
  else
  {
    v13 = v9 != (id)1 && v10 != 10;
    if (!v4)
      v13 = 1;
    if ((_DWORD)v5)
      v11 = 1;
    else
      v11 = v13;
  }
  if ((_DWORD)v7 == 10)
    v14 = 0;
  else
    v14 = v11;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy servingCellType:%d,VoLTE status:%d, call status:%d, evalStatus:%d, connected link: %d"), v7, v8, v4, v14, v5);
  return v14;
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:(int)a3
{
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL result;
  const __CFString *v10;
  const __CFString *v11;

  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = objc_msgSend(v5, "getServingCellType");
  v7 = objc_msgSend(v5, "isVoLTESupported");
  v8 = objc_msgSend(v5, "isIMSPreferenceEnabled");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive, VoLTE enabled: %d, IMS_preference: %d"), v7, v8);
  if (a3 != 1)
  {
    if (v6 == 9)
    {
      if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:](self, "isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:", 1))
      {
        v10 = CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR false");
        goto LABEL_18;
      }
      v11 = CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR true");
    }
    else
    {
      if (v6 != 1)
        return 0;
      if (!-[WRM_HandoverManager isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:](self, "isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:", 1))
      {
        v10 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false");
        goto LABEL_18;
      }
      v11 = CFSTR("isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true");
    }
LABEL_14:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11);
    return 0;
  }
  result = 0;
  if (v6 == 1 && ((v7 ^ 1) & 1) == 0 && ((v8 ^ 1) & 1) == 0)
  {
    if (-[WRM_HandoverManager isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:](self, "isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:", 1))
    {
      v10 = CFSTR("isCellularEntryCriteriaMetForCellularCallCurrentLinkWiFi true");
LABEL_18:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v10);
      return 1;
    }
    v11 = CFSTR("isCellularEntryCriteriaMetForCellulaVoiceCurrentLinkWiFi false");
    goto LABEL_14;
  }
  return result;
}

- (BOOL)isNrEntryCriteriaMetCurrentLinkNone
{
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  BOOL v7;
  const __CFString *v8;

  v3 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v4 = objc_msgSend(v3, "getCurrentSignalBars");
  v5 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v6 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported")
    && objc_msgSend(v3, "isVoiceLQMValid"))
  {
    if ((int)objc_msgSend(v3, "getLteVoiceLQM") >= 50 && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
    {
      v7 = 1;
      v8 = CFSTR("isEntryCriteriaMetCurrentLinkNone met: Voice LQM GOOD or POOR");
    }
    else
    {
      v7 = 0;
      v8 = CFSTR("isEntryCriteriaMetCurrentLinkNone not met: Voice LQM Bad");
    }
  }
  else if (v5 - 50 <= 0xFFFFFFCE && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
  {
    v7 = 1;
    v8 = CFSTR("isEntryCriteriaMetCurrentLinkNone: Data LQM better than kPOOR");
  }
  else
  {
    v7 = 0;
    v8 = CFSTR("isEntryCriteriaMetCurrentLinkNone: Entry Criteria not met");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v8);
  return v7;
}

- (BOOL)isLteEntryCriteriaMetCurrentLinkNone
{
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  BOOL v7;
  const __CFString *v8;

  v3 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v4 = objc_msgSend(v3, "getCurrentSignalBars");
  v5 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v6 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported")
    && objc_msgSend(v3, "isVoiceLQMValid"))
  {
    if ((int)objc_msgSend(v3, "getLteVoiceLQM") >= 50 && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
    {
      v7 = 1;
      v8 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met: Voice LQM GOOD or POOR");
    }
    else
    {
      v7 = 0;
      v8 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met: Voice LQM Bad");
    }
  }
  else if (v5 - 50 <= 0xFFFFFFCE && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
  {
    v7 = 1;
    v8 = CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkNone: Data LQM better than kPOOR");
  }
  else
  {
    v7 = 0;
    v8 = CFSTR("isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkNone: Entry Criteria not met");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v8);
  return v7;
}

- (BOOL)isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone
{
  id v3;
  unsigned int v4;
  id v5;
  unsigned int v6;
  id v7;
  BOOL result;
  const __CFString *v9;
  const __CFString *v10;

  v3 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v4 = objc_msgSend(v3, "getServingCellType");
  v5 = objc_msgSend(v3, "getCurrentSignalBars");
  v6 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
  v7 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  result = 0;
  switch(v4)
  {
    case 1u:
      return -[WRM_HandoverManager isLteEntryCriteriaMetCurrentLinkNone](self, "isLteEntryCriteriaMetCurrentLinkNone");
    case 2u:
      if ((uint64_t)v5 >= (uint64_t)objc_msgSend(v7, "minSigBarTh2") && v6 - 50 <= 0xFFFFFFCE)
      {
        v9 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met: LQM GOOD or POOR");
        goto LABEL_9;
      }
      v10 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met:LQM Bad");
      goto LABEL_13;
    case 9u:
      return result;
    case 0xAu:
      v10 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met: ServingCell not known");
      goto LABEL_13;
    default:
      if ((uint64_t)v5 < (uint64_t)objc_msgSend(v7, "minSigBarTh2") || v6 - 50 > 0xFFFFFFCE)
      {
        v10 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met");
LABEL_13:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v10);
        return 0;
      }
      else
      {
        v9 = CFSTR("isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met");
LABEL_9:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v9);
        return 1;
      }
  }
}

- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  id v12;
  id v13;
  char *v14;
  _BOOL4 v15;
  WRM_HandoverManager *v16;
  uint64_t v17;
  id v18;
  char *v19;
  BOOL result;
  char *v21;

  v3 = a3;
  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = objc_msgSend(v5, "getServingCellType");
  objc_msgSend(v5, "getServingCellRSRP");
  v8 = v7;
  objc_msgSend(v5, "getCurrentAudioErasure");
  v10 = v9;
  v11 = objc_msgSend(v5, "isSrvccHandoverInProgress");
  v12 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (v11 && v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLT did not meet: SRVCC Handover in progress"));
    return 0;
  }
  if (!-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported")
    || !objc_msgSend(v5, "isVoiceLQMValid")
    || v6 != 1)
  {
    v18 = objc_msgSend(-[WRM_HandoverManager getSCService](self, "getSCService"), "getCellularDataLQM");
    v19 = (char *)objc_msgSend(v5, "getCurrentSignalBars");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE, Data LQM: %d, Signal Bars: %d"), v18, v19);
    if (((int)v18 > 10 || (uint64_t)v19 > (uint64_t)((char *)objc_msgSend(v12, "minSigBarTh1") + 1))
      && (uint64_t)v19 > (uint64_t)objc_msgSend(v12, "minSigBarTh1"))
    {
      return 0;
    }
    goto LABEL_26;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluating LTE Link Quality Metrics"));
  v13 = objc_msgSend(v5, "getLteVoiceLQM");
  v14 = (char *)objc_msgSend(v5, "getCurrentSignalBars");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE, Voice LQM: %d, Signal Bars: %d, RSRP: %f, Erasure: %f"), v13, v14, *(_QWORD *)&v8, *(_QWORD *)&v10);
  if (!v3)
  {
    if (((_DWORD)v13 != 10 || (uint64_t)v14 > (uint64_t)((char *)objc_msgSend(v12, "minSigBarTh1") + 1))
      && (uint64_t)v14 > (uint64_t)objc_msgSend(v12, "minSigBarTh1"))
    {
      return 0;
    }
    goto LABEL_26;
  }
  v15 = v8 <= -115.0 && v10 >= 5.0;
  if ((_DWORD)v13 == 10)
  {
    if (!v15)
    {
      v16 = self;
      v17 = 0x80000;
LABEL_27:
      -[WRM_HandoverManager updateHandoverReasonCode:](v16, "updateHandoverReasonCode:", v17);
      return 1;
    }
LABEL_23:
    v16 = self;
    v17 = 0x100000;
    goto LABEL_27;
  }
  if (v15)
    goto LABEL_23;
  v21 = (char *)objc_msgSend(v12, "minSigBarTh1");
  result = 0;
  if ((uint64_t)v14 <= (uint64_t)v21 && (int)v13 < 51)
  {
LABEL_26:
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x80000);
    v16 = self;
    v17 = 0x40000;
    goto LABEL_27;
  }
  return result;
}

- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  unsigned int v6;
  id v7;
  BOOL result;
  id v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  WRM_HandoverManager *v16;
  uint64_t v17;
  char *v18;

  v3 = a3;
  v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v6 = objc_msgSend(v5, "isSrvccHandoverInProgress");
  v7 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  if (v6 && v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLT did not meet: SRVCC Handover in progress"));
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluating LTE Link Quality when device is camped on NR CELL"));
  v9 = objc_msgSend(v5, "getLteVoiceLQM");
  v10 = (char *)objc_msgSend(v5, "getCurrentSignalBars");
  objc_msgSend(v5, "getServingCellRSRP");
  v12 = v11;
  objc_msgSend(v5, "getCurrentAudioErasure");
  v14 = v13;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR, Voice LQM: %d, Signal Bars: %d, RSRP: %f, Erasure:%f"), v9, v10, *(_QWORD *)&v12, *(_QWORD *)&v13);
  if (!v3)
  {
    if (((_DWORD)v9 != 10 || (uint64_t)v10 > (uint64_t)((char *)objc_msgSend(v7, "minSigBarTh1") + 1))
      && (uint64_t)v10 > (uint64_t)objc_msgSend(v7, "minSigBarTh1"))
    {
      return 0;
    }
    goto LABEL_19;
  }
  v15 = v14 >= 5.0;
  if (v12 > -115.0)
    v15 = 0;
  if ((_DWORD)v9 == 10)
  {
    if (!v15)
    {
      v16 = self;
      v17 = 0x80000;
LABEL_20:
      -[WRM_HandoverManager updateHandoverReasonCode:](v16, "updateHandoverReasonCode:", v17);
      return 1;
    }
LABEL_16:
    v16 = self;
    v17 = 0x100000;
    goto LABEL_20;
  }
  if (v15)
    goto LABEL_16;
  v18 = (char *)objc_msgSend(v7, "minSigBarTh1");
  result = 0;
  if ((uint64_t)v10 <= (uint64_t)v18 && (int)v9 < 51)
  {
LABEL_19:
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x80000);
    v16 = self;
    v17 = 0x40000;
    goto LABEL_20;
  }
  return result;
}

- (BOOL)isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS
{
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  char *v7;
  id v8;
  BOOL v9;
  const __CFString *v10;

  v3 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v4 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v5 = objc_msgSend(v4, "isAudioQualityGood");
  v6 = objc_msgSend(v3, "getCellularDataLQM");
  v7 = (char *)objc_msgSend(v4, "getCurrentSignalBars");
  v8 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS,LQM: %d, Signal Bars: %d. CS audio quality: %d"), v6, v7, v5);
  if ((uint64_t)v7 <= (uint64_t)((char *)objc_msgSend(v8, "minSigBarTh1") + 1) && (int)v6 < 11
    || (uint64_t)v7 <= (uint64_t)objc_msgSend(v8, "minSigBarTh1"))
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x80000);
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x40000);
    v9 = 1;
    v10 = CFSTR("UMTS exit conditions are met signal bars:%ld");
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("UMTS exit conditions are not met signal bars:%ld ");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v10, v7);
  return v9;
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
  char v18;
  const __CFString *v19;
  char v21;
  int64_t v22;

  v5 = *(_QWORD *)&a5;
  v9 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  v10 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v11 = -[WCM_WiFiService getRSSI](v10, "getRSSI");
  v12 = -[WCM_WiFiService getSNR](v10, "getSNR");
  v13 = -[WRM_HandoverManager isWiFiArqQualityIndicatorGood::::](self, "isWiFiArqQualityIndicatorGood::::", a3, a4, v5, 1);
  v14 = -[WRM_HandoverManager isWiFiBeaconLossQualityIndicatorGood:::](self, "isWiFiBeaconLossQualityIndicatorGood:::", a3, a4, v5);
  v15 = -[WRM_HandoverManager isWiFiLoadQualityIndicatorGood::::](self, "isWiFiLoadQualityIndicatorGood::::", a3, a4, 1, v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetActiveApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d, Beacon Quality =%d, Load Quality =%d"), v11, v12, v13, v14, v15);
  v16 = -[WRM_HandoverManager getSNRHysteresis](self, "getSNRHysteresis");
  v17 = -[WRM_HandoverManager getRSSIHysteresis](self, "getRSSIHysteresis");
  if (a4 - 1 >= 2)
  {
    if (a4)
      v19 = CFSTR("Application category not supported");
    else
      v19 = CFSTR("canWiFiRadioMeetActiveApplicationRequirements: CT_DATA");
    goto LABEL_19;
  }
  v22 = v17;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetActiveApplicationRequirements: CT_VOICE"));
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_WIFI"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("minActiveWiFiSnrTh1 = %lld, minActiveWiFiRssiTh1 =%lld"), objc_msgSend(v9, "minActiveWiFiSnrTh1"), objc_msgSend(v9, "minActiveWiFiRssiTh1"));
      if ((uint64_t)v12 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh1") + v16)
        || ((uint64_t)v11 >= (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiRssiTh1") + v22) ? (v18 = v13) : (v18 = 0),
            (v18 & 1) == 0))
      {
        if ((uint64_t)v12 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh1") + v16))
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 4);
        if ((uint64_t)v11 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiRssiTh1") + v22))
          -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 8);
        return 0;
      }
      return 1;
    }
    v19 = CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == No Context");
LABEL_19:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v19);
    return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_CELLULAR"));
  if ((uint64_t)v12 < (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiSnrTh0") + v16))
    return 0;
  if ((uint64_t)v11 >= (uint64_t)((char *)objc_msgSend(v9, "minActiveWiFiRssiTh0") + v22))
    v21 = v15;
  else
    v21 = 0;
  return v21 & v13;
}

- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForActiveApplication:(unint64_t)a3 :(int)a4
{
  unsigned int v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v6 = -[WRM_SymptomsService getNetworkScore:](self->mSymtomsService, "getNetworkScore:", 0, *(_QWORD *)&a4);
  v7 = 0;
  if (-[WRM_SymptomsService isBackhaulGood](self->mSymtomsService, "isBackhaulGood"))
  {
    v7 = 1;
    if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL && (v6 & 0xFFFFFFFE) != 2)
      v7 = -[WRM_SymptomsService isConnectedLinkGood:](self->mSymtomsService, "isConnectedLinkGood:", 1);
  }
  v8 = "CT_DATA";
  v9 = "CT_VOICE";
  v10 = "UNKNOWN_APP!!!";
  if (a3 == 2)
    v10 = "CT_Th_Call";
  if (a3 != 1)
    v9 = v10;
  if (a3)
    v8 = v9;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}isWiFiSymtompsIndicatorGoodEnoughForActiveApplication: return %d"), v8, v7);
  if (!v7)
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 128);
    if (-[WRM_SymptomsService dpdFailureDetected](self->mSymtomsService, "dpdFailureDetected"))
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 1);
    if (-[WRM_SymptomsService sipTimeOutDetected](self->mSymtomsService, "sipTimeOutDetected"))
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 64);
  }
  return v7;
}

- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  WRM_HandoverManager *v11;
  unint64_t v12;

  v5 = *(_QWORD *)&a5;
  v8 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController", a3);
  if (a4 - 1 >= 2)
  {
    if (a4)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Application category not supported"));
    }
    else if (objc_msgSend(v8, "symtompsMetricsEnabled"))
    {
      v11 = self;
      v12 = 0;
      return -[WRM_HandoverManager isWiFiSymtompsIndicatorGoodEnoughForActiveApplication::](v11, "isWiFiSymtompsIndicatorGoodEnoughForActiveApplication::", v12, v5);
    }
  }
  else
  {
    if ((_DWORD)v5 == 1)
    {
      if (objc_msgSend(v8, "rtpMetricsEnabled"))
        return -[WRM_HandoverManager isWiFiVoIPQualityGoodEnough](self, "isWiFiVoIPQualityGoodEnough", v9, v10);
      return 1;
    }
    if (objc_msgSend(v8, "symtompsMetricsEnabled"))
    {
      v11 = self;
      v12 = a4;
      return -[WRM_HandoverManager isWiFiSymtompsIndicatorGoodEnoughForActiveApplication::](v11, "isWiFiSymtompsIndicatorGoodEnoughForActiveApplication::", v12, v5);
    }
  }
  return 1;
}

- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v7;
  _BOOL4 v11;
  id v12;
  unsigned int v13;
  unsigned int v14;

  v7 = *(_QWORD *)&a5;
  v11 = -[WRM_HandoverManager canWiFiRadioMeetActiveApplicationRequirements:::](self, "canWiFiRadioMeetActiveApplicationRequirements:::");
  if (v11)
  {
    v11 = -[WRM_HandoverManager canWiFiTransportMeetActiveApplicationRequirements:::](self, "canWiFiTransportMeetActiveApplicationRequirements:::", a3, a4, v7);
    if (v11)
    {
      v11 = -[WRM_HandoverManager isMovingAverageAudioQualityOfCurrentCallGood:](self, "isMovingAverageAudioQualityOfCurrentCallGood:", v7);
      if (v11)
      {
        v11 = -[WRM_HandoverManager isUplinkAudioQualityOfCurrentCallGood:](self, "isUplinkAudioQualityOfCurrentCallGood:", v7);
        if (v11)
        {
          v11 = -[WRM_HandoverManager isIMSTransportQualityGood](self, "isIMSTransportQualityGood");
          if (v11)
          {
            -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 0x10000);
            LOBYTE(v11) = 1;
          }
        }
      }
    }
  }
  if (!v11 && a4 == 1 && (_DWORD)v7 == 1 && a6)
  {
    v12 = -[WRM_HandoverManager getCTService](self, "getCTService");
    v13 = objc_msgSend(v12, "getServingCellType");
    v14 = objc_msgSend(v12, "isVoLTESupported");
    if (v13 == 1 && (v14 & 1) != 0)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("canWiFiMeetActiveApplicationRequirements: serving cell is not LTE so supress bad WiFi evaluation, Volte Enabled %d"), v14);
      LOBYTE(v11) = 1;
    }
  }
  return v11;
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
  unsigned int v17;

  -[NSDate timeIntervalSinceNow](self->mAudioEvaluationTimer, "timeIntervalSinceNow");
  v4 = v3;
  v5 = self->mTimeSinceAudioEvaluationStarted - v3;
  if (v5 <= 30.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: not evaluating audio quality, call too short duration:%lf"), *(_QWORD *)&v5);
    self->mTimeSinceAudioEvaluationStarted = v4;
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: evaluating audio quality, call duration:%lf"), *(_QWORD *)&v5);
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
    v11 = -[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController");
    v12 = (uint64_t)objc_msgSend(v11, "averagedNominalJitterBufferDelay");
    objc_msgSend(v11, "movAvgRxPktLoss");
    v14 = (uint64_t)v13;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: Avg RSSI: %lld, CumTX PER: %lld, AVG Nominal Jitter Buffer:%lld, RTP pkt loss:%lld "), v10, v9, v12, (uint64_t)v13);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Checking active call Quality evaluation criteria"));
    v16 = v12 <= 1000 && v14 <= 20 && v9 <= 20;
    if (v16 || v10 < -65)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Audio Quality was good"));
    }
    else
    {
      v17 = objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService"), "isVoLTESupported");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Audio Quality was bad, WiFiMetrics: TX PER THREASHOLD: %lld, RTP Loss THREASHOLD: %lld, Nominal jitter buffer delay THREASHOLD: %lld, AVG Call RSSI THREASHOLD: %lld"), 20, 20, 1000, 4294967231);
      byte_100270FC0 = 1;
      if (!v17 || !-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported"))
        -[WRM_HandoverManager setPingPongTimerMultipler:::](self, "setPingPongTimerMultipler:::", 90, dword_100271010, 1);
    }
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
    goto LABEL_20;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: ptrWiFiService==NULL"));
LABEL_20:
  byte_100270FC0 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: exit"));
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
  id v12;
  unsigned int v13;
  id v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  double v23;
  id v24;
  id v25;
  int v26;
  unsigned __int8 v27;

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
    v11 = !-[WCM_WiFiService isTxPerValid](v4, "isTxPerValid");
  }
  else
  {
    v5 = 0;
    v8 = 0;
    v10 = 0;
    v11 = 1;
    v7 = 0.0;
  }
  v12 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v13 = objc_msgSend(v12, "isVoLTESupported");
  if ((id)-[WRM_iRATConfig ctServiceType](self->miRATConfig, "ctServiceType") != (id)2
    && (!v13 || !-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported")))
  {
    v19 = CFSTR("isWiFiVoIPQualityGoodEnough:VoLTE not enabled or handover not supported on device");
    goto LABEL_13;
  }
  v14 = -[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController");
  if (!v14)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isWiFiVoIPQualityGoodEnough: tmpPtrWiFiCallingController == NULL"));
    objc_msgSend(0, "resetRTPMetrics");
    objc_msgSend(0, "resetCumulativeRTPMetrics");
    v20 = 0;
LABEL_18:
    objc_msgSend(v20, "resetPeriodicRTPStats");
    return 1;
  }
  v15 = v14;
  if (!byte_10027100D)
  {
    v21 = CFSTR("isWiFiVoIPQualityGoodEnough: Call not on WiFI");
LABEL_17:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v21);
    objc_msgSend(v15, "resetRTPMetrics");
    objc_msgSend(v15, "resetCumulativeRTPMetrics");
    v20 = v15;
    goto LABEL_18;
  }
  v16 = objc_msgSend(v12, "getCallState");
  v17 = objc_msgSend(v12, "isCallOnHold");
  v18 = objc_msgSend(v12, "isCallInConference");
  if (v16 != 1)
  {
    v21 = CFSTR("isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call not active");
    goto LABEL_17;
  }
  if ((v17 | v18) == 1)
  {
    v19 = CFSTR("isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call on hold or in conference");
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v19);
    return 1;
  }
  -[NSDate timeIntervalSinceNow](self->mLatteContextStartedTimer, "timeIntervalSinceNow");
  if (self->mTimeSinceLatteContextStarted - v23 < 3.0)
  {
    v19 = CFSTR("isWiFiVoIPQualityGoodEnough: ignoring inital RTP metrics to avoid false alarm");
    goto LABEL_13;
  }
  v24 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Rx Pkt loss: %lld, nominal buffer delay %lld"), objc_msgSend(v15, "rxPktLoss"), objc_msgSend(v15, "nominalJitterBufferDelay"));
  v25 = objc_msgSend(v15, "rxPktLoss");
  if (v25 < objc_msgSend(v24, "handoverRxPktLossThreshold")
    || v5 >= -70 && (v10 < 6 ? (v26 = 1) : (v26 = v11), v7 >= 0.3 ? (v27 = v8) : (v27 = 0), v26 == 1 && (v27 & 1) == 0))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isWiFiVoIPQualityGoodEnough: true"));
    byte_100270FC2 = 0;
    return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isWiFiVoIPQualityGoodEnough: false"));
  byte_100270FC2 = 1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WiFiMetrics: triggering handover due to RTP Erasure: %lld, RTP Erasure THREASHOLD: %lld "), objc_msgSend(v15, "rxPktLoss"), objc_msgSend(v24, "handoverRxPktLossThreshold"));
  -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 256);
  return 0;
}

- (BOOL)isMovingAverageAudioQualityOfCurrentCallGood:(int)a3
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v16;
  BOOL v17;
  double v19;
  unint64_t v20;
  unsigned int v21;
  id v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  char v27;

  if (-[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType") == 1)
    return 1;
  v5 = -[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController");
  if (byte_10027100D)
  {
    v6 = -[WRM_HandoverManager getCTService](self, "getCTService");
    v7 = objc_msgSend(v6, "getCallState");
    v8 = objc_msgSend(v6, "isCallOnHold");
    v9 = objc_msgSend(v6, "isCallInConference");
    if (v7 == 1)
    {
      v10 = v9;
      if ((id)-[WRM_iRATConfig ctServiceType](self->miRATConfig, "ctServiceType") != (id)2
        && (!objc_msgSend(v6, "isVoLTESupported")
         || !-[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported")))
      {
        v11 = CFSTR("isWiFiVoIPQualityGoodEnough:VoLTE not enabled or handover not supported on device");
        goto LABEL_18;
      }
      if ((v8 | v10) == 1)
      {
        v11 = CFSTR("isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call on hold or in conference");
LABEL_18:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11);
        return 1;
      }
      v13 = -[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController");
      if (!a3)
      {
        v11 = CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: returned");
        goto LABEL_18;
      }
      v14 = v13;
      mWiFi = self->mWiFi;
      if (mWiFi)
      {
        v16 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
        if (!v16)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: ptrWiFiService==NULL"));
          goto LABEL_31;
        }
      }
      else
      {
        v16 = 0;
      }
      -[WCM_WiFiService getMovingAverageTxPer](v16, "getMovingAverageTxPer");
      v20 = (unint64_t)(v19 * 100.0);
      v21 = -[WCM_WiFiService isMovingAverageTxPerValid](v16, "isMovingAverageTxPerValid");
      v22 = objc_msgSend(v5, "movAvgNominalJitterBufferDelay");
      objc_msgSend(v5, "movAvgRxPktLoss");
      v24 = (uint64_t)v23;
      objc_msgSend(v5, "movAvgIdleRxPktLoss");
      v26 = (uint64_t)v25;
      if ((unint64_t)(uint64_t)v25 >= 0x64)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateActiveCallQuality: discard invalid metrics"));
        v26 = 0;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: TX PER (Mov Avg): %lld, Moving Avg RTP packet loss: %lld, Moving Avg Valid: %d, Mov Jitter Buffer Delay: %lld, Total Mov AVG RTP packet loss: %lld "), v20, v24, v21, v22, v26);
      if ((unint64_t)objc_msgSend(v14, "minActiveWiFiAvgTxPktLossRateTh") < v20)
        v27 = v21;
      else
        v27 = 0;
      if ((v27 & 1) != 0
        || (uint64_t)objc_msgSend(v14, "handoverAvgRxPktLossThreshold") < v24
        || v26 > (uint64_t)objc_msgSend(v14, "handoverAvgIdleRxPktLossThreshold"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Moving average audio quality was bad, WiFiMetics: TX PER THREASHOLD: %lld, RX RTP THREASHOLD: %lld"), objc_msgSend(v14, "minActiveWiFiAvgTxPktLossRateTh"), objc_msgSend(v14, "handoverAvgRxPktLossThreshold"));
        byte_100270FC1 = 1;
        -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 256);
        -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
        v17 = 0;
LABEL_32:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: exit"));
        return v17;
      }
LABEL_31:
      v17 = 1;
      goto LABEL_32;
    }
    v12 = CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: discard WIFI RTP metrics, call not active");
  }
  else
  {
    v12 = CFSTR("isMovingAverageAudioQualityOfCurrentCallGood: Call not on WiFI");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v12);
  objc_msgSend(v5, "resetRTPMetrics");
  objc_msgSend(v5, "resetCumulativeRTPMetrics");
  objc_msgSend(v5, "resetPeriodicRTPStats");
  return 1;
}

- (BOOL)isIMSTransportQualityGood
{
  WRM_SymptomsService *mSymtomsService;
  unsigned int v4;
  _BOOL4 v5;

  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService
    && (v4 = -[WRM_SymptomsService isIMSTransportQualityGood](mSymtomsService, "isIMSTransportQualityGood"),
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: isIMSTransportQualityGood: %d"), v4), (v4 & 1) == 0))
  {
    -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 128);
    if (-[WRM_SymptomsService dpdFailureDetected](self->mSymtomsService, "dpdFailureDetected"))
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 1);
    v5 = -[WRM_SymptomsService sipTimeOutDetected](self->mSymtomsService, "sipTimeOutDetected");
    if (v5)
    {
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 64);
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isUplinkAudioQualityOfCurrentCallGood:(int)a3
{
  id v5;
  WCM_WiFiService *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned __int8 v12;
  int64_t v13;
  signed int v14;
  unsigned int v15;
  int64_t v16;
  BOOL v18;
  const __CFString *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  if (-[WRM_HandoverManager getIWLANServiceType](self, "getIWLANServiceType") != 1)
  {
    v5 = -[WRM_HandoverManager getCTService](self, "getCTService");
    if (objc_msgSend(v5, "getCallState") == 1)
    {
      if ((id)-[WRM_iRATConfig ctServiceType](self->miRATConfig, "ctServiceType") == (id)2
        || objc_msgSend(v5, "isVoLTESupported")
        && -[WRM_HandoverManager isActiveHandoverSupported](self, "isActiveHandoverSupported"))
      {
        if (a3)
        {
          v6 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
          -[WCM_WiFiService getTxPer](v6, "getTxPer");
          v8 = v7 * 100.0;
          -[WCM_WiFiService getTxRetryPercent](v6, "getTxRetryPercent");
          v10 = v9;
          v11 = -[WCM_WiFiService isTxPerValid](v6, "isTxPerValid");
          v12 = -[WCM_WiFiService isRetryValid](v6, "isRetryValid");
          v13 = -[WCM_WiFiService getCCA](v6, "getCCA");
          v14 = -[WCM_WiFiService getChannelUtlization](v6, "getChannelUtlization");
          v15 = -[WCM_WiFiService isQBSSLoadValid](v6, "isQBSSLoadValid");
          v16 = -[WCM_WiFiService getRSSI](v6, "getRSSI");
          if (v8 < 2.0 || v11 == 0)
          {
            v18 = 1;
          }
          else
          {
            v20 = v14;
            if (!v15)
              v20 = v13;
            v21 = v12 ^ 1;
            v18 = 1;
            v19 = CFSTR("isUplinkAudioQualityOfCurrentCallGood: exit");
            if (v10 * 100.0 < 60.0)
              v21 = 1;
            if ((v21 & 1) != 0 || v20 < 40)
              goto LABEL_29;
            v22 = v16;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Uplink Audio Quality was bad, WiFiMetrics: TX PER THREASHOLD: %lld, TX Retry THREASHOLD: %lld, Load THREASHOLD: %lld"), v10 * 100.0, 2, 60, 40);
            if (!objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState")|| v22 >= -70)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Blocklist WiFi till call ends due to bad uplink audio"));
              byte_100270FC1 = 1;
            }
            -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
            -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 32);
            if (byte_100270FC1)
              -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 256);
            v18 = 0;
          }
          v19 = CFSTR("isUplinkAudioQualityOfCurrentCallGood: exit");
        }
        else
        {
          v18 = 1;
          v19 = CFSTR("isUplinkAudioQualityOfCurrentCallGood: returned");
        }
      }
      else
      {
        v18 = 1;
        v19 = CFSTR("isUplinkAudioQualityOfCurrentCallGood:VoLTE not enabled or handover not supported on device");
      }
LABEL_29:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v19);
      return v18;
    }
  }
  return 1;
}

- (void)handleMotionUpdate:(id)a3
{
  int64_t int64;

  int64 = xpc_dictionary_get_int64(a3, "kWRMM_MOTION_STATE");
  -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleMotionUpdate received: %s: motion state: %d"), "-[WRM_HandoverManager(privateFunctions) handleMotionUpdate:]", int64);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "WRM_HandoverManagerSingleton", a3);
}

- (void)addiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[NSMutableArray addObject:](self->miRATClientContexts, "addObject:", a3);
  -[WRM_HandoverManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[WRM_HandoverManager existingContexts](self, "existingContexts");
  -[NSMutableArray removeObject:](self->miRATClientContexts, "removeObject:", a3);
  -[WRM_HandoverManager existingContexts](self, "existingContexts");
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
  v6 = -[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", v3);
  if (v6)
    -[WRM_HandoverManager removeiRatClient:](self, "removeiRatClient:", v6);
  objc_sync_exit(miRATClientContexts);
  -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_HandoverManager needWiFiLQM](self, "needWiFiLQM"));
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
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WRM_Handover_Manager: Number of active iRAT clients: %lu"), -[NSMutableArray count](self->miRATClientContexts, "count"));
}

- (unint64_t)retainCount
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: retain count:%lu "), -1);
  return -1;
}

- (WRM_HandoverManager)autorelease
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: auto release "));
  return self;
}

- (WRM_HandoverManager)init
{
  WRM_HandoverManager *v2;
  dispatch_queue_t v3;
  WRM_IDSP2PController *v4;
  WRM_MetricsService *v5;
  WRMMetricsiRATDataRecommendation *v6;
  CXCallObserver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WRM_HandoverManager;
  v2 = -[WRM_HandoverManager init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WirelessRadioManager.Handover", 0);
    v2->mWiFi = 0;
    v2->mQueue = (OS_dispatch_queue *)v3;
    v2->mCTService = 0;
    v4 = +[WRM_IDSP2PController wrm_IDSP2PControllerSingleton](WRM_IDSP2PController, "wrm_IDSP2PControllerSingleton");
    v2->mSCService = 0;
    v2->mIDSP2PController = v4;
    v2->mIPTelephonyController = 0;
    v2->mWiFiCalling = 0;
    v2->mSymtomsService = 0;
    byte_100271014 = 0;
    byte_100270FA9 = 1;
    byte_10027100D = 0;
    v2->miRATConfig = 0;
    v2->mMotionController = 0;
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->miRATConfig = objc_opt_new(WRM_iRATConfig);
    v2->mMotionController = (WRM_MotionController *)+[WRM_MotionController singleton](WRM_MotionController, "singleton");
    v5 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
    v2->mMetrics = v5;
    if (v5)
    {
      -[WRM_MetricsService initiRATMetrics](v5, "initiRATMetrics");
      -[WRM_MetricsService initWiFiCallingMetrics](v2->mMetrics, "initWiFiCallingMetrics");
      -[WRM_MetricsService initStandaloneLinkPrefMetrics](v2->mMetrics, "initStandaloneLinkPrefMetrics");
      -[WRM_MetricsService init5GVersusWiFiLinkPrefMetrics](v2->mMetrics, "init5GVersusWiFiLinkPrefMetrics");
    }
    -[WRM_HandoverManager updateActiveHandoverStatus](v2, "updateActiveHandoverStatus");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Bundle ID %@"), -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Handover manager initialized"));
    v2->wrmWifiCallingEnd = (WRMWiFiCallingEnd *)((char *)-[WRM_MetricsService getWiFiCallingMetrics](v2->mMetrics, "getWiFiCallingMetrics")+ 8);
    v6 = -[WRM_MetricsService getStandaloneLinkPreferenceMetrics](v2->mMetrics, "getStandaloneLinkPreferenceMetrics");
    v2->mDataLinkPrefMetrics = v6;
    v6->metricsUpdate = 0;
    v2->mStartTime = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->prevTimeSinceStart = 0.0;
    v2->mAudioEvaluationTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mTimeSinceAudioEvaluationStarted = 0.0;
    v2->mLatteContextStartedTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mTimeSinceLatteContextStarted = 0.0;
    if (NSClassFromString(CFSTR("CXCallObserver")))
    {
      v7 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
      v2->mCallObserver = v7;
      -[CXCallObserver setDelegate:queue:](v7, "setDelegate:queue:", v2, &_dispatch_main_q);
    }
    else
    {
      v2->mCallObserver = 0;
    }
    byte_100270FF9 = 0;
    byte_100270FFA = 0;
    -[WRM_HandoverManager initWiFiCellDataEval](v2, "initWiFiCellDataEval");
    *(_OWORD *)&v2->mQMINasClientPrimary = 0u;
    *(_OWORD *)&v2->mQMIDsdClientPrimary = 0u;
    if (-[WRM_iRATConfig qmiClientEnabled](v2->miRATConfig, "qmiClientEnabled"))
      -[WRM_HandoverManager createQMIClient](v2, "createQMIClient");
    -[WRM_HandoverManager createIBIClient](v2, "createIBIClient");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mQueue;
  OS_dispatch_queue **p_mQueue;
  WRM_CTService *mCTService;
  WRM_IDSP2PController *mIDSP2PController;
  WRM_SCService *mSCService;
  WCM_WiFiController *mWiFi;
  WRM_WiFiCallingController *mWiFiCalling;
  WRM_SymptomsService *mSymtomsService;
  WRM_iRATConfig *miRATConfig;
  CXCallObserver *mCallObserver;
  WRM_QMINasClient *mQMINasClientPrimary;
  WRM_QMINasClient *mQMINasClientSecondary;
  WRM_QMIDsdClient *mQMIDsdClientPrimary;
  WRM_IceClientDriver *mIBIClient;
  NSMutableArray *miRATClientContexts;
  NSDate *mStartTime;
  NSDate *mAudioEvaluationTimer;
  NSDate *mLatteContextStartedTimer;
  objc_super v21;

  p_mQueue = &self->mQueue;
  mQueue = self->mQueue;
  if (mQueue)
    dispatch_release(mQueue);
  mCTService = self->mCTService;
  if (mCTService)

  mIDSP2PController = self->mIDSP2PController;
  if (mIDSP2PController)

  mSCService = self->mSCService;
  if (mSCService)

  mWiFi = self->mWiFi;
  if (mWiFi)

  mWiFiCalling = self->mWiFiCalling;
  if (mWiFiCalling)

  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService)

  miRATConfig = self->miRATConfig;
  if (miRATConfig)

  mCallObserver = self->mCallObserver;
  if (mCallObserver)
  {
    -[CXCallObserver setDelegate:queue:](mCallObserver, "setDelegate:queue:", 0, 0);

    self->mCallObserver = 0;
  }
  mQMINasClientPrimary = self->mQMINasClientPrimary;
  if (mQMINasClientPrimary)
  {

    self->mQMINasClientPrimary = 0;
  }
  mQMINasClientSecondary = self->mQMINasClientSecondary;
  if (mQMINasClientSecondary)
  {

    self->mQMINasClientSecondary = 0;
  }
  mQMIDsdClientPrimary = self->mQMIDsdClientPrimary;
  if (mQMIDsdClientPrimary)
  {

    self->mQMIDsdClientPrimary = 0;
  }
  mIBIClient = self->mIBIClient;
  if (mIBIClient)
  {

    self->mIBIClient = 0;
  }
  self->mIPTelephonyController = 0;
  *(_OWORD *)p_mQueue = 0u;
  *((_OWORD *)p_mQueue + 1) = 0u;
  *((_OWORD *)p_mQueue + 2) = 0u;
  p_mQueue[6] = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager: Dealloc called for handover manager "));
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts)

  mStartTime = self->mStartTime;
  if (mStartTime)
  {

    self->mStartTime = 0;
    self->prevTimeSinceStart = 0.0;
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
  v21.receiver = self;
  v21.super_class = (Class)WRM_HandoverManager;
  -[WRM_HandoverManager dealloc](&v21, "dealloc");
}

- (BOOL)isIbiSdmSupported
{
  objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  return 0;
}

- (void)postBBNotification:(unsigned __int8)a3 :(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = a4;
  v5 = a3;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyBBLockState : mQMINasClientPrimary: %x"), self->mQMINasClientPrimary);
    -[WRM_QMINasClient notifyBBLockState::](self->mQMINasClientPrimary, "notifyBBLockState::", v5, v4);
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postBBNotification calling notifyBBLockState : mIBIClient: %x"), self->mIBIClient);
    -[WRM_IceClientDriver notifyBBLockState::](self->mIBIClient, "notifyBBLockState::", 1, v5);
  }
}

- (void)triggerABC:(id)a3 subType:(id)a4 subtypeContext:(id)a5
{
  -[WRM_SymptomsService triggerAutoBugCapture:subType:subtypeContext:](self->mSymtomsService, "triggerAutoBugCapture:subType:subtypeContext:", CFSTR("iRAT"), a4, a5);
}

- (BOOL)isDeviceConnectedOverNonLTERadio
{
  WRM_CTService *mCTService;

  if (-[WRM_HandoverManager isEnhancedCTServiceNeeded](self, "isEnhancedCTServiceNeeded"))
    mCTService = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  else
    mCTService = self->mCTService;
  return -[WRM_CTService checkIfServingCellNonLTE](mCTService, "checkIfServingCellNonLTE");
}

- (BOOL)isVoIPCallActive
{
  return (byte_100270FFA | byte_100270FF9) != 0;
}

- (void)rxVoIPAppNotification:(BOOL)a3
{
  uint64_t v3;
  char v4;

  if (!byte_100270FF9)
  {
    if (a3)
    {
      v3 = 1;
      v4 = 1;
    }
    else
    {
      v4 = 0;
      if (!byte_100270FFA)
      {
LABEL_7:
        byte_100270FFA = v4;
        return;
      }
      v3 = 2;
    }
    -[WRM_HandoverManager notifyBBVoIPState::::](self, "notifyBBVoIPState::::", 2, v3, 2, 0);
    goto LABEL_7;
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  unsigned int v6;
  unsigned __int8 v7;
  id v8;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (objc_msgSend(a4, "hasConnected", a3))
  {
    v6 = objc_msgSend(a4, "hasEnded");
    byte_100270FF9 = v6 ^ 1;
    v7 = 1;
    if (((v6 ^ 1) & 1) == 0)
    {
      -[WRM_HandoverManager toggleSAState:](self, "toggleSAState:", -[WRM_SCService isWiFiPrimary](self->mSCService, "isWiFiPrimary"));
      if (byte_100270FF9)
        v7 = 1;
      else
        v7 = 2;
    }
    v8 = objc_msgSend(CFSTR("com.apple.coretelephony"), "isEqualToString:", objc_msgSend(a4, "providerIdentifier"));
    v9 = 1;
    if ((objc_msgSend(CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"), "isEqualToString:", objc_msgSend(a4, "providerIdentifier")) & 1) == 0)
    {
      if (objc_msgSend(CFSTR("com.apple.coretelephony"), "isEqualToString:", objc_msgSend(a4, "providerIdentifier")))v9 = 1;
      else
        v9 = 2;
    }
    v10 = objc_msgSend(a4, "isVideo");
    if (v10)
      v11 = 2;
    else
      v11 = 1;
    v12 = v7;
    if (v10)
      v13 = 2;
    else
      v13 = 1;
    -[WRM_HandoverManager notifyBBVoIPState::::](self, "notifyBBVoIPState::::", v9, v12, v11, v8);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Call Active: %d, provider id: %@, VoIP app type: %d, VoIP CallType: %d, isTelephonyCall: %d"), byte_100270FF9, objc_msgSend(a4, "providerIdentifier"), v9, v13, v8);
    v14 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
    objc_msgSend(v14, "updateCallStateActive:", byte_100270FF9);
  }
}

- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4
{
  NSObject *mQueue;
  _QWORD block[7];

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B86A0;
  block[3] = &unk_100201DE8;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(mQueue, block);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (BOOL)isSisSupportedOnICE
{
  objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  return 0;
}

- (BOOL)isEnhancedSisSupported
{
  unsigned int v2;
  int32x4_t v3;
  int32x4_t v4;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v3 = vdupq_n_s32(v2);
  *(int32x2_t *)v4.i8 = vdup_n_s32(v2 & 0xFFFFFFFE);
  v4.i64[1] = v3.i64[0];
  return vmaxvq_u8((uint8x16_t)vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v4, (int32x4_t)xmmword_1001DEDD0), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DEDC0)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DEDE0), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001DEDF0)))) & 1;
}

- (BOOL)disableICEClient
{
  unsigned int v2;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  return (v2 > 0xA) | (0x350u >> v2) & 1;
}

- (void)updateActiveHandoverStatus
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;

  v3 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v4 = 1;
  if (v3 > 0x39 || ((1 << v3) & 0x3FC000003EFEFFFLL) == 0)
  {
    byte_10027100C = 0;
    v6 = 1;
    -[WRM_HandoverManager setIWLANServiceType:](self, "setIWLANServiceType:", 1);
    v4 = byte_10027100C;
  }
  else
  {
    -[WRM_HandoverManager setIWLANServiceType:](self, "setIWLANServiceType:", 0);
    v6 = 0;
    byte_10027100C = 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover support status: %d, Device Service Type: %d"), v4, v6);
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if (-[WRM_HandoverManager enableiRATManager](self, "enableiRATManager"))
  {
    switch(a3)
    {
      case 7uLL:
        goto LABEL_6;
      case 8uLL:
        goto LABEL_9;
      case 9uLL:
        goto LABEL_12;
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        return;
      case 0xFuLL:
        goto LABEL_11;
      default:
        if (a3 == 21)
        {
LABEL_6:
          -[WRM_HandoverManager handleCTConfig](self, "handleCTConfig");
          switch(a3)
          {
            case 0xFuLL:
LABEL_11:
              -[WRM_HandoverManager handleCallKitConfig](self, "handleCallKitConfig");
              break;
            case 9uLL:
LABEL_12:
              -[WRM_HandoverManager configureRTPMetricsReporting](self, "configureRTPMetricsReporting");
              break;
            case 8uLL:
LABEL_9:
              -[WRM_HandoverManager handleNetworkdConfig](self, "handleNetworkdConfig");
              break;
          }
        }
        else if (a3 == 1)
        {
          -[WRM_HandoverManager handleWiFiConfig](self, "handleWiFiConfig");
        }
        break;
    }
  }
}

- (void)handleCallKitConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("CallKit config changed."));
}

- (void)handleCTConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("CT Client config changed."));
}

- (void)handleNetworkdConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Networkd Client config changed."));
}

- (void)handleWiFiConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WiFi config changed."));
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
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
    LOBYTE(v6) = v7 >= (uint64_t)objc_msgSend(-[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController"), "minActiveWiFiRssiTh0");
  }
  return v6;
}

- (void)notifyBBUsingMappedSlotInfo:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 v5;
  char v6;
  WRM_QMINasClient *mQMINasClientSecondary;
  uint64_t v8;
  _BOOL8 v9;
  WRM_IceClientDriver *mIBIClient;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;

  v3 = a3;
  v5 = -[WRM_CTService isWiFiCallingSupportedSlot1](self->mCTService, "isWiFiCallingSupportedSlot1");
  if (-[WRM_CTService isWiFiCallingSupportedSlot2](self->mCTService, "isWiFiCallingSupportedSlot2"))
    v6 = 2;
  else
    v6 = 0;
  byte_100270DE9 = v6 | v5;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    switch(byte_100270DE9)
    {
      case 0:
      case 3:
        -[WRM_QMINasClient setBBSAState::](self->mQMINasClientPrimary, "setBBSAState::", v3);
        mQMINasClientSecondary = self->mQMINasClientSecondary;
        v8 = byte_100270DE9;
        v9 = v3;
        goto LABEL_12;
      case 1:
        -[WRM_QMINasClient setBBSAState::](self->mQMINasClientPrimary, "setBBSAState::", v3, 1);
        mQMINasClientSecondary = self->mQMINasClientSecondary;
        if (mQMINasClientSecondary)
          goto LABEL_11;
        return;
      case 2:
        -[WRM_QMINasClient setBBSAState::](self->mQMINasClientSecondary, "setBBSAState::", v3, 2);
        mQMINasClientSecondary = self->mQMINasClientPrimary;
        if (!mQMINasClientSecondary)
          return;
LABEL_11:
        v8 = byte_100270DE9;
        v9 = 0;
LABEL_12:
        -[WRM_QMINasClient setBBSAState::](mQMINasClientSecondary, "setBBSAState::", v9, v8);
        break;
      default:
        return;
    }
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    switch(byte_100270DE9)
    {
      case 0:
      case 3:
        -[WRM_IceClientDriver setBBSAState:::](self->mIBIClient, "setBBSAState:::", 1, v3);
        mIBIClient = self->mIBIClient;
        v11 = byte_100270DE9;
        v12 = 2;
        v13 = v3;
        goto LABEL_17;
      case 1:
        mIBIClient = self->mIBIClient;
        v12 = 1;
        v13 = v3;
        v11 = 1;
        goto LABEL_17;
      case 2:
        mIBIClient = self->mIBIClient;
        v12 = 2;
        v13 = v3;
        v11 = 2;
LABEL_17:
        -[WRM_IceClientDriver setBBSAState:::](mIBIClient, "setBBSAState:::", v12, v13, v11);
        break;
      default:
        return;
    }
  }
}

- (void)triggerEnableSA:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  unsigned int v6;

  v3 = a3;
  v5 = -[WRM_CTService isWiFiCallingSupportedSlot1](self->mCTService, "isWiFiCallingSupportedSlot1");
  v6 = -[WRM_CTService isWiFiCallingSupportedSlot2](self->mCTService, "isWiFiCallingSupportedSlot2");
  if ((v5 & 1) != 0 || v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("triggerEnableSA %d, wifi Call state: %d"), v3, byte_10027100D);
    if (!v3 || byte_10027100D)
      -[WRM_HandoverManager notifyBBUsingMappedSlotInfo:](self, "notifyBBUsingMappedSlotInfo:", byte_100270DE8 != 0);
    else
      -[WRM_HandoverManager notifyBBUsingMappedSlotInfo:](self, "notifyBBUsingMappedSlotInfo:", 0);
  }
}

- (void)setBBSAState:(BOOL)a3
{
  -[WRM_HandoverManager notifyBBUsingMappedSlotInfo:](self, "notifyBBUsingMappedSlotInfo:", a3);
}

- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6;
  id v10;
  const __CFString *v11;
  WRM_HandoverManager *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)&a6;
  if (!a5)
  {
    if (a4 == 1 && byte_100270FC0)
    {
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 256);
      -[WRM_HandoverManager updateHandoverReasonCode:](self, "updateHandoverReasonCode:", 16);
      v11 = CFSTR("Evaluate link: Cellular: VoIP quality was not good.");
      goto LABEL_8;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate link: Call Idle."));
    if (!-[WRM_HandoverManager canWiFiMeetIdleApplicationRequirements:::](self, "canWiFiMeetIdleApplicationRequirements:::", a3, a4, v6))
    {
      v13 = self;
      v14 = a3;
      v15 = a4;
      v16 = 0;
      return !-[WRM_HandoverManager canCellularMeetApplicationRequirement:::::](v13, "canCellularMeetApplicationRequirement:::::", v14, v15, v16, v6, 0);
    }
    return 1;
  }
  v10 = -[WRM_HandoverManager getCTService](self, "getCTService");
  if (!(_DWORD)v6 && objc_msgSend(v10, "isSrvccHandoverInProgress"))
  {
    v11 = CFSTR("evaluateLinkWiFiPreferred:: skip WiFi link evaluation, SRVCC handover is in progress");
LABEL_8:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11);
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Evaluate link: Call active."));
  if (-[WRM_HandoverManager canWiFiMeetActiveApplicationRequirements::::](self, "canWiFiMeetActiveApplicationRequirements::::", a3, a4, v6, 0))
  {
    return 1;
  }
  v13 = self;
  v14 = a3;
  v15 = a4;
  v16 = 1;
  return !-[WRM_HandoverManager canCellularMeetApplicationRequirement:::::](v13, "canCellularMeetApplicationRequirement:::::", v14, v15, v16, v6, 0);
}

- (id)getWiFiService
{
  return -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
}

- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5
{
  NSObject *mQueue;
  _QWORD block[6];
  int v7;
  int v8;

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B929C;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  v8 = a5;
  dispatch_async(mQueue, block);
}

- (void)submitMetricsCBRSWithDataSimRecommendation:(BOOL)a3 forSimSlot:(int64_t)a4
{
  NSObject *mQueue;
  _QWORD block[6];
  BOOL v6;

  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B955C;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(mQueue, block);
}

- (void)showHOAlertUI:(BOOL)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  WRM_HandoverManager *v13;
  const char *v14;
  unsigned int v15;
  const char *v16;
  __CFDictionary *Mutable;
  __CFUserNotification *v18;
  __CFRunLoop *Main;
  const char *v20;
  id obj;
  uint64_t v22;
  id v23;
  SInt32 error;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = objc_alloc_init((Class)NSMutableString);
  v5 = v4;
  if (qword_100270FE8)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s %d: Notification is already pending!"), "-[WRM_HandoverManager showHOAlertUI:]", 2172);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("iRAT Handover Alert\n"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = objc_msgSend(-[WRM_MetricsService getiRATMetricHORecordCache](self->mMetrics, "getiRATMetricHORecordCache"), "reverseObjectEnumerator");
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v23)
    {
      v7 = 0;
      v22 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          -[WRM_MetricsService getReasonStr::](self->mMetrics, "getReasonStr::", objc_msgSend(v9, "mReason"), v29);
          v10 = objc_msgSend(v9, "getDate");
          v11 = objc_alloc_init((Class)NSDateFormatter);
          objc_msgSend(v11, "setDateFormat:", CFSTR("MM/dd HH:mm:ss"));
          v12 = objc_msgSend(v11, "stringFromDate:", v10);
          v13 = self;
          if (objc_msgSend(v9, "mApp") == (id)1)
            v14 = "vo";
          else
            v14 = "dat";
          v15 = objc_msgSend(v9, "mType");
          v16 = "->C";
          if (v15 == 200)
            v16 = "->W";
          v20 = v14;
          self = v13;
          objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d: %s %s %@ (%s)\n"), (char *)i + v7, v20, v16, v12, v29));

        }
        v7 = (v7 + (_DWORD)i);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v23);
    }
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    qword_100270FE0 = (uint64_t)Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v5);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100270FE0, kCFUserNotificationDefaultButtonTitleKey, CFSTR("OK"));
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100270FE0, kCFUserNotificationAlternateButtonTitleKey, CFSTR("Radar"));
      error = 0;
      v18 = CFUserNotificationCreate(kCFAllocatorDefault, 60.0, 0, &error, (CFDictionaryRef)qword_100270FE0);
      qword_100270FE8 = (uint64_t)v18;
      if (!error)
      {
        if (v18)
        {
          qword_100270FF0 = (uint64_t)CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v18, (CFUserNotificationCallBack)sub_1000B9978, 0);
          if (qword_100270FF0)
          {
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, (CFRunLoopSourceRef)qword_100270FF0, kCFRunLoopDefaultMode);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s %d: Notification created"), "-[WRM_HandoverManager showHOAlertUI:]", 2233);
          }
        }
      }
    }
  }
  if (qword_100270FF0)
    v6 = 1;
  else
    v6 = qword_100270FE8 == 0;
  if (!v6)
  {
    CFRelease((CFTypeRef)qword_100270FE8);
    qword_100270FE8 = 0;
  }
  if (qword_100270FE0)
  {
    CFRelease((CFTypeRef)qword_100270FE0);
    qword_100270FE0 = 0;
  }

}

- (void)setCTService:(id)a3
{
  self->mCTService = (WRM_CTService *)a3;
}

- (void)setSCService:(id)a3
{
  self->mSCService = (WRM_SCService *)a3;
}

- (id)getWiFiCallingController
{
  return self->mWiFiCalling;
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value;
  WRM_SymptomsService *mSymtomsService;
  int64_t int64;
  NSMutableArray *miRATClientContexts;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  dispatch_time_t v12;
  NSObject *mQueue;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  WCM_WiFiService *v20;
  _QWORD v21[5];
  _QWORD block[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  byte_100270FA9 = 0;
  if (-[WRM_HandoverManager isRecentDevice](self, "isRecentDevice"))
    -[WRM_HandoverManager evaluateWiFiVersusCell](self, "evaluateWiFiVersusCell");
  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService)
    -[WRM_SymptomsService resetIMSMetrics](mSymtomsService, "resetIMSMetrics");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager received WiFi link state change event"));
  if (value)
  {
    int64 = xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    miRATClientContexts = self->miRATClientContexts;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(miRATClientContexts);
          -[WRM_HandoverManager setPingPongTimerMultipler:::](self, "setPingPongTimerMultipler:::", 1, objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "getMyClientType"), 1);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
    byte_100270FC1 = 0;
    if (int64)
    {
      v12 = dispatch_time(0, 2000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B9D10;
      block[3] = &unk_1002019E8;
      block[4] = self;
      dispatch_after(v12, mQueue, block);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager:Link down event received"));
      byte_100271014 = 1;
      v14 = dispatch_time(0, 2000000000);
      v15 = self->mQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000B9D1C;
      v21[3] = &unk_1002019E8;
      v21[4] = self;
      dispatch_after(v14, v15, v21);
    }
    else
    {
      v16 = -[WRM_HandoverManager getCTService](self, "getCTService");
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "invalidateAudioQualityMetrics");
        objc_msgSend(v17, "initMovAverageOfSignalBar");
      }
      -[WRM_HandoverManager toggleSAState:](self, "toggleSAState:", 1);
      byte_100271014 = 0;
      v18 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      v19 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager:Linkup event received"));
      v20 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
      -[WCM_WiFiService setRSSI:](v20, "setRSSI:", v18);
      -[WCM_WiFiService setSNR:](v20, "setSNR:", v19);
      if (-[WRM_HandoverManager isRecentDevice](self, "isRecentDevice"))
        -[WRM_HandoverManager triggerHarvestDataEval](self, "triggerHarvestDataEval");
    }
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager:Empty message received"));
  }
}

- (void)handleCellularLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager received Cellular link metrics"));
  if (-[WRM_HandoverManager handoverEvaluationRequired](self, "handoverEvaluationRequired"))
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;
  id v7;
  const char *v8;
  size_t count;
  size_t v10;
  int64_t int64;
  uint64_t v12;
  int *v13;
  void *v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  WRM_Mobility_Context *v22;
  WRM_HandoverManager *v23;
  id v24;
  void *v25;
  id v26;
  WRM_HandoverManager *v27;
  int *v28;
  unsigned int v29;
  xpc_object_t v30;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HandoverManager: handleIWLANRadioLinkPreferenceRequest."));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  v7 = -[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  if ((_DWORD)uint64 == 1)
  {
    v8 = "ClientCommCenter";
  }
  else if ((uint64 - 2) >= 0x14)
  {
    v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v8 = "ClientCoreMediaStreaming";
  }
  else
  {
    v8 = (&off_100204DC8)[(int)uint64 - 2];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Message received from client %d(%s) "), uint64, v8);
  v30 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v30);
  objc_msgSend(v7, "removeAllMobilityContextsFromList");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Removing all contexts from iRAT client."));
  if (count)
  {
    v26 = a3;
    v27 = self;
    if (!self->mWiFi)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    v10 = 0;
    int64 = 0;
    v12 = 0;
    v29 = uint64 - 1;
    v13 = &dword_100270FD4;
    if ((_DWORD)uint64 == 1)
      v13 = &dword_100270FD0;
    v28 = v13;
    do
    {
      v14 = v7;
      v15 = xpc_array_get_value(v30, v10);
      v16 = xpc_dictionary_get_uint64(v15, "kWRMApplicationType");
      v17 = xpc_dictionary_get_uint64(v15, "kWRMDesiredLinkQoS");
      v18 = xpc_dictionary_get_uint64(v15, "kWRMDesiredBandwidth");
      if (xpc_dictionary_get_value(v15, "kWRMSubscribeSlotInfo"))
        v19 = xpc_dictionary_get_uint64(v15, "kWRMSubscribeSlotInfo") + 1;
      else
        v19 = 1;
      v20 = xpc_dictionary_get_value(v15, "kWRMPolicyInfo");
      if (v20)
      {
        v21 = v20;
        int64 = xpc_dictionary_get_int64(v20, "kWRMPolicyInfoHoAlgorithmType");
        v12 = xpc_dictionary_get_uint64(v21, "kWRMPolicyInfoServiceType");
        if (v29 <= 1)
          *v28 = int64;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: Record#= %d Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu,Service Status=%llu AlgorithmType=%d, ServiceType=%llu"), "-[WRM_HandoverManager handleLinkPrefSubscribe:]", v10, v16, v17, v18, 0, int64, v12);
      v22 = objc_alloc_init(WRM_Mobility_Context);
      -[WRM_Mobility_Context setLinkQoS:](v22, "setLinkQoS:", v17);
      -[WRM_Mobility_Context setBandwidth:](v22, "setBandwidth:", v18);
      -[WRM_Mobility_Context setMappedApplicationType::](v22, "setMappedApplicationType::", v16, v12);
      -[WRM_Mobility_Context activateMobilityContext:](v22, "activateMobilityContext:", 1);
      v7 = v14;
      objc_msgSend(v14, "addMobilityContextToList:", v22);

      ++v10;
    }
    while (count != v10);
    objc_msgSend(v14, "setActiveSlot:", v19);
    if (MGGetBoolAnswer(CFSTR("InternalBuild")) && qword_100270FC8)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleLinkPrefSubscribe: Use internal UI iRAT policy"));
      v23 = v27;
      int64 = -[WRM_HandoverManager convertToHOAlgorithmType:](v27, "convertToHOAlgorithmType:", qword_100270FC8);
    }
    else
    {
      v23 = v27;
      if (!-[WRM_iRATConfig handoverAlgorithmSettingDynamic](v27->miRATConfig, "handoverAlgorithmSettingDynamic"))
        int64 = -[WRM_iRATConfig handoverAlgorithmType](v27->miRATConfig, "handoverAlgorithmType");
    }
    objc_msgSend(v14, "setHandoverAlgorithmType:", int64);
    -[WRM_HandoverManager setIWLANServiceType:](v23, "setIWLANServiceType:", v12);
    if (objc_msgSend(v14, "isStatusUpdateMsgBuffered"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Processing buffered status update message"));
      -[WRM_HandoverManager handleSubscribeStatusUpdate::](v23, "handleSubscribeStatusUpdate::", v26, 0);
    }
    if (objc_msgSend(v14, "isCallActive"))
    {
      v24 = objc_msgSend(v14, "getMobilityContextFromList:", objc_msgSend(v14, "getBufferedAppType"));
      if (v24)
      {
        v25 = v24;
        if (byte_10027100D)
          objc_msgSend(v24, "setConnectedLinkType:", 1);
        objc_msgSend(v25, "setCallState:", 1);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HandoverManager: Update call status becuase CT subscribed in the middle of call"));
      }
    }
    objc_msgSend(v14, "postiRATNotificationToEnableDisableCellData::", 1, 1);
    objc_msgSend(v14, "postiRATNotificationToEnableDisableCellData::", 0, 1);
    objc_msgSend(objc_msgSend(v14, "getMobilityContextFromList:", 1), "setConnectedLinkType:", 0);
  }
  else if (-[WRM_iRATConfig mobilityStateAwarenessEnabled](self->miRATConfig, "mobilityStateAwarenessEnabled"))
  {
    -[WRM_MotionController stopAllAlarms](self->mMotionController, "stopAllAlarms");
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  _BOOL4 v4;
  WCM_WiFiService *v7;
  uint64_t uint64;
  id v9;
  __objc2_class **p_superclass;
  const char *v11;
  xpc_object_t value;
  xpc_object_t v13;
  size_t count;
  size_t v15;
  size_t i;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;

  v4 = a4;
  objc_msgSend(-[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController"), "resetRTPMetrics");
  v7 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  v9 = -[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  dword_100271010 = uint64;
  p_superclass = WRM_SCService.superclass;
  if ((uint64 - 1) >= 0x15)
  {
    v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v11 = "ClientCoreMediaStreaming";
  }
  else
  {
    v11 = (&off_100204E68)[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HandoverManager: Message received from client %d(%s)"), uint64, v11);
  if (v4)
  {
    value = xpc_dictionary_get_value(a3, "kMessageArgs");
    v13 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
    count = xpc_array_get_count(v13);
    if (count)
    {
      v15 = count;
      for (i = 0; i != v15; ++i)
      {
        v17 = xpc_array_get_value(v13, i);
        v18 = xpc_dictionary_get_uint64(v17, "kWRMApplicationType");
        v19 = xpc_dictionary_get_uint64(v17, "kWRMLinkType");
        v20 = xpc_dictionary_get_uint64(v17, "kWRMServiceStatus");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: Record#=%d, Application Type=%llu, Link Type=%llu Service Status %d "), "-[WRM_HandoverManager handleSubscribeStatusUpdate::]", i, v18, v19, v20);
      }
      p_superclass = (__objc2_class **)(WRM_SCService + 8);
    }
    else
    {
      v20 = 0;
      v19 = 2;
      v18 = 1;
    }
    objc_msgSend(v9, "setStatusUpdateMsgBuffered:", 1);
    objc_msgSend(v9, "setBufferedLinkType:", v19);
    if (v18 == 1 && (id)-[WRM_iRATConfig ctServiceType](self->miRATConfig, "ctServiceType") == (id)2)
    {
      v23 = CFSTR("handleSubscribeStatusUpdate changing mapped application type to CT_Thumper");
      v18 = 2;
    }
    else
    {
      v23 = CFSTR("handleSubscribeStatusUpdate using application type CT_VoLTE");
    }
    objc_msgSend(p_superclass + 279, "logLevel:message:", 24, v23);
    objc_msgSend(v9, "setBufferedAppType:", v18);
    objc_msgSend(v9, "setCallState:", v20 != 0);
    if ((objc_msgSend(v9, "isCallActive") & 1) == 0)
    {
      byte_100270FC1 = 0;
      objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService"), "setSrvccHandoverState:", 0);
    }
    if (objc_msgSend(v9, "isCallActive") && objc_msgSend(v9, "getBufferedLinkType") == 1)
    {
      byte_10027100D = 1;
      -[WRM_HandoverManager triggerEnableSA:](self, "triggerEnableSA:", 0);
      -[WRM_SymptomsService notifyWifiCallState:](self->mSymtomsService, "notifyWifiCallState:", 1);
      -[WCM_WiFiService setWiFiCallingState:](v7, "setWiFiCallingState:", 1);
      if (-[WRM_iRATConfig mobilityStateAwarenessEnabled](self->miRATConfig, "mobilityStateAwarenessEnabled"))
      {
        -[WRM_MotionController stopAllAlarms](self->mMotionController, "stopAllAlarms");
        -[WRM_MotionController startMonitoringAlarms](self->mMotionController, "startMonitoringAlarms");
      }
      v24 = CFSTR("HandoverManager: handleSubscribeStatusUpdate: Call on WiFi");
    }
    else
    {
      if (-[WRM_iRATConfig mobilityStateAwarenessEnabled](self->miRATConfig, "mobilityStateAwarenessEnabled"))
        -[WRM_MotionController stopAllAlarms](self->mMotionController, "stopAllAlarms");
      -[WRM_SymptomsService notifyWifiCallState:](self->mSymtomsService, "notifyWifiCallState:", 0);
      -[WCM_WiFiService setWiFiCallingState:](v7, "setWiFiCallingState:", 0);
      byte_10027100D = 0;
      v24 = CFSTR("HandoverManager: handleSubscribeStatusUpdate:Call not on WIFI");
    }
    objc_msgSend(p_superclass + 279, "logLevel:message:", 24, v24);
    objc_msgSend(p_superclass + 279, "logLevel:message:", 24, CFSTR("HandoverManager: handleSubscribeStatusUpdate."));
    v25 = objc_msgSend(v9, "getMobilityContextFromList:", v18);
    if (v25)
    {
      v26 = v25;
      v27 = objc_msgSend(v25, "getCallState");
      objc_msgSend(v26, "setCallState:", v20 != 0);
      objc_msgSend(v26, "setRecommendedLinkType:", v19);
      if (!v20 && v27)
      {
        v28 = p_superclass + 279;
        if ((_DWORD)v19)
        {
          objc_msgSend(v28, "logLevel:message:", 24, CFSTR("Handover Manager: evaluateActiveCallQuality"));
          -[WRM_HandoverManager evaluateActiveCallQuality](self, "evaluateActiveCallQuality");
        }
        else
        {
          objc_msgSend(v28, "logLevel:message:", 24, CFSTR("Handover Manager:  do not evaluateActiveCallQuality"));
        }
      }
      if (v20 != v27)
      {
        objc_msgSend(p_superclass + 279, "logLevel:message:", 24, CFSTR("Handover Manager: resetActiveCallEvaluationMetrics"));
        -[WRM_HandoverManager resetActiveCallEvaluationMetrics](self, "resetActiveCallEvaluationMetrics");
      }
    }
  }
  else
  {
    v21 = objc_msgSend(v9, "getMobilityContextFromList:", objc_msgSend(v9, "getBufferedAppType"));
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, "setConnectedLinkType:", objc_msgSend(v9, "getBufferedLinkType"));
      objc_msgSend(v22, "setCallState:", objc_msgSend(v9, "isCallActive"));
      objc_msgSend(v9, "setStatusUpdateMsgBuffered:", 0);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HandoverManager: handleSubscribeStatusUpdate."));
    }
  }
}

- (void)configureRTPMetricsReporting
{
  WRM_WiFiCallingController *mWiFiCalling;

  mWiFiCalling = self->mWiFiCalling;
  if (mWiFiCalling)
  {
    -[WRM_AVConferenceController configureRTPMetricsReporting](mWiFiCalling, "configureRTPMetricsReporting");
    -[WRM_AVConferenceController resetPeriodicRTPStats](self->mWiFiCalling, "resetPeriodicRTPStats");
  }
}

- (void)handleSIPStalledMetricsRecevied:(id)a3
{
  dispatch_time_t v4;
  NSObject *mQueue;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleSIPStalledMetricsRecevied"));
  if (self->mSymtomsService)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleSIPStalledMetricsRecevied, update SIP Stalled"));
    -[WRM_SymptomsService updateSIPMetrics:](self->mSymtomsService, "updateSIPMetrics:", 1);
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
    v4 = dispatch_time(0, 1000000000);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BA798;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_after(v4, mQueue, block);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleSIPMetricsRecevied-> mSymtomsService not init"));
  }
}

- (void)handleSIPMetricsRecevied:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;
  _BOOL8 v7;
  dispatch_time_t v8;
  NSObject *mQueue;
  _QWORD block[5];

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    if (xpc_dictionary_get_value(value, "kRegtdLinkType"))
      uint64 = xpc_dictionary_get_uint64(v5, "kRegtdLinkType");
    else
      uint64 = 0;
    if (xpc_dictionary_get_value(v5, "kSipTmo"))
      v7 = xpc_dictionary_get_BOOL(v5, "kSipTmo");
    else
      v7 = 0;
    if ((_DWORD)uint64)
    {
      if (self->mSymtomsService)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleSIPMetricsRecevied, update SIP TMO: %d"), v7);
        -[WRM_SymptomsService updateSIPMetrics:](self->mSymtomsService, "updateSIPMetrics:", v7);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleSIPMetricsRecevied-> mSymtomsService not init"));
      }
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleSIPMetricsRecevied, sip TMO:%d, connected link: %d"), v7, uint64);
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
    if (v7)
    {
      v8 = dispatch_time(0, 20000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BA96C;
      block[3] = &unk_1002019E8;
      block[4] = self;
      dispatch_after(v8, mQueue, block);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleSIPMetricsRecevied, sip TMO:%d, connected link: %d"), 0, 0);
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
}

- (void)handleIWLANMetrics:(id)a3
{
  unsigned int v5;
  xpc_object_t value;
  void *v7;
  int64_t int64;
  uint64_t v9;
  WRM_SymptomsService *mSymtomsService;
  dispatch_time_t v11;
  NSObject *mQueue;
  _QWORD block[5];

  v5 = -[WRM_HandoverManager isDeviceConnectedOverNonLTERadio](self, "isDeviceConnectedOverNonLTERadio");
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v7 = value;
    if (xpc_dictionary_get_value(value, "kTunnelDisconnected"))
    {
      int64 = xpc_dictionary_get_int64(v7, "kTunnelDisconnected");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleIWLANMetrics reasonCode: %d, checkIfServingCellNonLTE: %d"), int64, v5);
      if (int64 == 1)
        v9 = v5 ^ 1;
      else
        v9 = 0;
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleIWLANMetrics empty message recevied, no WRMiWLANMetricsReport_TunnelDisconnected"));
      v9 = 0;
    }
    mSymtomsService = self->mSymtomsService;
    if (mSymtomsService)
      -[WRM_SymptomsService updateDPDMetrics:](mSymtomsService, "updateDPDMetrics:", v9);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleIWLANMetrics-> mSymtomsService not init"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Recevied handleIWLANMetrics, dpd:%d"), v9);
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
    if ((_DWORD)v9)
    {
      v11 = dispatch_time(0, 20000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BAB4C;
      block[3] = &unk_1002019E8;
      block[4] = self;
      dispatch_after(v11, mQueue, block);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("handleIWLANMetrics empty message recevied, ccDpdMetrics is null"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Recevied handleIWLANMetrics, dpd:%d"), 0);
    -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
  }
}

- (void)handleIPTelephonyMetrics:(id)a3
{
  xpc_object_t value;
  void *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  id v10;
  void *v11;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    if (xpc_dictionary_get_value(value, "WRMIPTelephonyEventReport_CallStatus"))
      v6 = xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_CallStatus") != 0;
    else
      v6 = 0;
    if (xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_LocalHold"))
      v7 = xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_LocalHold") != 0;
    else
      v7 = 0;
    if (xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_RemoteHold"))
      v8 = xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_RemoteHold") != 0;
    else
      v8 = 0;
    if (xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_Conference"))
      v9 = xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_Conference") != 0;
    else
      v9 = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Received IP Telephony Event , Call Status=%ld, Local Hold Enabled=%d Remote Hold Enabled=%d,Conference Enabled=%d "), v6, v7, v8, v9);
    v10 = -[WRM_HandoverManager getCTService](self, "getCTService");
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "setCallState:", v6);
      objc_msgSend(v11, "setCallInConference:", v9);
      objc_msgSend(v11, "setCallOnHold:", v7 | v8);
      if (v6)
        -[WRM_HandoverManager resetActiveCallTimer](self, "resetActiveCallTimer");
    }
  }
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  id v4;
  WCM_WiFiService *v5;
  id v6;
  double v7;

  v4 = objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService", a3), "getCallState");
  v5 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Handover Manager received filtered RTP netrics"));
  if ((_DWORD)v4 == 1)
  {
    if (byte_10027100D)
    {
      v6 = -[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController");
      self->wrmWifiCallingEnd->Latte_RTP_Packet_Loss = objc_msgSend(v6, "avgRxPktLoss");
      self->wrmWifiCallingEnd->WiFi_RSSI = -[WCM_WiFiService getRSSI](v5, "getRSSI");
      self->wrmWifiCallingEnd->WiFi_SINR = -[WCM_WiFiService getSNR](v5, "getSNR");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Rx periodic Average RTP packet loss=%lld"), objc_msgSend(v6, "avgRxPktLoss"));
      v7 = (double)(unint64_t)objc_msgSend(v6, "erasuresInSpeech") * 100.0;
      self->wrmWifiCallingEnd->Latte_Erasures = (v7
                                                             / ((double)(unint64_t)objc_msgSend(v6, "totalPlayBacks")+ 0.000001));
      self->wrmWifiCallingEnd->Latte_Nominal_Jitter_Buffer_Size = objc_msgSend(v6, "movAvgNominalJitterBufferDelay");
      self->wrmWifiCallingEnd->Latte_Dejitter_Buffer_Underflow = objc_msgSend(v6, "averagedNominalJitterBufferDelay");
      -[WRM_HandoverManager evaluateHandover](self, "evaluateHandover");
      objc_msgSend(v6, "resetRTPMetrics");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handlePeriodicRTPMetrics: discard RTP metrics, call not on WiFi"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handlePeriodicRTPMetrics: discard WIFI RTP metrics, call not active, call state: %d"), v4);
  }
}

- (BOOL)isWiFiLinkActive
{
  return 0;
}

- (void)registerForCTNotifications
{
  WRM_CTService *v3;

  if (self->mCTService)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("CT already registered."));
  }
  else if (-[WRM_HandoverManager isEnhancedCTServiceNeeded](self, "isEnhancedCTServiceNeeded"))
  {
    v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    self->mCTService = v3;
    -[WRM_CTService initCoreTelephonyClient](v3, "initCoreTelephonyClient");
  }
  else
  {
    self->mCTService = (WRM_CTService *)+[WRM_CTService WRM_CTServiceControllerSingleton](WRM_CTService, "WRM_CTServiceControllerSingleton");
  }
  -[WRM_CTService tiggerEnhanceLQMConfiguration](self->mCTService, "tiggerEnhanceLQMConfiguration");
}

- (void)registerForSCNotifications
{
  if (self->mSCService)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("SC already registered."));
  else
    self->mSCService = (WRM_SCService *)+[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton");
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  objc_msgSend(objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", *(_QWORD *)&a3), "sendMessage:", a4);
}

- (void)setHOAlertUI:(BOOL)a3
{
  byte_10027100E = a3;
}

- (int)convertToHOAlgorithmType:(unint64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

- (void)setiRATPolicy:(unint64_t)a3
{
  NSObject *mQueue;
  _QWORD v4[6];

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BB03C;
  v4[3] = &unk_100201BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)resetActiveCallEvaluationMetrics
{
  double v3;
  id v4;
  WCM_WiFiController *mWiFi;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("resetActiveCallEvaluationMetrics"));
  -[NSDate timeIntervalSinceNow](self->mAudioEvaluationTimer, "timeIntervalSinceNow");
  self->mTimeSinceAudioEvaluationStarted = v3;
  v4 = -[WRM_HandoverManager getWiFiCallingController](self, "getWiFiCallingController");
  mWiFi = self->mWiFi;
  if (mWiFi && (mWiFi = -[WCM_WiFiController wifiService](mWiFi, "wifiService")) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("resetActiveCallEvaluationMetrics: ptrWiFiService==NULL"));
  }
  else
  {
    -[WCM_WiFiController resetCumulativeCounters](mWiFi, "resetCumulativeCounters");
    objc_msgSend(v4, "resetCumulativeRTPMetrics");
  }
  byte_100270FC0 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("resetActiveCallEvaluationMetrics: exit"));
}

- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5
{
  objc_msgSend(objc_msgSend(-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", *(_QWORD *)&a4), "getMobilityContextFromList:", a5), "setPingPongAvoidanceTimerMultiplier:", a3);
}

- (void)resetActiveCallTimer
{
  double v3;

  -[NSDate timeIntervalSinceNow](self->mLatteContextStartedTimer, "timeIntervalSinceNow");
  self->mTimeSinceLatteContextStarted = v3;
}

- (void)setIWLANServiceType:(int)a3
{
  -[WRM_iRATConfig setCtServiceType:](self->miRATConfig, "setCtServiceType:", a3);
  if (a3 == 2)
    byte_10027100C = 1;
}

- (void)feedAWDDataLinkPreferenceChange:(int)a3
{
  WCM_WiFiService *v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  WRMMetricsiRATDataRecommendation *mDataLinkPrefMetrics;
  unsigned int v13;
  int v14;
  unsigned int v15;
  double v16;
  double v17;
  unsigned int v18;
  WRMMetricsiRATDataRecommendation *v19;
  double v20;
  double v21;
  float v22;
  float v23;
  double v24;
  double v25;
  float v26;
  unsigned int v27;
  WRMMetricsiRATDataRecommendation *v28;

  v5 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v6 = -[WRM_HandoverManager getCTService](self, "getCTService");
  v7 = -[WRM_HandoverManager getSCService](self, "getSCService");
  v8 = objc_msgSend(-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", 1), "getMobilityContextFromList:", 1);
  v9 = objc_msgSend(v8, "getCallState");
  v10 = objc_msgSend(v8, "getConnectedLinkType");
  v11 = objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState");
  if (self->mMetrics)
  {
    mDataLinkPrefMetrics = self->mDataLinkPrefMetrics;
    mDataLinkPrefMetrics->callStatus = v9;
    mDataLinkPrefMetrics->dataLinkPref = a3;
    mDataLinkPrefMetrics->voiceLinkPref = v10;
    mDataLinkPrefMetrics->motionState = v11;
    mDataLinkPrefMetrics->dataAppStatus = 0;
    v13 = objc_msgSend(v7, "isDataLQMValid");
    v14 = 0;
    if (v13)
      v14 = objc_msgSend(v7, "getCellularDataLQM");
    self->mDataLinkPrefMetrics->dataLQM = v14;
    v15 = objc_msgSend(v6, "isVoiceLQMValid");
    if (v15)
      v15 = objc_msgSend(v6, "getLteVoiceLQM");
    self->mDataLinkPrefMetrics->voiceLQM = v15;
    if (objc_msgSend(v6, "getServingCellType") == 1)
    {
      self->mDataLinkPrefMetrics->ratType = (NSString *)CFSTR("LTE_RADIO");
      objc_msgSend(v6, "getServingCellRSRP");
      self->mDataLinkPrefMetrics->cellRSRP = (uint64_t)v16;
      objc_msgSend(v6, "getServingCellSNR");
    }
    else
    {
      v18 = objc_msgSend(v6, "getServingCellType");
      v19 = self->mDataLinkPrefMetrics;
      if (v18 != 2)
      {
        v19->ratType = (NSString *)CFSTR("UNKNOWN_RADIO");
        goto LABEL_12;
      }
      v19->ratType = (NSString *)CFSTR("UMTS_RADIO");
      objc_msgSend(v6, "getServingCellRSCP");
      self->mDataLinkPrefMetrics->cellRSRP = (uint64_t)v20;
      objc_msgSend(v6, "getServingCellECIO");
    }
    self->mDataLinkPrefMetrics->cellSINR = (uint64_t)v17;
LABEL_12:
    self->mDataLinkPrefMetrics->signalBar = objc_msgSend(v6, "getCurrentSignalBars");
    self->mDataLinkPrefMetrics->wifiRssi = (int)-[WCM_WiFiService getRSSI](v5, "getRSSI");
    self->mDataLinkPrefMetrics->wifiSNR = (int)-[WCM_WiFiService getSNR](v5, "getSNR");
    -[WCM_WiFiService getBeaconPer](v5, "getBeaconPer");
    self->mDataLinkPrefMetrics->bcnPer = (int)(v21 * 100.0);
    self->mDataLinkPrefMetrics->cca = -[WCM_WiFiService getCCA](v5, "getCCA");
    self->mDataLinkPrefMetrics->qbssLoad = -[WCM_WiFiService getChannelUtlization](v5, "getChannelUtlization");
    self->mDataLinkPrefMetrics->stationCount = -[WCM_WiFiService getConnectedStationCount](v5, "getConnectedStationCount");
    -[WCM_WiFiService getEstimatedAvailableRxPhyBandwidth](v5, "getEstimatedAvailableRxPhyBandwidth");
    self->mDataLinkPrefMetrics->wifiEstimatedBandwitdh = (int)v22;
    -[WCM_WiFiService getRxPhyRate](v5, "getRxPhyRate");
    self->mDataLinkPrefMetrics->wifiRxPhyRate = (int)v23;
    -[WCM_WiFiService getRxRetryPercent](v5, "getRxRetryPercent");
    self->mDataLinkPrefMetrics->wifiRxRetry = (int)v24;
    -[WCM_WiFiService getTxPer](v5, "getTxPer");
    self->mDataLinkPrefMetrics->wifiTxPER = (int)v25;
    -[WCM_WiFiService getTxPhyRate](v5, "getTxPhyRate");
    self->mDataLinkPrefMetrics->wifiTxPhyRate = v26;
    self->mDataLinkPrefMetrics->captiveNetworks = -[WCM_WiFiService isWiFiNetworkCaptive](v5, "isWiFiNetworkCaptive");
    self->mDataLinkPrefMetrics->bssLoad = -[WCM_WiFiService getPointOfInterest](v5, "getPointOfInterest");
    self->mDataLinkPrefMetrics->decisionVIBE = -[WCM_WiFiService getBEDecision](v5, "getBEDecision");
    self->mDataLinkPrefMetrics->decisionVO = -[WCM_WiFiService getVoiceDecision](v5, "getVoiceDecision");
    self->mDataLinkPrefMetrics->expectedThroughputVIBE = -[WCM_WiFiService getTxThroughputVI](v5, "getTxThroughputVI");
    self->mDataLinkPrefMetrics->packetLifetimeVIBE = -[WCM_WiFiService getLifeTimeVI](v5, "getLifeTimeVI");
    self->mDataLinkPrefMetrics->pkgLifeTimeVO = -[WCM_WiFiService getLifeTimeVO](v5, "getLifeTimeVO");
    v27 = -[WCM_WiFiService getTxLossRateVO](v5, "getTxLossRateVO");
    v28 = self->mDataLinkPrefMetrics;
    v28->pktLossRateVO = v27;
    v28->lqmScoreWifi = a3 == 1;
    v28->metricsUpdate = 1;
  }
}

- (void)submitDataLinkPreferenceMetrics:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (self->mDataLinkPrefMetrics->metricsUpdate)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("submitDataLinkPreferenceMetrics::submitDataLinkPreferenceaMetrics"));
    objc_msgSend(-[WRM_MetricsService getAWDService](self->mMetrics, "getAWDService"), "submitDataLinkPreferenceaMetrics");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("submitDataLinkPreferenceMetrics::feedAWDDataLinkPreferenceChange"));
  }
  -[WRM_HandoverManager feedAWDDataLinkPreferenceChange:](self, "feedAWDDataLinkPreferenceChange:", v3);
}

- (void)submitCallEndMetics
{
  -[WRM_HandoverManager feedAWDCallEndStats](self, "feedAWDCallEndStats");
  objc_msgSend(-[WRM_MetricsService getAWDService](self->mMetrics, "getAWDService"), "submitMetricWiFiCallingEnd");
}

- (void)feedAWDCallEndStats
{
  WCM_WiFiService *v3;
  unsigned int v4;
  unsigned int v5;
  double v6;
  unsigned int v7;
  double v8;
  unsigned int v9;
  unsigned __int8 v10;
  WRMWiFiCallingEnd *wrmWifiCallingEnd;
  id v12;
  id v13;
  int v14;
  int v15;
  double v16;
  double v17;
  WRMWiFiCallingEnd *v18;
  const __CFString *v19;

  v3 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  v4 = objc_msgSend(objc_msgSend(-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", dword_100271010), "getMobilityContextFromList:", 1), "getRecommenedLinkType");
  if (self->mMetrics)
  {
    v5 = v4;
    self->wrmWifiCallingEnd->HO_Capability = byte_10027100C;
    if (-[WCM_WiFiService isBeaconPerValid](v3, "isBeaconPerValid"))
    {
      -[WCM_WiFiService getBeaconPer](v3, "getBeaconPer");
      v7 = (v6 * 100.0);
    }
    else
    {
      v7 = 0;
    }
    self->wrmWifiCallingEnd->Beacon_Rate = v7;
    if (-[WCM_WiFiService isTxPerValid](v3, "isTxPerValid"))
    {
      -[WCM_WiFiService getTxPer](v3, "getTxPer");
      v9 = (v8 * 100.0);
    }
    else
    {
      v9 = 0;
    }
    self->wrmWifiCallingEnd->WiFi_TxPER = v9;
    self->wrmWifiCallingEnd->BSS_Load = -[WCM_WiFiService getCCA](v3, "getCCA");
    v10 = -[WCM_WiFiService isWiFiNetworkCaptive](v3, "isWiFiNetworkCaptive");
    wrmWifiCallingEnd = self->wrmWifiCallingEnd;
    wrmWifiCallingEnd->Captive_Network = v10;
    wrmWifiCallingEnd->iWLAN_Status = v5 == 1;
    self->wrmWifiCallingEnd->WOW_Enabled = -[WCM_WiFiService isWoWEnabled](v3, "isWoWEnabled");
    v12 = -[WRM_HandoverManager getCTService](self, "getCTService");
    v13 = -[WRM_HandoverManager getSCService](self, "getSCService");
    v14 = objc_msgSend(v12, "isVoiceLQMValid");
    if (v14)
      v14 = objc_msgSend(v12, "getLteVoiceLQM");
    self->wrmWifiCallingEnd->LTE_Voice_LQM = v14;
    v15 = objc_msgSend(v13, "isDataLQMValid");
    if (v15)
      v15 = objc_msgSend(v13, "getCellularDataLQM");
    self->wrmWifiCallingEnd->LTE_Data_LQM = v15;
    objc_msgSend(v12, "getServingCellRSRP");
    self->wrmWifiCallingEnd->LTE_RSRP = (int)v16;
    self->wrmWifiCallingEnd->LTE_Signal_bar = objc_msgSend(v12, "getCurrentSignalBars");
    objc_msgSend(v12, "getServingCellSNR");
    v18 = self->wrmWifiCallingEnd;
    v18->LTE_SINR = v17;
    v19 = CFSTR("Cellular");
    if (v5 == 1)
      v19 = CFSTR("WiFi");
    v18->WRM_Recommended_RAT = &v19->isa;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("HandoverManager: feedAWDCallEndStats RAT  %@, WiFi_RSSI: %d LTE_RSRP: %d iWLAN Status: %d LTE_Voice_LQM: %d, Latte_RTP_Packet_Loss: %d,Latte_Erasures: %d,Latte_Nominal_Jitter_Buffer_Size: %d, Latte_Nominal_Jitter_BufferCall: %d, SNR: %d,Signal BARS:%d"), v19, v18->WiFi_RSSI, v18->LTE_RSRP, v18->iWLAN_Status, v18->LTE_Voice_LQM, v18->Latte_RTP_Packet_Loss, v18->Latte_Erasures, v18->Latte_Nominal_Jitter_Buffer_Size, v18->Latte_Dejitter_Buffer_Underflow, v17, v18->LTE_Signal_bar);
  }
}

- (void)updateAVCRTPMetric:(unint64_t)a3
{
  objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "updateVoLTESpeechErasure:", a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("updateAVCRTPMetric: %lld"), a3);
}

- (void)createSymptomsService
{
  if (self->mSymtomsService)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: SymptomsService already exist."));
    -[WRM_SymptomsService resetSFContext](self->mSymtomsService, "resetSFContext");
  }
  else
  {
    self->mSymtomsService = objc_alloc_init(WRM_SymptomsService);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: SymptomsService created."));
  }
}

- (void)createIBIClient
{
  if (!-[WRM_HandoverManager disableICEClient](self, "disableICEClient") && !self->mIBIClient)
  {
    self->mIBIClient = objc_alloc_init(WRM_IceClientDriver);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: ICE client is created."));
  }
}

- (void)createQMIClient
{
  const __CFString *v3;
  WRM_QMINasClient *v4;
  const __CFString *v5;
  WRM_QMINasClient *v6;
  const __CFString *v7;
  WRM_QMIDsdClient *v8;

  if (-[WRM_HandoverManager disableQMIClient](self, "disableQMIClient"))
    return;
  if (self->mQMINasClientPrimary)
  {
    v3 = CFSTR("iRAT: QMI NAS Primary client already exist.");
  }
  else
  {
    v4 = -[WRM_QMINasClient initWithSub:]([WRM_QMINasClient alloc], "initWithSub:", 1);
    self->mQMINasClientPrimary = v4;
    if (!v4)
      goto LABEL_7;
    v3 = CFSTR("iRAT: QMI NAS Primary client is created.");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v3);
LABEL_7:
  if (!-[WRM_HandoverManager isRecentDevice](self, "isRecentDevice"))
    return;
  if (self->mQMINasClientSecondary)
  {
    v5 = CFSTR("iRAT: QMI NAS Secondary client already exist.");
LABEL_12:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v5);
    goto LABEL_13;
  }
  v6 = -[WRM_QMINasClient initWithSub:]([WRM_QMINasClient alloc], "initWithSub:", 2);
  self->mQMINasClientSecondary = v6;
  if (v6)
  {
    v5 = CFSTR("iRAT: QMI NAS Secondary client is created.");
    goto LABEL_12;
  }
LABEL_13:
  if (self->mQMIDsdClientPrimary)
  {
    v7 = CFSTR("iRAT: QMI DSD Primary client already exist.");
  }
  else
  {
    v8 = -[WRM_QMIDsdClient initWithSub:]([WRM_QMIDsdClient alloc], "initWithSub:", 1);
    self->mQMIDsdClientPrimary = v8;
    if (!v8)
      return;
    v7 = CFSTR("iRAT: QMI DSD Primary client is created.");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v7);
}

- (void)notifyBBVoIPState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    -[WRM_QMINasClient notifyBBCallState::::](self->mQMINasClientPrimary, "notifyBBCallState::::", v9, v8, v7, v6);
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    -[WRM_IceClientDriver notifyBBCallState:::::](self->mIBIClient, "notifyBBCallState:::::", 1, v9, v8, v7, v6);
  }
  objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "updateCallState:", v8);
}

- (void)notifyDuplicationState:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = a3;
  if (-[WRM_HandoverManager isQmiSdmSupported](self, "isQmiSdmSupported"))
  {
    -[WRM_QMINasClient notifyFTDupelicationState:](self->mQMINasClientPrimary, "notifyFTDupelicationState:", v3);
  }
  else if (-[WRM_HandoverManager isIbiSdmSupported](self, "isIbiSdmSupported"))
  {
    -[WRM_IceClientDriver notifyFTDupelicationState::](self->mIBIClient, "notifyFTDupelicationState::", 1);
  }
}

- (BOOL)isCallActive
{
  return byte_100270FF9;
}

- (void)postWRMStateToBB
{
  if (byte_100270DE8 != 2)
    -[WRM_HandoverManager setBBSAState:](self, "setBBSAState:", byte_100270DE8 != 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("postWRMStateToBB"));
}

- (void)evalSAStatusWiFiCallCallingPrefChanged
{
  dispatch_time_t v3;
  NSObject *mQueue;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("evalSAStatusWiFiCallCallingPrefChanged "));
  if (self->mSCService)
  {
    v3 = dispatch_time(0, 2000000000);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BBCA8;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_after(v3, mQueue, block);
  }
}

- (void)evalSAStateSlice
{
  WRM_SCService *mSCService;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("evalSAStateSlice "));
  mSCService = self->mSCService;
  if (mSCService)
    -[WRM_HandoverManager toggleSAState:](self, "toggleSAState:", -[WRM_SCService isWiFiPrimary](mSCService, "isWiFiPrimary"));
}

- (void)lowPowerModePeriodicWakeUp
{
  NSMutableArray *miRATClientContexts;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(miRATClientContexts);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isLowPowerModePeriodicWakeUpNotificationSubscribed"))
          objc_msgSend(v7, "notifylowPowerModePeriodicWakeUp");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3
{
  return objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "isSaAllowedOnWiFiAssociation:", a3);
}

- (id)getQmiClientForSim:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 80;
    return *(Class *)((char *)&self->super.isa + v3);
  }
  if (a3 == 2)
  {
    v3 = 88;
    return *(Class *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (id)getIbiClient
{
  return self->mIBIClient;
}

@end
