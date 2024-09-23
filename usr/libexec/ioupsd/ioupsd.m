BOOL sub_1000019F8(mach_port_t *a1)
{
  mach_port_t v2;
  mach_port_t special_port[2];

  *(_QWORD *)special_port = 0;
  if (!a1)
  {
    if (!task_get_special_port(mach_task_self_, 4, special_port))
    {
      v2 = special_port[0];
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
    }
    return 0;
  }
  v2 = *a1;
  if (!v2)
  {
    if (!task_get_special_port(mach_task_self_, 4, special_port))
    {
      v2 = special_port[0];
      *a1 = special_port[0];
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
    }
    return 0;
  }
  special_port[0] = v2;
  return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
}

uint64_t sub_100001A9C(mach_port_t a1, int a2, CFTypeRef object)
{
  uint64_t result;
  const __CFData *v6;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;
  uint64_t v10;

  result = 3758097090;
  if (a1 && object)
  {
    v6 = IOCFSerialize(object, 0);
    if (v6)
    {
      v7 = v6;
      BytePtr = CFDataGetBytePtr(v6);
      Length = CFDataGetLength(v7);
      v10 = sub_100005B7C(a1, a2, (uint64_t)BytePtr, Length);
      CFRelease(v7);
      return v10;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_100001B2C(mach_port_t a1, int a2, CFTypeRef *a3)
{
  uint64_t v3;
  vm_size_t v6;
  char *buffer;

  buffer = 0;
  v3 = 3758097090;
  if (a1)
  {
    if (a3)
    {
      v6 = 0;
      v3 = sub_100005CF0(a1, a2, &buffer, &v6);
      if (!(_DWORD)v3)
      {
        *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
        vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t sub_100001BB8(mach_port_t a1, int a2, CFTypeRef *a3)
{
  uint64_t v3;
  vm_size_t v6;
  char *buffer;

  buffer = 0;
  v3 = 3758097090;
  if (a1)
  {
    if (a3)
    {
      v6 = 0;
      v3 = sub_100005EC8(a1, a2, &buffer, &v6);
      if (!(_DWORD)v3)
      {
        *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
        vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t start()
{
  __CFMachPort *v0;
  os_log_t v1;
  void *v2;
  __CFRunLoop *Current;
  __CFRunLoopSource *v4;
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  CFMutableArrayRef Mutable;
  __CFArray *v8;
  uint64_t i;
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  kern_return_t v16;
  int v17;
  NSObject *v18;
  __CFArray *v19;
  __CFRunLoopSource *RunLoopSource;
  __int128 v22;
  mach_port_t sp[6];

  signal(2, (void (__cdecl *)(int))sub_100001FE0);
  sp[0] = 0;
  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port)
    || (qword_10000C080 = (uint64_t)CFRunLoopGetCurrent()) == 0)
  {
LABEL_2:
    v0 = 0;
    goto LABEL_3;
  }
  v16 = bootstrap_check_in(bootstrap_port, "com.apple.IOUPSPlugInServer", sp);
  if (v16)
  {
    v17 = v16;
    v18 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_100006358(v17, v18);
    goto LABEL_2;
  }
  v0 = CFMachPortCreateWithPort(kCFAllocatorDefault, sp[0], (CFMachPortCallBack)sub_100005A98, 0, 0);
  RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v0, 0);
  qword_10000C088 = (uint64_t)RunLoopSource;
  if (!RunLoopSource)
    goto LABEL_5;
  CFRunLoopAddSource((CFRunLoopRef)qword_10000C080, RunLoopSource, kCFRunLoopDefaultMode);
LABEL_3:
  if (qword_10000C088)
    CFRelease((CFTypeRef)qword_10000C088);
LABEL_5:
  if (v0)
    CFRelease(v0);
  byte_10000C048 = 0;
  v1 = os_log_create("com.apple.ioupsd", "upsd");
  v2 = (void *)qword_10000C050;
  qword_10000C050 = (uint64_t)v1;

  qword_10000C058 = (uint64_t)IONotificationPortCreate(kIOMainPortDefault);
  Current = CFRunLoopGetCurrent();
  v4 = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_10000C058);
  CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
  v22 = xmmword_1000077C0;
  *(_OWORD *)sp = xmmword_1000077B0;
  v5 = IOServiceMatching("IOHIDDevice");
  if (v5)
  {
    v6 = v5;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v8 = Mutable;
      for (i = 0; i != 4; ++i)
      {
        v10 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v10 || (v11 = v10, (v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i])) == 0))
        {
LABEL_22:
          CFRelease(v6);
          v19 = v8;
          goto LABEL_24;
        }
        v13 = v12;
        CFDictionarySetValue(v11, CFSTR("DeviceUsagePage"), v12);
        CFRelease(v13);
        if (sp[i - 4])
        {
          v14 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i - 4]);
          if (!v14)
            goto LABEL_22;
          v15 = v14;
          CFDictionarySetValue(v11, CFSTR("DeviceUsage"), v14);
          CFRelease(v15);
        }
        CFArrayAppendValue(v8, v11);
        CFRelease(v11);
      }
      CFDictionarySetValue(v6, CFSTR("DeviceUsagePairs"), v8);
      CFRelease(v8);
      if (!IOServiceAddMatchingNotification((IONotificationPortRef)qword_10000C058, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)sub_100003B44, 0, (io_iterator_t *)&dword_10000C068))sub_100003B44(0, dword_10000C068);
    }
    else
    {
      v19 = v6;
LABEL_24:
      CFRelease(v19);
    }
  }
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100008508);
  CFRunLoopRun();
  return 0;
}

void sub_100001FE0()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "upsd: exiting SIGINT\n", v1, 2u);
  }
  sub_100002A14();
}

void sub_100002034(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  IONotificationPort *v3;
  io_service_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_registry_entry_t v14;
  void *CFProperty;

  v2 = a2;
  v3 = (IONotificationPort *)qword_10000C058;
  v4 = sub_100002104();
  v5 = IOServiceAddInterestNotification(v3, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_10000217C, 0, (io_object_t *)&dword_10000C060);
  if ((_DWORD)v5)
  {
    v6 = v5;
    v7 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_1000063DC(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v14 = sub_100002104();
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, CFSTR("AccessoryDetails"), kCFAllocatorDefault, 0);
  sub_100002214(CFProperty, 1);
  if (!dword_10000C064)
    sub_100002A14();

}

uint64_t sub_100002104()
{
  uint64_t result;
  const __CFDictionary *v1;

  result = dword_10000C0A8;
  if (!dword_10000C0A8)
  {
    v1 = IOServiceMatching("IOPMPowerSource");
    result = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_10000C0A8 = result;
    if (!(_DWORD)result)
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_100006440();
      return dword_10000C0A8;
    }
  }
  return result;
}

void sub_10000217C()
{
  io_registry_entry_t v0;
  io_registry_entry_t v1;
  void *v2;
  unsigned __int8 v3;
  char v4;
  char v5;
  id CFProperty;

  v0 = sub_100002104();
  CFProperty = (id)IORegistryEntryCreateCFProperty(v0, CFSTR("AccessoryDetails"), kCFAllocatorDefault, 0);
  v1 = sub_100002104();
  v2 = (void *)IORegistryEntryCreateCFProperty(v1, CFSTR("AppleRawExternalConnected"), kCFAllocatorDefault, 0);
  v3 = objc_msgSend(v2, "BOOLValue");
  v4 = v3;
  if (byte_10000C078)
    v5 = 0;
  else
    v5 = v3;
  sub_100002214(CFProperty, v5);
  byte_10000C078 = v4;

}

void sub_100002214(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char **v7;
  CFAbsoluteTime (**v8)(void);
  CFAbsoluteTime (**v9)(void);
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;
  unsigned __int8 v34;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v36;
  NSObject *v37;
  CFNumberRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFMutableSetRef v43;
  CFBooleanRef v44;
  CFBooleanRef v45;
  const __CFString *v46;
  UInt8 *v47;
  const void *Value;
  NSObject *v49;
  BOOL v50;
  __int128 v51;
  char v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned __int16 v57;
  unsigned __int16 cf;
  CFNumberRef cfa;
  unint64_t v60;
  uint64_t v61;
  int v62;
  uint8_t buf[4];
  _BYTE v64[10];
  void *v65;
  int v66;

  v3 = a1;
  if (v3
    && (v4 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && objc_msgSend(v3, "count"))
  {
    v52 = a2;
    if (objc_msgSend(v3, "count"))
    {
      v6 = 0;
      v7 = &selRef_BOOLValue;
      v8 = &CFAbsoluteTimeGetCurrent_ptr;
      v9 = &CFAbsoluteTimeGetCurrent_ptr;
      *(_QWORD *)&v5 = 67109376;
      v51 = v5;
      v53 = v3;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v6, v51));
        v11 = v7[10];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v64 = v6;
          *(_WORD *)&v64[8] = 2112;
          v65 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SMCAccessory[%zu]: %@\n", buf, 0x16u);
        }
        v12 = v10;
        if (!v12)
          goto LABEL_68;
        v13 = objc_opt_class(v8[81]);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
          goto LABEL_68;
        v60 = 0;
        v61 = 0;
        v62 = 0;
        v14 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("VID")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("PID")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("CurrentCapacity")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("MaxCapacity")));
        v19 = objc_opt_class(v9[82]);
        if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0)
        {
          v20 = objc_opt_class(v9[82]);
          if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
          {
            v21 = objc_opt_class(v9[82]);
            if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0)
            {
              v22 = objc_opt_class(v9[82]);
              if ((objc_opt_isKindOfClass(v18, v22) & 1) != 0)
                break;
            }
          }
        }

LABEL_67:
        v3 = v53;
        v8 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_68:

        if (++v6 >= (unint64_t)objc_msgSend(v3, "count"))
          goto LABEL_78;
      }
      v56 = v15;
      cf = (unsigned __int16)objc_msgSend(v15, "unsignedIntValue");
      v55 = v16;
      v57 = (unsigned __int16)objc_msgSend(v16, "unsignedIntValue");
      v23 = v17;
      v24 = objc_msgSend(v17, "unsignedIntValue");
      v54 = v18;
      v25 = objc_msgSend(v18, "unsignedIntValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("IsCharging")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("ExternalConnected")));
      v28 = v7[10];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        v30 = v24;
        *(_DWORD *)v64 = cf;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v57;
        LOWORD(v65) = 1024;
        *(_DWORD *)((char *)&v65 + 2) = v24;
        HIWORD(v65) = 1024;
        v66 = v25;
        v49 = v28;
        v29 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "vid:%d, pid:%d, soc:%d/%d\n", buf, 0x1Au);
      }
      else
      {
        v29 = v25;
        v30 = v24;
      }
      if (v29 >= v30)
        v25 = v24;
      v9 = &CFAbsoluteTimeGetCurrent_ptr;
      v31 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v27, v31) & 1) != 0)
        v32 = objc_msgSend(v27, "BOOLValue");
      else
        v32 = 0;
      v7 = &selRef_BOOLValue;
      LOBYTE(v62) = v32;
      v33 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v26, v33) & 1) != 0)
        v34 = objc_msgSend(v26, "BOOLValue");
      else
        v34 = 0;
      BYTE1(v62) = v34;
      v60 = __PAIR64__(v29, v25);
      LODWORD(v61) = cf;
      HIDWORD(v61) = v57;

      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable)
        goto LABEL_67;
      v36 = Mutable;
      v37 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v51;
        *(_DWORD *)v64 = v25;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v29;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "ProcessSmcAccessory: soc:%d/%d\n", buf, 0xEu);
      }
      v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v61);
      v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v61 + 4);
      v40 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v60);
      v41 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v60 + 4);
      v42 = v41;
      cfa = v38;
      if (!v38 || !v39 || !v40 || !v41)
      {
        v43 = 0;
        if (!cfa)
          goto LABEL_59;
        goto LABEL_58;
      }
      v43 = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      if (!v43)
      {
LABEL_58:
        CFRelease(cfa);
LABEL_59:
        if (v39)
          CFRelease(v39);
        if (v40)
          CFRelease(v40);
        if (v42)
          CFRelease(v42);
        CFRelease(v36);
        if (v43)
          CFRelease(v43);
        goto LABEL_67;
      }
      if (BYTE1(v62))
        v44 = kCFBooleanTrue;
      else
        v44 = kCFBooleanFalse;
      CFDictionarySetValue(v36, CFSTR("Show Charging UI"), v44);
      if ((byte_10000C048 & 2) == 0)
      {
        CFDictionarySetValue(v36, CFSTR("Is Present"), kCFBooleanTrue);
        if (BYTE1(v62))
          v45 = kCFBooleanTrue;
        else
          v45 = kCFBooleanFalse;
        CFDictionarySetValue(v36, CFSTR("Is Charging"), v45);
        CFDictionarySetValue(v36, CFSTR("Vendor ID"), cfa);
        CFDictionarySetValue(v36, CFSTR("Product ID"), v39);
        CFDictionarySetValue(v36, CFSTR("Max Capacity"), v42);
        CFDictionarySetValue(v36, CFSTR("Current Capacity"), v40);
        CFDictionarySetValue(v36, CFSTR("Transport Type"), CFSTR("Inductive In-Band"));
        if (v61 == 0x1399000005ACLL)
          CFDictionarySetValue(v36, CFSTR("Name"), CFSTR("MagSafe Battery Pack"));
        CFSetAddValue(v43, CFSTR("Current Capacity"));
      }
      if ((_BYTE)v62)
        v46 = CFSTR("AC Power");
      else
        v46 = CFSTR("Battery Power");
      CFDictionarySetValue(v36, CFSTR("Power Source State"), v46);
      v47 = (UInt8 *)qword_10000C090;
      if (qword_10000C090)
      {
        *(_DWORD *)(qword_10000C090 + 56) = 3;
        v47[28] = 1;
        Value = CFDictionaryGetValue(*((CFDictionaryRef *)v47 + 4), CFSTR("Power Source State"));
        if (sub_100004434((uint64_t)v47, *((const __CFDictionary **)v47 + 4), v36, v43)
          || IOPSSetPowerSourceDetails(*(_QWORD *)v47, *((_QWORD *)v47 + 4)))
        {
          v7 = &selRef_BOOLValue;
          goto LABEL_57;
        }
        if (Value && CFEqual(Value, v46))
        {
          v7 = &selRef_BOOLValue;
          if ((v52 & 1) == 0)
          {
LABEL_56:
            qword_10000C090 = (uint64_t)v47;
            byte_10000C048 |= 1u;
            goto LABEL_57;
          }
        }
        else
        {
          v7 = &selRef_BOOLValue;
        }
      }
      else
      {
        v47 = sub_100004334();
        *((_DWORD *)v47 + 14) = 3;
        v47[28] = 1;
        if (sub_100004B0C((uint64_t)v47, v36, v43))
        {
LABEL_57:
          v9 = &CFAbsoluteTimeGetCurrent_ptr;
          goto LABEL_58;
        }
        v47[60] = sub_100002D08((uint64_t)v47);
        v47[61] = sub_100002DDC((uint64_t)v47);
      }
      sub_100004C38((uint64_t)v47, v46);
      goto LABEL_56;
    }
  }
  else
  {
    v50 = (byte_10000C048 & 0xFE) == 0;
    byte_10000C048 &= ~1u;
    if (v50)
    {
      sub_10000558C(qword_10000C090);
      qword_10000C090 = 0;
    }
  }
LABEL_78:

}

void sub_100002A14()
{
  const __CFNumber *v0;
  int valuePtr;

  IONotificationPortDestroy((IONotificationPortRef)qword_10000C058);
  if (dword_10000C068)
  {
    IOObjectRelease(dword_10000C068);
    dword_10000C068 = 0;
  }
  if (dword_10000C060)
  {
    IOObjectRelease(dword_10000C060);
    dword_10000C060 = 0;
  }
  valuePtr = 0;
  v0 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  sub_100002A80(v0);
  exit(0);
}

const __CFNumber *sub_100002A80(const __CFNumber *result)
{
  const void *v1;
  NSObject *v2;
  const __CFDictionary *v3;
  io_object_t v4;
  int valuePtr;
  uint8_t buf[4];
  int v7;

  valuePtr = 0;
  if (result)
  {
    v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    v2 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "adapter family %x\n", buf, 8u);
    }
    v3 = IOServiceMatching("AppleSmartBattery");
    result = (const __CFNumber *)IOServiceGetMatchingService(kIOMainPortDefault, v3);
    if ((_DWORD)result)
    {
      v4 = result;
      IORegistryEntrySetCFProperty((io_registry_entry_t)result, CFSTR("DownstreamAdapterFamily"), v1);
      return (const __CFNumber *)IOObjectRelease(v4);
    }
  }
  return result;
}

uint64_t sub_100002B78(io_registry_entry_t a1, const __CFDictionary *a2)
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  uint64_t v8;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  const void *v14;
  uint64_t valuePtr;

  v3 = (const __CFArray *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("DeviceUsagePairs"), kCFAllocatorDefault, 0);
  if (!v3)
    return 0;
  v4 = v3;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
  {
    v8 = 1;
  }
  else
  {
    v6 = Count;
    v7 = 0;
    v8 = 1;
    do
    {
      valuePtr = 0;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
      if (ValueAtIndex)
      {
        v10 = ValueAtIndex;
        Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("DeviceUsagePage"));
        v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("DeviceUsage"));
        if (Value)
          CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
        if (v12)
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        if (valuePtr == 0xFF0000000014 || valuePtr == 0x8400000006)
        {
          v8 = 2;
        }
        else if ((_DWORD)valuePtr == 46 && HIDWORD(valuePtr) == 133)
        {
          v8 = 3;
        }
        else
        {
          v8 = v8;
        }
      }
      ++v7;
    }
    while (v6 != v7);
  }
  CFRelease(v4);
  if (a2)
  {
    v14 = CFDictionaryGetValue(a2, CFSTR("Accessory Category"));
    if (v14)
    {
      if (CFEqual(v14, CFSTR("Game Controller")))
        return 4;
      else
        return v8;
    }
  }
  return v8;
}

BOOL sub_100002D08(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  _BOOL8 result;
  uint64_t valuePtr;

  valuePtr = 0;
  if (a1 && (v2 = *(const __CFDictionary **)(a1 + 32)) != 0)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v2, CFSTR("Vendor ID"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("Product ID"));
    if (v4)
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    result = 0;
    if (*(_DWORD *)(a1 + 56) == 3)
      return valuePtr == 0x5AC00001395;
  }
  else
  {
    result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000646C();
      return 0;
    }
  }
  return result;
}

BOOL sub_100002DDC(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  _BOOL8 result;
  uint64_t valuePtr;

  valuePtr = 0;
  if (a1 && (v2 = *(const __CFDictionary **)(a1 + 32)) != 0)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v2, CFSTR("Vendor ID"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("Product ID"));
    if (v4)
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    result = 0;
    if (*(_DWORD *)(a1 + 56) == 3)
      return valuePtr == 0x5AC00001398;
  }
  else
  {
    result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_1000064DC();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002EB0(const void *a1)
{
  CFTypeID v2;
  NSObject *v3;
  uint64_t USBCurrentLimitBase;
  uint64_t ServiceWithPrimaryPort;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  io_connect_t connect;
  int valuePtr;
  uint8_t buf[4];
  int v23;

  connect = 0;
  if (!a1)
    return 4;
  v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
    return 4;
  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr > 199)
  {
    ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1);
    if ((_DWORD)ServiceWithPrimaryPort)
    {
      v7 = ServiceWithPrimaryPort;
      v8 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
      if ((_DWORD)v8)
      {
        USBCurrentLimitBase = v8;
        v9 = (void *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
          sub_1000065B8(v9);
      }
      else
      {
        *(_DWORD *)buf = 0;
        USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase(v7, buf);
        if (!(_DWORD)USBCurrentLimitBase)
        {
          v18 = *(_DWORD *)buf;
          if (*(_DWORD *)buf >= 0x7FFFFFFFu)
            v18 = 0x7FFFFFFF;
          IOAccessoryManagerSetUSBCurrentOffset(connect, (valuePtr - v18));
          USBCurrentLimitBase = v19;
        }
        IOServiceClose(connect);
      }
    }
    else
    {
      USBCurrentLimitBase = 3758097088;
      v10 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_10000654C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    v3 = qword_10000C050;
    USBCurrentLimitBase = 0;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ignoring battery case current limit < 200 (limit=%d)\n", buf, 8u);
      return 0;
    }
  }
  return USBCurrentLimitBase;
}

uint64_t sub_100003068(uint64_t a1, void *a2, int a3)
{
  _QWORD *v4;
  CFNumberRef v6;
  CFNumberRef v7;
  CFDictionaryRef v8;
  uint64_t v9;
  int valuePtr;
  void *values;
  void *keys;

  valuePtr = a3;
  if (!a1)
    return 29;
  v4 = *(_QWORD **)(a1 + 16);
  if (!v4)
    return 29;
  if (!*v4)
    return 29;
  v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v6)
    return 29;
  v7 = v6;
  values = v6;
  keys = a2;
  v8 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v7);
  if (!v8)
    return 29;
  v9 = (*(uint64_t (**)(_QWORD, CFDictionaryRef))(**(_QWORD **)(a1 + 16) + 64))(*(_QWORD *)(a1 + 16), v8);
  CFRelease(v8);
  return v9;
}

uint64_t sub_100003164(uint64_t a1)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t i;
  int v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  char v11;
  NSObject *v12;
  CFDataRef v13;
  CFDictionaryRef v14;
  uint64_t v15;
  UInt8 bytes[6];
  void *values;
  void *keys;

  if (!a1)
    return 29;
  v2 = *(_QWORD **)(a1 + 16);
  if (!v2 || !*v2)
    return 29;
  v3 = time(0);
  srand(v3);
  for (i = 0; i != 6; ++i)
  {
    v5 = rand();
    if (i)
      v6 = 255;
    else
      v6 = 63;
    v7 = v5 & v6;
    bytes[i] = v7;
  }
  if (v7)
  {
    if (v7 != 255)
      goto LABEL_14;
    v8 = rand();
    v9 = (5 - ((char)(v8 % 46 + (((v8 % 46) >> 12) & 7)) >> 3));
    v10 = bytes[v9] ^ (1 << ((v8 % 46) & 7));
  }
  else
  {
    v11 = rand();
    v9 = (5 - ((char)(v11 % 46 + (((v11 % 46) >> 12) & 7)) >> 3));
    v10 = bytes[v9] | (1 << ((v11 % 46) & 7));
  }
  bytes[v9] = v10;
LABEL_14:
  v12 = qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
    sub_10000665C(a1, bytes, v12);
  v13 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
  if (!v13 && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
    sub_100006630();
  values = v13;
  keys = CFSTR("Set Address");
  v14 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v13);
  if (!v14)
    return 29;
  v15 = (*(uint64_t (**)(_QWORD, CFDictionaryRef))(**(_QWORD **)(a1 + 16) + 64))(*(_QWORD *)(a1 + 16), v14);
  CFRelease(v14);
  return v15;
}

const __CFNumber *sub_1000033BC(const __CFNumber *result, io_registry_entry_t entry, int a3)
{
  uint64_t v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  BOOL v7;
  const __CFNumber *v8;
  int v9;
  int v10;
  NSObject *v11;
  const __CFNumber *v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t valuePtr;
  uint8_t buf[4];
  int v18;

  if (a3 == -536723200)
  {
    v4 = (uint64_t)result;
    valuePtr = 0;
    v15 = 0;
    v5 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("AppleRawCurrentCapacity"), kCFAllocatorDefault, 0);
    v6 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("AppleRawMaxCapacity"), kCFAllocatorDefault, 0);
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = v6;
      CFNumberGetValue(v5, kCFNumberSInt32Type, (char *)&valuePtr + 4);
      CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
      v9 = valuePtr;
      v10 = HIDWORD(valuePtr);
      CFRelease(v5);
      CFRelease(v8);
      if ((int)valuePtr >= 1)
      {
        v11 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v18 = 100 * v10 / v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending Current State of Charge: %d%%\n", buf, 8u);
        }
        sub_100003068(v4, CFSTR("Send Current State of Charge"), 100 * v10 / v9);
      }
    }
    v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("VirtualTemperature"), kCFAllocatorDefault, 0);
    if (v12
      || (result = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("Temperature"), kCFAllocatorDefault, 0), (v12 = result) != 0))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &v15);
      CFRelease(v12);
      v13 = v15 / 0xA + 2732;
      v14 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending Current Temperature: %d dK\n", buf, 8u);
      }
      return (const __CFNumber *)sub_100003068(v4, CFSTR("Send Current Temperature"), v13);
    }
  }
  return result;
}

void sub_100003628(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == -469794795)
  {
    v8 = v3;
    v9 = v4;
    v7 = 0;
    if (IOAccessoryManagerGetUSBCurrentLimit(a2, &v7))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_100006750();
    }
    else
    {
      if (v7 >= 0x7FFFFFFF)
        v6 = 0x7FFFFFFF;
      else
        v6 = v7;
      if (sub_100003068(a1, CFSTR("Set Current Limit"), v6)
        && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      {
        sub_100006724();
      }
    }
  }
}

const __CFNumber *sub_1000036E0(uint64_t a1, io_registry_entry_t entry)
{
  const __CFNumber *result;
  const __CFNumber *v4;
  int valuePtr;

  result = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("Voltage"), kCFAllocatorDefault, 0);
  if (result)
  {
    v4 = result;
    valuePtr = 0;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v4);
    return (const __CFNumber *)sub_100003068(a1, CFSTR("Set Required Voltage"), valuePtr + 150);
  }
  return result;
}

const __CFNumber *sub_100003768(uint64_t a1, uint64_t a2)
{
  io_registry_entry_t v3;
  const __CFNumber *result;
  const __CFNumber *v5;
  NSObject *v6;
  int valuePtr;
  uint8_t buf[4];
  int v9;

  v3 = sub_100002104();
  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("AverageChargingCurrent"), kCFAllocatorDefault, 0);
  if (result)
  {
    v5 = result;
    valuePtr = 0;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v5);
    v6 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Average Charging Current: %d mA\n", buf, 8u);
    }
    return (const __CFNumber *)sub_100003068(a2, CFSTR("Send Average Charging Current"), valuePtr);
  }
  return result;
}

uint64_t sub_10000385C(int a1, unsigned __int16 a2, char *buffer)
{
  uint64_t v4;
  CFTypeRef v5;
  const void *v6;
  __CFData *ValueAtIndex;
  UInt8 *MutableBytePtr;
  uint64_t v9;

  v4 = 3758097084;
  v5 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
  if (v5)
  {
    v6 = v5;
    v4 = 3758097090;
    if (qword_10000C070 && CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
    {
      ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, a2);
      MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
      if (MutableBytePtr)
      {
        v9 = *((_QWORD *)MutableBytePtr + 2);
        v4 = 3758097084;
        if (v9)
          v4 = (*(uint64_t (**)(uint64_t, const void *))(*(_QWORD *)v9 + 64))(v9, v6);
      }
      else
      {
        v4 = 3758097084;
      }
    }
    CFRelease(v6);
  }
  return v4;
}

uint64_t sub_10000391C(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4;
  CFIndex v7;
  __CFData *ValueAtIndex;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  const __CFData *v12;
  const __CFData *v13;
  vm_size_t Length;
  void *v15;
  const UInt8 *BytePtr;
  CFTypeRef object;

  v4 = 3758097090;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            v10 = *((_QWORD *)MutableBytePtr + 2);
            if (v10)
            {
              object = 0;
              v4 = 3758097084;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(_QWORD *)v10 + 48))(v10, &object)
                && object != 0)
              {
                v12 = IOCFSerialize(object, 0);
                if (v12)
                {
                  v13 = v12;
                  Length = CFDataGetLength(v12);
                  *a4 = Length;
                  v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!(_DWORD)v4)
                  {
                    v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }
                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_100003A30(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4;
  CFIndex v7;
  __CFData *ValueAtIndex;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  const __CFData *v12;
  const __CFData *v13;
  vm_size_t Length;
  void *v15;
  const UInt8 *BytePtr;
  CFTypeRef object;

  v4 = 3758097090;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            v10 = *((_QWORD *)MutableBytePtr + 2);
            if (v10)
            {
              object = 0;
              v4 = 3758097084;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(_QWORD *)v10 + 40))(v10, &object)
                && object != 0)
              {
                v12 = IOCFSerialize(object, 0);
                if (v12)
                {
                  v13 = v12;
                  Length = CFDataGetLength(v12);
                  *a4 = Length;
                  v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!(_DWORD)v4)
                  {
                    v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }
                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

void sub_100003B44(int a1, io_iterator_t iterator)
{
  io_object_t v3;
  io_service_t v4;
  UInt8 *v5;
  id v6;
  const __CFString *v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  IOCFPlugInInterface **v10;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v12;
  CFUUIDBytes v13;
  BOOL v14;
  IOCFPlugInInterface **v15;
  HRESULT (__cdecl *v16)(void *, REFIID, LPVOID *);
  const __CFUUID *v17;
  CFUUIDBytes v18;
  BOOL v20;
  CFTypeID v21;
  CFTypeID TypeID;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t i;
  void *v28;
  id v29;
  __CFRunLoopSource *v30;
  __CFRunLoop *v31;
  __CFRunLoop *v32;
  __CFRunLoopSource *v33;
  __CFRunLoop *Current;
  __CFRunLoop *v35;
  const void *Value;
  CFTypeID v37;
  NSObject *v38;
  char v39;
  int v40;
  UInt8 *v41;
  int v42;
  int v43;
  int v44;
  io_service_t v45;
  int v46;
  int v47;
  NSObject *v48;
  char v49;
  kern_return_t v50;
  char v51;
  NSObject *v52;
  int v53;
  uint8_t v54;
  _BYTE v55[15];
  uint8_t v56;
  _BYTE v57[15];
  id v58;
  id v59;
  SInt32 theScore;
  uint64_t v61;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  __CFRunLoopSource *v64;
  const __CFSet *v65;
  CFDictionaryRef v66;
  const __CFDictionary *v67;
  uint8_t buf[4];
  int v69;
  __int16 v70;
  int v71;

  v66 = 0;
  v67 = 0;
  v65 = 0;
  cf = 0;
  v64 = 0;
  v61 = 0;
  theInterface = 0;
  theScore = 0;
  v3 = IOIteratorNext(iterator);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = kCFRunLoopDefaultMode;
    while (1)
    {
      v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x40u, 0xA5u, 0x7Au, 0x4Eu, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x92u, 0x95u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
      v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (!IOCreatePlugInInterfaceForService(v4, v8, v9, &theInterface, &theScore))
        break;
LABEL_71:
      IOObjectRelease(v4);
      v4 = IOIteratorNext(iterator);
      if (!v4)
      {

        return;
      }
    }
    v10 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xE6u, 0xEu, 7u, 0x99u, 0x9Au, 0xA6u, 0x49u, 0xDFu, 0xB5u, 0x5Bu, 0xA5u, 0xC9u, 0x4Bu, 0xA0u, 0x7Au, 0x4Au);
    v13 = CFUUIDGetUUIDBytes(v12);
    if (((unsigned int (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v10, *(_QWORD *)&v13.byte0, *(_QWORD *)&v13.byte8, &v61))
    {
      v14 = 1;
    }
    else
    {
      v14 = v61 == 0;
    }
    if (v14)
    {
      v15 = theInterface;
      v16 = (*theInterface)->QueryInterface;
      v17 = CFUUIDGetConstantUUIDWithBytes(0, 0x63u, 0xF8u, 0xBFu, 0xC4u, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x88u, 0xB4u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
      v18 = CFUUIDGetUUIDBytes(v17);
      if (((unsigned int (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))v16)(v15, *(_QWORD *)&v18.byte0, *(_QWORD *)&v18.byte8, &v61))
      {
        goto LABEL_30;
      }
    }
    else
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)v61 + 72))())
        v20 = 1;
      else
        v20 = cf == 0;
      if (v20)
      {
LABEL_30:
        if (!v5)
        {
LABEL_31:
          if (v61)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v61 + 24))(v61);
            v61 = 0;
          }
          v33 = v64;
          if (v64)
          {
            Current = CFRunLoopGetCurrent();
            CFRunLoopRemoveSource(Current, v33, v7);
            CFRelease(v33);
            v64 = 0;
          }
          if (v6)
          {
            v35 = CFRunLoopGetCurrent();
            CFRunLoopRemoveTimer(v35, (CFRunLoopTimerRef)v6, v7);

            v6 = 0;
          }
          v5 = 0;
          goto LABEL_70;
        }
LABEL_69:
        sub_10000558C((uint64_t)v5);
        v5 = 0;
        v61 = 0;
        goto LABEL_70;
      }
      v21 = CFGetTypeID(cf);
      TypeID = CFArrayGetTypeID();
      v23 = (void *)cf;
      if (v21 == TypeID)
      {
        v24 = (uint64_t)objc_msgSend((id)cf, "count");
        if (v24 >= 1)
        {
          v25 = v24;
          v26 = v7;
          for (i = 0; i != v25; ++i)
          {
            v28 = v6;
            v29 = objc_msgSend(v23, "objectAtIndex:", i);
            v59 = v6;
            sub_1000042C8(v29, &v59, &v64);
            v6 = v59;

          }
          v7 = v26;
        }
      }
      else
      {
        v58 = v6;
        sub_1000042C8((void *)cf, &v58, &v64);
        v23 = v6;
        v6 = v58;
      }

      v30 = v64;
      if (v64)
      {
        v31 = CFRunLoopGetCurrent();
        CFRunLoopAddSource(v31, v30, v7);
      }
      if (v6)
      {
        v32 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v32, (CFRunLoopTimerRef)v6, v7);
      }
    }
    if (!v61 || (*(unsigned int (**)(uint64_t, const __CFDictionary **))(*(_QWORD *)v61 + 32))(v61, &v67))
      goto LABEL_30;
    Value = CFDictionaryGetValue(v67, CFSTR("Transport Type"));
    v37 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v37 && CFEqual(Value, CFSTR("Inductive In-Band")))
    {
      v38 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
        sub_1000067B0(&v56, v57, v38);
      v5 = (UInt8 *)qword_10000C090;
      v39 = 1;
      v40 = 1;
      if (qword_10000C090)
        goto LABEL_48;
    }
    else
    {
      v39 = 0;
    }
    v41 = sub_100004334();
    if (!v41)
      goto LABEL_31;
    v5 = v41;
    v40 = 0;
LABEL_48:
    *((_QWORD *)v5 + 2) = v61;
    *((_QWORD *)v5 + 5) = v64;
    objc_storeStrong((id *)v5 + 6, v6);
    v5[28] = 1;
    v42 = sub_100002B78(v4, v67);
    *((_DWORD *)v5 + 14) = v42;
    if (v42 && !(*(unsigned int (**)(uint64_t, const __CFSet **))(*(_QWORD *)v61 + 40))(v61, &v65))
    {
      if (!v40)
      {
        v43 = sub_100004B0C((uint64_t)v5, v67, v65);
LABEL_55:
        v44 = v43;
        v5[60] = sub_100002D08((uint64_t)v5);
        v5[61] = sub_100002DDC((uint64_t)v5);
        if (!v44)
        {
          if (*((_DWORD *)v5 + 14) == 3)
          {
            if ((v40 & 1) == 0)
            {
              v5[72] = 0;
              sub_100004C38((uint64_t)v5, CFSTR("Battery Power"));
            }
            v45 = sub_100002104();
            if (v45)
              IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v45, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000033BC, v5, (io_object_t *)v5 + 20);
            v46 = sub_100003164((uint64_t)v5);
            if (v46)
            {
              v47 = v46;
              v48 = qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
              {
                v53 = *((_DWORD *)v5 + 6);
                *(_DWORD *)buf = 67109376;
                v69 = v53;
                v70 = 1024;
                v71 = v47;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "failed to send address to power source %d (ret=0x%X)\n", buf, 0xEu);
              }
            }
          }
          if (!(*(unsigned int (**)(uint64_t, CFDictionaryRef *))(*(_QWORD *)v61 + 48))(v61, &v66))
          {
            sub_100005258((uint64_t)v5, v66);
            (*(void (**)(uint64_t, void (*)(int, int, uint64_t, int, CFDictionaryRef), _QWORD, UInt8 *))(*(_QWORD *)v61 + 56))(v61, sub_1000054B8, 0, v5);
            v50 = IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000054C4, v5, (io_object_t *)v5 + 2);
            v51 = v39 ^ 1;
            if (v50)
              v51 = 1;
            if ((v51 & 1) == 0)
            {
              v52 = qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
                sub_10000677C(&v54, v55, v52);
              qword_10000C090 = (uint64_t)v5;
              byte_10000C048 |= 2u;
              goto LABEL_70;
            }
            if (!v50)
            {
LABEL_70:
              ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
              goto LABEL_71;
            }
          }
        }
        goto LABEL_65;
      }
      if (!sub_100004434((uint64_t)v5, *((const __CFDictionary **)v5 + 4), v67, v65))
      {
        v43 = IOPSSetPowerSourceDetails(*(_QWORD *)v5, *((_QWORD *)v5 + 4));
        goto LABEL_55;
      }
    }
LABEL_65:
    if (byte_10000C048)
      v49 = v39;
    else
      v49 = 0;
    if ((v49 & 1) != 0)
      goto LABEL_70;
    goto LABEL_69;
  }
}

id sub_1000042C8(void *a1, _QWORD *a2, _QWORD *a3)
{
  CFTypeID v6;
  id result;
  CFTypeID v8;

  v6 = CFGetTypeID(a1);
  if (v6 == CFRunLoopTimerGetTypeID())
  {
    result = a1;
    a3 = a2;
  }
  else
  {
    v8 = CFGetTypeID(a1);
    result = (id)CFRunLoopSourceGetTypeID();
    if ((id)v8 != result)
      return result;
  }
  *a3 = a1;
  return result;
}

UInt8 *sub_100004334()
{
  const __CFArray *v0;
  CFIndex Count;
  CFIndex v2;
  CFIndex v3;
  __CFData *ValueAtIndex;
  UInt8 *MutableBytePtr;
  UInt8 *v6;
  __CFData *Mutable;
  __CFData *v8;

  v0 = (const __CFArray *)qword_10000C070;
  if (qword_10000C070
    || (v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks), (qword_10000C070 = (uint64_t)v0) != 0))
  {
    Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      v2 = Count;
      v3 = 0;
      while (1)
      {
        ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v3);
        if (ValueAtIndex)
        {
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            v6 = MutableBytePtr;
            if (!MutableBytePtr[28])
              break;
          }
        }
        if (v2 == ++v3)
          goto LABEL_11;
      }
      LODWORD(v2) = v3;
LABEL_16:
      *((_DWORD *)v6 + 6) = v2;
      return v6;
    }
    LODWORD(v2) = 0;
LABEL_11:
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 96);
    if (Mutable)
    {
      v8 = Mutable;
      v6 = CFDataGetMutableBytePtr(Mutable);
      *(_OWORD *)v6 = 0u;
      *((_OWORD *)v6 + 1) = 0u;
      *((_OWORD *)v6 + 2) = 0u;
      *((_OWORD *)v6 + 3) = 0u;
      *((_OWORD *)v6 + 4) = 0u;
      *((_OWORD *)v6 + 5) = 0u;
      CFArrayAppendValue((CFMutableArrayRef)qword_10000C070, v8);
      CFRelease(v8);
      if (!v6)
        return v6;
      goto LABEL_16;
    }
  }
  return 0;
}

uint64_t sub_100004434(uint64_t a1, const __CFDictionary *a2, CFDictionaryRef theDict, const __CFSet *a4)
{
  uint64_t result;
  const __CFString *v9;
  uint64_t (*v10)(const __CFString *);
  const void *v11;
  const void *v12;
  NSObject *v13;
  const __CFString *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const __CFString *v18;
  const __CFBoolean *v19;
  CFBooleanRef v20;
  CFNumberRef v21;
  const void *v22;
  int v23;
  CFNumberRef v24;
  const void *v25;
  const void *v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  __CFDictionary *v34;
  void *value;
  uint64_t valuePtr;
  uint8_t buf[16];
  uint64_t v38;

  value = 0;
  valuePtr = 0;
  result = 3758097084;
  if (!a2 || !theDict || !a4)
    return result;
  v9 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Name"));
  if (!v9)
  {
    if (CFDictionaryContainsKey(a2, CFSTR("Name")))
      goto LABEL_21;
    v9 = CFSTR("Generic UPS");
  }
  if (!qword_10000C098)
  {
    *(_OWORD *)buf = off_100008528;
    v38 = 0;
    qword_10000C098 = _sl_dlopen(buf, 0);
  }
  if (qword_10000C098 && sub_10000566C())
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
      sub_100006884();
    v10 = (uint64_t (*)(const __CFString *))sub_10000566C();
    if (!v10)
      sub_1000067E4();
    v11 = (const void *)v10(v9);
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue(a2, CFSTR("Name"), v11);
      CFRelease(v12);
      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_100006858();
  }
  else
  {
    v13 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreAccessories.framework not loaded!!\n", buf, 2u);
    }
  }
  CFDictionarySetValue(a2, CFSTR("Name"), v9);
LABEL_21:
  v14 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Transport Type"));
  if (v14)
  {
LABEL_22:
    CFDictionarySetValue(a2, CFSTR("Transport Type"), v14);
    goto LABEL_24;
  }
  if (!CFDictionaryContainsKey(a2, CFSTR("Transport Type")))
  {
    v14 = CFSTR("UNK");
    goto LABEL_22;
  }
LABEL_24:
  v15 = CFDictionaryGetValue(theDict, CFSTR("Vendor ID"));
  v16 = CFDictionaryGetValue(theDict, CFSTR("Product ID"));
  v17 = CFDictionaryGetValue(theDict, CFSTR("Model Number"));
  CFDictionarySetValue(a2, CFSTR("Is Present"), kCFBooleanTrue);
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    CFDictionarySetValue(a2, CFSTR("Is Charging"), kCFBooleanTrue);
    v18 = CFSTR("AC Power");
LABEL_31:
    CFDictionarySetValue(a2, CFSTR("Power Source State"), v18);
    goto LABEL_32;
  }
  v19 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Is Charging"));
  if (v19)
  {
    v20 = v19;
LABEL_28:
    CFDictionarySetValue(a2, CFSTR("Is Charging"), v20);
    goto LABEL_30;
  }
  if (!CFDictionaryContainsKey(a2, CFSTR("Is Charging")))
  {
    v20 = kCFBooleanFalse;
    goto LABEL_28;
  }
LABEL_30:
  v18 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Power Source State"));
  if (v18)
    goto LABEL_31;
  if (!CFDictionaryContainsKey(a2, CFSTR("Power Source State")))
  {
    v18 = CFSTR("Battery Power");
    goto LABEL_31;
  }
LABEL_32:
  if (v15)
    CFDictionarySetValue(a2, CFSTR("Vendor ID"), v15);
  if (v16)
    CFDictionarySetValue(a2, CFSTR("Product ID"), v16);
  if (v17)
    CFDictionarySetValue(a2, CFSTR("Model Number"), v17);
  LODWORD(valuePtr) = *(unsigned __int16 *)(a1 + 24) | (getpid() << 16);
  v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a2, CFSTR("Power Source ID"), v21);
  CFRelease(v21);
  v22 = CFDictionaryGetValue(theDict, CFSTR("Max Capacity"));
  if (v22)
  {
    CFDictionarySetValue(a2, CFSTR("Max Capacity"), v22);
  }
  else if (!CFDictionaryContainsKey(a2, CFSTR("Max Capacity")))
  {
    if ((*(_DWORD *)(a1 + 56) - 3) >= 2)
      v23 = 100;
    else
      v23 = 0;
    HIDWORD(valuePtr) = v23;
    v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, CFSTR("Max Capacity"), v24);
    CFRelease(v24);
  }
  v25 = CFDictionaryGetValue(theDict, CFSTR("Show Charging UI"));
  if (v25)
    CFDictionarySetValue(a2, CFSTR("Show Charging UI"), v25);
  if (CFSetContainsValue(a4, CFSTR("Current Capacity")))
  {
    if (CFDictionaryContainsKey(theDict, CFSTR("Current Capacity")))
    {
      v26 = CFDictionaryGetValue(theDict, CFSTR("Current Capacity"));
      CFDictionarySetValue(a2, CFSTR("Current Capacity"), v26);
    }
    else if (!CFDictionaryContainsKey(a2, CFSTR("Current Capacity")))
    {
      HIDWORD(valuePtr) = 0;
      v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
      CFDictionarySetValue(a2, CFSTR("Current Capacity"), v27);
      CFRelease(v27);
    }
  }
  if (CFSetContainsValue(a4, CFSTR("Time to Empty")))
  {
    HIDWORD(valuePtr) = 100;
    v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, CFSTR("Time to Empty"), v28);
    CFRelease(v28);
  }
  if (CFSetContainsValue(a4, CFSTR("Voltage")))
  {
    HIDWORD(valuePtr) = 130;
    v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, CFSTR("Voltage"), v29);
    CFRelease(v29);
  }
  if (CFSetContainsValue(a4, CFSTR("Current")))
  {
    HIDWORD(valuePtr) = 1;
    v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, CFSTR("Current"), v30);
    CFRelease(v30);
  }
  v31 = *(_DWORD *)(a1 + 56);
  if (v31 == 4)
    goto LABEL_61;
  if (v31 != 3)
  {
    if (v31 != 2)
    {
      v32 = CFSTR("Type");
      v33 = CFSTR("UPS");
      goto LABEL_64;
    }
LABEL_61:
    v32 = CFSTR("Type");
    v33 = CFSTR("Accessory Source");
LABEL_64:
    v34 = a2;
    goto LABEL_65;
  }
  CFDictionarySetValue(a2, CFSTR("Type"), CFSTR("Battery Case"));
  v32 = CFSTR("Accessory Category");
  v34 = a2;
  v33 = CFSTR("Battery Case");
LABEL_65:
  CFDictionarySetValue(v34, v32, v33);
  if (CFDictionaryGetValueIfPresent(theDict, CFSTR("Accessory Identifier"), (const void **)&value))
    CFDictionarySetValue(a2, CFSTR("Accessory Identifier"), value);
  result = CFDictionaryGetValueIfPresent(theDict, CFSTR("Accessory Category"), (const void **)&value);
  if ((_DWORD)result)
  {
    CFDictionarySetValue(a2, CFSTR("Accessory Category"), value);
    return 0;
  }
  return result;
}

uint64_t sub_100004B0C(uint64_t a1, const __CFDictionary *a2, const __CFSet *a3)
{
  uint64_t v3;
  const __CFDictionary *Mutable;
  uint64_t v8;
  char __str[20];

  v3 = 3758097084;
  if (a1 && a2 && a3)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
      sub_100004434(a1, Mutable, a2, a3);
    snprintf(__str, 0x14uLL, "/UPS%d", *(_DWORD *)(a1 + 24));
    v8 = IOPSCreatePowerSource(a1);
    ++dword_10000C064;
    if ((_DWORD)v8)
    {
      v3 = v8;
      *(_QWORD *)a1 = 0;
    }
    else
    {
      v3 = IOPSSetPowerSourceDetails(*(_QWORD *)a1, Mutable);
      if ((_DWORD)v3)
      {
        if (Mutable)
          CFRelease(Mutable);
      }
      else
      {
        *(_QWORD *)(a1 + 32) = Mutable;
      }
    }
  }
  return v3;
}

void sub_100004C38(uint64_t a1, CFTypeRef cf1)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v8;
  const void *Value;
  CFNumberRef v10;
  const CFBooleanRef *v11;
  CFBooleanRef v12;
  CFArrayRef v13;
  CFArrayRef v14;
  io_registry_entry_t v15;
  io_registry_entry_t v16;
  NSObject *v17;
  io_connect_t v18;
  io_object_t v19;
  io_object_t v20;
  NSObject *v21;
  io_service_t v23;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v25;
  __CFRunLoop *v26;
  __CFRunLoop *v27;
  NSObject *v28;
  CFTypeRef cf;
  IOPMAssertionID AssertionID;
  int v31;
  CFRunLoopTimerContext buf;
  void *values;
  CFBooleanRef v34;

  v3 = CFEqual(cf1, CFSTR("AC Power"));
  v31 = 0;
  if (*(_BYTE *)(a1 + 60))
  {
    LODWORD(values) = 0;
    LODWORD(cf) = 0;
    if (sub_1000057F4((io_service_t *)&values, (io_connect_t *)&cf))
      return;
    if (v3)
    {
      AssertionID = 0;
      IOPMAssertionCreateWithName(CFSTR("DisableInflow"), 0xFFu, CFSTR("com.apple.ioupsd.battery_case_disable_inflow"), &AssertionID);
      *(_BYTE *)(a1 + 72) = 1;
      v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection(cf, 0);
      IOAccessoryManagerRestoreUSBCurrentLimitBase(v4);
      IOAccessoryManagerSetUSBCurrentOffset(v4, 0);
      v5 = -21;
      v6 = values;
      while (!__CFADD__(v5++, 1))
      {
        usleep(0x3D090u);
        IOAccessoryManagerGetUSBCurrentLimitBase(v6, &v31);
        v8 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Battery Case AC Present: iLim = %d mA\n", (uint8_t *)&buf, 8u);
        }
        if (v31)
        {
          v21 = qword_10000C050;
          if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.version) = 67109120;
            HIDWORD(buf.version) = v31;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Initial downstream charger iLim: %d mA\n", (uint8_t *)&buf, 8u);
          }
          LODWORD(v6) = (_DWORD)values;
          goto LABEL_35;
        }
      }
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_1000069D4();
LABEL_35:
      IOAccessoryManagerSetUSBPowerIgnore(v4, 0);
      sub_100003068(a1, CFSTR("Set Current Limit"), v31);
      IOPMAssertionRelease(AssertionID);
      AssertionID = 0;
      IOObjectRetain(v6);
      IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v6, "IOGeneralInterest", (IOServiceInterestCallback)sub_100003628, (void *)a1, (io_object_t *)(a1 + 84));
      v23 = sub_100002104();
      IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v23, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000036E0, (void *)a1, (io_object_t *)(a1 + 88));
    }
    else
    {
      v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection(cf, 1);
      IOAccessoryManagerSetUSBPowerIgnore(v4, 1);
      IOAccessoryManagerSetUSBCurrentLimitBase(v4, 0);
      *(_BYTE *)(a1 + 72) = 0;
      v19 = *(_DWORD *)(a1 + 84);
      if (v19)
      {
        IOObjectRelease(v19);
        *(_DWORD *)(a1 + 84) = 0;
      }
      v20 = *(_DWORD *)(a1 + 88);
      if (v20)
      {
        IOObjectRelease(v20);
        *(_DWORD *)(a1 + 88) = 0;
      }
    }
    IOServiceClose(v4);
    goto LABEL_37;
  }
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("Transport Type"));
  if (!CFEqual(Value, CFSTR("Inductive In-Band")))
  {
    LODWORD(values) = 0;
    if (sub_1000057F4((io_service_t *)&buf, (io_connect_t *)&values))
      return;
    v18 = values;
    IOAccessoryManagerSetUSBPowerIgnore(values, v3 == 0);
    IOServiceClose(v18);
    goto LABEL_51;
  }
  values = 0;
  v34 = 0;
  buf.version = (CFIndex)CFSTR("Dock");
  buf.info = CFSTR("Mask");
  AssertionID = 2;
  v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &AssertionID);
  v11 = &kCFBooleanFalse;
  if (!v3)
    v11 = &kCFBooleanTrue;
  v12 = *v11;
  values = v10;
  v34 = v12;
  cf = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&buf, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_1000068E0();
    goto LABEL_37;
  }
  v13 = CFArrayCreate(kCFAllocatorDefault, &cf, 1, &kCFTypeArrayCallBacks);
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_10000690C();
    goto LABEL_37;
  }
  v14 = v13;
  CFRelease(cf);
  CFRelease(values);
  buf.version = (CFIndex)CFSTR("DockMask");
  values = v14;
  cf = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&buf, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_1000068E0();
    goto LABEL_37;
  }
  CFRelease(v14);
  v15 = sub_100002104();
  if (v15)
  {
    v16 = v15;
    v17 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
      sub_100006964(v3, v17);
    if (IORegistryEntrySetCFProperties(v16, cf))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_100006938();
      goto LABEL_37;
    }
    CFRelease(cf);
LABEL_51:
    *(_BYTE *)(a1 + 72) = v3;
    v28 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.version) = 67109120;
      HIDWORD(buf.version) = v3;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AC present %d\n", (uint8_t *)&buf, 8u);
    }
  }
LABEL_37:
  if (*(_BYTE *)(a1 + 61))
  {
    if (v3)
    {
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      Current = CFAbsoluteTimeGetCurrent();
      v25 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 5.0, 5.0, 0, 0, (CFRunLoopTimerCallBack)sub_100003768, &buf);
      *(_QWORD *)(a1 + 64) = v25;
      if (v25)
      {
        v26 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v26, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      }
      else if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      {
        sub_1000068B4();
      }
    }
    else if (*(_QWORD *)(a1 + 64))
    {
      v27 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v27, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 64));
      *(_QWORD *)(a1 + 64) = 0;
    }
  }
}

void sub_100005258(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFDictionary *MutableCopy;
  __CFDictionary *v4;
  const void *Value;
  CFIndex Count;
  uint64_t v7;
  size_t v8;
  const void **v9;
  const void **v10;
  const void **v11;
  const __CFNumber **v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const __CFNumber *v17;

  if (a1)
  {
    if (theDict)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
      if (MutableCopy)
      {
        v4 = MutableCopy;
        if (*(_DWORD *)(a1 + 56) == 3
          && *(_BYTE *)(a1 + 60)
          && !*(_BYTE *)(a1 + 72)
          && !CFDictionaryGetValue(MutableCopy, CFSTR("Battery Case Available Current")))
        {
          Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("Battery Case Available Current"));
          CFDictionarySetValue(v4, CFSTR("Battery Case Available Current"), Value);
        }
        Count = CFDictionaryGetCount(v4);
        if (Count)
        {
          v7 = Count;
          v8 = 8 * Count;
          v9 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
          v10 = (const void **)malloc_type_malloc(v8, 0xC0040B8AA526DuLL);
          CFDictionaryGetKeysAndValues(v4, v9, v10);
          if (v7 >= 1)
          {
            v11 = v9;
            v12 = (const __CFNumber **)v10;
            do
            {
              if (CFEqual(*v11, CFSTR("FamilyCode")) && *(_DWORD *)(a1 + 56) == 3)
              {
                v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (!v13 || !CFEqual(v13, *v12))
                  sub_100002A80(*v12);
              }
              else if (CFEqual(*v11, CFSTR("Power Source State")) && *(_DWORD *)(a1 + 56) == 3)
              {
                v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (v14 && !CFEqual(v14, *v12))
                  sub_100004C38(a1, *v12);
              }
              else if (CFEqual(*v11, CFSTR("Battery Case Available Current"))
                     && *(_DWORD *)(a1 + 56) == 3
                     && *(_BYTE *)(a1 + 60)
                     && !*(_BYTE *)(a1 + 72))
              {
                sub_100002EB0(*v12);
              }
              v16 = *v11++;
              v15 = v16;
              v17 = *v12++;
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v15, v17);
              --v7;
            }
            while (v7);
          }
          free(v9);
          free(v10);
          if (IOPSSetPowerSourceDetails(*(_QWORD *)a1, *(_QWORD *)(a1 + 32)))
          {
            if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
              sub_100006A00();
          }
        }
        CFRelease(v4);
      }
    }
  }
}

void sub_1000054B8(int a1, int a2, uint64_t a3, int a4, CFDictionaryRef theDict)
{
  sub_100005258(a3, theDict);
}

void sub_1000054C4(uint64_t a1, uint64_t a2, int a3)
{
  const __CFDictionary *v4;
  const void *Value;
  CFTypeID TypeID;
  BOOL v7;

  if (a1 && a3 == -536870896)
  {
    v4 = *(const __CFDictionary **)(a1 + 32);
    if (v4
      && (Value = CFDictionaryGetValue(v4, CFSTR("Transport Type")), TypeID = CFStringGetTypeID(), Value)
      && CFGetTypeID(Value) == TypeID
      && CFEqual(Value, CFSTR("Inductive In-Band")))
    {
      v7 = (byte_10000C048 & 0xFD) == 0;
      byte_10000C048 &= ~2u;
      if (v7)
      {
        sub_10000558C(a1);
        qword_10000C090 = 0;
      }
      else
      {
        sub_1000058D4(a1);
      }
    }
    else
    {
      sub_10000558C(a1);
    }
  }
}

void sub_10000558C(uint64_t a1)
{
  const __CFNumber *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  int valuePtr;

  if (a1)
  {
    *(_BYTE *)(a1 + 28) = 0;
    if (*(_DWORD *)(a1 + 56) == 3)
    {
      valuePtr = 0;
      v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      sub_100002A80(v2);
    }
    sub_1000058D4(a1);
    if (*(_QWORD *)a1)
    {
      v3 = IOPSReleasePowerSource();
      --dword_10000C064;
      if ((_DWORD)v3)
      {
        v4 = v3;
        v5 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
          sub_100006A2C(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      *(_QWORD *)a1 = 0;
    }
    v12 = *(const void **)(a1 + 32);
    if (v12)
    {
      CFRelease(v12);
      *(_QWORD *)(a1 + 32) = 0;
    }
    if (!dword_10000C064)
    {
      CFRelease((CFTypeRef)qword_10000C070);
      sub_100002A14();
    }
  }
}

uint64_t sub_10000566C()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_10000C0A0;
  v6 = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10000571C;
    v2[3] = &unk_100008548;
    v2[4] = &v3;
    sub_10000571C((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100005704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10000571C(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_10000C098)
  {
    v5 = off_100008528;
    v6 = 0;
    qword_10000C098 = _sl_dlopen(&v5, &v4);
  }
  v2 = (void *)qword_10000C098;
  if (!qword_10000C098)
    sub_100006A90(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "ACCConnectionInfoCopyLocalizedAccessoryNameCF");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_10000C0A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000057F4(io_service_t *a1, io_connect_t *a2)
{
  io_service_t ServiceWithPrimaryPort;
  io_service_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  io_connect_t connect;

  connect = 0;
  ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1);
  if (ServiceWithPrimaryPort)
  {
    v5 = ServiceWithPrimaryPort;
    if (IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect))
    {
      v6 = 3758097101;
      v7 = (void *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        sub_1000065B8(v7);
    }
    else
    {
      v6 = 0;
      *a1 = v5;
      *a2 = connect;
    }
  }
  else
  {
    v8 = qword_10000C050;
    v6 = 3758097136;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      sub_10000654C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return v6;
}

uint64_t sub_1000058D4(uint64_t a1)
{
  __CFRunLoop *Current;
  __CFRunLoop *v3;
  void *v4;
  uint64_t v5;
  io_object_t v6;
  io_object_t v7;
  io_object_t v8;
  uint64_t result;

  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 40), kCFRunLoopDefaultMode);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    *(_QWORD *)(a1 + 40) = 0;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v3, *(CFRunLoopTimerRef *)(a1 + 48), kCFRunLoopDefaultMode);
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v6 = *(_DWORD *)(a1 + 80);
  if (v6)
  {
    IOObjectRelease(v6);
    *(_DWORD *)(a1 + 80) = 0;
  }
  v7 = *(_DWORD *)(a1 + 84);
  if (v7)
  {
    IOObjectRelease(v7);
    *(_DWORD *)(a1 + 84) = 0;
  }
  v8 = *(_DWORD *)(a1 + 88);
  if (v8)
  {
    IOObjectRelease(v8);
    *(_DWORD *)(a1 + 88) = 0;
  }
  result = *(unsigned int *)(a1 + 8);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

void sub_100005998(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000059BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000059CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000059E0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000059F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

char *sub_100005A24()
{
  mach_error_t v0;

  return mach_error_string(v0);
}

uint64_t sub_100005A38(_DWORD *a1, uint64_t a2)
{
  int v2;
  _DWORD *v5;
  int v6;

  v2 = a1[5];
  if (v2 < 60000 || v2 >= 60003)
    return 0;
  v5 = (_DWORD *)((char *)a1 + ((a1[1] + 3) & 0x1FFFFFFFCLL));
  if (*v5 || v5[1] < 0x14u)
    v6 = -1;
  else
    v6 = v5[3];
  dword_10000C040 = v6;
  return sub_1000062C8(a1, a2);
}

void sub_100005A98(uint64_t a1, mach_msg_header_t *a2)
{
  mach_msg_header_t *v3;
  mach_msg_header_t *v4;
  mach_port_t msgh_remote_port;
  mach_msg_option_t v6;

  v3 = (mach_msg_header_t *)CFAllocatorAllocate(0, 56, 0);
  v4 = v3;
  if (v3)
    bzero(v3, 0x38uLL);
  sub_100005A38(a2, (uint64_t)v4);
  if ((v4->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v4[1].msgh_remote_port;
    if (msgh_remote_port == -305)
      goto LABEL_13;
    if (msgh_remote_port)
    {
      a2->msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (!v4->msgh_remote_port)
  {
    if ((v4->msgh_bits & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if ((v4->msgh_bits & 0x1F) == 0x12)
    v6 = 17;
  else
    v6 = 1;
  if ((mach_msg(v4, v6, v4->msgh_size, 0, 0, 0, 0) - 268435459) <= 1)
LABEL_12:
    mach_msg_destroy(v4);
LABEL_13:
  CFAllocatorDeallocate(0, v4);
}

uint64_t sub_100005B7C(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  mach_port_t reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_msg_header_t msg;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  NDR_record_t v14;
  int v15;
  int v16;

  v10 = 1;
  v11 = a3;
  v12 = 16777472;
  v13 = a4;
  v14 = NDR_record;
  v15 = a2;
  v16 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0xEA6000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v6 = mach_msg(&msg, 3, 0x3Cu, 0x2Cu, reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v7;
  }
  if ((_DWORD)v6)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v7;
  }
  if (msg.msgh_id == 71)
  {
    v7 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v7;
  }
  if (msg.msgh_id != 60100)
  {
    v7 = 4294966995;
    goto LABEL_17;
  }
  v7 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v7 = HIDWORD(v11);
  if (HIDWORD(v11))
    goto LABEL_17;
  return v7;
}

uint64_t sub_100005CF0(mach_port_t a1, int a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  mach_msg_header_t msg;
  _QWORD v13[5];

  memset((char *)&v13[1] + 4, 0, 28);
  msg.msgh_size = 0;
  v13[0] = NDR_record;
  LODWORD(v13[1]) = a2;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0xEA6100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        v9 = 4294966988;
      }
      else if (msg.msgh_id == 60101)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v9 = 4294966996;
          if (LODWORD(v13[0]) == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v13[1]) == 1)
          {
            v10 = v13[2];
            if (LODWORD(v13[2]) == HIDWORD(v13[3]))
            {
              v9 = 0;
              *a3 = *(_QWORD *)((char *)v13 + 4);
              *a4 = v10;
              return v9;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v9 = 4294966996;
          if (LODWORD(v13[1]))
          {
            if (msg.msgh_remote_port)
              v9 = 4294966996;
            else
              v9 = LODWORD(v13[1]);
          }
        }
        else
        {
          v9 = 4294966996;
        }
      }
      else
      {
        v9 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v9;
}

uint64_t sub_100005EC8(mach_port_t a1, int a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  mach_msg_header_t msg;
  _QWORD v13[5];

  memset((char *)&v13[1] + 4, 0, 28);
  msg.msgh_size = 0;
  v13[0] = NDR_record;
  LODWORD(v13[1]) = a2;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0xEA6200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        v9 = 4294966988;
      }
      else if (msg.msgh_id == 60102)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v9 = 4294966996;
          if (LODWORD(v13[0]) == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v13[1]) == 1)
          {
            v10 = v13[2];
            if (LODWORD(v13[2]) == HIDWORD(v13[3]))
            {
              v9 = 0;
              *a3 = *(_QWORD *)((char *)v13 + 4);
              *a4 = v10;
              return v9;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v9 = 4294966996;
          if (LODWORD(v13[1]))
          {
            if (msg.msgh_remote_port)
              v9 = 4294966996;
            else
              v9 = LODWORD(v13[1]);
          }
        }
        else
        {
          v9 = 4294966996;
        }
      }
      else
      {
        v9 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v9;
}

uint64_t sub_1000060A0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 60003) >= 0xFFFFFFFD)
    return (uint64_t)*(&off_100008568 + 5 * (v1 - 60000) + 5);
  else
    return 0;
}

uint64_t sub_1000060DC(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    v3 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_9;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 56))
  {
    v3 = -300;
    goto LABEL_8;
  }
  result = sub_10000385C(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(char **)(result + 28));
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100006170(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)sub_10000391C(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_10000621C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)sub_100003A30(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_1000062C8(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 60003) >= 0xFFFFFFFD
    && (v5 = (void (*)(void))*(&off_100008568 + 5 * (v4 - 60000) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100006358(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "com.apple.IOUPSPlugInServer";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ioupsd: bootstrap_check_in \"%s\" error = %d\n", (uint8_t *)&v2, 0x12u);
  sub_100005A30();
}

void sub_1000063DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000059BC((void *)&_mh_execute_header, a2, a3, "IOServiceAddInterestNotification failed: %x\n", a5, a6, a7, a8, 0);
  sub_1000059A8();
}

void sub_100006440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "failed to find IOPMPowerSource\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_10000646C()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  sub_100005A00();
  sub_1000059E0((void *)&_mh_execute_header, v0, v1, "IsCurrentLimitControlRequired: invalid UPS struct upsData=%p, storeDict%p\n", v2, v3);
  sub_100005A30();
}

void sub_1000064DC()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  sub_100005A00();
  sub_1000059E0((void *)&_mh_execute_header, v0, v1, "AreAverageChargeCurrentUpdatesRequired: invalid UPS struct upsData=%p, storeDict%p\n", v2, v3);
  sub_100005A30();
}

void sub_10000654C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000059BC((void *)&_mh_execute_header, a1, a3, "could not find IOAccessoryManager service for port %d\n", a5, a6, a7, a8, 0);
  sub_1000059A8();
}

void sub_1000065B8(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  sub_100005A24();
  sub_1000059CC((void *)&_mh_execute_header, v3, v4, "could not open IOAccessoryManager service: %s\n", v5, v6, v7, v8, 2u);

  sub_100005A18();
}

void sub_100006630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for assigned address\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_10000665C(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  v3 = *(_DWORD *)(a1 + 24);
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10[0] = 67110656;
  v10[1] = v3;
  v11 = 1024;
  v12 = v4;
  v13 = 1024;
  v14 = v5;
  v15 = 1024;
  v16 = v6;
  v17 = 1024;
  v18 = v7;
  v19 = 1024;
  v20 = v8;
  v21 = 1024;
  v22 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "assigning battery case (ID=%d) new address: %02x %02x %02x %0x %02x %02x\n", (uint8_t *)v10, 0x2Cu);
}

void sub_100006724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "unable to send new current limit\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "unable to get new current limit\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_10000677C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000059F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "UPSDeviceAdded: isInductive: Created\n", a1);
}

void sub_1000067B0(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000059F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "UPSDeviceAdded: isInductive\n", a1);
}

void sub_1000067E4()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFStringRef softACCConnectionInfoCopyLocalizedAccessoryNameCF(CFStringRef)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("upsd.m"), 76, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_100006858()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "Localization failed, use original!!\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006884()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_1000059B0();
  sub_1000059F4((void *)&_mh_execute_header, v0, v1, "Using CoreAccessories.framework\n", v2);
  sub_1000059A8();
}

void sub_1000068B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "failed to create polling timer to send average charging current\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_1000068E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "failed to create dictionary\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_10000690C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "failed to create array\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "failed to set properties on IOPMPS\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006964(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "HandleACStateChange: ACPowerValue:%d\n", (uint8_t *)v2, 8u);
  sub_1000059A8();
}

void sub_1000069D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "Timedout waiting for AC charger's current limit\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006A00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000059B0();
  sub_100005998((void *)&_mh_execute_header, v0, v1, "updating power source details failed\n", v2, v3, v4, v5, v6);
  sub_1000059A8();
}

void sub_100006A2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000059BC((void *)&_mh_execute_header, a2, a3, "IOPSReleasePowerSource failed (IOReturn: %d)\n", a5, a6, a7, a8, 0);
  sub_1000059A8();
}

void sub_100006A90(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreAccessoriesLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("upsd.m"), 74, CFSTR("%s"), *a1);

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}
