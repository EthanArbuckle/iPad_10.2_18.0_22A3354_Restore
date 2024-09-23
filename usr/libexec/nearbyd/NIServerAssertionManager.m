@implementation NIServerAssertionManager

- (NIServerAssertionManager)initWithClientPid:(int)a3 signingIdentity:(id)a4 sessionIdentifier:(id)a5
{
  id v10;
  id v11;
  void *v12;
  NIServerAssertionManager *v13;
  NIServerAssertionManager *v14;
  void *v15;
  NIServerAssertionManager *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAssertionManager.mm"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signingIdentity"));

    if (v12)
      goto LABEL_3;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAssertionManager.mm"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)NIServerAssertionManager;
  v13 = -[NIServerAssertionManager init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    v15 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = 0;

    *((_QWORD *)v14 + 2) = 0;
    *((_DWORD *)v14 + 22) = a3;
    objc_storeStrong((id *)v14 + 12, a4);
    objc_storeStrong((id *)v14 + 13, a5);
    v16 = v14;
  }

  return v14;
}

- (void)invalidate
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  objc_msgSend(*((id *)self + 1), "invalidate");
  v4 = (void *)*((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = 0;

  std::mutex::unlock(v3);
}

- (BOOL)acquireAssertionToSendMessageToClient
{
  std::mutex *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  void *v27;

  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NI assertion - send message to client (signing identity: %@, pid:%d, session identifier:%@)"), *((_QWORD *)self + 12), *((unsigned int *)self + 22), *((_QWORD *)self + 13)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.NearbyInteraction"), CFSTR("HandleMessage")));
  v27 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));

  v7 = sub_10000883C();
  if (v7 >= *((double *)self + 2) + 1.0)
  {
    objc_msgSend(*((id *)self + 1), "invalidate");
    v11 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = 0;

    v12 = objc_alloc((Class)RBSAssertion);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", *((unsigned int *)self + 22)));
    v14 = objc_msgSend(v12, "initWithExplanation:target:attributes:", v4, v13, v6);
    v15 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = v14;

    v16 = (void *)*((_QWORD *)self + 1);
    v20 = 0;
    v9 = objc_msgSend(v16, "acquireWithError:", &v20);
    v17 = v20;
    v18 = qword_10085F520;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2048;
        v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#ni-assertion,Acquired %@ at time %.3f", buf, 0x16u);
      }
      *((double *)self + 2) = v7;
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003D5E80((uint64_t)v4, (uint64_t)v17, v18);
    }

  }
  else
  {
    v8 = qword_10085F520;
    v9 = 1;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v10 = *((_QWORD *)self + 2);
      *(_DWORD *)buf = 138412802;
      v22 = v4;
      v23 = 2048;
      v24 = v7;
      v25 = 2048;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-assertion,Skip acquiring %@. Time now %.3f [s] too close to time of last assertion %.3f [s]", buf, 0x20u);
    }
  }

  std::mutex::unlock(v3);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
