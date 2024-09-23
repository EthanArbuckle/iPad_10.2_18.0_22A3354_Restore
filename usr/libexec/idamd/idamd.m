void sub_100002F58()
{
  CFMutableDictionaryRef v0;
  __CFDictionary *v1;
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  io_service_t MatchingService;
  NSObject *v5;
  const __CFUUID *v6;
  const __CFUUID *v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  IOCFPlugInInterface **v16;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v18;
  CFUUIDBytes v19;
  int v20;
  uint64_t v21;
  kern_return_t v22;
  kern_return_t v23;
  NSObject *v24;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint64_t v27;
  uint8_t buf[4];
  kern_return_t v29;

  theInterface = 0;
  v27 = 0;
  theScore = 0;
  v0 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v0)
  {
    v14 = qword_100008000;
    if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v11 = "Failed to create matchingDict";
    v12 = v14;
    v13 = 2;
    goto LABEL_11;
  }
  v1 = v0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("USBDeviceFunction"), CFSTR("IDAMInterface"));
    CFDictionarySetValue(v1, CFSTR("IOPropertyMatch"), v3);
    CFRelease(v3);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      v5 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to find a matching service!", buf, 2u);
      }
    }
    v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v8 = IOCreatePlugInInterfaceForService(MatchingService, v6, v7, &theInterface, &theScore);
    if (v8)
    {
      v9 = v8;
      v10 = qword_100008000;
      if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 67109120;
      v29 = v9;
      v11 = "IOCreatePlugInInterfaceForService failed: 0x%08x";
      v12 = v10;
      v13 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      return;
    }
    v16 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    v18 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v19 = CFUUIDGetUUIDBytes(v18);
    v20 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v16, *(_QWORD *)&v19.byte0, *(_QWORD *)&v19.byte8, &v27);
    v21 = v27;
    if (!v20 && v27)
    {
      v22 = (*(uint64_t (**)(void))(*(_QWORD *)v27 + 248))();
      if (v22)
      {
        v23 = v22;
        v24 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v29 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "com.apple.idamd couldn't set the IDAM configuration due to error 0x%x", buf, 8u);
        }
      }
      else
      {
        syslog(5, "com.apple.idamd set IDAM configuration.");
      }
      v21 = v27;
    }
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
    if (theInterface)
      IODestroyPlugInInterface(theInterface);
  }
  else
  {
    v15 = qword_100008000;
    if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed CFDictionaryCreateMutable", buf, 2u);
    }
    CFRelease(v1);
  }
}

uint64_t sub_100003308()
{
  uint64_t v0;
  NSObject *v1;
  _BOOL4 v2;
  CFTypeRef cf;
  uint8_t buf[4];
  int v6;

  cf = 0;
  v0 = IOUSBDeviceControllerCreate(kCFAllocatorDefault, &cf);
  v1 = qword_100008000;
  v2 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v0)
  {
    if (v2)
    {
      *(_DWORD *)buf = 67109120;
      v6 = v0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "com.apple.idamd couldn't create an IOUSBDeviceControllerRef due to error 0x%x", buf, 8u);
    }
  }
  else
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "com.apple.idamd set default USB configuration.", buf, 2u);
    }
    IOUSBDeviceControllerGoOffAndOnBus(cf, 10);
    CFRelease(cf);
  }
  return v0;
}

BOOL sub_100003408()
{
  const __CFDictionary *v0;
  _BOOL8 v1;
  NSObject *v2;
  const char *v3;
  int v5;
  const char *v6;

  v0 = IOServiceMatching("AppleUSBDeviceAudioDevice");
  if (v0)
    v1 = IOServiceGetMatchingService(kIOMasterPortDefault, v0) != 0;
  else
    v1 = 0;
  v2 = qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "false";
    if (v1)
      v3 = "true";
    v5 = 136315138;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "inIDAMConfiguration returning %s", (uint8_t *)&v5, 0xCu);
  }
  return v1;
}

void sub_1000034F0(uint64_t a1)
{
  __CFDictionary *Mutable;
  int v3;
  const void *v4;
  CFTypeID v5;
  NSObject *v6;
  const __CFDictionary *Copy;
  NSObject *v8;
  int v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  CFBooleanRef v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  CFBooleanRef v17;
  const __CFBoolean *Value;
  const __CFBoolean *v19;
  NSObject *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  _BYTE cf[12];
  uint8_t buf[4];
  int v27;

  while (1)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    *(_QWORD *)cf = 0;
    v3 = lockdown_receive_message(a1, cf);
    v4 = *(const void **)cf;
    if (!v3 && *(_QWORD *)cf)
    {
      v5 = CFGetTypeID(*(CFTypeRef *)cf);
      if (v5 == CFDictionaryGetTypeID())
      {
        v6 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lockdown_receive_message received a plist mesage.\n", buf, 2u);
        }
        Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, *(CFDictionaryRef *)cf);
LABEL_11:
        v4 = *(const void **)cf;
        if (!*(_QWORD *)cf)
          goto LABEL_13;
LABEL_12:
        CFRelease(v4);
        goto LABEL_13;
      }
LABEL_10:
      Copy = 0;
      goto LABEL_11;
    }
    if (v3)
    {
      v8 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v27 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lockdown_receive_message returned error %x\n", buf, 8u);
      }
      goto LABEL_10;
    }
    Copy = 0;
    if (*(_QWORD *)cf)
      goto LABEL_12;
LABEL_13:
    if (!Copy)
      break;
    v9 = CFDictionaryContainsKey(Copy, CFSTR("Configuration Inquiry"));
    if (v9)
    {
      v10 = sub_100003408();
      v11 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        v12 = "Default";
        if (v10)
          v12 = "IDAM";
        *(_DWORD *)cf = 136315138;
        *(_QWORD *)&cf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Configuration Inquiry -> %s configuration\n", cf, 0xCu);
      }
      if (v10)
        v13 = kCFBooleanTrue;
      else
        v13 = kCFBooleanFalse;
      CFDictionaryAddValue(Mutable, CFSTR("IDAM Configuration Active"), v13);
      v14 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
      if ((MGGetBoolAnswer(CFSTR("s+gaKNe68Gs3PfqKrZhi1w")) & 1) != 0
        || (v17 = kCFBooleanFalse, (v14 - 1) >= 4) && (v17 = kCFBooleanFalse, v14 != 7))
      {
        v15 = qword_100008000;
        v16 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
        v17 = kCFBooleanTrue;
        if (v16)
        {
          *(_WORD *)cf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Configuration Inquiry -> Low End Hardware", cf, 2u);
          v17 = kCFBooleanTrue;
        }
      }
      CFDictionaryAddValue(Mutable, CFSTR("Low End Hardware"), v17);
    }
    if (!CFDictionaryContainsKey(Copy, CFSTR("Set IDAM Configuration"))
      || (Value = (const __CFBoolean *)CFDictionaryGetValue(Copy, CFSTR("Set IDAM Configuration"))) == 0)
    {
LABEL_37:
      if (!v9)
        goto LABEL_41;
LABEL_38:
      v21 = lockdown_send_message(a1, Mutable, 200);
      if (v21)
      {
        v22 = v21;
        v23 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 67109120;
          *(_DWORD *)&cf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Got error %x from lockdown_send_message\n", cf, 8u);
        }
      }
      goto LABEL_41;
    }
    v19 = Value;
    if (CFBooleanGetValue(Value))
    {
      v20 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> TRUE\n", cf, 2u);
      }
      sub_100002F58();
      if (v9)
        goto LABEL_38;
    }
    else
    {
      if (CFBooleanGetValue(v19))
        goto LABEL_37;
      v24 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> FALSE\n", cf, 2u);
      }
      sub_100003308();
      if (v9)
        goto LABEL_38;
    }
LABEL_41:
    CFRelease(Copy);
    CFRelease(Mutable);
  }
  CFRelease(Mutable);
}

void start()
{
  NSObject *v0;
  uint8_t v1[16];

  lockdown_checkin_xpc("com.apple.idamd", 0, 0, &stru_100004148);
  v0 = qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "com.apple.idamd now checked in with lockdown.", v1, 2u);
  }
  dispatch_main();
}

void sub_100003990(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  sub_1000034F0((uint64_t)a2);
  lockdown_disconnect(a2);
}

os_log_t sub_1000039B8()
{
  os_log_t result;

  result = os_log_create("com.apple.idamd", "idam");
  qword_100008000 = (uint64_t)result;
  return result;
}
