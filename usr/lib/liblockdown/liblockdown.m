const void *lockdown_copy_value(uint64_t *a1, const void *a2, const void *a3)
{
  const void *value;
  CFTypeRef cf;

  cf = 0;
  value = send_get_value(*a1, a2, a3, (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  return value;
}

BOOL lockdown_wifi_debug_enabled()
{
  uint64_t *v0;
  _BOOL8 v1;
  const void *value;

  v0 = lockdown_connect();
  v1 = (_BOOL8)v0;
  if (v0)
  {
    value = send_get_value(*v0, CFSTR("com.apple.mobile.wireless_lockdown"), CFSTR("EnableWifiDebugging"), 0);
    lockdown_disconnect((uint64_t *)v1);
    if (value)
    {
      v1 = value == (const void *)*MEMORY[0x24BDBD270];
      CFRelease(value);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL lockdown_wifi_sync_enabled()
{
  uint64_t *v0;
  _BOOL8 v1;
  const void *value;

  v0 = lockdown_connect();
  v1 = (_BOOL8)v0;
  if (v0)
  {
    value = send_get_value(*v0, CFSTR("com.apple.mobile.wireless_lockdown"), CFSTR("EnableWifiConnections"), 0);
    lockdown_disconnect((uint64_t *)v1);
    if (value)
    {
      v1 = value == (const void *)*MEMORY[0x24BDBD270];
      CFRelease(value);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void lockdown_disconnect(uint64_t *a1)
{
  uint64_t v2;
  uint64_t heartbeat_ref;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  xpc_connection_t mach_service;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _xpc_connection_s *v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _xpc_connection_s *v25;
  void *v26;
  void *v27;
  char v28;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      heartbeat_ref = lockconn_get_heartbeat_ref(v2);
      if (heartbeat_ref)
      {
        v4 = heartbeat_ref;
        v5 = xpc_dictionary_create(0, 0, 0);
        if (v5)
        {
          v11 = v5;
          mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
          if (mach_service)
          {
            v18 = mach_service;
            xpc_dictionary_set_uint64(v11, "HB_PARAM_COMMAND", 3uLL);
            xpc_dictionary_set_uint64(v11, "HB_PARAM_REF", v4);
            xpc_connection_set_event_handler(v18, &__block_literal_global_100);
            xpc_connection_resume(v18);
            v19 = xpc_connection_send_message_with_reply_sync(v18, v11);
            if (v19)
              xpc_release(v19);
            else
              locklog(0, "HBFreeHeartbeatReference", CFSTR("Failed to receive xpc reply."), v20, v21, v22, v23, v24, v28);
            xpc_release(v11);
            v25 = v18;
          }
          else
          {
            locklog(0, "HBFreeHeartbeatReference", CFSTR("Failed to create xpc mach service."), v13, v14, v15, v16, v17, v28);
            v25 = (_xpc_connection_s *)v11;
          }
          xpc_release(v25);
        }
        else
        {
          locklog(0, "HBFreeHeartbeatReference", CFSTR("Failed to create xpc dictionary."), v6, v7, v8, v9, v10, v28);
        }
      }
      lockconn_disable_ssl(*a1);
      lockconn_close(*a1);
      lockconn_free((void *)*a1);
    }
    v26 = (void *)a1[2];
    if (v26)
    {
      os_release(v26);
      a1[2] = 0;
    }
    v27 = (void *)a1[1];
    if (v27)
      xpc_release(v27);
    free(a1);
  }
}

uint64_t lockconn_get_heartbeat_ref(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

void lockconn_free(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t lockconn_disable_ssl(uint64_t a1)
{
  OSStatus v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_BYTE *)(a1 + 20))
  {
    v2 = SSLClose(*(SSLContextRef *)(a1 + 24));
    if (v2)
      locklog(0, "lockconn_disable_ssl", CFSTR("Could not shutdown SSL connection: %d\n"), v3, v4, v5, v6, v7, v2);
    *(_BYTE *)(a1 + 20) = 0;
  }
  if (*(_QWORD *)(a1 + 24))
  {
    _SSLDisposeContext();
    *(_QWORD *)(a1 + 24) = 0;
  }
  return 0;
}

unint64_t lockconn_close(unint64_t result)
{
  unsigned int *v1;
  NSObject *v2;

  if (result)
  {
    v1 = (unsigned int *)result;
    v2 = *(NSObject **)(result + 40);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*((dispatch_object_t *)v1 + 5));
      *((_QWORD *)v1 + 5) = 0;
    }
    result = *v1;
    if ((_DWORD)result != -1)
      result = close(result);
    *v1 = -1;
  }
  return result;
}

_QWORD *lockdown_connect()
{
  int v0;
  int v1;
  int *v2;
  char *v3;
  _QWORD *v4;
  void *v5;
  int v7;
  char *v8;
  __int16 v9;
  const char *v10;
  sockaddr v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _WORD v16[13];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = socket(1, 1, 0);
  if (v0 != -1)
  {
    v1 = v0;
    v15 = 0u;
    memset(v16, 0, sizeof(v16));
    v13 = 0u;
    v14 = 0u;
    v11 = (sockaddr)0;
    v12 = 0u;
    __strlcpy_chk();
    v11.sa_family = 1;
    if (!connect(v1, &v11, 0xD2u))
    {
      _disable_sigpipe(v1);
      v4 = malloc_type_calloc(1uLL, 0x18uLL, 0xA0040A8488062uLL);
      v5 = lockconn_new();
      *v4 = v5;
      lockconn_init((uint64_t)v5, v1, 4);
      return v4;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v2 = __error();
      v3 = strerror(*v2);
      v7 = 136315394;
      v8 = v3;
      v9 = 2080;
      v10 = "/var/run/lockdown.sock";
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to connect to lockdown(%s) for path: %s. \n", (uint8_t *)&v7, 0x16u);
    }
    close(v1);
  }
  return 0;
}

void *lockconn_new()
{
  return malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040BB563593uLL);
}

double lockconn_init(uint64_t a1, int a2, int a3)
{
  double result;

  if (a1)
  {
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_DWORD *)a1 = a2;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = a3;
    *(_DWORD *)(a1 + 32) = 0;
  }
  return result;
}

BOOL _disable_sigpipe(int a1)
{
  int v1;
  int *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;

  v10 = 1;
  v1 = setsockopt(a1, 0xFFFF, 4130, &v10, 4u);
  if (v1 == -1)
  {
    v2 = __error();
    v3 = strerror(*v2);
    locklog(0, "_disable_sigpipe", CFSTR("setsockopt(SO_NOSIGPIPE) failed: %s"), v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

const void *send_get_value(uint64_t a1, const void *a2, const void *a3, CFStringRef *a4)
{
  __CFDictionary *message;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *v15;
  const void *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const void *Value;
  const __CFString *v20;
  const __CFString *v21;

  if (a4)
    *a4 = 0;
  message = _create_message(CFSTR("GetValue"));
  if (message)
  {
    v15 = message;
    if (a2)
      CFDictionarySetValue(message, CFSTR("Domain"), a2);
    if (a3)
      CFDictionarySetValue(v15, CFSTR("Key"), a3);
    if (lockconn_send_message(a1, v15, v9, v10, v11, v12, v13, v14))
      goto LABEL_9;
    v17 = lockconn_receive_message(a1);
    if (v17)
    {
      v18 = v17;
      Value = CFDictionaryGetValue(v17, CFSTR("Value"));
      v16 = Value;
      if (Value)
        CFRetain(Value);
      v20 = (const __CFString *)CFDictionaryGetValue(v18, CFSTR("Error"));
      if (a4)
      {
        v21 = v20;
        if (v20)
        {
          CFRetain(v20);
          *a4 = v21;
        }
      }
      CFRelease(v18);
      goto LABEL_20;
    }
    if (!a4)
    {
LABEL_9:
      v16 = 0;
    }
    else
    {
      v16 = 0;
      *a4 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
LABEL_20:
    CFRelease(v15);
    return v16;
  }
  return 0;
}

uint64_t lockconn_send_message(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _send_message(a1, a2, kCFPropertyListXMLFormat_v1_0, a4, a5, a6, a7, a8);
}

const __CFDictionary *lockconn_receive_message(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *Value;
  const __CFString *v12;
  CFTypeID v13;
  SInt32 IntValue;
  char v15;

  if (!a1)
    return 0;
  v2 = (const __CFDictionary *)_receive_message(a1);
  v3 = v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (!*(_DWORD *)(a1 + 32))
      {
        Value = (const __CFString *)CFDictionaryGetValue(v3, CFSTR("ProtocolVersion"));
        if (Value)
        {
          v12 = Value;
          v13 = CFGetTypeID(Value);
          if (v13 == CFStringGetTypeID())
          {
            IntValue = CFStringGetIntValue(v12);
            if (IntValue >= 1)
              *(_DWORD *)(a1 + 32) = IntValue;
          }
        }
      }
      goto LABEL_5;
    }
    locklog(0, "lockconn_receive_message", CFSTR("Ignoring message that is not the right type.\n"), v5, v6, v7, v8, v9, v15);
    CFRelease(v3);
    return 0;
  }
LABEL_5:
  lockdown_warning_break(v3);
  return v3;
}

void lockdown_warning_break(const __CFDictionary *a1)
{
  const __CFString *Value;
  const __CFString *v2;
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  char *v7;
  char __dst[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Warning"));
    if (Value)
    {
      v2 = Value;
      memcpy(__dst, "Error creating CFString", sizeof(__dst));
      LODWORD(v2) = CFStringGetCString(v2, __dst, 1024, 0x8000100u);
      v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (!(_DWORD)v2)
      {
        if (!v3)
          return;
        LOWORD(v6) = 0;
        v4 = MEMORY[0x24BDACB70];
        v5 = "CFStringGetCString failure in lockdown_warning_break";
        goto LABEL_10;
      }
      if (v3)
      {
        v6 = 136315138;
        v7 = __dst;
        _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6) = 0;
        v4 = MEMORY[0x24BDACB70];
        v5 = "*** this is a CLIENT bug, NOT a lockdown bug; set a breakpoint in lockdown_warning_break to debug";
LABEL_10:
        _os_log_impl(&dword_2064E2000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 2u);
      }
    }
  }
}

uint64_t _send_message(uint64_t a1, const void *a2, CFPropertyListFormat a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  const __CFString *v10;
  const __CFData *Data;
  const __CFData *v12;
  CFIndex Length;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const UInt8 *BytePtr;
  uint64_t v21;
  ssize_t v22;
  unint64_t v23;
  ssize_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;

  if (!a1)
  {
    v10 = CFSTR("no connection");
LABEL_21:
    locklog(0, "_send_message", v10, a4, a5, a6, a7, a8, v31);
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 == -1)
  {
    v10 = CFSTR("no socket");
    goto LABEL_21;
  }
  if (!*(_BYTE *)(a1 + 20))
  {
    if (!a2)
      return 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  result = 0xFFFFFFFFLL;
  if (a2 && *(_QWORD *)(a1 + 24))
  {
LABEL_10:
    Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, 0, 0);
    if (Data)
    {
      v12 = Data;
      Length = CFDataGetLength(Data);
      if (Length < 0)
      {
        locklog(0, "_send_message", CFSTR("message length too small"), v14, v15, v16, v17, v18, v31);
        CFRelease(v12);
        return 0xFFFFFFFFLL;
      }
      v19 = Length;
      BytePtr = CFDataGetBytePtr(v12);
      v21 = 0;
      v32 = bswap32(v19);
      do
      {
        v22 = lockconn_send(a1, (char *)&v32 + v21, 4 - v21);
        if (v22 == -1)
        {
          CFRelease(v12);
          v25 = __error();
          strerror(*v25);
          locklog(0, "_send_message", CFSTR("Could not send message size %ld: %s\n"), v26, v27, v28, v29, v30, v19);
          return 0xFFFFFFFFLL;
        }
        v21 += v22;
      }
      while (v21 != 4);
      if (!v19)
      {
LABEL_19:
        CFRelease(v12);
        return 0;
      }
      v23 = 0;
      while (1)
      {
        v24 = lockconn_send(a1, BytePtr, v19 - v23);
        if (v24 == -1)
          break;
        v23 += v24;
        BytePtr += v24;
        if (v23 >= v19)
          goto LABEL_19;
      }
      CFRelease(v12);
      v10 = CFSTR("Could not send secure message.\n");
    }
    else
    {
      v10 = CFSTR("Could not encode message as XML");
    }
    goto LABEL_21;
  }
  return result;
}

ssize_t lockconn_send(uint64_t a1, const void *a2, size_t a3)
{
  OSStatus v3;
  OSStatus v4;
  int *v5;
  int v6;
  size_t processed;

  processed = -1;
  if (!*(_BYTE *)(a1 + 20))
    return send(*(_DWORD *)a1, a2, a3, 0);
  v3 = SSLWrite(*(SSLContextRef *)(a1 + 24), a2, a3, &processed);
  if (v3)
  {
    v4 = v3;
    *__error() = 5;
    if (!processed)
      processed = -1;
    if (v4 == -9806)
    {
      v5 = __error();
      v6 = 32;
      goto LABEL_10;
    }
    if (v4 == -9803)
    {
      v5 = __error();
      v6 = 35;
LABEL_10:
      *v5 = v6;
    }
  }
  return processed;
}

CFPropertyListRef _receive_message(uint64_t a1)
{
  int v2;
  SSLContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  const __CFString *v11;
  int *v12;
  CFPropertyListRef v13;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  size_t v22;
  char *v23;
  ssize_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFData *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFData *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  char v43;
  size_t processed;
  CFErrorRef error;
  unsigned int data;

  data = 0;
  error = 0;
  v2 = *(_DWORD *)a1;
  if (v2 == -1)
    return 0;
  processed = 0;
  if (!*(_BYTE *)(a1 + 20))
  {
LABEL_6:
    v9 = recv(v2, &data, 4uLL, 0);
    processed = v9;
    if (!v9)
      return 0;
    goto LABEL_9;
  }
  v3 = *(SSLContext **)(a1 + 24);
  if (!v3)
    return 0;
  if (SSLRead(v3, &data, 4uLL, &processed) == -9805)
  {
    *(_BYTE *)(a1 + 20) = 0;
    lockconn_disable_ssl(a1);
    v2 = *(_DWORD *)a1;
    goto LABEL_6;
  }
  v9 = processed;
  if (!processed)
    return 0;
LABEL_9:
  if (v9 != 4)
  {
    __error();
    v12 = __error();
    strerror(*v12);
    v43 = 4;
    v11 = CFSTR("Could not receive size of message, expected %d bytes, got %ld bytes: (%d, %s)");
    goto LABEL_13;
  }
  v10 = bswap32(data);
  if (v10 > 0x300000)
  {
    v43 = data;
    v11 = CFSTR("swapped %d message size %d exceeds %d limit");
LABEL_13:
    locklog(0, "_receive_message", v11, v4, v5, v6, v7, v8, v43);
    return 0;
  }
  if (!data)
  {
    v11 = CFSTR("msize is zero");
    goto LABEL_13;
  }
  v15 = (char *)malloc_type_malloc(v10, 0x3C0CF081uLL);
  if (!v15)
  {
    locklog(0, "_receive_message", CFSTR("can't alloc message size %d"), v16, v17, v18, v19, v20, v10);
    return 0;
  }
  v21 = v15;
  v22 = 0;
  v23 = v15;
  do
  {
    v24 = lockconn_recv(a1, v23, v10 - v22);
    processed = v24;
    if (v24 <= 0)
    {
      locklog(0, "_receive_message", CFSTR("Could not receive message: %ld.\n"), v25, v26, v27, v28, v29, v24);
LABEL_33:
      free(v21);
      return 0;
    }
    v22 += v24;
    v23 += v24;
  }
  while (v22 < v10);
  v30 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v21, v10, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v30)
  {
    locklog(0, "_receive_message", CFSTR("Could not create CFData for message.\n"), v31, v32, v33, v34, v35, v43);
    goto LABEL_33;
  }
  v36 = v30;
  v13 = CFPropertyListCreateWithData(0, v30, 0, 0, &error);
  if (v13)
    v42 = error == 0;
  else
    v42 = 0;
  if (!v42)
  {
    locklog(0, "_receive_message", CFSTR("there was an err."), v37, v38, v39, v40, v41, v43);
    if (error)
      CFRelease(error);
  }
  CFRelease(v36);
  return v13;
}

ssize_t lockconn_recv(uint64_t a1, void *a2, size_t a3)
{
  OSStatus v3;
  OSStatus v4;
  int *v5;
  int v6;
  size_t processed;

  processed = -1;
  if (!*(_BYTE *)(a1 + 20))
    return recv(*(_DWORD *)a1, a2, a3, 0);
  v3 = SSLRead(*(SSLContextRef *)(a1 + 24), a2, a3, &processed);
  if (v3)
  {
    v4 = v3;
    *__error() = 5;
    if (!processed)
      processed = -1;
    switch(v4)
    {
      case -9806:
        v5 = __error();
        v6 = 54;
        break;
      case -9803:
        v5 = __error();
        v6 = 2;
        break;
      case -9805:
        return 0;
      default:
        return processed;
    }
    *v5 = v6;
  }
  return processed;
}

__CFDictionary *_create_message(const void *a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  const char *v4;
  CFStringRef v5;
  CFStringRef v6;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, CFSTR("Request"), a1);
    CFDictionarySetValue(v3, CFSTR("ProtocolVersion"), CFSTR("2"));
    v4 = getprogname();
    if (v4)
    {
      v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, 0x8000100u);
      if (v5)
      {
        v6 = v5;
        CFDictionarySetValue(v3, CFSTR("Label"), v5);
        CFRelease(v6);
      }
    }
  }
  return v3;
}

void locklog(uint64_t a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  char buffer[2048];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x800uLL);
  if (!a2)
    a2 = "";
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a3, &a9);
  v12 = v11;
  if (v11 && !CFStringGetCString(v11, buffer, 2048, 0x8000100u))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to retrieve C string.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = a2;
    v15 = 2080;
    v16 = buffer;
    _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
  }
  if (v12)
LABEL_8:
    CFRelease(v12);
}

uint64_t lockconn_set_heartbeat_ref(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

void lockconn_set_keybag_handle(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v11;
  const __CFString *v12;
  int v13;
  int v14;
  uintptr_t v15;
  NSObject *global_queue;
  NSObject *v17;
  uint64_t v18;
  int v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  int v27;
  _QWORD handler[5];

  if (a1 && a2)
  {
    v11 = *(_DWORD *)a1;
    if (v11 == -1)
    {
      v12 = CFSTR("can't set keybag handle on a connection without a socket");
      goto LABEL_7;
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v12 = CFSTR("can't set two keybag handles for the same socket");
LABEL_7:
      locklog(0, "lockconn_set_keybag_handle", v12, a4, a5, a6, a7, a8, a9);
      return;
    }
    v13 = dup(v11);
    if (v13 == -1)
    {
      v19 = *__error();
      v20 = __error();
      strerror(*v20);
      locklog(0, "lockconn_set_keybag_handle", CFSTR("Failed to dup the socket: %d (%s)."), v21, v22, v23, v24, v25, v19);
    }
    else
    {
      v14 = v13;
      v15 = v13;
      global_queue = dispatch_get_global_queue(0, 0);
      v17 = dispatch_source_create(MEMORY[0x24BDACA10], v15, 0x1006uLL, global_queue);
      v18 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = __lockconn_set_keybag_handle_block_invoke;
      handler[3] = &__block_descriptor_tmp;
      handler[4] = v17;
      dispatch_source_set_event_handler(v17, handler);
      CFRetain(a2);
      v26[0] = v18;
      v26[1] = 0x40000000;
      v26[2] = __lockconn_set_keybag_handle_block_invoke_2;
      v26[3] = &__block_descriptor_tmp_6;
      v26[4] = a2;
      v27 = v14;
      dispatch_source_set_cancel_handler(v17, v26);
      dispatch_resume(v17);
      *(_QWORD *)(a1 + 40) = v17;
    }
  }
}

void __lockconn_set_keybag_handle_block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

uint64_t __lockconn_set_keybag_handle_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 40));
}

uint64_t lockconn_sock(unsigned int *a1)
{
  if (a1)
    return *a1;
  else
    return 0xFFFFFFFFLL;
}

uint64_t lockconn_type(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 16);
  else
    return 4;
}

uint64_t lockconn_enable_ssl(uint64_t a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, int a5)
{
  SSLContext *v6;
  uint64_t result;

  v6 = lockssl_handshake(*(_DWORD *)a1, a2, a3, a4, a5);
  *(_QWORD *)(a1 + 24) = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  result = 0;
  *(_BYTE *)(a1 + 20) = 1;
  return result;
}

uint64_t lockconn_sslcontext(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t _select_socket()
{
  return 0;
}

uint64_t lockconn_get_buffered_read_size(uint64_t a1, size_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSStatus v9;
  char v10;
  CFStringRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  int v18;
  int *v19;
  char v21;
  size_t bufferSize;

  bufferSize = 0;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 20))
    {
      v9 = SSLGetBufferedReadSize(*(SSLContextRef *)(a1 + 24), &bufferSize);
      if (v9)
      {
        v10 = v9;
        v11 = SecCopyErrorMessageString(v9, 0);
        locklog(0, "lockconn_get_buffered_read_size", CFSTR("SSLGetBufferedReadSize failed: %d (%@)"), v12, v13, v14, v15, v16, v10);
        if (v11)
          CFRelease(v11);
        return 0;
      }
LABEL_13:
      *a2 = bufferSize;
      return 1;
    }
    if (!ioctl(*(_DWORD *)a1, 0x4004667FuLL, &bufferSize))
      goto LABEL_13;
    v18 = *__error();
    v19 = __error();
    strerror(*v19);
    v21 = v18;
    v17 = CFSTR("ioctl (FIONREAD) failed: %d (%s)");
  }
  else
  {
    v17 = CFSTR("Invalid input(s).");
  }
  locklog(0, "lockconn_get_buffered_read_size", v17, a4, a5, a6, a7, a8, v21);
  return 0;
}

uint64_t send_set_value(uint64_t a1, const void *a2, const void *a3, const void *a4, CFStringRef *a5)
{
  __CFDictionary *message;
  __CFDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFString *Value;
  const __CFString *v22;

  if (a5)
    *a5 = 0;
  message = _create_message(CFSTR("SetValue"));
  if (message)
  {
    v11 = message;
    if (a2)
      CFDictionarySetValue(message, CFSTR("Domain"), a2);
    CFDictionarySetValue(v11, CFSTR("Key"), a3);
    CFDictionarySetValue(v11, CFSTR("Value"), a4);
    if (!lockconn_send_message(a1, v11, v12, v13, v14, v15, v16, v17))
    {
      v19 = lockconn_receive_message(a1);
      if (v19)
      {
        v20 = v19;
        Value = (const __CFString *)CFDictionaryGetValue(v19, CFSTR("Error"));
        if (Value)
          v18 = 0xFFFFFFFFLL;
        else
          v18 = 0;
        if (a5)
        {
          v22 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a5 = v22;
            v18 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v20);
        goto LABEL_17;
      }
      if (a5)
        *a5 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
    v18 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v11);
    return v18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_save_value(uint64_t a1, const void *a2, const void *a3, const void *a4, CFStringRef *a5)
{
  __CFDictionary *message;
  __CFDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFString *Value;
  const __CFString *v22;

  if (a5)
    *a5 = 0;
  message = _create_message(CFSTR("SaveValue"));
  if (message)
  {
    v11 = message;
    if (a2)
      CFDictionarySetValue(message, CFSTR("Domain"), a2);
    CFDictionarySetValue(v11, CFSTR("Key"), a3);
    CFDictionarySetValue(v11, CFSTR("Value"), a4);
    if (!lockconn_send_message(a1, v11, v12, v13, v14, v15, v16, v17))
    {
      v19 = lockconn_receive_message(a1);
      if (v19)
      {
        v20 = v19;
        Value = (const __CFString *)CFDictionaryGetValue(v19, CFSTR("Error"));
        if (Value)
          v18 = 0xFFFFFFFFLL;
        else
          v18 = 0;
        if (a5)
        {
          v22 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a5 = v22;
            v18 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v20);
        goto LABEL_17;
      }
      if (a5)
        *a5 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
    v18 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v11);
    return v18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_remove_value(uint64_t a1, const void *a2, const void *a3, const __CFString **a4)
{
  __CFDictionary *message;
  __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const void *Value;
  const __CFString *v20;

  if (a4)
    *a4 = 0;
  message = _create_message(CFSTR("RemoveValue"));
  if (message)
  {
    v9 = message;
    if (a2)
      CFDictionarySetValue(message, CFSTR("Domain"), a2);
    CFDictionarySetValue(v9, CFSTR("Key"), a3);
    if (!lockconn_send_message(a1, v9, v10, v11, v12, v13, v14, v15))
    {
      v17 = lockconn_receive_message(a1);
      if (v17)
      {
        v18 = v17;
        Value = CFDictionaryGetValue(v17, CFSTR("Error"));
        v16 = (uint64_t)Value;
        if (Value)
        {
          if (isCFString(Value))
            v20 = (const __CFString *)v16;
          else
            v20 = CFSTR("InvalidResponse");
          if (v20)
            v16 = 0xFFFFFFFFLL;
          else
            v16 = 0;
          if (a4 && v20)
          {
            CFRetain(v20);
            *a4 = v20;
            v16 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v18);
        goto LABEL_21;
      }
      if (a4)
        *a4 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
    v16 = 0xFFFFFFFFLL;
LABEL_21:
    CFRelease(v9);
    return v16;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_reset_pairing(uint64_t a1, int a2, CFStringRef *a3)
{
  __CFDictionary *message;
  __CFDictionary *v7;
  const void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  const __CFString *Value;
  const __CFString *v19;

  if (a3)
    *a3 = 0;
  message = _create_message(CFSTR("ResetPairing"));
  if (message)
  {
    v7 = message;
    v8 = (const void **)MEMORY[0x24BDBD270];
    if (!a2)
      v8 = (const void **)MEMORY[0x24BDBD268];
    CFDictionarySetValue(message, CFSTR("FullReset"), *v8);
    if (!lockconn_send_message(a1, v7, v9, v10, v11, v12, v13, v14))
    {
      v16 = lockconn_receive_message(a1);
      if (v16)
      {
        v17 = v16;
        Value = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("Error"));
        if (Value)
          v15 = 0xFFFFFFFFLL;
        else
          v15 = 0;
        if (a3)
        {
          v19 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a3 = v19;
            v15 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v17);
        goto LABEL_17;
      }
      if (a3)
        *a3 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
    v15 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v7);
    return v15;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_unpair(uint64_t a1, void *a2, __CFString **a3)
{
  uint64_t v3;
  __CFDictionary *message;
  CFDictionaryRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  __CFString **v16;
  __CFString *v17;
  const __CFDictionary *v19;
  __CFString *Value;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v3 = 0xFFFFFFFFLL;
  if (!a1 || !a2)
    return v3;
  message = _create_message(CFSTR("Unpair"));
  values = a2;
  keys[0] = CFSTR("HostID");
  v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v8
    && (CFDictionarySetValue(message, CFSTR("PairRecord"), v8),
        CFDictionarySetValue(message, CFSTR("ResetTrustPrompt"), (const void *)*MEMORY[0x24BDBD270]),
        !lockconn_send_message(a1, message, v9, v10, v11, v12, v13, v14)))
  {
    v19 = lockconn_receive_message(a1);
    v15 = v19;
    if (v19)
    {
      Value = (__CFString *)CFDictionaryGetValue(v19, CFSTR("Error"));
      v17 = Value;
      if (Value)
        v3 = 0xFFFFFFFFLL;
      else
        v3 = 0;
      if (Value)
        goto LABEL_7;
      goto LABEL_10;
    }
    v16 = &kLDErrorInvalidResponse;
  }
  else
  {
    v15 = 0;
    v16 = &kLDErrorInternalError;
  }
  v17 = *v16;
  if (*v16)
  {
LABEL_7:
    if (a3)
    {
      CFRetain(v17);
      *a3 = v17;
    }
    CFRelease(v17);
  }
LABEL_10:
  if (v8)
    CFRelease(v8);
  if (v15)
    CFRelease(v15);
  if (message)
    CFRelease(message);
  return v3;
}

BOOL send_is_host_trusted(uint64_t a1, const void *a2, const void *a3, CFStringRef *a4)
{
  __CFDictionary *message;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *v15;
  _BOOL8 v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const __CFString *Value;
  const __CFString *v20;

  message = _create_message(CFSTR("IsHostTrusted"));
  if (message)
  {
    v15 = message;
    if (a2)
      CFDictionarySetValue(message, CFSTR("Client"), a2);
    if (a3)
      CFDictionarySetValue(v15, CFSTR("Options"), a3);
    if (lockconn_send_message(a1, v15, v9, v10, v11, v12, v13, v14))
      goto LABEL_7;
    v17 = lockconn_receive_message(a1);
    if (v17)
    {
      v18 = v17;
      Value = (const __CFString *)CFDictionaryGetValue(v17, CFSTR("Error"));
      v16 = Value == 0;
      if (a4)
      {
        v20 = Value;
        if (Value)
        {
          CFRetain(Value);
          *a4 = v20;
        }
      }
      CFRelease(v18);
      goto LABEL_16;
    }
    if (!a4)
    {
LABEL_7:
      v16 = 0;
    }
    else
    {
      v16 = 0;
      *a4 = CFStringCreateCopy(0, CFSTR("InvalidResponse"));
    }
LABEL_16:
    CFRelease(v15);
    return v16;
  }
  return 0;
}

BOOL send_enable_wireless_pairing(uint64_t a1, int a2)
{
  __CFDictionary *message;
  __CFDictionary *v5;
  const void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;

  message = _create_message(CFSTR("EnableWirelessPairing"));
  if (!message)
    return 0;
  v5 = message;
  v6 = (const void **)MEMORY[0x24BDBD270];
  if (!a2)
    v6 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(message, CFSTR("Options"), *v6);
  if (lockconn_send_message(a1, v5, v7, v8, v9, v10, v11, v12)
    || (v14 = lockconn_receive_message(a1)) == 0)
  {
    v13 = 0;
  }
  else
  {
    v15 = v14;
    v13 = CFDictionaryGetValue(v14, CFSTR("Error")) == 0;
    CFRelease(v15);
  }
  CFRelease(v5);
  return v13;
}

uint64_t lockcrypto_decode_pem(const __CFData *a1, const char *a2)
{
  const char *BytePtr;
  CFIndex Length;
  size_t v6;
  int v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  void *v13;
  void *v14;
  char __little[80];
  char __str[80];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  BytePtr = (const char *)CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  if (Length < 0)
    return 0;
  v6 = Length;
  v7 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
  snprintf(__little, 0x50uLL, "\n-----END %s-----\n", a2);
  v8 = strnstr(BytePtr, __str, v6);
  v9 = strnstr(BytePtr, __little, v6);
  v10 = 0;
  if (v8)
  {
    v11 = v9;
    if (v9)
    {
      v12 = &v8[v7];
      v13 = (void *)MEMORY[0x20BCF7860]();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v11 - v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v14, 1);

      objc_autoreleasePoolPop(v13);
    }
  }
  return v10;
}

const __CFData *lockcrypto_cert_from_pem_data(const __CFData *a1)
{
  const __CFData *result;
  const __CFData *v2;
  SecCertificateRef v3;

  result = (const __CFData *)lockcrypto_decode_pem(a1, "CERTIFICATE");
  if (result)
  {
    v2 = result;
    v3 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], result);
    CFRelease(v2);
    return v3;
  }
  return result;
}

uint64_t lockcrypto_private_key_from_pem_data(const __CFData *a1)
{
  const __CFData *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t RSAPrivateKey;
  char v15;

  v1 = (const __CFData *)lockcrypto_decode_pem(a1, "RSA PRIVATE KEY");
  if (v1)
  {
    v7 = v1;
    CFDataGetBytePtr(v1);
    CFDataGetLength(v7);
    RSAPrivateKey = SecKeyCreateRSAPrivateKey();
    if (!RSAPrivateKey)
      locklog(0, "lockcrypto_private_key_from_pem_data", CFSTR("SecKeyCreateRSAPrivateKey failed"), v8, v9, v10, v11, v12, v15);
    CFRelease(v7);
  }
  else
  {
    locklog(0, "lockcrypto_private_key_from_pem_data", CFSTR("lockcrypto_decode_pem failed"), v2, v3, v4, v5, v6, v15);
    return 0;
  }
  return RSAPrivateKey;
}

uint64_t unlock_with_escrow(_QWORD *a1, int a2, CFDataRef theData, const __CFString **a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27[41];
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  CCDigest();
  __sprintf_chk(v27, 0, 0x29uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0);
  CFDataGetLength(theData);
  locklog(0, "unlock_with_escrow", CFSTR("Starting service with bag=%s, %ld"), v7, v8, v9, v10, v11, (char)v27);
  v12 = MKBKeyBagCreateWithData();
  if (v12)
  {
    locklog(0, "unlock_with_escrow", CFSTR("Can't instantiate escrow bag: %d"), v13, v14, v15, v16, v17, v12);
    if (a4)
    {
      v18 = CFSTR("Failure");
LABEL_9:
      v25 = 0;
      *a4 = v18;
      return v25;
    }
    return 0;
  }
  v19 = MKBKeyBagUnlock();
  if (v19)
  {
    locklog(0, "unlock_with_escrow", CFSTR("Can't unlock escrow bag: %d"), v20, v21, v22, v23, v24, v19);
    if (a4)
    {
      v18 = CFSTR("EscrowFailure");
      goto LABEL_9;
    }
    return 0;
  }
  if (a1)
    *a1 = 0;
  return 1;
}

uint64_t lockdown_copy_checkin_info(void *a1, CFArrayRef *a2)
{
  const char *string;
  CFStringRef v5;
  CFStringRef v6;
  const __CFAllocator *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  xpc_object_t value;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef v18;
  CFNumberRef v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char **v27;
  const char *v28;
  pid_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFBagRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFBagRef v47;
  CFArrayRef v48;
  uint64_t v49;
  char v51;
  char v52;
  char *__s;
  time_t v54;
  int v55;
  void *values;
  int64_t valuePtr;
  char v58[26];
  void *v59[2];
  __int128 v60;
  CFBagRef v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  values = 0;
  v55 = -1;
  if (!a2)
    return 8;
  *a2 = 0;
  if (MEMORY[0x20BCF7A70]() != MEMORY[0x24BDACFA0])
    return 8;
  string = xpc_dictionary_get_string(a1, "_LDCHECKININFO");
  if (!string)
    return 8;
  v5 = CFStringCreateWithCString(0, string, 0x8000100u);
  if (!v5)
    return 11;
  v6 = v5;
  v61 = 0;
  *(_OWORD *)v59 = 0u;
  v60 = 0u;
  valuePtr = xpc_dictionary_get_date(a1, "_LDTIMESTAMP");
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongLongType, &valuePtr);
  if (!v8)
  {
    v49 = 8;
    v47 = (CFBagRef)v6;
LABEL_32:
    CFRelease(v47);
    return v49;
  }
  v9 = v8;
  value = xpc_dictionary_get_value(a1, "_LDCHECKINDICT");
  v18 = copy_dict_from_xpc_data(value, v11, v12, v13, v14, v15, v16, v17);
  if (!v18 || (v55 = xpc_dictionary_dup_fd(a1, "_LDSERVICESOCK"), v55 == -1))
  {
    v19 = 0;
    goto LABEL_24;
  }
  v19 = CFNumberCreate(v7, kCFNumberIntType, &v55);
  if (!v19)
  {
LABEL_24:
    v47 = 0;
LABEL_26:
    v49 = 8;
    goto LABEL_27;
  }
  xpc_dictionary_set_value(a1, "_LDSERVICESOCK", 0);
  v20 = xpc_dictionary_dup_fd(a1, "_LDSERVICELOGSOCK");
  if (v20 == -1)
  {
    locklog(0, "lockdown_copy_checkin_info", CFSTR("_LDSERVICELOGSOCK missing"), v21, v22, v23, v24, v25, v51);
  }
  else
  {
    v26 = v20;
    v54 = 0;
    v27 = _NSGetProgname();
    if (v27)
      v28 = *v27;
    else
      v28 = "unknown service";
    __s = 0;
    time(&v54);
    ctime_r(&v54, v58);
    v29 = getpid();
    asprintf(&__s, "%s(%d) checked in at %s", v28, v29, v58);
    if (__s)
    {
      v35 = strlen(__s);
      write(v26, __s, v35);
      free(__s);
    }
    else
    {
      locklog(0, "lockdown_copy_checkin_info", CFSTR("asprintf failed"), v30, v31, v32, v33, v34, v52);
    }
    close(v26);
  }
  xpc_dictionary_set_value(a1, "_LDSERVICELOGSOCK", 0);
  values = xpc_dictionary_get_remote_connection(a1);
  if (!values)
  {
    locklog(0, "lockdown_copy_checkin_info", CFSTR("Failed to get XPC connection from message."), v36, v37, v38, v39, v40, v52);
    goto LABEL_24;
  }
  v41 = CFBagCreate(v7, (const void **)&values, 1, &xpc_connection_bag_callbacks);
  v47 = v41;
  if (!v41)
  {
    locklog(0, "lockdown_copy_checkin_info", CFSTR("Failed to store XPC connection in CFBag."), v42, v43, v44, v45, v46, v52);
    goto LABEL_26;
  }
  v59[0] = (void *)v6;
  v59[1] = v9;
  *(_QWORD *)&v60 = v18;
  *((_QWORD *)&v60 + 1) = v19;
  v61 = v41;
  v48 = CFArrayCreate(v7, (const void **)v59, 5, MEMORY[0x24BDBD690]);
  *a2 = v48;
  if (v48)
    v49 = 0;
  else
    v49 = 11;
LABEL_27:
  CFRelease(v6);
  CFRelease(v9);
  if (v18)
    CFRelease(v18);
  if (v19)
    CFRelease(v19);
  if (v47)
    goto LABEL_32;
  return v49;
}

CFTypeRef lockdown_copy_wireless_connections_list()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_connection_t mach_service;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  xpc_object_t value;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  CFTypeRef v26;
  _xpc_connection_s *v27;
  __int16 v29[8];
  uint8_t buf[16];

  v0 = (_xpc_connection_s *)xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    return 0;
  }
  v1 = v0;
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
  if (!mach_service)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v29[0] = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create mach service connection.", (uint8_t *)v29, 2u);
    }
    v27 = v1;
    goto LABEL_13;
  }
  v3 = mach_service;
  xpc_dictionary_set_uint64(v1, "HB_PARAM_COMMAND", 4uLL);
  xpc_connection_set_event_handler(v3, &__block_literal_global);
  xpc_connection_resume(v3);
  v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
  if (!v4)
  {
    locklog(0, "lockdown_copy_wireless_connections_list", CFSTR("Failed to send xpc message."), v5, v6, v7, v8, v9, v29[0]);
    xpc_release(v1);
    v27 = v3;
LABEL_13:
    xpc_release(v27);
    return 0;
  }
  v10 = v4;
  value = xpc_dictionary_get_value(v4, "HB_PARAM_OBJECT");
  if (value)
  {
    v19 = copy_array_from_xpc_data(value, v12, v13, v14, v15, v16, v17, v18);
    v25 = v19;
    if (v19)
    {
      v26 = CFRetain(v19);
    }
    else
    {
      locklog(0, "lockdown_copy_wireless_connections_list", CFSTR("Failed to copy array from xpc data."), v20, v21, v22, v23, v24, v29[0]);
      v26 = 0;
    }
  }
  else
  {
    locklog(0, "lockdown_copy_wireless_connections_list", CFSTR("Invalid xpc response."), v14, v15, v16, v17, v18, v29[0]);
    v26 = 0;
    v25 = 0;
  }
  xpc_release(v10);
  xpc_release(v1);
  xpc_release(v3);
  if (v25)
    CFRelease(v25);
  return v26;
}

void lockdown_kill_wireless_connections(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  xpc_connection_t mach_service;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _xpc_connection_s *v22;
  xpc_object_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _xpc_connection_s *v29;
  char v30;

  v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    v15 = v9;
    mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
    if (mach_service)
    {
      v22 = mach_service;
      xpc_dictionary_set_uint64(v15, "HB_PARAM_COMMAND", 2uLL);
      xpc_connection_set_event_handler(v22, &__block_literal_global_29);
      xpc_connection_resume(v22);
      v23 = xpc_connection_send_message_with_reply_sync(v22, v15);
      if (v23)
        xpc_release(v23);
      else
        locklog(0, "lockdown_kill_wireless_connections", CFSTR("Failed to receive xpc reply."), v24, v25, v26, v27, v28, v30);
      xpc_release(v15);
      v29 = v22;
    }
    else
    {
      locklog(0, "lockdown_kill_wireless_connections", CFSTR("Failed to create xpc mach service."), v17, v18, v19, v20, v21, v30);
      v29 = (_xpc_connection_s *)v15;
    }
    xpc_release(v29);
  }
  else
  {
    locklog(0, "lockdown_kill_wireless_connections", CFSTR("Failed to create xpc dictionary."), v10, v11, v12, v13, v14, a9);
  }
}

uint64_t secure_lockdown_checkin(_QWORD *a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  const __CFArray *Value;
  const __CFArray *v7;
  const void *ValueAtIndex;
  const void *v9;
  const void *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  unsigned int v21;
  const void *v22;
  const void *v23;
  int v24;
  const void *v25;
  int v26;
  char *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_time_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  _QWORD *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  const char *v51;
  uint32_t v52;
  _QWORD *v53;
  void *v54;
  const void *v55;
  const void *v56;
  const __CFData *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const __CFString *v66;
  char *v67;
  const void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  const __CFDictionary *theDicta;
  _QWORD *v74;
  _QWORD v75[9];
  uint8_t v76[4];
  unsigned int v77;
  void *values;
  CFTypeRef cf;
  int valuePtr;
  int v81;
  uint8_t buf[8];
  uint8_t *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  valuePtr = -1;
  v81 = 0;
  values = 0;
  cf = 0;
  v77 = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v41 = MEMORY[0x24BDACB70];
      v42 = "Invalid input.";
LABEL_46:
      _os_log_impl(&dword_2064E2000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
    }
LABEL_47:
    v43 = 0;
    v44 = 0;
    v30 = 0;
    v24 = -1;
    v40 = 1;
    goto LABEL_55;
  }
  if (!theDict || (Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("CheckinConnectionInfo"))) == 0)
  {
    *(_QWORD *)buf = 0;
    v83 = buf;
    v84 = 0x2000000000;
    v85 = 0;
    v27 = getenv("LOCKDOWN_MACH_SERVICE");
    if (v27)
    {
      v28 = v27;
      v29 = dispatch_semaphore_create(0);
      if (v29)
      {
        v30 = v29;
        dispatch_retain(v29);
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 0x40000000;
        v75[2] = __secure_lockdown_checkin_block_invoke;
        v75[3] = &unk_24BF22A68;
        v75[4] = buf;
        v75[5] = v28;
        v75[6] = a1;
        v75[7] = a3;
        v75[8] = v30;
        lockdown_checkin_xpc(v28, theDict, 0, (uint64_t)v75);
        v31 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v30, v31))
        {
          v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v32)
            secure_lockdown_checkin_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
          v40 = 9;
        }
        else
        {
          v40 = 0;
        }
        goto LABEL_54;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        v45 = MEMORY[0x24BDACB70];
        v46 = "Failed to create semaphore.";
        goto LABEL_52;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      v45 = MEMORY[0x24BDACB70];
      v46 = "Unknown service name.";
LABEL_52:
      _os_log_impl(&dword_2064E2000, v45, OS_LOG_TYPE_DEFAULT, v46, v76, 2u);
    }
    v30 = 0;
    v40 = 1;
LABEL_54:
    _Block_object_dispose(buf, 8);
    v43 = 0;
    v44 = 0;
    v24 = -1;
    goto LABEL_55;
  }
  v7 = Value;
  if (!isCFArray(Value) || CFArrayGetCount(v7) != 5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v41 = MEMORY[0x24BDACB70];
      v42 = "Invalid sideband info.";
      goto LABEL_46;
    }
    goto LABEL_47;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(v7, 2);
  if (!isCFDictionary(ValueAtIndex))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Invalid info.";
    goto LABEL_46;
  }
  v9 = CFArrayGetValueAtIndex(v7, 3);
  if (!isCFNumber(v9))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Invalid socket.";
    goto LABEL_46;
  }
  if (!CFNumberGetValue((CFNumberRef)v9, kCFNumberIntType, &valuePtr))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Failed to convert number.";
    goto LABEL_46;
  }
  v10 = CFArrayGetValueAtIndex(v7, 4);
  if (!isCFBag(v10))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_84;
    *(_WORD *)buf = 0;
    v48 = MEMORY[0x24BDACB70];
    v49 = "Failed to read CF bag containing XPC connection.";
LABEL_83:
    _os_log_impl(&dword_2064E2000, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
    goto LABEL_84;
  }
  if (MEMORY[0x20BCF73C8](v10) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_84;
    *(_WORD *)buf = 0;
    v48 = MEMORY[0x24BDACB70];
    v49 = "Unexpected number of items in XPC connection bag.";
    goto LABEL_83;
  }
  CFBagGetValues((CFBagRef)v10, (const void **)&values);
  if (!values)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_84;
    *(_WORD *)buf = 0;
    v48 = MEMORY[0x24BDACB70];
    v49 = "Failed to get remote connection from XPC message.";
    goto LABEL_83;
  }
  if (!ack_checkin((_xpc_connection_s *)values))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v48 = MEMORY[0x24BDACB70];
      v49 = "Failed to send checkin reply.";
      goto LABEL_83;
    }
LABEL_84:
    v43 = 0;
    v44 = 0;
    v30 = 0;
    v24 = -1;
    v40 = 8;
    goto LABEL_55;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Failed to create dictionary.";
    goto LABEL_46;
  }
  v12 = Mutable;
  v81 = 2;
  v13 = CFNumberCreate(0, kCFNumberIntType, &v81);
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create number.", buf, 2u);
    }
    CFRelease(v12);
    goto LABEL_47;
  }
  v14 = v13;
  CFDictionarySetValue(v12, CFSTR("CheckinVersion"), v13);
  v15 = CFArrayGetValueAtIndex(v7, 0);
  if (isCFString(v15))
    CFDictionarySetValue(v12, CFSTR("CheckinPath"), v15);
  v16 = CFArrayGetValueAtIndex(v7, 1);
  if (isCFNumber(v16))
    CFDictionarySetValue(v12, CFSTR("CheckinTimestamp"), v16);
  v17 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostID"));
  if (isCFString(v17))
    CFDictionarySetValue(v12, CFSTR("HostID"), v17);
  v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostSideClientName"));
  if (isCFString(v18))
    CFDictionarySetValue(v12, CFSTR("ClientName"), v18);
  v19 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostSideHostName"));
  if (isCFString(v19))
    CFDictionarySetValue(v12, CFSTR("HostName"), v19);
  v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostConnectionType"));
  if (isCFNumber(v20))
  {
    if (CFNumberGetValue((CFNumberRef)v20, kCFNumberIntType, &v77))
    {
      v21 = v77;
      if (v77 < 7)
      {
        if (v20)
        {
          CFDictionarySetValue(v12, CFSTR("ConnectionType"), v20);
          goto LABEL_30;
        }
LABEL_104:
        v43 = 0;
        v44 = 0;
        v24 = -1;
        goto LABEL_122;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_104;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v21;
      v50 = MEMORY[0x24BDACB70];
      v51 = "Unknown connection type: %d";
      v52 = 8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_104;
      *(_WORD *)buf = 0;
      v50 = MEMORY[0x24BDACB70];
      v51 = "Failed to get number.";
      v52 = 2;
    }
    _os_log_impl(&dword_2064E2000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, v52);
    goto LABEL_104;
  }
LABEL_30:
  v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("EscrowBag"));
  v23 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("EscrowSecret"));
  if (isCFData(v22) && isCFData(v23) && !unlock_with_escrow(&cf, (int)v22, (CFDataRef)v23, 0))
    goto LABEL_104;
  v24 = valuePtr;
  if (v77 - 7 > 0xFFFFFFFD)
  {
    valuePtr = -1;
  }
  else
  {
    v25 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostIP"));
    v26 = accept_with_timeout(v24, 5, v25);
    v24 = v26;
    if (v26 == -1)
    {
LABEL_107:
      v43 = 0;
      v44 = 0;
      goto LABEL_122;
    }
    _disable_sigpipe(v26);
    _disable_wake_from_sleep(v24);
  }
  theDicta = theDict;
  v74 = a1;
  v53 = malloc_type_calloc(1uLL, 0x18uLL, 0xA0040A8488062uLL);
  if (!v53)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to allocate memory.", buf, 2u);
    }
    goto LABEL_107;
  }
  v44 = v53;
  v54 = lockconn_new();
  if (!v54)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to allocate connection.", buf, 2u);
    }
    v43 = 0;
    goto LABEL_122;
  }
  v43 = v54;
  lockconn_init((uint64_t)v54, v24, v77);
  v55 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("DeviceCertificate"));
  v56 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("DevicePrivateKey"));
  v57 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostRootCertificate"));
  if (!isCFData(v55) || !isCFData(v56))
    goto LABEL_108;
  if (isCFData(v57))
  {
    if (lockconn_enable_ssl((uint64_t)v43, (const __CFData *)v55, (const __CFData *)v56, v57, 0))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v58 = MEMORY[0x24BDACB70];
        v59 = "Failed to enable SSL.";
LABEL_121:
        _os_log_impl(&dword_2064E2000, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 2u);
        goto LABEL_122;
      }
      goto LABEL_122;
    }
LABEL_108:
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, CFSTR("UseHostTracker"))
      && !CFDictionaryContainsKey(theDicta, CFSTR("NoHeartBeat")))
    {
      *(_QWORD *)buf = 0;
      v66 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostID"));
      v67 = (char *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostSideHostName"));
      v68 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("HostSideClientName"));
      HBWatchFDForHost(v24, v66, v67, (uint64_t)v68, (uint64_t *)buf, v69, v70, v71, v72);
      lockconn_set_heartbeat_ref((uint64_t)v43, *(uint64_t *)buf);
    }
    if (cf)
      lockconn_set_keybag_handle((uint64_t)v43, cf, v60, v61, v62, v63, v64, v65, v72);
    *v44 = v43;
    *v74 = v44;
    v43 = 0;
    v44 = 0;
    v40 = 0;
    if (a3)
      *a3 = CFRetain(v12);
    v24 = -1;
    goto LABEL_123;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v58 = MEMORY[0x24BDACB70];
    v59 = "Invalid root certificate.";
    goto LABEL_121;
  }
LABEL_122:
  v40 = 1;
LABEL_123:
  CFRelease(v12);
  CFRelease(v14);
  v30 = 0;
LABEL_55:
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v44)
    free(v44);
  if (v30)
    dispatch_release(v30);
  if (valuePtr != -1)
    close(valuePtr);
  if (v43)
  {
    lockconn_disable_ssl((uint64_t)v43);
    lockconn_close((unint64_t)v43);
    lockconn_free(v43);
  }
  if (v24 != -1)
    close(v24);
  return v40;
}

uint64_t lockdown_checkin_xpc(const char *a1, const void *a2, NSObject *a3, uint64_t a4)
{
  NSObject *global_queue;
  xpc_connection_t mach_service;
  _xpc_connection_s *v10;
  _QWORD handler[9];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;

  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service(a1, global_queue, 1uLL);
  if (mach_service)
  {
    v10 = mach_service;
    if (a2)
      CFRetain(a2);
    if (!a3)
      a3 = global_queue;
    dispatch_retain(a3);
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2000000000;
    v16 = 0;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __lockdown_checkin_xpc_block_invoke;
    handler[3] = &unk_24BF22AB8;
    handler[6] = v10;
    handler[7] = a2;
    handler[8] = a3;
    handler[4] = a4;
    handler[5] = buf;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(v10);
    _Block_object_dispose(buf, 8);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not create XPC listener", buf, 2u);
    }
    return 1;
  }
}

void __secure_lockdown_checkin_block_invoke(uint64_t a1, uint64_t a2, CFTypeRef cf)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 136315138;
      v7 = v5;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unexpected second connection to %s.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    **(_QWORD **)(a1 + 48) = a2;
    if (*(_QWORD *)(a1 + 56))
      **(_QWORD **)(a1 + 56) = CFRetain(cf);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

BOOL ack_checkin(_xpc_connection_s *a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  v8 = v2;
  if (v2)
  {
    xpc_dictionary_set_BOOL(v2, "ACK", 1);
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }
  else
  {
    locklog(0, "ack_checkin", CFSTR("Couldn't construct a checkin reply message."), v3, v4, v5, v6, v7, v10);
  }
  return v8 != 0;
}

void HBWatchFDForHost(int a1, const __CFString *a2, char *a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  xpc_object_t v14;
  void *v15;
  xpc_connection_t mach_service;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _xpc_connection_s *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  xpc_object_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  _xpc_connection_s *v48;
  char v49;

  if (!a2)
  {
    v47 = CFSTR("Invalid host id.");
LABEL_18:
    locklog(0, "HBWatchFDForHost", v47, a4, (uint64_t)a5, a6, a7, a8, a9);
    return;
  }
  v10 = (char *)a4;
  v14 = xpc_dictionary_create(0, 0, 0);
  if (!v14)
  {
    v47 = CFSTR("Failed to allocate xpc dictionary.");
    goto LABEL_18;
  }
  v15 = v14;
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
  if (mach_service)
  {
    v22 = mach_service;
    v23 = copy_cstr_from_cfstr(a2);
    if (v23)
    {
      v29 = v23;
      if (v10 && (v10 = (char *)copy_cstr_from_cfstr((const __CFString *)v10)) == 0)
      {
        locklog(0, "HBWatchFDForHost", CFSTR("Failed to convert client name string."), v30, v31, v32, v33, v34, v49);
        free(v29);
      }
      else
      {
        if (a3 && (a3 = (char *)copy_cstr_from_cfstr((const __CFString *)a3)) == 0)
        {
          locklog(0, "HBWatchFDForHost", CFSTR("Failed to convert host name string."), v35, v36, v37, v38, v39, v49);
          v46 = 0;
        }
        else
        {
          xpc_dictionary_set_uint64(v15, "HB_PARAM_COMMAND", 1uLL);
          xpc_dictionary_set_fd(v15, "HB_PARAM_FD", a1);
          xpc_dictionary_set_string(v15, "HB_PARAM_HOSTID", (const char *)v29);
          xpc_dictionary_set_uint64(v15, "HB_PARAM_THEIRFD", a1);
          if (v10)
            xpc_dictionary_set_string(v15, "HB_PARAM_CLIENTNAME", v10);
          if (a3)
            xpc_dictionary_set_string(v15, "HB_PARAM_HOSTNAME", a3);
          xpc_connection_set_event_handler(v22, &__block_literal_global_87);
          xpc_connection_resume(v22);
          v40 = xpc_connection_send_message_with_reply_sync(v22, v15);
          v46 = v40;
          if (v40)
          {
            if (a5)
              *a5 = xpc_dictionary_get_uint64(v40, "HB_PARAM_REF");
          }
          else
          {
            locklog(0, "HBWatchFDForHost", CFSTR("Failed to send xpc message."), v41, v42, v43, v44, v45, v49);
          }
        }
        free(v29);
        if (v10)
          free(v10);
        if (a3)
          free(a3);
        if (v46)
          xpc_release(v46);
      }
    }
    else
    {
      locklog(0, "HBWatchFDForHost", CFSTR("Failed to convert host id string."), v24, v25, v26, v27, v28, v49);
    }
    xpc_release(v15);
    v48 = v22;
  }
  else
  {
    locklog(0, "HBWatchFDForHost", CFSTR("Failed to create xpc mach service."), v17, v18, v19, v20, v21, v49);
    v48 = (_xpc_connection_s *)v15;
  }
  xpc_release(v48);
}

void __lockdown_checkin_xpc_block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const void *v10;
  _QWORD v11[4];
  __int128 v12;
  uint8_t *v13;
  __int128 v14;
  _xpc_connection_s *v15;
  uint8_t v16[4];
  pid_t pid;
  uint8_t buf[16];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BCF7A70](a2) == MEMORY[0x24BDACF88])
  {
    *(_OWORD *)buf = 0u;
    v19 = 0u;
    xpc_connection_get_audit_token();
    v6 = (void *)xpc_copy_entitlement_for_token();
    if (v6 && (v7 = v6, v8 = (void *)MEMORY[0x24BDACF20], xpc_release(v6), v7 == v8))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      v19 = 0x2000000000uLL;
      *((_QWORD *)&v19 + 1) = xpc_retain(*(xpc_object_t *)(a1 + 48));
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = __lockdown_checkin_xpc_block_invoke_2;
      v11[3] = &unk_24BF22A90;
      v14 = *(_OWORD *)(a1 + 56);
      v12 = *(_OWORD *)(a1 + 32);
      v15 = a2;
      v13 = buf;
      xpc_connection_set_event_handler(a2, v11);
      xpc_connection_resume(a2);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 67109120;
        pid = xpc_connection_get_pid(a2);
        _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "connection attempt from pid %d missing entitlement: iamlockdown", v16, 8u);
      }
      xpc_connection_cancel(a2);
    }
  }
  else
  {
    if (a2 == (_xpc_connection_s *)MEMORY[0x24BDACF48])
    {
      syslog(6, "XPC connection closing, time to go");
    }
    else if (a2 != (_xpc_connection_s *)MEMORY[0x24BDACF38]
           || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0)
    {
      v5 = (void *)MEMORY[0x20BCF79A4](a2);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%s' on xpc listener", buf, 0xCu);
      }
      free(v5);
    }
    else
    {
      syslog(6, "XPC listener can now be shutdown");
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 48));
    v9 = *(NSObject **)(a1 + 64);
    if (v9)
      dispatch_release(v9);
    v10 = *(const void **)(a1 + 56);
    if (v10)
      CFRelease(v10);
  }
}

void __lockdown_checkin_xpc_block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  BOOL v5;
  const __CFDictionary *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  const __CFDictionary *v11;
  _xpc_connection_s *v12;
  __CFDictionary *MutableCopy;
  int v14;
  const void *Value;
  const __CFString *v16;
  char v17;
  uint64_t CString;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  CFDictionaryRef theDict;
  CFTypeRef cf;
  _BYTE block[24];
  void *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  CFDictionaryRef v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BCF7A70](a2) != MEMORY[0x24BDACFA0])
  {
    if (a2 == (void *)MEMORY[0x24BDACF48])
    {
      syslog(6, "XPC connection should close now");
    }
    else if (a2 == (void *)MEMORY[0x24BDACF38])
    {
      syslog(6, "The connection is now invalid.");
    }
    else
    {
      v4 = (void *)MEMORY[0x20BCF79A4](a2);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = v4;
        _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%s' on xpc connection", buf, 0xCu);
      }
      free(v4);
    }
    goto LABEL_19;
  }
  v5 = xpc_dictionary_get_BOOL(a2, "_LDKEEPCONNALIVE");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "_LDSHUTDOWNLISTENER");
  v6 = *(const __CFDictionary **)(a1 + 56);
  v7 = *(NSObject **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  theDict = 0;
  cf = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 0;
  v34 = 0;
  bzero(buf, 0x400uLL);
  v9 = lockdown_copy_checkin_info(a2, (CFArrayRef *)&cf);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&block[4] = v10;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "lockdown_copy_checkin_info failed (%d).", block, 8u);
    }
    v11 = 0;
    goto LABEL_11;
  }
  if (v6)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v11 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("CheckinConnectionInfo"), cf);
  v14 = secure_lockdown_checkin((int)&v34, v11);
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("CheckinPath"));
    v16 = (const __CFString *)isCFString(Value);
    if (v16)
    {
      v17 = (char)v16;
      CString = CFStringGetCString(v16, (char *)buf, 1024, 0x8000100u);
      if (!(_DWORD)CString)
      {
        locklog(CString, "handle_lockdown_xpc_message", CFSTR("CFStringGetCString failure for %@"), v19, v20, v21, v22, v23, v17);
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        *(_WORD *)block = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "hinkyness";
        v26 = 2;
        goto LABEL_40;
      }
    }
  }
  if (v14)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)block = 136315394;
    *(_QWORD *)&block[4] = buf;
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = v14;
    v24 = MEMORY[0x24BDACB70];
    v25 = "Could not check in with lockdown at '%s': %d";
    v26 = 18;
LABEL_40:
    _os_log_impl(&dword_2064E2000, v24, OS_LOG_TYPE_DEFAULT, v25, block, v26);
    goto LABEL_11;
  }
  if (v34)
  {
    v27 = lockconn_sock(*(unsigned int **)v34);
    v28 = "out";
    if (v34 && lockconn_sslcontext(*(_QWORD *)v34))
      v28 = "";
  }
  else
  {
    v28 = "out";
    v27 = -1;
  }
  syslog(6, "Checked in with lockdown on path '%s' socket %d with%s SSL", (const char *)buf, v27, v28);
  if (a2 && (v29 = v34) != 0)
  {
    xpc_retain(a2);
    v30 = *(void **)(v29 + 8);
    if (v30)
      xpc_release(v30);
    *(_QWORD *)(v29 + 8) = a2;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)block = 0;
    _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", block, 2u);
  }
  v31 = v34;
  if (!*(_QWORD *)(v34 + 16))
    *(_QWORD *)(v31 + 16) = os_transaction_create();
  v32 = os_transaction_create();
  v33 = MEMORY[0x24BDAC760];
  v36[3] = v32;
  *(_QWORD *)block = v33;
  *(_QWORD *)&block[8] = 0x40000000;
  *(_QWORD *)&block[16] = __handle_lockdown_xpc_message_block_invoke;
  v42 = &unk_24BF22B20;
  v45 = v34;
  v46 = theDict;
  v43 = v8;
  v44 = &v35;
  dispatch_async(v7, block);
LABEL_11:
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);
  _Block_object_dispose(&v35, 8);
  if (v5)
  {
    xpc_connection_suspend(*(xpc_connection_t *)(a1 + 72));
    goto LABEL_20;
  }
LABEL_19:
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 72));
LABEL_20:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v12 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v12)
    {
      xpc_connection_cancel(v12);
      xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
}

ssize_t lockdown_send(uint64_t *a1, const void *a2, size_t a3)
{
  return lockconn_send(*a1, a2, a3);
}

ssize_t lockdown_recv(uint64_t *a1, void *a2, size_t a3)
{
  return lockconn_recv(*a1, a2, a3);
}

uint64_t lockdown_get_buffered_read_size(uint64_t *a1, size_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return lockconn_get_buffered_read_size(*a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL lockdown_send_message(_QWORD *a1)
{
  return lockconn_send_message_with_format(*a1) != 0;
}

uint64_t lockdown_receive_message(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (!a2)
    return 1;
  v3 = lockconn_receive_message_no_select(*a1);
  if (!v3)
    return 1;
  v4 = v3;
  result = 0;
  *a2 = v4;
  return result;
}

uint64_t lockdown_get_socket(unsigned int **a1)
{
  if (a1)
    return lockconn_sock(*a1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t *lockdown_get_securecontext(uint64_t *result)
{
  if (result)
    return (uint64_t *)lockconn_sslcontext(*result);
  return result;
}

uint64_t lockdown_set_value(uint64_t *a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v4;
  CFTypeRef cf;

  cf = 0;
  send_set_value(*a1, a2, a3, a4, (CFStringRef *)&cf);
  if (!cf)
    return 0;
  v4 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v4;
}

uint64_t _convert_error(const __CFString *a1)
{
  if (!isCFString(a1) || CFStringCompare(a1, CFSTR("InvalidResponse"), 0) == kCFCompareEqualTo)
    return 1;
  if (CFStringCompare(a1, CFSTR("MissingKey"), 0) == kCFCompareEqualTo)
    return 2;
  if (CFStringCompare(a1, CFSTR("MissingValue"), 0) == kCFCompareEqualTo)
    return 3;
  if (CFStringCompare(a1, CFSTR("GetProhibited"), 0) == kCFCompareEqualTo)
    return 4;
  if (CFStringCompare(a1, CFSTR("SetProhibited"), 0) == kCFCompareEqualTo)
    return 5;
  if (CFStringCompare(a1, CFSTR("RemoveProhibited"), 0) == kCFCompareEqualTo)
    return 6;
  if (CFStringCompare(a1, CFSTR("ImmutableValue"), 0) == kCFCompareEqualTo)
    return 7;
  if (CFStringCompare(a1, CFSTR("InvalidCheckin"), 0) == kCFCompareEqualTo)
    return 8;
  if (CFStringCompare(a1, CFSTR("CheckinTimeout"), 0))
    return 0;
  return 9;
}

uint64_t lockdown_save_value(uint64_t *a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v4;
  CFTypeRef cf;

  cf = 0;
  send_save_value(*a1, a2, a3, a4, (CFStringRef *)&cf);
  if (!cf)
    return 0;
  v4 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v4;
}

uint64_t lockdown_remove_value(uint64_t *a1, const void *a2, const void *a3)
{
  uint64_t v3;
  CFTypeRef cf;

  cf = 0;
  send_remove_value(*a1, a2, a3, (const __CFString **)&cf);
  if (!cf)
    return 0;
  v3 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v3;
}

uint64_t lockdown_copy_identity(uint64_t *a1)
{
  const __CFData *value;
  const __CFData *v3;
  const __CFData *v4;
  const __CFData *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint8_t v10[16];
  uint8_t buf[16];

  value = (const __CFData *)send_get_value(*a1, 0, CFSTR("ActivationPrivateKey"), 0);
  v3 = (const __CFData *)send_get_value(*a1, 0, CFSTR("DeviceCertificate"), 0);
  v4 = lockcrypto_cert_from_pem_data(v3);
  if (v4)
  {
    v5 = v4;
    v6 = lockcrypto_private_key_from_pem_data(value);
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = SecIdentityCreate();
      CFRelease(v7);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Can't convert pem key", v10, 2u);
      }
      v8 = 0;
    }
    CFRelease(v5);
    if (v3)
LABEL_5:
      CFRelease(v3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Can't convert pem cert", buf, 2u);
    }
    v8 = 0;
    if (v3)
      goto LABEL_5;
  }
  if (value)
    CFRelease(value);
  return v8;
}

const void *lockdown_copy_DPK()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("ActivationPrivateKey"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_ticket_status()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("WeHaveATicket"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_activationState()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("ActivationState"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_brickState()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("BrickState"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_trustedHostAttached()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("TrustedHostAttached"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_raptor()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("UseRaptorCerts"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

uint64_t *lockdown_copy_deviceIdentity()
{
  uint64_t *result;
  uint64_t *v1;
  uint64_t v2;

  result = lockdown_connect();
  if (result)
  {
    v1 = result;
    v2 = lockdown_copy_identity(result);
    lockdown_disconnect(v1);
    return (uint64_t *)v2;
  }
  return result;
}

const void *lockdown_copy_deviceCertificate()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("DeviceCertificate"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_ticket()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, CFSTR("com.apple.fmip"), CFSTR("ActivationRecord"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

BOOL lockdown_set_fmipticket(_BOOL8 a1)
{
  _BOOL8 v1;
  uint64_t *v2;
  uint64_t *v3;
  CFTypeRef cf;

  v1 = a1;
  if (a1)
  {
    cf = 0;
    v2 = lockdown_connect();
    if (v2)
    {
      v3 = v2;
      v1 = send_set_value(*v2, CFSTR("com.apple.fmip"), CFSTR("ActivationRecord"), (const void *)v1, (CFStringRef *)&cf) == 0;
      if (cf)
        CFRelease(cf);
      lockdown_disconnect(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t *lockdown_is_host_trusted(const void *a1, const void *a2, CFStringRef *a3)
{
  uint64_t *result;
  uint64_t *v7;
  _BOOL8 is_host_trusted;

  result = lockdown_connect();
  if (result)
  {
    v7 = result;
    is_host_trusted = send_is_host_trusted(*result, a1, a2, a3);
    lockdown_disconnect(v7);
    return (uint64_t *)is_host_trusted;
  }
  return result;
}

uint64_t lockdown_reset_pairing()
{
  return lockdown_reset_pairing_internal(1);
}

uint64_t lockdown_reset_pairing_internal(int a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  CFTypeRef cf;

  cf = 0;
  v2 = lockdown_connect();
  if (!v2)
    return 8;
  v3 = v2;
  send_reset_pairing(*v2, a1, (CFStringRef *)&cf);
  if (cf)
  {
    v4 = _convert_error((const __CFString *)cf);
    CFRelease(cf);
  }
  else
  {
    v4 = 0;
  }
  lockdown_disconnect(v3);
  return v4;
}

uint64_t lockdown_delete_pair_records()
{
  return lockdown_reset_pairing_internal(0);
}

const void *lockdown_copy_regulatoryvariant()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (!v0)
    return 0;
  v1 = v0;
  value = send_get_value(*v0, 0, CFSTR("ActivationRegulatoryVariant"), (CFStringRef *)&cf);
  if (cf)
    CFRelease(cf);
  lockdown_disconnect(v1);
  return value;
}

uint64_t *lockdown_enable_wireless_pairing(int a1)
{
  uint64_t *result;
  uint64_t *v3;
  _BOOL8 v4;

  result = lockdown_connect();
  if (result)
  {
    v3 = result;
    v4 = send_enable_wireless_pairing(*result, a1);
    lockdown_disconnect(v3);
    return (uint64_t *)v4;
  }
  return result;
}

uint64_t *lockdown_connection_is_wifi(uint64_t *result)
{
  if (result)
    return (uint64_t *)(lockconn_type(*result) == 3);
  return result;
}

uint64_t *lockdown_connection_is_usb(uint64_t *result)
{
  if (result)
    return (uint64_t *)(lockconn_type(*result) == 1);
  return result;
}

uint64_t *lockdown_connection_is_proxy(uint64_t *result)
{
  if (result)
    return (uint64_t *)(lockconn_type(*result) == 2);
  return result;
}

const void *lockdown_copy_paired_host_info()
{
  uint64_t *v0;
  uint64_t *v1;
  const void *value;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;

  cf = 0;
  v0 = lockdown_connect();
  if (v0)
  {
    v1 = v0;
    value = send_get_value(*v0, CFSTR("com.apple.mobile.lockdown.paired_host_info"), 0, (CFStringRef *)&cf);
    if (!value && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      lockdown_copy_paired_host_info_cold_2((uint64_t *)&cf);
    lockdown_disconnect(v1);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      lockdown_copy_paired_host_info_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  return value;
}

uint64_t lockdown_unpair_host_by_id(void *a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;

  cf = 0;
  v2 = lockdown_connect();
  if (v2)
  {
    v3 = v2;
    if (send_unpair(*v2, a1, (__CFString **)&cf))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        lockdown_unpair_host_by_id_cold_2((uint64_t)a1, (uint64_t *)&cf);
      v4 = 6;
    }
    else
    {
      v4 = 0;
    }
    lockdown_disconnect(v3);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      lockdown_copy_paired_host_info_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    return 8;
  }
  return v4;
}

xpc_object_t cfbag_xpc_retain(int a1, xpc_object_t object)
{
  if (object)
    xpc_retain(object);
  return object;
}

void cfbag_xpc_release(int a1, xpc_object_t object)
{
  if (object)
    xpc_release(object);
}

void *copy_cstr_from_cfstr(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v4;
  void *v5;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v4 = MaximumSizeForEncoding + 1;
  v5 = malloc_type_calloc(1uLL, MaximumSizeForEncoding + 2, 0x157252B8uLL);
  if (!CFStringGetCString(a1, (char *)v5, v4, 0x8000100u))
  {
    free(v5);
    return 0;
  }
  return v5;
}

void __handle_lockdown_xpc_message_block_invoke(_QWORD *a1)
{
  const void *v2;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[7];
  if (v2)
    CFRelease(v2);
  os_release(*(void **)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const void *isCFNumber(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *isCFDictionary(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFDictionaryGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *isCFArray(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFArrayGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *isCFString(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *isCFData(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFDataGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *isCFBag(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFBagGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

BOOL _disable_wake_from_sleep(int a1)
{
  int v1;
  int *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;

  v10 = 1;
  v1 = setsockopt(a1, 0xFFFF, 0x10000, &v10, 4u);
  if (v1 == -1)
  {
    v2 = __error();
    v3 = strerror(*v2);
    locklog(0, "_disable_wake_from_sleep", CFSTR("setsockopt(SO_NOWAKEFROMSLEEP) failed: %s"), v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

CFStringRef createIPString(int a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  socklen_t v31;
  char cStr[128];
  sockaddr v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = (sockaddr)0;
  v34 = 0u;
  v31 = 128;
  if (getpeername(a1, &v33, &v31))
  {
    v10 = __error();
    v11 = strerror(*v10);
    locklog(0, "createIPString", CFSTR("Can't get socket address: %s"), v12, v13, v14, v15, v16, v11);
  }
  else if (v33.sa_family == 30)
  {
    if (inet_ntop(30, &v33.sa_data[6], cStr, 0x80u))
    {
      v8 = 1;
      goto LABEL_8;
    }
    v24 = __error();
    v25 = strerror(*v24);
    locklog(0, "createIPString", CFSTR("Can't convert to ipv6 string: %s"), v26, v27, v28, v29, v30, v25);
  }
  else if (v33.sa_family == 2)
  {
    if (inet_ntop(2, &v33.sa_data[2], cStr, 0x80u))
    {
      v8 = 0;
LABEL_8:
      *a2 = v8;
      return CFStringCreateWithCString(0, cStr, 0x8000100u);
    }
    v17 = __error();
    v18 = strerror(*v17);
    locklog(0, "createIPString", CFSTR("Can't convert to ipv4 string: %s"), v19, v20, v21, v22, v23, v18);
  }
  else
  {
    locklog(0, "createIPString", CFSTR("Unknown socket family %d"), v3, v4, v5, v6, v7, v33.sa_family);
  }
  return 0;
}

uint64_t accept_with_timeout(int a1, int a2, const void *a3)
{
  timeval *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  CFStringRef v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFStringRef v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  fd_set v47;

  v45 = 0;
  v46 = 0;
  memset(&v47, 0, sizeof(v47));
  if (__darwin_check_fd_set_overflow(a1, &v47, 0))
    *(__int32_t *)((char *)v47.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  if (a2)
  {
    LODWORD(v46) = 0;
    v45 = a2;
    v6 = (timeval *)&v45;
  }
  else
  {
    v6 = 0;
  }
  v7 = select(a1 + 1, &v47, 0, 0, v6);
  if (!(_DWORD)v7)
  {
    locklog(v7, "accept_with_timeout", CFSTR("Timed out waiting for a connection"), v8, v9, v10, v11, v12, v43);
    return 0xFFFFFFFFLL;
  }
  if ((_DWORD)v7 == -1)
  {
    v13 = __error();
    v14 = strerror(*v13);
    locklog(0, "accept_with_timeout", CFSTR("select error: %s"), v15, v16, v17, v18, v19, v14);
    return 0xFFFFFFFFLL;
  }
  v22 = accept(a1, 0, 0);
  v20 = v22;
  if ((_DWORD)v22 == -1)
  {
    v36 = __error();
    v37 = strerror(*v36);
    locklog(0, "accept_with_timeout", CFSTR("Could not accept: %s"), v38, v39, v40, v41, v42, v37);
    return v20;
  }
  if (a3)
  {
    v23 = createIPString(v22, &v44);
    if (!v23)
    {
      locklog(0, "accept_with_timeout", CFSTR("createIPString failed"), v24, v25, v26, v27, v28, v43);
      close(v20);
      return 0xFFFFFFFFLL;
    }
    v29 = v23;
    v30 = CFEqual(v23, a3);
    if (!(_DWORD)v30)
    {
      locklog(v30, "accept_with_timeout", CFSTR("Denying unauthorized host from %@, was expecting %@."), v31, v32, v33, v34, v35, (char)v29);
      close(v20);
      v20 = 0xFFFFFFFFLL;
    }
    CFRelease(v29);
  }
  return v20;
}

CFTypeRef copy_array_from_xpc_data(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef v9;
  const __CFAllocator *v11;
  const UInt8 *bytes_ptr;
  size_t length;
  const __CFData *v14;
  const __CFData *v15;
  CFPropertyListRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  CFErrorRef error;

  error = 0;
  if (!a1 || MEMORY[0x20BCF7A70]() != MEMORY[0x24BDACF90])
  {
    locklog(0, "copy_array_from_xpc_data", CFSTR("Invalid input(s)."), a4, a5, a6, a7, a8, v29);
    return 0;
  }
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(a1);
  length = xpc_data_get_length(a1);
  v14 = CFDataCreateWithBytesNoCopy(v11, bytes_ptr, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = CFPropertyListCreateWithData(0, v14, 0, 0, &error);
  if (v16)
  {
    v22 = v16;
    v23 = CFGetTypeID(v16);
    if (v23 == CFArrayGetTypeID())
    {
      v9 = CFRetain(v22);
    }
    else
    {
      locklog(0, "copy_array_from_xpc_data", CFSTR("XPC data is not an array."), v24, v25, v26, v27, v28, v29);
      v9 = 0;
    }
    CFRelease(v22);
  }
  else
  {
    locklog(0, "copy_array_from_xpc_data", CFSTR("Failed to create data: %@"), v17, v18, v19, v20, v21, (char)error);
    v9 = 0;
  }
  CFRelease(v15);
  if (error)
    CFRelease(error);
  return v9;
}

CFTypeRef copy_dict_from_xpc_data(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef v9;
  const __CFAllocator *v11;
  const UInt8 *bytes_ptr;
  size_t length;
  const __CFData *v14;
  const __CFData *v15;
  CFPropertyListRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  CFErrorRef error;

  error = 0;
  if (!a1 || MEMORY[0x20BCF7A70]() != MEMORY[0x24BDACF90])
  {
    locklog(0, "copy_dict_from_xpc_data", CFSTR("Invalid input(s)."), a4, a5, a6, a7, a8, v29);
    return 0;
  }
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(a1);
  length = xpc_data_get_length(a1);
  v14 = CFDataCreateWithBytesNoCopy(v11, bytes_ptr, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = CFPropertyListCreateWithData(0, v14, 0, 0, &error);
  if (v16)
  {
    v22 = v16;
    v23 = CFGetTypeID(v16);
    if (v23 == CFDictionaryGetTypeID())
    {
      v9 = CFRetain(v22);
    }
    else
    {
      locklog(0, "copy_dict_from_xpc_data", CFSTR("XPC data is not a dictionary."), v24, v25, v26, v27, v28, v29);
      v9 = 0;
    }
    CFRelease(v22);
  }
  else
  {
    locklog(0, "copy_dict_from_xpc_data", CFSTR("Failed to create data: %@"), v17, v18, v19, v20, v21, (char)error);
    v9 = 0;
  }
  CFRelease(v15);
  if (error)
    CFRelease(error);
  return v9;
}

SSLContext *lockssl_handshake(int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, int a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *v14;
  const __CFAllocator **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SSLContext *v28;
  OSStatus v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFAllocator *v35;
  const CFArrayCallBacks *v36;
  OSStatus v37;
  const void *LockdownPairing;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFArray *v44;
  SSLContext *v45;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  CFErrorRef error;
  CFTypeRef certificates;
  CFTypeRef cf;
  SecTrustRef trust;
  SSLContextRef context;

  cf = 0;
  trust = 0;
  error = 0;
  certificates = 0;
  context = 0;
  v14 = lockcrypto_cert_from_pem_data(a2);
  v15 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  if (v14)
  {
    v16 = lockcrypto_private_key_from_pem_data(a3);
    if (v16)
    {
      v22 = (const void *)v16;
      _SSLNewContext();
      locklog(0, "lockssl_create_context", CFSTR("Could not create SSL context"), v48, v49, v50, v51, v52, v53);
      goto LABEL_5;
    }
  }
  else
  {
    locklog(0, "lockssl_create_context", CFSTR("Could not decode certificate"), v9, v10, v11, v12, v13, v53);
    v22 = (const void *)lockcrypto_private_key_from_pem_data(a3);
    if (v22)
    {
LABEL_5:
      CFRelease(v22);
      if (!v14)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  locklog(0, "lockssl_create_context", CFSTR("Could not decode private key"), v17, v18, v19, v20, v21, v53);
  if (v14)
LABEL_6:
    CFRelease(v14);
LABEL_7:
  v28 = context;
  if (context)
  {
    if (SSLSetProtocolVersionMin(context, kTLSProtocol1))
    {
      v47 = CFSTR("Could Not Set Minimum Protocol Version");
    }
    else
    {
      v29 = SSLSetConnection(v28, (SSLConnectionRef)a1);
      if (v29)
      {
        locklog(0, "lockssl_handshake", CFSTR("SSLSetConnection returned %ld"), v30, v31, v32, v33, v34, v29);
        goto LABEL_58;
      }
      SSLSetSessionOption(v28, (SSLSessionOption)(2 * (a5 == 0)), 1u);
      v35 = *v15;
      v36 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
      do
      {
        v37 = SSLHandshake(v28);
        if (v37 == -9841)
        {
          if (_SSLCopyPeerCertificates())
          {
            v47 = CFSTR("SSLCopyPeerCertificates failed");
            goto LABEL_57;
          }
          LockdownPairing = (const void *)SecPolicyCreateLockdownPairing();
          if (SecTrustCreateWithCertificates(certificates, LockdownPairing, &trust))
          {
            locklog(0, "lockssl_handshake", CFSTR("SecTrustCreateWithCertificates failed"), v39, v40, v41, v42, v43, v53);
LABEL_53:
            v45 = 0;
            goto LABEL_59;
          }
          cf = lockcrypto_cert_from_pem_data(a4);
          if (!cf)
            goto LABEL_53;
          v44 = CFArrayCreate(v35, &cf, 1, v36);
          if (SecTrustSetAnchorCertificates(trust, v44))
            goto LABEL_55;
          if (!SecTrustEvaluateWithError(trust, &error))
          {
            locklog(0, "lockssl_handshake", CFSTR("SecTrustEvalute failed"), v23, v24, v25, v26, v27, v53);
LABEL_55:
            v45 = 0;
            goto LABEL_31;
          }
          if (certificates)
            CFRelease(certificates);
          certificates = 0;
          if (v44)
            CFRelease(v44);
          if (cf)
            CFRelease(cf);
          cf = 0;
          if (LockdownPairing)
            CFRelease(LockdownPairing);
          if (trust)
            CFRelease(trust);
          trust = 0;
          v37 = -9803;
        }
      }
      while (v37 == -9803);
      if (!v37)
      {
        LockdownPairing = 0;
        v44 = 0;
        v45 = v28;
        v28 = 0;
        goto LABEL_31;
      }
      v53 = v37;
      v47 = CFSTR("SSLHandshake returned %ld");
    }
  }
  else
  {
    v47 = CFSTR("Could not create ssl context");
  }
LABEL_57:
  locklog(0, "lockssl_handshake", v47, v23, v24, v25, v26, v27, v53);
LABEL_58:
  v45 = 0;
  LockdownPairing = 0;
LABEL_59:
  v44 = 0;
LABEL_31:
  if (certificates)
    CFRelease(certificates);
  certificates = 0;
  if (v44)
    CFRelease(v44);
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (LockdownPairing)
    CFRelease(LockdownPairing);
  if (trust)
    CFRelease(trust);
  trust = 0;
  if (error)
    CFRelease(error);
  error = 0;
  if (v28)
  {
    SSLClose(v28);
    _SSLDisposeContext();
  }
  return v45;
}

uint64_t SocketRead(int a1, char *a2, size_t *a3)
{
  size_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ssize_t v13;
  uint64_t result;
  int v15;
  char v16;

  v6 = *a3;
  *a3 = 0;
  v7 = v6;
  while (1)
  {
    *__error() = -555;
    if (_select_socket())
    {
      locklog(0, "SocketRead", CFSTR("walk away"), v8, v9, v10, v11, v12, v16);
      goto LABEL_7;
    }
    v13 = recv(a1, a2, v7, 0);
    if (v13 <= 0)
      break;
    a2 += v13;
    v7 -= v13;
    if (!v7)
    {
      result = 0;
      goto LABEL_14;
    }
  }
  if (!v13)
  {
    result = 4294957491;
    goto LABEL_14;
  }
  v15 = *__error();
  result = 4294957493;
  if (v15 != 2 && v15 != 35)
  {
    if (v15 != 54)
    {
      result = 4294967260;
      goto LABEL_14;
    }
LABEL_7:
    result = 4294957490;
  }
LABEL_14:
  *a3 = v6 - v7;
  return result;
}

uint64_t SocketWrite(int __fd, uint64_t a2, unint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  ssize_t v8;
  uint64_t result;
  int v10;
  unsigned int v11;

  v6 = 0;
  v7 = *a3;
  *a3 = 0;
  while (1)
  {
    v8 = write(__fd, (const void *)(a2 + v6), v7 - v6);
    if (v8 < 1)
      break;
    v6 += v8;
    if (v6 >= v7)
    {
      result = 0;
      goto LABEL_11;
    }
  }
  v10 = *__error();
  if (v10 == 32)
    v11 = -9806;
  else
    v11 = -36;
  if (v10 == 35)
    result = 4294957493;
  else
    result = v11;
LABEL_11:
  *a3 = v6;
  return result;
}

void secure_lockdown_checkin_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2064E2000, MEMORY[0x24BDACB70], a3, "Timed out waiting for the service to checkin with lockdown.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void lockdown_copy_paired_host_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2064E2000, MEMORY[0x24BDACB70], a3, "Failed to create connection to lockdown.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void lockdown_copy_paired_host_info_cold_2(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to read paired host info: %@", (uint8_t *)&v2, 0xCu);
}

void lockdown_unpair_host_by_id_cold_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_2064E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to unpair host ID '%@': %@", (uint8_t *)&v3, 0x16u);
}

uint64_t CCDigest()
{
  return MEMORY[0x24BDAC1B8]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFBagRef CFBagCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFBagCallBacks *callBacks)
{
  return (CFBagRef)MEMORY[0x24BDBB950](allocator, values, numValues, callBacks);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x24BDBB968](theBag);
}

CFTypeID CFBagGetTypeID(void)
{
  return MEMORY[0x24BDBB978]();
}

void CFBagGetValues(CFBagRef theBag, const void **values)
{
  MEMORY[0x24BDBB980](theBag, values);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t MKBKeyBagCreateWithData()
{
  return MEMORY[0x24BE67188]();
}

uint64_t MKBKeyBagUnlock()
{
  return MEMORY[0x24BE671C0]();
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x24BDE8658](context);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufferSize)
{
  return MEMORY[0x24BDE8670](context, bufferSize);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x24BDE86A8](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x24BDE86E8](context, certRefs);
}

OSStatus SSLSetClientSideAuthenticate(SSLContextRef context, SSLAuthenticate auth)
{
  return MEMORY[0x24BDE86F0](context, *(_QWORD *)&auth);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x24BDE86F8](context, connection);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x24BDE8708](context, readFunc, writeFunc);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x24BDE8730](context, *(_QWORD *)&minVersion);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x24BDE8748](context, *(_QWORD *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x24BDE89F0](*(_QWORD *)&status, reserved);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

uint64_t SecKeyCreateRSAPrivateKey()
{
  return MEMORY[0x24BDE8B20]();
}

uint64_t SecPolicyCreateLockdownPairing()
{
  return MEMORY[0x24BDE8C48]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

char **_NSGetProgname(void)
{
  return (char **)MEMORY[0x24BDAC778]();
}

uint64_t _SSLCopyPeerCertificates()
{
  return MEMORY[0x24BDE8EC0]();
}

uint64_t _SSLDisposeContext()
{
  return MEMORY[0x24BDE8EC8]();
}

uint64_t _SSLNewContext()
{
  return MEMORY[0x24BDE8ED0]();
}

uint64_t _SSLSetEnableCertVerify()
{
  return MEMORY[0x24BDE8ED8]();
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x24BDADC20](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x24BDB07F8](connection);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB08E0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0920](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x24BDB09A0](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

