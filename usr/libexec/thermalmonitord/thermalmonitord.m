uint64_t sub_100003134()
{
  return byte_1000A1EFC;
}

BOOL sub_100003320(io_registry_entry_t a1, const __CFString *a2)
{
  const __CFBoolean *CFProperty;
  const __CFBoolean *v3;
  CFTypeID v4;
  _BOOL8 v5;

  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
    return 0;
  v3 = CFProperty;
  v4 = CFGetTypeID(CFProperty);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

uint64_t sub_1000033D8(uint64_t a1, uint64_t a2)
{
  uint64_t ChannelID;
  unint64_t IntegerValue;

  ChannelID = IOReportChannelGetChannelID(a2);
  IntegerValue = IOReportSimpleGetIntegerValue(a2, 0);
  if (ChannelID == 0x505A454E47414745)
    *(float *)(*(_QWORD *)(a1 + 32) + 96) = (float)IntegerValue / (float)*(unint64_t *)(a1 + 40);
  return 0;
}

id sub_100003684(uint64_t a1, int a2)
{
  id Weak;
  id result;
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result)
  {
    objc_msgSend(Weak, "setAudioIsOn:", state64 != 0);
    return objc_msgSend(Weak, "updateContextActiveState");
  }
  return result;
}

uint64_t sub_100003738(io_registry_entry_t a1, const __CFString *a2, _QWORD *a3)
{
  CFTypeRef CFProperty;
  const void *v6;
  CFTypeID TypeID;
  uint64_t v8;
  NSObject *v9;
  uint64_t valuePtr;
  uint8_t buf[4];
  const __CFString *v13;

  valuePtr = 0;
  CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      if (CFNumberGetValue((CFNumberRef)v6, kCFNumberSInt64Type, &valuePtr))
      {
        *a3 = valuePtr;
        v8 = 1;
LABEL_14:
        CFRelease(v6);
        return v8;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100052860();
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100052800();
    }
    v8 = 0;
    goto LABEL_14;
  }
  if (!byte_1000A2480)
    return 0;
  v9 = qword_1000A28A0;
  v8 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> could not find %@ property", buf, 0xCu);
    return 0;
  }
  return v8;
}

BOOL sub_1000038C4()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  _BOOL8 v3;

  v0 = (const __CFBoolean *)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFGetTypeID(v0);
  v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

float sub_100003934(const char *a1)
{
  FILE *v1;
  FILE *v2;
  float v3;

  v1 = fopen(a1, "r");
  if (v1)
  {
    v2 = v1;
    fseek(v1, 0, 2);
    v3 = (float)ftell(v2) / 1000000.0;
    fclose(v2);
  }
  else
  {
    puts("File Not Found!");
    return -1.0;
  }
  return v3;
}

void sub_100004040(uint64_t a1, int a2)
{
  id Weak;
  uint64_t v4;
  _QWORD v5[5];
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  if (notify_get_state(a2, &state64))
    v4 = 0;
  else
    v4 = state64;
  objc_msgSend(Weak, "setUncapRequestClientID:", v4);
  objc_msgSend(Weak, "setStockholmFieldDetectInProgressUntilTime:", dispatch_time(0, 5000000000));
  objc_msgSend(Weak, "updateContextActiveState");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000098A8;
  v5[3] = &unk_10007D248;
  v5[4] = Weak;
  dispatch_after((dispatch_time_t)objc_msgSend(Weak, "stockholmFieldDetectInProgressUntilTime"), (dispatch_queue_t)objc_msgSend(Weak, "inPocketQueue"), v5);
}

void sub_100004110(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFString *v3;
  char *v4;
  time_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFStringRef v10;
  const __CFString *v11;
  const __CFData *ExternalRepresentation;
  const __CFData *v13;
  int v14;
  const UInt8 *BytePtr;
  size_t Length;
  time_t v17;

  if ((_DWORD)a1 == 1)
  {
    v2 = kCFAllocatorDefault;
    v3 = CFSTR("Time, Epoch Time, Mach Absolute Time, TestCase Number, TestCase Name, Gas gauge average power, Battery capacity, ");
  }
  else
  {
    v17 = time(0);
    v4 = ctime(&v17);
    v4[24] = 0;
    v2 = kCFAllocatorDefault;
    v5 = v17;
    v6 = mach_absolute_time();
    v7 = dword_1000A1F68;
    v8 = sub_100008F14();
    v9 = sub_10000906C();
    v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s, %ld, %llu, %d, %s, %lld, %d"), v4, v5, v6, v7, &byte_1000A1F6C, v8, v9);
    if (!v10)
      return;
    v3 = v10;
  }
  v11 = CFStringCreateWithFormat(v2, 0, CFSTR("%@%@"), v3, objc_msgSend((id)qword_1000A1DC8, "getTGraphData:", a1));
  CFRelease(v3);
  if (v11)
  {
    ExternalRepresentation = CFStringCreateExternalRepresentation(v2, v11, 0, 0x3Fu);
    if (ExternalRepresentation)
    {
      v13 = ExternalRepresentation;
      v14 = dword_10009A208;
      BytePtr = CFDataGetBytePtr(ExternalRepresentation);
      Length = CFDataGetLength(v13);
      if (write(v14, BytePtr, Length) < 0 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100051C90();
      write(dword_10009A208, "\n", 1uLL);
      CFRelease(v13);
    }
    CFRelease(v11);
  }
}

uint64_t sub_1000042B0(uint64_t a1, uint64_t a2)
{
  void *ChannelName;
  unint64_t IntegerValue;
  int v6;

  ChannelName = (void *)IOReportChannelGetChannelName(a2);
  IntegerValue = IOReportSimpleGetIntegerValue(a2, 0);
  if (objc_msgSend(ChannelName, "isEqualToString:", CFSTR("power")))
  {
    *(float *)&v6 = (float)IntegerValue / *(double *)(a1 + 32) / 1000.0;
    dword_1000A2B00 = v6;
  }
  return 0;
}

uint64_t sub_1000048B0(CFDictionaryRef theDict, void *key, CFNumberType a3, void *a4)
{
  uint64_t result;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;

  result = 0;
  if (theDict)
  {
    if (key)
    {
      if (a4)
      {
        result = CFDictionaryContainsKey(theDict, key);
        if ((_DWORD)result)
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(theDict, key);
          if (Value && (v10 = Value, v11 = CFGetTypeID(Value), v11 == CFNumberGetTypeID()))
          {
            return CFNumberGetValue(v10, a3, a4) != 0;
          }
          else
          {
            result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
            if ((_DWORD)result)
            {
              sub_1000525C0();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

CFTypeRef sub_10000497C(CFStringRef key, io_registry_entry_t entry)
{
  return IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
}

void sub_10000534C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

CFNumberRef sub_10000536C(__CFDictionary *a1, const void *a2, CFNumberType theType, void *valuePtr)
{
  CFNumberRef result;
  CFNumberRef v7;

  if (a1 && a2 && valuePtr)
  {
    result = CFNumberCreate(kCFAllocatorDefault, theType, valuePtr);
    if (result)
    {
      v7 = result;
      CFDictionarySetValue(a1, a2, result);
      CFRelease(v7);
      return (CFNumberRef)1;
    }
  }
  else
  {
    result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_1000526E0();
      return 0;
    }
  }
  return result;
}

void sub_1000054EC()
{
  unsigned int v0;
  unsigned int v1;
  __CFArray *v2;
  const void *ValueAtIndex;
  int v4;
  NSObject *v5;
  __CFDictionary *v6;
  const __CFDictionary *v7;
  __CFArray *v8;
  const __CFArray *v9;
  CFTypeID v10;
  CFIndex Count;
  __int128 v12;
  CFIndex v13;
  CFIndex v14;
  void *v15;
  unsigned int v16;
  const __CFNumber *Value;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  const char *CStringPtr;
  const std::__fs::filesystem::path *v31;
  std::error_code *v32;
  __int128 v33;
  _BOOL4 v34;
  _BYTE buf[18];
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;

  if (dword_1000A2054 >= 1)
  {
    qword_1000A1F28 = mach_absolute_time();
    v0 = objc_msgSend((id)qword_1000A1DC8, "canaryTempSensorIndex");
    if ((v0 & 0x80000000) == 0)
    {
      v1 = v0;
      v2 = -[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys");
      if (v2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v1);
        if (ValueAtIndex)
        {
          v4 = -[HidSensors temperatureForKey:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "temperatureForKey:", ValueAtIndex);
          if (byte_1000A2480)
          {
            v5 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v4;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: canary %d", buf, 0x12u);
            }
          }
          if (v4 > (int)objc_msgSend((id)qword_1000A1DC8, "canaryTempThreshold"))
          {
            objc_msgSend((id)qword_1000A1DC8, "canaryModeExitEarly:", dword_1000A2054);
            dword_1000A2054 = 0;
            goto LABEL_16;
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100051D14();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100051CE8();
      }
    }
    if (dword_1000A2054 >= 1)
    {
      --dword_1000A2054;
      return;
    }
  }
LABEL_16:
  -[SensorDispatcherHelper readKeysFromSensorDispatcher](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "readKeysFromSensorDispatcher");
  v6 = -[HidSensors getHIDSensorDict](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getHIDSensorDict");
  if (v6)
  {
    v7 = v6;
    v8 = -[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys");
    if (v8 && (v9 = v8, v10 = CFGetTypeID(v8), v10 == CFArrayGetTypeID()))
    {
      v34 = sub_1000090AC();
      Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        v13 = Count;
        v14 = 0;
        *(_QWORD *)&v12 = 138412290;
        v33 = v12;
        do
        {
          v15 = (void *)CFArrayGetValueAtIndex(v9, v14);
          if (-[HidSensors isPowerSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isPowerSensor:", v15))
          {
            *(_QWORD *)buf = 0;
            sub_1000048B0(v7, v15, kCFNumberDoubleType, buf);
            v16 = -[HidSensors getPowerSensorIndex:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getPowerSensorIndex:", v15);
            dbl_1000A2DC8[v16] = *(double *)buf;
          }
          else
          {
            Value = (const __CFNumber *)CFDictionaryGetValue(v7, v15);
            if (Value)
            {
              *(_DWORD *)buf = 0;
              CFNumberGetValue(Value, kCFNumberSInt32Type, buf);
              v18 = objc_msgSend((id)qword_1000A1DC8, "useTcalAdjust:", v14);
              sub_100005C08(v14, *(unsigned int *)buf, v18);
            }
            else
            {
              v19 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                *(_QWORD *)&buf[4] = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "<Error> Could not get value for %@", buf, 0xCu);
              }
            }
          }
          ++v14;
        }
        while (v13 != v14);
      }
      v20 = qword_1000A1F50;
      v21 = qword_1000A1F58;
      v22 = qword_1000A1F18;
      if ((qword_1000A1F58 & qword_1000A1F50) == qword_1000A1F18)
      {
        if (byte_1000A2480)
        {
          v23 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            sub_100031268(dword_1000A1EE4);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = byte_1000A2058;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> sensors: %s", buf, 0xCu);
          }
        }
        dword_1000A2050 = 0;
        qword_1000A1F28 = mach_absolute_time();
        objc_msgSend((id)qword_1000A1DC8, "updateSystemLoad:", v34);
        objc_msgSend((id)qword_1000A1DC8, "probeAllSupervisorControlLoadingIndex");
        sub_100008A64();
        v24 = objc_msgSend((id)qword_1000A1DC8, "desiredLoopInterval");
        if (v24 >= 1)
        {
          v25 = v24 / 5u;
          if ((int)(v24 / 5u) <= 1)
            v25 = 1;
          v26 = v25 - 1;
          dword_1000A2054 = v25 - 1;
          if (byte_1000A2480)
          {
            v27 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<Notice> %s: setting numCanaryOnlyPeriodsRemaining to %d", buf, 0x12u);
            }
          }
        }
      }
      else
      {
        v28 = dword_1000A2050 + 1;
        dword_1000A2050 = v28;
        if ((v28 & 3) == 0)
        {
          v29 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&buf[4] = v28;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v20;
            v36 = 2048;
            v37 = v21;
            v38 = 2048;
            v39 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "<Error> partial sensors: count %d, current %llx, mask %llx, expected %llx", buf, 0x26u);
          }
          -[HidSensors resetHIDSensorDictionary](+[HidSensors sharedInstance](HidSensors, "sharedInstance", v33), "resetHIDSensorDictionary");
        }
      }
      objc_msgSend((id)qword_1000A1DC8, "hintComponentControlTakeAction", v33);
      -[ContextAwareThermalManager iterateAndUpdateContexts](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "iterateAndUpdateContexts");
      if (byte_1000A2DC0)
      {
        -[SensorExchangeHelper updateAllSensorExchangeData](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "updateAllSensorExchangeData");
        -[SensorExchangeHelper sendSensorExchangeDataToSMC](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "sendSensorExchangeDataToSMC");
      }
      if (byte_1000A1EFC == 1)
        sub_100004110(2);
      -[TGraphSampler logToPowerlog](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "logToPowerlog");
      if (byte_1000A1F11 == 1)
      {
        CStringPtr = CFStringGetCStringPtr(CFSTR("/var/log/tgraph.csv"), 0);
        if (sub_100003934(CStringPtr) > 5.0)
        {
          v31 = (const std::__fs::filesystem::path *)CFStringGetCStringPtr(CFSTR("/var/log/tgraph.csv"), 0);
          remove(v31, v32);
          sub_10002FCD4((const __SCPreferences *)qword_1000A2AB8);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100051CBC();
    }
  }
}

uint64_t sub_100005B24(uint64_t result, int a2, int a3, int a4)
{
  int v4;
  uint64_t v5;

  qword_1000A1F50 |= 1 << result;
  if (dword_1000A1DD0 == (_DWORD)result)
  {
    dword_1000A1DD8 = dword_1000A1DD4 - a2;
  }
  else if (a4)
  {
    a2 += dword_1000A1DD8;
  }
  if (byte_1000A1DDC)
    v4 = a3;
  else
    v4 = a2;
  if (byte_1000A28A8)
    dword_1000A28AC[(int)result] = v4;
  else
    a3 = v4;
  if (byte_1000A2490)
  {
    v5 = (int)result;
    if ((qword_1000A2AB0 & (1 << result)) != 0)
      a3 = *((_DWORD *)&qword_1000A29AC + (int)result);
    else
      *((_DWORD *)&qword_1000A29AC + (int)result) = a3;
  }
  else
  {
    v5 = (int)result;
    *((_DWORD *)&qword_1000A29AC + (int)result) = a3;
  }
  dword_1000A1DE0[v5] = a3;
  return result;
}

uint64_t sub_100005C08(uint64_t a1, unsigned int a2, int a3)
{
  unsigned int v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v4 = a2;
  if (!qword_1000A1EE8)
    goto LABEL_14;
  v5 = *(_DWORD *)(qword_1000A1EE8 + 8 * (int)a1);
  if (!v5)
    goto LABEL_14;
  v6 = qword_1000A1EE8 + 8 * (int)a1;
  v9 = *(_DWORD *)(v6 + 4);
  v7 = (int *)(v6 + 4);
  v8 = v9;
  if (v9 == 0x80000000)
  {
    if (dword_1000A1DD0 == (_DWORD)a1)
    {
      if (dword_1000A1EF8)
      {
        ++dword_1000A1EF0;
        dword_1000A1EF4 += a2;
      }
      else
      {
        v4 = dword_1000A1DD4;
      }
    }
    goto LABEL_13;
  }
  if (dword_1000A1DD0 == (_DWORD)a1)
  {
    v10 = dword_1000A1EF0;
    if (dword_1000A1EF0 < dword_1000A1EF8)
    {
      ++dword_1000A1EF0;
      dword_1000A1EF4 += a2;
      v4 = dword_1000A1EF4 / (v10 + 1);
LABEL_13:
      *v7 = v4 << 16;
LABEL_14:
      v12 = v4;
      return sub_100005B24(a1, v12, v4, a3);
    }
  }
  v11 = v8 + (unsigned __int16)(327680 / (v5 + 5)) * (a2 - (v8 >> 16));
  *v7 = v11;
  v12 = v11 >> 16;
  return sub_100005B24(a1, v12, v4, a3);
}

void sub_100006580(__CFArray *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4;

  v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, format, a3);
  CFArrayAppendValue(a1, v4);
  if (v4)
    CFRelease(v4);
}

uint64_t sub_100006CA4(void *a1, int *a2, int a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  signed int v11;
  int *v12;
  int v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    return 4294934528;
  v7 = v6;
  v8 = *(_QWORD *)v17;
  LODWORD(v9) = -32768;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(a1);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "intValue");
      if (a3)
        v12 = dword_1000A28AC;
      else
        v12 = a2;
      v13 = v12[v11];
      if ((int)v9 <= v13)
        v14 = v13;
      else
        v14 = v9;
      if (v13 == 3000)
        v9 = v9;
      else
        v9 = v14;
    }
    v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
  return v9;
}

uint64_t sub_100006FB0(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3)
{
  __CFDictionary *Mutable;
  CFNumberRef v7;
  CFNumberRef v8;
  uint64_t v9;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = CFNumberCreate(0, kCFNumberSInt32Type, a3);
  if (v7
    && (v8 = v7, CFDictionaryAddValue(Mutable, a2, v7), CFRelease(v8), !IORegistryEntrySetCFProperties(a1, Mutable)))
  {
    v9 = sub_100007070(a1, a2, a3, 1);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(Mutable);
  return v9;
}

uint64_t sub_100007070(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3, uint64_t a4)
{
  const __CFString *CFProperty;
  const __CFString *v8;
  CFTypeID TypeID;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  int valuePtr;
  uint8_t buf[4];
  const __CFString *v18;

  valuePtr = 0;
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v8 = CFProperty;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFNumberGetValue((CFNumberRef)v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        a4 = 1;
LABEL_23:
        CFRelease(v8);
        return a4;
      }
      v14 = qword_1000A28A0;
      if ((_DWORD)a4)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000527A0();
        goto LABEL_22;
      }
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 138412290;
      v18 = a2;
      v12 = "<Notice> %@ could not be converted to kCFNumberSInt32Type";
      v13 = v14;
    }
    else
    {
      v11 = qword_1000A28A0;
      if ((_DWORD)a4)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052800();
        goto LABEL_22;
      }
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      v12 = "<Notice> %@ not a CFNumber";
      v13 = v11;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_22:
    a4 = 0;
    goto LABEL_23;
  }
  v10 = qword_1000A28A0;
  if ((_DWORD)a4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052740();
    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = a2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> could not find %@ property", buf, 0xCu);
    return 0;
  }
  return a4;
}

void sub_100008A64()
{
  double Current;
  NSObject *v1;
  const char *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  if ((int)qword_1000A2478 < 12)
  {
    sub_100008D0C();
    sub_100009248(0, (const __CFString *)qword_1000A1F08, CFSTR("wake"), (CFTimeInterval *)&qword_1000A1F00);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (*(double *)&qword_1000A1F00 >= Current + 60.0)
    {
      if (byte_1000A2480)
      {
        v3 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 138412290;
          v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> not setting timer: already set to wake at %@", (uint8_t *)&v8, 0xCu);
        }
      }
    }
    else
    {
      *(double *)&qword_1000A1F00 = Current + 600.0;
      if (byte_1000A2480)
      {
        v1 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          if (byte_10009A1F0)
            v2 = "";
          else
            v2 = "Disabled: ";
          v8 = 136315394;
          v9 = v2;
          v10 = 1024;
          v11 = 600;
          _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> %ssetting wake up timer for %d secs from now", (uint8_t *)&v8, 0x12u);
        }
      }
      if (byte_10009A1F0)
        sub_1000344C0(0, (const __CFString *)qword_1000A1F08, CFSTR("wake"), *(CFAbsoluteTime *)&qword_1000A1F00);
    }
    if ((int)qword_1000A2478 < 16)
    {
      sub_100008D0C();
    }
    else
    {
      v4 = qword_1000A28A0;
      v5 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
      v6 = byte_10009A1F0;
      if (v5)
      {
        if (byte_10009A1F0)
          v7 = "";
        else
          v7 = "Disabled: ";
        v8 = 136315138;
        v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> %sthermal status level critical -- cooling down", (uint8_t *)&v8, 0xCu);
        v6 = byte_10009A1F0;
      }
      if (v6)
      {
        qword_1000A1F50 = 0;
        if (byte_1000A2490)
        {
          byte_1000A2490 = 0;
          qword_1000A2AB0 = 0;
        }
        if (byte_1000A2DC1)
          byte_1000A2DC1 = 0;
        sub_10003442C();
      }
    }
  }
}

void sub_100008D0C()
{
  IOReturn v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];

  if (dword_1000A1F64)
  {
    v0 = IOPMAssertionRelease(dword_1000A1F64);
    if (v0)
    {
      v1 = v0;
      v2 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000515CC(v1, v2, v3);
    }
    else if (byte_1000A2480)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = dword_1000A1F64;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> cleared idle sleep assertion: 0x%08x", (uint8_t *)v5, 8u);
      }
    }
    dword_1000A1F64 = 0;
  }
}

void sub_100008E04(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[9];

  if (a3 == -536723200)
  {
    block[7] = v3;
    block[8] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009868;
    block[3] = &unk_10007D248;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)objc_msgSend(a1, "inPocketQueue"), block);
  }
}

void sub_100008E74()
{
  NSObject *v0;
  uint8_t v1[16];

  if (!dword_1000A23A0)
  {
    dword_1000A23A0 = sub_1000340B8("IOPMPowerSource", 0, 0);
    if (!dword_1000A23A0)
    {
      if (byte_1000A2480)
      {
        v0 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v1 = 0;
          _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> initPowerSource: Failed to Match IOPMPowerSource", v1, 2u);
        }
      }
    }
  }
}

uint64_t sub_100008F14()
{
  uint64_t result;
  NSObject *v1;
  const char *v2;
  uint8_t v3[16];
  uint64_t v4;
  int v5;

  LOWORD(result) = (unsigned __int16)-[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("B0AP"));
  if ((_WORD)result != 0xFFFF)
    return (__int16)result;
  sub_100008E74();
  v5 = 0;
  v4 = 0;
  if ((sub_100007070(dword_1000A23A0, CFSTR("Voltage"), &v5, 1) & 1) != 0)
  {
    if ((sub_100003738(dword_1000A23A0, CFSTR("InstantAmperage"), &v4) & 1) != 0)
      return v4 * v5 / 1000;
    if (!byte_1000A2480)
      return 0;
    v1 = qword_1000A28A0;
    if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_WORD *)v3 = 0;
    v2 = "<Notice> getGasGaugeAveragePower: Failed to find InstantAmperage";
  }
  else
  {
    if (!byte_1000A2480)
      return 0;
    v1 = qword_1000A28A0;
    if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_WORD *)v3 = 0;
    v2 = "<Notice> getGasGaugeAveragePower: Failed to find Voltage";
  }
  _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  return 0;
}

uint64_t sub_10000906C()
{
  uint64_t result;
  unsigned int v1;

  result = dword_10009A270;
  v1 = dword_10009A270;
  if (dword_10009A270 == -1)
  {
    IOPSGetPercentRemaining(&v1, 0, 0);
    return v1;
  }
  return result;
}

BOOL sub_1000090AC()
{
  time_t v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _DWORD *v8;
  unint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;

  v0 = time(0);
  if (v0 == -1)
    return 0;
  v1 = v0;
  v2 = qword_10009A200;
  v4 = v0 < qword_10009A200 || v0 > qword_10009A200 + 59;
  if (v4)
  {
    v5 = dword_1000A1EE4;
    if (dword_1000A1EE4 >= 1)
    {
      v6 = 0;
      v7 = byte_1000A2490;
      v8 = (_DWORD *)(qword_1000A1EE8 + 4);
      v9 = qword_1000A2AB0;
      do
      {
        if (!v7 || ((v9 >> v6) & 1) == 0)
        {
          *((_DWORD *)&qword_1000A29AC + v6) = -32768;
          dword_1000A28AC[v6] = -32768;
          *v8 = 0x80000000;
        }
        dword_1000A1DE0[v6] = *((_DWORD *)&qword_1000A29AC + v6);
        ++v6;
        v8 += 2;
      }
      while (v5 != v6);
    }
    qword_1000A1F50 = 0;
    dword_1000A1EF0 = 0;
    dword_1000A1EF4 = 0;
    if (byte_1000A2480)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218240;
        v13 = v1;
        v14 = 2048;
        v15 = v2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> resetting temps: now = %ld, last update = %ld", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  qword_10009A200 = v1;
  return v4;
}

CFTimeInterval sub_100009248(const __CFDate *a1, const __CFString *a2, const __CFString *a3, CFTimeInterval *a4)
{
  CFTimeInterval result;

  if (a1)
  {
    if (IOPMCancelScheduledPowerEvent(a1, a2, a3))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100052A18();
    }
    CFRelease(a1);
    result = -kCFAbsoluteTimeIntervalSince1970;
    *a4 = -kCFAbsoluteTimeIntervalSince1970;
  }
  return result;
}

uint64_t sub_1000092C0(uint64_t a1, char **a2)
{
  NSObject *v4;
  uint64_t result;
  int *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  CFIndex Count;
  CFIndex v36;
  CFIndex i;
  unsigned int v38;
  int v39;
  char *v40;
  char *v41;
  uint64_t j;
  char *v43;
  const char *v44;
  const char *v45;
  int v46;
  int v47;
  double v48;
  uint64_t times;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  size_t v60;
  uint64_t v61;
  uint64_t v62;
  __int16 v63;
  __int128 buf;

  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> wd_endpoint getalive_func\n", (uint8_t *)&buf, 2u);
    }
  }
  qword_1000A1F30 = qword_1000A1F50;
  if (qword_1000A1F20 != 1 || (qword_1000A1F58 & qword_1000A1F50) == qword_1000A1F18)
  {
    byte_1000A1F60 = 0;
    result = 1;
LABEL_49:
    qword_1000A1F50 = 0;
    return result;
  }
  if ((byte_1000A1F40 & 1) != 0)
  {
LABEL_28:
    v33 = qword_1000A1F50;
    v34 = qword_1000A1F18;
    Count = CFArrayGetCount(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"));
    if (Count >= 1)
    {
      v36 = Count;
      for (i = 0; i != v36; ++i)
      {
        if ((v34 & 1) != 0 && (v33 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), i));
        v33 >>= 1;
        v34 >>= 1;
      }
    }
    v38 = objc_msgSend(*(id *)(a1 + 32), "count");
    v39 = v38;
    if (v38)
    {
      v40 = (char *)malloc_type_malloc((int)(5 * v38) + 1, 0x528C4C82uLL);
      if (v40)
      {
        v41 = v40;
        *v40 = 0;
        if (v39 >= 1)
        {
          for (j = 0; j != v39; ++j)
          {
            v43 = strcat(v41, (const char *)objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", j), "cStringUsingEncoding:", 4));
            *(_WORD *)&v41[strlen(v43)] = 32;
          }
        }
        WORD4(buf) = 0;
        *(_QWORD *)&buf = 540689491;
        if (-[HidSensors isSensorDataValid](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isSensorDataValid"))
        {
          v44 = "1";
        }
        else
        {
          v44 = "0";
        }
        __strcat_chk(&buf, v44, 10);
        v63 = 0;
        v62 = 540689218;
        if (sub_100035F90())
          v45 = "1";
        else
          v45 = "0";
        __strcat_chk(&v62, v45, 10);
        v46 = sub_1000362D4();
        v47 = sub_100036300();
        asprintf(a2, "current %llx, mask %llx, expected %llx. %s %s RC: %d BS: %d, Missing sensor(s): %s", qword_1000A1F50, qword_1000A1F58, qword_1000A1F18, (const char *)&buf, (const char *)&v62, v46, v47, v41);
        free(v41);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100051B34();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    result = 0;
    goto LABEL_49;
  }
  v60 = 8;
  v61 = 0;
  if (sysctlbyname("kern.wake_abs_time", &v61, &v60, 0, 0))
  {
    v6 = __error();
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051C28((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v58 = 0.0;
  v59 = 0.0;
  v14 = IOPMGetLastWakeTime(&v59, &v58);
  if ((_DWORD)v14)
  {
    v15 = v14;
    v16 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051BC4(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v24 = v61;
    if (v61)
    {
      v25 = (unint64_t)(v58 * 1000000000.0) * *(unsigned int *)algn_1000A1F48 / dword_1000A1F44;
      *(_QWORD *)&buf = 0;
      v62 = 0;
      mach_get_times(&buf, &v62, 0);
      v23 = v25 - (v24 + v62) + buf;
      goto LABEL_17;
    }
    v48 = v59;
    v62 = 0;
    buf = 0uLL;
    times = mach_get_times(0, &v62, &buf);
    if (!(_DWORD)times)
    {
      v23 = (unint64_t)(((double)(uint64_t)buf
                              - kCFAbsoluteTimeIntervalSince1970
                              + (double)*((uint64_t *)&buf + 1) / 1000000000.0
                              - v48)
                             * (double)(1000000000
                                      * (unint64_t)*(unsigned int *)algn_1000A1F48
                                      / dword_1000A1F44))
          - v62;
      goto LABEL_17;
    }
    v50 = times;
    v51 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051B60(v50, v51, v52, v53, v54, v55, v56, v57);
  }
  v23 = 0;
LABEL_17:
  v26 = mach_continuous_time();
  v28 = dword_1000A1F44;
  v27 = *(unsigned int *)algn_1000A1F48;
  v29 = byte_1000A1F60;
  v30 = qword_1000A28A0;
  v31 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
  if ((v29 & 1) != 0 || (v32 = (v26 + v23) * v28 / v27, v32 > 0x2540BE3FFLL))
  {
    if (v29)
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: found previous error sensor result, do not ignore", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: found error sensor result", (uint8_t *)&buf, 2u);
      }
      byte_1000A1F60 = 1;
    }
    goto LABEL_28;
  }
  if (v31)
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v32 / 0x3B9ACA00;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: ignore current sensor result cause system just woke up %lld second(s)ago", (uint8_t *)&buf, 0xCu);
  }
  return 1;
}

id sub_100009868(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConnectedExternally:", sub_100003320((io_registry_entry_t)objc_msgSend(*(id *)(a1 + 32), "pmuPowerService"), CFSTR("ExternalConnected")));
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

id sub_1000098A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

id sub_1000098B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInternal");
}

id sub_1000098B8(uint64_t a1)
{
  id result;
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400));
  if ((result & 1) == 0)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_1000850A8, CFSTR("ThermalMiscState"), 0);
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392));
    logEventForAppleCare(v3);
    if (byte_1000A2480)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v6 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Logged for AC: %@", buf, 0xCu);
      }
    }

    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "copy");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = result;
  }
  return result;
}

NSDictionary *sub_10000B968(uint64_t a1)
{
  _QWORD v3[21];
  _QWORD v4[21];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev3");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev5");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("PMU2_Tdev1");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("PMU2_Tdev2");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("PMU2_Tdev3");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSBM");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSFD");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSBQ");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Die_Temp_MaxAverage");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Die_Temp_MaxMax");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("maxLI_PackagePower");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("maxLI_Speaker");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("BackLight_maxLI");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("Solar_Context");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 112));
  v3[17] = CFSTR("Pressure_Level");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[18] = CFSTR("Gas_Gauge_avg_Power");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v3[19] = CFSTR("Charger_State");
  v4[19] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v3[20] = CFSTR("Package_Power");
  v4[20] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 21);
}

NSDictionary *sub_10000BEB8(uint64_t a1)
{
  _QWORD v3[23];
  _QWORD v4[23];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev3");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev4");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("PMU_Tdev5");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("PMU2_Tdev1");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("PMU2_Tdev2");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("PMU2_Tdev3");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSBM");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFD");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("TSBQ");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("TSBR");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Die_Temp_MaxAverage");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Die_Temp_MaxMax");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("maxLI_PackagePower");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("maxLI_Speaker");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[17] = CFSTR("BackLight_maxLI");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v3[18] = CFSTR("Solar_Context");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 120));
  v3[19] = CFSTR("Pressure_Level");
  v4[19] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v3[20] = CFSTR("Gas_Gauge_avg_Power");
  v4[20] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  v3[21] = CFSTR("Charger_State");
  v4[21] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 112));
  v3[22] = CFSTR("Package_Power");
  v4[22] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 116));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 23);
}

void sub_10000C2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C300(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t sub_10000C34C(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

NSDictionary *sub_10000C5E4(uint64_t a1)
{
  _QWORD v3[10];
  _QWORD v4[10];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev2");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev3");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev5");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSFD");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("Die_Temp_MaxAverage");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("maxLI_PackagePower");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Solar_Context");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 68));
  v3[9] = CFSTR("Pressure_Level");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 10);
}

NSDictionary *sub_10000C930(uint64_t a1)
{
  _QWORD v3[11];
  _QWORD v4[11];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev3");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev5");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSFD");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_PackagePower");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Solar_Context");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 72));
  v3[10] = CFSTR("Pressure_Level");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
}

NSDictionary *sub_10000CCE8(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TR1d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBR");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Package_Power");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Gas_Gauge_avg_Power");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Charger_State");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Solar_Context");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

NSDictionary *sub_10000D0B8(uint64_t a1)
{
  _QWORD v3[11];
  _QWORD v4[11];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev4");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev7");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev8");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSFD");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_PackagePower");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Solar_Context");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 72));
  v3[10] = CFSTR("Pressure_Level");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
}

NSDictionary *sub_10000D670(uint64_t a1)
{
  _QWORD v3[16];
  _QWORD v4[16];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBQ");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBM");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBR");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP4d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TP5d");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("batteryVT");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxAverage");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Die_Temp_MaxMax");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("maxLI_CPU");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("maxLI_GPU");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Gas_Gauge_avg_Power");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Charger_State");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("Solar_Context");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 92));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
}

NSDictionary *sub_10000DA88(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBR");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Charger_State");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Solar_Context");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  v3[12] = CFSTR("Pressure_Level");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

void sub_10000DF88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 128));
  _Unwind_Resume(a1);
}

float sub_10000DFE8(uint64_t a1, uint64_t a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    result = (float)(int)state64;
    *(float *)&dword_1000A2B0C = (float)(int)state64;
  }
  return result;
}

id sub_10000E054(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraSensorIdx"));
}

float sub_10000E08C(uint64_t a1, uint64_t a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontCameraSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    result = (float)(int)state64;
    *(float *)&dword_1000A2B18 = (float)(int)state64;
  }
  return result;
}

id sub_10000E0F8(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontCameraSensorIdx"));
}

id sub_10000E130(uint64_t a1, int a2)
{
  id Weak;
  id result;
  TGraphSampler *v5;
  uint64_t v6;
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result)
  {
    objc_msgSend(Weak, "setTorchState:", state64);
    *(float *)&dword_1000A2AE0 = (float)(int)state64;
    v5 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
    if (state64)
      v6 = 100;
    else
      v6 = 0;
    return -[TGraphSampler updatePowerlogMiscState:value:](v5, "updatePowerlogMiscState:value:", 4, v6);
  }
  return result;
}

void sub_10000E2C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10000E2F0(uint64_t a1, uint64_t a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraTeleSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    result = (float)(int)state64;
    *(float *)&dword_1000A2B10 = (float)(int)state64;
  }
  return result;
}

id sub_10000E35C(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraTeleSensorIdx"));
}

void sub_10000E4A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10000E4CC(uint64_t a1, uint64_t a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraSuperWideSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    result = (float)(int)state64;
    *(float *)&dword_1000A2B14 = (float)(int)state64;
  }
  return result;
}

id sub_10000E538(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraSuperWideSensorIdx"));
}

void sub_10000E67C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10000E6A8(uint64_t a1, uint64_t a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraJasperSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    result = (float)(int)state64;
    *(float *)&dword_1000A2B1C = (float)(int)state64;
  }
  return result;
}

id sub_10000E714(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "rearCameraJasperSensorIdx"));
}

void sub_10000E858(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_10000E884(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontIRCameraSensorIdx"));
}

id sub_10000E8BC(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontIRCameraSensorIdx"));
}

void sub_10000EA00(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_10000EA2C(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontRomeoNTCSensorIdx"));
}

id sub_10000EA64(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontRomeoNTCSensorIdx"));
}

void sub_10000EBA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_10000EBD4(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleTemperatureChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontRigelDieSensorIdx"));
}

id sub_10000EC0C(uint64_t a1, uint64_t a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "handleStateChangeNotification:temperatureSensorIndex:", a2, objc_msgSend(Weak, "frontRigelDieSensorIdx"));
}

id sub_10000EF58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result;
  uint64_t v8;

  if (IOHIDEventGetType(a4) == 15 || (result = (id)IOHIDEventGetType(a4), (_DWORD)result == 31))
  {
    v8 = (int)(IOHIDEventGetFloatValue(a4, 983040) * 100.0);
    return objc_msgSend(a1, "handleTemperatureEvent:service:", v8, a3);
  }
  return result;
}

void sub_10000EFD8(id a1)
{
  qword_10009A370 = objc_alloc_init(HidSensors);
}

void sub_10000FD08(id a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;

  dword_10009A380 = sub_1000340B8("AppleVTempDispatcher", 0, 0);
  if (!dword_10009A380)
  {
    v1 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004E998(v1, v2, v3);
  }
}

BOOL sub_10001035C(uint64_t a1, IOHIDServiceClientRef service)
{
  CFTypeRef v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CFTypeID v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int valuePtr;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];

  v4 = IOHIDServiceClientCopyProperty(service, CFSTR("Product"));
  valuePtr = -1;
  v5 = (const __CFNumber *)IOHIDServiceClientCopyProperty(service, CFSTR("LocationID"));
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      CFRelease(v6);
      if (valuePtr != -1)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", sub_10003432C(valuePtr));
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = *(void **)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      if (v4)
      {
        v14 = CFGetTypeID(v4);
        if (v14 == CFStringGetTypeID() && (objc_msgSend(v13, "isEqualToString:", v4) & 1) != 0)
          goto LABEL_23;
      }
      if (objc_msgSend(v13, "length") == (id)4)
      {
        v15 = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4);
        if (v15)
        {
          v16 = v15;
          if (strlen(v15) == 4)
          {
            v17 = 0;
            v18 = 0;
            do
              v18 = v16[v17++] + (v18 << 8);
            while ((_DWORD)v17 != 4);
            if (v18 == valuePtr)
              goto LABEL_22;
          }
        }
      }
      if ((id)++v12 == v10)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v10)
          goto LABEL_7;
        break;
      }
    }
  }
  v13 = 0;
LABEL_22:
  if (v4)
LABEL_23:
    CFRelease(v4);
  if (v13)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 48) + 672), service, v13);
    v19 = objc_msgSend(*(id *)(a1 + 48), "callbackSensorInterval:", v13);
    if ((int)v19 >= 1)
    {
      v20 = v19;
      v21 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v13;
        v33 = 1024;
        v34 = (int)v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> callback interval for %@: %d", buf, 0x12u);
      }
      IOHIDServiceClientSetProperty(service, CFSTR("ReportInterval"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(NSObject **)(v22 + 104);
      if (v23)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100010660;
        v25[3] = &unk_10007D188;
        v25[4] = v22;
        v25[5] = v13;
        dispatch_async(v23, v25);
      }
    }
  }
  return v13 != 0;
}

CFNumberRef sub_100010660(uint64_t a1)
{
  int valuePtr;

  valuePtr = -12700;
  if (-[HidSensors readFailuresExpected:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "readFailuresExpected:", *(_QWORD *)(a1 + 40)))
  {
    valuePtr = 3000;
  }
  return sub_10000536C(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 80), *(const void **)(a1 + 40), kCFNumberSInt32Type, &valuePtr);
}

void sub_1000106C0(uint64_t a1)
{
  sub_1000048B0(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 80), *(void **)(a1 + 48), kCFNumberSInt32Type, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 80), *(const void **)(a1 + 48));
}

CFNumberRef sub_100010AB0(uint64_t a1)
{
  CFNumberRef result;

  result = (CFNumberRef)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 672), *(const void **)(a1 + 40));
  if (result)
    return sub_10000536C(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 80), result, kCFNumberSInt32Type, (void *)(a1 + 48));
  return result;
}

void sub_100010E98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_100010EA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

_BYTE *sub_100010EB0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

NSDictionary *sub_10001132C(uint64_t a1)
{
  _QWORD v3[12];
  _QWORD v4[12];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxMax");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Charger_State");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Solar_Context");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 76));
  v3[11] = CFSTR("Pressure_Level");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
}

_UNKNOWN **sub_100011C98(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_100085750;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = result;
  return result;
}

_UNKNOWN **sub_100011D54(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_100085768;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = result;
  return result;
}

NSDictionary *sub_1000122BC(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("Die_Temp_MaxAverage");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("Die_Temp_MaxMax");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSFC");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TS0A");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFD");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSRM");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFG");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  v3[13] = CFSTR("Pressure_Level");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

void sub_100012908(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

NSDictionary *sub_100012BA8(uint64_t a1)
{
  _QWORD v3[10];
  _QWORD v4[10];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev4");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev7");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev8");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSFD");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("Die_Temp_MaxAverage");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("maxLI_PackagePower");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Solar_Context");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 68));
  v3[9] = CFSTR("Pressure_Level");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 10);
}

void sub_1000137C4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1000137D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100015BE8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100015C08()
{
  return SCError();
}

NSDictionary *sub_100015E74(uint64_t a1)
{
  _QWORD v3[15];
  _QWORD v4[15];

  v3[0] = CFSTR("TT7D");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TG0B");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFD");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFL");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSFG");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxMax");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("maxLI_CPU");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("maxLI_GPU");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("maxLI_RR");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Gas_Gauge_avg_Power");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Charger_State");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Solar_Context");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 88));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 15);
}

NSDictionary *sub_100018300(uint64_t a1)
{
  _QWORD v3[19];
  _QWORD v4[19];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TG0V");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev1");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev2");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBR");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBE");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSRR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSRM");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFL");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSFC");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFD");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("TSBQ");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Die_Temp_MaxAverage");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Die_Temp_MaxMax");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Package_Power");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("Charger_State");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("Solar_Context");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 100));
  v3[17] = CFSTR("Pressure_Level");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[18] = CFSTR("Accessory");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 101));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 19);
}

void sub_100018588(id a1)
{
  if (byte_1000A2E2A)
    qword_10009A3B0 = objc_alloc_init(PowerZoneTelemetry);
}

_UNKNOWN **sub_1000191FC(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_1000857B0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = result;
  return result;
}

_UNKNOWN **sub_1000192B8(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_1000857C8;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = result;
  return result;
}

NSDictionary *sub_10001946C(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TT7D");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TG0B");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFD");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFL");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSFG");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBH");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("Die_Temp_MaxAverage");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxMax");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_CPU");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("maxLI_GPU");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("maxLI_RR");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Gas_Gauge_avg_Power");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Charger_State");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Solar_Context");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

NSDictionary *sub_100019E98(uint64_t a1)
{
  _QWORD v3[16];
  _QWORD v4[16];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBQ");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBM");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBR");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP4d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TP5d");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("batteryVT");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxAverage");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Die_Temp_MaxMax");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("maxLI_CPU");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("maxLI_GPU");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Gas_Gauge_avg_Power");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Charger_State");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("Solar_Context");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 92));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
}

NSDictionary *sub_10001A27C(uint64_t a1)
{
  _QWORD v3[11];
  _QWORD v4[11];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev3");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev4");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev5");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev7");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("Die_Temp_MaxAverage");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSFD");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBH");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSBR");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Solar_Context");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 72));
  v3[10] = CFSTR("Pressure_Level");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
}

void sub_10001A41C(id a1)
{
  qword_10009A3D8 = objc_alloc_init(CPMSHelper);
}

void sub_10001A684(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  char v11;
  uint8_t buf[4];
  uint64_t v13;

  if (a3 == -528318202)
  {
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v13 = a4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> CPMS Helper, peak pressure %lld", buf, 0xCu);
      }
    }
    v6 = objc_msgSend(a1, "cpmsHelperQueue");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001B36C;
    v9[3] = &unk_10007D188;
    v9[4] = a1;
    v9[5] = a4;
    v7 = v9;
  }
  else
  {
    if (a3 != -528318205)
      return;
    v6 = objc_msgSend(a1, "cpmsHelperQueue");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B214;
    v10[3] = &unk_10007D8E0;
    v11 = a4;
    v10[4] = a1;
    v7 = v10;
  }
  dispatch_async(v6, v7);
}

void sub_10001AF30(_QWORD *a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  unsigned int v16;
  unsigned int v17;
  void *v18;

  if (a4 == 4)
  {
    if ((_DWORD)a2)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FB54(a2, v5, v6, v7, v8, v9, v10, v11);
    }
    else
    {
      v16 = objc_msgSend(a1, "getMitigationTypeForClientID:", *a3);
      if (v16 != -1)
      {
        v17 = v16;
        v18 = (void *)a1[63];
        if (v18)
          objc_msgSend(objc_msgSend(v18, "findComponent:"), "setCurrentPower:", *(_QWORD *)&a3[8 * *(int *)&byte_10007D728[24 * v17 + 16]]);
      }
    }
  }
  else
  {
    v13 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FBB8(a4, v13);
  }
}

_QWORD *sub_10001B214(_QWORD *result, __n128 a2)
{
  _QWORD *v2;
  uint64_t v3;
  char **v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __n128 v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;

  v2 = result;
  v3 = 0;
  v4 = &off_10007D730;
  a2.n128_u64[0] = 67109634;
  v9 = a2;
  do
  {
    if (*((unsigned __int8 *)v4 - 8) == *((unsigned __int8 *)v2 + 40))
    {
      result = objc_msgSend(*(id *)(v2[4] + 504), "findComponent:", v3);
      if (result)
      {
        v5 = result;
        if (byte_1000A2480)
        {
          v6 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *((unsigned __int8 *)v2 + 40);
            v8 = *v4;
            *(_DWORD *)buf = v9.n128_u32[0];
            v11 = v7;
            v12 = 1024;
            v13 = v3;
            v14 = 2080;
            v15 = v8;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> registration call back for clientID: %u MitigationType:%d clientName:%s", buf, 0x18u);
          }
        }
        result = objc_msgSend(v5, "setCPMSMitigationState:", objc_msgSend(v5, "isCPMSControlEnabled", *(_OWORD *)&v9));
      }
    }
    v4 += 3;
    ++v3;
  }
  while (v3 != 18);
  return result;
}

void sub_10001B36C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (byte_10009A1F0)
  {
    -[TGraphSampler updateAppleCareState:value:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updateAppleCareState:value:", 4, *(unsigned int *)(a1 + 40));
    if (notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 512), *(_QWORD *)(a1 + 40)))
    {
      v2 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FCF4(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    else if (notify_post("com.apple.system.peakpowerpressurelevel"))
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FCC4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void sub_10001B420(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10001B430(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

NSDictionary *sub_10001C2F4(uint64_t a1)
{
  _QWORD v3[12];
  _QWORD v4[12];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("Die_Temp_MaxAverage");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("Die_Temp_MaxMax");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSFC");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSRR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSFD");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSRM");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Charger_State");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Solar_Context");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 76));
  v3[11] = CFSTR("Pressure_Level");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
}

_UNKNOWN **sub_10001D7C8(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_1000857E0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = result;
  return result;
}

_UNKNOWN **sub_10001D884(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_1000857F8;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = result;
  return result;
}

NSDictionary *sub_10001E060(uint64_t a1)
{
  NSNumber *v2;
  uint64_t v3;
  _QWORD v5[20];
  _QWORD v6[20];

  v5[0] = CFSTR("TG0B");
  v6[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5[1] = CFSTR("TG0V");
  v6[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v5[2] = CFSTR("PMU_Tdev1");
  v6[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5[3] = CFSTR("PMU_Tdev2");
  v6[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v5[4] = CFSTR("TSRR");
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5[5] = CFSTR("TSBR");
  v6[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v5[6] = CFSTR("TSRM");
  v6[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v5[7] = CFSTR("TSFL");
  v6[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v5[8] = CFSTR("TSFC");
  v6[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v5[9] = CFSTR("TSFD");
  v6[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v5[10] = CFSTR("mic2");
  v6[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5[11] = CFSTR("TSBQ");
  v6[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v5[12] = CFSTR("TSFG");
  v6[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v5[13] = CFSTR("Die_Temp_MaxAverage");
  v6[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v5[14] = CFSTR("Die_Temp_MaxMax");
  v6[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v5[15] = CFSTR("Package_Power");
  v6[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v5[16] = CFSTR("Charger_State");
  v6[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v5[17] = CFSTR("Solar_Context");
  v6[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 112));
  v5[18] = CFSTR("Pressure_Level");
  v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  v5[19] = CFSTR("Device_Activity");
  v3 = *(_QWORD *)(a1 + 32);
  v6[18] = v2;
  v6[19] = v3;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 20);
}

NSDictionary *sub_10001E71C(uint64_t a1)
{
  _QWORD v3[12];
  _QWORD v4[12];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxMax");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Charger_State");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Solar_Context");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 76));
  v3[11] = CFSTR("Pressure_Level");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
}

void sub_10001F21C(id a1)
{
  qword_1000A1D40 = objc_alloc_init(TGraphSampler);
}

void sub_10001FCEC(__CFArray *a1, CFStringRef format, double a3)
{
  CFStringRef v4;

  v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, format, *(_QWORD *)&a3);
  CFArrayAppendValue(a1, v4);
  if (v4)
    CFRelease(v4);
}

id sub_10001FEB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIntValue:forKey:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

id sub_10001FFC0(uint64_t a1)
{
  return objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "cacheArray"), "addObject:", *(_QWORD *)(a1 + 40));
}

id sub_1000200E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "logHIPStatusToPowerlogLite:", *(_QWORD *)(a1 + 40));
}

id sub_100020214(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "setObject:atIndexedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44)), *(unsigned int *)(a1 + 40));
}

id sub_100020250(_QWORD *a1)
{
  id result;
  BOOL v3;

  result = objc_msgSend(objc_msgSend(*(id *)(a1[4] + 368), "cacheArray"), "count");
  if (a1[5])
    v3 = result == 0;
  else
    v3 = 1;
  if (!v3)
  {
    result = objc_msgSend(*(id *)(a1[4] + 368), "logToPowerlogLite");
    *(_QWORD *)(a1[4] + 56) = a1[6];
  }
  return result;
}

void sub_1000202A4(uint64_t a1)
{
  int v2;
  CFStringRef v3;
  CFStringRef v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  timeval v8;

  v2 = PLShouldLogRegisteredEvent(18, CFSTR("TGraph"));
  if (v2 || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
  {
    v8.tv_sec = 0;
    *(_QWORD *)&v8.tv_usec = 0;
    if (!gettimeofday(&v8, 0))
    {
      v3 = CFStringCreateWithFormat(0, 0, CFSTR("%0.2f"), (double)v8.tv_usec / 1000000.0 + (double)v8.tv_sec);
      if (v3)
      {
        v4 = v3;
        if (v2)
        {
          v5 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v5 + 48))
          {
            objc_msgSend((id)v5, "updateSubkeyController:forControlList:", *(_QWORD *)(v5 + 328), *(_QWORD *)(v5 + 24));
            objc_msgSend(*(id *)(a1 + 32), "updateSubkeyController:forControlList:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "logToPowerlog:", v4);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "logToPowerlog:", v4);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "logToPowerlog:", v4);
            v5 = *(_QWORD *)(a1 + 32);
          }
          objc_msgSend((id)v5, "updatePowerLogDictionaryForSensors");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "logToPowerlog:", v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "logToPowerlog:", v4);
        }
        v6 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v6 + 49))
        {
          objc_msgSend(*(id *)(v6 + 384), "logToPowerlog:", v4);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
        }
        CFRelease(v4);
      }
    }
  }
  else if (byte_1000A2480)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8.tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&v8.tv_sec + 4) = (__darwin_time_t)"-[TGraphSampler logToPowerlog]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> %s: denied", (uint8_t *)&v8, 0xCu);
    }
  }
}

NSDictionary *sub_1000213F4(uint64_t a1)
{
  _QWORD v3[19];
  _QWORD v4[19];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TG0V");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev1");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev2");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBR");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBE");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSRR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSRM");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFL");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSFC");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFD");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("TSBQ");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Die_Temp_MaxAverage");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Die_Temp_MaxMax");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Package_Power");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("Charger_State");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("Solar_Context");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 100));
  v3[17] = CFSTR("Pressure_Level");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[18] = CFSTR("Accessory");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 101));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 19);
}

NSDictionary *sub_1000218EC(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TS0A");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBH");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TP6D");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("Die_Temp_MaxAverage");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("Die_Temp_MaxMax");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("maxLI_CPU");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_GPU");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("maxLI_RR");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Gas_Gauge_avg_Power");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

NSDictionary *sub_100022130(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxMax");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Package_Power");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Gas_Gauge_avg_Power");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

NSDictionary *sub_100022ED0(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TR1d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxAverage");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxMax");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Package_Power");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Gas_Gauge_avg_Power");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

void sub_10002358C(id a1)
{
  qword_1000A1D58 = (uint64_t)os_log_create("com.apple.thermalmonitor", "agingcontroller");
}

void sub_100023E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023E7C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100023E8C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100023E98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unsigned int v12;

  v2 = a1 + 32;
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "mitigationState");
    v9 = 136315394;
    v10 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
    v11 = 1024;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Notification callback called. Mitigation state %d\n", (uint8_t *)&v9, 0x12u);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "mitigationState") != (id)1)
  {
    v6 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), v5), "log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100050374(v2, v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "updateMitigationStateAndNotify:", 3);
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "defaults"), "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "mitigationState")), CFSTR("MitigationState"));
  v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), v7), "log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000502D8(v2);
}

void sub_1000246D8(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v2 = IOServiceMatching("ApplePPM");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 16))
  {
    v5 = objc_msgSend((id)objc_opt_class(v4, v3), "log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000508B4();
  }
}

void sub_1000247A8(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _xpc_connection_s *mach_service;
  xpc_object_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[6];
  _QWORD handler[5];

  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), a2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100050938(v3, v4, v5, v6, v7, v8, v9, v10);
  mach_service = xpc_connection_create_mach_service("com.apple.thermalMonitor.displayMitigationsEnabledNote", *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32), 2uLL);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v12, "postNotification", 1);
  v13 = dispatch_semaphore_create(0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100024960;
  handler[3] = &unk_10007DB58;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_connection_set_event_handler(mach_service, handler);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(NSObject **)(v14 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000249B4;
  v20[3] = &unk_10007DB80;
  v20[4] = v13;
  v20[5] = v14;
  xpc_connection_send_message_with_reply(mach_service, v12, v15, v20);
  xpc_connection_activate(mach_service);
  v17 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v16), "log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_10005090C();
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v19 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v18), "log");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_1000508E0();
  xpc_connection_cancel(mach_service);
  if (v12)
    xpc_release(v12);
  if (v13)
    dispatch_release(v13);
  if (mach_service)
    xpc_release(mach_service);
}

void sub_100024960(uint64_t a1, void *a2)
{
  NSObject *v2;

  if (a2 == &_xpc_error_connection_interrupted)
  {
    v2 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), a2), "log");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1000509A8();
  }
}

void sub_1000249B4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 40), v2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000509D4();
}

void sub_100024B08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100024B18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100024B28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100024C78(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "handleCurrentTopOffStatusWithContext:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "inPocketQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024CEC;
  block[3] = &unk_10007D248;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100024CEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

void sub_100025058(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_100025070(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForTopOffStatusChanges");
}

uint64_t sub_100025214(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v8;
  io_object_t notification;
  _QWORD block[5];

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      if (a1)
      {
        objc_msgSend(a1, "setPmuPowerService:", v5);
        notification = 0;
        IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(a1, "notificationPort"), (io_service_t)objc_msgSend(a1, "pmuPowerService"), "IOGeneralInterest", (IOServiceInterestCallback)sub_100008E04, a1, &notification);
        objc_msgSend(a1, "setNotification:", notification);
        Current = CFRunLoopGetCurrent();
        RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(a1, "notificationPort"));
        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
        v8 = objc_msgSend(a1, "inPocketQueue");
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009868;
        block[3] = &unk_10007D248;
        block[4] = a1;
        dispatch_async(v8, block);
      }
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_100025408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000254DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10002564C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "powerIsOn") & 1) == 0 && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setWakeInProgressUntilTime:", dispatch_time(0, 1000000000));
    v2 = objc_msgSend(*(id *)(a1 + 32), "wakeInProgressUntilTime");
    v3 = objc_msgSend(*(id *)(a1 + 32), "inPocketQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002579C;
    block[3] = &unk_10007D248;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after((dispatch_time_t)v2, v3, block);
  }
  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> UpdateSystemPower: Updare Power State to %d", buf, 8u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setPowerIsOn:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

id sub_10002579C(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (byte_1000A2480)
  {
    v2 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> UpdateSystemPower: WakeInProgress Reset", v4, 2u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

void sub_1000259A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000259C4(uint64_t a1, uint64_t a2)
{
  id Weak;
  NSObject *v5;
  unsigned int v6;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v9;
  __int16 v10;
  int v11;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v5 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "backlightIsOn");
    *(_DWORD *)buf = 67109376;
    v9 = v6;
    v10 = 1024;
    v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Backlight Status changed %d -> %d", buf, 0xEu);
  }
  objc_msgSend(Weak, "setBacklightIsOn:", a2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025ADC;
  block[3] = &unk_10007D248;
  block[4] = Weak;
  dispatch_async((dispatch_queue_t)objc_msgSend(Weak, "inPocketQueue"), block);
}

id sub_100025ADC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

id sub_100025B48(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentSession") != 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

id sub_100025BF8(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentSession") != 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateContextActiveState");
}

void sub_100025E38(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100025E48(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class sub_100025E54(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000A1D80)
  {
    v5 = off_10007DC18;
    v6 = 0;
    qword_1000A1D80 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000A1D80)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("CARSessionStatus");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      break;
LABEL_7:
    v2 = (char *)sub_100050A80();
LABEL_8:
    free(v2);
  }
  qword_1000A1D78 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

id sub_100026060(uint64_t a1)
{
  uint64_t i;
  id result;

  for (i = 0; i != 17; ++i)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getReleaseRateForComponent:", i);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * i + 60) = (_DWORD)result;
  }
  return result;
}

NSDictionary *sub_100026390(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TP4H");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFD");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFL");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBM");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("batteryVT");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TP5d");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("maxLI_PackagePower");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Die_Temp_MaxAverage");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

CFNumberRef sub_100027B1C(uint64_t a1)
{
  return sub_10000536C(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 140), kCTThermalTxBackoff, kCFNumberSInt32Type, (void *)(*(_QWORD *)(a1 + 32) + 172));
}

id sub_100027D98(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 84) & ~(*(int *)(v1 + 84) >> 31);
  if (v2 >= 0x64)
    v2 = 100;
  *(_DWORD *)(v1 + 172) = dword_1000615DC[v2];
  return objc_msgSend(*(id *)(a1 + 32), "calculateAdditionalRadioMitigations");
}

void sub_100027F74(int a1, CFStringRef theString1, uint64_t a3, void *a4)
{
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  if (CFStringCompare(theString1, kCTDaemonReadyNotification, 0))
  {
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050DF8((uint64_t)theString1, v6, v7);
  }
  else
  {
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> CoreTelephony is ready", v9, 2u);
      }
    }
    objc_msgSend(a4, "initializeRadio");
  }
}

void sub_100028148(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  sub_100034274(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 140), kCTThermalTxBackoff, kCFNumberSInt32Type, (const void *)(*(_QWORD *)(a1 + 32) + 172));
  objc_msgSend(*(id *)(a1 + 32), "setAdditionalRadioMitigations");
  v2 = _CTServerConnectionConfigMaxRadioPower(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 156), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 140));
  if ((_DWORD)v2)
  {
    v3 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050E90(v2, SHIDWORD(v2), v3);
  }
}

id sub_100028808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrightnessClientNotification:value:", a2, a3);
}

id sub_10002894C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPotentialSolarStateChange:", 1);
}

float sub_1000289BC(uint64_t a1)
{
  NSObject *v2;
  int v3;
  float result;
  _DWORD v5[2];

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = *(_DWORD *)(a1 + 40);
  if (byte_1000A2480)
  {
    v2 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> _currentSemanticAmbientLightLevel %d", (uint8_t *)v5, 8u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "processPotentialSolarStateChange:", 0);
  result = (float)*(unsigned int *)(*(_QWORD *)(a1 + 32) + 28);
  *(float *)&dword_1000A2AF0 = result;
  return result;
}

void sub_100028F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100028FAC(_QWORD *a1, uint64_t a2, void *a3)
{
  id result;
  uint64_t v5;

  result = objc_msgSend(a3, "BOOLValue");
  v5 = *(_QWORD *)(a1[5] + 8);
  if (*(unsigned __int8 *)(v5 + 24) != (_DWORD)result || !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    *(_BYTE *)(v5 + 24) = (_BYTE)result;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    return (id)(*(uint64_t (**)(void))(a1[4] + 16))();
  }
  return result;
}

id sub_1000290DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterNotificationForKeys:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1000291B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

void sub_1000291DC(id a1)
{
  qword_1000A1DA0 = objc_alloc_init(ContextAwareThermalManager);
}

NSDictionary *sub_1000296D8(uint64_t a1)
{
  _QWORD v3[23];
  _QWORD v4[23];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev3");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev4");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("PMU_Tdev5");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("PMU2_Tdev1");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("PMU2_Tdev2");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("PMU2_Tdev3");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSBM");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFD");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("TSBQ");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("TSBR");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Die_Temp_MaxAverage");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Die_Temp_MaxMax");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("maxLI_PackagePower");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("maxLI_Speaker");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[17] = CFSTR("BackLight_maxLI");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v3[18] = CFSTR("Solar_Context");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 120));
  v3[19] = CFSTR("Pressure_Level");
  v4[19] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v3[20] = CFSTR("Gas_Gauge_avg_Power");
  v4[20] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  v3[21] = CFSTR("Charger_State");
  v4[21] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 112));
  v3[22] = CFSTR("Package_Power");
  v4[22] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 116));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 23);
}

uint64_t sub_10002A67C(uint64_t result)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_BYTE *)(result + 16) = 0;
  return result;
}

uint64_t sub_10002A688(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  return sub_10002B600(a1);
}

void sub_10002A6B0(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  void *__p[2];
  char v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD v44[6];
  uint64_t v45;
  std::__shared_weak_count *v46;

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *(_QWORD *)(a1 + 24) = dispatch_queue_create("com.apple.ThermalMonitor.radioSensorQueue", v4);
  sub_10002B4A0(__p, "cltm");
  abm::client::CreateManager(&v40, __p, *(_QWORD *)(a1 + 24));
  sub_10002AA10(a1, &v40);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
  if (*((_QWORD *)&v40 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v38 < 0)
    operator delete(__p[0]);
  v8 = *(std::__shared_weak_count **)(a1 + 8);
  v45 = *(_QWORD *)a1;
  v46 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  sub_10002B4A0(__p, abm::kEventBasebandBootStateChange);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 0x40000000;
  v44[2] = sub_10002AA74;
  v44[3] = &unk_10007DD68;
  v44[4] = a2;
  v44[5] = a1;
  abm::client::RegisterEventHandler(&v45, __p, v44);
  if (v38 < 0)
    operator delete(__p[0]);
  v11 = v46;
  if (v46)
  {
    v12 = (unint64_t *)&v46->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = *(std::__shared_weak_count **)(a1 + 8);
  v42 = *(_QWORD *)a1;
  v43 = v14;
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  abm::client::EventsOn(&v42);
  v17 = v43;
  if (v43)
  {
    v18 = (unint64_t *)&v43->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v40 = 0uLL;
  v41 = 0;
  v20 = *(std::__shared_weak_count **)(a1 + 8);
  v35 = *(_QWORD *)a1;
  v36 = v20;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  abm::client::GetBasebandBootState(__p, &v35, &v40);
  v23 = v36;
  if (v36)
  {
    v24 = (unint64_t *)&v36->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (LODWORD(__p[0]))
  {
    v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v26)
      sub_100051134(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    if (v41 >= 0)
      v34 = (const char *)&v40;
    else
      v34 = (const char *)v40;
    if (!strcmp(v34, abm::kBasebandBootStateIsReady))
      *(_BYTE *)(a1 + 16) = 1;
  }
  if (*(_BYTE *)(a1 + 16))
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 1);
  if (v39 < 0)
    operator delete(__p[1]);
  if (SHIBYTE(v41) < 0)
    operator delete((void *)v40);
}

void sub_10002A98C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *a12, void *__p, int a14, __int16 a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  if (a21 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10002AA10(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t sub_10002AA74(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3;
  const char *string;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v3 = *(_QWORD *)(a1 + 40);
  string = xpc_dictionary_get_string(xdict, abm::kKeyBasebandBootState);
  if (!strcmp(string, abm::kBasebandBootStateIsReady))
  {
    *(_BYTE *)(v3 + 16) = 1;
    sub_10002ABD8((uint64_t *)v3);
    v6 = *(std::__shared_weak_count **)(v3 + 8);
    v20 = *(_QWORD *)v3;
    v21 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    abm::client::EventsOff(&v20);
    v9 = v21;
    if (v21)
    {
      v10 = (unint64_t *)&v21->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = *(std::__shared_weak_count **)(v3 + 8);
    v18 = *(_QWORD *)v3;
    v19 = v12;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    abm::client::EventsOn(&v18);
    v15 = v19;
    if (v19)
    {
      v16 = (unint64_t *)&v19->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    *(_BYTE *)(v3 + 16) = 0;
  }
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

void sub_10002ABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10002B600((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_10002ABD8(uint64_t *a1)
{
  xpc_object_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[2];
  char v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  xpc_object_t values;
  char *keys;

  keys = (char *)abm::kKeyFrequency;
  values = xpc_int64_create(5000);
  v2 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  if (v2)
  {
    v3 = (std::__shared_weak_count *)a1[1];
    v19 = *a1;
    v20 = v3;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    sub_10002B4A0(__p, abm::kConfigThermalReportFrequency);
    abm::client::PerformCommand(&v19, __p, &stru_10007DDD0, v2);
    if (v18 < 0)
      operator delete(__p[0]);
    v6 = v20;
    if (v20)
    {
      v7 = (unint64_t *)&v20->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  else
  {
    v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9)
      sub_100051168(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

void sub_10002AD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
    operator delete(__p);
  sub_10002B600((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_10002AD40(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[5];
  void *__p[2];
  char v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v3 = (std::__shared_weak_count *)a1[1];
  v12 = *a1;
  v13 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  sub_10002B4A0(__p, abm::kQueryThermalIDs);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_10002AE50;
  v9[3] = &unk_10007DD90;
  v9[4] = a2;
  abm::client::PerformCommand(&v12, __p, v9, 0);
  if (v11 < 0)
    operator delete(__p[0]);
  v6 = v13;
  if (v13)
  {
    v7 = (unint64_t *)&v13->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_10002AE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;

  if (a19 < 0)
    operator delete(__p);
  sub_10002B600(v19 - 32);
  _Unwind_Resume(a1);
}

void sub_10002AE50(uint64_t a1, int *a2, xpc_object_t object)
{
  xpc_object_t v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  xpc_object_t value;
  char *bytes_ptr;
  size_t length;
  uint64_t v37;
  int v38;
  void *__p;
  void *v40;
  uint64_t v41;
  void *v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (!object || *a2)
  {
    v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16)
      sub_100051204(v16, v17, v18, v19, v20, v21, v22, v23);
    v24 = *(_QWORD *)(a1 + 32);
    v52 = 0;
    v53 = 0;
    v51 = 0;
    (*(void (**)(void))(v24 + 16))();
  }
  else
  {
    v5 = xpc_retain(object);
    if (v5)
    {
      v6 = v5;
      if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
      {
        value = xpc_dictionary_get_value(v6, abm::kKeyThermalIDs);
        bytes_ptr = (char *)xpc_data_get_bytes_ptr(value);
        length = xpc_data_get_length(value);
        v42 = 0;
        v43 = 0;
        v44 = 0;
        sub_10002B658((uint64_t)&v42, 0, bytes_ptr, &bytes_ptr[length], length);
        v37 = *(_QWORD *)(a1 + 32);
        v38 = *a2;
        v40 = 0;
        v41 = 0;
        __p = 0;
        sub_10002B850(&__p, v42, (uint64_t)v43, v43 - (_BYTE *)v42);
        (*(void (**)(uint64_t, BOOL, void **))(v37 + 16))(v37, v38 == 0, &__p);
        if (__p)
        {
          v40 = __p;
          operator delete(__p);
        }
        if (v42)
        {
          v43 = v42;
          operator delete(v42);
        }
      }
      else
      {
        v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v7)
          sub_1000511D0(v7, v8, v9, v10, v11, v12, v13, v14);
        v15 = *(_QWORD *)(a1 + 32);
        v46 = 0;
        v47 = 0;
        v45 = 0;
        (*(void (**)(void))(v15 + 16))();
      }
    }
    else
    {
      v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v25)
        sub_10005119C(v25, v26, v27, v28, v29, v30, v31, v32);
      v33 = *(_QWORD *)(a1 + 32);
      v49 = 0;
      v50 = 0;
      v48 = 0;
      (*(void (**)(void))(v33 + 16))();
    }
  }
}

void sub_10002B028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void sub_10002B09C(id a1, Result *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2->var0)
  {
    v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2)
      sub_100051238(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10002B0D0(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  _QWORD v26[5];
  void *v27[2];
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  v4 = (std::__shared_weak_count *)a1[1];
  v29 = *a1;
  v30 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  sub_10002B4A0(v27, abm::kEventThermalReport);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 0x40000000;
  v26[2] = sub_10002B2B8;
  v26[3] = &unk_10007DDF8;
  v26[4] = a2;
  abm::client::RegisterEventHandler(&v29, v27, v26);
  if (v28 < 0)
    operator delete(v27[0]);
  v7 = v30;
  if (v30)
  {
    v8 = (unint64_t *)&v30->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = (std::__shared_weak_count *)a1[1];
  v24 = *a1;
  v25 = v10;
  if (v10)
  {
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  abm::client::EventsOff(&v24);
  v13 = v25;
  if (v25)
  {
    v14 = (unint64_t *)&v25->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = (std::__shared_weak_count *)a1[1];
  v22 = *a1;
  v23 = v16;
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  abm::client::EventsOn(&v22);
  v19 = v23;
  if (v23)
  {
    v20 = (unint64_t *)&v23->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

void sub_10002B274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10002B600((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_10002B2B8(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t value;
  char *bytes_ptr;
  int64_t length;
  uint64_t v26;
  void *__p;
  void *v28;
  uint64_t v29;
  void *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = xpc_retain(object);
  if (v3)
  {
    v4 = v3;
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      value = xpc_dictionary_get_value(v4, abm::kKeyThermalData);
      bytes_ptr = (char *)xpc_data_get_bytes_ptr(value);
      length = xpc_data_get_length(value);
      v30 = 0;
      v31 = 0;
      v32 = 0;
      sub_10002B908((uint64_t)&v30, 0, bytes_ptr, &bytes_ptr[length & 0xFFFFFFFFFFFFFFF8], length >> 3);
      v26 = *(_QWORD *)(a1 + 32);
      v28 = 0;
      v29 = 0;
      __p = 0;
      sub_10002BC0C(&__p, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
      (*(void (**)(uint64_t, uint64_t, void **))(v26 + 16))(v26, 1, &__p);
      if (__p)
      {
        v28 = __p;
        operator delete(__p);
      }
      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }
    }
    else
    {
      v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v5)
        sub_1000511D0(v5, v6, v7, v8, v9, v10, v11, v12);
      v13 = *(_QWORD *)(a1 + 32);
      v34 = 0;
      v35 = 0;
      v33 = 0;
      (*(void (**)(void))(v13 + 16))();
    }
  }
  else
  {
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14)
      sub_10005119C(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = *(_QWORD *)(a1 + 32);
    v37 = 0;
    v38 = 0;
    v36 = 0;
    (*(void (**)(void))(v22 + 16))();
  }
}

void sub_10002B438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10002B498(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

_QWORD *sub_10002B4A0(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10002B550();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_10002B550()
{
  sub_10002B564("basic_string");
}

void sub_10002B564(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10002B5B4(exception, a1);
}

void sub_10002B5A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10002B5B4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10002B5D8()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_10002B600(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

char *sub_10002B658(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v14;
  unint64_t v15;
  size_t v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  int64_t v26;
  char v27;
  char *v28;
  char *v29;
  size_t v30;
  char *v31;
  char *v32;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      sub_10002B83C();
    v14 = (char *)(__dst - v11);
    v15 = v9 - (_QWORD)v11;
    if (2 * v15 > v12)
      v12 = 2 * v15;
    if (v15 >= 0x3FFFFFFFFFFFFFFFLL)
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v16 = v12;
    if (v16)
    {
      v17 = v16;
      v18 = (char *)operator new(v16);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    v28 = &v14[(_QWORD)v18];
    memcpy(&v14[(_QWORD)v18], __src, a5);
    v29 = &v14[(_QWORD)v18];
    v30 = v17;
    if (v11 != v5)
    {
      do
      {
        v14[(_QWORD)v18 - 1] = v14[(_QWORD)(v11 - 1)];
        --v14;
      }
      while (v14);
      v29 = v18;
    }
    v31 = &v28[a5];
    v32 = &v18[v30];
    if (v10 != v5)
      memmove(v31, v5, v10 - v5);
    *(_QWORD *)a1 = v29;
    *(_QWORD *)(a1 + 8) = &v31[v10 - v5];
    *(_QWORD *)(a1 + 16) = v32;
    if (v11)
      operator delete(v11);
    return v28;
  }
  v19 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v20 = &__src[a5];
    v22 = *(char **)(a1 + 8);
LABEL_17:
    v23 = &v5[a5];
    v24 = &v22[-a5];
    v25 = v22;
    if (&v22[-a5] < v10)
    {
      v26 = &v10[a5] - v22;
      v25 = v22;
      do
      {
        v27 = *v24++;
        *v25++ = v27;
        --v26;
      }
      while (v26);
    }
    *(_QWORD *)(a1 + 8) = v25;
    if (v22 != v23)
      memmove(&v5[a5], v5, v22 - v23);
    if (v20 != __src)
      memmove(v5, __src, v20 - __src);
    return v5;
  }
  v20 = &__src[v19];
  v21 = a4 - &__src[v19];
  if (a4 != &__src[v19])
    memmove(*(void **)(a1 + 8), &__src[v19], a4 - &__src[v19]);
  v22 = &v10[v21];
  *(_QWORD *)(a1 + 8) = &v10[v21];
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_10002B83C()
{
  sub_10002B564("vector");
}

_QWORD *sub_10002B850(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = sub_10002B8C8(result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10002B8AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10002B8C8(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_10002B83C();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

char *sub_10002B908(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 >> 61)
      sub_10002B83C();
    v15 = (__dst - (uint64_t)v13) >> 3;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 2 > v14)
      v14 = v16 >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)sub_10002BBD8(v9, v17);
    else
      v18 = 0;
    v28 = &v18[8 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    v29 = 8 * a5;
    v30 = &v28[8 * a5];
    do
    {
      v31 = *(_QWORD *)v7;
      v7 += 8;
      *(_QWORD *)v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    v35 = v30;
    v5 = sub_10002BB14((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    v21 = &__src[8 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[8 * a5];
    v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_QWORD *)v25;
        v25 += 8;
        *(_QWORD *)v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[8 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_10002BADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_10002BB14(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v8 -= 8;
      *((_QWORD *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(char **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void *sub_10002BBD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_10002B5D8();
  return operator new(8 * a2);
}

_QWORD *sub_10002BC0C(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_10002BC84(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10002BC68(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10002BC84(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_10002B83C();
  result = (char *)sub_10002BBD8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_10002C02C(id a1)
{
  qword_1000A1DB0 = objc_alloc_init(RadioTS);
}

void sub_10002C1D8(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("not ");
      if (a2)
        v5 = &stru_100081370;
      v6 = 138412290;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband is %@ready", (uint8_t *)&v6, 0xCu);
    }
  }
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "queryThermalSensorInfo");
}

void sub_10002C354(uint64_t a1, int a2, unsigned __int8 **a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  _QWORD v6[2];
  void (*v7)(uint64_t, int);
  void *v8;
  uint64_t v9;

  if (!a2 || (v3 = *a3, v4 = a3[1], *a3 == v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000512F0();
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v7 = sub_10002C3FC;
    v8 = &unk_10007DE68;
    v9 = *(_QWORD *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v7((uint64_t)v6, v5);
    }
    while (v3 != v4);
  }
}

void sub_10002C3FC(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];

  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Got info for Baseband Thermal ID: %d", (uint8_t *)v5, 8u);
    }
  }
  if (a2 != 255)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 1;
}

void sub_10002C520(uint64_t a1, int a2, unint64_t **a3)
{
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  _QWORD v6[2];
  void (*v7)(uint64_t, unint64_t);
  void *v8;
  uint64_t v9;

  if (!a2 || (v3 = *a3, v4 = a3[1], *a3 == v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005131C();
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v7 = sub_10002C5C8;
    v8 = &unk_10007DEB8;
    v9 = *(_QWORD *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v7((uint64_t)v6, v5);
    }
    while (v3 != v4);
  }
}

void sub_10002C5C8(uint64_t a1, unint64_t a2)
{
  unsigned __int8 v2;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;

  v2 = a2;
  v4 = HIDWORD(a2);
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      v8 = 1024;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband sensor ID: %d temperature %d", (uint8_t *)v7, 0xEu);
    }
  }
  switch(v2)
  {
    case 2u:
      v6 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16);
      if ((v6 & 0x80000000) != 0)
        return;
      goto LABEL_10;
    case 1u:
      v6 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12);
      if ((v6 & 0x80000000) != 0)
        return;
      goto LABEL_10;
    case 0u:
      v6 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
      if ((v6 & 0x80000000) == 0)
LABEL_10:
        sub_10002E350(v6, v4);
      break;
  }
}

_QWORD *sub_10002C77C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

NSDictionary *sub_10002CD50(uint64_t a1)
{
  _QWORD v3[12];
  _QWORD v4[12];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("Die_Temp_MaxAverage");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("Die_Temp_MaxMax");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSFC");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSRR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSFD");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSRM");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Charger_State");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Solar_Context");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 76));
  v3[11] = CFSTR("Pressure_Level");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
}

NSDictionary *sub_10002D118(uint64_t a1)
{
  _QWORD v3[10];
  _QWORD v4[10];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev3");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev4");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev5");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev7");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("Die_Temp_MaxAverage");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSFD");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBH");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Solar_Context");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 68));
  v3[9] = CFSTR("Pressure_Level");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 10);
}

NSDictionary *sub_10002D920(uint64_t a1)
{
  NSNumber *v2;
  uint64_t v3;
  _QWORD v5[19];
  _QWORD v6[19];

  v5[0] = CFSTR("TG0B");
  v6[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5[1] = CFSTR("TG0V");
  v6[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v5[2] = CFSTR("PMU_Tdev1");
  v6[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5[3] = CFSTR("PMU_Tdev2");
  v6[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v5[4] = CFSTR("TSRR");
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5[5] = CFSTR("TSBR");
  v6[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v5[6] = CFSTR("TSRM");
  v6[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v5[7] = CFSTR("TSFL");
  v6[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v5[8] = CFSTR("TSFC");
  v6[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v5[9] = CFSTR("TSFD");
  v6[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v5[10] = CFSTR("mic2");
  v6[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5[11] = CFSTR("TSBQ");
  v6[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v5[12] = CFSTR("Die_Temp_MaxAverage");
  v6[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v5[13] = CFSTR("Die_Temp_MaxMax");
  v6[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v5[14] = CFSTR("Package_Power");
  v6[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v5[15] = CFSTR("Charger_State");
  v6[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v5[16] = CFSTR("Solar_Context");
  v6[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 108));
  v5[17] = CFSTR("Pressure_Level");
  v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v5[18] = CFSTR("Device_Activity");
  v3 = *(_QWORD *)(a1 + 32);
  v6[17] = v2;
  v6[18] = v3;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 19);
}

void sub_10002DB9C(id a1)
{
  qword_1000A1DC0 = objc_alloc_init(SensorExchangeHelper);
}

void sub_10002E140(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void *sub_10002E178()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  int *v3;
  char *v4;
  void *v5;
  size_t v7;
  uint8_t buf[4];
  char *v9;

  v7 = 1024;
  v0 = sysctlbyname("kern.bootargs", &unk_1000A24A0, &v7, 0, 0);
  v1 = qword_1000A28A0;
  v2 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      v3 = __error();
      v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> could not retrieve device boot-args, failed with error: %s", buf, 0xCu);
    }
    return &unk_10006185C;
  }
  else
  {
    v5 = &unk_1000A24A0;
    if (v2)
    {
      *(_DWORD *)buf = 136315138;
      v9 = (char *)&unk_1000A24A0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> retrieved current device boot-args: %s", buf, 0xCu);
    }
  }
  return v5;
}

id sub_10002E29C(uint64_t a1)
{
  id v2;

  objc_msgSend((id)qword_1000A2488, "updateNotifyTokens");
  v2 = objc_msgSend((id)qword_1000A1DC8, "getMaxSensorValue");
  objc_msgSend((id)qword_1000A2488, "updateMaxValueToken:", v2);
  return objc_msgSend((id)qword_1000A2488, "updateThermalNotification:", a1);
}

id sub_10002E2E4(uint64_t a1)
{
  return objc_msgSend((id)qword_1000A2488, "updateThermalPressureLevelNotification:shouldForceThermalPressure:", a1, objc_msgSend((id)qword_1000A1DC8, "getPotentialForcedThermalPressureLevel"));
}

id sub_10002E320(uint64_t a1)
{
  return objc_msgSend((id)qword_1000A2488, "setThermalPressureLevelNotification:", a1);
}

id sub_10002E330(uint64_t a1)
{
  return objc_msgSend((id)qword_1000A2488, "updateThermalNotification:", a1);
}

id sub_10002E340(uint64_t a1)
{
  return objc_msgSend((id)qword_1000A2488, "sendRadioNotification:", a1);
}

uint64_t sub_10002E350(uint64_t a1, uint64_t a2)
{
  sub_100005B24(a1, a2, a2, 0);
  -[HidSensors sendVirtualTemp:temperature:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sendVirtualTemp:temperature:", a1, a2);
  return a2;
}

BOOL sub_10002E398(CFStringRef key, const char *a2)
{
  io_registry_entry_t v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  _BOOL8 v9;

  v4 = dword_1000A1EE0;
  if (!dword_1000A1EE0)
  {
    v4 = sub_1000340B8(a2, 0, 0);
    dword_1000A1EE0 = v4;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000515A0();
      return 0;
    }
  }
  v5 = (const __CFBoolean *)sub_10000497C(key, v4);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CFGetTypeID(v5);
  v9 = v7 == CFBooleanGetTypeID() && kCFBooleanTrue == v6;
  CFRelease(v6);
  return v9;
}

uint64_t sub_10002E44C()
{
  return byte_1000A249A;
}

id sub_10002E458()
{
  uint64_t v0;

  if (byte_1000A1F10)
    v0 = 0;
  else
    v0 = byte_1000A1EFC;
  -[HidSensors setInfoOnlySensorsActive:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "setInfoOnlySensorsActive:", v0);
  return -[ContextAwareThermalManager setInfoOnlySensorsActive:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "setInfoOnlySensorsActive:", v0);
}

uint64_t sub_10002E4AC()
{
  return 0;
}

void sub_10002E4B4(const __SCPreferences *a1)
{
  char *v2;
  const __SCPreferences *v3;
  const __CFString *Value;
  const __CFString *v5;
  CFTypeID v6;
  char v7;
  const __CFBoolean *v8;
  NSObject *v9;
  int v10;
  const char *v11;

  if (SCPreferencesGetValue(a1, CFSTR("thermalUseRawValuesPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("thermalUseRawValues"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("forceSkipInfoOnlySensorsPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("forceSkipInfoOnlySensors"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("hipPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("hipOverride"), kCFBooleanTrue);
  SCPreferencesSetValue(a1, CFSTR("simulateHip"), kCFBooleanFalse);
  SCPreferencesSetValue(a1, CFSTR("forceHIPWhenConnected"), kCFBooleanFalse);
  SCPreferencesSetValue(a1, CFSTR("BacklightStatus"), kCFBooleanTrue);
  if (SCPreferencesGetValue(a1, CFSTR("sunlightOverridePersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("sunlightOverride"));
  if (SCPreferencesGetValue(a1, CFSTR("OSThermalNotificationPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("OSThermalNotificationEnabled"), kCFBooleanTrue);
  if (SCPreferencesGetValue(a1, CFSTR("candidateControlLoopsEnabledPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("candidateControlLoopsEnabled"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("engageBehaviorPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("engageBehavior"), kCFBooleanTrue);
  if (SCPreferencesGetValue(a1, CFSTR("overrideControlEffortPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("overrideControlEffort"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("overrideSensorLIPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("overrideSensorLI"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("overrideTxMaxLimitPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("overrideTxMaxLimitKey"), kCFBooleanFalse);
  if (SCPreferencesGetValue(a1, CFSTR("tGraphTestCaseNumberPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("tGraphTestCaseNumber"));
  if (SCPreferencesGetValue(a1, CFSTR("tGraphTestCaseNamePersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("tGraphTestCaseName"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoIntegratorState_P_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoIntegratorState_P"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoDieTempMaxMaxPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoDieTempMaxMax"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoDieTempMaxAveragePersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoDieTempMaxAverage"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoInstantaneousAF_P_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoInstantaneousAF_P"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoIntegratorState_E_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoIntegratorState_E"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoInstantaneousAF_E_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoInstantaneousAF_E"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoIntegratorState_G_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoIntegratorState_G"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoInstantaneousAF_G_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoInstantaneousAF_G"));
  if (SCPreferencesGetValue(a1, CFSTR("LifetimeServoDieTempTarget_PersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("LifetimeServoDieTempTarget"));
  if (SCPreferencesGetValue(a1, CFSTR("ArcModuleThresholdKeyPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("ArcModuleThresholdKey"));
  if (SCPreferencesGetValue(a1, CFSTR("ArcVirtualThresholdKeyPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesRemoveValue(a1, CFSTR("ArcVirtualThresholdKey"));
  if (SCPreferencesGetValue(a1, CFSTR("OSThermalNotificationLoggingEnabledPersistentlyEnabled")) != kCFBooleanTrue)
    SCPreferencesSetValue(a1, CFSTR("OSThermalNotificationLoggingEnabled"), kCFBooleanFalse);
  v2 = (char *)sub_10002E178();
  if (strstr(v2, "default_tgraph_disabled"))
  {
    v3 = a1;
LABEL_58:
    SCPreferencesRemoveValue(v3, CFSTR("tGraphLogFile"));
    goto LABEL_59;
  }
  if (!sub_1000038C4())
  {
    v3 = a1;
    goto LABEL_58;
  }
  Value = (const __CFString *)SCPreferencesGetValue(a1, CFSTR("tGraphLogFile"));
  if (!Value
    || (v5 = Value, v6 = CFGetTypeID(Value), v6 != CFStringGetTypeID())
    || SCPreferencesGetValue(a1, CFSTR("tGraphLogFilePersistentlyEnabled")) != kCFBooleanTrue
    || CFStringCompare(v5, CFSTR("/var/log/tgraph.csv"), 0) == kCFCompareEqualTo)
  {
    SCPreferencesSetValue(a1, CFSTR("tGraphLogFilePersistentlyEnabled"), kCFBooleanTrue);
    SCPreferencesSetValue(a1, CFSTR("tGraphLogFile"), CFSTR("/var/log/tgraph.csv"));
    SCPreferencesSetValue(a1, CFSTR("forceSkipInfoOnlySensors"), kCFBooleanTrue);
    v7 = 1;
    goto LABEL_60;
  }
LABEL_59:
  v7 = 0;
LABEL_60:
  byte_1000A1F11 = v7;
  v8 = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("OSThermalNotificationLoggingEnabled"));
  byte_1000A2480 = v8 == kCFBooleanTrue;
  if (v8 == kCFBooleanTrue)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "en";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status logging %sabled", (uint8_t *)&v10, 0xCu);
    }
  }
  if (!SCPreferencesCommitChanges(a1) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004F0E8();
}

void sub_10002EBCC(SCPreferencesRef prefs, uint64_t a2, int a3)
{
  char *v5;
  NSObject *v6;
  CFBooleanRef Value;
  int v8;
  const __CFBoolean *v9;
  NSObject *v10;
  const char *v11;
  CFPropertyListRef v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  CFTypeID v15;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v17;
  int v18;
  int v19;
  uint64_t v20;
  CFPropertyListRef v21;
  CFPropertyListRef v22;
  const void *v23;
  CFTypeID v24;
  CFTypeID v26;
  CFBooleanRef v27;
  const __CFBoolean *v28;
  NSObject *v29;
  const char *v30;
  CFBooleanRef v31;
  const __CFBoolean *v32;
  NSObject *v33;
  const char *v34;
  CFBooleanRef v35;
  const __CFBoolean *v36;
  NSObject *v37;
  const char *v38;
  CFBooleanRef v39;
  const __CFBoolean *v40;
  NSObject *v41;
  const char *v42;
  CFBooleanRef v43;
  const __CFBoolean *v44;
  NSObject *v45;
  const char *v46;
  const __CFBoolean *v47;
  const __CFBoolean *v48;
  NSObject *v49;
  const char *v50;
  const __CFNumber *v51;
  const __CFString *v52;
  CFTypeID v53;
  TGraphSampler *v54;
  uint64_t v55;
  const __CFBoolean *v56;
  const __CFBoolean *v57;
  CFTypeID v58;
  int v59;
  NSObject *v60;
  CFBooleanRef v61;
  const __CFBoolean *v62;
  NSObject *v63;
  const char *v64;
  CFBooleanRef v65;
  const __CFBoolean *v66;
  int v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  const __CFNumber *v71;
  const __CFNumber *v72;
  CFTypeID v73;
  NSObject *v74;
  NSObject *v75;
  CFNumberRef v76;
  CFBooleanRef v77;
  CFBooleanRef v78;
  CFBooleanRef v79;
  CFBooleanRef v80;
  CFBooleanRef v81;
  CFBooleanRef v82;
  CFBooleanRef v83;
  const __CFBoolean *v84;
  NSObject *v85;
  const char *v86;
  const __CFArray *v87;
  const __CFArray *v88;
  CFTypeID v89;
  const __CFNumber *v90;
  const __CFNumber *v91;
  int v92;
  int v93;
  CFDictionaryRef v94;
  const void *v95;
  uint64_t v96;
  NSObject *v97;
  _BOOL4 v98;
  NSObject *log;
  int v100;
  int v101;
  int v102;
  void *values;
  const void *valuePtr;
  uint8_t buf[16];
  __int128 v106;
  uint64_t v107;

  v5 = &byte_1000A1F90[112];
  if (a3)
  {
    byte_1000A2480 = SCPreferencesGetValue(prefs, CFSTR("OSThermalNotificationLoggingEnabled")) == kCFBooleanTrue;
    if (byte_1000A2480)
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "en";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status logging %sabled", buf, 0xCu);
      }
    }
    Value = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("overrideSensor"));
    v8 = Value == kCFBooleanTrue;
    byte_1000A2490 = Value == kCFBooleanTrue;
    if (byte_1000A2480)
    {
      v9 = Value;
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v11 = "dis";
        if (v9 == kCFBooleanTrue)
          v11 = "en";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideSensor %sabled", buf, 0xCu);
        v8 = byte_1000A2490;
      }
    }
    if (v8)
    {
      LODWORD(valuePtr) = 0;
      LODWORD(values) = 0;
      v12 = SCPreferencesGetValue(prefs, CFSTR("setSensorID"));
      v13 = (const __CFBoolean *)SCPreferencesGetValue(prefs, CFSTR("overrideSensorPersistentlyEnabled"));
      if (v12)
      {
        v14 = v13;
        v15 = CFGetTypeID(v12);
        if (v15 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v12) == 2)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          v17 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 1);
          CFNumberGetValue(v17, kCFNumberIntType, &values);
          v18 = (int)valuePtr;
          if (valuePtr <= 0x3F)
          {
            v19 = (int)values;
            *((_DWORD *)&qword_1000A29AC + valuePtr) = (_DWORD)values;
            v20 = qword_1000A2AB0 | (1 << v18);
            qword_1000A2AB0 = v20;
            log = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&buf[4] = v18;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v19;
              *(_WORD *)&buf[14] = 2048;
              *(_QWORD *)&v106 = v20;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx", buf, 0x18u);
            }
          }
          if (v14 != kCFBooleanTrue)
          {
            SCPreferencesRemoveValue(prefs, CFSTR("setSensorID"));
            if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_10004F0E8();
          }
        }
      }
      v21 = SCPreferencesGetValue(prefs, CFSTR("setSensor4CCID"));
      v22 = SCPreferencesGetValue(prefs, CFSTR("setSensor4CCVAL"));
      if (v21)
      {
        v23 = v22;
        v24 = CFGetTypeID(v21);
        if (v24 == CFStringGetTypeID() && v23 != 0)
        {
          v26 = CFGetTypeID(v23);
          if (v26 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, &values);
            sub_100034AF4((uint64_t)v21, (int)values);
            if (SCPreferencesGetValue(prefs, CFSTR("override4CCPersistentlyEnabled")) != kCFBooleanTrue)
            {
              SCPreferencesRemoveValue(prefs, CFSTR("setSensor4CCID"));
              SCPreferencesRemoveValue(prefs, CFSTR("setSensor4CCVAL"));
              if (!SCPreferencesCommitChanges(prefs)
                && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              {
                sub_10004F0E8();
              }
            }
          }
        }
      }
      v5 = byte_1000A1F90 + 112;
    }
    else
    {
      sub_100034C0C();
    }
  }
  v27 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("hipOverride"));
  byte_10009A1F1 = v27 != kCFBooleanFalse;
  if (byte_1000A2480)
  {
    v28 = v27;
    v29 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = "dis";
      if (v28 != kCFBooleanFalse)
        v30 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> HIP feature %sabled", buf, 0xCu);
    }
  }
  v31 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("simulateHip"));
  byte_1000A2491 = v31 != kCFBooleanFalse;
  if (byte_1000A2480)
  {
    v32 = v31;
    v33 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = "dis";
      if (v32 != kCFBooleanFalse)
        v34 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> HIP simulation %sabled", buf, 0xCu);
    }
  }
  v35 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("forceHIPWhenConnected"));
  byte_1000A2492 = v35 != kCFBooleanFalse;
  if (byte_1000A2480)
  {
    v36 = v35;
    v37 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = "dis";
      if (v36 != kCFBooleanFalse)
        v38 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "<Notice> HIP force when connected %sabled", buf, 0xCu);
    }
  }
  v39 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("engageBehavior"));
  byte_10009A1F0 = v39 != kCFBooleanFalse;
  if (byte_1000A2480)
  {
    v40 = v39;
    v41 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = "dis";
      if (v40 != kCFBooleanFalse)
        v42 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> mitigation behavior %sabled", buf, 0xCu);
    }
  }
  v43 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("candidateControlLoopsEnabled"));
  byte_1000A249A = v43 == kCFBooleanTrue;
  if (byte_1000A2480)
  {
    v44 = v43;
    v45 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = "dis";
      if (v44 == kCFBooleanTrue)
        v46 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "<Notice> candidate control loops %sabled", buf, 0xCu);
    }
  }
  v47 = (const __CFBoolean *)SCPreferencesGetValue(prefs, CFSTR("OSThermalNotificationEnabled"));
  if (byte_1000A2480)
  {
    v48 = v47;
    v49 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = "dis";
      if (v48 == kCFBooleanTrue)
        v50 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "<Notice> thermal monitoring %sabled", buf, 0xCu);
    }
  }
  if (a3)
  {
    v51 = (const __CFNumber *)SCPreferencesGetValue(prefs, CFSTR("tGraphTestCaseNumber"));
    v52 = (const __CFString *)SCPreferencesGetValue(prefs, CFSTR("tGraphTestCaseName"));
    if (v51 && (v53 = CFGetTypeID(v51), v53 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v51, kCFNumberIntType, &dword_1000A1F68);
      if (!v52)
        goto LABEL_73;
    }
    else
    {
      dword_1000A1F68 = 0;
      if (!v52)
        goto LABEL_73;
    }
    if (CFStringGetCString(v52, &byte_1000A1F6C, 32, 0))
    {
LABEL_74:
      sub_10002FCD4(prefs);
      v54 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
      if (byte_10009A1F0)
        v55 = 100;
      else
        v55 = 0;
      -[TGraphSampler updatePowerlogMiscState:value:](v54, "updatePowerlogMiscState:value:", 5, v55);
      goto LABEL_78;
    }
    if (os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
      sub_10005177C();
LABEL_73:
    byte_1000A1F6C = 0;
    goto LABEL_74;
  }
LABEL_78:
  v56 = (const __CFBoolean *)SCPreferencesGetValue(prefs, CFSTR("sunlightOverride"));
  if (!v56)
  {
    v59 = 0;
LABEL_84:
    dword_1000A249C = v59;
    goto LABEL_85;
  }
  v57 = v56;
  v58 = CFGetTypeID(v56);
  if (v58 == CFBooleanGetTypeID())
  {
    if (v57 == kCFBooleanTrue)
      v59 = 1;
    else
      v59 = -1;
    goto LABEL_84;
  }
LABEL_85:
  if (byte_1000A2480)
  {
    v60 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_1000A249C;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "<Notice> sunlight override: %d", buf, 8u);
    }
  }
  v61 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("thermalUseRawValues"));
  byte_1000A1DDC = v61 == kCFBooleanTrue;
  if (byte_1000A2480)
  {
    v62 = v61;
    v63 = *((_QWORD *)v5 + 276);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = "dis";
      if (v62 == kCFBooleanTrue)
        v64 = "en";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "<Notice> Raw Value Mode %sabled", buf, 0xCu);
    }
  }
  v65 = (CFBooleanRef)SCPreferencesGetValue(prefs, CFSTR("forceSkipInfoOnlySensors"));
  if (v65)
  {
    v66 = v65;
    v67 = v65 == kCFBooleanTrue;
    byte_1000A1F10 = v65 == kCFBooleanTrue;
    if (byte_1000A2480)
    {
      v68 = *((_QWORD *)v5 + 276);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = "off";
        if (v66 == kCFBooleanTrue)
          v69 = "on";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "<Notice> Force Skip Info Only Sensors %s", buf, 0xCu);
        v67 = byte_1000A1F10;
      }
    }
    if (v67)
      v70 = 0;
    else
      v70 = byte_1000A1EFC;
    -[HidSensors setInfoOnlySensorsActive:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "setInfoOnlySensorsActive:", v70);
    -[ContextAwareThermalManager setInfoOnlySensorsActive:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "setInfoOnlySensorsActive:", v70);
  }
  if (!byte_10009A1F0 || !notify_post(kOSThermalNotificationName))
  {
    v71 = (const __CFNumber *)SCPreferencesGetValue(prefs, CFSTR("setExpectedSensorMask"));
    if (v71)
    {
      v72 = v71;
      v73 = CFGetTypeID(v71);
      if (v73 == CFNumberGetTypeID())
      {
        v74 = *((_QWORD *)v5 + 276);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = qword_1000A1F18;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "<Notice> Old Expected Sensor Mask: %llx ", buf, 0xCu);
        }
        CFNumberGetValue(v72, kCFNumberLongLongType, &qword_1000A1F18);
        v75 = *((_QWORD *)v5 + 276);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = qword_1000A1F18;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "<Notice> New Expected Sensor Mask: %llx ", buf, 0xCu);
        }
        if (SCPreferencesGetValue(prefs, CFSTR("setExpectedSensorMaskPersistentlyEnabled")) != kCFBooleanTrue)
        {
          SCPreferencesRemoveValue(prefs, CFSTR("setExpectedSensorMask"));
          if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
            sub_10004F0E8();
        }
      }
    }
    if (SCPreferencesGetValue(prefs, CFSTR("getCurrentSensorSet")) == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, CFSTR("getCurrentSensorSet"), kCFBooleanFalse);
      *(_QWORD *)buf = qword_1000A1F30;
      v76 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, buf);
      SCPreferencesSetValue(prefs, CFSTR("expectedSensorMaskValue"), v76);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
      CFRelease(v76);
    }
    if (SCPreferencesGetValue(prefs, CFSTR("hipStates")) == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, CFSTR("hipStates"), kCFBooleanFalse);
      v77 = byte_1000A2493 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("BacklightStatus"), v77);
      v78 = byte_1000A2494 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("ConnectedExternallyStatus"), v78);
      v79 = byte_1000A2495 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("SystemToppingOffStatus"), v79);
      v80 = byte_1000A2496 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("AaudioStatus"), v80);
      v81 = byte_1000A2497 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("CarSessionStatus"), v81);
      v82 = byte_1000A2498 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("WakeInProgressStatus"), v82);
      v83 = byte_1000A2499 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, CFSTR("StockholmFieldDetectInProgressStatus"), v83);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
    v84 = (const __CFBoolean *)SCPreferencesGetValue(prefs, CFSTR("overrideTxMaxLimitKey"));
    if (byte_1000A2480)
    {
      v85 = *((_QWORD *)v5 + 276);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = "dis";
        if (v84 == kCFBooleanTrue)
          v86 = "en";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v86;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "<Notice> Override Tx Max Limit %sabled", buf, 0xCu);
      }
    }
    if (v84 != kCFBooleanTrue)
      goto LABEL_153;
    v87 = (const __CFArray *)SCPreferencesGetValue(prefs, CFSTR("setTxMaxLimit"));
    if (!v87)
      goto LABEL_153;
    v88 = v87;
    v89 = CFGetTypeID(v87);
    if (v89 != CFArrayGetTypeID())
      goto LABEL_153;
    v100 = 0;
    v101 = 0;
    v90 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 0);
    CFNumberGetValue(v90, kCFNumberIntType, &v101);
    v91 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 1);
    CFNumberGetValue(v91, kCFNumberIntType, &v100);
    v92 = v101;
    v102 = v100;
    values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v102);
    switch(v92)
    {
      case 0:
        v93 = 0;
        valuePtr = (const void *)kCTMaxTransmitPowerPercentage2G;
        break;
      case 1:
        valuePtr = (const void *)kCTMaxTransmitPowerPercentageC2K;
        v93 = 1;
        break;
      case 2:
        valuePtr = (const void *)kCTMaxTransmitPowerPercentageUMTS;
        v93 = 2;
        break;
      case 4:
        valuePtr = (const void *)kCTMaxTransmitPowerPercentageUTRAN2;
        v93 = 4;
        break;
      case 5:
        valuePtr = (const void *)kCTMaxThroughputPercentageUTRAN3;
        v93 = 5;
        break;
      case 6:
        valuePtr = (const void *)kCTThermalTxBackoff;
        v93 = 6;
        break;
      case 7:
        valuePtr = (const void *)kCTThermalTxDutyCycle;
        v93 = 7;
        break;
      default:
        valuePtr = (const void *)kCTMaxThroughputPercentageLTE;
        v93 = 3;
        break;
    }
    v94 = CFDictionaryCreate(kCFAllocatorDefault, &valuePtr, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFRelease(values);
    v107 = 0;
    *(_OWORD *)buf = 0u;
    v106 = 0u;
    v95 = (const void *)_CTServerConnectionCreateWithIdentifier(kCFAllocatorDefault, CFSTR("thermtune"), sub_100030F00, buf);
    if (!v95)
      fwrite("_CTServerConnectionCreate() failed", 0x22uLL, 1uLL, __stderrp);
    v96 = _CTServerConnectionConfigMaxRadioPower(v95, v94);
    v97 = *((_QWORD *)v5 + 276);
    v98 = os_log_type_enabled(v97, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v96)
    {
      if (v98)
      {
        sub_1000516CC(v96, SHIDWORD(v96));
        if (!v95)
          goto LABEL_175;
        goto LABEL_174;
      }
    }
    else if (v98)
    {
      sub_10005164C(&v102, v93, v97);
      if (!v95)
        goto LABEL_175;
      goto LABEL_174;
    }
    if (!v95)
    {
LABEL_175:
      CFRelease(v94);
      if (SCPreferencesGetValue(prefs, CFSTR("overrideTxMaxLimitPersistentlyEnabled")) != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(prefs, CFSTR("setTxMaxLimit"));
        if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
          sub_10004F0E8();
      }
LABEL_153:
      SCPreferencesSynchronize(prefs);
      return;
    }
LABEL_174:
    CFRelease(v95);
    goto LABEL_175;
  }
  if (os_log_type_enabled(*((os_log_t *)v5 + 276), OS_LOG_TYPE_ERROR))
    sub_100051750();
}

void sub_10002FCD4(const __SCPreferences *a1)
{
  const __CFString *Value;
  int v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  stat v13;
  uint8_t buf[4];
  const char *v15;
  uint8_t buffer[1032];

  Value = (const __CFString *)SCPreferencesGetValue(a1, CFSTR("tGraphLogFile"));
  memset(&v13, 0, sizeof(v13));
  if (!Value)
  {
    v6 = dword_10009A208;
    if (dword_10009A208 < 0)
    {
      if (byte_1000A2480)
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> no tGraph log", buffer, 2u);
        }
      }
    }
    else
    {
      if (byte_1000A2480)
      {
        v7 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Closing tGraph log file", buffer, 2u);
          v6 = dword_10009A208;
        }
      }
      byte_1000A1EFC = 0;
      close(v6);
      dword_10009A208 = -1;
    }
LABEL_31:
    if (byte_1000A1F10)
      v10 = 0;
    else
      v10 = byte_1000A1EFC;
    -[HidSensors setInfoOnlySensorsActive:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "setInfoOnlySensorsActive:", v10);
    -[ContextAwareThermalManager setInfoOnlySensorsActive:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "setInfoOnlySensorsActive:", v10);
    if (byte_1000A2480)
    {
      v11 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        if (byte_1000A1EFC)
          v12 = "en";
        else
          v12 = "dis";
        *(_DWORD *)buf = 136315138;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log %sabled", buf, 0xCu);
      }
    }
    return;
  }
  if (CFStringGetFileSystemRepresentation(Value, (char *)buffer, 1024))
  {
    v2 = open((const char *)buffer, 522, 420);
    if ((v2 & 0x80000000) == 0)
    {
      v3 = v2;
      if (fstat(v2, &v13) < 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100051840();
        goto LABEL_25;
      }
      v4 = dword_10009A208;
      if ((dword_10009A208 & 0x80000000) == 0)
      {
        if (*(_DWORD *)byte_1000A1F90 == v13.st_dev && *(_QWORD *)&byte_1000A1F90[8] == v13.st_ino)
        {
          if (byte_1000A2480)
          {
            v5 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log to same file", buf, 2u);
            }
          }
LABEL_25:
          close(v3);
          return;
        }
        if (byte_1000A2480)
        {
          v9 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log to new file", buf, 2u);
            v4 = dword_10009A208;
          }
        }
        close(v4);
      }
      dword_10009A208 = v3;
      *(stat *)byte_1000A1F90 = v13;
      byte_1000A1EFC = 1;
      sub_100004110(1);
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000517D4();
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000517A8();
  }
}

uint64_t getThermalSensorSet()
{
  return qword_1000A1F30;
}

uint64_t getThermalWatchdogState()
{
  return qword_1000A1F20;
}

uint64_t getThermalUpdateTime()
{
  if (byte_10009A1F2)
    return qword_1000A1F28;
  else
    return 0;
}

const char *sub_1000300D8(char *a1)
{
  NSObject *v2;
  const char *v3;
  int v5;
  char *v6;

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Model name = %s", (uint8_t *)&v5, 0xCu);
  }
  v3 = "mac";
  if (!strstr(a1, "Mac") && strcmp(a1, "eperm-d995af6e429c4224"))
    return "";
  return v3;
}

void thermalMonitor_init()
{
  NSObject *v0;
  unint64_t v1;
  BOOL v2;
  NSDictionary *v3;
  __CFArray *Mutable;
  uint64_t i;
  CFNumberRef v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  uint64_t v11;
  uint64_t v12;
  const void *ValueAtIndex;
  CFTypeID v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  CFIndex Length;
  CFIndex v25;
  CFIndex v26;
  uint64_t v27;
  char v28;
  char CharacterAtIndex;
  NSObject *v30;
  char *v31;
  CFRunLoopRef Current;
  TGraphSampler *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  size_t v40;
  _BOOL8 v41;
  id v42;
  NotificationManager *v43;
  void *v44;
  CFAbsoluteTime v45;
  size_t v46;
  uint8_t v47;
  _BYTE v48[11];
  unsigned int valuePtr;
  char cStr[64];
  SCPreferencesContext v51;
  CFRunLoopTimerContext buf;

  v46 = 64;
  qword_1000A2AB8 = (uint64_t)SCPreferencesCreate(0, CFSTR("OSThermalStatus"), CFSTR("OSThermalStatus.plist"));
  if (qword_1000A2AB8)
  {
    if (sysctlbyname("hw.model", cStr, &v46, 0, 0) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000518D8();
    }
    else
    {
      v0 = os_log_create("com.apple.cltm", "thermalmonitor");
      qword_1000A28A0 = (uint64_t)v0;
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.version) = 136315138;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)cStr;
        _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> Model name = %s", (uint8_t *)&buf, 0xCu);
      }
      v1 = 0;
      v2 = 1;
      while (v1 > 0x3C || cStr[v1] != 68 || cStr[v1 + 1] != 69 || cStr[v1 + 2] != 86)
      {
        v2 = v1++ < 0x3F;
        if (v1 == 64)
          goto LABEL_11;
      }
      strcpy(&cStr[v1], "AP");
      if (v2)
      {
        byte_1000A2482 = 1;
        v39 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<Notice> Detected Dev board.", (uint8_t *)&buf, 2u);
        }
      }
LABEL_11:
      v3 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend(objc_msgSend(CFSTR("/System/Library/ThermalMonitor/"), "stringByAppendingString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", cStr)), "stringByAppendingString:", CFSTR("-Info.plist")));
      if (v3)
        v3 = v3;
      qword_1000A1F38 = (uint64_t)v3;
      *(_OWORD *)&buf.version = xmmword_100061880;
      *(_OWORD *)&buf.retain = xmmword_100061890;
      buf.copyDescription = (CFStringRef (__cdecl *)(const void *))0x100000000CLL;
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      for (i = 0; i != 40; i += 4)
      {
        v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&buf + i);
        CFArrayAppendValue(Mutable, v6);
        if (v6)
          CFRelease(v6);
      }
      if (Mutable)
      {
        v7 = CFGetTypeID(Mutable);
        if (v7 == CFArrayGetTypeID())
        {
          Count = CFArrayGetCount(Mutable);
          if (Count >= 1)
          {
            v9 = Count;
            v10 = 0;
            v11 = 0;
            v12 = 0;
            do
            {
              valuePtr = -1;
              ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v10);
              v14 = CFGetTypeID(ValueAtIndex);
              if (v14 == CFNumberGetTypeID()
                && (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr),
                    _OSThermalNotificationSetLevelForBehavior(valuePtr, v11),
                    v15 = _OSThermalNotificationLevelForBehavior(v11),
                    v16 = valuePtr,
                    v15 != valuePtr))
              {
                v18 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v51.version) = 67109376;
                  HIDWORD(v51.version) = v11;
                  LOWORD(v51.info) = 1024;
                  *(_DWORD *)((char *)&v51.info + 2) = v16;
                  _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<Error> Failed to set OSThermalNotificationLevel %d with %d", (uint8_t *)&v51, 0xEu);
                }
                v17 = (v12 + 1);
                if ((int)v12 > 10)
                {
                  v19 = qword_1000A28A0;
                  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                    sub_100051AF8(&v47, v48, v19);
                }
                else
                {
                  LODWORD(v11) = v11 - 1;
                }
              }
              else
              {
                v17 = v12;
              }
              v11 = (v11 + 1);
              v10 = (int)v11;
              v12 = v17;
            }
            while (v9 > (int)v11);
          }
          if (byte_1000A2480)
          {
            v20 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v51.version) = 138412290;
              *(CFIndex *)((char *)&v51.version + 4) = (CFIndex)Mutable;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> mitigation levels: %@", (uint8_t *)&v51, 0xCu);
            }
          }
        }
        CFRelease(Mutable);
      }
      v21 = qword_1000A1F38;
      if (qword_1000A1F38)
      {
        v22 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, kCFAllocatorNull);
        if (v22)
        {
          v23 = v22;
          Length = CFStringGetLength(v22);
          if (Length < 1)
          {
            v27 = 0;
          }
          else
          {
            v25 = Length;
            v26 = 0;
            LODWORD(v27) = 0;
            v28 = 1;
            do
            {
              CharacterAtIndex = CFStringGetCharacterAtIndex(v23, v26);
              if ((v28 & 1) != 0)
                v27 = (v27 + CharacterAtIndex);
              else
                v27 = (CharacterAtIndex * (_DWORD)v27);
              v28 ^= 1u;
              ++v26;
            }
            while (v25 != v26);
          }
          CFRelease(v23);
          qword_1000A1DC8 = -[ThermalManager initWithConfig:]([ThermalManager alloc], "initWithConfig:", v21);
          objc_msgSend((id)qword_1000A1DC8, "SaveProductString:", v27);
          sub_100030CE8(3);
        }
        if (byte_1000A2482)
          qword_1000A1F20 = -1;
        v31 = (char *)sub_10002E178();
        byte_10009A1F2 = strstr(v31, "wdt_test=thermal") == 0;
        qword_1000A1F08 = (uint64_t)off_10009A1F8;
        Current = CFRunLoopGetCurrent();
        qword_1000A2470 = (uint64_t)CFRetain(Current);
        sub_10002E4B4((const __SCPreferences *)qword_1000A2AB8);
        memset(&v51, 0, sizeof(v51));
        if (SCPreferencesSetCallback((SCPreferencesRef)qword_1000A2AB8, (SCPreferencesCallBack)sub_100030F34, &v51))
        {
          if (SCPreferencesScheduleWithRunLoop((SCPreferencesRef)qword_1000A2AB8, (CFRunLoopRef)qword_1000A2470, kCFRunLoopDefaultMode))
          {
            *(double *)&qword_1000A1F00 = -kCFAbsoluteTimeIntervalSince1970;
            objc_msgSend((id)qword_1000A1DC8, "updatePrefs::", qword_1000A2AB8, 0);
            objc_msgSend((id)qword_1000A1DC8, "createNewProduct:", qword_1000A2470);
            objc_msgSend((id)qword_1000A1DC8, "initDataCollection");
            sub_10002FCD4((const __SCPreferences *)qword_1000A2AB8);
            v33 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
            if (byte_10009A1F0)
              v34 = 100;
            else
              v34 = 0;
            -[TGraphSampler updatePowerlogMiscState:value:](v33, "updatePowerlogMiscState:value:", 5, v34);
            if (dword_1000A2020)
            {
              if (byte_1000A2480)
              {
                v35 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> deregistering for wake notification before re-registering", (uint8_t *)&buf, 2u);
                }
              }
              if (qword_1000A2038)
              {
                CFRunLoopRemoveSource((CFRunLoopRef)qword_1000A2470, (CFRunLoopSourceRef)qword_1000A2038, kCFRunLoopDefaultMode);
                qword_1000A2038 = 0;
              }
              if (dword_1000A2030)
              {
                IODeregisterForSystemPower((io_object_t *)&dword_1000A2030);
                dword_1000A2030 = 0;
              }
              if (dword_1000A2020)
              {
                IOServiceClose(dword_1000A2020);
                dword_1000A2020 = 0;
              }
              if (qword_1000A2028)
              {
                IONotificationPortDestroy((IONotificationPortRef)qword_1000A2028);
                qword_1000A2028 = 0;
              }
              if (byte_1000A2480)
              {
                v36 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> deregistered for wake notification", (uint8_t *)&buf, 2u);
                }
              }
              sub_100008D0C();
            }
            dword_1000A2020 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1000A2028, (IOServiceInterestCallback)sub_100030F68, (io_object_t *)&dword_1000A2030);
            if (dword_1000A2020 && qword_1000A2028)
            {
              qword_1000A2038 = (uint64_t)IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_1000A2028);
              CFRunLoopAddSource((CFRunLoopRef)qword_1000A2470, (CFRunLoopSourceRef)qword_1000A2038, kCFRunLoopDefaultMode);
              if (byte_1000A2480)
              {
                v37 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "<Notice> registered for wake notification", (uint8_t *)&buf, 2u);
                }
              }
            }
            else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_100051ACC();
            }
            objc_msgSend((id)qword_1000A1DC8, "createConnectionToCT");
            v38 = objc_msgSend((id)qword_1000A1DC8, "getProductTotalSensors");
            dword_1000A1EE4 = v38;
            if (v38)
            {
              if (v38 >= 65 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                sub_100051AA0();
            }
            else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_100051A74();
            }
            if ((int)objc_msgSend((id)qword_1000A1DC8, "getProductTotalPowerSensors") >= 11
              && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_100051A48();
            }
            qword_1000A2AB0 = 0;
            dword_1000A2040 = dword_1000A1EE4 - 1;
            if (dword_1000A1EE4 >= 1)
            {
              v40 = 4 * dword_1000A1EE4;
              memset_pattern16(&qword_1000A29AC, &unk_1000618A0, v40);
              memset_pattern16(dword_1000A28AC, &unk_1000618A0, v40);
              memset_pattern16(dword_1000A1DE0, &unk_1000618A0, v40);
            }
            qword_1000A1F18 = -[HidSensors getWatchDogMask](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getWatchDogMask");
            qword_1000A1F58 = qword_1000A1F18;
            dword_1000A1DD0 = objc_msgSend((id)qword_1000A1DC8, "getProductCalibrationSensorID");
            dword_1000A1DD4 = objc_msgSend((id)qword_1000A1DC8, "getProductCalibrationDefault");
            dword_1000A1EF8 = objc_msgSend((id)qword_1000A1DC8, "getRequiredCalibrationResistorSamples");
            qword_1000A1EE8 = (uint64_t)objc_msgSend((id)qword_1000A1DC8, "getProductFilterValues");
            if (!qword_1000A1EE8 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_100051A1C();
            if (!byte_1000A2482)
              qword_1000A1F20 = 1;
            v41 = -[ContextAwareThermalManager getContextState:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "getContextState:", 0) != -1;
            v42 = objc_msgSend((id)qword_1000A1DC8, "getModeratePressureVersion");
            v43 = [NotificationManager alloc];
            qword_1000A2488 = -[NotificationManager init:withSolarInfo:withModeratePressureVersion:](v43, "init:withSolarInfo:withModeratePressureVersion:", dword_1000A2040, v41, v42);
            objc_msgSend((id)qword_1000A1DC8, "initializeReadPrefs:", qword_1000A2AB8);
            sub_100035C04((uint64_t)CFSTR("/Library/Preferences/SystemConfiguration/OSThermalStatus.plist"));
            v44 = (void *)qword_1000A1DC8;
            v45 = CFAbsoluteTimeGetCurrent();
            buf.version = 0;
            memset(&buf.retain, 0, 24);
            buf.info = v44;
            if (qword_1000A2048)
            {
              CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_1000A2048);
              CFRelease((CFTypeRef)qword_1000A2048);
            }
            qword_1000A2048 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, v45, 5.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000054EC, &buf);
            CFRunLoopAddTimer((CFRunLoopRef)qword_1000A2470, (CFRunLoopTimerRef)qword_1000A2048, kCFRunLoopDefaultMode);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_1000519B0();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100051944();
        }
      }
      else
      {
        v30 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> no thermal model for device", (uint8_t *)&buf, 2u);
        }
        qword_1000A1F20 = -1;
        sub_100030CE8(0);

        qword_1000A28A0 = 0;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000518AC();
  }
}

uint64_t sub_100030CE8(int a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  int valuePtr;

  valuePtr = a1;
  v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    v2 = v1;
    SCPreferencesSetValue((SCPreferencesRef)qword_1000A2AB8, CFSTR("CLTMStatus"), v1);
    CFRelease(v2);
  }
  return SCPreferencesCommitChanges((SCPreferencesRef)qword_1000A2AB8);
}

uint64_t sub_100030D58()
{
  id v0;
  char *v1;
  uint64_t v2;
  _QWORD v4[5];

  v0 = objc_alloc_init((Class)NSMutableArray);
  mach_timebase_info((mach_timebase_info_t)&dword_1000A1F44);
  v1 = (char *)sub_10002E178();
  if (strstr(v1, "tmd_disable_111276880"))
    byte_1000A1F40 = 1;
  wd_endpoint_register("com.apple.thermalmonitord.watchdog");
  wd_endpoint_add_queue(&_dispatch_main_q);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000092C0;
  v4[3] = &unk_10007DF60;
  v4[4] = v0;
  v2 = wd_endpoint_set_alive_func(v4);
  return wd_endpoint_activate(v2);
}

void start()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = objc_autoreleasePoolPush();
  pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  sub_100030D58();
  thermalMonitor_init();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10007DFA0);
  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  v1 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "<Error> main thread exiting", v2, 2u);
  }
  exit(0);
}

void sub_100030EA4(id a1, OS_xpc_object *a2)
{
  const char *string;

  if (a2)
  {
    string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
    if (string)
    {
      if (!strcasecmp("com.apple.ManagedConfiguration.profileListChanged", string))
      {
        sleep(2u);
        sub_10002E4B4((const __SCPreferences *)qword_1000A2AB8);
      }
    }
  }
}

uint64_t sub_100030F00(uint64_t a1, const void *a2)
{
  return fprintf(__stderrp, "unknown CT notification: %p", a2);
}

void sub_100030F34(const __SCPreferences *a1)
{
  objc_msgSend((id)qword_1000A1DC8, "updatePrefs::", a1, 1);
  SCPreferencesSynchronize(a1);
}

void sub_100030F68(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  int v5;
  unint64_t v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int v25;

  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  v5 = v6 >> 4;
  if (v5)
  {
    if (v5 == 11)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> System Will Power On", (uint8_t *)&v24, 2u);
      }
      if ((int)qword_1000A2478 >= 12)
      {
        v11 = dword_1000A1F64;
        if (dword_1000A1F64)
        {
          v12 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 67109120;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> clearing orphaned sleep assertion: 0x%08x", (uint8_t *)&v24, 8u);
          }
          sub_100008D0C();
        }
        v13 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, (CFStringRef)qword_1000A1F08, (IOPMAssertionID *)&dword_1000A1F64);
        if ((_DWORD)v13)
        {
          v14 = v13;
          v15 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_100051D40(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        else if (byte_1000A2480)
        {
          v23 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 67109120;
            v25 = dword_1000A1F64;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> created idle sleep assertion 0x%08x", (uint8_t *)&v24, 8u);
          }
        }
      }
      objc_msgSend((id)qword_1000A1DC8, "updateSystemPowerState:", 1);
    }
    else if (v5 == 1)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> System Will Sleep", (uint8_t *)&v24, 2u);
      }
      objc_msgSend((id)qword_1000A1DC8, "updateSystemPowerState:", 0);
LABEL_10:
      IOAllowPowerChange(dword_1000A2020, a4);
    }
  }
  else
  {
    v8 = objc_msgSend((id)qword_1000A1DC8, "canSystemSleep");
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 67109120;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> Can System Sleep (reply: %d)", (uint8_t *)&v24, 8u);
    }
    if (v8)
      goto LABEL_10;
    if (byte_1000A2480)
    {
      v22 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<Notice> Preventing system sleep", (uint8_t *)&v24, 2u);
      }
    }
    IOCancelPowerChange(dword_1000A2020, a4);
  }
}

size_t sub_100031268(int a1)
{
  char *v2;
  char *v3;
  uint64_t v4;
  int *v5;
  int v6;
  size_t result;

  v2 = &byte_1000A2058[__sprintf_chk(byte_1000A2058, 0, 0x340uLL, "[")];
  v3 = &v2[sprintf(v2, "%d", dword_1000A1DE0[0])];
  if (a1 >= 2)
  {
    v4 = a1 - 1;
    v5 = &dword_1000A1DE4;
    do
    {
      strcpy(v3, ", ");
      v6 = *v5++;
      v3 += sprintf(v3 + 2, "%d", v6) + 2;
      --v4;
    }
    while (v4);
  }
  result = strlen(v3);
  *(_WORD *)&v3[result] = 93;
  return result;
}

char *sub_10003133C(int *a1)
{
  return strerror(*a1);
}

void sub_100031344(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

int *sub_100031350()
{
  return __error();
}

id sub_100031B10(uint64_t a1, void *a2)
{
  id result;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v5 = result;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      v9 = v6;
      v10 = a1 + 4 * v6;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a2);
        *(_DWORD *)(v10 + 4 * (_QWORD)v8) = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "intValue");
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = result;
      v6 = v9 + (_DWORD)v8;
    }
    while (result);
  }
  return result;
}

id sub_100031C10(uint64_t a1, void *a2)
{
  id result;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v5 = result;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v6;
      v10 = a1 + 4 * v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "floatValue");
        *(_DWORD *)(v10 + 4 * (_QWORD)v8) = v11;
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = result;
      v6 = v9 + (_DWORD)v8;
    }
    while (result);
  }
  return result;
}

void sub_100032260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

float sub_10003229C(uint64_t a1, int a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    objc_msgSend(Weak, "setPowerSaveActive:", state64 != 0);
    result = (float)objc_msgSend(Weak, "powerSaveActive");
    *(float *)&dword_1000A2B08 = result;
  }
  return result;
}

float sub_10003230C(uint64_t a1, int a2)
{
  id Weak;
  float result;
  uint64_t state64;

  state64 = 0;
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    objc_msgSend(Weak, "setProModeActive:", state64 != 0);
    result = (float)objc_msgSend(Weak, "proModeActive");
    *(float *)&dword_1000A2B2C = result;
  }
  return result;
}

void sub_1000326A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  _QWORD v37[5];
  int v38;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 229))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 329) = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 100;
    v5 = 64;
    do
    {
      if (v4 >= *(_DWORD *)(v3 + v5))
        v4 = *(_DWORD *)(v3 + v5);
      v5 += 4;
    }
    while ((_DWORD)v5 != 88);
    v6 = 0;
    v7 = 136;
    do
    {
      if (v6 <= *(_DWORD *)(v3 + v7))
        v6 = *(_DWORD *)(v3 + v7);
      v7 += 4;
    }
    while ((_DWORD)v7 != 160);
    if (v4 <= v6)
      v8 = v6;
    else
      v8 = v4;
    if (*(_BYTE *)(v3 + 296))
    {
      v9 = *(NSObject **)(v3 + 320);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100032A08;
      v37[3] = &unk_10007DC60;
      v37[4] = v3;
      v38 = v8;
      dispatch_async(v9, v37);
      return;
    }
    if (*(_BYTE *)(v3 + 209))
      v11 = *(unsigned int *)(v3 + 216);
    else
      v11 = 65000;
    objc_msgSend((id)v3, "setCPULowPowerTarget:", v11);
    v36 = *(int **)(a1 + 32);
    if ((_DWORD)v8 != v36[84])
    {
      v36[84] = v8;
      objc_msgSend(*(id *)(a1 + 32), "setCPUPowerZoneTarget:", v8);
      v36 = *(int **)(a1 + 32);
    }
    v31 = v36[60];
    v34 = v36[62];
    v35 = 728039444;
    v25 = 0;
    v28 = 0;
  }
  else
  {
    if (*(_BYTE *)(v2 + 209))
      v10 = *(_DWORD *)(v2 + 212);
    else
      v10 = 101;
    v12 = 0;
    v13 = 0;
    *(_DWORD *)(v2 + 288) = v10;
    v14 = *(_QWORD *)(a1 + 32);
    do
    {
      if (v13 <= *(_DWORD *)(v14 + 136 + v12))
        v13 = *(_DWORD *)(v14 + 136 + v12);
      v12 += 4;
    }
    while ((_DWORD)v12 != 24);
    *(_DWORD *)(v14 + 332) = 101;
    v15 = &stru_100000100.sectname[12];
    do
    {
      v16 = *(unsigned int **)(a1 + 32);
      v17 = *(unsigned int *)((char *)v16 + v15 - 4);
      if ((int)v17 <= v13)
        v18 = v13;
      else
        v18 = v17;
      if ((int)v16[83] > (int)v18)
      {
        v16[83] = v18;
        v16 = *(unsigned int **)(a1 + 32);
      }
      if (*(unsigned int *)((char *)v16 + v15) != (_DWORD)v18)
      {
        objc_msgSend(v16, "setServiceProperty:key:value:scaleToFixedPoint:", v16[8], *(__CFString **)((char *)&off_10007DFC0[-33] + v15 - 4), v18, 1);
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + v15) = v18;
      }
      v15 += 8;
    }
    while (v15 != 300);
    v19 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 332);
    if (v19 >= 100)
      v20 = 0x10000;
    else
      v20 = (v19 << 16) / 100;
    kdebug_trace(728039424, v20, 0, 0, 0);
    v21 = *(_DWORD **)(a1 + 32);
    v22 = v21[67];
    v23 = v22 <= 99;
    v24 = (v22 << 16) / 100;
    if (v23)
      v25 = v24;
    else
      v25 = 0x10000;
    v26 = v21[69];
    v23 = v26 <= 99;
    v27 = (v26 << 16) / 100;
    if (v23)
      v28 = v27;
    else
      v28 = 0x10000;
    v29 = v21[71];
    v23 = v29 <= 99;
    v30 = (v29 << 16) / 100;
    if (v23)
      v31 = v30;
    else
      v31 = 0x10000;
    v32 = v21[73];
    v23 = v32 <= 99;
    v33 = (v32 << 16) / 100;
    if (v23)
      v34 = v33;
    else
      v34 = 0x10000;
    v35 = 728039440;
  }
  kdebug_trace(v35, v25, v28, v31, v34);
}

uint64_t sub_1000329C0(int *a1, int a2, uint64_t a3)
{
  unsigned int v3;
  int v4;

  if (a2 >= 1)
  {
    do
    {
      v4 = *a1++;
      v3 = v4;
      if ((int)a3 >= v4)
        a3 = v3;
      else
        a3 = a3;
      --a2;
    }
    while (a2);
  }
  return a3;
}

uint64_t sub_1000329E4(int *a1, int a2, uint64_t a3)
{
  unsigned int v3;
  int v4;

  if (a2 >= 1)
  {
    do
    {
      v4 = *a1++;
      v3 = v4;
      if ((int)a3 <= v4)
        a3 = v3;
      else
        a3 = a3;
      --a2;
    }
    while (a2);
  }
  return a3;
}

uint64_t sub_100032A08(uint64_t a1)
{
  int v2;
  int *v3;

  objc_msgSend(*(id *)(a1 + 32), "setPackageLowPowerTarget");
  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(int **)(a1 + 32);
  if (v2 != v3[84])
  {
    v3[84] = v2;
    objc_msgSend(*(id *)(a1 + 32), "setPackagePowerZoneTarget");
    v3 = *(int **)(a1 + 32);
  }
  return kdebug_trace(728039444, v3[75], v3[77], 0, 0);
}

void sub_100032AD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 100;
  do
  {
    if (v4 >= *(_DWORD *)(v3 + 88 + v2))
      v4 = *(_DWORD *)(v3 + 88 + v2);
    v2 += 4;
  }
  while ((_DWORD)v2 != 24);
  v5 = 0;
  v6 = 0;
  do
  {
    if (v6 <= *(_DWORD *)(v3 + 160 + v5))
      v6 = *(_DWORD *)(v3 + 160 + v5);
    v5 += 4;
  }
  while ((_DWORD)v5 != 24);
  if (v4 <= v6)
    v4 = v6;
  if (*(_BYTE *)(v3 + 209) && v4 >= *(_DWORD *)(v3 + 220))
    v4 = *(_DWORD *)(v3 + 220);
  if (v4 != *(_DWORD *)(v3 + 340))
  {
    *(_DWORD *)(v3 + 340) = v4;
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 229))
    {
      if (*(_BYTE *)(v7 + 296))
      {
        v8 = *(NSObject **)(v7 + 320);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100032C1C;
        block[3] = &unk_10007D248;
        block[4] = v7;
        dispatch_async(v8, block);
      }
      else
      {
        objc_msgSend((id)v7, "setGPUPowerZoneTarget:", *(unsigned int *)(v7 + 340));
        kdebug_trace(728039448, *(int *)(*(_QWORD *)(a1 + 32) + 260), 0, 0, 0);
      }
    }
    else
    {
      objc_msgSend((id)v7, "setDieTempControllerProperty:level:scaleToFixedPoint:", CFSTR("GPUMaxPower"), *(unsigned int *)(v7 + 340), 0);
    }
  }
}

uint64_t sub_100032C1C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPackagePowerZoneTarget");
  return kdebug_trace(728039444, *(int *)(*(_QWORD *)(a1 + 32) + 300), *(int *)(*(_QWORD *)(a1 + 32) + 308), 0, 0);
}

id sub_10003304C(uint64_t a1)
{
  char *v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  unsigned int *v13;
  _DWORD v14[2];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 329) = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 1);
  v2 = *(char **)(a1 + 32);
  v3 = 65000;
  v4 = 112;
  do
  {
    if (v3 >= *(_DWORD *)&v2[v4])
      v3 = *(_DWORD *)&v2[v4];
    v4 += 4;
  }
  while ((_DWORD)v4 != 136);
  v5 = 0;
  v6 = 184;
  do
  {
    if (v5 <= *(_DWORD *)&v2[v6])
      v5 = *(_DWORD *)&v2[v6];
    v6 += 4;
  }
  while ((_DWORD)v6 != 208);
  if (v3 <= v5)
    v7 = v5;
  else
    v7 = v3;
  result = objc_msgSend(v2, "setPackageLowPowerTarget");
  v10 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v7 != *(_DWORD *)(v10 + 308))
  {
    if (byte_1000A2480)
    {
      v11 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 67109120;
        v14[1] = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> New Package power target: %d", (uint8_t *)v14, 8u);
        v10 = *(_QWORD *)(a1 + 32);
      }
    }
    LODWORD(v9) = vcvtd_n_s64_f64((double)(int)v7 / 1000.0, 0x18uLL);
    if (*(_BYTE *)(v10 + 329) && *(_DWORD *)(v10 + 244) != (_DWORD)v7)
    {
      v12 = v7;
    }
    else
    {
      if (*(_BYTE *)(v10 + 328))
        -[CPMSHelper addToCPMSMitigationArray:forComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "addToCPMSMitigationArray:forComponent:", v7, 13);
      else
      v13 = *(unsigned int **)(a1 + 32);
      if (v13[61] == 65000)
        goto LABEL_25;
      v12 = 65000;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) = v12;
LABEL_25:
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 308) = v7;
    return (id)kdebug_trace(728039444, *(int *)(*(_QWORD *)(a1 + 32) + 300), *(int *)(*(_QWORD *)(a1 + 32) + 308), 0, 0);
  }
  return result;
}

const char *sub_100033B54(const __CFString *a1)
{
  return CFStringGetCStringPtr(a1, 0x8000100u);
}

void sub_100034094(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

CFMutableDictionaryRef sub_1000340B8(const char *a1, void *a2, const void *a3)
{
  CFMutableDictionaryRef result;
  __CFDictionary *v5;
  CFDictionaryRef v6;
  const void *v7;
  void *keys;

  v7 = a3;
  keys = a2;
  result = IOServiceMatching(a1);
  if (result)
  {
    v5 = result;
    if (a2)
    {
      v6 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, &v7, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, CFSTR("IOPropertyMatch"), v6);
      CFRelease(v6);
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }
  return result;
}

BOOL sub_100034150(const __CFDictionary *a1, const void *a2)
{
  return sub_100034168(a1, a2, 0);
}

BOOL sub_100034168(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  const __CFBoolean *v7;
  CFTypeID v8;

  if (a1)
  {
    if (CFDictionaryContainsKey(a1, a2))
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        v7 = Value;
        v8 = CFGetTypeID(Value);
        if (v8 == CFBooleanGetTypeID())
          return CFBooleanGetValue(v7) != 0;
      }
    }
  }
  return a3;
}

uint64_t sub_1000341DC(const __CFDictionary *a1, const void *a2, _QWORD *a3)
{
  uint64_t result;
  const void *Value;
  const void *v8;
  CFTypeID v9;

  result = CFDictionaryContainsKey(a1, a2);
  if ((_DWORD)result)
  {
    Value = CFDictionaryGetValue(a1, a2);
    if (Value && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID()))
    {
      *a3 = v8;
      return 1;
    }
    else
    {
      result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_100052620();
        return 0;
      }
    }
  }
  return result;
}

CFNumberRef sub_100034274(__CFDictionary *a1, void *key, CFNumberType a3, const void *a4)
{
  int v8;
  CFNumberRef result;
  CFNumberRef v10;

  if (a1 && key && (v8 = CFDictionaryContainsKey(a1, key), a4) && v8)
  {
    result = CFNumberCreate(kCFAllocatorDefault, a3, a4);
    if (result)
    {
      v10 = result;
      CFDictionaryReplaceValue(a1, key, result);
      CFRelease(v10);
      return (CFNumberRef)1;
    }
  }
  else
  {
    result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100052680();
      return 0;
    }
  }
  return result;
}

CFStringRef sub_10003432C(int a1)
{
  uint64_t i;
  char cStr[5];

  for (i = 3; i != -1; --i)
  {
    cStr[i] = a1;
    a1 >>= 8;
  }
  cStr[4] = 0;
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

uint64_t sub_100034380(io_registry_entry_t a1, const __CFString *a2, void *a3, id a4)
{
  uint64_t result;
  void *v7;
  NSObject *v8;

  result = (uint64_t)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (result)
  {
    v7 = (void *)result;
    if (objc_msgSend((id)result, "length") == a4)
    {
      memcpy(a3, objc_msgSend(v7, "bytes"), (size_t)a4);
      CFRelease(v7);
      return 1;
    }
    else
    {
      v8 = qword_1000A28A0;
      result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_1000528C0(v7, (uint64_t)a4, v8);
        return 0;
      }
    }
  }
  return result;
}

void sub_10003442C()
{
  io_connect_t v0;
  io_connect_t v1;

  v0 = IOPMFindPowerManagement(kIOMainPortDefault);
  if (v0)
  {
    v1 = v0;
    if (IOPMSleepSystem(v0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100052994();
    }
    IOServiceClose(v1);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100052968();
  }
}

void sub_1000344C0(const void *a1, const __CFString *a2, const __CFString *a3, CFAbsoluteTime a4)
{
  const __CFDate *v7;
  const __CFDate *v8;

  v7 = CFDateCreate(0, a4);
  if (v7)
  {
    v8 = v7;
    if (IOPMSchedulePowerEvent(v7, a2, a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000529EC();
      if (!a1)
        goto LABEL_6;
    }
    else if (!a1)
    {
LABEL_6:
      CFRelease(v8);
      return;
    }
    CFRelease(a1);
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_1000529C0();
}

void sub_100034578(int a1, int a2, IOHIDServiceClientRef service)
{
  const __CFNumber *RegistryID;
  const __CFNumber *v5;
  CFTypeID v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeID v9;
  NSObject *v10;
  uint64_t valuePtr;

  RegistryID = (const __CFNumber *)IOHIDServiceClientGetRegistryID(service);
  valuePtr = 0;
  if (RegistryID)
  {
    v5 = RegistryID;
    v6 = CFGetTypeID(RegistryID);
    if (v6 == CFNumberGetTypeID())
      CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
  }
  v7 = (const __CFString *)IOHIDServiceClientCopyProperty(service, CFSTR("Product"));
  v8 = v7;
  if (!v7 || (v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100052AD0();
      if (!v8)
        goto LABEL_9;
    }
    else if (!v8)
    {
LABEL_9:
      v8 = CFSTR("unknown Sensor");
      goto LABEL_10;
    }
    CFRelease(v8);
    goto LABEL_9;
  }
LABEL_10:
  v10 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100052A44(v8, (uint64_t)&valuePtr, v10);
  CFRelease(v8);
}

void sub_10003467C()
{
  NSObject *v0;
  uint8_t v1[16];

  if (!dword_1000A23A4)
  {
    dword_1000A23A4 = sub_1000340B8("AppleC26Charger", 0, 0);
    if (!dword_1000A23A4)
    {
      if (byte_1000A2480)
      {
        v0 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v1 = 0;
          _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> initC26Service: Failed to Match AppleC26Charger", v1, 2u);
        }
      }
    }
  }
}

uint64_t sub_10003471C()
{
  const __CFNumber *CFProperty;
  const __CFNumber *v1;
  uint64_t result;
  unsigned int valuePtr;

  valuePtr = 0;
  sub_100008E74();
  if (dword_1000A23A0)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(dword_1000A23A0, CFSTR("Temperature"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v1 = CFProperty;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      CFRelease(v1);
      return valuePtr;
    }
    result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100052B28();
      return 0;
    }
  }
  else
  {
    result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100052AFC();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000347E0(uint64_t result)
{
  dword_10009A270 = result;
  return result;
}

void sub_1000347EC()
{
  dword_10009A270 = -1;
}

uint64_t sub_1000347FC()
{
  CFTypeRef CFProperty;
  const void *v1;
  const __CFNumber *v2;
  const __CFNumber *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t valuePtr;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  valuePtr = 0;
  sub_100008E74();
  if (!dword_1000A23A0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052AFC();
    return 0;
  }
  CFProperty = IORegistryEntryCreateCFProperty(dword_1000A23A0, CFSTR("AppleRawCurrentCapacity"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052B54();
    return 0;
  }
  v1 = CFProperty;
  v2 = (const __CFNumber *)IORegistryEntryCreateCFProperty(dword_1000A23A0, CFSTR("AppleRawMaxCapacity"), kCFAllocatorDefault, 0);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052B80();
    CFRelease(v1);
    return 0;
  }
  v3 = v2;
  CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, (char *)&valuePtr + 4);
  CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
  v4 = valuePtr;
  if ((int)valuePtr < 1)
    v5 = 0;
  else
    v5 = (int)((double)SHIDWORD(valuePtr) * 100.0 / (double)(int)valuePtr + 0.5);
  if (dword_10009A274 == -1)
    v6 = v5;
  else
    v6 = dword_10009A274;
  if (byte_1000A2480)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v11 = HIDWORD(valuePtr);
      v12 = 1024;
      v13 = v4;
      v14 = 1024;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> raw current %d, raw max %d ==> raw SOC %d", buf, 0x14u);
    }
  }
  CFRelease(v1);
  CFRelease(v3);
  return v6;
}

void sub_100034A34(int a1)
{
  NSObject *v2;
  _DWORD v3[2];

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overiding chemical state of charge to %d\n", (uint8_t *)v3, 8u);
  }
}

uint64_t sub_100034AD8(uint64_t result)
{
  dword_10009A274 = result;
  return result;
}

void sub_100034AE4()
{
  dword_10009A274 = -1;
}

void sub_100034AF4(uint64_t a1, int a2)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;

  v3 = -[HidSensors getSensorIndexFrom4CC:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensorIndexFrom4CC:", a1);
  if (v3 <= 0x3F)
  {
    v4 = v3;
    byte_1000A2490 = 1;
    *((_DWORD *)&qword_1000A29AC + v3) = a2;
    v5 = qword_1000A2AB0 | (1 << v3);
    qword_1000A2AB0 = v5;
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109632;
      v7[1] = v4;
      v8 = 1024;
      v9 = a2;
      v10 = 2048;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx", (uint8_t *)v7, 0x18u);
    }
  }
}

void sub_100034C0C()
{
  qword_1000A2AB0 = 0;
  byte_1000A2490 = 0;
}

CFTypeRef sub_100034C28()
{
  CFTypeRef result;

  sub_100008E74();
  if (!dword_1000A23A0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052AFC();
    return 0;
  }
  result = IORegistryEntryCreateCFProperty(dword_1000A23A0, CFSTR("BatteryData"), kCFAllocatorDefault, 0);
  if (!result)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052BAC();
    return 0;
  }
  return result;
}

uint64_t sub_100034CC8(const void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFNumber *Value;
  uint64_t result;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int valuePtr;

  valuePtr = 0;
  if (!a1)
  {
    result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    sub_100052BD8();
    return 0;
  }
  v2 = (const __CFDictionary *)sub_100034C28();
  if (!v2)
  {
    v6 = qword_1000A28A0;
    result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    sub_100052C04(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  v3 = v2;
  Value = (const __CFNumber *)CFDictionaryGetValue(v2, a1);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100052C74();
  }
  CFRelease(v3);
  return valuePtr;
}

uint64_t sub_100034DAC(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  id v6;
  __int16 v7;
  int v8;

  v2 = sub_100034CC8(a1);
  if (byte_1000A2480)
  {
    v3 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = objc_msgSend(a1, "UTF8String");
      v7 = 1024;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> %s %d", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2;
}

uint64_t sub_100034E84()
{
  uint64_t result;

  result = sub_100034DAC(CFSTR("AlgoChemID"));
  if (!(_DWORD)result)
    return sub_100034DAC(CFSTR("ChemID"));
  return result;
}

uint64_t sub_100034EB4()
{
  uint64_t result;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFArray *Value;
  CFTypeID TypeID;
  const __CFNumber *ValueAtIndex;
  CFTypeID v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int valuePtr;
  uint8_t buf[4];
  unsigned int v18;

  valuePtr = 0;
  result = dword_10009A278;
  if (dword_10009A278 == -1)
  {
    v1 = (const __CFDictionary *)sub_100034C28();
    if (v1)
    {
      v2 = v1;
      Value = (const __CFArray *)CFDictionaryGetValue(v1, CFSTR("WeightedRa"));
      TypeID = CFArrayGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, 0);
        v6 = CFNumberGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v6)
        {
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          if (byte_1000A2480)
          {
            v7 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v18 = valuePtr;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Weighted Ra %d", buf, 8u);
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100052D70();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100052D44();
      }
      CFRelease(v2);
      return valuePtr;
    }
    else
    {
      v8 = qword_1000A28A0;
      result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_100052CD4(v8, v9, v10, v11, v12, v13, v14, v15);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100035080()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  CFTypeID TypeID;
  const __CFData *ValueAtIndex;
  const __CFData *v5;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v8;
  signed int v9;
  unsigned int v10;
  const __CFDictionary *v11;
  const __CFNumber *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int valuePtr;

  valuePtr = -1;
  v0 = (const __CFDictionary *)sub_100034C28();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, CFSTR("RaTableRaw"));
    TypeID = CFArrayGetTypeID();
    if (!Value || CFGetTypeID(Value) != TypeID)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100052E0C();
      goto LABEL_18;
    }
    ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)Value, 0);
    if (ValueAtIndex)
    {
      v5 = ValueAtIndex;
      Length = CFDataGetLength(ValueAtIndex);
      if ((_DWORD)Length != 32)
      {
        v22 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052E90(Length, v22, v23, v24, v25, v26, v27, v28);
        goto LABEL_18;
      }
      BytePtr = CFDataGetBytePtr(v5);
      v8 = 0;
      v9 = -1;
      do
      {
        v10 = *(unsigned __int16 *)&BytePtr[v8];
        if (v9 < (int)(bswap32(v10) >> 16))
        {
          v9 = __rev16(v10);
          valuePtr = v9;
        }
        v8 += 2;
      }
      while ((_DWORD)v8 != 18);
    }
    else
    {
      v11 = (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("LifetimeData"));
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052E38();
        goto LABEL_18;
      }
      v12 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("MaximumRa0-8"));
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052E64();
        goto LABEL_18;
      }
      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
    }
    if (dword_10009A27C != -1)
      valuePtr = dword_10009A27C;
LABEL_18:
    CFRelease(v1);
    return valuePtr;
  }
  v14 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100052D9C(v14, v15, v16, v17, v18, v19, v20, v21);
  return 0xFFFFFFFFLL;
}

void sub_100035268(int a1)
{
  NSObject *v2;
  _DWORD v3[2];

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overriding Ra to %d", (uint8_t *)v3, 8u);
  }
  dword_10009A27C = a1;
}

void sub_100035310()
{
  dword_10009A27C = -1;
}

void sub_100035320(int a1)
{
  NSObject *v2;
  _DWORD v3[2];

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overriding Weighted Ra to %d", (uint8_t *)v3, 8u);
  }
  dword_10009A278 = a1;
}

void sub_1000353C8()
{
  dword_10009A278 = -1;
}

uint64_t sub_1000353D8()
{
  io_registry_entry_t v0;
  CFMutableDictionaryRef v1;
  __CFDictionary *v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  uint64_t result;
  unsigned int v8;
  int valuePtr;

  v8 = 0;
  v0 = dword_1000A23CC;
  if (!dword_1000A23CC)
  {
    v1 = IOServiceMatching("IOService");
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      qword_1000A23D0 = (uint64_t)CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&off_10009A290, (const void **)&qword_1000A23D0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v3)
      {
        v4 = v3;
        CFDictionarySetValue(v2, CFSTR("IOPropertyMatch"), v3);
        CFRelease(v4);
        dword_1000A23CC = IOServiceGetMatchingService(kIOMainPortDefault, v2);
      }
      else
      {
        CFRelease(v2);
      }
    }
    v0 = dword_1000A23CC;
    if (!dword_1000A23CC)
    {
      result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      sub_100052EF4();
      return 0;
    }
  }
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v0, CFSTR("IOPMUBootUPOCounter"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    sub_100052F20();
    return 0;
  }
  v6 = CFProperty;
  CFNumberGetValue(CFProperty, kCFNumberIntType, &v8);
  if (dword_10009A280 != -1)
    v8 = dword_10009A280;
  CFRelease(v6);
  return v8;
}

uint64_t sub_100035560(uint64_t result)
{
  dword_10009A280 = result;
  return result;
}

uint64_t sub_10003556C()
{
  return byte_1000A23A8;
}

uint64_t sub_100035578(uint64_t result)
{
  byte_1000A23A8 = result;
  return result;
}

uint64_t sub_100035584(uint64_t result)
{
  byte_10009A284 = result;
  return result;
}

uint64_t sub_100035590()
{
  return byte_10009A284;
}

uint64_t sub_10003559C()
{
  return byte_1000A23A9;
}

uint64_t sub_1000355A8(uint64_t result)
{
  byte_1000A23A9 = result;
  return result;
}

uint64_t sub_1000355B4(io_registry_entry_t a1)
{
  if (dword_10009A288 != -1)
    return dword_10009A288 != 0;
  if (a1)
    return sub_100003320(a1, CFSTR("ExternalConnected"));
  return 1;
}

uint64_t sub_1000355E8(uint64_t result)
{
  dword_10009A288 = result;
  return result;
}

void sub_1000355F4(uint64_t a1, const __CFArray *cf)
{
  CFTypeID v4;
  CFIndex v5;
  const void *ValueAtIndex;
  CFTypeID v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char valuePtr;

  if (a1 && cf && (v4 = CFGetTypeID(cf), v4 == CFArrayGetTypeID()))
  {
    if (CFArrayGetCount(cf) >= 1)
    {
      v5 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(cf, v5);
        v7 = CFGetTypeID(ValueAtIndex);
        if (v7 == CFNumberGetTypeID())
        {
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberCharType, &valuePtr);
          *(_BYTE *)(a1 + v5) = valuePtr;
        }
        ++v5;
      }
      while (CFArrayGetCount(cf) > v5);
    }
  }
  else
  {
    v8 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052F4C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

BOOL sub_1000356E0()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  _BOOL8 v3;

  v0 = (const __CFBoolean *)MGCopyAnswer(CFSTR("CarrierInstallCapability"), 0);
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFGetTypeID(v0);
  v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

uint64_t sub_100035750()
{
  uint64_t v0;

  v0 = MGGetSInt32Answer(CFSTR("main-screen-class"), 0xFFFFFFFFLL);
  if ((_DWORD)v0 == -1 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100052FBC();
  return v0;
}

BOOL sub_1000357B0()
{
  uint64_t v0;
  char v1;
  NSObject *v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_100035750();
  v1 = v0 - 12;
  if ((v0 - 12) < 0x18 && ((0xC2C033u >> v1) & 1) != 0)
    return (0x7DBFDEu >> v1) & 1;
  v2 = qword_1000A28A0;
  result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100052FE8(v0, v2, v4, v5, v6, v7, v8, v9);
    return 0;
  }
  return result;
}

BOOL sub_10003582C(char *a1, const char *a2, size_t a3)
{
  size_t v6;
  size_t v7;

  v6 = strlen(a1);
  v7 = v6 + strlen(a2) + 1;
  if (v7 > a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005304C();
  }
  else
  {
    strcat(a1, a2);
  }
  return v7 <= a3;
}

uint64_t sub_1000358C8()
{
  return MGGetSInt32Answer(CFSTR("AtmPEO/j+Pdr8+WKxv4Aaw"), 0);
}

uint64_t sub_1000358D8(char *name, int *out_token, NSObject *a3, void *a4)
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[6];

  if (a3 && name && out_token && a4)
  {
    if (notify_register_check(name, out_token))
    {
      v17 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100053130(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      if (!notify_register_dispatch(name, out_token, a3, a4))
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100035A08;
        v33[3] = &unk_10007E098;
        v33[4] = a4;
        v33[5] = out_token;
        dispatch_async(a3, v33);
        return 0;
      }
      v25 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000530C0(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000531A0(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  return -1;
}

uint64_t sub_100035A08(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), **(unsigned int **)(a1 + 40));
}

uint64_t sub_100035A1C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  BOOL v3;

  if ((a2 & 0x8000000000000000) == 0 || (v2 = 0x8000000000000000, (uint64_t)(0x8000000000000000 - a2) <= a1))
  {
    v3 = (a2 ^ 0x7FFFFFFFFFFFFFFFLL) >= a1 || a2 <= 0;
    v2 = a2 + a1;
    if (!v3)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

CFDictionaryRef sub_100035A50(int a1, int a2)
{
  CFDictionaryRef v2;
  int v4;
  int valuePtr;
  void *values;
  CFTypeRef cf;
  void *keys[2];

  v4 = a2;
  valuePtr = a1;
  *(_OWORD *)keys = *(_OWORD *)&off_10007E0B8;
  values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v4);
  v2 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFRelease(cf);
  return v2;
}

uint64_t sub_100035B20(__IOHIDServiceClient *a1, const __CFString *a2)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  CFTypeID v4;
  unsigned int valuePtr;

  valuePtr = 0;
  v2 = (const __CFNumber *)IOHIDServiceClientCopyProperty(a1, a2);
  v3 = v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 == CFNumberGetTypeID())
    {
      if (!CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr)
        && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100053278();
      }
      goto LABEL_8;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100053210();
    if (v3)
      goto LABEL_8;
  }
  else if (v3)
  {
LABEL_8:
    CFRelease(v3);
    return valuePtr;
  }
  return 0;
}

void sub_100035C04(uint64_t a1)
{
  NSURL *v1;
  NSObject *v2;
  uint64_t v3;

  v1 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a1);
  v3 = 0;
  if (!-[NSURL setResourceValue:forKey:error:](v1, "setResourceValue:forKey:error:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSURLIsExcludedFromBackupKey, &v3))
  {
    v2 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000532E0(v1, (uint64_t)&v3, v2);
  }
}

id sub_100035C9C()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  CFMutableDictionaryRef v2;
  id v3;
  CFMutableDictionaryRef properties;

  v0 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
  v2 = properties;
  v3 = objc_msgSend(-[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("BatteryShutdownReason")), "copy");

  return v3;
}

void sub_100035D18(unsigned int *a1, unsigned int *a2)
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  id v8;

  v8 = sub_100035C9C();
  v4 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uiSOC"));
  v5 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("temperature"));
  if (a1)
  {
    if (v4)
      v6 = objc_msgSend(v4, "intValue");
    else
      v6 = -1;
    *a1 = v6;
  }
  if (a2)
  {
    if (v5)
      v7 = objc_msgSend(v5, "intValue");
    else
      v7 = -1;
    *a2 = v7;
  }

}

void sub_100035DB0(int a1)
{
  CFNumberRef v1;
  int valuePtr;

  valuePtr = a1;
  if (qword_1000A23B0 != -1)
    dispatch_once(&qword_1000A23B0, &stru_10007E0C8);
  v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (dword_1000A23B8
    && IORegistryEntrySetCFProperty(dword_1000A23B8, CFSTR("UseBaselineSystemCapability"), v1)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100053368();
    if (!v1)
      return;
  }
  else if (!v1)
  {
    return;
  }
  CFRelease(v1);
}

void sub_100035E70(id a1)
{
  dword_1000A23B8 = sub_1000340B8("ApplePPM", 0, 0);
}

uint64_t sub_100035E9C()
{
  unsigned int v1;

  v1 = 0;
  sub_10003467C();
  if ((sub_100007070(dword_1000A23A4, CFSTR("ThermalProfile"), &v1, 1) & 1) == 0
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100053394();
  }
  return v1;
}

float sub_100035F10()
{
  float result;

  -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 0, CFSTR("zETN"), 0);
  -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 1, CFSTR("zETN"), 1);
  *(float *)dword_1000A2BC0 = (float)(int)MGGetSInt32Answer(CFSTR("AtmPEO/j+Pdr8+WKxv4Aaw"), 0);
  result = (float)sub_1000357B0();
  *(float *)&dword_1000A2BC4 = result;
  return result;
}

uint64_t sub_100035F90()
{
  uint64_t v0;
  const void *v1;
  const void *v2;
  CFTypeRef v3;
  uint64_t Samples;
  const void *v5;
  CFTypeRef cf;

  if ((byte_1000A23BC & 1) != 0)
    return dword_1000A23C0;
  cf = 0;
  v0 = IOReportCopyChannelsInGroup(CFSTR("Battery"), 0, 0, 0);
  if (v0)
  {
    v1 = (const void *)v0;
    v2 = (const void *)IOReportCreateSubscription(0, v0, &cf, 0, 0);
    CFRelease(v1);
    v3 = cf;
    if (cf && v2)
    {
      Samples = IOReportCreateSamples(v2, cf, 0);
      IOReportIterate(Samples, &stru_10007E108);
    }
    else
    {
      Samples = 0;
      v5 = 0;
      if (!v2)
      {
LABEL_10:
        if (v3)
          CFRelease(v3);
        if (v5)
          CFRelease(v5);
        return dword_1000A23C0;
      }
    }
    CFRelease(v2);
    v3 = cf;
    v5 = (const void *)Samples;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_1000533C0();
  return dword_1000A23C0;
}

int sub_10003609C(id a1, __CFDictionary *a2)
{
  void *ChannelName;
  int result;

  ChannelName = (void *)IOReportChannelGetChannelName(a2);
  dword_1000A23C0 = IOReportSimpleGetIntegerValue(a2, 0);
  result = objc_msgSend(ChannelName, "isEqualToString:", CFSTR("BatteryIDChanged"));
  if (result)
  {
    byte_1000A23BC = 1;
    return dword_1000A23C0;
  }
  return result;
}

void sub_1000360FC()
{
  __IOHIDEventSystemClient *v0;
  NSObject *v1;
  uint64_t v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFTypeID v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  NSObject *v10;
  const __CFArray *theArray;
  __IOHIDEventSystemClient *v12;
  uint8_t buf[4];
  const void *v14;

  v0 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
  theArray = IOHIDEventSystemClientCopyServices(v0);
  if (theArray && CFArrayGetCount(theArray))
  {
    v1 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> IOHID Event System State", buf, 2u);
    }
    v2 = 0;
    v12 = v0;
    do
    {
      v3 = (const __CFArray *)IOHIDEventSystemClientCopyProperty(v0, off_10007E128[v2]);
      if (v3)
      {
        v4 = v3;
        v5 = CFGetTypeID(v3);
        if (v5 == CFArrayGetTypeID())
        {
          Count = CFArrayGetCount(v4);
          if (Count >= 1)
          {
            v7 = Count;
            for (i = 0; i != v7; ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
              v10 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v14 = ValueAtIndex;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> dict: %@", buf, 0xCu);
              }
            }
          }
          CFRelease(v4);
          v0 = v12;
        }
      }
      ++v2;
    }
    while (v2 != 3);
  }
  if (v0)
    CFRelease(v0);
  if (theArray)
    CFRelease(theArray);
}

uint64_t sub_1000362D4()
{
  return (-[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("GGRC")) >> 24);
}

uint64_t sub_100036300()
{
  uint64_t result;
  CFMutableDictionaryRef v1;
  CFMutableDictionaryRef v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  void *v5;
  void *v6;
  CFMutableDictionaryRef properties;

  if ((byte_1000A23C4 & 1) != 0)
    return dword_1000A23C8;
  v1 = IOServiceMatching("IOPMPowerSource");
  v2 = IOServiceMatching("AppleAuthCPRelay");
  v3 = v2;
  if (!v2 || !v1)
  {
    if (v2)
      CFRelease(v2);
    if (v1)
      CFRelease(v1);
LABEL_16:
    result = 0xFFFFFFFFLL;
    dword_1000A23C8 = -1;
    return result;
  }
  CFDictionarySetValue(v2, CFSTR("IOParentMatch"), v1);
  CFRelease(v1);
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService)
    return dword_1000A23C8;
  properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
  v5 = (id)CFMakeCollectable(properties);
  if (!v5)
    goto LABEL_16;
  v6 = v5;
  if (!objc_msgSend(v5, "objectForKey:", CFSTR("isTrustedForUI")))
    goto LABEL_16;
  if (objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("isTrustedForUI")), "BOOLValue"))
    result = 1;
  else
    result = 2;
  dword_1000A23C8 = result;
  byte_1000A23C4 = 1;
  return result;
}

void sub_100036428(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

NSDictionary *sub_1000368A8(uint64_t a1)
{
  _QWORD v3[21];
  _QWORD v4[21];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev3");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("PMU_Tdev5");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("PMU2_Tdev1");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("PMU2_Tdev2");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("PMU2_Tdev3");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSBM");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSFD");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSBQ");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Die_Temp_MaxAverage");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Die_Temp_MaxMax");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("maxLI_PackagePower");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("maxLI_Speaker");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("BackLight_maxLI");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("Solar_Context");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 112));
  v3[17] = CFSTR("Pressure_Level");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[18] = CFSTR("Gas_Gauge_avg_Power");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v3[19] = CFSTR("Charger_State");
  v4[19] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v3[20] = CFSTR("Package_Power");
  v4[20] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 21);
}

_UNKNOWN **sub_100037148(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_100085858;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = result;
  return result;
}

_UNKNOWN **sub_100037204(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_100085870;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = result;
  return result;
}

NSDictionary *sub_100037A50(uint64_t a1)
{
  NSNumber *v2;
  uint64_t v3;
  _QWORD v5[20];
  _QWORD v6[20];

  v5[0] = CFSTR("TG0B");
  v6[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5[1] = CFSTR("TG0V");
  v6[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v5[2] = CFSTR("PMU_Tdev1");
  v6[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5[3] = CFSTR("PMU_Tdev2");
  v6[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v5[4] = CFSTR("TSRR");
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5[5] = CFSTR("TSBR");
  v6[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v5[6] = CFSTR("TSFL");
  v6[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v5[7] = CFSTR("TSRM");
  v6[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v5[8] = CFSTR("TSFC");
  v6[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v5[9] = CFSTR("TSFD");
  v6[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v5[10] = CFSTR("mic2");
  v6[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5[11] = CFSTR("TSBQ");
  v6[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v5[12] = CFSTR("TSFG");
  v6[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v5[13] = CFSTR("Die_Temp_MaxAverage");
  v6[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v5[14] = CFSTR("Die_Temp_MaxMax");
  v6[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v5[15] = CFSTR("Package_Power");
  v6[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 100));
  v5[16] = CFSTR("Charger_State");
  v6[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104));
  v5[17] = CFSTR("Solar_Context");
  v6[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 112));
  v5[18] = CFSTR("Pressure_Level");
  v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 108));
  v5[19] = CFSTR("Device_Activity");
  v3 = *(_QWORD *)(a1 + 32);
  v6[18] = v2;
  v6[19] = v3;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 20);
}

NSDictionary *sub_100038D5C(uint64_t a1)
{
  _QWORD v3[19];
  _QWORD v4[19];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TG0V");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev1");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("PMU_Tdev2");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBR");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBE");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSRR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSRM");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFL");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSFC");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFD");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("TSBQ");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Die_Temp_MaxAverage");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Die_Temp_MaxMax");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Package_Power");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88));
  v3[15] = CFSTR("Charger_State");
  v4[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 92));
  v3[16] = CFSTR("Solar_Context");
  v4[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 100));
  v3[17] = CFSTR("Pressure_Level");
  v4[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96));
  v3[18] = CFSTR("Accessory");
  v4[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 101));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 19);
}

void sub_100039318(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: AVAudioSession reset", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000393C4;
    block[3] = &unk_10007D248;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t sub_1000393C4(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 24) = -1;
  return result;
}

id sub_100039430(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInternal");
}

void sub_10003A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

id sub_10003A3DC(uint64_t a1, int a2)
{
  id Weak;
  id result;
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result)
    return objc_msgSend(Weak, "handleRearCameraPowerStateNotification:", state64);
  return result;
}

id sub_10003A42C(uint64_t a1, int a2)
{
  id Weak;
  id result;
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result)
    return objc_msgSend(Weak, "handleFrontCameraPowerStateNotification:", state64);
  return result;
}

void sub_10003AC34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

NSDictionary *sub_10003B0E4(uint64_t a1)
{
  _QWORD v3[15];
  _QWORD v4[15];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBQ");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBM");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TP4d");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("batteryVT");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("maxLI_CPU");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("maxLI_GPU");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Gas_Gauge_avg_Power");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Charger_State");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Solar_Context");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 88));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 15);
}

NSDictionary *sub_10003B4F8(uint64_t a1)
{
  _QWORD v3[13];
  _QWORD v4[13];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBR");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Charger_State");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Solar_Context");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 80));
  v3[12] = CFSTR("Pressure_Level");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
}

NSDictionary *sub_10003DB8C(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("Die_Temp_MaxAverage");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("Die_Temp_MaxMax");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSFC");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TS0A");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFD");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSRM");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFL");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  v3[13] = CFSTR("Pressure_Level");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

NSDictionary *sub_10003DF78(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TSBM");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFG");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TS1B");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TSBR");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Package_Power");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Gas_Gauge_avg_Power");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Charger_State");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Solar_Context");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

NSDictionary *sub_10003E9AC(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TS0A");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBH");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TP6D");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBR");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("Die_Temp_MaxAverage");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("Die_Temp_MaxMax");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_CPU");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("maxLI_GPU");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("maxLI_RR");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Gas_Gauge_avg_Power");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Charger_State");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Solar_Context");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

void sub_10003F77C(uint64_t a1)
{
  id v2;
  void *v3;

  v3 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "copyLTSStateFromPMP:", &v3);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "saveLTSStateToNand:dataSize:", v3, v2);
    free(v3);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000542D4();
  }
}

void sub_10003F7F8(uint64_t a1, _xpc_activity_s *a2)
{
  void *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = objc_autoreleasePoolPush();
  state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Activity Run. Updating NVRAM", v8, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "updateNvramLTSState");
  }
  else if (!state)
  {
    if (byte_1000A2480)
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Activity checking in", buf, 2u);
      }
    }
  }
  objc_autoreleasePoolPop(v4);
}

id sub_100043140(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updatePersistedState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updatePersistedState");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updatePersistedState");
}

uint64_t sub_100043E14(uint64_t a1, uint64_t a2)
{
  int Count;
  __int128 v5;
  int v6;
  uint64_t v7;
  double DutyCycle;
  double v9;
  const __CFString *NameForIndex;
  __CFString *v11;
  NSObject *v12;
  int v13;
  unsigned int v14;
  float v15;
  __int128 v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  double v21;

  Count = IOReportStateGetCount(a2);
  v6 = Count;
  if (Count < 17)
  {
    if (Count < 1)
      return 0;
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100055360();
  }
  v7 = 0;
  *(_QWORD *)&v5 = 138412546;
  v17 = v5;
  do
  {
    DutyCycle = IOReportStateGetDutyCycle(a2, v7);
    if (DutyCycle > 0.0)
    {
      v9 = DutyCycle;
      NameForIndex = (const __CFString *)IOReportStateGetNameForIndex(a2, v7);
      if (NameForIndex)
      {
        v11 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0) == 86)
        {
          if (byte_1000A2480)
          {
            v12 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v19 = v11;
              v20 = 2048;
              v21 = v9;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: %@, fraction %f", buf, 0x16u);
            }
          }
          v13 = objc_msgSend(-[__CFString substringFromIndex:](v11, "substringFromIndex:", 1, v17), "intValue");
          v14 = v13 & ~(v13 >> 31);
          if (v14 >= 0xF)
            v14 = 15;
          v15 = v9;
          *(float *)(*(_QWORD *)(a1 + 32) + 4 * v14 + 136) = v15;
        }
      }
    }
    v7 = (v7 + 1);
  }
  while (v6 != (_DWORD)v7);
  return 0;
}

uint64_t sub_100044084(uint64_t a1, uint64_t a2)
{
  int Count;
  __int128 v5;
  int v6;
  uint64_t v7;
  double DutyCycle;
  double v9;
  const __CFString *NameForIndex;
  __CFString *v11;
  NSObject *v12;
  int v13;
  unsigned int v14;
  float v15;
  __int128 v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  double v21;

  Count = IOReportStateGetCount(a2);
  v6 = Count;
  if (Count < 17)
  {
    if (Count < 1)
      return 0;
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000553C4();
  }
  v7 = 0;
  *(_QWORD *)&v5 = 138412546;
  v17 = v5;
  do
  {
    DutyCycle = IOReportStateGetDutyCycle(a2, v7);
    if (DutyCycle > 0.0)
    {
      v9 = DutyCycle;
      NameForIndex = (const __CFString *)IOReportStateGetNameForIndex(a2, v7);
      if (NameForIndex)
      {
        v11 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0) == 80)
        {
          if (byte_1000A2480)
          {
            v12 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v19 = v11;
              v20 = 2048;
              v21 = v9;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: %@, fraction %f", buf, 0x16u);
            }
          }
          v13 = objc_msgSend(-[__CFString substringFromIndex:](v11, "substringFromIndex:", 1, v17), "intValue");
          v14 = v13 & ~(v13 >> 31);
          if (v14 >= 0xF)
            v14 = 15;
          v15 = v9;
          *(float *)(*(_QWORD *)(a1 + 32) + 4 * v14 + 296) = v15;
        }
      }
    }
    v7 = (v7 + 1);
  }
  while (v6 != (_DWORD)v7);
  return 0;
}

NSDictionary *sub_100044900(uint64_t a1)
{
  _QWORD v3[7];
  _QWORD v4[7];

  v3[0] = CFSTR("ECore_Die_Temp_Target");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dieTempTarget"));
  v3[1] = CFSTR("PCore_Die_Temp_Target");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dieTempTarget"));
  v3[2] = CFSTR("GCore_Die_Temp_Target");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dieTempTarget"));
  v3[3] = CFSTR("ECore_Die_Temp_Delta");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[4] = CFSTR("PCore_Die_Temp_Delta");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[5] = CFSTR("GCore_Die_Temp_Delta");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[6] = CFSTR("Fast_Die_Engaged");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 52));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
}

void sub_100044AF4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100044B08(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100044B44(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

_UNKNOWN **sub_100045D10(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_1000858E8;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = result;
  return result;
}

_UNKNOWN **sub_100045DCC(uint64_t a1)
{
  _UNKNOWN **result;

  result = &off_100085900;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = result;
  return result;
}

NSDictionary *sub_1000462E0(uint64_t a1)
{
  _QWORD v3[14];
  _QWORD v4[14];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("PMU_Tdev1");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("PMU_Tdev2");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("Die_Temp_MaxAverage");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("Die_Temp_MaxMax");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSFC");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TSBR");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TS0A");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("TSFD");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("TSRM");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("TSFG");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Charger_State");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Solar_Context");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 84));
  v3[13] = CFSTR("Pressure_Level");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
}

id sub_1000483DC(uint64_t a1)
{
  id result;

  result = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = result;
  return result;
}

void sub_100049010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10004902C(uint64_t a1, int a2)
{
  id Weak;
  uint64_t state64;

  Weak = objc_loadWeak((id *)(a1 + 32));
  state64 = 0;
  notify_get_state(a2, &state64);
  return objc_msgSend(Weak, "setIsBackLightOn:", state64 != 0);
}

void sub_100049128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100049144(uint64_t a1)
{
  id Weak;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  uint64_t v5;
  CFTypeID v6;
  NSObject *v7;
  int valuePtr;
  uint8_t buf[4];
  int v10;

  Weak = objc_loadWeak((id *)(a1 + 32));
  valuePtr = 0;
  v2 = IOPSCopyExternalPowerAdapterDetails();
  if (!v2)
  {
    v5 = 0;
    goto LABEL_10;
  }
  v3 = v2;
  if (!CFDictionaryContainsKey(v2, CFSTR("FamilyCode")))
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  Value = CFDictionaryGetValue(v3, CFSTR("FamilyCode"));
  v5 = (uint64_t)Value;
  if (Value)
  {
    v6 = CFGetTypeID(Value);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr);
      if ((valuePtr + 536723455) > 7)
        v5 = 10;
      else
        v5 = *((unsigned int *)&unk_100061ED0 + valuePtr + 536723455);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  CFRelease(v3);
LABEL_10:
  objc_msgSend(Weak, "setChargerState:", v5);
  v7 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Charger type is %d", buf, 8u);
  }
}

void sub_100049CBC(id a1)
{
  byte_1000A2434 = MGGetBoolAnswer(CFSTR("apple-internal-install"));
}

id sub_100049EF0(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  int v8;

  v2 = *(_DWORD *)(a1 + 44);
  v3 = (*(_DWORD *)(a1 + 40) + *(_DWORD *)(a1 + 48) * v2);
  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109376;
      v6[1] = v2;
      v7 = 1024;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> TSFD blend %d, %d", (uint8_t *)v6, 0xEu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "writeAllCornerTemperatures:", v3);
}

NSDictionary *sub_10004B6AC(uint64_t a1)
{
  _QWORD v3[12];
  _QWORD v4[12];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TP4H");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFD");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSFL");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBQ");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TSBM");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("batteryVT");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("TP5d");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("maxLI_PackagePower");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxAverage");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("Charger_State");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("Solar_Context");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 76));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
}

void sub_10004B868(id a1)
{
  qword_1000A2448 = objc_alloc_init(SensorDispatcherHelper);
}

void sub_10004BB7C(void *a1, io_iterator_t iterator)
{
  io_object_t v4;
  io_object_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    v4 = IOIteratorNext(iterator);
    if (v4)
    {
      v5 = v4;
      do
      {
        objc_msgSend(a1, "updateKeyboardState");
        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
  }
  else
  {
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055DB0(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

id sub_10004C1D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result;
  uint64_t IntegerValue;

  result = (id)IOHIDEventGetType(a4);
  if ((_DWORD)result == 3)
  {
    IntegerValue = IOHIDEventGetIntegerValue(a4, 196608);
    result = (id)IOHIDEventGetIntegerValue(a4, 196609);
    if (IntegerValue == 65289 && result == (id)17)
      return objc_msgSend(a1, "updateFolioState:", IOHIDEventGetIntegerValue(a4, 196610) == 1);
  }
  return result;
}

NSDictionary *sub_10004CBC8(uint64_t a1)
{
  _QWORD v3[15];
  _QWORD v4[15];

  v3[0] = CFSTR("TG0B");
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3[1] = CFSTR("TSFD");
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 36));
  v3[2] = CFSTR("TSFL");
  v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[3] = CFSTR("TSBQ");
  v4[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[4] = CFSTR("TSBM");
  v4[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3[5] = CFSTR("TP4d");
  v4[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v3[6] = CFSTR("TP5d");
  v4[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3[7] = CFSTR("batteryVT");
  v4[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3[8] = CFSTR("Die_Temp_MaxAverage");
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v3[9] = CFSTR("Die_Temp_MaxMax");
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v3[10] = CFSTR("maxLI_CPU");
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72));
  v3[11] = CFSTR("maxLI_GPU");
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 76));
  v3[12] = CFSTR("Gas_Gauge_avg_Power");
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v3[13] = CFSTR("Charger_State");
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 84));
  v3[14] = CFSTR("Solar_Context");
  v4[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 88));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 15);
}

void sub_10004E788(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Bad camera sensor index %d", (uint8_t *)v2, 8u);
}

void sub_10004E7FC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Empty 4CC list", v2);
  sub_100010EC0();
}

void sub_10004E82C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Incorrect type in 4CC list", v3);
}

void sub_10004E858()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Bad working dictionaries", v2);
  sub_100010EC0();
}

void sub_10004E888()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> callback queue NULL", v2);
  sub_100010EC0();
}

void sub_10004E8B8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Not a valid sensor record", v3);
}

void sub_10004E8E4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for filterParams", v3);
}

void sub_10004E910(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for matchName", v3);
}

void sub_10004E93C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for 4CC", v3);
}

void sub_10004E968()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Bad working dictionary", v2);
  sub_100010EC0();
}

void sub_10004E998(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "AppleVTempDispatcher";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> Cannot find %s service", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_10004EA0C(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  char *v5;

  v4 = 136315138;
  v5 = mach_error_string(a1);
  sub_100010EA4((void *)&_mh_execute_header, a2, v3, "<Error> Could not send temperature %s", (uint8_t *)&v4);
}

void sub_10004EA8C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  sub_100010EA4((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> %s: null service", a1);
}

void sub_10004EAD0(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  sub_100010EA4((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> %s: key not found", a1);
}

void sub_10004EB14(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[HidSensors temperatureForKey:]";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> %s: null service", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_10004EB88(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[HidSensors temperatureForKey:]";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> %s: null event", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_10004EBFC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[HidSensors temperatureForKey:]";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> %s: key not found", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_10004EC70(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> Bad sensor index: %ld", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_10004ECD8(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> sensor: %@, value = %d out of bounds", (uint8_t *)&v3, 0x12u);
  sub_100010ED4();
}

void sub_10004ED58()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> empty temperature sensor array", v2);
  sub_100010EC0();
}

void sub_10004ED88()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> empty filtered sensor set", v2);
  sub_100010EC0();
}

void sub_10004EDB8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Could not discover all sensors in HID", v2);
  sub_100010EC0();
}

void sub_10004EDE8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> no HID client", v2);
  sub_100010EC0();
}

void sub_10004EE18()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> bad HID dict", v2);
  sub_100010EC0();
}

void sub_10004EE48(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> no HID services (%d)", (uint8_t *)v1, 8u);
  sub_100010EC0();
}

void sub_10004EEC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> No implementation for getContextState", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004EEF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> No implementation for isContextTriggered", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004EF20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> No implementation for synchContext", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004EF50(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010EB0(a1, a2);
  sub_1000137C4((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find display params", v4);
}

void sub_10004EF78(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010EB0(a1, a2);
  sub_1000137C4((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find nit params", v4);
}

void sub_10004EFA0(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010EB0(a1, a2);
  sub_1000137C4((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find nit values", v4);
}

void sub_10004EFC8(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010EB0(a1, a2);
  sub_1000137C4((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find slider params", v4);
}

void sub_10004EFF0(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010EB0(a1, a2);
  sub_1000137C4((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find slider values", v4);
}

void sub_10004F018(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a2, a3, "<Error> brightness set %@ failed for Icon", a5, a6, a7, a8, 2u);
}

void sub_10004F080(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a2, a3, "<Error> brightness set %@ failed for Siri", a5, a6, a7, a8, 2u);
}

void sub_10004F0E8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100015C08();
  SCErrorString(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesCommitChanges() failed: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_10004F154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kSunlightState) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F180()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> no HID client", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F1AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No ALS service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F1D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No ALS Event", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F204()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalSunlightStateToken) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F230(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> no HID services (%d)", (uint8_t *)v1, 8u);
  sub_100010EC0();
}

void sub_10004F2A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationPressureLevelName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F2D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalPressureLevelToken) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F32C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F3B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kOSThermalNotificationPressureLevelName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F3DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F408(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> notify_register_check failed", buf, 2u);
}

void sub_10004F444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F470()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state MaxToken failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F49C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F4C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalStatusToken) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F54C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F5A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F5D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F5FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get AppleCLPC service.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F6AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> CLPC Output Length is less than minimum size of incoming structs.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F6D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Incorrect response ID from AppleCLPC", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F704()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get GPU channels", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F730()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Mismatch between CLPC header struct length and response length.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F75C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to call AppleCLPC getSeedingInfo user client method.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to connect to AppleCLPC service. This is likely due to this device running Legacy CLPC.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F7B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to GPU read sample", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10004F7E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: failed to create dispatch queue", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_10004F850(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> CPMS Helper: notify_register_check failed (peak pressure)", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004F880(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> detailMitigationArray has too many entries: %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004F8E4(int a1, NSObject *a2)
{
  char *v2;
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;

  v2 = &byte_10007D728[24 * a1];
  v3 = *v2;
  v4 = *((_QWORD *)v2 + 1);
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 1024;
  v7 = a1;
  v8 = 2080;
  v9 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Cannot add mitigations for supported clientID: %u of mitigation type: %u (%s)", (uint8_t *)v5, 0x18u);
  sub_100010ED4();
}

void sub_10004F984(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> CPMSHelper failed to send detailed mitigations. Error code: 0x%x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004F9E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001B430(__stack_chk_guard);
  sub_10001B43C();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Unable to determine max power for clientID:%s", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_10004FA58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001B430(__stack_chk_guard);
  sub_10001B43C();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Unable to determine min power for clientID:%s", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_10004FAC8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  sub_10001B430(__stack_chk_guard);
  sub_10001B43C();
  v3 = 134218242;
  v4 = v0;
  v5 = 2080;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "<Error> Client id: %llu is invalid for client name:%s", (uint8_t *)&v3, 0x16u);
  sub_100010ED4();
}

void sub_10004FB54(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unexpected return value 0x%08x\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004FBB8(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = 4;
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> called with unexpected number of arguments. Expected %d, received %d\n", (uint8_t *)v2, 0xEu);
  sub_100010ED4();
}

void sub_10004FC38()
{
  uint64_t v0;
  int v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  sub_10001B430(__stack_chk_guard);
  sub_10001B43C();
  v3 = 136315394;
  v4 = v0;
  v5 = 1024;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "<Error> Could not get CPMS client state for clientID %s. Error code 0x%x", (uint8_t *)&v3, 0x12u);
  sub_100010ED4();
}

void sub_10004FCC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> CPMSHelper: notify_post failed (peak pressure)", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004FCF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> CPMSHelper: notify_set_state failed (peak pressure)", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10004FD24(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Unable to set the refresh rate %x", (uint8_t *)v2, 8u);
}

void sub_10004FD98(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> sensor dispatcher indicating bad VT", v1, 2u);
}

void sub_10004FDD8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> CC: Failed to find pmu power source", v1, 2u);
}

void sub_10004FE18(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "-[LinkChargerCC updateCloakingState:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> %s: IORegistryEntrySetCFProperties(0x%08x)\n", (uint8_t *)&v2, 0x12u);
}

void sub_10004FEA0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Error creating WiFiManager client", v1, 2u);
}

void sub_10004FEE0(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Read a bad maxLI value from the WiFi Manager %d", (uint8_t *)v2, 8u);
}

void sub_10004FF54(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> getTGraphData: invalid key", v1, 2u);
}

void sub_10004FF94(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[TGraphSampler genTGraphData]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: could not create fieldValues array", (uint8_t *)&v1, 0xCu);
}

void sub_100050014(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Error in getting cpu statistics", v1, 2u);
}

void sub_100050054(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: data array size mismatch", (uint8_t *)&v1, 0xCu);
}

void sub_1000500D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "%s <Error> Super class init failed", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100050144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No fallback value found for mitigation threshold\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050170(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "%s <Error> Unable to register for mitigations state token.", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000501E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "%s <Error> Unable to register for mitigations disabled token.", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100050250(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = *a1;
  v3 = 136315394;
  v4 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
  v5 = 1024;
  v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s Mitigation State %d\n", (uint8_t *)&v3, 0x12u);
  sub_100010ED4();
}

void sub_1000502D8(uint64_t a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "defaults"), "dictionaryRepresentation");
  sub_100024B38();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
  sub_100015BFC();
}

void sub_100050374(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "mitigationState");
  v4 = 136315650;
  v5 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
  v6 = 2048;
  v7 = 1;
  v8 = 2048;
  v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, " %s <Error> Inconsistent mitigation state. Expected %lu, found %lu\n", (uint8_t *)&v4, 0x20u);
}

void sub_100050428(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "-[AgingController takeActionOnUPO:forWRa:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s <Error> Weighted Ra %d is not a valid value. Returning early\n", (uint8_t *)&v2, 0x12u);
  sub_100010ED4();
}

void sub_1000504AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024B18((void *)&_mh_execute_header, a2, a3, "Unchanged boot UUID %@. Skipping UPO\x10\x10.\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100050510(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Current WRa %d less than threshold %d. Skipping UPO\n", (uint8_t *)v4, 0xEu);
  sub_100010ED4();
}

void sub_100050594(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024B28((void *)&_mh_execute_header, a2, a3, "Unchanged upo count %d. Skipping UPO\x10\x10.\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000505F8(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Saved upo count %d > new UPO Count %d. Resetting state\n", (uint8_t *)v3, 0xEu);
  sub_100010ED4();
}

void sub_100050678(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "mitigationState");
  sub_100024B48();
  sub_100024B38();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);
  sub_100015BFC();
}

void sub_1000506F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024B18((void *)&_mh_execute_header, a1, a3, "%s Making XPC call to PowerUI\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100050768(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "mitigationState");
  sub_100024B48();
  sub_100024B38();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x18u);
  sub_100015BFC();
}

void sub_1000507F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100024B08((void *)&_mh_execute_header, v0, v1, "Succeeded\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Setting PPM EnableBatteryAgingModel failed\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005084C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024B28((void *)&_mh_execute_header, a2, a3, "Setting PPM property EnableBatteryAgingModel to %d\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000508B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Couldn't open PPM service\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000508E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100024B08((void *)&_mh_execute_header, v0, v1, "Canceling connection", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005090C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100024B08((void *)&_mh_execute_header, v0, v1, "Waiting for response", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050938(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024B18((void *)&_mh_execute_header, a1, a3, "%s Creating xpc connection", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000509A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Connection interrupted. Remote service exited prematurely\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000509D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100024B08((void *)&_mh_execute_header, v0, v1, "Signalled semaphore\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050A00(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[ContextInPocket initWithParams:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: failed to create dispatch queue", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_100050A80()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CARSessionStatus");
  return sub_100050AA4(v0);
}

void sub_100050AA4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100010E98((void *)&_mh_execute_header, a1, a3, "<Error> LifetimeServoAFLUT cannot hold all data columns", v3);
}

void sub_100050ADC(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100010E98((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> LifetimeServoAFLUT data improperly sorted", a1);
}

void sub_100050B10(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Required power parameters missing!", v1, 2u);
}

void sub_100050B50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> ArcPowerCC invalid parameters", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100050B80(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> ArcPowerCC: Failed allocate NSNumber for %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100050BE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> ArcPowerCC: Failed to set the target to %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100050C50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> ArcPowerCC: Dictionary has no elements", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100050C80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> ArcPowerCC: Got an empty dictionary from AVSystemController", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100050CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050CDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not parse componentNameDetail", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050D08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050D34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050D60(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> could not register for %@", (uint8_t *)&v3);
}

void sub_100050DCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> CT connection failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050DF8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> unknown CT notification: %@", (uint8_t *)&v3);
}

void sub_100050E64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> CT bad drop limit", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050E90(int a1, int __errnum, NSObject *a3)
{
  char *v4;
  uint64_t v5;
  int v6;
  char *v7;

  if (a1 == 1)
    v4 = strerror(__errnum);
  else
    v4 = mach_error_string(__errnum);
  v6 = 136315138;
  v7 = v4;
  sub_100010EA4((void *)&_mh_execute_header, a3, v5, "<Error> CT max Tx power failed: %s", (uint8_t *)&v6);
}

void sub_100050F28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not be called from base class", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100050F54(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[SolarDetectorSemantic init]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s:: brightnessSystemClient nil", (uint8_t *)&v1, 0xCu);
}

void sub_100050FD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> notify_register_check(kSunlightState) failed", a5, a6, a7, a8, 0);
}

void sub_100051008(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> notify_set_state(thermalSunlightStateToken) failed", a5, a6, a7, a8, 0);
}

void sub_10005103C(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not create solar context (%d)", (uint8_t *)v2, 8u);
}

void sub_1000510B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Could not create pocket context", v1, 2u);
}

void sub_1000510F4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Should not be using Default Action", v1, 2u);
}

void sub_100051134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to query baseband boot state at init", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to create dictionary for frequency configuration to baseband", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005119C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to retain data for getting thermal IDs", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000511D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "outputDict is not an XPC dictionary type", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to query the thermal IDs from the baseband", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to send thermal frequency configuration to baseband", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005126C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Sensor TB1R index not set!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Sensor TB0R index not set!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000512C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Baseband not ready, when trying to query sensor info", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000512F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to query the thermal IDs from the baseband", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005131C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed obtain thermal sensor report from baseband", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051348(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> \n mutex init has failed\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051378(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> SMC connection not open", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000513A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Could not write sensor data. Error: 0x%x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005140C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Couldn't connect to smc! error: 0x%x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051470(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Unable to find sensor group for key %@", (uint8_t *)&v2, 0xCu);
  sub_100010ED4();
}

void sub_1000514E0()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10002E154();
  sub_10002E140((void *)&_mh_execute_header, v0, v1, "<Error> smcIndex:%d greater than allow numer of sensors for group:%u", v2, v3);
  sub_100010ED4();
}

void sub_100051540()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10002E154();
  sub_10002E140((void *)&_mh_execute_header, v0, v1, "<Error> Invalid indices. cltmIndex:%d smcIndex:%d", v2, v3);
  sub_100010ED4();
}

void sub_1000515A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not find camera service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000515CC(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = dword_1000A1F64;
  v4 = 1024;
  v5 = a1;
  sub_100031344((void *)&_mh_execute_header, a2, a3, "<Error> IOPMAssertionRelease(0x%08x) failed: %d", (uint8_t *)v3);
}

void sub_10005164C(int *a1, int a2, NSObject *a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  sub_100031344((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> Setting CTServerConnectionConfigMaxRadioPower Tech %d level %d\n", (uint8_t *)v4);
}

void sub_1000516CC(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if (a1 == 1)
    strerror(__errnum);
  else
    mach_error_string(__errnum);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v2, v3, "<Error> CTServerConnectionConfigMaxRadioPower() failed: %s", v4, v5, v6, v7, v8);
  sub_100015BFC();
}

void sub_100051750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005177C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> no TestCase Name", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000517A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> no representation for tGraphLogFile", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000517D4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100031350();
  sub_10003133C(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> tGraph open: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_100051840()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100031350();
  sub_10003133C(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> tGraph fstat: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_1000518AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not create OSThermalStatus prefs.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000518D8()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100031350();
  sub_10003133C(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> sysctlbyname(hw.model) failed: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_100051944()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100015C08();
  SCErrorString(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesSetCallBack() failed: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_1000519B0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_100015C08();
  SCErrorString(v0);
  sub_100015C10();
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesScheduleWithRunLoop() failed: %s", v3, v4, v5, v6, v7);
  sub_100015BFC();
}

void sub_100051A1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> filterParams NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051A48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Total Power Sensors > Allowed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No sensors found", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051AA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> sensorCount > Allowed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051ACC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not register for system power notifications", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051AF8(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Failed SetLevel 10 times", buf, 2u);
}

void sub_100051B34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Unable to allocate memory for missing sensor string", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051B60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unable to get times: %i", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051BC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unable to get last wake time: 0x%x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051C28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Cannot read kern.wake_abs_time: %{errno}i", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051C90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> tGraph write failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not get hidSensorKeys", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051CE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> no sensor keys", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051D14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> no canary key", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051D40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> IOPMAssertionCreateWithName(kIOPMAssertionTypeNoIdleSleep) failed: %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100051DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: Could not open connection to PMP service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051DD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: NULL PMPService", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051DFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: maxRPM key not defined in the fan controller", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051E28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: minRPM key not defined in the fan controller", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051E54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: RPM cannot be negative", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051E80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: failed to set fan RPM", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051EAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find PMGR service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find CLPC service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051F04(const __CFString *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  v4 = 136315138;
  v5 = sub_100033B54(a1);
  sub_100010EA4((void *)&_mh_execute_header, a2, v3, "<Error> Failed to read %s", (uint8_t *)&v4);
  sub_100015BFC();
}

void sub_100051F7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No CLPC service!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100051FA8(NSObject *a1)
{
  uint64_t v2;
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = sub_100033B54(CFSTR("~pkg-power-split-cpu-fraction"));
  sub_100010EA4((void *)&_mh_execute_header, a1, v2, "<Error> Failed to read %s", (uint8_t *)&v3);
  sub_100015BFC();
}

void sub_100052028()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Cannot Get GPU Power", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052054(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[MitigationController setPackagePowerBudgetDirect:withDetails:]";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> %s should not be called without CPMS enablement", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_1000520C8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not set SGX Max power to %d\n", (uint8_t *)v2, 8u);
  sub_100010EC0();
}

void sub_100052138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> clpc service not present when setting max power target!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052164(int *a1, NSObject *a2, uint64_t a3)
{
  double v3;
  int v4;
  double v5;

  v3 = (float)*a1;
  v4 = 134217984;
  v5 = v3;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> Could not set CPU Max power to %f\n", (uint8_t *)&v4);
  sub_100010ED4();
}

void sub_1000521D8(int *a1, NSObject *a2, uint64_t a3)
{
  double v3;
  int v4;
  double v5;

  v3 = (float)*a1;
  v4 = 134217984;
  v5 = v3;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> Could not set CPU low power target to %f\n", (uint8_t *)&v4);
  sub_100010ED4();
}

void sub_10005224C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "AppleDieTempController";
  sub_100010EA4((void *)&_mh_execute_header, a1, a3, "<Error> Cannot find %s service", (uint8_t *)&v3);
  sub_100010ED4();
}

void sub_1000522C0(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;

  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Could not create number from %@ dithering level %d", (uint8_t *)&v4, 0x12u);
  sub_100010ED4();
}

void sub_100052344(uint64_t a1, mach_error_t error_value, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  char *v7;

  v4 = 138412546;
  v5 = a1;
  v6 = 2080;
  v7 = mach_error_string(error_value);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> Could not set %@ dithering level: %s", (uint8_t *)&v4, 0x16u);
  sub_100015BFC();
}

void sub_1000523D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000340A4();
  sub_100034094((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: Ra thresholds %d above max %d", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000340A4();
  sub_100034094((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: charge thresholds %d above max %d", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000524A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000340A4();
  sub_100034094((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: temp thresholds %d above max %d", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad inputs", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005253C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: null array", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad array sorting", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad element count", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000525C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Could not get number value for %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Could not get string value for %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Could not replace dictionary value for %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000526E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Could not set dictionary value for %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052740()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> could not find %@ property", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000527A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> %@ could not be converted to kCFNumberSInt32Type", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052800()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> %@ not a CFNumber", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> %@ could not be converted to kCFNumberSInt64Type", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000528C0(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v5 = 136315650;
  v6 = "bytes_from_service";
  v7 = 2048;
  v8 = objc_msgSend(a1, "length");
  v9 = 2048;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> %s: data byte count (%zu) does not match expected (%zu)", (uint8_t *)&v5, 0x20u);
}

void sub_100052968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not connect to power management domain", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not sleep system", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000529C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not create date for sleep timer", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000529EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not schedule wakeup event", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052A18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> could not cancel wakeup event", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052A44(const __CFString *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  CFStringGetCStringPtr(a1, 0);
  sub_100015C10();
  v7 = 2048;
  v8 = v4;
  sub_100036428((void *)&_mh_execute_header, a3, v5, "<Error> Sensor %s removed (%llx)", v6);
  sub_100015BFC();
}

void sub_100052AD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> service removal, no key", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052AFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> powerService NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052B28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryTemperatureRef NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052B54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryRawCurrentCapacityRef NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052B80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryRawMaxCapacityRef NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052BAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryData NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> nil key string\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052C04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s failed\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100052C74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> %@ NULL", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100052CD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s failed\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100052D44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> WeightedRa array NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052D70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> WeightedRa value NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052D9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s failed\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100052E0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryRaTable array NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052E38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> lifetimeData NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052E64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Ra values both NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052E90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> batteryRaTableRawData bad size %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100052EF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> pmuService NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052F20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> batteryUPOCountRef NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052F4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: early exit due to invalid/null inputs", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100052FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get valid ScreenClass value", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100052FE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Screen class: %d not determinate. defaulting to FALSE", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005304C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100015C10();
  v3 = 2080;
  v4 = v0;
  sub_100036428((void *)&_mh_execute_header, v1, (uint64_t)v1, "<Error> %s + %s length too long", v2);
  sub_100010ED4();
}

void sub_1000530C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: notify_register_dispatch failure", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100053130(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: notify_register_check failure", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000531A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: invalid inputs", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100053210()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100036434();
  sub_100036428((void *)&_mh_execute_header, v0, (uint64_t)v0, "<Error> service %p: no %@", v1);
  sub_100010ED4();
}

void sub_100053278()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100036434();
  sub_100036428((void *)&_mh_execute_header, v0, (uint64_t)v0, "<Error> service %p: bad %@", v1);
  sub_100010ED4();
}

void sub_1000532E0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  objc_msgSend(a1, "lastPathComponent");
  sub_100015C10();
  v7 = 2112;
  v8 = v4;
  sub_100036428((void *)&_mh_execute_header, a3, v5, "<Error> Error excluding %@ from backup %@", v6);
  sub_100015BFC();
}

void sub_100053368()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not set PPM property", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053394()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read ThermalProfile", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000533C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get Battery channels", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000533EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Arc control: queue NULL", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005341C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Arc control: set gain failed", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005344C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Arc control: bad override", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005347C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_register_check failed (peak)", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000534A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_register_check failed (cold)", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000534D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: no params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: no notification params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005352C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find charger service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find PPM service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053584()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find strobe service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000535B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024B48();
  sub_10003AC34((void *)&_mh_execute_header, v0, v1, "<Error> Failed to set state on notify string %s. status:%d\n", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_10005361C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024B48();
  sub_10003AC34((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create notify token for %s. status:%d\n", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_100053688()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024B48();
  sub_10003AC34((void *)&_mh_execute_header, v0, v1, "<Error> Failed to set state on notify string %s. status:%d\n", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_1000536F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024B48();
  sub_10003AC34((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create notify token for %s. status:%d\n", v2, v3, v4, v5, 2u);
  sub_100010ED4();
}

void sub_100053760(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unable to find WeightedRa P0 limits for chemId %d\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000537C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unsupported chemId %d. Falling back to default P0 threshold\n", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100053828(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Clamp: set PPM baseline failed (%x)", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_10005388C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: set max strobe failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000538B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_post failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000538E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_set_state failed", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053910(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Clamp: unexpected cold state %lld", (uint8_t *)&v2, 0xCu);
  sub_100010ED4();
}

void sub_100053980(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Could not assign value for ACCConnectionInfo sharedInstance", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000539B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Unable to create dictionary for connectedEndpoints", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000539E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012908((void *)&_mh_execute_header, a1, a3, "<Error> Missing product pointer", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100053A10(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> No properties available for endpoint: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100053A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No backlight power level table defined!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053AB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> brightness client nil", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053ADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find display power source", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053B08(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> brightness set %@ failed", (uint8_t *)&v2, 0xCu);
}

void sub_100053B7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Power level array is invalid! Using default values", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base findBacklightServices method", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053BD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get display IOReporting channels", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053C00(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> IOMFB Failure: 0x%x", (uint8_t *)v2, 8u);
  sub_100010EC0();
}

void sub_100053C70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to display read sample", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053C9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find display params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find nit params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053CF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find nit values", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053D20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find slider params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053D4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find slider values", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100053D78(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "nameofComponent");
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> No detail string available for %@", v3, v4, v5, v6, 2u);
  sub_100015BFC();
}

void sub_100053DE8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid detail string length (%llu) for detail string: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100053E6C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "nameofComponent");
  sub_100015BE8((void *)&_mh_execute_header, v1, v2, "<Error> Should not be using Default Action in %@, will retry", v3, v4, v5, v6, 2u);
  sub_100015BFC();
}

void sub_100053EDC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Arc control: set gain failed", v1, 2u);
}

void sub_100053F1C(os_log_t log, double a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid haptic gain value: %f", (uint8_t *)&v2, 0xCu);
}

void sub_100053F94()
{
  uint64_t v0;
  os_log_t v1;

  sub_100044B74();
  sub_100044B08((void *)&_mh_execute_header, v0, v1, "<Error> Failed to write to file %@ err:%@");
  sub_100010ED4();
}

void sub_100053FF8()
{
  uint64_t v0;
  os_log_t v1;

  sub_100044B74();
  sub_100044B08((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read from file %@. err:%@");
  sub_100010ED4();
}

void sub_10005405C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected data format in file %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000540BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Detected unexpected file at %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_10005411C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a2, a3, "<Error> Unexpected directory %@", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100054184(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a2, a3, "<Error> Failed to create basePath directory. err:%@", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000541EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Failed to get system UUID. rc:%d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100054250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LifetimeServoStatePersistence init failed\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005427C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create filer", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000542A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL queue", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000542D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get updated LTS state\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: unknown override %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100054360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save LTS data to file", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005438C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save counter\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000543B8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_100044B1C();
  sub_10002E140((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create key for die %u loop %u\n", 67109376, v2);
  sub_100010ED4();
}

void sub_100054420()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save loop count\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005444C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save die count\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054478()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save version\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000544A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read loop count from persistant LTS Stats", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000544D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read die count from persistant LTS Stats", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000544FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Retrieving initial data from PMP and storing in NAND & NVRAM", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> LTS data from NAND contains %llu years of accumulated IS! Ignoring the data", a5, a6, a7, a8, 0);
  sub_100010ED4();
}

void sub_1000545A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100044B8C();
  sub_10001B420((void *)&_mh_execute_header, v0, v1, "<Error> LTS data from Nand has invalid version %d. Ignoring the data.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read LTS State from NVRam", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LTS data from NVRam has invalid data. Ignoring the data.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005465C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: cannot find path to persistant storage", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054688()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get path to srvo folder. resp:%ld", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000546E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create NVRam persistence path", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054714()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> NVRam persistence path is null", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054740(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s missing!\n", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000547B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Persistent NVRAM  missing!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000547DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Persistent data is corrupted\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054808()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to write persistent data\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054834(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> Failed to find %s service in the registry", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_1000548A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read key %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100054904(const __CFData *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;

  CFDataGetLength(a1);
  sub_100015C10();
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> Unexpected data size %ld bytes for key %@\n", v5, 0x16u);
}

void sub_100054998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected data type for key %@\n", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000549F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send data for key %@ to PMP", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100054A58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read die count for registry\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read loop count for registry\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054AB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to allocate memory for integrator state. size: %zu\n", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100054B10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop: nil params", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054B3C(int *a1)
{
  int v1;
  __int16 v2;
  os_log_t v3;
  _DWORD v4[3];
  __int16 v5;
  int v6;

  v1 = *a1;
  v4[0] = 67109632;
  v4[1] = v1;
  sub_100044B1C();
  v5 = v2;
  v6 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "<Error> LSControlLoop %d: perf state count %d, max %d", (uint8_t *)v4, 0x14u);
  sub_100010ED4();
}

void sub_100054BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100044B8C();
  sub_10001B420((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: target params out of order", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054C28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> LSControlLoop %d: unknown type", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100054C8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100044B8C();
  sub_10001B420((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL keysToFetch", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054CF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100044B8C();
  sub_10001B420((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL persistedState", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054D54()
{
  uint64_t v0;
  os_log_t v1;

  sub_100044B44(__stack_chk_guard);
  sub_100044B2C();
  sub_100044AF4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL key %@");
  sub_100010ED4();
}

void sub_100054DB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100044B8C();
  sub_10001B420((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL keysToSet", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054E18()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_100044B1C();
  sub_10002E140((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: no voltage for state %d residency", 67109376, v2);
  sub_100010ED4();
}

void sub_100054E84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> LSController: bad variant %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100054EE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create persistence folder.", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054F14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not init sleep time", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054F40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL _gpuDieTempCtlService", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054F6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL _cpuDieTempCtlService", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100054F98()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  uint64_t v3;

  sub_100015C10();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_100044B08((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL dict for %s (ID %lld)", v2, v3);
  sub_100010ED4();
}

void sub_100055004()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no CPU channels", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL CPU subscription", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005505C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no GPU channels", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055088()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL GPU subscriptionL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000550B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: couldn't create path for %s", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100055114()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: path too long for %s", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100055174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no ioreg entry for %s", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000551D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL voltageData for %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100055234()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_100044B1C();
  sub_10002E140((void *)&_mh_execute_header, v0, v1, "<Error> LSController: %d perf states, %d max", 67109376, v2);
  sub_100010ED4();
}

void sub_10005529C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL service", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000552C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not create number", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000552F4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015C10();
  sub_100044AF4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: setting %@ returned %x");
  sub_100010ED4();
}

void sub_100055360()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100044B58();
  sub_100031344((void *)&_mh_execute_header, v0, v1, "<Error> LSController: %d CPU perf states, %d max", v2);
  sub_100010ED4();
}

void sub_1000553C4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100044B58();
  sub_100031344((void *)&_mh_execute_header, v0, v1, "<Error> LSController: %d GPU perf states, %d max", v2);
  sub_100010ED4();
}

void sub_100055428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not update time", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: retrograde update", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not update sleep time", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000554AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> PowerSourceCC: misformed table", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000554D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> CC: Failed to find pmu power source", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> pmuPowerService is NULL!", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055530(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not create number from charge rate index %d", (uint8_t *)v3, 8u);
  sub_100010EC0();
}

void sub_1000555A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not set charge rate index", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

double sub_1000555D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double result;

  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> Invalid speaker gain: %f", a5, a6, a7, a8, 0);
  return result;
}

void sub_100055640(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> SpeakerCC: setSpeakerThermalGain failed", v1, 2u);
}

void sub_100055680(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> Invalid speaker gain value: %f", a5, a6, a7, a8, 0);
}

void sub_1000556EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find Arc control parameters", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find contextual clamp parameters", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055744()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> No TSFD channel", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055770(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> IOMFB failure: 0x%x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000557D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find LSController parameters", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055800()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find camera sensor channel(s)", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005582C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not find calibration resistor sensor channel", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055858(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> Unknown radioControllerType %d", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_1000558BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> failed to create keyboardHelper object", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000558E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Unknown level requested for thermalSimulationMode", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Null dictionary for ppm simuation override", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055940()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base updateAllThermalLoad", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_10005596C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base compute2DGridTemps", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base computeMaxCGTemp", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_1000559C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001B420((void *)&_mh_execute_header, a2, a3, "<Error> IOMFB failure %x", a5, a6, a7, a8, 0);
  sub_100010EC0();
}

void sub_100055A28(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100010EA4((void *)&_mh_execute_header, a2, a3, "<Error> bad TSFD seed %@", (uint8_t *)&v3);
}

void sub_100055A94(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  NSNumber *v5;

  v4 = 138412290;
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a1);
  sub_100010EA4((void *)&_mh_execute_header, a2, v3, "<Error> Unable to create power assertion for TSFD blend. Error: %@", (uint8_t *)&v4);
}

void sub_100055B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send max temp to the display driver", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055B4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send 2D gridVT to the display driver", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055B78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Framebuffer is NULL", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055BA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send grid to the display driver", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055BD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base class getGridX", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055BFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base class getGridY", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055C28(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100010E98((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> no FContext value", a1);
}

void sub_100055C5C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100010E98((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> bad FContext value", a1);
}

void sub_100055C90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get 4CC info from SMC\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get sensorCount\n", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055CE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Could not open connection with AppleSMCSensorDispatcher", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055D14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010EC8();
  sub_100012908((void *)&_mh_execute_header, v0, v1, "<Error> Failed to query data from SensorDispatcher", v2, v3, v4, v5, v6);
  sub_100010EC0();
}

void sub_100055D40(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Failed to write data to SensorDispatcher = 0x%x", (uint8_t *)v2, 8u);
  sub_100010EC0();
}

void sub_100055DB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> %s: got null pointer argument refcon, expected KeyboardHelper*", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100055E20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Error creating CLPC client %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100055E80()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get keyboard notification ports", v2);
  sub_100010EC0();
}

void sub_100055EB0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get runLoops for keyboard connect/disconnect", v2);
  sub_100010EC0();
}

void sub_100055EE0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get HID services for folio detection", v2);
  sub_100010EC0();
}

void sub_100055F10(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100010E98((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> Failed to copy keyboard event from client", a1);
}

void sub_100055F44(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100010E98((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> Unable to create eventRef for keyboard event", a1);
}

void sub_100055F78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> Failed to find %s service", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100055FE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000137D4((void *)&_mh_execute_header, a1, a3, "<Error> Failed to find %s service", a5, a6, a7, a8, 2u);
  sub_100010ED4();
}

void sub_100056058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to false in CLPC client %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_1000560B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to True with keyboard attached %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100056118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015C10();
  sub_1000137D4((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to True with folio attached %@", v2, v3, v4, v5, v6);
  sub_100010ED4();
}

void sub_100056178()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Couldn't create hidEventSystem", v2);
  sub_100010EC0();
}

void sub_1000561A8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected DT data count", v2);
  sub_100010EC0();
}

void sub_1000561D8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table too small", v2);
  sub_100010EC0();
}

void sub_100056208()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table too large", v2);
  sub_100010EC0();
}

void sub_100056238()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table bad bounds", v2);
  sub_100010EC0();
}

void sub_100056268()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table count mismatch", v2);
  sub_100010EC0();
}

void sub_100056298()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT interpolation failure", v2);
  sub_100010EC0();
}

void sub_1000562C8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Invalid DT section format", v3);
}

void sub_1000562F4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Invalid DT section dictionary type", v3);
}

void sub_100056320(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100010EB0(a1, a2);
  sub_100010E98((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Unknown DT section representation", v3);
}

void sub_10005634C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100010EC8();
  sub_100010E98((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected value for seeding source", v2);
  sub_100010EC0();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_CPULevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CPULevel");
}

id objc_msgSend_DVD1Level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DVD1Level");
}

id objc_msgSend_SGXLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SGXLevel");
}

id objc_msgSend_SaveProductString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SaveProductString:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__acquireBacklightAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_acquireBacklightAssertion");
}

id objc_msgSend__initWithSuiteName_container_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithSuiteName:container:");
}

id objc_msgSend_accConnectionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accConnectionInfo");
}

id objc_msgSend_accelerationFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accelerationFactor:");
}

id objc_msgSend_accelerationFactor_voltage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accelerationFactor:voltage:");
}

id objc_msgSend_accelerationFactorForTemperature_cpuPerfStateIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accelerationFactorForTemperature:cpuPerfStateIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addRadioMitigations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRadioMitigations");
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSessionObserver:");
}

id objc_msgSend_addToCPMSMitigationArray_forComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToCPMSMitigationArray:forComponent:");
}

id objc_msgSend_addToCPMSMitigationArray_withDetails_forComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToCPMSMitigationArray:withDetails:forComponent:");
}

id objc_msgSend_addtGraphDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addtGraphDataSource:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_alloc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alloc");
}

id objc_msgSend_allocDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDefaults");
}

id objc_msgSend_applyAlternateHotSpotTargets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyAlternateHotSpotTargets:");
}

id objc_msgSend_applyAlternateTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyAlternateTarget:");
}

id objc_msgSend_applySeedToIntegratorFromControlEffort_currentTemperature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applySeedToIntegratorFromControlEffort:currentTemperature:");
}

id objc_msgSend_applyUpdatedAccessoryState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyUpdatedAccessoryState:");
}

id objc_msgSend_arcModuleTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arcModuleTemperature");
}

id objc_msgSend_arcVirtualTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arcVirtualTemperature");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_audioIsOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioIsOn");
}

id objc_msgSend_backlightIsOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backlightIsOn");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brightnessSystemMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessSystemMonitor");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cacheArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheArray");
}

id objc_msgSend_calculateAdditionalRadioMitigations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateAdditionalRadioMitigations");
}

id objc_msgSend_calculateControlEffort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateControlEffort:");
}

id objc_msgSend_calculateControlEffort_trigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateControlEffort:trigger:");
}

id objc_msgSend_calculateMitigation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateMitigation");
}

id objc_msgSend_calculateTargetDifference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateTargetDifference");
}

id objc_msgSend_callbackSensorInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callbackSensorInterval:");
}

id objc_msgSend_canSystemSleep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSystemSleep");
}

id objc_msgSend_canaryModeExitEarly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canaryModeExitEarly:");
}

id objc_msgSend_canaryTempSensorIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canaryTempSensorIndex");
}

id objc_msgSend_canaryTempThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canaryTempThreshold");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_checkForArcOverride_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForArcOverride:key:");
}

id objc_msgSend_checkForLifetimeServoOverride_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForLifetimeServoOverride:key:");
}

id objc_msgSend_chooseEffectiveSeedingSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chooseEffectiveSeedingSource");
}

id objc_msgSend_clearControlEffortOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearControlEffortOverrides");
}

id objc_msgSend_clearLoadingIndexOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearLoadingIndexOverrides");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_compute2DGridTemps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compute2DGridTemps");
}

id objc_msgSend_computeMaxCGTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeMaxCGTemp");
}

id objc_msgSend_computePackageCEforSeedingSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computePackageCEforSeedingSource:");
}

id objc_msgSend_computePackageCurrentSeedPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computePackageCurrentSeedPower");
}

id objc_msgSend_computePowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computePowerTarget");
}

id objc_msgSend_connectedEndpoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedEndpoints");
}

id objc_msgSend_connectedExternally(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedExternally");
}

id objc_msgSend_contextIsActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextIsActive");
}

id objc_msgSend_controlEffort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlEffort");
}

id objc_msgSend_convertDetailStringToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertDetailStringToValue:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDictionaryFromFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDictionaryFromFile");
}

id objc_msgSend_copyDictionaryFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDictionaryFromFile:");
}

id objc_msgSend_copyDieTempSensorIndexSetForFourthChar_sensors_filteredOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDieTempSensorIndexSetForFourthChar:sensors:filteredOnly:");
}

id objc_msgSend_copyFieldCurrentValueForIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFieldCurrentValueForIndex:");
}

id objc_msgSend_copyFiler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFiler");
}

id objc_msgSend_copyHeaderForIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyHeaderForIndex:");
}

id objc_msgSend_copyHotspotsArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyHotspotsArray:");
}

id objc_msgSend_copyKeyFromPMP_is_64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyKeyFromPMP:is_64:");
}

id objc_msgSend_copyLTSStateFromPMP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyLTSStateFromPMP:");
}

id objc_msgSend_copyPersistedStateNvram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPersistedStateNvram:");
}

id objc_msgSend_copyPersistenceNvramPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPersistenceNvramPath");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyForKey:");
}

id objc_msgSend_copySensorArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySensorArray");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpmsHelperQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpmsHelperQueue");
}

id objc_msgSend_createClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createClient:");
}

id objc_msgSend_createConnectionToCT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createConnectionToCT");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createHIDEventSystemObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createHIDEventSystemObject");
}

id objc_msgSend_createNewInPocketContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewInPocketContext:");
}

id objc_msgSend_createNewProduct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewProduct:");
}

id objc_msgSend_createNewSolarContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewSolarContext:");
}

id objc_msgSend_createServerConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createServerConnection");
}

id objc_msgSend_ctxType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctxType");
}

id objc_msgSend_currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBootSessionUUID");
}

id objc_msgSend_currentLoadingIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLoadingIndex");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSession");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAction");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultDieTempTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDieTempTarget");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaults");
}

id objc_msgSend_desiredLoopInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "desiredLoopInterval");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didWeCrossTargetTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didWeCrossTargetTemp");
}

id objc_msgSend_dieTempFilteredMaxAverage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dieTempFilteredMaxAverage");
}

id objc_msgSend_dieTempMaxAverage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dieTempMaxAverage");
}

id objc_msgSend_dieTempMaxMax(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dieTempMaxMax");
}

id objc_msgSend_dieTempTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dieTempTarget");
}

id objc_msgSend_enableDispatchVirtualTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableDispatchVirtualTemp");
}

id objc_msgSend_enableFrontIRCameraNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFrontIRCameraNotifications:");
}

id objc_msgSend_enableFrontRigelDieNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFrontRigelDieNotifications:");
}

id objc_msgSend_enableFrontRomeoNTCNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFrontRomeoNTCNotifications:");
}

id objc_msgSend_enableRearCameraJasperNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableRearCameraJasperNotifications:");
}

id objc_msgSend_enableRearCameraSuperWideNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableRearCameraSuperWideNotifications:");
}

id objc_msgSend_enableRearCameraTeleNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableRearCameraTeleNotifications:");
}

id objc_msgSend_enableSending2DTempGridToDisplayDriver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSending2DTempGridToDisplayDriver");
}

id objc_msgSend_enableSendingMaxTempToDisplayDriver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSendingMaxTempToDisplayDriver");
}

id objc_msgSend_evaluateDecisionTree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateDecisionTree");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findBacklightServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findBacklightServices");
}

id objc_msgSend_findCC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findCC:");
}

id objc_msgSend_findComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findComponent:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fourCharCodeMatchesDieTempType_fourCharCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fourCharCodeMatchesDieTempType:fourCharCode:");
}

id objc_msgSend_fourCharCodeNeedsPMUtcal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fourCharCodeNeedsPMUtcal:");
}

id objc_msgSend_frontCameraSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontCameraSensorIdx");
}

id objc_msgSend_frontIRCameraSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontIRCameraSensorIdx");
}

id objc_msgSend_frontRigelDieSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontRigelDieSensorIdx");
}

id objc_msgSend_frontRomeoNTCSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontRomeoNTCSensorIdx");
}

id objc_msgSend_gasGaugeBatteryTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gasGaugeBatteryTemperature");
}

id objc_msgSend_genTGraphData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genTGraphData");
}

id objc_msgSend_genTGraphHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genTGraphHeader");
}

id objc_msgSend_getAdaptorPMUValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAdaptorPMUValue");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCLPCPackagePowerCPUSplitFraction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCLPCPackagePowerCPUSplitFraction");
}

id objc_msgSend_getCLPCWriteToReadPower_8_24_mW_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCLPCWriteToReadPower_8_24_mW:");
}

id objc_msgSend_getCPUTargetPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCPUTargetPower");
}

id objc_msgSend_getChargerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getChargerState");
}

id objc_msgSend_getConfigurationFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConfigurationFor:");
}

id objc_msgSend_getContextState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getContextState");
}

id objc_msgSend_getContextState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getContextState:");
}

id objc_msgSend_getControlEffortForMaxLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getControlEffortForMaxLI:");
}

id objc_msgSend_getCpuPowerZoneLimited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCpuPowerZoneLimited");
}

id objc_msgSend_getCurrentCPULoadingIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentCPULoadingIndex:");
}

id objc_msgSend_getCurrentCPUPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentCPUPower");
}

id objc_msgSend_getCurrentGPULoadingIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentGPULoadingIndex:");
}

id objc_msgSend_getCurrentGPUPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentGPUPower");
}

id objc_msgSend_getCurrentMaxLIForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentMaxLIForComponent:");
}

id objc_msgSend_getCurrentPackageLoadingIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentPackageLoadingIndex:");
}

id objc_msgSend_getCurrentPackagePower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentPackagePower");
}

id objc_msgSend_getFastDieEngagementStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFastDieEngagementStatus");
}

id objc_msgSend_getFilterTimeConstantForSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFilterTimeConstantForSensor:");
}

id objc_msgSend_getFloatValueFromSMCForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFloatValueFromSMCForKey:");
}

id objc_msgSend_getGPUTargetPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGPUTargetPower");
}

id objc_msgSend_getGpuPowerZoneLimited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGpuPowerZoneLimited");
}

id objc_msgSend_getGridX(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGridX");
}

id objc_msgSend_getGridY(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGridY");
}

id objc_msgSend_getHIDSensorDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHIDSensorDict");
}

id objc_msgSend_getHighestSkinTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHighestSkinTemp");
}

id objc_msgSend_getMTypeFromComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMTypeFromComponent:");
}

id objc_msgSend_getMaxLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMaxLI:");
}

id objc_msgSend_getMaxPowerForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMaxPowerForComponent:");
}

id objc_msgSend_getMaxSensorValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMaxSensorValue");
}

id objc_msgSend_getMinPowerForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMinPowerForComponent:");
}

id objc_msgSend_getMitigationTypeForClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMitigationTypeForClientID:");
}

id objc_msgSend_getModeratePressureVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getModeratePressureVersion");
}

id objc_msgSend_getPMPSvc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPMPSvc");
}

id objc_msgSend_getPackageCPUPowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPackageCPUPowerTarget");
}

id objc_msgSend_getPackageGPUPowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPackageGPUPowerTarget");
}

id objc_msgSend_getPackagePowerZoneLimited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPackagePowerZoneLimited");
}

id objc_msgSend_getPackagePowerZoneMetric(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPackagePowerZoneMetric");
}

id objc_msgSend_getPackageTargetPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPackageTargetPower");
}

id objc_msgSend_getPotentialForcedThermalLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPotentialForcedThermalLevel:");
}

id objc_msgSend_getPotentialForcedThermalPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPotentialForcedThermalPressureLevel");
}

id objc_msgSend_getPowerSensorIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerSensorIndex:");
}

id objc_msgSend_getPowerlogFieldCurrentValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerlogFieldCurrentValue");
}

id objc_msgSend_getPowerlogKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerlogKey");
}

id objc_msgSend_getProductCalibrationDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductCalibrationDefault");
}

id objc_msgSend_getProductCalibrationSensorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductCalibrationSensorID");
}

id objc_msgSend_getProductFilterValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductFilterValues");
}

id objc_msgSend_getProductTotalPowerSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductTotalPowerSensors");
}

id objc_msgSend_getProductTotalSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductTotalSensors");
}

id objc_msgSend_getReleaseMaxLI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReleaseMaxLI");
}

id objc_msgSend_getReleaseMaxLI_releaseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReleaseMaxLI:releaseRate:");
}

id objc_msgSend_getReleaseRateForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReleaseRateForComponent:");
}

id objc_msgSend_getRequiredCalibrationResistorSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRequiredCalibrationResistorSamples");
}

id objc_msgSend_getSensor4CCFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSensor4CCFromIndex:");
}

id objc_msgSend_getSensorGroupForSMCKeyString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSensorGroupForSMCKeyString:");
}

id objc_msgSend_getSensorIndexFrom4CC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSensorIndexFrom4CC:");
}

id objc_msgSend_getTGraphData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTGraphData:");
}

id objc_msgSend_getTemperatureFromSMCForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTemperatureFromSMCForKey:");
}

id objc_msgSend_getThermalStateofHotspot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getThermalStateofHotspot");
}

id objc_msgSend_getUserUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUserUsage");
}

id objc_msgSend_getValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValueForKey:");
}

id objc_msgSend_getValueFromSMCForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValueFromSMCForKey:");
}

id objc_msgSend_getWatchDogMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWatchDogMask");
}

id objc_msgSend_handleAccessoryEventForEndpointUUID_andAttachedState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAccessoryEventForEndpointUUID:andAttachedState:");
}

id objc_msgSend_handleBrightnessClientNotification_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBrightnessClientNotification:value:");
}

id objc_msgSend_handleCurrentTopOffStatusWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCurrentTopOffStatusWithContext:");
}

id objc_msgSend_handleFrontCameraPowerStateNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFrontCameraPowerStateNotification:");
}

id objc_msgSend_handleMCSThermalPressure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMCSThermalPressure");
}

id objc_msgSend_handleRearCameraPowerStateNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRearCameraPowerStateNotification:");
}

id objc_msgSend_handleStateChangeNotification_temperatureSensorIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleStateChangeNotification:temperatureSensorIndex:");
}

id objc_msgSend_hapticThermalGain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hapticThermalGain");
}

id objc_msgSend_hidSensorKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidSensorKeys");
}

id objc_msgSend_hintComponentControlTakeAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hintComponentControlTakeAction");
}

id objc_msgSend_hotspotTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hotspotTemperature");
}

id objc_msgSend_inPocketQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inPocketQueue");
}

id objc_msgSend_includeSolarInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includeSolarInfo");
}

id objc_msgSend_indexForTempSensorKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexForTempSensorKey:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_init_withSolarInfo_withModeratePressureVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:withSolarInfo:withModeratePressureVersion:");
}

id objc_msgSend_initAudioHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAudioHandling");
}

id objc_msgSend_initBrightnessTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initBrightnessTable:");
}

id objc_msgSend_initDataCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDataCollection");
}

id objc_msgSend_initDecisionTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDecisionTable:");
}

id objc_msgSend_initForFastLoop_noDisplay_powerSaveParams_powerZoneParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:");
}

id objc_msgSend_initForSubkey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForSubkey:");
}

id objc_msgSend_initHIDServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initHIDServices");
}

id objc_msgSend_initLocationStrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initLocationStrings");
}

id objc_msgSend_initPerfStateReportingCPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPerfStateReportingCPU");
}

id objc_msgSend_initPerfStateReportingGPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPerfStateReportingGPU");
}

id objc_msgSend_initPerfStateVoltagesCPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPerfStateVoltagesCPU");
}

id objc_msgSend_initPerfStateVoltagesGPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPerfStateVoltagesGPU");
}

id objc_msgSend_initPowerHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPowerHandling");
}

id objc_msgSend_initPowerTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPowerTable:");
}

id objc_msgSend_initProduct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initProduct:");
}

id objc_msgSend_initRefreshRateTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRefreshRateTable:");
}

id objc_msgSend_initSensorIndexSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSensorIndexSet:");
}

id objc_msgSend_initSensorList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSensorList:");
}

id objc_msgSend_initStockholmHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initStockholmHandling");
}

id objc_msgSend_initWithAFTableColumns_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAFTableColumns:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithComponentControllers_hotspotControllers_decisionTreeTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithComponentControllers:hotspotControllers:decisionTreeTable:");
}

id objc_msgSend_initWithConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfig:");
}

id objc_msgSend_initWithConstantMaxLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConstantMaxLI:");
}

id objc_msgSend_initWithDecisionTreeSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDecisionTreeSection:");
}

id objc_msgSend_initWithDecisionTreeSectionControlEfforts_maxLIs_unconstrainedMaxLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDecisionTreeSectionControlEfforts:maxLIs:unconstrainedMaxLI:");
}

id objc_msgSend_initWithFileName_inDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileName:inDirectory:");
}

id objc_msgSend_initWithFrontCameraSensorIdx_rearCameraSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrontCameraSensorIdx:rearCameraSensorIdx:");
}

id objc_msgSend_initWithIdentifier_forReason_invalidationBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:forReason:invalidationBlock:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLUTColumn_voltage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLUTColumn:voltage:");
}

id objc_msgSend_initWithMitigationType_paramInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMitigationType:paramInfo:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:");
}

id objc_msgSend_initWithParams_backlightController_product_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:backlightController:product:");
}

id objc_msgSend_initWithParams_currentWRa_currentUPOCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:currentWRa:currentUPOCount:");
}

id objc_msgSend_initWithParams_listID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:listID:");
}

id objc_msgSend_initWithParams_listID_needspowerZones_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:listID:needspowerZones:");
}

id objc_msgSend_initWithParams_perfStateVoltages_voltageCount_loopType_persistancePath_filer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:");
}

id objc_msgSend_initWithParams_powerScale_listID_needspowerZones_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:powerScale:listID:needspowerZones:");
}

id objc_msgSend_initWithParams_product_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:product:");
}

id objc_msgSend_initWithParams_sensorList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:sensorList:");
}

id objc_msgSend_initWithProduct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProduct:");
}

id objc_msgSend_initWithRunLoopAndParams_withMitigationType_withParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunLoopAndParams:withMitigationType:withParams:");
}

id objc_msgSend_initWithRunLoopAndParams_withParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunLoopAndParams:withParams:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initializeFilteredAttachedState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeFilteredAttachedState:");
}

id objc_msgSend_initializeLifetimeServoStateAsPersisted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeLifetimeServoStateAsPersisted");
}

id objc_msgSend_initializeRadio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeRadio");
}

id objc_msgSend_initializeReadPrefs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeReadPrefs:");
}

id objc_msgSend_initializeSemanticBrightnessHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeSemanticBrightnessHandling");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAccessoryAttached(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessoryAttached");
}

id objc_msgSend_isBackLightOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackLightOn");
}

id objc_msgSend_isBatterySensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBatterySensor:");
}

id objc_msgSend_isCPMSControlEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCPMSControlEnabled");
}

id objc_msgSend_isCPMSSupportedClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCPMSSupportedClient:");
}

id objc_msgSend_isContextTriggered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContextTriggered");
}

id objc_msgSend_isContextTriggered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContextTriggered:");
}

id objc_msgSend_isEqualMType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualMType:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHotspotFirstEngaged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHotspotFirstEngaged");
}

id objc_msgSend_isIntegratorAtMin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIntegratorAtMin");
}

id objc_msgSend_isKeyboardConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyboardConnected");
}

id objc_msgSend_isPowerSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowerSensor:");
}

id objc_msgSend_isR18xKeyboardAttached(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isR18xKeyboardAttached");
}

id objc_msgSend_isSending2DTempGridToDisplayDriverEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSending2DTempGridToDisplayDriverEnabled");
}

id objc_msgSend_isSendingMaxTempToDisplayDriverEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSendingMaxTempToDisplayDriverEnabled");
}

id objc_msgSend_isSensorDataValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSensorDataValid");
}

id objc_msgSend_isTempSensorDataValid_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTempSensorDataValid:value:");
}

id objc_msgSend_isVirtualTempDispatchEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVirtualTempDispatchEnabled");
}

id objc_msgSend_iterateAndUpdateContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iterateAndUpdateContexts");
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForInUseStatus");
}

id objc_msgSend_keyPathWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathWithKey:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listOfSupervisorControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listOfSupervisorControl");
}

id objc_msgSend_listofComponentControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listofComponentControl");
}

id objc_msgSend_loadProductPowerParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadProductPowerParameters:");
}

id objc_msgSend_loadProductTemperatureParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadProductTemperatureParameters:");
}

id objc_msgSend_localMainRunloop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localMainRunloop");
}

id objc_msgSend_localWakingRegistrationWithIdentifier_contextualPredicate_clientIdentifier_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logHiPSignalsToPowerLog__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHiPSignalsToPowerLog::::");
}

id objc_msgSend_logToPowerlog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logToPowerlog");
}

id objc_msgSend_logToPowerlog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logToPowerlog:");
}

id objc_msgSend_logToPowerlogLite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logToPowerlogLite");
}

id objc_msgSend_logTrapEntryForAC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logTrapEntryForAC:");
}

id objc_msgSend_loopIsActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loopIsActive");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_maxControlEffort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxControlEffort");
}

id objc_msgSend_maxLIForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxLIForComponent:");
}

id objc_msgSend_maxLoadIndexToDVDFactor1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxLoadIndexToDVDFactor1:");
}

id objc_msgSend_migrateDefaultsPlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateDefaultsPlist");
}

id objc_msgSend_mitigationControllerListID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mitigationControllerListID");
}

id objc_msgSend_mitigationDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mitigationDetails");
}

id objc_msgSend_mitigationIndexForBatteryTemperature_stateOfCharge_batteryRaValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mitigationIndexForBatteryTemperature:stateOfCharge:batteryRaValue:");
}

id objc_msgSend_mitigationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mitigationState");
}

id objc_msgSend_mitigationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mitigationType");
}

id objc_msgSend_monitorDisplayOnStateForReason_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorDisplayOnStateForReason:handler:");
}

id objc_msgSend_monitorKeys_forReason_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorKeys:forReason:handler:");
}

id objc_msgSend_monitorNotificationKey_forReason_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorNotificationKey:forReason:queue:handler:");
}

id objc_msgSend_nameofComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameofComponent");
}

id objc_msgSend_newBacklightComponentController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBacklightComponentController:");
}

id objc_msgSend_newChannelForDriver_channelID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newChannelForDriver:channelID:");
}

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationPort");
}

id objc_msgSend_notifyPPMOfMitigationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPPMOfMitigationState:");
}

id objc_msgSend_numberOfFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfFields");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithChar:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_outputForBatteryTemperature_stateOfCharge_batteryRaValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputForBatteryTemperature:stateOfCharge:batteryRaValue:");
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_overrideAFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideAFi:");
}

id objc_msgSend_overrideArcParam_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideArcParam:value:");
}

id objc_msgSend_overrideIS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideIS:");
}

id objc_msgSend_overrideLifetimeServoParam_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideLifetimeServoParam:value:");
}

id objc_msgSend_overrideParam_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideParam:value:");
}

id objc_msgSend_pmuPowerService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pmuPowerService");
}

id objc_msgSend_populateIntArray_params_key_expectedCount_assertArraySorting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateIntArray:params:key:expectedCount:assertArraySorting:");
}

id objc_msgSend_populateTableValues_expectedCount_assertArraySorting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateTableValues:expectedCount:assertArraySorting:");
}

id objc_msgSend_powerIsOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerIsOn");
}

id objc_msgSend_powerSaveActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerSaveActive");
}

id objc_msgSend_powerSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerSensors");
}

id objc_msgSend_powerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerTarget");
}

id objc_msgSend_predicateForChangeAtKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForChangeAtKeyPath:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predictSignal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictSignal");
}

id objc_msgSend_proModeActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proModeActive");
}

id objc_msgSend_probeAllSupervisorControlLoadingIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeAllSupervisorControlLoadingIndex");
}

id objc_msgSend_processPotentialSolarStateChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processPotentialSolarStateChange:");
}

id objc_msgSend_processSleepInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processSleepInterval:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_publishDetailedMitigationArrayToCPMS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishDetailedMitigationArrayToCPMS");
}

id objc_msgSend_queryThermalSensorInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryThermalSensorInfo");
}

id objc_msgSend_readFailuresExpected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFailuresExpected:");
}

id objc_msgSend_readInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readInteger:forKey:");
}

id objc_msgSend_readKeysFromSensorDispatcher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readKeysFromSensorDispatcher");
}

id objc_msgSend_readReleaseRateForAllComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readReleaseRateForAllComponents");
}

id objc_msgSend_rearCameraJasperSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearCameraJasperSensorIdx");
}

id objc_msgSend_rearCameraSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearCameraSensorIdx");
}

id objc_msgSend_rearCameraSuperWideSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearCameraSuperWideSensorIdx");
}

id objc_msgSend_rearCameraTeleSensorIdx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearCameraTeleSensorIdx");
}

id objc_msgSend_refreshCPMSTGraphTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshCPMSTGraphTelemetry");
}

id objc_msgSend_refreshFunctionalTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshFunctionalTelemetry");
}

id objc_msgSend_refreshTGraphTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshTGraphTelemetry");
}

id objc_msgSend_registerCLTMSensorIndex_forSMCKey_atSMCIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCLTMSensorIndex:forSMCKey:atSMCIndex:");
}

id objc_msgSend_registerCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCallback:");
}

id objc_msgSend_registerChargerNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerChargerNotification");
}

id objc_msgSend_registerDefaultsDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaultsDomain");
}

id objc_msgSend_registerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDelegate:");
}

id objc_msgSend_registerDisplayNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDisplayNotification");
}

id objc_msgSend_registerForFolioEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForFolioEvents");
}

id objc_msgSend_registerForKeyboardEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForKeyboardEvents");
}

id objc_msgSend_registerForThermalReport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForThermalReport");
}

id objc_msgSend_registerNotificationBlock_forProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerNotificationBlock:forProperties:");
}

id objc_msgSend_releaseMaxLI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseMaxLI");
}

id objc_msgSend_releaseMaxLIForComponent_releaseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseMaxLIForComponent:releaseRate:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeHotspotTargetOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeHotspotTargetOverrides");
}

id objc_msgSend_removeLightPressureOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLightPressureOverride");
}

id objc_msgSend_removeSessionObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSessionObserver:");
}

id objc_msgSend_requestListID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestListID");
}

id objc_msgSend_resetCPMSMitigationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCPMSMitigationState");
}

id objc_msgSend_resetHIDSensorDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetHIDSensorDictionary");
}

id objc_msgSend_resetTargetTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetTargetTemperature");
}

id objc_msgSend_resetVTFilterState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetVTFilterState");
}

id objc_msgSend_saveLTSStateToNand_dataSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveLTSStateToNand:dataSize:");
}

id objc_msgSend_seedControlEffort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seedControlEffort");
}

id objc_msgSend_send2DGridTempsToDisplayDriver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "send2DGridTempsToDisplayDriver:");
}

id objc_msgSend_sendDataToPMP_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDataToPMP:forKey:");
}

id objc_msgSend_sendLTSStateToPMP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendLTSStateToPMP");
}

id objc_msgSend_sendMaxTempToDisplayDriver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMaxTempToDisplayDriver:");
}

id objc_msgSend_sendRadioNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRadioNotification");
}

id objc_msgSend_sendSensorExchangeDataToSMC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSensorExchangeDataToSMC");
}

id objc_msgSend_sendToService_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendToService:value:");
}

id objc_msgSend_sendVirtualTemp_temperature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendVirtualTemp:temperature:");
}

id objc_msgSend_sensorFourCharCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorFourCharCode");
}

id objc_msgSend_sensorIndexFromList_fourCharCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorIndexFromList:fourCharCode:");
}

id objc_msgSend_setAccConnectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccConnectionInfo:");
}

id objc_msgSend_setAdditionalRadioMitigations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalRadioMitigations");
}

id objc_msgSend_setAllowCEOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowCEOverride:");
}

id objc_msgSend_setAllowLIOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowLIOverride:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAudioIsOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioIsOn:");
}

id objc_msgSend_setBacklightIsOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBacklightIsOn:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBrightnessKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessKey:value:");
}

id objc_msgSend_setBrightnessSystemMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessSystemMonitor:");
}

id objc_msgSend_setCPMSMitigationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPMSMitigationState:");
}

id objc_msgSend_setCPMSMitigationsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPMSMitigationsEnabled:");
}

id objc_msgSend_setCPULowPowerTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPULowPowerTarget:");
}

id objc_msgSend_setCPUPowerCeiling_forDVD1Contributor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPUPowerCeiling:forDVD1Contributor:");
}

id objc_msgSend_setCPUPowerCeiling_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPUPowerCeiling:fromDecisionSource:");
}

id objc_msgSend_setCPUPowerFloor_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPUPowerFloor:fromDecisionSource:");
}

id objc_msgSend_setCPUPowerZoneTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCPUPowerZoneTarget:");
}

id objc_msgSend_setChargerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChargerState:");
}

id objc_msgSend_setComponentThermalStatusLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentThermalStatusLevel:");
}

id objc_msgSend_setConnectedEndpoints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedEndpoints:");
}

id objc_msgSend_setConnectedExternally_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedExternally:");
}

id objc_msgSend_setContextIsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextIsActive:");
}

id objc_msgSend_setControlEffort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlEffort:");
}

id objc_msgSend_setDecisionTableSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDecisionTableSection:");
}

id objc_msgSend_setDockMode_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDockMode:options:error:");
}

id objc_msgSend_setFanRPM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFanRPM:");
}

id objc_msgSend_setFrontIRCameraSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontIRCameraSensorIdx:");
}

id objc_msgSend_setFrontRigelDieSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontRigelDieSensorIdx:");
}

id objc_msgSend_setFrontRomeoNTCSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontRomeoNTCSensorIdx:");
}

id objc_msgSend_setGPUPowerCeiling_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGPUPowerCeiling:fromDecisionSource:");
}

id objc_msgSend_setGPUPowerFloor_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGPUPowerFloor:fromDecisionSource:");
}

id objc_msgSend_setGPUPowerZoneTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGPUPowerZoneTarget:");
}

id objc_msgSend_setHapticThermalGain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHapticThermalGain:error:");
}

id objc_msgSend_setHiPFeatureEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHiPFeatureEnabled:");
}

id objc_msgSend_setInfoOnlySensorsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInfoOnlySensorsActive:");
}

id objc_msgSend_setInitialCPMSBudgetSent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialCPMSBudgetSent:");
}

id objc_msgSend_setIntValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntValue:forKey:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIsBackLightOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsBackLightOn:");
}

id objc_msgSend_setIsCPMSControlActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCPMSControlActive:");
}

id objc_msgSend_setIsCPMSControlEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCPMSControlEnabled:");
}

id objc_msgSend_setLightPressureOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLightPressureOverride:");
}

id objc_msgSend_setMaxCPUPowerTarget_useLegacyPath_setProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxCPUPowerTarget:useLegacyPath:setProperty:");
}

id objc_msgSend_setMaxLICeiling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxLICeiling:");
}

id objc_msgSend_setMaxLICeilingSoft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxLICeilingSoft:");
}

id objc_msgSend_setMaxLoadingIndex_releaseIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxLoadingIndex:releaseIndex:");
}

id objc_msgSend_setMaxPackagePower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxPackagePower:");
}

id objc_msgSend_setMaxTransmitPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxTransmitPower");
}

id objc_msgSend_setMitigationControllerListID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMitigationControllerListID:");
}

id objc_msgSend_setMitigationDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMitigationDetails:");
}

id objc_msgSend_setMitigationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMitigationState:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotificationPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationPort:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPackageLowPowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackageLowPowerTarget");
}

id objc_msgSend_setPackagePowerBudgetDirect_withDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackagePowerBudgetDirect:withDetails:");
}

id objc_msgSend_setPackagePowerCeiling_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackagePowerCeiling:fromDecisionSource:");
}

id objc_msgSend_setPackagePowerFloor_fromDecisionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackagePowerFloor:fromDecisionSource:");
}

id objc_msgSend_setPackagePowerZoneTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackagePowerZoneTarget");
}

id objc_msgSend_setPmuPowerService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPmuPowerService:");
}

id objc_msgSend_setPowerBudget_withDetails_forCPMSClient_atIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerBudget:withDetails:forCPMSClient:atIdx:");
}

id objc_msgSend_setPowerIsOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerIsOn:");
}

id objc_msgSend_setPowerSaveActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerSaveActive:");
}

id objc_msgSend_setPowerTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerTarget:");
}

id objc_msgSend_setProModeActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProModeActive:");
}

id objc_msgSend_setProduct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProduct:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRearCameraJasperSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRearCameraJasperSensorIdx:");
}

id objc_msgSend_setRearCameraSuperWideSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRearCameraSuperWideSensorIdx:");
}

id objc_msgSend_setRearCameraTeleSensorIdx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRearCameraTeleSensorIdx:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setServiceProperty_key_value_scaleToFixedPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceProperty:key:value:scaleToFixedPoint:");
}

id objc_msgSend_setSolarBehaviorSuppressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSolarBehaviorSuppressed:");
}

id objc_msgSend_setSolarDetectorPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSolarDetectorPresent:");
}

id objc_msgSend_setSpeakerThermalGain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpeakerThermalGain:error:");
}

id objc_msgSend_setStockholmFieldDetectInProgressUntilTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStockholmFieldDetectInProgressUntilTime:");
}

id objc_msgSend_setTGraphDataString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTGraphDataString:");
}

id objc_msgSend_setTorchState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTorchState:");
}

id objc_msgSend_setUncapRequestClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUncapRequestClientID:");
}

id objc_msgSend_setUsesPackagePowerControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsesPackagePowerControl:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWakeInProgressUntilTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWakeInProgressUntilTime:");
}

id objc_msgSend_setup2DGridDisplayDriver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup2DGridDisplayDriver");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldDoCPMSActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDoCPMSActions");
}

id objc_msgSend_shouldEnforceLightThermalPressure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldEnforceLightThermalPressure");
}

id objc_msgSend_shouldForceThermalLevelForThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldForceThermalLevelForThreshold:");
}

id objc_msgSend_shouldLogSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLogSensor:");
}

id objc_msgSend_shouldLogSensorForLiteMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLogSensorForLiteMode:");
}

id objc_msgSend_shouldRetrieveSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRetrieveSensor:");
}

id objc_msgSend_shouldSuppressMitigations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSuppressMitigations");
}

id objc_msgSend_shouldSuppressStandardBehaviors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSuppressStandardBehaviors:");
}

id objc_msgSend_simulateLightThermalPressure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simulateLightThermalPressure");
}

id objc_msgSend_solarBehaviorSuppressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "solarBehaviorSuppressed");
}

id objc_msgSend_speakerThermalGain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerThermalGain");
}

id objc_msgSend_staleValueExpected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staleValueExpected:");
}

id objc_msgSend_stockholmFieldDetectInProgressUntilTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stockholmFieldDetectInProgressUntilTime");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_suppressStandardBehaviors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suppressStandardBehaviors");
}

id objc_msgSend_synchContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchContext");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronizeToFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeToFile");
}

id objc_msgSend_synthSensorKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthSensorKeys");
}

id objc_msgSend_takeActionOnUPO_forWRa_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeActionOnUPO:forWRa:");
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetQueue");
}

id objc_msgSend_temperatureForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureForKey:");
}

id objc_msgSend_testLoadingIndexLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testLoadingIndexLevel");
}

id objc_msgSend_thermalPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalPressureLevel");
}

id objc_msgSend_thermalState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalState");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_torchState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "torchState");
}

id objc_msgSend_totalSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalSensors");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update");
}

id objc_msgSend_updateAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAccessories:");
}

id objc_msgSend_updateAllSensorExchangeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAllSensorExchangeData");
}

id objc_msgSend_updateAllThermalLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAllThermalLoad:");
}

id objc_msgSend_updateAppleCareState_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAppleCareState:value:");
}

id objc_msgSend_updateCPMSClientState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCPMSClientState:");
}

id objc_msgSend_updateCPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCPU");
}

id objc_msgSend_updateCloakingState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCloakingState:");
}

id objc_msgSend_updateContextActiveState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContextActiveState");
}

id objc_msgSend_updateContextualClamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContextualClamp");
}

id objc_msgSend_updateControlEffortFor::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateControlEffortFor::");
}

id objc_msgSend_updateCoreAnalyticsInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCoreAnalyticsInfo");
}

id objc_msgSend_updateCurrentSemanticAmbientLightLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCurrentSemanticAmbientLightLevel:");
}

id objc_msgSend_updateDieTempTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDieTempTarget");
}

id objc_msgSend_updateDisplayDriver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDisplayDriver:");
}

id objc_msgSend_updateFolioState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFolioState:");
}

id objc_msgSend_updateForPerfStateResidency_count_tempMax_tempAverage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateForPerfStateResidency:count:tempMax:tempAverage:");
}

id objc_msgSend_updateGPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGPU");
}

id objc_msgSend_updateHotSpotPIDTargetFor::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHotSpotPIDTargetFor::");
}

id objc_msgSend_updateHotSpotTemperatureAndStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHotSpotTemperatureAndStatus:");
}

id objc_msgSend_updateKeyboardState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKeyboardState");
}

id objc_msgSend_updateLifetimeServo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLifetimeServo");
}

id objc_msgSend_updateLiteModePowerLogDictionaryForSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLiteModePowerLogDictionaryForSensors");
}

id objc_msgSend_updateMaxLIFloorsAndCeilings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMaxLIFloorsAndCeilings");
}

id objc_msgSend_updateMaxLIFor::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMaxLIFor::");
}

id objc_msgSend_updateMaxValueToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMaxValueToken:");
}

id objc_msgSend_updateMitigationStateAndNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMitigationStateAndNotify:");
}

id objc_msgSend_updateNotifyTokens(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateNotifyTokens");
}

id objc_msgSend_updateNvramLTSState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateNvramLTSState");
}

id objc_msgSend_updatePackage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePackage");
}

id objc_msgSend_updatePackageFloorsAndCeilings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePackageFloorsAndCeilings:");
}

id objc_msgSend_updatePerfStateReportingCPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePerfStateReportingCPU");
}

id objc_msgSend_updatePerfStateReportingGPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePerfStateReportingGPU");
}

id objc_msgSend_updatePersistedState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePersistedState");
}

id objc_msgSend_updatePowerLogDictionaryForSensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerLogDictionaryForSensors");
}

id objc_msgSend_updatePowerParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerParameters:");
}

id objc_msgSend_updatePowerlogLiteMode_pressureLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerlogLiteMode:pressureLevel:");
}

id objc_msgSend_updatePowerlogMiscState_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerlogMiscState:value:");
}

id objc_msgSend_updatePowerzoneTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerzoneTelemetry");
}

id objc_msgSend_updatePrefs::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePrefs::");
}

id objc_msgSend_updateSensor_temperature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSensor:temperature:");
}

id objc_msgSend_updateSensorExchangeTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSensorExchangeTelemetry");
}

id objc_msgSend_updateSleepTargetFor::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSleepTargetFor::");
}

id objc_msgSend_updateSubkeyController_forControlList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSubkeyController:forControlList:");
}

id objc_msgSend_updateSystemLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSystemLoad:");
}

id objc_msgSend_updateSystemPowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSystemPowerState:");
}

id objc_msgSend_updateTempMax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTempMax:");
}

id objc_msgSend_updateThermalMitigationNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateThermalMitigationNotification:");
}

id objc_msgSend_updateThermalNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateThermalNotification:");
}

id objc_msgSend_updateTrapTargetFor::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTrapTargetFor::");
}

id objc_msgSend_updatetimeToMitigateNotification_AndReasonCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatetimeToMitigateNotification:AndReasonCode:");
}

id objc_msgSend_useTcalAdjust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useTcalAdjust:");
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userContext");
}

id objc_msgSend_usesPackagePowerControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usesPackagePowerControl");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_voltage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voltage");
}

id objc_msgSend_wakeInProgressUntilTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeInProgressUntilTime");
}

id objc_msgSend_writeAllCornerTemperatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeAllCornerTemperatures:");
}

id objc_msgSend_writeInteger_withKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInteger:withKey:");
}

id objc_msgSend_writePersistedStateNvram_dataSize_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePersistedStateNvram:dataSize:path:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}

id objc_msgSend_writeSMCExchangeDataForGroup_withData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSMCExchangeDataForGroup:withData:");
}

id objc_msgSend_writeToDriverService_key_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToDriverService:key:value:");
}

id objc_msgSend_xpcNotifyForMitigationsUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcNotifyForMitigationsUI");
}
