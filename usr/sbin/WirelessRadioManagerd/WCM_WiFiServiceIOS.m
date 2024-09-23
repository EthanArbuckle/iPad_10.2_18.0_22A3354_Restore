@implementation WCM_WiFiServiceIOS

- (BOOL)isWiFiNetworkCaptive
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006224;
  v4[3] = &unk_100201BE0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isWiFiPrimaryInterface
{
  unsigned int v3;
  BOOL v4;

  v3 = objc_msgSend(-[NWPathEvaluator path](self->mWiFiPathEvaluator, "path"), "usesInterfaceType:", 1);
  v4 = v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("isWiFiPrimaryInterface %d, path: %x"), v3, self->mWiFiPathEvaluator);
  return v4;
}

- (int)getPhyMode
{
  __WiFiDeviceClient *mWifiDevice;
  uint64_t v3;
  const void *v4;
  uint64_t PhyMode;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  mWifiDevice = self->mWifiDevice;
  if (!mWifiDevice)
  {
    v11 = CFSTR("WiFiS: device not attached");
    v12 = 0;
LABEL_21:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v12, v11);
    return 0;
  }
  v3 = WiFiDeviceClientCopyCurrentNetwork(mWifiDevice, a2);
  if (!v3)
  {
    v11 = CFSTR("WiFiS: not associated to network");
    v12 = 2;
    goto LABEL_21;
  }
  v4 = (const void *)v3;
  PhyMode = WiFiNetworkGetPhyMode();
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiNetworkGetPhyMode is 0x%x"), PhyMode);
  if ((PhyMode & 4) != 0)
    v6 = 2;
  else
    v6 = (PhyMode & 0x22) != 0;
  if ((PhyMode & 0x48) != 0)
    v7 = 3;
  else
    v7 = v6;
  if ((PhyMode & 0x10) != 0)
    v8 = 4;
  else
    v8 = v7;
  if ((PhyMode & 0x80) != 0)
    v9 = 5;
  else
    v9 = v8;
  if ((PhyMode & 0x100) != 0)
    v10 = 6;
  else
    v10 = v9;
  CFRelease(v4);
  return v10;
}

- (BOOL)isSlowWiFi
{
  return self->mWifiBand == 2 || self->mBandwidthMHz < 0x28;
}

- (void)updatePointOfInterest:(int)a3
{
  self->mWiFiPointOfInterest = a3;
}

- (void)updateLQMReceived
{
  self->mLQMRecevied = 1;
}

- (void)setWifiBTeSCOHidStatus:(int)a3 andUseCase:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017F40;
  v4[3] = &unk_100201BB8;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)setWiFiLinkUP
{
  self->mWiFiLinkUP = 1;
}

- (void)setCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4
{
  WCM_WiFiDelegate *mDelegate;

  mDelegate = self->super.mDelegate;
  if (mDelegate)
    -[WCM_WiFiDelegate updateCatsState:bitmap:](mDelegate, "updateCatsState:bitmap:", a3, a4);
}

- (int)sendMessage:(void *)a3 withValue:(void *)a4
{
  const __CFString *v8;
  uint64_t v9;

  if ((objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "coexSupported") & 1) != 0)
  {
    if (self->mWifiDevice)
    {
      if (self->mWifiDevicePowerState)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: send WiFi message (%@)"), a3);
        return WiFiDeviceClientSetCoexParameters(self->mWifiDevice, a3, a4);
      }
      v8 = CFSTR("WiFiS: not send message as device power off");
    }
    else
    {
      v8 = CFSTR("WiFiS: not send message as device not attached");
    }
    v9 = 2;
  }
  else
  {
    v8 = CFSTR("WiFiS: not send message as LTE Coex is not enabled");
    v9 = 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v9, v8);
  return -3902;
}

- (unsigned)getChannelType
{
  return self->mWifiBand;
}

- (WCM_WiFiServiceIOS)init
{
  WCM_WiFiServiceIOS *v2;
  WCM_WiFiServiceIOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_WiFiServiceIOS;
  v2 = -[WCM_WiFiService init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->mWifiDevice = 0;
    v2->mWifiManager = 0;
    v2->mLQMRecevied = 0;
    v2->mAWDLInProgress = 0;
    v2->mP2pRCU2CoexEventInProgress = 0;
    v2->mCarPlaySessionInProgress = 0;
    v2->mCarPlayBTScanRelaxReason = 4;
    v2->mLeastCongestedChannel = 0;
    v2->mLeastCongestedChannelCount = 0;
    v2->mWiFiDeviceReset = 0;
    v2->mWifiDevicePowerState = 0;
    v2->mWiFiLinkUP = 0;
    v2->mWiFiPathEvaluator = (NWPathEvaluator *)objc_msgSend(objc_alloc((Class)NWPathEvaluator), "initWithEndpoint:parameters:", 0, 0);
    v3->mWifiBand = 0;
    v3->mBandwidthMHz = 0;
  }
  return v3;
}

- (void)dealloc
{
  NWPathEvaluator *mWiFiPathEvaluator;
  objc_super v4;

  mWiFiPathEvaluator = self->mWiFiPathEvaluator;
  if (mWiFiPathEvaluator)
  {

    self->mWiFiPathEvaluator = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_WiFiServiceIOS;
  -[WCM_WiFiService dealloc](&v4, "dealloc");
}

- (void)registerWiFiCallbacks
{
  __WiFiManagerClient *mWifiManager;
  CFRunLoopRef Main;
  __WiFiManagerClient *v5;
  __WiFiManagerClient *v6;
  CFRunLoopRef v7;
  const __CFArray *v8;
  const __CFArray *v9;
  const __CFString *v10;

  if (self->mWifiManager)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: mWifiManager was not releaed previously"));
    mWifiManager = self->mWifiManager;
    Main = CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop(mWifiManager, Main, kCFRunLoopDefaultMode);
    CFRelease(self->mWifiManager);
  }
  v5 = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  self->mWifiManager = v5;
  if (!v5)
  {
    v10 = CFSTR("WiFiS: failed to create WiFi manager client");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v10);
    return;
  }
  v6 = v5;
  v7 = CFRunLoopGetMain();
  WiFiManagerClientScheduleWithRunLoop(v6, v7, kCFRunLoopDefaultMode);
  WiFiManagerClientRegisterWowStateChangedCallback(self->mWifiManager, sub_1000D61E8, self);
  WiFiManagerClientRegisterDeviceAttachmentCallback(self->mWifiManager, sub_1000D6238, self);
  v8 = (const __CFArray *)WiFiManagerClientCopyDevices(self->mWifiManager);
  if (!v8)
  {
    self->mWifiDevicePowerState = 0;
    v10 = CFSTR("WiFiS: there is no device attached");
    goto LABEL_9;
  }
  v9 = v8;
  if (CFArrayGetCount(v8))
  {
    -[WCM_WiFiServiceIOS setWiFiDevice:](self, "setWiFiDevice:", CFArrayGetValueAtIndex(v9, 0));
  }
  else
  {
    self->mWifiDevicePowerState = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: there is no device attached"));
  }
  CFRelease(v9);
}

- (void)unregisterWiFiCallbacks
{
  __WiFiManagerClient *mWifiManager;
  CFRunLoopRef Main;

  if (self->mWifiDevice)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: unregister device callbacks and release the device"));
    WiFiDeviceClientRegisterDeviceAvailableCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterExtendedLinkCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterHostApStateChangedCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterLQMCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterWeightAvgLQMCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterBTCoexStatsCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterBssidChangeCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterCatsUpdateCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterScanUpdateCallback(self->mWifiDevice, 0, 0, 0);
    WiFiDeviceClientRegisterResumeScanCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterBgScanSuspendResumeCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterBSPEventCallback(self->mWifiDevice, 0, 0);
    WiFiDeviceClientRegisterUCMEventCallback(self->mWifiDevice, 0, 0);
    CFRelease(self->mWifiDevice);
    self->mWifiDevice = 0;
    self->super.m_lqmRefCount = 0;
    self->mLQMRecevied = 0;
  }
  if (self->mWifiManager)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: unregister manager callbacks and release the manager"));
    WiFiManagerClientRegisterWowStateChangedCallback(self->mWifiManager, 0, 0);
    WiFiManagerClientRegisterDeviceAttachmentCallback(self->mWifiManager, 0, 0);
    mWifiManager = self->mWifiManager;
    Main = CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop(mWifiManager, Main, kCFRunLoopDefaultMode);
    CFRelease(self->mWifiManager);
    self->mWifiManager = 0;
  }
}

- (BOOL)setLQMReportInterval:(int)a3
{
  __WiFiManagerClient *mWifiManager;
  uint64_t v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const void *ValueAtIndex;
  uint64_t v8;

  mWifiManager = self->mWifiManager;
  if (mWifiManager)
  {
    v4 = *(_QWORD *)&a3;
    v5 = (const __CFArray *)WiFiManagerClientCopyDevices(mWifiManager);
    if (v5)
    {
      v6 = v5;
      if (CFArrayGetCount(v5))
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, 0);
        v8 = WiFiDeviceClientSetLQMEventInterval(ValueAtIndex, v4);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("setLQMReportInterval: success, LQM report interval: %d,result: %d "), v4, v8);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("setLQMReportInterval: failed, LQM report interval: %d"), v4);
        LODWORD(v8) = -1;
      }
      CFRelease(v6);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("setLQMReportInterval: failed, LQM report interval: %d"), v4);
      LODWORD(v8) = -1;
    }
    return (int)v8 >= 0;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("setLQMReportInterval: failed, null pointer"));
    return 0;
  }
}

- (BOOL)isAssociated
{
  __WiFiDeviceClient *mWifiDevice;
  const void *v3;
  const __CFString *v5;
  uint64_t v6;

  mWifiDevice = self->mWifiDevice;
  if (mWifiDevice)
  {
    v3 = (const void *)WiFiDeviceClientCopyCurrentNetwork(mWifiDevice, a2);
    if (v3)
    {
      CFRelease(v3);
      return 1;
    }
    v5 = CFSTR("WiFiS: not associated to network");
    v6 = 2;
  }
  else
  {
    v5 = CFSTR("WiFiS: device not attached");
    v6 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v6, v5);
  return 0;
}

- (BOOL)isWiFiConnected
{
  return self->mWiFiLinkUP;
}

- (BOOL)isCoPresenceInProgress
{
  return ((unint64_t)objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController"), "catsAppBitmap") >> 6) & 1;
}

- (void)setChannelsToBlocklist:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D6668;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D6840;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2V2:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D6A18;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7;
  id v8;
  _QWORD block[7];

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6F0C;
  block[3] = &unk_100201EB0;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToEnableType7MSG:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D7884;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D7CBC;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7;
  id v8;
  _QWORD block[7];

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7ED4;
  block[3] = &unk_100201EB0;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToDisableOCL:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D884C;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7;
  id v8;
  _QWORD block[7];

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8A58;
  block[3] = &unk_100201EB0;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setRxPriorityThreshold:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D93D0;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSChannelParameters:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9494;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSFrameConfig:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9558;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSSignalingConfig:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9634;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setRxAntennaPreference:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9710;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setTxAntennaPreference:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D97DC;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaCellPolicy:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D98A8;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelection:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9974;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelectionV2:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9A38;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9AFC;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsForCellularScanProtectionWithMode:(id)a3 indexArrayForScanThrottling:(id)a4
{
  id v7;
  id v8;
  _QWORD block[7];

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9BF4;
  block[3] = &unk_100201EB0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsForCellularScanProtectionWiFiEnh:(id)a3 wiFiEnhChannels:(id)a4 indexArrayForScanThrottling:(id)a5
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[8];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DA604;
  v12[3] = &unk_100205950;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)setChannelConfigurationForConditionId:(unsigned int)a3 enable2G:(BOOL)a4 enable5G:(BOOL)a5 enable6G:(BOOL)a6 wifi_channel_lower:(unsigned int)a7 wifi_channel_upper:(unsigned int)a8
{
  _QWORD block[5];
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBB9C;
  block[3] = &unk_100205978;
  v9 = a3;
  v10 = a7;
  v11 = a8;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToEnablerFemModeWiFiEnh:(BOOL)a3 enable5G:(BOOL)a4 enable6G:(BOOL)a5 setDefaultForall:(BOOL)a6
{
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DC8EC;
  v6[3] = &unk_1002026C0;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableAssocProtectionModeWiFiEnh
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DCF64;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setMaxDurationForCellularScanProtection:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DD4A0;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsForTimeSharingMode:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DD564;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setRxProtectMode:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DD65C;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setRxProtectAutoModeParamWeight:(id)a3 andThresh:(id)a4
{
  id v7;
  id v8;
  _QWORD block[7];

  if (a3)
  {
    if (a4)
    {
      v7 = a3;
      v8 = a4;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000DD73C;
      block[3] = &unk_100201EB0;
      block[4] = a3;
      block[5] = a4;
      block[6] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setTxOnIndication:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DD874;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setScanJoinRxProtectDuration:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DD938;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setCellularFrequencyConfig:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDA0C;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnableEnvelopeIndicationFor2G:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDAD4;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnvelopeIndicationTimerFor2G:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDB9C;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnableAgcCoexMode:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DDC60;
  v6[3] = &unk_100201B18;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setLAACoexConfigEnableTxInd
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDD10;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setLAACoexConfigWci2TxDurationThreshold:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDDF8;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setLAACoexConfigScanThrottleMask:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDEC0;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setLAACoexConfigWifiDwellTime:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DDF88;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setHPovrLEscanGrantDuration:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: Setting HPovrLEscanGrantDuration to %lu"), *(_QWORD *)&a3);
  -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", CFSTR("MWS_LE_NORM_SCAN_GRANT_DUR"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
}

- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v11 = "off";
  if (a3)
    v11 = "on";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiS: Setting critical wifi traffic to %s for %llu"), v11, *(_QWORD *)&a6);
  v13[0] = CFSTR("APPLE80211KEY_MWS_WIFI_CRITICAL");
  v14[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9);
  v13[1] = CFSTR("APPLE80211KEY_MWS_WIFI_CRITICAL_TYPE");
  if (a6 == 31)
    v12 = 2;
  else
    v12 = 1;
  v14[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12);
  v13[2] = CFSTR("APPLE80211KEY_MWS_WIFI_CRITICAL_DURATION");
  v14[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8);
  v13[3] = CFSTR("APPLE80211KEY_MWS_WIFI_CRITICAL_RESERVED");
  v14[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v7);
  -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", CFSTR("APPLE80211KEY_MWS_WIFI_CRITICAL_PARAM"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
}

- (void)setWiFiBTULOFDMAstate:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DE1EC;
  v3[3] = &unk_100201E38;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU1ULOFDMAstate:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DE2B4;
  v3[3] = &unk_100201E38;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU2ULOFDMAstate:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DE37C;
  v3[3] = &unk_100201E38;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6
{
  id v11;
  id v12;
  _QWORD v13[7];
  BOOL v14;
  BOOL v15;

  if (a5)
  {
    if (a6)
    {
      v11 = a5;
      v12 = a6;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000DE488;
      v13[3] = &unk_1002059A0;
      v14 = a3;
      v15 = a4;
      v13[4] = a5;
      v13[5] = a6;
      v13[6] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)setWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: Update WiFi LEConn params"));
  v13[0] = CFSTR("MWS_LE_SCAN_EN");
  v14[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11);
  v13[1] = CFSTR("MWS_LE_SCAN_PEAK");
  v14[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
  v13[2] = CFSTR("MWS_LE_SCAN_DUR");
  v14[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9);
  v13[3] = CFSTR("MWS_LE_SCAN_DC");
  v14[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8);
  v13[4] = CFSTR("MWS_LE_SCAN_REASON");
  v14[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7);
  -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", CFSTR("MWS_LE_SCAN_PARAM_INFO"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
}

- (void)setWiFiRCU2CoexMode:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DE744;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWiFiRCU2PMProtectionMode:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DE80C;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWiFiRCU2TimingArray:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DE8D4;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWifiBTeSCOStatus:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DE9CC;
  v3[3] = &unk_1002026C0;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWifiBTA2DPStatus:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DEA90;
  v3[3] = &unk_1002026C0;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWifiBTA2DPLLAStatus:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DEB54;
  v3[3] = &unk_1002026C0;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setBTConnectionReport:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DEC2C;
    v6[3] = &unk_100201B18;
    v6[4] = a3;
    v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setRCU2CoexParams:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = a3;
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000DEE38;
      v6[3] = &unk_100201B18;
      v6[4] = a3;
      v6[5] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    }
  }
}

- (void)enableLQMUpdate
{
  __WiFiDeviceClient *mWifiDevice;
  __WiFiDeviceClient *v4;
  const char *v5;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: enableLQMUpdate. %d"), self->super.m_lqmRefCount);
  if (self->super.m_lqmRefCount)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: not registering to WiFi manager because LQM is already registered.\n"));
    ++self->super.m_lqmRefCount;
  }
  else
  {
    mWifiDevice = self->mWifiDevice;
    if (mWifiDevice)
    {
      WiFiDeviceClientRegisterLQMCallback(mWifiDevice, sub_10000CD54, self);
      WiFiDeviceClientRegisterWeightAvgLQMCallback(self->mWifiDevice, sub_10000A25C, self);
      self->super.m_lqmRefCount = 1;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: Client: WiFiDeviceClientRegisterLQMCallback.ref count %d"), 1);
      v4 = self->mWifiDevice;
    }
    else
    {
      v4 = 0;
    }
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("WiFiS: Register Wifi LQM. result=%s mWiFiDevice=%p context=%p"), v5, v4, self);
  }
}

- (void)disableLQMUpdate
{
  int m_lqmRefCount;
  BOOL v4;
  __WiFiDeviceClient *mWifiDevice;
  __WiFiDeviceClient *v6;
  const char *v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: disableLQMUpdate. %d"), self->super.m_lqmRefCount);
  m_lqmRefCount = self->super.m_lqmRefCount;
  v4 = __OFSUB__(m_lqmRefCount--, 1);
  self->super.m_lqmRefCount = m_lqmRefCount;
  if ((m_lqmRefCount < 0) ^ v4 | (m_lqmRefCount == 0))
  {
    mWifiDevice = self->mWifiDevice;
    if (mWifiDevice)
    {
      WiFiDeviceClientRegisterLQMCallback(mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterWeightAvgLQMCallback(self->mWifiDevice, 0, 0);
      self->super.m_lqmRefCount = 0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: Client: WiFiDeviceClientRegisterLQMCallback.ref count %d"), 0);
      v6 = self->mWifiDevice;
    }
    else
    {
      v6 = 0;
    }
    v7 = "YES";
    if (!v6)
      v7 = "NO";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("WiFiS: Unregister Wifi LQM. result=%s mWiFiDevice=%p context=%p"), v7, v6, self);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WiFiS: Not de-registering LQM from WiFi Manager becuase reference count is non zero"));
  }
}

- (void)setWiFiDevice:(__WiFiDeviceClient *)a3
{
  int Power;
  const char *v6;

  if (a3)
  {
    if (self->mWifiDevice)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: unregister device callbacks and release the existing device"));
      WiFiDeviceClientRegisterDeviceAvailableCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterExtendedLinkCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterHostApStateChangedCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterLQMCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterCatsUpdateCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterScanUpdateCallback(self->mWifiDevice, 0, 0, 0);
      WiFiDeviceClientRegisterResumeScanCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterBgScanSuspendResumeCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterWeightAvgLQMCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterBTCoexStatsCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterBSPEventCallback(self->mWifiDevice, 0, 0);
      WiFiDeviceClientRegisterUCMEventCallback(self->mWifiDevice, 0, 0);
      CFRelease(self->mWifiDevice);
      self->mWifiDevice = 0;
    }
    self->mWifiDevice = (__WiFiDeviceClient *)CFRetain(a3);
    Power = WiFiDeviceClientGetPower();
    self->mWifiDevicePowerState = Power != 0;
    v6 = "off";
    if (Power)
      v6 = "on";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiS: device power %s"), v6);
    -[WCM_WiFiDelegate updatePowerState:](self->super.mDelegate, "updatePowerState:", self->mWifiDevicePowerState);
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("CellularNeedWiFiStatus")))
    {
      objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
      -[WCM_WiFiDelegate updateTxPowerCapForHead:forBody:](self->super.mDelegate, "updateTxPowerCapForHead:forBody:", 14, 14);
    }
    if (self->mWifiDevicePowerState)
      -[WCM_WiFiServiceIOS checkWiFiState](self, "checkWiFiState");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: register device callbacks"));
    WiFiDeviceClientRegisterDeviceAvailableCallback(self->mWifiDevice, sub_1000DF50C, self);
    WiFiDeviceClientRegisterExtendedLinkCallback(self->mWifiDevice, sub_1000DF628, self);
    WiFiDeviceClientRegisterHostApStateChangedCallback(self->mWifiDevice, sub_1000DF674, self);
    WiFiDeviceClientRegisterBssidChangeCallback(self->mWifiDevice, sub_1000DF75C, self);
    WiFiDeviceClientRegisterCatsUpdateCallback(self->mWifiDevice, sub_10000C80C, self);
    WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(self->mWifiDevice, sub_1000DF7C4, self);
    WiFiDeviceClientRegisterScanUpdateCallback(self->mWifiDevice, nullsub_2, 1, self);
    WiFiDeviceClientRegisterResumeScanCallback(self->mWifiDevice, nullsub_38, self);
    WiFiDeviceClientRegisterBgScanSuspendResumeCallback(self->mWifiDevice, nullsub_39, self);
    WiFiDeviceClientRegisterLQMCallback(self->mWifiDevice, sub_10000CD54, self);
    WiFiDeviceClientRegisterWeightAvgLQMCallback(self->mWifiDevice, sub_10000A25C, self);
    ++self->super.m_lqmRefCount;
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
    {
      if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "needWiFiLQM"))
      {
        self->super.m_lqmRefCount = 0;
        -[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
      }
      if (objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "needWiFiLQM"))-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
      if (objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "needWiFiLQM"))-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
      if (objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "needWiFiLQM"))-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
    }
    WiFiDeviceClientRegisterBTCoexStatsCallback(self->mWifiDevice, sub_1000DF8E8, self);
    WiFiDeviceClientRegisterBSPEventCallback(self->mWifiDevice, sub_1000DFAB4, self);
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "handleWiFiStatusUpdateEvent:", self->mWifiDevicePowerState);
    WiFiDeviceClientRegisterUCMEventCallback(self->mWifiDevice, sub_1000E0118, self);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: setWiFiDevice: device is NULL"));
  }
}

- (void)processWifiDeviceExtendedLinkEvent:(__CFDictionary *)a3
{
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  __WiFiDeviceClient *mWifiDevice;
  uint64_t v13;
  const void *v14;
  const __CFNumber *NetworkChannel;
  void *Property;
  const __CFNumber *v17;
  const __CFNumber *v18;
  xpc_object_t v19;
  void *v20;
  xpc_object_t v21;
  int64_t valuePtr;
  int value;
  unsigned __int8 value_7;
  xpc_object_t values;
  xpc_object_t v26;
  char *keys[2];

  value_7 = 0;
  if (a3)
  {
    v5 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("LINK_CHANGED_IS_LINKDOWN"));
    CFNumberGetValue(v5, kCFNumberCharType, &value_7);
    if (value_7)
    {
      LOBYTE(value) = 0;
      LODWORD(keys[0]) = 0;
      LODWORD(values) = 0;
      v6 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("LINKDOWN_IS_INVOL"));
      CFNumberGetValue(v6, kCFNumberCharType, &value);
      v7 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("LINKDOWN_REASON_CODE"));
      CFNumberGetValue(v7, kCFNumberSInt32Type, keys);
      v8 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("LINKDOWN_SUBREASON_CODE"));
      CFNumberGetValue(v8, kCFNumberSInt32Type, &values);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiS: WiFi linkdown: Invol=%d, Reason=%d, Subreason=%d"), value, LODWORD(keys[0]), values);
      if ((_BYTE)value)
        -[WCM_WiFiDelegate reportWiFiError](self->super.mDelegate, "reportWiFiError");
      -[WCM_WiFiDelegate updateWiFiState:channel:centerFreq:bandwidth:hostAp:](self->super.mDelegate, "updateWiFiState:channel:centerFreq:bandwidth:hostAp:", 0, 0, 0, 0, 0);
    }
    else
    {
      -[WCM_WiFiServiceIOS checkWiFiState](self, "checkWiFiState");
    }
  }
  if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
  {
    if (value_7)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFiS: send WiFi linkdown status to iRAT managers"));
      v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v10, "kWRM_WiFi_LINK_STATUS", value_7);
      *(_OWORD *)keys = *(_OWORD *)off_100205A20;
      values = xpc_uint64_create(0x67uLL);
      v26 = v10;
      v11 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v11);
      objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", v11);
      objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", v11);
      objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", v11);
      self->mWiFiLinkUP = 0;
      xpc_release(values);
      xpc_release(v11);
      xpc_release(v10);
      return;
    }
    value = 0;
    mWifiDevice = self->mWifiDevice;
    if (mWifiDevice)
    {
      v13 = WiFiDeviceClientCopyCurrentNetwork(mWifiDevice, v9);
      if (v13)
      {
        v14 = (const void *)v13;
        NetworkChannel = (const __CFNumber *)WiFiGetNetworkChannel();
        CFNumberGetValue(NetworkChannel, kCFNumberIntType, &value);
        if (WiFiNetworkGetProperty(v14, CFSTR("AP_MODE"))
          || WiFiNetworkGetProperty(v14, CFSTR("CHANNEL"))
          || WiFiNetworkGetProperty(v14, CFSTR("SSID_STR")))
        {
          if (WiFiNetworkGetProperty(v14, CFSTR("AP_MODE")))
          {
            if (WiFiNetworkGetProperty(v14, CFSTR("CHANNEL")))
              CFNumberGetValue(NetworkChannel, kCFNumberIntType, &value);
            Property = (void *)WiFiNetworkGetProperty(v14, CFSTR("SSID_STR"));
            if (Property)
              goto LABEL_20;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: WiFi network has invalid SSID"));
          }
LABEL_32:
          CFRelease(v14);
          return;
        }
        Property = 0;
LABEL_20:
        valuePtr = 0xFFFFFDA8FFFFFDA8;
        v17 = (const __CFNumber *)WiFiNetworkGetProperty(v14, CFSTR("RSSI"));
        if (v17)
          CFNumberGetValue(v17, kCFNumberIntType, (char *)&valuePtr + 4);
        v18 = (const __CFNumber *)WiFiNetworkGetProperty(v14, CFSTR("SNR"));
        if (v18)
          CFNumberGetValue(v18, kCFNumberIntType, &valuePtr);
        if ((valuePtr & 0x8000000000000000) == 0)
          valuePtr = 0xFFFFFDA8FFFFFDA8;
        self->mWiFiLinkUP = 1;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiS: send WiFi linkup status to Handover Manager"));
        v19 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v19, "kWRM_WiFi_LINK_STATUS", 0);
        xpc_dictionary_set_int64(v19, "kWRM_CONNECTED_CHANNEL_ID", value);
        xpc_dictionary_set_int64(v19, "kWRMM_WiFi_SNR", (int)valuePtr);
        xpc_dictionary_set_int64(v19, "kWRMM_WiFi_RSSI", SHIDWORD(valuePtr));
        if (Property)
          xpc_dictionary_set_string(v19, "kWRM_CONNECTED_AP_SSID", (const char *)objc_msgSend(Property, "UTF8String"));
        v20 = (void *)WiFiNetworkGetProperty(v14, CFSTR("BSSID"));
        if (v20)
          xpc_dictionary_set_string(v19, "kWRM_CONNECTED_AP_BSSID", (const char *)objc_msgSend(v20, "UTF8String"));
        *(_OWORD *)keys = *(_OWORD *)off_100205A20;
        values = xpc_uint64_create(0x67uLL);
        v26 = v19;
        v21 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v21);
        objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", v21);
        xpc_release(values);
        xpc_release(v21);
        xpc_release(v19);
        goto LABEL_32;
      }
    }
  }
}

- (void)notifyWiFiStateChange:(BOOL)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t object[2];
  char *keys[2];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "kWRM_is5G", a3);
  *(_OWORD *)keys = *(_OWORD *)off_100205A20;
  object[0] = xpc_uint64_create(0x6DuLL);
  object[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v5);
  xpc_release(object[0]);
  xpc_release(v5);
  xpc_release(v4);
}

- (void)checkWiFiState
{
  __WiFiDeviceClient *mWifiDevice;
  uint64_t v4;
  const void *v5;
  const __CFNumber *Channel;
  int OperatingBand;
  BOOL v8;
  uint64_t v9;
  uint64_t ChannelWidthInMHz;
  const __CFString *v11;
  int v12;
  unsigned int v13;
  double v14;
  WCM_WiFiDelegate *mDelegate;
  unsigned int valuePtr;

  valuePtr = 0;
  mWifiDevice = self->mWifiDevice;
  if (!mWifiDevice)
  {
    v11 = CFSTR("WiFiS: device not attached");
LABEL_12:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v11);
    return;
  }
  v4 = WiFiDeviceClientCopyCurrentNetwork(mWifiDevice, a2);
  if (!v4)
  {
    v11 = CFSTR("WiFiS: not associated to network");
    goto LABEL_12;
  }
  v5 = (const void *)v4;
  Channel = (const __CFNumber *)WiFiNetworkGetChannel();
  if (!Channel
    || ((CFNumberGetValue(Channel, kCFNumberIntType, &valuePtr), (OperatingBand = WiFiNetworkGetOperatingBand(v5)) != 0)
      ? (v8 = valuePtr == 0)
      : (v8 = 1),
        v8))
  {
    v9 = 0;
    ChannelWidthInMHz = 0;
  }
  else
  {
    v12 = OperatingBand;
    ChannelWidthInMHz = WiFiNetworkGetChannelWidthInMHz(v5);
    if (v12 == 2)
      v13 = 3;
    else
      v13 = 4;
    if (v12 == 1)
      v13 = 2;
    self->mWifiBand = v13;
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))v14 = sub_10007BC54(valuePtr, ChannelWidthInMHz, self->mWifiBand);
    else
      v14 = sub_10007BBBC(valuePtr);
    v9 = v14;
    self->mBandwidthMHz = ChannelWidthInMHz;
  }
  mDelegate = self->super.mDelegate;
  if (mDelegate)
    -[WCM_WiFiDelegate updateWiFiState:channel:centerFreq:bandwidth:hostAp:](mDelegate, "updateWiFiState:channel:centerFreq:bandwidth:hostAp:", self->mWifiBand, valuePtr, v9, ChannelWidthInMHz, 0);
  CFRelease(v5);
}

- (void)updateHostAPState:(BOOL)a3 channel:(unsigned int)a4
{
  uint64_t v4;
  int v6;
  CFArrayRef v7;
  BOOL v8;
  uint64_t v9;
  int OperatingBand;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  const void *ValueAtIndex;
  int IntProperty;
  const __CFNumber *Property;
  unsigned int v17;
  const __CFNumber *Channel;
  uint64_t v19;
  WCM_WiFiServiceIOS *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int valuePtr;
  CFArrayRef theArray;
  unsigned int v27;

  v4 = a3;
  v27 = a4;
  theArray = 0;
  v6 = WiFiDeviceClientCopyHostedNetworks(self->mWifiDevice, &theArray);
  v7 = theArray;
  if (theArray)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    v9 = 0;
    OperatingBand = 0;
    v11 = 0;
    if (!theArray)
      goto LABEL_29;
LABEL_28:
    CFRelease(v7);
    goto LABEL_29;
  }
  if (CFArrayGetCount(theArray) < 1)
  {
    v9 = 0;
    OperatingBand = 0;
    v11 = 0;
  }
  else
  {
    v12 = 0;
    v9 = 0;
    v13 = kWiFiNetworkRoleKey;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v12);
      IntProperty = WiFiNetworkGetIntProperty(ValueAtIndex, v13);
      Property = (const __CFNumber *)WiFiNetworkGetProperty(ValueAtIndex, CFSTR("CHANNEL_FLAGS"));
      if (Property)
      {
        valuePtr = 0;
        CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
        if ((valuePtr & 2) != 0)
        {
          v9 = 20;
        }
        else
        {
          if ((valuePtr & 0x800) != 0)
            v17 = 160;
          else
            v17 = v9;
          if ((valuePtr & 0x400) != 0)
            v17 = 80;
          if ((valuePtr & 4) != 0)
            v9 = 40;
          else
            v9 = v17;
        }
      }
      if (IntProperty == 3)
        break;
      if (CFArrayGetCount(theArray) <= ++v12)
      {
        OperatingBand = 0;
        v11 = 0;
        v4 = v4;
        goto LABEL_27;
      }
    }
    Channel = (const __CFNumber *)WiFiNetworkGetChannel(ValueAtIndex);
    if (Channel)
      CFNumberGetValue(Channel, kCFNumberIntType, &v27);
    OperatingBand = WiFiNetworkGetOperatingBand(ValueAtIndex);
    v11 = sub_10007BBBC(v27);
    v4 = v4;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiS: updateHostAPState: wifiChannel(%d), hostAP(%d), centerFreqMHz(%d), bandwidthMHz(%d)"), v27, v4, v11, v9);
  }
LABEL_27:
  v7 = theArray;
  if (theArray)
    goto LABEL_28;
LABEL_29:
  switch(OperatingBand)
  {
    case 3:
      v19 = v27;
      v20 = self;
      v21 = v4;
      v22 = v11;
      v23 = v9;
      v24 = 4;
      goto LABEL_35;
    case 2:
      v19 = v27;
      v20 = self;
      v21 = v4;
      v22 = v11;
      v23 = v9;
      v24 = 3;
      goto LABEL_35;
    case 1:
      v19 = v27;
      v20 = self;
      v21 = v4;
      v22 = v11;
      v23 = v9;
      v24 = 2;
LABEL_35:
      -[WCM_WiFiService updateCurrentHostAPState:channel:centerFreq:bandwidth:apState:](v20, "updateCurrentHostAPState:channel:centerFreq:bandwidth:apState:", v21, v19, v22, v23, v24);
      return;
  }
  -[WCM_WiFiService updateCurrentHostAPState:channel:centerFreq:bandwidth:apState:](self, "updateCurrentHostAPState:channel:centerFreq:bandwidth:apState:", v4, v27, v11, v9, 1);
  -[WCM_WiFiServiceIOS checkWiFiState](self, "checkWiFiState");
}

- (void)forceCopresence:(BOOL)a3 scanGrantDuration:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (self->super.mDelegate)
  {
    if (a3)
      v5 = 64;
    else
      v5 = 0;
    if (a3)
      v6 = a4;
    else
      v6 = 0;
    v7 = 2;
    if (a3)
      v8 = 2;
    else
      v8 = 0;
    if (!a3)
      v7 = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Forcing Copresence=%d via priority=%d, bitmap=0x%X, and scanGrantDur=%d."), a3, v7, v5, v6);
    -[WCM_WiFiDelegate updateCatsStateWrapper:bitmap:scanGrantDuration:](self->super.mDelegate, "updateCatsStateWrapper:bitmap:scanGrantDuration:", v8, v5, v6);
  }
}

- (void)dispatchCarplayInfotoBT:(BOOL)a3 reason:(int)a4
{
  uint64_t v5;
  _BOOL8 v6;
  const __CFString *v7;
  uint64_t v8;

  if (self->mWifiDevice)
  {
    if (self->super.mDelegate)
    {
      v5 = *(_QWORD *)&a4;
      v6 = a3;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: dispatchCarplayInfotoBT Carplay state:(%d) , reason: (%d)"), a3, *(_QWORD *)&a4);
      -[WCM_WiFiDelegate updateCarPlaySessionState:reason:](self->super.mDelegate, "updateCarPlaySessionState:reason:", v6, v5);
      return;
    }
    v7 = CFSTR("WiFiS: dispatchCarplayInfotoBT failed no controller delegate");
    v8 = 2;
  }
  else
  {
    v7 = CFSTR("WiFiS: device not attached");
    v8 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v8, v7);
}

- (void)dispatchContentionFreeWiFiNetworkToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (self->mWifiDevice)
  {
    if (self->super.mDelegate)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiS: %s channel :(%d) , count: (%d)"), "-[WCM_WiFiServiceIOS dispatchContentionFreeWiFiNetworkToRC2:count:]", *(_QWORD *)&a3, *(_QWORD *)&a4);
      -[WCM_WiFiDelegate updateContentionFreeWiFiInfoToRC2:count:](self->super.mDelegate, "updateContentionFreeWiFiInfoToRC2:count:", v5, v4);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiS: dispatchContentionFreeWiFiNetworkToRC2 failed no controller delegate"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: %s device not attached"), "-[WCM_WiFiServiceIOS dispatchContentionFreeWiFiNetworkToRC2:count:]", *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
}

- (void)performScan:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];

  if (self->mWifiDevice)
  {
    v6[0] = 0;
    v6[1] = +[NSMutableArray array](NSMutableArray, "array", a3);
    v6[2] = CFRunLoopGetCurrent();
    v6[3] = self;
    v4 = WiFiDeviceClientScanAsync(self->mWifiDevice, +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), sub_1000E0F40, v6);
    if (CFRunLoopRunInMode((CFRunLoopMode)NSDefaultRunLoopMode, 120.0, 0) == kCFRunLoopRunTimedOut)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s WiFiS: Runloop timed out"), "-[WCM_WiFiServiceIOS performScan:]");
    if ((_DWORD)v4)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: Async Scan returned error %d %d"), v4, LODWORD(v6[0]));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s WiFiS: device not attached"), "-[WCM_WiFiServiceIOS performScan:]", v5);
  }
}

- (BOOL)deviceAssociatedOnPreferredNetwork
{
  int mWiFiPointOfInterest;

  mWiFiPointOfInterest = self->mWiFiPointOfInterest;
  return mWiFiPointOfInterest
      && (mWiFiPointOfInterest != 3 || !-[WCM_WiFiServiceIOS isWiFiNetworkCaptive](self, "isWiFiNetworkCaptive"));
}

- (int)getPointOfInterest
{
  return self->mWiFiPointOfInterest;
}

- (BOOL)getAirplayStatus
{
  return self->mAWDLInProgress;
}

- (BOOL)getP2pRCU2CoexEventStatus
{
  return self->mP2pRCU2CoexEventInProgress;
}

- (BOOL)isCarPlaySessionInProgress
{
  return self->mCarPlaySessionInProgress;
}

- (int)getCarPlayScanRelaxReason
{
  return self->mCarPlayBTScanRelaxReason;
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  self->mCarPlaySessionInProgress = a3;
  self->mCarPlayBTScanRelaxReason = a4;
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService updateContentionFreeWiFiInfoToRC2 channel (%d), count (%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  self->mLeastCongestedChannel = a3;
  self->mLeastCongestedChannelCount = a4;
}

- (id)getLeastCongestedWifiParam
{
  id v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getLeastCongestedWifiParam"));
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->mLeastCongestedChannel));
  objc_msgSend(v3, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->mLeastCongestedChannelCount));
  return v3;
}

- (BOOL)didWiFiDeviceReset
{
  return self->mWiFiDeviceReset;
}

- (void)setWiFiResetFlag
{
  self->mWiFiDeviceReset = 0;
}

- (void)setWiFiCallingState:(BOOL)a3
{
  _QWORD block[5];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E13E4;
  block[3] = &unk_100201E38;
  block[4] = self;
  v5 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("setWiFiCallingState called, mWifiManager: %x"), self->mWifiManager);
}

- (void)disableWiFi
{
  __WiFiDeviceClient *mWifiDevice;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const __CFString *v7;

  mWifiDevice = self->mWifiDevice;
  if (!mWifiDevice)
  {
    v7 = CFSTR("returning from disableWiFi, mWiFiDevice is NULL");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, v7);
    return;
  }
  v4 = WiFiDeviceClientCopyCurrentNetwork(mWifiDevice, a2);
  if (!v4)
  {
    v7 = CFSTR("returning from disableWiFi, network is NULL");
    goto LABEL_9;
  }
  v5 = (const void *)v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("DisableWiFi %@"), WiFiNetworkGetSSID());
  WiFiManagerClientTemporarilyDisableNetwork(self->mWifiManager, v5);
  CFRelease(v5);
  if (WiFiManagerClientGetDevice(self->mWifiManager, CFSTR("en0")))
  {
    v6 = WiFiDeviceClientDisassociate(self->mWifiDevice, 0);
    if ((_DWORD)v6)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("WiFiDeviceClientDisassociate failed: %d"), v6);
  }
}

- (void)setMedtronicState:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E1570;
  v3[3] = &unk_1002026C0;
  v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (unsigned)getWiFiBW
{
  return self->mBandwidthMHz;
}

- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  NSMutableDictionary *v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4), CFSTR("UCM_PROFILE_INDEX"));
  v8 = -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", &off_1002317E8, v7);
  v9 = v8;
  if ((_DWORD)v8)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiS: failed to download profile to index %d with error(%s)\n%@"), a4, Apple80211ErrToStr(v8), a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: succeed to download profile to index %d\n%@"), a4, v7, v11);
  return v9 == 0;
}

- (void)setWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4
{
  uint64_t v5;

  v5 = (unsigned __int16)a3 | ((unsigned __int16)a4 << 16);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiS: Set Active Profile index2G(%ld) and index5G(%ld)"), a3, a4);
  -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", &off_100231800, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
}

- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  _QWORD block[5];
  int v6;
  int v7;
  BOOL v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E178C;
  block[3] = &unk_100201D70;
  v8 = a3;
  v6 = a4;
  v7 = a5;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E1958;
  v4[3] = &unk_100201BB8;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)bspStatusRequest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1B2C;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspRegulatoryInfoRequest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1CB0;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspNanPhsStateRequest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1E34;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  _QWORD v8[5];
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  BOOL v14;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1FC8;
  v8[3] = &unk_1002059C8;
  v13 = a3;
  v9 = a4;
  v10 = a5;
  v14 = a7;
  v11 = a6;
  v12 = a8;
  v8[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)bspGetBandSwitchStatus
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E222C;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspGetChannelQualityInfo
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E23E4;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setCoexParams:(const char *)a3 withValue:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%s: %s"), "-[WCM_WiFiServiceIOS setCoexParams:withValue:]", a3);
  -[WCM_WiFiServiceIOS sendMessage:withValue:](self, "sendMessage:withValue:", CFStringCreateWithCString(0, a3, 0x8000100u), a4);
}

@end
