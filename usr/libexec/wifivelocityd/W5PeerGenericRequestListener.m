@implementation W5PeerGenericRequestListener

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  int v15;
  _QWORD v16[4];
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  if (v5)
  {
    v6 = sub_10008F56C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
      v18 = 136316162;
      v19 = "-[W5PeerGenericRequestListener handleClientRequest:]";
      v20 = 2080;
      v21 = "W5PeerGenericRequestListener.m";
      v22 = 1024;
      v23 = 21;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      v15 = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) RECV REQUEST (info=%{public}@, options=%{public}@)", &v18, v15);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestListener requestHandler](self, "requestHandler"));

    if (v10)
    {
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestListener requestHandler](self, "requestHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008BA54;
      v16[3] = &unk_1000D75C0;
      v17 = v4;
      ((void (**)(_QWORD, void *, void *, _QWORD *))v11)[2](v11, v12, v13, v16);

    }
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerGenericRequestPayload, a2);
}

- (void)invalidate
{
  -[W5PeerGenericRequestListener setRequestHandler:](self, "setRequestHandler:", 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)requestHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
