@implementation CPMSHelper

- (void)publishDetailedMitigationArrayToCPMS
{
  int count;
  DetailedThermalBudgets *p_detailMitigationArray;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];

  count = self->detailMitigationArray.count;
  if (count >= 1)
  {
    p_detailMitigationArray = &self->detailMitigationArray;
    if (byte_1000A2480)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 67109120;
        v15[1] = count;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Publishing detailed mitigation array to CPMS with mitigation count: %d", (uint8_t *)v15, 8u);
      }
    }
    v6 = IOConnectCallStructMethod(self->connect, 0x23u, p_detailMitigationArray, 0x1E8uLL, 0, 0);
    if ((_DWORD)v6)
    {
      v7 = v6;
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F984(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    self->detailMitigationArray.count = 0;
  }
}

+ (id)sharedInstance
{
  if (qword_10009A3D0 != -1)
    dispatch_once(&qword_10009A3D0, &stru_10007D708);
  return (id)qword_10009A3D8;
}

- (CPMSHelper)init
{
  CPMSHelper *v2;
  CPMSHelper *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_queue_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v27;
  uint8_t v29[16];
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CPMSHelper;
  v2 = -[CPMSHelper init](&v30, "init");
  v3 = v2;
  if (v2)
  {
    v2->detailMitigationArray.count = 0;
    v4 = IOServiceMatching("ApplePPM");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    v3->cpmsService = MatchingService;
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v3->connect))
      {
        v6 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> CPMSHelper: Could not open connection to PPM service", v29, 2u);
        }
      }
      if (byte_1000A2480)
      {
        v7 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> CPMS Helper, creating peak pressure token", v29, 2u);
        }
      }
      if (notify_register_check("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerPressureNotificationToken))
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F850(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      v16 = dispatch_queue_create("com.apple.ThermalMonitor.CPMSHelper", 0);
      v3->_cpmsHelperQueue = (OS_dispatch_queue *)v16;
      if (!v16)
      {
        v17 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F7E0(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      -[CPMSHelper setNotificationPort:](v3, "setNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
      IOServiceAddInterestNotification(v3->notificationPort, v3->cpmsService, "IOGeneralInterest", (IOServiceInterestCallback)sub_10001A684, v3, &v3->_notification);
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource(-[CPMSHelper notificationPort](v3, "notificationPort"));
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    }
    else
    {
      v27 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<Notice> CPMSHelper: Could not find PPM service", v29, 2u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  io_object_t notification;
  io_object_t ioIterator;
  objc_super v5;

  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  ioIterator = self->_ioIterator;
  if (ioIterator)
    IOObjectRelease(ioIterator);
  if (-[CPMSHelper notificationPort](self, "notificationPort"))
    IONotificationPortDestroy(-[CPMSHelper notificationPort](self, "notificationPort"));
  v5.receiver = self;
  v5.super_class = (Class)CPMSHelper;
  -[CPMSHelper dealloc](&v5, "dealloc");
}

- (BOOL)isCPMSSupportedClient:(int)a3
{
  return byte_10007D728[24 * a3] != 255
      && byte_10009A3E0[1552 * byte_10007D728[24 * a3] + 280] != 0;
}

- (void)setPowerBudget:(unsigned int)a3 withDetails:(unint64_t)a4 forCPMSClient:(unsigned __int8)a5 atIdx:(int)a6
{
  char *v6;

  v6 = (char *)self + 16 * a6;
  v6[16] = a5;
  *((_DWORD *)v6 + 5) = a3;
  *((_QWORD *)v6 + 3) = a4;
  ++self->detailMitigationArray.count;
}

- (void)addToCPMSMitigationArray:(unsigned int)a3 forComponent:(int)a4
{
  -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:](self, "addToCPMSMitigationArray:withDetails:forComponent:", *(_QWORD *)&a3, 0, *(_QWORD *)&a4);
}

- (void)addToCPMSMitigationArray:(unsigned int)a3 withDetails:(unint64_t)a4 forComponent:(int)a5
{
  uint64_t v7;
  uint64_t count;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD v20[2];
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;

  v7 = *(_QWORD *)&a3;
  if (-[CPMSHelper isCPMSSupportedClient:](self, "isCPMSSupportedClient:", *(_QWORD *)&a5))
  {
    count = self->detailMitigationArray.count;
    if ((int)count > 29)
    {
      v13 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F880(count, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      if (byte_1000A2480)
      {
        v10 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)&byte_10007D728[24 * a5 + 8];
          v20[0] = 67109890;
          v20[1] = v7;
          v21 = 2048;
          v22 = a4;
          v23 = 2080;
          v24 = v11;
          v25 = 1024;
          v26 = count;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Setting power budget of %dmW with details: 0x%llx for client %s at index(detailMitigationArray.count): %d", (uint8_t *)v20, 0x22u);
          count = self->detailMitigationArray.count;
        }
      }
      -[CPMSHelper setPowerBudget:withDetails:forCPMSClient:atIdx:](self, "setPowerBudget:withDetails:forCPMSClient:atIdx:", v7, a4, byte_10007D728[24 * a5], count);
    }
  }
  else
  {
    v12 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F8E4(a5, v12);
  }
}

- (unsigned)getMaxPowerForComponent:(int)a3
{
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  _QWORD v11[2];

  if (byte_10007D728[24 * a3] == 255)
    goto LABEL_10;
  if (!byte_10009A3E0[1552 * byte_10007D728[24 * a3] + 280])
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
      v10 = 136315138;
      v11[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Client:%s is not currently registered.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }
  v4 = *(_DWORD *)&byte_10009A3E0[1552 * byte_10007D728[24 * a3] + 304];
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
      v10 = 67109378;
      LODWORD(v11[0]) = v4;
      WORD2(v11[0]) = 2080;
      *(_QWORD *)((char *)v11 + 6) = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Got maxPower of %dmW for client:%s", (uint8_t *)&v10, 0x12u);
    }
  }
  if (!v4)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F9E8();
    return 0;
  }
  return v4;
}

- (unsigned)getMinPowerForComponent:(int)a3
{
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  _QWORD v11[2];

  if (byte_10007D728[24 * a3] == 255)
    goto LABEL_10;
  if (!byte_10009A3E0[1552 * byte_10007D728[24 * a3] + 280])
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
      v10 = 136315138;
      v11[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Client:%s is not currently registered.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }
  v4 = *(_DWORD *)&byte_10009A3E0[1552 * byte_10007D728[24 * a3] + 292];
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
      v10 = 67109378;
      LODWORD(v11[0]) = v4;
      WORD2(v11[0]) = 2080;
      *(_QWORD *)((char *)v11 + 6) = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Got minPower of %dmW for client:%s", (uint8_t *)&v10, 0x12u);
    }
  }
  if (v4 == -1)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FA58();
    return -1;
  }
  return v4;
}

- (void)requestCurrentPowerCallbackForComponent:(int)a3
{
  mach_port_t connect;
  mach_port_t MachPort;
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t input;
  uint8_t buf[4];
  kern_return_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t reference[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if ((a3 - 15) >= 3)
  {
    input = byte_10007D728[24 * a3];
    if (input == 255)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FAC8();
    }
    else
    {
      reference[0] = 0;
      v19 = 0u;
      v20 = 0u;
      reference[1] = (uint64_t)sub_10001AF30;
      v18 = (unint64_t)self;
      connect = self->connect;
      MachPort = IONotificationPortGetMachPort(-[CPMSHelper notificationPort](self, "notificationPort"));
      v6 = IOConnectCallAsyncScalarMethod(connect, 0x20u, MachPort, reference, 8u, &input, 1u, 0, 0);
      if (v6)
      {
        v7 = v6;
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
          *(_DWORD *)buf = 67109634;
          v12 = v7;
          v13 = 2048;
          v14 = input;
          v15 = 2080;
          v16 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "<Error> IOConnect call to kAppleCPMSPPMGetCurrentPowerConsumption returned 0x%08x for clientID: %llu %s\n", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)updateCPMSClientState:(int)a3
{
  uint64_t v3;
  NSObject *v7;
  uint64_t v8;
  size_t v9;
  uint64_t input;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  v3 = byte_10007D728[24 * a3];
  input = v3;
  if (v3 != 255)
  {
    v9 = 1552;
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)&byte_10007D728[24 * a3 + 8];
        *(_DWORD *)buf = 67109634;
        v12 = a3;
        v13 = 2080;
        v14 = v8;
        v15 = 2048;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Updating client state for mitigationType:%d, ClientName:%s PPMClientId:%llu", buf, 0x1Cu);
      }
    }
    if (IOConnectCallMethod(self->connect, 0x1Du, &input, 1u, 0, 0, 0, 0, &byte_10009A3E0[1552 * v3], &v9))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FC38();
    }
  }
}

- (void)setProduct:(id)a3
{
  self->productObj = (CommonProduct *)a3;
}

- (int)getMitigationTypeForClientID:(unsigned __int8)a3
{
  uint64_t v3;
  char *v4;
  int v5;

  v3 = 0;
  v4 = byte_10007D728;
  while (1)
  {
    v5 = *v4;
    v4 += 24;
    if (v5 == a3)
      break;
    if (++v3 == 18)
    {
      LODWORD(v3) = -1;
      return v3;
    }
  }
  return v3;
}

- (unsigned)cpmsService
{
  return self->cpmsService;
}

- (void)setCpmsService:(unsigned int)a3
{
  self->cpmsService = a3;
}

- (IONotificationPort)notificationPort
{
  return self->notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->notificationPort = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (unsigned)ioIterator
{
  return self->_ioIterator;
}

- (void)setIoIterator:(unsigned int)a3
{
  self->_ioIterator = a3;
}

- (OS_dispatch_queue)cpmsHelperQueue
{
  return self->_cpmsHelperQueue;
}

- (void)setCpmsHelperQueue:(id)a3
{
  self->_cpmsHelperQueue = (OS_dispatch_queue *)a3;
}

@end
