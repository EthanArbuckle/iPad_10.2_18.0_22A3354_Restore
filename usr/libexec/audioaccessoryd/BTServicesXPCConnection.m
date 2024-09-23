@implementation BTServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.BluetoothServices")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_10020FF08 <= 90
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 90)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection _entitledAndReturnError:]", 90, "### Missing entitlement: %#{pid}, '%@'", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.BluetoothServices"));
    }
    if (a3)
    {
      v8 = BTErrorF(4294896128, "Missing entitlement '%@'", CFSTR("com.apple.BluetoothServices"));
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
  BTAudioSession *v3;
  BTAudioSession *audioSession;
  BTShareAudioSessionDaemon *v5;
  BTShareAudioSessionDaemon *v6;
  int v7;
  BTShareAudioSessionDaemon *shareAudioSession;
  BTShareAudioSessionDaemon *v9;

  v3 = self->_audioSession;
  if (v3)
  {
    if (dword_10020FF08 < 31
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@", v3);
    }
    -[BTAudioSession invalidate](v3, "invalidate");
    audioSession = self->_audioSession;
    self->_audioSession = 0;

  }
  v5 = self->_shareAudioSession;
  v6 = v5;
  if (v5)
  {
    v9 = v5;
    if (dword_10020FF08 < 31)
    {
      if (dword_10020FF08 != -1 || (v7 = _LogCategory_Initialize(&dword_10020FF08, 30), v6 = v9, v7))
      {
        LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@", v6);
        v6 = v9;
      }
    }
    -[BTShareAudioSessionDaemon invalidate](v6, "invalidate");
    shareAudioSession = self->_shareAudioSession;
    self->_shareAudioSession = 0;

    v6 = v9;
  }

}

- (void)audioRoutingRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  BTSmartRoutingDaemon *smartRoutingSession;
  BTSmartRoutingDaemon *v9;
  BTSmartRoutingDaemon *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection audioRoutingRequest:responseHandler:]", 30, "%@", v6);
  smartRoutingSession = self->_smartRoutingSession;
  if (smartRoutingSession
    || (v9 = (BTSmartRoutingDaemon *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon")), v10 = self->_smartRoutingSession, self->_smartRoutingSession = v9, v10, (smartRoutingSession = self->_smartRoutingSession) != 0))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000964C8;
    v11[3] = &unk_1001E54B0;
    v12 = v7;
    -[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:](smartRoutingSession, "_smartRoutingAudioRoutingRequest:withResponseHandler:", v6, v11);

  }
}

- (void)audioSessionActivate:(id)a3 completion:(id)a4
{
  id v7;
  BTSmartRoutingDaemon *v8;
  BTSmartRoutingDaemon *smartRoutingSession;
  id v10;

  v10 = a3;
  v7 = a4;
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection audioSessionActivate:completion:]", 30, "Activate: %@", v10);
  objc_storeStrong((id *)&self->_audioSession, a3);
  if (!self->_smartRoutingSession)
  {
    v8 = (BTSmartRoutingDaemon *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
    smartRoutingSession = self->_smartRoutingSession;
    self->_smartRoutingSession = v8;

  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id *v9;
  unsigned __int8 v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100091F7C;
  v32 = sub_100091F8C;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100096920;
  v25[3] = &unk_1001E2A58;
  v27 = &v28;
  v7 = a4;
  v26 = v7;
  v8 = objc_retainBlock(v25);
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection diagnosticControl:completion:]", 30, "DiagnosticControl: %##@", v6);
  v9 = (id *)(v29 + 5);
  obj = (id)v29[5];
  v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if ((v10 & 1) != 0)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("_input"), TypeID, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v14 = v13;
    if (!v13)
    {
      v23 = (id)BTErrorF(4294960591, "No input");
      goto LABEL_22;
    }
    if (objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("FWCrashed")))
    {
      if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("HIDLagDetected")))
      {
        if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("IgnoreBTRestart")))
        {
          if (!objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("shNote")))
          {
            -[BTServicesXPCConnection _diagnosticControlShareAudioBanner](self, "_diagnosticControlShareAudioBanner");
LABEL_21:
            (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSDictionary0__struct, 0);
LABEL_22:

            goto LABEL_23;
          }
          if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("HIDIntervalUpdated")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[BTIdentityDaemon sharedBTIdentityDaemon](BTIdentityDaemon, "sharedBTIdentityDaemon"));
            v16 = objc_msgSend(v15, "diagnosticControl:completion:", v6, v7);

            if ((v16 & 1) == 0)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
              v18 = objc_msgSend(v17, "diagnosticControl:completion:", v6, v7);

              if ((v18 & 1) == 0)
              {
                v19 = BTErrorF(4294960582, "Unsupported control");
                v20 = objc_claimAutoreleasedReturnValue(v19);
                v21 = (void *)v29[5];
                v29[5] = v20;

              }
            }
            goto LABEL_22;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTServicesDaemon sharedBTServicesDaemon](BTServicesDaemon, "sharedBTServicesDaemon"));
          objc_msgSend(v22, "_showHIDIntervalBannerIfEnabled:", v6);
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTServicesDaemon sharedBTServicesDaemon](BTServicesDaemon, "sharedBTServicesDaemon"));
          objc_msgSend(v22, "setIgnoreBTRestart:", 1);
        }
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTServicesDaemon sharedBTServicesDaemon](BTServicesDaemon, "sharedBTServicesDaemon"));
        objc_msgSend(v22, "_showHIDLagBannerIfEnabled:", v6);
      }
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTServicesDaemon sharedBTServicesDaemon](BTServicesDaemon, "sharedBTServicesDaemon"));
      objc_msgSend(v22, "showCrashBannerIfNeeded:", v6);
    }

    goto LABEL_21;
  }
LABEL_23:
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(&v28, 8);
}

- (void)_diagnosticControlShareAudioBanner
{
  id v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection _diagnosticControlShareAudioBanner]", 30, "Diag: ShareAudio banner start");
  v3 = objc_alloc_init((Class)CUUserNotificationSession);
  objc_msgSend(v3, "setBundleID:", CFSTR("com.apple.ShareAudioNotifications"));
  objc_msgSend(v3, "setCategoryID:", CFSTR("ShareAudioCategoryID"));
  objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v3, "setFlags:", 1);
  objc_msgSend(v3, "setTitleKey:", CFSTR("Apple TV"));
  objc_msgSend(v3, "setBodyKey:", CFSTR("SHARE_AUDIO_BODY_FORMAT"));
  objc_msgSend(v3, "setBodyArguments:", &off_1001F4650);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100096B58;
  v5[3] = &unk_1001E5410;
  v5[4] = v3;
  objc_msgSend(v3, "setActionHandler:", v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100096C0C;
  v4[3] = &unk_1001E20E8;
  v4[4] = v3;
  objc_msgSend(v3, "addActionWithIdentifier:title:flags:handler:", CFSTR("ShareAudioActionIDConnect"), CFSTR("SHARE_AUDIO_BUTTON"), 0, v4);
  objc_msgSend(v3, "activate");

}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  const __CFString *v27;
  const __CFString *v28;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100091F7C;
  v25 = sub_100091F8C;
  v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100096EF0;
  v18[3] = &unk_1001E2A58;
  v20 = &v21;
  v7 = a4;
  v19 = v7;
  v8 = objc_retainBlock(v18);
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection diagnosticShow:completion:]", 30, "DiagnosticShow: %.32@", v6);
  v9 = (id *)(v22 + 5);
  obj = (id)v22[5];
  v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if ((v10 & 1) != 0)
  {
    v16 = 0;
    v11 = CUDescriptionWithLevel(self->_daemon, 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF(&v16, "%@", v12);
    v13 = (__CFString *)v16;

    if (v13)
      v14 = v13;
    else
      v14 = CFSTR("None\n");
    v27 = CFSTR("_output");
    v28 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v15, 0);

  }
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(&v21, 8);
}

- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  BTShareAudioSessionDaemon *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  id obj;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100091F7C;
  v29 = sub_100091F8C;
  v30 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100097274;
  v21[3] = &unk_1001E4AF0;
  v24 = &v25;
  v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  v10 = objc_retainBlock(v21);
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection shareAudioSessionActivate:completion:]", 30, "Activate: %@", v8);
  v11 = (id *)(v26 + 5);
  obj = (id)v26[5];
  v12 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (self->_shareAudioSession)
    {
      v17 = NSErrorF(NSOSStatusErrorDomain, 4294960575, "Session already active");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v13 = (BTShareAudioSessionDaemon *)v26[5];
      v26[5] = v18;
    }
    else
    {
      v13 = objc_alloc_init(BTShareAudioSessionDaemon);
      objc_storeStrong((id *)&self->_shareAudioSession, v13);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = dispatch_queue_create("BTShareAudioSessionDaemon", v15);
      -[BTShareAudioSessionDaemon setDispatchQueue:](v13, "setDispatchQueue:", v16);

      -[BTShareAudioSessionDaemon setMode:](v13, "setMode:", objc_msgSend(v8, "mode"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100097334;
      v19[3] = &unk_1001E5488;
      v19[4] = self;
      v19[5] = v13;
      -[BTShareAudioSessionDaemon setProgressHandler:](v13, "setProgressHandler:", v19);
      -[BTShareAudioSessionDaemon activate](v13, "activate");
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v25, 8);
}

- (void)shareAudioUserConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  BTShareAudioSessionDaemon *v5;
  _QWORD *v6;
  const char *v7;
  id *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100091F7C;
  v19 = sub_100091F8C;
  v20 = 0;
  v5 = self->_shareAudioSession;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100097610;
  v14[3] = &unk_1001E24F8;
  v14[4] = v5;
  v14[5] = &v15;
  v6 = objc_retainBlock(v14);
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
  {
    v7 = "no";
    if (v3)
      v7 = "yes";
    LogPrintF(&dword_10020FF08, "-[BTServicesXPCConnection shareAudioUserConfirmed:]", 30, "UserConfirmed: permanent %s, %@", v7, v5);
  }
  v8 = (id *)(v16 + 5);
  obj = (id)v16[5];
  v9 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    if (v5)
    {
      -[BTShareAudioSessionDaemon userConfirmed:](v5, "userConfirmed:", v3);
    }
    else
    {
      v10 = NSErrorF(NSOSStatusErrorDomain, 4294960575, "No session");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)v16[5];
      v16[5] = v11;

    }
  }
  ((void (*)(_QWORD *))v6[2])(v6);

  _Block_object_dispose(&v15, 8);
}

- (BTAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (BTServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
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

- (BTShareAudioSessionDaemon)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_shareAudioSession, a3);
}

- (BTSmartRoutingDaemon)smartRoutingSession
{
  return self->_smartRoutingSession;
}

- (void)setSmartRoutingSession:(id)a3
{
  objc_storeStrong((id *)&self->_smartRoutingSession, a3);
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
  objc_storeStrong((id *)&self->_smartRoutingSession, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

@end
