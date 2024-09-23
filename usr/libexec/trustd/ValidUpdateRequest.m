@implementation ValidUpdateRequest

- (id)validUpdateConfiguration:(BOOL)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];

  if (a3)
  {
    v3 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("ValidUpdateWiFiOnly"), CFSTR("com.apple.security"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    if (v3)
    {
      v4 = v3;
      v5 = CFGetTypeID(v3);
      v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) == 0;
      CFRelease(v4);
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.trustd.networking.background")));
    objc_msgSend(v7, "setNetworkServiceType:", 3);
    objc_msgSend(v7, "setDiscretionary:", 1);
    objc_msgSend(v7, "set_requiresPowerPluggedIn:", 1);
    objc_msgSend(v7, "setAllowsCellularAccess:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    objc_msgSend(v7, "setNetworkServiceType:", 0);
    objc_msgSend(v7, "setDiscretionary:", 0);
  }
  v10[0] = CFSTR("User-Agent");
  v10[1] = CFSTR("Accept");
  v11[0] = CFSTR("com.apple.trustd/3.0");
  v11[1] = CFSTR("*/*");
  v10[2] = CFSTR("Accept-Encoding");
  v11[2] = CFSTR("gzip,deflate,br");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
  objc_msgSend(v7, "setHTTPAdditionalHeaders:", v8);

  objc_msgSend(v7, "setTLSMinimumSupportedProtocol:", 8);
  objc_msgSend(v7, "setHTTPCookieStorage:", 0);
  objc_msgSend(v7, "setURLCache:", 0);
  return v7;
}

- (id)createSession:(BOOL)a3 queue:(id)a4 forServer:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  ValidDelegate *v11;
  id v12;
  id v13;
  void *v14;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest validUpdateConfiguration:](self, "validUpdateConfiguration:", v6));
  v11 = objc_alloc_init(ValidDelegate);
  -[ValidDelegate setHandler:](v11, "setHandler:", &stru_1000773A8);
  -[ValidDelegate setTransaction:](v11, "setTransaction:", 0);
  -[ValidDelegate setRevDbUpdateQueue:](v11, "setRevDbUpdateQueue:", v9);

  -[ValidDelegate setFinishedDownloading:](v11, "setFinishedDownloading:", 0);
  v12 = objc_msgSend(v8, "copy");

  -[ValidDelegate setCurrentUpdateServer:](v11, "setCurrentUpdateServer:", v12);
  v13 = objc_alloc_init((Class)NSOperationQueue);
  objc_msgSend(v13, "setMaxConcurrentOperationCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v10, v11, v13));

  return v14;
}

- (void)createSessions:(id)a3 forServer:(id)a4
{
  id v6;
  void *v7;
  CFPropertyListRef v8;
  const void *v9;
  CFTypeID v10;
  int Value;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest createSession:queue:forServer:](self, "createSession:queue:forServer:", 0, v14, v6));
  -[ValidUpdateRequest setEphemeralSession:](self, "setEphemeralSession:", v7);

  v8 = CFPreferencesCopyValue(CFSTR("ValidUpdateBackground"), CFSTR("com.apple.security"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  if (!v8)
    goto LABEL_6;
  v9 = v8;
  v10 = CFGetTypeID(v8);
  if (v10 != CFBooleanGetTypeID())
  {
    CFRelease(v9);
    goto LABEL_6;
  }
  Value = CFBooleanGetValue((CFBooleanRef)v9);
  CFRelease(v9);
  if (Value)
  {
LABEL_6:
    v12 = objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest createSession:queue:forServer:](self, "createSession:queue:forServer:", 1, v14, v6));
    goto LABEL_7;
  }
  v12 = objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest ephemeralSession](self, "ephemeralSession"));
LABEL_7:
  v13 = (void *)v12;
  -[ValidUpdateRequest setBackgroundSession:](self, "setBackgroundSession:", v12);

}

- (BOOL)scheduleUpdateFromServer:(id)a3 forVersion:(int64_t)a4 withQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  const void *v12;
  NSObject *v13;
  const char *v14;
  const void *v15;
  _QWORD v17[5];
  dispatch_queue_t v18;
  id v19;
  int64_t v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v12 = sub_100011628("validupdate");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "invalid update request";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
  if (!v9)
  {
    v15 = sub_100011628("validupdate");
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "missing update queue, skipping update";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003E06C;
  v17[3] = &unk_100077410;
  v17[4] = self;
  v18 = (dispatch_queue_t)v9;
  v19 = v8;
  v20 = a4;
  dispatch_async(v18, v17);

  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)updateNowFromServer:(id)a3 version:(int64_t)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const void *v15;
  NSObject *v16;
  const char *v17;
  const void *v18;
  BOOL v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  CFAbsoluteTime Current;
  __int16 v32;
  NSObject *v33;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v15 = sub_100011628("validupdate");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "invalid update request";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_10:
    v19 = 0;
    goto LABEL_15;
  }
  if (!v9)
  {
    v18 = sub_100011628("validupdate");
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "missing update queue, skipping update";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest ephemeralSession](self, "ephemeralSession"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest ephemeralSession](self, "ephemeralSession"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));

    v14 = objc_msgSend(v8, "copy");
    objc_msgSend(v13, "setCurrentUpdateServer:", v14);

  }
  else
  {
    -[ValidUpdateRequest createSessions:forServer:](self, "createSessions:forServer:", v10, v8);
  }
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@/g%ld/v%ld"), v8, sub_10004ED44(), a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v16 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ValidUpdateRequest ephemeralSession](self, "ephemeralSession"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dataTaskWithURL:", v16));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4));
  objc_msgSend(v23, "setTaskDescription:", v24);

  objc_msgSend(v23, "resume");
  v25 = sub_100011628("validupdate");
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v23;
    v30 = 2048;
    Current = CFAbsoluteTimeGetCurrent();
    v32 = 2112;
    v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "running foreground data task %@ at %f URL:%@", buf, 0x20u);
  }

  v19 = 1;
LABEL_15:

  return v19;
}

- (double)updateScheduled
{
  return self->_updateScheduled;
}

- (void)setUpdateScheduled:(double)a3
{
  self->_updateScheduled = a3;
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURLSession)ephemeralSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEphemeralSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralSession, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
}

@end
