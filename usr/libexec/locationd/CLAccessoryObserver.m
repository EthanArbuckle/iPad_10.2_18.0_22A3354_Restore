@implementation CLAccessoryObserver

- (BOOL)startLocation
{
  NSObject *v3;
  _BOOL4 v4;
  EAAccessoryManager *v5;
  NSArray *v6;
  NSObject *v7;
  NSUInteger v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *info;
  void (*onConnected)(void *, void **, _QWORD);
  _BOOL4 v16;
  char *v17;
  uint64_t v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *__dst[2];
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *__p;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  int v41;
  id v42;
  uint8_t buf[16];
  void *v44[2];
  __int128 v45;
  void *v46[2];
  void *v47[2];
  __int128 v48;
  void *v49[2];
  void *v50[2];
  __int128 v51;
  _BYTE v52[25];
  __int16 v53;

  if (qword_1022A0000 != -1)
    dispatch_once(&qword_1022A0000, &stru_102149B50);
  v3 = qword_1022A0008;
  if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self->fAccessory != 0;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,starting accessory location,alreadyConnected,%{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v16 = self->fAccessory != 0;
    v41 = 67240192;
    LODWORD(v42) = v16;
    v17 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,starting accessory location,alreadyConnected,%{public}d", &v41, 8);
    sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver startLocation]", "%s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v5 = +[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager");
  -[EAAccessoryManager registerForLocalNotifications](v5, "registerForLocalNotifications");
  -[EAAccessoryManager setAreLocationAccessoriesEnabled:](v5, "setAreLocationAccessoriesEnabled:", 1);
  if (!self->fAccessory)
  {
    v6 = -[EAAccessoryManager connectedAccessories](v5, "connectedAccessories");
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v7 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
    {
      v8 = -[NSArray count](v6, "count");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "AccessoryObserver,examining %{public}lu connected accessories", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v18 = qword_1022A0008;
      v19 = -[NSArray count](v6, "count");
      v41 = 134349056;
      v42 = v19;
      LODWORD(v21) = 12;
      v20 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "AccessoryObserver,examining %{public}lu connected accessories", &v41, v21);
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver startLocation]", "%s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          if (-[CLAccessoryObserver setupAccessory:withListenerCall:](self, "setupAccessory:withListenerCall:", v12, 0))
          {
            v51 = 0u;
            memset(v52, 0, sizeof(v52));
            *(_OWORD *)v49 = 0u;
            *(_OWORD *)v50 = 0u;
            *(_OWORD *)v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            *(_OWORD *)v46 = 0u;
            *(_OWORD *)buf = 0u;
            *(_OWORD *)v44 = 0u;
            v53 = 257;
            sub_1006575AC(v12, (uint64_t)buf);
            info = self->fListener.info;
            onConnected = (void (*)(void *, void **, _QWORD))self->fListener.onConnected;
            sub_10065C70C((char *)__dst, (__int128 *)buf);
            onConnected(info, __dst, 0);
            if (v35 < 0)
              operator delete(__p);
            if (v33 < 0)
              operator delete(v32);
            if (v31 < 0)
              operator delete(v30);
            if (v29 < 0)
              operator delete(v28);
            if (v27 < 0)
              operator delete(v26);
            if (v25 < 0)
              operator delete(v24);
            if (v23 < 0)
              operator delete(__dst[0]);
            if ((v52[23] & 0x80000000) != 0)
              operator delete(*(void **)v52);
            if (SHIBYTE(v51) < 0)
              operator delete(v50[1]);
            if (SHIBYTE(v50[0]) < 0)
              operator delete(v49[0]);
            if (SHIBYTE(v48) < 0)
              operator delete(v47[1]);
            if (SHIBYTE(v47[0]) < 0)
              operator delete(v46[0]);
            if (SHIBYTE(v45) < 0)
              operator delete(v44[1]);
            if (SHIBYTE(v44[0]) < 0)
              operator delete(*(void **)buf);
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }
  }
  return self->fAccessory != 0;
}

- (EAAccessory)activeAccessory
{
  return self->fAccessory;
}

- (CLAccessoryObserver)initWithListener:(const CLAccessoryObserverListener *)a3 silo:(id)a4 timeSync:(BOOL)a5
{
  CLAccessoryObserver *v8;
  CLAccessoryObserver *v9;
  __int128 v10;
  __int128 v11;
  void *onEphemerisURL;
  NSNotificationCenter *v13;
  NSNotificationCenter *v14;
  NSNotificationCenter *v15;
  NSNotificationCenter *v16;
  NSNotificationCenter *v17;
  NSNotificationCenter *v18;
  NSNotificationCenter *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLAccessoryObserver;
  v8 = -[CLAccessoryObserver init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    v8->fAccessory = 0;
    v10 = *(_OWORD *)&a3->info;
    v11 = *(_OWORD *)&a3->onReferenceTime;
    onEphemerisURL = a3->onEphemerisURL;
    *(_OWORD *)&v8->fListener.onDisconnected = *(_OWORD *)&a3->onDisconnected;
    *(_OWORD *)&v8->fListener.onReferenceTime = v11;
    *(_OWORD *)&v8->fListener.info = v10;
    v8->fListener.onEphemerisURL = onEphemerisURL;
    v8->fSilo = (CLSilo *)a4;
    v8->_iAPTimeSyncEnable = a5;
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v8, "accessoryConnected:", EAAccessoryDidConnectNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v9, "accessoryDisconnected:", EAAccessoryDidDisconnectNotification, 0);
    v13 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v13, "addObserver:selector:name:object:", v9, "nmeaReceived:", EAAccessoryDidReceiveNMEASentenceNotification, 0);
    v14 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v14, "addObserver:selector:name:object:", v9, "timeRequested:", EAAccessoryDidRequestGPSTimeNotification, 0);
    v15 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v15, "addObserver:selector:name:object:", v9, "locationPointDataRequested:", EAAccessoryDidReceiveLocationPointDataNotification, 0);
    v16 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v16, "addObserver:selector:name:object:", v9, "ephemerisURLRequested:", EAAccessoryDidReceiveEphemerisURLNotification, 0);
    v17 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v17, "addObserver:selector:name:object:", v9, "ephemerisURLRequested:", EAAccessoryDidReceiveEphemerisRefreshInterval, 0);
    v18 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v18, "addObserver:selector:name:object:", v9, "ephemerisURLRequested:", EAAccessoryDidReceiveEphemerisExpirationInterval, 0);
    if (-[CLAccessoryObserver iAPTimeSyncEnable](v9, "iAPTimeSyncEnable"))
    {
      v19 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:](v19, "addObserver:selector:name:object:", v9, "onStarkTimeSyncNotification:", EAAccessoryTimeSyncInfoUpdateNotification, 0);
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CLAccessoryObserver;
  -[CLAccessoryObserver dealloc](&v3, "dealloc");
}

- (BOOL)stopLocation
{
  NSObject *v3;
  EAAccessoryManager *v4;
  EAAccessory *fAccessory;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A0000 != -1)
    dispatch_once(&qword_1022A0000, &stru_102149B50);
  v3 = qword_1022A0008;
  if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,stopping accessory location", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,stopping accessory location", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver stopLocation]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v4 = +[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager");
  -[EAAccessoryManager setAreLocationAccessoriesEnabled:](v4, "setAreLocationAccessoriesEnabled:", 0);
  -[EAAccessoryManager unregisterForLocalNotifications](v4, "unregisterForLocalNotifications");
  fAccessory = self->fAccessory;
  if (fAccessory)
  {

    self->fAccessory = 0;
  }
  return 1;
}

- (void)accessoryDidDisconnect:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[6];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100657D64;
  v4[3] = &unk_10212BB30;
  v4[4] = a3;
  v4[5] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (BOOL)sendReferenceTime:(double)a3
{
  double v4;
  unsigned __int8 v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  const char *v11;
  uint8_t *v12;
  _WORD v13[6];
  int v14;
  int v15[4];
  uint8_t buf[1640];

  if (self->fAccessory)
  {
    v14 = 0;
    v15[0] = 0;
    v4 = sub_100073658(v15, &v14, a3);
    LODWORD(v4) = v14;
    v5 = -[EAAccessory sendGpsWeek:gpsTOW:](self->fAccessory, "sendGpsWeek:gpsTOW:", v15[0], (double)*(unint64_t *)&v4 / 1000.0);
    if ((v5 & 1) == 0)
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v6 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendGpsWeek failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        v13[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 17, "AccessoryObserver,sendGpsWeek failed", v13, 2);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 0, "-[CLAccessoryObserver sendReferenceTime:]", "%s\n", v7);
        if (v8 != buf)
          free(v8);
      }
    }
  }
  else
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v9 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,no location accessory available", v15, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver sendReferenceTime:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    return 0;
  }
  return v5;
}

- (BOOL)sendReferenceTime:(double)a3 locationLatitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  double v10;
  unsigned __int8 v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  NSObject *v15;
  const char *v17;
  uint8_t *v18;
  _WORD v19[6];
  int v20;
  int v21[4];
  uint8_t buf[1640];

  if (self->fAccessory)
  {
    v20 = 0;
    v21[0] = 0;
    v10 = sub_100073658(v21, &v20, a3);
    LODWORD(v10) = v20;
    v11 = -[EAAccessory sendEphemerisPointDataGpsWeek:gpsTOW:latitude:longitude:accuracy:](self->fAccessory, "sendEphemerisPointDataGpsWeek:gpsTOW:latitude:longitude:accuracy:", v21[0], (int)a6, (double)*(unint64_t *)&v10 / 1000.0, a4, a5);
    if ((v11 & 1) == 0)
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v12 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendEphemerisPointDataGpsWeek failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        v19[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 17, "AccessoryObserver,sendEphemerisPointDataGpsWeek failed", v19, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLAccessoryObserver sendReferenceTime:locationLatitude:longitude:accuracy:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
  }
  else
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v15 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v21[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,no location accessory available", v21, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver sendReferenceTime:locationLatitude:longitude:accuracy:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    return 0;
  }
  return v11;
}

- (BOOL)sendEphemeris:(id)a3
{
  EAAccessory *fAccessory;
  _BOOL4 v4;
  NSObject *v5;
  double v6;
  uint8_t *v7;
  uint8_t *v8;
  NSObject *v9;
  _BOOL4 v10;
  double v11;
  uint8_t *v12;
  _WORD v14[8];
  uint8_t buf[1640];

  fAccessory = self->fAccessory;
  if (!fAccessory)
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v5 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    v4 = sub_1001BFF7C(115, 2);
    if (!v4)
      return v4;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v14[0] = 0;
    v6 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "AccessoryObserver,no location accessory available", v14, 2);
    v8 = v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver sendEphemeris:]", "%s\n", v6);
LABEL_21:
    if (v8 != buf)
      free(v8);
    LOBYTE(v4) = 0;
    return v4;
  }
  if ((-[EAAccessory sendEphemeris:](fAccessory, "sendEphemeris:", a3) & 1) != 0)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (qword_1022A0000 != -1)
    dispatch_once(&qword_1022A0000, &stru_102149B50);
  v9 = qword_1022A0008;
  if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendEphemeris failed", buf, 2u);
  }
  v10 = sub_1001BFF7C(115, 0);
  LOBYTE(v4) = 0;
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v14[0] = 0;
    v11 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 17, "AccessoryObserver,sendEphemeris failed", v14, 2);
    v8 = v12;
    sub_100512490("Generic", 1, 0, 0, "-[CLAccessoryObserver sendEphemeris:]", "%s\n", v11);
    goto LABEL_21;
  }
  return v4;
}

- (BOOL)isOnDenyList:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v4 = +[CLAccessoryObserverHelper isDenyListAccessory:name:model:serialNumber:firmware:hardwareRevision:](CLAccessoryObserverHelper, "isDenyListAccessory:name:model:serialNumber:firmware:hardwareRevision:", objc_msgSend(a3, "manufacturer"), objc_msgSend(a3, "name"), objc_msgSend(a3, "modelNumber"), objc_msgSend(a3, "serialNumber"), objc_msgSend(a3, "firmwareRevision"), objc_msgSend(a3, "hardwareRevision"));
  if (v4)
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v5 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136381955;
      v23 = objc_msgSend(objc_msgSend(a3, "manufacturer"), "UTF8String");
      v24 = 2081;
      v25 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "UTF8String");
      v26 = 2081;
      v27 = objc_msgSend(objc_msgSend(a3, "firmwareRevision"), "UTF8String");
      v28 = 2081;
      v29 = objc_msgSend(objc_msgSend(a3, "serialNumber"), "UTF8String");
      v30 = 2081;
      v31 = objc_msgSend(objc_msgSend(a3, "name"), "UTF8String");
      v32 = 2081;
      v33 = objc_msgSend(objc_msgSend(a3, "hardwareRevision"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,AccessoryInDenyList,manufacturer,%{private}s,model,%{private}s,firmware,%{private}s,serialNumber,%{private}s,name,%{private}s,hardwareRevision,%{private}s", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v7 = qword_1022A0008;
      v10 = 136381955;
      v11 = objc_msgSend(objc_msgSend(a3, "manufacturer"), "UTF8String");
      v12 = 2081;
      v13 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "UTF8String");
      v14 = 2081;
      v15 = objc_msgSend(objc_msgSend(a3, "firmwareRevision"), "UTF8String");
      v16 = 2081;
      v17 = objc_msgSend(objc_msgSend(a3, "serialNumber"), "UTF8String");
      v18 = 2081;
      v19 = objc_msgSend(objc_msgSend(a3, "name"), "UTF8String");
      v20 = 2081;
      v21 = objc_msgSend(objc_msgSend(a3, "hardwareRevision"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "AccessoryObserver,AccessoryInDenyList,manufacturer,%{private}s,model,%{private}s,firmware,%{private}s,serialNumber,%{private}s,name,%{private}s,hardwareRevision,%{private}s", &v10, 62);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver isOnDenyList:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  return v4;
}

- (void)readMobileAssetConfiguration:(CLNameValuePair)a3
{
  sub_100D834D0((uint64_t)&self->fAccessoryMobileAssetConfig, (uint64_t)a3._vptr$CLNameValuePair);
}

- (BOOL)getEnableCourseScreening
{
  return self->fAccessoryMobileAssetConfig.fEnableCourseScreening;
}

- (BOOL)getEnableAggressiveLocationScreening
{
  return self->fAccessoryMobileAssetConfig.fEnableAggressiveNMEAScreening;
}

- (int)getLocationDiffThresholdForAggressiveScreening
{
  return self->fAccessoryMobileAssetConfig.fLocationDiffThresholdForAggressiveScreening;
}

- (int)getMinContinuousFailureCountForBlockingAccessory
{
  return self->fAccessoryMobileAssetConfig.fMinContinuousFailureCountForBlockingAccessory;
}

- (int)getMinContinuousSuccessCountForUnblockingAccessory
{
  return self->fAccessoryMobileAssetConfig.fMinContinuousSuccessCountForUnblockingAccessory;
}

- (BOOL)getAllowGPGGAOnlyAccessory
{
  return self->fAccessoryMobileAssetConfig.fAllowGPGGAOnlyAccessory;
}

- (double)getCourseUncertaintyForCarPlayDRModeAtLowSpeedsInDeg
{
  return self->fAccessoryMobileAssetConfig.fCourseUncertaintyForCarPlayDRModeAtLowSpeedsInDeg;
}

- (double)getSpeedThresholdForCarPlayDRModeCourseUncSettingInMPS
{
  return self->fAccessoryMobileAssetConfig.fSpeedThresholdForCarPlayDRModeCourseUncSettingInMPS;
}

- (BOOL)setupAccessory:(id)a3 withListenerCall:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void **v8;
  BOOL v9;
  NSObject *v10;
  uint8_t *v11;
  void **v12;
  void *v13;
  void (*v14)(void *, void **, uint64_t);
  NSObject *v15;
  NSObject *v17;
  _BYTE *v18;
  void **v19;
  void **v20;
  void (*onDisconnected)(void *, char *);
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *info;
  void (*onConnected)(void *, void **, uint64_t);
  NSObject *v28;
  const char *v29;
  void **v30;
  uint64_t v31;
  uint8_t *v32;
  char *v33;
  char *v34;
  uint8_t *v35;
  void **v36;
  const char *v37;
  void **v38;
  const char *v39;
  const char *v40;
  void **v41;
  uint64_t v42;
  void **v43;
  void **v44;
  void **v45;
  char *v46;
  char *v47;
  const char *v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  char v52[176];
  void *v53[2];
  char v54;
  void *v55[2];
  char v56;
  void *v57[2];
  char v58;
  void *v59[2];
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  char v72;
  void *__dst[2];
  char v74;
  void *v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  char v80;
  void *v81;
  char v82;
  void *v83;
  char v84;
  void *v85;
  char v86;
  void *v87[2];
  char v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _BYTE v91[12];
  __int16 v92;
  id v93;
  __int16 v94;
  void **v95;
  uint8_t buf[32];
  __int128 v97;
  void *v98[2];
  void *v99[2];
  __int128 v100;
  void *v101[2];
  void *v102[2];
  __int128 v103;
  _BYTE v104[25];
  __int16 v105;
  void *__p[4];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[25];
  __int16 v115;

  v4 = a4;
  if (-[EAAccessory isEqual:](self->fAccessory, "isEqual:"))
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v7 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
    {
      sub_1001A486C((const __CFString *)objc_msgSend(a3, "name"), (uint64_t)__p);
      v8 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,already connected to accessory %s (%p)", buf, 0x16u);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v31 = qword_1022A0008;
      sub_1001A486C((const __CFString *)objc_msgSend(a3, "name"), (uint64_t)buf);
      if ((buf[23] & 0x80u) == 0)
        v32 = buf;
      else
        v32 = *(uint8_t **)buf;
      *(_DWORD *)v91 = 136315394;
      *(_QWORD *)&v91[4] = v32;
      v92 = 2048;
      v93 = a3;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v31, 0, "AccessoryObserver,already connected to accessory %s (%p)", v91, 22);
      v34 = v33;
      if ((char)buf[23] < 0)
        operator delete(*(void **)buf);
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v34);
      if (v34 != (char *)__p)
        free(v34);
    }
    return 0;
  }
  v103 = 0u;
  memset(v104, 0, sizeof(v104));
  *(_OWORD *)v101 = 0u;
  *(_OWORD *)v102 = 0u;
  *(_OWORD *)v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  *(_OWORD *)v98 = 0u;
  memset(buf, 0, sizeof(buf));
  v105 = 257;
  sub_1006575AC(a3, (uint64_t)buf);
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_102149B70);
  v10 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(uint8_t **)buf;
    if ((buf[23] & 0x80u) == 0)
      v11 = buf;
    v12 = v98;
    if (SHIBYTE(v99[0]) < 0)
      v12 = (void **)v98[0];
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = v11;
    WORD2(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "@ClxAccessory, state, 1, model, %s, %s", (uint8_t *)__p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102149B70);
    v35 = *(uint8_t **)buf;
    if ((buf[23] & 0x80u) == 0)
      v35 = buf;
    v36 = v98;
    if (SHIBYTE(v99[0]) < 0)
      v36 = (void **)v98[0];
    *(_DWORD *)v91 = 136315394;
    *(_QWORD *)&v91[4] = v35;
    v92 = 2080;
    v93 = v36;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A0048, 0, "@ClxAccessory, state, 1, model, %s, %s", v91, 22);
    v38 = (void **)v37;
    sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v37);
    if (v38 != __p)
      free(v38);
  }
  sub_1015A2E04(v87, "AccessoryObserver,setting up accessory");
  sub_10065A628((uint64_t *)buf, (uint64_t *)v87);
  if (v88 < 0)
    operator delete(v87[0]);
  if (!-[CLAccessoryObserver isOnDenyList:](self, "isOnDenyList:", a3)
    && !sub_100D852D4((uint64_t **)&self->fAccessoryMobileAssetConfig, buf))
  {
    if ((objc_msgSend(a3, "supportsLocation") & 1) == 0)
    {
      LOBYTE(v105) = 0;
      info = self->fListener.info;
      onConnected = (void (*)(void *, void **, uint64_t))self->fListener.onConnected;
      sub_10065C70C((char *)v59, (__int128 *)buf);
      onConnected(info, v59, 1);
      if (v72 < 0)
        operator delete(v71);
      if (v70 < 0)
        operator delete(v69);
      if (v68 < 0)
        operator delete(v67);
      if (v66 < 0)
        operator delete(v65);
      if (v64 < 0)
        operator delete(v63);
      if (v62 < 0)
        operator delete(v61);
      if (v60 < 0)
        operator delete(v59[0]);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v28 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,detected new non-location accessory", (uint8_t *)__p, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_44;
      bzero(__p, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      *(_WORD *)v91 = 0;
      LODWORD(v50) = 2;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,detected new non-location accessory", v91, v50);
      v30 = (void **)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v29);
      goto LABEL_138;
    }
    if (!self->fAccessory)
    {
LABEL_84:
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v23 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,connected to new location accessory", (uint8_t *)__p, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        *(_WORD *)v91 = 0;
        LODWORD(v50) = 2;
        _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,connected to new location accessory", v91, v50);
        v41 = (void **)v40;
        sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v40);
        if (v41 != __p)
          free(v41);
      }
      self->fAccessory = (EAAccessory *)a3;
      v24 = a3;
      -[EAAccessory setDelegate:](self->fAccessory, "setDelegate:", self);
      -[EAAccessory setNMEASentencesToFilter:](self->fAccessory, "setNMEASentencesToFilter:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("GPGGA"), CFSTR("GPRMC"), CFSTR("GPGSV"), CFSTR("PASCD"), CFSTR("PAGCD"), CFSTR("PAACD"), CFSTR("GPHDT"), 0));
      -[CLAccessoryObserver setupEphemeris](self, "setupEphemeris");
      if (-[CLAccessoryObserver iAPTimeSyncEnable](self, "iAPTimeSyncEnable"))
      {
        v89[0] = EATimeSyncOffsetUncertaintyThreshold;
        v89[1] = EATimeSyncOffsetMeasurementInterval;
        v90[0] = &off_10221B498;
        v90[1] = &off_10221B4B0;
        -[EAAccessory setIAPTimeSyncParams:](self->fAccessory, "setIAPTimeSyncParams:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 2));
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        v25 = qword_1022A0008;
        if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 134349312;
          *(void **)((char *)__p + 4) = (void *)100;
          WORD2(__p[1]) = 1026;
          *(_DWORD *)((char *)&__p[1] + 6) = 10000;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "AccessoryObserver,STARK:setIAPTimeSyncParams,uncThresholdMs,%{public}llu,intervalMs,%{public}u", (uint8_t *)__p, 0x12u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(__p, 0x65CuLL);
          if (qword_1022A0000 != -1)
            dispatch_once(&qword_1022A0000, &stru_102149B50);
          *(_DWORD *)v91 = 134349312;
          *(_QWORD *)&v91[4] = 100;
          v92 = 1026;
          LODWORD(v93) = 10000;
          LODWORD(v51) = 18;
          _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A0008, 2, "AccessoryObserver,STARK:setIAPTimeSyncParams,uncThresholdMs,%{public}llu,intervalMs,%{public}u", v91, v51);
          v49 = (void **)v48;
          sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v48);
          if (v49 != __p)
            free(v49);
        }
      }
      v9 = 1;
      goto LABEL_45;
    }
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v17 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
    {
      sub_1001A486C((const __CFString *)-[EAAccessory manufacturer](self->fAccessory, "manufacturer"), (uint64_t)v91);
      if (v94 >= 0)
        v18 = v91;
      else
        v18 = *(_BYTE **)v91;
      sub_1001A486C((const __CFString *)-[EAAccessory modelNumber](self->fAccessory, "modelNumber"), (uint64_t)v57);
      if (v58 >= 0)
        v19 = v57;
      else
        v19 = (void **)v57[0];
      sub_1001A486C((const __CFString *)-[EAAccessory name](self->fAccessory, "name"), (uint64_t)v55);
      if (v56 >= 0)
        v20 = v55;
      else
        v20 = (void **)v55[0];
      LODWORD(__p[0]) = 136381187;
      *(void **)((char *)__p + 4) = v18;
      WORD2(__p[1]) = 2081;
      *(void **)((char *)&__p[1] + 6) = v19;
      HIWORD(__p[2]) = 2081;
      __p[3] = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,discarding old location accessory and handling new,oldManufacturer,%{private}s,oldModel,%{private}s,oldName,%{private}s", (uint8_t *)__p, 0x20u);
      if (v56 < 0)
        operator delete(v55[0]);
      if (v58 < 0)
        operator delete(v57[0]);
      if (SHIBYTE(v94) < 0)
        operator delete(*(void **)v91);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v42 = qword_1022A0008;
      sub_1001A486C((const __CFString *)-[EAAccessory manufacturer](self->fAccessory, "manufacturer"), (uint64_t)v57);
      if (v58 >= 0)
        v43 = v57;
      else
        v43 = (void **)v57[0];
      sub_1001A486C((const __CFString *)-[EAAccessory modelNumber](self->fAccessory, "modelNumber"), (uint64_t)v55);
      if (v56 >= 0)
        v44 = v55;
      else
        v44 = (void **)v55[0];
      sub_1001A486C((const __CFString *)-[EAAccessory name](self->fAccessory, "name"), (uint64_t)v53);
      if (v54 >= 0)
        v45 = v53;
      else
        v45 = (void **)v53[0];
      *(_DWORD *)v91 = 136381187;
      *(_QWORD *)&v91[4] = v43;
      v92 = 2081;
      v93 = v44;
      v94 = 2081;
      v95 = v45;
      LODWORD(v50) = 32;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v42, 0, "AccessoryObserver,discarding old location accessory and handling new,oldManufacturer,%{private}s,oldModel,%{private}s,oldName,%{private}s", v91, v50);
      v47 = v46;
      if (v54 < 0)
        operator delete(v53[0]);
      if (v56 < 0)
        operator delete(v55[0]);
      if (v58 < 0)
        operator delete(v57[0]);
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v47);
      if (v47 != (char *)__p)
        free(v47);
      if (!v4)
        goto LABEL_83;
    }
    else if (!v4)
    {
LABEL_83:

      self->fAccessory = 0;
      goto LABEL_84;
    }
    memset(v114, 0, sizeof(v114));
    v113 = 0u;
    v112 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v107 = 0u;
    memset(__p, 0, sizeof(__p));
    v115 = 257;
    sub_1006575AC(self->fAccessory, (uint64_t)__p);
    onDisconnected = (void (*)(void *, char *))self->fListener.onDisconnected;
    v22 = self->fListener.info;
    sub_10065C70C(v52, (__int128 *)__p);
    onDisconnected(v22, v52);
    sub_10065C930((uint64_t)v52);
    sub_10065C930((uint64_t)__p);
    goto LABEL_83;
  }
  v104[24] = 1;
  v13 = self->fListener.info;
  v14 = (void (*)(void *, void **, uint64_t))self->fListener.onConnected;
  sub_10065C70C((char *)__dst, (__int128 *)buf);
  v14(v13, __dst, 1);
  if (v86 < 0)
    operator delete(v85);
  if (v84 < 0)
    operator delete(v83);
  if (v82 < 0)
    operator delete(v81);
  if (v80 < 0)
    operator delete(v79);
  if (v78 < 0)
    operator delete(v77);
  if (v76 < 0)
    operator delete(v75);
  if (v74 < 0)
    operator delete(__dst[0]);
  if (qword_1022A0000 != -1)
    dispatch_once(&qword_1022A0000, &stru_102149B50);
  v15 = qword_1022A0008;
  if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,accessory is on deny list", (uint8_t *)__p, 2u);
  }
  if (!sub_1001BFF7C(115, 2))
    goto LABEL_44;
  bzero(__p, 0x65CuLL);
  if (qword_1022A0000 != -1)
    dispatch_once(&qword_1022A0000, &stru_102149B50);
  *(_WORD *)v91 = 0;
  LODWORD(v50) = 2;
  _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A0008, 0, "AccessoryObserver,accessory is on deny list", v91, v50);
  v30 = (void **)v39;
  sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v39);
LABEL_138:
  if (v30 != __p)
    free(v30);
LABEL_44:
  v9 = 0;
LABEL_45:
  if ((v104[23] & 0x80000000) != 0)
    operator delete(*(void **)v104);
  if (SHIBYTE(v103) < 0)
    operator delete(v102[1]);
  if (SHIBYTE(v102[0]) < 0)
    operator delete(v101[0]);
  if (SHIBYTE(v100) < 0)
    operator delete(v99[1]);
  if (SHIBYTE(v99[0]) < 0)
    operator delete(v98[0]);
  if (SHIBYTE(v97) < 0)
    operator delete(*(void **)&buf[24]);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  return v9;
}

- (BOOL)setupEphemeris
{
  EAAccessory *fAccessory;
  unsigned int v4;
  uint64_t v5;
  BOOL v6;
  EAAccessory *v7;
  EAAccessory *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v14;
  _QWORD v15[2];
  uint8_t buf[1640];

  fAccessory = self->fAccessory;
  if (fAccessory)
  {
    *(_QWORD *)buf = 0;
    v4 = -[EAAccessory getEphemerisURL:](fAccessory, "getEphemerisURL:", buf);
    v5 = *(_QWORD *)buf;
    if (v4)
      v6 = *(_QWORD *)buf == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v15[0] = 0;
      v7 = self->fAccessory;
      if (!v7
        || (-[EAAccessory getEphemerisRecommendRefreshInterval:](v7, "getEphemerisRecommendRefreshInterval:", v15) & 1) == 0)
      {
        v15[0] = 0x7FEFFFFFFFFFFFFFLL;
      }
      v14 = 0;
      v8 = self->fAccessory;
      if (!v8
        || (-[EAAccessory getEphemerisExpirationInterval:](v8, "getEphemerisExpirationInterval:", &v14) & 1) == 0)
      {
        v14 = 0x7FEFFFFFFFFFFFFFLL;
      }
      ((void (*)(void *, _QWORD, _QWORD *, uint64_t *))self->fListener.onEphemerisURL)(self->fListener.info, *(_QWORD *)buf, v15, &v14);
      v5 = *(_QWORD *)buf;
    }
    LOBYTE(v9) = v5 != 0;
  }
  else
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v10 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "no location accessory available", buf, 2u);
    }
    v9 = sub_1001BFF7C(115, 2);
    if (v9)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "no location accessory available", v15, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver setupEphemeris]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (void)sendGPRMCDataStatusValues:(BOOL)a3
{
  EAAccessory *fAccessory;
  NSObject *v4;
  double v5;
  uint8_t *v6;
  uint8_t *v7;
  NSObject *v8;
  double v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  fAccessory = self->fAccessory;
  if (fAccessory)
  {
    if ((-[EAAccessory sendGPRMCDataStatusValueA:ValueV:ValueX:](fAccessory, "sendGPRMCDataStatusValueA:ValueV:ValueX:", 1, 1, a3) & 1) == 0)
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v4 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "sendGPRMCDataStatus failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        v11[0] = 0;
        v5 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 17, "sendGPRMCDataStatus failed", v11, 2);
        v7 = v6;
        sub_100512490("Generic", 1, 0, 0, "-[CLAccessoryObserver sendGPRMCDataStatusValues:]", "%s\n", v5);
LABEL_20:
        if (v7 != buf)
          free(v7);
      }
    }
  }
  else
  {
    if (qword_1022A0000 != -1)
      dispatch_once(&qword_1022A0000, &stru_102149B50);
    v8 = qword_1022A0008;
    if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "no location accessory available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v11[0] = 0;
      v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "no location accessory available", v11, 2);
      v7 = v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLAccessoryObserver sendGPRMCDataStatusValues:]", "%s\n", v9);
      goto LABEL_20;
    }
  }
}

- (void)accessoryConnected:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[6];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065AEC8;
  v4[3] = &unk_10212BB30;
  v4[4] = a3;
  v4[5] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (void)accessoryDisconnected:(id)a3
{
  -[CLSilo async:](self->fSilo, "async:", &stru_102149B30);
}

- (void)nmeaReceived:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[5];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065B274;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (void)timeRequested:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[5];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065B600;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (void)locationPointDataRequested:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[5];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065B668;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (void)ephemerisURLRequested:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[5];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065B6D0;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (void)onStarkTimeSyncNotification:(id)a3
{
  CLSilo *fSilo;
  _QWORD v4[6];

  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10065B8B8;
  v4[3] = &unk_10212BB30;
  v4[4] = a3;
  v4[5] = self;
  -[CLSilo async:](fSilo, "async:", v4);
}

- (BOOL)iAPTimeSyncEnable
{
  return self->_iAPTimeSyncEnable;
}

- (void)setIAPTimeSyncEnable:(BOOL)a3
{
  self->_iAPTimeSyncEnable = a3;
}

- (void).cxx_destruct
{
  sub_10065C9EC((uint64_t)&self->fAccessoryMobileAssetConfig, (_QWORD *)self->fAccessoryMobileAssetConfig.fAccessoriesList.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_BYTE *)self + 104) = 1;
  *(_QWORD *)((char *)self + 108) = 0xA00000041;
  *((_DWORD *)self + 29) = 180;
  *((_WORD *)self + 60) = 1;
  *((_OWORD *)self + 8) = xmmword_101BB8B70;
  return self;
}

@end
