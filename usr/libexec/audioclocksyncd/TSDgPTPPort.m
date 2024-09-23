@implementation TSDgPTPPort

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_generalInterestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (unsigned)_portNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PortNumber")));

  if (v3)
    v4 = (unsigned __int16)objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)_clockIdentifier
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockIdentifier")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (int)_portRole
{
  void *v2;
  void *v3;
  unsigned int v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PortRole")));

  if (v3)
  {
    v4 = objc_msgSend(v3, "intValue");
    if (v4 < 4)
      v5 = v4 + 1;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)gPTPPortWithService:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")) & 1) != 0)
  {
    v4 = off_10003C0F8;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")) & 1) != 0)
  {
    v4 = off_10003C120;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")) & 1) != 0)
  {
    v4 = off_10003C130;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")) & 1) != 0)
  {
    v4 = &off_10003C140;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")) & 1) != 0)
  {
    v4 = off_10003C118;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")) & 1) != 0)
  {
    v4 = off_10003C128;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")) & 1) != 0)
  {
    v4 = off_10003C138;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")) & 1) != 0)
  {
    v4 = off_10003C100;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncNetworkPort")) & 1) != 0)
  {
    v4 = off_10003C108;
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
    {
      v5 = 0;
      goto LABEL_22;
    }
    v4 = off_10003C110;
  }
  v5 = objc_msgSend(objc_alloc(*v4), "initWithService:", v3);
LABEL_22:

  return v5;
}

- (TSDgPTPPort)initWithService:(id)a3 pid:(int)a4
{
  id v6;
  TSDgPTPPort *v7;
  id v8;
  IOKNotificationPort *v9;
  IOKNotificationPort *notificationPort;
  IOKNotificationPort *v11;
  IOKService *service;
  uint64_t v13;
  IOKInterestNotification *generalInterestNotification;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TSDgPTPPort;
  v7 = -[TSDgPTPPort init](&v19, "init");
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_storeStrong((id *)&v7->_service, a3);
    if (v7->_service)
    {
      v7->_portNumber = -[TSDgPTPPort _portNumber](v7, "_portNumber");
      v7->_clockIdentifier = -[TSDgPTPPort _clockIdentifier](v7, "_clockIdentifier");
      if (qword_100047C40 != -1)
        dispatch_once(&qword_100047C40, &stru_10003C630);
      if (qword_100047C38)
      {
        objc_storeStrong((id *)&v7->_propertyUpdateQueue, (id)qword_100047C38);
        v7->_portRole = -[TSDgPTPPort _portRole](v7, "_portRole");
        v8 = objc_alloc((Class)IOKNotificationPort);
        v9 = (IOKNotificationPort *)objc_msgSend(v8, "initOnDispatchQueue:", qword_100047C38);
        notificationPort = v7->_notificationPort;
        v7->_notificationPort = v9;

        v11 = v7->_notificationPort;
        if (v11)
        {
          service = v7->_service;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10000E5A4;
          v16[3] = &unk_10003C658;
          objc_copyWeak(&v17, &location);
          v13 = objc_claimAutoreleasedReturnValue(-[IOKService addInterestNotifcationOfType:usingNotificationPort:error:withHandler:](service, "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:", IOKGeneralInterest, v11, 0, v16));
          generalInterestNotification = v7->_generalInterestNotification;
          v7->_generalInterestNotification = (IOKInterestNotification *)v13;

          objc_destroyWeak(&v17);
          if (v7->_generalInterestNotification)
          {
LABEL_8:
            objc_destroyWeak(&location);
            goto LABEL_9;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v21 = "_generalInterestNotification != nil";
            v22 = 2048;
            v23 = 0;
            v24 = 2048;
            v25 = 0;
            v26 = 2080;
            v27 = "";
            v28 = 2080;
            v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
            v30 = 1024;
            v31 = 280;
            goto LABEL_18;
          }
LABEL_19:

          v7 = 0;
          goto LABEL_8;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316418;
        v21 = "_notificationPort != nil";
        v22 = 2048;
        v23 = 0;
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = "";
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 258;
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316418;
        v21 = "_sharedNotificationsQueue != nil";
        v22 = 2048;
        v23 = 0;
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = "";
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 251;
      }
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 136316418;
      v21 = "_service != nil";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
      v30 = 1024;
      v31 = 242;
    }
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_19;
  }
LABEL_9:

  return v7;
}

- (IOKService)service
{
  return self->_service;
}

- (TSDgPTPPort)initWithService:(id)a3
{
  return -[TSDgPTPPort initWithService:pid:](self, "initWithService:pid:", a3, 0);
}

+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];

  v5 = a5;
  v15[0] = CFSTR("IOProviderClass");
  v15[1] = CFSTR("IOPropertyMatch");
  v16[0] = a3;
  v13[0] = CFSTR("PortNumber");
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v5));
  v13[1] = CFSTR("ClockIdentifier");
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v16[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

  return v11;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return objc_msgSend(a1, "iokitMatchingDictionaryForPortClass:clockIdentifier:andPortNumber:", CFSTR("IOTimeSyncPort"), a3, a4);
}

- (TSDgPTPPort)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDgPTPPort init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Do not call %@"), v3);

  return 0;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:andPortNumber:", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "gPTPPortWithService:", v6));
  return v7;
}

- (void)updateProperties
{
  NSObject *v3;
  _QWORD block[6];
  unsigned int v5;

  v3 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E6D0;
  block[3] = &unk_10003C680;
  v5 = -[TSDgPTPPort _portRole](self, "_portRole");
  block[4] = self;
  block[5] = -[TSDgPTPPort _clockIdentifier](self, "_clockIdentifier");
  dispatch_async(v3, block);

}

- (BOOL)startAutomaticPropertyUpdates
{
  BOOL v2;

  v2 = self->_generalInterestNotification != 0;
  self->_updatePropertiesOnPropertyChange = 1;
  return v2;
}

- (BOOL)stopAutomaticPropertyUpdates
{
  self->_updatePropertiesOnPropertyChange = 0;
  dispatch_sync((dispatch_queue_t)qword_100047C38, &stru_10003C6A0);
  return 1;
}

- (int)portType
{
  return 0;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *propertyUpdateQueue;

  v4 = (OS_dispatch_queue *)a3;
  if (!v4)
    v4 = (OS_dispatch_queue *)(id)qword_100047C38;
  propertyUpdateQueue = self->_propertyUpdateQueue;
  self->_propertyUpdateQueue = v4;

}

- (void)finalizeNotifications
{
  IOKInterestNotification *generalInterestNotification;
  IOKNotificationPort *notificationPort;

  self->_updatePropertiesOnPropertyChange = 0;
  generalInterestNotification = self->_generalInterestNotification;
  self->_generalInterestNotification = 0;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0;

}

- (id)propertiesForXPC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "diagnosticInfoForService:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PortRole")));
  if (v6)
  {
    v7 = v6;
    switch(objc_msgSend(v6, "intValue"))
    {
      case 0u:
        v8 = 1;
        goto LABEL_8;
      case 1u:
        v8 = 2;
        goto LABEL_8;
      case 2u:
        v8 = 3;
        goto LABEL_8;
      case 3u:
        v8 = 4;
LABEL_8:
        v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));

        v7 = (void *)v9;
        break;
      default:
        break;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PortRole"));

  return v5;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ioClassName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("ClassName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodProperties"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("IOUserClientClass"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("IOGeneralInterest"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SourceMACAddress"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("DestinationMACAddress"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SourceIPAddress"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SourceIPMask"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("DestinationIPAddress"));
  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  void *v4;
  void *v5;
  __objc2_class *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:andPortNumber:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v4));

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = "service != nil";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
      v19 = 1024;
      v20 = 470;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    goto LABEL_24;
  }
  if (!objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")))
  {
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")))
    {
      v6 = TSDgPTPUnicastLinkLayerPtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")))
    {
      v6 = TSDgPTPUnicastLinkLayerEtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")))
    {
      v6 = TSDgPTPUnicastUDPv4PtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")))
    {
      v6 = TSDgPTPUnicastUDPv6PtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")))
    {
      v6 = TSDgPTPUnicastUDPv4EtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")))
    {
      v6 = TSDgPTPUnicastUDPv6EtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")))
    {
      v6 = TSDgPTPLocalClockPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
    {
      v6 = TSDgPTPPort;
      goto LABEL_20;
    }
LABEL_24:
    v7 = 0;
    goto LABEL_21;
  }
  v6 = TSDgPTPEthernetPort;
LABEL_20:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class diagnosticInfoForService:](v6, "diagnosticInfoForService:", v5));
LABEL_21:

  return v7;
}

- (id)getMetrics
{
  return -[TSDPortMetrics initWithPort:]([TSDPortMetrics alloc], "initWithPort:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort getMetrics](self, "getMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDelta:", v4));

  return v6;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (int)portRole
{
  return self->_portRole;
}

- (void)setPortRole:(int)a3
{
  self->_portRole = a3;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (IODConnection)connection
{
  return self->_connection;
}

@end
