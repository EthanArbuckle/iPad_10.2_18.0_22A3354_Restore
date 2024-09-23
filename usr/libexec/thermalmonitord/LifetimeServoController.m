@implementation LifetimeServoController

- (LifetimeServoController)init
{
  return -[LifetimeServoController initWithParams:sensorList:](self, "initWithParams:sensorList:", 0, 0);
}

- (LifetimeServoController)initWithParams:(id)a3 sensorList:(__CFArray *)a4
{
  char *v6;
  char *v7;
  _BOOL4 v8;
  const char *v9;
  const __CFDictionary *v10;
  io_service_t MatchingService;
  _BOOL4 v12;
  const __CFDictionary *v13;
  io_service_t v14;
  time_t v15;
  unsigned int *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  int v26;
  const __CFString *v27;
  NSFileManager *v28;
  NSString *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  int v34;
  id v35;
  LifetimeServoControlLoop *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  LifetimeServoControlLoop *v40;
  char *v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  int v45;
  LifetimeServoControlLoop *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  dispatch_time_t v58;
  char *v60;
  char *v61;
  id v62;
  _QWORD handler[5];
  uint64_t v64;
  objc_super v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  int v69;

  v65.receiver = self;
  v65.super_class = (Class)LifetimeServoController;
  v6 = -[LifetimeServoController init](&v65, "init");
  v7 = v6;
  if (!v6)
    return (LifetimeServoController *)v7;
  *(_QWORD *)(v6 + 372) = 0;
  *((_DWORD *)v6 + 91) = -1;
  *((_DWORD *)v6 + 92) = -1;
  -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v6);
  v7[398] = sub_100034168((const __CFDictionary *)a3, CFSTR("useRestoreSafePartition"), 0);
  v8 = sub_100034168((const __CFDictionary *)a3, CFSTR("updateCPUFastDieTargetPMP"), 0);
  v7[397] = v8;
  if (v8)
    v9 = "ApplePMP";
  else
    v9 = "AppleDieTempController";
  v10 = IOServiceMatching(v9);
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v10);
  *((_DWORD *)v7 + 2) = MatchingService;
  if (!MatchingService && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054F6C();
  v12 = sub_100034168((const __CFDictionary *)a3, CFSTR("updateGPUFastDieTarget"), 0);
  v7[396] = v12;
  if (v12)
  {
    v13 = IOServiceMatching(off_10009A360);
    v14 = IOServiceGetMatchingService(kIOMainPortDefault, v13);
    *((_DWORD *)v7 + 3) = v14;
    if (!v14 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054F40();
  }
  v15 = time(0);
  *((_QWORD *)v7 + 50) = v15;
  if (v15 == -1 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054F14();
  *((_DWORD *)v7 + 4) = 0;
  v16 = (unsigned int *)(v7 + 16);
  v62 = a3;
  if (sub_1000048B0((CFDictionaryRef)a3, CFSTR("variant"), kCFNumberIntType, v7 + 16))
  {
    if (!byte_1000A2480)
      goto LABEL_23;
    v17 = qword_1000A28A0;
    if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v18 = *v16;
    *(_DWORD *)buf = 67109120;
    v67 = v18;
    v19 = "<Notice> LSController: variant %d";
    v20 = v17;
    v21 = 8;
  }
  else
  {
    if (!byte_1000A2480)
      goto LABEL_23;
    v22 = qword_1000A28A0;
    if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v19 = "<Notice> LSController: variant classic";
    v20 = v22;
    v21 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:
  objc_msgSend(v7, "initPerfStateReportingCPU");
  v23 = 0;
  *((_DWORD *)v7 + 50) = objc_msgSend(v7, "initPerfStateVoltagesCPU");
  v61 = v7 + 72;
  v24 = byte_1000A2480;
  do
  {
    if (v24)
    {
      v25 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_DWORD *)&v7[4 * v23 + 72];
        *(_DWORD *)buf = 67109376;
        v67 = v23;
        v68 = 1024;
        v69 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: CPU[%d] %d", buf, 0xEu);
        v24 = byte_1000A2480;
      }
    }
    ++v23;
  }
  while (v23 != 16);
  v27 = CFSTR("com.apple.cltm");
  if (v7[398])
  {
    if (&_lookupPathForPersistentData)
    {
      bzero(buf, 0x400uLL);
      lookupPathForPersistentData(104, buf, 1024);
      v28 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), buf);
      v64 = 0;
      if (-[NSFileManager fileExistsAtPath:isDirectory:](v28, "fileExistsAtPath:isDirectory:", v29, 0)
        || -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v64))
      {
        v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), buf, CFSTR("com.apple.cltm"));
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100054EE8();
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10005465C();
    }
    return 0;
  }
LABEL_33:
  v30 = *v16;
  if ((_DWORD)v30 == 2)
  {
    objc_msgSend(v7, "initPerfStateReportingGPU");
    v31 = 0;
    *((_DWORD *)v7 + 90) = objc_msgSend(v7, "initPerfStateVoltagesGPU");
    v60 = v7 + 232;
    v32 = byte_1000A2480;
    do
    {
      if (v32)
      {
        v33 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(_DWORD *)&v7[4 * v31 + 232];
          *(_DWORD *)buf = 67109376;
          v67 = v31;
          v68 = 1024;
          v69 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> LSController GPU[%d] %d", buf, 0xEu);
          v32 = byte_1000A2480;
        }
      }
      ++v31;
    }
    while (v31 != 16);
    v35 = objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("params"));
    *((_QWORD *)v7 + 3) = 0;
    v36 = [LifetimeServoControlLoop alloc];
    v37 = objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("coreTypeP"));
    v38 = *((unsigned int *)v7 + 50);
    v39 = *((_QWORD *)v7 + 52);
    v40 = v36;
    v41 = v7 + 72;
  }
  else
  {
    if ((_DWORD)v30 != 1)
    {
      if ((_DWORD)v30)
      {
        v47 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100054E84(v30, v47, v48, v49, v50, v51, v52, v53);
      }
      else
      {
        *((_QWORD *)v7 + 3) = 0;
        *((_QWORD *)v7 + 4) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]([LifetimeServoControlLoop alloc], "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", v62, v61, *((unsigned int *)v7 + 50), 0, v27, *((_QWORD *)v7 + 52));
        *((_QWORD *)v7 + 5) = 0;
      }
      goto LABEL_54;
    }
    objc_msgSend(v7, "initPerfStateReportingGPU");
    v42 = 0;
    *((_DWORD *)v7 + 90) = objc_msgSend(v7, "initPerfStateVoltagesGPU");
    v60 = v7 + 232;
    v43 = byte_1000A2480;
    do
    {
      if (v43)
      {
        v44 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_DWORD *)&v7[4 * v42 + 232];
          *(_DWORD *)buf = 67109376;
          v67 = v42;
          v68 = 1024;
          v69 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "<Notice> LSController GPU[%d] %d", buf, 0xEu);
          v43 = byte_1000A2480;
        }
      }
      ++v42;
    }
    while (v42 != 16);
    v35 = objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("params"));
    *((_QWORD *)v7 + 3) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]([LifetimeServoControlLoop alloc], "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("coreTypeE")), v61, 3, 1, v27, *((_QWORD *)v7 + 52));
    v46 = [LifetimeServoControlLoop alloc];
    v37 = objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("coreTypeP"));
    v41 = v7 + 84;
    v38 = (*((_DWORD *)v7 + 50) - 3);
    v39 = *((_QWORD *)v7 + 52);
    v40 = v46;
  }
  *((_QWORD *)v7 + 4) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:](v40, "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", v37, v41, v38, 2, v27, v39);
  *((_QWORD *)v7 + 5) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]([LifetimeServoControlLoop alloc], "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("coreTypeG")), v60, *((unsigned int *)v7 + 90), 3, v27, *((_QWORD *)v7 + 52));
  objc_msgSend(v7, "initSensorList:", a4);
LABEL_54:
  objc_msgSend(*((id *)v7 + 3), "updatePersistedState");
  objc_msgSend(*((id *)v7 + 4), "updatePersistedState");
  objc_msgSend(*((id *)v7 + 5), "updatePersistedState");
  *((_DWORD *)v7 + 95) = objc_msgSend(*((id *)v7 + 3), "dieTempTarget");
  *((_DWORD *)v7 + 96) = objc_msgSend(*((id *)v7 + 4), "dieTempTarget");
  *((_DWORD *)v7 + 97) = objc_msgSend(*((id *)v7 + 5), "dieTempTarget");
  v54 = dispatch_queue_create("com.apple.thermalmonitor.lservo", 0);
  if (v54)
  {
    v55 = v54;
    v56 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v54);
    *((_QWORD *)v7 + 51) = v56;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100043140;
    handler[3] = &unk_10007D248;
    handler[4] = v7;
    dispatch_source_set_event_handler(v56, handler);
    CFRelease(v55);
    v57 = *((_QWORD *)v7 + 51);
    v58 = dispatch_time(0x8000000000000000, 3600000000000);
    dispatch_source_set_timer(v57, v58, 0x34630B8A000uLL, 0x2540BE400uLL);
    dispatch_resume(*((dispatch_object_t *)v7 + 51));
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000542A8();
  }
  return (LifetimeServoController *)v7;
}

- (__CFDictionary)newChannelForDriver:(const char *)a3 channelID:(unint64_t)a4
{
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  __CFDictionary *v7;

  v5 = IOServiceMatching(a3);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFDictionary *)IOReportCopyChannelsWithID(v5, a4, 0);
    CFRelease(v6);
    return v7;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054F98();
    return 0;
  }
}

- (void)initPerfStateReportingCPU
{
  __CFDictionary **p_subscribedChannelsCPU;
  uint64_t v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __IOReportSubscriptionCF *Subscription;

  self->_subscribedChannelsCPU = 0;
  p_subscribedChannelsCPU = &self->_subscribedChannelsCPU;
  self->_subscriptionCPU = 0;
  self->_lastReadingCPU = 0;
  if (self->_controllerVariant == 2)
    v4 = 0x43505620564F4C54;
  else
    v4 = 0x43505520564F4C54;
  v5 = -[LifetimeServoController newChannelForDriver:channelID:](self, "newChannelForDriver:channelID:", "ApplePMGR", v4);
  if (v5)
  {
    v6 = v5;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0, v5, p_subscribedChannelsCPU, 0, 0);
    self->_subscriptionCPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingCPU = (__CFDictionary *)IOReportCreateSamples(Subscription, self->_subscribedChannelsCPU, 0);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055030();
    }
    CFRelease(v6);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100055004();
  }
}

- (void)initPerfStateReportingGPU
{
  __CFDictionary **p_subscribedChannelsGPU;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __IOReportSubscriptionCF *Subscription;

  self->_subscribedChannelsGPU = 0;
  p_subscribedChannelsGPU = &self->_subscribedChannelsGPU;
  self->_subscriptionGPU = 0;
  self->_lastReadingGPU = 0;
  v4 = -[LifetimeServoController newChannelForDriver:channelID:](self, "newChannelForDriver:channelID:", off_10009A360, 0x4750555048);
  if (v4)
  {
    v5 = v4;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0, v4, p_subscribedChannelsGPU, 0, 0);
    self->_subscriptionGPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingGPU = (__CFDictionary *)IOReportCreateSamples(Subscription, self->_subscribedChannelsGPU, 0);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055088();
    }
    CFRelease(v5);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10005505C();
  }
}

- (int)initPerfStateVoltagesCPU
{
  const __CFString *v2;

  if (self->_controllerVariant == 2)
    v2 = CFSTR("voltage-states5");
  else
    v2 = CFSTR("voltage-states1");
  return -[LifetimeServoController initPerfStateVoltages:propertyName:voltages:maxVoltageCount:](self, "initPerfStateVoltages:propertyName:voltages:maxVoltageCount:", ":/arm-io/pmgr", v2, self->_perfStateVoltagesCPU, 16);
}

- (int)initPerfStateVoltagesGPU
{
  return -[LifetimeServoController initPerfStateVoltages:propertyName:voltages:maxVoltageCount:](self, "initPerfStateVoltages:propertyName:voltages:maxVoltageCount:", ":/arm-io/sgx", CFSTR("perf-states"), self->_perfStateVoltagesGPU, 16);
}

- (int)initPerfStateVoltages:(const char *)a3 propertyName:(__CFString *)a4 voltages:(int *)a5 maxVoltageCount:(int)a6
{
  int v9;
  io_registry_entry_t v10;
  io_object_t v11;
  const __CFData *v12;
  const __CFData *v13;
  const UInt8 *BytePtr;
  int Length;
  int v16;
  uint64_t v17;
  int *v18;
  int v19;
  int v20;
  char __str[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  *(_OWORD *)__str = 0u;
  v23 = 0u;
  v9 = snprintf(__str, 0x200uLL, "%s%s", "IODeviceTree", a3);
  if (v9 <= 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000550B4();
    return 0;
  }
  if (v9 >= 0x200)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055114();
    return 0;
  }
  v10 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055174();
    return 0;
  }
  v11 = v10;
  v12 = (const __CFData *)sub_10000497C(a4, v10);
  if (v12)
  {
    v13 = v12;
    BytePtr = CFDataGetBytePtr(v12);
    Length = CFDataGetLength(v13);
    v16 = Length + 7;
    if (Length >= 0)
      v16 = Length;
    if (v16 >> 3 <= a6)
    {
      a6 = v16 >> 3;
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055234();
    }
    if (a6 >= 1)
    {
      v17 = a6;
      v18 = (int *)(BytePtr + 4);
      do
      {
        v20 = *v18;
        v18 += 2;
        v19 = v20;
        if (v20)
          *a5 = v19;
        ++a5;
        --v17;
      }
      while (v17);
    }
    CFRelease(v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000551D4();
    a6 = 0;
  }
  IOObjectRelease(v11);
  return a6;
}

- (void)initSensorList:(__CFArray *)a3
{
  id v4;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *Value;
  const __CFArray *v8;
  CFIndex v9;
  const __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  id *v17;
  CFArrayRef theArray;
  id v19;
  id v20;
  uint8_t buf[4];
  int v22;

  if (self->_controllerVariant)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    if (CFArrayGetCount(a3) >= 1)
    {
      v5 = 0;
      theArray = a3;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v5);
        Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("lsSensorType"));
        if (Value)
        {
          v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            v9 = 0;
            do
            {
              v10 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v10, CFSTR("coreTypeE"), 0) == kCFCompareEqualTo)
              {
                objc_msgSend(v4, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
                v11 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeE index %d", buf, 8u);
                }
              }
              v12 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v12, CFSTR("coreTypeP"), 0) == kCFCompareEqualTo)
              {
                objc_msgSend(v20, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
                v13 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeP index %d", buf, 8u);
                }
              }
              v14 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v14, CFSTR("coreTypeG"), 0) == kCFCompareEqualTo)
              {
                objc_msgSend(v19, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
                v15 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeG index %d", buf, 8u);
                }
              }
              ++v9;
            }
            while (CFArrayGetCount(v8) > v9);
          }
        }
        ++v5;
        a3 = theArray;
      }
      while (CFArrayGetCount(theArray) > v5);
    }
    if (objc_msgSend(v4, "count", self))
    {
      objc_msgSend(v17[3], "initSensorIndexSet:", objc_msgSend(v4, "copy"));

    }
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v17[4], "initSensorIndexSet:", objc_msgSend(v20, "copy"));

    }
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v17[5], "initSensorIndexSet:", objc_msgSend(v19, "copy"));

    }
  }
}

- (int)writeToDriverService:(unsigned int)a3 key:(__CFString *)a4 value:(int64_t)a5
{
  CFNumberRef v7;
  CFNumberRef v8;
  kern_return_t v9;
  int64_t valuePtr;

  valuePtr = a5;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005529C();
    return 5;
  }
  v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000552C8();
    return 5;
  }
  v8 = v7;
  v9 = IORegistryEntrySetCFProperty(a3, a4, v7);
  if (v9 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_1000552F4();
  CFRelease(v8);
  return v9;
}

- (void)updateForTempMax:(int)a3 tempAverage:(int)a4
{
  uint64_t v4;
  unsigned int override_tempMax;
  uint64_t v8;
  unsigned int override_tempAverage;
  int controllerVariant;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  signed int v14;
  uint64_t v15;
  uint64_t v16;
  int override_dieTempTarget;
  unsigned int v18;

  LODWORD(v4) = a4;
  -[LifetimeServoController updatePerfStateReportingCPU](self, "updatePerfStateReportingCPU");
  if (self->_gCoreLoop)
    -[LifetimeServoController updatePerfStateReportingGPU](self, "updatePerfStateReportingGPU");
  override_tempMax = self->_override_tempMax;
  if (override_tempMax == -1)
    v8 = a3;
  else
    v8 = override_tempMax;
  override_tempAverage = self->_override_tempAverage;
  if (override_tempAverage == -1)
    v4 = v4;
  else
    v4 = override_tempAverage;
  controllerVariant = self->_controllerVariant;
  switch(controllerVariant)
  {
    case 2:
      v13 = -[LifetimeServoControlLoop updateTempMax:](self->_pCoreLoop, "updateTempMax:", v8);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_pCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", self->_perfStateFractionCPU, self->_perfStateCountCPU, v13, v4);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_gCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", self->_perfStateFractionGPU, self->_perfStateCountGPU, -[LifetimeServoControlLoop updateTempMax:](self->_gCoreLoop, "updateTempMax:", v13), v4);
      v14 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      goto LABEL_15;
    case 1:
      v15 = -[LifetimeServoControlLoop updateTempMax:](self->_eCoreLoop, "updateTempMax:", v8);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_eCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", self->_perfStateFractionCPU, 3, v15, v4);
      v16 = -[LifetimeServoControlLoop updateTempMax:](self->_pCoreLoop, "updateTempMax:", v15);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_pCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", &self->_perfStateFractionCPU[3], (self->_perfStateCountCPU - 3), v16, v4);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_gCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", self->_perfStateFractionGPU, self->_perfStateCountGPU, -[LifetimeServoControlLoop updateTempMax:](self->_gCoreLoop, "updateTempMax:", v16), v4);
      self->_dieTempTargetCPU = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      v14 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
      if (v14 >= self->_dieTempTargetCPU)
      {
LABEL_16:
        v11 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
        goto LABEL_18;
      }
LABEL_15:
      self->_dieTempTargetCPU = v14;
      goto LABEL_16;
    case 0:
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:](self->_pCoreLoop, "updateForPerfStateResidency:count:tempMax:tempAverage:", self->_perfStateFractionCPU, self->_perfStateCountCPU, v8, v4);
      v11 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      v12 = 372;
      goto LABEL_19;
  }
  v11 = 9500;
  self->_dieTempTargetCPU = 9500;
LABEL_18:
  v12 = 376;
LABEL_19:
  *(_DWORD *)((char *)&self->super.isa + v12) = v11;
  override_dieTempTarget = self->_override_dieTempTarget;
  if (override_dieTempTarget != -1)
  {
    self->_dieTempTargetCPU = override_dieTempTarget;
    self->_dieTempTargetGPU = override_dieTempTarget;
  }
  if (self->_cpuDieTempCtlService)
  {
    if (-[LifetimeServoControlLoop loopIsActive](self->_eCoreLoop, "loopIsActive")
      || -[LifetimeServoControlLoop loopIsActive](self->_pCoreLoop, "loopIsActive")
      || (v18 = -[LifetimeServoControlLoop loopIsActive](self->_gCoreLoop, "loopIsActive"), override_dieTempTarget != -1)
      || v18)
    {
      if (dword_1000A23EC != self->_dieTempTargetCPU)
      {
        -[LifetimeServoController writeToDriverService:key:value:](self, "writeToDriverService:key:value:", self->_cpuDieTempCtlService, CFSTR("LifetimeServoDieTemperatureTargetPropertyKey"));
        dword_1000A23EC = self->_dieTempTargetCPU;
      }
      if (dword_1000A23F0 != self->_dieTempTargetGPU && self->updateGPUFastDieTarget)
      {
        -[LifetimeServoController writeToDriverService:key:value:](self, "writeToDriverService:key:value:", self->_gpuDieTempCtlService, CFSTR("LifetimeServoFastDieTemperatureTarget"));
        dword_1000A23F0 = self->_dieTempTargetGPU;
      }
    }
  }
  -[LifetimeServoController updateCoreAnalyticsInfo](self, "updateCoreAnalyticsInfo");
}

- (void)updatePerfStateReportingCPU
{
  __IOReportSubscriptionCF *subscriptionCPU;
  __CFDictionary *subscribedChannelsCPU;
  __CFDictionary *Samples;
  const void *SamplesDelta;
  _QWORD v7[5];

  subscriptionCPU = self->_subscriptionCPU;
  if (subscriptionCPU)
  {
    subscribedChannelsCPU = self->_subscribedChannelsCPU;
    if (subscribedChannelsCPU)
    {
      *(_OWORD *)&self->_perfStateFractionCPU[12] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[4] = 0u;
      *(_OWORD *)self->_perfStateFractionCPU = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples(subscriptionCPU, subscribedChannelsCPU, 0);
      SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->_lastReadingCPU, Samples, 0);
      CFRelease(self->_lastReadingCPU);
      self->_lastReadingCPU = Samples;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100043E14;
      v7[3] = &unk_10007E280;
      v7[4] = self;
      IOReportIterate(SamplesDelta, v7);
      CFRelease(SamplesDelta);
    }
  }
}

- (void)updatePerfStateReportingGPU
{
  __IOReportSubscriptionCF *subscriptionGPU;
  __CFDictionary *subscribedChannelsGPU;
  __CFDictionary *Samples;
  const void *SamplesDelta;
  _QWORD v7[5];

  subscriptionGPU = self->_subscriptionGPU;
  if (subscriptionGPU)
  {
    subscribedChannelsGPU = self->_subscribedChannelsGPU;
    if (subscribedChannelsGPU)
    {
      *(_OWORD *)&self->_perfStateFractionGPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[12] = 0u;
      *(_OWORD *)self->_perfStateFractionGPU = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[4] = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples(subscriptionGPU, subscribedChannelsGPU, 0);
      SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->_lastReadingGPU, Samples, 0);
      CFRelease(self->_lastReadingGPU);
      self->_lastReadingGPU = Samples;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100044084;
      v7[3] = &unk_10007E280;
      v7[4] = self;
      IOReportIterate(SamplesDelta, v7);
      CFRelease(SamplesDelta);
    }
  }
}

- (void)overrideInstantaneousAF:(id)a3 value:(float)a4
{
  double v7;
  LifetimeServoControlLoop *eCoreLoop;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_E")))
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_7:
    *(float *)&v7 = a4;
    -[LifetimeServoControlLoop overrideInstantaneousAF:](eCoreLoop, "overrideInstantaneousAF:", v7);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_P")))
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_G")))
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054300();
}

- (void)overrideParam:(id)a3 value:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  LifetimeServoControlLoop *eCoreLoop;
  LifetimeServoControlLoop *pCoreLoop;
  int v10;
  id v11;
  __int16 v12;
  int v13;

  v4 = *(_QWORD *)&a4;
  if (byte_1000A2480)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = a3;
      v12 = 1024;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: setting %@ to %d", (uint8_t *)&v10, 0x12u);
    }
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoDieTempMaxMax")))
  {
    self->_override_tempMax = v4;
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoDieTempMaxAverage")))
  {
    self->_override_tempAverage = v4;
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoDieTempTarget")))
  {
    self->_override_dieTempTarget = v4;
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoIntegratorState_E")))
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_20:
    -[LifetimeServoControlLoop overrideIS:](eCoreLoop, "overrideIS:", v4);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_E")))
  {
    pCoreLoop = self->_eCoreLoop;
LABEL_23:
    -[LifetimeServoControlLoop overrideAFi:](pCoreLoop, "overrideAFi:", v4);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoIntegratorState_P")))
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_20;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_P")))
  {
    pCoreLoop = self->_pCoreLoop;
    goto LABEL_23;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoIntegratorState_G")))
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_20;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoInstantaneousAF_G")))
  {
    pCoreLoop = self->_gCoreLoop;
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054300();
}

- (void)updateSystemPowerState:(BOOL)a3
{
  time_t v4;
  time_t v5;
  int64_t lastSleepEntry;
  time_t v7;
  time_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int64_t v14;
  int v15;
  int64_t v16;
  __int16 v17;
  time_t v18;
  __int16 v19;
  time_t v20;

  if (a3)
  {
    if (self->_lastSleepEntry == -1)
    {
      if (byte_1000A2480)
      {
        v9 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          v10 = "<Notice> LSController: last update time unavailable";
          v11 = v9;
          v12 = 2;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
        }
      }
    }
    else
    {
      v4 = time(0);
      if (v4 == -1)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100055428();
      }
      else
      {
        v5 = v4;
        lastSleepEntry = self->_lastSleepEntry;
        v7 = v4 - lastSleepEntry;
        if (v4 < lastSleepEntry)
        {
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_100055454();
          return;
        }
        -[LifetimeServoControlLoop processSleepInterval:](self->_pCoreLoop, "processSleepInterval:", v7);
        -[LifetimeServoControlLoop processSleepInterval:](self->_gCoreLoop, "processSleepInterval:", v7);
        -[LifetimeServoControlLoop processSleepInterval:](self->_eCoreLoop, "processSleepInterval:", v7);
        if (byte_1000A2480)
        {
          v13 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v14 = self->_lastSleepEntry;
            v15 = 134218496;
            v16 = v14;
            v17 = 2048;
            v18 = v5;
            v19 = 2048;
            v20 = v7;
            v10 = "<Notice> LSController: lastSleepEntry %ld, now %ld, delta %ld";
            v11 = v13;
            v12 = 32;
            goto LABEL_18;
          }
        }
      }
    }
  }
  else
  {
    v8 = time(0);
    self->_lastSleepEntry = v8;
    if (v8 == -1 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055480();
  }
}

- (BOOL)getFastDieEngagementStatus
{
  return -[PowerZoneTelemetry isFastDieEngaged](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "isFastDieEngaged");
}

- (void)updateCoreAnalyticsInfo
{
  unsigned __int8 v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  signed int v13;
  unsigned int v14;
  signed int v15;
  unsigned int v16;
  signed int v17;
  _QWORD v20[5];
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int8 v24;

  v3 = -[LifetimeServoController getFastDieEngagementStatus](self, "getFastDieEngagementStatus");
  v4 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
  v5 = v4 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_eCoreLoop, "defaultDieTempTarget");
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = -v5;
  v7 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
  v8 = v7 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_pCoreLoop, "defaultDieTempTarget");
  if (v8 >= 0)
    v9 = v8;
  else
    v9 = -v8;
  v10 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
  v11 = v10 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_gCoreLoop, "defaultDieTempTarget");
  if (v11 >= 0)
    v12 = v11;
  else
    v12 = -v11;
  v13 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget") - self->_previousECoreDieTempTarget;
  if (v13 >= 0)
    v14 = v13;
  else
    v14 = -v13;
  v15 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget") - self->_previousPCoreDieTempTarget;
  if (v15 >= 0)
    v16 = v15;
  else
    v16 = -v15;
  v17 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget") - self->_previousGCoreDieTempTarget;
  if (v17 < 0)
    v17 = -v17;
  if ((v14 > 1 || v16 > 1 || v17 >= 2)
    && (v6 / 0xC8 != dword_1000A23F4 || v9 / 0xC8 != dword_1000A23F8 || v12 / 0xC8 != dword_1000A23FC))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100044900;
    v20[3] = &unk_10007E2A8;
    v20[4] = self;
    v21 = v6;
    v22 = v9;
    v23 = v12;
    v24 = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.lifetimeservo"), v20);
    self->_previousECoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
    self->_previousPCoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
    self->_previousGCoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
    dword_1000A23F4 = v6 / 0xC8;
    dword_1000A23F8 = v9 / 0xC8;
    dword_1000A23FC = v12 / 0xC8;
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("LS-target-GPU");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return CFSTR("LS-target-CPU");
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;

  if (!a3)
  {
    v3 = 372;
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), *(unsigned int *)((char *)&self->super.isa + v3));
  }
  if (a3 == 1)
  {
    v3 = 376;
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), *(unsigned int *)((char *)&self->super.isa + v3));
  }
  return 0;
}

@end
