@implementation CLHidManager

- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4
{
  CLHidManager *v6;
  HIDManager *v7;
  HIDManager *manager;
  NSObject *v9;
  id v10;
  uint64_t v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _QWORD v16[5];
  objc_super v17;
  int v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v17.receiver = self;
  v17.super_class = (Class)CLHidManager;
  v6 = -[CLHidManager init](&v17, "init");
  if (v6)
  {
    v6->_clientDevices = objc_opt_new(NSMutableArray);
    v6->_delegate = (CLHidManagerDelegate *)a3;
    v6->_delegateQueue = (OS_dispatch_queue *)a4;
    v7 = (HIDManager *)objc_msgSend(objc_alloc((Class)HIDManager), "initWithOptions:", 8);
    v6->_manager = v7;
    -[HIDManager setDeviceMatching:](v7, "setDeviceMatching:", &__NSDictionary0__struct);
    -[HIDManager setDispatchQueue:](v6->_manager, "setDispatchQueue:", v6->_delegateQueue);
    manager = v6->_manager;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A964C8;
    v16[3] = &unk_102166D30;
    v16[4] = v6;
    -[HIDManager setDeviceNotificationHandler:](manager, "setDeviceNotificationHandler:", v16);
    -[HIDManager activate](v6->_manager, "activate");
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102166DA0);
    v9 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEBUG))
    {
      v10 = -[HIDManager devices](v6->_manager, "devices");
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_102166DA0);
      v12 = qword_10229FC78;
      v13 = -[HIDManager devices](v6->_manager, "devices");
      v18 = 138412290;
      v19 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "[CLHidManager] enumerated these devices: %@", &v18, 12);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLHidManager initWithDelegate:queue:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HIDManager cancel](self->_manager, "cancel");
  -[HIDManager close](self->_manager, "close");

  -[NSMutableArray removeAllObjects](self->_clientDevices, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)CLHidManager;
  -[CLHidManager dealloc](&v3, "dealloc");
}

- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A96600;
  block[3] = &unk_102166D58;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async((dispatch_queue_t)-[CLHidManager delegateQueue](self, "delegateQueue"), block);
}

- (id)createDeviceForMatchingDictionary:(id)a3
{
  id v5;
  CLHidDevice *v6;

  v5 = -[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:](self, "getHidDeviceFromEnumeratedDevicesMatching:");
  v6 = -[CLHidManager getClientDeviceMatchingDict:](self, "getClientDeviceMatchingDict:", a3);
  if (!v6)
  {
    v6 = -[CLHidDevice initWithHidDevice:matchingDict:]([CLHidDevice alloc], "initWithHidDevice:matchingDict:", v5, a3);
    -[NSMutableArray addObject:](-[CLHidManager clientDevices](self, "clientDevices"), "addObject:", v6);
    -[CLHidManager activateClientDevice:](self, "activateClientDevice:", v6);
    if (!v5)
      return v6;
    goto LABEL_3;
  }
  if (v5)
LABEL_3:
    -[CLHidManager sendMonitorUpdateForDevice:added:](self, "sendMonitorUpdateForDevice:added:", v6, 1);
  return v6;
}

- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;

  v4 = a4;
  v7 = -[CLHidManager getClientDeviceMatchingHIDDevice:](self, "getClientDeviceMatchingHIDDevice:");
  if (v7)
  {
    v8 = v7;
    if (v4)
    {
      objc_msgSend(v7, "setHidDevice:", a3);
      -[CLHidManager activateClientDevice:](self, "activateClientDevice:", v8);
    }
    else
    {
      objc_msgSend(v7, "setHidDevice:", 0);
    }
    -[CLHidManager sendMonitorUpdateForDevice:added:](self, "sendMonitorUpdateForDevice:added:", v8, v4);
  }
}

- (void)activateClientDevice:(id)a3
{
  _QWORD v5[7];

  if (objc_msgSend(a3, "hidDevice"))
  {
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "setDispatchQueue:", -[CLHidManager delegateQueue](self, "delegateQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100A96824;
    v5[3] = &unk_102166D80;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = self;
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "setInputReportHandler:", v5);
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "open");
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "activate");
  }
}

- (id)getClientDeviceMatchingDict:(id)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSObject *v10;
  const char *v12;
  uint8_t *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  id v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = -[CLHidManager clientDevices](self, "clientDevices");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v9, "matching"), "isEqual:", a3))
        {
          if (qword_10229FC70 != -1)
            dispatch_once(&qword_10229FC70, &stru_102166DA0);
          v10 = qword_10229FC78;
          if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v21 = a3;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[CLHidManager], matched CLHidDevice for %@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FC70 != -1)
              dispatch_once(&qword_10229FC70, &stru_102166DA0);
            v18 = 138412290;
            v19 = a3;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 1, "[CLHidManager], matched CLHidDevice for %@", &v18, 12);
            v13 = (uint8_t *)v12;
            sub_100512490("Generic", 1, 0, 2, "-[CLHidManager getClientDeviceMatchingDict:]", "%s\n", v12);
            if (v13 != buf)
              free(v13);
          }
          return v9;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 0;
}

- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  id v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = -[HIDManager devices](-[CLHidManager manager](self, "manager"), "devices");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v23;
  while (1)
  {
    v7 = 0;
LABEL_4:
    if (*(_QWORD *)v23 != v6)
      objc_enumerationMutation(obj);
    v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (!v9)
      break;
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(a3);
      if (!objc_msgSend(objc_msgSend(v8, "propertyForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12)), "isEqual:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12))))break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        if (v10)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    if ((id)++v7 != v5)
      goto LABEL_4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    v8 = 0;
    if (!v5)
      return v8;
  }
LABEL_18:
  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_102166DA0);
  v13 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[CLHidManager], matched device for %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102166DA0);
    v26 = 138412290;
    v27 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 1, "[CLHidManager], matched device for %@", &v26, 12);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  return v8;
}

- (id)getClientDeviceMatchingHIDDevice:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = -[CLHidManager clientDevices](self, "clientDevices");
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v15 = *(_QWORD *)v21;
  do
  {
    v6 = 0;
LABEL_4:
    if (*(_QWORD *)v21 != v15)
      objc_enumerationMutation(obj);
    v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v7, "matching");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (!v9)
      break;
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      if (!objc_msgSend(objc_msgSend(a3, "propertyForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12)), "isEqual:", objc_msgSend(objc_msgSend(v7, "matching"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12))))break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
          goto LABEL_8;
        return v7;
      }
    }
    if ((id)++v6 != v5)
      goto LABEL_4;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    v7 = 0;
  }
  while (v5);
  return v7;
}

- (id)registerForDeviceMatching:(id)a3
{
  return -[CLHidManager createDeviceForMatchingDictionary:](self, "createDeviceForMatchingDictionary:", a3);
}

- (void)unregisterForDeviceMatching:(id)a3
{
  -[NSMutableArray removeObject:](-[CLHidManager clientDevices](self, "clientDevices"), "removeObject:", a3);
}

- (CLHidManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDManager)manager
{
  return self->_manager;
}

- (NSMutableArray)clientDevices
{
  return self->_clientDevices;
}

- (void)setClientDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
