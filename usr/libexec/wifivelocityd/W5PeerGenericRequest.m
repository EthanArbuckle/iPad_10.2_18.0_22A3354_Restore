@implementation W5PeerGenericRequest

- (W5PeerRequestPayload)requestPayload
{
  W5PeerGenericRequestPayload *v3;
  void *v4;

  v3 = objc_alloc_init(W5PeerGenericRequestPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequest requestInfo](self, "requestInfo"));
  -[W5PeerGenericRequestPayload setInfo:](v3, "setInfo:", v4);

  return (W5PeerRequestPayload *)v3;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    v16 = 136316162;
    v17 = "-[W5PeerGenericRequest handleResponse:]";
    v18 = 2080;
    v19 = "W5PeerGenericRequest.m";
    v20 = 1024;
    v21 = 27;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    v15 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) RECV RESPONSE (info=%{public}@, options=%{public}@)", &v16, v15);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequest responseHandler](self, "responseHandler"));

  if (v11)
  {
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequest responseHandler](self, "responseHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    ((void (**)(_QWORD, void *, void *, void *))v12)[2](v12, v5, v13, v14);

  }
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerGenericResponsePayload, a2);
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
