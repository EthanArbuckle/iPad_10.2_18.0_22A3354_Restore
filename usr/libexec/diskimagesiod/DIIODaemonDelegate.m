@implementation DIIODaemonDelegate

- (DIIODaemonDelegate)initWithIsRAM:(BOOL)a3
{
  DIIODaemonDelegate *v4;
  DIIODaemonDelegate *v5;
  NSMutableSet *v6;
  NSMutableSet *activeConnections;
  uint64_t v8;
  DIDiskArb *diskArbDisappear;
  DIIODaemonDelegate *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DIIODaemonDelegate;
  v4 = -[DIBaseServiceDelegate init](&v12, "init");
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  atomic_store(0, (unsigned __int8 *)&v4->_unmountStarted);
  v4->_isRAM = a3;
  v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  activeConnections = v5->_activeConnections;
  v5->_activeConnections = v6;

  -[DIIODaemonDelegate validateInstance](v5, "validateInstance");
  if (!-[DIIODaemonDelegate createNotificationPortWithError:](v5, "createNotificationPortWithError:", 0))
    goto LABEL_5;
  -[DIIODaemonDelegate setupSigtermHandler](v5, "setupSigtermHandler");
  v8 = objc_claimAutoreleasedReturnValue(+[DIDiskArb diskArbWithError:](DIDiskArb, "diskArbWithError:", 0));
  diskArbDisappear = v5->_diskArbDisappear;
  v5->_diskArbDisappear = (DIDiskArb *)v8;

  if (v5->_diskArbDisappear)
LABEL_4:
    v10 = v5;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (void)setupExitDaemonWatchdog
{
  dispatch_time_t v3;
  NSObject *v4;

  v3 = dispatch_time(0, 8000000000);
  v4 = objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  dispatch_after(v3, v4, &stru_10016D5F8);

}

- (void)setupSigtermHandler
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigtermHandler;
  NSObject *v5;
  _QWORD handler[5];

  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  v5 = self->_sigtermHandler;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000A41C;
  handler[3] = &unk_10016D620;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (void)destroyNotificationPort
{
  __CFRunLoop *Current;
  io_object_t notificationIterator;

  if (-[DIIODaemonDelegate runLoopSource](self, "runLoopSource"))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, -[DIIODaemonDelegate runLoopSource](self, "runLoopSource"), kCFRunLoopDefaultMode);
    -[DIIODaemonDelegate setRunLoopSource:](self, "setRunLoopSource:", 0);
  }
  if (-[DIIODaemonDelegate notificationPort](self, "notificationPort"))
  {
    IONotificationPortDestroy(-[DIIODaemonDelegate notificationPort](self, "notificationPort"));
    -[DIIODaemonDelegate setNotificationPort:](self, "setNotificationPort:", 0);
  }
  notificationIterator = self->_notificationIterator;
  if (notificationIterator)
  {
    IOObjectRelease(notificationIterator);
    self->_notificationIterator = 0;
  }
}

- (BOOL)createNotificationPortWithError:(id *)a3
{
  __CFRunLoop *Current;
  const __CFString *v7;

  -[DIIODaemonDelegate setNotificationPort:](self, "setNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
  if (-[DIIODaemonDelegate notificationPort](self, "notificationPort"))
  {
    -[DIIODaemonDelegate setRunLoopSource:](self, "setRunLoopSource:", IONotificationPortGetRunLoopSource(self->_notificationPort));
    if (-[DIIODaemonDelegate runLoopSource](self, "runLoopSource"))
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, -[DIIODaemonDelegate runLoopSource](self, "runLoopSource"), kCFRunLoopDefaultMode);
      return 1;
    }
    -[DIIODaemonDelegate destroyNotificationPort](self, "destroyNotificationPort");
    v7 = CFSTR("Failed getting runloop source");
  }
  else
  {
    v7 = CFSTR("Failed creating notification port");
  }
  return +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, v7, a3);
}

- (BOOL)setupTerminationNotificationWithError:(id *)a3
{
  const __CFDictionary *v5;

  v5 = IOServiceMatching("AppleDiskImageDevice");
  if (IOServiceAddMatchingNotification(self->_notificationPort, "IOServiceTerminate", v5, (IOServiceMatchingCallback)sub_10000A7CC, self, &self->_notificationIterator))
  {
    return +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed adding matching notification"), a3);
  }
  sub_10000A7CC(self, self->_notificationIterator);
  return 1;
}

- (void)exitDaemon
{
  void *v2;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  DIIODaemonDelegate *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  BOOL v34;
  uint64_t ioManager;
  int v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  char *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  __CFString *v52;

  v4 = *__error();
  if (sub_1000BF0BC())
  {
    v46 = 0;
    v5 = sub_1000BF044();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v7 = 3;
    else
      v7 = 2;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
    if (v8)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "BSDName"));
    }
    else
    {
      v9 = CFSTR("an unprepared device");
    }
    *(_DWORD *)buf = 68158210;
    v48 = 32;
    v49 = 2080;
    v50 = "-[DIIODaemonDelegate exitDaemon]";
    v51 = 2114;
    v52 = v9;
    v10 = (char *)_os_log_send_and_compose_impl(v7, &v46, 0, 0, &_mh_execute_header, v6, 0, "%.*s: IO daemon of %{public}@ is shutting down, stopping IO channels", buf, 28);
    if (v8)
    {

    }
    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
      if (v13)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "BSDName"));
      }
      else
      {
        v14 = CFSTR("an unprepared device");
      }
      *(_DWORD *)buf = 68158210;
      v48 = 32;
      v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      v51 = 2114;
      v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: IO daemon of %{public}@ is shutting down, stopping IO channels", buf, 0x1Cu);
      if (v13)
      {

      }
    }

  }
  *__error() = v4;
  -[DIIODaemonDelegate setupExitDaemonWatchdog](self, "setupExitDaemonWatchdog");
  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](v15, "listener"));
  objc_msgSend(v16, "invalidate");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](v15, "clientDelegate"));
  v18 = v17 == 0;

  if (!v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](v15, "clientDelegate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "listener"));
    objc_msgSend(v27, "invalidate");

  }
  v19 = *__error();
  if (sub_1000BF0BC())
  {
    v46 = 0;
    v20 = sub_1000BF044();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v22 = 3;
    else
      v22 = 2;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v15, "activeConnections"));
    v24 = (__CFString *)objc_msgSend(v23, "count");
    *(_DWORD *)buf = 68158210;
    v48 = 32;
    v49 = 2080;
    v50 = "-[DIIODaemonDelegate exitDaemon]";
    v51 = 2048;
    v52 = v24;
    LODWORD(v44) = 28;
    v25 = (char *)_os_log_send_and_compose_impl(v22, &v46, 0, 0, &_mh_execute_header, v21, 0, "%.*s: # client connections at time of daemon termination: %lu", (int)buf, v44, v45);

    if (v25)
    {
      fprintf(__stderrp, "%s\n", v25);
      free(v25);
    }
  }
  else
  {
    v28 = sub_1000BF044();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v15, "activeConnections"));
      v31 = (__CFString *)objc_msgSend(v30, "count");
      *(_DWORD *)buf = 68158210;
      v48 = 32;
      v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      v51 = 2048;
      v52 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%.*s: # client connections at time of daemon termination: %lu", buf, 0x1Cu);

    }
  }
  *__error() = v19;
  -[DIIODaemonDelegate destroyNotificationPort](v15, "destroyNotificationPort");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate diskArbDisappear](v15, "diskArbDisappear"));
  objc_msgSend(v32, "stop");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate sigtermHandler](v15, "sigtermHandler"));
  v34 = v33 == 0;

  if (!v34)
  {
    v41 = objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate sigtermHandler](v15, "sigtermHandler"));
    dispatch_source_cancel(v41);

    -[DIIODaemonDelegate setSigtermHandler:](v15, "setSigtermHandler:", 0);
  }
  ioManager = (uint64_t)v15->_ioManager;
  if (!ioManager)
  {
    v36 = *__error();
    if (sub_1000BF0BC())
    {
      v46 = 0;
      v37 = sub_1000BF044();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        v39 = 3;
      else
        v39 = 2;
      *(_DWORD *)buf = 68157954;
      v48 = 32;
      v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      LODWORD(v44) = 18;
      v40 = (char *)_os_log_send_and_compose_impl(v39, &v46, 0, 0, &_mh_execute_header, v38, 0, "%.*s: _ioManager was not initialized yet, quitting immediately", (int)buf, v44);

      if (v40)
      {
        fprintf(__stderrp, "%s\n", v40);
        free(v40);
      }
    }
    else
    {
      v42 = sub_1000BF044();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v48 = 32;
        v49 = 2080;
        v50 = "-[DIIODaemonDelegate exitDaemon]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%.*s: _ioManager was not initialized yet, quitting immediately", buf, 0x12u);
      }

    }
    *__error() = v36;
    exit(0);
  }
  sub_100011B4C(ioManager);
  while (1)
    sleep(0xAu);
}

- (void)validateInstance
{
  char *v2;
  char *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  char *v18;

  v2 = getenv("LaunchInstanceID");
  if (v2)
  {
    v3 = v2;
    v4 = *__error();
    if (sub_1000BF0BC())
    {
      v12 = 0;
      v5 = sub_1000BF044();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        v7 = 3;
      else
        v7 = 2;
      *(_DWORD *)buf = 68158210;
      v14 = 38;
      v15 = 2080;
      v16 = "-[DIIODaemonDelegate validateInstance]";
      v17 = 2082;
      v18 = v3;
      v11 = 28;
      v8 = (char *)_os_log_send_and_compose_impl(v7, &v12, 0, 0, &_mh_execute_header, v6, 0, "%.*s: Instance ID: %{public}s", buf, v11);

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v14 = 38;
        v15 = 2080;
        v16 = "-[DIIODaemonDelegate validateInstance]";
        v17 = 2082;
        v18 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Instance ID: %{public}s", buf, 0x1Cu);
      }

    }
    *__error() = v4;
  }
}

- (id)serviceName
{
  unsigned int v3;
  __CFString *v4;

  if (!getuid())
    return CFSTR("com.apple.diskimagesiod.spb");
  v3 = -[DIIODaemonDelegate isRAM](self, "isRAM");
  v4 = CFSTR("com.apple.diskimagesiod");
  if (v3)
    v4 = CFSTR("com.apple.diskimagesiod.ram");
  return v4;
}

- (id)sandboxProfile
{
  return CFSTR("com.apple.diskimagesiod");
}

- (void)unmountAll
{
  DIIODaemonDelegate *v2;
  DIIODaemonDelegate *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *ioManager;
  DIAttachedDeviceInfo *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  char *v41;
  int v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  DIIODaemonDelegate *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v2, "deviceHandle"));
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v2, "deviceHandle")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "BSDName")),
        v6,
        v5,
        v4,
        !v6))
  {
LABEL_50:
    objc_sync_exit(v3);
    goto LABEL_51;
  }
  ioManager = v3->_ioManager;
  if (!ioManager || (ioManager[112] & 1) != 0)
  {
    v42 = *__error();
    if (sub_1000BF0BC())
    {
      v58 = 0;
      v43 = sub_1000BF044();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        v45 = 3;
      else
        v45 = 2;
      *(_DWORD *)buf = 68157954;
      v60 = 32;
      v61 = 2080;
      v62 = "-[DIIODaemonDelegate unmountAll]";
      LODWORD(v51) = 18;
      v46 = (char *)_os_log_send_and_compose_impl(v45, &v58, 0, 0, &_mh_execute_header, v44, 0, "%.*s: Device is already ejected, skipping unmount", (int)buf, v51);

      if (v46)
      {
        fprintf(__stderrp, "%s\n", v46);
        free(v46);
      }
    }
    else
    {
      v47 = sub_1000BF044();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v60 = 32;
        v61 = 2080;
        v62 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%.*s: Device is already ejected, skipping unmount", buf, 0x12u);
      }

    }
    *__error() = v42;
    goto LABEL_50;
  }
  objc_sync_exit(v3);

  v8 = [DIAttachedDeviceInfo alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v3, "deviceHandle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "BSDName"));
  v3 = -[DIAttachedDeviceInfo initWithBSDName:error:](v8, "initWithBSDName:error:", v10, 0);

  if (v3)
  {
    v52 = v3;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = -[DIIODaemonDelegate copyEntitiesList](v3, "copyEntitiesList");
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Mount Point")));
          if (v15)
          {
            v16 = *__error();
            if (sub_1000BF0BC())
            {
              v58 = 0;
              v17 = sub_1000BF044();
              v18 = objc_claimAutoreleasedReturnValue(v17);
              v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BSD Name")));
              *(_DWORD *)buf = 68158467;
              if (v19)
                v21 = 3;
              else
                v21 = 2;
              v60 = 32;
              v61 = 2080;
              v62 = "-[DIIODaemonDelegate unmountAll]";
              v63 = 2113;
              v64 = v15;
              v65 = 2114;
              v66 = v20;
              LODWORD(v51) = 38;
              v22 = (char *)_os_log_send_and_compose_impl(v21, &v58, 0, 0, &_mh_execute_header, v18, 0, "%.*s: Forcing unmount of %{private}@ (%{public}@)", buf, v51);

              if (v22)
              {
                fprintf(__stderrp, "%s\n", v22);
                free(v22);
              }
            }
            else
            {
              v23 = sub_1000BF044();
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BSD Name")));
                *(_DWORD *)buf = 68158467;
                v60 = 32;
                v61 = 2080;
                v62 = "-[DIIODaemonDelegate unmountAll]";
                v63 = 2113;
                v64 = v15;
                v65 = 2114;
                v66 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: Forcing unmount of %{private}@ (%{public}@)", buf, 0x26u);

              }
            }
            *__error() = v16;
            v26 = objc_retainAutorelease(v15);
            if (unmount((const char *)objc_msgSend(v26, "fileSystemRepresentation"), 0x80000))
            {
              v27 = *__error();
              if (sub_1000BF0BC())
              {
                v58 = 0;
                v28 = sub_1000BF044();
                v29 = objc_claimAutoreleasedReturnValue(v28);
                v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
                v31 = *__error();
                if (v30)
                  v32 = 3;
                else
                  v32 = 2;
                *(_DWORD *)buf = 68158467;
                v60 = 32;
                v61 = 2080;
                v62 = "-[DIIODaemonDelegate unmountAll]";
                v63 = 2113;
                v64 = v26;
                v65 = 1024;
                LODWORD(v66) = v31;
                LODWORD(v51) = 34;
                v33 = (char *)_os_log_send_and_compose_impl(v32, &v58, 0, 0, &_mh_execute_header, v29, 16, "%.*s: Force unmount of %{private}@ failed with errno %d", buf, v51);

                if (v33)
                {
                  fprintf(__stderrp, "%s\n", v33);
                  free(v33);
                }
              }
              else
              {
                v34 = sub_1000BF044();
                v35 = objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  v36 = *__error();
                  *(_DWORD *)buf = 68158467;
                  v60 = 32;
                  v61 = 2080;
                  v62 = "-[DIIODaemonDelegate unmountAll]";
                  v63 = 2113;
                  v64 = v26;
                  v65 = 1024;
                  LODWORD(v66) = v36;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%.*s: Force unmount of %{private}@ failed with errno %d", buf, 0x22u);
                }

              }
              *__error() = v27;
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v11);
    }

    v37 = *__error();
    if (sub_1000BF0BC())
    {
      v58 = 0;
      v38 = sub_1000BF044();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        v40 = 3;
      else
        v40 = 2;
      *(_DWORD *)buf = 68157954;
      v60 = 32;
      v61 = 2080;
      v62 = "-[DIIODaemonDelegate unmountAll]";
      LODWORD(v51) = 18;
      v41 = (char *)_os_log_send_and_compose_impl(v40, &v58, 0, 0, &_mh_execute_header, v39, 0, "%.*s: Unmount done", (int)buf, v51);

      if (v41)
      {
        fprintf(__stderrp, "%s\n", v41);
        free(v41);
      }
    }
    else
    {
      v49 = sub_1000BF044();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v60 = 32;
        v61 = 2080;
        v62 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%.*s: Unmount done", buf, 0x12u);
      }

    }
    *__error() = v37;

    v3 = v52;
  }
LABEL_51:

}

- (void)exitWithUnmount
{
  atomic<BOOL> *p_unmountStarted;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  _QWORD block[5];
  NSObject *v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;

  p_unmountStarted = &self->_unmountStarted;
  while (!__ldaxr((unsigned __int8 *)p_unmountStarted))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_unmountStarted))
    {
      v5 = dispatch_semaphore_create(0);
      if (!v5)
      {
        v23 = *__error();
        if (sub_1000BF0BC())
        {
          v33 = 0;
          v24 = sub_1000BF044();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            v26 = 3;
          else
            v26 = 2;
          *(_DWORD *)buf = 68157954;
          v35 = 37;
          v36 = 2080;
          v37 = "-[DIIODaemonDelegate exitWithUnmount]";
          LODWORD(v30) = 18;
          v27 = (char *)_os_log_send_and_compose_impl(v26, &v33, 0, 0, &_mh_execute_header, v25, 16, "%.*s: Failed creating unmount done semaphore", (int)buf, v30);

          if (v27)
          {
            fprintf(__stderrp, "%s\n", v27);
            free(v27);
          }
        }
        else
        {
          v28 = sub_1000BF044();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            v35 = 37;
            v36 = 2080;
            v37 = "-[DIIODaemonDelegate exitWithUnmount]";
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%.*s: Failed creating unmount done semaphore", buf, 0x12u);
          }

        }
        *__error() = v23;
        exit(0);
      }
      v6 = objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C0F4;
      block[3] = &unk_10016D648;
      block[4] = self;
      v7 = v5;
      v32 = v7;
      dispatch_async(v6, block);

      v8 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v7, v8))
      {
        v9 = *__error();
        if (sub_1000BF0BC())
        {
          v33 = 0;
          v10 = sub_1000BF044();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            v12 = 3;
          else
            v12 = 2;
          *(_DWORD *)buf = 68157954;
          v35 = 37;
          v36 = 2080;
          v37 = "-[DIIODaemonDelegate exitWithUnmount]";
          LODWORD(v30) = 18;
          v13 = (char *)_os_log_send_and_compose_impl(v12, &v33, 0, 0, &_mh_execute_header, v11, 16, "%.*s: Unmount timeout occurred", (int)buf, v30);

          if (v13)
          {
            fprintf(__stderrp, "%s\n", v13);
            free(v13);
          }
        }
        else
        {
          v21 = sub_1000BF044();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            v35 = 37;
            v36 = 2080;
            v37 = "-[DIIODaemonDelegate exitWithUnmount]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%.*s: Unmount timeout occurred", buf, 0x12u);
          }

        }
        *__error() = v9;
      }
      -[DIIODaemonDelegate exitDaemon](self, "exitDaemon");

      return;
    }
  }
  __clrex();
  v14 = *__error();
  if (sub_1000BF0BC())
  {
    v33 = 0;
    v15 = sub_1000BF044();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v17 = 3;
    else
      v17 = 2;
    *(_DWORD *)buf = 68157954;
    v35 = 37;
    v36 = 2080;
    v37 = "-[DIIODaemonDelegate exitWithUnmount]";
    LODWORD(v30) = 18;
    v18 = (char *)_os_log_send_and_compose_impl(v17, &v33, 0, 0, &_mh_execute_header, v16, 0, "%.*s: Exit already in progress", (int)buf, v30);

    if (v18)
    {
      fprintf(__stderrp, "%s\n", v18);
      free(v18);
    }
  }
  else
  {
    v19 = sub_1000BF044();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v35 = 37;
      v36 = 2080;
      v37 = "-[DIIODaemonDelegate exitWithUnmount]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Exit already in progress", buf, 0x12u);
    }

  }
  *__error() = v14;
}

- (void)onClientInvalidateWithConnection:(id)a3
{
  id v4;
  DIIODaemonDelegate *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
  objc_msgSend(v6, "removeObject:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v5, "deviceHandle"));
  if (!v7)
  {
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v39 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = 3;
      else
        v11 = 2;
      *(_DWORD *)buf = 68157954;
      v41 = 55;
      v42 = 2080;
      v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
      LODWORD(v37) = 18;
      v12 = (char *)_os_log_send_and_compose_impl(v11, &v39, 0, 0, &_mh_execute_header, v10, 0, "%.*s: Reached XPC invalidation/interruption before device initialization, quitting.", (int)buf, v37);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v41 = 55;
        v42 = 2080;
        v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Reached XPC invalidation/interruption before device initialization, quitting.", buf, 0x12u);
      }

    }
    *__error() = v8;
    -[DIIODaemonDelegate exitDaemon](v5, "exitDaemon");
  }
  if (!-[DIIODaemonDelegate handleRefCount](v5, "handleRefCount"))
  {
    v17 = *__error();
    if (!sub_1000BF0BC())
    {
      v29 = sub_1000BF044();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
        v32 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 68158210;
        v41 = 55;
        v42 = 2080;
        v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        v44 = 2048;
        v45 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%.*s: Unmanaged attach, ignoring XPC disconnection (# open connections left: %lu)", buf, 0x1Cu);

      }
      goto LABEL_34;
    }
    v39 = 0;
    v24 = sub_1000BF044();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      v26 = 3;
    else
      v26 = 2;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
    v28 = objc_msgSend(v27, "count");
    *(_DWORD *)buf = 68158210;
    v41 = 55;
    v42 = 2080;
    v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
    v44 = 2048;
    v45 = v28;
    LODWORD(v37) = 28;
    v23 = (char *)_os_log_send_and_compose_impl(v26, &v39, 0, 0, &_mh_execute_header, v25, 0, "%.*s: Unmanaged attach, ignoring XPC disconnection (# open connections left: %lu)", (int)buf, v37, v38);

    if (v23)
    {
LABEL_19:
      fprintf(__stderrp, "%s\n", v23);
      free(v23);
    }
LABEL_34:
    *__error() = v17;
    objc_sync_exit(v5);

    goto LABEL_35;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
  v16 = objc_msgSend(v15, "count") == 0;

  if (!v16)
  {
    v17 = *__error();
    if (!sub_1000BF0BC())
    {
      v33 = sub_1000BF044();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
        v36 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 68158210;
        v41 = 55;
        v42 = 2080;
        v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        v44 = 2048;
        v45 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%.*s: XPC connection closed for a managed attach, # open connections left: %lu", buf, 0x1Cu);

      }
      goto LABEL_34;
    }
    v39 = 0;
    v18 = sub_1000BF044();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v20 = 3;
    else
      v20 = 2;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
    v22 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 68158210;
    v41 = 55;
    v42 = 2080;
    v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
    v44 = 2048;
    v45 = v22;
    LODWORD(v37) = 28;
    v23 = (char *)_os_log_send_and_compose_impl(v20, &v39, 0, 0, &_mh_execute_header, v19, 0, "%.*s: XPC connection closed for a managed attach, # open connections left: %lu", (int)buf, v37, v38);

    if (v23)
      goto LABEL_19;
    goto LABEL_34;
  }
  objc_sync_exit(v5);

  -[DIIODaemonDelegate exitWithUnmount](v5, "exitWithUnmount");
LABEL_35:

}

- (void)runIOmanager
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;

  sub_100011B1C((uint64_t *)self->_ioManager);
  if (self->_ioManager)
  {
    sub_100011B18();
    operator delete();
  }
  v3 = *__error();
  if (sub_1000BF0BC())
  {
    v11 = 0;
    v4 = sub_1000BF044();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v6 = 3;
    else
      v6 = 2;
    *(_DWORD *)buf = 68157954;
    v13 = 34;
    v14 = 2080;
    v15 = "-[DIIODaemonDelegate runIOmanager]";
    LODWORD(v10) = 18;
    v7 = (char *)_os_log_send_and_compose_impl(v6, &v11, 0, 0, &_mh_execute_header, v5, 0, "%.*s: Shutdown is complete", (int)buf, v10);

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v13 = 34;
      v14 = 2080;
      v15 = "-[DIIODaemonDelegate runIOmanager]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Shutdown is complete", buf, 0x12u);
    }

  }
  *__error() = v3;
  -[DIIODaemonDelegate setAttachedTransaction:](self, "setAttachedTransaction:", 0);
  exit(0);
}

- (BOOL)tryAttachWithParams:(id)a3 error:(id *)a4
{
  void *v4;
  id v6;
  DIIOClientDelegate *v7;
  void *v8;
  DIDeviceHandle *v9;
  id v10;
  DIDeviceHandle *v11;
  void *v12;
  DIDeviceHandle *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v28;
  id v29;
  uint64_t v31;
  id location;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;

  v6 = a3;
  objc_initWeak(&location, self);
  -[DIIODaemonDelegate setHandleRefCount:](self, "setHandleRefCount:", objc_msgSend(v6, "handleRefCount"));
  if (-[DIIODaemonDelegate handleRefCount](self, "handleRefCount"))
  {
    v7 = -[DIIOClientDelegate initWithIODaemon:]([DIIOClientDelegate alloc], "initWithIODaemon:", self);
    -[DIIODaemonDelegate setClientDelegate:](self, "setClientDelegate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](self, "clientDelegate"));
    objc_msgSend(v8, "startXPClistener");

    v9 = [DIDeviceHandle alloc];
    v10 = objc_msgSend(v6, "regEntryID");
    v11 = (DIDeviceHandle *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](self, "clientDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](v11, "xpcEndpoint"));
    v13 = -[DIDeviceHandle initWithRegEntryID:xpcEndpoint:](v9, "initWithRegEntryID:xpcEndpoint:", v10, v12);
    -[DIIODaemonDelegate setDeviceHandle:](self, "setDeviceHandle:", v13);

  }
  else
  {
    v11 = -[DIDeviceHandle initWithRegEntryID:]([DIDeviceHandle alloc], "initWithRegEntryID:", objc_msgSend(v6, "regEntryID"));
    -[DIIODaemonDelegate setDeviceHandle:](self, "setDeviceHandle:", v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
  v29 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:](DIBlockDevice, "copyUnmatchedDiskImageWithRegEntryID:error:", objc_msgSend(v14, "regEntryID"), a4);

  if (v29)
  {
    IOObjectRetain((io_object_t)objc_msgSend(v29, "ioObj"));
    if (-[DIIODaemonDelegate setupTerminationNotificationWithError:](self, "setupTerminationNotificationWithError:", a4))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate diskArbDisappear](self, "diskArbDisappear"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputStatFS"));
      if (v16)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputStatFS"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mountedOnURL"));
      }
      else
      {
        v17 = 0;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shadowChain"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mountPoints"));
      objc_msgSend(v15, "addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:", v17, v19, self);

      if (v16)
      {

      }
      v20 = *__error();
      if (sub_1000BF0BC())
      {
        v31 = 0;
        v21 = sub_1000BF044();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          v23 = 3;
        else
          v23 = 2;
        *(_DWORD *)buf = 68157954;
        v34 = 48;
        v35 = 2080;
        v36 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
        LODWORD(v28) = 18;
        v24 = (char *)_os_log_send_and_compose_impl(v23, &v31, 0, 0, &_mh_execute_header, v22, 0, "%.*s: Dispatching DIIOManager", (int)buf, v28);

        if (v24)
        {
          fprintf(__stderrp, "%s\n", v24);
          free(v24);
        }
      }
      else
      {
        v25 = sub_1000BF044();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v34 = 48;
          v35 = 2080;
          v36 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: Dispatching DIIOManager", buf, 0x12u);
        }

      }
      *__error() = v20;
      operator new();
    }
  }

  objc_destroyWeak(&location);
  return 0;
}

- (BOOL)validateDeserializationWithParams:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, id);
  unsigned __int8 v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  v10 = 0;
  v7 = objc_msgSend(v5, "validateDeserializationWithError:", &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
    v6[2](v6, 0, v8);

  return v7;
}

- (void)attachToNewDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  int v21;
  _QWORD block[4];
  id v23;
  void (**v24)(id, _QWORD, void *);
  id v25;
  uint64_t v26;
  id location;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_initWeak(&location, self);
  if (-[DIIODaemonDelegate validateDeserializationWithParams:reply:](self, "validateDeserializationWithParams:reply:", v6, v7))
  {
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v26 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = 3;
      else
        v11 = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
      v13 = objc_msgSend(v6, "regEntryID");
      *(_DWORD *)buf = 68158466;
      v29 = 56;
      v30 = 2080;
      v31 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
      v32 = 2114;
      v33 = v12;
      v34 = 2048;
      v35 = v13;
      v21 = 38;
      v14 = (char *)_os_log_send_and_compose_impl(v11, &v26, 0, 0, &_mh_execute_header, v10, 0, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, v21);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      v15 = sub_1000BF044();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
        v18 = objc_msgSend(v6, "regEntryID");
        *(_DWORD *)buf = 68158466;
        v29 = 56;
        v30 = 2080;
        v31 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
        v32 = 2114;
        v33 = v17;
        v34 = 2048;
        v35 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, 0x26u);

      }
    }
    *__error() = v8;
    if (!getuid() && (objc_msgSend(v6, "requiresRootDaemon") & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DIError errorWithPOSIXCode:verboseInfo:](DIError, "errorWithPOSIXCode:verboseInfo:", 1, CFSTR("Root daemon connection denied")));
      v7[2](v7, 0, v19);
      -[DIIODaemonDelegate exitDaemon](self, "exitDaemon");

    }
    v20 = objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7CC;
    block[3] = &unk_10016D698;
    objc_copyWeak(&v25, &location);
    v24 = v7;
    v23 = v6;
    dispatch_async(v20, block);

    objc_destroyWeak(&v25);
  }
  objc_destroyWeak(&location);

}

- (void)attachToExistingDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  DIIODaemonDelegate *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[DIIODaemonDelegate validateDeserializationWithParams:reply:](self, "validateDeserializationWithParams:reply:", v6, v7))
  {
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v48 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = 3;
      else
        v11 = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
      *(_DWORD *)buf = 68158466;
      v50 = 61;
      v51 = 2080;
      v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
      v53 = 2114;
      v54 = v12;
      v55 = 2048;
      v56 = objc_msgSend(v6, "regEntryID");
      v13 = (char *)_os_log_send_and_compose_impl(v11, &v48, 0, 0, &_mh_execute_header, v10, 0, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, 38);

      if (v13)
      {
        fprintf(__stderrp, "%s\n", v13);
        free(v13);
      }
    }
    else
    {
      v14 = sub_1000BF044();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
        *(_DWORD *)buf = 68158466;
        v50 = 61;
        v51 = 2080;
        v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
        v53 = 2114;
        v54 = v16;
        v55 = 2048;
        v56 = objc_msgSend(v6, "regEntryID");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, 0x26u);

      }
    }
    *__error() = v8;
    v17 = self;
    objc_sync_enter(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
    v19 = v18 == 0;

    if (v19)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[DIError errorWithEnumValue:verboseInfo:](DIError, "errorWithEnumValue:verboseInfo:", 155, CFSTR("A controller XPC service attempted to connect to an existing device, but this daemon instance has no such device yet")));
      v7[2](v7, 0, v28);
    }
    else
    {
      v20 = objc_msgSend(v6, "regEntryID");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
      LOBYTE(v20) = v20 == objc_msgSend(v21, "regEntryID");

      if ((v20 & 1) != 0)
      {
        v22 = atomic_load((unsigned __int8 *)&v17->_unmountStarted);
        if ((v22 & 1) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[DIError errorWithEnumValue:verboseInfo:](DIError, "errorWithEnumValue:verboseInfo:", 168, CFSTR("Unmount already started, notifying controller to retry later")));
          v7[2](v7, 0, v28);
        }
        else
        {
          if (objc_msgSend(v6, "handleRefCount")
            && !-[DIIODaemonDelegate handleRefCount](v17, "handleRefCount"))
          {
            v29 = *__error();
            if (sub_1000BF0BC())
            {
              v48 = 0;
              v30 = sub_1000BF044();
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                v32 = 3;
              else
                v32 = 2;
              *(_DWORD *)buf = 68157954;
              v50 = 61;
              v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              LODWORD(v47) = 18;
              v33 = (char *)_os_log_send_and_compose_impl(v32, &v48, 0, 0, &_mh_execute_header, v31, 0, "%.*s: Ignoring client reference counting request as a previous attach was performed without reference counting", (int)buf, v47);

              if (v33)
              {
                fprintf(__stderrp, "%s\n", v33);
                free(v33);
              }
            }
            else
            {
              v34 = sub_1000BF044();
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                v50 = 61;
                v51 = 2080;
                v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Ignoring client reference counting request as a previous attach was performed without reference counting", buf, 0x12u);
              }

            }
            *__error() = v29;
          }
          else if ((objc_msgSend(v6, "handleRefCount") & 1) == 0
                 && -[DIIODaemonDelegate handleRefCount](v17, "handleRefCount"))
          {
            v23 = *__error();
            if (sub_1000BF0BC())
            {
              v48 = 0;
              v24 = sub_1000BF044();
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                v26 = 3;
              else
                v26 = 2;
              *(_DWORD *)buf = 68157954;
              v50 = 61;
              v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              LODWORD(v47) = 18;
              v27 = (char *)_os_log_send_and_compose_impl(v26, &v48, 0, 0, &_mh_execute_header, v25, 0, "%.*s: Disabling reference counting", (int)buf, v47);

              if (v27)
              {
                fprintf(__stderrp, "%s\n", v27);
                free(v27);
              }
            }
            else
            {
              v36 = sub_1000BF044();
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                v50 = 61;
                v51 = 2080;
                v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%.*s: Disabling reference counting", buf, 0x12u);
              }

            }
            *__error() = v23;
            -[DIIODaemonDelegate setHandleRefCount:](v17, "setHandleRefCount:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
            objc_msgSend(v38, "setXpcEndpoint:", 0);

          }
          v39 = *__error();
          if (sub_1000BF0BC())
          {
            v48 = 0;
            v40 = sub_1000BF044();
            v41 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              v42 = 3;
            else
              v42 = 2;
            *(_DWORD *)buf = 68157954;
            v50 = 61;
            v51 = 2080;
            v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
            LODWORD(v47) = 18;
            v43 = (char *)_os_log_send_and_compose_impl(v42, &v48, 0, 0, &_mh_execute_header, v41, 0, "%.*s: Got connection to an existing disk image, returning its handle", (int)buf, v47);

            if (v43)
            {
              fprintf(__stderrp, "%s\n", v43);
              free(v43);
            }
          }
          else
          {
            v44 = sub_1000BF044();
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68157954;
              v50 = 61;
              v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Got connection to an existing disk image, returning its handle", buf, 0x12u);
            }

          }
          *__error() = v39;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
          ((void (**)(id, void *, void *))v7)[2](v7, v46, 0);

          v28 = 0;
        }
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[DIError errorWithEnumValue:verboseInfo:](DIError, "errorWithEnumValue:verboseInfo:", 150, CFSTR("Registry entry ID mismatch between controller and daemon")));
        v7[2](v7, 0, v28);
      }
    }
    objc_sync_exit(v17);

  }
}

- (void)validateConnection
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;

  if (!getenv("LaunchInstanceID"))
  {
    v2 = *__error();
    if (sub_1000BF0BC())
    {
      v10 = 0;
      v3 = sub_1000BF044();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        v5 = 3;
      else
        v5 = 2;
      *(_DWORD *)buf = 68157954;
      v12 = 40;
      v13 = 2080;
      v14 = "-[DIIODaemonDelegate validateConnection]";
      LODWORD(v9) = 18;
      v6 = (char *)_os_log_send_and_compose_impl(v5, &v10, 0, 0, &_mh_execute_header, v4, 0, "%.*s: As we were launched without instance ID, rejecting the connection and killing the daemon.", (int)buf, v9);

      if (v6)
      {
        fprintf(__stderrp, "%s\n", v6);
        free(v6);
      }
    }
    else
    {
      v7 = sub_1000BF044();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v12 = 40;
        v13 = 2080;
        v14 = "-[DIIODaemonDelegate validateConnection]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: As we were launched without instance ID, rejecting the connection and killing the daemon.", buf, 0x12u);
      }

    }
    *__error() = v2;
    exit(1);
  }
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  DIIODaemonDelegate *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  BOOL v23;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  DIIODaemonDelegate *v28;
  unsigned __int8 v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id location;
  id buf;
  __int16 v47;
  const char *v48;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.diskimages.creator-uc")));
  v6 = (void *)v5;
  if (v5
    && (objc_opt_respondsToSelector(v5, "BOOLValue") & 1) != 0
    && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = *__error();
    if (sub_1000BF0BC())
    {
      location = 0;
      v8 = sub_1000BF044();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        v10 = 3;
      else
        v10 = 2;
      buf = (id)0x2904100202;
      v47 = 2080;
      v48 = "-[DIIODaemonDelegate setupNewConnection:]";
      LODWORD(v38) = 18;
      v11 = (char *)_os_log_send_and_compose_impl(v10, &location, 0, 0, &_mh_execute_header, v9, 0, "%.*s: Connected client is entitled to attach a disk image", (int)&buf, v38);

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      v25 = sub_1000BF044();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        buf = (id)0x2904100202;
        v47 = 2080;
        v48 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: Connected client is entitled to attach a disk image", (uint8_t *)&buf, 0x12u);
      }

    }
    *__error() = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DIIODaemonProtocol));
    objc_msgSend(v4, "setExportedInterface:", v27);

    objc_msgSend(v4, "setExportedObject:", self);
    objc_initWeak(&buf, self);
    objc_initWeak(&location, v4);
    v28 = self;
    objc_sync_enter(v28);
    v29 = atomic_load((unsigned __int8 *)&v28->_unmountStarted);
    if ((v29 & 1) == 0)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000EB2C;
      v42[3] = &unk_10016D6C0;
      objc_copyWeak(&v43, &buf);
      objc_copyWeak(&v44, &location);
      objc_msgSend(v4, "setInterruptionHandler:", v42);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000ED08;
      v39[3] = &unk_10016D6C0;
      objc_copyWeak(&v40, &buf);
      objc_copyWeak(&v41, &location);
      objc_msgSend(v4, "setInvalidationHandler:", v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v28, "activeConnections"));
      objc_msgSend(v30, "addObject:", v4);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&v43);
    }
    objc_sync_exit(v28);

    objc_destroyWeak(&location);
    objc_destroyWeak(&buf);
    v23 = 1;
  }
  else
  {
    v12 = *__error();
    if (sub_1000BF0BC())
    {
      location = 0;
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      buf = (id)0x2904100202;
      v47 = 2080;
      v48 = "-[DIIODaemonDelegate setupNewConnection:]";
      LODWORD(v38) = 18;
      v16 = (char *)_os_log_send_and_compose_impl(v15, &location, 0, 0, &_mh_execute_header, v14, 16, "%.*s: The connected client is not entitled to attach a disk image, rejecting", (int)&buf, v38);

      if (v16)
      {
        fprintf(__stderrp, "%s\n", v16);
        free(v16);
      }
    }
    else
    {
      v17 = sub_1000BF044();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        buf = (id)0x2904100202;
        v47 = 2080;
        v48 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%.*s: The connected client is not entitled to attach a disk image, rejecting", (uint8_t *)&buf, 0x12u);
      }

    }
    *__error() = v12;
    v19 = self;
    objc_sync_enter(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v19, "deviceHandle"));
    if (v20)
    {

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v19, "activeConnections"));
      v22 = objc_msgSend(v21, "count") == 0;

      if (v22)
      {
        v31 = *__error();
        if (sub_1000BF0BC())
        {
          location = 0;
          v32 = sub_1000BF044();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            v34 = 3;
          else
            v34 = 2;
          buf = (id)0x2904100202;
          v47 = 2080;
          v48 = "-[DIIODaemonDelegate setupNewConnection:]";
          LODWORD(v38) = 18;
          v35 = (char *)_os_log_send_and_compose_impl(v34, &location, 0, 0, &_mh_execute_header, v33, 16, "%.*s: The rejected connection caused a daemon instance to wake up. Killing it", (int)&buf, v38);

          if (v35)
          {
            fprintf(__stderrp, "%s\n", v35);
            free(v35);
          }
        }
        else
        {
          v36 = sub_1000BF044();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            buf = (id)0x2904100202;
            v47 = 2080;
            v48 = "-[DIIODaemonDelegate setupNewConnection:]";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%.*s: The rejected connection caused a daemon instance to wake up. Killing it", (uint8_t *)&buf, 0x12u);
          }

        }
        *__error() = v31;
        exit(0);
      }
    }
    objc_sync_exit(v19);

    v23 = 0;
  }

  return v23;
}

- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _BYTE outputStruct[1924];
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v8 = objc_msgSend(v6, "validateDeserializationWithError:", &v16);
  v9 = v16;
  if (v8)
  {
    if (sub_100011D24((uint64_t)self->_ioManager, &v19, &v18) && sub_100011EFC((uint64_t)self->_ioManager, outputStruct))
    {
      v10 = objc_alloc((Class)NSNumber);
      v11 = objc_msgSend(v10, "initWithUnsignedLongLong:", v19);
      v12 = objc_alloc((Class)NSNumber);
      v13 = objc_msgSend(v12, "initWithUnsignedLongLong:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[DIIODaemonDelegate requestsStatsToNSArrayWithArray:](DIIODaemonDelegate, "requestsStatsToNSArrayWithArray:", outputStruct));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, CFSTR("hit"), v13, CFSTR("miss"), v14, CFSTR("pending_requests"), 0));

    }
    else
    {
      v15 = 0;
      v11 = v9;
      v9 = (id)objc_claimAutoreleasedReturnValue(+[DIError errorWithEnumValue:verboseInfo:](DIError, "errorWithEnumValue:verboseInfo:", 150, CFSTR("Failed to fetch stats from driver")));
    }

  }
  else
  {
    v15 = 0;
  }
  v7[2](v7, v15, v9);

}

+ (id)requestsStatsToNSArrayWithArray:(DIRequestsStatsArray *)a3
{
  unint64_t v4;
  unint64_t *p_var3;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  DIRequestsStatsArray *v14;
  id v15;

  v15 = objc_alloc_init((Class)NSMutableArray);
  v14 = a3;
  if (a3->var1)
  {
    v4 = 0;
    p_var3 = &a3->var0[0].var3;
    do
    {
      v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", *((unsigned int *)p_var3 - 4));
      v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", *(p_var3 - 1));
      v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", *p_var3);
      v9 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", p_var3[1]);
      v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", p_var3[2]);
      v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", *((unsigned __int16 *)p_var3 - 6));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("index"), v7, CFSTR("offset"), v8, CFSTR("absolute_offset"), v9, CFSTR("size"), v10, CFSTR("total_size"), v11, CFSTR("cmd"), 0));

      objc_msgSend(v15, "addObject:", v12);
      ++v4;
      p_var3 += 5;
    }
    while (v4 < v14->var1);
  }
  return v15;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (unsigned)notificationIterator
{
  return self->_notificationIterator;
}

- (DIDeviceHandle)deviceHandle
{
  return (DIDeviceHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_os_transaction)attachedTransaction
{
  return self->_attachedTransaction;
}

- (void)setAttachedTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_attachedTransaction, a3);
}

- (BOOL)isRAM
{
  return self->_isRAM;
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnections, a3);
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
  objc_storeStrong((id *)&self->_sigtermHandler, a3);
}

- (DIDiskArb)diskArbDisappear
{
  return self->_diskArbDisappear;
}

- (void)setDiskArbDisappear:(id)a3
{
  objc_storeStrong((id *)&self->_diskArbDisappear, a3);
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIIOClientDelegate)clientDelegate
{
  return self->_clientDelegate;
}

- (void)setClientDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_clientDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDelegate, 0);
  objc_storeStrong((id *)&self->_diskArbDisappear, 0);
  objc_storeStrong((id *)&self->_sigtermHandler, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_attachedTransaction, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end
