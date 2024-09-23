@implementation SDCompanionStream

- (SDCompanionStream)initWithStreamHandler:(id)a3
{
  return -[SDCompanionStream initWithAuthorData:streamHandler:](self, "initWithAuthorData:streamHandler:", 0, a3);
}

- (SDCompanionStream)initWithAuthorData:(id)a3 streamHandler:(id)a4
{
  id v7;
  id v8;
  SDCompanionStream *v9;
  SDCompanionStream *v10;
  NSString *identifier;
  NSNetServiceBrowser *netServiceBrowser;
  uint64_t v13;
  NSMutableData *clientStreamData;
  uint64_t v15;
  NSMutableData *networkStreamData;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SDCompanionStream;
  v9 = -[SDCompanionStream init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorData, a3);
    objc_storeStrong((id *)&v10->_streamHandler, a4);
    *(_WORD *)&v10->_initiator = 0;
    v10->_clientSent = 0;
    identifier = v10->_identifier;
    v10->_identifier = 0;

    v10->_clientReceived = 0;
    netServiceBrowser = v10->_netServiceBrowser;
    v10->_netServiceBrowser = 0;

    v10->_networkBufferSpaceAvailable = 1;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    clientStreamData = v10->_clientStreamData;
    v10->_clientStreamData = (NSMutableData *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    networkStreamData = v10->_networkStreamData;
    v10->_networkStreamData = (NSMutableData *)v15;

    v10->_readFromClient = 0;
    v10->_wroteToClient = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SDCompanionStream stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDCompanionStream;
  -[SDCompanionStream dealloc](&v3, "dealloc");
}

- (void)start
{
  -[SDStreamHandler setDelegate:](self->_streamHandler, "setDelegate:", self);
  -[SDStreamHandler start](self->_streamHandler, "start");
}

- (void)stop
{
  SDCompanionStream *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));
    objc_msgSend(v4, "stop");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));
    objc_msgSend(v6, "close");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));
    objc_msgSend(v7, "setDelegate:", 0);

    -[SDCompanionStream setClientInputStream:](v2, "setClientInputStream:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));
    objc_msgSend(v9, "close");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));
    objc_msgSend(v10, "setDelegate:", 0);

    -[SDCompanionStream setClientOutputStream:](v2, "setClientOutputStream:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));
    objc_msgSend(v14, "stop");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));
    objc_msgSend(v15, "setDelegate:", 0);

    v16 = -[SDCompanionStream setNetServiceBrowser:](v2, "setNetServiceBrowser:", 0);
    v18 = streams_log(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Stopped net service browser", buf, 2u);
    }

  }
  v20 = streams_log(v12, v13);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client streams closed", v25, 2u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));
  if (v22)
    goto LABEL_16;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream delegate](v2, "delegate"));
  v24 = objc_opt_respondsToSelector(v23, "companionStreamClosedStreams:");

  if ((v24 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream delegate](v2, "delegate"));
    objc_msgSend(v22, "companionStreamClosedStreams:", v2);
LABEL_16:

  }
}

- (void)stopIfReady
{
  if (self->_shouldStop && !-[NSMutableData length](self->_networkStreamData, "length"))
    -[SDCompanionStream stop](self, "stop");
}

- (void)setBundleID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple."));
  if ((_DWORD)v5)
  {
    -[SDStreamHandler setBundleID:](self->_streamHandler, "setBundleID:", v4);
  }
  else
  {
    v7 = streams_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Third party app client", v9, 2u);
    }

  }
}

- (void)getStreamsWithCompletionHandler:(id)a3
{
  id v4;
  id streamsRequestHandler;

  v4 = objc_msgSend(a3, "copy");
  streamsRequestHandler = self->_streamsRequestHandler;
  self->_streamsRequestHandler = v4;

  -[SDCompanionStream sendInitialRequest](self, "sendInitialRequest");
  -[SDCompanionStream startBrowser](self, "startBrowser");
  self->_initiator = 1;
}

- (void)startBrowser
{
  NSNetServiceBrowser *v3;
  NSNetServiceBrowser *netServiceBrowser;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!self->_netServiceBrowser)
  {
    v3 = (NSNetServiceBrowser *)objc_alloc_init((Class)NSNetServiceBrowser);
    netServiceBrowser = self->_netServiceBrowser;
    self->_netServiceBrowser = v3;

    -[NSNetServiceBrowser setDelegate:](self->_netServiceBrowser, "setDelegate:", self);
    -[NSNetServiceBrowser _setIncludesAWDL:](self->_netServiceBrowser, "_setIncludesAWDL:", 1);
    v5 = -[NSNetServiceBrowser searchForServicesOfType:inDomain:](self->_netServiceBrowser, "searchForServicesOfType:inDomain:", CFSTR("_continuity._tcp."), CFSTR("local."));
    v7 = streams_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started net service browser", v9, 2u);
    }

  }
}

- (void)sendInitialRequest
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  SDStreamHandler *streamHandler;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[8];
  _QWORD v11[3];
  _QWORD v12[3];

  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending initial request", buf, 2u);
  }

  v11[0] = CFSTR("StreamMessageType");
  v11[1] = CFSTR("StreamMessageVersion");
  v12[0] = &off_10074BA48;
  v12[1] = &off_10074BA60;
  v11[2] = CFSTR("RequestAuthorData");
  v12[2] = self->_authorData;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v5, NSKeyedArchiveRootObjectKey);
  streamHandler = self->_streamHandler;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodedData"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C40C4;
  v9[3] = &unk_1007148C8;
  v9[4] = self;
  -[SDStreamHandler sendMessage:withCompletionHandler:](streamHandler, "sendMessage:withCompletionHandler:", v8, v9);

}

- (void)sendInitialResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SDStreamHandler *streamHandler;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  const __CFString *v18;

  v3 = a3;
  v5 = streams_log(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending initial streams response (accepted = %@)", buf, 0xCu);
  }

  v16[0] = &off_10074BA78;
  v15[0] = CFSTR("StreamMessageType");
  v15[1] = CFSTR("StreamMessageVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
  v16[1] = v8;
  v15[2] = CFSTR("CompanionStreamConnectResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v16[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  v11 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v11, "encodeObject:forKey:", v10, NSKeyedArchiveRootObjectKey);
  streamHandler = self->_streamHandler;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "encodedData"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C43DC;
  v14[3] = &unk_1007148C8;
  v14[4] = self;
  -[SDStreamHandler sendMessage:withCompletionHandler:](streamHandler, "sendMessage:withCompletionHandler:", v13, v14);

}

- (void)switchToStreaming
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Switched from messages to Streams", v5, 2u);
  }

  -[SDStreamHandler setUsingMessages:](self->_streamHandler, "setUsingMessages:", 0);
  -[SDCompanionStream writeNetworkStream](self, "writeNetworkStream");
}

- (void)notifyStreamRequestWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void (**streamsRequestHandler)(id, _QWORD, void *);
  void *v16;
  void *v17;
  uint8_t v18[8];
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v4 = a3;
  v6 = v4;
  if (self->_streamsRequestHandler)
  {
    if (v4)
    {
      v7 = streams_log(v4, v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001C5E04();

      (*((void (**)(void))self->_streamsRequestHandler + 2))();
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream fileHandle](self, "fileHandle"));
      if (v12)
      {
        (*((void (**)(void))self->_streamsRequestHandler + 2))();
      }
      else
      {
        v13 = streams_log(0, v11);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1001C5DD8();

        streamsRequestHandler = (void (**)(id, _QWORD, void *))self->_streamsRequestHandler;
        v19 = NSLocalizedDescriptionKey;
        v20 = CFSTR("Could not create streams");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v16));
        streamsRequestHandler[2](streamsRequestHandler, 0, v17);

      }
    }
    v10 = self->_streamsRequestHandler;
    self->_streamsRequestHandler = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (self->_initiator)
  {
    v9 = streams_log(v4, v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No handler for stream request", v18, 2u);
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (NSFileHandle)fileHandle
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSFileHandle *v12;
  NSFileHandle *fileHandle;
  const __CFString *v14;
  NSInputStream *clientInputStream;
  NSInputStream *v16;
  void *v17;
  NSOutputStream *clientOutputStream;
  NSOutputStream *v19;
  void *v20;
  uint64_t v21;
  CFStreamClientContext v22;
  CFWriteStreamRef writeStream;
  CFReadStreamRef readStream;
  CFSocketNativeHandle sock[2];

  if (self->_fileHandle || self->_clientInputStream || self->_clientOutputStream)
  {
    v3 = streams_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requested fileHandle more than once.", (uint8_t *)&v22, 2u);
    }
  }
  else
  {
    *(_QWORD *)sock = 0;
    v6 = socketpair(1, 1, 0, sock);
    if ((_DWORD)v6)
    {
      v8 = streams_log(v6, v7);
      v4 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_1001C5E94(v4);
    }
    else
    {
      v9 = -[SDCompanionStream setBufferSize:socket:](self, "setBufferSize:socket:", 0x4000, sock[0]);
      if ((_DWORD)v9)
      {
        v9 = -[SDCompanionStream setBufferSize:socket:](self, "setBufferSize:socket:", 0x4000, sock[1]);
        if ((_DWORD)v9)
        {
          v11 = objc_alloc((Class)NSFileHandle);
          v12 = (NSFileHandle *)objc_msgSend(v11, "initWithFileDescriptor:", sock[0]);
          fileHandle = self->_fileHandle;
          self->_fileHandle = v12;

          writeStream = 0;
          readStream = 0;
          CFStreamCreatePairWithSocket(0, sock[1], &readStream, &writeStream);
          v14 = kCFStreamPropertyShouldCloseNativeSocket;
          CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
          CFWriteStreamSetProperty(writeStream, v14, kCFBooleanTrue);
          clientInputStream = self->_clientInputStream;
          self->_clientInputStream = (NSInputStream *)readStream;

          v16 = self->_clientInputStream;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
          -[NSInputStream scheduleInRunLoop:forMode:](v16, "scheduleInRunLoop:forMode:", v17, NSDefaultRunLoopMode);

          v22.version = 0;
          v22.info = self;
          v22.retain = (void *(__cdecl *)(void *))&_CFRetain;
          v22.release = (void (__cdecl *)(void *))&_CFRelease;
          v22.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
          CFReadStreamSetClient((CFReadStreamRef)self->_clientInputStream, 0x1BuLL, (CFReadStreamClientCallBack)sub_1001C4964, &v22);
          -[NSInputStream open](self->_clientInputStream, "open");
          clientOutputStream = self->_clientOutputStream;
          self->_clientOutputStream = (NSOutputStream *)writeStream;

          v19 = self->_clientOutputStream;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
          -[NSOutputStream scheduleInRunLoop:forMode:](v19, "scheduleInRunLoop:forMode:", v20, NSDefaultRunLoopMode);

          -[NSOutputStream setDelegate:](self->_clientOutputStream, "setDelegate:", self);
          -[NSOutputStream open](self->_clientOutputStream, "open");
          return self->_fileHandle;
        }
      }
      v21 = streams_log(v9, v10);
      v4 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_1001C5E68();
    }
  }

  return self->_fileHandle;
}

- (int)setBufferSize:(int)a3 socket:(int)a4
{
  int result;
  int v6;

  v6 = a3;
  result = setsockopt(a4, 0xFFFF, 4097, &v6, 4u);
  if ((result & 0x80000000) == 0)
  {
    result = setsockopt(a4, 0xFFFF, 4098, &v6, 4u);
    if (result >= 0)
      return 1;
  }
  return result;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v5 = a4;
  v8 = streams_log(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Browser found net service = %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)streamHandler:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;

  v5 = a4;
  v23 = 0;
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v5, &v23);

  v7 = v23;
  v8 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_opt_class(NSNumber);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(NSData), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v9, v12, NSKeyedArchiveRootObjectKey));
  v15 = v13;
  if (v13)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StreamMessageType")));
    v18 = v16;
    if (v16)
    {
      v19 = -[NSObject integerValue](v16, "integerValue");
      if (v19 == (id)1)
      {
        -[SDCompanionStream handleStreamResponse:](self, "handleStreamResponse:", v15);
      }
      else if (!v19)
      {
        -[SDCompanionStream handleStreamRequest:](self, "handleStreamRequest:", v15);
      }
    }
    else
    {
      v21 = streams_log(0, v17);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001C5F74();

    }
  }
  else
  {
    v20 = streams_log(0, v14);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001C5F10();
  }

}

- (void)handleStreamRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *identifier;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  char v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[5];
  uint8_t buf[16];

  v4 = a3;
  v6 = streams_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received request to create streams", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestAuthorData")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SFCompanionService serviceFromAuthorData:](SFCompanionService, "serviceFromAuthorData:", v8));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    identifier = self->_identifier;
    self->_identifier = v10;

    if (v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream fileHandle](self, "fileHandle"));
      if (v15)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v17 = objc_opt_respondsToSelector(WeakRetained, "continuationStream:connectedToService:withFileHandle:acceptHandler:");

        if ((v17 & 1) != 0)
        {
          v18 = objc_loadWeakRetained((id *)&self->_delegate);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1001C4E6C;
          v23[3] = &unk_1007142E0;
          v23[4] = self;
          objc_msgSend(v18, "continuationStream:connectedToService:withFileHandle:acceptHandler:", self, v9, v15, v23);

        }
      }
      else
      {
        v21 = streams_log(0, v14);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1001C5FCC();

        -[SDCompanionStream sendInitialResponse:](self, "sendInitialResponse:", 0);
      }

    }
    else
    {
      v19 = streams_log(v12, v13);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1001C5FA0();

      -[SDCompanionStream sendInitialResponse:](self, "sendInitialResponse:", 0);
    }

  }
}

- (void)handleStreamResponse:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  uint8_t buf[4];
  const __CFString *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CompanionStreamConnectResponse")));
  v6 = streams_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "BOOLValue");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received response to create stream (accepted = %@)", buf, 0xCu);
  }

  if (objc_msgSend(v4, "BOOLValue"))
  {
    -[SDCompanionStream switchToStreaming](self, "switchToStreaming");
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", 0);
  }
  else
  {
    v12 = NSLocalizedDescriptionKey;
    v13 = CFSTR("Connection refused");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 61, v10));
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v11);

    -[SDCompanionStream stop](self, "stop");
  }

}

- (void)streamHandler:(id)a3 bufferSpaceChanged:(BOOL)a4
{
  _BOOL8 v4;
  unsigned __int8 v6;

  v4 = a4;
  v6 = -[SDCompanionStream networkBufferSpaceAvailable](self, "networkBufferSpaceAvailable", a3);
  -[SDCompanionStream setNetworkBufferSpaceAvailable:](self, "setNetworkBufferSpaceAvailable:", v4);
  if (v4 && (v6 & 1) == 0)
  {
    if (-[NSInputStream hasBytesAvailable](self->_clientInputStream, "hasBytesAvailable"))
      -[SDCompanionStream readClientStream](self, "readClientStream");
  }
}

- (void)streamHandler:(id)a3 didReceiveStreamData:(id)a4
{
  -[NSMutableData appendData:](self->_networkStreamData, "appendData:", a4);
  if (-[NSMutableData length](self->_networkStreamData, "length") > 0x20000)
    -[SDStreamHandler setShouldReadNetwork:](self->_streamHandler, "setShouldReadNetwork:", 0);
  -[SDCompanionStream writeClientStream](self, "writeClientStream");
}

- (void)streamHandlerDidClose:(id)a3 withError:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSErrorDomain v12;
  uint64_t v13;
  void *v14;
  SDStreamHandler *streamHandler;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[4];
  id v21;

  v5 = a4;
  v7 = streams_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stream handler closed with error = %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = objc_msgSend(v9, "wirelessEnabled");

  if (!v10)
  {
    v16 = NSLocalizedDescriptionKey;
    v17 = CFSTR("Could not create connection, wireless not enabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v12 = NSPOSIXErrorDomain;
    v13 = 50;
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, v13, v11));
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v14);

    goto LABEL_9;
  }
  if (!v5)
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("Connection lost");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v12 = NSPOSIXErrorDomain;
    v13 = 51;
    goto LABEL_8;
  }
  -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v5);
LABEL_9:
  -[SDStreamHandler setDelegate:](self->_streamHandler, "setDelegate:", 0);
  streamHandler = self->_streamHandler;
  self->_streamHandler = 0;

  self->_shouldStop = 1;
  -[SDCompanionStream stopIfReady](self, "stopIfReady");

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v6 = a3;
  v8 = v6;
  switch(a4)
  {
    case 1uLL:
      -[SDCompanionStream handleOpenedStream](self, "handleOpenedStream");
      break;
    case 2uLL:
      v11 = objc_msgSend(v6, "isEqual:", self->_clientInputStream);
      if (!(_DWORD)v11)
      {
        v16 = streams_log(v11, v12);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1001C5FF8();
        goto LABEL_17;
      }
      -[SDCompanionStream readClientStream](self, "readClientStream");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v13 = objc_msgSend(v6, "isEqual:", self->_clientOutputStream);
      if ((_DWORD)v13)
      {
        -[SDCompanionStream writeClientStream](self, "writeClientStream");
      }
      else
      {
        v18 = streams_log(v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received NSStreamEventHasSpaceAvailable on a stream other than an output stream", buf, 2u);
        }
LABEL_17:

      }
      break;
    case 8uLL:
      v15 = streams_log(v6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001C6024(v8, v10);
      goto LABEL_12;
    default:
      if (a4 == 16)
      {
        v9 = streams_log(v6, v7);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stream end encountered, closing streams", v19, 2u);
        }
LABEL_12:

        -[SDCompanionStream stop](self, "stop");
      }
      break;
  }

}

- (void)handleOpenedStream
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[NSInputStream streamStatus](self->_clientInputStream, "streamStatus") == (id)2
    && -[NSOutputStream streamStatus](self->_clientOutputStream, "streamStatus") == (id)2)
  {
    v4 = streams_log(2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client Streams Opened", v6, 2u);
    }

  }
}

- (void)writeClientStream
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSMutableData *v7;
  NSMutableData *networkStreamData;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t wroteToClient;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  int64_t v24;

  if (!-[NSOutputStream hasSpaceAvailable](self->_clientOutputStream, "hasSpaceAvailable")
    || !-[NSMutableData length](self->_networkStreamData, "length"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (!objc_msgSend(v22, "enableStreamDebugging"))
    {

      return;
    }
    v16 = -[NSOutputStream hasSpaceAvailable](self->_clientOutputStream, "hasSpaceAvailable");

    if ((v16 & 1) != 0)
      return;
    v19 = streams_log(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Queueing client write, no space available", buf, 2u);
    }
    goto LABEL_20;
  }
  v3 = -[NSOutputStream write:maxLength:](self->_clientOutputStream, "write:maxLength:", -[NSMutableData bytes](self->_networkStreamData, "bytes"), -[NSMutableData length](self->_networkStreamData, "length"));
  v5 = v3;
  if (v3 < 1)
  {
    v21 = streams_log(v3, v4);
    v20 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1001C60A4();
LABEL_20:

    return;
  }
  if (!self->_clientReceived)
    -[SDCompanionStream logClientReceived](self, "logClientReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData subdataWithRange:](self->_networkStreamData, "subdataWithRange:", v5, (char *)-[NSMutableData length](self->_networkStreamData, "length") - v5));
  v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v6));
  networkStreamData = self->_networkStreamData;
  self->_networkStreamData = v7;

  if (-[NSMutableData length](self->_networkStreamData, "length") < 0x18000)
    -[SDStreamHandler setShouldReadNetwork:](self->_streamHandler, "setShouldReadNetwork:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = objc_msgSend(v9, "enableStreamDebugging");

  if (v10)
  {
    self->_wroteToClient += v5;
    v13 = streams_log(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      wroteToClient = self->_wroteToClient;
      *(_DWORD *)buf = 134217984;
      v24 = wroteToClient;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Total written to client = %ld", buf, 0xCu);
    }

  }
  -[SDCompanionStream stopIfReady](self, "stopIfReady");

}

- (void)readClientStream
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableData *clientStreamData;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t readFromClient;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  int64_t v20;
  uint8_t buf[16392];

  v3 = -[SDCompanionStream networkBufferSpaceAvailable](self, "networkBufferSpaceAvailable");
  if (v3)
  {
    bzero(buf, 0x4000uLL);
    v5 = -[NSInputStream read:maxLength:](self->_clientInputStream, "read:maxLength:", buf, 0x4000);
    if (v5 < 1)
    {
      v18 = streams_log(v5, v6);
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1001C6108();
      goto LABEL_13;
    }
    v7 = v5;
    if (!self->_clientSent)
      -[SDCompanionStream logClientSent](self, "logClientSent");
    clientStreamData = self->_clientStreamData;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, v7));
    -[NSMutableData appendData:](clientStreamData, "appendData:", v9);

    -[SDCompanionStream writeNetworkStream](self, "writeNetworkStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    LODWORD(v9) = objc_msgSend(v10, "enableStreamDebugging");

    if ((_DWORD)v9)
    {
      self->_readFromClient += v7;
      v13 = streams_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        readFromClient = self->_readFromClient;
        v19 = 134217984;
        v20 = readFromClient;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Total read from client = %ld", (uint8_t *)&v19, 0xCu);
      }
LABEL_13:

    }
  }
  else
  {
    v16 = streams_log(v3, v4);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Network buffer is full, waiting to read from client", buf, 2u);
    }

  }
}

- (void)writeNetworkStream
{
  NSMutableData *v3;
  NSMutableData *clientStreamData;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableData *v11;

  if (-[NSMutableData length](self->_clientStreamData, "length"))
  {
    v11 = self->_clientStreamData;
    v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    clientStreamData = self->_clientStreamData;
    self->_clientStreamData = v3;

    -[SDStreamHandler writeToStreamWithData:](self->_streamHandler, "writeToStreamWithData:", v11);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v6 = objc_msgSend(v5, "enableStreamDebugging");

    if (v6)
    {
      v9 = streams_log(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001C6134();

    }
  }
}

- (void)logClientSent
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  self->_clientSent = 1;
  v2 = streams_log(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client has written data", v4, 2u);
  }

}

- (void)logClientReceived
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  self->_clientReceived = 1;
  v2 = streams_log(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client has read data", v4, 2u);
  }

}

- (SDCompanionStreamDelegate)delegate
{
  return (SDCompanionStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SDStreamHandler)streamHandler
{
  return (SDStreamHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStreamHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSData)authorData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)clientSent
{
  return self->_clientSent;
}

- (void)setClientSent:(BOOL)a3
{
  self->_clientSent = a3;
}

- (BOOL)clientReceived
{
  return self->_clientReceived;
}

- (void)setClientReceived:(BOOL)a3
{
  self->_clientReceived = a3;
}

- (BOOL)networkBufferSpaceAvailable
{
  return self->_networkBufferSpaceAvailable;
}

- (void)setNetworkBufferSpaceAvailable:(BOOL)a3
{
  self->_networkBufferSpaceAvailable = a3;
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return (NSNetServiceBrowser *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetServiceBrowser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSInputStream)clientInputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientInputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSOutputStream)clientOutputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClientOutputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_queue)writeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWriteQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableData)networkStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNetworkStreamData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)readQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setReadQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableData)clientStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientStreamData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)readFromClient
{
  return self->_readFromClient;
}

- (void)setReadFromClient:(int64_t)a3
{
  self->_readFromClient = a3;
}

- (int64_t)wroteToClient
{
  return self->_wroteToClient;
}

- (void)setWroteToClient:(int64_t)a3
{
  self->_wroteToClient = a3;
}

- (id)streamsRequestHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setStreamsRequestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamsRequestHandler, 0);
  objc_storeStrong((id *)&self->_clientStreamData, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_networkStreamData, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_clientOutputStream, 0);
  objc_storeStrong((id *)&self->_clientInputStream, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_storeStrong((id *)&self->_authorData, 0);
  objc_storeStrong((id *)&self->_streamHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
