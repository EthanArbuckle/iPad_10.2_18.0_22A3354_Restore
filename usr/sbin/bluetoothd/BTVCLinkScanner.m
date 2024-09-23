@implementation BTVCLinkScanner

- (BTVCLinkScanner)initWithType:(int64_t)a3
{
  BTVCLinkScanner *v4;
  BTVCLinkScanner *v5;
  BTVCLinkScanner *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BTVCLinkScanner;
  v4 = -[BTVCLinkScanner init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v5->_linktType = a3;
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  NSData *payloadFilterData;
  NSData *payloadFilterMask;
  id timeoutHandler;
  LogCategory *ucat;
  const char *v9;
  objc_super v10;

  if (self->_startRetrier)
  {
    v9 = "StartRetrier still active during dealloc";
LABEL_11:
    FatalErrorF(v9, a2);
    __break(1u);
    return;
  }
  if (self->_btvcBonjourLink)
  {
    v9 = "BTVCBonjourLink still active during dealloc";
    goto LABEL_11;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;

  }
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  payloadFilterData = self->_payloadFilterData;
  self->_payloadFilterData = 0;

  payloadFilterMask = self->_payloadFilterMask;
  self->_payloadFilterMask = 0;

  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BTVCLinkScanner;
  -[BTVCLinkScanner dealloc](&v10, "dealloc");
}

- (NSString)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSData *payloadFilterData;
  NSData *payloadFilterMask;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  if (self->_invalidateCalled)
  {
    v15 = 0;
    NSAppendPrintF(&v15, ", Invalidated");
    v3 = v15;
  }
  else
  {
    v3 = 0;
  }
  if (self->_activeScan)
  {
    v14 = v3;
    NSAppendPrintF(&v14, ", ActiveScan");
    v4 = v14;

    v3 = v4;
  }
  if (self->_needDups)
  {
    v13 = v3;
    NSAppendPrintF(&v13, ", NeedDups");
    v5 = v13;

    v3 = v5;
  }
  if (self->_scanCache)
  {
    v12 = v3;
    NSAppendPrintF(&v12, ", ScanCache");
    v6 = v12;

    v3 = v6;
  }
  payloadFilterData = self->_payloadFilterData;
  payloadFilterMask = self->_payloadFilterMask;
  if (!payloadFilterData)
  {
    if (!payloadFilterMask)
      return (NSString *)v3;
    payloadFilterData = (NSData *)&stru_100941758;
  }
  v11 = v3;
  if (!payloadFilterMask)
    payloadFilterMask = (NSData *)&stru_100941758;
  NSAppendPrintF(&v11, ", blob <%@>/<%@>", payloadFilterData, payloadFilterMask);
  v9 = v11;

  v3 = v9;
  return (NSString *)v3;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  BTVCLinkScanner *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF("Attempt to set dispatch queue after activate has been called", v5);
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)setPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
    sub_1006FCDD4((uint64_t)v6, (uint64_t)v7, v8);
  v9 = objc_msgSend(v6, "length");
  if (v9 == objc_msgSend(v7, "length"))
  {
    v10 = objc_msgSend(v6, "copy");
    v11 = objc_msgSend(v7, "copy");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1004FA778;
    v15[3] = &unk_100919488;
    v15[4] = self;
    v12 = v10;
    v16 = v12;
    v17 = v11;
    v13 = v11;
    -[BTVCLinkScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v15);

  }
  else
  {
    objc_msgSend(v6, "length");
    objc_msgSend(v7, "length");
    FatalErrorF("Mismatched data (%ld) vs mask (%ld) lengths", v14);
    __break(1u);
  }
}

- (void)setTimeout:(double)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004FA804;
  v3[3] = &unk_100918868;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[BTVCLinkScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  BTVCLinkScanner *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004FA900;
  v8[3] = &unk_100923D30;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateWithCompletion:(id)a3
{
  void *v3;
  void (**v5)(id, void *);
  NSObject *v6;
  int64_t linktType;
  objc_class *v8;
  BTVCBonjourLink *btvcBonjourLink;
  void *v10;
  char v11;
  NSObject *v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  BTVCLinkScanner *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;

  v5 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[BTVCLinkScanner _activateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Activate\n", buf, 0xCu);
  }
  if (self->_invalidateCalled)
  {
    v15 = 4294960572;
  }
  else if (self->_startRetrier)
  {
    v15 = 4294960575;
  }
  else
  {
    linktType = self->_linktType;
    if ((unint64_t)(linktType - 1) > 1)
    {
      v12 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_linktType;
        if (v13 > 2)
          v14 = "?";
        else
          v14 = off_1009346A0[v13];
        *(_DWORD *)buf = 134218242;
        v23 = (const char *)v13;
        v24 = 2080;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Activate with unsupported type: %ld (%s)\n", buf, 0x16u);
      }
      v15 = 4294960561;
    }
    else
    {
      self->_btvcBonjourLinkType = linktType != 1;
      if (self->_btvcBonjourLink
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](BTVCLinkClient, "btvcLinkClient")),
            v8 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addBTVCBonjourLinkDelegate:", self)),
            btvcBonjourLink = self->_btvcBonjourLink,
            self = (BTVCLinkScanner *)((char *)self + 136),
            self->super.isa = v8,
            btvcBonjourLink,
            v3,
            self->super.isa))
      {
        if (!v5)
          goto LABEL_24;
        v10 = 0;
        v11 = 1;
        goto LABEL_22;
      }
      v15 = 4294960567;
    }
  }
  v16 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Activate failed: %d\n", buf, 8u);
  }
  if (v5)
  {
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v15, 0, 0), NSLocalizedDescriptionKey);
    v18 = (BTVCLinkScanner *)objc_claimAutoreleasedReturnValue(v17);
    self = v18;
    v19 = CFSTR("?");
    if (v18)
      v19 = (const __CFString *)v18;
    v21 = v19;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v15, v3));
    v11 = 0;
LABEL_22:
    v5[2](v5, v10);
    if ((v11 & 1) == 0)
    {

    }
  }
LABEL_24:

}

- (void)scanEnable:(BOOL)a3
{
  BTVCLinkScanner *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  BOOL v7;

  v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004FACCC;
  v6[3] = &unk_1009189E0;
  v6[4] = v4;
  v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);

}

- (void)_scanEnable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CURetrier *startRetrier;
  CURetrier *v7;
  CURetrier *v8;
  CURetrier *v9;
  CURetrier *v10;
  BTVCBonjourLink *btvcBonjourLink;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BOOL4 v22;

  v3 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[BTVCLinkScanner _scanEnable:]";
    v21 = 1024;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s scanEnable: %d\n", buf, 0x12u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  startRetrier = self->_startRetrier;
  if (v3)
  {
    if (startRetrier)
    {
LABEL_7:
      -[CURetrier startDirect](startRetrier, "startDirect", v13, v14, v15, v16);
      goto LABEL_13;
    }
    v7 = (CURetrier *)objc_alloc_init((Class)CURetrier);
    v8 = self->_startRetrier;
    self->_startRetrier = v7;

    v9 = self->_startRetrier;
    if (v9)
    {
      -[CURetrier setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1004FAEF8;
      v16 = &unk_100920120;
      objc_copyWeak(&v17, &location);
      -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", &v13);
      objc_destroyWeak(&v17);
      startRetrier = self->_startRetrier;
      goto LABEL_7;
    }
    v12 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = -6729;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### scanEnable failed: %d\n", buf, 8u);
    }
  }
  else
  {
    if (startRetrier)
    {
      -[CURetrier invalidateDirect](startRetrier, "invalidateDirect");
      v10 = self->_startRetrier;
      self->_startRetrier = 0;

    }
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink)
      -[BTVCBonjourLink stopScanningForType:](btvcBonjourLink, "stopScanningForType:", 1);
    self->_scanStarted = 0;
  }
LABEL_13:
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004FB028;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CURetrier *startRetrier;
  CURetrier *v7;
  BTVCBonjourLink *btvcBonjourLink;
  void *v9;
  NSObject *v10;
  unint64_t linktType;
  const char *v12;
  void (**invalidationHandler)(void);
  id v14;
  id timeoutHandler;
  int v16;
  unint64_t v17;
  __int16 v18;
  const char *v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
      sub_1006FCE84();
    self->_invalidateCalled = 1;
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    startRetrier = self->_startRetrier;
    if (startRetrier)
    {
      -[CURetrier invalidateDirect](startRetrier, "invalidateDirect");
      v7 = self->_startRetrier;
      self->_startRetrier = 0;

    }
    if (self->_linktType == 2)
    {
      -[BTVCBonjourLink stopScanningForType:](self->_btvcBonjourLink, "stopScanningForType:", 1);
      btvcBonjourLink = self->_btvcBonjourLink;
      if (btvcBonjourLink)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](BTVCLinkClient, "btvcLinkClient"));
        objc_msgSend(v9, "removeBTVCBonjourLinkDelegate:", self);

        btvcBonjourLink = self->_btvcBonjourLink;
      }
      self->_btvcBonjourLink = 0;

    }
    else
    {
      v10 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        linktType = self->_linktType;
        if (linktType > 2)
          v12 = "?";
        else
          v12 = off_1009346A0[linktType];
        v16 = 134218242;
        v17 = linktType;
        v18 = 2080;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Invalidate unsupported type: %ld (%s)\n", (uint8_t *)&v16, 0x16u);
      }
    }
    self->_scanStarted = 0;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
      sub_1006FCE58();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v14 = self->_invalidationHandler;
    }
    else
    {
      v14 = 0;
    }
    self->_invalidationHandler = 0;

    timeoutHandler = self->_timeoutHandler;
    self->_timeoutHandler = 0;

  }
}

- (void)performUpdate:(id)a3
{
  NSObject *dispatchQueue;
  void (**v5)(_QWORD);
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004FB2FC;
  block[3] = &unk_1009172A0;
  block[4] = self;
  v5 = (void (**)(_QWORD))a3;
  dispatch_async(dispatchQueue, block);
  v5[2](v5);

  v6 = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004FB30C;
  v7[3] = &unk_1009172A0;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  BTVCLinkScanner *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004FB400;
    v7[3] = &unk_100919410;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

- (BOOL)_needActiveScan
{
  return 0;
}

- (void)_restartIfNeeded
{
  -[BTVCLinkScanner _restartIfNeeded:](self, "_restartIfNeeded:", 0);
}

- (void)_restartIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BTVCBonjourLink *btvcBonjourLink;
  unint64_t v7;
  _BOOL4 scanStarted;
  NSObject *v9;
  unint64_t linktType;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSData *v17;
  NSData *scanParamFilterData;
  NSData *v19;
  NSData *scanParamFilterMask;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;

  v3 = a3;
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[BTVCLinkScanner _restartIfNeeded:]";
    v27 = 1024;
    LODWORD(v28) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s inForce: %d\n", buf, 0x12u);
  }
  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    v9 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      linktType = self->_linktType;
      if (linktType > 2)
        v11 = "?";
      else
        v11 = off_1009346A0[linktType];
      *(_DWORD *)buf = 134218242;
      v26 = (const char *)linktType;
      v27 = 2080;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Restart unsupported type: %ld (%s)\n", buf, 0x16u);
    }
    v13 = qword_100999980;
    if (!os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = -6735;
    v14 = "Warning: [BTVCLinkScanner] ### RestartIfNeeded failed: %d\n";
    v15 = v13;
    v16 = 8;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  btvcBonjourLink = self->_btvcBonjourLink;
  if (!btvcBonjourLink)
    return;
  if (self->_scanCache && self->_scanStarted)
  {
    v23 = qword_100999980;
    if (!os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v14 = "[BTVCLinkScanner] Scan restart skipped while scan cache scanning\n";
    v15 = v23;
    v16 = 2;
    goto LABEL_20;
  }
  v7 = -[BTVCBonjourLink state](btvcBonjourLink, "state");
  if (v7 == 3)
  {
    if (v3)
    {
      scanStarted = self->_scanStarted;
    }
    else
    {
      if (self->_scanStarted)
      {
        v12 = qword_100999980;
        if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Scan restart skipped when unchanged\n", buf, 2u);
        }
        goto LABEL_29;
      }
      scanStarted = 0;
    }
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
      sub_1006FCEDC();
    if (scanStarted && v3)
    {
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
        sub_1006FCEB0();
      -[BTVCBonjourLink stopScanningForType:](self->_btvcBonjourLink, "stopScanningForType:", self->_btvcBonjourLinkType);
    }
    BYTE1(v24) = self->_scanCache;
    LOBYTE(v24) = self->_needDups;
    -[BTVCBonjourLink startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](self->_btvcBonjourLink, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", self->_btvcBonjourLinkType, self->_payloadFilterData, self->_payloadFilterMask, 0, 10, 0, v24, 0);
    v17 = (NSData *)-[NSData copy](self->_payloadFilterData, "copy");
    scanParamFilterData = self->_scanParamFilterData;
    self->_scanParamFilterData = v17;

    v19 = (NSData *)-[NSData copy](self->_payloadFilterMask, "copy");
    scanParamFilterMask = self->_scanParamFilterMask;
    self->_scanParamFilterMask = v19;

    self->_scanParamDups = self->_needDups;
    self->_scanParamCache = self->_scanCache;
LABEL_29:
    self->_scanStarted = 1;
    -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
    return;
  }
  v21 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 5)
      v22 = "?";
    else
      v22 = off_100934670[v7];
    *(_DWORD *)buf = 136315138;
    v26 = v22;
    v14 = "[BTVCLinkScanner] Scan start deferred while in Bluetooth state: %s\n";
    v15 = v21;
    v16 = 12;
    goto LABEL_20;
  }
}

- (void)_startTimeoutIfNeeded
{
  NSObject *v3;
  double timeout;
  OS_dispatch_source *v5;
  OS_dispatch_source *timeoutTimer;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  double v14;

  if (!self->_timeoutFired && self->_timeout > 0.0 && !self->_timeoutTimer)
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      timeout = self->_timeout;
      *(_DWORD *)buf = 134217984;
      v14 = timeout;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Start timeout timer for %f seconds\n", buf, 0xCu);
    }
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v5;

    v8 = self->_timeoutTimer;
    if (!v8)
      FatalErrorF("Create timeout timer failed", v7);
    v9 = (unint64_t)(self->_timeout * 1000000000.0);
    v10 = dispatch_time(0, v9);
    dispatch_source_set_timer(v8, v10, v9, v9 >> 2);
    v11 = self->_timeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004FB964;
    handler[3] = &unk_1009172A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)_timeoutTimerFired
{
  NSObject *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  void (**timeoutHandler)(void);
  id v8;
  uint8_t v9[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Timeout timer fired\n", v9, 2u);
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    v8 = self->_timeoutHandler;
  }
  else
  {
    v8 = 0;
  }
  self->_timeoutHandler = 0;

}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  BTVCBonjourLink *v4;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  int v10;
  const char *v11;

  v4 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink)
    v6 = btvcBonjourLink == v4;
  else
    v6 = 0;
  if (v6)
  {
    v7 = -[BTVCBonjourLink state](v4, "state");
    v8 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_INFO))
    {
      if (v7 > 5)
        v9 = "?";
      else
        v9 = off_1009346B8[v7];
      v10 = 136315138;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[BTVCLinkScanner] Bluetooth state updated: %s\n", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  BTVCBonjourLink *v6;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink)
    v8 = btvcBonjourLink == v6;
  else
    v8 = 0;
  if (v8 && self->_btvcBonjourLinkType == a4)
  {
    v9 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Bluetooth scanning started\n", v10, 2u);
    }
    if (self->_scanState != 1)
      self->_scanState = 1;
    -[BTVCLinkScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
  }

}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  BTVCBonjourLink *v8;
  id v9;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v11;
  NSObject *v12;
  int v13;
  id v14;

  v8 = (BTVCBonjourLink *)a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink)
    v11 = btvcBonjourLink == v8;
  else
    v11 = 0;
  if (v11 && self->_btvcBonjourLinkType == a4)
  {
    v12 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Bluetooth scan failed: %@\n", (uint8_t *)&v13, 0xCu);
    }
    self->_scanStarted = 0;
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect");
  }

}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  BTVCBonjourLink *v12;
  id v13;
  id v14;
  id v15;
  BTVCBonjourLink *btvcBonjourLink;
  NSObject *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _DWORD v23[2];
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v12 = (BTVCBonjourLink *)a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v12 && self->_btvcBonjourLinkType == a4)
  {
    v17 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109890;
      v23[1] = a4;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] DiscoverType %d, data:%@ peer:%@ peerInfo:%@\n", (uint8_t *)v23, 0x26u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCLinkScanner advReportReceiveHandler](self, "advReportReceiveHandler"));
    v19 = v18 == 0;

    if (!v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[BTVCLinkScanner advReportReceiveHandler](self, "advReportReceiveHandler"));
      v21 = (void *)v20;
      if (a4 == 1)
        v22 = 2;
      else
        v22 = 1;
      (*(void (**)(uint64_t, uint64_t, id, id, id))(v20 + 16))(v20, v22, v13, v14, v15);

    }
  }

}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  int v5;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;

  v5 = a5;
  v7 = a4;
  v8 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Lose peer device:%@, link type:%d\n", (uint8_t *)&v9, 0x12u);
  }
  -[BTVCLinkScanner _restartIfNeeded:](self, "_restartIfNeeded:", 1);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSData)payloadFilterData
{
  return self->_payloadFilterData;
}

- (NSData)payloadFilterMask
{
  return self->_payloadFilterMask;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (int64_t)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(int64_t)a3
{
  self->_scanInterval = a3;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (int64_t)scanWindow
{
  return self->_scanWindow;
}

- (void)setScanWindow:(int64_t)a3
{
  self->_scanWindow = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSSet)trackedPeers
{
  return self->_trackedPeers;
}

- (void)setTrackedPeers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPeers, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_payloadFilterMask, 0);
  objc_storeStrong((id *)&self->_payloadFilterData, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_advReportReceiveHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_scanParamPeers, 0);
  objc_storeStrong((id *)&self->_scanParamFilterMask, 0);
  objc_storeStrong((id *)&self->_scanParamFilterData, 0);
  objc_storeStrong((id *)&self->_trackedPeersApplied, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
}

@end
