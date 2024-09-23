@implementation PRAttachedAccessoryMonitor

- (PRAttachedAccessoryMonitor)initWithQueue:(id)a3
{
  id v6;
  PRAttachedAccessoryMonitor *v7;
  PRAttachedAccessoryMonitor *v8;
  NSMutableSet *v9;
  NSMutableSet *fConnectedACCAccessoryUUIDs;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRAttachedAccessoryMonitor.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PRAttachedAccessoryMonitor;
  v7 = -[PRAttachedAccessoryMonitor init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v8->_monitoring = 0;
    v9 = objc_opt_new(NSMutableSet);
    fConnectedACCAccessoryUUIDs = v8->fConnectedACCAccessoryUUIDs;
    v8->fConnectedACCAccessoryUUIDs = v9;

  }
  return v8;
}

- (BOOL)startMonitoring
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  if (!self->_monitoring)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002D513C;
    block[3] = &unk_1007FB340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
    self->_monitoring = 1;
  }
  return 1;
}

- (void)initAccessoryListener
{
  EAAccessoryManager *v3;
  EAAccessoryManager *fAccessoryManager;
  NSNotificationCenter *v5;
  NSNotificationCenter *fNotificationCenter;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;

  v3 = (EAAccessoryManager *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  fAccessoryManager = self->fAccessoryManager;
  self->fAccessoryManager = v3;

  -[EAAccessoryManager registerForLocalNotifications](self->fAccessoryManager, "registerForLocalNotifications");
  v5 = (NSNotificationCenter *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  fNotificationCenter = self->fNotificationCenter;
  self->fNotificationCenter = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EAAccessoryManager connectedAccessories](self->fAccessoryManager, "connectedAccessories"));
  v8 = (id)qword_10085D638;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "examining %lu connected accessories", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        -[PRAttachedAccessoryMonitor accessoryNotify:isAttached:](self, "accessoryNotify:isAttached:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), 1, (_QWORD)v14);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[NSNotificationCenter addObserver:selector:name:object:](self->fNotificationCenter, "addObserver:selector:name:object:", self, "accessoryConnected:", EAAccessoryDidConnectNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](self->fNotificationCenter, "addObserver:selector:name:object:", self, "accessoryDisconnected:", EAAccessoryDidDisconnectNotification, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
  objc_msgSend(v13, "registerDelegate:", self);

}

- (void)accessoryNotify:(id)a3 isAttached:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void **v12;
  NSObject *v13;
  unsigned int v16;
  int v17;
  int v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void **v26;
  NSObject *v27;
  id stateChangedHandler;
  unsigned int v29;
  void *__p[2];
  char v31;
  uint8_t buf[4];
  void **v33;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelNumber"));

    if (v8)
    {
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modelNumber")));
      sub_10000BF04(__p, (char *)objc_msgSend(v9, "UTF8String"));

      if (v31 < 0)
      {
        if (__p[1] == (void *)5)
        {
          v12 = (void **)__p[0];
          if (*(_DWORD *)__p[0] != 942748225 || *((_BYTE *)__p[0] + 4) != 51)
          {
            if (*(_DWORD *)__p[0] != 942748225 || *((_BYTE *)__p[0] + 4) != 52)
              goto LABEL_25;
LABEL_29:
            v18 = 2;
            goto LABEL_36;
          }
          goto LABEL_28;
        }
      }
      else if (v31 == 5)
      {
        if (LODWORD(__p[0]) != 942748225 || BYTE4(__p[0]) != 51)
        {
          if (LODWORD(__p[0]) != 942748225 || BYTE4(__p[0]) != 52)
          {
            v12 = __p;
LABEL_25:
            v16 = bswap32(*(_DWORD *)v12);
            if (v16 == 1093808440)
            {
              v17 = *((unsigned __int8 *)v12 + 4) - 48;
            }
            else if (v16 < 0x41323138)
            {
              v17 = -1;
            }
            else
            {
              v17 = 1;
            }
            if (v17)
              v18 = 999;
            else
              v18 = 3;
            goto LABEL_36;
          }
          goto LABEL_29;
        }
LABEL_28:
        v18 = 1;
        goto LABEL_36;
      }
      v18 = 999;
LABEL_36:
      v29 = v18;
      v19 = sub_100007824();
      v20 = (uint64_t *)sub_1003914B8((uint64_t)v19);
      v21 = *v20;
      v22 = v20[1];
      if (*v20 != v22)
      {
        do
        {
          v23 = qword_10085D638;
          if (os_log_type_enabled((os_log_t)qword_10085D638, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v21;
            if (*(char *)(v21 + 23) < 0)
              v24 = *(_QWORD *)v21;
            *(_DWORD *)buf = 136315138;
            v33 = (void **)v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "regulatory,acc,list,%s", buf, 0xCu);
          }
          v21 += 24;
        }
        while (v21 != v22);
      }
      v25 = qword_10085D638;
      if (os_log_type_enabled((os_log_t)qword_10085D638, OS_LOG_TYPE_DEFAULT))
      {
        v26 = __p;
        if (v31 < 0)
          v26 = (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "regulatory,acc,model,[%s]", buf, 0xCu);
      }
      if (sub_1002D5FFC(*v20, v20[1], (unsigned __int8 **)__p) != v20[1])
      {
        v27 = qword_10085D638;
        if (os_log_type_enabled((os_log_t)qword_10085D638, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v33) = v4;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "regulatory,acc,%d", buf, 8u);
        }
        stateChangedHandler = self->_stateChangedHandler;
        if (stateChangedHandler)
          (*((void (**)(id, _BOOL8, _QWORD, _QWORD))stateChangedHandler + 2))(stateChangedHandler, v4, 0, v29);
      }
      if (v31 < 0)
        operator delete(__p[0]);
      goto LABEL_53;
    }
  }
  v13 = qword_10085D638;
  if (os_log_type_enabled((os_log_t)qword_10085D638, OS_LOG_TYPE_ERROR))
    sub_1003E8838(v4, (uint64_t)v7, v13);
LABEL_53:

}

- (void)accessoryConnected:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PRAttachedAccessoryMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D57B8;
  v7[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)accessoryDisconnected:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PRAttachedAccessoryMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D5948;
  v7[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void **v21;
  void (**stateChangedHandler)(id, uint64_t, _QWORD, uint64_t);
  void *__p;
  char v24;
  void *v25[2];
  char v26;
  _BYTE buf[12];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void **v31;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", kACCProperties_Endpoint_NFC_Type));
  if (v15)
  {
    v16 = objc_opt_class(NSNumber, v14);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v17 = objc_msgSend(v15, "intValue");
      v18 = 4;
      switch(v17)
      {
        case 'B':
          v18 = 8;
          goto LABEL_16;
        case 'C':
          v18 = 6;
          goto LABEL_16;
        case 'D':
          v18 = 13;
          goto LABEL_16;
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'U':
          goto LABEL_8;
        case 'L':
          v18 = 5;
          goto LABEL_16;
        case 'M':
          v18 = 12;
          goto LABEL_16;
        case 'S':
          goto LABEL_16;
        case 'T':
          v18 = 11;
          goto LABEL_16;
        case 'V':
          v18 = 10;
          goto LABEL_16;
        case 'W':
          v18 = 7;
          goto LABEL_16;
        default:
          if (!v17)
            break;
          if (v17 == 57)
            v18 = 9;
          else
LABEL_8:
            v18 = 999;
LABEL_16:
          if (v13)
          {
            -[NSMutableSet addObject:](self->fConnectedACCAccessoryUUIDs, "addObject:", v13);
            sub_10000BF04(v25, (char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
            *(_QWORD *)buf = v25;
            *((_DWORD *)sub_1002D60B0((uint64_t)&self->fConnectedACCAccessoryTypes, (unsigned __int8 *)v25, (uint64_t)&unk_100472CF8, (__int128 **)buf)+ 10) = v18;
            v19 = (id)qword_10085D638;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = kACCEndpoint_TransportType_Strings[a4];
              sub_1003610EC(v18);
              v21 = v24 >= 0 ? &__p : (void **)__p;
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v12;
              v28 = 2080;
              v29 = v20;
              v30 = 2080;
              v31 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "regulatory,acc,Accessory attached: %@ type: %s, accessory_type: %s.", buf, 0x20u);
              if (v24 < 0)
                operator delete(__p);
            }

            stateChangedHandler = (void (**)(id, uint64_t, _QWORD, uint64_t))self->_stateChangedHandler;
            if (stateChangedHandler)
              stateChangedHandler[2](stateChangedHandler, 1, 0, v18);
            if (v26 < 0)
              operator delete(v25[0]);
          }
          break;
      }
    }
  }

}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void **v12;
  id stateChangedHandler;
  void *__p;
  char v15;
  void *v16[2];
  char v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void **v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](self->fConnectedACCAccessoryUUIDs, "member:", v4));
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      -[NSMutableSet removeObject:](self->fConnectedACCAccessoryUUIDs, "removeObject:", v4);
      v7 = objc_retainAutorelease(v4);
      sub_10000BF04(v16, (char *)objc_msgSend(v7, "UTF8String"));
      v8 = sub_100004578(&self->fConnectedACCAccessoryTypes.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)v16);
      if (v8)
      {
        v9 = *((unsigned int *)v8 + 10);
        sub_1002D63EC(&self->fConnectedACCAccessoryTypes.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v8);
      }
      else
      {
        v9 = 998;
      }
      v11 = (id)qword_10085D638;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        sub_1003610EC(v9);
        v12 = v15 >= 0 ? &__p : (void **)__p;
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        v20 = 2080;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "regulatory,acc,Accessory detached: UUID: %@, accessory_type: %s.", buf, 0x16u);
        if (v15 < 0)
          operator delete(__p);
      }

      stateChangedHandler = self->_stateChangedHandler;
      if (stateChangedHandler)
        (*((void (**)(id, _QWORD, _QWORD, uint64_t))stateChangedHandler + 2))(stateChangedHandler, 0, 0, v9);
      if (v17 < 0)
        operator delete(v16[0]);
    }
    else
    {
      v10 = qword_10085D638;
      if (os_log_type_enabled((os_log_t)qword_10085D638, OS_LOG_TYPE_ERROR))
        sub_1003E88D4((uint64_t)v4, v10);
    }
  }

}

- (id)stateChangedHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  sub_10003A4EC((uint64_t)&self->fConnectedACCAccessoryTypes);
  objc_storeStrong((id *)&self->fConnectedACCAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->fNotificationCenter, 0);
  objc_storeStrong((id *)&self->fAccessoryManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end
