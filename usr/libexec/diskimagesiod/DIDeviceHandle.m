@implementation DIDeviceHandle

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4
{
  id v7;
  DIDeviceHandle *v8;
  DIDeviceHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DIDeviceHandle;
  v8 = -[DIDeviceHandle init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_regEntryID = a3;
    objc_storeStrong((id *)&v8->_xpcEndpoint, a4);
  }

  return v9;
}

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3
{
  return -[DIDeviceHandle initWithRegEntryID:xpcEndpoint:](self, "initWithRegEntryID:xpcEndpoint:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  objc_super v13;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));

  if (v3)
  {
    v4 = *__error();
    if (sub_1000BF0BC())
    {
      v14 = 0;
      v5 = sub_1000BF044();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        v7 = 3;
      else
        v7 = 2;
      *(_DWORD *)buf = 68157954;
      v16 = 25;
      v17 = 2080;
      v18 = "-[DIDeviceHandle dealloc]";
      LODWORD(v12) = 18;
      v8 = (char *)_os_log_send_and_compose_impl(v7, &v14, 0, 0, &_mh_execute_header, v6, 0, "%.*s: DIDeviceHandle object is deallocating, invalidating connection", (int)buf, v12);

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
        *(_DWORD *)buf = 68157954;
        v16 = 25;
        v17 = 2080;
        v18 = "-[DIDeviceHandle dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: DIDeviceHandle object is deallocating, invalidating connection", buf, 0x12u);
      }

    }
    *__error() = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
    objc_msgSend(v11, "closeConnection");

  }
  v13.receiver = self;
  v13.super_class = (Class)DIDeviceHandle;
  -[DIDeviceHandle dealloc](&v13, "dealloc");
}

- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;

  v6 = objc_msgSend(a3, "copyIOMediaWithError:", a4);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "BSDName"));
    -[DIDeviceHandle setBSDName:](self, "setBSDName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
    if (v9)
    {
      v10 = *__error();
      if (sub_1000BF0BC())
      {
        v21 = 0;
        v11 = sub_1000BF044();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          v13 = 3;
        else
          v13 = 2;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
        *(_DWORD *)buf = 68158210;
        v23 = 53;
        v24 = 2080;
        v25 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
        v26 = 2114;
        v27 = v14;
        v15 = (char *)_os_log_send_and_compose_impl(v13, &v21, 0, 0, &_mh_execute_header, v12, 0, "%.*s: BSD name: %{public}@", buf, 28);

        if (v15)
        {
          fprintf(__stderrp, "%s\n", v15);
          free(v15);
        }
      }
      else
      {
        v17 = sub_1000BF044();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
          *(_DWORD *)buf = 68158210;
          v23 = 53;
          v24 = 2080;
          v25 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
          v26 = 2114;
          v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: BSD name: %{public}@", buf, 0x1Cu);

        }
      }
      *__error() = v10;
      v16 = 1;
    }
    else
    {
      v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Cannot find BSD name in IO media service"), a4);
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  const char *v24;
  uint64_t v26;
  mach_timespec_t waitTime;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;

  waitTime = (mach_timespec_t)30;
  while (1)
  {
    v5 = IOServiceWaitQuiet(a3, &waitTime);
    if ((_DWORD)v5 != -536870186)
      break;
    v6 = *__error();
    if (sub_1000BF0BC())
    {
      v26 = 0;
      v7 = sub_1000BF044();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      if (v9)
        v10 = 3;
      else
        v10 = 2;
      v29 = 48;
      v30 = 2080;
      v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      LODWORD(v24) = 18;
      v11 = (char *)_os_log_send_and_compose_impl(v10, &v26, 0, 0, &_mh_execute_header, v8, 16, "%.*s: IOServiceWaitQuiet timeout occurred, retrying.", (int)buf, v24);

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      v12 = sub_1000BF044();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v29 = 48;
        v30 = 2080;
        v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%.*s: IOServiceWaitQuiet timeout occurred, retrying.", buf, 0x12u);
      }

    }
    *__error() = v6;
  }
  if ((_DWORD)v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOServiceWaitQuiet error 0x%x"), v5));
    v20 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v19, a4);

  }
  else
  {
    v14 = *__error();
    if (sub_1000BF0BC())
    {
      v26 = 0;
      v15 = sub_1000BF044();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        v17 = 3;
      else
        v17 = 2;
      *(_DWORD *)buf = 68157954;
      v29 = 48;
      v30 = 2080;
      v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      LODWORD(v24) = 18;
      v18 = (char *)_os_log_send_and_compose_impl(v17, &v26, 0, 0, &_mh_execute_header, v16, 0, "%.*s: IOServiceWaitQuiet done", (int)buf, v24);

      if (v18)
      {
        fprintf(__stderrp, "%s\n", v18);
        free(v18);
      }
    }
    else
    {
      v21 = sub_1000BF044();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v29 = 48;
        v30 = 2080;
        v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%.*s: IOServiceWaitQuiet done", buf, 0x12u);
      }

    }
    *__error() = v14;
    return 1;
  }
  return v20;
}

- (BOOL)waitForDeviceWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  __CFRunLoop *v8;
  IONotificationPort *v9;
  IONotificationPort *v10;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v12;
  const __CFString *v13;
  const __CFDictionary *v14;
  void *v15;
  BOOL v16;
  CFRunLoopMode v18;
  _QWORD refCon[2];
  io_iterator_t notification;
  BOOL v21;

  v21 = 0;
  notification = 0;
  v5 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:](DIBlockDevice, "copyUnmatchedDiskImageWithRegEntryID:error:", -[DIDeviceHandle regEntryID](self, "regEntryID"), a3);
  v6 = v5;
  if (v5)
  {
    refCon[0] = &v21;
    refCon[1] = objc_msgSend(v5, "ioObj");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v8 = (__CFRunLoop *)objc_msgSend(v7, "getCFRunLoop");
    if (!-[DIDeviceHandle waitForQuietWithService:error:](self, "waitForQuietWithService:error:", objc_msgSend(v6, "ioObj"), a3))goto LABEL_15;
    v9 = IONotificationPortCreate(kIOMainPortDefault);
    if (v9)
    {
      v10 = v9;
      RunLoopSource = IONotificationPortGetRunLoopSource(v9);
      if (RunLoopSource)
      {
        v12 = RunLoopSource;
        v13 = kCFRunLoopDefaultMode;
        CFRunLoopAddSource(v8, RunLoopSource, kCFRunLoopDefaultMode);
        v14 = IOServiceMatching("IOMedia");
        if (!IOServiceAddMatchingNotification(v10, "IOServiceMatched", v14, (IOServiceMatchingCallback)sub_100008FAC, refCon, &notification))
        {
          v18 = kCFRunLoopDefaultMode;
          sub_100008FAC((uint64_t)refCon, notification);
          while (!v21)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0, v18));
            objc_msgSend(v7, "runMode:beforeDate:", NSDefaultRunLoopMode, v15);

          }
          IOObjectRelease(notification);
          v13 = v18;
        }
        CFRunLoopRemoveSource(v8, v12, v13);
      }
      else
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed getting runloop source"), 0);
      }
      IONotificationPortDestroy(v10);
    }
    if (v21)
    {
      v16 = -[DIDeviceHandle updateBSDNameWithBlockDevice:error:](self, "updateBSDNameWithBlockDevice:error:", v6, a3);
      v21 = v16;
    }
    else
    {
LABEL_15:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  DIDeviceHandle *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSXPCListenerEndpoint *xpcEndpoint;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *BSDName;
  unsigned int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DIDeviceHandle;
  v5 = -[DIDeviceHandle init](&v16, "init");
  if (v5)
  {
    v5->_regEntryID = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("regEntryID"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSXPCListenerEndpoint, v6), CFSTR("xpcEndpoint"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("BSDname"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v12;

    v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("handleRefCount"));
    v5->_handleRefCount = v14;
    if (v14)
    {
      if (v5->_xpcEndpoint)
        -[DIDeviceHandle addToRefCountWithError:](v5, "addToRefCountWithError:", 0);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[DIDeviceHandle regEntryID](self, "regEntryID"), CFSTR("regEntryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("xpcEndpoint"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("BSDname"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIDeviceHandle handleRefCount](self, "handleRefCount"), CFSTR("handleRefCount"));
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  DIClient2IODaemonXPCHandler *v5;
  void *v6;
  DIClient2IODaemonXPCHandler *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  -[DIDeviceHandle setHandleRefCount:](self, "setHandleRefCount:", 1);
  v5 = [DIClient2IODaemonXPCHandler alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  v7 = -[DIClient2IODaemonXPCHandler initWithEndpoint:](v5, "initWithEndpoint:", v6);
  -[DIDeviceHandle setClient2IOhandler:](self, "setClient2IOhandler:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
  LODWORD(v6) = objc_msgSend(v8, "connectWithError:", a3);

  if (!(_DWORD)v6)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
  v10 = objc_msgSend(v9, "addToRefCountWithError:", a3);

  return v10;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  v8 = CFSTR("managed");
  if (!v7)
    v8 = CFSTR("unmanaged");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@, %@]"), v5, v6, v8));

  return v9;
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBSDName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (DIClient2IODaemonXPCHandler)client2IOhandler
{
  return self->_client2IOhandler;
}

- (void)setClient2IOhandler:(id)a3
{
  objc_storeStrong((id *)&self->_client2IOhandler, a3);
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_client2IOhandler, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end
