@implementation MMTConnection

- (MMTConnection)initWithLockdownConnection:(_lockdown_connection *)a3
{
  MMTConnection *v4;
  DMCPowerAssertion *v5;
  DMCPowerAssertion *powerAssertion;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  int AppBooleanValue;
  MTChaperoneParser *v10;
  MDMAbstractTunnelParser *parser;
  MTIPCUTunnelParser *v12;
  MDMAbstractTunnelParser *v13;
  MDMAbstractTunnelParser *v14;
  _QWORD v16[4];
  id v17;
  id location;
  Boolean keyExistsAndHasValidFormat;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MMTConnection;
  v4 = -[MMTConnection init](&v20, "init");
  if (v4)
  {
    v5 = (DMCPowerAssertion *)objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("mc_mobile_tunnel-MMTConnection"));
    powerAssertion = v4->_powerAssertion;
    v4->_powerAssertion = v5;

    v4->_lockdownConnection = a3;
    v7 = dispatch_queue_create("Work Queue", 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v7;

    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ForceTunnelIsSupervised"), CFSTR("com.apple.managedconfiguration"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue)
    {
      v10 = objc_opt_new(MTChaperoneParser);
      parser = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v10;

    }
    else
    {
      v12 = objc_opt_new(MTIPCUTunnelParser);
      v13 = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v12;

      objc_initWeak(&location, v4);
      v14 = v4->_parser;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000052D0;
      v16[3] = &unk_100010778;
      objc_copyWeak(&v17, &location);
      -[MDMAbstractTunnelParser setEscalationBlock:](v14, "setEscalationBlock:", v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return v4;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MMTConnection workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053A4;
  block[3] = &unk_1000107A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)receiveMessage
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  NSObject *v13;
  int *v14;
  char *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _lockdown_connection *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t isKindOfClass;
  NSObject *v35;
  NSObject *v36;
  unsigned int v37;
  uint8_t buf[4];
  _BYTE v39[10];
  char *v40;

  v3 = *(NSObject **)DMCLogObjects(self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v39 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Receiving on lockdown connection: %p", buf, 0xCu);

  }
  v37 = 0;
  v5 = lockdown_recv(-[MMTConnection lockdownConnection](self, "lockdownConnection"), &v37, 4);
  if (!v5)
    goto LABEL_14;
  v6 = v5;
  if (v5 != 4)
  {
    v12 = *(NSObject **)DMCLogObjects(v5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v39 = v6;
      *(_WORD *)&v39[8] = 2082;
      v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not receive size of message: %ld %{public}s", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (v37)
  {
    v7 = bswap32(v37);
    if (v7 >= 0x1400001)
    {
      v8 = *(NSObject **)DMCLogObjects(4);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v39 = v7;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = 20971520;
        v9 = "Message size %d exceeds limit of %d bytes";
        v10 = v8;
        v11 = 14;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v7));
    v20 = v19;
    if (v19)
    {
      v21 = objc_retainAutorelease(v19);
      v22 = (char *)objc_msgSend(v21, "mutableBytes");
      v23 = 0;
      while (1)
      {
        v24 = lockdown_recv(-[MMTConnection lockdownConnection](self, "lockdownConnection"), v22, (int)v7 - (int)v23);
        if (v24 == -1)
          break;
        v23 += v24;
        v22 += v24;
        if (v23 >= v7)
          goto LABEL_25;
      }
      v28 = *(NSObject **)DMCLogObjects(-1);
      v24 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot receive message.", buf, 2u);
      }
LABEL_25:
      v29 = *(NSObject **)DMCLogObjects(v24);
      if (v23 == v7)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v39 = v31;
          *(_WORD *)&v39[8] = 2112;
          v40 = (char *)v21;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received message on connection %p: %@", buf, 0x16u);

        }
        v32 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization DMCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "DMCSafePropertyListWithData:options:format:error:", v21, 0, 0, 0));
        if (v32)
        {
          v17 = (void *)v32;
          v33 = objc_opt_class(NSDictionary);
          isKindOfClass = objc_opt_isKindOfClass(v17, v33);
          if ((isKindOfClass & 1) != 0)
          {
LABEL_34:
            v36 = *(NSObject **)DMCLogObjects(isKindOfClass);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v39 = v17;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Received message: %{public}@", buf, 0xCu);
            }
            goto LABEL_40;
          }

        }
        v35 = *(NSObject **)DMCLogObjects(v32);
        isKindOfClass = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
        if ((_DWORD)isKindOfClass)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "The message did not contain a dictionary.", buf, 2u);
        }
        v17 = 0;
        goto LABEL_34;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v26 = "Received message has the wrong byte count -- rejecting.";
        v27 = v29;
        goto LABEL_38;
      }
    }
    else
    {
      v25 = *(NSObject **)DMCLogObjects(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v26 = "Cannot allocate message buffer.";
        v27 = v25;
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, 2u);
      }
    }
    v17 = 0;
LABEL_40:

    return v17;
  }
  v16 = *(NSObject **)DMCLogObjects(4);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v9 = "Message cannot be zero length";
    v10 = v16;
    v11 = 2;
    goto LABEL_13;
  }
LABEL_14:
  v17 = 0;
  return v17;
}

- (BOOL)sendMessage:(id)a3
{
  _lockdown_connection *v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL8 v9;
  NSObject *v10;
  _lockdown_connection *v11;
  NSObject *v12;
  void *v13;
  _lockdown_connection *v14;
  _lockdown_connection *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int *v23;
  char *v24;
  const char *v25;
  NSObject *v26;
  int *v27;
  char *v28;
  unsigned int v30;
  id v31;
  uint8_t buf[4];
  _lockdown_connection *v33;

  v4 = (_lockdown_connection *)a3;
  v5 = *(NSObject **)DMCLogObjects(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    v7 = v5;
    *(_DWORD *)buf = 134217984;
    v33 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending response on lockdown connection: %p", buf, 0xCu);

  }
  v8 = *(NSObject **)DMCLogObjects(v6);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    v10 = v8;
    v11 = (_lockdown_connection *)objc_claimAutoreleasedReturnValue(-[_lockdown_connection objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("Status")));
    *(_DWORD *)buf = 138543362;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending reply status: %{public}@", buf, 0xCu);

  }
  v12 = *(NSObject **)DMCLogObjects(v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending message: %{private}@", buf, 0xCu);
  }
  if (v4)
  {
    v31 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 100, 0, &v31));
    v14 = (_lockdown_connection *)v31;
    v15 = v14;
    if (!v13)
    {
      v20 = *(NSObject **)DMCLogObjects(v14);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Cannot convert reply dictionary into PList: %{public}@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v16 = objc_msgSend(v13, "length");
    v30 = bswap32(v16);
    v17 = lockdown_send(-[MMTConnection lockdownConnection](self, "lockdownConnection"), &v30, 4);
    if (v17 == 4)
    {
      v18 = lockdown_send(-[MMTConnection lockdownConnection](self, "lockdownConnection"), objc_msgSend(objc_retainAutorelease(v13), "bytes"), v16);
      if (v18 == v16)
      {
        v19 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v26 = *(NSObject **)DMCLogObjects(v18);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v22 = v26;
        v27 = __error();
        v28 = strerror(*v27);
        *(_DWORD *)buf = 136446210;
        v33 = (_lockdown_connection *)v28;
        v25 = "Could not send message: %{public}s";
        goto LABEL_19;
      }
    }
    else
    {
      v21 = *(NSObject **)DMCLogObjects(v17);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        v23 = __error();
        v24 = strerror(*v23);
        *(_DWORD *)buf = 136446210;
        v33 = (_lockdown_connection *)v24;
        v25 = "Could not send message size: %{public}s";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

      }
    }
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (id)parseErrorFromResponse:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = kMCTPErrorObjectKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMCTPErrorObjectKey));
  if (v5)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v21 = objc_msgSend(objc_alloc((Class)NSArchiver), "initForWritingWithMutableData:", v6);
    objc_msgSend(v21, "encodeRootObject:", v5);
    v24 = v3;
    v22 = (void *)v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CommandErrorArchive"));
    v7 = objc_opt_new(NSMutableArray);
    v23 = v5;
    v8 = v5;
    v9 = kMDMPErrorChainLocalizedDescriptionKey;
    v10 = kMDMPErrorChainErrorDomainKey;
    v11 = kMDMPErrorChainUSEnglishDescriptionKey;
    v12 = kMDMPErrorChainErrorCodeKey;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v9);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v10);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "DMCUSEnglishDescription"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v11);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v12);

      -[NSMutableArray addObject:](v7, "addObject:", v13);
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", NSUnderlyingErrorKey));

      v8 = (id)v19;
    }
    while (v19);
    v3 = v24;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, kMDMPErrorChainKey);

    v5 = v23;
  }

  return v3;
}

- (void)executeNextCommand
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _lockdown_connection *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[4];
  _lockdown_connection *v17;

  v3 = *(NSObject **)DMCLogObjects(self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    v17 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Executing command from lockdown connection: %p", buf, 0xCu);

  }
  v5 = objc_claimAutoreleasedReturnValue(-[MMTConnection receiveMessage](self, "receiveMessage"));
  v6 = (void *)v5;
  if ((byte_100014BC0 & 1) != 0)
    goto LABEL_9;
  v5 = (uint64_t)+[DMCMobileGestalt isAppleTV](DMCMobileGestalt, "isAppleTV");
  if ((v5 & 1) != 0 || (v5 = DMIsMigrationNeeded(), !(_DWORD)v5))
  {
LABEL_8:
    byte_100014BC0 = 1;
LABEL_9:
    if (v6)
    {
      v8 = *(NSObject **)DMCLogObjects(v5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = v8;
        v10 = (_lockdown_connection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestType")));
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received request: %{public}@", buf, 0xCu);

      }
      v11 = objc_claimAutoreleasedReturnValue(-[MMTConnection parser](self, "parser"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MMTConnection powerAssertion](self, "powerAssertion"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006090;
      v14[3] = &unk_1000107C8;
      v14[4] = self;
      -[NSObject processRequest:assertion:completionBlock:](v11, "processRequest:assertion:completionBlock:", v6, v12, v14);

    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MMTConnectionManager sharedInstance](MMTConnectionManager, "sharedInstance"));
      -[NSObject removeConnection:](v11, "removeConnection:", self);
    }
    goto LABEL_14;
  }
  v7 = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)v7)
  {
    v5 = DMPerformMigrationIfNeeded();
    goto LABEL_8;
  }
  v13 = *(NSObject **)DMCLogObjects(v7);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Telling client to wait until preboard is finished.", buf, 2u);
  }
  -[MMTConnection sendMessage:](self, "sendMessage:", &off_1000113F0);
  v11 = objc_claimAutoreleasedReturnValue(-[MMTConnection workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006088;
  block[3] = &unk_1000107A0;
  block[4] = self;
  dispatch_async(v11, block);
LABEL_14:

}

- (_lockdown_connection)lockdownConnection
{
  return self->_lockdownConnection;
}

- (void)setLockdownConnection:(_lockdown_connection *)a3
{
  self->_lockdownConnection = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (MDMAbstractTunnelParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (DMCPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
