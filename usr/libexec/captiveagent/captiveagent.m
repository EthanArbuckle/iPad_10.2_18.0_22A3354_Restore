os_log_t sub_1000020B8(os_log_t result)
{
  if (result <= 3 && !qword_100015178)
  {
    result = os_log_create("com.apple.captive", (&off_1000106C8)[result]);
    qword_100015178 = (uint64_t)result;
  }
  return result;
}

os_log_t sub_100002100()
{
  os_log_t result;

  result = (os_log_t)qword_100015178;
  if (!qword_100015178)
  {
    result = os_log_create("com.apple.captive", "Framework");
    qword_100015178 = (uint64_t)result;
  }
  return result;
}

CFDataRef sub_10000213C(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
}

const __CFData *sub_100002154(CFPropertyListRef propertyList, _DWORD *a2)
{
  const __CFData *result;
  const __CFData *v4;
  int Length;
  void *v6;
  const UInt8 *BytePtr;
  vm_address_t address;

  address = 0;
  *a2 = 0;
  result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    v4 = result;
    Length = CFDataGetLength(result);
    if (!vm_allocate(mach_task_self_, &address, Length, 1))
    {
      v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

const __CFData *sub_100002208(UInt8 *bytes, int a2)
{
  const __CFData *result;
  const __CFData *v3;
  CFPropertyListRef v4;

  result = CFDataCreateWithBytesNoCopy(0, bytes, a2, kCFAllocatorNull);
  if (result)
  {
    v3 = result;
    v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t sub_100002270(const void *a1, const void *a2)
{
  if (!a1)
    return a2 == 0;
  if (a2)
    return CFEqual(a1, a2);
  return 0;
}

CFStringRef sub_100002290(const __CFAllocator *a1)
{
  const __CFUUID *v2;
  CFStringRef v3;

  v2 = CFUUIDCreate(a1);
  v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void sub_1000022D0(void *context, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000022E8, context);
}

void sub_1000022E8(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionaryAddValue(theDict, key, value);
}

const __CFArray *sub_1000022FC(const __CFArray *result)
{
  const __CFArray *v1;
  unsigned __int8 context;
  CFRange v3;

  context = 1;
  if (result)
  {
    v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.location = 0;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)sub_100002350, &context);
    return (const __CFArray *)context;
  }
  return result;
}

CFTypeID sub_100002350(const void *a1, _BYTE *a2)
{
  CFTypeID result;
  CFTypeID v5;

  result = CFStringGetTypeID();
  if (!a1 || (v5 = result, result = CFGetTypeID(a1), result != v5))
    *a2 = 0;
  return result;
}

uint64_t sub_100002398(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  const void *ValueAtIndex;
  CFRange v10;

  result = 0;
  if (theArray && a2)
  {
    Count = CFArrayGetCount(theArray);
    v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.location = 0;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex))
          break;
        if (Count == ++v8)
          return 0;
      }
      return 1;
    }
  }
  return result;
}

void sub_100002434(const void **a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *a1;
  if (cf)
    CFRetain(cf);
  if (v4)
    CFRelease(v4);
  *a1 = cf;
}

uint64_t sub_10000247C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFBooleanGetValue(Value);
  else
    return a3;
}

uint64_t sub_1000024DC(CFArrayRef *a1, const void *a2)
{
  const __CFArray *v3;
  __CFArray *Mutable;
  CFRange v7;

  v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.location = 0;
    if (CFArrayContainsValue(v3, v7, a2))
      return 0;
    Mutable = v3;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    *a1 = Mutable;
  }
  CFArrayAppendValue(Mutable, a2);
  return 1;
}

CFIndex sub_100002560(const __CFArray *a1, const void *a2)
{
  CFRange v5;

  if (!a1)
    return -1;
  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  return CFArrayGetFirstIndexOfValue(a1, v5, a2);
}

uint64_t sub_1000025A0(const __CFArray *a1, const void *a2, const void *a3)
{
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  int v11;

  if (a1)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        v11 = a3 == 0;
        if (!Value)
          goto LABEL_7;
        if (a3)
          break;
LABEL_8:
        if (v7 == ++v8)
          return -1;
      }
      v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11)
        return v8;
      goto LABEL_8;
    }
  }
  return -1;
}

CFStringRef sub_100002638(CFStringRef URLString)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CFStringRef v3;

  if (!URLString)
    return 0;
  v1 = CFURLCreateWithString(0, URLString, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

uint64_t start()
{
  uint64_t v0;
  xpc_connection_t mach_service;
  _xpc_connection_s *v2;

  sub_1000020B8((os_log_t)2);
  v0 = 1;
  mach_service = xpc_connection_create_mach_service("com.apple.captiveagent", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  if (mach_service)
  {
    v2 = mach_service;
    if (xpc_get_type(mach_service) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_event_handler(v2, &stru_100010708);
      xpc_connection_resume(v2);
      CFRunLoopRun();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return v0;
}

void sub_10000270C(id a1, void *a2)
{
  NSObject *v3;
  os_log_type_t v4;
  __int128 v5;
  void (*v6)(uint64_t, xpc_object_t);
  void *v7;
  void *v8;

  if (a2)
  {
    if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
      *(_QWORD *)&v5 = _NSConcreteStackBlock;
      *((_QWORD *)&v5 + 1) = 0x40000000;
      v6 = sub_100002860;
      v7 = &unk_100010728;
      v8 = a2;
      xpc_connection_set_event_handler((xpc_connection_t)a2, &v5);
      xpc_connection_resume((xpc_connection_t)a2);
    }
    else if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
    {
      v3 = sub_100002100();
      v4 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v3, v4))
      {
        LODWORD(v5) = 136315138;
        *(_QWORD *)((char *)&v5 + 4) = xpc_dictionary_get_string(a2, _xpc_error_key_description);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Got an error on the XPC listener: %s", (uint8_t *)&v5, 0xCu);
      }
      exit(1);
    }
  }
}

void sub_100002860(uint64_t a1, xpc_object_t object)
{
  char *context;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  BOOL value;
  void *v11;
  uint64_t uint64;
  _BOOL8 v13;
  const char *string;
  const char *v15;
  const char *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  CFStringRef v20;
  const __CFString *v21;
  CFStringRef v22;
  void *v23;
  const __CFString *v24;
  xpc_object_t *v25;
  xpc_object_t *v26;
  __CFRunLoop *Current;
  CFReadStreamRef **v28;
  _xpc_connection_s *v29;
  xpc_object_t v30;
  unsigned int v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const UInt8 *data;
  const UInt8 *v39;
  CFStringRef v40;
  CFStringRef v41;
  CFStringRef v42;
  CFStringRef v43;
  __CFDictionary *Mutable;
  CFDataRef v45;
  _OWORD *v46;
  __CFRunLoop *v47;
  _QWORD *v48;
  NSObject *v49;
  os_log_type_t v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  unint64_t v57;
  CFStringRef v58;
  const __CFString *v59;
  CFStringRef v60;
  const __CFString *v61;
  _OWORD *v62;
  _OWORD *v63;
  __CFHTTPMessage *v64;
  __CFHTTPMessage *v65;
  __CFRunLoop *v66;
  CFReadStreamRef *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  CFStringRef v73;
  CFStringRef v74;
  xpc_object_t *v75;
  void **v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const UInt8 *v80;
  uint64_t v81;
  uint64_t v82;
  CFStringRef v83;
  CFStringRef v84;
  CFDataRef v85;
  _OWORD *v86;
  const void *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t buf[8];

  if (!object)
    return;
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
    {
      context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
      if (context)
      {
        v5 = context;
        v6 = sub_100002100();
        v7 = _SC_syslog_os_log_mapping(6);
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "service event handler found context", buf, 2u);
        }
        xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0);
        switch(*((_DWORD *)v5 + 4))
        {
          case 0:
            if (*((_QWORD *)v5 + 3))
              sub_100006FE8((_QWORD **)v5 + 3);
            break;
          case 2:
            if (*((_QWORD *)v5 + 3))
              sub_10000768C((uint64_t)(v5 + 24));
            break;
          case 6:
            if (*((_QWORD *)v5 + 3))
              sub_100009CFC(v5 + 24);
            break;
          case 8:
            if (*((_QWORD *)v5 + 3))
              sub_100007160((void ***)v5 + 3);
            break;
          default:
            break;
        }
        xpc_release(*(xpc_object_t *)v5);
        xpc_release(*((xpc_object_t *)v5 + 1));
        free(v5);
      }
    }
    return;
  }
  v8 = (void *)xpc_connection_copy_entitlement_value(*(_QWORD *)(a1 + 32), "com.apple.captiveagent.privileged");
  if (!v8)
    goto LABEL_24;
  v9 = v8;
  if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_BOOL)
  {
    xpc_release(v9);
LABEL_24:
    v32 = sub_100002100();
    v33 = _SC_syslog_os_log_mapping(3);
    if (!os_log_type_enabled(v32, v33))
      return;
    *(_WORD *)buf = 0;
    v34 = "daemon failed to authorize the requesting process.";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v32, v33, v34, buf, 2u);
    return;
  }
  value = xpc_BOOL_get_value(v9);
  xpc_release(v9);
  if (!value)
    goto LABEL_24;
  v11 = *(void **)(a1 + 32);
  uint64 = xpc_dictionary_get_uint64(object, "MessageType");
  v13 = xpc_dictionary_get_BOOL(object, "EnableDebug");
  sub_100007BBC(v13);
  switch(uint64)
  {
    case 0uLL:
      string = xpc_dictionary_get_string(object, "ProbeURL");
      v15 = xpc_dictionary_get_string(object, "InterfaceName");
      v16 = xpc_dictionary_get_string(object, "UserAgent");
      v17 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      LODWORD(v18) = 0;
      if (!string || !v15 || !v16)
        goto LABEL_115;
      v19 = v17;
      v20 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x8000100u);
      if (!v20)
        goto LABEL_83;
      v21 = v20;
      v22 = CFStringCreateWithCString(kCFAllocatorDefault, v15, 0x8000100u);
      if (!v22)
        goto LABEL_86;
      v23 = (void *)v22;
      v24 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x8000100u);
      if (!v24)
        goto LABEL_84;
      v25 = (xpc_object_t *)malloc_type_malloc(0x20uLL, 0x10A0040B5E8CC92uLL);
      if (!v25)
        goto LABEL_84;
      v26 = v25;
      *(_OWORD *)v25 = 0u;
      *((_OWORD *)v25 + 1) = 0u;
      *v25 = xpc_retain(v11);
      v26[1] = xpc_retain(object);
      Current = CFRunLoopGetCurrent();
      v28 = sub_1000066B8(v21, v23, v24, (__CFReadStream *)0x20000, Current, v19, (uint64_t)sub_1000034B4, (uint64_t)v26);
      v26[3] = v28;
      if (v28)
        goto LABEL_70;
      v29 = (_xpc_connection_s *)v11;
      v30 = object;
      v31 = 1;
      goto LABEL_111;
    case 2uLL:
      *(_QWORD *)buf = 0;
      v35 = xpc_dictionary_get_string(object, "LoginURL");
      v36 = xpc_dictionary_get_string(object, "InterfaceName");
      v37 = xpc_dictionary_get_string(object, "UserAgent");
      data = (const UInt8 *)xpc_dictionary_get_data(object, "LoginBody", (size_t *)buf);
      LODWORD(v18) = 0;
      if (!v35)
        goto LABEL_115;
      if (!v36)
        goto LABEL_115;
      if (!v37)
        goto LABEL_115;
      v39 = data;
      if (!data || !*(_QWORD *)buf)
        goto LABEL_115;
      v40 = CFStringCreateWithCString(kCFAllocatorDefault, v35, 0x8000100u);
      if (!v40)
        goto LABEL_83;
      v24 = v40;
      v41 = CFStringCreateWithCString(kCFAllocatorDefault, v36, 0x8000100u);
      if (!v41)
        goto LABEL_112;
      v42 = v41;
      v43 = CFStringCreateWithCString(kCFAllocatorDefault, v37, 0x8000100u);
      if (v43)
      {
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v23 = Mutable;
        if (Mutable)
        {
          CFDictionaryAddValue(Mutable, off_100014F30, v24);
          CFDictionaryAddValue((CFMutableDictionaryRef)v23, off_100014F78, v43);
          v45 = CFDataCreate(kCFAllocatorDefault, v39, *(CFIndex *)buf);
          if (v45)
          {
            v46 = malloc_type_malloc(0x20uLL, 0x10A0040B5E8CC92uLL);
            v18 = (uint64_t)v46;
            if (v46)
            {
              *v46 = 0u;
              v46[1] = 0u;
              *((_DWORD *)v46 + 4) = 2;
              *(_QWORD *)v46 = xpc_retain(v11);
              *(_QWORD *)(v18 + 8) = xpc_retain(object);
              v47 = CFRunLoopGetCurrent();
              v48 = sub_100007164((const __CFDictionary *)v23, v42, v45, v47, (uint64_t)sub_100003780, v18);
              *(_QWORD *)(v18 + 24) = v48;
              if (!v48)
              {
                sub_1000035DC((_xpc_connection_s *)v11, object, 3u);
                xpc_release(*(xpc_object_t *)v18);
                xpc_release(*(xpc_object_t *)(v18 + 8));
                free((void *)v18);
                CFRelease(v24);
                CFRelease(v42);
                LODWORD(v18) = 0;
                goto LABEL_105;
              }
              xpc_connection_set_context((xpc_connection_t)v11, (void *)v18);
              LODWORD(v18) = 1;
            }
LABEL_104:
            CFRelease(v24);
            CFRelease(v42);
            v24 = (const __CFString *)v45;
            if (!v43)
              goto LABEL_106;
LABEL_105:
            CFRelease(v43);
            v24 = (const __CFString *)v45;
LABEL_106:
            if (v23)
LABEL_107:
              CFRelease(v23);
            if (!v24)
              goto LABEL_115;
            goto LABEL_113;
          }
LABEL_103:
          LODWORD(v18) = 0;
          goto LABEL_104;
        }
      }
      else
      {
        v23 = 0;
      }
      v45 = 0;
      goto LABEL_103;
    case 4uLL:
      v49 = sub_100002100();
      v50 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v49, v50))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Got Logoff request", buf, 2u);
      }
      goto LABEL_50;
    case 6uLL:
      v53 = xpc_dictionary_get_string(object, "CredentialsURL");
      v54 = xpc_dictionary_get_string(object, "ServiceType");
      v55 = xpc_dictionary_get_string(object, "UserAgent");
      v56 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      if (!v53)
        goto LABEL_83;
      v57 = v56;
      v58 = CFStringCreateWithCString(kCFAllocatorDefault, v53, 0x8000100u);
      if (!v58)
        goto LABEL_83;
      v59 = v58;
      if (!v55 || (v60 = CFStringCreateWithCString(kCFAllocatorDefault, v55, 0x8000100u)) == 0)
      {
        CFRelease(v59);
LABEL_83:
        LODWORD(v18) = 0;
        goto LABEL_115;
      }
      v61 = v60;
      if (v54)
      {
        v54 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v54, 0x8000100u);
        if (v54)
        {
          v62 = malloc_type_malloc(0x20uLL, 0x10A0040B5E8CC92uLL);
          if (v62)
          {
            v63 = v62;
            *v62 = 0u;
            v62[1] = 0u;
            *((_DWORD *)v62 + 4) = 6;
            *(_QWORD *)v62 = xpc_retain(v11);
            *((_QWORD *)v63 + 1) = xpc_retain(object);
            v64 = sub_100009D00(v59, v61);
            if (v64)
            {
              v65 = v64;
              v66 = CFRunLoopGetCurrent();
              v67 = sub_100008AEC(v65, 0, v54, v66, (__CFReadStream *)sub_100003890, (__CFReadStream *)v63, (__CFReadStream *)0x4000, v57, 0);
              *((_QWORD *)v63 + 3) = v67;
              if (v67)
              {
                xpc_connection_set_context((xpc_connection_t)v11, v63);
                LODWORD(v18) = 1;
                goto LABEL_99;
              }
              sub_1000035DC((_xpc_connection_s *)v11, object, 7u);
            }
            else
            {
              v88 = sub_100002100();
              v89 = _SC_syslog_os_log_mapping(3);
              if (os_log_type_enabled(v88, v89))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v88, v89, "http_client_create_get_message() failed", buf, 2u);
              }
            }
            xpc_release(*(xpc_object_t *)v63);
            xpc_release(*((xpc_object_t *)v63 + 1));
            free(v63);
            CFRelease(v59);
            CFRelease(v61);
            LODWORD(v18) = 0;
LABEL_123:
            v87 = v54;
            goto LABEL_114;
          }
        }
      }
      LODWORD(v18) = 0;
LABEL_99:
      CFRelease(v59);
      CFRelease(v61);
      if (!v54)
        goto LABEL_115;
      goto LABEL_123;
    case 8uLL:
      v68 = xpc_dictionary_get_string(object, "PortalAPIURI");
      v69 = xpc_dictionary_get_string(object, "InterfaceName");
      v70 = xpc_dictionary_get_string(object, "UserAgent");
      v71 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      LODWORD(v18) = 0;
      if (!v68 || !v69 || !v70)
        goto LABEL_115;
      v72 = v71;
      v73 = CFStringCreateWithCString(kCFAllocatorDefault, v68, 0x8000100u);
      if (!v73)
        goto LABEL_83;
      v21 = v73;
      v74 = CFStringCreateWithCString(kCFAllocatorDefault, v69, 0x8000100u);
      if (v74)
      {
        v23 = (void *)v74;
        v24 = CFStringCreateWithCString(kCFAllocatorDefault, v70, 0x8000100u);
        if (!v24 || (v75 = (xpc_object_t *)malloc_type_malloc(0x20uLL, 0x10A0040B5E8CC92uLL)) == 0)
        {
LABEL_84:
          LODWORD(v18) = 0;
          goto LABEL_85;
        }
        v26 = v75;
        *(_OWORD *)v75 = 0u;
        *((_OWORD *)v75 + 1) = 0u;
        *((_DWORD *)v75 + 4) = 8;
        *v75 = xpc_retain(v11);
        v26[1] = xpc_retain(object);
        v76 = sub_100006FEC((uint64_t)v21, (uint64_t)v23, (uint64_t)v24, &_dispatch_main_q, v72, sub_100003658, v26);
        v26[3] = v76;
        if (v76)
        {
LABEL_70:
          xpc_connection_set_context((xpc_connection_t)v11, v26);
          LODWORD(v18) = 1;
LABEL_85:
          CFRelease(v21);
          goto LABEL_107;
        }
        v29 = (_xpc_connection_s *)v11;
        v30 = object;
        v31 = 9;
LABEL_111:
        sub_1000035DC(v29, v30, v31);
        xpc_release(*v26);
        xpc_release(v26[1]);
        free(v26);
        CFRelease(v21);
        CFRelease(v23);
LABEL_112:
        LODWORD(v18) = 0;
      }
      else
      {
LABEL_86:
        LODWORD(v18) = 0;
        v24 = v21;
      }
LABEL_113:
      v87 = v24;
      goto LABEL_114;
    case 0xAuLL:
      *(_QWORD *)buf = 0;
      v77 = xpc_dictionary_get_string(object, "TokenAuthURL");
      v78 = xpc_dictionary_get_string(object, "InterfaceName");
      v79 = xpc_dictionary_get_string(object, "UserAgent");
      v80 = (const UInt8 *)xpc_dictionary_get_data(object, "TokenAuthCredential", (size_t *)buf);
      v81 = xpc_dictionary_get_uint64(object, "TokenAuthTimeout");
      LODWORD(v18) = 0;
      if (!v78 || !v79 || !v80 || !*(_QWORD *)buf)
        goto LABEL_115;
      v82 = v81;
      if (v77)
      {
        v77 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v77, 0x8000100u);
        if (!v77)
          goto LABEL_83;
      }
      v83 = CFStringCreateWithCString(kCFAllocatorDefault, v78, 0x8000100u);
      if (!v83)
      {
        v84 = 0;
        goto LABEL_88;
      }
      v84 = CFStringCreateWithCString(kCFAllocatorDefault, v79, 0x8000100u);
      if (!v84)
      {
LABEL_88:
        v85 = 0;
        goto LABEL_89;
      }
      v85 = CFDataCreate(kCFAllocatorDefault, v80, *(CFIndex *)buf);
      if (!v85)
      {
LABEL_89:
        LODWORD(v18) = 0;
        goto LABEL_90;
      }
      v86 = malloc_type_malloc(0x20uLL, 0x10A0040B5E8CC92uLL);
      v18 = (uint64_t)v86;
      if (v86)
      {
        *v86 = 0u;
        v86[1] = 0u;
        *((_DWORD *)v86 + 4) = 10;
        *(_QWORD *)v86 = xpc_retain(v11);
        *(_QWORD *)(v18 + 8) = xpc_retain(object);
        *(_QWORD *)(v18 + 24) = sub_1000079E0((uint64_t)v77, (uint64_t)v83, (uint64_t)v84, (uint64_t)v85, &_dispatch_main_q, v82, sub_100003A64, (void *)v18);
        xpc_connection_set_context((xpc_connection_t)v11, (void *)v18);
        LODWORD(v18) = 1;
      }
LABEL_90:
      if (v77)
        CFRelease(v77);
      if (v83)
        CFRelease(v83);
      if (v84)
        CFRelease(v84);
      if (v85)
      {
        v87 = v85;
LABEL_114:
        CFRelease(v87);
      }
LABEL_115:
      if ((_DWORD)v18)
        return;
LABEL_116:
      v32 = sub_100002100();
      v33 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v32, v33))
      {
        *(_WORD *)buf = 0;
        v34 = "Failed to process request.";
        goto LABEL_26;
      }
      return;
    default:
LABEL_50:
      v51 = sub_100002100();
      v52 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v51, v52))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Got unknown request", buf, 2u);
      }
      goto LABEL_116;
  }
}

void sub_1000034B4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  xpc_object_t reply;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t v12[16];

  if (a1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      v7 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 1uLL);
      xpc_dictionary_set_uint64(v7, "ResultCode", a2);
      if (a3)
      {
        v8 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v8)
        {
          v9 = v8;
          xpc_dictionary_set_value(v7, "ProbeResultDict", v8);
          xpc_release(v9);
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v7);
      xpc_release(v7);
    }
    else
    {
      v10 = sub_100002100();
      v11 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "xpc_dictionary_create_reply() failed.", v12, 2u);
      }
    }
    xpc_connection_set_context(*(xpc_connection_t *)a1, 0);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }
}

void sub_1000035DC(_xpc_connection_s *a1, xpc_object_t original, unsigned int a3)
{
  xpc_object_t reply;
  void *v6;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v6 = reply;
    xpc_dictionary_set_uint64(reply, "MessageType", a3);
    xpc_dictionary_set_uint64(v6, "ResultCode", 0xDuLL);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
}

void sub_100003658(uint64_t a1, unsigned int a2, uint64_t a3)
{
  xpc_object_t reply;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t v12[16];

  if (a1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      v7 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 9uLL);
      xpc_dictionary_set_uint64(v7, "ResultCode", a2);
      if (a3)
      {
        v8 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v8)
        {
          v9 = v8;
          xpc_dictionary_set_value(v7, "APIResultDict", v8);
          xpc_release(v9);
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v7);
      xpc_release(v7);
    }
    else
    {
      v10 = sub_100002100();
      v11 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "xpc_dictionary_create_reply() failed.", v12, 2u);
      }
    }
    xpc_connection_set_context(*(xpc_connection_t *)a1, 0);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }
}

void sub_100003780(uint64_t a1, uint64_t a2)
{
  xpc_object_t reply;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t v10[16];

  if (a1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      v5 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 3uLL);
      if (a2)
      {
        v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(a2);
        if (v6)
        {
          v7 = v6;
          xpc_dictionary_set_value(v5, "LoginResultDict", v6);
          xpc_release(v7);
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v5);
      xpc_release(v5);
    }
    else
    {
      v8 = sub_100002100();
      v9 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "xpc_dictionary_create_reply() failed.", v10, 2u);
      }
    }
    xpc_connection_set_context(*(xpc_connection_t *)a1, 0);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }
}

uint64_t sub_100003890(uint64_t a1, unsigned int a2, uint64_t a3, const xmlDoc *a4)
{
  xpc_object_t reply;
  void *v8;
  __CFDictionary *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t v19[16];
  uint8_t buf[2];
  __int16 v21;

  if (a1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      v8 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 7uLL);
      xpc_dictionary_set_uint64(v8, "ResultCode", a2);
      if (!a4)
        goto LABEL_7;
      v9 = SFRXmlToDict(a4);
      if (v9)
      {
        a4 = (const xmlDoc *)v9;
        v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
        if (!v10)
        {
          v17 = sub_100002100();
          v18 = _SC_syslog_os_log_mapping(3);
          if (os_log_type_enabled(v17, v18))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, v18, "_CFXPCCreateXPCObjectFromCFObject failed", v19, 2u);
          }
          goto LABEL_8;
        }
        v11 = v10;
        xpc_dictionary_set_value(v8, "GetCredsResultDict", v10);
        xpc_release(v11);
LABEL_7:
        xpc_connection_send_message(*(xpc_connection_t *)a1, v8);
        xpc_release(v8);
        if (!a4)
        {
LABEL_14:
          xpc_connection_set_context(*(xpc_connection_t *)a1, 0);
          xpc_release(*(xpc_object_t *)a1);
          xpc_release(*(xpc_object_t *)(a1 + 8));
          free((void *)a1);
          return 1;
        }
LABEL_8:
        CFRelease(a4);
        goto LABEL_14;
      }
      v12 = sub_100002100();
      v13 = _SC_syslog_os_log_mapping(3);
      if (!os_log_type_enabled(v12, v13))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v14 = "SFRXmlToDict failed";
      v15 = buf;
    }
    else
    {
      v12 = sub_100002100();
      v13 = _SC_syslog_os_log_mapping(3);
      if (!os_log_type_enabled(v12, v13))
        goto LABEL_14;
      v21 = 0;
      v14 = "xpc_dictionary_create_reply() failed.";
      v15 = (uint8_t *)&v21;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v14, v15, 2u);
    goto LABEL_14;
  }
  return 1;
}

void sub_100003A64(uint64_t a1, unsigned int a2, uint64_t a3)
{
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  _DWORD v15[2];

  v6 = sub_100002100();
  v7 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v6, v7))
  {
    v15[0] = 67109120;
    v15[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handle_token_auth_result received response with result code: %u", (uint8_t *)v15, 8u);
  }
  if (a1)
  {
    v8 = *(void **)(a1 + 24);
    if (v8)
    {
      free(v8);
      *(_QWORD *)(a1 + 24) = 0;
    }
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      v10 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 0xBuLL);
      xpc_dictionary_set_uint64(v10, "ResultCode", a2);
      if (a3)
      {
        v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v11)
        {
          v12 = v11;
          xpc_dictionary_set_value(v10, "TokenAuthResultDict", v11);
          xpc_release(v12);
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v10);
      xpc_release(v10);
    }
    else
    {
      v13 = sub_100002100();
      v14 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "xpc_dictionary_create_reply() failed.", (uint8_t *)v15, 2u);
      }
    }
    xpc_connection_set_context(*(xpc_connection_t *)a1, 0);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }
}

void sub_1000049EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004A08(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "sendResponseCode:dictionary:", *(unsigned int *)(a1 + 40), 0);
    WeakRetained = v3;
  }

}

void sub_100004C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004C1C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sendResponseCode:dictionary:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void sub_100005888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000058A4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "handleAuthenticationChallenge:task:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

BOOL sub_100006050(id a1, NSURLQueryItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLQueryItem name](a2, "name", a3, a4));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("authorized"));

  return v5;
}

CNTokenAuthenticator *sub_1000065DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  id v14;
  CNTokenAuthenticator *v15;

  v13 = a7;
  v14 = a6;
  v15 = -[CNTokenAuthenticator initWithURLString:token:queue:responseHandler:]([CNTokenAuthenticator alloc], "initWithURLString:token:queue:responseHandler:", a1, a2, v14, v13);

  -[CNTokenAuthenticator setUserAgent:](v15, "setUserAgent:", a3);
  -[CNTokenAuthenticator setInterfaceName:](v15, "setInterfaceName:", a4);
  -[CNTokenAuthenticator setTimeoutSeconds:](v15, "setTimeoutSeconds:", a5);
  -[CNTokenAuthenticator start](v15, "start");
  return v15;
}

void sub_100006694(void *a1)
{
  objc_msgSend(a1, "cancel");

}

CFReadStreamRef **sub_1000066B8(const __CFString *a1, void *a2, const __CFString *a3, __CFReadStream *a4, __CFRunLoop *a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  void *v16;
  CFTypeRef v17;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v19;
  const void *v20;
  __CFHTTPMessage *v21;
  __CFHTTPMessage *v22;
  CFReadStreamRef *v23;
  CFReadStreamRef **result;
  NSObject *v25;
  os_log_type_t v26;
  CFRunLoopTimerContext context;
  CFReadStreamRef **v28;

  v16 = malloc_type_malloc(0x70uLL, 0x10E0040A8311C04uLL);
  v28 = (CFReadStreamRef **)v16;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((_QWORD *)v16 + 1) = a7;
  *((_QWORD *)v16 + 2) = a8;
  *((_QWORD *)v16 + 3) = a3;
  *((_QWORD *)v16 + 7) = a2;
  *((_QWORD *)v16 + 8) = a5;
  *((_QWORD *)v16 + 12) = a4;
  if (a1)
    v17 = CFRetain(a1);
  else
    v17 = 0;
  *((_QWORD *)v16 + 6) = v17;
  if (a6)
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v16;
    Current = CFAbsoluteTimeGetCurrent();
    v19 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + (double)a6, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000068B4, &context);
    *((_QWORD *)v16 + 9) = v19;
    if (v19)
      CFRunLoopAddTimer(a5, v19, kCFRunLoopCommonModes);
  }
  CFRetain(*((CFTypeRef *)v16 + 3));
  v20 = (const void *)*((_QWORD *)v16 + 7);
  if (v20)
    CFRetain(v20);
  v21 = sub_100009D00(a1, a3);
  if (v21)
  {
    v22 = v21;
    v23 = sub_100008AEC(v21, a2, 0, a5, (__CFReadStream *)sub_1000069B4, (__CFReadStream *)v16, a4, 0, 0);
    *v28 = v23;
    CFRelease(v22);
    result = v28;
    if (!*v28)
    {
      sub_1000068E8(&v28);
      return v28;
    }
  }
  else
  {
    sub_1000068E8(&v28);
    v25 = sub_100002100();
    v26 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(context.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "http_client_create_get_message failed", (uint8_t *)&context, 2u);
    }
    return 0;
  }
  return result;
}

void sub_1000068B4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)a2;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(a2 + 8))(*(_QWORD *)(a2 + 16), 6, 0);
  sub_1000068E8(&v2);
}

void sub_1000068E8(_QWORD **a1)
{
  _QWORD *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  __CFRunLoopTimer *v8;
  const void *v9;
  __CFRunLoopTimer *v10;
  const void *v11;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v3 = (const void *)v2[3];
      if (v3)
      {
        CFRelease(v3);
        v2[3] = 0;
      }
      v4 = (const void *)v2[5];
      if (v4)
      {
        CFRelease(v4);
        v2[5] = 0;
      }
      v5 = (const void *)v2[6];
      if (v5)
      {
        CFRelease(v5);
        v2[6] = 0;
      }
      v6 = (const void *)v2[7];
      if (v6)
      {
        CFRelease(v6);
        v2[7] = 0;
      }
      v7 = (const void *)v2[4];
      if (v7)
      {
        CFRelease(v7);
        v2[4] = 0;
      }
      v8 = (__CFRunLoopTimer *)v2[9];
      if (v8)
      {
        CFRunLoopTimerInvalidate(v8);
        v9 = (const void *)v2[9];
        if (v9)
        {
          CFRelease(v9);
          v2[9] = 0;
        }
      }
      v10 = (__CFRunLoopTimer *)v2[10];
      if (v10)
      {
        CFRunLoopTimerInvalidate(v10);
        v11 = (const void *)v2[10];
        if (v11)
        {
          CFRelease(v11);
          v2[10] = 0;
        }
      }
      if (*v2)
        sub_100009CFC(v2);
      free(v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_1000069B4(_DWORD *a1, uint64_t a2, __CFHTTPMessage *a3, const xmlDoc *a4)
{
  _DWORD *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  __CFRunLoop *Current;
  const void *v12;
  int v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  CFIndex ResponseStatusCode;
  CFIndex v18;
  CFStringRef v19;
  const __CFString *v20;
  uint64_t v21;
  const void *v22;
  CFStringRef v23;
  CFStringRef v24;
  uint64_t v25;
  const void *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  uint64_t v29;
  const void *v30;
  const void *v31;
  const void *v32;
  uint64_t v33;
  __CFDictionary *Mutable;
  __CFDictionary *v35;
  const void *v36;
  const void *v37;
  float v38;
  double v39;
  double v40;
  CFRunLoopTimerRef v41;
  NSObject *v42;
  os_log_type_t v43;
  int v44;
  __CFRunLoop *v45;
  uint64_t v47;
  __CFDictionary *v48;
  int v49[2];
  uint8_t v50[4];
  double v51;
  __int16 v52;
  int v53;
  CFRunLoopTimerContext buf;

  v7 = a1;
  *(_QWORD *)v49 = a1;
  v8 = sub_100002100();
  v9 = _SC_syslog_os_log_mapping(6);
  if (os_log_type_enabled(v8, v9))
  {
    if (a2 > 0xA)
      v10 = "<unknown>";
    else
      v10 = off_100010840[(int)a2];
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
    WORD2(buf.info) = 1024;
    *(_DWORD *)((char *)&buf.info + 6) = a2;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Result = %s (%d)", (uint8_t *)&buf, 0x12u);
    v7 = *(_DWORD **)v49;
  }
  if ((_DWORD)a2 == 5)
    goto LABEL_17;
  *(_QWORD *)v7 = 0;
  if (a2 > 0xA || ((1 << a2) & 0x580) == 0)
  {
    v7 = *(_DWORD **)v49;
    goto LABEL_17;
  }
  v7 = *(_DWORD **)v49;
  if (*(_DWORD *)(*(_QWORD *)v49 + 104))
    goto LABEL_17;
  if (*(_QWORD *)(*(_QWORD *)v49 + 80))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(*(_QWORD *)v49 + 80), kCFRunLoopCommonModes);
    CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(*(_QWORD *)v49 + 80));
    v7 = *(_DWORD **)v49;
    v12 = *(const void **)(*(_QWORD *)v49 + 80);
    if (v12)
    {
      CFRelease(v12);
      *(_QWORD *)(*(_QWORD *)v49 + 80) = 0;
      v7 = *(_DWORD **)v49;
    }
  }
  buf.version = 0;
  memset(&buf.retain, 0, 24);
  buf.info = v7;
  v13 = v7[22];
  v7[22] = v13 + 1;
  if (v13 < 10)
  {
    v38 = (double)(v13 - 1) * 0.1;
    v39 = v38;
    v40 = CFAbsoluteTimeGetCurrent();
    if (v13 <= 2)
      v39 = 0.100000001;
    v41 = CFRunLoopTimerCreate(kCFAllocatorDefault, v39 + v40, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100007E3C, &buf);
    v7 = *(_DWORD **)v49;
    *(_QWORD *)(*(_QWORD *)v49 + 80) = v41;
    if (v41)
    {
      v42 = sub_100002100();
      v43 = _SC_syslog_os_log_mapping(6);
      if (os_log_type_enabled(v42, v43))
      {
        v44 = *(_DWORD *)(*(_QWORD *)v49 + 88);
        *(_DWORD *)v50 = 134218240;
        v51 = v39;
        v52 = 1024;
        v53 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Network Error: Scheduling timer to try again in %.2f seconds. retryCount=%d", v50, 0x12u);
      }
      v45 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v45, *(CFRunLoopTimerRef *)(*(_QWORD *)v49 + 80), kCFRunLoopCommonModes);
      return 0;
    }
LABEL_17:
    v7[22] = 0;
    if (!a3)
    {
      v18 = 0;
      goto LABEL_33;
    }
    ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(a3);
    v18 = ResponseStatusCode;
    if (ResponseStatusCode > 304)
    {
      if (ResponseStatusCode == 305 || ResponseStatusCode == 407)
      {
        **(_QWORD **)v49 = 0;
        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), 9, 0);
LABEL_70:
        sub_1000068E8((_QWORD **)v49);
        return 1;
      }
      if (ResponseStatusCode != 307)
      {
LABEL_33:
        if (a2 > 6 || ((1 << a2) & 0x61) == 0)
        {
          if (((unint64_t)(v18 - 300) < 4 || v18 == 307)
            && (sub_100007FC8(*(uint64_t *)v49, a3) & 1) != 0)
          {
            return 0;
          }
          goto LABEL_51;
        }
        v27 = sub_10000A0F0(a4);
        if (v27)
        {
          v28 = v27;
          **(_QWORD **)v49 = 0;
          v29 = *(_QWORD *)v49;
          v30 = *(const void **)(*(_QWORD *)v49 + 24);
          if (v30)
          {
            CFDictionarySetValue(v27, off_100014F78, v30);
            v29 = *(_QWORD *)v49;
          }
          v31 = *(const void **)(v29 + 40);
          if (v31)
          {
            CFDictionarySetValue(v28, off_100014F80, v31);
            v29 = *(_QWORD *)v49;
          }
          v32 = *(const void **)(v29 + 32);
          if (v32)
          {
            CFDictionarySetValue(v28, off_100014F90, v32);
            v29 = *(_QWORD *)v49;
          }
          CFDictionarySetValue(v28, off_100014F70, *(const void **)(v29 + 48));
          (*(void (**)(_QWORD, uint64_t, __CFDictionary *))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), 2, v28);
          CFRelease(v28);
          goto LABEL_70;
        }
        if (sub_10000AD14(a4))
        {
          **(_QWORD **)v49 = 0;
          if (*(_DWORD *)(*(_QWORD *)v49 + 104))
          {
            if (*(_BYTE *)(*(_QWORD *)v49 + 108) == 1)
              v33 = 0;
            else
              v33 = 12;
          }
          else
          {
            v33 = 0;
          }
          (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), v33, 0);
          goto LABEL_70;
        }
        if ((_DWORD)a2 == 5)
          return 0;
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v35 = Mutable;
        v36 = *(const void **)(*(_QWORD *)v49 + 32);
        if (v36)
          CFDictionarySetValue(Mutable, off_100014F90, v36);
        v37 = *(const void **)(*(_QWORD *)v49 + 48);
        if (v37)
          CFDictionarySetValue(v35, off_100014F70, v37);
        if ((unint64_t)(v18 - 300) <= 7 && ((1 << (v18 - 44)) & 0x8F) != 0)
        {
          if ((sub_100007FC8(*(uint64_t *)v49, a3) & 1) != 0)
            goto LABEL_75;
        }
        else if (v18 != 200 && v18 != 511)
        {
          if (*(_DWORD *)(*(_QWORD *)v49 + 104))
          {
            v47 = 3;
            v48 = v35;
          }
          else
          {
            v47 = 11;
            v48 = 0;
          }
          (*(void (**)(_QWORD, uint64_t, __CFDictionary *))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), v47, v48);
          goto LABEL_74;
        }
        (*(void (**)(_QWORD, uint64_t, __CFDictionary *))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), 3, v35);
LABEL_74:
        sub_1000068E8((_QWORD **)v49);
LABEL_75:
        CFRelease(v35);
        return 0;
      }
    }
    else if ((unint64_t)(ResponseStatusCode - 300) >= 4)
    {
      goto LABEL_33;
    }
    v19 = CFHTTPMessageCopyHeaderFieldValue(a3, CFSTR("Location"));
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v49;
      v22 = *(const void **)(*(_QWORD *)v49 + 40);
      if (v22)
      {
        CFRelease(v22);
        *(_QWORD *)(*(_QWORD *)v49 + 40) = 0;
        v21 = *(_QWORD *)v49;
      }
      *(_QWORD *)(v21 + 40) = v20;
      if (!*(_DWORD *)(v21 + 104))
      {
        v23 = sub_100002638(v20);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v49;
          v26 = *(const void **)(*(_QWORD *)v49 + 32);
          if (v26)
          {
            CFRelease(v26);
            *(_QWORD *)(*(_QWORD *)v49 + 32) = 0;
            v25 = *(_QWORD *)v49;
          }
          *(_QWORD *)(v25 + 32) = v24;
        }
      }
    }
    goto LABEL_33;
  }
  v14 = sub_100002100();
  v15 = _SC_syslog_os_log_mapping(3);
  if (os_log_type_enabled(v14, v15))
  {
    v16 = *(_DWORD *)(*(_QWORD *)v49 + 88) - 1;
    *(_DWORD *)v50 = 67109120;
    LODWORD(v51) = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Network Error: Failed to retry probe. Giving up after retrying %d times", v50, 8u);
  }
LABEL_51:
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)v49 + 8))(*(_QWORD *)(*(_QWORD *)v49 + 16), a2, 0);
  sub_1000068E8((_QWORD **)v49);
  return 0;
}

void **sub_100006FEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  void **v14;
  CAAPIHandler *v15;
  _QWORD v17[5];
  void **v18;

  v14 = (void **)malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
  v18 = v14;
  v14[1] = a6;
  v14[2] = a7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 0x40000000;
  v17[2] = sub_1000070CC;
  v17[3] = &unk_100010800;
  v17[4] = v14;
  v15 = sub_10000B6B0(a1, a3, a2, a5, a4, v17);
  *v14 = v15;
  if (!v15)
  {
    sub_100007120(&v18);
    return v18;
  }
  return v14;
}

uint64_t sub_1000070CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)v6)
  {
    sub_100006694(*(void **)v6);
    **(_QWORD **)(a1 + 32) = 0;
    v6 = *(_QWORD *)(a1 + 32);
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v6 + 8))(*(_QWORD *)(v6 + 16), a2, a3);
}

void sub_100007120(void ***a1)
{
  void **v2;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (*v2)
        sub_100006694(*v2);
      free(v2);
      *a1 = 0;
    }
  }
}

_QWORD *sub_100007164(const __CFDictionary *a1, const void *a2, const void *a3, __CFRunLoop *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  const void *Value;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFData *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  __CFHTTPMessage *Request;
  CFIndex Length;
  const __CFString *v22;
  const __CFString *v23;
  CFReadStreamRef *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;

  v12 = malloc_type_malloc(0x48uLL, 0x10E00402B18BCACuLL);
  v39 = v12;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  v12[8] = 0;
  *v12 = a5;
  v12[1] = a6;
  Value = CFDictionaryGetValue(a1, off_100014F30);
  v12[3] = Value;
  if (Value)
    CFRetain(Value);
  v12[4] = a2;
  if (a2)
    CFRetain(a2);
  v14 = CFDictionaryGetValue(a1, off_100014F78);
  v12[5] = v14;
  if (v14)
    CFRetain(v14);
  if (a3)
    v12[6] = CFRetain(a3);
  v15 = (const __CFString *)v12[3];
  if (v15)
  {
    v16 = (const __CFString *)v12[5];
    if (v16)
    {
      v17 = (const __CFData *)v12[6];
      if (v17)
      {
        v18 = CFURLCreateWithString(kCFAllocatorDefault, v15, 0);
        if (v18)
        {
          v19 = v18;
          Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, CFSTR("POST"), v18, kCFHTTPVersion1_0);
          CFRelease(v19);
          if (Request)
          {
            CFHTTPMessageSetHeaderFieldValue(Request, off_100014F78, v16);
            CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Type"), CFSTR("application/x-www-form-urlencoded"));
            CFHTTPMessageSetBody(Request, v17);
            Length = CFDataGetLength(v17);
            v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), Length);
            if (v22)
            {
              v23 = v22;
              CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Length"), v22);
              CFRelease(v23);
              v24 = sub_100008AEC(Request, (void *)v12[4], 0, a4, (__CFReadStream *)sub_100008170, (__CFReadStream *)v12, (__CFReadStream *)0x20000, 0, 0);
              if (v24)
              {
                CFRelease(Request);
                v12[2] = v24;
                return v12;
              }
              v37 = sub_100002100();
              v38 = _SC_syslog_os_log_mapping(3);
              if (os_log_type_enabled(v37, v38))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, v38, "http_ref failed", buf, 2u);
              }
              CFRelease(Request);
LABEL_35:
              v12[2] = 0;
              sub_1000075D8((uint64_t)&v39);
              return v39;
            }
            v32 = sub_100002100();
            v33 = _SC_syslog_os_log_mapping(3);
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, v33, "CFStringCreateWithFormat failed", buf, 2u);
            }
            CFRelease(Request);
LABEL_33:
            v34 = sub_100002100();
            v35 = _SC_syslog_os_log_mapping(3);
            if (os_log_type_enabled(v34, v35))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, v35, "http_client_create_login_message failed", buf, 2u);
            }
            goto LABEL_35;
          }
          v29 = sub_100002100();
          v30 = _SC_syslog_os_log_mapping(3);
          if (!os_log_type_enabled(v29, (os_log_type_t)v30))
            goto LABEL_33;
          *(_WORD *)buf = 0;
          v31 = "CFHTTPMessageCreateRequest failed";
        }
        else
        {
          v29 = sub_100002100();
          LOBYTE(v30) = _SC_syslog_os_log_mapping(3);
          if (!os_log_type_enabled(v29, (os_log_type_t)v30))
            goto LABEL_33;
          *(_WORD *)buf = 0;
          v31 = "CFURLCreateWithString failed";
        }
        _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, v31, buf, 2u);
        goto LABEL_33;
      }
    }
  }
  v25 = sub_100002100();
  v26 = _SC_syslog_os_log_mapping(3);
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (const char *)&unk_10000D37F;
    if (v12[3])
      v28 = (const char *)&unk_10000D37F;
    else
      v28 = " url";
    if (!v12[5])
      v27 = " agent";
    *(_DWORD *)buf = 136315394;
    v41 = v28;
    v42 = 2080;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "wispr dictionary does not contain%s%s", buf, 0x16u);
  }
  sub_1000075D8((uint64_t)&v39);
  return 0;
}

void sub_1000075D8(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  __CFRunLoopTimer *v10;
  const void *v11;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD **)a1;
  v5 = v3[2];
  v4 = v3 + 2;
  if (v5)
  {
    sub_100009CFC(v4);
    v2 = *(_QWORD **)a1;
  }
  v6 = (const void *)v2[3];
  if (v6)
  {
    CFRelease(v6);
    v2[3] = 0;
    v2 = *(_QWORD **)a1;
  }
  v7 = (const void *)v2[4];
  if (v7)
  {
    CFRelease(v7);
    v2[4] = 0;
    v2 = *(_QWORD **)a1;
  }
  v8 = (const void *)v2[6];
  if (v8)
  {
    CFRelease(v8);
    v2[6] = 0;
    v2 = *(_QWORD **)a1;
  }
  v9 = (const void *)v2[5];
  if (v9)
  {
    CFRelease(v9);
    v2[5] = 0;
    v2 = *(_QWORD **)a1;
  }
  v10 = (__CFRunLoopTimer *)v2[7];
  if (v10)
  {
    CFRunLoopTimerInvalidate(v10);
    v2 = *(_QWORD **)a1;
    v11 = *(const void **)(*(_QWORD *)a1 + 56);
    if (v11)
    {
      CFRelease(v11);
      v2[7] = 0;
      v2 = *(_QWORD **)a1;
    }
  }
  free(v2);
  *(_QWORD *)a1 = 0;
}

_QWORD *sub_100007690(const __CFDictionary *a1, void *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  const __CFString *Value;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFHTTPMessage *v15;
  __CFHTTPMessage *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  uint8_t *v20;
  __int16 v22;
  uint8_t buf[2];
  __int16 v24;
  _QWORD *v25;

  v10 = malloc_type_malloc(0x18uLL, 0xA0040114AFA65uLL);
  v25 = v10;
  v10[1] = a5;
  v10[2] = 0;
  *v10 = a4;
  Value = (const __CFString *)CFDictionaryGetValue(a1, off_100014F60);
  if (!Value)
  {
    v17 = sub_100002100();
    v18 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v17, v18))
    {
      v24 = 0;
      v19 = "login result dictionary does not contain logout URL";
      v20 = (uint8_t *)&v24;
      goto LABEL_13;
    }
LABEL_14:
    sub_100007864(&v25);
    return 0;
  }
  v12 = Value;
  v13 = (const __CFString *)CFDictionaryGetValue(a1, off_100014F78);
  if (v13)
    v14 = v13;
  else
    v14 = CFSTR("CaptiveNetworkSupport-??? wispr");
  v15 = sub_100009D00(v12, v14);
  if (!v15)
  {
    v17 = sub_100002100();
    v18 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      v19 = "http_client_create_get_message failed";
      v20 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v16 = v15;
  v10[2] = sub_100008AEC(v15, a2, 0, a3, (__CFReadStream *)sub_1000078A4, (__CFReadStream *)v10, (__CFReadStream *)0x4000, 0, 0);
  CFRelease(v16);
  if (!v10[2])
  {
    v17 = sub_100002100();
    v18 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v17, v18))
    {
      v22 = 0;
      v19 = "async_http failed";
      v20 = (uint8_t *)&v22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, v20, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  return v10;
}

void sub_100007864(_QWORD **a1)
{
  _QWORD *v2;

  v2 = *a1;
  if (v2[2])
  {
    sub_100009CFC(v2 + 2);
    v2 = *a1;
  }
  free(v2);
  *a1 = 0;
}

uint64_t sub_1000078A4(_QWORD *a1, int a2, uint64_t a3, const xmlDoc *a4)
{
  uint64_t IntValue;
  __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFString *Value;
  const __CFString *v12;
  _QWORD *v14;

  v14 = a1;
  if ((a2 == 5 || a2 == 0) && a4 != 0)
  {
    v9 = sub_10000A0F0(a4);
    if (v9)
    {
      v10 = v9;
      Value = (const __CFString *)CFDictionaryGetValue(v9, off_100014F08);
      if (CFStringGetIntValue(Value) == 130)
      {
        v12 = (const __CFString *)CFDictionaryGetValue(v10, off_100014F10);
        IntValue = CFStringGetIntValue(v12);
      }
      else
      {
        IntValue = 255;
      }
      CFRelease(v10);
      goto LABEL_17;
    }
    if (a2 == 5)
      return 0;
  }
  IntValue = 255;
LABEL_17:
  a1[2] = 0;
  ((void (*)(_QWORD, uint64_t))*a1)(a1[1], IntValue);
  sub_100007864(&v14);
  return 1;
}

void sub_100007974()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t v2[16];

  v0 = sub_100002100();
  v1 = _SC_syslog_os_log_mapping(3);
  if (os_log_type_enabled(v0, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "not implemented", v2, 2u);
  }
}

void **sub_1000079E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8)
{
  void **v16;
  CNTokenAuthenticator *v17;
  _QWORD v19[5];
  void **v20;

  v16 = (void **)malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
  v20 = v16;
  v16[1] = a7;
  v16[2] = a8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 0x40000000;
  v19[2] = sub_100007AD0;
  v19[3] = &unk_100010820;
  v19[4] = v16;
  v17 = sub_1000065DC(a1, a4, a3, a2, a6, a5, v19);
  *v16 = v17;
  if (!v17)
  {
    sub_100007120(&v20);
    return v20;
  }
  return v16;
}

uint64_t sub_100007AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _DWORD v10[2];

  v6 = sub_100002100();
  v7 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v6, v7))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "token authenticator provided response with result code: %u", (uint8_t *)v10, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)v8)
  {
    sub_100006694(*(void **)v8);
    **(_QWORD **)(a1 + 32) = 0;
    v8 = *(_QWORD *)(a1 + 32);
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v8 + 8))(*(_QWORD *)(v8 + 16), a2, a3);
}

uint64_t sub_100007BBC(uint64_t result)
{
  byte_100015180 = result;
  return result;
}

__CFDictionary *SFRXmlToDict(const xmlDoc *a1)
{
  __CFDictionary *Mutable;
  xmlNodePtr RootElement;
  _xmlNode *i;
  CFStringRef v5;
  CFStringRef v6;
  _xmlNode *children;
  const char *content;
  NSObject *v9;
  os_log_type_t v10;
  const xmlChar *name;
  NSObject *v12;
  os_log_type_t v13;
  const xmlChar *v14;
  CFStringRef v15;
  CFStringRef v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t buf[4];
  const xmlChar *v21;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  RootElement = xmlDocGetRootElement(a1);
  if (RootElement->type == XML_ELEMENT_NODE)
  {
    for (i = RootElement->children; i; i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE)
      {
        v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)i->name, 0x8000100u);
        if (v5)
        {
          v6 = v5;
          children = i->children;
          if (children)
          {
            while (1)
            {
              if (children->type == XML_TEXT_NODE)
              {
                content = (const char *)children->content;
                if (content)
                  break;
              }
              children = children->next;
              if (!children)
                goto LABEL_9;
            }
            v15 = CFStringCreateWithCString(kCFAllocatorDefault, content, 0x8000100u);
            if (v15)
            {
              v16 = v15;
              CFDictionarySetValue(Mutable, v6, v15);
              CFRelease(v16);
            }
          }
          else
          {
LABEL_9:
            v9 = sub_100002100();
            v10 = _SC_syslog_os_log_mapping(4);
            if (os_log_type_enabled(v9, v10))
            {
              name = i->name;
              *(_DWORD *)buf = 136315138;
              v21 = name;
              _os_log_impl((void *)&_mh_execute_header, v9, v10, "Ignoring %s, couldn't find text entry", buf, 0xCu);
            }
          }
          CFRelease(v6);
        }
        else
        {
          v12 = sub_100002100();
          v13 = _SC_syslog_os_log_mapping(4);
          if (os_log_type_enabled(v12, v13))
          {
            v14 = i->name;
            *(_DWORD *)buf = 136315138;
            v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Ignoring %s, couldn't allocate CFString", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    if (Mutable)
      CFRelease(Mutable);
    v17 = sub_100002100();
    v18 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "badly formatted xml, root element was not a node", buf, 2u);
    }
    return 0;
  }
  return Mutable;
}

void sub_100007E3C(__CFRunLoopTimer *a1, uint64_t a2)
{
  __CFRunLoopTimer *v3;
  BOOL v4;
  const void *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  __CFHTTPMessage *v9;
  __CFHTTPMessage *v10;
  NSObject *v11;
  os_log_type_t v12;
  _QWORD *v13;
  uint8_t buf[4];
  int v15;

  v13 = (_QWORD *)a2;
  v3 = *(__CFRunLoopTimer **)(a2 + 80);
  if (v3)
    v4 = v3 == a1;
  else
    v4 = 0;
  if (v4)
  {
    CFRunLoopTimerInvalidate(a1);
    v5 = *(const void **)(a2 + 80);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a2 + 80) = 0;
    }
  }
  v6 = sub_100002100();
  v7 = _SC_syslog_os_log_mapping(6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)buf = 67109120;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Retrying probe. retryCount=%d", buf, 8u);
  }
  v9 = sub_100009D00(*(CFStringRef *)(a2 + 48), *(const __CFString **)(a2 + 24));
  if (v9)
  {
    v10 = v9;
    *(_QWORD *)a2 = sub_100008AEC(v9, *(void **)(a2 + 56), 0, *(__CFRunLoop **)(a2 + 64), (__CFReadStream *)sub_1000069B4, (__CFReadStream *)a2, *(__CFReadStream **)(a2 + 96), 0, 0);
    CFRelease(v10);
  }
  if (!*(_QWORD *)a2)
  {
    v11 = sub_100002100();
    v12 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to retry probe", buf, 2u);
    }
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a2 + 8))(*(_QWORD *)(a2 + 16), 1, 0);
    sub_1000068E8(&v13);
  }
}

const __CFString *sub_100007FC8(uint64_t a1, CFHTTPMessageRef response)
{
  CFIndex ResponseStatusCode;
  CFIndex v5;
  const __CFString *result;
  const __CFString *v7;
  __CFHTTPMessage *v8;
  __CFHTTPMessage *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t buf[4];
  CFIndex v13;
  __int16 v14;
  const __CFString *v15;

  if (!response)
    return 0;
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(response);
  v5 = ResponseStatusCode;
  if ((unint64_t)(ResponseStatusCode - 300) >= 4 && ResponseStatusCode != 307)
    return 0;
  if (*(int *)(a1 + 104) > 5)
    return 0;
  result = CFHTTPMessageCopyHeaderFieldValue(response, CFSTR("Location"));
  if (result)
  {
    v7 = result;
    *(_BYTE *)(a1 + 108) = 0;
    if (CFStringCompare(result, *(CFStringRef *)(a1 + 48), 1uLL) == kCFCompareEqualTo)
      *(_BYTE *)(a1 + 108) = 1;
    v8 = sub_100009D00(v7, *(const __CFString **)(a1 + 24));
    if (v8)
    {
      v9 = v8;
      v10 = sub_100002100();
      v11 = _SC_syslog_os_log_mapping(6);
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 134218242;
        v13 = v5;
        v14 = 2112;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%ld redirect %@", buf, 0x16u);
      }
      CFRelease(v7);
      *(_QWORD *)a1 = sub_100008AEC(v9, *(void **)(a1 + 56), 0, *(__CFRunLoop **)(a1 + 64), (__CFReadStream *)sub_1000069B4, (__CFReadStream *)a1, *(__CFReadStream **)(a1 + 96), 0, 0);
      CFRelease(v9);
      if (*(_QWORD *)a1)
      {
        ++*(_DWORD *)(a1 + 104);
        return (const __CFString *)1;
      }
    }
    else
    {
      CFRelease(v7);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100008170(uint64_t a1, unsigned int a2, uint64_t a3, const xmlDoc *a4)
{
  uint64_t result;
  __CFDictionary *v6;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  const __CFString *Value;
  SInt32 IntValue;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  const __CFString *v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  const void *v26;
  const __CFString *v27;
  SInt32 v28;
  NSObject *v29;
  os_log_type_t v30;
  __CFRunLoopTimer *v31;
  const void *v32;
  CFAbsoluteTime Current;
  __CFRunLoop *v34;
  NSObject *v35;
  os_log_type_t v36;
  NSObject *v37;
  os_log_type_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  CFRunLoopTimerContext buf;

  v41 = a1;
  if (a2 != 5)
  {
    *(_QWORD *)(a1 + 16) = 0;
    if (a2)
    {
      v8 = sub_100002100();
      v9 = _SC_syslog_os_log_mapping(6);
      if (!os_log_type_enabled(v8, v9))
        goto LABEL_22;
      if (a2 > 0xA)
        v10 = "<unknown>";
      else
        v10 = off_100010898[a2];
      LODWORD(buf.version) = 136315394;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
      WORD2(buf.info) = 1024;
      *(_DWORD *)((char *)&buf.info + 6) = a2;
      v22 = "Result = %s (%d)";
      v23 = v8;
      v24 = v9;
      v25 = 18;
    }
    else
    {
      v6 = sub_10000A0F0(a4);
      if (v6)
        goto LABEL_9;
      v35 = sub_100002100();
      v36 = _SC_syslog_os_log_mapping(6);
      if (!os_log_type_enabled(v35, v36))
        goto LABEL_22;
      LOWORD(buf.version) = 0;
      v22 = "http_parser_wispr_find_and_parse failed";
      v23 = v35;
      v24 = v36;
      v25 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, (uint8_t *)&buf, v25);
    goto LABEL_22;
  }
  result = (uint64_t)sub_10000A0F0(a4);
  v6 = (__CFDictionary *)result;
  if (result)
  {
LABEL_9:
    Value = (const __CFString *)CFDictionaryGetValue(v6, off_100014F08);
    IntValue = CFStringGetIntValue(Value);
    v13 = sub_100002100();
    v14 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v13, v14))
    {
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v6;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "WISPr dict = %@", (uint8_t *)&buf, 0xCu);
    }
    if (IntValue != 140 && IntValue != 120)
      goto LABEL_37;
    v15 = sub_100002100();
    v16 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v15, v16))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Auth Notify...", (uint8_t *)&buf, 2u);
    }
    v17 = (const __CFString *)CFDictionaryGetValue(v6, off_100014F10);
    if (CFStringGetIntValue(v17) != 201)
      goto LABEL_37;
    v18 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v18 + 1;
    if (v18 >= 4)
    {
      v19 = sub_100002100();
      v20 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(buf.version) = 0;
        v21 = "Too many Authentication Poll Tries";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v21, (uint8_t *)&buf, 2u);
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    v26 = CFDictionaryGetValue(v6, off_100014F58);
    if (!v26)
    {
      v19 = sub_100002100();
      v20 = _SC_syslog_os_log_mapping(5);
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(buf.version) = 0;
        v21 = "loginResultsURL is NULL";
        goto LABEL_36;
      }
LABEL_37:
      CFDictionarySetValue(v6, off_100014F78, *(const void **)(a1 + 40));
      (*(void (**)(_QWORD, __CFDictionary *))a1)(*(_QWORD *)(a1 + 8), v6);
      CFRelease(v6);
      goto LABEL_38;
    }
    *(_QWORD *)(a1 + 24) = v26;
    CFRetain(v26);
    v27 = (const __CFString *)CFDictionaryGetValue(v6, off_100014F48);
    if (!v27)
    {
      if ((sub_1000086E8(a1) & 1) == 0)
      {
        CFRelease(v6);
        v39 = sub_100002100();
        v40 = _SC_syslog_os_log_mapping(6);
        if (os_log_type_enabled(v39, v40))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "http_client_auth_poll_start failed", (uint8_t *)&buf, 2u);
        }
        return 1;
      }
      goto LABEL_41;
    }
    v28 = CFStringGetIntValue(v27);
    v29 = sub_100002100();
    v30 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v29, v30))
    {
      LODWORD(buf.version) = 67109120;
      HIDWORD(buf.version) = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Delay of %d", (uint8_t *)&buf, 8u);
    }
    if (v28 < 31)
    {
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      v31 = *(__CFRunLoopTimer **)(a1 + 56);
      if (v31)
      {
        CFRunLoopTimerInvalidate(v31);
        v32 = *(const void **)(a1 + 56);
        if (v32)
        {
          CFRelease(v32);
          *(_QWORD *)(a1 + 56) = 0;
        }
      }
      Current = CFAbsoluteTimeGetCurrent();
      *(_QWORD *)(a1 + 56) = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + (double)v28, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000086B8, &buf);
      v34 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v34, *(CFRunLoopTimerRef *)(a1 + 56), kCFRunLoopCommonModes);
LABEL_41:
      CFRelease(v6);
      return 1;
    }
    v37 = sub_100002100();
    v38 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v37, v38))
    {
      LODWORD(buf.version) = 67109376;
      HIDWORD(buf.version) = v28;
      LOWORD(buf.info) = 1024;
      *(_DWORD *)((char *)&buf.info + 2) = 30;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Proxy delay %d greater than max allowed: %d", (uint8_t *)&buf, 0xEu);
    }
    CFRelease(v6);
LABEL_22:
    (*(void (**)(_QWORD, _QWORD))a1)(*(_QWORD *)(a1 + 8), 0);
LABEL_38:
    sub_1000075D8((uint64_t)&v41);
    return 1;
  }
  return result;
}

uint64_t sub_1000086B8(uint64_t a1, uint64_t a2)
{
  const void *v3;

  v3 = *(const void **)(a2 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a2 + 56) = 0;
  }
  return sub_1000086E8(a2);
}

uint64_t sub_1000086E8(uint64_t a1)
{
  __CFHTTPMessage *v2;
  __CFHTTPMessage *v3;
  void *v4;
  __CFRunLoop *Current;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t buf[8];
  uint64_t v10;

  v10 = a1;
  v2 = sub_100009D00(*(CFStringRef *)(a1 + 24), *(const __CFString **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)(a1 + 32);
    Current = CFRunLoopGetCurrent();
    *(_QWORD *)(a1 + 16) = sub_100008AEC(v3, v4, 0, Current, (__CFReadStream *)sub_100008170, (__CFReadStream *)a1, (__CFReadStream *)0x20000, 0, 0);
    CFRelease(v3);
    if (*(_QWORD *)(a1 + 16))
      return 1;
  }
  else
  {
    v7 = sub_100002100();
    v8 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "http_client_create_get_message failed", buf, 2u);
    }
  }
  (*(void (**)(_QWORD, _QWORD))a1)(*(_QWORD *)(a1 + 8), 0);
  sub_1000075D8((uint64_t)&v10);
  return 0;
}

_QWORD *sub_1000087E0(_QWORD *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  xmlParserCtxt *PushParserCtxt;
  int v5;
  uint8_t v7[16];

  *a1 = off_100010900;
  v2 = sub_100002100();
  v3 = _SC_syslog_os_log_mapping(6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "new html parser", v7, 2u);
  }
  PushParserCtxt = htmlCreatePushParserCtxt(0, 0, 0, 0, 0, XML_CHAR_ENCODING_NONE);
  a1[1] = PushParserCtxt;
  if (PushParserCtxt)
  {
    if (byte_100015180)
      v5 = 67841;
    else
      v5 = 67937;
    htmlCtxtUseOptions(PushParserCtxt, v5);
  }
  return a1;
}

_QWORD *sub_1000088B4(_QWORD *a1)
{
  xmlParserCtxt *v2;

  *a1 = off_100010900;
  v2 = (xmlParserCtxt *)a1[1];
  if (v2)
  {
    if (v2->myDoc)
    {
      xmlFreeDoc(v2->myDoc);
      v2 = (xmlParserCtxt *)a1[1];
      v2->myDoc = 0;
    }
    htmlFreeParserCtxt(v2);
    a1[1] = 0;
  }
  return a1;
}

void sub_10000890C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100008920(_QWORD *a1)
{
  sub_1000088B4(a1);
  operator delete();
}

uint64_t sub_100008944(uint64_t a1, const char *a2, int a3, int a4)
{
  xmlParserCtxt *v4;

  v4 = *(xmlParserCtxt **)(a1 + 8);
  if (v4)
    return htmlParseChunk(v4, a2, a3, a4);
  else
    return 0xFFFFFFFFLL;
}

uint64_t sub_100008958(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    return *(_QWORD *)(v1 + 16);
  else
    return 0;
}

_QWORD *sub_100008970(_QWORD *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  xmlParserCtxt *PushParserCtxt;
  int v5;
  uint8_t v7[16];

  *a1 = off_100010930;
  v2 = sub_100002100();
  v3 = _SC_syslog_os_log_mapping(6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "new xml parser", v7, 2u);
  }
  PushParserCtxt = xmlCreatePushParserCtxt(0, 0, 0, 0, 0);
  a1[1] = PushParserCtxt;
  if (PushParserCtxt)
  {
    if (byte_100015180)
      v5 = 67841;
    else
      v5 = 67937;
    xmlCtxtUseOptions(PushParserCtxt, v5);
  }
  return a1;
}

_QWORD *sub_100008A40(_QWORD *a1)
{
  xmlParserCtxt *v2;

  *a1 = off_100010930;
  v2 = (xmlParserCtxt *)a1[1];
  if (v2)
  {
    if (v2->myDoc)
    {
      xmlFreeDoc(v2->myDoc);
      v2 = (xmlParserCtxt *)a1[1];
      v2->myDoc = 0;
    }
    xmlFreeParserCtxt(v2);
    a1[1] = 0;
  }
  return a1;
}

void sub_100008A9C(_QWORD *a1)
{
  sub_100008A40(a1);
  operator delete();
}

uint64_t sub_100008AC0(uint64_t a1, const char *a2, int a3, int a4)
{
  xmlParserCtxt *v4;

  v4 = *(xmlParserCtxt **)(a1 + 8);
  if (v4)
    return xmlParseChunk(v4, a2, a3, a4);
  else
    return 0xFFFFFFFFLL;
}

uint64_t sub_100008AD4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    return *(_QWORD *)(v1 + 16);
  else
    return 0;
}

CFReadStreamRef *sub_100008AEC(__CFHTTPMessage *a1, void *a2, const void *a3, __CFRunLoop *a4, __CFReadStream *a5, __CFReadStream *a6, __CFReadStream *a7, unint64_t a8, char a9)
{
  CFReadStreamRef *v17;
  CFURLRef v18;
  NSObject *v19;
  os_log_type_t v20;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v22;
  CFReadStreamRef v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  uint64_t v26;
  const void *v27;
  const void *v28;
  __CFRunLoop *v29;
  const __CFArray *v30;
  const __CFArray *v31;
  const void *ValueAtIndex;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  uint8_t *p_buf;
  NSObject *v37;
  os_log_type_t v38;
  __CFRunLoopTimer *v39;
  __CFRunLoop *v41;
  CFTypeRef v42;
  uint8_t v43[2];
  CFReadStreamRef *v44;
  CFStreamClientContext buf;

  v17 = (CFReadStreamRef *)malloc_type_malloc(0x4050uLL, 0x10A00404B78DBF0uLL);
  v44 = v17;
  if (v17)
  {
    v42 = a3;
    if (byte_100015180)
    {
      v41 = a4;
      v18 = CFHTTPMessageCopyRequestURL(a1);
      v19 = sub_100002100();
      v20 = _SC_syslog_os_log_mapping(7);
      if (os_log_type_enabled(v19, v20))
      {
        LODWORD(buf.version) = 138412546;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v18;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = a2;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@, interface=%@", (uint8_t *)&buf, 0x16u);
      }
      a4 = v41;
      if (v18)
        CFRelease(v18);
    }
    *(_OWORD *)(v17 + 2053) = 0u;
    *(_OWORD *)(v17 + 2055) = 0u;
    v17[2057] = 0;
    *(_OWORD *)(v17 + 2051) = 0u;
    v17[2048] = a4;
    v17[2049] = a5;
    v17[2050] = a6;
    v17[2055] = a7;
    *((_BYTE *)v17 + 16456) = a9 ^ 1;
    if (a8)
    {
      buf.version = 0;
      *(_OWORD *)&buf.info = (unint64_t)v17;
      buf.release = 0;
      buf.copyDescription = 0;
      Current = CFAbsoluteTimeGetCurrent();
      v22 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + (double)a8, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100008FC0, (CFRunLoopTimerContext *)&buf);
      v17[2052] = v22;
      if (!v22)
        goto LABEL_42;
    }
    v23 = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, a1);
    v17[2051] = v23;
    if (!v23)
    {
      v33 = sub_100002100();
      v34 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v33, v34))
      {
        LOWORD(buf.version) = 0;
        v35 = "CFReadStreamCreateForHTTPRequest failed";
        p_buf = (uint8_t *)&buf;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, p_buf, 2u);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    v24 = CFDictionaryCreate(kCFAllocatorDefault, &kSCProxiesNoGlobal, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v24)
    {
      v25 = v24;
      v26 = SCDynamicStoreCopyProxiesWithOptions(0, v24);
      v27 = a2;
      if (v26)
      {
        v28 = (const void *)v26;
        v29 = a4;
        v30 = (const __CFArray *)SCNetworkProxiesCopyMatching(v26, 0, a2);
        if (v30)
        {
          v31 = v30;
          if (CFArrayGetCount(v30) < 1)
          {
            ValueAtIndex = 0;
          }
          else
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v31, 0);
            CFRetain(ValueAtIndex);
          }
          CFRelease(v31);
        }
        else
        {
          ValueAtIndex = 0;
        }
        CFRelease(v28);
        CFRelease(v25);
        a4 = v29;
        if (ValueAtIndex)
        {
          if (CFDictionaryGetCount((CFDictionaryRef)ValueAtIndex) >= 1)
          {
            v37 = sub_100002100();
            v38 = _SC_syslog_os_log_mapping(6);
            if (os_log_type_enabled(v37, v38))
            {
              LODWORD(buf.version) = 138412290;
              *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)ValueAtIndex;
              _os_log_impl((void *)&_mh_execute_header, v37, v38, "Applying proxy: %@", (uint8_t *)&buf, 0xCu);
            }
            CFReadStreamSetProperty(v44[2051], kCFStreamPropertyHTTPProxy, ValueAtIndex);
          }
          CFRelease(ValueAtIndex);
          v17 = v44;
        }
      }
      else
      {
        CFRelease(v25);
      }
    }
    else
    {
      v27 = a2;
    }
    if (v27)
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyBoundInterfaceIdentifier, v27);
    if (v42)
    {
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyDataConnectionServiceType, v42);
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyDataContextOnDemand, kCFBooleanTrue);
    }
    buf.version = 0;
    *(_OWORD *)&buf.info = (unint64_t)v17;
    buf.release = 0;
    buf.copyDescription = 0;
    if (!CFReadStreamSetClient(v17[2051], 0x1BuLL, (CFReadStreamClientCallBack)sub_1000090F4, &buf))
    {
      v33 = sub_100002100();
      v34 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)v43 = 0;
        v35 = "CFReadStreamSetClient failed";
        goto LABEL_40;
      }
LABEL_42:
      sub_10000903C((uint64_t *)&v44);
      return 0;
    }
    CFReadStreamScheduleWithRunLoop(v17[2051], a4, kCFRunLoopCommonModes);
    v39 = v17[2052];
    if (v39)
      CFRunLoopAddTimer(a4, v39, kCFRunLoopCommonModes);
    if (!CFReadStreamOpen(v17[2051]))
    {
      v33 = sub_100002100();
      v34 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)v43 = 0;
        v35 = "CFReadStreamOpen failed";
LABEL_40:
        p_buf = v43;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
  }
  return v17;
}

void sub_100008FC0(uint64_t a1, uint64_t a2)
{
  __CFReadStream *v3;
  const void *v4;
  uint64_t v5;

  v5 = a2;
  if (a2)
  {
    v3 = *(__CFReadStream **)(a2 + 16408);
    if (v3 && CFReadStreamGetStatus(v3) == kCFStreamStatusOpening)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a2 + 16392))(*(_QWORD *)(a2 + 16400), 1, 0, 0);
      sub_10000903C(&v5);
    }
    else
    {
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a2 + 16416));
      v4 = *(const void **)(a2 + 16416);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a2 + 16416) = 0;
      }
    }
  }
}

void sub_10000903C(uint64_t *a1)
{
  uint64_t v2;
  __CFReadStream *v3;
  const void *v4;
  uint64_t v5;
  __CFRunLoopTimer *v6;
  const void *v7;

  *(_QWORD *)(*a1 + 16392) = 0;
  v2 = *a1;
  v3 = *(__CFReadStream **)(*a1 + 16408);
  if (v3)
  {
    CFReadStreamUnscheduleFromRunLoop(v3, *(CFRunLoopRef *)(v2 + 0x4000), kCFRunLoopCommonModes);
    CFReadStreamClose(*(CFReadStreamRef *)(*a1 + 16408));
    v2 = *a1;
    v4 = *(const void **)(*a1 + 16408);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(v2 + 16408) = 0;
      v2 = *a1;
    }
  }
  v5 = *(_QWORD *)(v2 + 16424);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    *(_QWORD *)(*a1 + 16424) = 0;
    v2 = *a1;
  }
  v6 = *(__CFRunLoopTimer **)(v2 + 16416);
  if (v6)
  {
    CFRunLoopTimerInvalidate(v6);
    v2 = *a1;
    v7 = *(const void **)(*a1 + 16416);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(v2 + 16416) = 0;
      v2 = *a1;
    }
  }
  free((void *)v2);
  *a1 = 0;
}

void sub_1000090F4(__CFReadStream *a1, char a2, uint64_t a3)
{
  _QWORD *v3;
  char v4;
  NSObject *v5;
  os_log_type_t v6;
  __CFRunLoopTimer *v7;
  const void *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  __CFReadStream *v16;
  uint64_t v17;
  __CFError *v18;
  const void *v19;
  uint64_t v20;
  int v21;
  __CFError *v22;
  int v23;
  NSObject *v24;
  os_log_type_t v25;
  UInt8 *v26;
  __CFReadStream *v27;
  CFIndex v28;
  int v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  int v33;
  int v34;
  char *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char *v44;
  int v45;
  unint64_t v46;
  BOOL v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  unsigned int (*v53)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int HasBytesAvailable;
  int v58;
  int v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  CFIndex Code;
  CFIndex v65;
  CFStringRef v66;
  NSObject *v67;
  os_log_type_t v68;
  void (*v69)(uint64_t, _QWORD, __CFError *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int Status;
  CFStreamError Error;
  NSObject *v75;
  os_log_type_t v76;
  _BOOL4 v77;
  char *v78;
  char v79;
  unsigned int v81;
  uint64_t v82;
  CFIndex v83;
  int v84;
  int *v85;
  uint64_t v86;
  char *v87;
  uint64_t v89;
  uint64_t v90;
  uint8_t buf[4];
  _BYTE v92[20];
  CFStringRef v93;

  v3 = (_QWORD *)a3;
  v4 = a2;
  v90 = a3;
  if ((a2 & 8) != 0)
  {
    v22 = CFReadStreamCopyError(a1);
    v18 = v22;
    if (!v22)
    {
      v58 = 1;
LABEL_83:
      v81 = v58;
      goto LABEL_106;
    }
    if (CFErrorGetDomain(v22) == kCFErrorDomainCFNetwork)
    {
      Code = CFErrorGetCode(v18);
      if (Code == -1005)
        v23 = 8;
      else
        v23 = 1;
      if (Code == 2)
        v23 = 7;
    }
    else if (CFErrorGetDomain(v18) == kCFErrorDomainPOSIX && CFErrorGetCode(v18) == 51)
    {
      v23 = 8;
    }
    else if (CFErrorGetDomain(v18) == kCFErrorDomainOSStatus)
    {
      if (CFErrorGetCode(v18) == -9806)
      {
        v23 = 14;
      }
      else
      {
        v65 = CFErrorGetCode(v18);
        v81 = 1;
        if ((unint64_t)(v65 + 9843) > 0x24 || ((1 << (v65 + 115)) & 0x18F007D001) == 0)
          goto LABEL_100;
        v23 = 15;
      }
    }
    else
    {
      v23 = 1;
    }
    v81 = v23;
LABEL_100:
    v66 = CFErrorCopyDescription(v18);
    v67 = sub_100002100();
    v68 = _SC_syslog_os_log_mapping(5);
    if (os_log_type_enabled(v67, v68))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v92 = CFErrorGetDomain(v18);
      *(_WORD *)&v92[8] = 2048;
      *(_QWORD *)&v92[10] = CFErrorGetCode(v18);
      *(_WORD *)&v92[18] = 2112;
      v93 = v66;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "kCFStreamEventErrorOccurred %@/%ld: %@", buf, 0x20u);
    }
    CFRelease(v18);
    if (v66)
      CFRelease(v66);
    v18 = 0;
    goto LABEL_105;
  }
  if ((a2 & 1) != 0)
  {
    v5 = sub_100002100();
    v6 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "kCFStreamEventOpenCompleted", buf, 2u);
    }
    v7 = (__CFRunLoopTimer *)v3[2052];
    if (v7)
    {
      CFRunLoopTimerInvalidate(v7);
      v8 = *(const void **)(a3 + 16416);
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a3 + 16416) = 0;
      }
    }
  }
  if ((v4 & 2) == 0)
  {
LABEL_9:
    if ((v4 & 0x10) == 0)
      return;
    v81 = 1;
    v9 = sub_100002100();
    v10 = _SC_syslog_os_log_mapping(6);
    if (!os_log_type_enabled(v9, v10))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v11 = "kCFStreamEventEndEncountered";
    v12 = v9;
    v13 = v10;
    v14 = 2;
    goto LABEL_12;
  }
  v79 = v4;
  v24 = sub_100002100();
  v25 = _SC_syslog_os_log_mapping(6);
  v26 = (UInt8 *)a3;
  v85 = (int *)(a3 + 16432);
  if (os_log_type_enabled(v24, v25))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "kCFStreamEventHasBytesAvailable", buf, 2u);
  }
  if (!*(_QWORD *)(a3 + 16424))
    operator new();
  v81 = 1;
  v27 = a1;
LABEL_29:
  v28 = CFReadStreamRead(v27, v26, 0x3FFFLL);
  v83 = v28;
  v29 = v28;
  if (v28 < 1)
  {
    v15 = a3;
    if ((v28 & 0x8000000000000000) == 0)
      goto LABEL_14;
    Status = CFReadStreamGetStatus(a1);
    Error = CFReadStreamGetError(a1);
    v75 = sub_100002100();
    v76 = _SC_syslog_os_log_mapping(6);
    v77 = os_log_type_enabled(v75, v76);
    if (Error.domain != 1)
    {
      v15 = a3;
      if (v77)
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v92 = Status;
        *(_WORD *)&v92[4] = 1024;
        *(_DWORD *)&v92[6] = Error.domain;
        *(_WORD *)&v92[10] = 1024;
        *(_DWORD *)&v92[12] = Error.error;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "CFReadStreamRead() status=%d error=(%d, %d)", buf, 0x14u);
      }
      goto LABEL_14;
    }
    if (!v77)
    {
LABEL_13:
      v15 = a3;
LABEL_14:
      v16 = a1;
      v17 = *(_QWORD *)(v15 + 16424);
      if (v17)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v17 + 16))(v17, 0, 0, 1);
        v16 = a1;
      }
      v18 = (__CFError *)CFReadStreamCopyProperty(v16, kCFStreamPropertyHTTPResponseHeader);
      CFReadStreamUnscheduleFromRunLoop(*(CFReadStreamRef *)(a3 + 16408), *(CFRunLoopRef *)(a3 + 0x4000), kCFRunLoopCommonModes);
      CFReadStreamClose(*(CFReadStreamRef *)(a3 + 16408));
      v19 = *(const void **)(a3 + 16408);
      if (v19)
      {
        CFRelease(v19);
        *(_QWORD *)(a3 + 16408) = 0;
      }
      v3 = (_QWORD *)a3;
      v20 = *(_QWORD *)(a3 + 16424);
      if (!v20)
        goto LABEL_106;
      v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20) == 0;
      goto LABEL_92;
    }
    v78 = strerror(Error.error);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v92 = Status;
    *(_WORD *)&v92[4] = 2080;
    *(_QWORD *)&v92[6] = v78;
    *(_WORD *)&v92[14] = 1024;
    *(_DWORD *)&v92[16] = Error.error;
    v11 = "CFReadStreamRead() status=%d, %s (%d)";
    v12 = v75;
    v13 = v76;
    v14 = 24;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
    goto LABEL_13;
  }
  *(_BYTE *)(a3 + v28) = 0;
  if (byte_100015180)
  {
    v30 = sub_100002100();
    v31 = _SC_syslog_os_log_mapping(7);
    v29 = v83;
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v92 = a3;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s", buf, 0xCu);
    }
  }
  v32 = 0;
  v33 = *v85;
  *v85 = 0;
  v34 = 0;
  v35 = (char *)a3;
  while (1)
  {
    v84 = v34;
    v36 = (v29 - v34);
    v37 = *(unsigned __int8 *)(a3 + 16456);
    if (*(_BYTE *)(a3 + 16456))
    {
      if ((int)v36 < 1)
      {
        LODWORD(v38) = 0;
LABEL_55:
        v37 = 0;
        if ((_DWORD)v36 != (_DWORD)v38 - v33)
          *v85 = v36 - (v38 - v33);
      }
      else
      {
        v38 = 0;
        v82 = v32;
        v86 = v36;
        v87 = &v35[v32];
        v39 = 1;
        v40 = v36;
        while (1)
        {
          v41 = 0;
          v89 = v40 - 1;
          v42 = v40 <= 1 ? 1 : v40;
          v43 = (int)v36 <= v39 ? v39 : v36;
          v44 = &aHtml[v33];
          while (v44[v41])
          {
            v45 = v44[v41];
            if (__toupper(v87[v38 + v41]) != v45)
              break;
            if (v42 == ++v41)
            {
              LODWORD(v41) = v42;
              goto LABEL_49;
            }
          }
          v43 = v38 + v41;
LABEL_49:
          v35 = (char *)a3;
          if (!aHtml[v33 + (uint64_t)(int)v41])
            break;
          LODWORD(v36) = v86;
          if (v43 == (_DWORD)v86)
            goto LABEL_53;
          v33 = 0;
          ++v38;
          ++v39;
          v40 = v89;
          if (v38 == v86)
          {
            LODWORD(v38) = v86;
LABEL_53:
            v32 = v82;
            goto LABEL_55;
          }
        }
        LODWORD(v36) = v38 - v33;
        v37 = 1;
        v32 = v82;
      }
    }
    v46 = *((_QWORD *)v35 + 2055);
    v47 = !v46 || (int)v36 < 1;
    if (!v47 && *((_QWORD *)v35 + 2056) + (unint64_t)v36 > v46)
      break;
    if (v37)
    {
      v48 = *(_DWORD *)(a3 + 16436);
      *(_DWORD *)(a3 + 16436) = v48 + 1;
      if (v48)
      {
        v49 = *((_QWORD *)v35 + 2053);
        if ((int)v36 < 1)
        {
          (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v49 + 16))(v49, 0, 0, 1);
          v51 = a3;
        }
        else
        {
          v50 = v36;
          (*(void (**)(uint64_t, char *))(*(_QWORD *)v49 + 16))(v49, &v35[v32]);
          v51 = a3;
          *(_QWORD *)(a3 + 16448) += v50;
        }
        if (!(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v51 + 16424) + 24))(*(_QWORD *)(v51 + 16424))
          || (v53 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a3 + 16392),
              v54 = *(_QWORD *)(a3 + 16400),
              v55 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a3 + 16424) + 24))(*(_QWORD *)(a3 + 16424)),
              !v53(v54, 5, 0, v55)))
        {
          v56 = *(_QWORD *)(a3 + 16424);
          if (v56)
            (*(void (**)(uint64_t))(*(_QWORD *)v56 + 8))(v56);
          operator new();
        }
        sub_10000903C(&v90);
        return;
      }
      LODWORD(v36) = v36 + 6;
    }
    v52 = v36;
    (*(void (**)(_QWORD, char *))(**((_QWORD **)v35 + 2053) + 16))(*((_QWORD *)v35 + 2053), &v35[v32]);
    v35 = (char *)a3;
    *(_QWORD *)(a3 + 16448) += v52;
    v34 = v52 + v84;
    v33 = 0;
    v32 = v34;
    v29 = v83;
    if (v83 <= v34)
    {
      HasBytesAvailable = CFReadStreamHasBytesAvailable(a1);
      v26 = (UInt8 *)a3;
      v27 = a1;
      if (HasBytesAvailable)
        goto LABEL_29;
      v4 = v79;
      goto LABEL_9;
    }
  }
  v59 = v36;
  v60 = sub_100002100();
  v61 = _SC_syslog_os_log_mapping(3);
  if (os_log_type_enabled(v60, v61))
  {
    v3 = (_QWORD *)a3;
    v62 = *(_QWORD *)(a3 + 16440);
    v63 = *(_QWORD *)(a3 + 16448);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v92 = v62;
    *(_WORD *)&v92[8] = 2048;
    *(_QWORD *)&v92[10] = v63;
    *(_WORD *)&v92[18] = 1024;
    LODWORD(v93) = v59;
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "exceeding maxlen of %ld. current(%lu) + length(%d)", buf, 0x1Cu);
    v18 = 0;
    v58 = 4;
    goto LABEL_83;
  }
  v18 = 0;
  v21 = 4;
LABEL_92:
  v81 = v21;
LABEL_105:
  v3 = (_QWORD *)a3;
LABEL_106:
  v69 = (void (*)(uint64_t, _QWORD, __CFError *, uint64_t))v3[2049];
  v70 = v3[2050];
  v71 = v3[2053];
  if (v71)
    v72 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v71 + 24))(v71);
  else
    v72 = 0;
  v69(v70, v81, v18, v72);
  sub_10000903C(&v90);
  if (v18)
    CFRelease(v18);
}

void sub_100009CC4()
{
  operator delete();
}

__CFHTTPMessage *sub_100009D00(CFStringRef URLString, const __CFString *a2)
{
  const __CFURL *v4;
  const __CFString *v5;
  __CFHTTPMessage *Request;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
  os_log_type_t v14;
  int v16;
  CFStringRef v17;

  v4 = CFURLCreateWithString(kCFAllocatorDefault, URLString, 0);
  if (!v4)
  {
    v5 = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, URLString, 0, 0, 0x8000100u);
    v4 = CFURLCreateWithString(kCFAllocatorDefault, v5, 0);
    CFRelease(v5);
    if (!v4)
    {
      v13 = sub_100002100();
      v14 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v13, v14))
      {
        v16 = 138412290;
        v17 = URLString;
        v9 = "CFURLCreateWithString %@ failed";
        v10 = v13;
        v11 = v14;
        v12 = 12;
        goto LABEL_9;
      }
      return 0;
    }
  }
  Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, CFSTR("GET"), v4, kCFHTTPVersion1_0);
  CFRelease(v4);
  if (!Request)
  {
    v7 = sub_100002100();
    v8 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v16) = 0;
      v9 = "CFHTTPMessageCreateRequest failed";
      v10 = v7;
      v11 = v8;
      v12 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v16, v12);
      return 0;
    }
    return 0;
  }
  CFHTTPMessageSetHeaderFieldValue(Request, off_100014F78, a2);
  return Request;
}

uint64_t sub_100009EC0(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  uint32_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  char v26[24];

  v2 = result;
  strcpy(v26, "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t!");
  if (a2 <= 0xF)
    v26[a2] = 0;
  if (result)
  {
    v3 = a2 + 1;
    do
    {
      v4 = *(_QWORD *)(v2 + 16);
      v5 = sub_100002100();
      v6 = _SC_syslog_os_log_mapping(7);
      v7 = os_log_type_enabled(v5, v6);
      if (v4)
      {
        if (!v7)
          goto LABEL_15;
        v8 = *(unsigned int *)(v2 + 8);
        v9 = "???";
        if ((v8 - 1) <= 0x13)
          v9 = (const char *)*(&off_100010990 + v8);
        v10 = *(_QWORD *)(v2 + 16);
        *(_DWORD *)buf = 136315650;
        v21 = v26;
        v22 = 2080;
        v23 = v9;
        v24 = 2080;
        v25 = v10;
        v11 = v5;
        v12 = v6;
        v13 = "%s%s: %s";
        v14 = 32;
      }
      else
      {
        if (!v7)
          goto LABEL_15;
        v15 = *(unsigned int *)(v2 + 8);
        v16 = "???";
        if ((v15 - 1) <= 0x13)
          v16 = (const char *)*(&off_100010990 + v15);
        *(_DWORD *)buf = 136315394;
        v21 = v26;
        v22 = 2080;
        v23 = v16;
        v11 = v5;
        v12 = v6;
        v13 = "%s%s: <NULL>";
        v14 = 22;
      }
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, buf, v14);
LABEL_15:
      if (*(_QWORD *)(v2 + 80))
      {
        v17 = sub_100002100();
        v18 = _SC_syslog_os_log_mapping(7);
        if (os_log_type_enabled(v17, v18))
        {
          v19 = *(const char **)(v2 + 80);
          *(_DWORD *)buf = 136315394;
          v21 = v26;
          v22 = 2080;
          v23 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%sdata:%s", buf, 0x16u);
        }
      }
      result = *(_QWORD *)(v2 + 24);
      if (result)
        result = sub_100009EC0(result, v3);
      v2 = *(_QWORD *)(v2 + 48);
    }
    while (v2);
  }
  return result;
}

__CFDictionary *sub_10000A0F0(const xmlDoc *a1)
{
  xmlNodePtr RootElement;
  __CFDictionary *v3;
  NSObject *v4;
  os_log_type_t v5;
  xmlNodePtr v6;
  xmlDoc *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  xmlNodePtr v14;
  xmlDoc *v15;
  xmlNodePtr v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  CFMutableDictionaryRef Mutable;
  uint64_t v28;
  CFStringRef v29;
  const __CFString *v30;
  uint64_t v31;
  _BYTE *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  const char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  CFStringRef v47;
  CFStringRef v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  _BYTE *v52;
  const __CFString *Value;
  SInt32 IntValue;
  uint64_t v55;
  int v56;
  const __CFString *v57;
  const __CFURL *v58;
  const __CFURL *v59;
  const __CFString *v60;
  CFComparisonResult v61;
  NSObject *v62;
  os_log_type_t v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint32_t v68;
  NSObject *v69;
  os_log_type_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t v75[4];
  uint64_t v76;
  __int16 v77;
  int v78;
  __int16 v79;
  uint64_t v80;
  uint8_t buf[8];
  __CFString **v82;
  _QWORD v83[16];
  __CFString *v84;
  char v85;
  __CFString *v86;
  char v87;
  __CFString *v88;
  char v89;
  __CFString *v90;
  char v91;
  __CFString *v92;
  char v93;
  __CFString *v94;
  char v95;
  __CFString *v96;
  char v97;
  __CFString *v98;
  char v99;
  __CFString *v100;
  char v101;
  __CFString *v102;
  char v103;
  __CFString *v104;
  char v105;
  __CFString *v106;
  char v107;
  __CFString *v108;
  char v109;
  __CFString *v110;
  char v111;
  __CFString *v112;
  char v113;
  __CFString *v114;
  char v115;
  __CFString *v116;
  char v117;
  __CFString *v118;
  char v119;
  __CFString *v120;
  char v121;
  __CFString *v122;
  char v123;
  __CFString *v124;
  char v125;
  __CFString *v126;
  char v127;
  __CFString *v128;
  char v129;
  __CFString *v130;
  char v131;
  __CFString *v132;
  char v133;
  __CFString *v134;
  char v135;
  __CFString *v136;
  char v137;
  __CFString *v138;
  char v139;
  __CFString *v140;
  char v141;

  RootElement = xmlDocGetRootElement(a1);
  v3 = (__CFDictionary *)sub_10000AB90((uint64_t)RootElement, "WISPAccessGatewayParam", 0);
  if (byte_100015180)
  {
    v4 = sub_100002100();
    v5 = _SC_syslog_os_log_mapping(7);
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "-- XML Document --", buf, 2u);
    }
    v6 = xmlDocGetRootElement(a1);
    sub_100009EC0((uint64_t)v6, 0);
  }
  if (v3)
  {
    v7 = 0;
  }
  else
  {
    v14 = xmlDocGetRootElement(a1);
    v15 = sub_10000AC18((uint64_t)v14, 0);
    if (!v15)
      return 0;
    v7 = v15;
    v16 = xmlDocGetRootElement(v15);
    v3 = (__CFDictionary *)sub_10000AB90((uint64_t)v16, "WISPAccessGatewayParam", 0);
    if (!v3)
      goto LABEL_25;
  }
  if (byte_100015180)
  {
    v8 = sub_100002100();
    v9 = _SC_syslog_os_log_mapping(7);
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "-- WISPr XML --", buf, 2u);
    }
    sub_100009EC0((uint64_t)v3, 0);
  }
  v126 = off_100014F08;
  v127 = 4;
  v128 = off_100014F10;
  v129 = 4;
  v130 = off_100014F18;
  v131 = 0;
  v132 = off_100014F20;
  v133 = 0;
  v134 = off_100014F28;
  v135 = 0;
  v136 = off_100014F30;
  v137 = 4;
  v138 = off_100014F38;
  v139 = 0;
  v140 = off_100014F88;
  v141 = 0;
  v118 = off_100014F08;
  v119 = 4;
  v120 = off_100014F10;
  v121 = 4;
  v122 = off_100014F40;
  v123 = 0;
  v124 = off_100014F48;
  v125 = 0;
  v106 = off_100014F08;
  v107 = 4;
  v108 = off_100014F10;
  v109 = 4;
  v110 = off_100014F50;
  v111 = 0;
  v112 = off_100014F58;
  v113 = 0;
  v114 = off_100014F60;
  v115 = 0;
  v116 = off_100014F68;
  v117 = 0;
  v94 = off_100014F08;
  v95 = 4;
  v96 = off_100014F10;
  v97 = 4;
  v98 = off_100014F50;
  v99 = 0;
  v100 = off_100014F48;
  v101 = 0;
  v102 = off_100014F60;
  v103 = 0;
  v104 = off_100014F68;
  v105 = 0;
  v88 = off_100014F08;
  v89 = 4;
  v90 = off_100014F10;
  v91 = 4;
  v92 = off_100014F60;
  v93 = 0;
  v84 = off_100014F08;
  v85 = 4;
  v86 = off_100014F10;
  v87 = 4;
  *(_QWORD *)buf = "Redirect";
  v82 = &v126;
  v83[0] = 0x6400000008;
  v83[1] = "Proxy";
  v83[2] = &v118;
  v83[3] = 0x6E00000004;
  v83[4] = "AuthenticationReply";
  v83[5] = &v106;
  v83[6] = 0x7800000006;
  v83[7] = "LogoffReply";
  v83[8] = &v84;
  v83[9] = 0x8200000002;
  v83[10] = "AuthenticationPollReply";
  v83[11] = &v94;
  v83[12] = 0x8C00000006;
  v83[13] = "AbortLoginReply";
  v83[14] = &v88;
  v83[15] = 0x9600000003;
  v10 = *((_QWORD *)v3 + 3);
  if (!v10)
  {
    v11 = sub_100002100();
    v12 = _SC_syslog_os_log_mapping(4);
    if (!os_log_type_enabled(v11, v12))
      goto LABEL_23;
    *(_WORD *)v75 = 0;
    v13 = "Invalid WISPAccessGatewayParam, no children";
    goto LABEL_21;
  }
  while (*(_DWORD *)(v10 + 8) != 1)
  {
    v10 = *(_QWORD *)(v10 + 48);
    if (!v10)
    {
      v11 = sub_100002100();
      v12 = _SC_syslog_os_log_mapping(4);
      if (!os_log_type_enabled(v11, v12))
        goto LABEL_23;
      *(_WORD *)v75 = 0;
      v13 = "Couldn't find WISPAccessGatewayParam XML_ELEMENT_NODE child";
      goto LABEL_21;
    }
  }
  v21 = 0;
  v22 = *(const char **)(v10 + 16);
  do
  {
    if (!strcasecmp(v22, *(const char **)&buf[v21 * 8]))
    {
      v74 = *(_QWORD *)&buf[v21 * 8 + 8];
      v26 = LODWORD(v83[v21]);
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v3 = Mutable;
        v28 = *(_QWORD *)(v10 + 24);
        if (v28)
        {
          while (*(_DWORD *)(v28 + 8) != 1)
          {
LABEL_52:
            v28 = *(_QWORD *)(v28 + 48);
            if (!v28)
              goto LABEL_59;
          }
          v29 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(v28 + 16), 0x8000100u);
          if (!v29)
          {
            v39 = sub_100002100();
            v40 = _SC_syslog_os_log_mapping(4);
            if (os_log_type_enabled(v39, v40))
            {
              v41 = *(_QWORD *)(v28 + 16);
              *(_DWORD *)v75 = 136315138;
              v76 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "Ignoring %s, couldn't allocate CFString", v75, 0xCu);
            }
            goto LABEL_52;
          }
          v30 = v29;
          v31 = v26;
          v32 = (_BYTE *)(v74 + 8);
          if ((int)v26 < 1)
          {
LABEL_40:
            v33 = sub_100002100();
            v34 = _SC_syslog_os_log_mapping(4);
            if (!os_log_type_enabled(v33, v34))
              goto LABEL_51;
            v35 = *(_QWORD *)(v28 + 16);
            *(_DWORD *)v75 = 136315138;
            v76 = v35;
            v36 = v33;
            v37 = v34;
            v38 = "Ignoring %s, unexpected parameter";
          }
          else
          {
            while (CFStringCompare(*((CFStringRef *)v32 - 1), v30, 1uLL))
            {
              v32 += 16;
              if (!--v31)
                goto LABEL_40;
            }
            v42 = *(_QWORD *)(v28 + 24);
            if (v42)
            {
              while (1)
              {
                if (*(_DWORD *)(v42 + 8) == 3)
                {
                  v43 = *(const char **)(v42 + 80);
                  if (v43)
                    break;
                }
                v42 = *(_QWORD *)(v42 + 48);
                if (!v42)
                  goto LABEL_48;
              }
              if ((*v32 & 1) == 0)
              {
                v47 = CFStringCreateWithCString(kCFAllocatorDefault, v43, 0x8000100u);
                if (v47)
                {
                  v48 = v47;
                  *v32 |= 1u;
                  CFDictionarySetValue(v3, *((const void **)v32 - 1), v47);
                  CFRelease(v48);
                }
                goto LABEL_51;
              }
              v49 = sub_100002100();
              v50 = _SC_syslog_os_log_mapping(4);
              if (os_log_type_enabled(v49, v50))
              {
                v51 = *(_QWORD *)(v28 + 16);
                *(_DWORD *)v75 = 136315138;
                v76 = v51;
                v36 = v49;
                v37 = v50;
                v38 = "Ignoring %s, already found. Weird.";
                goto LABEL_50;
              }
LABEL_51:
              CFRelease(v30);
              goto LABEL_52;
            }
LABEL_48:
            v44 = sub_100002100();
            v45 = _SC_syslog_os_log_mapping(4);
            if (!os_log_type_enabled(v44, v45))
              goto LABEL_51;
            v46 = *(_QWORD *)(v28 + 16);
            *(_DWORD *)v75 = 136315138;
            v76 = v46;
            v36 = v44;
            v37 = v45;
            v38 = "Ignoring %s, couldn't find text entry";
          }
LABEL_50:
          _os_log_impl((void *)&_mh_execute_header, v36, v37, v38, v75, 0xCu);
          goto LABEL_51;
        }
LABEL_59:
        if ((int)v26 >= 1)
        {
          v52 = (_BYTE *)(v74 + 8);
          while ((*v52 & 5) != 4)
          {
            v52 += 16;
            if (!--v26)
              goto LABEL_63;
          }
          v62 = sub_100002100();
          v63 = _SC_syslog_os_log_mapping(3);
          if (!os_log_type_enabled(v62, v63))
            goto LABEL_82;
          v65 = *((_QWORD *)v52 - 1);
          *(_DWORD *)v75 = 138412290;
          v76 = v65;
          v64 = "Missing required parameter %@";
          goto LABEL_75;
        }
LABEL_63:
        Value = (const __CFString *)CFDictionaryGetValue(v3, off_100014F08);
        if (Value)
        {
          IntValue = CFStringGetIntValue(Value);
          v55 = IntValue;
          v56 = HIDWORD(v83[v21]);
          if (IntValue != v56)
          {
            v71 = sub_100002100();
            v72 = _SC_syslog_os_log_mapping(4);
            if (os_log_type_enabled(v71, v72))
            {
              v73 = *(_QWORD *)(v10 + 16);
              *(_DWORD *)v75 = 136315650;
              v76 = v73;
              v77 = 1024;
              v78 = v56;
              v79 = 2048;
              v80 = v55;
              v64 = "Message type for %s should be %d but is %ld";
              v66 = v71;
              v67 = v72;
              v68 = 28;
              goto LABEL_81;
            }
            goto LABEL_82;
          }
          if (IntValue != 100)
            goto LABEL_24;
          v57 = (const __CFString *)CFDictionaryGetValue(v3, off_100014F30);
          v58 = CFURLCreateWithString(kCFAllocatorDefault, v57, 0);
          if (v58)
          {
            v59 = v58;
            v60 = CFURLCopyScheme(v58);
            CFRelease(v59);
            if (v60)
            {
              v61 = CFStringCompare(v60, CFSTR("https"), 1uLL);
              CFRelease(v60);
              if (v61 == kCFCompareEqualTo)
                goto LABEL_24;
              v62 = sub_100002100();
              v63 = _SC_syslog_os_log_mapping(3);
              if (os_log_type_enabled(v62, v63))
              {
                *(_DWORD *)v75 = 138412290;
                v76 = 0;
                v64 = "Login scheme must be https, was: %@";
LABEL_75:
                v66 = v62;
                v67 = v63;
                v68 = 12;
LABEL_81:
                _os_log_impl((void *)&_mh_execute_header, v66, v67, v64, v75, v68);
              }
LABEL_82:
              CFRelease(v3);
              goto LABEL_23;
            }
            v69 = sub_100002100();
            v70 = _SC_syslog_os_log_mapping(3);
            if (!os_log_type_enabled(v69, v70))
              goto LABEL_82;
            *(_WORD *)v75 = 0;
            v64 = "Couldn't get scheme from loginURL";
          }
          else
          {
            v69 = sub_100002100();
            v70 = _SC_syslog_os_log_mapping(3);
            if (!os_log_type_enabled(v69, v70))
              goto LABEL_82;
            *(_WORD *)v75 = 0;
            v64 = "Couldn't create loginURL";
          }
        }
        else
        {
          v69 = sub_100002100();
          v70 = _SC_syslog_os_log_mapping(4);
          if (!os_log_type_enabled(v69, v70))
            goto LABEL_82;
          *(_WORD *)v75 = 0;
          v64 = "Missing message type field!";
        }
        v66 = v69;
        v67 = v70;
        v68 = 2;
        goto LABEL_81;
      }
      v11 = sub_100002100();
      v12 = _SC_syslog_os_log_mapping(3);
      if (!os_log_type_enabled(v11, v12))
        goto LABEL_23;
      *(_WORD *)v75 = 0;
      v13 = "Failed to allocate dictionary";
LABEL_21:
      v17 = v11;
      v18 = v12;
      v19 = 2;
      goto LABEL_22;
    }
    v21 += 3;
  }
  while (v21 != 18);
  v23 = sub_100002100();
  v24 = _SC_syslog_os_log_mapping(4);
  if (os_log_type_enabled(v23, v24))
  {
    v25 = *(_QWORD *)(v10 + 16);
    *(_DWORD *)v75 = 136315138;
    v76 = v25;
    v13 = "Unknown message type: %s";
    v17 = v23;
    v18 = v24;
    v19 = 12;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v13, v75, v19);
  }
LABEL_23:
  v3 = 0;
LABEL_24:
  if (v7)
LABEL_25:
    xmlFreeDoc(v7);
  return v3;
}

uint64_t sub_10000AB90(uint64_t a1, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 > 10)
    return 0;
  v3 = a1;
  if (a1)
  {
    v5 = (a3 + 1);
    while (*(_DWORD *)(v3 + 8) != 1 || strcasecmp(*(const char **)(v3 + 16), a2))
    {
      v6 = *(_QWORD *)(v3 + 24);
      if (v6)
      {
        v7 = sub_10000AB90(v6, a2, v5);
        if (v7)
          return v7;
      }
      v3 = *(_QWORD *)(v3 + 48);
      if (!v3)
        return v3;
    }
  }
  return v3;
}

xmlDoc *sub_10000AC18(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  const char *i;
  int v5;
  const xmlDoc *Memory;
  xmlDoc *v7;
  xmlNodePtr RootElement;
  uint64_t v9;
  uint64_t v10;

  if (a2 > 10)
    return 0;
  v2 = a1;
  if (!a1)
    return 0;
  v3 = (a2 + 1);
  while (1)
  {
    if (*(_DWORD *)(v2 + 8) == 8)
    {
      for (i = *(const char **)(v2 + 80); *i; ++i)
      {
        if (*i == 60)
        {
          if (!strncmp(i, "<?xml", 5uLL))
          {
            v5 = strlen(i);
            Memory = xmlReadMemory(i, v5, 0, 0, 67937);
            if (Memory)
            {
              v7 = (xmlDoc *)Memory;
              RootElement = xmlDocGetRootElement(Memory);
              if (sub_10000AB90((uint64_t)RootElement, "WISPAccessGatewayParam", 0))
                return v7;
              xmlFreeDoc(v7);
            }
          }
          break;
        }
      }
    }
    v9 = *(_QWORD *)(v2 + 24);
    if (v9)
    {
      v10 = sub_10000AC18(v9, v3);
      if (v10)
        return (xmlDoc *)v10;
    }
    v2 = *(_QWORD *)(v2 + 48);
    if (!v2)
      return 0;
  }
}

BOOL sub_10000AD14(const xmlDoc *a1)
{
  xmlNodePtr RootElement;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  _BOOL8 result;

  RootElement = xmlDocGetRootElement(a1);
  v2 = sub_10000AB90((uint64_t)RootElement, "title", 0);
  result = 0;
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 24);
    if (v3)
    {
      if (*(_DWORD *)(v3 + 8) == 3)
      {
        v4 = *(const char **)(v3 + 80);
        if (v4)
        {
          if (!strcmp(v4, "Success"))
            return 1;
        }
      }
    }
  }
  return result;
}

void sub_10000B190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B1B0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  os_log_t v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  char *v27;
  id v28;
  os_log_t v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  char *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if (objc_msgSend(v11, "isEqualToString:", NSURLErrorDomain))
      {
        v12 = objc_msgSend(v9, "code");

        if (v12 == (id)-1202)
        {
          v13 = WeakRetained;
          v14 = 15;
LABEL_46:
          objc_msgSend(v13, "sendResponseCode:dictionary:", v14, 0);
          goto LABEL_47;
        }
      }
      else
      {

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if (objc_msgSend(v17, "isEqualToString:", NSURLErrorDomain))
      {
        if (objc_msgSend(v9, "code") == (id)-1003)
        {

LABEL_39:
          v13 = WeakRetained;
          v14 = 7;
          goto LABEL_46;
        }
        v38 = objc_msgSend(v9, "code");

        if (v38 == (id)-1006)
          goto LABEL_39;
      }
      else
      {

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if (objc_msgSend(v18, "isEqualToString:", NSURLErrorDomain))
      {
        if (objc_msgSend(v9, "code") == (id)-1005)
        {

LABEL_45:
          v13 = WeakRetained;
          v14 = 8;
          goto LABEL_46;
        }
        v39 = objc_msgSend(v9, "code");

        if (v39 == (id)-1009)
          goto LABEL_45;
      }
      else
      {

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if (objc_msgSend(v19, "isEqualToString:", NSURLErrorDomain))
      {
        v20 = objc_msgSend(v9, "code");

        if (v20 == (id)-1001)
        {
          v13 = WeakRetained;
          v14 = 6;
          goto LABEL_46;
        }
      }
      else
      {

      }
      v13 = WeakRetained;
      v14 = 13;
      goto LABEL_46;
    }
    if (v7)
    {
      v15 = objc_opt_class(NSHTTPURLResponse);
      v16 = (objc_opt_isKindOfClass(v8, v15) & 1) == 0 || (char *)objc_msgSend(v8, "statusCode") - 200 < (char *)0x64;
    }
    else
    {
      v16 = 0;
    }
    v21 = sub_100002100();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = _SC_syslog_os_log_mapping(6);
    v24 = v22;
    if (os_log_type_enabled(v24, v23))
    {
      if (v16)
        v25 = "successful";
      else
        v25 = "unsuccessful";
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "apiURL"));
      *(_DWORD *)buf = 136315650;
      v42 = v25;
      v43 = 2114;
      v44 = v8;
      v45 = 2114;
      v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "Received %s response %{public}@ for %{public}@", buf, 0x20u);

    }
    if (!v16)
    {
      v13 = WeakRetained;
      v14 = 10;
      goto LABEL_46;
    }
    v40 = 0;
    v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, &v40));
    v28 = v40;
    v29 = sub_100002100();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Portal state: %{public}@", buf, 0xCu);
    }

    if (v27
      && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", off_100014F98)),
          v32,
          v32))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", off_100014F98));
      v34 = objc_msgSend(v33, "BOOLValue");

      if (v34)
        v35 = 16;
      else
        v35 = 0;
      v36 = WeakRetained;
      v37 = v27;
    }
    else
    {
      v36 = WeakRetained;
      v35 = 10;
      v37 = 0;
    }
    objc_msgSend(v36, "sendResponseCode:dictionary:", v35, v37);

  }
LABEL_47:

}

CAAPIHandler *sub_10000B6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  CAAPIHandler *v13;

  v11 = a6;
  v12 = a5;
  v13 = -[CAAPIHandler initWithURLString:queue:responseHandler:]([CAAPIHandler alloc], "initWithURLString:queue:responseHandler:", a1, v12, v11);

  -[CAAPIHandler setUserAgent:](v13, "setUserAgent:", a2);
  -[CAAPIHandler setInterfaceName:](v13, "setInterfaceName:", a3);
  -[CAAPIHandler setTimeoutSeconds:](v13, "setTimeoutSeconds:", a4);
  -[CAAPIHandler fetchAPI](v13, "fetchAPI");
  return v13;
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__initWithCFURLCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithCFURLCredential:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_apiURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apiURL");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_authResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authResult:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_credentialForBearerChallenge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForBearerChallenge:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRequest");
}

id objc_msgSend_dataTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTask");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_fetchAPI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAPI");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_handleAuthenticationChallenge_task_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAuthenticationChallenge:task:completionHandler:");
}

id objc_msgSend_handleChallengeResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleChallengeResponse:");
}

id objc_msgSend_handleRedirectResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRedirectResponse:");
}

id objc_msgSend_handleResponse_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResponse:result:");
}

id objc_msgSend_handleTaskCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTaskCompletion");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURLString_queue_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURLString:queue:responseHandler:");
}

id objc_msgSend_initWithURLString_token_queue_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURLString:token:queue:responseHandler:");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_locationFromResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationFromResponse:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_opQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opQueue");
}

id objc_msgSend_parseChallenge_outRealm_outErrorCode_outErrorDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseChallenge:outRealm:outErrorCode:outErrorDescription:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_rangeOfFirstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfFirstMatchInString:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "realm");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseHandler");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sendResponseCode_dictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponseCode:dictionary:");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionConfiguration");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setApiURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApiURL:");
}

id objc_msgSend_setBoundInterfaceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoundInterfaceIdentifier:");
}

id objc_msgSend_setDataTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataTask:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setInterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpQueue:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_setTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutSeconds:");
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToken:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAgent:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_set_enableOAuthBearerTokenChallenges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_enableOAuthBearerTokenChallenges:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_timeoutSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutSeconds");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_tokenAuthServerDiscoveryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenAuthServerDiscoveryURL");
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingQueue");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAgent");
}
