@implementation WRM_MetricsService

+ (id)getSingleton
{
  objc_super v4;

  objc_sync_enter(a1);
  if (!qword_100271428)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WRM_MetricsService;
    qword_100271428 = (uint64_t)objc_msgSend(objc_msgSendSuper2(&v4, "allocWithZone:", 0), "init");
  }
  objc_sync_exit(a1);
  return (id)qword_100271428;
}

- (WRM_MetricsService)init
{
  WRM_MetricsService *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_MetricsService;
  result = -[WRM_MetricsService init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->mLTECoexMetrics = 0u;
    *(_OWORD *)&result->mProximityMetrics = 0u;
    *(_OWORD *)&result->mStreamingMetrics = 0u;
    *(_OWORD *)&result->mAWDService = 0u;
    *(_OWORD *)&result->mCoexMetrics = 0u;
  }
  return result;
}

- (void)dealloc
{
  WRM_CoexMetrics *mCoexMetrics;
  WRM_iRATMetrics *miRATMetrics;
  WRM_WiFiCallingMetrics *mWiFiCallingMetrics;
  WRM_AWDService *mAWDService;
  WRM_StreamingMetrics *mStreamingMetrics;
  WRM_FaceTimeMetrics *mFaceTimeMetrics;
  WRM_ProximityMetrics *mProximityMetrics;
  WRM_MetricsiRATDataRecommendation *mStandaloneLinkPreferenceMetrics;
  WRM_LTECoexMetrics *mLTECoexMetrics;
  WRM_MetricsiRAT5GVersusWiFi *miRAT5GVersusWiFi;
  objc_super v13;

  mCoexMetrics = self->mCoexMetrics;
  if (mCoexMetrics)

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)

  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics)

  mAWDService = self->mAWDService;
  if (mAWDService)

  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics)

  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics)

  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics)

  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics)

  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)

  miRAT5GVersusWiFi = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi)

  v13.receiver = self;
  v13.super_class = (Class)WRM_MetricsService;
  -[WRM_MetricsService dealloc](&v13, "dealloc");
}

+ (WRM_MetricsService)allocWithZone:(_NSZone *)a3
{
  return (WRM_MetricsService *)objc_msgSend(a1, "getSingleton", a3);
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)initiRATMetrics
{
  self->miRATMetrics = objc_alloc_init(WRM_iRATMetrics);
}

- (id)getWiFiCallingMetrics
{
  return self->mWiFiCallingMetrics;
}

- (id)getLTECoexMetrics
{
  return self->mLTECoexMetrics;
}

- (id)getAWDService
{
  return self->mAWDService;
}

- (void)initCoexMetrics
{
  self->mCoexMetrics = objc_alloc_init(WRM_CoexMetrics);
}

- (void)initWiFiCallingMetrics
{
  self->mWiFiCallingMetrics = objc_alloc_init(WRM_WiFiCallingMetrics);
}

- (void)initLTECoexMetrics
{
  if (!self->mLTECoexMetrics)
    self->mLTECoexMetrics = objc_alloc_init(WRM_LTECoexMetrics);
}

- (void)initStreamingMetrics
{
  self->mStreamingMetrics = objc_alloc_init(WRM_StreamingMetrics);
}

- (void)initFaceTimeHandoverMetrics
{
  self->mFaceTimeMetrics = objc_alloc_init(WRM_FaceTimeMetrics);
}

- (void)initProximityMetrics
{
  self->mProximityMetrics = objc_alloc_init(WRM_ProximityMetrics);
}

- (void)initStandaloneLinkPrefMetrics
{
  self->mStandaloneLinkPreferenceMetrics = objc_alloc_init(WRM_MetricsiRATDataRecommendation);
}

- (void)init5GVersusWiFiLinkPrefMetrics
{
  self->miRAT5GVersusWiFi = objc_alloc_init(WRM_MetricsiRAT5GVersusWiFi);
}

- (void)initAWDService
{
  if (!self->mAWDService)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("Init iRAT AWD service."));
    self->mAWDService = objc_alloc_init(WRM_AWDService);
  }
}

- (void)updateiRATMetricLinkInit:(int)a3
{
  const char *v5;
  uint64_t v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("========= %s ================"), "-[WRM_MetricsService updateiRATMetricLinkInit:]");
  v5 = "WRM_IWLAN_CELLULAR";
  if (a3 == 1)
    v5 = "WRM_IWLAN_WIFI";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("%s: link %s"), "-[WRM_MetricsService updateiRATMetricLinkInit:]", v5);
  if (a3 == 1)
  {
    v6 = 216;
LABEL_7:
    ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v6);
    goto LABEL_8;
  }
  if (!a3)
  {
    v6 = 220;
    goto LABEL_7;
  }
LABEL_8:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("LinkInit Stats: Wifi %d Cell %d"), self->miRATMetrics->mLinkInit.countWiFi, self->miRATMetrics->mLinkInit.countCellular);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("===================================================="));
}

- (void)getReasonStr:(int)a3 :(char *)a4
{
  char *v4;
  uint64_t i;
  const char *v7;

  v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (i = 0; i != 16; ++i)
    {
      if ((dword_1001FB674[i] & a3) != 0)
      {
        v7 = "Unknown";
        if ((i & 0xFFFFFFF0) == 0)
          v7 = off_100205BC0[i];
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

- (void)updateiRATMetricWifiToCell:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v9;
  const char *v11;
  WRM_HORecordCacheEntry *v12;
  uint64_t v13;
  _BYTE v14[128];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a3;
  -[WRM_MetricsService getReasonStr::](self, "getReasonStr::", *(_QWORD *)&a6, v14);
  self->mWiFiCallingMetrics->mWifiCallingEnd.Call_End_Reason = v14;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("========= %s === reason 0x%x ============="), "-[WRM_MetricsService updateiRATMetricWifiToCell::::]", v6);
  v11 = "NO";
  if (v9)
    v11 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("%s: callActive %s app %ld mob %ld reason 0x%x (%s)"), "-[WRM_MetricsService updateiRATMetricWifiToCell::::]", v11, a4, v7, v6, v14);
  v12 = objc_alloc_init(WRM_HORecordCacheEntry);
  -[WRM_HORecordCacheEntry setWithRecord:::::](v12, "setWithRecord:::::", 100, v9, a4, v7, v6);
  -[NSMutableArray addObject:](self->miRATMetrics->mHORecordCache, "addObject:", v12);
  if ((unint64_t)-[NSMutableArray count](self->miRATMetrics->mHORecordCache, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->miRATMetrics->mHORecordCache, "removeObjectAtIndex:", 0);

  ++self->miRATMetrics->mWifiToCell.count;
  v13 = 12;
  if (v9)
    v13 = 16;
  ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v13);
  -[WRM_MetricsService appCountUpdate::](self, "appCountUpdate::", &self->miRATMetrics->mWifiToCell.appType, a4);
  -[WRM_MetricsService mobCountUpdate::](self, "mobCountUpdate::", &self->miRATMetrics->mWifiToCell.mobStatus, v7);
  if ((v6 & 1) != 0)
  {
    ++self->miRATMetrics->mWifiToCell.reason.nBrokenBH_DPD_or_Video;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_9;
  }
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiNotReady;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadSNR;
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadARQ;
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadLoad;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_26;
  }
LABEL_25:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadBrokenBH_SIP_VideoStall;
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x100) == 0)
      goto LABEL_16;
LABEL_27:
    ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadRTP;
    if ((v6 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_26:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom;
  if ((v6 & 0x100) != 0)
    goto LABEL_27;
LABEL_16:
  if ((v6 & 0x200) != 0)
LABEL_17:
    ++self->miRATMetrics->mWifiToCell.reason.nWiFiCellularGood;
LABEL_18:
  -[WRM_MetricsService dumpiRATWifiToCell](self, "dumpiRATWifiToCell");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("=============================================================================="));
}

- (void)updateiRATMetricCellToWifi:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v9;
  const char *v11;
  WRM_HORecordCacheEntry *v12;
  uint64_t v13;
  _BYTE v14[128];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a3;
  -[WRM_MetricsService getReasonStr::](self, "getReasonStr::", *(_QWORD *)&a6, v14);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("========= %s ==== reason 0x%x  ============"), "-[WRM_MetricsService updateiRATMetricCellToWifi::::]", v6);
  v11 = "NO";
  if (v9)
    v11 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("%s: callActive %s app %ld mob %ld reason 0x%x (%s)"), "-[WRM_MetricsService updateiRATMetricCellToWifi::::]", v11, a4, v7, v6, v14);
  v12 = objc_alloc_init(WRM_HORecordCacheEntry);
  -[WRM_HORecordCacheEntry setWithRecord:::::](v12, "setWithRecord:::::", 200, v9, a4, v7, v6);
  -[NSMutableArray addObject:](self->miRATMetrics->mHORecordCache, "addObject:", v12);
  if ((unint64_t)-[NSMutableArray count](self->miRATMetrics->mHORecordCache, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->miRATMetrics->mHORecordCache, "removeObjectAtIndex:", 0);

  ++self->miRATMetrics->mCellToWifi.count;
  v13 = 124;
  if (v9)
    v13 = 128;
  ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v13);
  -[WRM_MetricsService appCountUpdate::](self, "appCountUpdate::", &self->miRATMetrics->mCellToWifi.appType, a4);
  -[WRM_MetricsService mobCountUpdate::](self, "mobCountUpdate::", &self->miRATMetrics->mCellToWifi.mobStatus, v7);
  if ((v6 & 0x10000) != 0)
  {
    ++self->miRATMetrics->mCellToWifi.reason.nWiFiGood;
    if ((v6 & 0x20000) == 0)
    {
LABEL_9:
      if ((v6 & 0x40000) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  ++self->miRATMetrics->mCellToWifi.reason.nCellularNotReady;
  if ((v6 & 0x40000) == 0)
  {
LABEL_10:
    if ((v6 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadSigBar;
  if ((v6 & 0x80000) == 0)
  {
LABEL_11:
    if ((v6 & 0x100000) == 0)
      goto LABEL_12;
LABEL_19:
    ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadRsrp;
    if ((v6 & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_18:
  ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadLQM;
  if ((v6 & 0x100000) != 0)
    goto LABEL_19;
LABEL_12:
  if ((v6 & 0x200000) != 0)
LABEL_13:
    ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadEcio;
LABEL_14:
  -[WRM_MetricsService dumpiRATCellToWifi](self, "dumpiRATCellToWifi");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("=============================================================================="));
}

- (void)dumpiRATCellToWifi
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("C2W Stats: count %d Call [act:%d idl:%d] App [dat:%d vo:%d] Mob [sta:%d wal:%d run:%d veh:%d]"), miRATMetrics->mCellToWifi.count, miRATMetrics->mCellToWifi.callStatus.nCallActive, miRATMetrics->mCellToWifi.callStatus.nCallIdle, miRATMetrics->mCellToWifi.appType.nData, miRATMetrics->mCellToWifi.appType.nIMSVoIP, miRATMetrics->mCellToWifi.mobStatus.nStationary, miRATMetrics->mCellToWifi.mobStatus.nWalking, miRATMetrics->mCellToWifi.mobStatus.nRunning, miRATMetrics->mCellToWifi.mobStatus.nVehicular);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("C2W Stats: reason [wifiGood:%d cell noReady:%d sigBar:%d LQM:%d RSRP:%d ECIO:%d]"), miRATMetrics->mCellToWifi.reason.nWiFiGood, miRATMetrics->mCellToWifi.reason.nCellularNotReady, miRATMetrics->mCellToWifi.reason.nCelluarBadSigBar, miRATMetrics->mCellToWifi.reason.nCelluarBadLQM, miRATMetrics->mCellToWifi.reason.nCelluarBadRsrp, miRATMetrics->mCellToWifi.reason.nCelluarBadEcio);
}

- (void)dumpiRATWifiToCell
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("W2C Stats: count %d Call [act:%d int:%d] App [dat:%d vo:%d] Mob [sta:%d wal:%d run:%d veh:%d]"), miRATMetrics->mWifiToCell.count, miRATMetrics->mWifiToCell.callStatus.nCallActive, miRATMetrics->mWifiToCell.callStatus.nCallIdle, miRATMetrics->mWifiToCell.appType.nData, miRATMetrics->mWifiToCell.appType.nIMSVoIP, miRATMetrics->mWifiToCell.mobStatus.nStationary, miRATMetrics->mWifiToCell.mobStatus.nWalking, miRATMetrics->mWifiToCell.mobStatus.nRunning, miRATMetrics->mWifiToCell.mobStatus.nVehicular);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, CFSTR("W2C Stats: reason [wifi DPD :%d noReady:%d snr:%d rssi:%d arq:%d load:%d bcn:%d sym:%d rtp:%d Cellular Good:%d]"), miRATMetrics->mWifiToCell.reason.nBrokenBH_DPD_or_Video, miRATMetrics->mWifiToCell.reason.nWiFiNotReady, miRATMetrics->mWifiToCell.reason.nWiFiBadSNR, miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI, miRATMetrics->mWifiToCell.reason.nWiFiBadARQ, miRATMetrics->mWifiToCell.reason.nWiFiBadLoad, miRATMetrics->mWifiToCell.reason.nWiFiBadBrokenBH_SIP_VideoStall, miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom, miRATMetrics->mWifiToCell.reason.nWiFiBadRTP, miRATMetrics->mWifiToCell.reason.nWiFiCellularGood);
}

- (void)appCountUpdate:(WRMMetricsAppType *)a3 :(unint64_t)a4
{
  if (a4)
  {
    if (a4 != 1)
      return;
    a3 = (WRMMetricsAppType *)((char *)a3 + 4);
  }
  ++a3->nData;
}

- (void)mobCountUpdate:(WRMMetricsMobilityStatus *)a3 :(int)a4
{
  switch(a4)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 4);
      goto LABEL_5;
    case 2:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 8);
      goto LABEL_5;
    case 3:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 12);
LABEL_5:
      ++a3->nStationary;
      break;
    default:
      return;
  }
}

- (WRMMetriciRATLinkPrefChangeWiFiToCellular)getiRATMetricWiFiToCellular
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
    return &miRATMetrics->mWifiToCell;
  else
    return 0;
}

- (WRMMetriciRATLinkPrefChangeCellularToWiFi)getiRATMetricCellularToWifi
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
    return &miRATMetrics->mCellToWifi;
  else
    return 0;
}

- (WRMMetriciRATLinkPrefInit)getiRATMetricLinkPrefInit
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
    return &miRATMetrics->mLinkInit;
  else
    return 0;
}

- (WRMWiFiCallingEnd)getWRMWiFiCallingEnd
{
  WRM_WiFiCallingMetrics *mWiFiCallingMetrics;

  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics)
    return &mWiFiCallingMetrics->mWifiCallingEnd;
  else
    return 0;
}

- (WRMAntSelPolicyStats)getWRMAntSelPolicyStats
{
  WRM_LTECoexMetrics *mLTECoexMetrics;

  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
    return &mLTECoexMetrics->mAntSelPolicyStats;
  else
    return 0;
}

- (WRMULCACoexStats)getWRMULCACoexStats
{
  WRM_LTECoexMetrics *mLTECoexMetrics;

  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
    return &mLTECoexMetrics->mULCACoexStats;
  else
    return 0;
}

- (WRMMetricsiRATStreaming)getWRMStreaming
{
  WRM_StreamingMetrics *mStreamingMetrics;

  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics)
    return &mStreamingMetrics->mStreaming;
  else
    return 0;
}

- (WRMMetricsiRATFaceTimeHandover)getWRMFaceTimeHandover
{
  WRM_FaceTimeMetrics *mFaceTimeMetrics;

  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics)
    return &mFaceTimeMetrics->mFaceTime;
  else
    return 0;
}

- (WRMPRoximityMetrics)getWRMProximity
{
  WRM_ProximityMetrics *mProximityMetrics;

  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics)
    return &mProximityMetrics->mProximity;
  else
    return 0;
}

- (WRMMetricsiRATDataRecommendation)getStandaloneLinkPreferenceMetrics
{
  WRM_MetricsiRATDataRecommendation *mStandaloneLinkPreferenceMetrics;

  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics)
    return &mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics;
  else
    return 0;
}

- (WRMMetrics5GVersusWiFi)getWRM5GVersusWiFiLinkPreferenceMetrics
{
  WRM_MetricsiRAT5GVersusWiFi *miRAT5GVersusWiFi;

  miRAT5GVersusWiFi = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi)
    return &miRAT5GVersusWiFi->m5GVersusWiFiMetrics;
  else
    return 0;
}

- (id)getiRATMetricHORecordCache
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
    return miRATMetrics->mHORecordCache;
  else
    return 0;
}

- (id)getQueue
{
  return objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue");
}

- (void)resetiRATMetricWiFiToCellular
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
  {
    *(_OWORD *)&miRATMetrics->mWifiToCell.handover.nStatusUpdateDelayBin[2] = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.handover.nHandoverNotPerformed = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.mobStatus.nVehicular = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.appType.nIMSVoIP = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.count = 0u;
  }
}

- (void)resetiRATMetricCellularToWifi
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
  {
    *(_OWORD *)&miRATMetrics->mCellToWifi.handover.nStatusUpdateDelayBin[2] = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.handover.nHandoverNotPerformed = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.reason.nCelluarBadLQM = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.mobStatus.nVehicular = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.appType.nIMSVoIP = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.count = 0u;
  }
}

- (void)resetiRATMetricLinkPrefInit
{
  WRM_iRATMetrics *miRATMetrics;

  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
    miRATMetrics->mLinkInit = 0;
}

- (void)resetWiFiCallingEnd
{
  WRM_WiFiCallingMetrics *mWiFiCallingMetrics;

  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics)
  {
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.ATM_Registration_State = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.session_id = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.iWLAN_Status = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.HO_Bool = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.Latte_Dejitter_Buffer_Underflow = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.LTE_Data_LQM = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.LTE_Tx_Power = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.WiFi_BSSID_Change = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.WiFi_RSSI = 0u;
  }
}

- (void)resetAntSelPolicyStats
{
  WRM_LTECoexMetrics *mLTECoexMetrics;

  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
  {
    *(_DWORD *)&mLTECoexMetrics->mAntSelPolicyStats.IsCoexBand = 0;
    *(_QWORD *)&mLTECoexMetrics->mAntSelPolicyStats.IssueBand = 0;
  }
}

- (void)resetULCACoexStats
{
  WRM_LTECoexMetrics *mLTECoexMetrics;

  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
  {
    mLTECoexMetrics->mULCACoexStats.ULCACriticalCarrierDLBW = 0;
    *(_OWORD *)&mLTECoexMetrics->mULCACoexStats.ULCAPrimaryCarrierDLBW = 0u;
    *(_OWORD *)&mLTECoexMetrics->mULCACoexStats.ULCAHasCoexBand = 0u;
  }
}

- (void)resetStreaming
{
  WRM_StreamingMetrics *mStreamingMetrics;
  WRMMetricsiRATStreaming *p_mStreaming;

  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics)
  {
    *(_OWORD *)&mStreamingMetrics->mStreaming.timestamp = 0u;
    p_mStreaming = &mStreamingMetrics->mStreaming;
    *(_OWORD *)&p_mStreaming->total_configured_mimo_layers = 0u;
    *(_OWORD *)&p_mStreaming->numStall = 0u;
    *(_OWORD *)&p_mStreaming->cellChannelBW = 0u;
    *(_OWORD *)&p_mStreaming->mac_DLCA_configured = 0u;
    *(_OWORD *)&p_mStreaming->cellNsaEnabled = 0u;
    *(_OWORD *)&p_mStreaming->cellLteRSRQ = 0u;
    *(_OWORD *)&p_mStreaming->wifinumberOfSpatialStreams = 0u;
    *(_OWORD *)&p_mStreaming->tcpRTTmin = 0u;
    *(_OWORD *)&p_mStreaming->coldStartTypeCellular = 0u;
    *(_OWORD *)&p_mStreaming->btWiFiCoexState = 0u;
    *(_OWORD *)&p_mStreaming->lqmScoreBT = 0u;
    *(_OWORD *)&p_mStreaming->wifiModelConfidenceLevel = 0u;
    *(_OWORD *)&p_mStreaming->devicePointOfInterest = 0u;
    *(_OWORD *)&p_mStreaming->rrcState = 0u;
    *(_OWORD *)&p_mStreaming->pkgLifeTimeVO = 0u;
    *(_OWORD *)&p_mStreaming->weightedAverageRssi = 0u;
    *(_OWORD *)&p_mStreaming->goodDecisionsCounterVO = 0u;
    *(_OWORD *)&p_mStreaming->invalidDecisionCounter = 0u;
    *(_OWORD *)&p_mStreaming->wifiRssi = 0u;
    *(_OWORD *)&p_mStreaming->StationCount = 0u;
    *(_OWORD *)&p_mStreaming->maxOfActualLowBandwidth = 0u;
    *(_OWORD *)&p_mStreaming->movingAvgHighBandwidth = 0u;
    *(_OWORD *)&p_mStreaming->buffer_interval = 0u;
  }
}

- (void)resetFaceTimeHandover
{
  WRM_FaceTimeMetrics *mFaceTimeMetrics;

  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics)
  {
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.audioErasure = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.cellRsrp = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.signalBar = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.facetimeDelay = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.iRATRecommendationReason = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiTxPER = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.cca = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiRssi = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.timestamp = 0u;
  }
}

- (void)resetProximity
{
  WRM_ProximityMetrics *mProximityMetrics;

  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics)
  {
    *(_OWORD *)&mProximityMetrics->mProximity.btRssi = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.newLinkState = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.ccAssertion = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.timestamp = 0u;
  }
}

- (void)resetStandaloneLinkPreferenceMetrics
{
  WRM_MetricsiRATDataRecommendation *mStandaloneLinkPreferenceMetrics;

  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics)
  {
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.packetLifetimeVIBE = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.decisionVO = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiTxPhyRate = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.bcnPer = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiRssi = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.ratType = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.dataAppStatus = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.motionState = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.voiceLinkPref = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.timestamp = 0u;
  }
}

- (void)reset5GVersusWiFiMetrics
{
  WRM_MetricsiRAT5GVersusWiFi *miRAT5GVersusWiFi;

  miRAT5GVersusWiFi = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi)
  {
    *(_QWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.total_nr_bandwidth = 0;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.radioFrequency = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiRecommendationConfidence = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.highThermalTemperatureNotification = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiWifiEstThoughtputConfidence = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiWghtAVGRXPHYRATE = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiRxRetry = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiCca = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellRrcState = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellNrSNR = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellNrEstimatedThroughput = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellLteRSRQ = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellEstimatedBw = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.timestamp = 0u;
  }
}

- (void)getTelephonyReasonStr:(int)a3 :(char *)a4
{
  char *v4;
  uint64_t i;
  const char *v7;

  v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (i = 0; i != 8; ++i)
    {
      if ((dword_1001FB6B4[i] & a3) != 0)
      {
        v7 = "tMode";
        if (i <= 6)
          v7 = off_100205C40[i];
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

- (void)getOpModeReasonStr:(int)a3 :(char *)a4
{
  char *v4;
  uint64_t i;
  const char *v7;

  v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (i = 0; i != 7; ++i)
    {
      if ((dword_1001FB6D4[i] & a3) != 0)
      {
        v7 = "oMusicLPMAssertion";
        if (i <= 5)
          v7 = off_100205C78[i];
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

@end
