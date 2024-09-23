@implementation WRM_AWDService

- (WRM_AWDService)init
{
  WRM_AWDService *v2;
  NSDate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_AWDService;
  v2 = -[WRM_AWDService init](&v5, "init");
  if (v2)
  {
    v3 = (NSDate *)-[NSDate copy](+[NSDate date](NSDate, "date"), "copy");
    v2->curProximityReportInterval = 0.0;
    v2->prevProximityReportInterval = 0.0;
    v2->mProximityReportTimer = v3;
  }
  return v2;
}

- (void)dealloc
{
  NSDate *mProximityReportTimer;
  NSDate **p_mProximityReportTimer;
  objc_super v5;

  p_mProximityReportTimer = &self->mProximityReportTimer;
  mProximityReportTimer = self->mProximityReportTimer;
  if (mProximityReportTimer)
  {

    *p_mProximityReportTimer = 0;
    p_mProximityReportTimer[1] = 0;
    p_mProximityReportTimer[2] = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WRM_AWDService;
  -[WRM_AWDService dealloc](&v5, "dealloc");
}

- (void)submitMetricsTelephonyOrFtCallEnd:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int *v4;
  unsigned int *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;

  v3 = a3;
  v4 = (unsigned int *)objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMFaceTimeHandover");
  if (v4)
  {
    v5 = v4;
    v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    v7 = objc_alloc_init((Class)sub_10012AB74());
    v8 = objc_alloc_init((Class)sub_10012AC38());
    v9 = objc_alloc_init((Class)sub_10012ACFC());
    objc_msgSend(v7, "setTimeOfDay:", +[WRM_Timer getTimeStamp](WRM_Timer, "getTimeStamp"));
    objc_msgSend(v7, "setIsCallFailed:", v3);
    v10 = v5[39] - 1;
    if (v10 > 4)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v11 = dword_1001FB704[v10];
      v12 = dword_1001FB718[v10];
    }
    objc_msgSend(v7, "setMessageType:", v11);
    objc_msgSend(v7, "setMessageTrigger:", v12);
    objc_msgSend(v7, "setWifiRssi:", *((_QWORD *)v5 + 2));
    objc_msgSend(v7, "setWifiSNR:", *((_QWORD *)v5 + 3));
    objc_msgSend(v7, "setWifiQbssLoad:", v5[9]);
    objc_msgSend(v7, "setWifiCca:", v5[8]);
    objc_msgSend(v7, "setWifiStationCount:", v5[15]);
    objc_msgSend(v7, "setWifiEstimatedBW:", v5[16]);
    objc_msgSend(v7, "setWifiRxPhyRate:", v5[10]);
    objc_msgSend(v7, "setWifiTxPhyRate:", v5[13]);
    objc_msgSend(v7, "setWifiTxPER:", v5[12]);
    objc_msgSend(v7, "setWifiRxRetry:", v5[11]);
    objc_msgSend(v7, "setWifiCaptiveNetworks:", *((unsigned __int8 *)v5 + 56));
    objc_msgSend(v7, "setCellDataLQM:", v5[30]);
    objc_msgSend(v7, "setCellVoiceLQM:", v5[31]);
    v13 = (void *)*((_QWORD *)v5 + 13);
    if (v13)
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("LTE")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("submitMetricsTelephonyOrFtCallEnd rat= LTE, rsrp=%d, snr=%d, rsrq=%d"), v5[32], v5[34], v5[33]);
        objc_msgSend(v7, "setCellRatType:", CFSTR("LTE"));
        objc_msgSend(v7, "setCellLteRSRP:", v5[32]);
        objc_msgSend(v7, "setCellLteSNR:", v5[34]);
        objc_msgSend(v7, "setCellLteRSRQ:", v5[33]);
      }
      else if (objc_msgSend(*((id *)v5 + 13), "isEqualToString:", CFSTR("N_RADIO")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("submitMetricsTelephonyOrFtCallEnd rat= NR, rsrp=%d, snr=%d, rsrq=%d"), v5[32], v5[34], v5[33]);
        objc_msgSend(v7, "setCellRatType:", CFSTR("N_RADIO"));
        objc_msgSend(v7, "setCellNrRSRP:", v5[32]);
        objc_msgSend(v7, "setCellNrSNR:", v5[34]);
        objc_msgSend(v7, "setCellNrRSRQ:", v5[33]);
      }
      else if (objc_msgSend(*((id *)v5 + 13), "isEqualToString:", CFSTR("UMTS")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("submitMetricsTelephonyOrFtCallEnd rat= UMTS, rsrp=%d, snr=%d"), v5[32], v5[34]);
        objc_msgSend(v7, "setCellRatType:", CFSTR("UMTS"));
        objc_msgSend(v7, "setCellLteRSRP:", v5[32]);
        objc_msgSend(v7, "setCellLteSNR:", v5[34]);
      }
    }
    if ((v5[39] & 0xFFFFFFFE) == 2)
    {
      objc_msgSend(v7, "setFtFacetimeAction:", v5[22]);
      objc_msgSend(v7, "setFtFacetimePacketLoss:", v5[23]);
      objc_msgSend(v7, "setFtFacetimeTimeDelay:", v5[24]);
      objc_msgSend(v7, "setFtCounter:", v5[2]);
    }
    objc_msgSend(v7, "setWrmAlertedMode:", *((unsigned __int8 *)v5 + 140));
    objc_msgSend(v7, "setWrmIsPCDetected:", *((unsigned __int8 *)v5 + 142));
    objc_msgSend(v7, "setWrmIsStallDetected:", *((unsigned __int8 *)v5 + 143));
    objc_msgSend(v7, "setWrmAudioErasure:", v5[36]);
    objc_msgSend(v7, "setWrmVideoErasure:", v5[37]);
    objc_msgSend(v6, "getLastKnownLatitude");
    objc_msgSend(v8, "setLat:");
    objc_msgSend(v6, "getLastKnownLongitude");
    objc_msgSend(v8, "setLng:");
    objc_msgSend(v9, "setLatLng:", v8);
    objc_msgSend(v7, "setLocation:", v9);
    v14 = objc_alloc((Class)NSDate);
    objc_msgSend(v6, "getLastKnownLocationTimestamp");
    v20 = objc_msgSend(v14, "initWithTimeIntervalSince1970:");
    objc_msgSend(v8, "lat");
    v16 = v15;
    objc_msgSend(v8, "lng");
    v18 = v17;
    objc_msgSend(v20, "timeIntervalSinceNow");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("submitMetricsTelephonyOrFtCallEnd callFailed=%d, lat=%f, lng=%f location obtained from %fseconds before"), v3, v16, v18, -v19);
    objc_msgSend((id)sub_10012ADC0(), "reportCellConnectionQualityHarvestRecord:", v7);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("%s:metric is not ready"), "-[WRM_AWDService submitMetricsTelephonyOrFtCallEnd:]");
  }
}

- (void)submitMetricsFaceTimeHandover
{
  unsigned int *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];

  v2 = (unsigned int *)objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMFaceTimeHandover");
  if (v2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("submit CA metric com.apple.Telephony.wrmFacetimeRecommendation"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012B250;
    v13[3] = &unk_100205CA8;
    v13[4] = v2;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmFacetimeRecommendation"), v13);
    v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    v4 = objc_alloc_init((Class)sub_10012AB74());
    v5 = objc_alloc_init((Class)sub_10012AC38());
    v6 = objc_alloc_init((Class)sub_10012ACFC());
    objc_msgSend(v4, "setTimeOfDay:", +[WRM_Timer getTimeStamp](WRM_Timer, "getTimeStamp"));
    objc_msgSend(v4, "setWifiRssi:", *((_QWORD *)v2 + 2));
    objc_msgSend(v4, "setWifiSNR:", *((_QWORD *)v2 + 3));
    objc_msgSend(v4, "setWifiQbssLoad:", v2[9]);
    objc_msgSend(v4, "setWifiCca:", v2[8]);
    objc_msgSend(v4, "setWifiStationCount:", v2[15]);
    objc_msgSend(v4, "setWifiEstimatedBW:", v2[16]);
    objc_msgSend(v4, "setWifiRxPhyRate:", v2[10]);
    objc_msgSend(v4, "setWifiTxPhyRate:", v2[13]);
    objc_msgSend(v4, "setWifiTxPER:", v2[12]);
    objc_msgSend(v4, "setWifiRxRetry:", v2[11]);
    objc_msgSend(v4, "setWifiCaptiveNetworks:", *((unsigned __int8 *)v2 + 56));
    objc_msgSend(v4, "setCellDataLQM:", v2[30]);
    objc_msgSend(v4, "setCellVoiceLQM:", v2[31]);
    v7 = (void *)*((_QWORD *)v2 + 13);
    if (v7)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("LTE")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("GEONetworkSelectionHarvestReporter rat= LTE, rsrp=%d, snr=%d, rsrq=%d"), v2[32], v2[34], v2[33]);
        objc_msgSend(v4, "setCellRatType:", CFSTR("LTE"));
        objc_msgSend(v4, "setCellLteRSRP:", v2[32]);
        objc_msgSend(v4, "setCellLteSNR:", v2[34]);
        objc_msgSend(v4, "setCellLteRSRQ:", v2[33]);
      }
      else if (objc_msgSend(*((id *)v2 + 13), "isEqualToString:", CFSTR("N_RADIO")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("GEONetworkSelectionHarvestReporter rat= NR, rsrp=%d, snr=%d, rsrq=%d"), v2[32], v2[34], v2[33]);
        objc_msgSend(v4, "setCellRatType:", CFSTR("N_RADIO"));
        objc_msgSend(v4, "setCellNrRSRP:", v2[32]);
        objc_msgSend(v4, "setCellNrSNR:", v2[34]);
        objc_msgSend(v4, "setCellNrRSRQ:", v2[33]);
      }
    }
    objc_msgSend(v4, "setFtFacetimeAction:", v2[22]);
    objc_msgSend(v4, "setFtFacetimePacketLoss:", v2[23]);
    objc_msgSend(v4, "setFtFacetimeTimeDelay:", v2[24]);
    objc_msgSend(v4, "setFtCounter:", v2[2]);
    objc_msgSend(v4, "setFtIRATRecommendation:", *((_QWORD *)v2 + 9));
    objc_msgSend(v4, "setFtIRATRecommendationReason:", *((_QWORD *)v2 + 10));
    objc_msgSend(v4, "setWrmAlertedMode:", *((unsigned __int8 *)v2 + 140));
    objc_msgSend(v4, "setWrmIsPCDetected:", *((unsigned __int8 *)v2 + 142));
    objc_msgSend(v4, "setWrmIsStallDetected:", *((unsigned __int8 *)v2 + 143));
    objc_msgSend(v4, "setWrmAudioErasure:", v2[36]);
    objc_msgSend(v4, "setWrmVideoErasure:", v2[37]);
    if (objc_msgSend(+[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton"), "isWiFiPrimary"))
    {
      objc_msgSend(v3, "getLastKnownLatitude");
      objc_msgSend(v5, "setLat:");
      objc_msgSend(v3, "getLastKnownLongitude");
      objc_msgSend(v5, "setLng:");
      objc_msgSend(v6, "setLatLng:", v5);
      objc_msgSend(v4, "setLocation:", v6);
      objc_msgSend(v5, "lat");
      v9 = v8;
      objc_msgSend(v5, "lng");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("GEONetworkSelectionHarvestReporter wifi primary, lat=%f, lng=%f"), v9, v10);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("GEONetworkSelectionHarvestReporter wifi Not primary"), v11, v12);
    }
    objc_msgSend((id)sub_10012ADC0(), "reportCellConnectionQualityHarvestRecord:", v4);

    objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "resetFaceTimeHandover");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("%s: WRMMetricsiRATFaceTimeHandover metric is not ready"), "-[WRM_AWDService submitMetricsFaceTimeHandover]");
  }
}

- (void)submitProximityMetrics:(BOOL)a3
{
  _DWORD *v5;
  _DWORD *v6;
  int v7;
  double v8;
  unint64_t v9;
  _QWORD v10[6];
  int v11;
  BOOL v12;

  v5 = objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMProximity");
  if (v5)
  {
    v6 = v5;
    v7 = dword_100271430;
    dword_100271430 = v5[14];
    -[NSDate timeIntervalSinceNow](self->mProximityReportTimer, "timeIntervalSinceNow");
    v9 = (unint64_t)(self->prevProximityReportInterval - v8);
    self->prevProximityReportInterval = v8;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("submit CA metric com.apple.Telephony.wrmLinkStateChange"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10012B794;
    v10[3] = &unk_100205CC8;
    v10[4] = v6;
    v10[5] = v9;
    v11 = v7;
    v12 = a3;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmLinkStateChange"), v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("WRMPRoximityMetrics metric is not ready"));
  }
}

- (void)submitDataLinkPreferenceaMetrics
{
  _BYTE *v2;
  _QWORD v3[5];

  v2 = objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getStandaloneLinkPreferenceMetrics");
  if (v2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("submit CA metric com.apple.Telephony.wrmLinkPrefChangeEvent"));
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10012BAD4;
    v3[3] = &unk_100205CA8;
    v3[4] = v2;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmLinkPrefChangeEvent"), v3);
    v2[172] = 0;
    objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "resetStandaloneLinkPreferenceMetrics");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("WRMMetricsiRATDataRecommendation metric is not ready"));
  }
}

- (void)submitMetricWiFiCallingEnd
{
  id v2;
  id v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  _QWORD v7[6];
  unsigned __int8 v8;

  v2 = objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMWiFiCallingEnd");
  if (v2)
  {
    v3 = v2;
    v4 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "getWatchAssociated");
    else
      v6 = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("Submitted CA metric WiFiCallingEnd"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10012BFF8;
    v7[3] = &unk_100205CF0;
    v8 = v6;
    v7[4] = v5;
    v7[5] = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmWiFiCallingEnd"), v7);
    objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "resetWiFiCallingEnd");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("WiFiCallingEnd metric is not ready"));
  }
}

- (void)submitMericStreaming
{
  unsigned int *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  objc_class *v11;
  id v12;
  NSNumber *v13;
  NSNumber *v14;
  const __CFString *v15;
  NSNumber *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSNumber *v21;
  NSNumber *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  NSNumber *v26;
  NSNumber *v27;
  NSNumber *v28;
  _QWORD v29[5];
  void **v30;
  uint64_t v31;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;

  v2 = (unsigned int *)objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMStreaming");
  if (v2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("Submit CA metric com.apple.Telephony.wrmStreamingReport."));
    v3 = objc_autoreleasePoolPush();
    if (MGGetBoolAnswer(CFSTR("InternalBuild")))
    {
      v20 = v3;
      v4 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
      v5 = objc_alloc_init((Class)sub_10012AC38());
      objc_msgSend(v4, "getLastKnownLatitude");
      objc_msgSend(v5, "setLat:");
      objc_msgSend(v4, "getLastKnownLongitude");
      objc_msgSend(v5, "setLng:");
      v35 = 0;
      v36 = &v35;
      v37 = 0x3052000000;
      v38 = sub_10012DF24;
      v39 = sub_10012DF34;
      v6 = (void *)qword_100271460;
      v40 = qword_100271460;
      if (!qword_100271460)
      {
        v30 = _NSConcreteStackBlock;
        v31 = 3221225472;
        v32 = sub_10012E134;
        v33 = &unk_100201B40;
        v34 = &v35;
        sub_10012E134((uint64_t)&v30);
        v6 = (void *)v36[5];
      }
      _Block_object_dispose(&v35, 8);
      objc_msgSend(v5, "lat");
      v8 = v7;
      objc_msgSend(v5, "lng");
      v10 = objc_msgSend(v6, "coordinatesToGeoHashWithLength:latitude:longitude:", 7, v8, v9);
      v35 = 0;
      v36 = &v35;
      v37 = 0x3052000000;
      v38 = sub_10012DF24;
      v39 = sub_10012DF34;
      v11 = (objc_class *)qword_100271470;
      v40 = qword_100271470;
      if (!qword_100271470)
      {
        v30 = _NSConcreteStackBlock;
        v31 = 3221225472;
        v32 = sub_10012E210;
        v33 = &unk_100201B40;
        v34 = &v35;
        sub_10012E210((uint64_t)&v30);
        v11 = (objc_class *)v36[5];
      }
      _Block_object_dispose(&v35, 8);
      v12 = [v11 alloc];
      v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[2]);
      v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[3]);
      if (*((_QWORD *)v2 + 23))
        v15 = (const __CFString *)*((_QWORD *)v2 + 23);
      else
        v15 = CFSTR("INVALID_RAT");
      v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[44]);
      v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v2 + 288));
      if (*((_BYTE *)v2 + 288))
        v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v2 + 289));
      else
        v27 = (NSNumber *)&__kCFBooleanFalse;
      v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[77]);
      v25 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[79]);
      v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[80]);
      v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[41]);
      v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[42]);
      v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v2[76]);
      v17 = objc_msgSend(v12, "initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount:cmDataSentDuration:tcpRTTAvg:tcpRTTvar:videoStreamingStallTime:numStall:stallDuration:cellEstimatedBW:cellLoad:cellModelConfidenceLevel:mlPredictedCellBW:qbssLoad:lqmScorecellular:", v10, v13, v14, v15, v16, v28, v27, v26, v25, v24, v23,
              v22,
              v21,
              +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v2[73]),
              +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v2[74]),
              +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v2[75]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[84]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[85]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[86]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[87]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[88]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[89]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[90]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[5]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[6]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[7]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[8]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[10]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[11]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[12]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[13]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[14]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[15]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[67]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[69]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[93]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[92]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[93]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[78]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[45]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[91]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[55]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[20]),
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2[43]));
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v18 = off_100271480;
      v38 = (void (*)(uint64_t, uint64_t))off_100271480;
      if (!off_100271480)
      {
        v19 = (void *)sub_10012E264();
        v18 = dlsym(v19, "__BMRootLibrary");
        v36[3] = (uint64_t)v18;
        off_100271480 = v18;
      }
      _Block_object_dispose(&v35, 8);
      if (!v18)
        sub_10012EFF0();
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)((uint64_t (*)(void))v18)(), "Device"), "Wireless"), "ConnectivityContext"), "source"), "sendEvent:", v17);

      v3 = v20;
    }
    objc_autoreleasePoolPop(v3);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10012CA00;
    v29[3] = &unk_100205CA8;
    v29[4] = v2;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmStreamingReport"), v29);
    objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "resetStreaming");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Streaming metric is not ready"));
  }
}

- (void)submitMeric5GVersusWiFiLinkMetrics
{
  id v2;
  _QWORD v3[5];

  v2 = objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRM5GVersusWiFiLinkPreferenceMetrics");
  if (v2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("submit CA metric com.apple.Telephony.wrmWiFiCell5GData"));
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10012D684;
    v3[3] = &unk_100205CA8;
    v3[4] = v2;
    AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmWiFiCell5GData"), v3);
    objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "reset5GVersusWiFiMetrics");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Cell versus WiFi metric is not ready"));
  }
}

- (id)convetDataLqmToString:(int)a3
{
  if (a3 > 19)
  {
    switch(a3)
    {
      case 20:
        return CFSTR("MinViable");
      case 50:
        return CFSTR("Poor");
      case 100:
        return CFSTR("Good");
      default:
        return CFSTR("Unknown");
    }
  }
  else
  {
    if (a3 != -2)
    {
      if (a3 == 10)
        return CFSTR("Bad");
      return CFSTR("Unknown");
    }
    return CFSTR("Off");
  }
}

- (void)submitMetricsCBRSForSim:(int64_t)a3 dataLQM:(int)a4 congested:(BOOL)a5
{
  _QWORD v9[6];
  int v10;
  BOOL v11;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("submit CA com.apple.Telephony.wrmCBRSRecommendation slot=%ld, lqm=%ld, isCongested=%d"), a3, a4, a5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012DE64;
  v9[3] = &unk_100205D18;
  v9[4] = self;
  v9[5] = a3;
  v10 = a4;
  v11 = a5;
  AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmCBRSRecommendation"), v9);
}

@end
