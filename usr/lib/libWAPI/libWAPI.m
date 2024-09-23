uint64_t isChinaRegion()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  const __CFAllocator *v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  const char *BytePtr;
  const __CFString *v7;
  const __CFString *v8;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v10;
  const void *ValueAtIndex;
  uint64_t v12;

  v0 = *MEMORY[0x24BDD8B20];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService
    && (v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240],
        (CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("region-info"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0)) != 0))
  {
    v5 = CFProperty;
    BytePtr = (const char *)CFDataGetBytePtr(CFProperty);
    if (BytePtr && (v7 = CFStringCreateWithCString(v3, BytePtr, 0x8000100u)) != 0)
    {
      v8 = v7;
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v3, v7, CFSTR("/"));
      if (ArrayBySeparatingStrings)
      {
        v10 = ArrayBySeparatingStrings;
        if (CFArrayGetCount(ArrayBySeparatingStrings) < 2)
        {
          v12 = 0;
        }
        else
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v10, 0);
          v12 = CFEqual(ValueAtIndex, CFSTR("CH"));
        }
        CFRelease(v10);
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  printf("isChinaRegion() = %d\n", v12);
  return v12;
}

BOOL WAPIEnabled()
{
  const __SCPreferences *v0;
  const __SCPreferences *v1;
  const __CFNumber *Value;
  const __CFNumber *v3;
  CFTypeID TypeID;
  _BOOL8 v5;
  CFTypeID v6;
  CFTypeID v7;
  int valuePtr;

  v0 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.wapilib"), CFSTR("com.apple.wifi.plist"));
  if (v0)
  {
    v1 = v0;
    Value = (const __CFNumber *)SCPreferencesGetValue(v0, CFSTR("WAPIEnabled"));
    valuePtr = 0;
    if (Value)
    {
      v3 = Value;
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v3))
      {
        CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
        LODWORD(Value) = valuePtr;
      }
      else
      {
        v6 = CFBooleanGetTypeID();
        if (v6 == CFGetTypeID(v3))
        {
          LODWORD(Value) = CFEqual(v3, (CFTypeRef)*MEMORY[0x24BDBD270]);
        }
        else
        {
          v7 = CFStringGetTypeID();
          if (v7 != CFGetTypeID(v3))
          {
            LODWORD(Value) = 0;
            goto LABEL_12;
          }
          LODWORD(Value) = CFStringGetIntValue((CFStringRef)v3);
        }
        valuePtr = (int)Value;
      }
    }
LABEL_12:
    v5 = (_DWORD)Value != 0;
    CFRelease(v1);
    goto LABEL_13;
  }
  v5 = 0;
LABEL_13:
  printf("WAPIEnabled() = %d\n", v5);
  return v5;
}

uint64_t WAPIStart(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  mach_port_t sp;
  mach_port_t special_port;

  v2 = 5;
  if (a1 && a2)
  {
    if (isChinaRegion() || WAPIEnabled())
    {
      special_port = 0;
      asl_log(0, 0, 5, "WAPIStart() = %s\n\n", a1);
      if (WAPIStatus((__int128 *)a1) != -1)
        WAPIStop((__int128 *)a1);
      sp = 0;
      v2 = task_get_special_port(*MEMORY[0x24BDAEC58], 4, &special_port);
      if (!(_DWORD)v2)
      {
        v5 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
        v2 = v5;
        if ((_DWORD)v5)
          asl_log(0, 0, 5, "error: bootstrap_look_up (%d)\n", v5);
        if (sp)
        {
          if (_SCSerialize())
          {
            v6 = _WCwapic_start(sp, (__int128 *)a1, 0, 0, 0x1B58u);
            v2 = v6;
            if ((_DWORD)v6)
              asl_log(0, 0, 5, "wapic MIG failed (%d, port = %d)\n", v6, sp);
          }
        }
      }
    }
    else
    {
      v2 = 5;
    }
  }
  sStatus = v2;
  return v2;
}

uint64_t WAPIStatus(__int128 *a1)
{
  kern_return_t v2;
  unsigned int v4;
  mach_port_t sp;
  mach_port_t special_port;

  if (!a1)
    return 0xFFFFFFFFLL;
  sp = 0;
  if (sStatus != -308)
  {
    special_port = 0;
    if (!task_get_special_port(*MEMORY[0x24BDAEC58], 4, &special_port))
    {
      v2 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
      asl_log(0, 0, 5, "%s: bootstrap_look_up = %d\n\n", "WAPIStatus", v2);
      if (!v2)
      {
        v4 = 0;
        if (_WCwapic_status(sp, a1, &v4, 0x64u) != -308)
          return v4;
        asl_log(0, 0, 5, "error: bootstrap_look_up WAPI inactive(%d)\n", -308);
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t WAPIStop(__int128 *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  mach_port_t sp;
  mach_port_t special_port;

  if (a1)
  {
    special_port = 0;
    sp = 0;
    v2 = task_get_special_port(*MEMORY[0x24BDAEC58], 4, &special_port);
    if (!(_DWORD)v2)
    {
      v4 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
      v2 = v4;
      if ((_DWORD)v4)
        asl_log(0, 0, 5, "error: bootstrap_look_up (%d)\n", v4);
      if (sp)
      {
        v5 = _WCwapic_stop(sp, a1, 0x64u);
        v2 = v5;
        if ((_DWORD)v5)
          asl_log(0, 0, 5, "wapic MIG failed (%d, port = %d)\n", v5, sp);
      }
    }
  }
  else
  {
    v2 = 5;
  }
  sStatus = -308;
  return v2;
}

uint64_t _WCwapic_start(mach_port_t a1, __int128 *a2, vm_address_t a3, int a4, mach_msg_timeout_t a5)
{
  __int128 v8;
  mach_port_t reply_port;
  uint64_t v10;
  uint64_t v11;
  mach_msg_header_t v13;
  int v14;
  vm_address_t v15;
  int v16;
  _DWORD v17[3];
  __int128 v18;
  __int128 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a2[1];
  v18 = *a2;
  v14 = 1;
  v15 = a3;
  v16 = 16777473;
  v17[0] = a4;
  *(_QWORD *)&v17[1] = *MEMORY[0x24BDAC470];
  v19 = v8;
  v20 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(_QWORD *)&v13.msgh_voucher_port = 0x36C158900000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v13);
    reply_port = v13.msgh_local_port;
  }
  v10 = mach_msg(&v13, 275, 0x58u, 0x2Cu, reply_port, a5, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v13.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (v13.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (v13.msgh_id == 57415149)
      {
        v11 = 4294966996;
        if ((v13.msgh_bits & 0x80000000) == 0 && *(_QWORD *)&v13.msgh_size == 36)
        {
          v11 = HIDWORD(v15);
          if (!HIDWORD(v15))
            return v11;
        }
      }
      else
      {
        v11 = 4294966995;
      }
      mach_msg_destroy(&v13);
      return v11;
    }
    mig_dealloc_reply_port(v13.msgh_local_port);
  }
  if ((_DWORD)v11 == 268435460)
  {
    if (v15 != a3)
      mig_deallocate(v15, v17[0]);
    return 268435460;
  }
  return v11;
}

uint64_t _WCwapic_stop(mach_port_t a1, __int128 *a2, mach_msg_timeout_t timeout)
{
  __int128 v4;
  mach_msg_header_t msg;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDAC470];
  v4 = a2[1];
  v8 = *a2;
  v9 = v4;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 57415050;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 17, 0x40u, 0, 0, timeout, 0);
}

uint64_t _WCwapic_status(mach_port_t a1, __int128 *a2, _DWORD *a3, mach_msg_timeout_t a4)
{
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = *MEMORY[0x24BDAC470];
  v7 = a2[1];
  v15 = *a2;
  v16 = v7;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x36C158B00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 275, 0x40u, 0x30u, reply_port, a4, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v10;
    }
    if (msg.msgh_id == 71)
    {
      v10 = 4294966988;
    }
    else if (msg.msgh_id == 57415151)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v10 = v15;
            if (!(_DWORD)v15)
            {
              *a3 = DWORD1(v15);
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v11 = 1;
          else
            v11 = (_DWORD)v15 == 0;
          if (v11)
            v10 = 4294966996;
          else
            v10 = v15;
          goto LABEL_23;
        }
      }
      v10 = 4294966996;
    }
    else
    {
      v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v10;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v10;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

uint64_t _SCSerialize()
{
  return MEMORY[0x24BDF5918]();
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x24BDAD1C0](client, msg, *(_QWORD *)&level, format);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x24BDAEEF0](a1, a2);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x24BDB0170](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

