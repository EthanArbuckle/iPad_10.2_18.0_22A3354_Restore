@implementation SDBonjourResolver

- (SDBonjourResolver)initWithName:(id)a3 type:(id)a4 domain:(id)a5 path:(id)a6 timeout:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SDBonjourResolver *v17;
  SDBonjourResolver *v18;
  NSString *hostName;
  NSNumber *portNumber;
  OS_dispatch_source *timer;
  NSURL *url;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SDBonjourResolver;
  v17 = -[SDBonjourResolver init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    v17->_connection = 0;
    objc_storeStrong((id *)&v17->_domain, a5);
    v18->_error = 0;
    hostName = v18->_hostName;
    v18->_hostName = 0;

    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v18->_path, a6);
    portNumber = v18->_portNumber;
    v18->_portNumber = 0;

    v18->_resolve = 0;
    v18->_timeout = a7;
    timer = v18->_timer;
    v18->_timer = 0;

    objc_storeStrong((id *)&v18->_type, a4);
    url = v18->_url;
    v18->_url = 0;

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[SDBonjourResolver cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)SDBonjourResolver;
  -[SDBonjourResolver dealloc](&v3, "dealloc");
}

- (void)notifyClient:(int)a3
{
  id WeakRetained;

  -[SDBonjourResolver cancel](self, "cancel");
  self->_error = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bonjourResolverDidChange:", self);

}

- (void)parseResults:(const char *)a3 port:(unsigned __int16)a4 txtLen:(unsigned __int16)a5 txtRecord:(const char *)a6 interface:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v10;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  NSString *hostName;
  NSNumber *v16;
  NSNumber *portNumber;
  const void *ValuePtr;
  const void *v19;
  id v20;
  NSString *v21;
  NSString *path;
  const void *v23;
  uint64_t v24;
  const void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSString *name;
  id v32;
  void *v33;
  void *v34;
  NSURL *v35;
  NSURL *url;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSString *v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  NSString *v52;
  __int16 v53;
  void *v54;

  v7 = *(_QWORD *)&a7;
  v10 = a4;
  v12 = CFStringCreateWithCString(0, a3, 0x8000100u);
  if (v12)
  {
    v13 = v12;
    v14 = sub_10019D12C(v12);
    hostName = self->_hostName;
    self->_hostName = &v14->isa;

    CFRelease(v13);
  }
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v10));
  portNumber = self->_portNumber;
  self->_portNumber = v16;

  if (!self->_path)
  {
    LOBYTE(v51) = 0;
    ValuePtr = TXTRecordGetValuePtr(a5, a6, "path", (uint8_t *)&v51);
    if (ValuePtr)
    {
      v19 = ValuePtr;
      v20 = objc_alloc((Class)NSString);
      v21 = (NSString *)objc_msgSend(v20, "initWithBytes:length:encoding:", v19, v51, 4);
      path = self->_path;
      self->_path = v21;

    }
  }
  v23 = sub_1000CF14C(self->_type);
  if (v23)
  {
    v25 = v23;
    v26 = CFEqual(v23, kSFNodeProtocolAirDrop);
    v27 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v28 = v27;
    if (!v26
      || (v27 = (uint64_t)objc_msgSend((id)v27, "browseAllInterfaces"), (v27 & 1) != 0)
      || (v27 = sub_10019D034(), (_DWORD)v27 == (_DWORD)v7))
    {
      v29 = airdrop_log(v27);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v32 = sub_10019AA4C(v7);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = v33;
        if (!v33)
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
        v51 = 138412546;
        v52 = name;
        v53 = 2112;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Bonjour resolved %@ over %@", (uint8_t *)&v51, 0x16u);
        if (!v33)

      }
      v35 = (NSURL *)sub_1000CDE00(v25, 0, 0, (__CFString *)self->_hostName, -[NSNumber intValue](self->_portNumber, "intValue"), (const __CFString *)self->_path, 0, 0);
      url = self->_url;
      self->_url = v35;

      -[SDBonjourResolver notifyClient:](self, "notifyClient:", 0);
    }
    else
    {
      v45 = airdrop_log(v27);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_name;
        v48 = sub_10019AA4C(v7);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v50 = v49;
        if (!v49)
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
        v51 = 138412546;
        v52 = v47;
        v53 = 2112;
        v54 = v50;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Ignoring Bonjour resolve of %@ over %@", (uint8_t *)&v51, 0x16u);
        if (!v49)

      }
    }
  }
  else
  {
    v37 = browser_log(0, v24);
    v28 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100213158(v28, v38, v39, v40, v41, v42, v43, v44);
  }

}

- (void)resolve
{
  _DNSServiceRef_t **p_connection;
  uint64_t Connection;
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
  const char *v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  DNSServiceFlags v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  OS_dispatch_source *v58;
  OS_dispatch_source *timer;
  NSObject *v60;
  dispatch_time_t v61;
  int v62;
  NSString *name;
  void *v64;
  const char *v65;
  _QWORD v66[5];
  uint8_t buf[4];
  NSString *v68;
  __int16 v69;
  __CFString *v70;

  p_connection = &self->_connection;
  if (self->_connection)
    return;
  Connection = DNSServiceCreateConnection(&self->_connection);
  if (!(_DWORD)Connection)
  {
    self->_resolve = self->_connection;
    v15 = -[NSString UTF8String](self->_name, "UTF8String");
    v16 = -[NSString UTF8String](self->_type, "UTF8String");
    v17 = -[NSString UTF8String](self->_domain, "UTF8String");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (-[NSString isEqual:](self->_type, "isEqual:", sub_1000CEC14()))
    {
      v19 = (uint64_t)objc_msgSend(v18, "enableDemoMode");
      v65 = v15;
      if ((v19 & 1) != 0)
      {
        v20 = 0;
        v21 = 0x4000;
      }
      else
      {
        v21 = 1064960;
        v19 = sub_10019D034();
        if ((_DWORD)v19)
        {
          v20 = v19;
        }
        else
        {
          v22 = airdrop_log(v19);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_100213250(v23, v24, v25, v26, v27, v28, v29, v30);

          v20 = 0;
        }
      }
      v31 = airdrop_log(v19);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v33 = sub_10019AA4C(v20);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)v34;
        v64 = v18;
        if (v34)
        {
          v62 = 0;
          v36 = (__CFString *)v34;
        }
        else if ((_DWORD)v20)
        {
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
          v62 = 1;
        }
        else
        {
          v62 = 0;
          v36 = CFSTR("all interfaces");
        }
        *(_DWORD *)buf = 138412546;
        v68 = name;
        v69 = 2112;
        v70 = v36;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Bonjour resolving %@ over %@", buf, 0x16u);
        if (v62)

        v18 = v64;
      }

      v15 = v65;
    }
    else
    {
      LODWORD(v20) = 0;
      v21 = 0x4000;
    }
    v37 = DNSServiceResolve(&self->_resolve, v21, v20, v15, v16, v17, (DNSServiceResolveReply)sub_100212F9C, self);
    if ((_DWORD)v37)
    {
      v39 = v37;
      v40 = browser_log(v37, v38);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_1002131EC(v39, v41, v42, v43, v44, v45, v46, v47);
    }
    else
    {
      v48 = DNSServiceSetDispatchQueue(*p_connection, (dispatch_queue_t)&_dispatch_main_q);
      if (!(_DWORD)v48)
      {
        if (self->_timeout)
        {
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_100212FCC;
          v66[3] = &unk_1007146D8;
          v66[4] = self;
          v57 = sub_10019AAD8(0, &_dispatch_main_q, v66);
          v58 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v57);
          timer = self->_timer;
          self->_timer = v58;

          v60 = self->_timer;
          v61 = sub_10019AAC0(15.0);
          sub_10019AB78(v60, v61);
          dispatch_resume((dispatch_object_t)self->_timer);
        }
        goto LABEL_32;
      }
      v39 = v48;
      v50 = browser_log(v48, v49);
      v41 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_100213188(v39, v41, v51, v52, v53, v54, v55, v56);
    }

    -[SDBonjourResolver notifyClient:](self, "notifyClient:", v39);
LABEL_32:

    return;
  }
  v6 = Connection;
  v7 = browser_log(Connection, v5);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100213280(v6, v8, v9, v10, v11, v12, v13, v14);

  -[SDBonjourResolver notifyClient:](self, "notifyClient:", v6);
}

- (void)cancel
{
  _DNSServiceRef_t *resolve;
  _DNSServiceRef_t *connection;
  NSObject *timer;
  OS_dispatch_source *v6;

  resolve = self->_resolve;
  if (resolve)
  {
    DNSServiceRefDeallocate(resolve);
    self->_resolve = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    DNSServiceRefDeallocate(connection);
    self->_connection = 0;
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v6 = self->_timer;
    self->_timer = 0;

  }
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)hostName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHostName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)portNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPortNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (_DNSServiceRef_t)service
{
  return self->_service;
}

- (int)error
{
  return self->_error;
}

- (SDBonjourResolverDelegate)delegate
{
  return (SDBonjourResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portNumber, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
