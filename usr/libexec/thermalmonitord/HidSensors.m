@implementation HidSensors

- (__CFDictionary)getHIDSensorDict
{
  id v3;
  NSObject *v4;
  CFIndex v5;
  const void *ValueAtIndex;
  void *Value;
  __CFDictionary *callbackTemperatures;
  OS_dispatch_queue *callbackTemperaturesQueue;
  unsigned int v10;
  __CFDictionary *sensorDict;
  NSObject *v12;
  CFNumberRef v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  double FloatValue;
  NSObject *v21;
  unsigned int v22;
  __CFDictionary *v23;
  __CFDictionary *tempOffsetDict;
  __CFDictionary *v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  int v28;
  HidSensors *v29;
  NSObject *v30;
  uint64_t v31;
  __CFDictionary *result;
  __CFArray *v33;
  CFIndex Count;
  __CFArray *v35;
  __CFArray *tempSensors;
  __CFArray *v37;
  CFIndex v38;
  NSObject *v39;
  NSObject *log;
  uint64_t denom;
  unint64_t numer;
  mach_timebase_info info;
  uint64_t TimeStamp;
  uint64_t v45;
  unsigned int v46;
  double valuePtr;
  _QWORD block[7];
  int v49;
  _QWORD v50[7];
  _BYTE buf[24];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;

  self->_isSensorDataValid = 1;
  v3 = objc_alloc_init((Class)NSMutableArray);
  if (!self->_tempSensors)
  {
    if (self->_hidEventSystem
      || (-[HidSensors createHIDEventSystemObject](self, "createHIDEventSystemObject"), self->_hidEventSystem))
    {
      v33 = -[HidSensors copySensorArray](self, "copySensorArray");
      self->_tempSensors = v33;
      if (v33)
      {
LABEL_75:
        Count = CFArrayGetCount(v33);
        self->_count = Count;
        if (Count <= 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004ED58();
          CFRelease(self->_tempSensors);
          result = 0;
          self->_tempSensors = 0;
          return result;
        }
        if (self->_callbackTemperaturesQueue)
        {
          self->_callbackTemperatures = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
          IOHIDEventSystemClientRegisterEventCallback(self->_hidEventSystem, sub_10000EF58, self, 0);
        }
        self->_sensorDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_serviceToName = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
        v35 = -[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys");
        tempSensors = self->_tempSensors;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10001035C;
        v50[3] = &unk_10007D1B0;
        v50[4] = v3;
        v50[5] = v35;
        v50[6] = self;
        v37 = (__CFArray *)-[__CFArray filteredArrayUsingPredicate:](tempSensors, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v50));
        CFRelease(self->_tempSensors);
        self->_tempSensors = v37;
        if (v37)
        {
          CFRetain(v37);
          v38 = CFArrayGetCount(self->_tempSensors);
          self->_count = v38;
          if (v38 != CFArrayGetCount(self->hidSensorKeys) - self->_shadowSensorCount
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_10004EDB8();
          }
          goto LABEL_2;
        }
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004ED88();
        return 0;
      }
    }
    else
    {
      v33 = self->_tempSensors;
      if (v33)
        goto LABEL_75;
    }
    v39 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<Notice> Could not create HIDArray (will retry)", buf, 2u);
    }
    return 0;
  }
LABEL_2:
  if (objc_msgSend(v3, "count"))
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> List of sensors received: %@", buf, 0xCu);
    }
  }

  if (self->_count >= 1)
  {
    v5 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v5);
      Value = (void *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
      if (!Value)
      {
        v12 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = ValueAtIndex;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<Error> Cannot find matching key for 0x%p", buf, 0xCu);
        }
        goto LABEL_46;
      }
      if (!-[HidSensors shouldRetrieveSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "shouldRetrieveSensor:", Value))
      {
        *(_DWORD *)buf = -12700;
        v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, buf);
        CFDictionarySetValue(self->_sensorDict, Value, v13);
        if (v13)
          CFRelease(v13);
        goto LABEL_46;
      }
      v49 = 0;
      if (self->_callbackTemperaturesQueue)
      {
        callbackTemperatures = self->_callbackTemperatures;
        if (callbackTemperatures)
        {
          if (CFDictionaryContainsKey(callbackTemperatures, Value))
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            LODWORD(v52) = 0;
            callbackTemperaturesQueue = self->_callbackTemperaturesQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000106C0;
            block[3] = &unk_10007D1D8;
            block[5] = buf;
            block[6] = Value;
            block[4] = self;
            dispatch_sync((dispatch_queue_t)callbackTemperaturesQueue, block);
            v10 = -[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, *(unsigned int *)(*(_QWORD *)&buf[8] + 24));
            sensorDict = self->_sensorDict;
            if (v10)
            {
              sub_10000536C(sensorDict, Value, kCFNumberSInt32Type, (void *)(*(_QWORD *)&buf[8] + 24));
            }
            else
            {
              CFDictionaryRemoveValue(sensorDict, Value);
              self->_isSensorDataValid = 0;
            }
            _Block_object_dispose(buf, 8);
            goto LABEL_41;
          }
        }
      }
      if (byte_1000A2482 && -[HidSensors isBatterySensor:](self, "isBatterySensor:", Value))
        break;
      v14 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", Value);
      v49 = v14;
      if ((_DWORD)v14 == -12800)
      {
        v21 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = Value;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "<Error> Could not get value from SMC (%@)", buf, 0xCu);
        }
        goto LABEL_34;
      }
      if ((_DWORD)v14 != -1)
      {
        v22 = -[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, v14);
        v23 = self->_sensorDict;
        if (v22)
        {
          sub_10000536C(v23, Value, kCFNumberSInt32Type, &v49);
          goto LABEL_41;
        }
        CFDictionaryRemoveValue(v23, Value);
LABEL_40:
        self->_isSensorDataValid = 0;
        goto LABEL_41;
      }
      v15 = -[HidSensors isPowerSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isPowerSensor:", Value);
      if (v15)
        v16 = 25;
      else
        v16 = 15;
      v17 = IOHIDServiceClientCopyEvent(ValueAtIndex, v16, 0, 0);
      v18 = (const void *)v17;
      if (v17)
      {
        if (v15)
          v19 = 1638400;
        else
          v19 = 983040;
        valuePtr = 0.0;
        FloatValue = IOHIDEventGetFloatValue(v17, v19);
        valuePtr = FloatValue;
        if (!v15)
        {
          v46 = (int)(FloatValue * 100.0);
          v45 = 0;
          if (sub_1000048B0(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &v45))
          {
            TimeStamp = 0;
            TimeStamp = IOHIDEventGetTimeStamp(v18);
            if (TimeStamp == v45)
              goto LABEL_54;
            if (!v45)
            {
              info = 0;
              if (!mach_timebase_info(&info))
              {
                denom = info.denom;
                numer = info.numer;
                v31 = mach_absolute_time();
                log = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  *(_QWORD *)&buf[4] = Value;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v45;
                  *(_WORD *)&buf[22] = 2048;
                  v52 = TimeStamp;
                  v53 = 2048;
                  v54 = v31;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor reset for %@, prior %lld, event %lld, now %lld", buf, 0x2Au);
                }
                if (TimeStamp + 60000000000 * denom / numer < v31)
LABEL_54:
                  sub_1000048B0(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &v46);
              }
            }
            if (TimeStamp != v45)
              sub_10000536C(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &TimeStamp);
          }
          CFRelease(v18);
          if (-[HidSensors staleValueExpected:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "staleValueExpected:", Value)|| -[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, v46))
          {
            sub_10000536C(self->_sensorDict, Value, kCFNumberSInt32Type, &v46);
            goto LABEL_41;
          }
LABEL_34:
          CFDictionaryRemoveValue(self->_sensorDict, Value);
          goto LABEL_40;
        }
        sub_10000536C(self->_sensorDict, Value, kCFNumberDoubleType, &valuePtr);
        CFRelease(v18);
      }
      else
      {
        LODWORD(valuePtr) = 0;
        v28 = sub_1000048B0(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &valuePtr);
        v29 = +[HidSensors sharedInstance](HidSensors, "sharedInstance");
        if (v28)
        {
          if (!-[HidSensors staleValueExpected:](v29, "staleValueExpected:", Value)
            && !-[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, LODWORD(valuePtr)))
          {
            goto LABEL_34;
          }
          sub_10000536C(self->_sensorDict, Value, kCFNumberSInt32Type, &valuePtr);
LABEL_41:
          tempOffsetDict = self->_tempOffsetDict;
          if (tempOffsetDict)
          {
            if (CFDictionaryContainsKey(tempOffsetDict, Value))
            {
              v25 = self->_sensorDict;
              if (v25)
              {
                if (CFDictionaryContainsKey(v25, Value))
                {
                  *(_DWORD *)buf = 0;
                  LODWORD(valuePtr) = 0;
                  v26 = (const __CFNumber *)CFDictionaryGetValue(self->_sensorDict, Value);
                  CFNumberGetValue(v26, kCFNumberSInt32Type, buf);
                  v27 = (const __CFNumber *)CFDictionaryGetValue(self->_tempOffsetDict, Value);
                  CFNumberGetValue(v27, kCFNumberSInt32Type, &valuePtr);
                  *(_DWORD *)buf += LODWORD(valuePtr);
                  sub_10000536C(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
                }
              }
            }
          }
          goto LABEL_46;
        }
        if (!-[HidSensors readFailuresExpected:](v29, "readFailuresExpected:", Value))
        {
          v30 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = Value;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "<Error> Could not get event from service (%@)", buf, 0xCu);
          }
          goto LABEL_34;
        }
      }
LABEL_46:
      if (self->_count <= ++v5)
        return self->_sensorDict;
    }
    *(_DWORD *)buf = 3000;
    sub_10000536C(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
    goto LABEL_41;
  }
  return self->_sensorDict;
}

- (BOOL)staleValueExpected:(__CFString *)a3
{
  __CFDictionary *potentiallyStaleSensorDefaults;

  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults)
  {
    LODWORD(potentiallyStaleSensorDefaults) = CFDictionaryContainsKey(potentiallyStaleSensorDefaults, a3);
    if ((_DWORD)potentiallyStaleSensorDefaults)
      LOBYTE(potentiallyStaleSensorDefaults) = CFDictionaryGetValue(self->_potentiallyStaleSensorDefaults, a3) != 0;
  }
  return (char)potentiallyStaleSensorDefaults;
}

- (BOOL)shouldRetrieveSensor:(__CFString *)a3
{
  __CFDictionary *infoOnlyHIDSensors;

  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  return !infoOnlyHIDSensors || !CFDictionaryContainsKey(infoOnlyHIDSensors, a3) || self->_infoOnlySensorsActive;
}

- (BOOL)isPowerSensor:(__CFString *)a3
{
  __CFDictionary *powerSensors;

  powerSensors = self->_powerSensors;
  return powerSensors && CFDictionaryContainsKey(powerSensors, a3);
}

+ (id)sharedInstance
{
  if (qword_10009A368 != -1)
    dispatch_once(&qword_10009A368, &stru_10007D140);
  return (id)qword_10009A370;
}

- (__CFArray)sensorFourCharCode
{
  return self->sensorFourCharCode;
}

- (int)getFilterTimeConstantForSensor:(int64_t)a3
{
  int result;
  NSObject *v5;
  uint64_t v6;

  if (a3 <= 63)
    return self->filterParams[a3].time_constant;
  v5 = qword_1000A28A0;
  result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_10004EC70(a3, v5, v6);
    return 0;
  }
  return result;
}

- (BOOL)isTempSensorDataValid:(__CFString *)a3 value:(int)a4
{
  unsigned int v4;
  NSObject *v7;

  v4 = a4 + 3999;
  if ((a4 + 3999) >= 0x4A37)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004ECD8((uint64_t)a3, a4, v7);
  }
  return v4 < 0x4A37;
}

- (BOOL)isSending2DTempGridToDisplayDriverEnabled
{
  return self->_send2DTempGrid;
}

- (__CFArray)hidSensorKeys
{
  return self->hidSensorKeys;
}

- (HidSensors)init
{
  HidSensors *v2;
  HidSensors *v3;
  CFMutableDictionaryRef Mutable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HidSensors;
  v2 = -[HidSensors init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_infoOnlySensorsActive = 0;
    v2->sensorWatchdogMask = 0;
    v2->hidSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->sensorFourCharCode = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->synthSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v3->_tempOffsetDict = 0;
    v3->_dispatchVirtualTemp = 0;
    v3->_shadowSensorCount = 0;
    v3->_infoOnlyHIDSensors = 0;
    v3->_callbackSensorIntervals = 0;
    v3->_potentiallyStaleSensorDefaults = 0;
    v3->_callbackTemperaturesQueue = 0;
    v3->_potentiallyStaleSensorTimestamps = Mutable;
  }
  return v3;
}

- (void)dealloc
{
  __CFDictionary *potentiallyStaleSensorDefaults;
  __CFDictionary *potentiallyStaleSensorTimestamps;
  __CFDictionary *infoOnlyHIDSensors;
  __CFDictionary *tempOffsetDict;
  __CFArray *synthSensorKeys;
  __CFArray *sensorFourCharCode;
  __CFArray *hidSensorKeys;
  objc_super v10;

  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults)
    CFRelease(potentiallyStaleSensorDefaults);
  potentiallyStaleSensorTimestamps = self->_potentiallyStaleSensorTimestamps;
  if (potentiallyStaleSensorTimestamps)
    CFRelease(potentiallyStaleSensorTimestamps);
  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  if (infoOnlyHIDSensors)
    CFRelease(infoOnlyHIDSensors);
  tempOffsetDict = self->_tempOffsetDict;
  if (tempOffsetDict)
    CFRelease(tempOffsetDict);
  synthSensorKeys = self->synthSensorKeys;
  if (synthSensorKeys)
    CFRelease(synthSensorKeys);
  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode)
    CFRelease(sensorFourCharCode);
  hidSensorKeys = self->hidSensorKeys;
  if (hidSensorKeys)
    CFRelease(hidSensorKeys);
  v10.receiver = self;
  v10.super_class = (Class)HidSensors;
  -[HidSensors dealloc](&v10, "dealloc");
}

- (iir_filter_t)getFilterTable
{
  return self->filterParams;
}

- (unsigned)getSensorIndexFrom4CC:(__CFString *)a3
{
  __CFArray *sensorFourCharCode;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v10;
  CFTypeID v11;
  char v13;
  _BYTE v14[15];

  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode)
  {
    Count = CFArrayGetCount(sensorFourCharCode);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->sensorFourCharCode, i);
        if (ValueAtIndex && (v10 = ValueAtIndex, v11 = CFGetTypeID(ValueAtIndex), v11 == CFStringGetTypeID()))
        {
          if (CFStringCompare(a3, v10, 0) == kCFCompareEqualTo)
            return i;
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_10004E82C(&v13, v14);
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004E7FC();
  LODWORD(i) = -1;
  return i;
}

- (__CFString)getSensor4CCFromIndex:(int64_t)a3
{
  __CFArray *sensorFourCharCode;

  if (a3 < 0)
    return 0;
  sensorFourCharCode = self->sensorFourCharCode;
  if (!sensorFourCharCode)
    return 0;
  else
    return (__CFString *)CFArrayGetValueAtIndex(sensorFourCharCode, a3);
}

- (unint64_t)getWatchDogMask
{
  return self->sensorWatchdogMask;
}

- (void)loadProductTemperatureParameters:(__CFArray *)a3
{
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFMutableDictionaryRef v8;
  CFMutableDictionaryRef v9;
  BOOL v10;
  CFIndex v12;
  int *p_last;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v15;
  CFTypeID v16;
  int v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  SensorExchangeHelper *v21;
  NSObject *v22;
  OS_dispatch_queue *v23;
  __CFDictionary *theDict;
  __CFDictionary *v25;
  char v26;
  _BYTE v27[15];
  unsigned int v28;
  int v29;
  int v30;
  int valuePtr;
  char v32;
  _BYTE v33[11];
  int v34;
  char v35;
  _BYTE v36[15];
  char v37;
  _BYTE v38[7];
  const void *v39;
  uint8_t buf[8];
  __int16 v41;
  const void *v42;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004E858();
  }
  else
  {
    theDict = v8;
    v25 = v9;
    if (CFArrayGetCount(a3) >= 1)
    {
      v12 = 0;
      p_last = &self->filterParams[0].last;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v12);
        if (ValueAtIndex && (v15 = ValueAtIndex, v16 = CFGetTypeID(ValueAtIndex), v16 == CFDictionaryGetTypeID()))
        {
          v39 = 0;
          if (sub_1000341DC(v15, CFSTR("4CharCode"), &v39))
          {
            CFArrayAppendValue(self->sensorFourCharCode, v39);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_10004E93C(&v37, v38);
          }
          if ((sub_1000341DC(v15, CFSTR("matchName"), &v39) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_10004E910(&v35, v36);
          }
          v34 = 0;
          if ((sub_1000048B0(v15, CFSTR("filterParams"), kCFNumberSInt32Type, &v34) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_10004E8E4(&v32, v33);
          }
          v17 = sub_100034150(v15, CFSTR("filterParams_INTMIN"));
          *(p_last - 1) = v34;
          *p_last = v17 << 31;
          if (sub_100034168(v15, CFSTR("requiresWatchDog"), 1))
            self->sensorWatchdogMask |= 1 << v12;
          v18 = sub_100034150(v15, CFSTR("synthSensor"));
          v19 = 72;
          if (!v18)
            v19 = 56;
          CFArrayAppendValue(*(CFMutableArrayRef *)((char *)&self->super.isa + v19), v39);
          if (sub_100034150(v15, CFSTR("shadowSensor")))
            ++self->_shadowSensorCount;
          if (sub_100034168(v15, CFSTR("infoOnly"), 0))
            CFDictionarySetValue(Mutable, v39, kCFBooleanTrue);
          if (sub_100034168(v15, CFSTR("readFailuresExpected"), 0))
            CFDictionarySetValue(theDict, v39, kCFBooleanTrue);
          valuePtr = 0;
          sub_1000048B0(v15, CFSTR("callbackInterval"), kCFNumberSInt32Type, &valuePtr);
          if (valuePtr >= 1)
            sub_10000536C(v6, v39, kCFNumberSInt32Type, &valuePtr);
          v30 = 0;
          if (sub_1000048B0(v15, CFSTR("staleDefault"), kCFNumberSInt32Type, &v30))
          {
            sub_10000536C(v7, v39, kCFNumberSInt32Type, &v30);
            *(_QWORD *)buf = 0;
            sub_10000536C(self->_potentiallyStaleSensorTimestamps, v39, kCFNumberLongType, buf);
          }
          v29 = 0;
          if (sub_1000048B0(v15, CFSTR("temperatureOffset"), kCFNumberSInt32Type, &v29))
            sub_10000536C(v25, v39, kCFNumberSInt32Type, &v29);
          if (byte_1000A2DC0 && sub_1000341DC(v15, CFSTR("smcExchangeGroupKey"), &v39))
          {
            if (byte_1000A2480)
            {
              v20 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v12;
                v41 = 2112;
                v42 = v39;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor # %d is specified for SMC sensor group %@", buf, 0x12u);
              }
            }
            v28 = -1;
            if (sub_1000048B0(v15, CFSTR("smcExchangeIndex"), kCFNumberSInt32Type, &v28))
            {
              if ((v28 & 0x80000000) == 0)
              {
                v21 = +[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance");
                -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](v21, "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", v12, v39, v28);
              }
            }
            else
            {
              v22 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "<Error> Couldn't find expected smcExchangeIndex value for sensor %d", buf, 8u);
              }
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_10004E8B8(&v26, v27);
        }
        ++v12;
        p_last += 2;
      }
      while (CFArrayGetCount(a3) > v12);
    }
    if (CFDictionaryGetCount(Mutable) >= 1)
    {
      self->_infoOnlyHIDSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
      CFDictionaryRemoveAllValues(Mutable);
    }
    CFRelease(Mutable);
    if (theDict)
    {
      if (CFDictionaryGetCount(theDict) >= 1)
      {
        self->_readFailuresExpected = CFDictionaryCreateCopy(kCFAllocatorDefault, theDict);
        CFDictionaryRemoveAllValues(theDict);
      }
      CFRelease(theDict);
    }
    if (CFDictionaryGetCount(v6) >= 1)
    {
      self->_callbackSensorIntervals = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
      v23 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.hidsensors", 0);
      self->_callbackTemperaturesQueue = v23;
      if (!v23 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004E888();
    }
    CFRelease(v6);
    if (CFDictionaryGetCount(v7) >= 1)
    {
      self->_potentiallyStaleSensorDefaults = CFDictionaryCreateCopy(kCFAllocatorDefault, v7);
      CFDictionaryRemoveAllValues(v7);
    }
    CFRelease(v7);
    if (v25)
    {
      if (CFDictionaryGetCount(v25) >= 1)
      {
        self->_tempOffsetDict = CFDictionaryCreateCopy(kCFAllocatorDefault, v25);
        CFDictionaryRemoveAllValues(v25);
      }
      CFRelease(v25);
    }
  }
}

- (void)loadProductPowerParameters:(__CFArray *)a3
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v8;
  CFTypeID v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFIndex v12;
  char v13;
  _BYTE v14[15];
  char v15;
  _BYTE v16[15];
  void *value;
  CFIndex idx;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v6 = Mutable;
    LODWORD(idx) = 0;
    if (CFArrayGetCount(a3) >= 1)
    {
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, (int)idx);
        if (ValueAtIndex)
        {
          v8 = ValueAtIndex;
          v9 = CFGetTypeID(ValueAtIndex);
          if (v9 == CFDictionaryGetTypeID())
          {
            value = 0;
            if (sub_1000341DC(v8, CFSTR("4CharCode"), &value))
            {
              CFArrayAppendValue(self->sensorFourCharCode, value);
            }
            else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_10004E93C(&v15, v16);
            }
            if ((sub_1000341DC(v8, CFSTR("matchName"), &value) & 1) == 0
              && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_10004E910(&v13, v14);
            }
            CFArrayAppendValue(self->hidSensorKeys, value);
            v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &idx);
            if (v10)
            {
              v11 = v10;
              CFDictionarySetValue(v6, value, v10);
              CFRelease(v11);
            }
          }
        }
        v12 = (int)idx + 1;
        LODWORD(idx) = idx + 1;
      }
      while (CFArrayGetCount(a3) > v12);
    }
    if (CFDictionaryGetCount(v6) > 0)
    {
      self->_powerSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
    }
    CFRelease(v6);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004E968();
  }
}

- (void)enableDispatchVirtualTemp
{
  self->_dispatchVirtualTemp = 1;
}

- (BOOL)isVirtualTempDispatchEnabled
{
  return self->_dispatchVirtualTemp;
}

- (void)enableSending2DTempGridToDisplayDriver
{
  self->_send2DTempGrid = 1;
}

- (void)resetHIDSensorDictionary
{
  NSObject *v3;
  __CFArray *tempSensors;
  __CFDictionary *sensorDict;
  __CFDictionary *serviceToName;
  __CFDictionary *callbackTemperatures;
  uint8_t v8[16];

  v3 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> resetting HID sensor dictionary", v8, 2u);
  }
  tempSensors = self->_tempSensors;
  if (tempSensors)
    CFRelease(tempSensors);
  sensorDict = self->_sensorDict;
  if (sensorDict)
    CFRelease(sensorDict);
  serviceToName = self->_serviceToName;
  if (serviceToName)
    CFRelease(serviceToName);
  callbackTemperatures = self->_callbackTemperatures;
  if (callbackTemperatures)
    CFRelease(callbackTemperatures);
  self->_tempSensors = 0;
  self->_callbackTemperatures = 0;
  self->_sensorDict = 0;
  self->_serviceToName = 0;
}

- (int)sendToService:(__CFString *)a3 value:(void *)a4
{
  if (qword_10009A378 == -1)
  {
    if (!a3)
      return 5;
  }
  else
  {
    dispatch_once(&qword_10009A378, &stru_10007D160);
    if (!a3)
      return 5;
  }
  if (dword_10009A380)
    return IORegistryEntrySetCFProperty(dword_10009A380, a3, a4);
  return 5;
}

- (void)sendVirtualTemp:(int)a3 temperature:(int)a4
{
  __CFString *v7;
  double v8;
  double v9;
  CFNumberRef v10;
  CFNumberRef v11;
  mach_error_t v12;
  NSObject *v13;
  int valuePtr;

  if (-[HidSensors isVirtualTempDispatchEnabled](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isVirtualTempDispatchEnabled"))
  {
    v7 = -[HidSensors getSensor4CCFromIndex:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensor4CCFromIndex:", a3);
    v8 = (float)a4 / 100.0;
    if (v8 >= 0.0)
      v9 = v8 * 65536.0 + 0.5;
    else
      v9 = v8 * 65536.0 + -0.5;
    valuePtr = (int)v9;
    v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v10)
    {
      v11 = v10;
      v12 = -[HidSensors sendToService:value:](self, "sendToService:value:", v7, v10);
      CFRelease(v11);
      if (!v12)
        return;
    }
    else
    {
      v12 = 5;
    }
    v13 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004EA0C(v12, v13);
  }
}

- (void)initLocationStrings
{
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  CFIndex v6;

  if (-[HidSensors isVirtualTempDispatchEnabled](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isVirtualTempDispatchEnabled"))
  {
    Count = CFArrayGetCount(-[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys"));
    v4 = CFArrayGetCount(-[HidSensors synthSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "synthSensorKeys"));
    if (v4 >= 1)
    {
      v5 = 0;
      v6 = v4 + Count;
      do
      {
        -[HidSensors sendToService:value:](self, "sendToService:value:", -[HidSensors getSensor4CCFromIndex:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensor4CCFromIndex:", Count + v5), CFArrayGetValueAtIndex(self->synthSensorKeys, v5));
        ++v5;
      }
      while (Count + v5 < v6);
    }
  }
}

- (BOOL)readFailuresExpected:(__CFString *)a3
{
  __CFDictionary *readFailuresExpected;

  readFailuresExpected = self->_readFailuresExpected;
  if (readFailuresExpected)
  {
    LODWORD(readFailuresExpected) = CFDictionaryContainsKey(readFailuresExpected, a3);
    if ((_DWORD)readFailuresExpected)
      LOBYTE(readFailuresExpected) = CFDictionaryGetValue(self->_readFailuresExpected, a3) != 0;
  }
  return (char)readFailuresExpected;
}

- (BOOL)isBatterySensor:(__CFString *)a3
{
  return CFStringCompare(a3, CFSTR("gas gauge battery"), 0) == kCFCompareEqualTo
      || CFStringCompare(a3, CFSTR("TG0B"), 0) == kCFCompareEqualTo
      || CFStringCompare(a3, CFSTR("TG0V"), 0) == kCFCompareEqualTo;
}

- (int)getPowerSensorIndex:(__CFString *)a3
{
  __CFDictionary *powerSensors;
  int v6;
  NSObject *v7;
  int v9;
  uint8_t buf[4];
  __CFString *v11;

  v9 = 0;
  powerSensors = self->_powerSensors;
  if (!powerSensors || !CFDictionaryContainsKey(powerSensors, a3))
    return 0;
  sub_1000048B0(self->_powerSensors, a3, kCFNumberIntType, &v9);
  v6 = v9;
  if (v9 >= 11)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "<Error> Could not get the index for power sensor %@", buf, 0xCu);
      return v9;
    }
  }
  return v6;
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->_infoOnlySensorsActive = a3;
}

- (int)callbackSensorInterval:(__CFString *)a3
{
  __CFDictionary *callbackSensorIntervals;
  int v5;

  callbackSensorIntervals = self->_callbackSensorIntervals;
  if (callbackSensorIntervals)
  {
    v5 = 0;
    sub_1000048B0(callbackSensorIntervals, a3, kCFNumberIntType, &v5);
    LODWORD(callbackSensorIntervals) = 1000000 * v5;
  }
  return (int)callbackSensorIntervals;
}

- (int)indexForTempSensorKey:(__CFString *)a3
{
  __CFArray *tempSensors;
  int Count;
  CFIndex v7;
  uint64_t v8;
  const void *ValueAtIndex;
  const __CFString *Value;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[4];
  uint64_t v15;
  uint8_t v16[4];
  uint64_t v17;

  tempSensors = self->_tempSensors;
  if (tempSensors)
  {
    Count = CFArrayGetCount(tempSensors);
    if (Count >= 1)
    {
      v7 = 0;
      v8 = Count;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v7);
        if (ValueAtIndex)
        {
          Value = (const __CFString *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
          if (Value)
          {
            if (CFStringCompare(Value, a3, 0) == kCFCompareEqualTo)
              return v7;
          }
          else
          {
            v12 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_10004EAD0(v16, &v17, v12);
          }
        }
        else
        {
          v11 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004EA8C(v14, &v15, v11);
        }
        ++v7;
      }
      while (v8 != v7);
    }
  }
  LODWORD(v7) = -1;
  return v7;
}

- (int)temperatureForKey:(__CFString *)a3
{
  unsigned int v4;
  const void *ValueAtIndex;
  uint64_t v6;
  const void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_tempSensors)
    return -32768;
  v4 = -[HidSensors indexForTempSensorKey:](self, "indexForTempSensorKey:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004EBFC(v9, v10, v11);
    return -32768;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v4);
  if (!ValueAtIndex)
  {
    v12 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004EB14(v12, v13, v14);
    return -32768;
  }
  v6 = IOHIDServiceClientCopyEvent(ValueAtIndex, 15, 0, 0);
  if (!v6)
  {
    v15 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004EB88(v15, v16, v17);
    return -32768;
  }
  v7 = (const void *)v6;
  v8 = (int)(IOHIDEventGetFloatValue(v6, 983040) * 100.0);
  CFRelease(v7);
  return v8;
}

- (void)createHIDEventSystemObject
{
  __IOHIDEventSystemClient *v3;
  __CFArray *Mutable;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;

  if (!self->_hidEventSystem)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_hidEventSystem = v3;
    if (v3)
    {
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      v5 = sub_100035A50(65280, 5);
      if (v5)
      {
        v6 = v5;
        CFArrayAppendValue(Mutable, v5);
        CFRelease(v6);
      }
      v7 = sub_100035A50(65288, 1);
      if (v7)
      {
        v8 = v7;
        CFArrayAppendValue(Mutable, v7);
        CFRelease(v8);
      }
      v9 = sub_100035A50(32, 49);
      if (v9)
      {
        v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
      if (Mutable)
      {
        IOHIDEventSystemClientSetMatchingMultiple(self->_hidEventSystem, Mutable);
        CFRelease(Mutable);
        IOHIDEventSystemClientScheduleWithRunLoop(self->_hidEventSystem, qword_1000A2470, kCFRunLoopDefaultMode);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004EE18();
        CFRelease(self->_hidEventSystem);
        self->_hidEventSystem = 0;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004EDE8();
    }
  }
}

- (__CFArray)copySensorArray
{
  CFArrayRef v3;
  const __CFArray *v4;
  CFTypeID v5;
  __CFArray *Mutable;
  CFIndex v7;
  __IOHIDServiceClient *ValueAtIndex;
  unsigned int v9;
  int v10;
  BOOL v12;
  const __CFArray *v13;
  __IOHIDEventSystemClient *hidEventSystem;
  NSObject *v15;

  v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  v4 = v3;
  if (!v3 || (v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    hidEventSystem = self->_hidEventSystem;
    if (hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop(hidEventSystem, qword_1000A2470, kCFRunLoopDefaultMode);
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0;
    }
    v15 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004EE48(v15);
      if (!v4)
        return 0;
    }
    else if (!v4)
    {
      return 0;
    }
    v13 = v4;
LABEL_25:
    CFRelease(v13);
    return 0;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    v7 = 0;
    do
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      v9 = sub_100035B20(ValueAtIndex, CFSTR("PrimaryUsage"));
      v10 = sub_100035B20(ValueAtIndex, CFSTR("PrimaryUsagePage"));
      v12 = v10 == 32 || v10 == 65288 || v10 == 65280;
      if (v12 && v9 <= 0x31 && ((1 << v9) & 0x2000000000022) != 0)
        CFArrayAppendValue(Mutable, ValueAtIndex);
      ++v7;
    }
    while (CFArrayGetCount(v4) > v7);
  }
  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    v13 = Mutable;
    goto LABEL_25;
  }
  return Mutable;
}

- (void)handleTemperatureEvent:(int)a3 service:(__IOHIDServiceClient *)a4
{
  OS_dispatch_queue *callbackTemperaturesQueue;
  _QWORD block[6];
  int v7;

  callbackTemperaturesQueue = self->_callbackTemperaturesQueue;
  if (callbackTemperaturesQueue)
  {
    if (self->_serviceToName)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010AB0;
      block[3] = &unk_10007D200;
      block[4] = self;
      block[5] = a4;
      v7 = a3;
      dispatch_async((dispatch_queue_t)callbackTemperaturesQueue, block);
    }
  }
}

- (char)readHIDDebugDictionaryAndReturnErrorCode
{
  char *v2;
  uint64_t v3;
  __IOHIDEventSystemClient *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  __IOHIDServiceClient *ValueAtIndex;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  uint64_t v12;
  NSObject *v13;
  const void *Value;
  _BOOL4 v15;
  int v16;
  CFTypeID v17;
  CFTypeID TypeID;
  CFIndex Count;
  const __CFNumber *v20;
  const __CFNumber *v21;
  timespec __tp;
  uint64_t v23;
  uint64_t v24;
  CFStringRef theString1;
  char v26[2];
  uint64_t valuePtr;
  uint8_t buf[4];
  const __CFDictionary *v29;

  v2 = (char *)malloc_type_malloc(0x32uLL, 0xAE0F5642uLL);
  *v2 = 0;
  valuePtr = 0;
  theString1 = 0;
  v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, v3);
  IOHIDEventSystemClientSetMatching(v4, &off_100085728);
  v5 = IOHIDEventSystemClientCopyServices(v4);
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5))
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v6, 0);
      v8 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("ServicePluginDebug"));
      if (v8)
      {
        v9 = v8;
        v10 = CFGetTypeID(v8);
        if (v10 == CFDictionaryGetTypeID()
          && sub_1000341DC(v9, CFSTR("PluginName"), &theString1)
          && CFStringCompare(theString1, CFSTR("AppleHDQGasGaugeHID"), 0) == kCFCompareEqualTo)
        {
          v23 = 0;
          v24 = 0;
          __tp.tv_sec = 0;
          __tp.tv_nsec = 0;
          v12 = 0;
          if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp))
            v12 = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
          v13 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> %@HID Debug Dict", buf, 0xCu);
          }
          Value = CFDictionaryGetValue(v9, CFSTR("ErrorHistory"));
          if (sub_1000048B0(v9, CFSTR("LastCalledTs"), kCFNumberCFIndexType, &v24)
            && sub_1000048B0(v9, CFSTR("LastSuccessTs"), kCFNumberCFIndexType, &v23)
            && ((v15 = (unint64_t)(v12 - v23) > 0x98967FF, (unint64_t)(v12 - v24) <= 0x98967FF)
              ? (v16 = (unint64_t)(v12 - v23) > 0x98967FF)
              : (v16 = v15 | 2),
                v16))
          {
            __sprintf_chk(v26, 0, 2uLL, "%d", v16);
            sub_10003582C(v2, "EC: ", 0x32uLL);
            sub_10003582C(v2, v26, 0x32uLL);
          }
          else
          {
            v15 = 0;
          }
          if (Value)
          {
            v17 = CFGetTypeID(Value);
            TypeID = CFArrayGetTypeID();
            if (v15 && v17 == TypeID)
            {
              sub_10003582C(v2, " EH: ", 0x32uLL);
              Count = CFArrayGetCount((CFArrayRef)Value);
              v20 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 1);
              CFNumberGetValue(v20, kCFNumberIntType, &valuePtr);
              __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", valuePtr);
              sub_10003582C(v2, (const char *)buf, 0x32uLL);
              if (Count >= 2)
              {
                v21 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 2);
                CFNumberGetValue(v21, kCFNumberIntType, (char *)&valuePtr + 4);
                __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", HIDWORD(valuePtr));
                sub_10003582C(v2, " ", 0x32uLL);
                sub_10003582C(v2, (const char *)buf, 0x32uLL);
              }
            }
          }
        }
        CFRelease(v9);
      }
    }
    CFRelease(v6);
  }
  if (v4)
    CFRelease(v4);
  return v2;
}

- (BOOL)isSensorDataValid
{
  return self->_isSensorDataValid;
}

- (__CFArray)synthSensorKeys
{
  return self->synthSensorKeys;
}

@end
