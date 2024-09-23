uint64_t start(int a1, char *const *a2)
{
  int v4;
  const char *v5;
  const char *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFString *Value;
  const __CFString *v10;
  CFTypeID v11;
  CFComparisonResult v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  char *v19;
  int *v20;
  int *v21;
  int *v23;
  NSObject *v24;
  NSObject *global_queue;
  stat v26;
  char *errorbuf;
  _BYTE v28[1024];

  bzero(v28, 0x400uLL);
  memset(&v26, 0, sizeof(v26));
  AFCPlatformInitialize();
  AFCLog(4, "afcd starting");
  signal(13, (void (__cdecl *)(int))1);
  while (1)
  {
    v4 = getopt_long(a1, a2, "r", (const option *)&off_100008000, 0);
    if (v4 != 114)
      break;
    qword_100008040 = (uint64_t)"com.apple.crashreportcopymobile";
  }
  if (v4 != -1)
  {
    fwrite("usage: afcd [-r]\n", 0x11uLL, 1uLL, __stderrp);
    fwrite("  -r | --crash-reporter      : run afcd for crash reporter\n", 0x3BuLL, 1uLL, __stderrp);
    goto LABEL_43;
  }
  v5 = (const char *)qword_100008040;
  if (!qword_100008040)
  {
    v5 = "com.apple.afcd";
    qword_100008040 = (uint64_t)"com.apple.afcd";
  }
  if (strcmp(v5, "com.apple.crashreportcopymobile"))
  {
    v6 = "/private/var/mobile/Media";
    goto LABEL_17;
  }
  v7 = (const __CFDictionary *)MKBUserTypeDeviceMode(0, 0);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  Value = (const __CFString *)CFDictionaryGetValue(v7, kMKBDeviceModeKey);
  if (!Value || (v10 = Value, v11 = CFGetTypeID(Value), v11 != CFStringGetTypeID()))
  {
    CFRelease(v8);
    goto LABEL_16;
  }
  v12 = CFStringCompare(v10, kMKBDeviceModeMultiUser, 0);
  CFRelease(v8);
  if (v12)
  {
LABEL_16:
    v6 = "/private/var/mobile/Library/Logs/CrashReporter";
    goto LABEL_17;
  }
  v13 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.osanalytics", 0);
  if (!v13)
  {
    AFCLog(1, "Failed to retrieve group container systemgroup.com.apple.osanalytics");
    goto LABEL_43;
  }
  v14 = (void *)v13;
  v6 = v28;
  __strcpy_chk(v28, v13, 1024);
  __strcat_chk(v28, "/Library/Logs/DiagnosticReports", 1024);
  free(v14);
LABEL_17:
  if (kqueue() == -1)
  {
    AFCLog(1, "kqueue(): %m");
    goto LABEL_43;
  }
  if (lstat(v6, &v26) < 0)
  {
    if (*__error() != 2)
    {
LABEL_34:
      __error();
      AFCLog(1, "could not stat directory %s: %d");
      return 1;
    }
  }
  else if ((v26.st_mode & 0xF000) == 0xA000)
  {
    AFCLog(1, "Path %s is a symlink.");
    return 1;
  }
  v15 = realpath_DARWIN_EXTSN(v6, 0);
  qword_100008048 = (uint64_t)v15;
  if (!v15)
  {
    if (*__error() == 2)
    {
      if (mkdir(v6, 0x1EDu) < 0)
      {
        __error();
        AFCLog(1, "could not create directory %s (%d)");
        return 1;
      }
      v15 = strdup(v6);
      qword_100008048 = (uint64_t)v15;
      goto LABEL_26;
    }
    v23 = __error();
    strerror(*v23);
    AFCLog(1, "realpath(%s) failure: %s");
LABEL_43:
    exit(1);
  }
LABEL_26:
  AFCLog(4, "Serving directory %s", v15);
  if (lstat((const char *)qword_100008048, &v26) < 0)
    goto LABEL_34;
  AFCLog(5, "directory %s mode is 0x%x", (const char *)qword_100008048, v26.st_mode);
  if ((v26.st_mode & 0xF000) == 0x4000)
  {
    errorbuf = 0;
    v16 = sandbox_extension_issue_file("com.apple.afc.root", qword_100008048, 0);
    if (v16)
    {
      v17 = (void *)v16;
      if (sandbox_init("afcd", 2uLL, &errorbuf) < 0)
      {
        AFCLog(1, "Could not load afcd sandbox profile: %s", errorbuf);
        sandbox_free_error(errorbuf);
      }
      else
      {
        if ((sandbox_extension_consume(v17) & 0x8000000000000000) == 0)
        {
          free(v17);
          qword_100008050 = (uint64_t)dispatch_group_create();
          v24 = dispatch_queue_create("afcd xpc listener", 0);
          qword_100008058 = (uint64_t)v24;
          global_queue = dispatch_get_global_queue(2, 0);
          dispatch_set_target_queue(v24, global_queue);
          AFCLog(4, "Ready to start");
          sub_100002B6C((const char *)qword_100008040, qword_100008058);
          dispatch_main();
        }
        v18 = *__error();
        v19 = errorbuf;
        if (!errorbuf)
        {
          v20 = __error();
          v19 = strerror(*v20);
        }
        AFCLog(1, "sandbox_extension_consume failed (%d): %s", v18, v19);
      }
      free(v17);
    }
    else
    {
      v21 = __error();
      AFCLog(1, "sandbox_extension_issue_file failed: %d", *v21);
    }
    AFCLog(1, "failed to load sandbox");
  }
  else
  {
    AFCLog(1, "path %s is not a directory");
  }
  return 1;
}

void sub_100002B6C(const char *a1, NSObject *a2)
{
  _xpc_connection_s *mach_service;
  _QWORD handler[4];
  char v6;

  if (!qword_100008060)
  {
    AFCLog(4, "Creating XPC service %s", a1);
    mach_service = xpc_connection_create_mach_service(a1, a2, 1uLL);
    qword_100008060 = (uint64_t)mach_service;
    if (!mach_service)
    {
      AFCLog(1, "Could not create XPC listener.");
      exit(1);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100002C2C;
    handler[3] = &unk_1000042C0;
    v6 = 0;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume((xpc_connection_t)qword_100008060);
  }
}

uint64_t sub_100002C2C(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  char v6;
  const char *string;
  _QWORD handler[5];
  char v9;

  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v6 = *(_BYTE *)(a1 + 32);
    AFCLog(4, "Handle XPC connection");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100002D78;
    handler[3] = &unk_1000042E0;
    v9 = v6;
    handler[4] = object;
    xpc_connection_set_event_handler((xpc_connection_t)object, handler);
    AFCLog(5, "Resuming connection");
    xpc_connection_resume((xpc_connection_t)object);
    return AFCLog(5, "handle connection done");
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (object == &_xpc_error_termination_imminent)
      {
        AFCLog(4, "XPC connection closing, time to go");
        exit(0);
      }
      string = xpc_dictionary_get_string(object, _xpc_error_key_description);
      AFCLog(1, "Got XPC error on listener connection: %s", string);
      xpc_connection_cancel((xpc_connection_t)qword_100008060);
      exit(1);
    }
    return AFCLog(2, "Unknown XPC event");
  }
}

void sub_100002D78(uint64_t a1, void *a2)
{
  xpc_type_t type;
  const char *v5;
  uint64_t v6;
  CFTypeRef v7;
  int v8;
  __CFDictionary *Mutable;
  int v10;
  CFTypeID v11;
  const __CFString *Value;
  int socket;
  uint64_t securecontext;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  CFStringRef v25;
  uint64_t v26;
  void *v27;
  NSObject *global_queue;
  const char *string;
  uint64_t v30;
  CFTypeRef v31;
  CFTypeRef cf;
  uint64_t v33;
  _QWORD block[4];
  char v35;
  int v36;
  char buffer[1024];

  AFCLog(4, "event handler");
  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v31 = 0;
    AFCLog(4, "Processing checkin");
    if (lockdown_copy_checkin_info(a2, &v31))
    {
      v5 = "Should not get XPC message after checkin.";
      goto LABEL_9;
    }
    v7 = v31;
    v8 = *(unsigned __int8 *)(a1 + 40);
    cf = 0;
    v33 = 0;
    bzero(buffer, 0x400uLL);
    AFCLog(5, "Handle lockdown message");
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, v7);
    v10 = secure_lockdown_checkin(&v33, Mutable, &cf);
    CFRelease(Mutable);
    if (cf)
    {
      v11 = CFGetTypeID(cf);
      if (v11 == CFDictionaryGetTypeID())
      {
        Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, kLockdownCheckinPath);
        if (Value)
          CFStringGetCString(Value, buffer, 1024, 0x8000100u);
      }
      CFRelease(cf);
    }
    if (v10)
    {
      AFCLog(1, "Could not check in with lockdown at '%s': %d");
    }
    else
    {
      socket = lockdown_get_socket(v33);
      securecontext = lockdown_get_securecontext(v33);
      v15 = (const char *)&unk_100003B82;
      if (!securecontext)
        v15 = "out";
      AFCLog(5, "Checked in with lockdown on path '%s' socket %d with%s SSL", buffer, socket, v15);
      v16 = v33;
      v17 = lockdown_get_socket(v33);
      v18 = lockdown_get_securecontext(v33);
      v19 = (const char *)qword_100008048;
      AFCLog(5, "run_connection for root %s", (const char *)qword_100008048);
      xpc_transaction_begin();
      v36 = 1;
      v20 = setsockopt(v17, 0xFFFF, 4130, &v36, 4u);
      if ((v20 & 0x80000000) != 0)
      {
        v21 = __error();
        v22 = strerror(*v21);
        v20 = AFCLog(5, "Could not set SO_NOSIGPIPE: %s", v22);
      }
      v23 = AFCCreateServerContext(v20);
      if (v23)
      {
        v24 = v23;
        v25 = CFStringCreateWithCString(kCFAllocatorDefault, v19, 0x8000100u);
        AFCServerContextSetRootPath(v24, v25);
        CFRelease(v25);
        AFCServerContextSetLockdownConnection(v24, v16);
        v26 = AFCConnectionCreate(0, v17, 0, 0, v24);
        if (v26)
        {
          v27 = (void *)v26;
          AFCConnectionSetSecureContext(v26, v18);
          AFCConnectionSetDisposeSecureContextOnInvalidate(v27, 0);
          AFCInitServerConnection(v27);
          if (v8)
            AFCServerConnectionSetFileCoordinationEnabled(v27, 1);
          AFCLog(5, "Using async dispatch queue");
          global_queue = dispatch_get_global_queue(21, 0);
          dispatch_group_async_f((dispatch_group_t)qword_100008050, global_queue, v27, (dispatch_function_t)sub_1000031CC);
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_100003274;
          block[3] = &unk_100004300;
          v35 = 1;
          dispatch_group_notify((dispatch_group_t)qword_100008050, (dispatch_queue_t)qword_100008058, block);
          AFCLog(5, "Lockdown message handled");
          CFRelease(v31);
          v5 = "Checkin handled";
          goto LABEL_27;
        }
        AFCLog(1, "could not open connection: %m", string, v30);
      }
      else
      {
        AFCLog(1, "no memory: %m", string, v30);
      }
    }
    exit(1);
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == &_xpc_error_termination_imminent)
    {
      v5 = "XPC connection should close now";
    }
    else
    {
      if (a2 != &_xpc_error_connection_invalid)
      {
        string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
        v5 = "Got XPC error on xpc connection: %s";
        goto LABEL_9;
      }
      v5 = "The connection is now invalid.";
    }
LABEL_27:
    v6 = 4;
    goto LABEL_28;
  }
  v5 = "Unexpected XPC event; this connection is toast.";
LABEL_9:
  v6 = 1;
LABEL_28:
  AFCLog(v6, v5, string);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

uint64_t sub_1000031CC(const void *a1)
{
  uint64_t Context;
  uint64_t RootPath;
  uint64_t LockdownConnection;

  AFCLog(4, "Running server thread");
  AFCConnectionSetIOTimeout(a1, 0);
  Context = AFCConnectionGetContext(a1);
  RootPath = AFCServerContextGetRootPath();
  AFCServeWithRoot(a1, RootPath);
  if (AFCServerContextGetLockdownConnection(Context))
  {
    LockdownConnection = AFCServerContextGetLockdownConnection(Context);
    lockdown_disconnect(LockdownConnection);
  }
  AFCFreeServerContext(Context);
  AFCConnectionSetContext(a1, 0);
  AFCConnectionInvalidate(a1);
  CFRelease(a1);
  AFCLog(4, "Server thread finished");
  xpc_transaction_end();
  return 0;
}

uint64_t sub_100003274(uint64_t a1)
{
  uint64_t result;

  result = AFCLog(5, "Dispatch group is now idle.");
  if (!*(_BYTE *)(a1 + 32))
  {
    AFCLog(4, "Exiting because server thread is done and we are not lingering.");
    exit(0);
  }
  return result;
}
