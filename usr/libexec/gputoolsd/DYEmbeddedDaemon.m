@implementation DYEmbeddedDaemon

- (DYEmbeddedDaemon)initWithTransport:(id)a3 terminationHandler:(id)a4
{
  id v6;
  id v7;
  DYEmbeddedDaemon *v8;
  DYEmbeddedDaemon *v9;
  id v10;
  id terminationHandler;
  void *v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *symbolicatorQueue;
  DYEmbeddedDaemon *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DYEmbeddedDaemon;
  v8 = -[DYEmbeddedDaemon init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    -[DYEmbeddedDaemon setTransport:](v8, "setTransport:", v6);
    v10 = objc_retainBlock(v7);
    terminationHandler = v9->_terminationHandler;
    v9->_terminationHandler = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](v9, "transport"));
    if (!v12)
      __assert_rtn("-[DYEmbeddedDaemon initWithTransport:terminationHandler:]", ", 0, "self.transport");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](v9, "transport"));
    objc_msgSend(v13, "setPrioritizeOutgoingMessages:", 1);

    global_queue = dispatch_get_global_queue(-2, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    v16 = dispatch_queue_create_with_target_V2("symbolicator", 0, v15);
    symbolicatorQueue = v9->_symbolicatorQueue;
    v9->_symbolicatorQueue = (OS_dispatch_queue *)v16;

    v18 = v9;
  }

  return v9;
}

- (id)captureAPISupportForAPI:(unsigned int)a3
{
  __objc2_class **v3;
  id v4;

  if (a3)
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = &off_10000C1B8;
  }
  else
  {
    v3 = &off_10000C198;
  }
  v4 = objc_msgSend(objc_alloc(*v3), "initWithAPI:", *(_QWORD *)&a3);
  return v4;
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("METAL_LOAD_INTERPOSER")));
  if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("METAL_DIAGNOSTICS_ENABLED")));
    v11 = (uint64_t)objc_msgSend(v12, "BOOLValue");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon captureAPISupportForAPI:](self, "captureAPISupportForAPI:", 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interposeDylibPath"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("DYMTL_TOOLS_DYLIB_PATH"));

  v15 = -[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:withAPI:uniqueIdentifier:error:](self, "createInferiorTransportAndSetEnvironment:withAPI:uniqueIdentifier:error:", v8, v11, v9, a5);
  return v15;
}

- (void)cacheInferiorAppIdentifier
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *guestAppIdentifier;
  unsigned int v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid")));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v3, 0));

  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    guestAppIdentifier = self->_guestAppIdentifier;
    self->_guestAppIdentifier = v5;

  }
  else
  {
    v7 = -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid");
    DYLog(kDYLoggingLevelError, "failed to get display identifier for process %d", v7);
  }

}

- (BOOL)bringAppToForeground:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (sub_100002E00((uint64_t)v3) == -1)
  {
    v7 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](DYFuture, "future"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002E98;
    v9[3] = &unk_10000C670;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "openApplication:withOptions:completion:", v3, 0, v9);
    v7 = objc_msgSend(v6, "BOOLResult");

  }
  return v7;
}

- (int)launchInferiorWithPath:(id)a3 arguments:(id)a4 environment:(id)a5 workingDirectory:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  DYTransport *v21;
  DYTransport *helperTransport;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  DYTransport *v27;
  dispatch_queue_global_t global_queue;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  const char *v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[5];
  char v48;
  NSErrorUserInfoKey v49;
  void *v50;
  NSErrorUserInfoKey v51;
  void *v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((-[DYEmbeddedDaemon isAppleInternal](self, "isAppleInternal") & 1) == 0)
  {
    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
    v32 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v15, "length"))
  {
    v48 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v15, &v48);

    v18 = v48 ? v17 : 0;
    if ((v18 & 1) == 0)
    {
      v51 = NSLocalizedDescriptionKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Working directory doesn't exist. %@"), v15));
      v52 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", DYErrorDomain, 1, v36));

      goto LABEL_18;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = objc_msgSend(v19, "fileExistsAtPath:", v12);

  if ((v20 & 1) == 0)
  {
    v49 = NSLocalizedDescriptionKey;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Binary Launch Path doesn't exist. %@"), v12));
    v50 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", DYErrorDomain, 1, v34));

LABEL_18:
    v32 = -1;
    goto LABEL_27;
  }
  v21 = (DYTransport *)objc_msgSend(objc_alloc((Class)DYUNIXDomainSocketTransport), "initWithMode:", 1);
  helperTransport = self->_helperTransport;
  self->_helperTransport = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/run/gputoolsdhelper.sock"), 0));
  -[DYTransport setUrl:](self->_helperTransport, "setUrl:", v23);

  v24 = -[DYTransport newSourceWithQueue:](self->_helperTransport, "newSourceWithQueue:", &_dispatch_main_q);
  v25 = v24;
  if (v24)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10000365C;
    v47[3] = &unk_10000C698;
    v47[4] = self;
    objc_msgSend(v24, "setCancellationHandler:", v47);
    objc_msgSend(v25, "resume");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport connect](self->_helperTransport, "connect"));
    objc_msgSend(v44, "timeoutAfter:label:", 0, 500.0);
    if ((objc_msgSend(v44, "BOOLResult") & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, kDYGuestAppLaunchPathKey, v14, kDYGuestAppLaunchEnvironmentKey, v13, kDYGuestAppLaunchArgumentsKey, v15, kDYGuestAppLaunchCurrentDirectoryKey, 0));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", 1291));
      if (v43)
      {
        v26 = objc_claimAutoreleasedReturnValue(+[DYFuture future](DYFuture, "future"));
        v27 = self->_helperTransport;
        global_queue = dispatch_get_global_queue(0, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10000372C;
        v45[3] = &unk_10000C6C0;
        v41 = (id)v26;
        v46 = v41;
        LOBYTE(v26) = -[DYTransport send:error:replyQueue:timeout:handler:](v27, "send:error:replyQueue:timeout:handler:", v43, a7, v29, 0, v45);

        v30 = v44;
        if ((v26 & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "result"));
          if (a7)
            *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "error"));
          v32 = objc_msgSend(v31, "intValue");

        }
        else
        {
          DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to send posix_spawn message");
          -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
          v32 = 0;
        }

      }
      else
      {
        DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to serialize launch parameters");
        -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
        v32 = 0;
        v30 = v44;
      }

    }
    else
    {
      DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to connect to helper");
      -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
      v32 = 0;
      v30 = v44;
    }

  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport error](self->_helperTransport, "error"));
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description")));
    v39 = (const char *)objc_msgSend(v38, "UTF8String");
    DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to create transport source: %s", v39);

    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
    v32 = 0;
  }

LABEL_27:
  return v32;
}

- (int)launchInferiorWithIdentifer:(id)a3 environment:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  pid_t v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  mach_error_t v20;
  int v21;
  char *v22;
  void *v23;
  int v24;
  id v25;
  const char *v26;
  void *v27;
  mach_port_name_t v30;
  _QWORD v31[4];
  NSObject *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  int v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[2];
  _QWORD v41[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Agent-LaunchInferior", (const char *)&unk_10000BB1E, buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x2020000000;
  v37 = 0;
  while (1)
  {
    v12 = sub_100002E00((uint64_t)v8);
    *((_DWORD *)v35 + 6) = v12;
    if (v12 == -1)
      break;
    kill(v12, 9);
    usleep(0x7A120u);
  }
  v38[0] = FBSDebugOptionKeyWaitForDebugger;
  v38[1] = FBSDebugOptionKeyEnvironment;
  v39[0] = &__kCFBooleanTrue;
  v39[1] = v9;
  v38[2] = FBSDebugOptionKeyArguments;
  v39[2] = v10;
  v40[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));
  v40[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v41[0] = v13;
  v41[1] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

  v15 = dispatch_semaphore_create(0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v14));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100003CA8;
  v31[3] = &unk_10000C6E8;
  v33 = buf;
  v18 = v15;
  v32 = v18;
  objc_msgSend(v16, "openApplication:withOptions:completion:", v8, v17, v31);

  v19 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v18, v19);
  if (*((_DWORD *)v35 + 6) == -1)
  {
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    DYLog(kDYLoggingLevelError, "failed to get pid for '%s'", v26);

    if (a6)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("Timed-out waiting for the application to launch."), NSLocalizedDescriptionKey));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", DYErrorDomain, 5, v27));

    }
    goto LABEL_14;
  }
  if ((sub_100003D7C(v8) & 1) == 0)
  {
    v30 = 0;
    v20 = task_for_pid(mach_task_self_, *((_DWORD *)v35 + 6), &v30);
    if (v20)
    {
      v21 = *((_DWORD *)v35 + 6);
      v22 = mach_error_string(v20);
      DYLog(kDYLoggingLevelError, "failed to get task port for process %d: %s", v21, v22);
      kill(*((_DWORD *)v35 + 6), 9);
      if (a6)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("Failed to get the application's task port."), NSLocalizedDescriptionKey));
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", DYErrorDomain, 29, v23));

      }
LABEL_14:
      v24 = 0;
      goto LABEL_15;
    }
  }
  v24 = *((_DWORD *)v35 + 6);
LABEL_15:

  _Block_object_dispose(buf, 8);
  sub_100003DE0();

  return v24;
}

- (BOOL)launchUIServer:(id)a3 error:(id *)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  DYTransport *v14;
  DYTransport *helperTransport;
  void *v16;
  id v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  DYEmbeddedDaemon *v26;
  id v27;
  id v28;
  _QWORD v29[5];

  v7 = a3;
  if ((-[DYEmbeddedDaemon isAppleInternal](self, "isAppleInternal") & 1) == 0)
    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kDYGuestAppLaunchEnvironmentKey));
  if (v9)
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kDYGuestAppLaunchReplayer));
  if (v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kDYGuestAppLaunchCapture));
    v11 = (uint64_t)objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v11 = 1;
  }
  -[DYEmbeddedDaemon setShouldLoadCapture:](self, "setShouldLoadCapture:", v11);
  if (v10)

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kDYGuestAppLaunchDiagnostics));
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", objc_msgSend(v12, "BOOLValue"));

  v13 = -[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:](self, "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:", v8, 0, a4);
  if (v13)
  {
    v14 = (DYTransport *)objc_msgSend(objc_alloc((Class)DYUNIXDomainSocketTransport), "initWithMode:", 1);
    helperTransport = self->_helperTransport;
    self->_helperTransport = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/run/gputoolsdhelper.sock"), 0));
    -[DYTransport setUrl:](self->_helperTransport, "setUrl:", v16);

    v17 = -[DYTransport newSourceWithQueue:](self->_helperTransport, "newSourceWithQueue:", &_dispatch_main_q);
    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport error](self->_helperTransport, "error"));
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description")));
      v20 = (const char *)objc_msgSend(v19, "UTF8String");
      DYLog(kDYLoggingLevelError, "failed to create helper transport source: %s", v20);

      -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000421C;
    v29[3] = &unk_10000C698;
    v29[4] = self;
    objc_msgSend(v17, "setCancellationHandler:", v29);
    objc_msgSend(v17, "resume");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport connect](self->_helperTransport, "connect"));
    objc_msgSend(v21, "timeoutAfter:label:", 0, 500.0);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000043A4;
    v24[3] = &unk_10000C710;
    v22 = v21;
    v25 = v22;
    v26 = self;
    v27 = v8;
    v28 = v7;
    objc_msgSend(v22, "notifyOnQueue:handler:", &_dispatch_main_q, v24);

  }
  return v13;
}

- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  int v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  BOOL result;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;

  v8 = a3;
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchBundleIdentifierKey));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchPathKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchEnvironmentKey));
  v11 = objc_msgSend(v10, "mutableCopy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchArgumentsKey));
  v42 = objc_msgSend(v12, "mutableCopy");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchCurrentDirectoryKey));
  v41 = objc_msgSend(v13, "mutableCopy");

  v14 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.gputools.ui-server"));
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.gputools.BinaryLaunch")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("BINARY_LAUNCH_PATH")));

    v9 = 0;
    v44 = v13;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kDYGuestAppLaunchReplayer));
  if (v43)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kDYGuestAppLaunchCapture));
    v15 = (uint64_t)objc_msgSend(v13, "BOOLValue");
  }
  else
  {
    v15 = 1;
  }
  -[DYEmbeddedDaemon setShouldLoadCapture:](self, "setShouldLoadCapture:", v15);
  if (v43)

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kDYGuestAppLaunchDiagnostics));
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", objc_msgSend(v16, "BOOLValue"));

  if (v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("GT_HOST_URL_MTL")));
    if (v17)
    {
      v38 = v11;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("GT_HOST_URL_MTL_DIAGNOSTICS")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v40));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
      v21 = v18;
      v22 = v19;
      v23 = -[DYEmbeddedDaemon shouldLoadCapture](self, "shouldLoadCapture");
      v24 = -[DYEmbeddedDaemon shouldLoadDiagnostics](self, "shouldLoadDiagnostics");
      if (v20)
      {
        self = (DYEmbeddedDaemon *)objc_msgSend(v20, "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:", v21, v22, 0, v23, v24);
      }
      else
      {

      }
      v34 = 1;
      v11 = v38;
      goto LABEL_45;
    }
LABEL_29:

    v34 = 0;
LABEL_45:

    return v34;
  }
  if ((sub_100003D7C(v9) & 1) != 0)
    v26 = 0;
  else
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("GPUTOOLS_LOAD_GTMTLCAPTURE")));
  DYSetGTMTLCaptureMode(objc_msgSend(v26, "intValue"));
  if (!-[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:](self, "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:", v11, 0, a5))
  {

    goto LABEL_29;
  }
  DYModifyEnvironmentForDualCaptureSupport(v11);

  if (v9)
  {
    if (sub_100003D7C(v9))
    {
      v39 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GPUTOOLS_LOAD_GTMTLREPLAYER2")));
      v28 = v27;
      if (!v27 || objc_msgSend(v27, "BOOLValue"))
      {
        v45 = 0;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
        v30 = objc_msgSend(v29, "canOpenApplication:reason:", CFSTR("com.apple.MTLReplayer"), &v45);
        if (v45 == 4)
          v31 = v30;
        else
          v31 = 1;

        if (v31 == 1)
        {

          v9 = CFSTR("com.apple.MTLReplayer");
          v11 = v39;
          objc_msgSend(v39, "removeObjectForKey:", CFSTR("METAL_LOAD_INTERPOSER"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("METAL_DEBUG_ERROR_MODE")));
          v33 = v32;
          if (v32 && objc_msgSend(v32, "intValue") == 4)
            objc_msgSend(v39, "removeObjectForKey:", CFSTR("METAL_DEVICE_WRAPPER_TYPE"));

        }
        else
        {
          v11 = v39;
        }
      }
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("DYLD_INSERT_LIBRARIES"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dictionaryForKey:", CFSTR("GPUDebugger.ReplayerEnvironment")));

      v11 = v39;
      if (v36)
        objc_msgSend(v39, "addEntriesFromDictionary:", v36);

    }
    -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", -[DYEmbeddedDaemon launchInferiorWithIdentifer:environment:arguments:error:](self, "launchInferiorWithIdentifer:environment:arguments:error:", v9, v11, v42, a5));
    if ((int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") >= 1)
      objc_storeStrong((id *)&self->_guestAppIdentifier, v9);
    goto LABEL_40;
  }
  if (v44)
  {
    v9 = 0;
    -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", -[DYEmbeddedDaemon launchInferiorWithPath:arguments:environment:workingDirectory:error:](self, "launchInferiorWithPath:arguments:environment:workingDirectory:error:", v44, v42, v11, v41, a5));
LABEL_40:
    if ((int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") >= 1)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      -[DYEmbeddedDaemon setOwnsInferior:](self, "setOwnsInferior:", 1);
      -[DYEmbeddedDaemon observeInferior](self, "observeInferior");
      kill((pid_t)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"), 19);
    }
    v34 = (int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") > 0;

    goto LABEL_45;
  }
  result = dy_abort("launch plist does not contain a bundle identifier or path");
  __break(1u);
  return result;
}

- (id)processApplication:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  size_t v9;
  const __CFURL *v10;
  const __CFURL *v11;
  CFDictionaryRef v12;
  CFMutableDictionaryRef Mutable;
  _QWORD *v14;
  CFDataRef Data;
  const __CFURL *PathComponent;
  const __CFURL *v17;
  __CFReadStream *v18;
  CFPropertyListRef v19;
  _QWORD v21[6];
  stat v22;
  char buffer[1024];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleURL"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("bundleIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("fullpath"));
  if (!CFStringGetFileSystemRepresentation(v6, buffer, 1024) || stat(buffer, &v22) == -1)
  {
    v11 = 0;
  }
  else
  {
    v9 = strlen(buffer);
    v10 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)buffer, v9, (v22.st_mode & 0xF000) == 0x4000);
    v11 = v10;
    if (v10)
    {
      v12 = CFBundleCopyInfoDictionaryForURL(v10);
      if (v12)
      {
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10000519C;
        v21[3] = &unk_10000C730;
        v21[4] = v12;
        v21[5] = Mutable;
        v14 = objc_retainBlock(v21);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleInfoDictionaryVersionKey);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleExecutableKey);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleIdentifierKey);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleVersionKey);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleDevelopmentRegionKey);
        ((void (*)(_QWORD *, const CFStringRef))v14[2])(v14, kCFBundleNameKey);
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("CFBundleDisplayName"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("CFBundleSupportedPlatforms"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTCompiler"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTPlatformBuild"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTPlatformName"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTPlatformVersion"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTSDKName"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTXcode"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("DTXcodeBuild"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("LSRequiresIPhoneOS"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("MinimumOSVersion"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("UIDeviceFamily"));
        ((void (*)(_QWORD *, const __CFString *))v14[2])(v14, CFSTR("UIRequiredDeviceCapabilities"));
        Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", Mutable, CFSTR("info plist"));
          CFRelease(Data);
        }
        CFRelease(v12);
        CFRelease(Mutable);

      }
      PathComponent = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v11);
      v17 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, PathComponent, CFSTR("iTunesMetadata.plist"), 0);
      CFRelease(PathComponent);
      v18 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v17);
      CFRelease(v17);
      if (v18)
      {
        if (CFReadStreamOpen(v18))
        {
          v19 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v18, 0, 0, 0, 0);
          CFReadStreamClose(v18);
          if (v19)
          {
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, CFSTR("itunes metadata"));
            CFRelease(v19);
          }
        }
        CFRelease(v18);
      }
      CFRelease(v11);
      v11 = v4;
    }
  }

  return v11;
}

- (id)getApplications
{
  void *v3;
  void *v4;
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  DYEmbeddedDaemon *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000053B4;
  v15 = &unk_10000C758;
  v16 = self;
  v5 = v3;
  v17 = v5;
  objc_msgSend(v4, "enumerateBundlesOfType:block:", 1, &v12);

  if (-[DYEmbeddedDaemon isAppleInternal](self, "isAppleInternal"))
  {
    v6 = objc_opt_new(NSMutableDictionary);
    objc_msgSend(v5, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", CFSTR("com.apple.gputools.ui-server"), CFSTR("bundleIdentifier"));
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", CFSTR("UI Server"), CFSTR("title"));
    v7 = objc_alloc((Class)NSDictionary);
    v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("Binary Launch"), CFSTR("title"), CFSTR("com.apple.gputools.BinaryLaunch"), CFSTR("bundleIdentifier"), 0, v12, v13, v14, v15, v16);
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = v17;
  v10 = v5;

  return v10;
}

- (void)handleMessage:(id)a3
{
  id v4;
  int v5;
  _BOOL8 v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  DYGPUStatsReport *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t i;
  __CFString *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  OS_dispatch_queue *symbolicatorQueue;
  mach_error_t v35;
  char *v36;
  DYGPUStatsReport *v37;
  DYGPUStatsReport *statsReport;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  objc_super v53;
  _QWORD block[5];
  id v55;
  mach_port_name_t v56[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "kind");
  if (v5 > 1537)
  {
    if (v5 == 1538)
    {
      if (-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"))
      {
        symbolicatorQueue = self->_symbolicatorQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100005D20;
        block[3] = &unk_10000C780;
        block[4] = self;
        v55 = v4;
        dispatch_async((dispatch_queue_t)symbolicatorQueue, block);

      }
    }
    else if (v5 == 2304)
    {
      v10 = DYMobileArchivesDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v11, 1));

      v12 = objc_alloc((Class)DYFSStreamer);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
      v8 = (NSMutableDictionary *)objc_msgSend(v12, "initWithURL:transport:asSender:", v7, v13, 0);

      if (v8)
      {
        -[NSMutableDictionary setOwner:](v8, "setOwner:", CFSTR("mobile"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary receiveTransfer:](v8, "receiveTransfer:", v4));
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        +[DYFSStreamer denyTransfer:transport:](DYFSStreamer, "denyTransfer:transport:", v4, v9);
      }
LABEL_47:

LABEL_48:
LABEL_49:

    }
    else
    {
LABEL_13:
      v53.receiver = self;
      v53.super_class = (Class)DYEmbeddedDaemon;
      -[DYEmbeddedDaemon handleMessage:](&v53, "handleMessage:", v4);
    }
  }
  else
  {
    switch(v5)
    {
      case 1288:
        break;
      case 1289:
        v6 = -[DYEmbeddedDaemon bringAppToForeground:](self, "bringAppToForeground:", self->_guestAppIdentifier);
        v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:attributes:objectPayload:](DYTransportMessage, "messageWithKind:attributes:objectPayload:", 1289, 0, v8));
        -[NSMutableDictionary send:inReplyTo:error:](v7, "send:inReplyTo:error:", v9, v4, 0);
        goto LABEL_47;
      case 1290:
        v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.GPUTools")));
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary URLForResource:withExtension:](v7, "URLForResource:withExtension:", CFSTR("version"), CFSTR("plist")));
        if (v8)
          v52 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:", v8);
        else
          v52 = 0;
        v39 = DYGetGLInterposeDylibPath();
        v40 = DYMachOGetDylibCompatibilityVersion(v39);
        if (v40)
          v41 = v40;
        else
          v41 = 1572864;
        v42 = DYGetMTLInterposeDylibPath();
        v43 = DYMachOGetDylibCompatibilityVersion(v42);
        v44 = DYCheckGLDispatchTableSize(CFSTR("com.apple.opengles"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v43));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v41));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v44));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary infoDictionary](v7, "infoDictionary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v45, CFSTR("interpose_version_metal"), v46, CFSTR("interpose_version"), v47, CFSTR("gl-dispatch-table-size-matches"), v48, CFSTR("info"), v52, CFSTR("version"), 0));

        plist_filter(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", 1290, v49));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        objc_msgSend(v51, "send:inReplyTo:error:", v50, v4, 0);

        goto LABEL_48;
      case 1291:
      case 1293:
        goto LABEL_13;
      case 1292:
        v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
        v19 = -[NSMutableDictionary intValue](v7, "intValue");
        if ((_DWORD)v19 != -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid")
          && (int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") > 0
          || !(_DWORD)v19)
        {
          DYLog(kDYLoggingLevelError, "invalid pid specified in register inferior message: %d", (_DWORD)v19);
          -[DYEmbeddedDaemon terminate:](self, "terminate:", 1);
        }
        if ((_DWORD)v19 == -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"))
        {
          if (!self->_guestAppIdentifier)
            -[DYEmbeddedDaemon cacheInferiorAppIdentifier](self, "cacheInferiorAppIdentifier");
        }
        else
        {
          v56[0] = 0;
          v35 = task_for_pid(mach_task_self_, (int)v19, v56);
          if (v35)
          {
            v36 = mach_error_string(v35);
            DYLog(kDYLoggingLevelError, "failed to get task port for process %d: %s", (_DWORD)v19, v36);
          }
          -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", v19);
          -[DYEmbeddedDaemon observeInferior](self, "observeInferior");
          v37 = objc_alloc_init(DYGPUStatsReport);
          statsReport = self->_statsReport;
          self->_statsReport = v37;

          -[DYGPUStatsReport setup](self->_statsReport, "setup");
          -[DYGPUStatsReport startCollectingStats](self->_statsReport, "startCollectingStats");
          if (!self->_guestAppIdentifier)
            -[DYEmbeddedDaemon cacheInferiorAppIdentifier](self, "cacheInferiorAppIdentifier");
        }
        goto LABEL_49;
      case 1294:
        v7 = objc_opt_new(NSMutableDictionary);
        v8 = objc_opt_new(NSMutableDictionary);
        for (i = 0; i != 5; ++i)
        {
          v21 = off_10000C7A0[i];
          v22 = (void *)MGCopyAnswer(v21, 0);
          if (v22)
            -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v22, v21);

        }
        if (-[NSMutableDictionary count](v8, "count"))
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("screen-dimensions"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeForKey:", CFSTR("enable-metal-info")));
        v24 = objc_msgSend(v23, "BOOLValue");

        v25 = copy_metal_version(CFSTR("/"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v26, CFSTR("metal_version"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v27 = 0;
        v28 = 1;
        do
        {
          v29 = v28;
          if (((v24 | v28) & 1) == 0)
            break;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon captureAPISupportForAPI:](self, "captureAPISupportForAPI:", *((unsigned int *)&unk_100009DA8 + v27)));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "graphicsAPIInfo"));
          if (v31)
            objc_msgSend(v9, "addObjectsFromArray:", v31);

          v28 = 0;
          v27 = 1;
        }
        while ((v29 & 1) != 0);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("gputools.contexts-info"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &off_10000D2C0, CFSTR("nativePointerSize"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:objectPayload:](DYTransportMessage, "messageWithKind:objectPayload:", 1294, v7));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        objc_msgSend(v33, "send:inReplyTo:error:", v32, v4, 0);

        goto LABEL_47;
      default:
        if (v5 == 264)
        {
          v14 = self->_statsReport;
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUStatsReport lastStatsReport](v14, "lastStatsReport"));
            v16 = objc_msgSend(v15, "copy");

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:objectPayload:](DYTransportMessage, "messageWithKind:objectPayload:", 1296, v16));
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
              objc_msgSend(v18, "send:error:", v17, 0);

            }
          }
        }
        goto LABEL_13;
    }
  }

}

- (void)terminate:(int)a3
{
  pid_t v4;
  DYGPUStatsReport *statsReport;
  DYGPUStatsReport *v6;
  void *v7;
  void *v8;
  objc_super v9;

  DYLog(kDYLoggingLevelMessage, "terminating daemon %p", self);
  v4 = -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid");
  -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", 0);
  statsReport = self->_statsReport;
  if (statsReport)
  {
    -[DYGPUStatsReport stopCollectingStats](statsReport, "stopCollectingStats");
    v6 = self->_statsReport;
    self->_statsReport = 0;

  }
  if (v4 >= 1)
  {
    if (-[DYEmbeddedDaemon ownsInferior](self, "ownsInferior"))
      kill(v4, 9);
    if (-[DYEmbeddedDaemon capturingInferior](self, "capturingInferior"))
      kill(v4, 9);
  }
  -[DYTransport invalidate](self->_helperTransport, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
  objc_msgSend(v7, "destroySharedMemoryTransport");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
  objc_msgSend(v8, "invalidate");

  v9.receiver = self;
  v9.super_class = (Class)DYEmbeddedDaemon;
  -[DYEmbeddedDaemon invalidate](&v9, "invalidate");
  (*((void (**)(void))self->_terminationHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong((id *)&self->_statsReport, 0);
  objc_storeStrong((id *)&self->_guestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_helperTransport, 0);
  objc_storeStrong((id *)&self->_symbolicatorQueue, 0);
}

@end
