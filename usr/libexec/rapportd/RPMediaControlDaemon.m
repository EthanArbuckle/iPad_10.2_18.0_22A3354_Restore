@implementation RPMediaControlDaemon

- (RPMediaControlDaemon)init
{
  RPMediaControlDaemon *v2;
  RPMediaControlDaemon *v3;
  RPMediaControlDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPMediaControlDaemon;
  v2 = -[RPMediaControlDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  RPMessageable *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[5];
  const __CFString *v20;
  _UNKNOWN **v21;

  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(-[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue"));
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = self->_messenger;
  if (v13)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon activateAndReturnError:]", 30, "Activate\n");
    }
    v20 = CFSTR("statusFlags");
    v21 = &off_10011AC50;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006A76C;
    v19[3] = &unk_100111BF8;
    v19[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", CFSTR("_mcc"), v16, v19);

  }
  else
  {
    v14 = RPErrorF(4294960591, (uint64_t)"No messenger provided", v7, v8, v9, v10, v11, v12, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100130FE8 <= 90
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon activateAndReturnError:]", 90, "### Activate failed: %{error}\n", v15);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);

  }
  return v13 != 0;
}

- (void)invalidate
{
  OS_dispatch_source *movementEndTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  RPMessageable *messenger;
  id sendInterestEventHandler;

  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon invalidate]", 30, "Invalidate\n");
  if (self->_movementEndTimer)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon invalidate]", 30, "Auto-ending movement on invalidate\n");
    }
    MRMediaRemoteSendCommand(self->_movementEndCommand, 0);
    self->_movementCommand = 3;
    movementEndTimer = self->_movementEndTimer;
    if (movementEndTimer)
    {
      v4 = movementEndTimer;
      dispatch_source_cancel(v4);
      v5 = self->_movementEndTimer;
      self->_movementEndTimer = 0;

    }
  }
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_mcc"));
  messenger = self->_messenger;
  self->_messenger = 0;

  sendInterestEventHandler = self->_sendInterestEventHandler;
  self->_sendInterestEventHandler = 0;

  -[RPMediaControlDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
}

- (void)registeredEventID:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("_iMC")))
  {
    self->_mediaControlInterest = 1;
    -[RPMediaControlDaemon _update](self, "_update");
  }
}

- (void)deregisteredEventID:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("_iMC")))
  {
    self->_mediaControlInterest = 0;
    -[RPMediaControlDaemon _update](self, "_update");
  }
}

- (void)_update
{
  if (self->_mediaControlInterest)
    -[RPMediaControlDaemon _mediaControlEnsureStarted](self, "_mediaControlEnsureStarted");
  else
    -[RPMediaControlDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
}

- (void)_mediaControlEnsureStarted
{
  void *v3;
  void *v4;
  uint64_t LocalEndpoint;
  OS_dispatch_queue *dispatchQueue;
  void (**sendInterestEventHandler)(id, const __CFString *, void *);
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  void *v11;

  if (!self->_mediaRemoteCommandObserving)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaControlEnsureStarted]", 30, "MediaRemote changes start\n");
    }
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_mediaRemoteSupportedCommandsChanged", kMRMediaRemoteSupportedCommandsDidChangeNotification, 0);
    self->_mediaRemoteCommandObserving = 1;
    -[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet](self, "_mediaRemoteSupportedCommandsGet");

  }
  if (self->_mediaRemoteVolumeObserving)
  {
    if (!self->_sendInterestEventHandler)
      return;
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaControlEnsureStarted]", 30, "Sending current media control flags\n");
    }
    sendInterestEventHandler = (void (**)(id, const __CFString *, void *))self->_sendInterestEventHandler;
    v10 = CFSTR("_mcF");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_mediaControlFlags));
    v11 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    sendInterestEventHandler[2](sendInterestEventHandler, CFSTR("_iMC"), v8);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_mediaRemoteVolumeControlChanged:", kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification, 0);
    self->_mediaRemoteVolumeObserving = 1;
    self->_mediaRemoteVolumeCaps = 0;
    LocalEndpoint = MRAVEndpointGetLocalEndpoint(0);
    if (LocalEndpoint)
    {
      dispatchQueue = self->_dispatchQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10006AB98;
      v9[3] = &unk_1001132B8;
      v9[4] = self;
      MRAVEndpointGetVolumeControlCapabilities(LocalEndpoint, dispatchQueue, v9);
    }
  }

}

- (void)_mediaControlEnsureStopped
{
  void *v3;
  void *v4;

  if (self->_mediaRemoteCommandObserving)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaControlEnsureStopped]", 30, "MediaRemote changes stop\n");
    }
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, kMRMediaRemoteSupportedCommandsDidChangeNotification, 0);
    self->_mediaRemoteCommandObserving = 0;

  }
  if (self->_mediaRemoteVolumeObserving)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification, 0);
    self->_mediaRemoteVolumeObserving = 0;

  }
  self->_mediaControlFlags = 0;
}

- (void)_mediaControlFlagsUpdate:(unint64_t)a3 mask:(unint64_t)a4
{
  unint64_t mediaControlFlags;
  unint64_t v5;
  void (**v7)(id, const __CFString *, void *);
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  mediaControlFlags = self->_mediaControlFlags;
  v5 = mediaControlFlags & ~a4 | a4 & a3;
  if (v5 != mediaControlFlags)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaControlFlagsUpdate:mask:]", 30, "MediaControl flags changed: %ll{flags}\n", v5, &unk_10010A928);
    }
    self->_mediaControlFlags = v5;
    v7 = (void (**)(id, const __CFString *, void *))objc_retainBlock(self->_sendInterestEventHandler);
    if (v7)
    {
      v10 = CFSTR("_mcF");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
      v11 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      v7[2](v7, CFSTR("_iMC"), v9);

    }
  }
}

- (void)_mediaRemoteSupportedCommandsChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AEEC;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_mediaRemoteSupportedCommandsGet
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD v4[5];

  if (!self->_mediaRemoteCommandGetting)
  {
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet]", 30, "MediaRemote supported commands get\n");
    }
    self->_mediaRemoteCommandGetting = 1;
    dispatchQueue = self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10006B034;
    v4[3] = &unk_1001132E0;
    v4[4] = self;
    MRMediaRemoteGetSupportedCommands(dispatchQueue, v4);
  }
}

- (void)_mediaRemoteVolumeControlChanged:(id)a3
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
  v7[2] = sub_10006B2E0;
  v7[3] = &unk_100111928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_mediaRemoteVolumeControlUpdate
{
  -[RPMediaControlDaemon _mediaControlFlagsUpdate:mask:](self, "_mediaControlFlagsUpdate:mask:", (unint64_t)(self->_mediaRemoteVolumeCaps != 0) << 8, 256);
}

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Int64Ranged;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  RPMediaControlDaemon *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  OS_dispatch_source *movementEndTimer;
  NSObject *v23;
  OS_dispatch_source *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  Int64Ranged = CFDictionaryGetInt64Ranged(v25, CFSTR("_mcc"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
  {
    if (Int64Ranged > 0xD)
      v14 = "?";
    else
      v14 = off_100113340[(int)Int64Ranged];
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleCommand:responseHandler:]", 30, "Command <%s>, %##.16@\n", v14, v25);
  }
  switch((int)Int64Ranged)
  {
    case 1:
      v15 = 0;
      goto LABEL_17;
    case 2:
      v15 = 1;
      goto LABEL_17;
    case 3:
      v15 = 4;
      goto LABEL_17;
    case 4:
      v15 = 5;
LABEL_17:
      MRMediaRemoteSendCommand(v15, 0);
      goto LABEL_28;
    case 5:
      -[RPMediaControlDaemon _handleGetVolume:responseHandler:](self, "_handleGetVolume:responseHandler:", v25, v6);
      break;
    case 6:
      -[RPMediaControlDaemon _handleSetVolume:responseHandler:](self, "_handleSetVolume:responseHandler:", v25, v6);
      break;
    case 7:
      -[RPMediaControlDaemon _handleSkipByRequest:responseHandler:](self, "_handleSkipByRequest:responseHandler:", v25, v6);
      break;
    case 8:
      v18 = self;
      v19 = 8;
      v20 = 9;
      goto LABEL_24;
    case 9:
      v21 = 9;
      goto LABEL_26;
    case 10:
      v18 = self;
      v19 = 10;
      v20 = 11;
LABEL_24:
      -[RPMediaControlDaemon _handleMovementCommand:endCommand:](v18, "_handleMovementCommand:endCommand:", v19, v20);
      goto LABEL_28;
    case 11:
      v21 = 11;
LABEL_26:
      MRMediaRemoteSendCommand(v21, 0);
      self->_movementCommand = 3;
      movementEndTimer = self->_movementEndTimer;
      if (movementEndTimer)
      {
        v23 = movementEndTimer;
        dispatch_source_cancel(v23);
        v24 = self->_movementEndTimer;
        self->_movementEndTimer = 0;

      }
LABEL_28:
      (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
      break;
    case 12:
      -[RPMediaControlDaemon _handleMediaCaptionGet:responseHandler:](self, "_handleMediaCaptionGet:responseHandler:", v25, v6);
      break;
    case 13:
      -[RPMediaControlDaemon _handleMediaCaptionSet:responseHandler:](self, "_handleMediaCaptionSet:responseHandler:", v25, v6);
      break;
    default:
      v16 = RPErrorF(4294960582, (uint64_t)"Unsupported command: %d", v7, v8, v9, v10, v11, v12, Int64Ranged);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (dword_100130FE8 <= 60
        && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 60)))
      {
        LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleCommand:responseHandler:]", 60, "### HandleCommand failed: %{error}", v17);
      }
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v17);

      break;
  }

}

- (void)_handleMediaCaptionGet:(id)a3 responseHandler:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = ((uint64_t (*)(uint64_t))off_100131060[0])(1);
  if (v6 > 2)
    v7 = 0;
  else
    v7 = dword_10010A98C[v6];
  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleMediaCaptionGet:responseHandler:]", 30, "MediaCaptionGet: %s\n", off_1001133B0[(int)v7]);
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("_mcs"));

  (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v8, 0, 0);
}

- (void)_handleMediaCaptionSet:(id)a3 responseHandler:(id)a4
{
  id v5;
  uint64_t Int64Ranged;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int v19;

  v5 = a4;
  v19 = 0;
  Int64Ranged = CFDictionaryGetInt64Ranged(a3, CFSTR("_mcs"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v19);
  if (v19)
  {
    v13 = RPErrorF(4294960591, (uint64_t)"No media caption setting", v7, v8, v9, v10, v11, v12, v18);
LABEL_3:
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100130FE8 <= 90
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleMediaCaptionSet:responseHandler:]", 90, "### MediaCaptionSet failed: %{error}\n", v14);
    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v14);

  }
  else
  {
    v15 = Int64Ranged - 1;
    v16 = 0;
    switch((int)Int64Ranged)
    {
      case 1:
        v16 = 1;
        break;
      case 2:
        v16 = 2;
        break;
      case 3:
        break;
      case 4:
        v16 = 2 * (((uint64_t (*)(uint64_t))off_100131060[0])(1) != 2);
        break;
      default:
        v13 = RPErrorF(4294960591, (uint64_t)"Bad media caption setting: %d", v7, v8, v9, v10, v11, v12, Int64Ranged);
        goto LABEL_3;
    }
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      if (v15 > 3)
        v17 = "?";
      else
        v17 = off_1001133D0[v15];
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleMediaCaptionSet:responseHandler:]", 30, "MediaCaptionSet: %s (%d)\n", v17, v16);
    }
    off_100131068(1, v16);
    (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, &__NSDictionary0__struct, 0, 0);
  }

}

- (void)_handleMovementCommand:(unsigned int)a3 endCommand:(unsigned int)a4
{
  OS_dispatch_source *movementEndTimer;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD handler[5];

  if (self->_movementCommand != a3)
  {
    MRMediaRemoteSendCommand(*(_QWORD *)&a3, 0);
    self->_movementCommand = a3;
  }
  self->_movementEndCommand = a4;
  movementEndTimer = self->_movementEndTimer;
  if (movementEndTimer)
  {
    CUDispatchTimerSet(movementEndTimer, 15.0, -1.0, -4.0);
  }
  else
  {
    v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v9 = self->_movementEndTimer;
    self->_movementEndTimer = v8;

    v10 = self->_movementEndTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006BABC;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    CUDispatchTimerSet(self->_movementEndTimer, 15.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_movementEndTimer);
  }
}

- (void)_handleSkipByRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  double Double;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  v9 = 0;
  v5 = a4;
  Double = CFDictionaryGetDouble(a3, CFSTR("_skpS"), &v9);
  if (v9)
    Double = 10.0;
  if (Double < 0.0)
    v7 = 18;
  else
    v7 = 17;
  v10 = kMRMediaRemoteOptionSkipInterval;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(Double)));
  v11 = v8;
  MRMediaRemoteSendCommand(v7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, &__NSDictionary0__struct, 0, 0);
}

- (void)_handleGetVolume:(id)a3 responseHandler:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  float v19;

  v4 = a4;
  v5 = objc_msgSend((Class)off_100131058[0](), "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v19 = 0.0;
  v13 = objc_msgSend(v6, "getVolume:forCategory:", &v19, CFSTR("MediaPlayback"));
  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleGetVolume:responseHandler:]", 30, "Get volume: %f, %#m\n", v19);
  if ((v13 & 1) != 0)
  {
    v14 = objc_alloc_init((Class)NSMutableDictionary);
    *(float *)&v15 = v19;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("_vol"));

    (*((void (**)(id, id, _QWORD, _QWORD))v4 + 2))(v4, v14, 0, 0);
  }
  else
  {
    v17 = RPErrorF(4294960596, (uint64_t)"AVSystemController getVolume failed", v7, v8, v9, v10, v11, v12, v18);
    v14 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (dword_100130FE8 <= 90
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleGetVolume:responseHandler:]", 90, "### Get volume failed: %{error}\n", v14);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v14);
  }

}

- (void)_handleSetVolume:(id)a3 responseHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double Double;
  uint64_t v13;
  const char *v14;
  double v15;
  id v17;
  void *v18;
  id v19;
  float v20;
  double v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  id v31;
  double v32;
  void *v33;
  uint64_t v34;
  float v35;
  unsigned int v36;

  v5 = a4;
  v36 = 0;
  Double = CFDictionaryGetDouble(a3, CFSTR("_vol"), &v36);
  v13 = v36;
  if (v36)
  {
    v14 = "No volume";
    goto LABEL_8;
  }
  v15 = Double;
  if (Double < 0.0 || Double > 1.0)
  {
    v34 = *(_QWORD *)&Double;
    v14 = "Volume ouf of range (%f)";
    v13 = 4294960586;
LABEL_8:
    v17 = RPErrorF(v13, (uint64_t)v14, v6, v7, v8, v9, v10, v11, v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (dword_100130FE8 <= 90
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]", 90, "### Set volume failed: %{error}\n", v18);
    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v18);
    goto LABEL_16;
  }
  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]", 30, "Set volume: %f\n", v15);
  v19 = objc_msgSend((Class)off_100131058[0](), "sharedAVSystemController");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v20 = v15;
  *(float *)&v21 = v20;
  v22 = objc_msgSend(v18, "setVolumeTo:forCategory:", CFSTR("MediaPlayback"), v21);
  if (v22)
    v29 = 0;
  else
    v29 = -6700;
  v36 = v29;
  if ((v22 & 1) != 0)
  {
    v35 = 0.0;
    if ((objc_msgSend(v18, "getVolume:forCategory:", &v35, CFSTR("MediaPlayback")) & 1) == 0)
    {
      if (dword_100130FE8 <= 90
        && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
      {
        LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]", 90, "### Get volume after set failed\n");
      }
      v35 = v20;
    }
    v31 = objc_alloc_init((Class)NSMutableDictionary);
    *(float *)&v32 = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("_vol"));

    (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v31, 0, 0);
  }
  else
  {
    v30 = RPErrorF(4294960596, (uint64_t)"AVSystemController getVolume failed", v23, v24, v25, v26, v27, v28, v34);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    if (dword_100130FE8 <= 90
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 90)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]", 90, "### Get volume failed: %{error}\n", v31);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v31);
  }

LABEL_16:
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (id)sendInterestEventHandler
{
  return self->_sendInterestEventHandler;
}

- (void)setSendInterestEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendInterestEventHandler, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_movementEndTimer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
