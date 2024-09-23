@implementation BTVCLinkAgent

+ (BTVCLinkAgent)sharedBTVCLinkAgent
{
  if (qword_100992B68 != -1)
    dispatch_once(&qword_100992B68, &stru_10092CA40);
  return (BTVCLinkAgent *)(id)qword_1009994B8;
}

- (BTVCLinkAgent)init
{
  BTVCLinkAgent *v2;
  BTVCLinkAgent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTVCLinkAgent;
  v2 = -[BTVCLinkAgent init](&v5, "init");
  if (v2)
  {
    if (qword_100992B78 != -1)
      dispatch_once(&qword_100992B78, &stru_10092CA60);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)qword_100992B70);
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  BTVCLinkAdvertiser *bleBTVCLinkAdvertiser;
  id v6;
  id v7;
  BTVCLinkScanner *bleBTVCLinkScanner;
  id v10;
  id v11;
  id v12;

  v12 = 0;
  NSAppendPrintF(&v12, "-- BTVCLinkAgent --\n");
  v3 = v12;
  v4 = v3;
  bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
  if (bleBTVCLinkAdvertiser)
  {
    v11 = v3;
    NSAppendPrintF(&v11, "BLE Advertiser:   %@\n", bleBTVCLinkAdvertiser);
    v6 = v11;

    v4 = v6;
  }
  if (self->_bleBTVCLinkScanner)
  {
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
    v10 = v4;
    NSAppendPrintF(&v10, "BLE Scanner:      %@\n", bleBTVCLinkScanner);
    v7 = v10;

    v4 = v7;
  }
  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CE014;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSObject *v3;
  int v4;
  NSMutableArray *v5;
  NSMutableArray *bleBTVCLinkAdvertiseSets;
  BTVCLinkAdvertiseSet *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *address;
  NSMutableDictionary *v10;
  NSMutableDictionary *parameters;
  NSMutableDictionary *v12;
  NSMutableDictionary *data;
  uint8_t v14[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Activate\n", v14, 2u);
  }
  self->_activated = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    v4 = 6;
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    self->_bleBTVCLinkAdvertiseSets = v5;

    do
    {
      v7 = objc_alloc_init(BTVCLinkAdvertiseSet);
      v7->enable = 0;
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      address = v7->address;
      v7->address = v8;

      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      parameters = v7->parameters;
      v7->parameters = v10;

      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      data = v7->data;
      v7->data = v12;

      -[NSMutableArray addObject:](self->_bleBTVCLinkAdvertiseSets, "addObject:", v7);
      --v4;
    }
    while (v4);
  }
  -[BTVCLinkAgent prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CE1C0;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSObject *v3;
  NSMutableArray *bleBTVCLinkAdvertiseSets;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Invalidate\n", v5, 2u);
  }
  -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStopped](self, "_bleBTVCLinkAdvertiserEnsureStopped");
  -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStopped](self, "_bleBTVCLinkScannerEnsureStopped");
  bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
  self->_bleBTVCLinkAdvertiseSets = 0;

  self->_activated = 0;
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[BTVCLinkAgent _update](self, "_update");
}

- (void)update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[BTVCLinkAgent _update](self, "_update");
}

- (void)_update
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;

  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[BTVCLinkAgent _update]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v12, 0xCu);
  }
  if (self->_activated)
  {
    if (-[BTVCLinkAgent _bleBTVCLinkAdvertiserShouldAdvertise](self, "_bleBTVCLinkAdvertiserShouldAdvertise"))
      -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStarted](self, "_bleBTVCLinkAdvertiserEnsureStarted");
    else
      -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStopped](self, "_bleBTVCLinkAdvertiserEnsureStopped");
    if (-[BTVCLinkAgent _bleBTVCLinkScannerShouldScan](self, "_bleBTVCLinkScannerShouldScan"))
      -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStarted](self, "_bleBTVCLinkScannerEnsureStarted");
    else
      -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStopped](self, "_bleBTVCLinkScannerEnsureStopped");
  }
  else
  {
    v4 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006EA4F4(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)reset
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;

  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[BTVCLinkAgent reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v12, 0xCu);
  }
  if (self->_activated)
  {
    if (-[BTVCLinkAgent _isAdvertisingEnabled](self, "_isAdvertisingEnabled"))
    {
      -[BTVCLinkAdvertiser advertisingEnable:](self->_bleBTVCLinkAdvertiser, "advertisingEnable:", 0);
      -[BTVCLinkAgent _resetAdvertisingEnable](self, "_resetAdvertisingEnable");
    }
    if (self->_bleBTVCLinkScanEnable)
      -[BTVCLinkScanner scanEnable:](self->_bleBTVCLinkScanner, "scanEnable:", 0);
  }
  else
  {
    v4 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006EA528(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (BOOL)isAdvertisingEnabled:(unsigned __int8)a3
{
  return -[BTVCLinkAgent _isAdvertisingEnabled:](self, "_isAdvertisingEnabled:", a3);
}

- (BOOL)_isAdvertisingEnabled:(unsigned __int8)a3
{
  BOOL v3;
  _BYTE *v4;

  if (self->_bleBTVCLinkAdvertiseSets)
    return 0;
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", a3));
  if (!v4)
    return 0;
  v3 = v4[8] != 0;

  return v3;
}

- (BOOL)_isAdvertisingEnabled
{
  int v3;
  _BYTE *v4;
  BOOL v5;

  if (self->_bleBTVCLinkAdvertiseSets)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v3));
    if (v4)
      break;
    if (++v3 == 6)
      return 0;
  }
  v5 = v4[8] != 0;

  return v5;
}

- (void)_resetAdvertisingEnable
{
  int i;
  _BYTE *v4;

  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    for (i = 0; i != 6; ++i)
    {
      v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", i));
      if (v4)
        v4[8] = 0;

    }
  }
}

- (BOOL)isScanningEnabled
{
  return self->_bleBTVCLinkScanEnable;
}

- (void)leSetAdvertisingSetRandomAddress:(unsigned __int8)a3 address:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetAdvertisingSetRandomAddress:address:]";
    v12 = 1024;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d address:%@", (uint8_t *)&v10, 0x1Cu);
  }
  v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(*(id *)(v8 + 16), "addEntriesFromDictionary:", v6);

}

- (void)leSetExtendedAdvertisingParameters:(unsigned __int8)a3 advertisingParameters:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingParameters:advertisingParameters:]";
    v12 = 1024;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d advertisingParameters:%@", (uint8_t *)&v10, 0x1Cu);
  }
  v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(*(id *)(v8 + 24), "addEntriesFromDictionary:", v6);

}

- (void)leSetExtendedAdvertisingData:(unsigned __int8)a3 advertisingData:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingData:advertisingData:]";
    v12 = 1024;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d advertisingData:%@", (uint8_t *)&v10, 0x1Cu);
  }
  v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(*(id *)(v8 + 32), "addEntriesFromDictionary:", v6);

}

- (void)leSetExtendedAdvertisingEnable:(BOOL)a3 numSets:(unsigned __int8)a4 advertisingHandles:(char *)a5
{
  uint64_t v6;
  _BOOL8 v7;
  NSObject *v9;
  _BYTE *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _BYTE *v20;
  id v21;
  int j;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[10];

  LODWORD(v6) = a4;
  v7 = a3;
  v9 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315650;
    v28 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
    v29 = 1024;
    *(_DWORD *)v30 = v7;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, enable:%d, numSets:%d", (uint8_t *)&v27, 0x18u);
  }
  if (self->_bleBTVCLinkAdvertiser)
  {
    if ((_DWORD)v6)
    {
      v6 = v6;
      do
      {
        v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", *a5));
        if (v10)
          v10[8] = v7;

        ++a5;
        --v6;
      }
      while (v6);
    }
    else
    {
      for (i = 0; i != 6; ++i)
      {
        v20 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", a5[i]));
        if (v20)
          v20[8] = 0;

      }
    }
    if (v7)
    {
      v21 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")), "init");
      if (v21)
      {
        for (j = 0; j != 6; ++j)
        {
          v23 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", j));
          v24 = (_QWORD *)v23;
          if (v23 && *(_BYTE *)(v23 + 8))
          {
            v25 = objc_alloc_init((Class)NSMutableDictionary);
            objc_msgSend(v25, "addEntriesFromDictionary:", v24[2]);
            objc_msgSend(v25, "addEntriesFromDictionary:", v24[3]);
            objc_msgSend(v25, "addEntriesFromDictionary:", v24[4]);
            objc_msgSend(v21, "addObject:", v25);

          }
        }
      }
      v26 = qword_100999980;
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315394;
        v28 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
        v29 = 2112;
        *(_QWORD *)v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s, payloadFields:%@", (uint8_t *)&v27, 0x16u);
      }
      -[BTVCLinkAdvertiser setPayloadFields:](self->_bleBTVCLinkAdvertiser, "setPayloadFields:", v21);

    }
    -[BTVCLinkAdvertiser advertisingEnable:](self->_bleBTVCLinkAdvertiser, "advertisingEnable:", v7);
    self->_bleBTVCLinkAdvertiseEnable = v7;
  }
  else
  {
    v11 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006EA55C(v11, v12, v13, v14, v15, v16, v17, v18);
  }
}

- (void)leSetExtendedScanEnable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  BTVCLinkScanner *bleBTVCLinkScanner;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;

  v3 = a3;
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[BTVCLinkAgent leSetExtendedScanEnable:]";
    v17 = 1024;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, enable:%d", (uint8_t *)&v15, 0x12u);
  }
  bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  if (bleBTVCLinkScanner)
  {
    -[BTVCLinkScanner scanEnable:](bleBTVCLinkScanner, "scanEnable:", v3);
    self->_bleBTVCLinkScanEnable = v3;
  }
  else
  {
    v7 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006EA5D0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (id)_getBTVCLinkAdvertiserSet:(unsigned __int8)a3
{
  unsigned int v3;
  NSMutableArray *bleBTVCLinkAdvertiseSets;

  v3 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_bleBTVCLinkAdvertiseSets, "count") <= a3)
  {
    bleBTVCLinkAdvertiseSets = 0;
  }
  else
  {
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    if (bleBTVCLinkAdvertiseSets)
      bleBTVCLinkAdvertiseSets = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](bleBTVCLinkAdvertiseSets, "objectAtIndex:", v3));
  }
  return bleBTVCLinkAdvertiseSets;
}

- (void)_bleBTVCLinkAdvertiserEnsureStarted
{
  NSObject *v3;
  BTVCLinkAdvertiser *v4;
  BTVCLinkAdvertiser *bleBTVCLinkAdvertiser;
  uint8_t v6[16];

  if (!self->_bleBTVCLinkAdvertiser)
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink advertiser start\n", v6, 2u);
    }
    v4 = -[BTVCLinkAdvertiser initWithType:]([BTVCLinkAdvertiser alloc], "initWithType:", 2);
    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
    self->_bleBTVCLinkAdvertiser = v4;

    -[BTVCLinkAdvertiser setDispatchQueue:](self->_bleBTVCLinkAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    self->_bleBTVCLinkAdvertiseEnable = 0;
    -[BTVCLinkAdvertiser activateWithCompletion:](self->_bleBTVCLinkAdvertiser, "activateWithCompletion:", &stru_10092CA80);
  }
}

- (void)_bleBTVCLinkAdvertiserEnsureStopped
{
  NSObject *v3;
  BTVCLinkAdvertiser *bleBTVCLinkAdvertiser;
  BTVCLinkAdvertiser *v5;
  uint8_t v6[16];

  if (self->_bleBTVCLinkAdvertiser)
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink advertiser stop\n", v6, 2u);
    }
    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
  }
  else
  {
    bleBTVCLinkAdvertiser = 0;
  }
  -[BTVCLinkAdvertiser invalidate](bleBTVCLinkAdvertiser, "invalidate");
  self->_bleBTVCLinkAdvertiseEnable = 0;
  v5 = self->_bleBTVCLinkAdvertiser;
  self->_bleBTVCLinkAdvertiser = 0;

}

- (BOOL)_bleBTVCLinkAdvertiserShouldAdvertise
{
  return !self->_systemWillPowerDown;
}

- (void)_bleBTVCLinkScannerEnsureStarted
{
  NSObject *v3;
  BTVCLinkScanner *v4;
  BTVCLinkScanner *bleBTVCLinkScanner;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  if (self->_bleBTVCLinkScanner)
  {
    -[BTVCLinkAgent _bleUpdateScanner:](self, "_bleUpdateScanner:");
  }
  else
  {
    self->_bleBTVCLinkScanEnable = 0;
    location = 0;
    objc_initWeak(&location, self);
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink scanner start\n", buf, 2u);
    }
    v4 = -[BTVCLinkScanner initWithType:]([BTVCLinkScanner alloc], "initWithType:", 2);
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
    self->_bleBTVCLinkScanner = v4;

    -[BTVCLinkScanner setDispatchQueue:](self->_bleBTVCLinkScanner, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003CF0A0;
    v6[3] = &unk_10092CAA8;
    objc_copyWeak(&v7, &location);
    -[BTVCLinkScanner setAdvReportReceiveHandler:](self->_bleBTVCLinkScanner, "setAdvReportReceiveHandler:", v6);
    -[BTVCLinkAgent _bleUpdateScanner:](self, "_bleUpdateScanner:", self->_bleBTVCLinkScanner);
    -[BTVCLinkScanner activateWithCompletion:](self->_bleBTVCLinkScanner, "activateWithCompletion:", &stru_10092CAC8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_bleBTVCLinkScannerEnsureStopped
{
  NSObject *v3;
  BTVCLinkScanner *bleBTVCLinkScanner;
  BTVCLinkScanner *v5;
  uint8_t v6[16];

  if (self->_bleBTVCLinkScanner)
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink scanner stop\n", v6, 2u);
    }
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  }
  else
  {
    bleBTVCLinkScanner = 0;
  }
  -[BTVCLinkScanner invalidate](bleBTVCLinkScanner, "invalidate");
  self->_bleBTVCLinkScanEnable = 0;
  v5 = self->_bleBTVCLinkScanner;
  self->_bleBTVCLinkScanner = 0;

}

- (BOOL)_bleBTVCLinkScannerShouldScan
{
  return !self->_systemWillPowerDown;
}

- (void)_receivedAdvReport:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5 peerInfo:(id)a6
{
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t NSNumber;
  uint64_t v12;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  id v33;
  unsigned int v34;
  void *v35;
  BOOL v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD, _QWORD, _QWORD, _QWORD);
  unsigned __int16 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int16 v44;
  unsigned __int8 v45;
  id v46;
  int v47;
  int v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  BOOL v52;
  NSObject *v53;
  uint64_t v54;
  int v55;
  id v56;
  id v57;
  uint64_t *v59;
  id v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  unsigned int v73;
  uint64_t v74;
  unsigned int v75;
  unsigned __int8 v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  uint8_t v81[4];
  const char *v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  unsigned int v90;
  __int16 v91;
  unsigned int v92;
  __int16 v93;
  unsigned int v94;
  __int16 v95;
  unsigned int v96;
  __int16 v97;
  unsigned int v98;
  __int16 v99;
  unsigned int v100;
  __int16 v101;
  unsigned int v102;
  __int16 v103;
  id v104;
  __int16 v105;
  unsigned int v106;
  uint8_t buf[32];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;

  v60 = a4;
  v56 = a5;
  v57 = a6;
  v80 = 0;
  v8 = (id)qword_100999980;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v60, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s report count %d", buf, 0x12u);
  }

  if (objc_msgSend(v60, "count"))
  {
    v61 = 0;
    v72 = 0;
    while (1)
    {
      v9 = v72;
      if ((unint64_t)objc_msgSend(v60, "count") <= v61)
      {
LABEL_60:
        if (v80)
        {
          v53 = qword_100999980;
          if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%s ADV data missing field %@\n", buf, 0x16u);
          }
        }
        goto LABEL_63;
      }
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectAtIndex:"));

      v72 = (void *)v10;
      if (!v10)
      {
        v50 = qword_100999980;
        if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v61;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s ADV data [%d] is empty", buf, 0x12u);
        }
        goto LABEL_30;
      }
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      memset(buf, 0, sizeof(buf));
      v79 = 0;
      NSNumber = NSDictionaryGetNSNumber(v10, CFSTR("et"), &v80);
      v78 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
      if (v80)
        break;
      v12 = NSDictionaryGetNSNumber(v10, CFSTR("at"), &v80);
      v77 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (v80)
      {
        v48 = 0;
        goto LABEL_34;
      }
      TypeID = CFDataGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("pa"), TypeID, &v80);
      v70 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
      if (v80)
      {
        v48 = 0;
        goto LABEL_36;
      }
      v15 = NSDictionaryGetNSNumber(v10, CFSTR("pPHY"), &v80);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (v80)
      {
        v48 = 0;
        goto LABEL_38;
      }
      v16 = NSDictionaryGetNSNumber(v10, CFSTR("sPHY"), &v80);
      v69 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (v80)
      {
        v48 = 0;
        goto LABEL_39;
      }
      v17 = NSDictionaryGetNSNumber(v10, CFSTR("aSID"), &v80);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (v80)
      {
        v48 = 0;
        goto LABEL_40;
      }
      v18 = NSDictionaryGetNSNumber(v10, CFSTR("tp"), &v80);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (v80)
      {
        v48 = 0;
        goto LABEL_41;
      }
      v19 = NSDictionaryGetNSNumber(v10, CFSTR("rssi"), &v80);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v80)
      {
        v48 = 0;
        goto LABEL_42;
      }
      v20 = NSDictionaryGetNSNumber(v10, CFSTR("pai"), &v80);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (v80)
      {
        v48 = 0;
        goto LABEL_43;
      }
      v21 = NSDictionaryGetNSNumber(v10, CFSTR("dat"), &v80);
      v64 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (v80)
      {
        v48 = 0;
        goto LABEL_44;
      }
      v22 = NSDictionaryGetNSNumber(v10, CFSTR("da"), &v80);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if (v80)
      {
        v48 = 0;
        goto LABEL_45;
      }
      v23 = NSDictionaryGetNSNumber(v10, CFSTR("dtl"), &v80);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (v80 || (CFDictionaryGetData(v10, CFSTR("data"), buf, 256, &v79, &v80), v80))
      {
        v48 = 0;
        v47 = 7;
      }
      else
      {
        v70 = objc_retainAutorelease(v70);
        v59 = (uint64_t *)objc_msgSend(v70, "bytes");
        v24 = (id)qword_100999980;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v75 = objc_msgSend(v78, "intValue");
          v73 = objc_msgSend(v77, "intValue");
          v25 = *v59;
          v26 = objc_msgSend(v71, "intValue");
          v27 = objc_msgSend(v69, "intValue");
          v28 = objc_msgSend(v68, "intValue");
          v29 = objc_msgSend(v67, "intValue");
          v30 = objc_msgSend(v66, "intValue");
          v31 = objc_msgSend(v65, "intValue");
          v32 = objc_msgSend(v64, "intValue");
          v33 = objc_msgSend(v63, "longLongValue");
          v34 = objc_msgSend(v62, "intValue");
          *(_DWORD *)v81 = 136318210;
          v82 = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          v83 = 1024;
          v84 = v75;
          v85 = 1024;
          v86 = v73;
          v87 = 2048;
          v88 = v25;
          v89 = 1024;
          v90 = v26;
          v91 = 1024;
          v92 = v27;
          v93 = 1024;
          v94 = v28;
          v95 = 1024;
          v96 = v29;
          v97 = 1024;
          v98 = v30;
          v99 = 1024;
          v100 = v31;
          v101 = 1024;
          v102 = v32;
          v103 = 2048;
          v104 = v33;
          v105 = 1024;
          v106 = v34;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s EventType:0x%04X, AddressType:0x%02X, PeerAddress:%llX, primaryPHY:0x%02X, secondaryPHY:0x%02X, advertisingSID:0x%02X, txPower:0x%02X, rssi:0x%02X, periodicAdvInterval:0x%02X, directAddressType:0x%02X, directAddress:0x%llX, DataLength:%d", v81, 0x5Cu);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent advReportReceiveHandler](self, "advReportReceiveHandler"));
        v36 = v35 == 0;

        if (!v36)
        {
          v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent advReportReceiveHandler](self, "advReportReceiveHandler"));
          v38 = (unsigned __int16)objc_msgSend(v78, "intValue");
          v76 = objc_msgSend(v77, "intValue");
          v74 = *v59;
          v39 = objc_msgSend(v71, "intValue");
          v40 = objc_msgSend(v69, "intValue");
          v41 = objc_msgSend(v68, "intValue");
          v42 = objc_msgSend(v67, "intValue");
          v43 = objc_msgSend(v66, "intValue");
          v44 = (unsigned __int16)objc_msgSend(v65, "intValue");
          v45 = objc_msgSend(v64, "intValue");
          v46 = objc_msgSend(v63, "longLongValue");
          LOBYTE(v55) = objc_msgSend(v62, "intValue");
          BYTE4(v54) = v45;
          WORD1(v54) = v44;
          LOBYTE(v54) = v43;
          ((void (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, id, int, uint8_t *, id, id))v37)[2](v37, v38, v76, v74, v39, v40, v41, v42, v54, v46, v55, buf, v56, v57);

        }
        v47 = 0;
        v48 = 1;
      }
      v49 = v62;
LABEL_26:

      if (!v48)
      {
        if (v47 == 7)
        {
          v9 = v72;
        }
        else
        {
          v52 = v47 == 2;
          v9 = v72;
          if (!v52)
            goto LABEL_63;
        }
        goto LABEL_60;
      }
LABEL_30:
      ++v61;
    }
    v48 = 0;
    v77 = 0;
LABEL_34:
    v70 = 0;
LABEL_36:
    v71 = 0;
LABEL_38:
    v69 = 0;
LABEL_39:
    v68 = 0;
LABEL_40:
    v67 = 0;
LABEL_41:
    v66 = 0;
LABEL_42:
    v65 = 0;
LABEL_43:
    v64 = 0;
LABEL_44:
    v63 = 0;
LABEL_45:
    v49 = 0;
    v47 = 7;
    goto LABEL_26;
  }
  v51 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s empty ADV set received", buf, 0xCu);
  }
  v9 = 0;
LABEL_63:

}

- (void)_systemWillSleep
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CFFC8;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D0034;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_advReportReceiveHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleBTVCLinkScanner, 0);
  objc_storeStrong((id *)&self->_bleBTVCLinkAdvertiseSets, 0);
  objc_storeStrong((id *)&self->_bleBTVCLinkAdvertiser, 0);
}

@end
