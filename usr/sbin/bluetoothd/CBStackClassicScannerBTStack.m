@implementation CBStackClassicScannerBTStack

- (id)description
{
  return -[CBStackClassicScannerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11;
  void *v12;
  id *v13;
  NSMutableDictionary *deviceMap;
  unint64_t v15;
  BOOL v16;
  char *v17;
  id *v18;
  id v19;
  id v20;
  _QWORD v21[6];
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  if (v4 < 0x15)
  {
    v29 = 0;
    v30 = (id *)&v29;
    v31 = 0x3032000000;
    v32 = sub_1000624CC;
    v33 = sub_100062320;
    v34 = 0;
    v28 = 0;
    v11 = objc_msgSend((id)objc_opt_class(self), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF_safe(&v28, "== %@: devices %d ==", v12, v5);
    objc_storeStrong(&v34, v28);

    v13 = v30;
    obj = v30[5];
    NSAppendPrintF_safe(&obj, "\n");
    objc_storeStrong(v13 + 5, obj);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    deviceMap = self->_deviceMap;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10009E0A0;
    v21[3] = &unk_100917278;
    v21[4] = &v29;
    v21[5] = &v23;
    v22 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v21);
    v15 = v24[3];
    v16 = (unint64_t)v5 >= v15;
    v17 = &v5[-v15];
    if (v17 != 0 && v16)
    {
      v18 = v30;
      v20 = v30[5];
      NSAppendPrintF_safe(&v20, "... %d more, %d total\n", (_DWORD)v17, (_DWORD)v5);
      objc_storeStrong(v18 + 5, v20);
    }
    _Block_object_dispose(&v23, 8);
    v19 = v30[5];
    _Block_object_dispose(&v29, 8);

    return v19;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = NSPrintF_safe("%@: devices %d", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    return v9;
  }
}

- (void)activate
{
  CBStackClassicScannerBTStack *v2;
  unint64_t *p_btSession;
  id v4;
  __objc2_class *v5;
  NSObject *dispatchQueue;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  int isa;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  std::__shared_weak_count *v31;
  uint64_t v32[3];
  void *__p;
  std::__shared_weak_count *v34;
  char v35;

  if (!self->_deviceFoundHandler)
  {
    CUFatalErrorF(&dword_100977CA8, "No deviceFoundHandler");
    goto LABEL_52;
  }
  v2 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_52:
    CUFatalErrorF(&dword_100977CA8, "No deviceLostHandler");
    goto LABEL_53;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_53:
    CUFatalErrorF(&dword_100977CA8, "No dispatchQueue");
    goto LABEL_54;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (v2->_invalidateCalled)
  {
LABEL_54:
    CUFatalErrorF(&dword_100977CA8, "Activate after invalidate");
LABEL_55:
    dispatch_once(&qword_100977B50, &stru_1009183C0);
    goto LABEL_13;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB38);
  v7 = (void *)qword_10097BB30;
  if (!qword_10097BB30)
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = (void *)qword_10097BB30;
    qword_10097BB30 = (uint64_t)v8;

    v7 = (void *)qword_10097BB30;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v2));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v2, v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB38);
  p_btSession = (unint64_t *)&v2->_btSession;
  if (v2->_btSession)
    goto LABEL_22;
  v5 = &OBJC_METACLASS___BTVCLinkAdvertiseSet;
  if (dword_100977CA8 <= 30 && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack activate]", 30, "Activate");
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CBDaemon-0x%X"), CBXPCGetNextClientID());
  if (qword_100977B50 != -1)
    goto LABEL_55;
LABEL_13:
  v11 = qword_100977B48;
  v12 = objc_retainAutorelease(v4);
  sub_100091AE8(&__p, (char *)objc_msgSend(v12, "UTF8String"));
  v13 = sub_10000A378(v11, (uint64_t)&__p);
  v14 = v13;
  if (v35 < 0)
  {
    operator delete(__p);
    if (!v14)
      goto LABEL_21;
  }
  else if (!v13)
  {
    goto LABEL_21;
  }
  isa = (int)v5[81].isa;
  if (isa <= 90 && (isa != -1 || _LogCategory_Initialize(&dword_100977CA8, 90)))
  {
    v16 = CUPrintErrorCode((v14 + 310000));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack activate]", 90, "### Attach session failed: %@", v17);

  }
LABEL_21:

  if (!*p_btSession)
    return;
LABEL_22:
  if (v2->_btDiscoveryAgent)
    return;
  __p = 0;
  v34 = 0;
  if (qword_100977D80 != -1)
    dispatch_once(&qword_100977D80, &stru_1009183E0);
  sub_1004C0B94((uint64_t)off_100977D78, *p_btSession, (unint64_t *)&v2->_btDiscoveryAgent, (uint64_t *)&__p);
  if (!__p)
  {
    if (dword_100977CA8 <= 90
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 90)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack activate]", 90, "### Create scan agent failed");
    }
    goto LABEL_46;
  }
  *(_OWORD *)v32 = *(_OWORD *)off_100918388;
  sub_1004BCEBC((uint64_t *)__p, (uint64_t)v2->_btDiscoveryAgent, v32, (uint64_t)v2);
  if (qword_100977D80 != -1)
    dispatch_once(&qword_100977D80, &stru_1009183E0);
  v18 = off_100977D78;
  v30 = __p;
  v31 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
  }
  v21 = sub_1004C1908((uint64_t)v18, &v30, 0, -1);
  v22 = v31;
  if (v31)
  {
    v23 = (unint64_t *)&v31->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (!v21)
    goto LABEL_42;
  if (dword_100977CA8 <= 90)
  {
    if (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 90))
    {
      v25 = CUPrintErrorCode((v21 + 310000));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack activate]", 90, "### Scan start failed: %@", v26);

    }
LABEL_42:
    if (dword_100977CA8 <= 30
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack activate]", 30, "Scan started: initial");
    }
  }
LABEL_46:
  v27 = v34;
  if (v34)
  {
    v28 = (unint64_t *)&v34->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100977CA8 <= 30
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack invalidate]", 30, "Invalidate");
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB38);
    v3 = (void *)qword_10097BB30;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", self));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB38);
    if (self->_btDiscoveryAgent)
    {
      if (qword_100977D80 != -1)
        dispatch_once(&qword_100977D80, &stru_1009183E0);
      sub_1004C1014(off_100977D78, (unint64_t)self->_btDiscoveryAgent);
      self->_btDiscoveryAgent = 0;
      if (dword_100977CA8 <= 30
        && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
      {
        LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack invalidate]", 30, "Scan stopped");
      }
    }
    if (self->_btSession)
    {
      if (qword_100977B50 != -1)
        dispatch_once(&qword_100977B50, &stru_1009183C0);
      sub_10000B174(qword_100977B48, (unint64_t)self->_btSession);
      self->_btSession = 0;
    }
    -[CBStackClassicScannerBTStack _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  id deviceFoundHandler;
  id deviceLostHandler;
  id invalidationHandler;
  void (**v6)(void);

  if (!self->_invalidateDone)
  {
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (v6)
      v6[2]();
    if (dword_100977CA8 <= 30
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _invalidated]", 30, "Invalidated");
    }

  }
}

- (void)_deviceFound:(void *)a3 deviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  id v17;

  v6 = a4;
  if (!self->_invalidateCalled)
  {
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v10 = objc_alloc_init((Class)CBDevice);
      objc_msgSend(v10, "setIdentifier:", v7);
      objc_msgSend(v10, "setInternalFlags:", 128);
      v9 = 0x4000000;
      v8 = v10;
    }
    objc_msgSend(v8, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v8, "discoveryFlags") | 0x4000000000000);
    objc_msgSend(v8, "setChangeFlags:", 0);
    v11 = (unint64_t)objc_msgSend(v8, "updateWithClassicDevice:deviceUUID:", a3, v17) | v9;
    objc_msgSend(v8, "setChangeFlags:", (unint64_t)objc_msgSend(v8, "changeFlags") | v11);
    objc_msgSend(v8, "setLastSeenTicks:", mach_absolute_time());
    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = self->_deviceMap;
        self->_deviceMap = v13;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v8, v7);
      if (dword_100977CA8 <= 30
        && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
      {
        LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _deviceFound:deviceUUID:]", 30, "Device found new: %@", v8);
      }
      v15 = objc_retainBlock(self->_deviceFoundHandler);
      v16 = v15;
      if (!v15)
        goto LABEL_20;
    }
    else
    {
      if (dword_100977CA8 <= 30
        && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
      {
        LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _deviceFound:deviceUUID:]", 30, "Device found changed: %@", v8);
      }
      v15 = objc_retainBlock(self->_deviceFoundHandler);
      v16 = v15;
      if (!v15)
        goto LABEL_20;
    }
    (*((void (**)(id, void *))v15 + 2))(v15, v8);
LABEL_20:

    v6 = v17;
  }

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v4);
    if (dword_100977CA8 <= 30
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _deviceLost:]", 30, "Device lost: %@", v5);
    }
    v6 = objc_retainBlock(self->_deviceLostHandler);
    v7 = v6;
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v5);

  }
  else if (dword_100977CA8 <= 20
         && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 20)))
  {
    LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _deviceLost:]", 20, "Device lost unknown: %@", v4);
  }

}

- (void)_discoveryEvent:(int)a3 device:(BTDeviceImpl *)a4 attributes:(unsigned int)a5
{
  unsigned __int8 *v9;
  const char *v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *__p[2];
  char v21;
  _QWORD v22[2];

  if (self->_invalidateCalled)
    return;
  if (qword_1009778E8 != -1)
    dispatch_once(&qword_1009778E8, &stru_100918400);
  v9 = (unsigned __int8 *)sub_10046F6C0((uint64_t)off_1009778E0, (unint64_t)a4);
  if (dword_100977CA8 <= 30 && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
  {
    if (a3 > 2)
    {
      v10 = "?";
      if (v9)
      {
LABEL_8:
        sub_10043E5F8((uint64_t)v9, __p);
        if (v21 >= 0)
          v11 = __p;
        else
          v11 = (void **)__p[0];
LABEL_15:
        LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _discoveryEvent:device:attributes:]", 30, "Discovery event: %s, device %s, attrs 0x%X", v10, (const char *)v11, a5);
        if (v9 && v21 < 0)
          operator delete(__p[0]);
        goto LABEL_18;
      }
    }
    else
    {
      v10 = off_100918440[a3];
      if (v9)
        goto LABEL_8;
    }
    v11 = 0;
    goto LABEL_15;
  }
LABEL_18:
  v12 = v9[128];
  v13 = v9[129];
  v14 = v9[130];
  v15 = v9[131];
  v16 = v9[132];
  v17 = v9[133];
  v22[0] = 0;
  v22[1] = 0;
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100918420);
  sub_10003F924((uint64_t)off_1009778C0, (v12 << 40) | (v13 << 32) | (v14 << 24) | (v15 << 16) | (v16 << 8) | v17, 1u, 1u, 0, 0, (unsigned __int8 *)v22);
  v18 = sub_100030DF4((const unsigned __int8 *)v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    if (!a3 || a3 == 2)
    {
      -[CBStackClassicScannerBTStack _deviceFound:deviceUUID:](self, "_deviceFound:deviceUUID:", v9, v19);
    }
    else if (a3 == 1)
    {
      -[CBStackClassicScannerBTStack _deviceLost:](self, "_deviceLost:", v19);
    }
  }
  else if (dword_100977CA8 <= 90
         && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 90)))
  {
    LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _discoveryEvent:device:attributes:]", 90, "### Get device UUID failed");
  }

}

- (void)_statusEvent:(int)a3 device:(BTDeviceImpl *)a4 result:(int)a5
{
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  void **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  int v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  void *__p[2];
  char v32;

  if (self->_invalidateCalled || !self->_btDiscoveryAgent)
    return;
  if (qword_1009778E8 != -1)
    dispatch_once(&qword_1009778E8, &stru_100918400);
  v9 = sub_10046F6C0((uint64_t)off_1009778E0, (unint64_t)a4);
  if (dword_100977CA8 <= 30)
  {
    v10 = v9;
    if (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30))
    {
      if (a3 > 3)
      {
        v11 = "?";
        if (v10)
        {
LABEL_10:
          v12 = __p;
          sub_10043E5F8(v10, __p);
          if (v32 < 0)
            v12 = (void **)__p[0];
          goto LABEL_17;
        }
      }
      else
      {
        v11 = off_100918458[a3];
        if (v10)
          goto LABEL_10;
      }
      v12 = 0;
LABEL_17:
      v13 = CUPrintErrorCode((a5 + 310000));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _statusEvent:device:result:]", 30, "Status event: %s, device %s, result %@", v11, v12, v14);

      if (v10 && v32 < 0)
        operator delete(__p[0]);
    }
  }
  if (a3 != 1)
    return;
  v29 = 0;
  v30 = 0;
  if (qword_100977D80 != -1)
    dispatch_once(&qword_100977D80, &stru_1009183E0);
  sub_1004C0E3C((uint64_t)off_100977D78, (unint64_t)self->_btDiscoveryAgent, &v29);
  if (!v29)
  {
    if (dword_100977CA8 <= 90
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 90)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _statusEvent:device:result:]", 90, "### Get scan agent failed");
    }
    goto LABEL_43;
  }
  if (qword_100977D80 != -1)
    dispatch_once(&qword_100977D80, &stru_1009183E0);
  v15 = off_100977D78;
  v27 = v29;
  v28 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v18 = sub_1004C1908((uint64_t)v15, &v27, 0, -1);
  v19 = v28;
  if (v28)
  {
    v20 = (unint64_t *)&v28->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (!v18)
    goto LABEL_39;
  if (dword_100977CA8 <= 90)
  {
    if (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 90))
    {
      v22 = CUPrintErrorCode((v18 + 310000));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _statusEvent:device:result:]", 90, "### Scan start failed: rescan, %@", v23);

    }
LABEL_39:
    if (dword_100977CA8 <= 30
      && (dword_100977CA8 != -1 || _LogCategory_Initialize(&dword_100977CA8, 30)))
    {
      LogPrintF_safe(&dword_100977CA8, "-[CBStackClassicScannerBTStack _statusEvent:device:result:]", 30, "Scan started: rescan");
    }
  }
LABEL_43:
  v24 = v30;
  if (v30)
  {
    v25 = (unint64_t *)&v30->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_scanSummary, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end
