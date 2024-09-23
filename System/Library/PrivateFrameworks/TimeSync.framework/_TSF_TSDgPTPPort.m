@implementation _TSF_TSDgPTPPort

+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5
{
  uint64_t v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v5 = a5;
  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("IOProviderClass");
  v16[1] = CFSTR("IOPropertyMatch");
  v17[0] = a3;
  v14[0] = CFSTR("PortNumber");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithUnsignedShort:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("ClockIdentifier");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return (id)objc_msgSend(a1, "iokitMatchingDictionaryForPortClass:clockIdentifier:andPortNumber:", CFSTR("IOTimeSyncPort"), a3, a4);
}

- (_TSF_TSDgPTPPort)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_TSF_TSDgPTPPort init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

+ (id)gPTPPortWithService:(id)a3
{
  id v3;
  __objc2_class **v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")) & 1) != 0)
  {
    v4 = off_1E694A918;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")) & 1) != 0)
  {
    v4 = off_1E694A960;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")) & 1) != 0)
  {
    v4 = off_1E694A970;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")) & 1) != 0)
  {
    v4 = &off_1E694A980;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")) & 1) != 0)
  {
    v4 = off_1E694A958;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")) & 1) != 0)
  {
    v4 = off_1E694A968;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")) & 1) != 0)
  {
    v4 = off_1E694A978;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")) & 1) != 0)
  {
    v4 = off_1E694A930;
  }
  else if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncNetworkPort")) & 1) != 0)
  {
    v4 = off_1E694A940;
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
    {
      v5 = 0;
      goto LABEL_22;
    }
    v4 = off_1E694A948;
  }
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithService:", v3);
LABEL_22:

  return v5;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D39F08];
  objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:andPortNumber:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingService:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "gPTPPortWithService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_TSF_TSDgPTPPort)initWithService:(id)a3
{
  return -[_TSF_TSDgPTPPort initWithService:pid:](self, "initWithService:pid:", a3, 0);
}

- (_TSF_TSDgPTPPort)initWithService:(id)a3 pid:(int)a4
{
  id v6;
  _TSF_TSDgPTPPort *v7;
  id v8;
  uint64_t v9;
  IOKNotificationPort *notificationPort;
  IOKNotificationPort *v11;
  IOKService *service;
  uint64_t v13;
  IOKInterestNotification *generalInterestNotification;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_TSF_TSDgPTPPort;
  v7 = -[_TSF_TSDgPTPPort init](&v20, sel_init);
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_storeStrong((id *)&v7->_service, a3);
    if (v7->_service)
    {
      v7->_portNumber = -[_TSF_TSDgPTPPort _portNumber](v7, "_portNumber");
      v7->_clockIdentifier = -[_TSF_TSDgPTPPort _clockIdentifier](v7, "_clockIdentifier");
      if (initWithService_pid__onceToken != -1)
        dispatch_once(&initWithService_pid__onceToken, &__block_literal_global_2);
      if (_sharedNotificationsQueue)
      {
        objc_storeStrong((id *)&v7->_propertyUpdateQueue, (id)_sharedNotificationsQueue);
        v7->_portRole = -[_TSF_TSDgPTPPort _portRole](v7, "_portRole");
        v8 = objc_alloc(MEMORY[0x1E0D39F00]);
        v9 = objc_msgSend(v8, "initOnDispatchQueue:", _sharedNotificationsQueue);
        notificationPort = v7->_notificationPort;
        v7->_notificationPort = (IOKNotificationPort *)v9;

        v11 = v7->_notificationPort;
        if (v11)
        {
          service = v7->_service;
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke_51;
          v17[3] = &unk_1E694B200;
          objc_copyWeak(&v18, &location);
          -[IOKService addInterestNotifcationOfType:usingNotificationPort:error:withHandler:](service, "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:", *MEMORY[0x1E0D39EF0], v11, 0, v17);
          v13 = objc_claimAutoreleasedReturnValue();
          generalInterestNotification = v7->_generalInterestNotification;
          v7->_generalInterestNotification = (IOKInterestNotification *)v13;

          objc_destroyWeak(&v18);
          if (v7->_generalInterestNotification)
          {
LABEL_8:
            objc_destroyWeak(&location);
            goto LABEL_9;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v22 = "_generalInterestNotification != nil";
            v23 = 2048;
            v24 = 0;
            v25 = 2048;
            v26 = 0;
            v27 = 2080;
            v28 = "";
            v29 = 2080;
            v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
            v31 = 1024;
            v32 = 280;
            v16 = MEMORY[0x1E0C81028];
            goto LABEL_18;
          }
LABEL_19:

          v7 = 0;
          goto LABEL_8;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316418;
        v22 = "_notificationPort != nil";
        v23 = 2048;
        v24 = 0;
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = "";
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        v31 = 1024;
        v32 = 258;
        v16 = MEMORY[0x1E0C81028];
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316418;
        v22 = "_sharedNotificationsQueue != nil";
        v23 = 2048;
        v24 = 0;
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = "";
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        v31 = 1024;
        v32 = 251;
        v16 = MEMORY[0x1E0C81028];
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 136316418;
      v22 = "_service != nil";
      v23 = 2048;
      v24 = 0;
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
      v31 = 1024;
      v32 = 242;
      v16 = MEMORY[0x1E0C81028];
    }
LABEL_18:
    _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_19;
  }
LABEL_9:

  return v7;
}

- (IOKService)service
{
  return self->_service;
}

- (void)updateProperties
{
  NSObject *v3;
  int v4;
  unint64_t v5;
  _QWORD block[6];
  int v7;

  -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[_TSF_TSDgPTPPort _portRole](self, "_portRole");
  v5 = -[_TSF_TSDgPTPPort _clockIdentifier](self, "_clockIdentifier");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___TSF_TSDgPTPPort_updateProperties__block_invoke;
  block[3] = &unk_1E694B228;
  v7 = v4;
  block[4] = self;
  block[5] = v5;
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
  dispatch_sync((dispatch_queue_t)_sharedNotificationsQueue, &__block_literal_global_54);
  return 1;
}

- (unsigned)_portNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PortNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = 0;

  return v4;
}

- (int)_portRole
{
  void *v2;
  void *v3;
  unsigned int v4;
  int v5;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PortRole"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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

- (unint64_t)_clockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
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
    v4 = (OS_dispatch_queue *)(id)_sharedNotificationsQueue;
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
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_opt_class();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticInfoForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PortRole"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    switch(objc_msgSend(v6, "intValue"))
    {
      case 0u:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 1;
        goto LABEL_8;
      case 1u:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 2;
        goto LABEL_8;
      case 2u:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 3;
        goto LABEL_8;
      case 3u:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 4;
LABEL_8:
        objc_msgSend(v8, "numberWithInt:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
        break;
      default:
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PortRole"));

  return v5;
}

+ (id)diagnosticInfoForService:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ioClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ClassName"));

  objc_msgSend(v4, "iodProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v7);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("IOUserClientClass"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("IOGeneralInterest"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SourceMACAddress"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("DestinationMACAddress"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SourceIPAddress"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SourceIPMask"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("DestinationIPAddress"));
  return v5;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  void *v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D39F08];
  objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:andPortNumber:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = "service != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
      v20 = 1024;
      v21 = 470;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
    goto LABEL_24;
  }
  if (!objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")))
  {
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")))
    {
      v7 = _TSF_TSDgPTPUnicastLinkLayerPtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")))
    {
      v7 = _TSF_TSDgPTPUnicastLinkLayerEtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")))
    {
      v7 = _TSF_TSDgPTPUnicastUDPv4PtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")))
    {
      v7 = _TSF_TSDgPTPUnicastUDPv6PtPPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")))
    {
      v7 = _TSF_TSDgPTPUnicastUDPv4EtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")))
    {
      v7 = _TSF_TSDgPTPUnicastUDPv6EtEPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")))
    {
      v7 = _TSF_TSDgPTPLocalClockPort;
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
    {
      v7 = _TSF_TSDgPTPPort;
      goto LABEL_20;
    }
LABEL_24:
    v8 = 0;
    goto LABEL_21;
  }
  v7 = _TSF_TSDgPTPEthernetPort;
LABEL_20:
  -[__objc2_class diagnosticInfoForService:](v7, "diagnosticInfoForService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v8;
}

- (id)getMetrics
{
  return -[_TSF_TSDPortMetrics initWithPort:]([_TSF_TSDPortMetrics alloc], "initWithPort:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_TSF_TSDgPTPPort getMetrics](self, "getMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDelta:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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

- (_TSF_IODConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_generalInterestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
