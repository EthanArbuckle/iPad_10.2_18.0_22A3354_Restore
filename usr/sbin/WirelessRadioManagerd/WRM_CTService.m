@implementation WRM_CTService

+ (id)WRM_CTServiceControllerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC5C8;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_1002713F0 != -1)
    dispatch_once(&qword_1002713F0, block);
  return (id)qword_1002713E8;
}

- (WRM_CTService)init
{
  char *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_CTService;
  v2 = -[WRM_CTService init](&v5, "init");
  if (v2)
  {
    *((_QWORD *)v2 + 3) = dispatch_queue_create("com.apple.WirelessRadioManager.CTClient", 0);
    v3 = dispatch_queue_create("com.apple.WirelessRadioManager.CTServerQueue", 0);
    *((_QWORD *)v2 + 1) = 0;
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 4) = v3;
    *((_QWORD *)v2 + 5) = 0;
    *(_QWORD *)(v2 + 45) = 0;
    *(_WORD *)(v2 + 53) = 0;
    *((_QWORD *)v2 + 30) = 10;
    *((_WORD *)v2 + 124) = 0;
    *((_WORD *)v2 + 86) = 0;
    *((_QWORD *)v2 + 7) = 0;
    *((_QWORD *)v2 + 32) = 0;
    *((_QWORD *)v2 + 33) = 0;
    v2[65] = 1;
    *((_DWORD *)v2 + 38) = 0;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *((_QWORD *)v2 + 24) = 0;
    *((_QWORD *)v2 + 25) = 0;
    *((_QWORD *)v2 + 23) = 0;
    *((_WORD *)v2 + 82) = 1;
    v2[166] = 0;
    *((_DWORD *)v2 + 42) = 0;
    *((_DWORD *)v2 + 22) = 1084227584;
    *(_OWORD *)(v2 + 72) = xmmword_1001DEEF0;
    *((_OWORD *)v2 + 13) = 0u;
    *((_OWORD *)v2 + 14) = 0u;
    v2[272] = 1;
    *(_QWORD *)(v2 + 276) = 0;
  }
  return (WRM_CTService *)v2;
}

- (void)dealloc
{
  NSObject *mQueue;
  NSObject *mServerQueue;
  __CTServerConnection *mCoreTelephonyConnection;
  __CTServerConnection *mCTLaunchableConnection;
  objc_super v7;

  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  mServerQueue = self->mServerQueue;
  if (mServerQueue)
  {
    dispatch_release(mServerQueue);
    self->mServerQueue = 0;
  }
  mCoreTelephonyConnection = self->mCoreTelephonyConnection;
  if (mCoreTelephonyConnection)
    CFRelease(mCoreTelephonyConnection);
  mCTLaunchableConnection = self->mCTLaunchableConnection;
  if (mCTLaunchableConnection)
    CFRelease(mCTLaunchableConnection);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("WRM_CTService dealloc"));
  self->mCellularActive = 0;
  *(_WORD *)&self->mDataAttached = 0;
  self->mRoaming = 0;
  self->mServingCellId = 0;
  self->mCoreTelephonyConnection = 0;
  self->mCTLaunchableConnection = 0;
  *(_QWORD *)&self->mServCellRadioTechnologyType = 10;
  *(_QWORD *)&self->mValidRsrpMeasurement = 0;
  self->mCommCenterKeepAliveAssertion = 0;
  self->mCommCenterPDPActiveAssertion = 0;
  self->mMovingAverageSignalBar = 5.0;
  self->mCurrentSignalBars = 5;
  *(_WORD *)&self->mPrevAudioQualityWasGood = 1;
  self->mIMSVoiceOverPSMetricsValid = 0;
  self->mBBLongSessionStatus = 0;
  *(_WORD *)&self->mBBHighPowerState = 0;
  self->mDataEnabled = 1;
  self->mLqm = 0;
  self->mRsrp = 0.0;
  self->mSnr = 0.0;
  self->mRsrq = 0.0;
  *(_OWORD *)&self->mRsrpDelta = 0u;
  *(_OWORD *)&self->mRsrqDelta = 0u;
  *(_OWORD *)&self->mEcio = 0u;
  self->mEcioDelta = 0.0;
  self->mIsSimActive = 1;
  *(_QWORD *)&self->m_CommCenterAssertionRefCount = 0;
  v7.receiver = self;
  v7.super_class = (Class)WRM_CTService;
  -[WRM_CTService dealloc](&v7, "dealloc");
}

- (BOOL)isCommCenterAsserted
{
  return 0;
}

- (__CTServerConnection)configureLaunchableCommCenter
{
  const char *v3;
  CFStringRef v4;
  __CTServerConnection *v5;

  v3 = getprogname();
  v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s-iRAT Manager"), v3);
  v5 = (__CTServerConnection *)_CTServerConnectionCreateAndLaunchWithIdentifier(kCFAllocatorDefault, v4, nullsub_37, 0);
  _CTServerConnectionSetTargetQueue(v5, self->mQueue);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (void)getCurrentCTMetrics:(__CTServerConnection *)a3
{
  unint64_t VoiceLinkQualityMetric;
  unint64_t EnhancedVoiceLinkQualityMetric;
  const __CFString *v7;
  unint64_t RegistrationStatus;
  CFComparisonResult v9;
  const __CFString *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  unint64_t CapabilityStatusExtended;
  _BOOL8 v14;
  const __CFString *v15;
  UInt8 v16;
  CFTypeRef cf;
  char v18;
  CFStringRef theString1;

  v18 = 0;
  cf = 0;
  VoiceLinkQualityMetric = _CTServerConnectionGetVoiceLinkQualityMetric(a3, self->mServerQueue, &stru_100205760);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("_CTServerConnectionGetVoiceLinkQualityMetric: error: %d, domain: %d"), HIDWORD(VoiceLinkQualityMetric), VoiceLinkQualityMetric);
  EnhancedVoiceLinkQualityMetric = _CTServerConnectionGetEnhancedVoiceLinkQualityMetric(a3, &cf);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LQM Blob Pointer: %p, error:%d, domain:%d"), cf, HIDWORD(EnhancedVoiceLinkQualityMetric), EnhancedVoiceLinkQualityMetric);
  if (cf
    && (LOBYTE(theString1) = 0, v16 = 0, sub_1000CC94C((const __CFData *)cf, (UInt8 *)&theString1, &v16)))
  {
    -[WRM_CTService setLteVoiceLQM:](self, "setLteVoiceLQM:", theString1);
    -[WRM_CTService setVoiceLQMReasonCode:](self, "setVoiceLQMReasonCode:", v16);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Did not receive LQM BLOB from CT"));
  }
  sub_1000CD844(0, self, (uint64_t)a3);
  LOBYTE(theString1) = 1;
  if (!a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("iRAT currently not connected to telephony service"));
    v7 = CFSTR("iRAT currently not connected to telephony service");
LABEL_12:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v7);
    goto LABEL_14;
  }
  if (_CTServerConnectionIsDataAttached(a3, &theString1))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Unable to retrieve data attach status"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isDataAttached status: %d"), theString1);
    -[WRM_CTService updatePSAttachStatus:](self, "updatePSAttachStatus:", (_BYTE)theString1 != 0);
  }
  LOBYTE(theString1) = 0;
  if (_CTServerConnectionGetCellularDataIsEnabled(a3, &theString1))
  {
    v7 = CFSTR("Unable to retrieve data enable status");
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isDataEnabled status: %d"), theString1);
  -[WRM_CTService updateDataEnableStatus:](self, "updateDataEnableStatus:", (_BYTE)theString1 != 0);
LABEL_14:
  theString1 = 0;
  RegistrationStatus = _CTServerConnectionGetRegistrationStatus(a3, &theString1);
  if (RegistrationStatus)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("_CTServerConnectionGetRegistrationStatus error %d domain %d"), HIDWORD(RegistrationStatus), RegistrationStatus);
  }
  else
  {
    v9 = CFStringCompare(theString1, kCTRegistrationStatusRegisteredHome, 0);
    v10 = (const __CFString *)kCTRegistrationStatusRegisteredRoaming;
    if (v9)
      v11 = CFStringCompare(theString1, kCTRegistrationStatusRegisteredRoaming, 0) == kCFCompareEqualTo;
    else
      v11 = 1;
    v12 = CFStringCompare(theString1, v10, 0) == kCFCompareEqualTo;
    -[WRM_CTService updateRegistrationStatus::](self, "updateRegistrationStatus::", v11, v12);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("WRM_CTService:_CTServerConnectionGetRegistrationStatus reg status %d, roaming Status %d"), v11, v12);
  }
  sub_1000CD964((uint64_t)a3, self);
  CapabilityStatusExtended = _CTServerConnectionGetCapabilityStatusExtended(a3, kCTCapabilityAgent, &v18, 0);
  if (HIDWORD(CapabilityStatusExtended))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("_CTServerConnectionGetCapabilityStatusExtended: error: %d, domain: %d"), HIDWORD(CapabilityStatusExtended), CapabilityStatusExtended);
    v14 = 0;
    v18 = 0;
  }
  else
  {
    v14 = v18 != 0;
  }
  -[WRM_CTService updateVoLTEEnableStatus:](self, "updateVoLTEEnableStatus:", v14);
  if (v18)
    v15 = CFSTR("_CTServerConnectionGetCapabilityStatusExtended: volteSupported");
  else
    v15 = CFSTR("_CTServerConnectionGetCapabilityStatusExtended: volte not Supported");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v15);
  if (cf)
    CFRelease(cf);
}

- (void)configureCTNotificationCallBacks
{
  const char *v3;
  CFStringRef v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("WRM_CTService:configureCTNotificationCallBacks"));
  v3 = getprogname();
  v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s-iRAT Manager"), v3);
  self->mCoreTelephonyConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, v4, self->mServerQueue, &stru_1002057A0);
  ((void (*)(void))_CTServerConnectionRegisterForNotification)();
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTRegistrationStatusChangedNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTRegistrationDataStatusChangedNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTIndicatorsSignalStrengthNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTRegistrationCellChangedNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTCallStatusChangeNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTCallHandoverLikelyNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTCallHandoverStartedNotification);
  _CTServerConnectionRegisterForNotification(self->mCoreTelephonyConnection, kCTCallHandoverEndedNotification);
  -[WRM_CTService getCurrentCTMetrics:](self, "getCurrentCTMetrics:", self->mCoreTelephonyConnection);
  if (v4)
    CFRelease(v4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("WRM_CTService:configureCTNotificationCallBacks completed"));
}

- (void)tiggerEnhanceLQMConfiguration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE700;
  block[3] = &unk_1002019E8;
  block[4] = self;
  if (qword_1002713F8 != -1)
    dispatch_once(&qword_1002713F8, block);
}

- (BOOL)cellularLinkActive
{
  return self->mCellularActive;
}

- (double)getServingCellRSSI
{
  return self->mRssi;
}

- (double)getServingCellRSRP
{
  if (self->mValidRsrpMeasurement)
    return self->mRsrp;
  else
    return (double)self->mRawFilteredMeasurements;
}

- (double)getServingCellRSRQ
{
  return self->mRsrq;
}

- (double)getServingCellSNR
{
  return self->mSnr;
}

- (double)getServingCellRSCP
{
  return self->mRscp;
}

- (double)getServingCellECIO
{
  return self->mEcio;
}

- (int64_t)getCellularLQM
{
  return self->mLqm;
}

- (int)getLteVoiceLQM
{
  return self->mLTEVoiceLQM;
}

- (double)getServingCellRSSIDelta
{
  return self->mRssiDelta;
}

- (double)getServingCellRSRPDelta
{
  return self->mRsrpDelta;
}

- (double)getServingCellRSRQDelta
{
  return self->mRsrqDelta;
}

- (double)getServingCellSNRDelta
{
  return self->mSnrDelta;
}

- (double)getServingCellRSCPDelta
{
  return self->mRscpDelta;
}

- (double)getServingCellECIODelta
{
  return self->mEcioDelta;
}

- (double)getServingCellFilteredMeasurements
{
  if (self->mValidRsrpMeasurement)
    return self->mRsrp;
  else
    return (double)self->mRawFilteredMeasurements;
}

- (int64_t)getCurrentSignalBars
{
  return self->mCurrentSignalBars;
}

- (__CTServerConnection)getCTConnectionReference
{
  return self->mCoreTelephonyConnection;
}

- (int64_t)getServingCellID
{
  return self->mServingCellId;
}

- (void)setServingCellRSSI:(double)a3
{
  if (self->mValidRssiMeasurement)
  {
    self->mRssiDelta = self->mRssi - a3;
    self->mRssi = a3;
  }
  else
  {
    self->mRssi = a3;
    self->mValidRssiMeasurement = 1;
  }
}

- (void)setServingCellRSRP:(double)a3
{
  if (self->mValidRsrpMeasurement)
  {
    self->mRsrpDelta = self->mRsrp - a3;
    self->mRsrp = a3;
  }
  else
  {
    self->mRsrp = a3;
    self->mValidRsrpMeasurement = 1;
  }
}

- (void)setServingCellRSRQ:(double)a3
{
  if (self->mValidRsrqMeasurement)
  {
    self->mRsrqDelta = self->mRsrq - a3;
    self->mRsrq = a3;
  }
  else
  {
    self->mRsrq = a3;
    self->mValidRsrqMeasurement = 1;
  }
}

- (void)setServingCellSNR:(double)a3
{
  if (self->mValidSnrMeasurement)
  {
    self->mSnrDelta = self->mSnr - a3;
    self->mSnr = a3;
  }
  else
  {
    self->mSnr = a3;
    self->mValidSnrMeasurement = 1;
  }
}

- (void)setServingCellRSCP:(double)a3
{
  if (self->mValidRscpMeasurement)
  {
    self->mRscpDelta = self->mRscp - a3;
    self->mRscp = a3;
  }
  else
  {
    self->mRscp = a3;
    self->mValidRscpMeasurement = 1;
  }
}

- (void)setServingCellECIO:(double)a3
{
  if (self->mValidEcioMeasurement)
  {
    self->mEcioDelta = self->mEcio - a3;
    self->mEcio = a3;
  }
  else
  {
    self->mEcio = a3;
    self->mValidEcioMeasurement = 1;
  }
}

- (void)setCellularLQM:(int)a3
{
  self->mLqm = a3;
  self->mValidLqm = 1;
}

- (BOOL)qmiClientRunning
{
  return self->mQMIClientActive;
}

- (void)setQMIClientStatus:(BOOL)a3
{
  self->mQMIClientActive = a3;
}

- (void)setLteVoiceLQM:(int)a3
{
  if (a3 && (a3 + 2) <= 0x66)
  {
    self->mLTEVoiceLQM = a3;
    self->mValidLTEVoIPLqm = 1;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("setLteVoiceLQM, discarding invalid voiceLQM %d"), *(_QWORD *)&a3);
  }
}

- (void)setVoiceLQMReasonCode:(int)a3
{
  self->mReasongCode = a3;
}

- (void)resetLteVoiceLQM
{
  self->mValidLTEVoIPLqm = 0;
}

- (BOOL)isVoiceLQMValid
{
  return self->mValidLTEVoIPLqm;
}

- (void)updateDataEnableStatus:(BOOL)a3
{
  self->mDataEnabled = a3;
}

- (void)updatePSAttachStatus:(BOOL)a3
{
  self->mDataAttached = a3;
}

- (void)updateRegistrationStatus:(BOOL)a3 :(BOOL)a4
{
  self->mRegistered = a3;
  self->mRoaming = a4;
}

- (BOOL)cellularDataEnabled
{
  return self->mDataEnabled;
}

- (BOOL)dataAttachedWithCellularNetwork
{
  return self->mDataAttached;
}

- (BOOL)registeredWithCellularNetwork
{
  return self->mRegistered;
}

- (BOOL)deviceInRoaming
{
  return self->mRoaming;
}

- (int)getServingCellType
{
  return self->mServCellRadioTechnologyType;
}

- (void)setServingCellType:(int)a3
{
  self->mServCellRadioTechnologyType = a3;
}

- (void)setServingCellFilteredMeasurements:(int64_t)a3
{
  self->mRawFilteredMeasurements = a3;
}

- (void)setCurrentSignalBars:(int64_t)a3
{
  if (a3)
  {
    self->mCurrentSignalBars = a3;
  }
  else
  {
    self->mCurrentSignalBars = 5;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Ignorning signal bar: %d"), 0);
  }
}

- (BOOL)isSrvccHandoverInProgress
{
  return self->mServCellRadioTechnologyType == 1 && self->mSrvccHandoverStarted;
}

- (void)setSrvccHandoverState:(BOOL)a3
{
  self->mSrvccHandoverStarted = a3;
}

- (int)getCallState
{
  return self->mCallStatus;
}

- (void)setCallState:(int)a3
{
  self->mCallStatus = a3;
}

- (BOOL)isCallInConference
{
  return self->mCallInConference;
}

- (void)setCallInConference:(BOOL)a3
{
  self->mCallInConference = a3;
}

- (BOOL)isCallOnHold
{
  return self->mCallOnHold;
}

- (void)setCallOnHold:(BOOL)a3
{
  self->mCallOnHold = a3;
}

- (void)updateVoLTEEnableStatus:(BOOL)a3
{
  self->mVoLTESupported = a3;
}

- (BOOL)isVoLTESupported
{
  return self->mVoLTESupported;
}

- (void)setSimState:(BOOL)a3
{
  self->mIsSimActive = a3;
}

- (BOOL)isSimActive
{
  return self->mIsSimActive;
}

- (void)invalidateAudioQualityMetrics
{
  self->mPrevAudioQualityWasGood = 1;
}

- (void)updateAudioQuality:(id)a3
{
  _BOOL8 v4;

  v4 = (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001) < 80.0 || a3.var1 < 0x1F5;
  self->mPrevAudioQualityWasGood = v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d"), *(_QWORD *)&a3.var2, *(_QWORD *)&a3.var0, a3.var1, (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001), *(_QWORD *)&self->mRscp, *(_QWORD *)&self->mEcio, v4);
}

- (void)updateAudioQualityKaroo:(id *)a3
{
  uint64_t var0;
  uint64_t var1;
  _BOOL8 v6;

  var0 = a3->var0;
  var1 = a3->var1;
  v6 = (double)(100 * var0) / ((double)var1 + 0.000001) < 80.0 || var1 < 0x1F5;
  self->mPrevAudioQualityWasGood = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d"), a3->var2, var0, var1, (double)(100 * var0) / ((double)var1 + 0.000001), *(_QWORD *)&self->mRscp, *(_QWORD *)&self->mEcio, v6);
}

- (BOOL)isAudioQualityGood
{
  return self->mPrevAudioQualityWasGood;
}

- (void)setIMSPreference:(BOOL)a3
{
  self->mIMSVoiceOverPSMetricsValid = 1;
  self->mIMSVoiceOverPSSupported = a3;
}

- (BOOL)isIMSPreferenceEnabled
{
  return !self->mIMSVoiceOverPSMetricsValid || self->mIMSVoiceOverPSSupported;
}

- (void)updateBBLongSessionState:(int)a3
{
  self->mBBLongSessionStatus = a3;
}

- (int)getBBLongSessionState
{
  return self->mBBLongSessionStatus;
}

- (float)getCurrentMovAvgSignalBars
{
  return self->mMovingAverageSignalBar;
}

- (void)initMovAverageOfSignalBar
{
  self->mMovingAverageSignalBar = (float)self->mCurrentSignalBars;
}

- (void)resetMovAverageOfSignalBar
{
  self->mMovingAverageSignalBar = 5.0;
}

- (void)updateMovAverageOfSignalBar
{
  int64_t mCurrentSignalBars;
  float v3;

  mCurrentSignalBars = self->mCurrentSignalBars;
  v3 = (float)((float)mCurrentSignalBars + (float)(self->mMovingAverageSignalBar * 23.0)) / 24.0;
  self->mMovingAverageSignalBar = v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Sampled Moving Average: %f, CurrentSignal Bars:%d"), v3, mCurrentSignalBars);
}

- (void)updateBBHighPowerState:(BOOL)a3
{
  self->mBBHighPowerState = a3;
}

- (BOOL)isBBHighPowerState
{
  return self->mBBHighPowerState;
}

- (void)updateBBLimitedServiceState:(BOOL)a3
{
  self->mBBinTrueLimitedService = a3;
}

- (BOOL)isBBinLimitedService
{
  return self->mBBinTrueLimitedService;
}

- (BOOL)checkIfServingCellNonLTE
{
  return self->mServCellRadioTechnologyType != 1;
}

- (int)getRRCState
{
  return 0;
}

- (void)setNrRSRP:(double)a3
{
  self->mNrRsrp = a3;
}

- (void)setNrSNR:(double)a3
{
  self->mNrSnr = a3;
}

- (void)setNrRSRQ:(double)a3
{
  self->mNrRsrq = a3;
}

- (double)getNrRSRP
{
  return self->mNrRsrp;
}

- (double)getNrRSRQ
{
  return self->mNrRsrq;
}

- (double)getNrSNR
{
  return self->mNrSnr;
}

- (char)getDataSlotLoad
{
  return 0;
}

- (int)getCTDataIndictor
{
  return 0;
}

- (double)getCurrentAudioErasure
{
  return 0.0;
}

- (double)getMeasureBWDataSlot
{
  return 0.0;
}

- (int)getUARFCNDataSlot
{
  return 0;
}

- (int)getBandInfoDataSlot
{
  return 0;
}

- (int)getBandWidthDataSlot
{
  return 0;
}

- (int)getBandInfoOnSlot:(int64_t)a3
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedAnySlot
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedSlot1
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedSlot2
{
  return 0;
}

@end
