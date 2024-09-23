@implementation BTVCLinkAdvertiser

- (BTVCLinkAdvertiser)initWithType:(int64_t)a3
{
  BTVCLinkAdvertiser *v4;
  BTVCLinkAdvertiser *v5;
  BTVCLinkAdvertiser *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BTVCLinkAdvertiser;
  v4 = -[BTVCLinkAdvertiser init](&v8, "init");
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
  id advertiseStateChangedHandler;
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  NSArray *payloadDataCurrent;
  NSArray *payloadDataPrevious;
  NSArray *payloadFields;
  NSString *payloadIdentifier;
  objc_super v10;

  if (self->_startRetrier)
  {
    FatalErrorF("StartRetrier still active during dealloc", a2);
    __break(1u);
  }
  else
  {
    advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
    self->_advertiseStateChangedHandler = 0;

    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    payloadDataCurrent = self->_payloadDataCurrent;
    self->_payloadDataCurrent = 0;

    payloadDataPrevious = self->_payloadDataPrevious;
    self->_payloadDataPrevious = 0;

    payloadFields = self->_payloadFields;
    self->_payloadFields = 0;

    payloadIdentifier = self->_payloadIdentifier;
    self->_payloadIdentifier = 0;

    v10.receiver = self;
    v10.super_class = (Class)BTVCLinkAdvertiser;
    -[BTVCLinkAdvertiser dealloc](&v10, "dealloc");
  }
}

- (NSString)description
{
  unint64_t linktType;
  const char *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t advertiseState;
  const char *v9;
  id v10;
  id v12;
  id v13;
  id v14;

  v14 = 0;
  linktType = self->_linktType;
  if (linktType > 2)
    v4 = "?";
  else
    v4 = off_100923D70[linktType];
  NSAppendPrintF(&v14, "BTVCLinkAdvertiser, Type %s", v4);
  v5 = v14;
  v6 = v5;
  if (self->_invalidateCalled)
  {
    v13 = v5;
    NSAppendPrintF(&v13, ", Invalidated");
    v7 = v13;

    v6 = v7;
  }
  v12 = v6;
  advertiseState = self->_advertiseState;
  if (advertiseState > 3)
    v9 = "?";
  else
    v9 = off_100923D50[advertiseState];
  NSAppendPrintF(&v12, ", State %s", v9);
  v10 = v12;

  return (NSString *)v10;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  BTVCLinkAdvertiser *obj;

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

- (void)setPayloadData:(id)a3
{
  id v4;
  id v5;
  BTVCLinkAdvertiser *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  NSObject *dispatchQueue;
  _QWORD v11[5];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002D0420;
  v13[3] = &unk_100918340;
  v13[4] = v6;
  v7 = v5;
  v14 = v7;
  v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002D0464;
    v11[3] = &unk_100919410;
    v11[4] = v6;
    v12 = v8;
    dispatch_async(dispatchQueue, v11);

  }
  else
  {
    ((void (*)(_QWORD *))v8[2])(v8);
  }

  objc_sync_exit(v6);
}

- (void)setPayloadFields:(id)a3
{
  id v4;
  id v5;
  BTVCLinkAdvertiser *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  NSObject *dispatchQueue;
  _QWORD v11[5];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002D05F0;
  v13[3] = &unk_100918340;
  v13[4] = v6;
  v7 = v5;
  v14 = v7;
  v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002D0634;
    v11[3] = &unk_100919410;
    v11[4] = v6;
    v12 = v8;
    dispatch_async(dispatchQueue, v11);

  }
  else
  {
    ((void (*)(_QWORD *))v8[2])(v8);
  }

  objc_sync_exit(v6);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  BTVCLinkAdvertiser *v5;
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
  v8[2] = sub_1002D0720;
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
  unint64_t linktType;
  const char *v8;
  int64_t v9;
  objc_class *v10;
  BTVCBonjourLink *btvcBonjourLink;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  BTVCLinkAdvertiser *v17;
  const __CFString *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  const char *v26;

  v5 = (void (**)(id, void *))a3;
  v6 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    linktType = self->_linktType;
    if (linktType > 2)
      v8 = "?";
    else
      v8 = off_100923D70[linktType];
    *(_DWORD *)buf = 136315650;
    v22 = "-[BTVCLinkAdvertiser _activateWithCompletion:]";
    v23 = 2048;
    v24 = linktType;
    v25 = 2080;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %ld (%s)\n", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    v14 = 4294960572;
  }
  else if (self->_startRetrier)
  {
    v14 = 4294960575;
  }
  else
  {
    v9 = self->_linktType;
    if ((unint64_t)(v9 - 1) > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
        sub_1006DC45C();
      v14 = 4294960561;
    }
    else
    {
      self->_btvcBonjourLinkType = v9 != 1;
      if (self->_btvcBonjourLink
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](BTVCLinkClient, "btvcLinkClient")),
            v10 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addBTVCBonjourLinkDelegate:", self)),
            btvcBonjourLink = self->_btvcBonjourLink,
            self = (BTVCLinkAdvertiser *)((char *)self + 80),
            self->super.isa = v10,
            btvcBonjourLink,
            v3,
            self->super.isa))
      {
        if (!v5)
          goto LABEL_24;
        v12 = 0;
        v13 = 1;
        goto LABEL_22;
      }
      v14 = 4294960567;
    }
  }
  v15 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### Activate failed: %d\n", buf, 8u);
  }
  if (v5)
  {
    v19 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v14, 0, 0));
    v17 = (BTVCLinkAdvertiser *)objc_claimAutoreleasedReturnValue(v16);
    self = v17;
    v18 = CFSTR("?");
    if (v17)
      v18 = (const __CFString *)v17;
    v20 = v18;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v14, v3));
    v13 = 0;
LABEL_22:
    v5[2](v5, v12);
    if ((v13 & 1) == 0)
    {

    }
  }
LABEL_24:

}

- (void)advertisingEnable:(BOOL)a3
{
  BTVCLinkAdvertiser *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  BOOL v7;

  v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002D0AC8;
  v6[3] = &unk_1009189E0;
  v6[4] = v4;
  v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);

}

- (void)_advertisingEnable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 advertisingEnabled;
  CURetrier *v7;
  CURetrier *startRetrier;
  CURetrier *v9;
  CURetrier *v10;
  uint64_t v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  _BOOL4 v25;

  v3 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    advertisingEnabled = self->_advertisingEnabled;
    *(_DWORD *)buf = 67109376;
    v23 = advertisingEnabled;
    v24 = 1024;
    v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] _advertisingEnabled:%d inEnable: %d\n", buf, 0xEu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_advertisingEnabled != v3)
  {
    self->_advertisingEnabled = v3;
    if (v3)
    {
      if (self->_payloadFields)
      {
        v7 = (CURetrier *)objc_alloc_init((Class)CURetrier);
        startRetrier = self->_startRetrier;
        self->_startRetrier = v7;

        v9 = self->_startRetrier;
        if (!v9)
        {
          v15 = qword_100999980;
          if (!os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
          *(_DWORD *)buf = 67109120;
          v23 = -6729;
          v13 = "Warning: [BTVCLinkAdvertiser] ### scanEnable failed: %d\n";
          v14 = v15;
          goto LABEL_11;
        }
        -[CURetrier setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
        v16 = _NSConcreteStackBlock;
        v17 = 3221225472;
        v18 = sub_1002D0D38;
        v19 = &unk_100920120;
        objc_copyWeak(&v20, &location);
        -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", &v16);
        objc_destroyWeak(&v20);
        -[CURetrier startDirect](self->_startRetrier, "startDirect", v16, v17, v18, v19);
      }
    }
    else
    {
      -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
      v10 = self->_startRetrier;
      self->_startRetrier = 0;

      -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 1);
    }
    v11 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_advertisingEnabled;
      *(_DWORD *)buf = 67109120;
      v23 = v12;
      v13 = "[BTVCLinkAdvertiser] complete _advertisingEnabled:%d\n";
      v14 = v11;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, 8u);
    }
  }
LABEL_12:
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D0E68;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CURetrier *startRetrier;
  int64_t linktType;
  BTVCBonjourLink *btvcBonjourLink;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**invalidationHandler)(void);
  id advertiseStateChangedHandler;
  id v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    return;
  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
    sub_1006DC584(v3, v4, v5, v6, v7, v8, v9, v10);
  self->_invalidateCalled = 1;
  -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  linktType = self->_linktType;
  if (linktType == 2)
  {
    -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 1);
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink)
    {
LABEL_9:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](BTVCLinkClient, "btvcLinkClient"));
      objc_msgSend(v14, "removeBTVCBonjourLinkDelegate:", self);

      btvcBonjourLink = self->_btvcBonjourLink;
    }
  }
  else
  {
    if (linktType != 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
        sub_1006DC508();
      goto LABEL_13;
    }
    -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 0);
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink)
      goto LABEL_9;
  }
  self->_btvcBonjourLink = 0;

LABEL_13:
  v15 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
    sub_1006DC4D8(v15, v16, v17, v18, v19, v20, v21, v22);
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_advertiseStateChangedHandler = 0;

  v25 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

}

- (void)_restartIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  BTVCBonjourLink *btvcBonjourLink;
  unsigned int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSArray *payloadDataCurrent;
  NSObject *v12;
  int v13;
  NSArray *v14;
  __int16 v15;
  const char *v16;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
    sub_1006DC630(v3, v5);
  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006DC5B4();
    v8 = -6735;
  }
  else
  {
    btvcBonjourLink = self->_btvcBonjourLink;
    if (!btvcBonjourLink || (id)-[BTVCBonjourLink state](btvcBonjourLink, "state") != (id)3)
      return;
    v7 = -[BTVCLinkAdvertiser _preparePayload:](self, "_preparePayload:", v3);
    v8 = v7;
    if (v7 == -6757)
    {
LABEL_14:
      -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
      return;
    }
    if (!v7)
    {
      if (self->_payloadDataCurrent)
      {
        v9 = qword_100999980;
        if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
        {
          v10 = "no";
          payloadDataCurrent = self->_payloadDataCurrent;
          if (v3)
            v10 = "yes";
          v13 = 138412546;
          v14 = payloadDataCurrent;
          v15 = 2080;
          v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Advertise update: data '%@', force %s\n", (uint8_t *)&v13, 0x16u);
        }
        -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", self->_btvcBonjourLinkType);
        -[BTVCBonjourLink startAdvertisingOfType:withData:](self->_btvcBonjourLink, "startAdvertisingOfType:withData:", self->_btvcBonjourLinkType, self->_payloadDataCurrent);
        goto LABEL_14;
      }
      v8 = -6745;
    }
  }
  v12 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    LODWORD(v14) = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### RestartIfNeeded failed: %d\n", (uint8_t *)&v13, 8u);
  }
}

- (int)_preparePayload:(BOOL)a3
{
  NSArray **p_payloadDataCurrent;
  int64_t linktType;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v17[16];

  p_payloadDataCurrent = &self->_payloadDataCurrent;
  if (!self->_payloadDataCurrent)
  {
    linktType = self->_linktType;
    if (linktType == 2 || linktType == 1)
    {
      objc_storeStrong((id *)&self->_payloadDataCurrent, self->_payloadFields);
    }
    else
    {
      v7 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### Skipping unsupported payload type\n", v17, 2u);
      }
    }
  }
  if (!a3
    && self->_payloadDataPrevious
    && (-[NSArray isEqual:](*p_payloadDataCurrent, "isEqual:") & 1) != 0)
  {
    v8 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEBUG))
      sub_1006DC6B8(v8, v9, v10, v11, v12, v13, v14, v15);
    return -6757;
  }
  else
  {
    objc_storeStrong((id *)&self->_payloadDataPrevious, self->_payloadDataCurrent);
    return 0;
  }
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
        v9 = off_100923D88[v7];
      v10 = 136315138;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[BTVCLinkAdvertiser] Bluetooth state updated: %s\n", (uint8_t *)&v10, 0xCu);
    }
    if (v7 == 3)
      -[BTVCLinkAdvertiser _restartIfNeeded:](self, "_restartIfNeeded:", 1);
  }

}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  BTVCBonjourLink *v6;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v8;
  int64_t advertiseState;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  void (**advertiseStateChangedHandler)(id, uint64_t);
  __int16 v15;
  __int16 v16;

  v6 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink)
    v8 = btvcBonjourLink == v6;
  else
    v8 = 0;
  if (!v8 || self->_btvcBonjourLinkType != a4)
    goto LABEL_16;
  advertiseState = self->_advertiseState;
  v10 = qword_100999980;
  v11 = os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT);
  if (advertiseState == 2)
  {
    if (v11)
    {
      v16 = 0;
      v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started after being deferred\n";
      v13 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    v15 = 0;
    v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started\n";
    v13 = (uint8_t *)&v15;
    goto LABEL_12;
  }
  if (self->_advertiseState != 1)
  {
    self->_advertiseState = 1;
    advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 1);
  }
LABEL_16:

}

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  BTVCBonjourLink *v8;
  id v9;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v11;
  NSObject *v12;
  void (**advertiseStateChangedHandler)(id, _QWORD);
  int v14;
  id v15;

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
      v14 = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Bluetooth advertising stopped: %@\n", (uint8_t *)&v14, 0xCu);
    }
    if (self->_advertiseState)
    {
      self->_advertiseState = 0;
      advertiseStateChangedHandler = (void (**)(id, _QWORD))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler)
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 0);
    }
  }

}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  BTVCBonjourLink *v6;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v8;
  NSObject *v9;
  void (**advertiseStateChangedHandler)(id, uint64_t);
  uint8_t v11[16];

  v6 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink)
    v8 = btvcBonjourLink == v6;
  else
    v8 = 0;
  if (v8 && self->_btvcBonjourLinkType == a4 && self->_advertiseState != 2)
  {
    v9 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Bluetooth advertising deferred\n", v11, 2u);
    }
    self->_advertiseState = 2;
    advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 2);
  }

}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  BTVCBonjourLink *v8;
  id v9;
  BTVCBonjourLink *btvcBonjourLink;
  BOOL v11;
  NSObject *v12;
  void (**advertiseStateChangedHandler)(id, uint64_t);
  int v14;
  id v15;

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
      v14 = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] ### Bluetooth advertise failed: %@\n", (uint8_t *)&v14, 0xCu);
    }
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect");
    if (self->_advertiseState != 3)
    {
      self->_advertiseState = 3;
      advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler)
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 3);
    }
  }

}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 error:(id)a5
{
  BTVCBonjourLink *v8;
  id v9;
  id v10;
  BTVCBonjourLink *btvcBonjourLink;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = (BTVCBonjourLink *)a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v8)
  {
    v12 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] DidConnectToPeer: %@, %@\n", (uint8_t *)&v14, 0x16u);
    }
    if (v10)
    {
      v13 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] ### Accept connection from peer %@ failed: %@\n", (uint8_t *)&v14, 0x16u);
      }
    }
  }

}

- (id)advertiseStateChangedHandler
{
  return self->_advertiseStateChangedHandler;
}

- (void)setAdvertiseStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_advertiseStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadFields, 0);
  objc_storeStrong((id *)&self->_payloadDataPrevious, 0);
  objc_storeStrong((id *)&self->_payloadDataCurrent, 0);
}

@end
