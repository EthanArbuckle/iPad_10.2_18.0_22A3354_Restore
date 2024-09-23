@implementation DIDiskArb

+ (DIDiskArb)diskArbWithError:(id *)a3
{
  DIDiskArbEmulation *v3;

  v3 = -[DIDiskArb initWithError:]([DIDiskArb alloc], "initWithError:", 0);
  if (!v3)
    v3 = objc_alloc_init(DIDiskArbEmulation);
  return (DIDiskArb *)v3;
}

- (DIDiskArb)initWithError:(id *)a3
{
  DIDiskArb *v4;
  DIDiskArb *v5;
  __DASession *daSession;
  __CFRunLoop *Current;
  DIDiskArb *v8;
  DIDiskArb *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DIDiskArb;
  v4 = -[DIDiskArb init](&v11, "init");
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (!&_DASessionCreate)
  {
    daSession = v4->_daSession;
    if (daSession)
      goto LABEL_4;
LABEL_7:
    v8 = (DIDiskArb *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed DA init"), a3));
    goto LABEL_8;
  }
  daSession = DASessionCreate(0);
  v5->_daSession = daSession;
  if (!daSession)
    goto LABEL_7;
LABEL_4:
  Current = CFRunLoopGetCurrent();
  DASessionScheduleWithRunLoop(daSession, Current, kCFRunLoopDefaultMode);
LABEL_5:
  v8 = v5;
LABEL_8:
  v9 = v8;

  return v9;
}

- (void)stop
{
  DIDiskArb *v2;
  __DASession *daSession;
  __CFRunLoop *Current;
  DIDiskArb *context;

  context = self;
  objc_sync_enter(context);
  v2 = context;
  daSession = context->_daSession;
  if (daSession)
  {
    if (context->_inputMountedOnURL || context->_shadowMountedOnURLs)
    {
      DAUnregisterCallback(context->_daSession, sub_10002894C, context);
      daSession = context->_daSession;
    }
    Current = CFRunLoopGetCurrent();
    DASessionUnscheduleFromRunLoop(daSession, Current, kCFRunLoopDefaultMode);
    CFRelease(context->_daSession);
    v2 = context;
    context->_daSession = 0;
  }
  objc_sync_exit(v2);

}

- (void)onDiskDisappearedWithDisk:(__DADisk *)a3
{
  CFDictionaryRef v5;
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
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  int v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  const char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint8_t v57[128];
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  void *v63;

  if (-[DIDiskArb daSession](self, "daSession"))
  {
    v5 = DADiskCopyDescription(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v5, "objectForKey:", kDADiskDescriptionVolumePathKey));
    if (sub_1000BF0D4())
    {
      v7 = *__error();
      if (sub_1000BF0BC())
      {
        v56 = 0;
        v8 = sub_1000BF044();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          v10 = 3;
        else
          v10 = 2;
        *(_DWORD *)buf = 68158210;
        v59 = 39;
        v60 = 2080;
        v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        v62 = 2114;
        v63 = v6;
        v11 = (char *)_os_log_send_and_compose_impl(v10, &v56, 0, 0, &_mh_execute_header, v9, 2, "%.*s: Reached with diskURL=%{public}@", buf, 28);

        if (v11)
        {
          fprintf(__stderrp, "%s\n", v11);
          free(v11);
        }
      }
      else
      {
        v19 = sub_1000BF044();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68158210;
          v59 = 39;
          v60 = 2080;
          v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
          v62 = 2114;
          v63 = v6;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%.*s: Reached with diskURL=%{public}@", buf, 0x1Cu);
        }

      }
      *__error() = v7;
    }
    if (v6)
    {
      v21 = objc_claimAutoreleasedReturnValue(-[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL"));
      if (v21)
      {
        v22 = (void *)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL"));
        v24 = objc_msgSend(v6, "isEqual:", v23);

        if (v24)
        {
          v25 = *__error();
          if (sub_1000BF0BC())
          {
            v56 = 0;
            v26 = sub_1000BF044();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              v28 = 3;
            else
              v28 = 2;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
            *(_DWORD *)buf = 68158211;
            v59 = 39;
            v60 = 2080;
            v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
            v62 = 2113;
            v63 = v29;
            LODWORD(v51) = 28;
            v30 = (char *)_os_log_send_and_compose_impl(v28, &v56, 0, 0, &_mh_execute_header, v27, 16, "%.*s: Mount point %{private}@ disappeared", buf, v51);

            if (v30)
            {
              fprintf(__stderrp, "%s\n", v30);
              free(v30);
            }
          }
          else
          {
            v31 = sub_1000BF044();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
              *(_DWORD *)buf = 68158211;
              v59 = 39;
              v60 = 2080;
              v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
              v62 = 2113;
              v63 = v33;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared", buf, 0x1Cu);

            }
          }
          *__error() = v25;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb delegate](self, "delegate"));
          objc_msgSend(v34, "onDisappearedMountPoint");

        }
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));

      if (v35)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(_QWORD *)v53 != v39)
                objc_enumerationMutation(v36);
              if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i)))
              {
                v41 = *__error();
                if (sub_1000BF0BC())
                {
                  v56 = 0;
                  v42 = sub_1000BF044();
                  v43 = objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    v44 = 3;
                  else
                    v44 = 2;
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
                  *(_DWORD *)buf = 68158211;
                  v59 = 39;
                  v60 = 2080;
                  v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                  v62 = 2113;
                  v63 = v45;
                  LODWORD(v51) = 28;
                  v46 = (char *)_os_log_send_and_compose_impl(v44, &v56, 0, 0, &_mh_execute_header, v43, 16, "%.*s: Mount point %{private}@ disappeared (shadow's mount point)", buf, v51);

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
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
                    *(_DWORD *)buf = 68158211;
                    v59 = 39;
                    v60 = 2080;
                    v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                    v62 = 2113;
                    v63 = v49;
                    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared (shadow's mount point)", buf, 0x1Cu);

                  }
                }
                *__error() = v41;
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb delegate](self, "delegate"));
                objc_msgSend(v50, "onDisappearedMountPoint");

                goto LABEL_56;
              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            if (v38)
              continue;
            break;
          }
        }
LABEL_56:

      }
    }

  }
  else
  {
    v12 = *__error();
    if (sub_1000BF0BC())
    {
      v56 = 0;
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v15 = 3;
      else
        v15 = 2;
      *(_DWORD *)buf = 68157954;
      v59 = 39;
      v60 = 2080;
      v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
      LODWORD(v51) = 18;
      v16 = (char *)_os_log_send_and_compose_impl(v15, &v56, 0, 0, &_mh_execute_header, v14, 0, "%.*s: Ignoring, during shutdown", (int)buf, v51);

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
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v59 = 39;
        v60 = 2080;
        v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: Ignoring, during shutdown", buf, 0x12u);
      }

    }
    *__error() = v12;
  }
}

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v21;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;

  v4 = *__error();
  if (sub_1000BF0BC())
  {
    v22 = 0;
    v5 = sub_1000BF044();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v7 = 3;
    else
      v7 = 2;
    *(_DWORD *)buf = 68157954;
    v24 = 36;
    v25 = 2080;
    v26 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v21) = 18;
    v8 = (char *)_os_log_send_and_compose_impl(v7, &v22, 0, 0, &_mh_execute_header, v6, 0, "%.*s: Waiting for disk arbitration idle", (int)buf, v21);

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
      v24 = 36;
      v25 = 2080;
      v26 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Waiting for disk arbitration idle", buf, 0x12u);
    }

  }
  *__error() = v4;
  -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
  DARegisterIdleCallback(-[DIDiskArb daSession](self, "daSession"), sub_100029430, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  if (!-[DIDiskArb callbackReached](self, "callbackReached"))
  {
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
      objc_msgSend(v11, "runMode:beforeDate:", NSDefaultRunLoopMode, v12);

    }
    while (!-[DIDiskArb callbackReached](self, "callbackReached"));
  }
  DAUnregisterCallback(-[DIDiskArb daSession](self, "daSession"), sub_100029430, self);
  v13 = *__error();
  if (sub_1000BF0BC())
  {
    v22 = 0;
    v14 = sub_1000BF044();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v16 = 3;
    else
      v16 = 2;
    *(_DWORD *)buf = 68157954;
    v24 = 36;
    v25 = 2080;
    v26 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v21) = 18;
    v17 = (char *)_os_log_send_and_compose_impl(v16, &v22, 0, 0, &_mh_execute_header, v15, 0, "%.*s: Disk arbitration idle callback received", (int)buf, v21);

    if (v17)
    {
      fprintf(__stderrp, "%s\n", v17);
      free(v17);
    }
  }
  else
  {
    v18 = sub_1000BF044();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v24 = 36;
      v25 = 2080;
      v26 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%.*s: Disk arbitration idle callback received", buf, 0x12u);
    }

  }
  *__error() = v13;

  return 1;
}

- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  DIDiskArb *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint8_t v45[128];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  void *v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", v8);
    v37 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    v36 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
    v11 = *__error();
    if (sub_1000BF0BC())
    {
      v44 = 0;
      v12 = sub_1000BF044();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v14 = 3;
      else
        v14 = 2;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      *(_DWORD *)buf = 68158211;
      v47 = 77;
      v48 = 2080;
      v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
      v50 = 2113;
      v51 = v15;
      v16 = (char *)_os_log_send_and_compose_impl(v14, &v44, 0, 0, &_mh_execute_header, v13, 0, "%.*s: Registering DiskDisappearedCallback for %{private}@", buf, 28);

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
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
        *(_DWORD *)buf = 68158211;
        v47 = 77;
        v48 = 2080;
        v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
        v50 = 2113;
        v51 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@", buf, 0x1Cu);

      }
    }
    v39 = v8;
    *__error() = v11;
  }
  else
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_31;
    v39 = 0;
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", 0);
    v37 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    v36 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v26 = *__error();
        if (sub_1000BF0BC())
        {
          v44 = 0;
          v27 = sub_1000BF044();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            v29 = 3;
          else
            v29 = 2;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
          *(_DWORD *)buf = 68158211;
          v47 = 77;
          v48 = 2080;
          v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
          v50 = 2113;
          v51 = v30;
          LODWORD(v35) = 28;
          v31 = (char *)_os_log_send_and_compose_impl(v29, &v44, 0, 0, &_mh_execute_header, v28, 0, "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)", buf, v35);

          if (v31)
          {
            fprintf(__stderrp, "%s\n", v31);
            free(v31);
          }
        }
        else
        {
          v32 = sub_1000BF044();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
            *(_DWORD *)buf = 68158211;
            v47 = 77;
            v48 = 2080;
            v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
            v50 = 2113;
            v51 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)", buf, 0x1Cu);

          }
        }
        *__error() = v26;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v22);
  }

  DARegisterDiskDisappearedCallback(-[DIDiskArb daSession](v38, "daSession"), 0, (DADiskDisappearedCallback)sub_10002894C, v38);
  v8 = v39;
  v10 = v36;
  v9 = v37;
LABEL_31:

}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  __DASession *v14;
  id v15;
  __DADisk *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = *__error();
  if (sub_1000BF0BC())
  {
    v30 = 0;
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = 3;
    else
      v10 = 2;
    *(_DWORD *)buf = 68158210;
    v32 = 36;
    v33 = 2080;
    v34 = "-[DIDiskArb ejectWithBSDName:error:]";
    v35 = 2112;
    v36 = v6;
    v11 = (char *)_os_log_send_and_compose_impl(v10, &v30, 0, 0, &_mh_execute_header, v9, 0, "%.*s: Ejecting %@", buf, 28);

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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v32 = 36;
      v33 = 2080;
      v34 = "-[DIDiskArb ejectWithBSDName:error:]";
      v35 = 2112;
      v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }

  }
  *__error() = v7;
  v14 = -[DIDiskArb daSession](self, "daSession");
  v15 = objc_retainAutorelease(v6);
  v16 = DADiskCreateFromBSDName(0, v14, (const char *)objc_msgSend(v15, "fileSystemRepresentation"));
  if (v16)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0);
    DADiskEject(v16, 0, (DADiskEjectCallback)sub_100029D54, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
        objc_msgSend(v17, "runMode:beforeDate:", NSDefaultRunLoopMode, v18);

      }
      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));

    v20 = v19 == 0;
    if (v19)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));
    }
    else
    {
      v21 = *__error();
      if (sub_1000BF0BC())
      {
        v30 = 0;
        v22 = sub_1000BF044();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          v24 = 3;
        else
          v24 = 2;
        *(_DWORD *)buf = 68158210;
        v32 = 36;
        v33 = 2080;
        v34 = "-[DIDiskArb ejectWithBSDName:error:]";
        v35 = 2112;
        v36 = v15;
        LODWORD(v29) = 28;
        v25 = (char *)_os_log_send_and_compose_impl(v24, &v30, 0, 0, &_mh_execute_header, v23, 0, "%.*s: %@ ejected successfully", buf, v29);

        if (v25)
        {
          fprintf(__stderrp, "%s\n", v25);
          free(v25);
        }
      }
      else
      {
        v26 = sub_1000BF044();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          v32 = 36;
          v33 = 2080;
          v34 = "-[DIDiskArb ejectWithBSDName:error:]";
          v35 = 2112;
          v36 = v15;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
        }

      }
      *__error() = v21;
    }

  }
  else
  {
    v20 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed to create DADisk during eject"), a4);
  }

  return v20;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFURL *v14;
  __DADisk *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = *__error();
  if (sub_1000BF0BC())
  {
    v29 = 0;
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = 3;
    else
      v10 = 2;
    *(_DWORD *)buf = 68158211;
    v31 = 41;
    v32 = 2080;
    v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
    v34 = 2113;
    v35 = v6;
    v11 = (char *)_os_log_send_and_compose_impl(v10, &v29, 0, 0, &_mh_execute_header, v9, 0, "%.*s: Unmounting %{private}@", buf, 28);

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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      v31 = 41;
      v32 = 2080;
      v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
      v34 = 2113;
      v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Unmounting %{private}@", buf, 0x1Cu);
    }

  }
  *__error() = v7;
  v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v15 = DADiskCreateFromVolumePath(0, -[DIDiskArb daSession](self, "daSession"), v14);
  if (v15)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0);
    DADiskUnmount(v15, 0, (DADiskUnmountCallback)sub_100029D54, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
        objc_msgSend(v16, "runMode:beforeDate:", NSDefaultRunLoopMode, v17);

      }
      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));

    v19 = v18 == 0;
    if (v18)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));
    }
    else
    {
      v20 = *__error();
      if (sub_1000BF0BC())
      {
        v29 = 0;
        v21 = sub_1000BF044();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          v23 = 3;
        else
          v23 = 2;
        *(_DWORD *)buf = 68158211;
        v31 = 41;
        v32 = 2080;
        v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
        v34 = 2113;
        v35 = v6;
        LODWORD(v28) = 28;
        v24 = (char *)_os_log_send_and_compose_impl(v23, &v29, 0, 0, &_mh_execute_header, v22, 0, "%.*s: %{private}@ unmounted successfully", buf, v28);

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
          *(_DWORD *)buf = 68158211;
          v31 = 41;
          v32 = 2080;
          v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
          v34 = 2113;
          v35 = v6;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: %{private}@ unmounted successfully", buf, 0x1Cu);
        }

      }
      *__error() = v20;
    }

  }
  else
  {
    v19 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed to create DADisk during unmount"), a4);
  }

  return v19;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  id v4;
  __DASession *v5;
  id v6;
  const char *v7;
  __DADisk *v8;
  __DADisk *v9;
  CFDictionaryRef v10;

  v4 = a3;
  v5 = -[DIDiskArb daSession](self, "daSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

  v8 = DADiskCreateFromBSDName(0, v5, v7);
  v9 = v8;
  if (v8)
    v10 = DADiskCopyDescription(v8);
  else
    v10 = 0;

  return v10;
}

- (DIDisappearedMountPointDelegate)delegate
{
  return (DIDisappearedMountPointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(__DASession *)a3
{
  self->_daSession = a3;
}

- (NSURL)inputMountedOnURL
{
  return self->_inputMountedOnURL;
}

- (void)setInputMountedOnURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)shadowMountedOnURLs
{
  return self->_shadowMountedOnURLs;
}

- (void)setShadowMountedOnURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)callbackReached
{
  return self->_callbackReached;
}

- (void)setCallbackReached:(BOOL)a3
{
  self->_callbackReached = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_shadowMountedOnURLs, 0);
  objc_storeStrong((id *)&self->_inputMountedOnURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
