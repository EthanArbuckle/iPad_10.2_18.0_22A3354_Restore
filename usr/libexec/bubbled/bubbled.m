void sub_100003B64(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RDClient));
  v2 = (void *)qword_100011D00;
  qword_100011D00 = v1;

}

void sub_100003BD8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BDBubbled));
  v2 = (void *)qword_100011D10;
  qword_100011D10 = v1;

}

void sub_100003E20(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcConnection"));
    NSLog(CFSTR("Could not get proxy object for client connection: %@"), v2);

  }
}

void sub_100003ED8(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcConnection"));
    NSLog(CFSTR("Could not get proxy object for client connection: %@"), v2);

  }
}

uint64_t sub_1000043D0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  _DWORD v9[2];

  objc_msgSend(*(id *)(a1 + 32), "setWasToldWillSwitchUser:", 1);
  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v2 = (id)qword_100011D20;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 0;
    LODWORD(v3) = sub_1000066E0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      v3 = v3;
    else
      v3 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v3)
    {
      v4 = *(void **)(a1 + 32);
      v5 = v2;
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v4, "pid");
      v6 = (void *)_os_log_send_and_compose_impl(v3, &v8, 0, 0, &_mh_execute_header, v5, 0, "willSwitchToUser:client: Set wasToldWillSwitchUser: Pid:%d", v9);

      if (v6)
        sub_1000066E8();
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000045F0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  _DWORD v9[2];

  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v2 = (id)qword_100011D20;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 0;
    LODWORD(v3) = sub_1000066E0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      v3 = v3;
    else
      v3 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v3)
    {
      v4 = *(void **)(a1 + 32);
      v5 = v2;
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v4, "pid");
      v6 = (void *)_os_log_send_and_compose_impl(v3, &v8, 0, 0, &_mh_execute_header, v5, 0, "personaListDidUpdateCompletionHandler was told to Pid:%d", v9);

      if (v6)
        sub_1000066E8();
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_100004930(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  _DWORD v9[2];

  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v2 = (id)qword_100011D20;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 0;
    LODWORD(v3) = sub_1000066E0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      v3 = v3;
    else
      v3 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v3)
    {
      v4 = *(void **)(a1 + 32);
      v5 = v2;
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v4, "pid");
      v6 = (void *)_os_log_send_and_compose_impl(v3, &v8, 0, 0, &_mh_execute_header, v5, 0, "personaUpdateCallbackForMachServiceCompletionHandler was told to Pid:%d", v9);

      if (v6)
        sub_1000066E8();
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100005134(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(off_100011CF8, "legacy");
  v2 = (void *)qword_100011D20;
  qword_100011D20 = (uint64_t)v1;

}

const void *sub_100005168(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

const void *sub_1000051A0(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_1000051D8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  unsigned int valuePtr;

  v2 = 0xFFFFFFFFLL;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t sub_100005240(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

uint64_t sub_1000052A8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

const __CFBoolean *sub_100005310(const __CFDictionary *a1, const void *a2)
{
  const __CFBoolean *result;
  const __CFBoolean *v3;
  CFTypeID v4;

  result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID())
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    else
      return 0;
  }
  return result;
}

const void *sub_100005360(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    return 0;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 0;
  return v3;
}

BOOL sub_1000053A0(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  const __CFString *v6;

  v6 = (const __CFString *)sub_100005360(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_1000053EC(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (v3 = Value, v4 = CFGetTypeID(Value), v4 == CFDictionaryGetTypeID()))
    return CFRetain(v3);
  else
    return 0;
}

CFTypeRef sub_100005438(const void *a1)
{
  __CFWriteStream *v2;
  __CFWriteStream *v3;
  CFTypeRef v4;

  v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1)
      v4 = 0;
    else
      v4 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
    CFWriteStreamClose(v3);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_1000054DC(UInt8 *bytes, CFIndex length)
{
  __CFReadStream *v2;
  __CFReadStream *v3;
  CFPropertyListRef v4;
  CFPropertyListFormat format;

  format = kCFPropertyListBinaryFormat_v1_0;
  v2 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
  if (v2)
  {
    v3 = v2;
    if (CFReadStreamOpen(v2))
    {
      v4 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v3, 0, 2uLL, &format, 0);
      if (!v4)
        syslog(7, "Could not create object from stream");
      CFReadStreamClose(v3);
    }
    else
    {
      syslog(7, "Could not open the stream");
      v4 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    syslog(7, "Could not create stream for serialized data");
    return 0;
  }
  return v4;
}

const void *sub_1000055B8(UInt8 *bytes, CFIndex length)
{
  const void *v2;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  CFTypeID v7;
  CFPropertyListFormat format;

  v2 = 0;
  format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    v4 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
    if (!v4)
    {
      syslog(7, "Could not create stream from serialized data");
      return 0;
    }
    v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      v6 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v5, length, 2uLL, &format, 0);
      v2 = v6;
      if (!v6)
      {
        syslog(7, "Could not create dictionary from stream");
        goto LABEL_9;
      }
      v7 = CFGetTypeID(v6);
      if (v7 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v5);
        CFRelease(v5);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      syslog(7, "Could not open the stream");
    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *sub_1000056CC(const char *a1)
{
  int v2;
  int v3;
  void *v4;
  ssize_t v5;
  const void *v6;
  int *v8;
  char *v9;
  int *v10;
  char *v11;
  int *v12;
  stat v13;

  memset(&v13, 0, sizeof(v13));
  v2 = open(a1, 0);
  if (v2 == -1)
  {
    v8 = __error();
    v9 = strerror(*v8);
    syslog(7, "Could not open %s: %s", a1, v9);
    v4 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v3 = v2;
  if (fstat(v2, &v13))
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(7, "Could not fstat %s: %s", a1, v11);
    v6 = 0;
    v4 = 0;
    goto LABEL_6;
  }
  v4 = malloc_type_malloc(LODWORD(v13.st_size), 0x772E5F62uLL);
  if (!v4)
  {
    syslog(7, "Could not allocate buffer");
LABEL_12:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = read(v3, v4, v13.st_size);
  if (v5 != v13.st_size)
  {
    v12 = __error();
    strerror(*v12);
    syslog(7, "Could not read %s: %s");
    goto LABEL_12;
  }
  v6 = sub_1000055B8((UInt8 *)v4, v5);
LABEL_6:
  close(v3);
LABEL_7:
  free(v4);
  return v6;
}

CFMutableDictionaryRef sub_100005814()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFMutableDictionaryRef sub_100005864(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFMutableArrayRef sub_1000058A8()
{
  CFMutableArrayRef result;

  result = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFStringRef sub_1000058F0(char *cStr)
{
  CFStringRef result;

  result = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

uint64_t sub_100005938(uint32_t *a1)
{
  mach_port_t v2;
  uint64_t result;
  uint32_t multiuser_flags;

  multiuser_flags = 0;
  v2 = mach_host_self();
  result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result)
      *a1 = multiuser_flags;
  }
  return result;
}

uint64_t sub_10000597C(mach_port_name_t name)
{
  mach_port_type_t ptype;

  ptype = 0;
  if (mach_port_type(mach_task_self_, name, &ptype))
    return 0;
  else
    return ptype;
}

void sub_1000059BC(mach_port_name_t name)
{
  kern_return_t v2;
  mach_port_type_t v3;
  BOOL v4;
  mach_port_type_t ptype;

  ptype = 0;
  v2 = mach_port_type(mach_task_self_, name, &ptype);
  v3 = ptype;
  if (v2)
    v4 = 1;
  else
    v4 = ptype == 0;
  if (v4)
  {
    syslog(7, "Port:%d has NORIGHTS");
    return;
  }
  if ((ptype & 0x10000) != 0)
  {
    syslog(7, "Port:%d has SENDRIGHT", name);
    if ((v3 & 0x20000) == 0)
    {
LABEL_9:
      if ((v3 & 0x40000) == 0)
        goto LABEL_10;
LABEL_14:
      syslog(7, "Port:%d has SENDONCERIGHT", name);
      if ((v3 & 0x100000) == 0)
        return;
      goto LABEL_15;
    }
  }
  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  syslog(7, "Port:%d has RECEIVERIGHT", name);
  if ((v3 & 0x40000) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v3 & 0x100000) != 0)
LABEL_15:
    syslog(7, "Port:%d has DEADNAME");
}

uint64_t sub_100005A94()
{
  size_t __len;
  char __big[1024];

  __len = 1023;
  bzero(__big, 0x400uLL);
  if (sysctlbyname("kern.bootargs", __big, &__len, 0, 0) || strnstr(__big, "um-migration-debug=0", __len))
    return 0;
  if (strnstr(__big, "um-migration-debug=1", __len))
    return 1;
  if (strnstr(__big, "um-migration-debug=2", __len))
    return 2;
  if (strnstr(__big, "um-migration-debug=3", __len))
    return 3;
  if (strnstr(__big, "um-migration-debug=4", __len))
    return 4;
  if (strnstr(__big, "um-migration-debug=5", __len))
    return 5;
  if (strnstr(__big, "um-migration-debug=100", __len))
    return 100;
  if (strnstr(__big, "um-migration-debug=101", __len))
    return 101;
  return 0;
}

id sub_100005C88(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_100011D30;
  qword_100011D30 = v1;

  return objc_msgSend((id)qword_100011D30, "setSwitchState:", 0);
}

void sub_100005D00(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BDServer));
  v2 = (void *)qword_100011D40;
  qword_100011D40 = v1;

}

void sub_100005D74(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BDKeybagd));
  v2 = (void *)qword_100011D50;
  qword_100011D50 = v1;

}

void sub_1000066AC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(off_100011CF8, "legacy");
  v2 = (void *)qword_100011D60;
  qword_100011D60 = (uint64_t)v1;

}

uint64_t sub_1000066E0()
{
  return 1;
}

void sub_1000066E8()
{
  _os_crash("Unexpected composed log message.");
  __break(1u);
}

uint64_t start()
{
  void *v0;
  NSObject *v1;
  NSString *v2;
  void *v3;
  BDBubbled *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  char v11[1024];

  v0 = objc_autoreleasePoolPush();
  if (qword_100011D80 != -1)
    dispatch_once(&qword_100011D80, &stru_10000C4D0);
  v1 = (id)qword_100011D78;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v11 = 0;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      if (_os_log_send_and_compose_impl(1, v11, 0, 0, &_mh_execute_header, v1, 0, "Starting bubbled...", &v10, 2))
      {
        sub_1000066E8();
      }
    }
  }

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  NSLog(CFSTR("NSTemDir is %@"), v3);
  bzero(v11, 0x400uLL);
  if (confstr(65537, v11, 0x400uLL))
    NSLog(CFSTR("confstr returns %s"), v11);
  else
    NSLog(CFSTR("confstr failed"), v8);
  bzero(v11, 0x400uLL);
  if (getenv("TMPDIR"))
    NSLog(CFSTR("getenv TMPDIR returns %s"), v11);
  else
    NSLog(CFSTR("getenv failed"), v9);

  v4 = objc_opt_new(BDBubbled);
  v5 = (void *)qword_100011D70;
  qword_100011D70 = (uint64_t)v4;

  objc_msgSend((id)qword_100011D70, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v6, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_1000068E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(off_100011CF8, "default");
  v2 = (void *)qword_100011D78;
  qword_100011D78 = (uint64_t)v1;

}

void sub_100006958(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BDBubbled));
  v2 = (void *)qword_100011D88;
  qword_100011D88 = v1;

}

void sub_1000069CC(id a1, NSError *a2)
{
  if (a2)
    NSLog(CFSTR("Could not get keybagd remote object proxy, error: %@"), a2);
}

void sub_100006CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006D14(id a1)
{
  NSLog(CFSTR("BUBBLED: interruptionHandler"));
}

void sub_100006D30(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  NSLog(CFSTR("BUBBLED: invalidationHandler"));
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "keybagdConnection"));
  objc_msgSend(v3, "suspend");

  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "setKeybagdConnection:", 0);

}

void sub_100006E84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006EA8(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(a2, "mutableCopy");
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setMachServiceNames:", v3);

  v5 = objc_loadWeakRetained(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "machServiceNames"));
  NSLog(CFSTR("BUBBLED: MachService received:%@"), v6);

  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "beginNextClient");

}

void sub_1000071A4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000071D4(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("interruptionHandler  Bubbled-nextclient"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "kickstartCurrentClient");

}

void sub_100007218(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("Invalidation Handler Bubbled-nextclient"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeCurrentClient");

}

void sub_100007384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_1000073C0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000073D0(uint64_t a1)
{

}

void sub_1000073D8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  NSLog(CFSTR("*** Upload completion handler for MACHService ***"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  v4 = objc_msgSend(v3, "hasUserSyncTasks");

  if ((v4 & 1) != 0)
  {
    NSLog(CFSTR("*** Has Pending sync tasks ***"));
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "machServiceNames"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    if (v8)
    {
      NSLog(CFSTR("***** Removing Current Service:%@ ********"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v9 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v9, "removeCurrentClientAndMachServiceName");

    }
    else
    {
      NSLog(CFSTR("*** completion handler for %@ does not match current service, ignoring.. ***"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    }
  }
}

void sub_100007750(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100007774(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  unsigned __int8 v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  v4 = objc_msgSend(v3, "hasUserSwitchTasks");

  if ((v4 & 1) == 0)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "bubbleIsOkayToPop");

  }
}

void sub_100007994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000079B4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  objc_msgSend(v2, "addUserSwitchTask:", *(_QWORD *)(a1 + 32));

}

void sub_100007AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007B18(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  objc_msgSend((id)v4, "removeUserSwitchTask:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentClient"));
  LOBYTE(v4) = objc_msgSend(v6, "hasUserSwitchTasks");

  if ((v4 & 1) == 0)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "bubbleIsOkayToPop");

  }
}

void sub_100007CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007CEC(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  objc_msgSend(v2, "addUserSyncTask:", *(_QWORD *)(a1 + 32));

}

void sub_100007E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007E50(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentClient"));
  objc_msgSend((id)v4, "removeUserSyncTask:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentClient"));
  LOBYTE(v4) = objc_msgSend(v6, "hasUserSyncTasks");

  if ((v4 & 1) == 0)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "removeCurrentClientAndMachServiceName");

  }
}

id objc_msgSend_StopBubbleWithPID_WithUID_WithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "StopBubbleWithPID:WithUID:WithStatus:");
}

id objc_msgSend__clientForPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clientForPID:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addUserSwitchTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserSwitchTask:");
}

id objc_msgSend_addUserSyncTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserSyncTask:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_beginNextClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginNextClient");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bubbleDidPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleDidPop");
}

id objc_msgSend_bubbleIsOkayToPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleIsOkayToPop");
}

id objc_msgSend_bubbleShouldPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleShouldPop");
}

id objc_msgSend_clearTaskLists(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearTaskLists");
}

id objc_msgSend_clientWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientWithXPCConnection:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentClient");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_deviceLoginSessionStateDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLoginSessionStateDidUpdate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fetchMachServiceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchMachServiceNames");
}

id objc_msgSend_fetchMachServiceNameswithPID_WithUID_WithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchMachServiceNameswithPID:WithUID:WithCompletionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_hasUserSwitchTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUserSwitchTasks");
}

id objc_msgSend_hasUserSyncTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUserSyncTasks");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keybagdConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagdConnection");
}

id objc_msgSend_keybagdProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagdProxy");
}

id objc_msgSend_kickstartCurrentClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kickstartCurrentClient");
}

id objc_msgSend_machServiceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machServiceNames");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_personaListDidUpdateCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaListDidUpdateCompletionHandler:");
}

id objc_msgSend_personaUpdateCallbackForMachServiceCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUpdateCallbackForMachServiceCompletionHandler:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pidsToClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidsToClients");
}

id objc_msgSend_popStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popStatus");
}

id objc_msgSend_powerLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerLog:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxy");
}

id objc_msgSend_readyToSwitchToLoginSession_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readyToSwitchToLoginSession:completionHandler:");
}

id objc_msgSend_readyToSwitchToUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readyToSwitchToUser:completionHandler:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCurrentClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCurrentClient");
}

id objc_msgSend_removeCurrentClientAndMachServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCurrentClientAndMachServiceName");
}

id objc_msgSend_removeMachServiceName_withPID_WithUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMachServiceName:withPID:WithUID:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeUserSwitchTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUserSwitchTask:");
}

id objc_msgSend_removeUserSyncTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUserSyncTask:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setCurrentClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentClient:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeybagdConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagdConnection:");
}

id objc_msgSend_setLaunchDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchDate:");
}

id objc_msgSend_setMachServiceNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMachServiceNames:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPopStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPopStatus:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStakeholderIsRegistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStakeholderIsRegistered:");
}

id objc_msgSend_setWasToldWillSwitchUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasToldWillSwitchUser:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_sharedXPCInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedXPCInterface");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_syncProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncProxy");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_taskDictionaryInArray_withUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDictionaryInArray:withUUIDString:");
}

id objc_msgSend_uploadContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadContentWithCompletionHandler:");
}

id objc_msgSend_userSwitchTaskListDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchTaskListDidUpdate");
}

id objc_msgSend_userSwitchTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchTasks");
}

id objc_msgSend_userSyncTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSyncTasks");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_verifyCurrentClientHasPID_thenCallBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyCurrentClientHasPID:thenCallBlock:");
}

id objc_msgSend_willSwitchToUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willSwitchToUser:completionHandler:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}
