@implementation SDStreamHandler

- (SDStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 isClient:(BOOL)a5
{
  id v9;
  id v10;
  SDStreamHandler *v11;
  SDStreamHandler *v12;
  NSString *bundleID;
  NSData *inMessage;
  NSTimer *openTimer;
  NSMutableData *outMessage;
  NSError *streamError;
  NSMutableData *v18;
  NSMutableData *inData;
  NSMutableArray *v20;
  NSMutableArray *messageQueue;
  NSMutableDictionary *v22;
  NSMutableDictionary *handlers;
  NSMutableData *v24;
  NSMutableData *outputStreamData;
  NSDate *timeToOpen;
  NSDate *timeOpened;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SDStreamHandler;
  v11 = -[SDStreamHandler init](&v29, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputStream, a3);
    objc_storeStrong((id *)&v12->_outputStream, a4);
    v12->_client = a5;
    v12->_byteIndex = 0;
    v12->_bytesRead = 0;
    bundleID = v12->_bundleID;
    v12->_bundleID = (NSString *)&stru_10072FE60;

    inMessage = v12->_inMessage;
    v12->_inMessage = 0;

    v12->_shouldStop = 0;
    openTimer = v12->_openTimer;
    v12->_openTimer = 0;

    outMessage = v12->_outMessage;
    v12->_outMessage = 0;

    v12->_checkedCert = 0;
    streamError = v12->_streamError;
    v12->_streamError = 0;

    v12->_inMessageLength = 0;
    *(_WORD *)&v12->_registeredStreams = 256;
    *(_WORD *)&v12->_shouldReadNetwork = 257;
    v18 = objc_opt_new(NSMutableData);
    inData = v12->_inData;
    v12->_inData = v18;

    v20 = objc_opt_new(NSMutableArray);
    messageQueue = v12->_messageQueue;
    v12->_messageQueue = v20;

    v22 = objc_opt_new(NSMutableDictionary);
    handlers = v12->_handlers;
    v12->_handlers = v22;

    v24 = objc_opt_new(NSMutableData);
    outputStreamData = v12->_outputStreamData;
    v12->_outputStreamData = v24;

    v12->_inputState = 0;
    timeToOpen = v12->_timeToOpen;
    v12->_timeToOpen = 0;

    timeOpened = v12->_timeOpened;
    v12->_timeOpened = 0;

    v12->_loggedTransfer = 0;
    v12->_wroteToNetwork = 0;
    v12->_readFromNetwork = 0;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SDStreamHandler *v7;

  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Deallocating Stream Handler", buf, 0xCu);
  }

  -[SDStreamHandler _stop](self, "_stop");
  v5.receiver = self;
  v5.super_class = (Class)SDStreamHandler;
  -[SDStreamHandler dealloc](&v5, "dealloc");
}

- (void)start
{
  NSInputStream *inputStream;
  void *v4;
  NSOutputStream *outputStream;
  void *v6;
  NSDate *v7;
  NSDate *timeToOpen;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  if (!-[NSInputStream streamStatus](self->_inputStream, "streamStatus"))
  {
    -[SDStreamHandler applySSLSettings:](self, "applySSLSettings:", self->_inputStream);
    inputStream = self->_inputStream;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    -[NSInputStream scheduleInRunLoop:forMode:](inputStream, "scheduleInRunLoop:forMode:", v4, NSDefaultRunLoopMode);

    -[NSInputStream setProperty:forKey:](self->_inputStream, "setProperty:forKey:", &__kCFBooleanFalse, kCFStreamPropertyAutoErrorOnSystemChange);
    -[NSInputStream setProperty:forKey:](self->_inputStream, "setProperty:forKey:", &__kCFBooleanTrue, kCFStreamPropertyIndefiniteConnection);
    if (!self->_client)
      -[NSInputStream setProperty:forKey:](self->_inputStream, "setProperty:forKey:", &off_10074B970, _kCFStreamPropertySSLClientSideAuthentication);
    -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", self);
    -[NSInputStream open](self->_inputStream, "open");
  }
  if (!-[NSOutputStream streamStatus](self->_outputStream, "streamStatus"))
  {
    -[SDStreamHandler applySSLSettings:](self, "applySSLSettings:", self->_outputStream);
    outputStream = self->_outputStream;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    -[NSOutputStream scheduleInRunLoop:forMode:](outputStream, "scheduleInRunLoop:forMode:", v6, NSDefaultRunLoopMode);

    -[NSOutputStream setProperty:forKey:](self->_outputStream, "setProperty:forKey:", &__kCFBooleanFalse, kCFStreamPropertyAutoErrorOnSystemChange);
    -[NSOutputStream setProperty:forKey:](self->_outputStream, "setProperty:forKey:", &__kCFBooleanTrue, kCFStreamPropertyIndefiniteConnection);
    if (!self->_client)
      -[NSInputStream setProperty:forKey:](self->_inputStream, "setProperty:forKey:", &off_10074B970, _kCFStreamPropertySSLClientSideAuthentication);
    -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", self);
    -[NSOutputStream open](self->_outputStream, "open");
  }
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  timeToOpen = self->_timeToOpen;
  self->_timeToOpen = v7;

  if (!self->_registeredStreams)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
    objc_msgSend(v9, "registerConnectedStreams");

    self->_registeredStreams = 1;
  }
  v10 = -[SDStreamHandler startOpenTimer](self, "startOpenTimer");
  v12 = streams_log(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating network streams", v14, 2u);
  }

}

- (void)stop
{
  if (-[SDStreamHandler usingMessages](self, "usingMessages"))
  {
    -[SDStreamHandler _stop](self, "_stop");
  }
  else
  {
    self->_shouldStop = 1;
    -[SDStreamHandler stopIfReady](self, "stopIfReady");
  }
}

- (void)stopIfReady
{
  if (self->_shouldStop && !-[NSMutableData length](self->_outputStreamData, "length"))
    -[SDStreamHandler _stop](self, "_stop");
}

- (void)_stop
{
  uint64_t v3;
  NSObject *v4;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSOutputStream *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id WeakRetained;
  char v18;
  id v19;
  int v20;
  SDStreamHandler *v21;

  if (self->_inputStream)
  {
    v3 = streams_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Closing input stream", (uint8_t *)&v20, 0xCu);
    }

    -[NSInputStream close](self->_inputStream, "close");
    -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", 0);
    inputStream = self->_inputStream;
    self->_inputStream = 0;

  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    -[NSOutputStream close](outputStream, "close");
    v7 = -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0);
    v9 = streams_log(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Closing output stream", (uint8_t *)&v20, 0xCu);
    }

    v11 = self->_outputStream;
    self->_outputStream = 0;

  }
  if (self->_registeredStreams)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
    objc_msgSend(v12, "unregisterConnectedStreams");

    self->_registeredStreams = 0;
  }
  v13 = -[SDStreamHandler logTransfer](self, "logTransfer");
  v15 = streams_log(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Network streams closed", (uint8_t *)&v20, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_opt_respondsToSelector(WeakRetained, "streamHandlerDidClose:withError:");

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v19, "streamHandlerDidClose:withError:", self, self->_streamError);

  }
}

- (BOOL)shouldReadNetwork
{
  SDStreamHandler *v2;
  BOOL shouldReadNetwork;

  v2 = self;
  objc_sync_enter(v2);
  shouldReadNetwork = v2->_shouldReadNetwork;
  objc_sync_exit(v2);

  return shouldReadNetwork;
}

- (void)setShouldReadNetwork:(BOOL)a3
{
  _BOOL4 v3;
  SDStreamHandler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_shouldReadNetwork = v3;
  if (v3
    && -[NSInputStream hasBytesAvailable](obj->_inputStream, "hasBytesAvailable")
    && !-[SDStreamHandler usingMessages](obj, "usingMessages"))
  {
    -[SDStreamHandler handleBytesForStream](obj, "handleBytesForStream");
  }
  objc_sync_exit(obj);

}

- (void)logTransfer
{
  int64_t wroteToNetwork;
  int64_t readFromNetwork;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  char v13;
  NSString *bundleID;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  NSString *v20;

  wroteToNetwork = self->_wroteToNetwork;
  readFromNetwork = self->_readFromNetwork;
  if (self->_timeOpened)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_timeOpened);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }
  if (!self->_loggedTransfer)
  {
    v8 = readFromNetwork + wroteToNetwork;
    v9 = !self->_bundleID || v8 == 0;
    if (!v9 && v7 != 0.0)
    {
      v10 = streams_log(self, a2);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", &stru_10072FE60);
        v13 = v12;
        if (v12)
          bundleID = self->_bundleID;
        else
          bundleID = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", bundleID = %@"), self->_bundleID));
        *(_DWORD *)buf = 134218498;
        v16 = v8;
        v17 = 2048;
        v18 = v7;
        v19 = 2112;
        v20 = bundleID;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stream Stats: total bytes transferred = %ld, duration = %g%@", buf, 0x20u);
        if ((v13 & 1) == 0)

      }
      sub_100045AA0((__CFString *)self->_bundleID, v8, v7);
      self->_loggedTransfer = 1;
    }
  }
}

- (void)startOpenTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *v5;
  NSTimer *openTimer;
  _DWORD v7[2];

  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = 30;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting open timer with timeout = %d", (uint8_t *)v7, 8u);
  }

  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "openTimerFired:", 0, 0, 30.0));
  openTimer = self->_openTimer;
  self->_openTimer = v5;

}

- (void)openTimerFired:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  NSError *v11;
  NSError *streamError;
  NSTimer *openTimer;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  unsigned int v19;

  v4 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus", a3);
  if (!v4
    || (v4 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus"), v4 == (id)1)
    || (v4 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus")) == 0
    || (v4 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus"), v4 == (id)1))
  {
    v6 = streams_log(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus");
      v9 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
      *(_DWORD *)buf = 67109376;
      v17 = v8;
      v18 = 1024;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Open timer fired with input stream status = %d, output stream status = %d, closing streams", buf, 0xEu);
    }

    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("Connection timed out");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 60, v10));
    streamError = self->_streamError;
    self->_streamError = v11;

    -[SDStreamHandler _stop](self, "_stop");
  }
  openTimer = self->_openTimer;
  self->_openTimer = 0;

}

- (void)invalidateOpenTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *openTimer;
  uint8_t v6[16];

  if (self->_openTimer)
  {
    v3 = streams_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Streams invalidating open timer", v6, 2u);
    }

    -[NSTimer invalidate](self->_openTimer, "invalidate");
    openTimer = self->_openTimer;
    self->_openTimer = 0;

  }
}

- (void)applySSLSettings:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  CFBooleanRef v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[8];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "disableContinuityTLS");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v8 = objc_msgSend(v7, "copyMyAppleIDSecIdentity");

    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v12 = objc_msgSend(v11, "copyMyAppleIDIntermediateCertificate");

      if (v12)
      {
        v29[0] = v8;
        v29[1] = v12;
        v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
        v27[0] = kCFStreamSSLLevel;
        v27[1] = kCFStreamSSLCertificates;
        v28[0] = kCFStreamSocketSecurityLevelTLSv1;
        v28[1] = v13;
        v27[2] = kCFStreamSSLValidatesCertificateChain;
        v27[3] = kCFStreamSSLIsServer;
        if (self->_client)
          v14 = kCFBooleanFalse;
        else
          v14 = kCFBooleanTrue;
        v28[2] = kCFBooleanFalse;
        v28[3] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
        v17 = streams_log(v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Applying tls settings", v26, 2u);
        }

        objc_msgSend(v4, "setProperty:forKey:", v15, kCFStreamPropertySSLSettings);
        CFRelease(v12);

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "myAppleID"));
        SFMetricsLogUnexpectedEvent(7, 1, v22);

        v25 = streams_log(v23, v24);
        v13 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100167BC8();
      }

      CFRelease(v8);
    }
    else
    {
      v19 = streams_log(v9, v10);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100167B9C();

    }
  }

}

- (BOOL)evaluateCert
{
  __SecTrust *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint8_t v43[16];
  id v44;
  int v45;

  v2 = (__SecTrust *)-[NSInputStream propertyForKey:](self->_inputStream, "propertyForKey:", kCFStreamPropertySSLPeerTrust);
  if (v2)
  {
    v4 = sub_10004F238(v2);
    if (-[NSObject count](v4, "count"))
    {
      v45 = 0;
      v6 = SFAppleIDVerifyCertificateChainSync(v4, &v45);
      if ((_DWORD)v6)
        v8 = v45 == 0;
      else
        v8 = 0;
      if (!v8)
      {
        v9 = streams_log(v6, v7);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100167D0C((uint64_t)&v45, v10, v11, v12, v13, v14, v15, v16);
        v17 = 0;
        goto LABEL_32;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0));

      v44 = 0;
      v22 = SFAppleIDCommonNameForCertificate(v21, &v44);
      v23 = v44;
      v10 = v23;
      v45 = v22;
      if (v22)
      {
        v25 = streams_log(v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_100167CA4((uint64_t)&v45, v26, v27, v28, v29, v30, v31, v32);
        v17 = 0;
        goto LABEL_31;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "myAppleIDCommonName"));

      if (-[NSObject length](v26, "length"))
      {
        v35 = -[NSObject isEqualToString:](v10, "isEqualToString:", v26);
        v36 = (int)v35;
        v38 = streams_log(v35, v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        v40 = v39;
        if (v36)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Accounts match", v43, 2u);
          }
          v17 = 1;
          goto LABEL_30;
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_100167C78();
      }
      else
      {
        v41 = streams_log(0, v34);
        v40 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_100167C4C();
      }
      v17 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    v19 = streams_log(0, v5);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100167C20();

  }
  else
  {
    v18 = streams_log(0, v3);
    v4 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100167BF4();
  }
  v17 = 0;
LABEL_33:

  return v17;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSError *v13;
  NSError *streamError;
  uint8_t v15[16];

  v6 = a3;
  v8 = v6;
  switch(a4)
  {
    case 1uLL:
      -[SDStreamHandler handleOpenedStream:](self, "handleOpenedStream:", v6);
      break;
    case 2uLL:
      -[SDStreamHandler handleBytesAvailable](self, "handleBytesAvailable");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      -[SDStreamHandler handleSpaceAvailable](self, "handleSpaceAvailable");
      break;
    case 8uLL:
      v11 = streams_log(v6, v7);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100167D74(v8);

      v13 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "streamError"));
      streamError = self->_streamError;
      self->_streamError = v13;

      goto LABEL_12;
    default:
      if (a4 == 16)
      {
        v9 = streams_log(v6, v7);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stream end encountered, closing streams", v15, 2u);
        }

LABEL_12:
        -[SDStreamHandler _stop](self, "_stop");
      }
      break;
  }

}

- (void)setTCPProperties:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;

  v17 = -1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyForKey:", kCFStreamPropertySocketNativeHandle));
  objc_msgSend(v3, "getBytes:length:", &v17, 4);
  if (v17 < 0)
  {
    v9 = streams_log(v17, v4);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100167E58((uint64_t)&v17, v8, v10, v11, v12, v13, v14, v15);
    goto LABEL_7;
  }
  v16 = 0x4000;
  v5 = setsockopt(v17, 6, 513, &v16, 4u);
  if ((_DWORD)v5 == -1)
  {
    v7 = streams_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100167DEC();
LABEL_7:

  }
}

- (void)handleOpenedStream:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSDate *v11;
  NSDate *timeOpened;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSDate *timeToOpen;
  int v18;
  uint64_t v19;

  v4 = a3;
  if ((unint64_t)-[NSInputStream streamStatus](self->_inputStream, "streamStatus") >= 2)
  {
    v5 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
    if ((unint64_t)v5 >= 2)
    {
      v7 = streams_log(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network streams opened", (uint8_t *)&v18, 2u);
      }

      if (!self->_timeOpened)
      {
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        timeOpened = self->_timeOpened;
        self->_timeOpened = v11;

      }
      if (self->_timeToOpen)
      {
        v13 = streams_log(v9, v10);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v15, "timeIntervalSinceDate:", self->_timeToOpen);
          v18 = 134217984;
          v19 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Time to open streams = %f", (uint8_t *)&v18, 0xCu);

        }
        timeToOpen = self->_timeToOpen;
        self->_timeToOpen = 0;

      }
      -[SDStreamHandler invalidateOpenTimer](self, "invalidateOpenTimer");
    }
  }
  if (objc_msgSend(v4, "isEqual:", self->_outputStream))
    -[SDStreamHandler setTCPProperties:](self, "setTCPProperties:", self->_outputStream);

}

- (void)handleBytesAvailable
{
  void *v3;
  unsigned __int8 v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v3, "disableContinuityTLS") & 1) != 0)
  {

LABEL_5:
    if (-[SDStreamHandler usingMessages](self, "usingMessages"))
      -[SDStreamHandler handleBytesForMessage](self, "handleBytesForMessage");
    else
      -[SDStreamHandler handleBytesForStream](self, "handleBytesForStream");
    return;
  }
  v4 = -[SDStreamHandler checkedCert](self, "checkedCert");

  if ((v4 & 1) != 0)
    goto LABEL_5;
  -[SDStreamHandler setCheckedCert:](self, "setCheckedCert:", 1);
  v5 = -[SDStreamHandler evaluateCert](self, "evaluateCert");
  if (v5)
    goto LABEL_5;
  v7 = streams_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100167EC0();

  -[SDStreamHandler _stop](self, "_stop");
}

- (void)handleSpaceAvailable
{
  void *v3;
  unsigned __int8 v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v3, "disableContinuityTLS") & 1) != 0)
  {

LABEL_5:
    if (-[SDStreamHandler usingMessages](self, "usingMessages"))
      -[SDStreamHandler handleSpaceForMessage](self, "handleSpaceForMessage");
    else
      -[SDStreamHandler handleSpaceForStream](self, "handleSpaceForStream");
    return;
  }
  v4 = -[SDStreamHandler checkedCert](self, "checkedCert");

  if ((v4 & 1) != 0)
    goto LABEL_5;
  -[SDStreamHandler setCheckedCert:](self, "setCheckedCert:", 1);
  v5 = -[SDStreamHandler evaluateCert](self, "evaluateCert");
  if (v5)
    goto LABEL_5;
  v7 = streams_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100167EC0();

  -[SDStreamHandler _stop](self, "_stop");
}

- (void)writeToStreamWithData:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  -[NSMutableData appendData:](self->_outputStreamData, "appendData:", a3);
  if (self->_bufferSpaceAvailable && -[NSMutableData length](self->_outputStreamData, "length") > 0x20000)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:bufferSpaceChanged:");

    if ((v5 & 1) != 0)
    {
      self->_bufferSpaceAvailable = 0;
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "streamHandler:bufferSpaceChanged:", self, 0);

    }
  }
  if (-[SDStreamHandler usingMessages](self, "usingMessages")
    || !-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v8 = objc_msgSend(v7, "enableStreamDebugging");

    if (v8)
    {
      v11 = streams_log(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No space available on network output stream, queuing stream data", v13, 2u);
      }

    }
  }
  else
  {
    -[SDStreamHandler handleSpaceForStream](self, "handleSpaceForStream");
  }
}

- (void)handleBytesForStream
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int64_t readFromNetwork;
  int v26;
  int64_t v27;
  uint8_t buf[32776];

  v3 = -[SDStreamHandler shouldReadNetwork](self, "shouldReadNetwork");
  if (v3)
  {
    bzero(buf, 0x8000uLL);
    v5 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", buf, 0x8000);
    if (v5 < 1)
    {
      v16 = streams_log(v5, v6);
      v9 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100167F44();
    }
    else
    {
      v7 = v5;
      v9 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, v5));
      if (v9)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v11 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:didReceiveStreamData:");

        if ((v11 & 1) != 0)
        {
          v14 = objc_loadWeakRetained((id *)&self->_delegate);
          -[NSObject streamHandler:didReceiveStreamData:](v14, "streamHandler:didReceiveStreamData:", self, v9);
        }
        else
        {
          v18 = streams_log(v12, v13);
          v14 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            sub_100167F18();
        }
      }
      else
      {
        v17 = streams_log(0, v8);
        v14 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100167EEC();
      }

      self->_readFromNetwork += v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v20 = objc_msgSend(v19, "enableStreamDebugging");

      if (v20)
      {
        v23 = streams_log(v21, v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          readFromNetwork = self->_readFromNetwork;
          v26 = 134217984;
          v27 = readFromNetwork;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Total read from network = %ld", (uint8_t *)&v26, 0xCu);
        }

      }
    }
  }
  else
  {
    v15 = streams_log(v3, v4);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client buffer full, waiting to read from network", buf, 2u);
    }
  }

}

- (void)handleSpaceForStream
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSMutableData *v7;
  NSMutableData *outputStreamData;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int64_t wroteToNetwork;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int64_t v26;

  if (-[NSMutableData length](self->_outputStreamData, "length"))
  {
    v3 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", -[NSMutableData bytes](self->_outputStreamData, "bytes"), -[NSMutableData length](self->_outputStreamData, "length"));
    v5 = v3;
    if (v3 < 1)
    {
      v24 = streams_log(v3, v4);
      v6 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100167F70();
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(-[NSMutableData subdataWithRange:](self->_outputStreamData, "subdataWithRange:", v3, (char *)-[NSMutableData length](self->_outputStreamData, "length") - v3));
      v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v6));
      outputStreamData = self->_outputStreamData;
      self->_outputStreamData = v7;

      if (!self->_bufferSpaceAvailable && -[NSMutableData length](self->_outputStreamData, "length") >> 15 <= 2)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v10 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:bufferSpaceChanged:");

        if ((v10 & 1) != 0)
        {
          self->_bufferSpaceAvailable = 1;
          v11 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v11, "streamHandler:bufferSpaceChanged:", self, 1);

        }
      }
      self->_wroteToNetwork += v5;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v13 = objc_msgSend(v12, "enableStreamDebugging");

      if (v13)
      {
        v16 = streams_log(v14, v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          wroteToNetwork = self->_wroteToNetwork;
          v25 = 134217984;
          v26 = wroteToNetwork;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Total written to network = %ld", (uint8_t *)&v25, 0xCu);
        }

      }
      -[SDStreamHandler stopIfReady](self, "stopIfReady");
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v20 = objc_msgSend(v19, "enableStreamDebugging");

    if (!v20)
      return;
    v23 = streams_log(v21, v22);
    v6 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No output stream data to write to network", (uint8_t *)&v25, 2u);
    }
  }

}

- (void)sendMessage:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v4;
  NSObject *v5;

  v4 = streams_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100167FE0();

}

- (void)sendMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int16 v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[SDStreamHandler usingMessages](self, "usingMessages"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler messageWithData:](self, "messageWithData:", v6));
    if (!v9)
    {
      v14 = streams_log(0, v8);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10016800C();

      if (v7)
      {
        v22 = NSLocalizedDescriptionKey;
        v23 = CFSTR("Could not create message payload");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 91, v16));
        v7[2](v7, 0, v17);

      }
      goto LABEL_8;
    }
    -[NSMutableArray addObject:](self->_messageQueue, "addObject:", v9);
    v10 = objc_msgSend(v7, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_handlers, "setObject:forKeyedSubscript:", v10, v9);

    v11 = -[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable");
    if (v11)
    {
      -[SDStreamHandler handleSpaceForMessage](self, "handleSpaceForMessage");
LABEL_8:

      goto LABEL_9;
    }
    v18 = streams_log(v11, v12);
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No space available on network output stream, queuing message", (uint8_t *)&v19, 2u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("Cannot send messages of these streams");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v9));
    v7[2](v7, 0, v13);
    goto LABEL_7;
  }
LABEL_9:

}

- (id)messageWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler headerWithLength:](self, "headerWithLength:", objc_msgSend(v4, "length")));
  objc_msgSend(v5, "appendData:", v4);

  return v5;
}

- (id)headerWithLength:(unsigned int)a3
{
  void *v4;
  unsigned int v6;
  char v7;

  v7 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v7, 1));
  v6 = bswap32(a3);
  objc_msgSend(v4, "appendBytes:length:", &v6, 4);
  return v4;
}

- (void)handleBytesForMessage
{
  unint64_t inputState;
  int64_t bytesRead;
  int64_t v5;
  int64_t inMessageLength;
  size_t v7;
  size_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int64_t v17;
  unsigned int v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  __CFString *v37;

  inputState = self->_inputState;
  if (inputState)
  {
    if (inputState != 1)
    {
      v20 = streams_log(self, a2);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100168038();

      return;
    }
    bytesRead = self->_bytesRead;
    v5 = bytesRead + 0x8000;
    inMessageLength = self->_inMessageLength;
    v7 = inMessageLength - bytesRead;
    if (v5 <= inMessageLength)
      v8 = 0x8000;
    else
      v8 = v7;
  }
  else
  {
    v8 = 5;
  }
  v9 = &buf[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v9, v8);
  v10 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", v9, v8);
  v12 = v10;
  if (v10 < 1)
  {
    v22 = streams_log(v10, v11);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (v24)
        sub_100168090();

      goto LABEL_34;
    }
    if (v24)
      sub_1001680FC();

  }
  else
  {
    v13 = -[NSMutableData appendBytes:length:](self->_inData, "appendBytes:length:", v9, v10);
    self->_bytesRead += v12;
    v15 = streams_log(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_bytesRead;
      v18 = self->_inMessageLength;
      v19 = v18
          ? (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" , expected = %d"), self->_inMessageLength)): &stru_10072FE60;
      *(_DWORD *)buf = 134218498;
      v33 = v12;
      v34 = 2048;
      v35 = v17;
      v36 = 2112;
      v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Read chunk = %ld, total = %ld%@", buf, 0x20u);
      if (v18)

    }
    v27 = self->_inputState;
    if (v12 >= 5 && !v27)
    {
      v25 = -[SDStreamHandler handleHeaderRead](self, "handleHeaderRead");
      v27 = self->_inputState;
    }
    if (v27 == 1)
    {
      v28 = self->_bytesRead;
      v29 = self->_inMessageLength;
      if (v28 == v29)
      {
        -[SDStreamHandler handleMessageRead](self, "handleMessageRead");
        return;
      }
      if (v28 > v29)
      {
        v30 = streams_log(v25, v26);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_100168064();

LABEL_34:
        -[SDStreamHandler _stop](self, "_stop");
      }
    }
  }
}

- (void)handleHeaderRead
{
  void *v3;
  NSMutableData *v4;
  NSMutableData *inData;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int inMessageLength;
  _DWORD v11[2];

  self->_inMessageLength = -[SDStreamHandler parseHeader:](self, "parseHeader:", self->_inData);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler trimHeader:](self, "trimHeader:", self->_inData));
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v3));
  inData = self->_inData;
  self->_inData = v4;

  self->_bytesRead -= 5;
  self->_inputState = 1;
  v8 = streams_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    inMessageLength = self->_inMessageLength;
    v11[0] = 67109120;
    v11[1] = inMessageLength;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expected message length = %d", (uint8_t *)v11, 8u);
  }

}

- (void)handleMessageRead
{
  NSData *v3;
  NSData *inMessage;
  id WeakRetained;

  v3 = (NSData *)-[NSMutableData copy](self->_inData, "copy");
  inMessage = self->_inMessage;
  self->_inMessage = v3;

  -[SDStreamHandler resetReadState](self, "resetReadState");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "streamHandler:didReceiveMessage:", self, self->_inMessage);

}

- (void)resetReadState
{
  NSMutableData *v3;
  NSMutableData *inData;

  self->_bytesRead = 0;
  self->_inMessageLength = 0;
  v3 = objc_opt_new(NSMutableData);
  inData = self->_inData;
  self->_inData = v3;

  self->_inputState = 0;
}

- (void)handleSpaceForMessage
{
  uint64_t v3;
  NSMutableData *outMessage;
  NSMutableData **p_outMessage;
  NSMutableData *v6;
  NSMutableData *v7;
  int64_t *p_byteIndex;
  char *v9;
  NSUInteger v10;
  NSUInteger v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSErrorDomain v27;
  const __CFString **v28;
  NSErrorUserInfoKey *v29;
  unint64_t v30;
  NSUInteger v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  NSErrorUserInfoKey v45;
  void *v46;
  NSErrorUserInfoKey v47;
  const __CFString *v48;
  uint8_t buf[4];
  NSUInteger v50;

  if (-[NSMutableArray count](self->_messageQueue, "count"))
  {
    p_outMessage = &self->_outMessage;
    outMessage = self->_outMessage;
    if (!outMessage)
    {
      v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_messageQueue, "objectAtIndexedSubscript:", 0));
      v7 = self->_outMessage;
      self->_outMessage = v6;

      outMessage = self->_outMessage;
    }
    p_byteIndex = &self->_byteIndex;
    v9 = (char *)-[NSMutableData mutableBytes](outMessage, "mutableBytes") + self->_byteIndex;
    v10 = -[NSMutableData length](self->_outMessage, "length");
    v11 = v10;
    if (v10 - self->_byteIndex >= 0x8000)
      v12 = 0x8000;
    else
      v12 = v10 - *p_byteIndex;
    v13 = (char *)&v43 - (((_DWORD)v12 + 15) & 0x1FFF0);
    bzero(v13, v12);
    memcpy(v13, v9, v12);
    v14 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", v13, v12);
    v16 = v14;
    if (v14 >= 1)
    {
      v17 = (id)(*p_byteIndex + v14);
      *p_byteIndex = (int64_t)v17;
      v18 = -[NSMutableData length](*p_outMessage, "length");
      if (v17 == v18)
      {
        v20 = streams_log(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v50 = v11;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Finished writing message of size = %lu", buf, 0xCu);
        }

        -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", 0);
        return;
      }
      v30 = *p_byteIndex;
      v31 = -[NSMutableData length](*p_outMessage, "length");
      if (v30 <= v31)
        return;
      v33 = streams_log(v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_100168128(&self->_byteIndex, (id *)&self->_outMessage, v34);

      v27 = NSPOSIXErrorDomain;
      v47 = NSLocalizedDescriptionKey;
      v48 = CFSTR("Wrote more bytes than message contained");
      v28 = &v48;
      v29 = &v47;
LABEL_23:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v29, 1, v43, v44));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v27, 94, v35));
      -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", v36);

      return;
    }
    v24 = streams_log(v14, v15);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if ((v16 & 0x8000000000000000) == 0)
    {
      if (v26)
        sub_100168228();

      v27 = NSPOSIXErrorDomain;
      v43 = NSLocalizedDescriptionKey;
      v44 = CFSTR("Zero bytes written for message");
      v28 = &v44;
      v29 = &v43;
      goto LABEL_23;
    }
    if (v26)
      sub_1001681BC();

    v37 = *__error();
    v45 = NSLocalizedDescriptionKey;
    v38 = __error();
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), strerror(*v38));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v46 = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v37, v41));
    -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", v42);

  }
  else
  {
    v22 = streams_log(0, v3);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No messages to write in queue", buf, 2u);
    }

  }
}

- (void)handleMessageWritten:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableData *outMessage;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_handlers, "objectForKeyedSubscript:", self->_outMessage));
  v7 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4 == 0, v4);
    -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", self->_outMessage);
  }
  else
  {
    v8 = streams_log(0, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100168254();

  }
  outMessage = self->_outMessage;
  self->_outMessage = 0;

  -[NSMutableArray removeObjectAtIndex:](self->_messageQueue, "removeObjectAtIndex:", 0);
  self->_byteIndex = 0;

}

- (unsigned)parseHeader:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if (*v4 == 1)
  {
    v6 = bswap32(*(_DWORD *)((char *)objc_msgSend(objc_retainAutorelease(v3), "bytes") + 1));
  }
  else
  {
    v7 = streams_log(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100168280();

    v6 = -1;
  }

  return v6;
}

- (id)trimHeader:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 5, (char *)objc_msgSend(v3, "length") - 5));

  return v4;
}

- (BOOL)usingMessages
{
  return self->_usingMessages;
}

- (void)setUsingMessages:(BOOL)a3
{
  self->_usingMessages = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SDStreamHandlerDelegate)delegate
{
  return (SDStreamHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)checkedCert
{
  return self->_checkedCert;
}

- (void)setCheckedCert:(BOOL)a3
{
  self->_checkedCert = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)registeredStreams
{
  return self->_registeredStreams;
}

- (void)setRegisteredStreams:(BOOL)a3
{
  self->_registeredStreams = a3;
}

- (BOOL)bufferSpaceAvailable
{
  return self->_bufferSpaceAvailable;
}

- (void)setBufferSpaceAvailable:(BOOL)a3
{
  self->_bufferSpaceAvailable = a3;
}

- (NSTimer)openTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOpenTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isClient
{
  return self->_client;
}

- (void)setClient:(BOOL)a3
{
  self->_client = a3;
}

- (NSError)streamError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStreamError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableData)outputStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutputStreamData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int64_t)byteIndex
{
  return self->_byteIndex;
}

- (void)setByteIndex:(int64_t)a3
{
  self->_byteIndex = a3;
}

- (NSMutableData)outMessage
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOutMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMessageQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(int64_t)a3
{
  self->_bytesRead = a3;
}

- (unsigned)inMessageLength
{
  return self->_inMessageLength;
}

- (void)setInMessageLength:(unsigned int)a3
{
  self->_inMessageLength = a3;
}

- (NSData)inMessage
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableData)inData
{
  return (NSMutableData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unint64_t)inputState
{
  return self->_inputState;
}

- (void)setInputState:(unint64_t)a3
{
  self->_inputState = a3;
}

- (BOOL)loggedTransfer
{
  return self->_loggedTransfer;
}

- (void)setLoggedTransfer:(BOOL)a3
{
  self->_loggedTransfer = a3;
}

- (int64_t)wroteToNetwork
{
  return self->_wroteToNetwork;
}

- (void)setWroteToNetwork:(int64_t)a3
{
  self->_wroteToNetwork = a3;
}

- (int64_t)readFromNetwork
{
  return self->_readFromNetwork;
}

- (void)setReadFromNetwork:(int64_t)a3
{
  self->_readFromNetwork = a3;
}

- (NSDate)timeOpened
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTimeOpened:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)timeToOpen
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeToOpen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToOpen, 0);
  objc_storeStrong((id *)&self->_timeOpened, 0);
  objc_storeStrong((id *)&self->_inData, 0);
  objc_storeStrong((id *)&self->_inMessage, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_outMessage, 0);
  objc_storeStrong((id *)&self->_outputStreamData, 0);
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
