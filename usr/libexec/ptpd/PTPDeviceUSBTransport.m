@implementation PTPDeviceUSBTransport

- (PTPDeviceUSBTransport)initWithDelegate:(id)a3
{
  id v4;
  PTPDeviceUSBTransport *v5;
  PTPDeviceUSBTransport *v6;
  NSMutableData *v7;
  NSMutableData *transactionData;
  NSMutableData *v9;
  NSMutableData *eventData;
  NSMutableArray *v11;
  NSMutableArray *eventArray;
  OS_dispatch_source *connectionTimer;
  dispatch_queue_t v14;
  OS_dispatch_queue *connectionTimerQueue;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *transportQueue;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PTPDeviceUSBTransport;
  v5 = -[PTPDeviceUSBTransport init](&v21, "init");
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    v5->_role = 0;
    objc_storeWeak(&v5->_delegate, v4);
    v6->_locationID = 0;
    v7 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0);
    transactionData = v6->_transactionData;
    v6->_transactionData = v7;

    v9 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0);
    eventData = v6->_eventData;
    v6->_eventData = v9;

    v11 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    eventArray = v6->_eventArray;
    v6->_eventArray = v11;

    v6->_writeBufferSize = dword_10005E438;
    v6->_readBufferSize = 0x4000;
    v6->_eventDataBuffer = 0;
    *(_OWORD *)&v6->_usbCore._notificationPort = 0u;
    *(_OWORD *)&v6->_writeDataRef = 0u;
    v6->_writeBuffer = 0;
    v6->_readBuffer = 0;
    v6->_sendEvents = 1;
    connectionTimer = v6->_connectionTimer;
    v6->_connectionTimer = 0;
    v6->_numberOfSendEventsTimedOut = 0;
    v6->_eventDataBufferSize = 196608;
    v6->_canceledTransactionID = -1;
    v6->_cancelLock._os_unfair_lock_opaque = 0;

    v14 = dispatch_queue_create("ptp.connectionTimer_queue", 0);
    connectionTimerQueue = v6->_connectionTimerQueue;
    v6->_connectionTimerQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("PTPDeviceUSBTransportQueue", v17);
    transportQueue = v6->_transportQueue;
    v6->_transportQueue = (OS_dispatch_queue *)v18;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PTPDeviceUSBTransport setDelegate:](self, "setDelegate:", 0);
  -[PTPDeviceUSBTransport waitForHostConnection:](self, "waitForHostConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PTPDeviceUSBTransport;
  -[PTPDeviceUSBTransport dealloc](&v3, "dealloc");
}

- (BOOL)startResponder
{
  __CFString *v3;
  void *v4;
  void *v5;
  os_log_t *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  BOOL v18;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  id v26;
  CFMutableDictionaryRef v27;
  CFMutableDictionaryRef v28;
  __CFDictionary *Mutable;
  __CFDictionary *v30;
  IONotificationPort *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  id v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __CFString *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  os_log_t v58;
  os_log_t *v59;
  __CFString *v60;
  NSObject *v61;
  __CFString *v62;
  id v63;
  __CFString *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  os_log_t v68;
  __CFString *v69;
  NSObject *v70;
  id v71;
  mach_port_t mainPort[2];
  _QWORD block[5];
  uint64_t v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  void *v78;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("---")));
  v6 = (os_log_t *)&_gICOSLog;
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v76 = -[__CFString UTF8String](v8, "UTF8String");
    v77 = 2114;
    v78 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (-[PTPDeviceUSBTransport role](self, "role"))
  {
    __ICOSLogCreate();
    v10 = CFSTR("<PTP>");
    if ((unint64_t)-[__CFString length](v10, "length") >= 0x15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

      v10 = (__CFString *)v12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Service Did Not Start\n")));
    v14 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v15 = objc_retainAutorelease(v10);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v76 = v17;
    v77 = 2114;
    v78 = v13;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_11:
    return 0;
  }
  if (self->_type != 1)
    return 0;
  __ICOSLogCreate();
  v20 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Service Starting")));
  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_retainAutorelease(v20);
    v25 = v23;
    v26 = -[__CFString UTF8String](v24, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v76 = v26;
    v77 = 2114;
    v78 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v74 = 0;
  vproc_swap_integer(0, 5, 0, &v74);
  if (v74)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005AAC;
    block[3] = &unk_100048750;
    block[4] = self;
    if (qword_10005E480 != -1)
      dispatch_once(&qword_10005E480, block);
  }
  *(_QWORD *)mainPort = 0;
  v27 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v27)
  {
    __ICOSLogCreate();
    v10 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v10, "length") >= 0x15)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18));
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByAppendingString:", CFSTR("..")));

      v10 = (__CFString *)v38;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Service Matching Failed")));
    v39 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
LABEL_34:
    v40 = objc_retainAutorelease(v10);
    v16 = v39;
    v41 = -[__CFString UTF8String](v40, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v76 = v41;
    v77 = 2114;
    v78 = v13;
    goto LABEL_10;
  }
  v28 = v27;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFRelease(v28);
    __ICOSLogCreate();
    v10 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v10, "length") >= 0x15)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByAppendingString:", CFSTR("..")));

      v10 = (__CFString *)v43;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Service PropDict Failed")));
    v39 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    goto LABEL_34;
  }
  v30 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("USBDeviceFunction"), CFSTR("PTP"));
  CFDictionarySetValue(v28, CFSTR("IOPropertyMatch"), v30);
  CFRelease(v30);
  if (IOMainPort(bootstrap_port, &mainPort[1]) || !mainPort[1])
  {
    __ICOSLogCreate();
    v44 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v44, "length") >= 0x15)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v44, "substringWithRange:", 0, 18));
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringByAppendingString:", CFSTR("..")));

      v44 = (__CFString *)v46;
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MainPort Alocation Failed\n")));
    v48 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_retainAutorelease(v44);
      v50 = v48;
      v51 = -[__CFString UTF8String](v49, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v76 = v51;
      v77 = 2114;
      v78 = v47;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    CFRelease(v28);
    return 0;
  }
  v31 = IONotificationPortCreate(mainPort[1]);
  self->_usbCore._notificationPort = v31;
  IONotificationPortSetDispatchQueue(v31, (dispatch_queue_t)self->_transportQueue);
  if (IOServiceAddMatchingNotification(self->_usbCore._notificationPort, "IOServicePublish", v28, (IOServiceMatchingCallback)sub_100005D94, self, mainPort))
  {
    __ICOSLogCreate();
    v10 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v10, "length") >= 0x15)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", CFSTR("..")));

      v10 = (__CFString *)v33;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Matching Notification Failed\n")));
    v34 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v35 = objc_retainAutorelease(v10);
    v16 = v34;
    v36 = -[__CFString UTF8String](v35, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v76 = v36;
    v77 = 2114;
    v78 = v13;
    goto LABEL_10;
  }
  v52 = IOIteratorNext(mainPort[0]);
  if ((_DWORD)v52)
  {
    v53 = v52;
    do
    {
      __ICOSLogCreate();
      v54 = CFSTR("<USB>");
      if ((unint64_t)-[__CFString length](v54, "length") >= 0x15)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v54, "substringWithRange:", 0, 18));
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingString:", CFSTR("..")));

        v54 = (__CFString *)v56;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Adding 0x%x] -->(IOMatchedOnLaunch) "), mainPort[0]));
      v58 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v59 = v6;
        v60 = objc_retainAutorelease(v54);
        v61 = v58;
        v62 = v60;
        v6 = v59;
        v63 = -[__CFString UTF8String](v62, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v76 = v63;
        v77 = 2114;
        v78 = v57;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      -[PTPDeviceUSBTransport deviceAdded:](self, "deviceAdded:", v53);
      v53 = IOIteratorNext(mainPort[0]);
    }
    while ((_DWORD)v53);
  }
  __ICOSLogCreate();
  v64 = CFSTR("<PTP>");
  if ((unint64_t)-[__CFString length](v64, "length") >= 0x15)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v64, "substringWithRange:", 0, 18));
    v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringByAppendingString:", CFSTR("..")));

    v64 = (__CFString *)v66;
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service Started")));
  v68 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v69 = objc_retainAutorelease(v64);
    v70 = v68;
    v71 = -[__CFString UTF8String](v69, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v76 = v71;
    v77 = 2114;
    v78 = v67;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v18 = 1;
  -[PTPDeviceUSBTransport setRole:](self, "setRole:", 1);
  return v18;
}

- (void)stop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  io_object_t notification;
  IONotificationPort *notificationPort;
  IOUSBDeviceInterfaceInterface **deviceInterfaceInterfaceRef;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  -[PTPDeviceUSBTransport waitForHostConnection:](self, "waitForHostConnection:", 0);
  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service Stopped")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v17 = -[__CFString UTF8String](v7, "UTF8String");
    v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (-[PTPDeviceUSBTransport role](self, "role") == 1)
  {
    -[PTPDeviceUSBTransport setRole:](self, "setRole:", 0);
    -[PTPDeviceUSBTransport setConnected:](self, "setConnected:", 0);
    notification = self->_usbCore._notification;
    if (notification)
    {
      IOObjectRelease(notification);
      self->_usbCore._notification = 0;
    }
    notificationPort = self->_usbCore._notificationPort;
    if (notificationPort)
    {
      IONotificationPortSetDispatchQueue(notificationPort, 0);
      self->_usbCore._notificationPort = 0;
    }
    deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
    if (deviceInterfaceInterfaceRef)
    {
      v15 = 0;
      *(_DWORD *)buf = 0;
      (*((void (**)(IOUSBDeviceInterfaceInterface **, uint8_t *, int *))*deviceInterfaceInterfaceRef + 36))(deviceInterfaceInterfaceRef, buf, &v15);
      if (*(_DWORD *)buf)
        -[PTPDeviceUSBTransport deactivate](self, "deactivate");
      (*((void (**)(IOUSBDeviceInterfaceInterface **, _QWORD))*self->_usbCore._deviceInterfaceInterfaceRef + 5))(self->_usbCore._deviceInterfaceInterfaceRef, 0);
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 3))(self->_usbCore._deviceInterfaceInterfaceRef);
      self->_usbCore._deviceInterfaceInterfaceRef = 0;
    }
  }
  v12 = sub_10000D990();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));

  if (v14)
    objc_msgSend(v13, "setDelegate:", 0);
  exit(0);
}

- (void)activate:(unsigned int)a3
{
  BOOL v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  NSObject *v47;
  id v48;
  int v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  NSObject *v56;
  id v57;
  int v58;
  id v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  NSObject *v66;
  id v67;
  SEL v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  void *v81;

  v77 = 0;
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, char *, uint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
        + 36))(self->_usbCore._deviceInterfaceInterfaceRef, (char *)&v77 + 4, &v77))
  {
    v4 = 0;
  }
  else
  {
    v4 = HIDWORD(v77) == 1;
  }
  if (v4)
  {
    __ICOSLogCreate();
    v5 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v5, "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

      v5 = (__CFString *)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ <activated> at %d speed"), v77));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v5);
      v11 = v9;
      v12 = -[__CFString UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v79 = v12;
      v80 = 2114;
      v81 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, _QWORD, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_readBufferSize, &self->_readDataRef))
  {
    __ICOSLogCreate();
    v13 = CFSTR("<USB>");
    v14 = v13;
    if ((unint64_t)-[__CFString length](v13, "length") >= 0x15)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->createData read(%8d)"), self->_readBufferSize));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    goto LABEL_15;
  }
  self->_readBuffer = (char *)IOUSBDeviceDataGetBytePtr(self->_readDataRef);
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, _QWORD, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_writeBufferSize, &self->_writeDataRef))
  {
    __ICOSLogCreate();
    v25 = CFSTR("<USB>");
    v26 = v25;
    if ((unint64_t)-[__CFString length](v25, "length") >= 0x15)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v25, "substringWithRange:", 0, 18));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->createData write(%8d)"), self->_writeBufferSize));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_1000307C8();

    dword_10005E438 = 0x100000;
    self->_writeBufferSize = 0x100000;
    __ICOSLogCreate();
    v29 = v25;
    v30 = v29;
    if ((unint64_t)-[__CFString length](v29, "length") >= 0x15)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v29, "substringWithRange:", 0, 18));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting smaller allocation... %d"), 0x100000));
    v33 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_retainAutorelease(v30);
      v35 = v33;
      v36 = -[__CFString UTF8String](v34, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v79 = v36;
      v80 = 2114;
      v81 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, _QWORD, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
          + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_writeBufferSize, &self->_writeDataRef))
    {
      __ICOSLogCreate();
      v13 = v29;
      v14 = v13;
      if ((unint64_t)-[__CFString length](v13, "length") >= 0x15)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByAppendingString:", CFSTR("..")));

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->createData write(%8d)"), self->_writeBufferSize));
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  self->_writeBuffer = (char *)IOUSBDeviceDataGetBytePtr(self->_writeDataRef);
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, _QWORD, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, -[PTPDeviceUSBTransport eventDataBufferSize](self, "eventDataBufferSize"), &self->_eventDataRef))
  {
    __ICOSLogCreate();
    v13 = CFSTR("<USB>");
    v14 = v13;
    if ((unint64_t)-[__CFString length](v13, "length") >= 0x15)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->createData event(%8d)"), -[PTPDeviceUSBTransport eventDataBufferSize](self, "eventDataBufferSize")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    goto LABEL_15;
  }
  -[PTPDeviceUSBTransport setEventDataBuffer:](self, "setEventDataBuffer:", IOUSBDeviceDataGetBytePtr(self->_eventDataRef));
  v39 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn, &self->_maxPacketSizeBulkIn);
  __ICOSLogCreate();
  v13 = CFSTR("<USB>");
  v40 = -[__CFString length](v13, "length");
  if (v39)
  {
    v14 = v13;
    if ((unint64_t)v40 >= 0x15)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->getPipeCurrentMaxPacketSize [Bulk-IN]")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    goto LABEL_15;
  }
  v42 = v13;
  if ((unint64_t)v40 >= 0x15)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingString:", CFSTR("..")));

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeBulkIn: %d\n"), self->_maxPacketSizeBulkIn));
  v45 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v46 = objc_retainAutorelease(v42);
    v47 = v45;
    v48 = -[__CFString UTF8String](v46, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v79 = v48;
    v80 = 2114;
    v81 = v44;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v49 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut, &self->_maxPacketSizeBulkOut);
  __ICOSLogCreate();
  if (v49)
  {
    v13 = v13;
    v14 = v13;
    if ((unint64_t)-[__CFString length](v13, "length") >= 0x15)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->getPipeCurrentMaxPacketSize [Bulk-OUT]")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    goto LABEL_15;
  }
  v51 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingString:", CFSTR("..")));

  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeBulkOut: %d\n"), self->_maxPacketSizeBulkOut));
  v54 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v55 = objc_retainAutorelease(v51);
    v56 = v54;
    v57 = -[__CFString UTF8String](v55, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v79 = v57;
    v80 = 2114;
    v81 = v53;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v58 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn, &self->_maxPacketSizeInterruptIn);
  __ICOSLogCreate();
  v13 = v13;
  v59 = -[__CFString length](v13, "length");
  if (v58)
  {
    v14 = v13;
    if ((unint64_t)v59 >= 0x15)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifIfRef->getPipeCurrentMaxPacketSize [Interrupt-IN]")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
LABEL_15:
    sub_1000307C8();
LABEL_16:

LABEL_17:
    __ICOSLogCreate();
    v17 = v13;
    if ((unint64_t)-[__CFString length](v17, "length") >= 0x15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v17, "substringWithRange:", 0, 18));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("..")));

      v17 = (__CFString *)v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ <activate> Failed, waiting: %2ds for reactivation before exiting"), 15));
    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v17);
      v22 = v21;
      v23 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v79 = v23;
      v80 = 2114;
      v81 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v24 = 1;
    goto LABEL_22;
  }
  v61 = v13;
  if ((unint64_t)v59 >= 0x15)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18));
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "stringByAppendingString:", CFSTR("..")));

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeInterruptIn: %d\n"), self->_maxPacketSizeInterruptIn));
  v64 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_retainAutorelease(v61);
    v66 = v64;
    v67 = -[__CFString UTF8String](v65, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v79 = v67;
    v80 = 2114;
    v81 = v63;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[PTPDeviceUSBTransport setConnected:](self, "setConnected:", 1);
  self->_sendEvents = 1;
  self->_numberOfSendEventsTimedOut = 0;
  v68 = NSSelectorFromString(CFSTR("transportActivated"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
  v70 = objc_opt_respondsToSelector(v69, v68);

  if ((v70 & 1) != 0)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
    objc_msgSend(v71, "performSelector:", v68);

  }
  if (-[PTPDeviceUSBTransport readBulkData](self, "readBulkData"))
    goto LABEL_17;
  __ICOSLogCreate();
  v17 = v13;
  if ((unint64_t)-[__CFString length](v17, "length") >= 0x15)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v17, "substringWithRange:", 0, 18));
    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stringByAppendingString:", CFSTR("..")));

    v17 = (__CFString *)v73;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ <activate> Connected")));
  v74 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v17);
    v75 = v74;
    v76 = -[__CFString UTF8String](v17, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v79 = v76;
    v80 = 2114;
    v81 = v20;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v24 = 0;
LABEL_22:

  -[PTPDeviceUSBTransport waitForHostConnection:](self, "waitForHostConnection:", v24);
}

- (void)deactivate
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  __IOUSBDeviceData *readDataRef;
  __IOUSBDeviceData *writeDataRef;
  __IOUSBDeviceData *eventDataRef;
  SEL v26;
  void *v27;
  char v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  int v37;
  id v38;
  __int16 v39;
  void *v40;

  if (-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    -[PTPDeviceUSBTransport setConnected:](self, "setConnected:", 0);
    self->_busy = 0;
    objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:", self);
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut))
    {
      __ICOSLogCreate();
      v3 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ifIfRef->abortPipe [Bulk-OUT]\n")));
      v6 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_retainAutorelease(v3);
        v8 = v6;
        v37 = 136446466;
        v38 = -[__CFString UTF8String](v7, "UTF8String");
        v39 = 2114;
        v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);

      }
    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn))
    {
      __ICOSLogCreate();
      v9 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ifIfRef->abortPipe [Bulk-IN]\n")));
      v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v9);
        v14 = v12;
        v15 = -[__CFString UTF8String](v13, "UTF8String");
        v37 = 136446466;
        v38 = v15;
        v39 = 2114;
        v40 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);

      }
    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn))
    {
      __ICOSLogCreate();
      v16 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ifIfRef->abortPipe [Interrupt-IN]\n")));
      v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_retainAutorelease(v16);
        v21 = v19;
        v22 = -[__CFString UTF8String](v20, "UTF8String");
        v37 = 136446466;
        v38 = v22;
        v39 = 2114;
        v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);

      }
    }
    readDataRef = self->_readDataRef;
    if (readDataRef)
    {
      CFRelease(readDataRef);
      self->_readDataRef = 0;
    }
    writeDataRef = self->_writeDataRef;
    if (writeDataRef)
    {
      CFRelease(writeDataRef);
      self->_writeDataRef = 0;
    }
    -[NSMutableArray removeAllObjects](self->_eventArray, "removeAllObjects");
    eventDataRef = self->_eventDataRef;
    if (eventDataRef)
    {
      CFRelease(eventDataRef);
      self->_eventDataRef = 0;
    }
    v26 = NSSelectorFromString(CFSTR("transportDeactivated"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
    v28 = objc_opt_respondsToSelector(v27, v26);

    if ((v28 & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
      objc_msgSend(v29, "performSelector:", v26);

    }
    __ICOSLogCreate();
    v30 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Interface Deactivated\n")));
    v33 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_retainAutorelease(v30);
      v35 = v33;
      v36 = -[__CFString UTF8String](v34, "UTF8String");
      v37 = 136446466;
      v38 = v36;
      v39 = 2114;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);

    }
  }
}

- (void)waitForHostConnection:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PTPDeviceUSBTransport *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v5 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport connectionTimerQueue](self, "connectionTimerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000073E4;
  v7[3] = &unk_100048778;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<PTPDeviceUSBTransport 0x%lx>\n  {\n    _locationID = %u\n  }"), self, self->_locationID);
}

- (BOOL)sendCancel:(id)a3
{
  return 0;
}

- (BOOL)sendRequest:(id)a3 needsData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  -[PTPDeviceUSBTransport setDelegateNeedsData:](self, "setDelegateNeedsData:", v4);
  -[PTPDeviceUSBTransport setDelegateNeedsResponse:](self, "setDelegateNeedsResponse:", 1);
  if (-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentForUSBUsingBuffer:capacity:", self->_writeBuffer, self->_writeBufferSize));
    v8 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v7);

    v9 = v8 == 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)sendDataPackets:(id)a3
{
  id v4;
  id v5;
  PTPWrappedBytes *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  SEL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  char v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", self->_writeBuffer, self->_writeBufferSize);
  v40 = v4;
  objc_msgSend(v4, "range");
  v39 = v7;
  v8 = -[PTPDeviceUSBTransport transactionCanceled:](self, "transactionCanceled:", v5) == 0;
  v9 = 0;
  if (-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    v10 = -536870212;
    while (1)
    {
      if ((_DWORD)v5 && !v8)
        goto LABEL_26;
      v11 = objc_msgSend(v40, "copyToWrappedBytes:forTransport:", v6, 1);
      v12 = -[PTPWrappedBytes length](v6, "length");
      if (v12 != (id)self->_writeBufferSize)
        break;
      v13 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v6);
      if (v13)
        goto LABEL_25;
      v9 += (uint64_t)v11;
      __ICOSLogCreate();
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- [%8lld] of [%8lld]\n"), v9, v39));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));

      if (__ICLogTypeEnabled(4))
      {
        v16 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v8 = -[PTPDeviceUSBTransport transactionCanceled:](self, "transactionCanceled:", v5) == 0;
      v10 = 0;
      v17 = 0;
      if (!-[PTPDeviceUSBTransport connected](self, "connected"))
        goto LABEL_13;
    }
    v19 = (uint64_t)v12;
    if (v12)
    {
      v13 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v6);
      if (v13)
      {
LABEL_25:
        v17 = v13;
        if (v8)
          goto LABEL_14;
        goto LABEL_26;
      }
      v9 += (uint64_t)v11;
      __ICOSLogCreate();
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- [%8lld] of [%8lld]\n"), v9, v39));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v20));

      if (__ICLogTypeEnabled(4))
      {
        v22 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v10 = 0;
    }
    v17 = v10;
    if (v19 % self->_maxPacketSizeBulkIn)
      goto LABEL_22;
    -[PTPWrappedBytes setLength:](v6, "setLength:", 0);
    v13 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v6);
    if (!v13)
    {
      __ICOSLogCreate();
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Z [%8lld] of [%8lld]\n"), v9, v39));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v36));

      if (__ICLogTypeEnabled(4))
      {
        v38 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v17 = 0;
LABEL_22:
      objc_msgSend(v40, "setBytesTransferred:", v9);
      if (v8)
        goto LABEL_14;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v17 = -536870212;
LABEL_13:
  if (!v8)
  {
LABEL_26:
    -[PTPWrappedBytes setLength:](v6, "setLength:", 0);
    v17 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v6);
    v18 = 1;
    goto LABEL_27;
  }
LABEL_14:
  v18 = 0;
LABEL_27:
  v23 = NSSelectorFromString(CFSTR("sentData:responseCode:"));
  v24 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
    v27 = objc_opt_respondsToSelector(v26, v23);

    if ((v27 & 1) != 0)
    {
      if (v9 == v39)
        v28 = v18;
      else
        v28 = 1;
      if ((v28 & 1) != 0)
      {
        if (v17 == -536870186)
        {
          __ICOSLogCreate();
          v29 = &stru_100048E60;
          if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR("..")));

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[TERM] No device to read BulkIn - Do Not Send Response \n")));
          v32 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v29 = objc_retainAutorelease(v29);
            v33 = v32;
            v34 = -[__CFString UTF8String](v29, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v42 = v34;
            v43 = 2114;
            v44 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          goto LABEL_41;
        }
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
        v35 = 8199;
      }
      else
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
        v35 = 8193;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v35));
      -[__CFString performSelector:withObject:withObject:](v29, "performSelector:withObject:withObject:", v23, v40, v31);
LABEL_41:

    }
  }
  self->_busy = 0;

}

- (unsigned)transactionCanceled:(unsigned int)a3
{
  os_unfair_lock_s *p_cancelLock;
  unsigned int canceledTransactionID;

  p_cancelLock = &self->_cancelLock;
  os_unfair_lock_lock(&self->_cancelLock);
  canceledTransactionID = self->_canceledTransactionID;
  if (canceledTransactionID == -1)
    canceledTransactionID = 0;
  else
    self->_canceledTransactionID = -1;
  os_unfair_lock_unlock(p_cancelLock);
  return canceledTransactionID;
}

- (void)sendDataPacketsSplit:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  PTPWrappedBytes *v9;
  BOOL v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  PTPWrappedBytes *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  BOOL v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  __CFString *v39;
  SEL v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  char v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v58 = v4;
  objc_msgSend(v4, "range");
  v57 = v6;
  v7 = -[PTPDeviceUSBTransport transactionCanceled:](self, "transactionCanceled:", v5);
  v8 = -[PTPDeviceUSBTransport connected](self, "connected");
  v9 = 0;
  v10 = v7 != 0;
  if (v7)
    v11 = (_DWORD)v5 != 0;
  else
    v11 = 0;
  if (v8
    && !v11
    && (v9 = -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", self->_writeBuffer, self->_writeBufferSize), objc_msgSend(v58, "copyHeaderToWrappedBytes:forTransport:", v9, 1), (v12 = -[PTPWrappedBytes length](v9, "length")) != 0))
  {
    v13 = v12;
    v14 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v9);
    if (v14)
    {
      v15 = v14;
    }
    else
    {
      __ICOSLogCreate();
      v33 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MTP Header: [%8lld] of [%8lld]\n"), v13, 12));
      v36 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v35;
        v37 = objc_retainAutorelease(v33);
        v38 = v36;
        v39 = v37;
        v35 = v56;
        *(_DWORD *)buf = 136446466;
        v60 = -[__CFString UTF8String](v39, "UTF8String");
        v61 = 2114;
        v62 = v56;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      objc_msgSend(v58, "setBytesTransferred:", v13);
      v15 = 0;
    }
  }
  else
  {
    v15 = -536870212;
  }
  v16 = -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", self->_writeBuffer, self->_writeBufferSize);

  v17 = 0;
  if (-[PTPDeviceUSBTransport connected](self, "connected") && !v11)
  {
    while (1)
    {
      v18 = v17
          ? objc_msgSend(v58, "copyToWrappedBytes:forTransport:", v16, 1)
          : objc_msgSend(v58, "copyDataToWrappedBytes:forTransport:fromOffset:", v16, 1, 0);
      v19 = v18;
      v20 = -[PTPWrappedBytes length](v16, "length");
      if (v20 != (id)self->_writeBufferSize)
        break;
      v21 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v16);
      if (v21)
        goto LABEL_41;
      v17 += (uint64_t)v19;
      __ICOSLogCreate();
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- [%8lld] of [%8lld]\n"), v17, v57));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v22));

      if (__ICLogTypeEnabled(4))
      {
        v24 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v25 = -[PTPDeviceUSBTransport transactionCanceled:](self, "transactionCanceled:", v5);
      v26 = -[PTPDeviceUSBTransport connected](self, "connected");
      v15 = 0;
      v10 = v25 != 0;
      if (v25)
        v27 = (_DWORD)v5 != 0;
      else
        v27 = 0;
      if (!v26 || v27)
        goto LABEL_24;
    }
    v29 = (uint64_t)v20;
    if (v20)
    {
      v21 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v16);
      if (v21)
      {
LABEL_41:
        v15 = v21;
        if (v10)
          goto LABEL_25;
        goto LABEL_42;
      }
      v17 += (uint64_t)v19;
      __ICOSLogCreate();
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- [%8lld] of [%8lld]\n"), v17, v57));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v30));

      if (__ICLogTypeEnabled(4))
      {
        v32 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v15 = 0;
    }
    if (v29 % self->_maxPacketSizeBulkIn)
      goto LABEL_33;
    -[PTPWrappedBytes setLength:](v16, "setLength:", 0);
    v21 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v16);
    if (!v21)
    {
      __ICOSLogCreate();
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Z [%8lld] of [%8lld]\n"), v17, v57));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v53));

      if (__ICLogTypeEnabled(4))
      {
        v55 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v15 = 0;
LABEL_33:
      objc_msgSend(v58, "setBytesTransferred:", v17);
      if (v10)
        goto LABEL_25;
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_24:
  if (!v10)
  {
LABEL_42:
    v28 = 0;
    goto LABEL_43;
  }
LABEL_25:
  -[PTPWrappedBytes setLength:](v16, "setLength:", 0);
  v15 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v16);
  v28 = 1;
LABEL_43:
  v40 = NSSelectorFromString(CFSTR("sentData:responseCode:"));
  v41 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
  if (v41)
  {
    v42 = (void *)v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
    v44 = objc_opt_respondsToSelector(v43, v40);

    if ((v44 & 1) != 0)
    {
      if (v17 == v57)
        v45 = v28;
      else
        v45 = 1;
      if ((v45 & 1) != 0)
      {
        if (v15 == -536870186)
        {
          __ICOSLogCreate();
          v46 = &stru_100048E60;
          if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringByAppendingString:", CFSTR("..")));

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[TERM] No device to read BulkIn - Do Not Send Response \n")));
          v49 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v46 = objc_retainAutorelease(v46);
            v50 = v49;
            v51 = -[__CFString UTF8String](v46, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v60 = v51;
            v61 = 2114;
            v62 = v48;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          goto LABEL_57;
        }
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
        v52 = 8199;
      }
      else
      {
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
        v52 = 8193;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v52));
      -[__CFString performSelector:withObject:withObject:](v46, "performSelector:withObject:withObject:", v40, v58, v48);
LABEL_57:

    }
  }
  self->_busy = 0;

}

- (void)sendData:(id)a3
{
  id v4;
  OS_dispatch_queue *transportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  transportQueue = self->_transportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008784;
  v7[3] = &unk_100048778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)transportQueue, v7);

}

- (BOOL)sendResponse:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  if (-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentForUSBUsingBuffer:capacity:", self->_writeBuffer, self->_writeBufferSize));
    v6 = -[PTPDeviceUSBTransport writeBulkData:](self, "writeBulkData:", v5);

  }
  else
  {
    v6 = -536870212;
  }
  if (objc_msgSend(v4, "responseCode") != 8193)
  {
    __ICOSLogCreate();
    v7 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%4x]"), objc_msgSend(v4, "responseCode")));
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v15 = -[__CFString UTF8String](v11, "UTF8String");
      v16 = 2114;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

  return v6 == 0;
}

- (BOOL)sendEvent:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  unint64_t v7;
  NSMutableArray *eventArray;
  BOOL v9;
  void *v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  if (!-[PTPDeviceUSBTransport connected](self, "connected") || !self->_sendEvents)
  {
    __ICOSLogCreate();
    v6 = CFSTR("Event Queue");
    if ((unint64_t)objc_msgSend(CFSTR("Event Queue"), "length") >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Event Queue"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = -[PTPDeviceUSBTransport connected](self, "connected");
    v12 = "NO";
    if (v11)
      v13 = "YES";
    else
      v13 = "NO";
    if (self->_sendEvents)
      v12 = "YES";
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connected: %s Can Send Events: %s \n"), v13, v12));
    v15 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v16 = objc_retainAutorelease(v6);
    v17 = v15;
    *(_DWORD *)buf = 136446466;
    v24 = -[__CFString UTF8String](v16, "UTF8String");
    v25 = 2114;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_16:

LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v5 = sub_100021598((int)objc_msgSend(v4, "eventCode"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (unint64_t)-[NSMutableArray count](self->_eventArray, "count");
  eventArray = self->_eventArray;
  if (!eventArray || v7 >> 4 > 0xC34)
  {
    __ICOSLogCreate();
    v14 = CFSTR("Event Queue");
    if ((unint64_t)objc_msgSend(CFSTR("Event Queue"), "length") >= 0x15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Event Queue"), "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

    }
    v6 = objc_retainAutorelease(v6);
    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current Queue[%d] - Dropping %s\n"), v7, -[__CFString UTF8String](v6, "UTF8String")));
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v14);
      v22 = v20;
      *(_DWORD *)buf = 136446466;
      v24 = -[__CFString UTF8String](v21, "UTF8String");
      v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    goto LABEL_16;
  }
  -[NSMutableArray addObject:](eventArray, "addObject:", v4);
  if (v7)
    v9 = 1;
  else
    v9 = -[PTPDeviceUSBTransport sendNextEvent](self, "sendNextEvent");
LABEL_18:

  return v9;
}

- (void)cancelTransaction:(id)a3
{
  self->_canceledTransactionID = objc_msgSend(a3, "transactionID");
}

- (unsigned)deviceStatus
{
  return 0;
}

- (void)abortPendingIO
{
  IOUSBDeviceInterfaceInterface **deviceInterfaceInterfaceRef;

  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  if (deviceInterfaceInterfaceRef)
  {
    if (self->_interruptPipeIn)
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*deviceInterfaceInterfaceRef + 24))(deviceInterfaceInterfaceRef);
    if (self->_bulkPipeIn)
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 24))(self->_usbCore._deviceInterfaceInterfaceRef);
    if (self->_bulkPipeOut)
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 24))(self->_usbCore._deviceInterfaceInterfaceRef);
  }
}

- (int)writeBulkData:(id)a3
{
  int v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v14 = objc_msgSend(a3, "length");
  if (!-[PTPDeviceUSBTransport connected](self, "connected"))
    return -536870183;
  v4 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, __IOUSBDeviceData *, id *, uint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
        + 34))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn, self->_writeDataRef, &v14, 5000);
  v5 = v4;
  if (v4 == -536870186)
  {
    __ICOSLogCreate();
    v6 = CFSTR("USBDevice");
    if ((unint64_t)objc_msgSend(CFSTR("USBDevice"), "length") >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("USBDevice"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Write Timeout(Host Terminated) - Drain Write Queue")));
    v9 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
LABEL_12:
    v6 = objc_retainAutorelease(v6);
    v11 = v9;
    v12 = -[__CFString UTF8String](v6, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v16 = v12;
    v17 = 2114;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_13:
    return v5;
  }
  if (v4 == -536870208)
  {
    -[PTPDeviceUSBTransport setConnected:](self, "setConnected:", 0);
    __ICOSLogCreate();
    v6 = CFSTR("USBDevice");
    if ((unint64_t)objc_msgSend(CFSTR("USBDevice"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("USBDevice"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection Terminated")));
    v9 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    goto LABEL_12;
  }
  return v5;
}

- (int)writeInterruptData:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "length");
  if (-[PTPDeviceUSBTransport connected](self, "connected"))
    return (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, __IOUSBDeviceData *, id, void (*)(void *, uint64_t), PTPDeviceUSBTransport *))*self->_usbCore._deviceInterfaceInterfaceRef
            + 22))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn, self->_eventDataRef, v4, sub_1000091C8, self);
  else
    return -536870183;
}

- (void)handleWriteInterruptDataCompletion:(id)a3
{
  NSMutableArray *eventArray;
  id v5;
  id v6;
  unsigned int v7;
  unsigned int numberOfSendEventsTimedOut;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  eventArray = self->_eventArray;
  v5 = a3;
  v6 = -[NSMutableArray count](eventArray, "count");
  v7 = objc_msgSend(v5, "intValue");

  if (v7 == 1)
  {
    numberOfSendEventsTimedOut = self->_numberOfSendEventsTimedOut;
    if (numberOfSendEventsTimedOut > 1)
      self->_sendEvents = 0;
    else
      self->_numberOfSendEventsTimedOut = numberOfSendEventsTimedOut + 1;
    __ICOSLogCreate();
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current Number of Events Timed Out: [%d] "), self->_numberOfSendEventsTimedOut));
    v10 = __ICLogTypeEnabled(2);
    v11 = _gICOSLog;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      sub_100030840((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

  }
  if (v6)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_eventArray, "objectAtIndex:", 0));
    objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "checkInterruptWriteCompletion:", v18);
    -[NSMutableArray removeObjectAtIndex:](self->_eventArray, "removeObjectAtIndex:", 0);
    -[PTPDeviceUSBTransport sendNextEvent](self, "sendNextEvent");

  }
}

- (void)checkInterruptWriteCompletion:(id)a3
{
  -[PTPDeviceUSBTransport performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "abortInterruptWrite:", a3, 0);
}

- (void)abortInterruptWrite:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int numberOfSendEventsTimedOut;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  if (!-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    __ICOSLogCreate();
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Device Not Attached"), 3758097113));
    v8 = __ICLogTypeEnabled(2);
    v9 = _gICOSLog;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      sub_100030840((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_16;
  }
  if (-[NSMutableArray containsObject:](self->_eventArray, "containsObject:", v4))
  {
    v5 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn);
    numberOfSendEventsTimedOut = self->_numberOfSendEventsTimedOut;
    if (numberOfSendEventsTimedOut > 1)
      self->_sendEvents = 0;
    else
      self->_numberOfSendEventsTimedOut = numberOfSendEventsTimedOut + 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%x"), objc_msgSend(v4, "eventCode")));
    __ICOSLogCreate();
    v7 = v16;
    v17 = v7;
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 18));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("..")));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Events Timed Out: [%d]"), v5, self->_numberOfSendEventsTimedOut));
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v17);
      v22 = v20;
      *(_DWORD *)buf = 136446466;
      v24 = objc_msgSend(v21, "UTF8String");
      v25 = 2114;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
LABEL_16:

  }
}

- (BOOL)sendNextEvent
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  if (!-[PTPDeviceUSBTransport connected](self, "connected") || !-[NSMutableArray count](self->_eventArray, "count"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_eventArray, "objectAtIndex:", 0));
  v4 = sub_100021598((int)objc_msgSend(v3, "eventCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x]"), objc_msgSend(v3, "eventCode")));
  __ICOSLogCreate();
  v7 = v6;
  v8 = v7;
  if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 18));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<event> %@"), v5));
  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v8);
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    v19 = objc_msgSend(v12, "UTF8String");
    v20 = 2114;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentForUSBUsingBuffer:capacity:", -[PTPDeviceUSBTransport eventDataBuffer](self, "eventDataBuffer"), -[PTPDeviceUSBTransport eventDataBufferSize](self, "eventDataBufferSize")));
  v15 = -[PTPDeviceUSBTransport writeInterruptData:](self, "writeInterruptData:", v14);

  v16 = v15 == 0;
  if (!v15)
    -[PTPDeviceUSBTransport performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "checkInterruptWriteCompletion:", v3, 5.0);

  return v16;
}

- (int)readBulkData
{
  const char *v3;
  void *v4;
  NSObject *v5;
  int result;
  uint8_t buf[4];
  void *v8;

  if (!-[PTPDeviceUSBTransport connected](self, "connected"))
    return -536870183;
  __ICOSLogCreate();
  if (byte_10005E488)
    v3 = "YES";
  else
    v3 = "NO";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(_bulkPipeOut)->readPipeAsync - Read In Progress: %s \n"), v3));
  if (__ICLogTypeEnabled(4))
  {
    v5 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  if ((byte_10005E488 & 1) != 0)
    return -536870184;
  result = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, __IOUSBDeviceData *, _QWORD, void (*)(void *, int, uint64_t), PTPDeviceUSBTransport *))*self->_usbCore._deviceInterfaceInterfaceRef
            + 20))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut, self->_readDataRef, self->_readBufferSize, sub_100009A34, self);
  if (result == -536870208)
  {
    -[PTPDeviceUSBTransport setConnected:](self, "setConnected:", 0);
    return -536870208;
  }
  else if (!result)
  {
    byte_10005E488 = 1;
  }
  return result;
}

- (int)readInterruptData
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;

  if (!-[PTPDeviceUSBTransport connected](self, "connected"))
    return -536870183;
  __ICOSLogCreate();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(_interfacePipeIn)->readPipeAsync - Pend \n")));
  if (__ICLogTypeEnabled(4))
  {
    v3 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

  return 0;
}

- (BOOL)handleBulkData:(unint64_t)a3 result:(int)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  char *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  unsigned int *v22;
  uint64_t v23;
  id v24;
  __CFData *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  int v37;
  PTPOperationResponsePacket *v38;
  SEL v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  SEL v45;
  SEL v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  __CFString *v51;
  SEL v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  SEL v56;
  uint64_t v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  NSObject *v70;
  __CFString *v71;
  id v72;
  __CFData *v73;
  void *v74;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  NSObject *v81;
  id v82;
  _BOOL4 v83;
  unint64_t v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  void *v88;
  CFRange v89;
  CFRange v90;

  __ICOSLogCreate();
  v84 = a3;
  if (__ICLogTypeEnabled(4))
  {
    v6 = CFSTR("handleBulkData");
    if ((unint64_t)objc_msgSend(CFSTR("handleBulkData"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("handleBulkData"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received: [%8ld]b, Buffer Allocated: [%8ld]b\n"), a3, objc_msgSend(v8, "length")));

    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v6);
      v12 = v10;
      v13 = v11;
      a3 = v84;
      *(_DWORD *)buf = 136446466;
      v86 = -[__CFString UTF8String](v13, "UTF8String");
      v87 = 2114;
      v88 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v83 = -[PTPDeviceUSBTransport connected](self, "connected");
  if (v83)
  {
    if (a3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
      v15 = (char *)objc_msgSend(v14, "length");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
      objc_msgSend(v16, "increaseLengthBy:", a3);

      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData")));
      memcpy(&v15[(_QWORD)objc_msgSend(v17, "mutableBytes")], self->_readBuffer, a3);

      __ICOSLogCreate();
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Grew Buffer:     [%8lu]b\n"), a3));
      if (__ICLogTypeEnabled(4))
      {
        v19 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v86 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      v22 = 0;
      v23 = 0;
      do
      {
        if ((unint64_t)v21 >= 4)
        {
          do
          {
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData")));
            v22 = (unsigned int *)objc_msgSend(v24, "mutableBytes");

            v23 = *v22;
            if (v23 > 0xB)
              break;
            v25 = (__CFData *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
            v89.location = 0;
            v89.length = 4;
            CFDataDeleteBytes(v25, v89);

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
            v21 = objc_msgSend(v26, "length");

            __ICOSLogCreate();
            v27 = &stru_100048E60;
            if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("..")));

            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Illegal Length:   [%8lu]b, Adjusting Buffer: [%8lu]b\n"), a3, objc_msgSend(v29, "length")));

            v31 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_retainAutorelease(v27);
              v33 = v31;
              v34 = -[__CFString UTF8String](v32, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v86 = v34;
              v87 = 2114;
              v88 = v30;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
          }
          while ((unint64_t)v21 > 3);
        }
        __ICOSLogCreate();
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Length Received: [%8u]b, Buffer Allocated: [%8lu]b\n"), v23, v21));
        if (__ICLogTypeEnabled(4))
        {
          v36 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        if (v23 < 0xC || (unint64_t)v21 < v23)
          return v83;
        v37 = *((unsigned __int16 *)v22 + 2);
        switch(v37)
        {
          case 3:
            v52 = NSSelectorFromString(CFSTR("handleResponse:"));
            v38 = -[PTPOperationResponsePacket initWithUSBBuffer:]([PTPOperationResponsePacket alloc], "initWithUSBBuffer:", v22);
            if (!v38)
            {
              __ICOSLogCreate();
              v51 = &stru_100048E60;
              if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
              {
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
                v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringByAppendingString:", CFSTR("..")));

              }
              v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport received bad response!")));
              v67 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
LABEL_63:
                v69 = objc_retainAutorelease(v51);
                v70 = v67;
                v71 = v69;
                a3 = v84;
                v72 = -[__CFString UTF8String](v71, "UTF8String");
                *(_DWORD *)buf = 136446466;
                v86 = v72;
                v87 = 2114;
                v88 = v66;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

              }
LABEL_64:

              goto LABEL_65;
            }
            v53 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
            if (v53)
            {
              v51 = (__CFString *)v53;
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
              if ((objc_opt_respondsToSelector(v54, v52) & 1) == 0)
                goto LABEL_59;
              v55 = -[PTPDeviceUSBTransport delegateNeedsResponse](self, "delegateNeedsResponse");
              goto LABEL_46;
            }
            break;
          case 2:
            v38 = -[PTPDataPacket initWithUSBBuffer:]([PTPDataPacket alloc], "initWithUSBBuffer:", v22);
            if ((unint64_t)-[PTPOperationResponsePacket bufferSize](v38, "bufferSize") <= a3)
            {
              v56 = NSSelectorFromString(CFSTR("handleData:"));
              if (!v38)
              {
                __ICOSLogCreate();
                v51 = &stru_100048E60;
                if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
                {
                  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
                  v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringByAppendingString:", CFSTR("..")));

                }
                v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport received bad data!")));
                v67 = (void *)_gICOSLog;
                if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_63;
                goto LABEL_64;
              }
              v52 = v56;
              v57 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
              if (v57)
              {
                v51 = (__CFString *)v57;
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
                if ((objc_opt_respondsToSelector(v54, v52) & 1) == 0)
                {
LABEL_59:

                  goto LABEL_65;
                }
                v55 = -[PTPDeviceUSBTransport delegateNeedsData](self, "delegateNeedsData");
LABEL_46:
                v58 = v55;

                if (v58)
                {
                  v51 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
                  -[__CFString performSelector:withObject:](v51, "performSelector:withObject:", v52, v38);
                  goto LABEL_54;
                }
LABEL_48:
                a3 = v84;
              }
            }
            break;
          case 1:
            v38 = -[PTPOperationRequestPacket initWithUSBBuffer:]([PTPOperationRequestPacket alloc], "initWithUSBBuffer:", v22);
            v39 = NSSelectorFromString(CFSTR("holdPowerAssertion"));
            v40 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
            if (v40)
            {
              v41 = (void *)v40;
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
              v43 = objc_opt_respondsToSelector(v42, v39);

              if ((v43 & 1) != 0)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
                objc_msgSend(v44, "performSelector:withObject:", v39, 0);

              }
            }
            v45 = NSSelectorFromString(CFSTR("handleRequest:"));
            if (!v38)
            {
              __ICOSLogCreate();
              v51 = &stru_100048E60;
              if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
                v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringByAppendingString:", CFSTR("..")));

              }
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport received bad request!\n")));
              v61 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                v62 = objc_retainAutorelease(v51);
                v63 = v61;
                v64 = -[__CFString UTF8String](v62, "UTF8String");
                *(_DWORD *)buf = 136446466;
                v86 = v64;
                v87 = 2114;
                v88 = v60;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

              }
LABEL_54:
              a3 = v84;
LABEL_65:

              break;
            }
            v46 = v45;
            v47 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
            if (v47)
            {
              v48 = (void *)v47;
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
              v50 = objc_opt_respondsToSelector(v49, v46);

              if ((v50 & 1) != 0)
              {
                v51 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
                -[PTPDeviceUSBTransport setDelegateNeedsData:](self, "setDelegateNeedsData:", objc_msgSend(-[__CFString performSelector:withObject:](v51, "performSelector:withObject:", v46, v38), "BOOLValue"));
                goto LABEL_54;
              }
            }
            goto LABEL_48;
          default:
            __ICOSLogCreate();
            v76 = &stru_100048E60;
            if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
              v76 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "stringByAppendingString:", CFSTR("..")));

            }
            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport received unrecognizable packet!")));
            v79 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v80 = objc_retainAutorelease(v76);
              v81 = v79;
              v82 = -[__CFString UTF8String](v80, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v86 = v82;
              v87 = 2114;
              v88 = v78;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            exit(1);
        }

        v73 = (__CFData *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
        v90.location = 0;
        v90.length = (CFIndex)v21;
        CFDataDeleteBytes(v73, v90);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport transactionData](self, "transactionData"));
        v21 = objc_msgSend(v74, "length");

      }
      while (v21);
    }
  }
  return v83;
}

- (void)handleInterruptData:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  unsigned int *v9;
  unint64_t v10;
  SEL v11;
  PTPEventPacket *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __CFData *v18;
  void *v19;
  CFRange v20;

  if (-[PTPDeviceUSBTransport connected](self, "connected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport eventData](self, "eventData"));
    objc_msgSend(v5, "appendBytes:length:", -[PTPDeviceUSBTransport eventDataBuffer](self, "eventDataBuffer"), a3);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport eventData](self, "eventData"));
    v7 = objc_msgSend(v6, "length");

    while (v7)
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport eventData](self, "eventData")));
      v9 = (unsigned int *)objc_msgSend(v8, "mutableBytes");

      v10 = *v9;
      if ((unint64_t)v7 < v10)
        break;
      if (*((_WORD *)v9 + 2) == 4)
      {
        v11 = NSSelectorFromString(CFSTR("handleEvent:"));
        v12 = -[PTPEventPacket initWithUSBBuffer:]([PTPEventPacket alloc], "initWithUSBBuffer:", v9);
        v13 = objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
          v16 = objc_opt_respondsToSelector(v15, v11);

          if ((v16 & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport delegate](self, "delegate"));
            objc_msgSend(v17, "performSelector:withObject:afterDelay:", v11, v12, 0.0);

          }
        }

      }
      v18 = (__CFData *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport eventData](self, "eventData"));
      v20.location = 0;
      v20.length = v10;
      CFDataDeleteBytes(v18, v20);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceUSBTransport eventData](self, "eventData"));
      v7 = objc_msgSend(v19, "length");

    }
  }
}

- (void)deviceAdded:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000AAAC;
  v3[3] = &unk_1000487A0;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (BOOL)processDeviceInterface:(unsigned int)a3
{
  void (__cdecl **v3)(CFMutableDataRef, CFRange);
  os_log_t *v4;
  uint64_t v5;
  PTPDeviceUSBTransport *v6;
  uint64_t v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  uint64_t v10;
  uint64_t v11;
  IOCFPlugInInterface **v12;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v14;
  CFUUIDBytes v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  uint64_t v22;
  os_log_t v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  os_log_t v31;
  PTPDeviceUSBTransport *v32;
  void (__cdecl **v33)(CFMutableDataRef, CFRange);
  uint64_t v34;
  os_log_t *v35;
  __CFString *v36;
  NSObject *v37;
  __CFString *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  void (__cdecl **v44)(CFMutableDataRef, CFRange);
  int v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  IOCFPlugInInterface **v50;
  __CFString *v51;
  id v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  PTPDeviceUSBCore *p_usbCore;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;

  theInterface = 0;
  theScore = 0;
  v3 = &CFDataDeleteBytes_ptr;
  v4 = (os_log_t *)&_gICOSLog;
  if (!a3)
  {
    __ICOSLogCreate();
    v46 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v46, "length") >= 0x15)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v46, "substringWithRange:", 0, 18));
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringByAppendingString:", CFSTR("..")));

      v46 = (__CFString *)v48;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ processDeviceInterface did not find service")));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_1000307C8();

    return 1;
  }
  v5 = *(_QWORD *)&a3;
  v6 = self;
  p_usbCore = &self->_usbCore;
  v7 = 4;
  while (1)
  {
    -[PTPDeviceUSBTransport clearDeviceInterface](v6, "clearDeviceInterface");
    v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v10 = IOCreatePlugInInterfaceForService(v5, v8, v9, &theInterface, &theScore);
    v11 = v10;
    v12 = theInterface;
    if (theInterface)
    {
      if (!(_DWORD)v10)
        break;
    }
    __ICOSLogCreate();
    v16 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v16, "length") >= 0x15)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

      v16 = (__CFString *)v22;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[53], "stringWithFormat:", CFSTR("❌ IOCreatePlugInInterfaceForService failed")));
    v23 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
LABEL_28:
    v16 = objc_retainAutorelease(v16);
    v40 = v23;
    v41 = -[__CFString UTF8String](v16, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v65 = v41;
    v66 = 2114;
    v67 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);

LABEL_20:
    __ICOSLogCreate();
    v26 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v26, "length") >= 0x15)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

      v26 = (__CFString *)v28;
    }
    v29 = "YES";
    if (!theInterface)
      v29 = "NO";
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[53], "stringWithFormat:", CFSTR("❌ Retry[%u], kr = %d, pluginInterface = %s"), v7, v11, v29));
    v31 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v32 = v6;
      v33 = v3;
      v34 = v5;
      v35 = v4;
      v36 = objc_retainAutorelease(v26);
      v37 = v31;
      v38 = v36;
      v4 = v35;
      v5 = v34;
      v3 = v33;
      v6 = v32;
      v39 = -[__CFString UTF8String](v38, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v65 = v39;
      v66 = 2114;
      v67 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);

    }
    sleep(2u);
    v7 = (v7 - 1);
    if ((_DWORD)v7 == -1)
    {
      v44 = v3;
      v45 = 1;
      goto LABEL_35;
    }
  }
  QueryInterface = (*theInterface)->QueryInterface;
  v14 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  v15 = CFUUIDGetUUIDBytes(v14);
  v11 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, PTPDeviceUSBCore *))QueryInterface)(v12, *(_QWORD *)&v15.byte0, *(_QWORD *)&v15.byte8, p_usbCore);
  IODestroyPlugInInterface(theInterface);
  if (!p_usbCore->_deviceInterfaceInterfaceRef || (_DWORD)v11)
  {
    __ICOSLogCreate();
    v16 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v16, "length") >= 0x15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

      v16 = (__CFString *)v25;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[53], "stringWithFormat:", CFSTR("❌ QueryInterface failed")));
    v23 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    goto LABEL_28;
  }
  if (-[PTPDeviceUSBTransport setupDeviceInterface](v6, "setupDeviceInterface"))
  {
    __ICOSLogCreate();
    v16 = CFSTR("<USB>");
    if ((unint64_t)-[__CFString length](v16, "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      v16 = (__CFString *)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[53], "stringWithFormat:", CFSTR("❌ SetupDeviceInterface failed")));
    v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_retainAutorelease(v16);
      v42 = v20;
      v43 = -[__CFString UTF8String](v16, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v65 = v43;
      v66 = 2114;
      v67 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);

    }
    v11 = 0;
    goto LABEL_20;
  }
  v44 = v3;
  IOServiceAddInterestNotification(v6->_usbCore._notificationPort, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_10000B6B8, v6, &v6->_usbCore._notification);
  v45 = 0;
  v11 = 0;
LABEL_35:
  v50 = theInterface;
  __ICOSLogCreate();
  v51 = CFSTR("<USB>");
  v52 = -[__CFString length](v51, "length");
  if (v50)
  {
    if ((unint64_t)v52 >= 0x15)
    {
      v53 = v45;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v51, "substringWithRange:", 0, 18));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringByAppendingString:", CFSTR("..")));

      v45 = v53;
      v51 = (__CFString *)v55;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[53], "stringWithFormat:", CFSTR("✅ processDeviceInterface")));
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
  }
  else
  {
    if ((unint64_t)v52 >= 0x15)
    {
      v57 = v45;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v51, "substringWithRange:", 0, 18));
      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringByAppendingString:", CFSTR("..")));

      v45 = v57;
      v51 = (__CFString *)v59;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[53], "stringWithFormat:", CFSTR("❌ processDeviceInterface failed: %d"), v11));
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
LABEL_43:
      sub_1000307C8();
  }

  IOObjectRelease(v5);
  if (v45)
  {
    -[PTPDeviceUSBTransport clearDeviceInterface](v6, "clearDeviceInterface");
    return 0;
  }
  return 1;
}

- (int)setupDeviceInterface
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  int v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  IOUSBDeviceInterfaceInterface **deviceInterfaceInterfaceRef;
  uint64_t (*v41)(IOUSBDeviceInterfaceInterface **, id (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t), _QWORD, _QWORD, PTPDeviceUSBTransport *, PTPDeviceUSBTransport *, CFRunLoopRef, const CFRunLoopMode);
  CFRunLoopRef Current;
  int v43;
  void *v44;
  uint64_t v45;
  NSString *v46;
  IOUSBDeviceInterfaceInterface **v47;
  uint64_t (*v48)(IOUSBDeviceInterfaceInterface **, CFRunLoopRef, const CFRunLoopMode);
  CFRunLoopRef v49;
  int v50;
  void *v51;
  uint64_t v52;
  int v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  __CFString *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  __CFString *v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  void *v76;

  v72 = 0;
  -[PTPDeviceUSBTransport waitForHostConnection:](self, "waitForHostConnection:", 0);
  __ICOSLogCreate();
  v3 = CFSTR("<USB>");
  v4 = v3;
  if ((unint64_t)-[__CFString length](v3, "length") >= 0x15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("USBDeviceInterface Setup")));
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v4);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v74 = -[__CFString UTF8String](v8, "UTF8String");
    v75 = 2114;
    v76 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v10 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, _QWORD))*self->_usbCore._deviceInterfaceInterfaceRef
         + 4))(self->_usbCore._deviceInterfaceInterfaceRef, 0);
  if (v10)
  {
    v11 = v10;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->open")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v16 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, const __CFString *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 10))(self->_usbCore._deviceInterfaceInterfaceRef, CFSTR("PTP"));
  if (v16)
  {
    v11 = v16;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v18;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ iRef->setDescription\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v19 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, _QWORD))*self->_usbCore._deviceInterfaceInterfaceRef
         + 11))(self->_usbCore._deviceInterfaceInterfaceRef, 6, 0);
  if (v19)
  {
    v11 = v19;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v21;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->setClassForAlternateSetting\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v22 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, _QWORD))*self->_usbCore._deviceInterfaceInterfaceRef
         + 12))(self->_usbCore._deviceInterfaceInterfaceRef, 1, 0);
  if (v22)
  {
    v11 = v22;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v24;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->setSubClassForAlternateSetting\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v25 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, _QWORD))*self->_usbCore._deviceInterfaceInterfaceRef
         + 13))(self->_usbCore._deviceInterfaceInterfaceRef, 1, 0);
  if (v25)
  {
    v11 = v25;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v27;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->setProtocolForAlternateSetting\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v28 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 2, 0, 0xFFFFFFFFLL, 10, 0, 0, &self->_bulkPipeOut);
  if (v28)
  {
    v11 = v28;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v30;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->createPipe [Bulk-OUT]\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v31 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 2, 1, 0xFFFFFFFFLL, 10, 0, 0, &self->_bulkPipeIn);
  if (v31)
  {
    v11 = v31;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v33;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->createPipe [Bulk-IN]\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v34 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 3, 1, 0xFFFFFFFFLL, 10, 0, 0, &self->_interruptPipeIn);
  if (v34)
  {
    v11 = v34;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v36;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->createPipe [Interrupt-IN]\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v37 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, void (*)(void *, uint64_t, uint64_t), PTPDeviceUSBTransport *, PTPDeviceUSBTransport *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 9))(self->_usbCore._deviceInterfaceInterfaceRef, sub_10000C9C0, self, self);
  if (v37)
  {
    v11 = v37;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v39;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->setMessageCallback\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  v41 = (uint64_t (*)(IOUSBDeviceInterfaceInterface **, id (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t), _QWORD, _QWORD, PTPDeviceUSBTransport *, PTPDeviceUSBTransport *, CFRunLoopRef, const CFRunLoopMode))*((_QWORD *)*deviceInterfaceInterfaceRef + 8);
  Current = CFRunLoopGetCurrent();
  v43 = v41(deviceInterfaceInterfaceRef, sub_10000CE4C, 0, 0, self, self, Current, kCFRunLoopCommonModes);
  if (v43)
  {
    v11 = v43;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v45;
    }
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->setClassCommandCallbacksWithRunLoop: %p\n"), CFRunLoopGetCurrent());
    v15 = (void *)objc_claimAutoreleasedReturnValue(v46);
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v47 = self->_usbCore._deviceInterfaceInterfaceRef;
  v48 = (uint64_t (*)(IOUSBDeviceInterfaceInterface **, CFRunLoopRef, const CFRunLoopMode))*((_QWORD *)*v47 + 6);
  v49 = CFRunLoopGetCurrent();
  v50 = v48(v47, v49, kCFRunLoopCommonModes);
  if (v50)
  {
    v11 = v50;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v52;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->scheduleWithRunLoop\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_64;
  }
  v53 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 17))(self->_usbCore._deviceInterfaceInterfaceRef);
  if (v53)
  {
    v11 = v53;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v55;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->commitConfiguration\n")));
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      goto LABEL_76;
LABEL_64:
    sub_1000307C8();
LABEL_76:

    return v11;
  }
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, const __CFString *))*self->_usbCore._deviceInterfaceInterfaceRef
        + 28))(self->_usbCore._deviceInterfaceInterfaceRef, CFSTR("com.apple.usbptpd.demand")))
  {
    __ICOSLogCreate();
    v56 = v3;
    if ((unint64_t)-[__CFString length](v56, "length") >= 0x15)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v56, "substringWithRange:", 0, 18));
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringByAppendingString:", CFSTR("..")));

      v56 = (__CFString *)v58;
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ifRef->registerForDemandLaunch\n")));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_1000307C8();

  }
  v60 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, char *, uint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 36))(self->_usbCore._deviceInterfaceInterfaceRef, (char *)&v72 + 4, &v72);
  if (v60)
  {
    v11 = v60;
    __ICOSLogCreate();
    v12 = v3;
    if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
      v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringByAppendingString:", CFSTR("..")));

      v12 = (__CFString *)v62;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ <not active>")));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_1000307C8();
    goto LABEL_76;
  }
  if (HIDWORD(v72))
  {
    -[PTPDeviceUSBTransport activate:](self, "activate:", v72);
  }
  else
  {
    __ICOSLogCreate();
    v64 = v3;
    if ((unint64_t)-[__CFString length](v64, "length") >= 0x15)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v64, "substringWithRange:", 0, 18));
      v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringByAppendingString:", CFSTR("..")));

      v64 = (__CFString *)v66;
    }
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ <active> and waiting: %2ds for host connection"), 15));
    v68 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_retainAutorelease(v64);
      v70 = v68;
      v71 = -[__CFString UTF8String](v69, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v74 = v71;
      v75 = 2114;
      v76 = v67;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPDeviceUSBTransport waitForHostConnection:](self, "waitForHostConnection:", 1);
  }
  return 0;
}

- (void)clearDeviceInterface
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  IOUSBDeviceInterfaceInterface **deviceInterfaceInterfaceRef;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  __ICOSLogCreate();
  v3 = CFSTR("<USB>");
  if ((unint64_t)-[__CFString length](v3, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    v3 = (__CFString *)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("USBDeviceInterface Clear")));
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    v11 = 136446466;
    v12 = -[__CFString UTF8String](v8, "UTF8String");
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);

  }
  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  if (deviceInterfaceInterfaceRef)
  {
    (*((void (**)(IOUSBDeviceInterfaceInterface **, _QWORD))*deviceInterfaceInterfaceRef + 5))(deviceInterfaceInterfaceRef, 0);
    (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 3))(self->_usbCore._deviceInterfaceInterfaceRef);
    self->_usbCore._deviceInterfaceInterfaceRef = 0;
  }
}

- (int)handleDeviceRequest:(id *)a3 data:(__IOUSBDeviceData *)a4 dataSize:(unint64_t *)a5 status:(int *)a6
{
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  int var1;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  id v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  id v33;
  void *v35;
  __IOUSBDeviceData *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;

  __ICOSLogCreate();
  v11 = CFSTR("<USB>");
  if ((unint64_t)-[__CFString length](v11, "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v11, "substringWithRange:", 0, 18));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    v11 = (__CFString *)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport | Handle Service Device Request: 0x%x, Data: %p, Count: %llu\n"), a3->var1, a4, *a5));
  v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v11);
    v17 = v15;
    *(_DWORD *)buf = 136446466;
    v38 = -[__CFString UTF8String](v16, "UTF8String");
    v39 = 2114;
    v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  var1 = a3->var1;
  switch(var1)
  {
    case 'd':
      if (*a5 < 6)
        return 1;
      v36 = 0;
      if (!(*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 6, &v36))
      {
        *a4 = v36;
        *a6 = 0;
      }
      os_unfair_lock_lock(&self->_cancelLock);
      self->_canceledTransactionID = self->_transactionID;
      os_unfair_lock_unlock(&self->_cancelLock);
      __ICOSLogCreate();
      v26 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport | Canceled Transaction: %d\n"), self->_transactionID));
      v29 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      goto LABEL_29;
    case 'f':
      if (*a5)
        return 1;
      v36 = 0;
      if (!(*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 6, &v36))
      {
        *a4 = v36;
        *a6 = 0;
      }
      __ICOSLogCreate();
      v26 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR("..")));

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport | Device Reset: %d\n"), self->_transactionID));
      v29 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        v31 = objc_retainAutorelease(v26);
        v32 = v29;
        v33 = -[__CFString UTF8String](v31, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v38 = v33;
        v39 = 2114;
        v40 = v28;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
LABEL_29:

      return 1;
    case 'g':
      if (*a5 < 4
        || (v36 = 0,
            (*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 4, &v36)))
      {
        *a5 = 0;
        *a4 = 0;
        *a6 = -536870212;
        __ICOSLogCreate();
        v19 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport | Device Request Failed")));
        v22 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
      }
      else
      {
        *(_DWORD *)IOUSBDeviceDataGetBytePtr(v36) = 536936452;
        *a5 = 4;
        *a4 = v36;
        *a6 = 0;
        __ICOSLogCreate();
        v19 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR("..")));

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDeviceUSBTransport | Device Request Handled")));
        v22 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
      }
      v23 = objc_retainAutorelease(v19);
      v24 = v22;
      v25 = -[__CFString UTF8String](v23, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v38 = v25;
      v39 = 2114;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_14:
      return 1;
  }
  return 0;
}

- (PTPDeviceUSBCore)usbCore
{
  *retstr = *(PTPDeviceUSBCore *)&self->_notification;
  return self;
}

- (void)setUsbCore:(PTPDeviceUSBCore *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->_deviceInterfaceInterfaceRef;
  self->_usbCore._notificationPort = a3->_notificationPort;
  *(_OWORD *)&self->_usbCore._deviceInterfaceInterfaceRef = v3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (int)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int)a3
{
  self->_connectionStatus = a3;
}

- (NSMutableData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
  objc_storeStrong((id *)&self->_transactionData, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)delegateNeedsData
{
  return self->_delegateNeedsData;
}

- (void)setDelegateNeedsData:(BOOL)a3
{
  self->_delegateNeedsData = a3;
}

- (BOOL)delegateNeedsResponse
{
  return self->_delegateNeedsResponse;
}

- (void)setDelegateNeedsResponse:(BOOL)a3
{
  self->_delegateNeedsResponse = a3;
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unsigned int)a3
{
  self->_locationID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (NSString)usbSerialNumberString
{
  return self->_usbSerialNumberString;
}

- (void)setUsbSerialNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)bulkPipeIn
{
  return self->_bulkPipeIn;
}

- (void)setBulkPipeIn:(unint64_t)a3
{
  self->_bulkPipeIn = a3;
}

- (unint64_t)bulkPipeOut
{
  return self->_bulkPipeOut;
}

- (void)setBulkPipeOut:(unint64_t)a3
{
  self->_bulkPipeOut = a3;
}

- (unint64_t)interruptPipeIn
{
  return self->_interruptPipeIn;
}

- (void)setInterruptPipeIn:(unint64_t)a3
{
  self->_interruptPipeIn = a3;
}

- (int)maxPacketSizeBulkIn
{
  return self->_maxPacketSizeBulkIn;
}

- (void)setMaxPacketSizeBulkIn:(int)a3
{
  self->_maxPacketSizeBulkIn = a3;
}

- (int)maxPacketSizeBulkOut
{
  return self->_maxPacketSizeBulkOut;
}

- (void)setMaxPacketSizeBulkOut:(int)a3
{
  self->_maxPacketSizeBulkOut = a3;
}

- (int)maxPacketSizeInterruptIn
{
  return self->_maxPacketSizeInterruptIn;
}

- (void)setMaxPacketSizeInterruptIn:(int)a3
{
  self->_maxPacketSizeInterruptIn = a3;
}

- (BOOL)sendEvents
{
  return self->_sendEvents;
}

- (void)setSendEvents:(BOOL)a3
{
  self->_sendEvents = a3;
}

- (unsigned)numberOfSendEventsTimedOut
{
  return self->_numberOfSendEventsTimedOut;
}

- (void)setNumberOfSendEventsTimedOut:(unsigned int)a3
{
  self->_numberOfSendEventsTimedOut = a3;
}

- (unsigned)eventDataBufferSize
{
  return self->_eventDataBufferSize;
}

- (void)setEventDataBufferSize:(unsigned int)a3
{
  self->_eventDataBufferSize = a3;
}

- (char)eventDataBuffer
{
  return self->_eventDataBuffer;
}

- (void)setEventDataBuffer:(char *)a3
{
  self->_eventDataBuffer = a3;
}

- (NSMutableData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (NSMutableArray)eventArray
{
  return self->_eventArray;
}

- (void)setEventArray:(id)a3
{
  objc_storeStrong((id *)&self->_eventArray, a3);
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (void)setWriteBufferSize:(unsigned int)a3
{
  self->_writeBufferSize = a3;
}

- (char)writeBuffer
{
  return self->_writeBuffer;
}

- (void)setWriteBuffer:(char *)a3
{
  self->_writeBuffer = a3;
}

- (unsigned)readBufferSize
{
  return self->_readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_readBufferSize = a3;
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (OS_dispatch_source)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimer, a3);
}

- (OS_dispatch_queue)connectionTimerQueue
{
  return self->_connectionTimerQueue;
}

- (void)setConnectionTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimerQueue, a3);
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transportQueue, a3);
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_canceledTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_connectionTimerQueue, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_eventArray, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_usbSerialNumberString, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end
