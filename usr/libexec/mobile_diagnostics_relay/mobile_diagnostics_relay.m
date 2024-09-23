void sub_100003BE0(uint64_t a1, __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  const __CFString *v10;
  const __CFString *v11;
  __CFDictionary *v12;
  __CFArray *v13;
  __CFArray *v14;
  __CFDictionary *v15;
  const __CFDictionary *v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v21;
  const void *Value;
  const void *v23;
  const void *v24;
  const void *v25;
  uint64_t v26;
  const __CFDictionary *theDict;
  CFMutableDictionaryRef properties;

  properties = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_100004038((uint64_t)"gather_gas_gauge_info", CFSTR("Could not create empty dictionary"));
    return;
  }
  v4 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Failure"));
  v5 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = v5;
  if (v5)
  {
    CFDictionarySetValue(v5, CFSTR("built-in"), kCFBooleanTrue);
    v7 = IOServiceMatching("IOPMPowerSource");
    v8 = v7;
    if (v7)
    {
      CFDictionarySetValue(v7, CFSTR("IOPropertyMatch"), v6);
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8);
      LODWORD(v8) = MatchingService;
      if (MatchingService)
      {
        if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0))
        {
          theDict = properties;
          v13 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          if (v13)
          {
            v14 = v13;
            CFArrayAppendValue(v13, CFSTR("CycleCount"));
            CFArrayAppendValue(v14, CFSTR("DesignCapacity"));
            CFArrayAppendValue(v14, CFSTR("MaxCapacity"));
            v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v15)
            {
              v16 = v15;
              CFDictionarySetValue(v15, CFSTR("MaxCapacity"), CFSTR("FullChargeCapacity"));
              Count = CFArrayGetCount(v14);
              if (Count >= 1)
              {
                v18 = Count;
                for (i = 0; i != v18; ++i)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
                  if (ValueAtIndex)
                  {
                    v21 = ValueAtIndex;
                    Value = CFDictionaryGetValue(theDict, ValueAtIndex);
                    if (Value)
                    {
                      v23 = Value;
                      v24 = CFDictionaryGetValue(v16, v21);
                      if (v24)
                        v25 = v24;
                      else
                        v25 = v21;
                      CFDictionarySetValue(v4, v25, v23);
                    }
                    else
                    {
                      sub_100004038((uint64_t)"filter_properties", CFSTR("Could not lookup value for %@"), v21, v26);
                    }
                  }
                  else
                  {
                    sub_100004038((uint64_t)"filter_properties", CFSTR("Could not extract key %d of %d"), i, v18);
                  }
                }
              }
              CFRelease(v16);
            }
            else
            {
              sub_100004038((uint64_t)"filter_properties", CFSTR("Could not create empty dictionary for key map"));
            }
            CFRelease(v14);
          }
          else
          {
            sub_100004038((uint64_t)"filter_properties", CFSTR("Could not create empty array for desired keys"));
          }
          CFDictionarySetValue(v4, CFSTR("Status"), CFSTR("Success"));
          v10 = CFSTR("GasGauge");
          v12 = a2;
          v11 = (const __CFString *)v4;
          goto LABEL_12;
        }
        sub_100004038((uint64_t)"gather_gas_gauge_info", CFSTR("Could not create properties\n"));
        v10 = CFSTR("Status");
        v11 = CFSTR("CreatePropertiesFailed");
      }
      else
      {
        sub_100004038((uint64_t)"gather_gas_gauge_info", CFSTR("Could not find the %s service"), "IOPMPowerSource");
        v10 = CFSTR("Status");
        v11 = CFSTR("ServiceLookupFailed");
      }
    }
    else
    {
      sub_100004038((uint64_t)"gather_gas_gauge_info", CFSTR("Could not create matching dictionary"));
      v10 = CFSTR("Status");
      v11 = CFSTR("ServiceMatchingFailed");
    }
    v12 = v4;
LABEL_12:
    CFDictionarySetValue(v12, v10, v11);
    goto LABEL_13;
  }
  sub_100004038((uint64_t)"gather_gas_gauge_info", CFSTR("Could not create service matching properties"));
  LODWORD(v8) = 0;
LABEL_13:
  if (properties)
    CFRelease(properties);
  if ((_DWORD)v8)
    IOObjectRelease((io_object_t)v8);
  if (v6)
    CFRelease(v6);
  CFRelease(v4);
}

void sub_100003F98(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    sub_100004038((uint64_t)"gather_nand_info", CFSTR("Could not gather the NAND information as this function has been deprecated"));
    CFDictionarySetValue(v4, CFSTR("Status"), CFSTR("NANDInfoDeprecated"));
    CFDictionarySetValue(a2, CFSTR("NAND"), v4);
    CFRelease(v4);
  }
  else
  {
    sub_100004038((uint64_t)"gather_nand_info", CFSTR("Could not create dictionary to contain NAND information"));
  }
}

void sub_100004038(uint64_t a1, CFStringRef format, ...)
{
  const __CFString *v3;
  const __CFString *v4;
  char buffer[1024];
  va_list va;

  va_start(va, format);
  v3 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (v3)
  {
    v4 = v3;
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
    CFRelease(v4);
  }
  if (a1)
    syslog(3, "%s: %s");
  else
    syslog(3, "%s");
}

char *sub_100004108(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  char *v4;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v4 = (char *)malloc_type_malloc(v3, 0xABC16384uLL);
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  return v4;
}

void sub_10000417C(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t start()
{
  const __CFString *v0;
  const CFDictionaryKeyCallBacks *v1;
  int v2;
  const __CFDictionary *v3;
  CFTypeID v5;
  CFTypeID TypeID;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  CFMutableDictionaryRef v9;
  CFMutableDictionaryRef v10;
  const __CFString *Value;
  const __CFString *v12;
  char *v13;
  char *v14;
  int v15;
  const __CFData *Data;
  const __CFData *v17;
  const CFDictionaryKeyCallBacks *v18;
  const __CFString *v19;
  unint64_t Length;
  const UInt8 *BytePtr;
  unint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const void *v32;
  __CFDictionary *v33;
  __CFDictionary *v34;
  int v35;
  CFNumberRef v36;
  CFNumberRef v37;
  int v39;
  __CFDictionary *v40;
  pthread_t valuePtr;
  CFTypeRef cf;
  uint64_t v43;

  v43 = 0;
  openlog("mobile_diagnostics_relay", 1, 24);
  if (secure_lockdown_checkin(&v43, 0, 0) || !v43)
  {
    sub_100004038((uint64_t)"main", CFSTR("Could not checkin with lockdown."));
    return 0;
  }
  v0 = CFSTR("Received request.");
  v1 = &kCFTypeDictionaryKeyCallBacks;
  while (1)
  {
    cf = 0;
    v2 = lockdown_receive_message(v43, &cf);
    v3 = (const __CFDictionary *)cf;
    if (v2 || cf == 0)
      break;
    v5 = CFGetTypeID(cf);
    TypeID = CFDictionaryGetTypeID();
    v3 = (const __CFDictionary *)cf;
    if (v5 != TypeID)
      break;
    sub_100004038((uint64_t)"main", v0);
    Mutable = CFDictionaryCreateMutable(0, 0, v1, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v8 = Mutable;
      v9 = CFDictionaryCreateMutable(0, 0, v1, &kCFTypeDictionaryValueCallBacks);
      if (!v9)
      {
        sub_100004038((uint64_t)"main", CFSTR("Could not create empty diagnostics dictionary."));
        v15 = 1;
        goto LABEL_38;
      }
      v10 = v9;
      CFDictionarySetValue(v8, CFSTR("Status"), CFSTR("Success"));
      Value = (const __CFString *)CFDictionaryGetValue(v3, CFSTR("Request"));
      if (Value)
      {
        v12 = Value;
        v13 = sub_100004108(Value);
        if (v13)
        {
          v14 = v13;
          sub_100004038((uint64_t)"main", CFSTR("Request Key received: %s"), v13);
          free(v14);
        }
        if (CFEqual(v12, CFSTR("Goodbye")))
        {
          v15 = 1;
LABEL_27:
          if (CFDictionaryGetCount(v10))
            CFDictionarySetValue(v8, CFSTR("Diagnostics"), v10);
          Data = CFPropertyListCreateData(kCFAllocatorDefault, v8, kCFPropertyListXMLFormat_v1_0, 0, 0);
          if (Data)
          {
            v17 = Data;
            v40 = v10;
            v18 = v1;
            v19 = v0;
            Length = CFDataGetLength(Data);
            BytePtr = CFDataGetBytePtr(v17);
            LODWORD(valuePtr) = bswap32(Length);
            if (lockdown_send(v43, &valuePtr, 4) != 4)
              sub_100004038((uint64_t)"main", CFSTR("Could not send message size %d."), Length);
            if (Length)
            {
              v22 = 0;
              do
              {
                v23 = lockdown_send(v43, BytePtr, Length - v22);
                v22 += v23;
                BytePtr += v23;
              }
              while (v22 < Length);
            }
            CFRelease(v17);
            v0 = v19;
            v1 = v18;
            v10 = v40;
          }
          else
          {
            sub_100004038((uint64_t)"main", CFSTR("Could not create CFData."));
            v15 = 1;
          }
          CFRelease(v10);
          if (!v8)
            goto LABEL_39;
LABEL_38:
          CFRelease(v8);
          goto LABEL_39;
        }
        if (CFEqual(v12, CFSTR("All")))
        {
          sub_100003BE0((uint64_t)v3, v10);
          sub_100003F98((uint64_t)v3, v10);
          sub_100006268((uint64_t)v3, v10);
          goto LABEL_21;
        }
        if (CFEqual(v12, CFSTR("GasGauge")))
        {
          sub_100003BE0((uint64_t)v3, v10);
          goto LABEL_26;
        }
        if (CFEqual(v12, CFSTR("WiFi")))
        {
          sub_100006268((uint64_t)v3, v10);
          goto LABEL_26;
        }
        if (!CFEqual(v12, CFSTR("HDMI")))
        {
          if (!CFEqual(v12, CFSTR("Shutdown")) && !CFEqual(v12, CFSTR("Restart")))
          {
            if (CFEqual(v12, CFSTR("Sleep")))
            {
              LODWORD(valuePtr) = 0;
              LODWORD(valuePtr) = sub_100004BEC();
              if ((_DWORD)valuePtr)
              {
                CFDictionarySetValue(v8, CFSTR("Status"), CFSTR("Failure"));
                v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(v8, CFSTR("ErrorCode"), v36);
                CFRelease(v36);
              }
            }
            else if (CFEqual(v12, CFSTR("MobileGestalt")))
            {
              sub_100005078(v3, v10);
            }
            else
            {
              if (!CFEqual(v12, CFSTR("NAND")))
              {
                if (CFEqual(v12, CFSTR("IORegistry")))
                {
                  sub_1000052E8(v3, v10);
                  v15 = 0;
                }
                else
                {
                  if (CFEqual(v12, CFSTR("Obliterate")))
                  {
                    LODWORD(valuePtr) = 0;
                    LODWORD(valuePtr) = sub_100006308(v3);
                    if ((_DWORD)valuePtr)
                    {
                      CFDictionarySetValue(v8, CFSTR("Status"), CFSTR("Failure"));
                      v37 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
                      CFDictionarySetValue(v8, CFSTR("ErrorCode"), v37);
                      CFRelease(v37);
                    }
                  }
                  else
                  {
                    CFDictionarySetValue(v8, CFSTR("Status"), CFSTR("UnknownRequest"));
                  }
                  v15 = 0;
                }
                goto LABEL_27;
              }
              sub_100003F98((uint64_t)v3, v10);
            }
            goto LABEL_26;
          }
          v39 = CFEqual(v12, CFSTR("Shutdown"));
          syslog(7, "sending response early");
          v24 = lockdown_send_message(v43, v8, 100);
          syslog(7, "lockdown_send_message returned %d", v24);
          CFRelease(v8);
          syslog(7, "waiting for goodbye request");
          v25 = lockdown_receive_message(v43, &cf);
          syslog(7, "lockdown_receive_message returned %d", v25);
          if (!v25 && cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          syslog(7, "sending goodbye reply");
          v26 = CFDictionaryCreateMutable(0, 0, v1, &kCFTypeDictionaryValueCallBacks);
          if (v26)
          {
            v27 = v26;
            CFDictionarySetValue(v26, CFSTR("Status"), CFSTR("Success"));
            v28 = lockdown_send_message(v43, v27, 100);
            syslog(7, "lockdown_send_message returned %d", v28);
            CFRelease(v27);
          }
          else
          {
            syslog(7, "cannot create goodbye reply dictionary");
          }
          if (CFDictionaryGetValue(v3, CFSTR("WaitForDisconnect")))
          {
            if (CFDictionaryGetValue(v3, CFSTR("DisplayPass")))
            {
              if (v39)
                v29 = CFSTR("Shutdown/关机");
              else
                v29 = CFSTR("Restart/重新启动");
              if (v39)
                v30 = CFSTR("Please disconnect the USB cable in order to shutdown your device.\n\n请拔出USB线以关机");
              else
                v30 = CFSTR("Please disconnect the USB cable in order to restart your device.\n\n请拔出USB线以重新启动");
              v31 = CFSTR("*** OK / 通过 ***");
              goto LABEL_69;
            }
            v32 = CFDictionaryGetValue(v3, CFSTR("DisplayFail"));
            if (v39)
              v29 = CFSTR("Shutdown/关机");
            else
              v29 = CFSTR("Restart/重新启动");
            if (v39)
              v30 = CFSTR("Please disconnect the USB cable in order to shutdown your device.\n\n请拔出USB线以关机");
            else
              v30 = CFSTR("Please disconnect the USB cable in order to restart your device.\n\n请拔出USB线以重新启动");
            if (v32)
            {
              v31 = CFSTR("--- FAIL / 失败 ---");
LABEL_69:
              syslog(7, "preparing CFUserNotification");
              v33 = CFDictionaryCreateMutable(0, 0, v1, &kCFTypeDictionaryValueCallBacks);
              if (v33)
              {
                v34 = v33;
                CFDictionarySetValue(v33, kCFUserNotificationAlertHeaderKey, v31);
                CFDictionarySetValue(v34, kCFUserNotificationAlertMessageKey, v30);
                CFDictionarySetValue(v34, kCFUserNotificationDefaultButtonTitleKey, v29);
                CFDictionarySetValue(v34, CFSTR("SBUserNotificationDontDismissOnUnlock"), kCFBooleanTrue);
                CFDictionarySetValue(v34, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
                CFDictionarySetValue(v34, CFSTR("Request"), v12);
                valuePtr = 0;
                pthread_create(&valuePtr, 0, (void *(__cdecl *)(void *))sub_100004A5C, v34);
              }
            }
            syslog(7, "waiting until disconnect");
            valuePtr = 0;
            v35 = lockdown_recv(v43, &valuePtr, 8);
            syslog(7, "lockdown_recv returned %d", v35);
          }
          if (v39)
            sub_100004FCC();
          else
            sub_100004C90();
          v8 = 0;
          goto LABEL_26;
        }
LABEL_21:
        sub_100006584((uint64_t)v3, v10);
      }
      else
      {
        sub_100004038((uint64_t)"main", CFSTR("The message did not contain a request element."));
        CFDictionarySetValue(v8, CFSTR("Status"), CFSTR("InvalidRequest"));
      }
LABEL_26:
      v15 = 0;
      goto LABEL_27;
    }
    sub_100004038((uint64_t)"main", CFSTR("Could not create empty response."));
    v15 = 1;
LABEL_39:
    if (v3)
      CFRelease(v3);
    if (v15)
      goto LABEL_94;
  }
  if (v3)
    CFRelease(v3);
  sub_100004038((uint64_t)"main", CFSTR("Could not receive message from client."));
LABEL_94:
  lockdown_disconnect(v43);
  return 0;
}

uint64_t sub_100004A5C(const __CFDictionary *a1)
{
  const void *Value;
  int v3;
  __CFUserNotification *v4;
  uint64_t (*v5)();
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  SInt32 error;

  syslog(7, "entering cfUserNotificationThread");
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, CFSTR("Request"));
    if (Value
      && (v3 = CFEqual(Value, CFSTR("Shutdown")),
          error = 0,
          v4 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, a1),
          syslog(7, "creating notification returned %d", error),
          v4)
      && (v3 ? (v5 = sub_100004BAC) : (v5 = sub_100004BCC),
          RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v4, (CFUserNotificationCallBack)v5, 0), CFRelease(v4), RunLoopSource))
    {
      syslog(7, "about to put up CFUserNotification now");
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
      CFRelease(a1);
      syslog(7, "running runloop");
      CFRunLoopRun();
      syslog(7, "exiting cfUserNotificationThread");
    }
    else
    {
      CFRelease(a1);
    }
  }
  return 0;
}

uint64_t sub_100004BAC()
{
  syslog(7, "CFUserNotificationCallback for SHUTDOWN was called");
  return sub_100004FCC();
}

uint64_t sub_100004BCC()
{
  syslog(7, "CFUserNotificationCallback for REBOOT was called");
  return sub_100004C90();
}

uint64_t sub_100004BEC()
{
  uint64_t v0;
  io_connect_t v2;
  mach_port_t mainPort;

  mainPort = 0;
  v0 = IOMasterPort(bootstrap_port, &mainPort);
  if (!(_DWORD)v0)
  {
    v2 = IOPMFindPowerManagement(mainPort);
    if (v2)
    {
      v0 = IOPMSleepSystem(v2);
      if ((_DWORD)v0)
        fprintf(__stderrp, "sleep failed (0x%08x)\n", v0);
    }
    else
    {
      v0 = 3758097136;
      fprintf(__stderrp, "sleep failed - cannot find power management (0x%08x)\n", -536870160);
    }
  }
  return v0;
}

uint64_t sub_100004C90()
{
  int v0;
  const char *v2[2];

  if (!access("/sbin/reboot", 0))
  {
    v2[0] = "/sbin/reboot";
    v2[1] = 0;
    v0 = sub_100004D3C(v2);
    if (!v0)
      return 0;
LABEL_5:
    fprintf(__stderrp, "unable to restart, error code: %d - exiting\n", v0);
    exit(1);
  }
  v0 = reboot3(0);
  if (v0)
    goto LABEL_5;
  return 0;
}

uint64_t sub_100004D3C(const char **a1)
{
  pid_t v2;
  pid_t v3;
  FILE *v4;
  const char *v5;
  int *v6;
  char *v7;
  FILE *v8;
  const char *v9;
  int *v10;
  char *v11;
  FILE *v12;
  const char *v13;
  int *v14;
  char *v15;
  uint64_t v16;
  int v18;
  ssize_t v19;
  FILE *v20;
  const char *v21;
  int *v22;
  char *v23;
  int v24;
  char v25[8];

  fprintf(__stderrp, "executing %s\n", *a1);
  if (pipe((int *)v25) != -1)
  {
    v2 = fork();
    if (v2 == -1)
    {
      v12 = __stderrp;
      v13 = *a1;
      v14 = __error();
      v15 = strerror(*v14);
      fprintf(v12, "fork %s failed: %s\n", v13, v15);
      close(*(int *)v25);
LABEL_11:
      close(*(int *)&v25[4]);
      return 0xFFFFFFFFLL;
    }
    v3 = v2;
    if (!v2)
    {
      if (dup2(*(int *)&v25[4], 1) == -1)
        goto LABEL_8;
      if (dup2(*(int *)&v25[4], 2) == -1)
        _exit(2);
      close(*(int *)v25);
      if (execv(*a1, (char *const *)a1) == -1)
      {
        v4 = __stderrp;
        v5 = *a1;
        v6 = __error();
        v7 = strerror(*v6);
        fprintf(v4, "execv: %s: %s", v5, v7);
LABEL_8:
        _exit(1);
      }
      goto LABEL_11;
    }
    v18 = *(_DWORD *)v25;
    close(*(int *)&v25[4]);
    if (v18 == -1)
      return 0xFFFFFFFFLL;
    v19 = read(v18, v25, 0x3FFuLL);
    if (v19 >= 1)
    {
      do
      {
        v25[v19] = 0;
        fputs(v25, __stderrp);
        v19 = read(v18, v25, 0x3FFuLL);
      }
      while (v19 > 0);
    }
    v24 = 0;
    if (waitpid(v3, &v24, 0) != -1)
    {
      if ((v24 & 0x7F) == 0x7F)
      {
        fprintf(__stderrp, "%s was stopped by signal %d\n");
      }
      else
      {
        if ((v24 & 0x7F) == 0)
        {
          v16 = BYTE1(v24);
LABEL_25:
          close(v18);
          return v16;
        }
        fprintf(__stderrp, "%s was terminated by signal %d\n");
      }
      v16 = 0xFFFFFFFFLL;
      goto LABEL_25;
    }
    v16 = *__error();
    v20 = __stderrp;
    v21 = *a1;
    v22 = __error();
    v23 = strerror(*v22);
    fprintf(v20, "waitpid failed for %s: %s\n", v21, v23);
    goto LABEL_25;
  }
  v8 = __stderrp;
  v9 = *a1;
  v10 = __error();
  v11 = strerror(*v10);
  fprintf(v8, "pipe failed while preparing to execute %s: %s\n", v9, v11);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004FCC()
{
  int v0;
  __int128 v2;

  if (!access("/sbin/halt", 0))
  {
    v2 = off_1000083B0;
    v0 = sub_100004D3C((const char **)&v2);
    if (!v0)
      return 0;
LABEL_5:
    fprintf(__stderrp, "unable to shutdown, return code:%d - exiting\n", v0);
    exit(1);
  }
  v0 = reboot3(8);
  if (v0)
    goto LABEL_5;
  return 0;
}

void sub_100005078(const __CFDictionary *a1, __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void *Value;
  const void *v7;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v10;
  const void *ValueAtIndex;
  CFTypeID v12;
  CFIndex v13;
  const void *v14;
  CFTypeID v15;
  const __CFString *v16;
  uint64_t v17;
  const void *v18;
  CFTypeID v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v5 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Success"));
    if (!a2)
    {
LABEL_18:
      CFDictionarySetValue(a2, CFSTR("MobileGestalt"), v5);
      CFRelease(v5);
      return;
    }
    if (!a1)
      goto LABEL_16;
    Value = CFDictionaryGetValue(a1, CFSTR("MobileGestaltKeys"));
    if (!Value)
    {
      sub_100004038((uint64_t)"gather_mobile_gestalt_info", CFSTR("Did not find any keys to lookup"));
      goto LABEL_16;
    }
    v7 = Value;
    TypeID = CFArrayGetTypeID();
    if (TypeID != CFGetTypeID(v7))
    {
      sub_100004038((uint64_t)"gather_mobile_gestalt_info", CFSTR("Keys passed in are not an array"));
      goto LABEL_16;
    }
    Count = CFArrayGetCount((CFArrayRef)v7);
    if (Count >= 1)
    {
      v10 = Count;
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
      v12 = CFStringGetTypeID();
      if (v12 != CFGetTypeID(ValueAtIndex))
      {
LABEL_12:
        sub_100004038((uint64_t)"gather_mobile_gestalt_info", CFSTR("Keys passed in are not all strings"));
        goto LABEL_16;
      }
      v13 = 1;
      while (v10 != v13)
      {
        v14 = CFArrayGetValueAtIndex((CFArrayRef)v7, v13);
        v15 = CFStringGetTypeID();
        ++v13;
        if (v15 != CFGetTypeID(v14))
        {
          if (v13 - 1 >= v10)
            break;
          goto LABEL_12;
        }
      }
    }
    v17 = MGCopyAnswer(CFSTR("InternalBuild"), 0);
    if (!v17
      || (v18 = (const void *)v17, v19 = CFBooleanGetTypeID(), v19 != CFGetTypeID(v18))
      || !CFBooleanGetValue((CFBooleanRef)v18))
    {
      sub_100004038((uint64_t)"gather_mobile_gestalt_info", CFSTR("MobileGestalt query function has been deprecated"));
      v16 = CFSTR("MobileGestaltDeprecated");
      goto LABEL_17;
    }
    CFRelease(v18);
    v20 = (const __CFDictionary *)MGCopyMultipleAnswers(v7, 0);
    if (v20)
    {
      v21 = v20;
      CFDictionaryApplyFunction(v20, (CFDictionaryApplierFunction)sub_1000052D4, v5);
      CFRelease(v21);
      goto LABEL_18;
    }
    sub_100004038((uint64_t)"gather_mobile_gestalt_info", CFSTR("MobileGestalt didn't return anything"));
LABEL_16:
    v16 = CFSTR("MobileGestaltFailed");
LABEL_17:
    CFDictionarySetValue(v5, CFSTR("Status"), v16);
    goto LABEL_18;
  }
}

void sub_1000052D4(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

void sub_1000052E8(const __CFDictionary *a1, __CFDictionary *a2)
{
  uint64_t RootEntry;
  uint64_t v5;
  const __CFString *Value;
  const __CFString *v7;
  const __CFString *v8;
  __CFDictionary *v9;
  int v10;
  __CFDictionary *v11;
  mach_port_t mainPort;
  char buffer[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  mainPort = 0;
  if (!a1)
  {
    sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("Request message is not valid."));
    return;
  }
  if (!a2)
  {
    sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("%s, Bad parameter."), "gather_ioreg_info");
    return;
  }
  if (IOMasterPort(bootstrap_port, &mainPort))
    sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("can't obtain I/O Kit's master port"));
  RootEntry = IORegistryGetRootEntry(mainPort);
  if ((_DWORD)RootEntry)
  {
    v5 = RootEntry;
    Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("CurrentPlane"));
    v7 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("EntryName"));
    v8 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("EntryClass"));
    if (Value)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      *(_OWORD *)buffer = 0u;
      v14 = 0u;
      if (!CFStringGetCString(Value, buffer, 128, 0x8000100u))
      {
        sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("Can't convert plane name to io_name_t"));
        goto LABEL_21;
      }
      sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("IOReg query plane %s"), buffer);
      v9 = sub_10000551C(v5, buffer);
    }
    else
    {
      if (v7)
      {
        v8 = v7;
        v10 = 0;
      }
      else
      {
        if (!v8)
          goto LABEL_21;
        v10 = 1;
      }
      v9 = sub_100005A50(v8, v10);
    }
    v11 = v9;
    if (v9)
    {
      CFDictionarySetValue(a2, CFSTR("IORegistry"), v9);
      CFRelease(v11);
LABEL_22:
      IOObjectRelease(v5);
      return;
    }
LABEL_21:
    sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("Can't create ioreg dict."));
    goto LABEL_22;
  }
  sub_100004038((uint64_t)"gather_ioreg_info", CFSTR("Can't get root entry."));
}

__CFDictionary *sub_10000551C(uint64_t a1, const char *a2)
{
  __CFDictionary *Mutable;
  __CFArray *v5;
  uint64_t NameInPlane;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t Class;
  char *v10;
  CFStringRef v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *Copy;
  const __CFString *v16;
  CFStringRef v17;
  char *v18;
  char *v19;
  uint64_t State;
  const char *v21;
  const char *v22;
  const char *v23;
  int v24;
  uint64_t v25;
  uint32_t RetainCount;
  CFStringRef v27;
  CFStringRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  uint64_t ChildIterator;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  io_iterator_t iterator;
  uint64_t v36;
  uint32_t busyState;
  io_registry_entry_t valuePtr;
  io_name_t className;
  char name[136];

  busyState = 0;
  valuePtr = a1;
  memset(name, 0, 128);
  memset(className, 0, sizeof(className));
  v36 = 0;
  iterator = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  NameInPlane = IORegistryEntryGetNameInPlane(a1, a2, name);
  if ((_DWORD)NameInPlane)
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("IORegistryEntryGetNameInPlane has failed with error %d."), NameInPlane);
    goto LABEL_8;
  }
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (v7)
  {
    v8 = v7;
    CFDictionarySetValue(Mutable, CFSTR("name"), v7);
    CFRelease(v8);
  }
  else
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Can't create CFString for entry name."));
  }
  Class = IOObjectGetClass(a1, className);
  if ((_DWORD)Class)
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("IOObjectGetClass has failed with error %d."), Class);
    goto LABEL_8;
  }
  v12 = CFStringCreateWithCString(kCFAllocatorDefault, className, 0x8000100u);
  if (v12)
  {
    v13 = v12;
    CFDictionarySetValue(Mutable, CFSTR("className"), v12);
    v14 = CFStringCreateMutable(kCFAllocatorDefault, 512);
    Copy = CFStringCreateCopy(0, v13);
    CFStringInsert(v14, 0, Copy);
    v16 = IOObjectCopySuperclassForClass(Copy);
    CFRelease(Copy);
    if (v16)
    {
      do
      {
        CFStringInsert(v14, 0, CFSTR(" : "));
        CFStringInsert(v14, 0, v16);
        v17 = IOObjectCopySuperclassForClass(v16);
        CFRelease(v16);
        v16 = v17;
      }
      while (v17);
    }
    CFRelease(v13);
    if (v14)
    {
      CFDictionarySetValue(Mutable, CFSTR("inheritance"), v14);
      CFRelease(v14);
    }
    else
    {
      sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Can't create inheritance string."));
    }
  }
  else
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Can't create CFString for className."));
  }
  v18 = (char *)malloc_type_malloc(0xC800uLL, 0x6F3783B8uLL);
  v10 = v18;
  if (!v18)
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Failed to get space for state string."));
    goto LABEL_25;
  }
  *v18 = 0;
  v19 = v18;
  if (!IOObjectConformsTo(a1, "IOService"))
  {
LABEL_38:
    RetainCount = IOObjectGetRetainCount(a1);
    sprintf(v19, "retain %d", RetainCount);
    v27 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
    if (v27)
    {
      v28 = v27;
      CFDictionarySetValue(Mutable, CFSTR("state"), v27);
      CFRelease(v28);
    }
    else
    {
      sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Can't create CFString for state."));
    }
    free(v10);
    v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v29)
    {
      v30 = v29;
      CFDictionarySetValue(Mutable, CFSTR("regEntry"), v29);
      CFRelease(v30);
    }
    else
    {
      sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("Can't create CFNumber for regEntry"));
    }
    ChildIterator = IORegistryEntryGetChildIterator(valuePtr, a2, &iterator);
    if ((_DWORD)ChildIterator)
    {
      sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("IORegistryEntryGetChildIterator has failed with error %d."), ChildIterator);
    }
    else
    {
      v32 = IOIteratorNext(iterator);
      if ((_DWORD)v32)
      {
        v33 = v32;
        do
        {
          v34 = (const void *)sub_10000551C(v33, a2);
          CFArrayAppendValue(v5, v34);
          IOObjectRelease(v33);
          v33 = IOIteratorNext(iterator);
        }
        while ((_DWORD)v33);
      }
      IOObjectRelease(iterator);
      if (CFArrayGetCount(v5))
        CFDictionarySetValue(Mutable, CFSTR("children"), v5);
    }
LABEL_8:
    v10 = 0;
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  State = IOServiceGetState(a1, &v36);
  if ((_DWORD)State)
  {
    sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("IOServiceGetState has failed with error %d."), State);
    goto LABEL_25;
  }
  v21 = "!";
  if ((v36 & 2) != 0)
    v22 = (const char *)&unk_1000078B3;
  else
    v22 = "!";
  if ((v36 & 4) != 0)
    v21 = (const char *)&unk_1000078B3;
  if ((v36 & 1) != 0)
    v23 = "in";
  else
    v23 = (const char *)&unk_1000078B3;
  v24 = __sprintf_chk(v10, 0, 0xC800uLL, "%sregistered, %smatched, %sactive, ", v22, v21, v23);
  v25 = IOServiceGetBusyState(a1, &busyState);
  if (!(_DWORD)v25)
  {
    v19 = &v10[v24 + sprintf(&v10[v24], "busy %d, ", busyState)];
    goto LABEL_38;
  }
  sub_100004038((uint64_t)"create_ioreg_dict", CFSTR("IOServiceGetBusyState has failed with error %d."), v25);
LABEL_25:
  if (v5)
LABEL_9:
    CFRelease(v5);
LABEL_10:
  if (v10)
    free(v10);
  return Mutable;
}

CFMutableDictionaryRef sub_100005A50(const __CFString *a1, int a2)
{
  char *v4;
  const __CFDictionary *v5;
  CFMutableDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  CFMutableDictionaryRef properties;

  v4 = (char *)malloc_type_malloc(0x80uLL, 0x9194D540uLL);
  properties = 0;
  CFStringGetCString(a1, v4, 128, 0x8000100u);
  if (v4)
  {
    if (a2)
    {
      sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("IOReg query class %s"), v4);
      v5 = IOServiceMatching(v4);
    }
    else
    {
      sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("IOReg query entry %s"), v4);
      v5 = IOServiceNameMatching(v4);
    }
    if (v5)
    {
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
      if (MatchingService)
      {
        v8 = MatchingService;
        if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0))
          sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("Could not create property."));
        IOObjectRelease(v8);
        v6 = properties;
        goto LABEL_14;
      }
      sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("Could not get service."));
    }
    else
    {
      sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("Could not get name matching dictionary."));
    }
    v6 = 0;
LABEL_14:
    free(v4);
    return v6;
  }
  sub_100004038((uint64_t)"copy_prop_matches_name", CFSTR("Could not get ioreg entry name."));
  return 0;
}

void sub_100005BB0(const __CFDictionary *a1)
{
  _QWORD v1[3];

  v1[0] = 0;
  v1[1] = "\t";
  v1[2] = __stderrp;
  sub_100005C78(a1, v1);
}

void sub_100005BEC(const __CFDictionary *a1, uint64_t a2)
{
  _QWORD v2[3];

  v2[0] = 0;
  v2[1] = "\t";
  v2[2] = a2;
  sub_100005C78(a1, v2);
}

void sub_100005C1C(const __CFDictionary *a1, uint64_t a2)
{
  _QWORD v2[3];

  v2[1] = a2;
  v2[2] = __stderrp;
  v2[0] = 0;
  sub_100005C78(a1, v2);
}

void sub_100005C50(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[3];

  v3[1] = a3;
  v3[2] = a2;
  v3[0] = 0;
  sub_100005C78(a1, v3);
}

void sub_100005C78(const __CFDictionary *a1, void *a2)
{
  const __CFDictionary *v3;
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID v6;
  CFTypeID v7;
  CFRange v8;

  if (a1)
  {
    v3 = a1;
    v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_100005DD4, a2);
      return;
    }
    v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v8.length = CFArrayGetCount(v3);
      v8.location = 0;
      CFArrayApplyFunction(v3, v8, (CFArrayApplierFunction)sub_100005E28, a2);
      return;
    }
    v6 = CFGetTypeID(v3);
    if (v6 == CFTreeGetTypeID())
    {
      sub_100005EB8(v3, (uint64_t)a2);
      return;
    }
    v7 = CFGetTypeID(v3);
    if (v7 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_100005F30, a2);
      return;
    }
    a1 = v3;
  }
  sub_100005D90(a1, (uint64_t)a2);
}

void sub_100005D90(const void *a1, uint64_t a2)
{
  char *v3;

  v3 = (char *)sub_100005F44(a1);
  sub_1000060C0(v3, 0, a2);
  if (v3)
    free(v3);
}

void sub_100005DD4(const void *a1, const void *a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)sub_100005F44(a1);
  sub_1000060C0(v5, a2, a3);
  if (v5)
    free(v5);
}

void sub_100005E28(const void *a1, uint64_t a2)
{
  int v4;
  char __str[256];

  v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_1000060C0(__str, a1, a2);
}

void sub_100005EB8(__CFTree *a1, uint64_t a2)
{
  int v4;
  _DWORD v5[2];
  __int128 v6;
  CFTreeContext context;

  memset(&context, 0, sizeof(context));
  v4 = *(_DWORD *)a2 + 1;
  v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_1000060C0((char *)&unk_1000078B3, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_100005EB8, v5);
}

void sub_100005F30(const void *a1, uint64_t a2)
{
  sub_1000060C0((char *)&unk_1000078B3, a1, a2);
}

_WORD *sub_100005F44(const void *a1)
{
  CFTypeID TypeID;
  CFIndex v3;
  const UInt8 *BytePtr;
  size_t v5;
  char *v6;
  _WORD *v7;
  _WORD *v8;
  int v9;
  CFStringRef v10;
  BOOL v11;
  const __CFString *v12;
  CFIndex Length;
  CFIndex v14;
  char __str[3];

  if (a1
    && (TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1))
    && (v3 = CFDataGetLength((CFDataRef)a1),
        BytePtr = CFDataGetBytePtr((CFDataRef)a1),
        v5 = 2 * (int)v3 + 3,
        (v6 = (char *)malloc_type_malloc(v5, 0xF2CFBC54uLL)) != 0))
  {
    v7 = v6;
    strlcpy(v6, "0x", v5);
    v8 = v7 + 1;
    if (v3 >= 1)
    {
      do
      {
        v9 = *BytePtr++;
        snprintf(__str, 3uLL, "%02hX", v9);
        *v8++ = *(_WORD *)__str;
        --v3;
      }
      while (v3);
    }
    *(_BYTE *)v8 = 0;
  }
  else
  {
    v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), a1);
    if (v10)
      v11 = 1;
    else
      v11 = a1 == 0;
    if (v11)
      v12 = v10;
    else
      v12 = CFSTR("<error getting string representation>");
    Length = CFStringGetLength(v12);
    v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v7 = malloc_type_malloc(v14, 0x61CBD066uLL);
    if (v7 && !CFStringGetCString(v12, (char *)v7, v14, 0x8000100u))
    {
      free(v7);
      v7 = 0;
    }
    if (v12)
      CFRelease(v12);
  }
  return v7;
}

void sub_1000060C0(char *a1, const void *a2, uint64_t a3)
{
  int v6;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  char *v11;
  FILE *v12;
  _DWORD v13[2];
  __int128 v14;

  if (*(int *)a3 >= 1)
  {
    v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }
    while (v6 < *(_DWORD *)a3);
  }
  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1)
      fputc(58, *(FILE **)(a3 + 16));
    v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v13[0] = *(_DWORD *)a3 + 1;
      v13[1] = 0;
      v14 = *(_OWORD *)(a3 + 8);
      sub_100005C78(a2, v13);
    }
    else
    {
      v11 = (char *)sub_100005F44(a2);
      if (a1 && *a1)
        fputc(32, *(FILE **)(a3 + 16));
      v12 = *(FILE **)(a3 + 16);
      if (v11)
      {
        fprintf(v12, "%s\n", v11);
        free(v11);
      }
      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v12);
      }
    }
  }
  else
  {
    fputc(10, *(FILE **)(a3 + 16));
  }
}

void sub_100006268(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    sub_100004038((uint64_t)"gather_wifi_info", CFSTR("Could not gather the Wifi information as this function has been deprecated"));
    CFDictionarySetValue(v4, CFSTR("Status"), CFSTR("WifiInfoDeprecated"));
    CFDictionarySetValue(a2, CFSTR("WiFi"), v4);
    CFRelease(v4);
  }
  else
  {
    sub_100004038((uint64_t)"gather_wifi_info", CFSTR("Could not create empty dictionary"));
  }
}

uint64_t sub_100006308(const __CFDictionary *a1)
{
  uint64_t v2;
  const void *v3;
  CFTypeID TypeID;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  const void *Value;
  uint64_t v8;
  CFTypeID v10;
  const void **v11;
  CFNumberRef v12;
  uint64_t v13;
  uint64_t v14;
  int valuePtr;

  v2 = MGCopyAnswer(CFSTR("InternalBuild"), 0);
  if (!v2)
  {
    sub_100004038((uint64_t)"do_obliterate", CFSTR("obliteration denied: not running internal build."));
    return 1;
  }
  v3 = (const void *)v2;
  TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v3) && CFBooleanGetValue((CFBooleanRef)v3))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v6 = Mutable;
      if (a1)
      {
        Value = CFDictionaryGetValue(a1, CFSTR("DataPartitionOnly"));
        if (!Value)
          goto LABEL_18;
      }
      else
      {
        Value = kCFBooleanFalse;
        if (!kCFBooleanFalse)
          goto LABEL_18;
      }
      v10 = CFBooleanGetTypeID();
      if (v10 == CFGetTypeID(Value) && CFBooleanGetValue((CFBooleanRef)Value))
      {
        v11 = (const void **)&kObliterateDataPartition;
LABEL_19:
        CFDictionarySetValue(v6, kObliterationTypeKey, *v11);
        CFDictionarySetValue(v6, kDisplayProgressBarKey, kCFBooleanTrue);
        valuePtr = 3;
        sub_100004038((uint64_t)"do_obliterate", CFSTR("REPLY REQUESTED and delay set for %d secs\n"), 3);
        v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        if (v12)
          CFDictionarySetValue(v6, kObliterationDelayAfterReplyKey, v12);
        else
          sub_100004038((uint64_t)"do_obliterate", CFSTR("Can't set obliteration delay "));
        CFRelease(v12);
        CFDictionarySetValue(v6, kObliterationMessageKey, CFSTR("MobileDiagnosticsRelay executed SIOP."));
        sub_100004038((uint64_t)"do_obliterate", CFSTR("obliteration starting: SIOP orders being transmitted."));
        v13 = Mobile_Obliterate(v6);
        v8 = v13;
        if ((_DWORD)v13)
          sub_100004038((uint64_t)"do_obliterate", CFSTR("SIOP orders failed (%d): how did we end up here?"), v13);
        else
          sub_100004038((uint64_t)"do_obliterate", CFSTR("SIOP orders accepted: welcome to the Stone Age."), v14);
        CFRelease(v6);
        goto LABEL_10;
      }
LABEL_18:
      v11 = (const void **)&kObliterationTypeWipeAndBrick;
      goto LABEL_19;
    }
    sub_100004038((uint64_t)"do_obliterate", CFSTR("Could not create CFDictionary."));
  }
  else
  {
    sub_100004038((uint64_t)"do_obliterate", CFSTR("obliteration denied: not running internal build."));
  }
  v8 = 1;
LABEL_10:
  CFRelease(v3);
  return v8;
}

void sub_100006584(uint64_t a1, __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  const __CFBoolean *v8;
  const __CFString *v9;
  const __CFDictionary *v10;
  io_service_t v11;
  const __CFBoolean *CFProperty;
  CFTypeID v13;
  int Value;
  const char *v15;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_100004038((uint64_t)"gather_hdmi_info", CFSTR("Could not create empty dictionary"));
    return;
  }
  v4 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Failure"));
  CFDictionarySetValue(v4, CFSTR("Connection"), CFSTR("Unplugged"));
  v5 = IOServiceMatching("IOHDMIService");
  if (v5)
  {
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
    if (MatchingService)
    {
      v7 = MatchingService;
      CFDictionarySetValue(v4, CFSTR("Connection"), CFSTR("Plugged"));
      v8 = 0;
      v9 = CFSTR("Success");
LABEL_5:
      CFDictionarySetValue(v4, CFSTR("Status"), v9);
      CFDictionarySetValue(a2, CFSTR("HDMI"), v4);
      goto LABEL_6;
    }
    v10 = IOServiceMatching("AppleANX9836");
    if (v10)
    {
      v11 = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
      v7 = v11;
      if (v11)
      {
        CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v11, CFSTR("ds_plugged"), kCFAllocatorDefault, 0);
        v8 = CFProperty;
        if (!CFProperty)
        {
          v9 = CFSTR("CreatePropertiesFailed");
          goto LABEL_5;
        }
        v13 = CFGetTypeID(CFProperty);
        if (v13 != CFBooleanGetTypeID())
        {
          v9 = CFSTR("GetPlugStatusTypeMismatch");
          goto LABEL_5;
        }
        Value = CFBooleanGetValue(v8);
        v15 = "PLUGGED";
        if (!Value)
          v15 = "UNPLUGGED";
        sub_100004038((uint64_t)"gather_hdmi_info", CFSTR("downstream %s\n"), v15);
        if (!CFBooleanGetValue(v8))
        {
          v9 = CFSTR("GetPlugStatusValueFailred");
          goto LABEL_5;
        }
        CFDictionarySetValue(v4, CFSTR("Connection"), CFSTR("Plugged"));
      }
      else
      {
        sub_100004038((uint64_t)"gather_hdmi_info", CFSTR("Could not find the AppleANX9836 service"));
        v8 = 0;
      }
      CFDictionarySetValue(v4, CFSTR("Status"), CFSTR("Success"));
      CFDictionarySetValue(a2, CFSTR("HDMI"), v4);
      if (!v7)
      {
LABEL_7:
        if (v8)
          CFRelease(v8);
        goto LABEL_19;
      }
LABEL_6:
      IOObjectRelease(v7);
      goto LABEL_7;
    }
  }
  sub_100004038((uint64_t)"gather_hdmi_info", CFSTR("Could not create matching dictionary"));
  CFDictionarySetValue(v4, CFSTR("Status"), CFSTR("ServiceMatchingFailed"));
  CFDictionarySetValue(a2, CFSTR("HDMI"), v4);
LABEL_19:
  CFRelease(v4);
}
