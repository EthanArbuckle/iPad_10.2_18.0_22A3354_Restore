@implementation AAConversationDetectSessionManager

+ ($D59FE58F0A2FC780966BA190996C80C3)defaultAudioTunings
{
  *(_OWORD *)&retstr->var0.var0 = xmmword_100184560;
  *(_OWORD *)&retstr->var2.var0 = xmmword_100184570;
  *(_OWORD *)&retstr->var4.var0 = xmmword_100184580;
  *(int64x2_t *)&retstr->var6.var0 = vdupq_n_s64(0x3E99999A3F800000uLL);
  return result;
}

+ (id)sharedCDSessionManager
{
  if (qword_100212568 != -1)
    dispatch_once(&qword_100212568, &stru_1001E2370);
  return (id)qword_100212560;
}

- (AAConversationDetectSessionManager)init
{
  char *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AAConversationDetectSessionManager;
  v2 = -[AAConversationDetectSessionManager init](&v22, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("AACDSessionManager", v4);
    v6 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("AACDChunkedRampQueue", v8);
    v10 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v9;

    v11 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v11;

    *((_DWORD *)v2 + 57) = -1;
    +[AAConversationDetectSessionManager defaultAudioTunings](AAConversationDetectSessionManager, "defaultAudioTunings");
    v14 = v20;
    v13 = v21;
    v15 = v19;
    *(_OWORD *)(v2 + 24) = v18;
    *(_OWORD *)(v2 + 40) = v15;
    *(_OWORD *)(v2 + 56) = v14;
    *(_OWORD *)(v2 + 72) = v13;
    *((_DWORD *)v2 + 48) = -1;
    v16 = v2;
  }

  return (AAConversationDetectSessionManager *)v2;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  CBDiscovery *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  CBDiscovery *v16;
  AAConversationDetectSessionManager *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  AAConversationDetectSessionManager *v22;
  _QWORD v23[4];
  id v24;
  AAConversationDetectSessionManager *v25;
  _QWORD v26[4];
  id v27;
  AAConversationDetectSessionManager *v28;
  _QWORD handler[5];

  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager activate]", 30, "AAConversationDetectSessionManager activate");
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000A484;
    handler[3] = &unk_1001E2398;
    handler[4] = self;
    notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  -[AAConversationDetectSessionManager _prefsChanged](self, "_prefsChanged");
  v4 = self->_connectedDeviceDiscovery;
  if (!v4)
  {
    v5 = objc_alloc_init((Class)CBDiscovery);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v5);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000A4F4;
    v26[3] = &unk_1001E23C0;
    v6 = v5;
    v27 = v6;
    v28 = self;
    objc_msgSend(v6, "setDeviceFoundHandler:", v26);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000A510;
    v23[3] = &unk_1001E23C0;
    v7 = v6;
    v24 = v7;
    v25 = self;
    objc_msgSend(v7, "setDeviceLostHandler:", v23);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000A52C;
    v20[3] = &unk_1001E23E8;
    v8 = v7;
    v21 = v8;
    v22 = self;
    objc_msgSend(v8, "setInterruptionHandler:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A5BC;
    v18[3] = &unk_1001E20E8;
    v9 = v8;
    v19 = v9;
    objc_msgSend(v9, "setInvalidationHandler:", v18);
    objc_msgSend(v9, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v9, "discoveryFlags") | 0x80000200000);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10000A638;
    v15 = &unk_1001E2410;
    v4 = (CBDiscovery *)v9;
    v16 = v4;
    v17 = self;
    -[CBDiscovery activateWithCompletion:](v4, "activateWithCompletion:", &v12);

  }
  v10 = -[AAConversationDetectSessionManager _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted", v12, v13, v14, v15);
  if (!self->_cdMsgReceivedObserving && IsAppleInternalBuild(v10))
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager activate]", 30, "Registering for Conversation Detect Tunings Messages");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "_cdMsgNotificationReceivedHandler:", CFSTR("com.apple.AudioAccessory.cdMsgNotification"), 0);
    self->_cdMsgReceivedObserving = 1;

  }
}

- (void)_aaControllerEnsureStarted
{
  AAController **p_aaController;
  AAController *v4;
  AAController *v5;
  AAController *v6;
  _QWORD v7[4];
  AAController *v8;
  AAConversationDetectSessionManager *v9;
  _QWORD v10[4];
  AAController *v11;
  AAConversationDetectSessionManager *v12;

  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    v5 = objc_alloc_init(AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1001E2430);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A918;
    v10[3] = &unk_1001E2458;
    v6 = v5;
    v11 = v6;
    v12 = self;
    -[AAController setConversationDetectMessageHandler:](v6, "setConversationDetectMessageHandler:", v10);
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _aaControllerEnsureStarted]", 30, "Activating AAController: %@", v6);
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A934;
    v7[3] = &unk_1001E2410;
    v4 = v6;
    v8 = v4;
    v9 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v7);

  }
}

- (void)_aaControllerEnsureStopped
{
  AAController *aaController;
  AAController *v4;

  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0;

  }
}

- (void)activateCDSession
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAD4;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activateCDSession
{
  if (!self->_activateCDSessionCalled)
  {
    self->_activateCDSessionCalled = 1;
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _activateCDSession]", 30, "CD Session activate");
    }
    -[AAConversationDetectSessionManager _registerForAudioSessionResetNotifications](self, "_registerForAudioSessionResetNotifications");
    -[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges](self, "_registerForAVAudioSessionSpeechDetectionStyleChanges");
    -[AAConversationDetectSessionManager _registerForWirelessSplitterStateChanges](self, "_registerForWirelessSplitterStateChanges");
  }
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned __int8 *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  id v22;
  const char *v23;
  _OWORD v24[8];
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[19];
  unsigned int v35;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (dword_10020F770 > 30 || dword_10020F770 == -1 && !_LogCategory_Initialize(&dword_10020F770, 30))
      goto LABEL_41;
    v18 = "Invalid identifier for received CD message";
LABEL_14:
    v19 = 30;
LABEL_40:
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]", v19, v18, v22, v23);
    goto LABEL_41;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cdSupportedAccessories, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    if (dword_10020F770 > 30 || dword_10020F770 == -1 && !_LogCategory_Initialize(&dword_10020F770, 30))
      goto LABEL_41;
    v22 = v7;
    v18 = "Received CD message from unknown identifier %@";
    goto LABEL_14;
  }
  v35 = 0;
  v33 = 0u;
  memset(v34, 0, sizeof(v34));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cdSupportedAccessories, "objectForKeyedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "btAddressData"));
  v11 = CUPrintNSDataAddress();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[AAConversationDetectSessionManager setCurrentCDDeviceIdentifier:](self, "setCurrentCDDeviceIdentifier:", v12);

  if (v6)
  {
    v13 = objc_retainAutorelease(v6);
    v14 = (unsigned __int8 *)objc_msgSend(v13, "bytes");
    v15 = (char)*v14;
    v16 = (void *)*v14;
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      if (v16 > 5)
        v17 = "?";
      else
        v17 = (&off_1001E2600)[v15];
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]", 30, "Conversation Detect: messageType %s", v17);
    }
    if ((_DWORD)v16 == 2)
    {
      if (-[AAConversationDetectSessionManager _getCDTunings:FromData:](self, "_getCDTunings:FromData:", &v26, v13))
      {
        if (dword_10020F770 <= 30
          && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]", 30, "CD tunings received");
        }
        v24[6] = v32;
        v24[7] = v33;
        v25[0] = *(_OWORD *)v34;
        *(_DWORD *)((char *)v25 + 15) = *(_DWORD *)&v34[15];
        v24[2] = v28;
        v24[3] = v29;
        v24[4] = v30;
        v24[5] = v31;
        v24[0] = v26;
        v24[1] = v27;
        -[AAConversationDetectSessionManager setCDTunings:](self, "setCDTunings:", v24);
      }
      goto LABEL_41;
    }
    if ((_DWORD)v16 == 1)
    {
      -[AAConversationDetectSessionManager _getSignalTypeFromData:signal:](self, "_getSignalTypeFromData:signal:", v13, &v35);
      -[AAConversationDetectSessionManager _updateConversationDetectSignal:](self, "_updateConversationDetectSignal:", v35);
      goto LABEL_41;
    }
    v20 = v16;
  }
  else
  {
    v16 = 0;
    v20 = 0;
  }
  if (dword_10020F770 <= 90 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
  {
    if (v20 > 5)
      v21 = "?";
    else
      v21 = (&off_1001E2630)[(char)v20];
    v22 = v16;
    v23 = v21;
    v18 = "Received undesired CD msg of type %u %s";
    v19 = 90;
    goto LABEL_40;
  }
LABEL_41:

}

- (void)_cdMsgNotificationReceivedHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AAConversationDetectSessionManager *v9;

  v4 = a3;
  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdMsgNotificationReceivedHandler:]", 30, "Conversation Detect: _cdMessageReceived");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AFBC;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t cdSignal;
  const char *v4;
  const char *v5;
  id v6;
  id v7;
  id v9;
  id v10;

  v10 = 0;
  cdSignal = self->_cdSignal;
  if (cdSignal > 0xB)
    v4 = "?";
  else
    v4 = (&off_1001E2660)[cdSignal];
  v5 = "yes";
  if (!self->_audioSessionActivated)
    v5 = "no";
  NSAppendPrintF_safe(&v10, "-- AAConversationDetectSessionManager: CDSignal %s, CDActivated: %s, duckLevel: %@, unduckLevel: %@, ramp duration: %@ --\n", *(_QWORD *)&a3, v4, v5, self->_duckLevel, self->_unduckLevel, self->_rampDuration);
  v6 = v10;
  v9 = v6;
  NSAppendPrintF(&v9, "\n");
  v7 = v9;

  return v7;
}

- (void)invalidateCDSession
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B1C0;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateCDSession
{
  AAConversationDetectSessionManager *v3;
  void *v4;

  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _invalidateCDSession]", 30, "CD Session invalidate");
  self->_cdSignal = 0;
  -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](self, "_cdSessionEnsureDeactivated:", 0);
  v3 = self;
  objc_sync_enter(v3);
  v3->_audioSessionActivated = 0;
  objc_sync_exit(v3);

  -[AAConversationDetectSessionManager setCdSignalAudioInterrupted:](v3, "setCdSignalAudioInterrupted:", 0);
  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _invalidateCDSession]", 30, "Posting CdSignalAudioInterruptedChanged notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CdSignalAudioInterruptedChanged"), v3);

  if (-[NSMutableDictionary count](v3->_cdSupportedAccessories, "count"))
  {
    if (dword_10020F770 <= 90
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _invalidateCDSession]", 90, "connected CD supported accessories count %d, keep state change notifications registered", -[NSMutableDictionary count](v3->_cdSupportedAccessories, "count"));
    }
  }
  else
  {
    -[AAConversationDetectSessionManager _deregisterFromAudioSessionResetNotifications](v3, "_deregisterFromAudioSessionResetNotifications");
    -[AAConversationDetectSessionManager _deregisterFromWirelessSplitterStateChanges](v3, "_deregisterFromWirelessSplitterStateChanges");
    -[AAConversationDetectSessionManager _deregisterFromAVAudioSessionSpeechDetectionStyleChanges](v3, "_deregisterFromAVAudioSessionSpeechDetectionStyleChanges");
    v3->_activateCDSessionCalled = 0;
  }
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B3CC;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  CBDiscovery *connectedDeviceDiscovery;
  NSMutableDictionary *cdSupportedAccessories;
  void *v5;
  int prefsChangedNotifyToken;

  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _invalidate]", 30, "Invalidate");
  -[AAConversationDetectSessionManager _invalidateCDSession](self, "_invalidateCDSession");
  -[AAConversationDetectSessionManager _aaControllerEnsureStopped](self, "_aaControllerEnsureStopped");
  -[CBDiscovery invalidate](self->_connectedDeviceDiscovery, "invalidate");
  connectedDeviceDiscovery = self->_connectedDeviceDiscovery;
  self->_connectedDeviceDiscovery = 0;

  -[NSMutableDictionary removeAllObjects](self->_cdSupportedAccessories, "removeAllObjects");
  cdSupportedAccessories = self->_cdSupportedAccessories;
  self->_cdSupportedAccessories = 0;

  if (self->_cdMsgReceivedObserving)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.AudioAccessory.cdMsgNotification"), 0);
    self->_cdMsgReceivedObserving = 0;

  }
  prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_prefsChangedNotifyToken = -1;
  }
  notify_cancel(self->_conversationAwarenessNotificationDispatchToken);
}

- ($F52B7ECEF61F33743E51AFD28469D665)_getPauseMessage
{
  return ($F52B7ECEF61F33743E51AFD28469D665)((self->_currentPauseReason << 16) | (self->_pauseConversationDetect << 8) | 3);
}

- ($06D0163FE0D7AFE752A9F21F38483579)_getResetMessage:(unsigned __int8)a3
{
  return ($06D0163FE0D7AFE752A9F21F38483579)((a3 << 8) | 5);
}

- (void)_getSignalTypeFromData:(id)a3 signal:(int *)a4
{
  id v5;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v11 = v5;
    v7 = objc_retainAutorelease(v5);
    v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
    if ((unint64_t)objc_msgSend(v7, "length") <= 1)
    {
      v6 = v11;
      if (dword_10020F770 <= 30)
      {
        if (dword_10020F770 != -1 || (v10 = _LogCategory_Initialize(&dword_10020F770, 30), v6 = v11, v10))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _getSignalTypeFromData:signal:]", 30, "Invalid length of CD signal data: %lu");
LABEL_14:
          v6 = v11;
        }
      }
    }
    else
    {
      *a4 = v8[1];
      v6 = v11;
      if (dword_10020F770 <= 30)
      {
        if (dword_10020F770 != -1 || (v9 = _LogCategory_Initialize(&dword_10020F770, 30), v6 = v11, v9))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _getSignalTypeFromData:signal:]", 30, "_getSignalFromData returning signal - %s");
          goto LABEL_14;
        }
      }
    }
  }

}

- (BOOL)_getCDTunings:(id *)a3 FromData:(id)a4
{
  id v5;
  void *v6;
  id v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;

  v5 = a4;
  v6 = v5;
  if (!v5)
  {
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  v7 = objc_retainAutorelease(v5);
  v8 = (char *)objc_msgSend(v7, "bytes");
  if ((unint64_t)objc_msgSend(v7, "length") <= 0x93)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _getCDTunings:FromData:]", 30, "Invalid length of CD tunings data: %lu");
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _getCDTunings:FromData:]", 30, "Invalid tunings pointer");
    }
    goto LABEL_15;
  }
  v9 = *(_OWORD *)(v8 + 17);
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)(v8 + 1);
  *(_OWORD *)&a3->var0.var4 = v9;
  v10 = *(_OWORD *)(v8 + 33);
  v11 = *(_OWORD *)(v8 + 49);
  v12 = *(_OWORD *)(v8 + 81);
  *(_OWORD *)&a3->var0.var16 = *(_OWORD *)(v8 + 65);
  *(_OWORD *)&a3->var0.var21 = v12;
  *(_OWORD *)&a3->var0.var8 = v10;
  *(_OWORD *)&a3->var0.var12 = v11;
  v13 = *(_OWORD *)(v8 + 97);
  v14 = *(_OWORD *)(v8 + 113);
  v15 = *(_OWORD *)(v8 + 129);
  *(float *)((char *)&a3->var2.var6.var0 + 3) = *((float *)v8 + 36);
  *(_OWORD *)&a3->var2.var2.var1 = v14;
  *(_OWORD *)&a3->var2.var4.var1 = v15;
  *(_OWORD *)&a3->var2.var0.var1 = v13;
  v16 = 1;
LABEL_16:

  return v16;
}

- (BOOL)getCdSignalAudioInterrupted
{
  AAConversationDetectSessionManager *v2;
  BOOL cdSignalAudioInterrupted;

  v2 = self;
  objc_sync_enter(v2);
  cdSignalAudioInterrupted = v2->_cdSignalAudioInterrupted;
  objc_sync_exit(v2);

  return cdSignalAudioInterrupted;
}

- (id)getCurrentCDDeviceIdentifier
{
  AAConversationDetectSessionManager *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentCDDeviceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (void)_prefsChanged
{
  double v3;
  BOOL v4;
  double v5;
  double signalRampDurationSecs;
  float v7;
  double v8;
  BOOL v9;
  double v10;
  double prefCDRampChunkDuration;
  uint64_t Int64;
  BOOL v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  int v22;

  v22 = 0;
  CFPrefs_GetDouble(CFSTR("com.apple.AudioAccessory"), CFSTR("unlatchRampDuration"), &v22);
  if (v22)
    v4 = 1;
  else
    v4 = v3 < 0.0;
  if (v4)
    v5 = 3.0;
  else
    v5 = v3;
  signalRampDurationSecs = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
  if (v5 == signalRampDurationSecs)
    goto LABEL_13;
  if (dword_10020F770 <= 30)
  {
    if (dword_10020F770 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10020F770, 30))
        goto LABEL_12;
      signalRampDurationSecs = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
    }
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _prefsChanged]", 30, "Unlatch signal ramp duration: %0.2f --> %0.2f", signalRampDurationSecs, v5);
  }
LABEL_12:
  v7 = v5;
  self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs = v7;
LABEL_13:
  CFPrefs_GetDouble(CFSTR("com.apple.AudioAccessory"), CFSTR("qRampChunkDuration"), &v22);
  if (v22)
    v9 = 1;
  else
    v9 = v8 < 0.0;
  if (v9)
    v10 = 0.1;
  else
    v10 = v8;
  prefCDRampChunkDuration = self->_prefCDRampChunkDuration;
  if (v10 != prefCDRampChunkDuration)
  {
    if (dword_10020F770 <= 30)
    {
      if (dword_10020F770 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020F770, 30))
          goto LABEL_24;
        prefCDRampChunkDuration = self->_prefCDRampChunkDuration;
      }
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _prefsChanged]", 30, "Ramp chunk duration: %0.2f --> %0.2f", prefCDRampChunkDuration, v10);
    }
LABEL_24:
    self->_prefCDRampChunkDuration = v10;
  }
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.AudioAccessory"), CFSTR("disableCustomCurveDucking"), &v22);
  if (v22)
    v13 = 1;
  else
    v13 = Int64 == 0;
  v14 = !v13;
  if (self->_prefCDShouldDisableCustomDuckingCurve != v14)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      v15 = "yes";
      if (v14)
        v16 = "no";
      else
        v16 = "yes";
      if (!v14)
        v15 = "no";
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _prefsChanged]", 30, "Should enable custom ducking curve: %s -> %s", v16, v15);
    }
    self->_prefCDShouldDisableCustomDuckingCurve = v14;
  }
  v17 = CFPrefs_GetInt64(CFSTR("com.apple.AudioAccessory"), CFSTR("didSiriAnnounceFirstCATrigger"), &v22);
  if (v22)
    v18 = 1;
  else
    v18 = v17 == 0;
  v19 = !v18;
  if (self->_prefCDSiriDidAnnounce != v19)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      v20 = "yes";
      if (v19)
        v21 = "no";
      else
        v21 = "yes";
      if (!v19)
        v20 = "no";
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _prefsChanged]", 30, "Did announce conversation awareness: %s -> %s", v21, v20);
    }
    self->_prefCDSiriDidAnnounce = v19;
  }
}

- (void)_sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAController *aaController;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AAConversationDetectSessionManager _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
  aaController = self->_aaController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BBA4;
  v15[3] = &unk_1001E2480;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[AAController sendConversationDetectMessage:destinationIdentifier:completionHandler:](aaController, "sendConversationDetectMessage:destinationIdentifier:completionHandler:", v14, v13, v15);

}

- (void)setConversationDetectSignal:(int)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BD00;
  v4[3] = &unk_1001E1FA8;
  v4[4] = self;
  v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setCDTunings:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[19];

  v8[1] = 3221225472;
  v3 = *(_OWORD *)&a3->var2.var2.var1;
  v15 = *(_OWORD *)&a3->var2.var0.var1;
  v16 = v3;
  *(_OWORD *)v17 = *(_OWORD *)&a3->var2.var4.var1;
  v4 = *(_OWORD *)&a3->var0.var12;
  v11 = *(_OWORD *)&a3->var0.var8;
  v12 = v4;
  v5 = *(_OWORD *)&a3->var0.var21;
  v13 = *(_OWORD *)&a3->var0.var16;
  v14 = v5;
  v6 = *(_OWORD *)&a3->var0.var4;
  v9 = *(_OWORD *)&a3->var0.var0;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[2] = sub_10000BDAC;
  v8[3] = &unk_1001E24A8;
  *(float *)&v17[15] = *(float *)((char *)&a3->var2.var6.var0 + 3);
  v10 = v6;
  v8[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, v8);
}

- (void)setCdSignalAudioInterrupted:(BOOL)a3
{
  AAConversationDetectSessionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cdSignalAudioInterrupted = a3;
  objc_sync_exit(obj);

}

- (void)_setCDSignalAudioTunings:(id *)a3
{
  uint64_t v4;
  __int128 v5;
  $477D039F0CCD8A11E0559A210919DEAB *p_cdSignalAudioTunings;
  __int128 v7;
  float v8;
  float v9;
  double v10;
  float signalDuckingLevel;
  float signalRampDurationSecs;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  _OWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v4 = 0;
  v5 = *(_OWORD *)&a3->var2.var0;
  v45[0] = *(_OWORD *)&a3->var0.var0;
  v45[1] = v5;
  p_cdSignalAudioTunings = &self->_cdSignalAudioTunings;
  v7 = *(_OWORD *)&a3->var6.var0;
  v45[2] = *(_OWORD *)&a3->var4.var0;
  v45[3] = v7;
  do
  {
    v8 = *((float *)v45 + v4);
    if (v8 >= 0.0)
    {
      v9 = flt_1001845D0[v4];
      if (v8 <= v9)
      {
        v9 = *((float *)v45 + v4);
      }
      else if (dword_10020F770 <= 30
             && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        v10 = v9;
LABEL_11:
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _setCDSignalAudioTunings:]", 30, "Invalid audio tunings %f, Audio tunings %f set at index %d", v8, v10, v4);
      }
    }
    else
    {
      v9 = 0.0;
      if (dword_10020F770 <= 30)
      {
        v10 = 0.0;
        if (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30))
          goto LABEL_11;
      }
    }
    *(&p_cdSignalAudioTunings->startSignalTunables.signalDuckingLevel + v4++) = v9;
  }
  while (v4 != 16);
  if (dword_10020F770 < 31 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    signalDuckingLevel = self->_cdSignalAudioTunings.startSignalTunables.signalDuckingLevel;
    signalRampDurationSecs = self->_cdSignalAudioTunings.startSignalTunables.signalRampDurationSecs;
    v14 = self->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel;
    v13 = self->_cdSignalAudioTunings.latch1SignalTunables.signalRampDurationSecs;
    v16 = self->_cdSignalAudioTunings.latch2SignalTunables.signalDuckingLevel;
    v15 = self->_cdSignalAudioTunings.latch2SignalTunables.signalRampDurationSecs;
    v18 = self->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel;
    v17 = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
    v37 = self->_cdSignalAudioTunings.end1SignalTunables.signalDuckingLevel;
    v38 = self->_cdSignalAudioTunings.end1SignalTunables.signalRampDurationSecs;
    v39 = self->_cdSignalAudioTunings.end2SignalTunables.signalDuckingLevel;
    v40 = self->_cdSignalAudioTunings.end2SignalTunables.signalRampDurationSecs;
    v41 = self->_cdSignalAudioTunings.resetSignalTunables.signalDuckingLevel;
    v42 = self->_cdSignalAudioTunings.resetSignalTunables.signalRampDurationSecs;
    v43 = self->_cdSignalAudioTunings.pauseSignalTunables.signalDuckingLevel;
    v44 = self->_cdSignalAudioTunings.pauseSignalTunables.signalRampDurationSecs;
    v63 = 0;
    NSAppendPrintF(&v63, "\n-- CD Audio Tunings Begin --\n");
    v19 = v63;
    v62 = v19;
    NSAppendPrintF(&v62, "    Start signal duck level: %0.2f\n", signalDuckingLevel);
    v20 = v62;

    v61 = v20;
    NSAppendPrintF(&v61, "    Start signal ramp duration: %0.2f s\n", signalRampDurationSecs);
    v21 = v61;

    v60 = v21;
    NSAppendPrintF(&v60, "    Latch1 signal duck level: %0.2f\n", v14);
    v22 = v60;

    v59 = v22;
    NSAppendPrintF(&v59, "    Latch1 signal ramp duration: %0.2f s\n", v13);
    v23 = v59;

    v58 = v23;
    NSAppendPrintF(&v58, "    Latch2 signal duck level: %0.2f\n", v16);
    v24 = v58;

    v57 = v24;
    NSAppendPrintF(&v57, "    Latch2 signal ramp duration: %0.2f s\n", v15);
    v25 = v57;

    v56 = v25;
    NSAppendPrintF(&v56, "    Unlatch signal duck level: %0.2f\n", v18);
    v26 = v56;

    v55 = v26;
    NSAppendPrintF(&v55, "    Unlatch signal ramp duration: %0.2f s\n", v17);
    v27 = v55;

    v54 = v27;
    NSAppendPrintF(&v54, "    End1 signal duck level: %0.2f\n", v37);
    v28 = v54;

    v53 = v28;
    NSAppendPrintF(&v53, "    End1 signal ramp duration: %0.2f s\n", v38);
    v29 = v53;

    v52 = v29;
    NSAppendPrintF(&v52, "    End2 signal duck level: %0.2f\n", v39);
    v30 = v52;

    v51 = v30;
    NSAppendPrintF(&v51, "    End2 signal ramp duration: %0.2f s\n", v40);
    v31 = v51;

    v50 = v31;
    NSAppendPrintF(&v50, "    Reset signal duck level: %0.2f\n", v41);
    v32 = v50;

    v49 = v32;
    NSAppendPrintF(&v49, "    Reset signal ramp duration: %0.2f s\n", v42);
    v33 = v49;

    v48 = v33;
    NSAppendPrintF(&v48, "    Pause signal duck level: %0.2f\n", v43);
    v34 = v48;

    v47 = v34;
    NSAppendPrintF(&v47, "    Pause signal ramp duration: %0.2f s\n", v44);
    v35 = v47;

    v46 = v35;
    NSAppendPrintF(&v46, "-- CD Audio Tunings End --\n");
    v36 = v46;

    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _setCDSignalAudioTunings:]", 30, "%@", v36);
  }
}

- (void)setCurrentCDDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *currentCDDeviceIdentifier;
  AAConversationDetectSessionManager *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentCDDeviceIdentifier = obj->_currentCDDeviceIdentifier;
  obj->_currentCDDeviceIdentifier = v4;

  objc_sync_exit(obj);
}

- (void)_updateAccessoriesWithMotionState:(unsigned int)a3
{
  void *v5;
  NSMutableDictionary *cdSupportedAccessories;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;
  unsigned int v11;

  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    v10 = 4;
    v11 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 5));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000CA00;
    v8[3] = &unk_1001E24D0;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cdSupportedAccessories, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else if (dword_10020F770 <= 30
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _updateAccessoriesWithMotionState:]", 30, "No CD supported accessories are connected");
  }
}

- (void)_updateAccessoriesWithPauseState
{
  uint64_t v3;
  void *v4;
  NSMutableDictionary *cdSupportedAccessories;
  id v6;
  _QWORD v7[5];
  id v8;
  __int16 v9;
  char v10;

  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    v3 = (uint64_t)-[AAConversationDetectSessionManager _getPauseMessage](self, "_getPauseMessage");
    v9 = v3;
    v10 = BYTE2(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 3));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CB58;
    v7[3] = &unk_1001E24D0;
    v7[4] = self;
    v8 = v4;
    v6 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cdSupportedAccessories, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else if (dword_10020F770 <= 30
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _updateAccessoriesWithPauseState]", 30, "No accessories connected");
  }
}

- (void)_updateAccessoriesWithResetState:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSMutableDictionary *cdSupportedAccessories;
  id v7;
  _QWORD v8[5];
  id v9;
  unsigned __int16 v10;

  v3 = a3;
  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    v10 = (unsigned __int16)-[AAConversationDetectSessionManager _getResetMessage:](self, "_getResetMessage:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 2));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000CCB0;
    v8[3] = &unk_1001E24D0;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cdSupportedAccessories, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else if (dword_10020F770 <= 30
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _updateAccessoriesWithResetState:]", 30, "No accessories connected");
  }
}

- (void)_updateConversationDetectSignal:(int)a3
{
  unsigned int cdSignal;
  const char *v6;
  const char *v7;

  cdSignal = self->_cdSignal;
  if (cdSignal != a3)
  {
    if (dword_10020F770 <= 30)
    {
      if (dword_10020F770 != -1)
      {
LABEL_4:
        if (cdSignal > 0xB)
          v6 = "?";
        else
          v6 = (&off_1001E2660)[cdSignal];
        if (a3 > 0xB)
          v7 = "?";
        else
          v7 = (&off_1001E2660)[a3];
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _updateConversationDetectSignal:]", 30, "Conversation detect signal updated %s -> %s", v6, v7);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize(&dword_10020F770, 30))
      {
        cdSignal = self->_cdSignal;
        goto LABEL_4;
      }
    }
LABEL_13:
    self->_cdSignal = a3;
    -[AAConversationDetectSessionManager _cdSessionSignalUpdate](self, "_cdSessionSignalUpdate");
  }
}

- (void)_updatePauseState
{
  unint64_t currentSpeechDetectionStyle;
  _BOOL4 isWirelessSplitterOn;
  _BOOL4 pauseConversationDetect;
  const char *v7;
  const char *v8;
  const char *v9;

  currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  isWirelessSplitterOn = self->_isWirelessSplitterOn;
  pauseConversationDetect = self->_isWirelessSplitterOn || currentSpeechDetectionStyle == 4;
  self->_pauseConversationDetect = pauseConversationDetect;
  if (dword_10020F770 <= 30)
  {
    if (dword_10020F770 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10020F770, 30))
      {
LABEL_19:
        pauseConversationDetect = self->_pauseConversationDetect;
        goto LABEL_20;
      }
      pauseConversationDetect = self->_pauseConversationDetect;
      isWirelessSplitterOn = self->_isWirelessSplitterOn;
    }
    v7 = "yes";
    if (pauseConversationDetect)
      v8 = "yes";
    else
      v8 = "no";
    if (isWirelessSplitterOn)
      v9 = "yes";
    else
      v9 = "no";
    if (currentSpeechDetectionStyle != 4)
      v7 = "no";
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _updatePauseState]", 30, "Updated pause conversation state to: %s, isWirelessSplitterOn: %s, isSpeechDetectionStyleDisallowed: %s", v8, v9, v7);
    goto LABEL_19;
  }
LABEL_20:
  if (!pauseConversationDetect)
    self->_currentPauseReason = 0;
  -[AAConversationDetectSessionManager _updateAccessoriesWithPauseState](self, "_updateAccessoriesWithPauseState");
  if (self->_pauseConversationDetect)
    -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](self, "_cdSessionEnsureDeactivated:", 0);
}

- (void)_audioSessionEnsureStarted
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  AAConversationDetectSessionManager *v9;
  id v10;
  id v11;

  if (!self->_audioSessionActivated)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v4 = kMXSessionProperty_InterruptionStyle;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 32));
    v11 = 0;
    objc_msgSend(v3, "setMXSessionProperty:value:error:", v4, v5, &v11);
    v6 = v11;

    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStarted]", 30, "Activating AVAudioSession");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v10 = v6;
    objc_msgSend(v7, "setActive:error:", 1, &v10);
    v8 = v10;

    if (v8)
    {
      if (dword_10020F770 <= 90
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStarted]", 90, "Failed to activate the AVAudioSession with error %@", v8);
      }
    }
    else
    {
      v9 = self;
      objc_sync_enter(v9);
      self->_audioSessionActivated = 1;
      objc_sync_exit(v9);

    }
  }
}

- (void)_audioSessionEnsureStopped
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  AAConversationDetectSessionManager *obj;
  id v8;
  id v9;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_audioSessionActivated)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]", 30, "Deactivating AVAudioSession");
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v9 = 0;
    objc_msgSend(v2, "setDuckingFadeOutDuration:fadeInDuration:error:", 0, 0, &v9);
    v3 = v9;

    if (v3
      && dword_10020F770 <= 90
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]", 90, "Failed to reset AVAudioSession ramp duration");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v8 = v3;
    objc_msgSend(v4, "setActive:withOptions:error:", 0, 1, &v8);
    v5 = v8;

    if (v5
      && dword_10020F770 <= 90
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]", 90, "Failed to invalidate AVAudioSession");
    }
    obj->_audioSessionActivated = 0;

    objc_sync_exit(obj);
    -[AAConversationDetectSessionManager setCdSignalAudioInterrupted:](obj, "setCdSignalAudioInterrupted:", 0);
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]", 30, "Posting CdSignalAudioInterruptedChanged notification");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("CdSignalAudioInterruptedChanged"), obj);

  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (void)_calibrateDuckingLevelForVolumeLevel:(float)a3
{
  double v3;
  double v4;
  double v5;
  double v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;

  LODWORD(v8) = 1051663008;
  LODWORD(v3) = -1088088021;
  LODWORD(v4) = 1052974986;
  *(float *)&v5 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v8, v3, v4, v5);
  v10 = v9;
  LODWORD(v11) = 1052069016;
  LODWORD(v12) = -1088373234;
  LODWORD(v13) = 1049629609;
  *(float *)&v14 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v11, v12, v13, v14);
  v16 = v15;
  LODWORD(v17) = 1054847323;
  LODWORD(v18) = -1085663714;
  LODWORD(v19) = 1058727893;
  *(float *)&v20 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v17, v18, v19, v20);
  v22 = v21;
  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _calibrateDuckingLevelForVolumeLevel:]", 30, "Calibrated levels for custom ducking curve, start: %0.2f, latch: %0.2f, unlatch: %0.2f", v10, v16, v22);
  self->_cdSignalAudioTunings.startSignalTunables.signalDuckingLevel = v10;
  self->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.latch2SignalTunables.signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel = v22;
}

- (void)_cdSessionSignalUpdate
{
  NSNumber *v3;
  NSNumber *duckLevel;
  NSNumber *rampDuration;
  AAConversationDetectSessionManager *v6;
  NSNumber *unduckLevel;
  double v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  double v14;
  NSNumber *v15;
  NSNumber *v16;
  int v17;
  int v18;
  NSNumber *v19;
  NSNumber *v20;
  double v21;
  NSNumber *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  double v26;
  uint64_t v27;
  NSNumber *v28;
  AAConversationDetectSessionManager *v29;
  NSNumber *v30;
  NSNumber *v31;
  double v32;
  NSNumber *v33;
  NSNumber *v34;
  NSNumber *v35;
  NSNumber *v36;
  NSNumber *v37;
  NSNumber *v38;
  uint64_t v39;
  NSNumber *v40;
  int v41;
  unint64_t currentSpeechDetectionStyle;
  _BOOL8 v43;
  const char *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t cdSignal;
  const char *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  NSNumber *v55;
  void *v56;
  NSNumber *v57;
  NSNumber *v58;
  id v59;
  id v60;
  id v61;

  v3 = self->_duckLevel;
  duckLevel = self->_duckLevel;
  self->_duckLevel = 0;

  rampDuration = self->_rampDuration;
  self->_rampDuration = 0;

  v6 = self;
  objc_sync_enter(v6);
  v6->_shouldQueueRamp = 0;
  objc_sync_exit(v6);

  unduckLevel = v6->_unduckLevel;
  v6->_unduckLevel = 0;

  v9 = 0;
  v10 = 28;
  v11 = 24;
  switch(v6->_cdSignal)
  {
    case 1:
      goto LABEL_4;
    case 2:
      *(float *)&v8 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalRampDurationSecs;
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v13 = self->_rampDuration;
      self->_rampDuration = v12;

      *(float *)&v14 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel;
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
      v16 = self->_duckLevel;
      self->_duckLevel = v15;

      v17 = 0;
      v18 = 0;
      v9 = 1;
      goto LABEL_23;
    case 3:
      *(float *)&v8 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v25 = self->_rampDuration;
      self->_rampDuration = v24;

      *(float *)&v26 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel;
      v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26));
      v28 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v27;

      v29 = v6;
      objc_sync_enter(v29);
      v6->_shouldQueueRamp = _os_feature_enabled_impl("MediaExperience", "AsyncDucking") ^ 1;
      objc_sync_exit(v29);

      goto LABEL_22;
    case 4:
      *(float *)&v8 = v6->_cdSignalAudioTunings.end1SignalTunables.signalRampDurationSecs;
      v30 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v31 = self->_rampDuration;
      self->_rampDuration = v30;

      *(float *)&v32 = v6->_cdSignalAudioTunings.end1SignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 5:
      v9 = 1;
      v10 = 44;
      v11 = 40;
LABEL_4:
      LODWORD(v8) = *(_DWORD *)((char *)&v6->super.isa + v10);
      v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v20 = self->_rampDuration;
      self->_rampDuration = v19;

      LODWORD(v21) = *(_DWORD *)((char *)&v6->super.isa + v11);
      v22 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
      v23 = self->_duckLevel;
      self->_duckLevel = v22;

      if (!v6->_audioSessionActivated)
      {
        if (v6->_prefCDShouldDisableCustomDuckingCurve)
        {
          if (dword_10020F770 <= 30
            && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
          {
            LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Custom ducking curve disabled, use default ducking levels");
          }
        }
        else
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedInstance](AVSystemController, "sharedInstance"));
          objc_msgSend(v52, "getActiveCategoryVolume:andName:", &v6->_currentVolume, 0);

          if (dword_10020F770 <= 30
            && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
          {
            LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Custom ducking curve enabled, current volume level %f", v6->_currentVolume);
          }
          *(float *)&v53 = v6->_currentVolume;
          -[AAConversationDetectSessionManager _calibrateDuckingLevelForVolumeLevel:](v6, "_calibrateDuckingLevelForVolumeLevel:", v53);
        }
      }
      v17 = 0;
      v18 = 1;
      goto LABEL_23;
    case 6:
      *(float *)&v8 = v6->_cdSignalAudioTunings.end2SignalTunables.signalRampDurationSecs;
      v33 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v34 = self->_rampDuration;
      self->_rampDuration = v33;

      *(float *)&v32 = v6->_cdSignalAudioTunings.end2SignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 7:
      *(float *)&v8 = v6->_cdSignalAudioTunings.resetSignalTunables.signalRampDurationSecs;
      v35 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v36 = self->_rampDuration;
      self->_rampDuration = v35;

      *(float *)&v32 = v6->_cdSignalAudioTunings.resetSignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 8:
      *(float *)&v8 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalRampDurationSecs;
      v37 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v38 = self->_rampDuration;
      self->_rampDuration = v37;

      *(float *)&v32 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalDuckingLevel;
LABEL_18:
      v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32));
      v40 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v39;
      goto LABEL_19;
    case 9:
      v40 = self->_rampDuration;
      self->_rampDuration = (NSNumber *)&off_1001F3D28;
LABEL_19:

      v9 = 0;
      v18 = 0;
      v17 = 1;
      goto LABEL_23;
    case 0xA:
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Ignoring pause signal due to siri");
      }
      goto LABEL_67;
    case 0xB:
      -[AAConversationDetectSessionManager _audioSessionEnsureStopped](v6, "_audioSessionEnsureStopped");
LABEL_22:
      v17 = 0;
      v9 = 0;
      v18 = 0;
LABEL_23:
      v41 = 0;
      currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
      if (currentSpeechDetectionStyle < 2)
      {
        v43 = 0;
        goto LABEL_36;
      }
      if (currentSpeechDetectionStyle == 3)
        goto LABEL_34;
      if (currentSpeechDetectionStyle != 2)
      {
        if (dword_10020F770 <= 30)
        {
          if (dword_10020F770 == -1)
          {
            if (!_LogCategory_Initialize(&dword_10020F770, 30))
              goto LABEL_37;
            currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
          }
          if (currentSpeechDetectionStyle > 6)
            v44 = "?";
          else
            v44 = (&off_1001E26E8)[currentSpeechDetectionStyle];
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "AVAudioSessionSpeechDetectionStyle: %s, stop CD session", v44);
        }
LABEL_37:
        v45 = 0;
LABEL_38:
        -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](v6, "_cdSessionEnsureDeactivated:", 0);
        goto LABEL_68;
      }
      if (v9)
      {
        v43 = v6->_cdSignal == 5;
        v41 = 1;
      }
      else
      {
        v41 = 0;
LABEL_34:
        v43 = 1;
      }
      if (!(v17 | !v43))
      {
        if (v6->_shouldQueueRamp)
        {
          -[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:](v6, "_startQueuedRampForDuration:startLevel:endLevel:", self->_rampDuration, v3, v6->_unduckLevel);
        }
        else
        {
          if (dword_10020F770 <= 30
            && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
          {
            cdSignal = v6->_cdSignal;
            if (cdSignal > 0xB)
              v50 = "?";
            else
              v50 = (&off_1001E2660)[cdSignal];
            LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Conversation detect signal: %s, duckLevel: %@, unduckLevel: %@, ramp duration %@", v50, self->_duckLevel, v6->_unduckLevel, self->_rampDuration);
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
          v55 = self->_rampDuration;
          v61 = 0;
          objc_msgSend(v54, "setDuckingFadeOutDuration:fadeInDuration:error:", v55, v55, &v61);
          v45 = v61;

          if (v45
            || (v56 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance")),
                v57 = self->_duckLevel,
                v58 = v6->_unduckLevel,
                v60 = 0,
                objc_msgSend(v56, "setDuckToLevelScalar:unduckToLevelScalar:error:", v57, v58, &v60),
                v45 = v60,
                v56,
                v45))
          {
            if (dword_10020F770 <= 90
              && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
            {
              LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 90, "Failed to duck via AVAudioSession() with error %@", v45);
            }
            goto LABEL_38;
          }
        }
        goto LABEL_41;
      }
LABEL_36:
      if ((v17 & 1) != 0)
        goto LABEL_37;
LABEL_41:
      if (v18)
        -[AAConversationDetectSessionManager _cdSessionEnsureActivated:](v6, "_cdSessionEnsureActivated:", v43);
      if (v41)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
        v47 = kMXSessionProperty_InterruptionStyle;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
        v59 = 0;
        objc_msgSend(v46, "setMXSessionProperty:value:error:", v47, v48, &v59);
        v45 = v59;

        -[AAConversationDetectSessionManager setCdSignalAudioInterrupted:](v6, "setCdSignalAudioInterrupted:", 1);
        if (dword_10020F770 <= 30
          && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Posting CdSignalAudioInterruptedChanged notification");
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v51, "postNotificationName:object:", CFSTR("CdSignalAudioInterruptedChanged"), v6);

      }
      else
      {
LABEL_67:
        v45 = 0;
      }
LABEL_68:

      return;
    default:
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]", 30, "Unknown CD signal");
      }
      goto LABEL_67;
  }
}

- (void)_cdSessionEnsureActivated:(BOOL)a3
{
  if (self->_pauseConversationDetect)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionEnsureActivated:]", 30, "Failed to activate session, CD is currently paused on host");
    }
  }
  else
  {
    if (a3)
      -[AAConversationDetectSessionManager _audioSessionEnsureStarted](self, "_audioSessionEnsureStarted");
    -[AAConversationDetectSessionManager _startPedestrianFenceSession](self, "_startPedestrianFenceSession");
    -[AAConversationDetectSessionManager _startHeadGestureManager](self, "_startHeadGestureManager");
  }
}

- (void)_cdSessionEnsureDeactivated:(unsigned __int8)a3
{
  int v3;
  int cdSignal;
  BOOL v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  v3 = a3;
  if (GestaltGetDeviceClass(self, a2) == 1)
  {
    cdSignal = self->_cdSignal;
    v6 = self->_audioSessionActivated && (cdSignal | 2) == 6;
    if (v6 && !self->_prefCDSiriDidAnnounce && !self->_isSiriAnnouncePending)
    {
      if (dword_10020F770 <= 30)
      {
        if (dword_10020F770 != -1)
        {
          v7 = "no";
          v8 = "no";
          v9 = "yes";
LABEL_12:
          if ((cdSignal & 0xFFFFFFFD) == 4)
            v10 = "yes";
          else
            v10 = "no";
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:]", 30, "Attempting Siri announce: isAudioSessionActive: %s, didCASessionComplete: %s, prefCDSiriDidAnnounce: %s, isSiriAnnouncePending: %s", v9, v10, v8, v7);
          goto LABEL_32;
        }
        if (_LogCategory_Initialize(&dword_10020F770, 30))
        {
          if (self->_audioSessionActivated)
            v9 = "yes";
          else
            v9 = "no";
          if (self->_prefCDSiriDidAnnounce)
            v8 = "yes";
          else
            v8 = "no";
          if (self->_isSiriAnnouncePending)
            v7 = "yes";
          else
            v7 = "no";
          goto LABEL_12;
        }
      }
LABEL_32:
      self->_isSiriAnnouncePending = 1;
      -[AAConversationDetectSessionManager _requestSiriAnnounce](self, "_requestSiriAnnounce");
      return;
    }
  }
  else if (dword_10020F770 <= 10
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:]", 10, "Siri announce is not supported on this platform");
  }
  -[AAConversationDetectSessionManager _audioSessionEnsureStopped](self, "_audioSessionEnsureStopped");
  -[AAConversationDetectSessionManager _stopPedestrianFenceSession](self, "_stopPedestrianFenceSession");
  -[AAConversationDetectSessionManager _stopHeadGestureManager](self, "_stopHeadGestureManager");
  if (v3)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      v11 = "?";
      if (v3 == 1)
        v11 = "MediaStyleChange";
      if (v3 == 2)
        v11 = "VolumeUp";
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:]", 30, "Sending reset to accessories, reset reason: %s ", v11);
    }
    -[AAConversationDetectSessionManager _updateAccessoriesWithResetState:](self, "_updateAccessoriesWithResetState:");
  }
}

- (float)_duckingLevelForCoefficients:(id)a3 volume:(float)a4
{
  return a3.var2 + (float)((float)(a3.var1 * a4) + (float)((float)(a3.var0 * a4) * a4));
}

- (void)_requestSiriAnnounce
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  void *v42;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10000E3DC;
  v40 = sub_10000E3EC;
  v41 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000E3F4;
  v35[3] = &unk_1001E24F8;
  v35[4] = self;
  v35[5] = &v36;
  v3 = objc_retainBlock(v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/System/Library/UserNotifications/Bundles/%@.bundle"), CFSTR("com.apple.BTUserNotifications")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v7 = objc_msgSend(v6, "assistantIsEnabled");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputVoice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "languageCode"));

    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _requestSiriAnnounce]", 30, "using Siri Preferred language: %@", v10);
    }
    if (v10)
    {
      v13 = objc_alloc_init((Class)UNMutableNotificationContent);
      objc_msgSend(v13, "setCategoryIdentifier:", CFSTR("BTUserNotifications"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizations"));
      v42 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v14, v15));

      if (objc_msgSend(v16, "count"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:localization:", CFSTR("CA_FIRST_TRIGGER_TITLE"), 0, 0, v17));
        objc_msgSend(v13, "setTitle:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:localization:", CFSTR("CA_FIRST_TRIGGER_SUBTITLE"), 0, 0, v19));
        objc_msgSend(v13, "setSubtitle:", v20);

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
      if (!v21
        || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subtitle")),
            v23 = v22 == 0,
            v22,
            v21,
            v23))
      {
        v29 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "announce notification content invalid");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        v25 = (void *)v37[5];
        v37[5] = v30;
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v25, v13, 0));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotification notificationWithRequest:date:sourceIdentifier:intentIdentifiers:](UNNotification, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v33, v26, CFSTR("com.apple.BTUserNotifications"), &__NSArray0__struct));

        v28 = objc_msgSend(objc_alloc((Class)AFSiriUserNotificationRequest), "initWithUserNotification:sourceAppId:platform:", v27, CFSTR("com.apple.BTUserNotifications"), 1);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10000E4B4;
        v34[3] = &unk_1001E2520;
        v34[4] = self;
        objc_msgSend(v28, "performRequestWithCompletion:", v34);

      }
    }
    else
    {
      v31 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "siri returned invalid language code");
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v13 = (id)v37[5];
      v37[5] = v32;
    }

  }
  else
  {
    v11 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "Assistant not enabled");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v10 = (void *)v37[5];
    v37[5] = v12;
  }

  ((void (*)(_QWORD *))v3[2])(v3);
  _Block_object_dispose(&v36, 8);

}

- (void)_asyncAudioSessionDuckWithLevel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *chunkedRampingQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  chunkedRampingQueue = self->_chunkedRampingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E648;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)chunkedRampingQueue, block);

}

- (void)_audioSessionReset
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E938;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_deregisterFromAudioSessionResetNotifications
{
  void *v3;

  if (self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deregisterFromAudioSessionResetNotifications]", 30, "Deregistering from AVAudioSessionMediaServicesWereResetNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionMediaServicesWereResetNotification, 0);

    self->_avAudioSessionResetNotificationRegistered = 0;
  }
}

- (void)_deregisterFromAVAudioSessionSpeechDetectionStyleChanges
{
  void *v3;

  if (self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deregisterFromAVAudioSessionSpeechDetectionStyleChanges]", 30, "Deregistering from AVAudioSessionSpeechDetectionStyle changes");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("speechDetectionStyle"));

    self->_cdStyleChangeNotificationRegistered = 0;
  }
}

- (void)_startQueuedRampForDuration:(id)a3 startLevel:(id)a4 endLevel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int v23;
  _QWORD *v24;
  void *v25;
  double v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  AAConversationDetectSessionManager *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  id (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  float *v45;
  uint64_t v46;
  float v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10 && (objc_msgSend(v9, "floatValue"), v13 = v12, objc_msgSend(v11, "floatValue"), v13 < v14))
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]", 30, "Queued Ramp: startLevel: %@, endLevel: %@, rampDuration: %@", v9, v11, v8);
    }
    objc_msgSend(v8, "floatValue");
    v16 = (unint64_t)(v15 / self->_prefCDRampChunkDuration);
    v44 = 0;
    v45 = (float *)&v44;
    v46 = 0x2020000000;
    v47 = 0.0;
    objc_msgSend(v11, "floatValue");
    v18 = v17;
    objc_msgSend(v9, "floatValue");
    v47 = (float)(v18 - v19) / (float)v16;
    v40 = 0;
    v41 = (float *)&v40;
    v42 = 0x2020000000;
    v43 = 0.0;
    objc_msgSend(v9, "floatValue");
    v43 = v20 + v45[6];
    v21 = v41[6];
    objc_msgSend(v11, "floatValue");
    if (v21 > v22)
    {
      objc_msgSend(v11, "floatValue");
      *((_DWORD *)v41 + 6) = v23;
    }
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]", 30, "Queued Ramp: number of ramps: %d, Delta duck Level: %f", v16, v45[6]);
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_10000EE70;
    v38 = sub_10000EE98;
    v39 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000EEA0;
    v28[3] = &unk_1001E2548;
    v31 = &v40;
    v29 = v11;
    v30 = self;
    v32 = &v44;
    v33 = &v34;
    v24 = objc_retainBlock(v28);
    v25 = (void *)v35[5];
    v35[5] = (uint64_t)v24;

    *(float *)&v26 = v41[6];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26));
    -[AAConversationDetectSessionManager _asyncAudioSessionDuckWithLevel:completion:](self, "_asyncAudioSessionDuckWithLevel:completion:", v27, v35[5]);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else if (dword_10020F770 <= 30
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]", 30, "Queued Ramp: only supported during an unduck, startLevel: %@, endLevel: %@", v9, v11);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  OS_dispatch_queue *dispatchQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  AAConversationDetectSessionManager *v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F0AC;
  block[3] = &unk_1001E2570;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_registerForAudioSessionResetNotifications
{
  void *v3;
  void *v4;

  if (!self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _registerForAudioSessionResetNotifications]", 30, "Registering for AVAudioSessionMediaServicesWereResetNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_audioSessionReset", AVAudioSessionMediaServicesWereResetNotification, v4);

    self->_avAudioSessionResetNotificationRegistered = 1;
  }
}

- (void)_registerForAVAudioSessionSpeechDetectionStyleChanges
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t currentSpeechDetectionStyle;
  const char *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v9 = 0;
  objc_msgSend(v3, "setCategory:withOptions:error:", AVAudioSessionCategorySpeechDetection, 2, &v9);
  v4 = v9;

  if (v4
    && dword_10020F770 <= 90
    && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]", 90, "Failed to set AVAudioSession Category for Speech Detect with error %@", v4);
  }
  if (!self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]", 30, "Registering for AVAudioSessionSpeechDetectionStyle changes");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("speechDetectionStyle"), 5, 0);

    self->_cdStyleChangeNotificationRegistered = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  self->_currentSpeechDetectionStyle = (unint64_t)objc_msgSend(v6, "speechDetectionStyle");

  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
    if (currentSpeechDetectionStyle > 6)
      v8 = "?";
    else
      v8 = (&off_1001E26E8)[currentSpeechDetectionStyle];
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]", 30, "AVAudioSessionSpeechDetectionStyle current value : %s", v8);
  }
  if (self->_currentSpeechDetectionStyle == 4)
    self->_currentPauseReason = 2;
  -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");

}

- (void)_speechDetectionStyleChanged:(unint64_t)a3
{
  unint64_t currentSpeechDetectionStyle;
  unint64_t v6;
  const char *v7;
  const char *v8;
  unsigned int v9;
  unint64_t v10;
  AAConversationDetectSessionManager *v11;
  uint64_t v12;

  if (a3 - 5 <= 1)
  {
    -[AAConversationDetectSessionManager _speechDetectionUserVolumeChanged:](self, "_speechDetectionUserVolumeChanged:");
    return;
  }
  currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  if (currentSpeechDetectionStyle != a3)
  {
    if (dword_10020F770 <= 30)
    {
      v6 = self->_currentSpeechDetectionStyle;
      if (dword_10020F770 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020F770, 30))
          goto LABEL_15;
        v6 = self->_currentSpeechDetectionStyle;
      }
      if (v6 > 6)
        v7 = "?";
      else
        v7 = (&off_1001E26E8)[v6];
      if (a3 > 4)
        v8 = "?";
      else
        v8 = (&off_1001E26C0)[a3];
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _speechDetectionStyleChanged:]", 30, "AVAudioSessionSpeechDetectionStyle changed from %s -> %s", v7, v8);
    }
LABEL_15:
    self->_currentSpeechDetectionStyle = a3;
    v9 = -[AAConversationDetectSessionManager cdSignalAudioInterrupted](self, "cdSignalAudioInterrupted");
    v10 = self->_currentSpeechDetectionStyle;
    if (v9 && v10 == 1)
    {
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _speechDetectionStyleChanged:]", 30, "Ignoring AVAudioSessionSpeechDetectionStyle change due to interruption from CD session");
      }
      return;
    }
    if (currentSpeechDetectionStyle == 1 && (v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (self->_cdSignal == 11)
      {
        if (dword_10020F770 <= 30
          && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _speechDetectionStyleChanged:]", 30, "AVAudioSessionSpeechDetectionStyle changed from pause to play when current signal is pre-end, ignoring");
        }
        goto LABEL_37;
      }
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _speechDetectionStyleChanged:]", 30, "AVAudioSessionSpeechDetectionStyle changed from pause to play, stop CD session");
      }
      v11 = self;
      v12 = 1;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](v11, "_cdSessionEnsureDeactivated:", v12);
LABEL_37:
    if (self->_currentSpeechDetectionStyle == 4)
      self->_currentPauseReason = 2;
    -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
  }
}

- (void)_speechDetectionUserVolumeChanged:(unint64_t)a3
{
  const char *v5;

  if (dword_10020F770 <= 30 && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
  {
    if (a3 > 6)
      v5 = "?";
    else
      v5 = (&off_1001E26E8)[a3];
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _speechDetectionUserVolumeChanged:]", 30, "User %s change notification received", v5);
  }
  if (a3 == 5 && self->_audioSessionActivated && !self->_cdSignalAudioInterrupted)
    -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](self, "_cdSessionEnsureDeactivated:", 2);
}

- (void)_deviceFound:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *cdSupportedAccessories;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (v4)
  {
    if (objc_msgSend(v9, "conversationDetectCapability") == 1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cdSupportedAccessories, "objectForKeyedSubscript:", v4));
      cdSupportedAccessories = self->_cdSupportedAccessories;
      if (!cdSupportedAccessories)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_cdSupportedAccessories;
        self->_cdSupportedAccessories = v7;

        cdSupportedAccessories = self->_cdSupportedAccessories;
      }
      if (!-[NSMutableDictionary count](cdSupportedAccessories, "count"))
        -[AAConversationDetectSessionManager _activateCDSession](self, "_activateCDSession");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cdSupportedAccessories, "setObject:forKeyedSubscript:", v9, v4);
      if (v5)
      {
        if (dword_10020F770 <= 10
          && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceFound:]", 10, "Ignoring existing CBDevice: %@", v9);
        }
      }
      else
      {
        if (dword_10020F770 <= 30
          && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
        {
          LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceFound:]", 30, "Connected device found: %@\n", v9);
        }
        -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
      }

    }
    else if (dword_10020F770 <= 10
           && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceFound:]", 10, "Connected device not conversation detect capable %@", v9);
    }
  }
  else if (dword_10020F770 <= 90
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceFound:]", 90, "CBDevice identifier not found, %@", v9);
  }

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cdSupportedAccessories, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cdSupportedAccessories, "setObject:forKeyedSubscript:", 0, v4);
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceLost:]", 30, "Connected device lost: %@", v6);
      }
      if (!-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
        -[AAConversationDetectSessionManager _invalidateCDSession](self, "_invalidateCDSession");
    }

  }
  else if (dword_10020F770 <= 90
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 90)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deviceLost:]", 90, "CBDevice identifier not found, %@", v6);
  }

}

- (void)_setPedestrianFenceWithHandler:(id)a3
{
  id v4;
  void *v5;
  CMPedestrianFenceManager *pedestrianFenceManager;
  CMPedestrianFenceManager *v7;
  double v8;
  _QWORD v9[6];
  id v10;

  v4 = a3;
  v5 = v4;
  pedestrianFenceManager = self->_pedestrianFenceManager;
  if (pedestrianFenceManager)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000FB50;
    v9[3] = &unk_1001E2598;
    v9[4] = pedestrianFenceManager;
    v9[5] = self;
    v10 = v4;
    v7 = pedestrianFenceManager;
    LODWORD(v8) = 4.0;
    -[CMPedestrianFenceManager setFence:withRadius:withCompletion:](v7, "setFence:withRadius:withCompletion:", CFSTR("com.apple.audioaccessoryd.cdFence"), v9, v8);

  }
}

- (void)_startPedestrianFenceSession
{
  id v3;
  uint64_t v4;
  CMPedestrianFenceManager *v5;
  CMPedestrianFenceManager *pedestrianFenceManager;
  _QWORD *v7;
  _QWORD v8[5];

  v3 = +[CMPedestrianFenceManager isAvailable](CMPedestrianFenceManager, "isAvailable");
  if ((v3 & 1) != 0 && GestaltGetDeviceClass(v3, v4) == 1)
  {
    if (self->_pedestrianFenceManager)
    {
      if (dword_10020F770 <= 10
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startPedestrianFenceSession]", 10, "Pedestrian fence is already running");
      }
    }
    else
    {
      v5 = (CMPedestrianFenceManager *)objc_alloc_init((Class)CMPedestrianFenceManager);
      pedestrianFenceManager = self->_pedestrianFenceManager;
      self->_pedestrianFenceManager = v5;

      -[CMPedestrianFenceManager startSession](self->_pedestrianFenceManager, "startSession");
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000FDDC;
      v8[3] = &unk_1001E25C0;
      v8[4] = self;
      v7 = objc_retainBlock(v8);
      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startPedestrianFenceSession]", 30, "Setting pedestrian fence radius: %fm", 4.0);
      }
      -[AAConversationDetectSessionManager _setPedestrianFenceWithHandler:](self, "_setPedestrianFenceWithHandler:", v7);

    }
  }
  else if (dword_10020F770 <= 10
         && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
  {
    LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startPedestrianFenceSession]", 10, "Pedestrian fence is not supported on this platform");
  }
}

- (void)_stopPedestrianFenceSession
{
  CMPedestrianFenceManager *pedestrianFenceManager;

  if (self->_pedestrianFenceManager)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _stopPedestrianFenceSession]", 30, "Clearing pedestrian fence");
    }
    -[CMPedestrianFenceManager clearFence:](self->_pedestrianFenceManager, "clearFence:", CFSTR("com.apple.audioaccessoryd.cdFence"));
    -[CMPedestrianFenceManager endSession](self->_pedestrianFenceManager, "endSession");
    pedestrianFenceManager = self->_pedestrianFenceManager;
    self->_pedestrianFenceManager = 0;

  }
}

- (void)_startHeadGestureManager
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  HGManager *v7;
  HGManager *headGestureManager;
  id v9;

  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "HeadGestureForConversationAwareness"))
  {
    if (self->_headGestureManager)
    {
      if (dword_10020F770 <= 10
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 10)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startHeadGestureManager]", 10, "Head Gesture Manager already running");
      }
    }
    else
    {
      v9 = objc_alloc_init((Class)HGConfiguration);
      v3 = objc_alloc_init((Class)HGAudioFeedbackConfiguration);
      objc_msgSend(v9, "setAudioFeedbackConfig:", v3);

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      v5 = objc_msgSend(v4, "opaqueSessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioFeedbackConfig"));
      objc_msgSend(v6, "setAudioSessionID:", v5);

      v7 = (HGManager *)objc_msgSend(objc_alloc((Class)HGManager), "initWithDelegate:config:", self, v9);
      headGestureManager = self->_headGestureManager;
      self->_headGestureManager = v7;

      if (dword_10020F770 <= 30
        && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
      {
        LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _startHeadGestureManager]", 30, "Starting Head Gesture Manager");
      }
      -[HGManager start](self->_headGestureManager, "start");

    }
  }
}

- (void)_stopHeadGestureManager
{
  HGManager *headGestureManager;

  if (self->_headGestureManager)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _stopHeadGestureManager]", 30, "Stopping Head Gesture Manager");
    }
    -[HGManager stop](self->_headGestureManager, "stop");
    headGestureManager = self->_headGestureManager;
    self->_headGestureManager = 0;

  }
}

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AAConversationDetectSessionManager *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001023C;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[4];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010374;
  block[3] = &unk_1001E25E0;
  v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_registerForWirelessSplitterStateChanges
{
  int *p_splitterStateOnToken;
  OS_dispatch_queue *dispatchQueue;
  _QWORD handler[5];

  p_splitterStateOnToken = &self->_splitterStateOnToken;
  if (self->_splitterStateOnToken == -1)
  {
    if (dword_10020F770 <= 30
      && (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30)))
    {
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _registerForWirelessSplitterStateChanges]", 30, "Registering for wireless splitter state changes");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000104D4;
    handler[3] = &unk_1001E2398;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", p_splitterStateOnToken, (dispatch_queue_t)dispatchQueue, handler);
  }
}

- (void)_deregisterFromWirelessSplitterStateChanges
{
  int splitterStateOnToken;

  splitterStateOnToken = self->_splitterStateOnToken;
  if (splitterStateOnToken != -1)
  {
    if (dword_10020F770 > 30)
      goto LABEL_7;
    if (dword_10020F770 != -1 || _LogCategory_Initialize(&dword_10020F770, 30))
      LogPrintF(&dword_10020F770, "-[AAConversationDetectSessionManager _deregisterFromWirelessSplitterStateChanges]", 30, "Deregistering from wireless splitter state changes");
    splitterStateOnToken = self->_splitterStateOnToken;
    if (splitterStateOnToken != -1)
    {
LABEL_7:
      notify_cancel(splitterStateOnToken);
      self->_splitterStateOnToken = -1;
    }
  }
  self->_isWirelessSplitterOn = 0;
  -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
}

- (BOOL)cdSignalAudioInterrupted
{
  return self->_cdSignalAudioInterrupted;
}

- (NSString)currentCDDeviceIdentifier
{
  return self->_currentCDDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCDDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_unduckLevel, 0);
  objc_storeStrong((id *)&self->_rampDuration, 0);
  objc_storeStrong((id *)&self->_pedestrianFenceManager, 0);
  objc_storeStrong((id *)&self->_headGestureManager, 0);
  objc_storeStrong((id *)&self->_duckLevel, 0);
  objc_storeStrong((id *)&self->_chunkedRampingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentCDSupportedAccessory, 0);
  objc_storeStrong((id *)&self->_connectedDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_cdSupportedAccessories, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
