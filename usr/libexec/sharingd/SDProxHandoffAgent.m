@implementation SDProxHandoffAgent

- (BOOL)_bleActionDiscoveryShouldStart
{
  uint64_t v3;
  uint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (SFDeviceClassCodeGet(v3, v4) - 1 > 1)
    return 0;
  else
    return -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
}

- (BOOL)_serviceShouldStart
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return SFDeviceClassCodeGet() == 4 && self->_candidateNearby || self->_prefForceShouldAdvertise;
}

- (void)_run
{
  SFCombinedDevice *v3;
  SFCombinedDevice *uiDevice;

  v3 = (SFCombinedDevice *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDevicePending](self, "_combinedDevicePending"));
  uiDevice = self->_uiDevice;
  self->_uiDevice = v3;

  switch(-[SFCombinedDevice state](self->_uiDevice, "state"))
  {
    case 0xB:
      -[SDProxHandoffAgent _runNotificationPending](self, "_runNotificationPending");
      break;
    case 0xC:
      -[SDProxHandoffAgent _runNotificationPendingContent](self, "_runNotificationPendingContent");
      break;
    case 0xD:
      -[SDProxHandoffAgent _runNotificationReady](self, "_runNotificationReady");
      break;
    case 0xE:
      -[SDProxHandoffAgent _runNotificationPresented](self, "_runNotificationPresented");
      break;
    case 0xF:
      -[SDProxHandoffAgent _runNotificationDismissed](self, "_runNotificationDismissed");
      break;
    case 0x10:
      -[SDProxHandoffAgent _runTransferPending](self, "_runTransferPending");
      break;
    case 0x11:
      -[SDProxHandoffAgent _runTransferReady](self, "_runTransferReady");
      break;
    case 0x12:
      -[SDProxHandoffAgent _runTransferInProgress](self, "_runTransferInProgress");
      break;
    case 0x13:
      -[SDProxHandoffAgent _runTransferPendingDismiss](self, "_runTransferPendingDismiss");
      break;
    case 0x14:
      -[SDProxHandoffAgent _runTransferDone](self, "_runTransferDone");
      break;
    default:
      return;
  }
}

- (id)_combinedDevicePending
{
  NSMutableDictionary *mappedDevices;
  void *v3;
  id v4;
  _QWORD v6[14];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1000ADCAC;
  v59 = sub_1000ADCBC;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1000ADCAC;
  v53 = sub_1000ADCBC;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1000ADCAC;
  v47 = sub_1000ADCBC;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1000ADCAC;
  v41 = sub_1000ADCBC;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1000ADCAC;
  v35 = sub_1000ADCBC;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1000ADCAC;
  v29 = sub_1000ADCBC;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000ADCAC;
  v23 = sub_1000ADCBC;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000ADCAC;
  v17 = sub_1000ADCBC;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000ADCAC;
  v11 = sub_1000ADCBC;
  v12 = 0;
  mappedDevices = self->_mappedDevices;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AF708;
  v6[3] = &unk_100716590;
  v6[4] = self;
  v6[5] = &v49;
  v6[6] = &v37;
  v6[7] = &v43;
  v6[8] = &v25;
  v6[9] = &v19;
  v6[10] = &v31;
  v6[11] = &v13;
  v6[12] = &v55;
  v6[13] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v6);
  v3 = (void *)v20[5];
  if (!v3)
  {
    v3 = (void *)v14[5];
    if (!v3)
    {
      v3 = (void *)v26[5];
      if (!v3)
      {
        v3 = (void *)v32[5];
        if (!v3)
        {
          v3 = (void *)v50[5];
          if (!v3)
          {
            v3 = (void *)v44[5];
            if (!v3)
            {
              v3 = (void *)v38[5];
              if (!v3)
              {
                v3 = (void *)v56[5];
                if (!v3)
                  v3 = (void *)v8[5];
              }
            }
          }
        }
      }
    }
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v4;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prefEnabled && !self->_unansweredCall)
  {
    -[SDProxHandoffAgent _commonEnsureStarted](self, "_commonEnsureStarted");
    if (-[SDProxHandoffAgent _clinkShouldStart](self, "_clinkShouldStart"))
      -[SDProxHandoffAgent _clinkEnsureStarted](self, "_clinkEnsureStarted");
    else
      -[SDProxHandoffAgent _clinkEnsureStopped](self, "_clinkEnsureStopped");
    if (-[SDProxHandoffAgent _bleActionDiscoveryShouldStart](self, "_bleActionDiscoveryShouldStart"))
      -[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted](self, "_bleActionDiscoveryEnsureStarted");
    else
      -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
    if (-[SDProxHandoffAgent _bleInfoDiscoveryShouldStart](self, "_bleInfoDiscoveryShouldStart"))
      -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStarted](self, "_bleInfoDiscoveryEnsureStarted");
    else
      -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped](self, "_bleInfoDiscoveryEnsureStopped");
    if (-[SDProxHandoffAgent _motionShouldStart](self, "_motionShouldStart"))
      -[SDProxHandoffAgent _motionEnsureStarted](self, "_motionEnsureStarted");
    else
      -[SDProxHandoffAgent _motionEnsureStopped](self, "_motionEnsureStopped");
    if (-[SDProxHandoffAgent _serviceShouldStart](self, "_serviceShouldStart"))
      -[SDProxHandoffAgent _serviceEnsureStarted](self, "_serviceEnsureStarted");
    else
      -[SDProxHandoffAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
    -[SDProxHandoffAgent _run](self, "_run");
  }
  else
  {
    -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
    -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped](self, "_bleInfoDiscoveryEnsureStopped");
    -[SDProxHandoffAgent _clinkEnsureStopped](self, "_clinkEnsureStopped");
    -[SDProxHandoffAgent _motionEnsureStopped](self, "_motionEnsureStopped");
    -[SDProxHandoffAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
  }
}

- (BOOL)_systemCanTrigger
{
  unsigned int v3;
  unsigned int v4;

  v3 = -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags");
  v4 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (v4)
    LOBYTE(v4) = !v3 && (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) != 0
              || (v3 & 0x18001) == 0;
  return v4;
}

- (void)_bleInfoDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleInfoDiscovery;
  NSMutableDictionary *bleInfoDevices;
  NSMutableDictionary *bleUnmapped;

  if (self->_bleInfoDiscovery)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped]", 30, "BLE info discovery stop\n");
    }
    -[SFDeviceDiscovery invalidate](self->_bleInfoDiscovery, "invalidate");
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = 0;

    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
  }
  -[NSMutableDictionary removeAllObjects](self->_bleInfoDevices, "removeAllObjects");
  bleInfoDevices = self->_bleInfoDevices;
  self->_bleInfoDevices = 0;

  -[NSMutableDictionary removeAllObjects](self->_bleUnmapped, "removeAllObjects");
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0;

}

- (void)commonSystemUIChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC3C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_serviceEnsureStopped
{
  SFProxHandoffService *bleActionService;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleActionService)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _serviceEnsureStopped]", 30, "BLE action service stop\n");
    }
    -[SFProxHandoffService invalidate](self->_bleActionService, "invalidate");
    bleActionService = self->_bleActionService;
    self->_bleActionService = 0;

  }
}

- (BOOL)_motionShouldStart
{
  return -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
}

- (void)_motionEnsureStarted
{
  CMMotionActivityManager *motionMonitor;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  if (!self->_motionMonitorStarted)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _motionEnsureStarted]", 30, "Motion monitor start\n");
    }
    location = 0;
    objc_initWeak(&location, self);
    motionMonitor = self->_motionMonitor;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000AB79C;
    v5[3] = &unk_100716518;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](motionMonitor, "startActivityUpdatesToQueue:withHandler:", v4, v5);

    self->_motionMonitorStarted = 1;
    self->_stationary = 1;
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_commonEnsureStarted
{
  SDProxHandoffAgent *v2;
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  CUCoalescer *v6;
  CUCoalescer *bleMapCoalescer;
  void *v8;
  uint64_t v9;
  SDStatusMonitor *statusMonitor;
  CMMotionActivityManager *v11;
  CMMotionActivityManager *motionMonitor;
  SFNotificationProxy *v13;
  SFNotificationProxy *notificationProxy;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v2 = self;
  if (!self->_systemMonitor)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonEnsureStarted]", 30, "System monitor start\n");
    }
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](v2->_systemMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A6CA8;
    v21[3] = &unk_1007146D8;
    v21[4] = v2;
    -[CUSystemMonitor setCallChangedHandler:](v2->_systemMonitor, "setCallChangedHandler:", v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A6CB0;
    v20[3] = &unk_1007146D8;
    v20[4] = v2;
    -[CUSystemMonitor setScreenOnChangedHandler:](v2->_systemMonitor, "setScreenOnChangedHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A6CB8;
    v19[3] = &unk_1007146D8;
    v19[4] = v2;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v2->_systemMonitor, "setScreenLockedChangedHandler:", v19);
    v5 = v2->_systemMonitor;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A6CC0;
    v18[3] = &unk_1007146D8;
    v18[4] = v2;
    self = (SDProxHandoffAgent *)-[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v18);
  }
  if (!v2->_bleMapCoalescer)
  {
    v6 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    bleMapCoalescer = v2->_bleMapCoalescer;
    v2->_bleMapCoalescer = v6;

    -[CUCoalescer setDispatchQueue:](v2->_bleMapCoalescer, "setDispatchQueue:", v2->_dispatchQueue);
    -[CUCoalescer setMaxDelay:](v2->_bleMapCoalescer, "setMaxDelay:", 0.05);
    -[CUCoalescer setMinDelay:](v2->_bleMapCoalescer, "setMinDelay:", 0.05);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A6D38;
    v17[3] = &unk_1007146D8;
    v17[4] = v2;
    self = (SDProxHandoffAgent *)-[CUCoalescer setActionHandler:](v2->_bleMapCoalescer, "setActionHandler:", v17);
  }
  if (!v2->_statusMonitor && SFDeviceClassCodeGet(self, a2) - 1 <= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "commonSystemUIChanged", CFSTR("com.apple.sharingd.SystemUIChanged"), 0);
    v9 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = v2->_statusMonitor;
    v2->_statusMonitor = (SDStatusMonitor *)v9;

  }
  if (!v2->_motionMonitor)
  {
    v11 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionMonitor = v2->_motionMonitor;
    v2->_motionMonitor = v11;

  }
  if (!v2->_notificationProxy)
  {
    v13 = objc_alloc_init(SFNotificationProxy);
    notificationProxy = v2->_notificationProxy;
    v2->_notificationProxy = v13;

    -[SFNotificationProxy setDispatchQueue:](v2->_notificationProxy, "setDispatchQueue:", v2->_dispatchQueue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A6D40;
    v16[3] = &unk_1007164A0;
    v16[4] = v2;
    -[SFNotificationProxy setDismissedHandler:](v2->_notificationProxy, "setDismissedHandler:", v16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A6D50;
    v15[3] = &unk_1007164C8;
    v15[4] = v2;
    -[SFNotificationProxy setTappedHandler:](v2->_notificationProxy, "setTappedHandler:", v15);
  }
}

- (BOOL)_clinkShouldStart
{
  id v2;
  uint64_t v3;
  BOOL result;

  v2 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  result = (_DWORD)v2 && (v2 = (id)SFDeviceClassCodeGet(v2, v3), ((_DWORD)v2 - 1) < 2)
        || SFDeviceClassCodeGet(v2, v3) == 4;
  return result;
}

- (void)_clinkEnsureStarted
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *clinkClient;
  id v5;
  uint64_t v6;
  RPCompanionLinkClient *v7;
  RPCompanionLinkClient *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  if (!self->_clinkClient)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _clinkEnsureStarted]", 30, "CLink start\n");
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clinkClient = self->_clinkClient;
    self->_clinkClient = v3;

    -[RPCompanionLinkClient setControlFlags:](self->_clinkClient, "setControlFlags:", 2052);
    v5 = -[RPCompanionLinkClient setDispatchQueue:](self->_clinkClient, "setDispatchQueue:", self->_dispatchQueue);
    if (SFDeviceClassCodeGet(v5, v6) - 1 <= 1)
      -[RPCompanionLinkClient setFlags:](self->_clinkClient, "setFlags:", -[RPCompanionLinkClient flags](self->_clinkClient, "flags") | 2);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AB1A4;
    v14[3] = &unk_1007146D8;
    v14[4] = self;
    -[RPCompanionLinkClient setInterruptionHandler:](self->_clinkClient, "setInterruptionHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AB1AC;
    v13[3] = &unk_100714A70;
    v13[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_clinkClient, "setDeviceChangedHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AB24C;
    v12[3] = &unk_100714A48;
    v12[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_clinkClient, "setDeviceFoundHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AB2DC;
    v11[3] = &unk_100714A48;
    v11[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_clinkClient, "setDeviceLostHandler:", v11);
    v7 = self->_clinkClient;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AB36C;
    v10[3] = &unk_1007147C8;
    v10[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v10);
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _clinkEnsureStarted]", 30, "Registering for call transfer messages");
    }
    v8 = self->_clinkClient;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AB448;
    v9[3] = &unk_1007157B0;
    v9[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:](v8, "registerRequestID:options:handler:", CFSTR("com.apple.sharing.calltransfer"), 0, v9);
  }
}

- (BOOL)_bleInfoDiscoveryShouldStart
{
  return SFDeviceClassCodeGet(self, a2) == 4;
}

- (void)_bleActionDiscoveryEnsureStarted
{
  SDProximityController *v3;
  SDProximityController *proximityController;
  SFDeviceDiscovery *bleActionDiscovery;
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *v7;
  uint64_t v8;
  SFDeviceDiscovery *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  if (!self->_proximityController)
  {
    v3 = (SDProximityController *)objc_claimAutoreleasedReturnValue(+[SDProximityController sharedController](SDProximityController, "sharedController"));
    proximityController = self->_proximityController;
    self->_proximityController = v3;

  }
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
    goto LABEL_33;
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]", 30, "BLE action discovery start\n");
  v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  v7 = self->_bleActionDiscovery;
  self->_bleActionDiscovery = v6;

  v8 = self->_stationary ? 9 : 29;
  -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", v8);
  -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleActionDiscovery, "setDiscoveryFlags:", 8388624);
  -[SFDeviceDiscovery setDispatchQueue:](self->_bleActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setPurpose:](self->_bleActionDiscovery, "setPurpose:", CFSTR("HandoffAction"));
  -[SFDeviceDiscovery setRssiThreshold:](self->_bleActionDiscovery, "setRssiThreshold:", -60);
  -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 2);
  -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 20);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A9148;
  v15[3] = &unk_100714FD8;
  v15[4] = self;
  -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleActionDiscovery, "setDeviceFoundHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A9154;
  v14[3] = &unk_100714FD8;
  v14[4] = self;
  -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleActionDiscovery, "setDeviceLostHandler:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A9160;
  v13[3] = &unk_100715000;
  v13[4] = self;
  -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleActionDiscovery, "setDeviceChangedHandler:", v13);
  v9 = self->_bleActionDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A916C;
  v12[3] = &unk_1007147C8;
  v12[4] = self;
  -[SFDeviceDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v12);
  -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
LABEL_33:
    if (self->_prefHighNormal)
    {
      if (self->_stationary && (uint64_t)-[SFDeviceDiscovery scanRate](bleActionDiscovery, "scanRate") > 10
        || self->_bleActionScanTimedOut)
      {
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]", 30, "BLE action scan rate -> Background with FastScanMatch\n");
        }
        -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 9);
        -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 2);
        -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 10);
        -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
      }
      else if (!self->_stationary)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mappedDevices, "allKeys"));
        if (objc_msgSend(v10, "count"))
        {
          v11 = (uint64_t)-[SFDeviceDiscovery scanRate](self->_bleActionDiscovery, "scanRate");

          if (v11 <= 29)
          {
            if (dword_1007B1060 <= 30
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]", 30, "BLE action scan rate -> HighNormal\n");
            }
            -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 29);
            -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 0);
            -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 30);
            -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
          }
        }
        else
        {

        }
      }
    }
  }
}

+ (id)sharedAgent
{
  if (qword_1007C66F0 != -1)
    dispatch_once(&qword_1007C66F0, &stru_100716478);
  return (id)qword_1007C66F8;
}

- (SDProxHandoffAgent)init
{
  SDProxHandoffAgent *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDProxHandoffAgent;
  v2 = -[SDProxHandoffAgent init](&v7, "init");
  if (v2)
  {
    v3 = CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSString)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  RPCompanionLinkClient *clinkClient;
  RPCompanionLinkClient *v9;
  void *v10;
  SFDeviceDiscovery *bleActionDiscovery;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  SFCombinedDevice *uiDevice;
  SFCombinedDevice *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  const __CFString *v33;
  const char *v34;
  id v35;
  id v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("-- SDProxHandoffAgent --\n"));
  if (self->_prefEnabled)
    v4 = "yes";
  else
    v4 = "no";
  if (self->_userOnCall)
    v5 = "yes";
  else
    v5 = "no";
  if (self->_clientShouldAdvertise)
    v6 = "yes";
  else
    v6 = "no";
  if (self->_candidateNearby)
    v7 = "yes";
  else
    v7 = "no";
  objc_msgSend(v3, "appendFormat:", CFSTR("Enabled: %s, On call: %s, client should advertise: %s, Candidate nearby: %s\n"), v4, v5, v6, v7);
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    v9 = clinkClient;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](v9, "activeDevices"));
    objc_msgSend(v3, "appendFormat:", CFSTR("CLinkClient (%ld devices): %@\n"), objc_msgSend(v10, "count"), v9);

  }
  if (self->_bleActionService)
    objc_msgSend(v3, "appendFormat:", CFSTR("BLE Action Service: %@\n"), self->_bleActionService);
  if (-[NSMutableSet count](self->_proxClients, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("ProxClients: (%ld)\n"), -[NSMutableSet count](self->_proxClients, "count"));
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
    v12 = -[NSMutableDictionary count](self->_bleActionDevices, "count");
    if (self->_bleActionScanTimedOut)
      v13 = CFSTR(", TIMED OUT");
    else
      v13 = &stru_10072FE60;
    objc_msgSend(v3, "appendFormat:", CFSTR("BLE NearbyAction Discovery: %@, %ld devices%@\n"), bleActionDiscovery, v12, v13);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleActionDevices, "allValues"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v3, "appendFormat:", CFSTR(" - %@\n"), *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v18));
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v16);
    }

  }
  if (self->_bleInfoDiscovery)
    objc_msgSend(v3, "appendFormat:", CFSTR("BLE NearbyInfo Discovery: %@\n"), self->_bleInfoDiscovery);
  objc_msgSend(v3, "appendFormat:", CFSTR("Mapped Devices (%ld), unmapped (%ld):\n"), -[NSMutableDictionary count](self->_mappedDevices, "count"), -[NSMutableDictionary count](self->_bleUnmapped, "count"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v3, "appendFormat:", CFSTR(" - %@"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23));
        objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v21);
  }

  uiDevice = self->_uiDevice;
  if (uiDevice)
  {
    v25 = uiDevice;
    v26 = sub_1000A4358(-[SFCombinedDevice nextState](v25, "nextState"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v3, "appendFormat:", CFSTR("UI Device: (next state = %@)\n - %@\n"), v27, v25);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent currentCall](self, "currentCall"));
  v29 = v28;
  if (v28)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "callUUID"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Current Call:\n - %@\n"), v30);

  }
  v39 = v3;
  v31 = -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags");
  v32 = -[SDProxHandoffAgent _systemCanTrigger](self, "_systemCanTrigger");
  v33 = CFSTR("canTrigger");
  if (!v32)
    v33 = &stru_10072FE60;
  if (self->_stationary)
    v34 = "yes";
  else
    v34 = "no";
  NSAppendPrintF(&v39, "System UI flags: %#{flags} %@, stationary: %s\n", v31, &unk_1005CC596, v33, v34);
  v35 = v39;

  v38 = v35;
  NSAppendPrintF(&v38, "Throttle events: %d / %d\n", self->_prefThrottleEventCount, self->_prefThrottleEventMax);
  v36 = v38;

  return (NSString *)v36;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A60F0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A61B8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSMutableSet *proxClients;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _invalidate]", 30, "Invalidate\n");
  -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
  -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped](self, "_bleInfoDiscoveryEnsureStopped");
  -[SDProxHandoffAgent _commonEnsureStopped](self, "_commonEnsureStopped");
  -[SDProxHandoffAgent _clinkEnsureStopped](self, "_clinkEnsureStopped");
  -[SDProxHandoffAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
  -[NSMutableSet removeAllObjects](self->_proxClients, "removeAllObjects");
  proxClients = self->_proxClients;
  self->_proxClients = 0;

}

- (void)prefsChanged
{
  uint64_t Int64;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  double v10;
  double v11;
  double prefBLEActionScanSecs;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  BOOL v34;
  int v35;
  int prefIgnoreMediumThrottle;
  const char *v37;
  const char *v38;
  uint64_t v39;
  BOOL v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t prefMediumBubbleLastTicks;
  double v47;
  double v48;
  double v49;
  double prefRetriggerSecs;
  double v51;
  double prefTransferSecs;
  uint64_t v53;
  unint64_t v54;
  unint64_t prefThrottleEventCount;
  uint64_t v56;
  unint64_t v57;
  unint64_t prefThrottleEventMax;
  int v59;

  v59 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chEnabled"), &v59);
  v5 = Int64 != 0;
  if (v59)
  {
    v6 = SFDeviceClassCodeGet(Int64, v4);
    v5 = (v6 - 1) < 2 || SFDeviceClassCodeGet(v6, v7) == 4;
  }
  if (self->_prefEnabled != v5)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v8 = "yes";
      if (v5)
        v9 = "no";
      else
        v9 = "yes";
      if (!v5)
        v8 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref enabled: %s -> %s\n", v9, v8);
    }
    self->_prefEnabled = v5;
  }
  CFPrefs_GetDouble(CFSTR("com.apple.Sharing"), CFSTR("chBLEScanSecs"), &v59);
  if (v59)
    v11 = 300.0;
  else
    v11 = v10;
  prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
  if (v11 != prefBLEActionScanSecs)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_25;
        prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref BLE scan secs: %f -> %f\n", prefBLEActionScanSecs, v11);
    }
LABEL_25:
    self->_prefBLEActionScanSecs = v11;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chForceShouldAdvertise"), &v59);
  if (v59)
    v14 = 1;
  else
    v14 = v13 == 0;
  v15 = !v14;
  if (self->_prefForceShouldAdvertise != v15)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref force should advertise: %s -> %s\n", v17, v16);
    }
    self->_prefForceShouldAdvertise = v15;
    -[SDProxHandoffAgent _commonShouldAdvertiseChanged](self, "_commonShouldAdvertiseChanged");
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chForceStationary"), &v59);
  if (v59)
    v19 = 1;
  else
    v19 = v18 == 0;
  v20 = !v19;
  if (self->_prefForceStationary != v20)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref force stationary: %s -> %s\n", v22, v21);
    }
    self->_prefForceStationary = v20;
    -[SDProxHandoffAgent _motionUpdate:](self, "_motionUpdate:", 0);
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chHighNormal"), &v59);
  if (v59)
    v24 = 0;
  else
    v24 = v23 == 0;
  v25 = !v24;
  if (self->_prefHighNormal != v25)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v26 = "yes";
      if (v25)
        v27 = "no";
      else
        v27 = "yes";
      if (!v25)
        v26 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref HighNormal: %s -> %s\n", v27, v26);
    }
    self->_prefHighNormal = v25;
    -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chForceOnCall"), &v59);
  if (v59)
    v29 = 1;
  else
    v29 = v28 == 0;
  v30 = !v29;
  if (self->_prefForceOnCall != v30)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v31 = "yes";
      if (v30)
        v32 = "no";
      else
        v32 = "yes";
      if (!v30)
        v31 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref force on call: %s -> %s\n", v32, v31);
    }
    self->_prefForceOnCall = v30;
    -[SDProxHandoffAgent _commonCallCountChanged](self, "_commonCallCountChanged");
  }
  v33 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chIgnoreMediumThrottle"), &v59);
  if (v59)
    v34 = 1;
  else
    v34 = v33 == 0;
  v35 = !v34;
  prefIgnoreMediumThrottle = self->_prefIgnoreMediumThrottle;
  if (prefIgnoreMediumThrottle != v35)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 != -1)
      {
LABEL_103:
        v37 = "yes";
        if (prefIgnoreMediumThrottle)
          v38 = "yes";
        else
          v38 = "no";
        if (!v35)
          v37 = "no";
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref ignore medium throttle: %s -> %s\n", v38, v37);
        goto LABEL_110;
      }
      if (_LogCategory_Initialize(&dword_1007B1060, 30))
      {
        prefIgnoreMediumThrottle = self->_prefIgnoreMediumThrottle;
        goto LABEL_103;
      }
    }
LABEL_110:
    self->_prefIgnoreMediumThrottle = v35;
  }
  v39 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chMediumBubbleEnabled"), &v59);
  if (v59)
    v40 = 0;
  else
    v40 = v39 == 0;
  v41 = !v40;
  if (self->_prefMediumBubbleEnabled != v41)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v42 = "yes";
      if (v41)
        v43 = "no";
      else
        v43 = "yes";
      if (!v41)
        v42 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref medium bubble enabled: %s -> %s\n", v43, v42);
    }
    self->_prefMediumBubbleEnabled = v41;
  }
  v44 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chThrottleMediumTicks"), &v59);
  if (v59)
    v45 = -1;
  else
    v45 = v44;
  prefMediumBubbleLastTicks = self->_prefMediumBubbleLastTicks;
  if (v45 != prefMediumBubbleLastTicks)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_136;
        prefMediumBubbleLastTicks = self->_prefMediumBubbleLastTicks;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref medium bubble last ticks: %d -> %d\n", prefMediumBubbleLastTicks, v45);
    }
LABEL_136:
    self->_prefMediumBubbleLastTicks = v45;
  }
  CFPrefs_GetDouble(CFSTR("com.apple.Sharing"), CFSTR("chRetriggerSecs"), &v59);
  v48 = 0.0;
  if (v59)
    v49 = 0.0;
  else
    v49 = v47;
  prefRetriggerSecs = self->_prefRetriggerSecs;
  if (v49 != prefRetriggerSecs)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_145;
        prefRetriggerSecs = self->_prefRetriggerSecs;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref retrigger secs: %f -> %f", prefRetriggerSecs, v49);
    }
LABEL_145:
    self->_prefRetriggerSecs = v49;
  }
  CFPrefs_GetDouble(CFSTR("com.apple.Sharing"), CFSTR("chTransferSecs"), &v59);
  if (!v59)
    v48 = v51;
  prefTransferSecs = self->_prefTransferSecs;
  if (v48 != prefTransferSecs)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_153;
        prefTransferSecs = self->_prefTransferSecs;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref transfer secs: %f -> %f", prefTransferSecs, v48);
    }
LABEL_153:
    self->_prefTransferSecs = v48;
  }
  v53 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chThrottleEventCount"), &v59);
  if (v59)
    v54 = 0;
  else
    v54 = v53;
  prefThrottleEventCount = self->_prefThrottleEventCount;
  if (v54 != prefThrottleEventCount)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_162;
        prefThrottleEventCount = self->_prefThrottleEventCount;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref throttle event count: %d -> %d\n", prefThrottleEventCount, v54);
    }
LABEL_162:
    self->_prefThrottleEventCount = v54;
  }
  v56 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("chThrottleEventMax"), &v59);
  if (v59)
    v57 = 3;
  else
    v57 = v56;
  prefThrottleEventMax = self->_prefThrottleEventMax;
  if (v57 != prefThrottleEventMax)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_171;
        prefThrottleEventMax = self->_prefThrottleEventMax;
      }
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent prefsChanged]", 30, "Pref throttle event max: %d -> %d\n", prefThrottleEventMax, v57);
    }
LABEL_171:
    self->_prefThrottleEventMax = v57;
  }
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)setPreventNotifications:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A6B38;
  v4[3] = &unk_100715BB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_updateCandidateIsNearby
{
  id v3;
  _BOOL4 v4;
  id v5;
  const char *v6;
  const char *v7;

  v3 = -[NSMutableDictionary count](self->_mappedDevices, "count");
  v4 = v3 != 0;
  if (self->_candidateNearby != v4)
  {
    if (dword_1007B1060 <= 30)
    {
      v5 = v3;
      if (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30))
      {
        v6 = "yes";
        if (v5)
          v7 = "no";
        else
          v7 = "yes";
        if (!v5)
          v6 = "no";
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _updateCandidateIsNearby]", 30, "Candidate is nearby: %s -> %s\n", v7, v6);
      }
    }
    self->_candidateNearby = v4;
  }
}

- (void)_commonEnsureStopped
{
  CUSystemMonitor *systemMonitor;
  CUCoalescer *bleMapCoalescer;
  CUCoalescer *v5;
  void *v6;
  SDStatusMonitor *statusMonitor;
  CMMotionActivityManager *motionMonitor;
  SFNotificationProxy *notificationProxy;
  SFNotificationProxy *v10;

  if (self->_systemMonitor)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonEnsureStopped]", 30, "System monitor stop\n");
    }
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

  }
  bleMapCoalescer = self->_bleMapCoalescer;
  if (bleMapCoalescer)
  {
    -[CUCoalescer invalidate](bleMapCoalescer, "invalidate");
    v5 = self->_bleMapCoalescer;
    self->_bleMapCoalescer = 0;

  }
  if (self->_statusMonitor)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.SystemUIChanged"), 0);

    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;

  }
  motionMonitor = self->_motionMonitor;
  if (motionMonitor)
  {
    self->_motionMonitor = 0;

  }
  notificationProxy = self->_notificationProxy;
  if (notificationProxy)
  {
    -[SFNotificationProxy setDismissedHandler:](notificationProxy, "setDismissedHandler:", 0);
    -[SFNotificationProxy setTappedHandler:](self->_notificationProxy, "setTappedHandler:", 0);
    v10 = self->_notificationProxy;
    self->_notificationProxy = 0;

  }
  -[SDProxHandoffAgent _hapticsEnsureStopped](self, "_hapticsEnsureStopped");
}

- (void)_commonCallCountChanged
{
  CUSystemMonitor *v3;
  signed int v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 userOnCall;
  const char *v8;
  const char *v9;
  const char *v10;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  SFCombinedDevice *uiDevice;
  CUSystemMonitor *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self->_systemMonitor;
  if (v3)
  {
    v16 = v3;
    v4 = -[CUSystemMonitor activeCallCount](v3, "activeCallCount");
    v5 = -[CUSystemMonitor connectedCallCount](v16, "connectedCallCount");
    v6 = v5 > 0 || self->_prefForceOnCall;
    userOnCall = self->_userOnCall;
    self->_userOnCall = v6;
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1060, 30))
          goto LABEL_17;
        v6 = self->_userOnCall;
      }
      v8 = "no";
      if (userOnCall)
        v9 = "yes";
      else
        v9 = "no";
      if (v6)
        v10 = "yes";
      else
        v10 = "no";
      if (self->_prefForceOnCall)
        v8 = "yes";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonCallCountChanged]", 30, "Active call count = %d (%d connected), userOnCall %s -> %s, prefForceOnCall = %s\n", v4, v5, v9, v10, v8);
    }
LABEL_17:
    v12 = v5 < 1 && v4 > 0;
    if (self->_unansweredCall != v12)
    {
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        v13 = "yes";
        if (v12)
          v14 = "no";
        else
          v14 = "yes";
        if (!v12)
          v13 = "no";
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonCallCountChanged]", 30, "Unanswered call %s -> %s\n", v14, v13);
      }
      self->_unansweredCall = v12;
    }
    if (!userOnCall || self->_userOnCall)
    {
      if (userOnCall || !self->_userOnCall || self->_prefForceOnCall)
        goto LABEL_50;
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonCallCountChanged]", 30, "Trigger notification for call\n");
      }
    }
    else
    {
      if (self->_prefForceOnCall)
      {
LABEL_50:
        -[SDProxHandoffAgent _update](self, "_update");
        v3 = v16;
        goto LABEL_51;
      }
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonCallCountChanged]", 30, "User no longer on call, cleaning up notifications\n");
      }
      uiDevice = self->_uiDevice;
      if (uiDevice)
        -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", uiDevice, 4);
    }
    -[SDProxHandoffAgent _resetAllStates](self, "_resetAllStates");
    goto LABEL_50;
  }
LABEL_51:

}

- (void)_commonShouldAdvertiseChanged
{
  NSMutableSet *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *i;
  _BOOL4 prefForceShouldAdvertise;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_proxClients;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "shouldAdvertise");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
  v10 = prefForceShouldAdvertise | v6 & 1;
  if (v10 != self->_clientShouldAdvertise)
  {
    if (dword_1007B1060 <= 30)
    {
      if (dword_1007B1060 != -1)
      {
LABEL_13:
        if (v10)
          v11 = "no";
        else
          v11 = "yes";
        if (v10)
          v12 = "yes";
        else
          v12 = "no";
        if (prefForceShouldAdvertise)
          v13 = "yes";
        else
          v13 = "no";
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonShouldAdvertiseChanged]", 30, "Client should advertise changed: %s -> %s, prefForceShouldAdvertise = %s\n", v11, v12, v13);
        goto LABEL_24;
      }
      if (_LogCategory_Initialize(&dword_1007B1060, 30))
      {
        prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
        goto LABEL_13;
      }
    }
LABEL_24:
    self->_clientShouldAdvertise = v10;
  }
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)_commonScreenStateChanged
{
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    if (v3)
      v4 = "on";
    else
      v4 = "off";
    v5 = -[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked");
    v6 = CFSTR("Unlocked");
    if (v5)
      v6 = CFSTR("Locked");
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _commonScreenStateChanged]", 30, "Screen state changed to %s, %@\n", v4, v6);
  }
  if ((v3 & 1) == 0)
  {
    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
    -[SFNotificationProxy requestRemoveAll](self->_notificationProxy, "requestRemoveAll");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    objc_msgSend(v7, "bleProximityEstimatorsResetDeviceClose");

  }
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)_scheduleRunAfter:(double)a3
{
  dispatch_time_t v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A742C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_after(v4, dispatchQueue, block);
}

- (BOOL)_runStateVerify:(int)a3 device:(id)a4
{
  id v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "state");
  if (v6 != a3
    && dword_1007B1060 <= 90
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
  {
    v7 = sub_1000A4358((int)objc_msgSend(v5, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = sub_1000A4358(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runStateVerify:device:]", 90, "### Run state mismatch: %@, expected %@\n", v8, v10);

  }
  return v6 == a3;
}

- (void)_runNotificationPending
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  SFCombinedDevice *v12;

  v3 = self->_uiDevice;
  if (v3)
  {
    v12 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 11, v3);
    v3 = v12;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v12, "nextState");
      v3 = v12;
      if (v5 == 13)
      {
        if (dword_1007B1060 <= 30)
        {
          if (dword_1007B1060 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v12, v6))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPending]", 30, "Run notification pending: %@\n", v3);
            v3 = v12;
          }
        }
        if (self->_userOnCall)
          -[SDProxHandoffAgent _combinedDevicePrepareForCallTransferTrigger:](self, "_combinedDevicePrepareForCallTransferTrigger:", v3);
        else
          -[SFCombinedDevice setNotificationType:](v3, "setNotificationType:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v12, "effectiveID"));
        if (!v7)
        {
          if (dword_1007B1060 <= 90
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPending]", 90, "### No UI ID for request %@\n", v11);
          }
          goto LABEL_32;
        }
        v8 = -[SFCombinedDevice notificationType](v12, "notificationType");
        if (v8 == 2)
        {
          if (-[SFCombinedDevice canTransition:](v12, "canTransition:", 12))
          {
            -[SFCombinedDevice setPendingContentTicks:](v12, "setPendingContentTicks:", mach_absolute_time());
            -[SFCombinedDevice setState:](v12, "setState:", 12);
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v12, "notificationInfo"));
            if (v9)
              v10 = 13;
            else
              v10 = 0;
            -[SFCombinedDevice setNextState:](v12, "setNextState:", v10);

            -[SDProxHandoffAgent _proximityClientDeviceWillTrigger:](self, "_proximityClientDeviceWillTrigger:", v7);
            goto LABEL_24;
          }
        }
        else
        {
          if (v8 != 3)
          {
            if (dword_1007B1060 <= 90
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
            {
              -[SFCombinedDevice notificationType](v12, "notificationType");
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPending]", 90, "### Notification type not supported: %d");
            }
            goto LABEL_32;
          }
          if (-[SFCombinedDevice canTransition:](v12, "canTransition:", 13))
          {
            -[SFCombinedDevice setPendingContentTicks:](v12, "setPendingContentTicks:", mach_absolute_time());
            -[SFCombinedDevice setState:](v12, "setState:", 13);
            -[SFCombinedDevice setNextState:](v12, "setNextState:", 14);
LABEL_24:
            -[SDProxHandoffAgent _run](self, "_run");
          }
        }
LABEL_32:

        v3 = v12;
      }
    }
  }

}

- (void)_runNotificationPendingContent
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  SFCombinedDevice *v10;

  v3 = self->_uiDevice;
  if (v3)
  {
    v10 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 12, v3);
    v3 = v10;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v10, "nextState");
      v3 = v10;
      if (v5 == 13)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v10, "notificationInfo"));
        if (v6)
        {
          v7 = mach_absolute_time();
          v8 = UpTicksToSecondsF(v7 - -[SFCombinedDevice pendingContentTicks](v10, "pendingContentTicks"));
          -[SFCombinedDevice setPendingContentDurationSecs:](v10, "setPendingContentDurationSecs:");
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPendingContent]", 30, "Run notification pending content: %@, waited: %f\n", v10, *(_QWORD *)&v8);
          }
          if (-[SFCombinedDevice canTransition:](v10, "canTransition:", 13))
          {
            -[SFCombinedDevice setState:](v10, "setState:", 13);
            if (-[SDProxHandoffAgent _shouldMediumPromptWithInfo:](self, "_shouldMediumPromptWithInfo:", v6))
              v9 = 14;
            else
              v9 = 0;
            -[SFCombinedDevice setNextState:](v10, "setNextState:", v9);
            -[SDProxHandoffAgent _run](self, "_run");
          }
        }
        else if (dword_1007B1060 <= 90
               && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPendingContent]", 90, "### UI Start without notification info?\n");
        }

        v3 = v10;
      }
    }
  }

}

- (void)_runNotificationReady
{
  SFCombinedDevice *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = self->_uiDevice;
  if (v3
    && -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 13, v3)
    && (-[SFCombinedDevice nextState](v3, "nextState") == 14 || -[SFCombinedDevice nextState](v3, "nextState") == 16)
    && -[SFCombinedDevice canTransition:](v3, "canTransition:", 14))
  {
    if (-[SDProxHandoffAgent _systemCanTrigger](self, "_systemCanTrigger"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v3, "effectiveID"));
      if (!v4)
      {
        if (dword_1007B1060 <= 90
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 90, "### UI Start without UI ID?\n");
        }
        goto LABEL_66;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v3, "notificationInfo"));
      if (!v5)
      {
        if (dword_1007B1060 <= 90
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 90, "### UI Start without notification info?\n");
        }
        goto LABEL_65;
      }
      if (self->_stationary)
      {
        if (dword_1007B1060 <= 60
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 60)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 60, "### Device is stationary, so we shouldn't trigger notification\n");
        }
        goto LABEL_65;
      }
      v6 = -[SFCombinedDevice nextState](v3, "nextState");
      if (v6 == 14)
      {
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediumBubbleVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice bleDevice](v3, "bleDevice"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));
        if (objc_msgSend(v11, "insideSmallBubble"))
          v9 = 16;
        else
          v9 = 0;

        if (v7)
        {
          v8 = 1;
          goto LABEL_34;
        }
      }
      else if (v6 == 16)
      {
        v7 = v5;
        v8 = 0;
        v9 = 16;
LABEL_34:
        v12 = mach_absolute_time();
        v13 = UpTicksToSecondsF(v12 - -[SFCombinedDevice pendingContentTicks](v3, "pendingContentTicks"));
        if ((_DWORD)v8 && (v14 = 0.25 - v13, 0.25 - v13 > 0.0))
        {
          if (!-[SFCombinedDevice medBubbleDelayed](v3, "medBubbleDelayed"))
          {
            if (dword_1007B1060 <= 30
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 30, "Delay threshold %f, deferring medium bubble notification for %f seconds\n", 0.25, v14);
            }
            -[SFCombinedDevice setMedBubbleDelayed:](v3, "setMedBubbleDelayed:", 1);
            -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:", v14);
          }
        }
        else
        {
          -[SFCombinedDevice setMedBubbleDelayed:](v3, "setMedBubbleDelayed:", 0, v13);
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 30, "Run notification ready %@\n", v3);
          }
          -[SFCombinedDevice setNotificationTicks:](v3, "setNotificationTicks:", mach_absolute_time());
          -[SFCombinedDevice setState:](v3, "setState:", 14);
          -[SFCombinedDevice setNextState:](v3, "setNextState:", v9);
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            v15 = "no";
            if ((_DWORD)v8)
              v15 = "yes";
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 30, "UI Start: %@, medium version: %s\n", v4, v15);
          }
          -[SFNotificationProxy requestPostOrUpdate:info:mediumVariant:](self->_notificationProxy, "requestPostOrUpdate:info:mediumVariant:", v4, v7, v8);
          if ((_DWORD)v8)
            -[SDProxHandoffAgent _throttleMediumSetTicks:](self, "_throttleMediumSetTicks:", mach_absolute_time());
          v18[0] = CFSTR("notificationType");
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[SFCombinedDevice notificationType](v3, "notificationType")));
          v18[1] = CFSTR("uiID");
          v19[0] = v16;
          v19[1] = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
          SFMetricsLog(CFSTR("com.apple.sharing.HomePodHandoff.UIStart"), v17);

          -[SDProxHandoffAgent _run](self, "_run");
        }
LABEL_64:

LABEL_65:
LABEL_66:

        goto LABEL_67;
      }
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 90, "### Failed to generate info to present: %@\n", v5);
      }
      v7 = 0;
      goto LABEL_64;
    }
    if (dword_1007B1060 <= 90
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationReady]", 90, "### System cannot present UI\n");
    }
  }
LABEL_67:

}

- (void)_runNotificationPresented
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  SFCombinedDevice *v15;

  v3 = self->_uiDevice;
  if (v3)
  {
    v15 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 14, v3);
    v3 = v15;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v15, "nextState");
      v3 = v15;
      if (v5 == 16
        || (v6 = -[SFCombinedDevice nextState](v15, "nextState"), v3 = v15, v6 == 18)
        || (v7 = -[SFCombinedDevice nextState](v15, "nextState"), v3 = v15, v7 == 15))
      {
        if (dword_1007B1060 <= 30)
        {
          if (dword_1007B1060 != -1 || (v8 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v15, v8))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationPresented]", 30, "Run notification presented %@\n", v3);
            v3 = v15;
          }
        }
        v9 = (id)-[SFCombinedDevice nextState](v3, "nextState");
        v10 = v9;
        if ((_DWORD)v9 == 18)
        {
          v12 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 18);
          v3 = v15;
          if (v12)
          {
            -[SFCombinedDevice setDismissReason:](v15, "setDismissReason:", 3);
            -[SFCombinedDevice setTransferPendingStartTicks:](v15, "setTransferPendingStartTicks:", mach_absolute_time());
            goto LABEL_17;
          }
        }
        else if ((_DWORD)v9 == 16)
        {
          v14 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 16);
          v3 = v15;
          if (v14)
          {
            -[SFCombinedDevice setTransferPendingStartTicks:](v15, "setTransferPendingStartTicks:", mach_absolute_time());
            v13 = 17;
            goto LABEL_20;
          }
        }
        else
        {
          v3 = v15;
          if ((_DWORD)v9 == 15)
          {
            v11 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 15);
            v3 = v15;
            if (v11)
            {
              -[SFCombinedDevice setNotificationInfo:](v15, "setNotificationInfo:", 0);
              -[SFCombinedDevice setNotificationType:](v15, "setNotificationType:", 0);
              -[SFCombinedDevice setTransferDoneTicks:](v15, "setTransferDoneTicks:", mach_absolute_time());
LABEL_17:
              v13 = 0;
LABEL_20:
              -[SFCombinedDevice setState:](v15, "setState:", v10);
              -[SFCombinedDevice setNextState:](v15, "setNextState:", v13);
              -[SDProxHandoffAgent _run](self, "_run");
              v3 = v15;
            }
          }
        }
      }
    }
  }

}

- (void)_runNotificationDismissed
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  SFCombinedDevice *v14;

  v3 = self->_uiDevice;
  if (v3)
  {
    v14 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 15, v3);
    v3 = v14;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v14, "nextState");
      v3 = v14;
      if (v5 == 10 || (v6 = -[SFCombinedDevice nextState](v14, "nextState"), v3 = v14, v6 == 16))
      {
        if (dword_1007B1060 <= 30)
        {
          if (dword_1007B1060 != -1 || (v7 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v14, v7))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runNotificationDismissed]", 30, "Run notification dismissed %@\n", v3);
            v3 = v14;
          }
        }
        v8 = -[SFCombinedDevice nextState](v3, "nextState");
        if (v8 == 16)
        {
          v11 = -[SFCombinedDevice canTransition:](v14, "canTransition:", 16);
          v3 = v14;
          if (v11)
          {
            -[SFCombinedDevice setTransferPendingStartTicks:](v14, "setTransferPendingStartTicks:", mach_absolute_time());
            -[SFCombinedDevice setState:](v14, "setState:", 16);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v14, "notificationInfo"));
            v13 = objc_msgSend(v12, "interactionBehavior");

            if (v13 == 1)
              v10 = 17;
            else
              v10 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          v3 = v14;
          if (v8 == 10)
          {
            v9 = -[SFCombinedDevice canTransition:](v14, "canTransition:", 10);
            v3 = v14;
            if (v9)
            {
              -[SFCombinedDevice resetTicks](v14, "resetTicks");
              -[SFCombinedDevice setState:](v14, "setState:", 10);
              v10 = 0;
LABEL_17:
              -[SFCombinedDevice setNextState:](v14, "setNextState:", v10);
              -[SDProxHandoffAgent _run](self, "_run");
              v3 = v14;
            }
          }
        }
      }
    }
  }

}

- (void)_runTransferInProgress
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  SFCombinedDevice *v11;

  v3 = self->_uiDevice;
  if (v3)
  {
    v11 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 18, v3);
    v3 = v11;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v11, "nextState");
      v3 = v11;
      if (v5 == 19 || (v6 = -[SFCombinedDevice nextState](v11, "nextState"), v3 = v11, v6 == 20))
      {
        if (dword_1007B1060 <= 30)
        {
          if (dword_1007B1060 != -1 || (v7 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v11, v7))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferInProgress]", 30, "Run transfer in progress %@\n", v3);
            v3 = v11;
          }
        }
        v8 = -[SFCombinedDevice nextState](v3, "nextState");
        if (v8 == 20)
        {
          v10 = -[SFCombinedDevice canTransition:](v11, "canTransition:", 20);
          v3 = v11;
          if (v10)
          {
            -[SFCombinedDevice setState:](v11, "setState:", 20);
            -[SFCombinedDevice setTransferDoneTicks:](v11, "setTransferDoneTicks:", mach_absolute_time());
            -[SFCombinedDevice setNextState:](v11, "setNextState:", 0);
            -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v11, -[SFCombinedDevice dismissReason](v11, "dismissReason"));
            -[SFCombinedDevice setDismissReason:](v11, "setDismissReason:", 0);
            goto LABEL_15;
          }
        }
        else
        {
          v3 = v11;
          if (v8 == 19)
          {
            v9 = -[SFCombinedDevice canTransition:](v11, "canTransition:", 19);
            v3 = v11;
            if (v9)
            {
              -[SFCombinedDevice setState:](v11, "setState:", 19);
              -[SFCombinedDevice setNextState:](v11, "setNextState:", 20);
LABEL_15:
              -[SDProxHandoffAgent _run](self, "_run");
              v3 = v11;
            }
          }
        }
      }
    }
  }

}

- (void)_runTransferPending
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  double v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  SFCombinedDevice *v19;

  v3 = self->_uiDevice;
  if (v3)
  {
    v19 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 16, v3);
    v3 = v19;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v19, "nextState");
      v3 = v19;
      if (v5 == 18 || (v6 = -[SFCombinedDevice nextState](v19, "nextState"), v3 = v19, v6 == 17))
      {
        if (-[SFCombinedDevice transferPendingStartTicks](v3, "transferPendingStartTicks") == -1)
        {
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferPending]", 30, "Run transfer pending start %@\n", v19);
          }
          -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", mach_absolute_time());
        }
        v7 = mach_absolute_time();
        v8 = UpTicksToSecondsF(v7 - -[SFCombinedDevice transferPendingStartTicks](v19, "transferPendingStartTicks"));
        v3 = v19;
        if (v8 >= self->_prefTransferSecs)
        {
          if (dword_1007B1060 <= 30)
          {
            if (dword_1007B1060 != -1 || (v9 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v19, v9))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferPending]", 30, "Run transfer pending threshold %f\n", v8);
              v3 = v19;
            }
          }
          -[SFCombinedDevice setTransferPendingDurationSecs:](v3, "setTransferPendingDurationSecs:", v8);
          v10 = -[SFCombinedDevice nextState](v19, "nextState");
          if (v10 == 17)
          {
            v12 = -[SFCombinedDevice canTransition:](v19, "canTransition:", 17);
            v3 = v19;
            if (v12)
            {
              v13 = objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v19, "effectiveID"));
              if (v13)
              {
                v14 = (void *)v13;
                if (self->_userOnCall)
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v19, "notificationInfo"));
                  v16 = objc_msgSend(v15, "notificationType");

                  if (v16 == 2)
                    -[SDProxHandoffAgent _combinedDevicePrepareForCallTransferTrigger:](self, "_combinedDevicePrepareForCallTransferTrigger:", v19);
                }
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v19, "notificationInfo"));
                if (v17)
                {
                  if (-[SFCombinedDevice notificationTicks](v19, "notificationTicks") == -1)
                    -[SFCombinedDevice setNotificationTicks:](v19, "setNotificationTicks:", mach_absolute_time());
                  -[SFNotificationProxy requestPostOrUpdate:info:mediumVariant:](self->_notificationProxy, "requestPostOrUpdate:info:mediumVariant:", v14, v17, 0);
                  -[SDProxHandoffAgent _hapticsFireNotificationSuccess](self, "_hapticsFireNotificationSuccess");

                  -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", -1);
                  -[SFCombinedDevice setState:](v19, "setState:", 17);
                  -[SFCombinedDevice setNextState:](v19, "setNextState:", 18);

                  -[SDProxHandoffAgent _run](self, "_run");
                  -[SDProxHandoffAgent _throttleEventDidOccur](self, "_throttleEventDidOccur");
                  goto LABEL_33;
                }

                -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", -1);
                -[SFCombinedDevice setState:](v19, "setState:", 17);
                -[SFCombinedDevice setNextState:](v19, "setNextState:", 18);

                goto LABEL_20;
              }
              v3 = v19;
              if (dword_1007B1060 <= 90)
              {
                if (dword_1007B1060 != -1 || (v18 = _LogCategory_Initialize(&dword_1007B1060, 90), v3 = v19, v18))
                {
                  LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferPending]", 90, "### No uiID? %@\n", v3);
                  goto LABEL_33;
                }
              }
            }
          }
          else
          {
            v3 = v19;
            if (v10 == 18)
            {
              v11 = -[SFCombinedDevice canTransition:](v19, "canTransition:", 18);
              v3 = v19;
              if (v11)
              {
                -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", mach_absolute_time());
                -[SFCombinedDevice setState:](v19, "setState:", 18);
                -[SFCombinedDevice setDismissReason:](v19, "setDismissReason:", 3);
                -[SFCombinedDevice setNextState:](v19, "setNextState:", 0);
LABEL_20:
                -[SDProxHandoffAgent _run](self, "_run");
LABEL_33:
                v3 = v19;
              }
            }
          }
        }
      }
    }
  }

}

- (void)_runTransferReady
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  SFCombinedDevice *v8;

  v3 = self->_uiDevice;
  if (v3)
  {
    v8 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 17, v3);
    v3 = v8;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v8, "nextState");
      v3 = v8;
      if (v5 == 18)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v8, "effectiveID"));
        if (!v6)
        {
          if (dword_1007B1060 <= 90
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferReady]", 90, "### No UI ID? %@\n", v8);
          }
          goto LABEL_25;
        }
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferReady]", 30, "Run transfer ready %@\n", v8);
        }
        v7 = -[SFCombinedDevice notificationType](v8, "notificationType");
        if (v7 == 2)
        {
          -[SDProxHandoffAgent _proximityClientDeviceEnteredImmediate:](self, "_proximityClientDeviceEnteredImmediate:", v6);
        }
        else
        {
          if (v7 != 3)
          {
            if (dword_1007B1060 <= 90
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
            {
              -[SFCombinedDevice notificationType](v8, "notificationType");
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferReady]", 90, "### Type not supported: %d");
            }
            goto LABEL_25;
          }
          -[SDProxHandoffAgent _runCallHandoffStart:](self, "_runCallHandoffStart:", v8);
        }
        if (-[SFCombinedDevice canTransition:](v8, "canTransition:", 18))
        {
          -[SFCombinedDevice setState:](v8, "setState:", 18);
          -[SFCombinedDevice setNextState:](v8, "setNextState:", 0);
          -[SDProxHandoffAgent _run](self, "_run");
        }
LABEL_25:

        v3 = v8;
      }
    }
  }

}

- (void)_runTransferPendingDismiss
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  double v7;
  unsigned int v8;
  SFCombinedDevice *v9;

  v3 = self->_uiDevice;
  if (v3)
  {
    v9 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 19, v3);
    v3 = v9;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v9, "nextState");
      v3 = v9;
      if (v5 == 20)
      {
        v6 = mach_absolute_time();
        v7 = UpTicksToSecondsF(v6 - -[SFCombinedDevice notificationTicks](v9, "notificationTicks"));
        if (1.5 - v7 > 0.0)
        {
          -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:");
LABEL_12:
          v3 = v9;
          goto LABEL_13;
        }
        -[SFCombinedDevice setNotificationDurationSecs:](v9, "setNotificationDurationSecs:", v7);
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferPendingDismiss]", 30, "Run transfer pending dismiss %f %@\n", *(_QWORD *)&v7, v9);
        }
        v8 = -[SFCombinedDevice canTransition:](v9, "canTransition:", 20);
        v3 = v9;
        if (v8)
        {
          -[SFCombinedDevice setNotificationTicks:](v9, "setNotificationTicks:", -1);
          -[SFCombinedDevice setTransferDoneTicks:](v9, "setTransferDoneTicks:", mach_absolute_time());
          -[SFCombinedDevice setState:](v9, "setState:", 20);
          -[SFCombinedDevice setNextState:](v9, "setNextState:", 0);
          -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v9, 1);
          -[SDProxHandoffAgent _run](self, "_run");
          goto LABEL_12;
        }
      }
    }
  }
LABEL_13:

}

- (void)_runTransferDone
{
  SFCombinedDevice *v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  void *v7;
  unsigned int v8;
  SFCombinedDevice *v9;

  v3 = self->_uiDevice;
  if (v3)
  {
    v9 = v3;
    v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 20, v3);
    v3 = v9;
    if (v4)
    {
      v5 = -[SFCombinedDevice nextState](v9, "nextState");
      v3 = v9;
      if (v5 == 15)
      {
        if (dword_1007B1060 <= 30)
        {
          if (dword_1007B1060 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B1060, 30), v3 = v9, v6))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runTransferDone]", 30, "Run transfer done");
            v3 = v9;
          }
        }
        -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v9, -[SFCombinedDevice dismissReason](v3, "dismissReason"));
        if (-[SFCombinedDevice notificationType](v9, "notificationType") == 2)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v9, "effectiveID"));
          if (v7)
            -[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:](self, "_proximityClientDeviceExitedImmediate:", v7);

        }
        v8 = -[SFCombinedDevice canTransition:](v9, "canTransition:", 15);
        v3 = v9;
        if (v8)
        {
          -[SFCombinedDevice setState:](v9, "setState:", 15);
          -[SFCombinedDevice setNextState:](v9, "setNextState:", 0);
          -[SDProxHandoffAgent _run](self, "_run");
          v3 = v9;
        }
      }
    }
  }

}

- (void)_runCallHandoffStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RPCompanionLinkClient *clinkClient;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  if (self->_clinkClient)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clinkDevice"));
    if (v5)
    {
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffStart:]", 30, "CallHandoff start\n");
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
      v7 = v6;
      if (v6 && (objc_msgSend(v6, "isCurrentlyPicked") & 1) != 0)
      {
        -[SDProxHandoffAgent _runCallHandoffStartDelayTimer](self, "_runCallHandoffStartDelayTimer");

      }
      else
      {

        clinkClient = self->_clinkClient;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveIdentifier"));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000A8D58;
        v10[3] = &unk_1007164F0;
        v10[4] = self;
        -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](clinkClient, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.sharing.calltransfer"), &off_10074E328, v9, 0, v10);

      }
    }
    else if (dword_1007B1060 <= 90
           && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffStart:]", 90, "### CallHandoff start without CompanionLink device? %@\n", v4);
    }

  }
}

- (void)_runCallHandoffHandleResponse:(id)a3 error:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v5)
  {
    if (dword_1007B1060 <= 90
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffHandleResponse:error:]", 90, "### Execute handoff response with error: %@\n", v5);
    }
  }
  else
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffHandleResponse:error:]", 30, "CallHandoff handle response\n");
    }
    -[SDProxHandoffAgent _runCallHandoffStartDelayTimer](self, "_runCallHandoffStartDelayTimer");
  }

}

- (void)_runCallHandoffStartDelayTimer
{
  OS_dispatch_source *delayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    v4 = delayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_delayTimer;
  self->_delayTimer = v6;

  v8 = self->_delayTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A8F14;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet(self->_delayTimer, 0.5, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_delayTimer);
}

- (void)_runCallHandoffHandleDelayTimerFired
{
  OS_dispatch_source *delayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  SFCombinedDevice *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFCombinedDevice *v14;

  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    v4 = delayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  v6 = self->_uiDevice;
  if (v6)
  {
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v6, "effectiveID"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice route](v14, "route"));
      if (v8)
      {
        v9 = -[objc_class sharedInstance](off_1007B10D0(), "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeController"));
        if (objc_msgSend(v8, "isCurrentlyPicked"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "receiverRoute"));
          if (v12)
          {
            if (dword_1007B1060 < 31
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffHandleDelayTimerFired]", 30, "Route already picked, pulling back to local: %@\n", v12);
            }
            objc_msgSend(v11, "pickRoute:", v12);
          }

        }
        else
        {
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIdentifier"));
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffHandleDelayTimerFired]", 30, "Handing off call to route: %@\n", v13);

          }
          objc_msgSend(v11, "pickRoute:", v8);
        }
        -[SDProxHandoffAgent _uiDismissWhenReady:reason:](self, "_uiDismissWhenReady:reason:", v14, 3);
        -[SDProxHandoffAgent _run](self, "_run");

      }
      else if (dword_1007B1060 <= 90
             && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _runCallHandoffHandleDelayTimerFired]", 90, "### No staged route after delay\n");
      }

    }
    v6 = v14;
  }

}

- (void)_bleActionDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleActionDiscovery;
  NSMutableDictionary *bleActionDevices;
  SFCombinedDevice *uiDevice;

  if (self->_bleActionDiscovery)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped]", 30, "BLE action discovery stop\n");
    }
    -[SFDeviceDiscovery invalidate](self->_bleActionDiscovery, "invalidate");
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0;

    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
  }
  -[NSMutableDictionary removeAllObjects](self->_bleActionDevices, "removeAllObjects");
  bleActionDevices = self->_bleActionDevices;
  self->_bleActionDevices = 0;

  uiDevice = self->_uiDevice;
  self->_uiDevice = 0;

  -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
}

- (void)_bleActionDeviceChanged:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SFCombinedDevice *uiDevice;
  id v28;

  v28 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleActionDevices, "objectForKeyedSubscript:", v4));

    if (v5)
      goto LABEL_6;
    v6 = (unsigned __int16)objc_msgSend(v28, "deviceFlags");
    if ((v6 & 0x200) != 0 && (v6 & 0x48) != 0)
    {
      -[SDProxHandoffAgent _bleActionDeviceFoundCandidate:](self, "_bleActionDeviceFoundCandidate:", v28);
LABEL_6:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleActionDevices, "setObject:forKeyedSubscript:", v28, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
      if (!v7)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", v28));
        if (!v7)
          goto LABEL_71;
      }
      objc_msgSend(v7, "setBleDevice:", v28);
      if (-[SDProxHandoffAgent _combinedDeviceIsSuppressed:](self, "_combinedDeviceIsSuppressed:", v7))
        goto LABEL_71;
      -[SDProximityController sender:notifyBluetoothSample:forType:](self->_proximityController, "sender:notifyBluetoothSample:forType:", self, v28, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bleDevice"));
      v9 = objc_msgSend(v8, "insideSmallBubble");

      v10 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v28);
      if (v10 == 1
        && dword_1007B1060 <= 50
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 50)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 50, "#ni_estimator handoff triggered");
      }
      v11 = v10 == 1;
      if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
        v12 = v11;
      else
        v12 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bleDevice"));
      v14 = objc_msgSend(v13, "insideMediumBubble");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bleDevice"));
      v16 = objc_msgSend(v15, "rssiEstimate");

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      if (v12 == 1)
      {
        if (objc_msgSend(v7, "state") == 15)
        {
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@ Retrigger after dismiss (%d)\n", v17, v16);
          }
LABEL_68:
          objc_msgSend(v7, "setState:", 11);
          v25 = v7;
          v26 = 13;
LABEL_69:
          objc_msgSend(v25, "setNextState:", v26);
          uiDevice = self->_uiDevice;
          self->_uiDevice = 0;

          goto LABEL_70;
        }
        if (objc_msgSend(v7, "canTransition:", 16))
        {
          if (self->_stationary || !-[SDProxHandoffAgent _systemCanTrigger](self, "_systemCanTrigger"))
          {
            if (dword_1007B1060 <= 90
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
            {
              if (self->_stationary)
                v23 = "yes";
              else
                v23 = "no";
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 90, "### %@: System state prevents transfer (%d): stationary %s, flags %#{flags}\n", v17, v16, v23, -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags"), &unk_1005CC596);
            }
            goto LABEL_70;
          }
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@: Start transfer countdown (%d)\n", v17, v16);
          }
          objc_msgSend(v7, "setTransferPendingStartTicks:", mach_absolute_time());
          objc_msgSend(v7, "setState:", 16);
          v25 = v7;
          v26 = 17;
          goto LABEL_69;
        }
        if ((v14 & 1) != 0)
        {
LABEL_37:
          if (!objc_msgSend(v7, "canTransition:", 11))
          {
LABEL_70:
            -[SDProxHandoffAgent _proximityClientDeviceUpdated:](self, "_proximityClientDeviceUpdated:", v7);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mappedDevices, "setObject:forKeyedSubscript:", v7, v4);
            -[SDProxHandoffAgent _run](self, "_run");

LABEL_71:
            goto LABEL_72;
          }
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@: Trigger (%d)", v17, v16);
          }
          goto LABEL_68;
        }
      }
      else if ((v14 & 1) != 0)
      {
        if (objc_msgSend(v7, "state") == 20 && objc_msgSend(v7, "canTransition:", 15))
        {
          v18 = mach_absolute_time();
          v19 = UpTicksToSecondsF(v18 - (_QWORD)objc_msgSend(v7, "transferDoneTicks"));
          if (v19 <= self->_prefRetriggerSecs || objc_msgSend(v7, "transferDoneTicks") == (id)-1)
          {
            if (objc_msgSend(v7, "transferDoneTicks") != (id)-1
              && dword_1007B1060 <= 30
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@: Not yet eligible for retrigger after %f (%d)\n", v17, *(_QWORD *)&v19, v16);
            }
          }
          else
          {
            if (dword_1007B1060 <= 30
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@: Make eligible for retrigger after %f (%d)\n", v17, *(_QWORD *)&v19, v16);
            }
            objc_msgSend(v7, "setNextState:", 15);
            objc_msgSend(v7, "setTransferDoneDurationSecs:", v19);
            objc_msgSend(v7, "setTransferDoneTicks:", -1);
          }
          goto LABEL_70;
        }
        goto LABEL_37;
      }
      if (objc_msgSend(v7, "state") == 12)
      {
        v20 = mach_absolute_time();
        v21 = UpTicksToSecondsF(v20 - (_QWORD)objc_msgSend(v7, "pendingContentTicks"));
        if (dword_1007B1060 <= 30)
        {
          v22 = v21;
          if (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30))
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@: Cancel pending content (%d, wait: %f)\n", v17, v16, *(_QWORD *)&v22);
        }
        objc_msgSend(v7, "setState:", 10);
        objc_msgSend(v7, "setPendingContentTicks:", -1);
        objc_msgSend(v7, "setNextState:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "effectiveID"));
        if (v24)
        {
          -[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:](self, "_proximityClientDeviceExitedImmediate:", v24);
          -[SDProxHandoffAgent _proximityClientDeviceDidUnTrigger:](self, "_proximityClientDeviceDidUnTrigger:", v24);
        }

      }
      else if (objc_msgSend(v7, "canTransition:", 10))
      {
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceChanged:]", 30, "%@ exited medium bubble (%d)\n", v17, v16);
        }
        objc_msgSend(v7, "setState:", 10);
        objc_msgSend(v7, "setNextState:", 0);
      }
      goto LABEL_70;
    }
  }
LABEL_72:

}

- (void)_bleActionDeviceFound:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleActionDiscovery)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    if (v4
      && (objc_msgSend(v5, "deviceFlags") & 0x200) != 0
      && (objc_msgSend(v5, "deviceFlags") & 0x48) != 0)
    {
      -[SDProxHandoffAgent _bleActionDeviceFoundCandidate:](self, "_bleActionDeviceFoundCandidate:", v5);
      -[SDProxHandoffAgent _bleActionDeviceChanged:](self, "_bleActionDeviceChanged:", v5);
      -[SDProxHandoffAgent _update](self, "_update");
    }

  }
}

- (void)_bleActionDeviceFoundCandidate:(id)a3
{
  void *v4;
  NSMutableDictionary *bleActionDevices;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v4)
  {
    if ((objc_msgSend(v8, "deviceFlags") & 0x200) != 0)
    {
      if ((objc_msgSend(v8, "deviceFlags") & 0x48) != 0)
      {
        if (dword_1007B1060 <= 10
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceFoundCandidate:]", 10, "BLE action device found: %@\n", v8);
        }
        bleActionDevices = self->_bleActionDevices;
        if (!bleActionDevices)
        {
          v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v7 = self->_bleActionDevices;
          self->_bleActionDevices = v6;

          bleActionDevices = self->_bleActionDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](bleActionDevices, "setObject:forKeyedSubscript:", v8, v4);
        -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v8);
      }
    }
    else if (dword_1007B1060 <= 90
           && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceFoundCandidate:]", 90, "### Found candidate has wrong action type %@\n", v8);
    }
  }

}

- (void)_bleActionDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleActionDevices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      if (dword_1007B1060 <= 10
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionDeviceLost:]", 10, "BLE action device lost: %@\n", v6);
      }
      -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_bleActionDevices, "removeObjectForKey:", v4);
      -[SDProxHandoffAgent _update](self, "_update");
    }
  }

}

- (void)_bleActionScanTimerActivate
{
  OS_dispatch_source *v3;
  OS_dispatch_source *bleActionScanTimer;
  NSObject *v5;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionScanTimerActivate]", 30, "BLE action scan timer activate\n");
  self->_bleActionScanTimedOut = 0;
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bleActionScanTimer = self->_bleActionScanTimer;
  self->_bleActionScanTimer = v3;

  SFDispatchTimerSet(self->_bleActionScanTimer, self->_prefBLEActionScanSecs, -1.0, 250000000.0);
  v5 = self->_bleActionScanTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A9DE0;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionScanTimer);
}

- (void)_bleActionScanTimerInvalidate
{
  OS_dispatch_source *bleActionScanTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (self->_bleActionScanTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionScanTimerInvalidate]", 30, "BLE action scan timer invalidate\n");
    }
    self->_bleActionScanTimedOut = 0;
    bleActionScanTimer = self->_bleActionScanTimer;
    if (bleActionScanTimer)
    {
      v5 = bleActionScanTimer;
      dispatch_source_cancel(v5);
      v4 = self->_bleActionScanTimer;
      self->_bleActionScanTimer = 0;

    }
  }
}

- (void)_bleActionScanTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleActionScanTimerFired]", 30, "BLE action scan timer fired\n");
  self->_bleActionScanTimedOut = 1;
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)_bleInfoDiscoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *bleInfoDiscovery;
  SFDeviceDiscovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleInfoDiscovery)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDiscoveryEnsureStarted]", 30, "BLE info discovery start\n");
    }
    v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleInfoDiscovery, "setChangeFlags:", 9);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleInfoDiscovery, "setDiscoveryFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleInfoDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setFastScanMode:](self->_bleInfoDiscovery, "setFastScanMode:", 1);
    -[SFDeviceDiscovery setPurpose:](self->_bleInfoDiscovery, "setPurpose:", CFSTR("HandoffInfo"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleInfoDiscovery, "setRssiThreshold:", -37);
    -[SFDeviceDiscovery setScanRate:](self->_bleInfoDiscovery, "setScanRate:", 20);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AA0E8;
    v9[3] = &unk_100714FD8;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleInfoDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AA0F4;
    v8[3] = &unk_100714FD8;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleInfoDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000AA100;
    v7[3] = &unk_100715000;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleInfoDiscovery, "setDeviceChangedHandler:", v7);
    v5 = self->_bleInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AA10C;
    v6[3] = &unk_1007147C8;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_bleInfoDeviceChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v9;
  if (self->_bleInfoDiscovery)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    if (v5 && (objc_msgSend(v9, "deviceFlags") & 0x48) != 0)
    {
      if (dword_1007B1060 <= 10
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceChanged:]", 10, "BLE info device changed: %@\n", v9);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleInfoDevices, "objectForKeyedSubscript:", v5));
      if (!v6
        && dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceChanged:]", 90, "### Unknown BLE info device changed?\n");
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
      v8 = objc_msgSend(v7, "rssi");

      if ((unint64_t)v8 <= 0xFFFFFFFFFFFFFFDALL
        && dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceChanged:]", 30, "BLE info device has bad rssi: %d, %@\n", v8, v9);
      }
      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleInfoDevices, "setObject:forKeyedSubscript:", v9, v5);
      -[SDProxHandoffAgent _update](self, "_update");

    }
    v4 = v9;
  }

}

- (void)_bleInfoDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *bleInfoDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v11;
  if (self->_bleInfoDiscovery)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    if (v5 && (objc_msgSend(v11, "deviceFlags") & 0x48) != 0)
    {
      if (dword_1007B1060 <= 10
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceFound:]", 10, "BLE info device found: %@\n", v11);
      }
      bleInfoDevices = self->_bleInfoDevices;
      if (!bleInfoDevices)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_bleInfoDevices;
        self->_bleInfoDevices = v7;

        bleInfoDevices = self->_bleInfoDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](bleInfoDevices, "setObject:forKeyedSubscript:", v11, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
      v10 = objc_msgSend(v9, "rssi");

      if ((unint64_t)v10 <= 0xFFFFFFFFFFFFFFDALL
        && dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceFound:]", 30, "BLE info device has bad rssi: %d, %@\n", v10, v11);
      }
      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v11);
      -[SDProxHandoffAgent _update](self, "_update");
    }

    v4 = v11;
  }

}

- (void)_bleInfoDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    if (dword_1007B1060 <= 10
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleInfoDeviceLost:]", 10, "BLE info device lost: %@\n", v6);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
    if (v5)
      -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v5, 4);

    -[NSMutableDictionary removeObjectForKey:](self->_bleInfoDevices, "removeObjectForKey:", v4);
    -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v6);
    -[SDProxHandoffAgent _update](self, "_update");
  }

}

- (void)_bleDeviceNearbyEnter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));

    v6 = -[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", v11);
    -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
    if (!v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clinkDevice"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaRouteIdentifier"));

        if (v10)
        {
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleDeviceNearbyEnter:]", 30, "Nearby enter (CL.MR): %@\n", v10);
          }
          -[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:](self, "_proximityClientDeviceEnteredNearby:", v10);
        }

      }
    }
    -[SDProxHandoffAgent _update](self, "_update");
  }

}

- (void)_bleDeviceNearbyExit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clinkDevice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaRouteIdentifier"));

      if (v8)
      {
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleDeviceNearbyExit:]", 30, "Nearby exit (CL.MR): %@\n", v8);
        }
        -[SDProxHandoffAgent _proximityClientDeviceExitedNearby:](self, "_proximityClientDeviceExitedNearby:", v8);
      }

    }
    -[NSMutableDictionary removeObjectForKey:](self->_mappedDevices, "removeObjectForKey:", v9);
    -[NSMutableDictionary removeObjectForKey:](self->_bleUnmapped, "removeObjectForKey:", v9);
    -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
    -[SDProxHandoffAgent _update](self, "_update");
    v4 = v9;
  }

}

- (void)_bleUpdateMappingAndNearby
{
  -[CUCoalescer trigger](self->_bleMapCoalescer, "trigger");
}

- (void)_bleUpdateMappingAndNearbyCoalesced
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 10 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingAndNearbyCoalesced]", 10, "Processing unmapped BLE info devices\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleUnmapped, "allValues"));
  v4 = objc_msgSend(v3, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleActionDevices, "allValues", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = -[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
  -[SDProxHandoffAgent _update](self, "_update");

}

- (void)_bleUpdateMappingReset
{
  NSMutableDictionary *bleUnmapped;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSMutableDictionary *mappedDevices;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NSMutableDictionary removeAllObjects](self->_bleUnmapped, "removeAllObjects");
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "effectiveID"));
        if (v10)
        {
          if (objc_msgSend(v9, "stateIsClose"))
            -[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:](self, "_proximityClientDeviceExitedImmediate:", v10);
          if (objc_msgSend(v9, "stateIsMedium"))
            -[SDProxHandoffAgent _proximityClientDeviceDidUnTrigger:](self, "_proximityClientDeviceDidUnTrigger:", v10);
          if (objc_msgSend(v9, "stateIsNearby"))
            -[SDProxHandoffAgent _proximityClientDeviceExitedNearby:](self, "_proximityClientDeviceExitedNearby:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_mappedDevices, "removeAllObjects");
  mappedDevices = self->_mappedDevices;
  self->_mappedDevices = 0;

  -[SDProxHandoffAgent _bleUpdateMappingAndNearby](self, "_bleUpdateMappingAndNearby");
}

- (id)_bleUpdateMappingWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const __CFString *v15;
  unsigned __int8 v16;
  SFCombinedDevice *v17;
  unsigned __int8 v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSMutableDictionary *bleUnmapped;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  int v33;
  char v34;
  char v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  unsigned __int8 v40;
  NSMutableDictionary *mappedDevices;
  NSMutableDictionary *v42;
  NSMutableDictionary *v43;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
    v7 = SFDeviceToRPCompanionLinkDevice(v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (!v8)
    {
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]", 30, "Unable to map BLE info %@\n", v4);
      }
      goto LABEL_26;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
    v13 = (void *)v11;
    if (v11)
    {
      v14 = SFDeviceClassCodeGet(v11, v12);
      if ((v14 - 1) < 2)
      {
        v15 = CFSTR("audioaccessory");
        goto LABEL_6;
      }
      if (v14 == 4)
      {
        if (objc_msgSend(v13, "containsString:", CFSTR("iphone")))
        {

          goto LABEL_15;
        }
        v15 = CFSTR("ipod");
LABEL_6:
        v16 = objc_msgSend(v13, "containsString:", v15);

        if ((v16 & 1) == 0)
          goto LABEL_18;
LABEL_15:
        v18 = objc_msgSend(v4, "deviceFlags");
        if ((v18 & 8) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
          if (objc_msgSend(v21, "decryptedActivityLevel") == 16)
          {
            v22 = 0;
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
            v22 = objc_msgSend(v27, "decryptedActivityLevel");

          }
          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
            v29 = (void *)v28;
            if (v22 > 0xE)
              v30 = "?";
            else
              v30 = off_1007166B8[(char)v22];
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]", 30, "%@ activity level: %s\n", v28, v30);

          }
          if (v22 > 3)
          {
            v19 = 1;
          }
          else
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
            v19 = objc_msgSend(v31, "hasPrefix:", CFSTR("AudioAccessory"));

          }
        }
        else
        {
          v19 = 0;
        }
        v32 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v5));
        v17 = (SFCombinedDevice *)v32;
        if ((v18 & 8) == 0)
        {
          if (v32)
            goto LABEL_72;
          goto LABEL_59;
        }
        if (v32)
          v33 = 1;
        else
          v33 = v19;
        if (v33 == 1)
        {
          if (v32)
            v34 = v19;
          else
            v34 = 1;
          if ((v34 & 1) != 0)
          {
            v35 = v19 ^ 1;
            if (v32)
              v35 = 1;
            if ((v35 & 1) != 0)
            {
LABEL_72:
              -[SFCombinedDevice setBleDevice:](v17, "setBleDevice:", v4);
              v37 = (id)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice clinkDevice](v17, "clinkDevice"));
              v38 = v9;
              v39 = v38;
              if (v37 == v38)
              {

              }
              else
              {
                if (v37)
                {
                  v40 = objc_msgSend(v37, "isEqual:", v38);

                  if ((v40 & 1) != 0)
                    goto LABEL_79;
                }
                else
                {

                }
                -[SFCombinedDevice setClinkDevice:](v17, "setClinkDevice:", v39);
              }
LABEL_79:
              mappedDevices = self->_mappedDevices;
              if (!mappedDevices)
              {
                v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                v43 = self->_mappedDevices;
                self->_mappedDevices = v42;

                mappedDevices = self->_mappedDevices;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](mappedDevices, "setObject:forKeyedSubscript:", v17, v5);
              goto LABEL_30;
            }
LABEL_59:
            if (!v32)
            {
              if (dword_1007B1060 <= 30
                && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "effectiveIdentifier"));
                LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]", 30, "Mapped %@, CL", v4, v36);

              }
              -[NSMutableDictionary removeObjectForKey:](self->_bleUnmapped, "removeObjectForKey:", v5);
              v17 = objc_alloc_init(SFCombinedDevice);
              -[SFCombinedDevice setBleDevice:](v17, "setBleDevice:", v4);
              -[SFCombinedDevice setClinkDevice:](v17, "setClinkDevice:", v9);
              -[SFCombinedDevice setState:](v17, "setState:", 10);
              if (self->_bleActionScanTimedOut || self->_bleActionScanTimer)
              {
                if (dword_1007B1060 <= 30
                  && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
                {
                  LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]", 30, "Restarting BLE action scan timer\n");
                }
                -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
              }
            }
            goto LABEL_72;
          }
          -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v4);

        }
LABEL_29:
        v17 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }

LABEL_18:
    if (dword_1007B1060 <= 60
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 60)))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]", 60, "Invalid candidate model? %@, %@\n", v20, v4);

    }
LABEL_26:
    bleUnmapped = self->_bleUnmapped;
    if (!bleUnmapped)
    {
      v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v25 = self->_bleUnmapped;
      self->_bleUnmapped = v24;

      bleUnmapped = self->_bleUnmapped;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleUnmapped, "setObject:forKeyedSubscript:", v4, v5);
    goto LABEL_29;
  }
  v17 = 0;
LABEL_31:

  return v17;
}

- (void)_clinkEnsureStopped
{
  RPCompanionLinkClient *clinkClient;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clinkClient)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _clinkEnsureStopped]", 30, "CLink stop\n");
    }
    -[RPCompanionLinkClient deregisterRequestID:](self->_clinkClient, "deregisterRequestID:", CFSTR("com.apple.sharing.calltransfer"));
    -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
    clinkClient = self->_clinkClient;
    self->_clinkClient = 0;

  }
}

- (void)_clinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v7 = a3;
  v8 = a5;
  if (SFDeviceClassCodeGet(v8, v9) == 4)
  {
    -[SDProxHandoffAgent _clinkHomePodHandleRequest:responseHandler:](self, "_clinkHomePodHandleRequest:responseHandler:", v7, v8);
  }
  else if (v8)
  {
    v16 = NSLocalizedDescriptionKey;
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960596, 0, 0));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6700, v14));
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v15);

  }
}

- (void)_clinkHomePodHandleRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  if (a4)
  {
    v12 = NSLocalizedDescriptionKey;
    v5 = a4;
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960561, 0, 0));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)v7;
    v9 = CFSTR("?");
    if (v7)
      v9 = (const __CFString *)v7;
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6735, v10));
    (*((void (**)(id, _QWORD, _QWORD, void *))a4 + 2))(v5, 0, 0, v11);

  }
}

- (void)_motionEnsureStopped
{
  if (self->_motionMonitorStarted)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _motionEnsureStopped]", 30, "Motion monitor stop\n");
    }
    -[CMMotionActivityManager stopActivityUpdates](self->_motionMonitor, "stopActivityUpdates");
    self->_motionMonitorStarted = 0;
  }
}

- (void)_motionUpdate:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = v4;
  v8 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "stationary"))
      LODWORD(v4) = objc_msgSend(v8, "confidence") == (id)2;
    else
      LODWORD(v4) = 0;
    v5 = v8;
  }

  if (self->_prefForceStationary)
    LODWORD(v4) = 1;
  if (self->_stationary != (_DWORD)v4)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      v6 = "yes";
      if ((_DWORD)v4)
        v7 = "no";
      else
        v7 = "yes";
      if (!(_DWORD)v4)
        v6 = "no";
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _motionUpdate:]", 30, "Stationary: %s -> %s\n", v7, v6);
    }
    self->_stationary = (char)v4;
    if ((v4 & 1) == 0)
    {
      self->_bleActionScanTimedOut = 0;
      -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
    }
  }
  -[SDProxHandoffAgent _update](self, "_update");

}

- (int)proximityClientStart:(id)a3
{
  id v4;
  NSMutableSet *proxClients;
  NSMutableSet *v6;
  NSMutableSet *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClientStart:]", 30, "Proximity client start\n");
  objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
  proxClients = self->_proxClients;
  if (!proxClients)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_proxClients;
    self->_proxClients = v6;

    proxClients = self->_proxClients;
  }
  -[NSMutableSet addObject:](proxClients, "addObject:", v4);
  -[SDProxHandoffAgent _commonShouldAdvertiseChanged](self, "_commonShouldAdvertiseChanged");
  -[SDProxHandoffAgent _proximityClientSeedInitialDevices:](self, "_proximityClientSeedInitialDevices:", v4);
  -[SDProxHandoffAgent _proximityClientSeedWillTriggerDeviceIfNeeded:](self, "_proximityClientSeedWillTriggerDeviceIfNeeded:", v4);
  -[SDProxHandoffAgent _update](self, "_update");

  return 0;
}

- (void)proximityClientStop:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClientStop:]", 30, "Proximity client stop\n");
  -[NSMutableSet removeObject:](self->_proxClients, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_proxClients, "count"))
  {
    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
    -[NSMutableSet removeAllObjects](self->_suppressedDeviceIDs, "removeAllObjects");
    -[SFNotificationProxy requestRemoveAll](self->_notificationProxy, "requestRemoveAll");
    -[SDProxHandoffAgent _resetAllStates](self, "_resetAllStates");
  }
  -[SDProxHandoffAgent _update](self, "_update");

}

- (void)proximityClientUpdate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ABC2C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (int)proximityClient:(id)a3 dismissContentForDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v7));
    if (v8)
    {
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]", 30, "Proximity client dismiss %@\n", v7);
      }
      -[SDProxHandoffAgent _uiDismissWhenReady:reason:](self, "_uiDismissWhenReady:reason:", v8, 1);
      v9 = 0;
    }
    else
    {
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]", 90, "### Proximity client dismiss without UI Device?\n");
      }
      v9 = -6705;
    }

  }
  else
  {
    if (dword_1007B1060 <= 90
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]", 90, "### Unrecognized client: %@\n", v6);
    }
    v9 = -6700;
  }

  return v9;
}

- (int)proximityClient:(id)a3 provideContent:(id)a4 forDevice:(id)a5 force:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  SFCombinedDevice *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  SFCombinedDevice *uiDevice;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v10) & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v12));
    v14 = (SFCombinedDevice *)v13;
    if (!v6 && !v13)
    {
      if (dword_1007B1060 <= 60
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 60)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]", 60, "### Unexpected content for %@: %@\n", v12, v11);
      }
      v17 = -6709;
      goto LABEL_38;
    }
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
    if (!v15)
    {
      if (!v14 && v6)
      {
        v14 = objc_alloc_init(SFCombinedDevice);
        -[SFCombinedDevice setForced:](v14, "setForced:", 1);
        -[SFCombinedDevice setForcedID:](v14, "setForcedID:", v12);
        -[SFCombinedDevice setNotificationType:](v14, "setNotificationType:", 2);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent mediaTransferInfoFromInfo:](self, "mediaTransferInfoFromInfo:", v11));
      objc_msgSend(v16, "setHomePodType:", -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v14));
      -[SFCombinedDevice setNotificationInfo:](v14, "setNotificationInfo:", v16);
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        v18 = "no";
        if (v6)
          v18 = "yes";
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]", 30, "Proximity client content for: %@, force: %s: %@\n", v14, v18, v16);
      }
      -[SFCombinedDevice setNextState:](v14, "setNextState:", 13);
      uiDevice = self->_uiDevice;
      self->_uiDevice = 0;

      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AC25C;
      block[3] = &unk_1007146D8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
      goto LABEL_37;
    }
    v16 = (void *)v15;
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]", 30, "Proximity client content provided error: %@\n", v11);
    }
    -[SFCombinedDevice setClientProvidedError:](v14, "setClientProvidedError:", 1);
    -[SFCombinedDevice resetTicks](v14, "resetTicks");
    if (-[SFCombinedDevice stateIsClose](v14, "stateIsClose")
      || -[SFCombinedDevice stateIsMedium](v14, "stateIsMedium")
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice bleDevice](v14, "bleDevice")),
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bleDevice")),
          v22 = objc_msgSend(v21, "insideSmallBubble"),
          v21,
          v20,
          (v22 & 1) != 0))
    {
      v19 = 20;
    }
    else
    {
      if (!-[SFCombinedDevice stateIsMedium](v14, "stateIsMedium"))
      {
LABEL_34:
        -[SFCombinedDevice setNextState:](v14, "setNextState:", 0);
LABEL_37:

        v17 = 0;
        goto LABEL_38;
      }
      v19 = 15;
    }
    -[SFCombinedDevice setState:](v14, "setState:", v19);
    goto LABEL_34;
  }
  if (dword_1007B1060 <= 90 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]", 90, "### Unrecognized client: %@\n", v10);
  v17 = -6700;
LABEL_38:

  return v17;
}

- (int)proximityClient:(id)a3 suppressDevice:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *suppressedDeviceIDs;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  SFCombinedDevice *uiDevice;

  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:suppressDevice:]", 30, "Suppressing %@ per client request\n", v7);
    }
    suppressedDeviceIDs = self->_suppressedDeviceIDs;
    if (!suppressedDeviceIDs)
    {
      v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v10 = self->_suppressedDeviceIDs;
      self->_suppressedDeviceIDs = v9;

      suppressedDeviceIDs = self->_suppressedDeviceIDs;
    }
    -[NSMutableSet addObject:](suppressedDeviceIDs, "addObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v7));
    if (v11)
    {
      if (dword_1007B1060 < 31
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:suppressDevice:]", 30, "Suppressed device maps to %@, resetting its state\n", v11);
      }
      objc_msgSend(v11, "resetTicks");
      objc_msgSend(v11, "setState:", 10);
      objc_msgSend(v11, "setNextState:", 0);
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](self->_uiDevice, "effectiveID"));
    v14 = v7;
    v15 = v14;
    if (v13 == v14)
    {

    }
    else
    {
      if ((v14 != 0) == (v13 == 0))
      {

LABEL_30:
        v12 = 0;
        goto LABEL_31;
      }
      v16 = objc_msgSend(v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_30;
    }
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:suppressDevice:]", 30, "Suppressed device matches current UI Device. Resetting UI Device.");
    }
    uiDevice = self->_uiDevice;
    self->_uiDevice = 0;

    goto LABEL_30;
  }
  if (dword_1007B1060 <= 90 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:suppressDevice:]", 90, "### Unrecognized client: %@\n", v6);
  v12 = -6700;
LABEL_31:

  return v12;
}

- (int)proximityClient:(id)a3 stopSuppressingDevice:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:stopSuppressingDevice:]", 30, "Stop suppressing %@ per client request\n", v7);
    }
    -[NSMutableSet removeObject:](self->_suppressedDeviceIDs, "removeObject:", v7);
    v8 = 0;
  }
  else
  {
    if (dword_1007B1060 <= 90
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:stopSuppressingDevice:]", 90, "### Unrecognized client: %@\n", v6);
    }
    v8 = -6700;
  }

  return v8;
}

- (int)proximityClient:(id)a3 updateContent:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v8) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v10));
    v12 = v11;
    if (!v11)
    {
      v17 = -6709;
      goto LABEL_43;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "effectiveID"));
    v14 = v10;
    v15 = v14;
    if (v13 == v14)
    {

    }
    else
    {
      if ((v14 != 0) == (v13 == 0))
      {

        v17 = -6705;
        v18 = v13;
LABEL_42:

        goto LABEL_43;
      }
      v16 = objc_msgSend(v13, "isEqual:", v14);

      if (!v16)
      {
        v17 = -6705;
LABEL_43:

        goto LABEL_44;
      }
    }
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]", 30, "Proximity client update %@\n", v15);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent mediaTransferInfoFromInfo:](self, "mediaTransferInfoFromInfo:", v9));
    objc_msgSend(v18, "setHomePodType:", -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v12));
    objc_msgSend(v12, "setNotificationInfo:", v18);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    if (!v19)
    {
      if (objc_msgSend(v12, "state") == 14 && !objc_msgSend(v12, "nextState"))
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediumBubbleVersion"));
        v20 = 1;
      }
      else
      {
        v13 = v18;
        v20 = 0;
      }
      v21 = objc_msgSend(v12, "clientProvidedError");
      if ((_DWORD)v21)
      {
        objc_msgSend(v12, "setState:", 15);
        objc_msgSend(v12, "setNextState:", 16);
        objc_msgSend(v12, "setClientProvidedError:", 0);
      }
      if ((_DWORD)v20
        && dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]", 30, "Updating with medium bubble variant\n");
      }
      -[SFNotificationProxy requestUpdate:info:mediumVariant:canPostNotification:](self->_notificationProxy, "requestUpdate:info:mediumVariant:canPostNotification:", v15, v13, v20, v21);
      goto LABEL_41;
    }
    v13 = (id)v19;
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]", 30, "Proximity client content updated with error: %@\n", v9);
    }
    -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v15, 1);
    objc_msgSend(v12, "setClientProvidedError:", 1);
    if ((objc_msgSend(v12, "stateIsClose") & 1) != 0)
    {
      v22 = 20;
    }
    else
    {
      if ((objc_msgSend(v12, "stateIsMedium") & 1) == 0)
      {
LABEL_41:
        v17 = 0;
        goto LABEL_42;
      }
      v22 = 15;
    }
    objc_msgSend(v12, "setState:", v22);
    goto LABEL_41;
  }
  if (dword_1007B1060 <= 90 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]", 90, "### Unrecognized client: %@\n", v8);
  v17 = -6700;
LABEL_44:

  return v17;
}

- (int)proximityClientRequestScannerTimerReset:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v4) & 1) != 0)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]", 30, "Proximity client request scanner timer reset\n");
    }
    if (self->_bleActionScanTimedOut || self->_bleActionScanTimer)
    {
      -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
    }
    else if (dword_1007B1060 <= 30
           && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]", 30, "Timer not valid, not activating\n");
    }
    v5 = 0;
  }
  else
  {
    if (dword_1007B1060 <= 90
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]", 90, "### Unrecognized client: %@\n", v4);
    }
    v5 = -6700;
  }

  return v5;
}

- (void)_proximityClientDeviceEnteredImmediate:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceEnteredImmediate:]", 30, "ProxClient deviceEnteredImmediate %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceEnteredImmediateHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceEnteredImmediateHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceExitedImmediate:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:]", 30, "ProxClient deviceExitedImmediate %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceExitedImmediateHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceExitedImmediateHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceEnteredNearby:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:]", 30, "ProxClient deviceEnteredNearby %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceEnteredNearbyHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceEnteredNearbyHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceExitedNearby:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceExitedNearby:]", 30, "ProxClient deviceExitedNearby %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceExitedNearbyHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceExitedNearbyHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceWasDismissed:]", 30, "ProxClient deviceWasDismissed %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWasDismissedHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWasDismissedHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v6, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      if ((unint64_t)(a4 - 1) > 3)
        v7 = CFSTR("?");
      else
        v7 = *(&off_100716730 + a4 - 1);
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceWasDismissed:reason:]", 30, "ProxClient deviceWasDismissed %@, %@\n", v6, v7);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_proxClients;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceWasDismissedHandlerEx"));

          if (v14)
          {
            v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceWasDismissedHandlerEx"));
            ((void (**)(_QWORD, id, int64_t))v15)[2](v15, v6, a4);

          }
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (void)_proximityClientDeviceWasSelected:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceWasSelected:]", 30, "ProxClient deviceWasSelected %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWasSelectedHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWasSelectedHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceWillTrigger:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceWillTrigger:]", 30, "ProxClient deviceWillTrigger %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWillTriggerHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceWillTriggerHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceDidUnTrigger:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v4, "length"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceDidUnTrigger:]", 30, "ProxClient deviceDidUntrigger %@\n", v4);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_proxClients;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceDidUntriggerHandler"));

          if (v11)
          {
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceDidUntriggerHandler"));
            ((void (**)(_QWORD, id))v12)[2](v12, v4);

          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_proximityClientDeviceUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clinkDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRouteIdentifier"));

  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_proxClients;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceUpdateHandler"));

          if (v13)
          {
            if (dword_1007B1060 <= 10
              && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
            {
              LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proximityClientDeviceUpdated:]", 10, "Updating client with %@\n", v4);
            }
            v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceUpdateHandler"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bleDevice"));
            ((void (**)(_QWORD, void *, id, _QWORD))v14)[2](v14, v6, objc_msgSend(v16, "rssi"), (int)objc_msgSend(v4, "state"));

          }
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
}

- (void)_proximityClientSeedInitialDevices:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000ADCAC;
  v10[4] = sub_1000ADCBC;
  v11 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues"));
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ADCC4;
  v7[3] = &unk_100716540;
  v8 = v4;
  v9 = v10;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

  _Block_object_dispose(v10, 8);
}

- (void)_proximityClientSeedWillTriggerDeviceIfNeeded:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDProxHandoffAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ADEF4;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_serviceEnsureStarted
{
  SFProxHandoffService *v3;
  SFProxHandoffService *bleActionService;
  SFProxHandoffService *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleActionService)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _serviceEnsureStarted]", 30, "BLE action service start\n");
    }
    v3 = (SFProxHandoffService *)objc_alloc_init((Class)SFProxHandoffService);
    bleActionService = self->_bleActionService;
    self->_bleActionService = v3;

    -[SFProxHandoffService setDispatchQueue:](self->_bleActionService, "setDispatchQueue:", self->_dispatchQueue);
    v5 = self->_bleActionService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AE124;
    v6[3] = &unk_1007147C8;
    v6[4] = self;
    -[SFProxHandoffService activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serviceTimeoutActivate
{
  OS_dispatch_source *v3;
  OS_dispatch_source *bleActionServiceTimer;
  NSObject *v5;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDProxHandoffAgent _serviceTimeoutInvalidate](self, "_serviceTimeoutInvalidate");
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _serviceTimeoutActivate]", 30, "BLE action service timeout activate\n");
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bleActionServiceTimer = self->_bleActionServiceTimer;
  self->_bleActionServiceTimer = v3;

  SFDispatchTimerSet(self->_bleActionServiceTimer, 60.0, -1.0, 250000000.0);
  v5 = self->_bleActionServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000AE308;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionServiceTimer);
}

- (void)_serviceTimeoutInvalidate
{
  OS_dispatch_source *bleActionServiceTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (self->_bleActionServiceTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _serviceTimeoutInvalidate]", 30, "BLE action service timeout invalidate\n");
    }
    bleActionServiceTimer = self->_bleActionServiceTimer;
    if (bleActionServiceTimer)
    {
      v5 = bleActionServiceTimer;
      dispatch_source_cancel(v5);
      v4 = self->_bleActionServiceTimer;
      self->_bleActionServiceTimer = 0;

    }
  }
}

- (void)_serviceTimeoutFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _serviceTimeoutFired]", 30, "BLE action service timeout fired\n");
  -[SDProxHandoffAgent _serviceTimeoutInvalidate](self, "_serviceTimeoutInvalidate");
}

- (void)_throttleEventDidOccur
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _throttleEventDidOccur]", 30, "Throttle event did occur\n");
  -[SDProxHandoffAgent _throttleEventSet:](self, "_throttleEventSet:", self->_prefThrottleEventCount + 1);
}

- (void)_throttleEventSet:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _throttleEventSet:]", 30, "Throttle event set: %d\n", a3);
  CFPrefs_SetInt64(CFSTR("com.apple.Sharing"), CFSTR("chThrottleEventCount"), a3);
  -[SDProxHandoffAgent prefsChanged](self, "prefsChanged");
}

- (BOOL)_throttleEventsReachedMax
{
  return !self->_prefIgnoreMediumThrottle && self->_prefThrottleEventCount >= self->_prefThrottleEventMax;
}

- (void)_throttleEventsReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _throttleEventsReset]", 30, "Throttle event reset\n");
  -[SDProxHandoffAgent _throttleEventSet:](self, "_throttleEventSet:", 0);
}

- (BOOL)_throttleMediumAllowsTrigger
{
  uint64_t v4;

  if (self->_prefIgnoreMediumThrottle || self->_prefMediumBubbleLastTicks == -1)
    return 1;
  v4 = mach_absolute_time();
  return 64800.0 - UpTicksToSecondsF(v4 - self->_prefMediumBubbleLastTicks) <= 0.0;
}

- (void)_throttleMediumReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _throttleMediumReset]", 30, "Throttle medium reset\n");
  -[SDProxHandoffAgent _throttleMediumSetTicks:](self, "_throttleMediumSetTicks:", -1);
}

- (void)_throttleMediumSetTicks:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _throttleMediumSetTicks:]", 30, "Throttle medium set ticks: %d\n", a3);
  CFPrefs_SetInt64(CFSTR("com.apple.Sharing"), CFSTR("chThrottleMediumTicks"), a3);
  -[SDProxHandoffAgent prefsChanged](self, "prefsChanged");
}

- (void)_proxiedNotificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[6];
  _QWORD v28[6];

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v6));
  v8 = v7;
  if (!v7)
    goto LABEL_29;
  v9 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 3)
    v10 = CFSTR("?");
  else
    v10 = *(&off_100716730 + v9);
  v11 = objc_msgSend(v7, "notificationType");
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    if (v9 > 3)
      v12 = CFSTR("?");
    else
      v12 = *(&off_100716730 + v9);
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:]", 30, "Notification did dismiss %@, %@\n", v6, v12);
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "effectiveID"));
  v14 = v6;
  v15 = v14;
  if (v13 == v14)
  {
    v26 = v10;

  }
  else
  {
    if ((v14 != 0) == (v13 == 0))
    {

LABEL_25:
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:]", 90, "### Unrecognized UI ID: %@\n", v15);
      }
      goto LABEL_29;
    }
    v26 = v10;
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_25;
  }
  -[SDProxHandoffAgent _proximityClientDeviceWasDismissed:reason:](self, "_proximityClientDeviceWasDismissed:reason:", v15, a4);
  v17 = objc_msgSend(v8, "canTransition:", 15);
  if (v9 <= 1 && v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bleDevice"));
    v20 = objc_msgSend(v19, "insideSmallBubble");

    if ((v20 & 1) == 0)
      objc_msgSend(v8, "setNextState:", 15);
    objc_msgSend(v8, "setDismissReason:", a4);
    -[SDProxHandoffAgent _run](self, "_run");
  }
  v27[0] = CFSTR("notificationDurationSecs");
  objc_msgSend(v8, "notificationDurationSecs");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v28[0] = v21;
  v27[1] = CFSTR("notificationType");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
  v28[1] = v22;
  v27[2] = CFSTR("pendingContentSecs");
  objc_msgSend(v8, "pendingContentDurationSecs");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v28[2] = v23;
  v27[3] = CFSTR("reason");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v28[3] = v24;
  v28[4] = v26;
  v27[4] = CFSTR("reasonStr");
  v27[5] = CFSTR("uiID");
  v28[5] = v15;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 6));
  SFMetricsLog(CFSTR("com.apple.sharing.HomePodHandoff.NotificationDidDismiss"), v25);

LABEL_29:
}

- (void)_proxiedNotificationWasTapped:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  SDProxHandoffAgent *v13;
  void *v14;
  void *v15;
  signed int v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _BYTE v45[128];
  _BYTE v46[128];

  v4 = a3;
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]", 30, "Notification was tapped %@\n", v4);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v32 = 0;
    v33 = 0;
    v34 = *(_QWORD *)v40;
    v8 = 0x7FFFFFFF;
    obj = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v10));
        v12 = v11;
        if (v11)
        {
          v13 = self;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bleDevice"));
          v16 = objc_msgSend(v15, "rssiEstimate");

          v17 = v16;
          v18 = v8;
          if ((unint64_t)v16 <= 0x8000000000000000)
            v17 = 0x8000000000000000;
          if ((unint64_t)v8 <= 0x8000000000000000)
            v18 = 0x8000000000000000;
          if (v17 > v18)
          {
            v19 = v12;

            v20 = v10;
            v32 = v20;
            v33 = v19;
            v8 = v16;
          }
          self = v13;
        }

      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);

    if (v33)
    {
      v21 = v32;
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]", 30, "Closest device: %@\n", v33);
      }
      if (!self->_userOnCall)
        -[SDProxHandoffAgent _proximityClientDeviceWasSelected:](self, "_proximityClientDeviceWasSelected:", v32);
      if (objc_msgSend(v33, "canTransition:", 18))
      {
        objc_msgSend(v33, "setNextState:", 18);
        -[SDProxHandoffAgent _run](self, "_run");
      }
      v23 = objc_msgSend(obj, "mutableCopy");
      objc_msgSend(v23, "removeObject:", v32);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v24);
            -[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:](self, "_proxiedNotificationDidDismiss:reason:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), 2);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v26);
      }

      v43[0] = CFSTR("onCall");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_userOnCall));
      v43[1] = CFSTR("uiID");
      v44[0] = v29;
      v44[1] = v32;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
      SFMetricsLog(CFSTR("com.apple.sharing.HomePodHandoff.NotificationWasTapped"), v30);

      v5 = obj;
      v22 = v33;
      goto LABEL_44;
    }
    v21 = v32;
  }
  else
  {

    v21 = 0;
  }
  if (dword_1007B1060 <= 90 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]", 90, "### Unable to determine closest device\n");
  v22 = 0;
LABEL_44:

}

- (void)notificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEFC4;
  block[3] = &unk_100715D08;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)userDidTapNotification:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AF08C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_hapticsFireNotificationSuccess
{
  if (SFDeviceClassCodeGet(self, a2) != 4)
  {
    if (!self->_hapticNotification)
      -[SDProxHandoffAgent _hapticsEnsurePrepared](self, "_hapticsEnsurePrepared");
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _hapticsFireNotificationSuccess]", 30, "Haptics fire notification success");
    }
    -[UINotificationFeedbackGenerator notificationOccurred:](self->_hapticNotification, "notificationOccurred:", 0);
  }
}

- (void)_hapticsEnsurePrepared
{
  UINotificationFeedbackGenerator *v3;
  UINotificationFeedbackGenerator *hapticNotification;

  if (SFDeviceClassCodeGet(self, a2) != 4)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _hapticsEnsurePrepared]", 30, "Haptics prepare\n");
    }
    v3 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
    hapticNotification = self->_hapticNotification;
    self->_hapticNotification = v3;

    -[UINotificationFeedbackGenerator prepare](self->_hapticNotification, "prepare");
  }
}

- (void)_hapticsEnsureStopped
{
  UINotificationFeedbackGenerator *hapticNotification;

  hapticNotification = self->_hapticNotification;
  self->_hapticNotification = 0;

}

- (void)_uiDismissWhenReady:(id)a3 reason:(int64_t)a4
{
  uint64_t v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = mach_absolute_time();
  v7 = UpTicksToSecondsF(v6 - (_QWORD)objc_msgSend(v11, "notificationTicks"));
  if (1.5 - v7 > 0.0)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _uiDismissWhenReady:reason:]", 30, "Notification only displayed for %f, delaying dismiss\n", v7);
    }
    if (objc_msgSend(v11, "canTransition:", 19))
    {
      objc_msgSend(v11, "setDismissReason:", a4);
      objc_msgSend(v11, "setNextState:", 19);
      -[SDProxHandoffAgent _run](self, "_run");
    }
    -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:", 1.5 - v7);
    goto LABEL_17;
  }
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _uiDismissWhenReady:reason:]", 30, "Dismiss notification after %f\n", v7);
  objc_msgSend(v11, "setNotificationDurationSecs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "effectiveID"));
  if (v8)
    -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v8, a4);

  v9 = objc_msgSend(v11, "canTransition:", 20);
  v10 = v11;
  if (v9)
  {
    objc_msgSend(v11, "setDismissReason:", a4);
    objc_msgSend(v11, "setNextState:", 20);
    -[SDProxHandoffAgent _run](self, "_run");
LABEL_17:
    v10 = v11;
  }

}

- (void)_uiStopIfNeeded:(id)a3 reason:(int64_t)a4
{
  id v6;
  uint64_t v7;
  SFCombinedDevice *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];

  v6 = a3;
  if (SFDeviceClassCodeGet(v6, v7) - 1 <= 1)
  {
    v8 = self->_uiDevice;
    if (!v8)
    {
LABEL_31:

      goto LABEL_32;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "effectiveID"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](self->_uiDevice, "effectiveID"));
      v11 = v9;
      v12 = v10;
      if (v11 == v12)
      {

        goto LABEL_9;
      }
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if (!v14)
          goto LABEL_30;
LABEL_9:
        if ((unint64_t)(a4 - 1) > 3)
          v15 = CFSTR("?");
        else
          v15 = *(&off_100716730 + a4 - 1);
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _uiStopIfNeeded:reason:]", 30, "Presented UI Stop: %@, %@\n", v11, v15);
        }
        -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v11, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachmentURL"));
        if (v16)
        {
          v28 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v29 = 0;
          v18 = objc_msgSend(v17, "removeItemAtURL:error:", v16, &v29);
          v19 = v29;

          if (dword_1007B1060 <= 30
            && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
          {
            if ((_DWORD)v18)
              v20 = "yes";
            else
              v20 = "no";
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
            v22 = (void *)v21;
            v23 = &stru_10072FE60;
            if (v21)
              v23 = (const __CFString *)v21;
            LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _uiStopIfNeeded:reason:]", 30, "Deleted %@: %s %@\n", v16, v20, v23);

          }
          v15 = v28;
        }
        else
        {
          v18 = 0;
        }

        v30[0] = CFSTR("deletedAttachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18));
        v31[0] = v24;
        v30[1] = CFSTR("notificationType");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "notificationType")));
        v31[1] = v25;
        v30[2] = CFSTR("reason");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
        v31[2] = v26;
        v31[3] = v15;
        v30[3] = CFSTR("reasonStr");
        v30[4] = CFSTR("uiID");
        v31[4] = v11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 5));
        SFMetricsLog(CFSTR("com.apple.sharing.HomePodHandoff.UIStop"), v27);

        goto LABEL_30;
      }

    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_32:

}

- (id)_combinedDeviceForUIID:(id)a3
{
  id v4;
  NSMutableDictionary *mappedDevices;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000ADCAC;
  v16 = sub_1000ADCBC;
  v17 = 0;
  mappedDevices = self->_mappedDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AF8C4;
  v9[3] = &unk_1007165B8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_combinedDeviceIsSuppressed:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveID"));
  v6 = v5 && (-[NSMutableSet containsObject:](self->_suppressedDeviceIDs, "containsObject:", v5) & 1) != 0;

  return v6;
}

- (BOOL)_expectingContentForDeviceID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)_combinedDevicePrepareForCallTransferTrigger:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setNotificationType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _routeForDevice:](self, "_routeForDevice:", v6));
  if (v4)
    objc_msgSend(v6, "setRoute:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent callTransferInfoForDevice:](self, "callTransferInfoForDevice:", v6));
  if (v5)
    objc_msgSend(v6, "setNotificationInfo:", v5);

}

- (void)_resetAllStates
{
  SFCombinedDevice *uiDevice;
  NSMutableDictionary *mappedDevices;
  _QWORD v5[5];

  uiDevice = self->_uiDevice;
  self->_uiDevice = 0;

  mappedDevices = self->_mappedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AFB24;
  v5[3] = &unk_1007165E0;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  -[SDProxHandoffAgent _run](self, "_run");
}

- (id)_routeForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _routes](self, "_routes"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clinkDevice"));
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
        v12 = SFDeviceToRPCompanionLinkDevice(v6, v11);
        v9 = (id)objc_claimAutoreleasedReturnValue(v12);

      }
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v5;
      v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v22 = v4;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v13);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            if (sub_1000A46D8(v6, v16, v9))
            {
              v17 = v16;
              v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueIdentifier"));
              if (v18)
              {
                v19 = (void *)v18;
                v20 = objc_msgSend(v17, "isHomePodFamily");

                if ((v20 & 1) != 0)
                {
                  v10 = v17;
                  goto LABEL_22;
                }
              }
              else
              {

              }
            }
          }
          v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v10);
LABEL_22:
        v4 = v22;
      }

    }
    else
    {
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _routeForDevice:]", 90, "### Cannot find route without a BLE device.\n");
      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_routes
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[objc_class sharedInstance](off_1007B10D0(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routes"));

  return v5;
}

- (BOOL)_shouldMediumPromptWithInfo:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!self->_prefMediumBubbleEnabled)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _shouldMediumPromptWithInfo:]", 30, "Shouldn't prompt medium, disabled via pref\n");
    }
    goto LABEL_20;
  }
  if (-[SDProxHandoffAgent _throttleEventsReachedMax](self, "_throttleEventsReachedMax"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _shouldMediumPromptWithInfo:]", 30, "Shouldn't prompt medium, maximum trigger events reached\n");
    }
LABEL_20:
    v5 = 0;
    goto LABEL_21;
  }
  if (!-[SDProxHandoffAgent _throttleMediumAllowsTrigger](self, "_throttleMediumAllowsTrigger"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent _shouldMediumPromptWithInfo:]", 30, "Shouldn't prompt medium, recently triggered\n");
    }
    goto LABEL_20;
  }
  v5 = objc_msgSend(v4, "interactionBehavior") == 2;
LABEL_21:

  return v5;
}

- (id)callTransferInfoForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CGImage *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v40;

  v4 = a3;
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent callTransferInfoForDevice:]", 30, "Generating call transfer notification info\n");
  v5 = objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent currentCall](self, "currentCall"));
  if (!v5
    && dword_1007B1060 <= 90
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
  {
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent callTransferInfoForDevice:]", 90, "### No current call?\n");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent contactForCall:](self, "contactForCall:", v5));
  if (!v6
    && dword_1007B1060 <= 90
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
  {
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent callTransferInfoForDevice:]", 90, "### No contact for call?\n");
  }
  v7 = -[SDProxHandoffAgent appIconForCall:](self, "appIconForCall:", v5);
  if (!v7
    && dword_1007B1060 <= 90
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
  {
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent callTransferInfoForDevice:]", 90, "### No app icon for call?\n");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent persistImageForContact:withAppIcon:](self, "persistImageForContact:withAppIcon:", v6, v7));
  if (v8)
  {
    objc_msgSend(v4, "setAttachmentURL:", v8);
  }
  else if (dword_1007B1060 <= 30
         && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent callTransferInfoForDevice:]", 30, "### No URL for contact image\n");
  }
  v9 = objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent displayNameForContact:](self, "displayNameForContact:", v6));
  v11 = (void *)v9;
  v40 = (void *)v5;
  if (!v9)
  {

    v16 = 0;
LABEL_33:
    v20 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_MESSAGE_CALL_GENERIC"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_34;
  }
  v13 = SFDeviceClassCodeGet(v9, v10) - 1;
  if (v13 >= 3)
    v14 = CFSTR("HOMEPOD_HANDOFF_MESSAGE_CALL_PEER");
  else
    v14 = *(&off_100716750 + (char)v13);
  v17 = SFLocalizedStringForKey(v14, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v11, v5));

  if (!v16)
    goto LABEL_33;
  v19 = v16;
  if (!objc_msgSend(v16, "length"))
    goto LABEL_33;
LABEL_34:
  v21 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING"), v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  v24 = v23;
  if (v23 && (v25 = objc_msgSend(v23, "isCurrentlyPicked"), (_DWORD)v25))
  {
    v27 = SFDeviceClassCodeGet(v25, v26);
    v29 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_GENERIC");
    if (v27 == 2)
      v29 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPOD");
    if (v27 == 1)
      v30 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPHONE");
    else
      v30 = v29;
    v31 = SFLocalizedStringForKey(v30, v28);
    v32 = objc_claimAutoreleasedReturnValue(v31);

    v33 = 1;
    v22 = (void *)v32;
  }
  else
  {
    v33 = 2;
  }

  v34 = objc_alloc_init((Class)SFNotificationInfo);
  v35 = v34;
  if (v8)
    objc_msgSend(v34, "setAttachmentURL:", v8);
  objc_msgSend(v35, "setBody:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v37 = SFHomePodDisplayNameForDeviceName();
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v35, "setHeader:", v38);

  objc_msgSend(v35, "setInteractionBehavior:", 2);
  objc_msgSend(v35, "setInteractionDirection:", v33);
  objc_msgSend(v35, "setNotificationType:", 3);
  objc_msgSend(v35, "setTitle:", v22);
  objc_msgSend(v35, "setHomePodType:", -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v4));

  return v35;
}

- (BOOL)callTransferShouldPush:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isCurrentlyPicked") ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (id)mediaTransferInfoFromInfo:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v11;
  void *v12;

  v3 = objc_msgSend(a3, "copy");
  v4 = objc_msgSend(v3, "setNotificationType:", 2);
  v6 = SFDeviceClassCodeGet(v4, v5);
  v7 = objc_msgSend(v3, "interactionDirection");
  if (!objc_msgSend(v3, "interactionBehavior"))
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent mediaTransferInfoFromInfo:]", 30, "No interaction behavior provided, using default (prompt)\n");
    }
    objc_msgSend(v3, "setInteractionBehavior:", 2);
  }
  if (v7 == 2)
  {
    v9 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING");
  }
  else if (v7 == 1 && v6 == 2)
  {
    v9 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPOD");
  }
  else if (v6 != 2 && v7 == 1)
  {
    v9 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPHONE");
  }
  else
  {
    v9 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_GENERIC");
  }
  v11 = SFLocalizedStringForKey(v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setTitle:", v12);

  return v3;
}

- (unint64_t)notificationHomePodTypeForDevice:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bleDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AudioAccessory5,1"));

  if (v5)
    return 2;
  else
    return 1;
}

- (CGImage)appIconForCall:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGImage *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "provider"));
    v4 = v3;
    if (!v3)
    {
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent appIconForCall:]", 90, "### No call provider?\n");
      }
      goto LABEL_29;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayAppBundleIdentifier"));
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithBundleIdentifier:", v5);

      if (v6)
        goto LABEL_21;
    }
    else
    {

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inCallUIBundleIdentifier"));
    if (v8)
    {
      v6 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithBundleIdentifier:", v8);

      if (v6)
        goto LABEL_21;
    }
    else
    {

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    if (!v9)
    {

LABEL_19:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleURL"));
      if (v10)
      {
        v6 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithURL:", v10);

        if (v6)
          goto LABEL_21;
      }
      else
      {

      }
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent appIconForCall:]", 90, "### Failed to create ISIcon?\n");
      }
LABEL_29:
      v7 = 0;
      goto LABEL_30;
    }
    v6 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithBundleIdentifier:", v9);

    if (!v6)
      goto LABEL_19;
LABEL_21:
    v11 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 12.0, 12.0, 3.0);
    v7 = (CGImage *)objc_msgSend(v6, "CGImageForImageDescriptor:", v11);

LABEL_30:
    return v7;
  }
  return 0;
}

- (id)contactForCall:(id)a3
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  _QWORD v14[5];

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contactIdentifier"));
  if (v3)
  {
    v4 = -[objc_class sharedInstance](off_1007B10D0(), "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
    v14[0] = v7;
    v14[1] = CNContactThumbnailImageDataKey;
    v14[2] = CNContactGivenNameKey;
    v14[3] = CNContactFamilyNameKey;
    v14[4] = CNContactTypeKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));
    v13 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v3, v8, &v13));
    v10 = v13;
    if (v9)
    {
      v11 = v9;
    }
    else if (dword_1007B1060 <= 90
           && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent contactForCall:]", 90, "### Error fetching contact %@: %@", v3, v10);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)currentCall
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[objc_class sharedInstance](off_1007B10D0(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCalls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  if (v5
    && dword_1007B1060 <= 10
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
  {
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent currentCall]", 10, "Current call: %@\n", v5);
  }

  return v5;
}

- (id)displayNameForContact:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", a3, 0));
  else
    return 0;
}

- (id)persistImageForContact:(id)a3 withAppIcon:(CGImage *)a4
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  CGImage *v9;
  CGImage *v10;
  void *v11;
  _QWORD v13[5];

  v5 = a3;
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent persistImageForContact:withAppIcon:]", 30, "persistImageForContact:%@ withAppIcon:%@\n", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCHelperConnection makeActivatedConnection](SDXPCHelperConnection, "makeActivatedConnection"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B0B84;
  v13[3] = &unk_1007146D8;
  v13[4] = v6;
  v7 = objc_retainBlock(v13);
  if (a4)
  {
    v8 = SFDataFromCGImage(a4);
    v9 = (CGImage *)objc_claimAutoreleasedReturnValue(v8);
    a4 = v9;
    if (v9)
      v10 = v9;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlToCGImgDataForCallHandoffIconWithAppIconImageData:contact:", a4, v5));

  ((void (*)(_QWORD *))v7[2])(v7);
  return v11;
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (dword_1007B1060 <= 50 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 50)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent proximityDeviceDidTrigger:]", 50, "#ni_estimator handoff delegate triggered for device: %@", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleActionDevices, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0C84;
    block[3] = &unk_100714860;
    block[4] = self;
    v8 = v4;
    dispatch_async(dispatchQueue, block);

  }
}

- (void)testUI:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  SFCombinedDevice *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  v5 = objc_alloc((Class)NSUUID);
  v6 = objc_msgSend(v4, "containsString:", CFSTR("fail"));

  if (v6)
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  else
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  v32 = objc_msgSend(v5, "initWithUUIDString:", v7);
  v8 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v8, "setIdentifier:", v32);
  objc_msgSend(v8, "setName:", CFSTR("Living Room HomePod"));
  v9 = objc_msgSend(objc_alloc(off_1007B10D8()), "initWithUniqueIdentifier:name:", CFSTR("uniqueID"), CFSTR("Living Room"));
  objc_msgSend(v9, "setDeviceType:", 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent currentCall](self, "currentCall"));
  if (v10)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent testUI:]", 30, "TEST UI: User is on call\n");
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent contactForCall:](self, "contactForCall:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent persistImageForContact:withAppIcon:](self, "persistImageForContact:withAppIcon:", v11, -[SDProxHandoffAgent appIconForCall:](self, "appIconForCall:", v10)));
    if (v12)
    {
      v13 = v12;
      v14 = v13;
      goto LABEL_13;
    }

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "meCard"));

  v11 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithBundleIdentifier:", CFSTR("com.apple.mobilephone"));
  v14 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 12.0, 12.0, 3.0);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent persistImageForContact:withAppIcon:](self, "persistImageForContact:withAppIcon:", v10, objc_msgSend(v11, "CGImageForImageDescriptor:", v14)));
LABEL_13:
  v16 = v13;

  v17 = objc_alloc_init((Class)SFNotificationInfo);
  objc_msgSend(v17, "setAttachmentURL:", v16);
  v19 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_MESSAGE_CALL_GENERIC"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v17, "setBody:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  if (v22)
  {
    objc_msgSend(v17, "setHeader:", v22);
  }
  else
  {
    v23 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_HEADER_DEFAULT"), v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v17, "setHeader:", v24);

  }
  objc_msgSend(v17, "setNotificationType:", 3);
  v26 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TALK_HOMEPOD"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v17, "setTitle:", v27);

  v28 = objc_alloc_init(SFCombinedDevice);
  v29 = objc_alloc_init((Class)RPCompanionLinkDevice);
  -[SFCombinedDevice setClinkDevice:](v28, "setClinkDevice:", v29);

  -[SFCombinedDevice setForced:](v28, "setForced:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
  -[SFCombinedDevice setForcedID:](v28, "setForcedID:", v31);

  -[SFCombinedDevice setNotificationInfo:](v28, "setNotificationInfo:", v17);
  -[SFCombinedDevice setNotificationType:](v28, "setNotificationType:", 3);
  -[SFCombinedDevice setRoute:](v28, "setRoute:", v9);
  -[SFCombinedDevice setBleDevice:](v28, "setBleDevice:", v8);
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SDProxHandoffAgent testUI:]", 30, "Testing UI with device: %@\n", v28);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_uiDevice, 0);
  objc_storeStrong((id *)&self->_transferTimer, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_suppressedDeviceIDs, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_proxClients, 0);
  objc_storeStrong((id *)&self->_notificationProxy, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_mappedDevices, 0);
  objc_storeStrong((id *)&self->_hapticNotification, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_bleUnmapped, 0);
  objc_storeStrong((id *)&self->_bleMapCoalescer, 0);
  objc_storeStrong((id *)&self->_bleInfoDevices, 0);
  objc_storeStrong((id *)&self->_bleInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_bleActionServiceTimer, 0);
  objc_storeStrong((id *)&self->_bleActionService, 0);
  objc_storeStrong((id *)&self->_bleActionScanTimer, 0);
  objc_storeStrong((id *)&self->_bleActionDevices, 0);
  objc_storeStrong((id *)&self->_bleActionDiscovery, 0);
}

@end
