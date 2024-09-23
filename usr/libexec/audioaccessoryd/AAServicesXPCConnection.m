@implementation AAServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.AudioAccessoryServices")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection _entitledAndReturnError:]", 90, "### Missing entitlement: %#{pid}, '%@'", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.AudioAccessoryServices"));
    }
    if (a3)
    {
      v8 = BTErrorF(4294896128, "Missing entitlement '%@'", CFSTR("com.apple.AudioAccessoryServices"));
      v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      result = 0;
      *a3 = v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcConnectionInvalidated
{
  AAAudioSessionControl *audioSessionControl;
  AAAudioSessionControl *currentAudioSessionControl;
  AAAudioSessionControl *v5;
  AAAudioSessionControl *v6;
  AAAudioSessionControl *v7;
  AAAudioSessionControl *v8;
  unsigned int v9;
  AAServicesDaemon *daemon;
  AADeviceManager *v11;
  AADeviceManager *deviceManager;
  AAAudioSessionControl *v13;

  v13 = self->_audioSessionControl;
  audioSessionControl = self->_audioSessionControl;
  self->_audioSessionControl = 0;

  if (v13)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@", v13);
    }
    -[NSMutableSet removeObject:](self->_daemon->_activatedAudioSessionControlSet, "removeObject:", v13);
    currentAudioSessionControl = self->_daemon->_currentAudioSessionControl;
    v5 = v13;
    v6 = currentAudioSessionControl;
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = v5;
      if (!v6)
      {
LABEL_12:

LABEL_13:
        -[AAAudioSessionControl invalidate](v5, "invalidate");
        goto LABEL_14;
      }
      v9 = -[AAAudioSessionControl isEqual:](v5, "isEqual:", v6);

      if (!v9)
        goto LABEL_13;
    }
    daemon = self->_daemon;
    v8 = daemon->_currentAudioSessionControl;
    daemon->_currentAudioSessionControl = 0;
    goto LABEL_12;
  }
LABEL_14:
  v11 = self->_deviceManager;
  deviceManager = self->_deviceManager;
  self->_deviceManager = 0;

  if (v11)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@", v11);
    }
    -[NSMutableSet removeObject:](self->_daemon->_activatedDeviceManagerSet, "removeObject:", v11);
    -[AADeviceManager invalidate](v11, "invalidate");
  }

}

- (void)audioRoutingControlActivate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  id *v10;
  unsigned __int8 v11;
  NSMutableSet *activatedAudioRoutingControlSet;
  NSMutableSet *v13;
  AAServicesDaemon *daemon;
  NSMutableSet *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100018DDC;
  v24 = sub_100018DEC;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B7B0;
  v17[3] = &unk_1001E2A58;
  v19 = &v20;
  v8 = a4;
  v18 = v8;
  v9 = objc_retainBlock(v17);
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection audioRoutingControlActivate:completion:]", 30, "Activate: %@", v7);
  v10 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    activatedAudioRoutingControlSet = self->_daemon->_activatedAudioRoutingControlSet;
    if (!activatedAudioRoutingControlSet)
    {
      v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v15 = daemon->_activatedAudioRoutingControlSet;
      daemon->_activatedAudioRoutingControlSet = v13;

      activatedAudioRoutingControlSet = self->_daemon->_activatedAudioRoutingControlSet;
    }
    -[NSMutableSet addObject:](activatedAudioRoutingControlSet, "addObject:", v7);
    objc_storeStrong((id *)&self->_daemon->_currentAudioRoutingControl, a3);
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v20, 8);
}

- (void)setHijackBlockingMode:(id)a3 mode:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
  {
    v9 = "no";
    if (v6)
      v9 = "yes";
    LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection setHijackBlockingMode:mode:completion:]", 30, "SetHijackBlockingMode %s %@", v9, v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B990;
  v12[3] = &unk_1001E20C0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "_hijackBlockingModeChangedFromClient:mode:completion:", v7, v6, v12);

}

- (void)activeHRMSessionChanged:(id)a3 hrmState:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a4;
  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100018DDC;
  v21 = sub_100018DEC;
  v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001BB10;
  v14[3] = &unk_1001E2A58;
  v16 = &v17;
  v9 = a5;
  v15 = v9;
  v10 = objc_retainBlock(v14);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  LOBYTE(self) = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((self & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
    objc_msgSend(v12, "_handleHRMSessionChanged:", v6);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)audioSessionControlActivate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  id *v10;
  unsigned __int8 v11;
  NSMutableSet *activatedAudioSessionControlSet;
  NSMutableSet *v13;
  AAServicesDaemon *daemon;
  NSMutableSet *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100018DDC;
  v24 = sub_100018DEC;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001BDFC;
  v17[3] = &unk_1001E2A58;
  v19 = &v20;
  v8 = a4;
  v18 = v8;
  v9 = objc_retainBlock(v17);
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection audioSessionControlActivate:completion:]", 30, "Activate: %@", v7);
  v10 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_audioSessionControl, a3);
    activatedAudioSessionControlSet = self->_daemon->_activatedAudioSessionControlSet;
    if (!activatedAudioSessionControlSet)
    {
      v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v15 = daemon->_activatedAudioSessionControlSet;
      daemon->_activatedAudioSessionControlSet = v13;

      activatedAudioSessionControlSet = self->_daemon->_activatedAudioSessionControlSet;
    }
    -[NSMutableSet addObject:](activatedAudioSessionControlSet, "addObject:", v7);
    objc_storeStrong((id *)&self->_daemon->_currentAudioSessionControl, a3);
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v20, 8);
}

- (void)audioSessionControlUpdate:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  unsigned int v8;
  id v9;
  const char *v10;
  const char *v11;
  id obj;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100018DDC;
  v18 = sub_100018DEC;
  v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001C0FC;
  v13[3] = &unk_1001E2300;
  v13[4] = &v14;
  v5 = objc_retainBlock(v13);
  v6 = (id *)(v15 + 5);
  obj = (id)v15[5];
  v7 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection audioSessionControlUpdate:]", 30, "Update: %@", v4);
    }
    v8 = -[AAAudioSessionControl conversationDetectSignal](self->_audioSessionControl, "conversationDetectSignal");
    v9 = objc_msgSend(v4, "conversationDetectSignal");
    if (v8 != (_DWORD)v9)
    {
      if (dword_10020F980 <= 30
        && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
      {
        if (v8 > 0xB)
          v10 = "?";
        else
          v10 = (&off_1001E2BD0)[v8];
        if (v9 > 0xB)
          v11 = "?";
        else
          v11 = (&off_1001E2BD0)[(int)v9];
        LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection audioSessionControlUpdate:]", 30, "Updating conversation detect signal from %s to %s", v10, v11);
      }
      -[AAAudioSessionControl setConversationDetectSignal:](self->_audioSessionControl, "setConversationDetectSignal:", v9);
      -[AAServicesDaemon _update](self->_daemon, "_update");
    }
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v14, 8);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  _QWORD *v9;
  id *v10;
  unsigned __int8 v11;
  const char *v12;
  AAServicesDaemon *daemon;
  __int128 v14;
  _OWORD v15[2];
  id obj;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100018DDC;
  v22 = sub_100018DEC;
  v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C35C;
  v17[3] = &unk_1001E2300;
  v17[4] = &v18;
  v9 = objc_retainBlock(v17);
  v10 = (id *)(v19 + 5);
  obj = (id)v19[5];
  v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      if (v6 > 6)
        v12 = "?";
      else
        v12 = (&off_1001E2C30)[(int)v6];
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection setMuteAction:auditToken:bundleIdentifier:]", 30, "Mute Control: Updating mute action %s", v12);
    }
    daemon = self->_daemon;
    v14 = *(_OWORD *)&a4->var0[4];
    v15[0] = *(_OWORD *)a4->var0;
    v15[1] = v14;
    -[AAServicesDaemon _updateMuteAction:auditToken:bundleIdentifier:](daemon, "_updateMuteAction:auditToken:bundleIdentifier:", v6, v15, v8);
  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v18, 8);
}

- (void)deviceManagerActivate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  id *v10;
  unsigned __int8 v11;
  NSMutableSet *activatedDeviceManagerSet;
  NSMutableSet *v13;
  AAServicesDaemon *daemon;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id obj;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100018DDC;
  v27 = sub_100018DEC;
  v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001C6C0;
  v20[3] = &unk_1001E2A58;
  v22 = &v23;
  v8 = a4;
  v21 = v8;
  v9 = objc_retainBlock(v20);
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerActivate:completion:]", 30, "Activate: %@", v7);
  v10 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_deviceManager, a3);
    activatedDeviceManagerSet = self->_daemon->_activatedDeviceManagerSet;
    if (!activatedDeviceManagerSet)
    {
      v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v15 = daemon->_activatedDeviceManagerSet;
      daemon->_activatedDeviceManagerSet = v13;

      activatedDeviceManagerSet = self->_daemon->_activatedDeviceManagerSet;
    }
    -[NSMutableSet addObject:](activatedDeviceManagerSet, "addObject:", v7);
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    -[AAServicesDaemon _update](self->_daemon, "_update");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "availableDevices"));

    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerActivate:completion:]", 30, "available devices count: %lu", objc_msgSend(v17, "count"));
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001C780;
    v18[3] = &unk_1001E27D8;
    v18[4] = self;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v23, 8);
}

- (void)deviceManagerUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  unsigned int v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100018DDC;
  v14[4] = sub_100018DEC;
  v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CA24;
  v11[3] = &unk_1001E2A58;
  v13 = v14;
  v7 = a4;
  v12 = v7;
  v8 = objc_retainBlock(v11);
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerUpdate:completion:]", 30, "Update: %@", v6);
  v9 = -[AADeviceManager headGestureUpdateFlags](self->_deviceManager, "headGestureUpdateFlags");
  v10 = objc_msgSend(v6, "headGestureUpdateFlags");
  if (v9 != (_DWORD)v10)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerUpdate:completion:]", 30, "Updating headgestureSignal from %d to %d", v9, (_DWORD)v10);
    }
    -[AADeviceManager setHeadGestureUpdateFlags:](self->_deviceManager, "setHeadGestureUpdateFlags:", v10);
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(v14, 8);
}

- (void)deviceManagerSendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id *v12;
  unsigned __int8 v13;
  AADeviceManager *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100018DDC;
  v26 = sub_100018DEC;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001CD68;
  v19[3] = &unk_1001E2A58;
  v21 = &v22;
  v10 = a5;
  v20 = v10;
  v11 = objc_retainBlock(v19);
  v12 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v13 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerSendDeviceConfig:identifier:completion:]", 30, "AADeviceManager: send config: %@, to device with identifier: %@", v8, v9);
    }
    v14 = self->_deviceManager;
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001CE28;
      v16[3] = &unk_1001E20C0;
      v17 = v10;
      objc_msgSend(v15, "sendDeviceConfig:identifier:completion:", v8, v9, v16);

    }
    else if (dword_10020F980 <= 90
           && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection deviceManagerSendDeviceConfig:identifier:completion:]", 90, "### AADeviceManager send device config failed: object not activated");
    }

  }
  ((void (*)(_QWORD *))v11[2])(v11);

  _Block_object_dispose(&v22, 8);
}

- (void)deviceManagerReportDeviceFound:(id)a3
{
  void *v4;
  AADeviceManager *v5;
  NSMutableDictionary *devices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  if (v4)
  {
    v5 = self->_deviceManager;
    if (v5)
    {
      devices = self->_devices;
      if (!devices)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_devices;
        self->_devices = v7;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v4);
      if (-[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v9, "deviceManagerFoundDevice:", v10);

      }
    }

  }
}

- (void)deviceManagerReportDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  AADeviceManager *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      v6 = self->_deviceManager;
      if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v4);
        if (-[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          objc_msgSend(v7, "deviceManagerLostDevice:", v8);

        }
      }

    }
  }

}

- (void)deviceManagerHeadGestureDetected:(id)a3
{
  void *v4;
  void *v5;
  AADeviceManager *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      v6 = self->_deviceManager;
      if (v6 && -[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v7, "deviceHeadGestureDetected:", v8);

      }
    }
  }

}

- (BOOL)_shouldSendXPCMessage
{
  unsigned int xpcMessageCounter;
  NSXPCConnection *xpcCnx;
  void *v6;
  _QWORD v7[5];

  xpcMessageCounter = self->_xpcMessageCounter;
  if (xpcMessageCounter != -1)
  {
    self->_xpcMessageCounter = xpcMessageCounter + 1;
    if (xpcMessageCounter <= 0xC7)
    {
      if (xpcMessageCounter == 99)
      {
        xpcCnx = self->_xpcCnx;
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_10001D15C;
        v7[3] = &unk_1001E20E8;
        v7[4] = self;
        -[NSXPCConnection scheduleSendBarrierBlock:](xpcCnx, "scheduleSendBarrierBlock:", v7);
      }
      else if (xpcMessageCounter == 199)
      {
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesXPCConnection _shouldSendXPCMessage]", 30, "AAServicesXPCConnection[%#{pid}]: Reached max outstanding messages (%d), issue require reset", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), self->_xpcMessageCounter);
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v6, "aaServicesRequireReset");

        return 0;
      }
      return 1;
    }
  }
  return 0;
}

- (AAAudioSessionControl)audioSessionControl
{
  return self->_audioSessionControl;
}

- (void)setAudioSessionControl:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionControl, a3);
}

- (AAServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (AADeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_audioSessionControl, 0);
}

@end
