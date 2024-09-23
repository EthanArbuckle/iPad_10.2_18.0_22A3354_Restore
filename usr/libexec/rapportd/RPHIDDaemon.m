@implementation RPHIDDaemon

- (BOOL)activateAndReturnError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  RPMessageable *v11;
  id v12;
  void *v13;
  int v14;
  __IOHIDEventSystemClient *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __IOHIDEventSystemClient *v22;
  BOOL v23;
  void *v24;
  const char *v25;
  id v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  const __CFString *v36;
  _UNKNOWN **v37;

  v11 = self->_messenger;
  if (v11)
  {
    if (dword_100130940 <= 30
      && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
    {
      LogPrintF(&dword_100130940, "-[RPHIDDaemon activateAndReturnError:]", 30, "Activate\n");
    }
    self->_epochResetTicks = SecondsToUpTicks(3);
    if (self->_hidClient
      || (v15 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(0), (self->_hidClient = v15) != 0))
    {
      if (self->_hidGCClient
        || (v22 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(0), (self->_hidGCClient = v22) != 0))
      {
        v36 = CFSTR("statusFlags");
        v37 = &off_10011AB18;
        v23 = 1;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10004DCD0;
        v35[3] = &unk_100111BF8;
        v35[4] = self;
        -[RPMessageable registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", CFSTR("_hidC"), v24, v35);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10004DCDC;
        v34[3] = &unk_100111BF8;
        v34[4] = self;
        -[RPMessageable registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", CFSTR("_touchStart"), v24, v34);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10004DCE8;
        v33[3] = &unk_100111BF8;
        v33[4] = self;
        -[RPMessageable registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", CFSTR("_touchStop"), v24, v33);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10004DCF4;
        v32[3] = &unk_100112AE0;
        v32[4] = self;
        -[RPMessageable registerEventID:options:handler:](v11, "registerEventID:options:handler:", CFSTR("_hidT"), v24, v32);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10004DD00;
        v31[3] = &unk_100111BF8;
        v31[4] = self;
        -[RPMessageable registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", CFSTR("_gcStart"), v24, v31);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10004DD0C;
        v30[3] = &unk_100111BF8;
        v30[4] = self;
        -[RPMessageable registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", CFSTR("_gcStop"), v24, v30);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10004DD18;
        v29[3] = &unk_100112AE0;
        v29[4] = self;
        -[RPMessageable registerEventID:options:handler:](v11, "registerEventID:options:handler:", CFSTR("_hidGC"), v24, v29);

        goto LABEL_22;
      }
      v25 = "Create HID GC client failed";
    }
    else
    {
      v25 = "Create HID client failed";
    }
    v26 = RPErrorF(4294960591, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v14 = dword_100130940;
  }
  else
  {
    v12 = RPErrorF(4294960591, (uint64_t)"No messenger provided", v5, v6, v7, v8, v9, v10, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = dword_100130940;
  }
  if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon activateAndReturnError:]", 90, "### Activate failed: %{error}\n", v13);
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  v23 = 0;
LABEL_22:

  return v23;
}

- (void)invalidate
{
  RPMessageable *messenger;
  __IOHIDEventSystemClient *hidClient;
  __IOHIDEventSystemClient *hidGCClient;

  if (dword_100130940 <= 30 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon invalidate]", 30, "Invalidate\n");
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_hidC"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_touchStart"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_touchStop"));
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_hidT"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_gcStart"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_gcStop"));
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_hidGC"));
  messenger = self->_messenger;
  self->_messenger = 0;

  hidClient = self->_hidClient;
  if (hidClient)
  {
    CFRelease(hidClient);
    self->_hidClient = 0;
  }
  hidGCClient = self->_hidGCClient;
  if (hidGCClient)
  {
    CFRelease(hidGCClient);
    self->_hidGCClient = 0;
  }
}

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v6;
  uint64_t Int64Ranged;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  RPHIDDaemon *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  Int64Ranged = CFDictionaryGetInt64Ranged(v22, CFSTR("_hidC"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  v14 = CFDictionaryGetInt64Ranged(v22, CFSTR("_hBtS"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (dword_100130940 <= 30 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
  {
    if (Int64Ranged > 0x13)
      v15 = "?";
    else
      v15 = (&off_100112B28)[(int)Int64Ranged];
    if (v14 > 2)
      v16 = "?";
    else
      v16 = (&off_100112BC8)[(int)v14];
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleCommand:responseHandler:]", 30, "Command <%s>, Button %s, %##.16@\n", v15, v16, v22);
  }
  switch((int)Int64Ranged)
  {
    case 1:
      v17 = self;
      v18 = 1;
      v19 = 140;
      goto LABEL_36;
    case 2:
      v17 = self;
      v18 = 1;
      goto LABEL_33;
    case 3:
      v17 = self;
      v18 = 1;
      v19 = 139;
      goto LABEL_36;
    case 4:
      v17 = self;
      v18 = 1;
      v19 = 138;
      goto LABEL_36;
    case 5:
      v17 = self;
      v18 = 1;
      v19 = 134;
      goto LABEL_36;
    case 6:
      -[RPHIDDaemon _handleSelectWithButtonState:](self, "_handleSelectWithButtonState:", v14);
      goto LABEL_37;
    case 7:
      v17 = self;
      v18 = 12;
      v19 = 96;
      goto LABEL_36;
    case 8:
      v17 = self;
      v18 = 12;
      v19 = 233;
      goto LABEL_36;
    case 9:
      v17 = self;
      v18 = 12;
      v19 = 234;
      goto LABEL_36;
    case 10:
      v17 = self;
      v18 = 12;
      v19 = 4;
      goto LABEL_36;
    case 11:
      -[RPHIDDaemon _activateScreenSaverWithResponseHandler:](self, "_activateScreenSaverWithResponseHandler:", v6);
      break;
    case 12:
      -[RPHIDDaemon _sleepSystemWithResponseHandler:](self, "_sleepSystemWithResponseHandler:", v6);
      break;
    case 13:
      -[RPHIDDaemon _wakeSystemWithResponseHandler:](self, "_wakeSystemWithResponseHandler:", v6);
      break;
    case 14:
      v17 = self;
      v18 = 12;
      v19 = 205;
      goto LABEL_36;
    case 15:
      v17 = self;
      v18 = 7;
      v19 = 75;
      goto LABEL_36;
    case 16:
      v17 = self;
      v18 = 7;
      v19 = 78;
      goto LABEL_36;
    case 17:
      v17 = self;
      v18 = 12;
LABEL_33:
      v19 = 141;
      goto LABEL_36;
    case 18:
      v17 = self;
      v18 = 12;
      v19 = 226;
      goto LABEL_36;
    case 19:
      v17 = self;
      v18 = 12;
      v19 = 48;
LABEL_36:
      -[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:](v17, "_injectKeyboardEventUsagePage:usageCode:buttonState:", v18, v19, v14);
LABEL_37:
      (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
      break;
    default:
      v20 = RPErrorF(4294960582, (uint64_t)"Unsupported command: %d", v8, v9, v10, v11, v12, v13, Int64Ranged);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (dword_100130940 <= 60
        && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
      {
        LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleCommand:responseHandler:]", 60, "### HandleCommand failed: %{error}", v21);
      }
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v21);

      break;
  }

}

- (void)_activateScreenSaverWithResponseHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = RPErrorF(4294960561, (uint64_t)"ScreenSaver not supported", v3, v4, v5, v6, v7, v8, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (dword_100130940 <= 60 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _activateScreenSaverWithResponseHandler:]", 60, "### ActivateScreenSaver failed: %{error}", v10);
  (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v10);

}

- (void)_injectKeyboardEventUsagePage:(unsigned int)a3 usageCode:(unsigned int)a4 buttonState:(int)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t KeyboardEvent;
  const void *v11;
  unint64_t hidSenderID;
  uint64_t TimeStamp;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  const char *v23;
  char v24;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (!self->_hidClient
    || (-[RPHIDDaemon _setupHIDSenderIDIfNeeded](self, "_setupHIDSenderIDIfNeeded"),
        v9 = mach_absolute_time(),
        (KeyboardEvent = IOHIDEventCreateKeyboardEvent(0, v9, v7, v6, a5 < 2, 0)) == 0))
  {
LABEL_15:
    if (dword_100130940 <= 60
      && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
    {
      if (a5 > 2)
        v23 = "?";
      else
        v23 = (&off_100112BC8)[a5];
      LogPrintF(&dword_100130940, "-[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:]", 60, "### Inject usage page 0x%X, usage code 0x%X, buttonState %d (%s) failed: %#m\n", v7, v6, a5, v23);
    }
    return;
  }
  v11 = (const void *)KeyboardEvent;
  hidSenderID = self->_hidSenderID;
  if (hidSenderID)
    IOHIDEventSetSenderID(KeyboardEvent, hidSenderID);
  v24 = 0;
  TimeStamp = IOHIDEventGetTimeStamp(v11);
  v14 = IOHIDEventCreateVendorDefinedEvent(0, TimeStamp, 65299, 16, 1, &v24, 0, 0);
  if (v14)
  {
    v15 = (const void *)v14;
    IOHIDEventAppendEvent(v11, v14, 0);
    CFRelease(v15);
  }
  IOHIDEventSystemClientDispatchEvent(self->_hidClient, v11);
  CFRelease(v11);
  if (!a5)
  {
    v16 = mach_absolute_time();
    v17 = IOHIDEventCreateKeyboardEvent(0, v16, v7, v6, 0, 0);
    if (v17)
    {
      v18 = (const void *)v17;
      v19 = self->_hidSenderID;
      if (v19)
        IOHIDEventSetSenderID(v17, v19);
      v20 = IOHIDEventGetTimeStamp(v18);
      v21 = IOHIDEventCreateVendorDefinedEvent(0, v20, 65299, 16, 1, &v24, 0, 0);
      if (v21)
      {
        v22 = (const void *)v21;
        IOHIDEventAppendEvent(v18, v21, 0);
        CFRelease(v22);
      }
      IOHIDEventSystemClientDispatchEvent(self->_hidClient, v18);
      CFRelease(v18);
      return;
    }
    goto LABEL_15;
  }
}

- (void)_sleepSystemWithResponseHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = RPErrorF(4294960561, (uint64_t)"SleepSystem not supported", v3, v4, v5, v6, v7, v8, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (dword_100130940 <= 60 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _sleepSystemWithResponseHandler:]", 60, "### SleepSystem failed: %{error}", v10);
  (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v10);

}

- (void)_wakeSystemWithResponseHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = RPErrorF(4294960561, (uint64_t)"WakeSystem not supported", v3, v4, v5, v6, v7, v8, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (dword_100130940 <= 60 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _wakeSystemWithResponseHandler:]", 60, "### WakeSystem failed: %{error}", v10);
  (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v10);

}

- (void)_handleGameControllerStart:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v8 = 0;
  -[RPHIDDaemon _setupHIDGCDeviceWithOptions:andReturnError:](self, "_setupHIDGCDeviceWithOptions:andReturnError:", a3, &v8);
  v7 = v8;
  if (v7)
  {
    if (dword_100130940 <= 90
      && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
    {
      LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleGameControllerStart:responseHandler:]", 90, "### Game Controller start failed: %{error}\n", v7);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v7);
  }
  else
  {
    (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
  }

}

- (void)_handleGameControllerStop:(id)a3 responseHandler:(id)a4
{
  __IOHIDUserDevice *hidGCDevice;
  id v6;

  v6 = a4;
  hidGCDevice = self->_hidGCDevice;
  if (hidGCDevice)
  {
    CFRelease(hidGCDevice);
    self->_hidGCDevice = 0;
  }
  self->_hidGCSenderID = 0;
  self->_hidGCSenderIDInitialized = 0;
  (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);

}

- (void)_handleGameControllerAuxEvent:(int64_t)a3 pressed:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  v7 = mach_absolute_time();
  v8 = IOHIDEventCreate(0, 3, v7, 0);
  if (v8)
  {
    v9 = (const void *)v8;
    IOHIDEventSetEventFlags(v8, 1);
    IOHIDEventSetIntegerValue(v9, 196608, 12);
    IOHIDEventSetIntegerValue(v9, 196609, a3);
    IOHIDEventSetIntegerValue(v9, 196610, a4);
    IOHIDEventSetIntegerValue(v9, 196612, 1);
    IOHIDEventSetSenderID(v9, self->_hidGCSenderID);
    IOHIDEventSystemClientDispatchEvent(self->_hidGCClient, v9);
    CFRelease(v9);
  }
  else if (dword_100130940 <= 60
         && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
  {
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleGameControllerAuxEvent:pressed:]", 60, "### Inject Game Controller event failed: %#m\n", 4294960568);
  }
}

- (void)_handleGameControllerEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  int Int64Ranged;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double Double;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v4 = a3;
  v30 = v4;
  if (!self->_hidGCClient)
    goto LABEL_12;
  if (!v4)
  {
    v21 = 4294960559;
    goto LABEL_15;
  }
  -[RPHIDDaemon _setupHIDGCSenderIDIfNeeded](self, "_setupHIDGCSenderIDIfNeeded");
  if (self->_hidGCSenderID)
  {
    v5 = mach_absolute_time();
    v6 = IOHIDEventCreate(0, 35, v5, 0);
    if (v6)
    {
      v7 = (const void *)v6;
      Double = CFDictionaryGetDouble(v30, CFSTR("_gcDU"), 0);
      v24 = CFDictionaryGetDouble(v30, CFSTR("_gcDD"), 0);
      v23 = CFDictionaryGetDouble(v30, CFSTR("_gcDL"), 0);
      v22 = CFDictionaryGetDouble(v30, CFSTR("_gcDR"), 0);
      v29 = CFDictionaryGetDouble(v30, CFSTR("_gcLThx"), 0);
      v28 = CFDictionaryGetDouble(v30, CFSTR("_gcLThy"), 0);
      Int64Ranged = CFDictionaryGetInt64Ranged(v30, CFSTR("_gcLThB"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      v27 = CFDictionaryGetDouble(v30, CFSTR("_gcRThx"), 0);
      v26 = CFDictionaryGetDouble(v30, CFSTR("_gcRThy"), 0);
      v9 = CFDictionaryGetInt64Ranged(v30, CFSTR("_gcRThB"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      v10 = CFDictionaryGetDouble(v30, CFSTR("_gcBtA"), 0);
      v11 = CFDictionaryGetDouble(v30, CFSTR("_gcBtB"), 0);
      v12 = CFDictionaryGetDouble(v30, CFSTR("_gcBtX"), 0);
      v13 = CFDictionaryGetDouble(v30, CFSTR("_gcBtY"), 0);
      v14 = CFDictionaryGetDouble(v30, CFSTR("_gcL1"), 0);
      v15 = CFDictionaryGetDouble(v30, CFSTR("_gcL2"), 0);
      v16 = CFDictionaryGetDouble(v30, CFSTR("_gcR1"), 0);
      v17 = CFDictionaryGetDouble(v30, CFSTR("_gcR2"), 0);
      IOHIDEventSetDoubleValue(v7, 2293761, Double);
      IOHIDEventSetDoubleValue(v7, 2293762, v24);
      IOHIDEventSetDoubleValue(v7, 2293763, v23);
      IOHIDEventSetDoubleValue(v7, 2293764, v22);
      IOHIDEventSetDoubleValue(v7, 2293767, v12);
      IOHIDEventSetDoubleValue(v7, 2293768, v13);
      IOHIDEventSetDoubleValue(v7, 2293765, v10);
      IOHIDEventSetDoubleValue(v7, 2293766, v11);
      IOHIDEventSetDoubleValue(v7, 2293769, v14);
      IOHIDEventSetDoubleValue(v7, 2293771, v15);
      IOHIDEventSetIntegerValue(v7, 2293777, Int64Ranged);
      IOHIDEventSetDoubleValue(v7, 2293770, v16);
      IOHIDEventSetDoubleValue(v7, 2293772, v17);
      IOHIDEventSetIntegerValue(v7, 2293778, v9);
      IOHIDEventSetDoubleValue(v7, 2293773, v29);
      IOHIDEventSetDoubleValue(v7, 2293774, v28);
      IOHIDEventSetDoubleValue(v7, 2293775, v27);
      IOHIDEventSetDoubleValue(v7, 2293776, v26);
      IOHIDEventSetIntegerValue(v7, 2293760, 0);
      IOHIDEventSetSenderID(v7, self->_hidGCSenderID);
      IOHIDEventSystemClientDispatchEvent(self->_hidGCClient, v7);
      CFRelease(v7);
      v18 = CFDictionaryGetInt64Ranged(v30, CFSTR("_gcBtHome"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      v19 = CFDictionaryGetInt64Ranged(v30, CFSTR("_gcBtMenu"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      v20 = CFDictionaryGetInt64Ranged(v30, CFSTR("_gcBtOptions"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      if ((v18 & 0xFFFFFF00) != 0)
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:](self, "_handleGameControllerAuxEvent:pressed:", 547, v18 & 1);
      if ((v19 & 0xFFFFFF00) != 0)
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:](self, "_handleGameControllerAuxEvent:pressed:", 516, v19 & 1);
      if ((v20 & 0xFFFFFF00) != 0)
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:](self, "_handleGameControllerAuxEvent:pressed:", 521, v20 & 1);
      goto LABEL_11;
    }
    v21 = 4294960568;
  }
  else
  {
LABEL_12:
    v21 = 4294960551;
  }
LABEL_15:
  if (dword_100130940 <= 60 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 60)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleGameControllerEvent:]", 60, "### Inject Game Controller event failed: %#m\n", v21);
LABEL_11:

}

- (BOOL)_setupHIDGCDeviceWithOptions:(id)a3 andReturnError:(id *)a4
{
  BOOL v4;
  id v7;
  id v8;
  id v9;
  void *v10;
  __IOHIDUserDevice *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __IOHIDUserDevice *v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];

  if (self->_hidGCDevice)
    return 1;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v30 = xmmword_10010A57D;
  v31[0] = unk_10010A58D;
  *(_OWORD *)((char *)v31 + 9) = unk_10010A596;
  v26 = xmmword_10010A53D;
  v27 = unk_10010A54D;
  v28 = xmmword_10010A55D;
  v29 = unk_10010A56D;
  v24 = xmmword_10010A51D;
  v25 = unk_10010A52D;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v24, 137);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ReportDescriptor"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10011AB30, CFSTR("VendorID"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10011AB48, CFSTR("ProductID"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Rapport"), CFSTR("Transport"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("DisplayIntegrated"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Authenticated"));
  v9 = objc_alloc_init((Class)NSUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("PhysicalDeviceUniqueID"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Generic Extended Controller"), CFSTR("Product"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10011AB60, CFSTR("DeviceUsagePage"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10011AB78, CFSTR("DeviceUsage"));
  v11 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate(0, v7);
  self->_hidGCDevice = v11;
  v4 = v11 != 0;
  if (v11)
  {
    v19 = v11;
    v20 = CUMainQueue(v11, v12, v13, v14, v15, v16, v17, v18, v24, *((_QWORD *)&v24 + 1), v25, *((_QWORD *)&v25 + 1), v26, *((_QWORD *)&v26 + 1), v27, *((_QWORD *)&v27 + 1), v28, *((_QWORD *)&v28 + 1));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    IOHIDUserDeviceSetDispatchQueue(v19, v21);

    IOHIDUserDeviceActivate(self->_hidGCDevice);
  }
  else if (a4)
  {
    v23 = RPErrorF(4294960596, (uint64_t)"IOHIDUserDeviceCreate failed", v13, v14, v15, v16, v17, v18, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v23);
  }

  return v4;
}

- (void)_setupHIDGCSenderIDIfNeeded
{
  __IOHIDUserDevice *hidGCDevice;
  io_registry_entry_t v4;
  io_object_t v5;
  uint64_t ChildEntry;
  uint64_t v7;
  uint64_t RegistryEntryID;
  io_registry_entry_t entry;
  io_registry_entry_t child;

  if (!self->_hidGCSenderIDInitialized)
  {
    hidGCDevice = self->_hidGCDevice;
    if (hidGCDevice)
    {
      self->_hidGCSenderID = 0;
      v4 = IOHIDUserDeviceCopyService(hidGCDevice, a2);
      if (v4)
      {
        v5 = v4;
        child = 0;
        ChildEntry = IORegistryEntryGetChildEntry(v4, "IOService", &child);
        IOObjectRelease(v5);
        if ((_DWORD)ChildEntry)
        {
          if (dword_100130940 <= 90
            && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
          {
            LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]", 90, "### Get HID child 1 failed: %#m\n", ChildEntry);
          }
        }
        else
        {
          entry = 0;
          v7 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
          IOObjectRelease(child);
          if ((_DWORD)v7)
          {
            if (dword_100130940 <= 90
              && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
            {
              LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]", 90, "### Get HID child 2 failed: %#m\n", v7);
            }
          }
          else
          {
            RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, &self->_hidGCSenderID);
            self->_hidGCSenderIDInitialized = 1;
            IOObjectRelease(entry);
            if ((_DWORD)RegistryEntryID
              && dword_100130940 <= 90
              && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
            {
              LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]", 90, "### Get HID GC sender ID failed: %#m\n", RegistryEntryID);
            }
          }
        }
      }
      else if (dword_100130940 <= 90
             && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
      {
        LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]", 90, "### IOHIDUserDeviceCopyService failed\n");
      }
    }
  }
}

- (void)_handleTouchStart:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _UNKNOWN **v12;

  v6 = a3;
  v7 = a4;
  if (dword_100130940 <= 30 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchStart:responseHandler:]", 30, "Touch start: %##@\n", v6);
  v10 = 0;
  -[RPHIDDaemon _setupHIDTouchDeviceAndReturnError:](self, "_setupHIDTouchDeviceAndReturnError:", &v10);
  v8 = v10;
  if (v8)
  {
    if (dword_100130940 <= 90
      && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
    {
      LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchStart:responseHandler:]", 90, "### Touch start failed: %{error}\n", v8);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    v11 = CFSTR("_i");
    v12 = &off_10011AB60;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, 0, 0);

  }
}

- (void)_handleTouchStop:(id)a3 responseHandler:(id)a4
{
  id v6;
  NSMutableDictionary *activeTouchEventMap;
  __IOHIDUserDevice *hidTouchDevice;
  id v9;

  v9 = a3;
  v6 = a4;
  if (dword_100130940 <= 30 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchStop:responseHandler:]", 30, "Touch stop: %##@\n", v9);
  activeTouchEventMap = self->_activeTouchEventMap;
  self->_activeTouchEventMap = 0;

  self->_lastEventTicks = 0;
  self->_epochNanos = 0;
  self->_epochTicks = 0;
  hidTouchDevice = self->_hidTouchDevice;
  if (hidTouchDevice)
  {
    CFRelease(hidTouchDevice);
    self->_hidTouchDevice = 0;
  }
  self->_hidSenderID = 0;
  self->_hidSenderIDInitialized = 0;
  (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);

}

- (void)_handleTouchEvent:(id)a3
{
  id v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  uint64_t v7;
  uint64_t NSNumber;
  uint64_t v9;
  void *v10;
  _UNKNOWN **v11;
  unint64_t Int64;
  NSMutableDictionary *v13;
  NSMutableDictionary *activeTouchEventMap;
  id v15;
  unint64_t epochTicks;
  uint64_t v17;
  NSMutableDictionary *v18;
  int v19;
  const uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  const uint8_t *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  unsigned int v32;
  __int16 v33;
  __int16 v34;
  int Int64Ranged;
  int v36;
  id v37;

  v4 = a3;
  if (self->_hidTouchDevice)
    goto LABEL_8;
  if (dword_100130940 <= 30 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 30)))
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchEvent:]", 30, "Touch re-start");
  v37 = 0;
  -[RPHIDDaemon _setupHIDTouchDeviceAndReturnError:](self, "_setupHIDTouchDeviceAndReturnError:", &v37);
  v5 = (_UNKNOWN **)v37;
  v6 = v5;
  if (self->_hidTouchDevice)
  {

LABEL_8:
    v7 = mach_absolute_time();
    if (dword_100130940 <= 9 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 9)))
      LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchEvent:]", 9, "Touch event: %##@\n", v4);
    v36 = 0;
    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("_tFg"), 0);
    v9 = objc_claimAutoreleasedReturnValue(NSNumber);
    v10 = (void *)v9;
    v11 = &off_10011AB90;
    if (v9)
      v11 = (_UNKNOWN **)v9;
    v6 = v11;

    v32 = objc_msgSend(v6, "intValue");
    Int64Ranged = CFDictionaryGetInt64Ranged(v4, CFSTR("_tPh"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
    v33 = CFDictionaryGetInt64Ranged(v4, CFSTR("_cx"), 0, 0xFFFFLL, 0);
    v34 = CFDictionaryGetInt64Ranged(v4, CFSTR("_cy"), 0, 0xFFFFLL, 0);
    Int64 = CFDictionaryGetInt64(v4, CFSTR("_ns"), 0);
    if (!self->_activeTouchEventMap)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      activeTouchEventMap = self->_activeTouchEventMap;
      self->_activeTouchEventMap = v13;

    }
    v15 = objc_msgSend(objc_alloc((Class)NSValue), "initWithBytes:objCType:", &v32, "{?=iSSiB}");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeTouchEventMap, "setObject:forKeyedSubscript:", v15, v6);

    if (v7 - self->_lastEventTicks >= self->_epochResetTicks)
    {
      self->_epochNanos = Int64;
      self->_epochTicks = v7;
      v17 = v7;
    }
    else
    {
      epochTicks = self->_epochTicks;
      v17 = NanosecondsToUpTicks(Int64 - self->_epochNanos) + epochTicks;
    }
    self->_lastEventTicks = v7;
    v27 = 0;
    v28 = (const uint8_t *)&v27;
    v29 = 0x3010000000;
    v30 = &unk_1000F040E;
    v31[0] = 0;
    *(_QWORD *)((char *)v31 + 5) = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v18 = self->_activeTouchEventMap;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004F810;
    v24[3] = &unk_100112B08;
    v24[4] = &v27;
    v24[5] = v25;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v24);
    v19 = Int64Ranged;
    v20 = v28;
    *((_BYTE *)v28 + 44) = Int64Ranged == 5;
    if ((v19 - 1) >= 3)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeTouchEventMap, "setObject:forKeyedSubscript:", 0, v6);
      v20 = v28;
    }
    v21 = IOHIDUserDeviceHandleReportWithTimeStamp(self->_hidTouchDevice, v17, v20 + 32, 13);
    if ((_DWORD)v21
      && dword_100130940 <= 90
      && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
    {
      LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchEvent:]", 90, "### Touch event report failed: %#m\n", v21);
    }
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
    goto LABEL_27;
  }
  if (dword_100130940 <= 90 && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
  {
    v22 = CUPrintNSError(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    LogPrintF(&dword_100130940, "-[RPHIDDaemon _handleTouchEvent:]", 90, "### Re-start touch device failed: %@", v23);

  }
LABEL_27:

}

- (void)_handleSelectWithButtonState:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  RPHIDDaemon *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v5 = mach_absolute_time();
  v6 = UpTicksToMilliseconds(v5);
  if (v3 < 2)
  {
    v7 = mach_absolute_time();
    self->_lastSelectButtonDown = UpTicksToMilliseconds(v7);
LABEL_4:
    -[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:](self, "_injectKeyboardEventUsagePage:usageCode:buttonState:", 12, 128, v3);
    return;
  }
  if (v6 - self->_lastSelectButtonDown > 0x14)
    goto LABEL_4;
  v8 = dispatch_time(0, 20000000);
  v16 = CUMainQueue(v8, v9, v10, v11, v12, v13, v14, v15, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10004F9A0;
  v21 = &unk_100111838;
  v22 = self;
  LODWORD(v23) = v3;
  dispatch_after(v8, v17, &v18);

}

- (BOOL)_setupHIDTouchDeviceAndReturnError:(id *)a3
{
  BOOL v3;
  id v6;
  id v7;
  __IOHIDUserDevice *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  _OWORD v17[2];
  _BYTE v18[32];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;

  if (self->_hidTouchDevice)
    return 1;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10011ABA8, CFSTR("VendorID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10011ABC0, CFSTR("ProductID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("DisplayIntegrated"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Rapport"), CFSTR("Transport"));
  *(_OWORD *)v18 = xmmword_10010A5C6;
  *(_OWORD *)&v18[16] = unk_10010A5D6;
  v21 = xmmword_10010A606;
  v22 = unk_10010A616;
  v23 = xmmword_10010A626;
  v19 = xmmword_10010A5E6;
  v20 = unk_10010A5F6;
  v17[0] = xmmword_10010A5A6;
  v17[1] = unk_10010A5B6;
  v24 = -1073638137;
  *(_WORD *)&v18[15] = 1000;
  HIWORD(v21) = 1000;
  *(_WORD *)&v18[28] = 1000;
  *(_WORD *)((char *)&v22 + 11) = 1000;
  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v17, 148);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ReportDescriptor"));

  v8 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate(0, v6);
  self->_hidTouchDevice = v8;
  v3 = v8 != 0;
  if (!v8 && a3)
  {
    v16 = RPErrorF(4294960596, (uint64_t)"IOHIDUserDeviceCreate failed", v9, v10, v11, v12, v13, v14, *(uint64_t *)&v17[0]);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  return v3;
}

- (void)_setupHIDSenderIDIfNeeded
{
  __IOHIDUserDevice *hidTouchDevice;
  unint64_t *p_hidSenderID;
  io_registry_entry_t v5;
  io_object_t v6;
  uint64_t ChildEntry;
  uint64_t v8;
  uint64_t RegistryEntryID;
  io_registry_entry_t entry;
  io_registry_entry_t child;

  if (!self->_hidSenderIDInitialized)
  {
    hidTouchDevice = self->_hidTouchDevice;
    if (hidTouchDevice)
    {
      self->_hidSenderID = 0;
      p_hidSenderID = &self->_hidSenderID;
      *((_BYTE *)p_hidSenderID + 8) = 1;
      v5 = IOHIDUserDeviceCopyService(hidTouchDevice, a2);
      if (v5)
      {
        v6 = v5;
        child = 0;
        ChildEntry = IORegistryEntryGetChildEntry(v5, "IOService", &child);
        IOObjectRelease(v6);
        if ((_DWORD)ChildEntry)
        {
          if (dword_100130940 <= 90
            && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
          {
            LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]", 90, "### Get HID child 1 failed: %#m\n", ChildEntry);
          }
        }
        else
        {
          entry = 0;
          v8 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
          IOObjectRelease(child);
          if ((_DWORD)v8)
          {
            if (dword_100130940 <= 90
              && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
            {
              LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]", 90, "### Get HID child 2 failed: %#m\n", v8);
            }
          }
          else
          {
            RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, p_hidSenderID);
            IOObjectRelease(entry);
            if ((_DWORD)RegistryEntryID
              && dword_100130940 <= 90
              && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
            {
              LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]", 90, "### Get HID touch sender ID failed: %#m\n", RegistryEntryID);
            }
          }
        }
      }
      else if (dword_100130940 <= 90
             && (dword_100130940 != -1 || _LogCategory_Initialize(&dword_100130940, 90)))
      {
        LogPrintF(&dword_100130940, "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]", 90, "### IOHIDUserDeviceCopyService failed\n");
      }
    }
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_activeTouchEventMap, 0);
}

@end
