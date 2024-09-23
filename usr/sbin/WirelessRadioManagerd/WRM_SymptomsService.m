@implementation WRM_SymptomsService

- (double)getAgeOfMetricDictionary:(id)a3
{
  double v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  double v9;

  v3 = 0.0;
  if (a3)
  {
    if (objc_msgSend(a3, "count"))
    {
      v5 = objc_msgSend(a3, "allValues");
      if (objc_msgSend(v5, "count"))
      {
        v6 = objc_msgSend(v5, "objectAtIndex:", 0);
        if (v6)
        {
          v7 = v6;
          if (objc_msgSend(v6, "count"))
          {
            v8 = objc_msgSend(objc_msgSend(v7, "allValues"), "objectAtIndex:", 0);
            objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", kPerformanceNetAttachSinceTime), "timeIntervalSinceNow");
            return -v9;
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)updateAllNetworkSymptoms:(int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  const __CFString *v8;
  uint64_t v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  -[NSDate timeIntervalSinceNow](self->mSFQueryTimer, "timeIntervalSinceNow");
  v6 = v5;
  v7 = self->mPrevTimeSinceSFQueryStarted - v5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT:Rate limiting SF Delta Time %lf"), *(_QWORD *)&v7);
  if (v7 < 120.0)
  {
    v8 = CFSTR("Enforce rate limiting, do not query SF");
    v9 = 18;
    goto LABEL_7;
  }
  self->mPrevTimeSinceSFQueryStarted = v6;
  if ((_DWORD)v3 != 1)
  {
    if (!(_DWORD)v3)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("updateAllNetworkSymptoms: BEGIN. Advice query:answer %llu:%llu FullScore query:answer %llu:%llu."), self->mAdviceQueried, self->mAdviceAnswered, self->mFullScoreQueried, self->mFullScoreAnswered);
      -[WRM_SymptomsService getNetworkUsageAdviceFromSF:](self, "getNetworkUsageAdviceFromSF:", 0);
      -[WRM_SymptomsService getNetworkFullScoreFromSF:](self, "getNetworkFullScoreFromSF:", 0);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("updateAllNetworkSymptoms: END. Advice query:answer %llu:%llu FullScore query:answer %llu:%llu."), self->mAdviceQueried, self->mAdviceAnswered, self->mFullScoreQueried, self->mFullScoreAnswered);
      return v7 >= 120.0;
    }
    v11 = "-[WRM_SymptomsService updateAllNetworkSymptoms:]";
    v12 = v3;
    v8 = CFSTR("iRAT: %s. Unknown network type %d.");
    v9 = 16;
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v9, v8, v11, v12, v13, v14);
  }
  return v7 >= 120.0;
}

- (BOOL)isConnectedLinkGood:(BOOL)a3
{
  _BOOL8 mSIPTimeOutOverWiFiDetected;
  _BOOL4 mWiFiIPsecTunnelDisconnected;
  _BOOL4 v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("isConnectedLinkGood called"));
  mSIPTimeOutOverWiFiDetected = self->mSIPTimeOutOverWiFiDetected;
  mWiFiIPsecTunnelDisconnected = self->mWiFiIPsecTunnelDisconnected;
  if (self->mSIPTimeOutOverWiFiDetected)
  {
    v6 = self->mWiFiIPsecTunnelDisconnected;
LABEL_4:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("SIP TMO: %d, DPD failure: %d"), mSIPTimeOutOverWiFiDetected, v6);
    v6 = 0;
    goto LABEL_5;
  }
  v6 = 1;
  if (mWiFiIPsecTunnelDisconnected)
    goto LABEL_4;
LABEL_5:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("isConnectedLinkGood status %d"), v6);
  return v6;
}

- (double)getWifiNetMetricCurrInstant:(int)a3
{
  double result;

  -[WRM_SymptomsService getMetricFromDictionary::](self, "getMetricFromDictionary::", self->mWifiInstantCurrent, *(_QWORD *)&a3);
  return result;
}

- (double)getMetricFromDictionary:(id)a3 :(int)a4
{
  double v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  double v15;
  double v16;
  _QWORD *v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  double v22;
  _QWORD *v23;
  double result;

  v4 = -1.0;
  if (!a3)
    return v4;
  if (!objc_msgSend(a3, "count"))
    return v4;
  v7 = objc_msgSend(objc_msgSend(a3, "allValues"), "objectAtIndex:", 0);
  if (!v7)
    return v4;
  v8 = v7;
  if (!objc_msgSend(v7, "count"))
    return v4;
  v9 = objc_msgSend(objc_msgSend(v8, "allValues"), "objectAtIndex:", 0);
  v10 = v9;
  switch(a4)
  {
    case 1:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachConnSuccesses), "doubleValue");
      v12 = v11;
      objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", kPerformanceNetAttachConnAttempts), "doubleValue");
      return 1.0 - v12 / (v13 + 0.000001);
    case 2:
      v14 = &kPerformanceNetAttachFaultyStay;
      goto LABEL_9;
    case 3:
      v14 = &kPerformanceNetAttachLowQualyStay;
LABEL_9:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", *v14), "doubleValue");
      v16 = v15;
      v17 = &kPerformanceNetAttachOverallStay;
      goto LABEL_12;
    case 4:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachReTxBytes), "doubleValue");
      v16 = v18;
      v17 = &kPerformanceNetAttachBytesOut;
      goto LABEL_12;
    case 5:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachRxDupeBytes), "doubleValue");
      v16 = v19;
      v17 = &kPerformanceNetAttachBytesIn;
LABEL_12:
      objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", *v17), "doubleValue");
      return v16 / (v20 + 0.000001);
    case 6:
      v21 = &kPerformanceNetAttachRttMin;
      goto LABEL_16;
    case 7:
      v21 = &kPerformanceNetAttachRttAvg;
      goto LABEL_16;
    case 8:
      v21 = &kPerformanceNetAttachRttVar;
LABEL_16:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", *v21), "doubleValue");
      v4 = v22;
      if (v22 == 1.79769313e308)
        return 9999.0;
      return v4;
    case 9:
      v23 = &kPerformanceNetAttachConnAttempts;
      goto LABEL_24;
    case 10:
      v23 = &kPerformanceNetAttachConnSuccesses;
      goto LABEL_24;
    case 11:
      v23 = &kPerformanceNetAttachPacketsIn;
      goto LABEL_24;
    case 13:
      v23 = &kPerformanceNetAttachBytesIn;
LABEL_24:
      objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", *v23), "doubleValue");
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("iRAT: %s. invalid metric type."), "-[WRM_SymptomsService getMetricFromDictionary::]");
      return 0.0;
  }
  return result;
}

- (int)mapSFNetworkAdvisoryToNetworkScore:(int)a3
{
  int v3;
  int v4;
  int v5;
  int v6;

  if (a3 == 7)
    v3 = 3;
  else
    v3 = -100;
  if (a3 == 6)
    v4 = 2;
  else
    v4 = v3;
  if (a3 == 5)
    v5 = 1;
  else
    v5 = v4;
  if ((a3 - 3) >= 2)
    v6 = v5;
  else
    v6 = 0;
  if ((a3 & 0xFFFFFFFD) != 0)
    return v6;
  else
    return -2;
}

- (BOOL)isBackhaulGood
{
  return self->mBackHaulLinkGood;
}

- (double)getTCPAvgRTT
{
  return self->mCurrentAvgRTT;
}

- (BOOL)getNetworkUsageAdviceFromSF:(int)a3
{
  uint64_t v5;
  NetworkPerformanceFeed *mNetworkPerfFeed;
  unsigned int v7;
  const char *v8;
  const char *v9;
  _QWORD v11[5];
  int v12;

  if (a3)
  {
    if (a3 != 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("%s. Unsupported network type %s."), "-[WRM_SymptomsService getNetworkUsageAdviceFromSF:]", "WRM_NETWORK_TYPE_INVALID!!!");
      LOBYTE(v7) = 0;
      return v7;
    }
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  if (!mNetworkPerfFeed)
  {
    -[WRM_SymptomsService createNetworkSymptomsFeed](self, "createNetworkSymptomsFeed");
    mNetworkPerfFeed = self->mNetworkPerfFeed;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018A08;
  v11[3] = &unk_100205A58;
  v12 = a3;
  v11[4] = self;
  v7 = -[NetworkPerformanceFeed usageConsultOn:onlyRelativeToReferencePoint:reply:](mNetworkPerfFeed, "usageConsultOn:onlyRelativeToReferencePoint:reply:", v5, 0, v11);
  if (v7)
  {
    ++self->mAdviceQueried;
    v8 = "TRUE";
  }
  else
  {
    v8 = "FALSE";
  }
  v9 = "WRM_NETWORK_TYPE_INVALID!!!";
  if (a3 == 1)
    v9 = "CELLULAR";
  if (!a3)
    v9 = "WIFI";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: %s: query Symptom Framework for %s advice rtn: %s"), "-[WRM_SymptomsService getNetworkUsageAdviceFromSF:]", v9, v8);
  return v7;
}

- (int)getNetworkScore:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return -[WRM_SymptomsService calculateCellularScore](self, "calculateCellularScore");
  if (!a3)
    return -[WRM_SymptomsService calculateWifiScore](self, "calculateWifiScore");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("iRAT: %s. Unknown network type %d."), "-[WRM_SymptomsService getNetworkScore:]", *(_QWORD *)&a3, v3, v4);
  return -1;
}

- (BOOL)getNetworkFullScoreFromSF:(int)a3
{
  NSDictionary *v4;
  NetworkPerformanceFeed *mNetworkPerfFeed;
  unsigned int v6;
  const char *v7;
  const char *v8;
  _QWORD v10[5];
  int v11;

  if (a3 == 1)
  {
    v8 = "CELLULAR";
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("%s. Unsupported network type %s."), "-[WRM_SymptomsService getNetworkFullScoreFromSF:]", v8);
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3)
  {
    v8 = "WRM_NETWORK_TYPE_INVALID!!!";
    goto LABEL_9;
  }
  if (!self->mNetworkPerfFeed)
    -[WRM_SymptomsService createNetworkSymptomsFeed](self, "createNetworkSymptomsFeed");
  v4 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", kSymptomAnalyticsServiceNetworkAttachmentCurrent, kSymptomAnalyticsServiceNetworkAttachmentInstant, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000EBBC;
  v10[3] = &unk_100205A80;
  v10[4] = self;
  v11 = 0;
  v6 = -[NetworkPerformanceFeed fullScorecardFor:options:reply:](mNetworkPerfFeed, "fullScorecardFor:options:reply:", 1, v4, v10);
  if (v6)
  {
    ++self->mFullScoreQueried;
    v7 = "TRUE";
  }
  else
  {
    v7 = "FALSE";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: %s: query Symptom Framework for %s full score rtn: %s"), "-[WRM_SymptomsService getNetworkFullScoreFromSF:]", "WIFI", v7);
  return v6;
}

- (double)getAgeOfMetricCurrInstant
{
  double result;

  -[WRM_SymptomsService getAgeOfMetricDictionary:](self, "getAgeOfMetricDictionary:", self->mWifiInstantCurrent);
  return result;
}

- (BOOL)evaluateBackHaulLink
{
  return 1;
}

- (int)calculateWifiScore
{
  return -[WRM_SymptomsService mapSFNetworkAdvisoryToNetworkScore:](self, "mapSFNetworkAdvisoryToNetworkScore:", self->mWifiAdvisory);
}

- (WRM_SymptomsService)init
{
  char *v2;
  WRM_SymptomsService *v3;
  const __CFString *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WRM_SymptomsService;
  v2 = -[WRM_SymptomsService init](&v7, "init");
  v3 = (WRM_SymptomsService *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 1) = 0;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((_QWORD *)v2 + 32) = 0;
    *((_QWORD *)v2 + 33) = 0;
    v2[272] = 1;
    *((_WORD *)v2 + 8) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *((_QWORD *)v2 + 15) = 0;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *((_QWORD *)v2 + 27) = 0;
    *((_QWORD *)v2 + 28) = -[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v3->mPrevTimeSinceThroughputEstimationStarted = 0.0;
    v3->mSFQueryTimer = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v3->mPrevTimeSinceSFQueryStarted = 0.0;
    v3->mABCreporter = (SDRDiagnosticReporter *)objc_alloc_init((Class)SDRDiagnosticReporter);
    if (-[WRM_SymptomsService createNetworkSymptomsFeed](v3, "createNetworkSymptomsFeed"))
    {
      v4 = CFSTR("iRAT: NetworkPerformanceFeed created.");
      v5 = 24;
    }
    else
    {
      v4 = CFSTR("iRAT: NetworkPerformanceFeed failed to create.");
      v5 = 17;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v5, v4);
  }
  return v3;
}

- (void)dealloc
{
  AnalyticsWorkspace *mAnalyticsWorkspace;
  NetworkPerformanceFeed *mNetworkPerfFeed;
  NSDate *mSFThroughEstimationTimer;
  NSDate *mSFQueryTimer;
  SDRDiagnosticReporter *mABCreporter;
  objc_super v8;

  mAnalyticsWorkspace = self->mAnalyticsWorkspace;
  if (mAnalyticsWorkspace)
    CFRelease(mAnalyticsWorkspace);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  if (mNetworkPerfFeed)
    CFRelease(mNetworkPerfFeed);

  mSFThroughEstimationTimer = self->mSFThroughEstimationTimer;
  if (mSFThroughEstimationTimer)
  {

    self->mSFThroughEstimationTimer = 0;
    self->mPrevTimeSinceThroughputEstimationStarted = 0.0;
  }
  mSFQueryTimer = self->mSFQueryTimer;
  if (mSFQueryTimer)
  {

    self->mSFQueryTimer = 0;
    self->mPrevTimeSinceSFQueryStarted = 0.0;
  }
  mABCreporter = self->mABCreporter;
  if (mABCreporter)
  {

    self->mABCreporter = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)WRM_SymptomsService;
  -[WRM_SymptomsService dealloc](&v8, "dealloc");
}

- (void)resetIMSMetrics
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("resetIMSMetrics called"));
  *(_WORD *)&self->mSIPTimeOutOverWiFiDetected = 0;
}

- (int)getNetworkHistScore:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return -[WRM_SymptomsService calculateCellularHistoryScore](self, "calculateCellularHistoryScore");
  if (!a3)
    return -[WRM_SymptomsService calculateWifiHistoryScore](self, "calculateWifiHistoryScore");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("iRAT: %s. Unknown network type %d."), "-[WRM_SymptomsService getNetworkHistScore:]", *(_QWORD *)&a3, v3, v4);
  return -201;
}

- (BOOL)isCurrentAttachPointHasChanged:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *v9;

  if (a3)
  {
    v5 = objc_msgSend(a3, "count");
    if (v5)
    {
      v5 = objc_msgSend(objc_msgSend(a3, "allValues"), "objectAtIndex:", 0);
      if (v5)
      {
        v6 = v5;
        v5 = objc_msgSend(v5, "count");
        if (v5)
        {
          v7 = objc_msgSend(objc_msgSend(v6, "allValues"), "objectAtIndex:", 0);

          self->mCurrentConnectionIdentifier = 0;
          v8 = (NSString *)objc_msgSend(v7, "objectForKeyedSubscript:", kPerformanceNetAttachIdentifier);
          self->mCurrentConnectionIdentifier = v8;
          v9 = v8;
          if (-[NSString isEqualToString:](self->mPreviousConnectionIdentifier, "isEqualToString:", self->mCurrentConnectionIdentifier))
          {
            LOBYTE(v5) = 1;
          }
          else
          {

            LOBYTE(v5) = 0;
            self->mPreviousConnectionIdentifier = self->mCurrentConnectionIdentifier;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)createNetworkSymptomsFeed
{
  id v3;
  AnalyticsWorkspace *v4;
  _QWORD v6[5];
  int out_token;

  if (self->mNetworkPerfFeed)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("iRAT: NetworkPerFeed already created."));
LABEL_6:
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  v3 = objc_alloc((Class)AnalyticsWorkspace);
  v4 = (AnalyticsWorkspace *)objc_msgSend(v3, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
  self->mAnalyticsWorkspace = v4;
  if (v4)
  {
    v4 = (AnalyticsWorkspace *)objc_msgSend(objc_alloc((Class)NetworkPerformanceFeed), "initWithWorkspace:", self->mAnalyticsWorkspace);
    self->mNetworkPerfFeed = v4;
    if (v4)
    {
      -[AnalyticsWorkspace setQueue:](v4, "setQueue:", objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"));
      out_token = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100127E2C;
      v6[3] = &unk_100201FD0;
      v6[4] = self;
      notify_register_dispatch("com.apple.networkd.started", &out_token, (dispatch_queue_t)&_dispatch_main_q, v6);
      goto LABEL_6;
    }
  }
  return (char)v4;
}

- (void)handleNetworkdRestart
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("iRAT: Networkd just restarted."));
}

- (void)notifyWifiCallState:(BOOL)a3
{
  const char *v3;
  const __CFString *v4;
  uint64_t v5;

  if (a3)
    v3 = "com.apple.wrm.CallOn”";
  else
    v3 = "com.apple.wrm.CallOff";
  if (a3)
    v4 = CFSTR("iRAT: Sending WiFiCallOnSymtomps.");
  else
    v4 = CFSTR("iRAT: Sending WIFIcallOFFSymtomps.");
  v5 = symptom_create(v3, a2);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, v4);
  symptom_send(v5);
}

- (void)watchTcpConnectionFallBack
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100127F34;
  v2[3] = &unk_100203228;
  v2[4] = 0;
  if (!tcp_connection_fallback_watcher_create(1, objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), v2))+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("iRAT: Failed to create TCP Connection Wacther"));
}

- (int)calculateCellularScore
{
  return -[WRM_SymptomsService mapSFNetworkAdvisoryToNetworkScore:](self, "mapSFNetworkAdvisoryToNetworkScore:", self->mCellularAdvisory);
}

- (int)calculateWifiHistoryScore
{
  return -200;
}

- (void)displayIKEMetrics:(id)a3
{
  id v4;
  id v5;

  if (a3 && objc_msgSend(a3, "count"))
  {
    v4 = objc_msgSend(a3, "objectForKeyedSubscript:", kSymptomAnalyticsServiceFlowInstant);
    v5 = objc_msgSend(a3, "objectForKeyedSubscript:", kSymptomAnalyticsServiceFlowHistorical);
    if (v4)
      v5 = v4;
    if (v5)
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &stru_100205AC0);
  }
}

- (double)evaluateNetworkBandwidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->mCurrentBytesIn <= self->mPrevBytesIn)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("iRAT: Symptom Metrics not evaluating throughput"), v10, v11, v12, v13, v14);
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->mSFThroughEstimationTimer, "timeIntervalSinceNow");
    v4 = self->mPrevTimeSinceThroughputEstimationStarted - v3;
    v5 = self->mCurrentBytesIn - self->mPrevBytesIn;
    v6 = v5 / (self->mCurrentPacketsIn - self->mPrevPacketsIn + 0.000001);
    v7 = v5 * 8.0 / (v4 * 1000000.0);
    v8 = (v7 + self->mAvgNetworkThroughput * 19.0) / 20.0;
    self->mNetworkThroughput = v7;
    self->mAvgNetworkThroughput = v8;
    self->mPrevTimeSinceThroughputEstimationStarted = v3;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("iRAT: Symptom Metrics Throughput Estimation, Duration: %.2f, Delta Bytes: %.2f, Throughput:%.2f, Average Pkt Size: %.2f AVG Bandwidth: %.2f"), *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v6, *(_QWORD *)&v8);
  }
  return self->mNetworkThroughput;
}

- (id)getImsTunnelId
{
  return self->mImsTunnelID;
}

- (void)setIKEv2WatchPoint:(id)a3
{
  self->mImsTunnelID = (NSString *)a3;
  -[WRM_SymptomsService watchpointForIKETunnel:onThreshold:](self, "watchpointForIKETunnel:onThreshold:");
}

- (BOOL)scorecardForIKETunnel:(id)a3 isInstant:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  NSDictionary *v9;
  NetworkPerformanceFeed *mNetworkPerfFeed;
  _QWORD v12[5];

  v4 = a4;
  v6 = kSymptomAnalyticsServiceFlowTagIKE;
  v7 = kSymptomAnalyticsServiceFlowTag;
  if (!a3)
    a3 = +[NSNull null](NSNull, "null");
  v8 = &kSymptomAnalyticsServiceFlowInstant;
  if (!v4)
    v8 = &kSymptomAnalyticsServiceFlowHistorical;
  v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, v7, a3, *v8, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100128390;
  v12[3] = &unk_100205AE8;
  v12[4] = self;
  if ((-[NetworkPerformanceFeed fullScorecardFor:options:reply:](mNetworkPerfFeed, "fullScorecardFor:options:reply:", 1, v9, v12) & 1) != 0)++self->mFullScoreQueried;
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("iRAT: Failed to ussye scorecard request."));
  return 1;
}

- (void)displayWatchpointHit:(id)a3
{
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &stru_100205B08);
}

- (BOOL)watchpointForIKETunnel:(id)a3 onThreshold:(unsigned int)a4
{
  NSDictionary *v7;
  NetworkPerformanceFeed *mNetworkPerfFeed;
  _QWORD v10[5];

  v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", kSymptomAnalyticsServiceFlowTagIKE, kSymptomAnalyticsServiceFlowTag, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001285C4;
  v10[3] = &unk_100205AE8;
  v10[4] = self;
  if ((-[NetworkPerformanceFeed watchpointOn:forIdentifier:andKey:onThreshold:withOptions:uponHit:](mNetworkPerfFeed, "watchpointOn:forIdentifier:andKey:onThreshold:withOptions:uponHit:", 1, a3, kPerformanceFlowTxReTxPackets, v7, v10, (double)a4) & 1) == 0)+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("iRAT: Failed to issue watchpoint request."));
  return 1;
}

- (double)getCurrentAgeOfConnectedLinkInSeconds
{
  return self->mCurrentMetricsAge;
}

- (int)calculateCellularHistoryScore
{
  return -200;
}

- (void)resetSFContext
{
  self->mBackHaulLinkGood = 1;
  self->mCurrentMetricsAge = 0.0;
  *(_OWORD *)&self->mPrevConnAttempt = 0u;
  *(_OWORD *)&self->mCurrentConnAttempt = 0u;
  *(_OWORD *)&self->mCurrentMinRTT = 0u;
  self->mCurrentVarRTT = 0.0;
}

- (void)notifyIRATManager:(int64_t)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t object[2];
  char *v8[2];
  xpc_object_t values[2];
  char *keys[2];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "kWRMM_IKEv2_RTT_UPDATE", a3);
  *(_OWORD *)keys = *(_OWORD *)&off_100205B28;
  values[0] = xpc_uint64_create(0x3EAuLL);
  values[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v8 = *(_OWORD *)&off_100205B38;
  object[0] = xpc_uint64_create(0x3E8uLL);
  object[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v8, object, 2uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, CFSTR("%s: ready to send a xpc message: %@."), "-[WRM_SymptomsService notifyIRATManager:]", v6);
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v6);
  xpc_release(object[0]);
  xpc_release(v6);
  xpc_release(values[0]);
  xpc_release(v5);
  xpc_release(v4);
}

- (double)getNetworkThroughput
{
  return self->mAvgNetworkThroughput;
}

- (void)updateSIPMetrics:(BOOL)a3
{
  self->mSIPTimeOutOverWiFiDetected = a3;
}

- (void)updateDPDMetrics:(BOOL)a3
{
  self->mWiFiIPsecTunnelDisconnected = a3;
}

- (BOOL)isIMSTransportQualityGood
{
  return !self->mSIPTimeOutOverWiFiDetected && !self->mWiFiIPsecTunnelDisconnected;
}

- (BOOL)dpdFailureDetected
{
  return self->mWiFiIPsecTunnelDisconnected;
}

- (BOOL)sipTimeOutDetected
{
  return self->mSIPTimeOutOverWiFiDetected;
}

- (double)getTCPMinRTT
{
  return self->mCurrentMinRTT;
}

- (double)getTCPRttVar
{
  return self->mCurrentVarRTT;
}

- (double)getRxDupeRatio
{
  return self->mCurrentDupeRatio;
}

- (double)getRxRetryRatio
{
  return self->mCurrentRetryRatio;
}

- (void)triggerAutoBugCapture:(id)a3 subType:(id)a4 subtypeContext:(id)a5
{
  -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:](self->mABCreporter, "snapshotWithSignature:duration:events:payload:actions:reply:", -[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](self->mABCreporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("iRATManager"), a3, a4, a5, CFSTR("WirelessRadioManagerd"), 0), 0, 0, 0, &stru_100205B68, 1.0);
}

@end
