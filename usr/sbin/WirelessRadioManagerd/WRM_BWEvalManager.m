@implementation WRM_BWEvalManager

- (void)updateControllerState:(id)a3
{
  NSObject *mQueue;
  _QWORD v4[6];

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019498;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)handleStreamingStateChange:(int)a3 appId:(id)a4
{
  dispatch_time_t v7;
  uint64_t v8;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleStreamingStateChange state=%d appId=%@"), *(_QWORD *)&a3, a4);
  if (a3 == 8)
  {
    -[WRM_BWEvalManager getInitialIPStats](self, "getInitialIPStats");
    byte_100271048 = 1;
    objc_msgSend((id)qword_100270EE0, "addObject:", a4);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("FG Streaming app active: %d, LPM Mode: %d"), byte_100271048, byte_100270EFC);
    v7 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031AFC;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), block);
  }
  else
  {
    objc_msgSend((id)qword_100270EE0, "removeObject:", a4);
    if (objc_msgSend((id)qword_100270EE0, "count"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleStreamingStateChange skip rxVoIPAppNotification %@"), qword_100270EE0, v8);
    }
    else
    {
      byte_100271048 = 0;
      -[WRM_BWEvalManager stopPeriodicTask](self, "stopPeriodicTask");
      if (byte_100270ED1)
      {
        -[WRM_BWEvalManager notifyStreamingState::](self, "notifyStreamingState::", 2, 0);
        byte_100270ED1 = 0;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("FG Streaming app active: %d, LP Mode: %d"), byte_100271048, byte_100270EFC);
    }
  }
}

- (void)processSessionStatusUpdate:(id)a3
{
  uint64_t uint64;
  unint64_t mStreamingConnectionReferenceCount;
  unint64_t mAchievedMaxWiFiBW;
  WRMMetricsiRATStreaming *mWrmiRATStreaming;
  WRMMetricsiRATStreaming *v9;
  char v10;
  unint64_t mAchievedMaxCellBW;
  unint64_t v12;

  uint64 = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingStarted");
  mStreamingConnectionReferenceCount = self->mStreamingConnectionReferenceCount;
  if (uint64)
  {
    self->mStreamingConnectionReferenceCount = mStreamingConnectionReferenceCount + 1;
    if (-[WRM_BWEvalManager isWiFiPrimary](self, "isWiFiPrimary"))
    {
      mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
      mWrmiRATStreaming = self->mWrmiRATStreaming;
      mWrmiRATStreaming->pActualLowBandwidth = self->mAchievedPreviousWiFiBW;
      mWrmiRATStreaming->maxOfActualLowBandwidth = mAchievedMaxWiFiBW;
      dword_100270F8C = -[WRM_BWEvalManager getMLPredictedWiFiBW](self, "getMLPredictedWiFiBW");
    }
    else
    {
      v9 = self->mWrmiRATStreaming;
      if (self->mStreamingConnectionReferenceCount == 1)
        v10 = 1;
      else
        v10 = 2;
      v9->coldStartTypeCellular = v10;
      mAchievedMaxCellBW = self->mAchievedMaxCellBW;
      v9->pActualLowBandwidth = self->mAchievedPreviousCellBW;
      v9->maxOfActualLowBandwidth = mAchievedMaxCellBW;
      dword_100270F88 = -[WRM_BWEvalManager getMLPredictedCellBW](self, "getMLPredictedCellBW");
    }
  }
  else
  {
    self->mStreamingConnectionReferenceCount = mStreamingConnectionReferenceCount - 1;
  }
  v12 = self->mStreamingConnectionReferenceCount;
  if (v12 == 1)
  {
    self->mStreamingSessionActive = 1;
    dword_100270F68 = 0;
    self->mMovAVGAchievedBW = 0.0;
    self->mHarvestedBW = 0;
    self->mHarvestedLatency = 0;
    -[WRM_BWEvalManager notifyStreamingState::](self, "notifyStreamingState::", 1, 0);
    v12 = self->mStreamingConnectionReferenceCount;
  }
  if (!v12)
  {
    self->mStreamingSessionActive = 0;
    dword_100270F68 = 0;
    self->mMovAVGAchievedBW = 0.0;
    self->mHarvestedBW = 0;
    self->mHarvestedLatency = 0;
    -[WRM_BWEvalManager notifyStreamingState::](self, "notifyStreamingState::", 2, 0);
  }
  self->mStreamingConnectionExpectedTimeHorizon = xpc_dictionary_get_uint64(a3, "kWRMExpectedTimeHorizon");
  self->mStreamingStallDetected = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingNumStallDetected");
  self->mStreamingFatalErrorDetected = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingFatalErrorDetected") != 0;
  self->mStreamingTotalStallDuration = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingTotalStallTime");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("processSessionStatusUpdate: reference count: %lld"), self->mStreamingConnectionReferenceCount);
  -[WRM_BWEvalManager notifyCommCenterManager](self, "notifyCommCenterManager");
}

- (void)evaluateWiFiLink
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  const char *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  NSMutableArray *obj;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Evaluate WIFI Link: Total number of IMG clients %zu."), -[NSMutableArray count](self->miRATClientContexts, "count"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->miRATClientContexts;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v3);
        v5 = objc_msgSend(v4, "getMyClientType");
        v6 = "ClientCommCenter";
        if (v5 != 1)
        {
          if (v5 - 2 >= 0x14)
          {
            v6 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (v5 == 22)
              v6 = "ClientCoreMediaStreaming";
          }
          else
          {
            v6 = off_100202E40[v5 - 2];
          }
        }
        v27 = v3;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("<%s>Evaluate WiFi Link: BEGIN."), v6);
        v26 = v4;
        v7 = objc_msgSend(v4, "getHandoverContexts");
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v28 = v7;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v8)
        {
          v9 = v8;
          v29 = *(_QWORD *)v31;
          if (v5 == 22)
            v10 = "ClientCoreMediaStreaming";
          else
            v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          v11 = (int)(v5 - 2);
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v29)
                objc_enumerationMutation(v28);
              v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v14 = objc_msgSend(v13, "getApplicationType");
              v15 = objc_msgSend(v13, "getConnectedLinkType");
              v16 = objc_msgSend(v13, "getRecommenedLinkType");
              v17 = "ClientCommCenter";
              if (v5 != 1)
              {
                v17 = v10;
                if (v11 <= 0x13)
                  v17 = off_100202E40[v11];
              }
              v18 = "UNKNOWN_APP!!!";
              if (v14 == (id)2)
                v18 = "CT_Th_Call";
              if (v14 == (id)1)
                v18 = "CT_VOICE";
              if (!v14)
                v18 = "CT_DATA";
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("<%s>{%s}Evaluate Link: BEGIN."), v17, v18);
              if (-[WRM_BWEvalManager evaluateLink:::](self, "evaluateLink:::", v14, v15, v16) == 1)
              {
                v19 = 1;
                objc_msgSend(v13, "setLinkPreferenceNotificationRequired:", 1);
                -[WRM_BWEvalManager evaluateWiFiBandwidth:](self, "evaluateWiFiBandwidth:", &v38);
              }
              else
              {
                objc_msgSend(v13, "setLinkPreferenceNotificationRequired:", 0);
                -[WRM_BWEvalManager evaluateCellularBandwidth:](self, "evaluateCellularBandwidth:", &v38);
                v19 = 0;
              }
              objc_msgSend(v13, "setConnectedLinkType:", v19);
              objc_msgSend(v13, "setMinEvalBW:", (_QWORD)v38);
              objc_msgSend(v13, "setMaxEvalBW:", *((_QWORD *)&v38 + 1));
              objc_msgSend(v13, "setMinMovEvalBW:", (_QWORD)v39);
              objc_msgSend(v13, "setMaxMovEvalBW:", *((_QWORD *)&v39 + 1));
              objc_msgSend(v13, "setNetworkEvalBW:", v40);
              v20 = "ClientCommCenter";
              if (v5 != 1)
              {
                v20 = v10;
                if (v11 <= 0x13)
                  v20 = off_100202E40[v11];
              }
              if (v14)
              {
                v21 = "CT_VOICE";
                if (v14 != (id)1)
                {
                  v21 = "UNKNOWN_APP!!!";
                  if (v14 == (id)2)
                    v21 = "CT_Th_Call";
                }
              }
              else
              {
                v21 = "CT_DATA";
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("<%s>{%s}Evaluate WIFI-CELLULAR Link BW: END."), v20, v21);
              v22 = "ClientCommCenter";
              if (v5 != 1)
              {
                v22 = v10;
                if (v11 <= 0x13)
                  v22 = off_100202E40[v11];
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("<%s>Evaluate CELLULAR-WiFi Link BW: END."), v22);
            }
            v9 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
          }
          while (v9);
        }
        objc_msgSend(v26, "handleLinkPreferenceNotificationCM:", 0);
        -[WRM_BWEvalManager feedAWDStreamingStats:](self, "feedAWDStreamingStats:", &v38);
        v3 = v27 + 1;
      }
      while ((id)(v27 + 1) != v25);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v25);
  }
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
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: iRAT client count:%d."), "-[WRM_BWEvalManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR(" No iRAT client available."));
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
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: iRAT client Context count:%d."), "-[WRM_BWEvalManager doesIRATClientSubscriptionContextExist]", objc_msgSend(v9, "count"));
      v6 |= objc_msgSend(v9, "count") != 0;
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](miRATClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
LABEL_12:
  objc_sync_exit(obj);
  return v6 & 1;
}

- (void)feedAWDRadioStats
{
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  float v9;
  double v10;
  double v11;
  unsigned int v12;
  WRMMetricsiRATStreaming *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  WRMMetricsiRATStreaming *mWrmiRATStreaming;
  double v20;
  double v21;
  double v22;
  WRMMetricsiRATStreaming *v23;
  double v24;
  double v25;
  unsigned int v26;
  WRMMetricsiRATStreaming *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  WRMMetricsiRATStreaming *v33;
  unsigned int v34;
  WRMMetricsiRATStreaming *v35;

  mWiFi = self->mWiFi;
  if (mWiFi && (objc_opt_respondsToSelector(mWiFi, "wifiService:") & 1) != 0)
    v4 = -[WCM_WiFiController wifiService](self->mWiFi, "wifiService");
  else
    v4 = 0;
  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSCService");
  v6 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSymptomsService");
  if (!objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    v7 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
    v8 = 0;
    if (v4)
      goto LABEL_7;
LABEL_10:
    mWrmiRATStreaming = self->mWrmiRATStreaming;
    mWrmiRATStreaming->wrmRecommendedRAT = 0;
    goto LABEL_12;
  }
  v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  objc_msgSend(v7, "setActiveSlot:", objc_msgSend(v7, "getUserDataPreferredSlot"));
  v8 = objc_msgSend(v7, "getCTDataIndictor");
  if (!v4)
    goto LABEL_10;
LABEL_7:
  self->mWrmiRATStreaming->wrmRecommendedRAT = -[WCM_WiFiService isWiFiPrimaryInterface](v4, "isWiFiPrimaryInterface");
  if (-[WCM_WiFiService isWiFiPrimaryInterface](v4, "isWiFiPrimaryInterface"))
  {
    self->mWrmiRATStreaming->wifiRssi = (int)-[WCM_WiFiService getRSSI](v4, "getRSSI");
    -[WCM_WiFiService getRxPhyRate](v4, "getRxPhyRate");
    self->mWrmiRATStreaming->phyRate = (int)v9;
    self->mWrmiRATStreaming->cca = -[WCM_WiFiService getCCA](v4, "getCCA");
    self->mWrmiRATStreaming->StationCount = -[WCM_WiFiService getConnectedStationCount](v4, "getConnectedStationCount");
    self->mWrmiRATStreaming->lqmScoreWifi = -[WCM_WiFiService isWiFiQualityGoodForProximityMode](v4, "isWiFiQualityGoodForProximityMode");
    self->mWrmiRATStreaming->decisionVIBE = -[WCM_WiFiService getBEDecision](v4, "getBEDecision");
    self->mWrmiRATStreaming->decisionVO = -[WCM_WiFiService getVoiceDecision](v4, "getVoiceDecision");
    self->mWrmiRATStreaming->expectedThroughputVIBE = -[WCM_WiFiService getTxThroughputVI](v4, "getTxThroughputVI");
    self->mWrmiRATStreaming->expectedThroughputVO = -[WCM_WiFiService getTxThroughputVO](v4, "getTxThroughputVO");
    self->mWrmiRATStreaming->packetLifetimeVIBE = -[WCM_WiFiService getLifeTimeVI](v4, "getLifeTimeVI");
    self->mWrmiRATStreaming->pkgLifeTimeVO = -[WCM_WiFiService getLifeTimeVO](v4, "getLifeTimeVO");
    self->mWrmiRATStreaming->pktLossRateVO = -[WCM_WiFiService getTxLossRateVO](v4, "getTxLossRateVO");
    self->mWrmiRATStreaming->goodDecisionsCounterVO = -[WCM_WiFiService getGoodVoiceCounter](v4, "getGoodVoiceCounter");
    self->mWrmiRATStreaming->badDecisionsCounterVO = -[WCM_WiFiService getBadVoiceCounter](v4, "getBadVoiceCounter");
    self->mWrmiRATStreaming->goodDecisionsCounterVIBE = -[WCM_WiFiService getGoodVoiceCounter](v4, "getGoodVoiceCounter");
    self->mWrmiRATStreaming->badDecisionsCounterVIBE = -[WCM_WiFiService getBadVideoCounter](v4, "getBadVideoCounter");
    self->mWrmiRATStreaming->invalidDecisionCounter = -[WCM_WiFiService getInvalidCounter](v4, "getInvalidCounter");
    self->mWrmiRATStreaming->weightedAveragePhyrateRx = -[WCM_WiFiService getWghtAverageRXPhyRate](v4, "getWghtAverageRXPhyRate");
    self->mWrmiRATStreaming->weightedAveragePhyrateTx = -[WCM_WiFiService getWghtAverageTXPhyRate](v4, "getWghtAverageTXPhyRate");
    self->mWrmiRATStreaming->weightedAverageRssi = --[WCM_WiFiService getWghtAverageRSSI](v4, "getWghtAverageRSSI");
    self->mWrmiRATStreaming->weightedAverageSnr = -[WCM_WiFiService getWghtAverageSNR](v4, "getWghtAverageSNR");
    -[WCM_WiFiService getTxPer](v4, "getTxPer");
    self->mWrmiRATStreaming->txPER = (v10 * 100.0);
    -[WCM_WiFiService getRxRatio](v4, "getRxRatio");
    self->mWrmiRATStreaming->rxRetry = (v11 * 100.0);
    self->mWrmiRATStreaming->devicePointOfInterest = -[WCM_WiFiService getPointOfInterest](v4, "getPointOfInterest");
    self->mWrmiRATStreaming->wifChannelBW = -[WCM_WiFiService getWiFiBW](v4, "getWiFiBW");
    v12 = -[WCM_WiFiService getChannelType](v4, "getChannelType");
    v13 = self->mWrmiRATStreaming;
    v13->wifChannelType = v12;
    v13->wifilowDataMode = 0;
    self->mWrmiRATStreaming->isWfiCaptive = -[WCM_WiFiService isWiFiNetworkCaptive](v4, "isWiFiNetworkCaptive");
    objc_msgSend(v6, "getTCPAvgRTT");
    self->mWrmiRATStreaming->tcpRTTAvg = (v14 * 1000.0);
    objc_msgSend(v6, "getTCPMinRTT");
    self->mWrmiRATStreaming->tcpRTTmin = (v15 * 1000.0);
    objc_msgSend(v6, "getTCPRttVar");
    self->mWrmiRATStreaming->tcpRTTvar = (v16 * 1000.0);
    objc_msgSend(v6, "getRxDupeRatio");
    self->mWrmiRATStreaming->ratioDupeBytes = (v17 * 100.0);
    objc_msgSend(v6, "getRxRetryRatio");
    self->mWrmiRATStreaming->ratioOOBBytes = (v18 * 100.0);
    goto LABEL_13;
  }
  mWrmiRATStreaming = self->mWrmiRATStreaming;
LABEL_12:
  mWrmiRATStreaming->devicePointOfInterest = 0;
  *(_OWORD *)&mWrmiRATStreaming->pkgLifeTimeVO = 0u;
  *(_OWORD *)&mWrmiRATStreaming->weightedAverageRssi = 0u;
  *(_OWORD *)&mWrmiRATStreaming->goodDecisionsCounterVO = 0u;
  *(_OWORD *)&mWrmiRATStreaming->invalidDecisionCounter = 0u;
  *(_OWORD *)&mWrmiRATStreaming->wifiRssi = 0u;
  *(_OWORD *)&mWrmiRATStreaming->StationCount = 0u;
  self->mWrmiRATStreaming->StationCount = objc_msgSend(v7, "getDataSlotLoad");
LABEL_13:
  if (objc_msgSend(v7, "getServingCellType") == 1)
  {
    self->mWrmiRATStreaming->ratType = (NSString *)CFSTR("LTE_RADIO");
    objc_msgSend(v7, "getServingCellRSRP");
    self->mWrmiRATStreaming->CellRSRP = (int)v20;
    objc_msgSend(v7, "getServingCellSNR");
    self->mWrmiRATStreaming->CellSinr = (int)v21;
    self->mWrmiRATStreaming->rrcState = objc_msgSend(v7, "getRRCState");
    objc_msgSend(v7, "getServingCellRSRQ");
    v23 = self->mWrmiRATStreaming;
    v23->cellLteRSRQ = (int)v22;
    if (v8 > 0x12 || ((1 << v8) & 0x70100) == 0)
    {
      *(_WORD *)&v23->cellNsaEnabled = 0;
      v23->cellNrRSRP = 0;
      *(_QWORD *)&v23->cellNrRSRQ = 0;
      goto LABEL_27;
    }
    v23->cellNsaEnabled = 1;
  }
  else
  {
    if (objc_msgSend(v7, "getServingCellType") == 2)
    {
      self->mWrmiRATStreaming->ratType = (NSString *)CFSTR("UMTS_RADIO");
      objc_msgSend(v7, "getServingCellRSCP");
      self->mWrmiRATStreaming->CellRSRP = (int)v24;
      objc_msgSend(v7, "getServingCellECIO");
      self->mWrmiRATStreaming->CellSinr = (int)v25;
      goto LABEL_27;
    }
    v26 = objc_msgSend(v7, "getServingCellType");
    v27 = self->mWrmiRATStreaming;
    if (v26 != 9)
    {
      v27->ratType = (NSString *)CFSTR("UNKNOWN_RADIO");
      goto LABEL_27;
    }
    v27->ratType = (NSString *)CFSTR("N_RADIO");
  }
  objc_msgSend(v7, "getNrRSRP");
  self->mWrmiRATStreaming->cellNrRSRP = (int)v28;
  objc_msgSend(v7, "getNrSNR");
  self->mWrmiRATStreaming->cellNrSNR = (int)v29;
  objc_msgSend(v7, "getNrRSRQ");
  self->mWrmiRATStreaming->cellNrRSRQ = (int)v30;
  self->mWrmiRATStreaming->isFR1 = !objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded")|| !objc_msgSend(v7, "isDeviceUsingFR2Radio");
LABEL_27:
  self->mWrmiRATStreaming->lqmScorecellular = objc_msgSend(v5, "getCellularDataLQM");
  objc_msgSend(v7, "getMeasureBWDataSlot");
  self->mWrmiRATStreaming->cellEstimatedBW = v31;
  self->mWrmiRATStreaming->cellARFCN = objc_msgSend(v7, "getUARFCNDataSlot");
  self->mWrmiRATStreaming->cellBandInfo = objc_msgSend(v7, "getBandInfoDataSlot");
  v32 = objc_msgSend(v7, "getBandWidthDataSlot");
  v33 = self->mWrmiRATStreaming;
  v33->cellChannelBW = v32;
  v33->tcpRTTAvg = self->mHarvestedLatency;
  v33->mac_DLCA_configured = dword_100270F6C;
  v33->total_configured_bw = dword_100270F70;
  v33->total_configured_mimo_layers = dword_100270F74;
  v33->lte_max_scheduled_mimo_layers_in_a_cell = dword_100270F78;
  v33->nr_configured_bw = dword_100270F7C;
  v33->nr_total_scheduled_mimo_layers = dword_100270F80;
  v33->nr_max_dl_modulation = dword_100270F84;
  self->mWrmiRATStreaming->lqmScoreBT = objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "getMovingAvgBTRssi");
  self->mWrmiRATStreaming->rxRetransmissionRate = objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "getBtTxPer");
  v34 = objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "getBtRxPer");
  v35 = self->mWrmiRATStreaming;
  v35->txRetransmissionRate = v34;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CELL BW: %d,TCP_RTT_AVG: %d,TCP_RTT_MIN: %d,TCP_RTT_VAR: %d, RX Dupe ratio: %d, RX_RETRY: %d, WiFi_CH: %d WiFi_CH_TYPE: %d"), v35->cellEstimatedBW, v35->tcpRTTAvg, v35->tcpRTTmin, v35->tcpRTTvar, v35->ratioDupeBytes, v35->ratioOOBBytes, v35->wifChannelBW, v35->wifChannelType);
  -[WRM_BWEvalManager updateBBState](self, "updateBBState");
  self->mWrmiRATStreaming->metricsUpdate = 1;
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
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
  NSObject *mProximityMsgQueue;
  __objc2_class **v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  float mMovAVGAchievedBW;
  float v24;
  unint64_t mAchievedWiFiBW;
  uint64_t v26;
  unint64_t mAchievedMovAvgWiFiBW;
  unint64_t v28;
  unint64_t mAchievedCellBW;
  uint64_t v30;
  double v31;
  double v32;
  int32x2_t *mWrmiRATStreaming;
  float v34;
  float v35;
  double v38;
  int v39;
  unint64_t mAchievedBW;
  unint64_t mAchievedMaxWiFiBW;
  WRMMetricsiRATStreaming *v42;
  const __CFString *v43;
  unint64_t mAchievedMaxCellBW;
  WRMMetricsiRATStreaming *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  _QWORD block[7];

  self->mWrmiRATStreaming->event = 1;
  -[WRM_BWEvalManager feedAWDRadioStats](self, "feedAWDRadioStats", a3, a4);
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
    v8 = off_100202D98[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("iRAT Video BW Mgr: Status update Msg recvd from client %d(%s)"), uint64, v8);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v10);
  if (count)
  {
    v12 = count;
    for (i = 0; v12 != i; ++i)
    {
      v14 = xpc_array_get_value(v10, i);
      v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v14, "kWRMVideoStreamingStarted"))
      {
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("%s: reseting SDM recommendation"), "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]");
        mProximityMsgQueue = self->mProximityMsgQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000188E0;
        block[3] = &unk_100201B18;
        block[4] = self;
        block[5] = v14;
        dispatch_async(mProximityMsgQueue, block);
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("Streaming session active: %d, Contains BW achieved: %d"), self->mStreamingSessionActive, 0, v48, v49, v50, v51, v52, v53, v54);
      }
      else
      {
        v55 = v15;
        if (xpc_dictionary_get_value(v14, "kWRMStreamingDataSentCount"))
        {
          v17 = p_superclass;
          v18 = xpc_dictionary_get_uint64(v14, "kWRMStreamingDataSentCount");
          v19 = xpc_dictionary_get_uint64(v14, "kWRMStreamingDataSentDuration");
          v20 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          v21 = xpc_dictionary_get_uint64(v14, "kSesLatency");
          v22 = v18;
          if (!v18 || !v19 || !v20)
            return;
          p_superclass = v17;
          self->mDataSent = v22;
          self->mDuration = v19;
          self->mHarvestedBW = v20;
          self->mHarvestedLatency = v21;
          mMovAVGAchievedBW = self->mMovAVGAchievedBW;
          v24 = 12000.0;
          if (mMovAVGAchievedBW != 0.0)
            v24 = (double)v20 * 0.2 + mMovAVGAchievedBW * 0.8;
          self->mMovAVGAchievedBW = v24;
          -[WRM_BWEvalManager evaluateSDMBWChangeNotification:](self, "evaluateSDMBWChangeNotification:");
        }
        else if (!byte_100270F64)
        {
          return;
        }
        if (-[WRM_BWEvalManager isWiFiPrimary](self, "isWiFiPrimary"))
        {
          mAchievedWiFiBW = self->mAchievedWiFiBW;
          self->mAchievedPreviousBW = mAchievedWiFiBW;
          self->mAchievedPreviousWiFiBW = mAchievedWiFiBW;
          v26 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          self->mAchievedBW = v26;
          self->mAchievedWiFiBW = v26;
          mAchievedMovAvgWiFiBW = self->mAchievedMovAvgWiFiBW;
          if (mAchievedMovAvgWiFiBW)
            v28 = (v26 - mAchievedMovAvgWiFiBW + 8 * mAchievedMovAvgWiFiBW) >> 3;
          else
            v28 = v26;
          self->mAchievedMovAvgWiFiBW = v28;
          objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("streaming on WiFi"));
        }
        else
        {
          mAchievedCellBW = self->mAchievedCellBW;
          self->mAchievedPreviousCellBW = mAchievedCellBW;
          self->mAchievedPreviousBW = mAchievedCellBW;
          v30 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          self->mAchievedBW = v30;
          self->mAchievedCellBW = v30;
          if (self->mWrmiRATStreaming->coldStartTypeCellular)
            byte_100270F90 = 1;
          objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("ThroughputPrediction: streaming on cellular: mAchievedCellBW: %llu"), v30);
        }
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("%s: Record#=%d, IMG Video Application Type=%llu,Achieved BW:%llu, Previous Achieved BW:%llu, Data Sent:%llu, Duration:%llu, mAchievedWiFiBW:%llu, mAchievedCellBW:%llu"), "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", i, v55, self->mAchievedBW, self->mAchievedPreviousBW, self->mDataSent, self->mDuration, self->mAchievedWiFiBW, self->mAchievedCellBW);
      }
    }
  }
  -[WRM_BWEvalManager evaluateWiFiLink](self, "evaluateWiFiLink");
  -[NSDate timeIntervalSinceNow](self->mCMStatusUpdateEvaluationTimer, "timeIntervalSinceNow");
  v32 = self->mTimeSinceCMStatusEvaluationStarted - v31;
  mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
  v34 = (float)self->mAchievedBW - (float)mWrmiRATStreaming[5].u32[1];
  v35 = (float)(v34 + (float)(self->mMovingAvgDeviation * 7.0)) * 0.125;
  self->mDeviation = v34;
  self->mMovingAvgDeviation = v35;
  if (v32 >= 120.0 || byte_100270F64 != 0 || byte_100270F90 != 0)
  {
    -[NSDate timeIntervalSinceNow](self->mCMStatusUpdateEvaluationTimer, "timeIntervalSinceNow");
    self->mTimeSinceCMStatusEvaluationStarted = v38;
    mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
    if (mWrmiRATStreaming[47].i8[5])
    {
      v39 = dword_100270F94;
      mWrmiRATStreaming[1].i32[0] = dword_100270F94;
      dword_100270F94 = v39 + 1;
      mWrmiRATStreaming[46].i32[0] = self->mStreamingStallDetected;
      mWrmiRATStreaming[47].i8[0] = self->mStreamingFatalErrorDetected;
      mAchievedBW = self->mAchievedBW;
      mWrmiRATStreaming[7] = vmovn_s64(*(int64x2_t *)&self->mDataSent);
      mWrmiRATStreaming[2].i32[1] = mWrmiRATStreaming[5].i32[0];
      mWrmiRATStreaming[3].i32[0] = mAchievedBW;
      mWrmiRATStreaming[4].i32[1] = (int)self->mMovingAvgDeviation;
      if (-[WRM_BWEvalManager isWiFiPrimary](self, "isWiFiPrimary"))
      {
        mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
        v42 = self->mWrmiRATStreaming;
        v42->pActualLowBandwidth = self->mAchievedPreviousWiFiBW;
        v42->maxOfActualLowBandwidth = mAchievedMaxWiFiBW;
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("ThroughputPrediction streaming getMLPredictedWiFiBW mAchievedMaxWiFiBW=%llu"), mAchievedMaxWiFiBW);
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f"), self->mAchievedWiFiBW, 0, -[WRM_BWEvalManager getMLPredictedWiFiBW](self, "getMLPredictedWiFiBW"), 0);
      }
      else if (byte_100270F90)
      {
        if (self->mWrmiRATStreaming->coldStartTypeCellular == 1)
          v43 = CFSTR("COLD START: Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f");
        else
          v43 = CFSTR("SEMI COLD START: Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f");
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, v43, self->mAchievedCellBW, dword_100270F88, dword_100270F8C, (double)self->mAchievedCellBW / 1000.0 - (double)dword_100270F88 / 1000.0);
        byte_100270F90 = 0;
      }
      else
      {
        mAchievedMaxCellBW = self->mAchievedMaxCellBW;
        v45 = self->mWrmiRATStreaming;
        v45->pActualLowBandwidth = self->mAchievedPreviousCellBW;
        v45->maxOfActualLowBandwidth = mAchievedMaxCellBW;
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("ThroughputPrediction streaming getMLPredictedCellBW mAchievedMaxCellBW=%llu"), mAchievedMaxCellBW);
        v46 = -[WRM_BWEvalManager getMLPredictedCellBW](self, "getMLPredictedCellBW");
        objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f"), self->mAchievedCellBW, v46, 0, (double)self->mAchievedCellBW / 1000.0 - (double)v46 / 1000.0);
      }
      objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("%s: Sending AWD report Act Low BW =%llu, Est. Low BW =%llu, Deviation =%lld, data sent =%llu, duration= %llu"), "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", self->mAchievedBW, self->mWrmiRATStreaming->estimatedLowBandwidth, self->mAchievedBW - self->mWrmiRATStreaming->estimatedLowBandwidth, self->mWrmiRATStreaming->cmDataSentCount, self->mWrmiRATStreaming->cmDataSentDuration);
      v47 = self->mProximityMsgQueue;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100061700;
      v56[3] = &unk_1002019E8;
      v56[4] = self;
      dispatch_async(v47, v56);
      mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
    }
  }
  if (mWrmiRATStreaming[47].i8[5])
    objc_msgSend(p_superclass + 279, "logLevel:message:", 28, CFSTR("%s: Act Low BW =%llu, Est. Low BW =%llu, Deviation =%.2f, Mov Deviation = %.2f"), "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", self->mAchievedBW, mWrmiRATStreaming[5].u32[1], self->mDeviation, self->mMovingAvgDeviation);
}

- (void)queryInterfaceStats:(const char *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6 :(unint64_t *)a7
{
  unsigned __int16 *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  size_t v16;
  size_t size;
  int v22[4];
  uint64_t v23;
  char __dst[64];

  size = 0;
  *(_OWORD *)v22 = xmmword_1001DB720;
  v23 = 6;
  sysctl(v22, 6u, 0, &size, 0, 0);
  v8 = (unsigned __int16 *)malloc_type_malloc(size, 0x64AA4976uLL);
  sysctl(v22, 6u, v8, &size, 0, 0);
  if ((uint64_t)size < 1)
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = (unint64_t)v8 + size;
    v14 = v8;
    do
    {
      v15 = *v14;
      if (*((_BYTE *)v14 + 3) == 18 && *((_BYTE *)v14 + 161) == 18)
      {
        v16 = *((unsigned __int8 *)v14 + 165) >= 0x3Fu ? 63 : *((unsigned __int8 *)v14 + 165);
        if ((_DWORD)v16)
          memcpy(__dst, v14 + 84, v16);
        else
          v16 = 0;
        __dst[v16] = 0;
        if (!strcmp(a3, __dst))
        {
          v10 += *((_QWORD *)v14 + 7);
          v9 += *((_QWORD *)v14 + 9);
          v12 += *((_QWORD *)v14 + 12);
          v11 += *((_QWORD *)v14 + 13);
        }
      }
      v14 = (unsigned __int16 *)((char *)v14 + v15);
    }
    while ((unint64_t)v14 < v13);
  }
  if (a5)
    *a5 = v10;
  if (a4)
    *a4 = v9;
  if (a6)
    *a6 = v11;
  if (a7)
    *a7 = v12;
  if (v8)
    free(v8);
}

- (void)handleAppStateChange:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D4E8;
  v3[3] = &unk_100201B18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), v3);
}

- (BOOL)isCallKitAppInDenyList:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("net.whatsapp.WhatsApp"));
}

- (unsigned)getPredictedWiFiBW:(double *)a3 backhaul:(double)a4
{
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL8 v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  int64_t v19;
  int64_t v20;
  double v21;
  const __CFString *v22;
  float v23;
  NSDictionary *v24;
  id v25;
  id v26;
  const __CFString *v27;
  double v28;
  double v29;
  WRMMetricsiRATStreaming *mWrmiRATStreaming;
  unint64_t v31;
  id v33;
  double *v34;
  id v35;
  id v36;
  _QWORD v37[10];
  _QWORD v38[10];

  v36 = 0;
  if (!self->iratWiFiModel)
    goto LABEL_12;
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    v8 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
    if (!-[WCM_WiFiService isWiFiPrimaryInterface](v8, "isWiFiPrimaryInterface"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFi is not primary link"));
LABEL_12:
      LODWORD(mWiFi) = 0;
      return mWiFi;
    }
    objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSymptomsService"), "getTCPAvgRTT");
    v10 = v9 * 1000.0;
    v11 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 1);
    objc_msgSend(v11, "activate");
    v12 = objc_msgSend(v11, "guardInterval");
    v13 = objc_msgSend(v11, "numberOfSpatialStreams");
    objc_msgSend(v11, "invalidate");

    v14 = (id)-[WCM_WiFiService getChannelType](v8, "getChannelType");
    v15 = -[WCM_WiFiService isWiFiNetworkCaptive](v8, "isWiFiNetworkCaptive");
    v35 = -[WCM_WiFiService getCCA](v8, "getCCA");
    v16 = -[WCM_WiFiService getWghtAverageRXPhyRate](v8, "getWghtAverageRXPhyRate");
    v17 = -[WCM_WiFiService getWghtAverageMetricsValid](v8, "getWghtAverageMetricsValid");
    v34 = a3;
    if (v16 && v17)
    {
      v18 = v12;
      v19 = -[WCM_WiFiService getWghtAverageRSSI](v8, "getWghtAverageRSSI");
      v20 = -[WCM_WiFiService getWghtAverageSNR](v8, "getWghtAverageSNR");
      v21 = (double)-[WCM_WiFiService getWghtAverageRXPhyRate](v8, "getWghtAverageRXPhyRate") / 1000.0;
      v22 = CFSTR("wght_avg_valid, using weighted average");
    }
    else
    {
      v18 = v12;
      v19 = -[WCM_WiFiService getRSSI](v8, "getRSSI");
      v20 = -[WCM_WiFiService getSNR](v8, "getSNR");
      -[WCM_WiFiService getRxPhyRate](v8, "getRxPhyRate");
      v21 = v23;
      v22 = CFSTR("wght_avg not valid, using inst avg");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v22);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Start ML recommendation for BW estimation"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction input features: avg_rx_phy_rate: %f, avg_rssi: %d, avg_snr: %f, backhaul: %f, tcpRTTAvg: %f, wifChannelType: %f, wifiguardinterval: %lu, isWfiCaptive: %d, wifinumberOfSpatialStreams: %lu"), *(_QWORD *)&v21, v19, v20, *(_QWORD *)&a4, *(_QWORD *)&v10, v14, v18, v15, v13);
    v37[0] = CFSTR("cca");
    v38[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v35);
    v37[1] = CFSTR("weighted_average_phyrate_rx");
    v38[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21);
    v37[2] = CFSTR("weighted_average_rssi");
    v38[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19);
    v37[3] = CFSTR("weighted_average_snr");
    v38[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20);
    v37[4] = CFSTR("maxOfActualLowBandwidth_d");
    v38[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
    v37[5] = CFSTR("tcpRTTAvg");
    v38[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10);
    v37[6] = CFSTR("wifChannelType");
    v38[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14);
    v37[7] = CFSTR("wifiguardinterval");
    v38[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18);
    v37[8] = CFSTR("isWfiCaptive");
    v38[8] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15);
    v37[9] = CFSTR("wifinumberOfSpatialStreams");
    v38[9] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13);
    v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
    v25 = objc_msgSend(objc_alloc((Class)sub_1000186A0()), "initWithDictionary:error:", v24, &v36);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Calling predictionFromFeatures, input:%@"), -[NSDictionary description](v24, "description"));
    v26 = -[MLModel predictionFromFeatures:error:](self->iratWiFiModel, "predictionFromFeatures:error:", v25, &v36);
    if (v36)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Ran into an error while predicting"));
      v33 = objc_msgSend(v36, "localizedDescription");
      v27 = CFSTR("Failed prediction: %@");
LABEL_11:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v27, v33);

      goto LABEL_12;
    }
    if (!v26)
    {
      v27 = CFSTR("prediction reutrned invalid output");
      goto LABEL_11;
    }
    objc_msgSend(objc_msgSend(v26, "featureValueForName:", CFSTR("actualLowBandwidth_d")), "doubleValue");
    v29 = v28;
    mWrmiRATStreaming = self->mWrmiRATStreaming;
    *(_QWORD *)&mWrmiRATStreaming->wifiModelConfidenceLevel = 0x200000001;
    mWrmiRATStreaming->mlPredictedWiFiBW = v28;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Complete ML recommendation for BW Estimation, Model Output: %f, Predicted Value: %f "), *(_QWORD *)&v28, (float)v28);
    -[WCM_WiFiService resetWghtAverageMetricsFlag](v8, "resetWghtAverageMetricsFlag");
    LODWORD(v31) = self->mWrmiRATStreaming->mlPredictedWiFiBW;
    *v34 = (double)v31;

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: getPredictedWiFiBW ML Model: %f"), *(_QWORD *)&v29);
    LODWORD(mWiFi) = (v29 * 1000.0);
  }
  return mWiFi;
}

- (void)registerLPMNotifier
{
  NSObject *v3;
  _QWORD block[5];
  _QWORD handler[4];
  id v6;
  id location;

  if (!qword_100270EF0)
  {
    qword_100270EF0 = (uint64_t)dispatch_queue_create("com.apple.WRM.BatterySaverWatcher", 0);
    objc_initWeak(&location, self);
    v3 = qword_100270EF0;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100031024;
    handler[3] = &unk_1002019C0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.system.lowpowermode", &dword_100270EF8, v3, handler);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031054;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)qword_100270EF0, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isWiFiPrimary
{
  id v2;

  v2 = +[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isWiFiPrimary");
  return (char)v2;
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64;
  xpc_object_t value;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: message: %@"), "-[WRM_BWEvalManager(privateFunctions) handleSessionNotification:]", a3);
  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 422)
  {
    if (uint64 > 2000)
    {
      switch(uint64)
      {
        case 2001:
          -[WRM_BWEvalManager handleCellularDataMetricsRequest:](self, "handleCellularDataMetricsRequest:", a3);
          return;
        case 2002:
          -[WRM_BWEvalManager handleQSHMetrics:](self, "handleQSHMetrics:", a3);
          return;
        case 2100:
          -[WRM_BWEvalManager handleWiFiMetricsRequest:](self, "handleWiFiMetricsRequest:", a3);
          return;
      }
    }
    else
    {
      switch(uint64)
      {
        case 423:
          -[WRM_BWEvalManager handleGetMLPredictedThroughput:](self, "handleGetMLPredictedThroughput:", a3);
          return;
        case 1000:
          value = xpc_dictionary_get_value(a3, "kMessageArgs");
          -[WRM_BWEvalManager handleInternalMessage:](self, "handleInternalMessage:", value);
          return;
        case 2000:
          -[WRM_BWEvalManager handleNrPhyMetricsRequest:](self, "handleNrPhyMetricsRequest:", a3);
          return;
      }
    }
  }
  else if (uint64 > 411)
  {
    switch(uint64)
    {
      case 412:
        -[WRM_BWEvalManager handleUpdateStallMessage:](self, "handleUpdateStallMessage:", a3);
        return;
      case 417:
        -[WRM_BWEvalManager handleGetStreamingMetrics:](self, "handleGetStreamingMetrics:", a3);
        return;
      case 418:
        -[WRM_BWEvalManager handleEnhancedBufferingNotificatione:](self, "handleEnhancedBufferingNotificatione:", a3);
        return;
    }
  }
  else
  {
    switch(uint64)
    {
      case 103:
        -[WRM_BWEvalManager handleWiFiStateChaneEvents:](self, "handleWiFiStateChaneEvents:", a3);
        return;
      case 404:
        -[WRM_BWEvalManager handleLinkPrefSubscribe:](self, "handleLinkPrefSubscribe:", a3);
        return;
      case 405:
        -[WRM_BWEvalManager handleSubscribeStatusUpdate::](self, "handleSubscribeStatusUpdate::", a3, 1);
        return;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("handleSessionNotification:default"));
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64;
  const __CFString *v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: internalMsg: %@"), "-[WRM_BWEvalManager(privateFunctions) handleInternalMessage:]", a3);
  uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  if (uint64 == 1040 || uint64 == 1003)
    v7 = CFSTR("handleInternalMessage:evaluateWiFiLink");
  else
    v7 = CFSTR("handleInternalMessage:default");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v7);
  -[WRM_BWEvalManager evaluateWiFiLink](self, "evaluateWiFiLink");
}

- (void)handleEnhancedBufferingNotificatione:(id)a3
{
  xpc_object_t value;
  xpc_object_t v4;
  size_t count;
  size_t v6;
  size_t v7;
  unsigned __int8 v8;
  xpc_object_t v9;
  uint64_t uint64;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v4 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v4);
  if (count)
  {
    v6 = count;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = xpc_array_get_value(v4, v7);
      if (xpc_dictionary_get_value(v9, "kMaxElgBrate"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: Received status update with Eligible bit rate "), "-[WRM_BWEvalManager(privateFunctions) handleEnhancedBufferingNotificatione:]");
        uint64 = xpc_dictionary_get_uint64(v9, "kMaxElgBrate");
        if (uint64)
          v8 = 2 * (uint64 == 0x1FFFFFFFFFFFFFLL);
        else
          v8 = 1;
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0;
  }
  -[WRM_BWEvalManager notifyEHBState:](self, "notifyEHBState:", v8);
}

- (void)evaluateWiFiBandwidth:(id *)a3
{
  id v5;
  id v6;
  unint64_t mAchievedWiFiBW;
  double v8;
  double v9;

  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getWiFiController");
  if (v5)
  {
    v6 = objc_msgSend(v5, "wifiService");
    objc_msgSend(v6, "getMinMaxAvailableRxBandwidth:", a3);
    mAchievedWiFiBW = self->mAchievedWiFiBW;
    if (mAchievedWiFiBW > self->mAchievedMaxWiFiBW)
    {
      self->mAchievedMaxWiFiBW = mAchievedWiFiBW;
      self->mScallingFactor = (float)a3->var1 / (float)mAchievedWiFiBW;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("evaluateWiFiBandwidth: mAchievedMaxWiFiBW=%llu"), mAchievedWiFiBW);
    }
    objc_msgSend(v6, "getMovingAvgOfRxRetryPercent");
    v9 = 1.0 - v8;
    *(float *)&v9 = v9;
    -[WRM_BWEvalManager calcAdjustedBandwith::](self, "calcAdjustedBandwith::", a3, v9);
  }
}

- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5
{
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v6 = -[WRM_BWEvalManager isWiFiPrimary](self, "isWiFiPrimary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v7 = "CT_DATA";
  v8 = "CT_VOICE";
  v9 = "UNKNOWN_APP!!!";
  if (a3 == 2)
    v9 = "CT_Th_Call";
  if (a3 != 1)
    v8 = v9;
  if (a3)
    v7 = v8;
  v10 = "CELLULAR";
  if (v6)
    v10 = "WIFI";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("{%s}iRAT: Evaluate link preferred: %s"), v7, v10);
  return v6;
}

- (void)calcAdjustedBandwith:(id *)a3 :(float)a4
{
  float mScallingFactor;
  unint64_t var0;
  float v8;
  unint64_t mAchievedMovAvgWiFiBW;
  unint64_t v10;
  unint64_t v11;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("calcAdjustedBandwith:minEvalBW: %d, CM reported BW:%d, Correction Factor:%.2f, maxBW: %d"), a3->var0, self->mAchievedMaxWiFiBW, a4, self->mAchievedMaxWiFiBW);
  mScallingFactor = self->mScallingFactor;
  var0 = a3->var0;
  if (mScallingFactor > 1.0)
  {
    v8 = (float)a3->var1 / mScallingFactor;
    if (var0 > (unint64_t)v8)
    {
      a3->var0 = (unint64_t)v8;
      var0 = (unint64_t)v8;
    }
  }
  mAchievedMovAvgWiFiBW = self->mAchievedMovAvgWiFiBW;
  if (var0 > mAchievedMovAvgWiFiBW && mAchievedMovAvgWiFiBW)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Link is backhaul limited, use historical bandwitdh"));
    v10 = self->mAchievedMovAvgWiFiBW;
    a3->var0 = v10;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Link is not backhaul limited, use WiFi estimated bandwitdh"));
    v10 = a3->var0;
  }
  v11 = (v10 - self->mEvalMovAvgWiFiBW + 8 * self->mEvalMovAvgWiFiBW) >> 3;
  self->mEvalMovAvgWiFiBW = v11;
  a3->var2 = v11;
}

- (void)notifyStreamingState:(unsigned __int8)a3 :(unsigned int)a4
{
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "notifyAVStatus::", a3, (unsigned __int16)a4);
}

- (void)notifyEHBState:(unsigned __int8)a3
{
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "notifyEHBState:", a3);
}

- (void)getInitialIPStats
{
  WCM_WiFiController *mWiFi;
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  mWiFi = self->mWiFi;
  if (mWiFi
    && -[WCM_WiFiService isWiFiPrimaryInterface](-[WCM_WiFiController wifiService](mWiFi, "wifiService"), "isWiFiPrimaryInterface"))
  {
    v4 = "en0";
  }
  else
  {
    v5 = objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "getInternetInterfaceName");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("getInitialIPStats internetInterfaceName=%@"), v5);
    if (v5)
      v4 = (const char *)objc_msgSend(v5, "UTF8String");
    else
      v4 = "pdp_ip0";
  }
  -[WRM_BWEvalManager queryInterfaceStats:::::](self, "queryInterfaceStats:::::", v4, &v9, &v8, &v7, &v6);
  qword_100271050 = v9;
  qword_100271058 = v8;
  qword_100271060 = v7;
  qword_100271068 = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("sPackets: %llu, rPackets: %llu, txBytes: %llu, rxBytes: %llu"), v9, v8, v7, v6);
}

- (void)updateQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5 :(unsigned int)a6
{
  id v7;
  unsigned int v8;

  dword_100270F6C = a3;
  dword_100270F74 = a5;
  dword_100270F78 = a6;
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    objc_msgSend(v7, "setActiveSlot:", objc_msgSend(v7, "getUserDataPreferredSlot"));
    v8 = objc_msgSend(v7, "getCTDataIndictor");
  }
  else
  {
    v7 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
    v8 = 0;
  }
  if (objc_msgSend(v7, "getServingCellType") == 1
    && (v8 > 0x12 || ((1 << v8) & 0x70100) == 0 || dword_100270F7C <= a4))
  {
    dword_100270F70 = a4;
  }
}

- (BOOL)needWiFiLQM
{
  _BOOL4 v2;
  const char *v3;

  v2 = -[WRM_BWEvalManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist");
  v3 = "NO";
  if (v2)
    v3 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: needWiFiLQM? %s "), "-[WRM_BWEvalManager needWiFiLQM]", v3);
  return v2;
}

- (unsigned)getPredictedWiFiBandwidth:(double *)a3
{
  unint64_t mAchievedMaxWiFiBW;
  double v4;
  uint64_t v5;
  unsigned int v6;

  mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
  if (mAchievedMaxWiFiBW)
    v4 = (double)mAchievedMaxWiFiBW / 1000.0;
  else
    v4 = 44.0;
  v5 = -[WRM_BWEvalManager getPredictedWiFiBW:backhaul:](self, "getPredictedWiFiBW:backhaul:", a3, v4);
  v6 = v5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: getPredictedWiFiBandwidth: %d"), v5);
  return v6;
}

- (unsigned)getMLPredictedWiFiBW
{
  uint64_t v3;
  uint64_t v5;

  v5 = 0;
  v3 = -[WRM_BWEvalManager getPredictedWiFiBW:backhaul:](self, "getPredictedWiFiBW:backhaul:", &v5, (double)self->mAchievedMaxWiFiBW / 1000.0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: getMLPredictedWiFiBW: %d"), v3);
  -[WRM_BWEvalManager feedAWDCoreWiFiMetrics](self, "feedAWDCoreWiFiMetrics");
  return v3;
}

- (void)feedAWDStreamingStats:(id *)a3
{
  WRMMetricsiRATStreaming *mWrmiRATStreaming;

  -[WRM_BWEvalManager feedAWDRadioStats](self, "feedAWDRadioStats");
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  *(int32x4_t *)&mWrmiRATStreaming->estimatedHighBandwidth = vrev64q_s32(vuzp1q_s32(*(int32x4_t *)&a3->var0, *(int32x4_t *)&a3->var2));
  if (self->mStreamingFatalErrorDetected)
    mWrmiRATStreaming->event = 3;
}

- (void)feedAWDCoreWiFiMetrics
{
  id v3;
  id v4;
  id v5;
  unsigned int v6;
  id v7;
  unsigned int v8;
  WRMMetricsiRATStreaming *mWrmiRATStreaming;
  uint64_t v10;
  id v11;

  v11 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 1);
  objc_msgSend(v11, "activate");
  v3 = objc_msgSend(v11, "channel");
  v4 = objc_msgSend(v11, "guardInterval");
  v5 = objc_msgSend(v11, "numberOfSpatialStreams");
  v6 = objc_msgSend(v11, "PHYMode");
  v7 = objc_msgSend(v11, "MCSIndex");
  v8 = objc_msgSend(v11, "bluetoothCoexistenceMode");
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->wifinumberOfSpatialStreams = (int)v5;
  v10 = v8;
  mWrmiRATStreaming->wifiguardinterval = (int)v4;
  mWrmiRATStreaming->wifimcsindex = (int)v7;
  mWrmiRATStreaming->wifiCapability = v6;
  mWrmiRATStreaming->btWiFiCoexState = v8;
  self->mWrmiRATStreaming->wifichannel = objc_msgSend(v3, "channel");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("MCS: %lu, PMode: %d, GI: %lu, NSS: %lu, CCH: %@, COEX mode: %lu"), v7, v6, v4, v5, v3, v10);
  objc_msgSend(v11, "invalidate");

}

+ (id)WRM_BWEvalManagerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061B74;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271138 != -1)
    dispatch_once(&qword_100271138, block);
  return (id)qword_100271140;
}

- (unint64_t)getLPMState
{
  uint64_t state64;

  state64 = 0;
  if (!dword_100270EF8)
    return 0;
  notify_get_state(dword_100270EF8, &state64);
  return state64;
}

- (void)updateLPMState
{
  unint64_t v2;

  v2 = -[WRM_BWEvalManager getLPMState](self, "getLPMState");
  if (byte_100270EFC != (v2 != 0))
  {
    byte_100270EFC = v2 != 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("LPM state:%d"), v2 != 0);
  }
}

- (void)registerWebkitStreamingNotification
{
  _QWORD v3[7];
  _QWORD v4[3];
  char v5;
  _QWORD v6[3];
  char v7;
  uint64_t state64;

  if (!notify_register_check("com.apple.WebKit.mediaStreamingActivity", &dword_100270958))
  {
    state64 = 0;
    notify_get_state(dword_100270958, &state64);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerWebkitStreamingNotification:notify_register_dispatch called"));
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v7 = 0;
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v5 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000311B8;
    v3[3] = &unk_100201A10;
    v3[5] = v6;
    v3[6] = v4;
    v3[4] = self;
    if (!notify_register_dispatch("com.apple.WebKit.mediaStreamingActivity", &dword_100270958, (dispatch_queue_t)&_dispatch_main_q, v3))+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("registerWebkitStreamingNotification:exit"));
    _Block_object_dispose(v4, 8);
    _Block_object_dispose(v6, 8);
  }
}

- (void)subscribeAppStateChangeEvent
{
  _QWORD v3[5];

  if (-[WRM_BWEvalManager isSmartDataModeEnabled](self, "isSmartDataModeEnabled"))
  {
    -[WRM_BWEvalManager registerWebkitStreamingNotification](self, "registerWebkitStreamingNotification");
    qword_100270EC8 = (uint64_t)objc_alloc_init((Class)BKSApplicationStateMonitor);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000C378;
    v3[3] = &unk_100201A38;
    v3[4] = self;
    objc_msgSend((id)qword_100270EC8, "setHandler:", v3);
    qword_100270ED8 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    qword_100270EE0 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
  }
}

- (void)unSubscribeAppStateChangeEvent
{
  if (-[WRM_BWEvalManager isSmartDataModeEnabled](self, "isSmartDataModeEnabled"))
  {
    if (qword_100270EC8)
    {

      qword_100270EC8 = 0;
    }
    if (qword_100270EF0)
    {
      dispatch_release((dispatch_object_t)qword_100270EF0);
      qword_100270EF0 = 0;
    }
    notify_cancel(dword_100270EF8);
    dword_100270EF8 = 0;
    notify_cancel(dword_100270958);
    dword_100270958 = 0;
  }
  if (qword_100270ED8)
  {
    objc_msgSend((id)qword_100270ED8, "removeAllObjects");

  }
  if (qword_100270EE0)
  {
    objc_msgSend((id)qword_100270EE0, "removeAllObjects");

  }
}

- (BOOL)isStreamingAppForeground
{
  return byte_100271048;
}

- (void)handleVoIPStateChangeConference:(int)a3 appId:(id)a4
{
  id v6;
  uint64_t v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleVoIPStateChangeConference state=%d appId=%@"), *(_QWORD *)&a3, a4);
  if (a3 == 8)
  {
    objc_msgSend((id)qword_100270ED8, "addObject:", a4);
    v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton");
    v7 = 1;
  }
  else
  {
    objc_msgSend((id)qword_100270ED8, "removeObject:", a4);
    if (objc_msgSend((id)qword_100270ED8, "count"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleVoIPStateChange skip rxVoIPAppNotification %@"), qword_100270ED8);
      return;
    }
    v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton");
    v7 = 0;
  }
  objc_msgSend(v6, "rxVoIPAppNotification:", v7);
}

- (int)getDeltaIPStats:(unint64_t *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6
{
  int v11;
  const char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v11 = objc_msgSend(+[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton"), "isWiFiPrimary");
  if (v11)
  {
    v12 = "en0";
  }
  else
  {
    v13 = objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "getInternetInterfaceName");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("getDeltaIPStats internetInterfaceName=%@"), v13);
    if (v13)
      v12 = (const char *)objc_msgSend(v13, "UTF8String");
    else
      v12 = "pdp_ip0";
  }
  -[WRM_BWEvalManager queryInterfaceStats:::::](self, "queryInterfaceStats:::::", v12, &v22, &v21, &v20, &v19);
  v14 = v22;
  *a3 = v22 - qword_100271050;
  v15 = v21;
  *a4 = v21 - qword_100271058;
  v16 = v20;
  *a5 = v20 - qword_100271060;
  v17 = v19;
  *a6 = v19 - qword_100271068;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("sPackets: %llu, rPackets: %llu, txBytes: %llu, rxBytes: %llu"), v14, v15, v16, v17);
  qword_100271050 = v22;
  qword_100271058 = v21;
  qword_100271060 = v20;
  qword_100271068 = v19;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Delta TX: %llu, RX: %llu, RX Bytes: %llu, TX Bytes: %llu"), *a3, *a4, *a6, *a5);
  return v11;
}

- (void)startPeriodicTask:(double)a3 :(id)a4
{
  _QWORD v4[8];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003171C;
  v4[3] = &unk_100201A88;
  *(double *)&v4[7] = a3;
  v4[5] = self;
  v4[6] = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), v4);
}

- (void)stopPeriodicTask
{
  if (qword_100270EE8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100270EE8);
    dispatch_release((dispatch_object_t)qword_100270EE8);
    qword_100270EE8 = 0;
  }
}

- (void)handleVoIPStateChange:(int)a3 appId:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleVoIPStateChange state= %d, appId=%@"), *(_QWORD *)&a3, a4);
  if (a3 == 8)
  {
    objc_msgSend((id)qword_100270ED8, "addObject:", a4);
    -[WRM_BWEvalManager getInitialIPStats](self, "getInitialIPStats");
    -[WRM_BWEvalManager startPeriodicTask::](self, "startPeriodicTask::", &stru_100201AC8, 5.0);
  }
  else
  {
    objc_msgSend((id)qword_100270ED8, "removeObject:", a4);
    if (objc_msgSend((id)qword_100270ED8, "count"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleVoIPStateChange skip rxVoIPAppNotification %@"), qword_100270ED8);
    }
    else
    {
      -[WRM_BWEvalManager stopPeriodicTask](self, "stopPeriodicTask");
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "rxVoIPAppNotification:", 0);
    }
  }
}

- (BOOL)isSmartDataModeEnabled
{
  return objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice");
}

- (void)handleUpdateStallMessage:(id)a3
{
  WRMMetricsiRATStreaming *mWrmiRATStreaming;
  NSObject *mProximityMsgQueue;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("iRAT Video BW Mgr: handleUpdateStallMessage, Stall detected"));
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->event = 2;
  mWrmiRATStreaming->numStall = 1;
  ++self->mStreamingTotalStallDetected;
  mProximityMsgQueue = self->mProximityMsgQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604CC;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mProximityMsgQueue, block);
}

- (void)handleGetMLPredictedThroughput:(id)a3
{
  xpc_object_t value;
  int64_t int64;
  int64_t v7;
  uint64_t v8;
  xpc_object_t reply;
  void *v10;
  _xpc_connection_s *remote_connection;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Called handleGetMLPredictedThroughput"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  int64 = xpc_dictionary_get_int64(value, "WRMMLPredictedThroughput_linkType");
  v7 = int64;
  if (int64 == -1)
  {
    if (objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getWiFiService"), "isWiFiPrimaryInterface"))
    {
      v8 = -[WRM_BWEvalManager getMLPredictedWiFiBW](self, "getMLPredictedWiFiBW");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputEstimation: primary interface: WiFi handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u"), -1, v8);
    }
    else
    {
      v8 = -[WRM_BWEvalManager getMLPredictedCellBW](self, "getMLPredictedCellBW");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputEstimation: primary interface: Cellular handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u"), -1, v8);
    }
  }
  else if (int64)
  {
    if (int64 == 1)
    {
      v8 = -[WRM_BWEvalManager getMLPredictedWiFiBW](self, "getMLPredictedWiFiBW");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputEstimation: handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u"), 1, v8);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = -[WRM_BWEvalManager getMLPredictedCellBW](self, "getMLPredictedCellBW");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputEstimation: handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u"), 0, v8);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u"), v7, v8);
  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v10 = reply;
    xpc_dictionary_set_uint64(reply, "WRMMLPredictedThroughput_CoreMedia", v8);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v10);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Sending response to handleGetMLPredictedThroughput message %@"), v10);
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Do not post handleGetMLPredictedThroughput reply is NULL"));
  }
}

- (void)handleGetStreamingMetrics:(id)a3
{
  xpc_object_t value;
  uint64_t mHarvestedLatency;
  _BOOL8 mStreamingSessionActive;
  BOOL v8;
  xpc_object_t reply;
  void *v10;
  _xpc_connection_s *remote_connection;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Called handleGetStreamingMetrics"));
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSymptomsService");
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_dictionary_get_uint64(value, "WRMGetStreamingMetrics_linkType");
  mHarvestedLatency = self->mHarvestedLatency;
  if (self->mStreamingSessionActive)
  {
    mStreamingSessionActive = 1;
    v8 = 1;
  }
  else
  {
    v8 = -[WRM_BWEvalManager isStreamingAppForeground](self, "isStreamingAppForeground");
    mStreamingSessionActive = self->mStreamingSessionActive;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("handleGetStreamingMetrics: session active: %d, BW: %d"), mStreamingSessionActive, self->mHarvestedBW);
  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v10 = reply;
    xpc_dictionary_set_BOOL(reply, "isValid", v8);
    xpc_dictionary_set_uint64(v10, "MaxBW", self->mHarvestedBW);
    xpc_dictionary_set_uint64(v10, "StallDetected", self->mStreamingStallDetected);
    xpc_dictionary_set_uint64(v10, "AvgRTT", mHarvestedLatency);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v10);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Sending response to handleGetStreamingMetrics message %@"), v10);
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Do not post handleGetStreamingMetrics reply is NULL"));
  }
}

- (void)handleQSHMetrics:(id)a3
{
  xpc_object_t reply;
  void *v5;
  _xpc_connection_s *remote_connection;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Called handleQSHMetrics"));
  xpc_dictionary_get_value(a3, "kMessageArgs");
  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v5 = reply;
    xpc_dictionary_set_uint64(reply, "totalCellularBW", dword_100270F70);
    xpc_dictionary_set_uint64(v5, "nrConfiguredBW", dword_100270F7C);
    xpc_dictionary_set_uint64(v5, "totalLayers", dword_100270F74);
    xpc_dictionary_set_uint64(v5, "nrLayers", dword_100270F80);
    xpc_dictionary_set_uint64(v5, "lteMaxScheduledLayers", dword_100270F80);
    xpc_dictionary_set_uint64(v5, "nrModulation", dword_100270F84);
    xpc_dictionary_set_uint64(v5, "totalCCs", dword_100270F6C);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v5);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Sending response to handleQSHMetrics message %@"), v5);
    xpc_release(v5);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Do not post handleQSHMetrics reply is NULL"));
  }
}

- (void)handleWiFiMetricsRequest:(id)a3
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
    v5 = off_100202D98[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s Message received from client %d(%s) "), "-[WRM_BWEvalManager(privateFunctions) handleWiFiMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060A70;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleCellularDataMetricsRequest:(id)a3
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
    v5 = off_100202D98[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s Message received from client %d(%s) "), "-[WRM_BWEvalManager(privateFunctions) handleCellularDataMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060E70;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleNrPhyMetricsRequest:(id)a3
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
    v5 = off_100202D98[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s Message received from client %d(%s) "), "-[WRM_BWEvalManager(privateFunctions) handleNrPhyMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061120;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  double v5;
  xpc_object_t value;
  uint64_t uint64;
  id v8;
  const char *v9;
  xpc_object_t v10;
  size_t count;
  size_t v12;
  size_t i;
  xpc_object_t v14;
  uint64_t v15;
  WRM_Mobility_Context *v16;
  WCM_WiFiController *mWiFi;
  WRM_BWEvalManager *v18;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("BW Link Eval Manager: handleLinkPrefSubscribe."));
  -[NSDate timeIntervalSinceNow](self->mCMStatusUpdateEvaluationTimer, "timeIntervalSinceNow");
  self->mTimeSinceCMStatusEvaluationStarted = v5;
  dword_100270F94 = 0;
  *(_QWORD *)&self->mDeviation = 0;
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  v8 = -[WRM_BWEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64);
  if ((uint64 - 1) >= 0x15)
  {
    v9 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if ((_DWORD)uint64 == 22)
      v9 = "ClientCoreMediaStreaming";
  }
  else
  {
    v9 = off_100202D98[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Message received from client %d(%s) "), uint64, v9);
  v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  count = xpc_array_get_count(v10);
  if (count)
  {
    v12 = count;
    v18 = self;
    objc_msgSend(v8, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Removing all contexts from iRAT client."));
    for (i = 0; i != v12; ++i)
    {
      v14 = xpc_array_get_value(v10, i);
      v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: Record#= %d Application Type=%llu"), "-[WRM_BWEvalManager(privateFunctions) handleLinkPrefSubscribe:]", i, v15);
      v16 = objc_alloc_init(WRM_Mobility_Context);
      -[WRM_Mobility_Context setApplicationType:](v16, "setApplicationType:", v15);
      -[WRM_Mobility_Context activateMobilityContext:](v16, "activateMobilityContext:", 1);
      objc_msgSend(v8, "addMobilityContextToList:", v16);

    }
  }
  else
  {
    if (!-[WRM_BWEvalManager doesIRATClientSubscriptionContextExist](self, "doesIRATClientSubscriptionContextExist"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Ignoring un-subscribe message from a client for which subscription does not exist"));
      return;
    }
    v18 = self;
    objc_msgSend(v8, "removeAllMobilityContextsFromList");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Removing all contexts from iRAT client."));
  }
  -[WRM_BWEvalManager evaluateWiFiLink](v18, "evaluateWiFiLink");
  mWiFi = v18->mWiFi;
  if (mWiFi)
  {
    if ((objc_opt_respondsToSelector(mWiFi, "toggleWiFiLQMIfNeeded:") & 1) != 0)
      -[WCM_WiFiController toggleWiFiLQMIfNeeded:](v18->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_BWEvalManager needWiFiLQM](v18, "needWiFiLQM"));
  }
}

- (BOOL)isCoreMediaStreamingActive
{
  return self->mStreamingConnectionReferenceCount != 0;
}

- (void)evaluateSDMBWChangeNotification:(unint64_t)a3
{
  float mMovAVGAchievedBW;
  int v6;

  if (!-[WCM_WiFiService isWiFiPrimaryInterface](-[WCM_WiFiController wifiService](self->mWiFi, "wifiService"), "isWiFiPrimaryInterface"))
  {
    mMovAVGAchievedBW = self->mMovAVGAchievedBW;
    if (mMovAVGAchievedBW >= 15000.0)
    {
      v6 = 1;
    }
    else
    {
      if (mMovAVGAchievedBW > 6500.0)
      {
LABEL_9:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: SDM actul: %d, WghtAVG BW: %f"), "-[WRM_BWEvalManager(privateFunctions) evaluateSDMBWChangeNotification:]", a3, mMovAVGAchievedBW);
        return;
      }
      v6 = 2;
    }
    if (v6 != dword_100270F68 && self->mStreamingConnectionReferenceCount)
    {
      dword_100270F68 = v6;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("%s: SDM recommendation changed, actul: %d, WghtAVG BW: %f"), "-[WRM_BWEvalManager(privateFunctions) evaluateSDMBWChangeNotification:]", a3, mMovAVGAchievedBW);
      -[WRM_BWEvalManager notifyStreamingState::](self, "notifyStreamingState::", 0, self->mMovAVGAchievedBW);
      return;
    }
    goto LABEL_9;
  }
}

- (void)evaluateCellularBandwidth:(id *)a3
{
  unint64_t mAchievedCellBW;

  mAchievedCellBW = self->mAchievedCellBW;
  if (mAchievedCellBW > self->mAchievedMaxCellBW)
  {
    self->mAchievedMaxCellBW = mAchievedCellBW;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("evaluateCellularBandwidth mAchievedMaxCellBW=%llu"), mAchievedCellBW);
  }
  a3->var4 = 0;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value;
  int64_t int64;
  int64_t v6;
  WCM_WiFiController *mWiFi;
  WCM_WiFiService *v8;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WRM IDS Link Eval Manager received WiFi link state change event"));
  self->mAchievedMaxWiFiBW = 0;
  self->mAchievedBW = 0;
  self->mEvalMovAvgWiFiBW = 0;
  self->mPrevEstMaxWiFiBW = 0;
  self->mStreamingSessionActive = 0;
  *(_QWORD *)&self->mScallingFactor = 1065353216;
  self->mMovingAvgDeviation = 0.0;
  if (value)
  {
    if (xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("IDS Link Eval Manager:Link down event received"));
    }
    else
    {
      int64 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      v6 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("IMG BW Eval Mgr :Linkup event received"));
      mWiFi = self->mWiFi;
      if (mWiFi)
      {
        v8 = -[WCM_WiFiController wifiService](mWiFi, "wifiService");
        -[WCM_WiFiService setRSSI:](v8, "setRSSI:", int64);
        -[WCM_WiFiService setSNR:](v8, "setSNR:", v6);
        -[WCM_WiFiService resetWiFiBWEstimationState](v8, "resetWiFiBWEstimationState");
      }
    }
    -[WRM_BWEvalManager evaluateWiFiLink](self, "evaluateWiFiLink");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("IMG BW Eval Manager:Empty message received"));
  }
}

- (void)addiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[NSMutableArray addObject:](self->miRATClientContexts, "addObject:", a3);
  -[WRM_BWEvalManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  NSMutableArray *miRATClientContexts;

  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  -[WRM_BWEvalManager existingContexts](self, "existingContexts");
  -[NSMutableArray removeObject:](self->miRATClientContexts, "removeObject:", a3);
  -[WRM_BWEvalManager existingContexts](self, "existingContexts");
  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3;
  NSMutableArray *miRATClientContexts;
  id v6;
  WCM_WiFiController *mWiFi;

  v3 = *(_QWORD *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  v6 = -[WRM_BWEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", v3);
  if (v6)
    -[WRM_BWEvalManager removeiRatClient:](self, "removeiRatClient:", v6);
  objc_sync_exit(miRATClientContexts);
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    if ((objc_opt_respondsToSelector(mWiFi, "toggleWiFiLQMIfNeeded:") & 1) != 0)
      -[WCM_WiFiController toggleWiFiLQMIfNeeded:](self->mWiFi, "toggleWiFiLQMIfNeeded:", -[WRM_BWEvalManager needWiFiLQM](self, "needWiFiLQM"));
  }
}

- (void)existingContexts
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("handleIMGVideoClientRegisterd: Number of active iRAT clients: %lu"), -[NSMutableArray count](self->miRATClientContexts, "count"));
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if (-[WRM_BWEvalManager enableiRATManager](self, "enableiRATManager"))
  {
    if (a3 == 1)
    {
      -[WRM_BWEvalManager handleWiFiRegistered](self, "handleWiFiRegistered");
    }
    else if (a3 == 20 || a3 == 13)
    {
      -[WRM_BWEvalManager handleIMGVideoClientRegisterd](self, "handleIMGVideoClientRegisterd");
    }
  }
}

- (void)handleIMGVideoClientRegisterd
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("BW Eval registration status changed."));
}

- (void)handleWiFiRegistered
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFi registration status changed."));
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi did not register, can't get state"));
    -[WRM_BWEvalManager evaluateWiFiLink](self, "evaluateWiFiLink");
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "WRM_BWEvalManagerSingleton", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Video BW  Manager: Inside Copy with Zone "));
  return self;
}

- (unint64_t)retainCount
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Video BW Manager: retain count:%lu "), -1);
  return -1;
}

- (WRM_BWEvalManager)autorelease
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Video BW Manager: auto release "));
  return self;
}

- (WRM_BWEvalManager)init
{
  WRM_BWEvalManager *v2;
  WRM_MetricsService *mMetrics;
  WRMMetricsiRATStreaming *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WRM_BWEvalManager;
  v2 = -[WRM_BWEvalManager init](&v6, "init");
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue");
    v2->mProximityMsgQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.BWMgrProximity", 0);
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("IMG Video BW Manager initialized"));
    v2->mPrevEstMaxWiFiBW = 0;
    v2->mAchievedMaxCellBW = 0;
    v2->mAchievedMaxWiFiBW = 0;
    v2->mWiFi = 0;
    v2->mDataSent = 0;
    v2->mDuration = 0;
    v2->mContainsDataSentFlag = 0;
    mMetrics = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
    v2->mMetrics = mMetrics;
    if (mMetrics)
    {
      -[WRM_MetricsService initStreamingMetrics](mMetrics, "initStreamingMetrics");
      mMetrics = v2->mMetrics;
    }
    v4 = -[WRM_MetricsService getWRMStreaming](mMetrics, "getWRMStreaming");
    v2->mWrmiRATStreaming = v4;
    v4->coldStartTypeCellular = 0;
    v2->mStreamingSessionActive = 0;
    v2->mEvalMovAvgWiFiBW = 0;
    *(_OWORD *)&v2->mAchievedBW = 0u;
    *(_OWORD *)&v2->mAchievedPreviousWiFiBW = 0u;
    *(_OWORD *)&v2->mAchievedWiFiBW = 0u;
    v2->mMovAVGAchievedBW = 0.0;
    v2->mScallingFactor = 1.0;
    v2->mStreamingTotalStallDetected = 0;
    v2->mStreamingTotalStallDuration = 0;
    v2->mStreamingStallDetected = 0;
    v2->mStreamingFatalErrorDetected = 0;
    v2->mCMStatusUpdateEvaluationTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->mTimeSinceCMStatusEvaluationStarted = 0.0;
    -[WRM_BWEvalManager subscribeForDeviceLockStateInfo](v2, "subscribeForDeviceLockStateInfo");
    -[WRM_BWEvalManager subscribeForScreenStateInfo](v2, "subscribeForScreenStateInfo");
    -[WRM_BWEvalManager subscribeAppStateChangeEvent](v2, "subscribeAppStateChangeEvent");
    -[WRM_BWEvalManager createMLModel](v2, "createMLModel");
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *miRATClientContexts;
  NSObject *mProximityMsgQueue;
  NSDate *mCMStatusUpdateEvaluationTimer;
  MLModel *iratWiFiModel;
  MLModel *iratCellularModel;
  objc_super v8;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Handover Manager: Dealloc called for Video BW manager "));
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts)

  mProximityMsgQueue = self->mProximityMsgQueue;
  if (mProximityMsgQueue)
    dispatch_release(mProximityMsgQueue);
  mCMStatusUpdateEvaluationTimer = self->mCMStatusUpdateEvaluationTimer;
  self->mWiFi = 0;
  if (mCMStatusUpdateEvaluationTimer)
  {

    self->mCMStatusUpdateEvaluationTimer = 0;
    self->mTimeSinceCMStatusEvaluationStarted = 0.0;
  }
  iratWiFiModel = self->iratWiFiModel;
  if (iratWiFiModel)
  {

    self->iratWiFiModel = 0;
  }
  iratCellularModel = self->iratCellularModel;
  if (iratCellularModel)
  {

    self->iratCellularModel = 0;
  }
  -[WRM_BWEvalManager unSubscribeForDeviceLockStateInfo](self, "unSubscribeForDeviceLockStateInfo");
  -[WRM_BWEvalManager unSubscribeForScreenStateInfo](self, "unSubscribeForScreenStateInfo");
  -[WRM_BWEvalManager unSubscribeAppStateChangeEvent](self, "unSubscribeAppStateChangeEvent");
  v8.receiver = self;
  v8.super_class = (Class)WRM_BWEvalManager;
  -[WRM_BWEvalManager dealloc](&v8, "dealloc");
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
  block[2] = sub_100061F04;
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

- (void)createMLModel
{
  MLModel *v3;
  MLModel *v4;
  MLModel *v5;
  MLModel *v6;
  uint64_t v7;

  v7 = 0;
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    if (self->iratWiFiModel)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: createMLModel, iratWiFiModel already created"));
    }
    else
    {
      v3 = (MLModel *)objc_msgSend((id)sub_100062414(), "modelWithContentsOfURL:error:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/iRATBW.mlmodelc")), &v7);
      self->iratWiFiModel = v3;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: init DEBUG ptr : %p "), v3);
      if (v7)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("WiFiThroughputPrediction: No iratWiFiModel present %@"), v7);
      v4 = self->iratWiFiModel;
    }
    if (self->iratCellularModel)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: createMLModel, iratCellularModel already created"));
    }
    else
    {
      v5 = (MLModel *)objc_msgSend((id)sub_100062414(), "modelWithContentsOfURL:error:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/CellularThroughputPrediction.mlmodelc")), &v7);
      self->iratCellularModel = v5;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: init DEBUG ptr : %p "), v5);
      if (v7)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: No iratCellularModel present %@"), v7);
      v6 = self->iratCellularModel;
    }
  }
}

- (unsigned)getMLPredictedCellBW
{
  uint64_t v3;
  uint64_t v5;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: getMLPredictedCellBW maxActualBW before calling ML Prediction: %llu"), self->mAchievedMaxCellBW, 0);
  v3 = -[WRM_BWEvalManager getPredictedCellBW:backhaul:](self, "getPredictedCellBW:backhaul:", &v5, (double)self->mAchievedMaxCellBW);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: getMLPredictedCellBW: %d"), v3);
  return v3;
}

- (unsigned)getPredictedCellBW:(double *)a3 backhaul:(double)a4
{
  id v7;
  unsigned int v8;
  id v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  unsigned int v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSDictionary *v50;
  id v51;
  id v52;
  const __CFString *v53;
  double v55;
  double v56;
  unint64_t v57;
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  id v77;
  _QWORD v78[15];
  _QWORD v79[15];
  _QWORD v80[59];
  _QWORD v81[59];

  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    objc_msgSend(v7, "setActiveSlot:", objc_msgSend(v7, "getUserDataPreferredSlot"));
    v8 = objc_msgSend(v7, "getCTDataIndictor");
  }
  else
  {
    v7 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
    v8 = 0;
  }
  v9 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSCService");
  v77 = 0;
  if (!self->iratCellularModel)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: iratCellularModel is nil"));
    return 0;
  }
  v11 = v9;
  v70 = a4;
  LODWORD(v10) = dword_100270F6C;
  v12 = (double)v10;
  LODWORD(v10) = dword_100270F70;
  v13 = (double)v10;
  LODWORD(v10) = dword_100270F74;
  v14 = (double)v10;
  LODWORD(v10) = dword_100270F78;
  v15 = (double)v10;
  LODWORD(v10) = dword_100270F7C;
  v16 = (double)v10;
  LODWORD(v10) = dword_100270F80;
  v17 = (double)v10;
  LODWORD(v10) = dword_100270F84;
  v18 = (double)v10;
  v75 = v13;
  v76 = v12;
  v74 = v14;
  if (objc_msgSend(v7, "getServingCellType") == 1)
  {
    v69 = v15;
    objc_msgSend(v7, "getServingCellRSRP");
    v73 = v19;
    objc_msgSend(v7, "getServingCellSNR");
    v72 = v20;
    objc_msgSend(v7, "getServingCellRSRQ");
    v21 = 0;
    v22 = 0.0;
    v24 = v23;
    if (v8 <= 0x12 && ((1 << v8) & 0x70100) != 0)
    {
      objc_msgSend(v7, "getNrRSRP");
      v63 = v25;
      objc_msgSend(v7, "getNrSNR");
      v64 = v26;
      objc_msgSend(v7, "getNrRSRQ");
      v62 = v27;
      v21 = objc_msgSend(v7, "isDeviceUsingFR2Radio") ^ 1;
      v28 = 1.0;
      v60 = v17;
      v61 = v16;
      v59 = v18;
      goto LABEL_18;
    }
    v62 = 0.0;
    v63 = 0.0;
    v64 = 0.0;
    v28 = 0.0;
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "getServingCellType") == 2)
  {
    objc_msgSend(v7, "getServingCellRSCP");
    v73 = v29;
    objc_msgSend(v7, "getServingCellECIO");
    v72 = v30;
    v21 = 0;
    v62 = 0.0;
    v63 = 0.0;
    v22 = -1.0;
    v64 = 0.0;
    v24 = 0.0;
    v28 = 0.0;
    v69 = 0.0;
LABEL_17:
    v60 = 0.0;
    v61 = 0.0;
    v59 = 0.0;
    goto LABEL_18;
  }
  v60 = v17;
  v61 = v16;
  v59 = v18;
  if (objc_msgSend(v7, "getServingCellType") == 9)
  {
    objc_msgSend(v7, "getNrRSRP");
    v63 = v31;
    objc_msgSend(v7, "getNrSNR");
    v64 = v32;
    objc_msgSend(v7, "getNrRSRQ");
    v62 = v33;
    v21 = 0;
    v22 = 1.0;
    v72 = 0.0;
    v73 = 0.0;
    v28 = 0.0;
    v69 = 0.0;
  }
  else
  {
    v21 = 0;
    v34 = v15;
    v22 = -1.0;
    v72 = 0.0;
    v73 = 0.0;
    v62 = 0.0;
    v63 = 0.0;
    v64 = 0.0;
    v28 = 0.0;
    v69 = v34;
  }
  v24 = 0.0;
LABEL_18:
  v35 = v22 == 0.0;
  v36 = 1.0;
  if (v28 == 1.0)
    v37 = v21;
  else
    v37 = 0;
  v38 = v21 ^ 1;
  if (v28 != 1.0)
    v38 = 0;
  v39 = v28;
  v68 = v28;
  if ((v35 & v38) == 0)
    v36 = 2.0;
  if ((v35 & v37) != 0)
    v40 = 0.0;
  else
    v40 = v36;
  v41 = (double)(int)objc_msgSend(v11, "getCellularDataLQM", v36);
  objc_msgSend(v7, "getMeasureBWDataSlot");
  v42 = (double)(int)objc_msgSend(v7, "getBandWidthDataSlot");
  objc_msgSend(v7, "getMeasureBWDataSlot");
  v44 = v43 / 1000.0;
  v65 = v43 / 1000.0;
  v45 = v70 / 1000.0;
  if (v70 == 0.0)
    v45 = 56.0;
  v71 = v45;
  v46 = (double)self->mAchievedPreviousCellBW / 1000.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: Start ML recommendation for Cellular BW estimation"));
  v80[0] = &off_10022F7A8;
  v80[1] = &off_10022F7D8;
  v81[0] = &off_10022F7C0;
  v81[1] = &off_10022F7C0;
  v80[2] = &off_10022F7F0;
  v80[3] = &off_10022F808;
  v81[2] = &off_10022F7C0;
  v81[3] = &off_10022F7C0;
  v80[4] = &off_10022F820;
  v80[5] = &off_10022F838;
  v81[4] = &off_10022F7C0;
  v81[5] = &off_10022F7C0;
  v80[6] = &off_10022F850;
  v80[7] = &off_10022F868;
  v81[6] = &off_10022F7C0;
  v81[7] = &off_10022F7C0;
  v80[8] = &off_10022F880;
  v80[9] = &off_10022F898;
  v81[8] = &off_10022F7C0;
  v81[9] = &off_10022F7C0;
  v80[10] = &off_10022F8B0;
  v80[11] = &off_10022F8C8;
  v81[10] = &off_10022F7C0;
  v81[11] = &off_10022F7C0;
  v80[12] = &off_10022F8E0;
  v80[13] = &off_10022F8F8;
  v81[12] = &off_10022F7C0;
  v81[13] = &off_10022F7C0;
  v80[14] = &off_10022F910;
  v80[15] = &off_10022F928;
  v81[14] = &off_10022F7C0;
  v81[15] = &off_10022F7C0;
  v80[16] = &off_10022F940;
  v80[17] = &off_10022F7C0;
  v81[16] = &off_10022F910;
  v81[17] = &off_10022F910;
  v80[18] = &off_10022F958;
  v80[19] = &off_10022F970;
  v81[18] = &off_10022F910;
  v81[19] = &off_10022F910;
  v80[20] = &off_10022F988;
  v80[21] = &off_10022F9A0;
  v81[20] = &off_10022F910;
  v81[21] = &off_10022F910;
  v80[22] = &off_10022F9B8;
  v80[23] = &off_10022F9D0;
  v81[22] = &off_10022F910;
  v81[23] = &off_10022F910;
  v80[24] = &off_10022F9E8;
  v80[25] = &off_10022FA00;
  v81[24] = &off_10022F910;
  v81[25] = &off_10022F910;
  v80[26] = &off_10022FA18;
  v80[27] = &off_10022FA30;
  v81[26] = &off_10022F910;
  v81[27] = &off_10022F910;
  v80[28] = &off_10022FA48;
  v80[29] = &off_10022FA60;
  v81[28] = &off_10022F910;
  v81[29] = &off_10022F910;
  v80[30] = &off_10022FA78;
  v80[31] = &off_10022FA90;
  v81[30] = &off_10022F910;
  v81[31] = &off_10022F910;
  v80[32] = &off_10022FAA8;
  v80[33] = &off_10022FAC0;
  v81[32] = &off_10022F910;
  v81[33] = &off_10022F910;
  v80[34] = &off_10022FAD8;
  v80[35] = &off_10022FAF0;
  v81[34] = &off_10022F910;
  v81[35] = &off_10022F910;
  v80[36] = &off_10022FB08;
  v80[37] = &off_10022FB20;
  v81[36] = &off_10022F910;
  v81[37] = &off_10022FB38;
  v80[38] = &off_10022FB50;
  v80[39] = &off_10022FB68;
  v81[38] = &off_10022FB38;
  v81[39] = &off_10022FB38;
  v80[40] = &off_10022FB80;
  v80[41] = &off_10022FB98;
  v81[40] = &off_10022FB38;
  v81[41] = &off_10022FB38;
  v80[42] = &off_10022FBB0;
  v80[43] = &off_10022FBC8;
  v81[42] = &off_10022FB38;
  v81[43] = &off_10022FB38;
  v80[44] = &off_10022FBE0;
  v80[45] = &off_10022FBF8;
  v81[44] = &off_10022FB38;
  v81[45] = &off_10022FB38;
  v80[46] = &off_10022FC10;
  v80[47] = &off_10022FC28;
  v81[46] = &off_10022FB38;
  v81[47] = &off_10022FB38;
  v80[48] = &off_10022FC40;
  v80[49] = &off_10022FC58;
  v81[48] = &off_10022FB38;
  v81[49] = &off_10022FB38;
  v80[50] = &off_10022FC70;
  v80[51] = &off_10022FC88;
  v81[50] = &off_10022FB38;
  v81[51] = &off_10022FB38;
  v80[52] = &off_10022FCA0;
  v80[53] = &off_10022FCB8;
  v81[52] = &off_10022FB38;
  v81[53] = &off_10022FB38;
  v80[54] = &off_10022FCD0;
  v80[55] = &off_10022FCE8;
  v81[54] = &off_10022FB38;
  v81[55] = &off_10022FB38;
  v80[56] = &off_10022FD00;
  v80[57] = &off_10022FD18;
  v81[56] = &off_10022FB38;
  v81[57] = &off_10022FB38;
  v80[58] = &off_10022FD30;
  v81[58] = &off_10022FB38;
  v47 = (double)(int)objc_msgSend(-[NSDictionary objectForKey:](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 59), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "getBandInfoDataSlot"))), "intValue");
  v66 = v46;
  v67 = v47;
  v48 = v46;
  if (v46 == 0.0)
    v49 = v71;
  else
    v49 = 0.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction CellRSRP: %f, CellSnr: %f, lqmScorecellular: %f, ratType: %f, isFR1: %d, Backhaul: %f, pActualLowBandwidth: %f, cellNrRSRP: %f, cellNrRSRQ: %f, cellNrSNR: %f, cellLteRSRQ: %f, cellEstimatedBW: %f, cellChannelBW: %f, cellNsaEnabled: %f, cellBandInfo: %f, NRType: %f"), *(_QWORD *)&v73, *(_QWORD *)&v72, *(_QWORD *)&v41, *(_QWORD *)&v22, v21, *(_QWORD *)&v49, *(_QWORD *)&v48, *(_QWORD *)&v63, *(_QWORD *)&v62, *(_QWORD *)&v64, *(_QWORD *)&v24, *(_QWORD *)&v44, *(_QWORD *)&v42, *(_QWORD *)&v39, *(_QWORD *)&v47,
    *(_QWORD *)&v40);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction QSH Metrics num_ccs: %f, total_configured_bw: %f, total_configured_mimo_layers: %f, lte_max_scheduled_mimo_layers_in_a_cell: %f, nr_configured_bw: %f, nr_total_scheduled_mimo_layers: %f, nr_max_dl_modulation: %f"), *(_QWORD *)&v76, *(_QWORD *)&v75, *(_QWORD *)&v74, *(_QWORD *)&v69, *(_QWORD *)&v61, *(_QWORD *)&v60, *(_QWORD *)&v59);
  v78[0] = CFSTR("cellSinr");
  v79[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v72);
  v78[1] = CFSTR("cellNrRSRQ");
  v79[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v62);
  v78[2] = CFSTR("cellLteRSRQ");
  v79[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24);
  v78[3] = CFSTR("cellNrRSRP");
  v79[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v63);
  v78[4] = CFSTR("maxOfActualLowBandwidth_d");
  v79[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v49);
  v78[5] = CFSTR("lqmScorecellular");
  v79[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v41);
  v78[6] = CFSTR("cellChannelBW");
  v79[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v42);
  v78[7] = CFSTR("cellNrSNR");
  v79[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v64);
  v78[8] = CFSTR("cellRsrp");
  v79[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v73);
  v78[9] = CFSTR("cellEstimatedBW");
  v79[9] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v65);
  v78[10] = CFSTR("pActualLowBandwidth");
  v79[10] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v66);
  v78[11] = CFSTR("cellBandInfo");
  v79[11] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v67);
  v78[12] = CFSTR("cellNsaEnabled");
  v79[12] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v68);
  v78[13] = CFSTR("NRType");
  v79[13] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40);
  v78[14] = CFSTR("ratType");
  v79[14] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22);
  v50 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 15);
  v51 = objc_msgSend(objc_alloc((Class)sub_1000186A0()), "initWithDictionary:error:", v50, &v77);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: Calling predictionFromFeatures, input:%@"), -[NSDictionary description](v50, "description"));
  v52 = -[MLModel predictionFromFeatures:error:](self->iratCellularModel, "predictionFromFeatures:error:", v51, &v77);
  if (v77)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: Ran into an error while predicting"));
    v58 = objc_msgSend(v77, "localizedDescription");
    v53 = CFSTR("CellularThroughputPrediction: Failed prediction: %@");
LABEL_35:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v53, v58);

    return 0;
  }
  if (!v52)
  {
    v53 = CFSTR("CellularThroughputPrediction: prediction reutrned invalid output");
    goto LABEL_35;
  }
  objc_msgSend(objc_msgSend(v52, "featureValueForName:", CFSTR("actualLowBandwidth_d")), "doubleValue");
  v56 = v55;
  self->mWrmiRATStreaming->mlPredictedCellBW = v55;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: Completete ML recommendation for BW Estimation, Model Output: %f, Predicted Value: %f"), *(_QWORD *)&v55, (float)v55);
  LODWORD(v57) = self->mWrmiRATStreaming->mlPredictedCellBW;
  *a3 = (double)v57;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("CellularThroughputPrediction: getPredictedCellBW ML Model: %f"), *(_QWORD *)&v56);
  return (v56 * 1000.0);
}

- (BOOL)isConnectedLinkStreamingQualityGood
{
  return 1;
}

- (BOOL)isCellStreamingExitCriteriaMet
{
  return 1;
}

- (void)updateDLBWEstimation:(unsigned int)a3 :(unsigned int)a4
{
  WRMMetricsiRATStreaming *mWrmiRATStreaming;

  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->cellEstimatedBW = a3;
  mWrmiRATStreaming->cellEstimatedBWConf = a4;
}

- (void)updateNRQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5
{
  dword_100270F7C = a3;
  dword_100270F80 = a4;
  dword_100270F84 = a5;
}

- (id)getSpeedTestMetrics
{
  id v2;
  id v3;
  id v4;
  id v5;
  double v6;
  _QWORD v8[18];
  _QWORD v9[18];

  v2 = +[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton");
  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getWiFiService");
  v4 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSymptomsService");
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    v5 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    objc_msgSend(v5, "setActiveSlot:", objc_msgSend(v5, "getUserDataPreferredSlot"));
    objc_msgSend(v5, "getCTDataIndictor");
  }
  else
  {
    v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
  }
  v8[0] = CFSTR("wghtRSSI");
  v9[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "getWghtAverageRSSI"));
  v8[1] = CFSTR("wghtSNR");
  v9[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "getWghtAverageSNR"));
  v8[2] = CFSTR("wghtPhyRate");
  v9[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "getWghtAverageRXPhyRate"));
  v8[3] = CFSTR("tcpRTT");
  objc_msgSend(v4, "getTCPMinRTT");
  v9[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6 * 1000.0);
  v8[4] = CFSTR("chType");
  v9[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "getChannelType"));
  v8[5] = CFSTR("isCaptive");
  v9[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isWiFiNetworkCaptive"));
  v8[6] = CFSTR("cellularDataLQM");
  v9[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v2, "getCellularDataLQM"));
  v8[7] = CFSTR("CCA");
  v9[7] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getCCA"));
  v8[8] = CFSTR("nrRSRP");
  objc_msgSend(v5, "getNrRSRP");
  v9[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[9] = CFSTR("nrRSRQ");
  objc_msgSend(v5, "getNrRSRQ");
  v9[9] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[10] = CFSTR("nrSNR");
  objc_msgSend(v5, "getNrSNR");
  v9[10] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[11] = CFSTR("totalCellularBW");
  v9[11] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F70);
  v8[12] = CFSTR("nrConfiguredBW");
  v9[12] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F7C);
  v8[13] = CFSTR("totalLayers");
  v9[13] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F74);
  v8[14] = CFSTR("nrLayers");
  v9[14] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F80);
  v8[15] = CFSTR("lteMaxScheduledLayers");
  v9[15] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F78);
  v8[16] = CFSTR("nrModulation");
  v9[16] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F84);
  v8[17] = CFSTR("totalCCs");
  v9[17] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_100270F6C);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 18);
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  objc_msgSend(objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", *(_QWORD *)&a3), "sendMessage:", a4);
}

- (void)subscribeForDeviceLockStateInfo
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100074D30, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unSubscribeForDeviceLockStateInfo
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
}

- (void)subscribeForScreenStateInfo
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100074E74;
  handler[3] = &unk_100201FD0;
  handler[4] = self;
  notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &dword_100270FAC, (dispatch_queue_t)&_dispatch_main_q, handler);
  -[WRM_BWEvalManager notifyScreenStatePassCodeNotEnabled:](self, "notifyScreenStatePassCodeNotEnabled:", dword_100270FAC);
}

- (void)unSubscribeForScreenStateInfo
{
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
}

- (void)notifyScreenStatePassCodeNotEnabled:(int)a3
{
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t state64;

  state64 = 0;
  v4 = MKBGetDeviceLockState(0);
  notify_get_state(a3, &state64);
  v5 = state64;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Rx screen state change event NotDark:%d, keybagLockState: %d"), state64 == 0, v4);
  if (v4 == 3)
  {
    v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton");
    if (v5)
      v7 = 1;
    else
      v7 = 2;
    objc_msgSend(v6, "postBBNotification::", v7, 0);
  }
}

@end
