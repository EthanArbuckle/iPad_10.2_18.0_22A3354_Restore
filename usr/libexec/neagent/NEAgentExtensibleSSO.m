@implementation NEAgentExtensibleSSO

- (NSArray)uuids
{
  pid_t v2;
  void *v3;
  id v4;
  id v6;
  _OWORD buffer[3];
  uint64_t v8;

  v8 = 0;
  memset(buffer, 0, sizeof(buffer));
  v2 = getpid();
  v3 = 0;
  if (proc_pidinfo(v2, 17, 1uLL, buffer, 56) == 56)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buffer);
    v6 = v4;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  }
  return (NSArray *)v3;
}

- (NEAgentExtensibleSSO)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v10;
  id v11;
  id v12;
  NEAgentExtensibleSSO *v13;
  NSObject *v14;
  NSURL *v15;
  NSURL *extensibleSSOURL;
  SOAuthorization *v17;
  SOAuthorization *authorization;
  NEAgentExtensibleSSO *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  NSObject *v26;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  if (!objc_opt_class(SOAuthorization))
  {
    v20 = ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "SOAuthorization is not available, cannot use extensible SSO", buf, 2u);
    }
    goto LABEL_11;
  }
  v24.receiver = self;
  v24.super_class = (Class)NEAgentExtensibleSSO;
  v13 = -[NEAgentExtensibleSSO init](&v24, "init");
  self = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_managerObjectFactory, v12);
    objc_storeStrong((id *)&self->_queue, a6);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("plugin-path")));
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
    extensibleSSOURL = self->_extensibleSSOURL;
    self->_extensibleSSOURL = v15;

    if (self->_extensibleSSOURL)
    {
      v17 = (SOAuthorization *)objc_alloc_init((Class)SOAuthorization);
      authorization = self->_authorization;
      self->_authorization = v17;

      -[SOAuthorization setDelegate:](self->_authorization, "setDelegate:", self);
      -[SOAuthorization setDelegateDispatchQueue:](self->_authorization, "setDelegateDispatchQueue:", self->_queue);
      -[SOAuthorization setEnableUserInteraction:](self->_authorization, "setEnableUserInteraction:", 0);

      goto LABEL_5;
    }
    v21 = ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NSURL URLWithString failed for extensible SSO %@", buf, 0xCu);
    }

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  self = self;
  v19 = self;
LABEL_12:

  return v19;
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  const char *v4;
  id Property;
  void (**v6)(id, id);

  v6 = (void (**)(id, id))a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v6[2](v6, +[SOAuthorization canPerformAuthorizationWithURL:responseCode:useInternalExtensions:](SOAuthorization, "canPerformAuthorizationWithURL:responseCode:useInternalExtensions:", Property, 0, 0));

}

- (NSXPCInterface)managerInterface
{
  if (qword_10000E1F0 != -1)
    dispatch_once(&qword_10000E1F0, &stru_100008370);
  return (NSXPCInterface *)(id)qword_10000E1E8;
}

- (NSXPCInterface)driverInterface
{
  if (qword_10000E200 != -1)
    dispatch_once(&qword_10000E200, &stru_100008390);
  return (NSXPCInterface *)(id)qword_10000E1F8;
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C40;
  block[3] = &unk_1000083B8;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(Property, block);

}

- (void)sleepWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)attachIPCWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  id Property;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[8];
  _QWORD v27[3];
  _QWORD v28[3];

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 40, 1);
  else
    Property = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "VPN"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protocol"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverAddress"));

  if (v12
    || (!self ? (v14 = 0) : (v14 = objc_getProperty(self, v13, 40, 1)),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appVPN")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "protocol")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serverAddress")),
        v16,
        v15,
        v12))
  {
    v27[0] = CFSTR("X-SSO-Net-Authorization-Type");
    v27[1] = CFSTR("X-SSO-Net-Authorization");
    v28[0] = CFSTR("IKEv2");
    v28[1] = CFSTR("Certificate");
    v27[2] = CFSTR("X-SSO-Net-Resource");
    v28[2] = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    if (self)
      v19 = objc_getProperty(self, v17, 24, 1);
    else
      v19 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002B70;
    block[3] = &unk_1000083B8;
    block[4] = self;
    v24 = v18;
    v25 = v8;
    v20 = v18;
    dispatch_async(v19, block);

  }
  else
  {
    v21 = ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Configuration is missing a server address, cannot use extensible SSO", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

- (void)authorizationDidNotHandle:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = ne_log_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "VPN Authorization not handled", v6, 2u);
  }

  sub_100002AF4(self, 0, 0);
}

- (void)authorizationDidCancel:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = ne_log_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "VPN Authorization canceled", v6, 2u);
  }

  sub_100002AF4(self, (const char *)2, 0);
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v5 = a4;
  v8 = ne_log_obj(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "VPN Authorization completed with error %@", (uint8_t *)&v10, 0xCu);
  }

  sub_100002AF4(self, 0, 0);
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v20[8];
  const __CFString *v21;
  id v22;

  v7 = a5;
  v8 = a4;
  v11 = ne_log_obj(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "VPN Authorization completed", v20, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForHTTPHeaderField:", CFSTR("X-SSO-Net-Credentials")));
  if (v7 && v13 && (v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("IdentityPersistentReference")), (_DWORD)v14))
  {
    v21 = CFSTR("extensible-sso-credential-certificate");
    v22 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    sub_100002AF4(self, (const char *)1, (uint64_t)v17);

  }
  else
  {
    v18 = ne_log_obj(v14, v15, v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "VPN Authorization failed with bad HTTP response", v20, 2u);
    }

    sub_100002AF4(self, 0, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_extensibleSSOURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

@end
