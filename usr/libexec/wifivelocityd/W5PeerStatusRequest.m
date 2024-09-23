@implementation W5PeerStatusRequest

- (W5PeerStatusRequest)initWithPeer:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  W5PeerStatusRequest *v9;
  W5PeerStatusRequest *v10;
  id v11;
  id reply;
  NSString *identifier;
  W5PeerStatusRequestPayload *v14;
  W5PeerStatusRequestPayload *requestPayload;
  NSObject *v16;
  uint64_t v18;
  const char *v19;
  objc_super v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)W5PeerStatusRequest;
  v9 = -[W5PeerStatusRequest init](&v20, "init");
  v10 = v9;
  if (v7 && v9 && (objc_storeStrong((id *)&v9->_peer, a3), v8))
  {
    v11 = objc_retainBlock(v8);
    reply = v10->_reply;
    v10->_reply = v11;

    identifier = v10->_identifier;
    v10->_discoveryFlags = 1;
    v10->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.connectionState");

    v14 = objc_alloc_init(W5PeerStatusRequestPayload);
    requestPayload = v10->_requestPayload;
    v10->_requestPayload = v14;

    v16 = objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest _currentVersion](v10, "_currentVersion"));
    -[W5PeerStatusRequestPayload setVersion:](v10->_requestPayload, "setVersion:", v16);
  }
  else
  {

    v18 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[W5PeerStatusRequest initWithPeer:reply:]";
      v23 = 2080;
      v24 = "W5PeerStatusRequest.m";
      v25 = 1024;
      v26 = 48;
      LODWORD(v19) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v21, v19, LODWORD(v20.receiver));
    }
    v10 = 0;
  }

  return v10;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);
  }
  else
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerStatus"));
    v8 = objc_msgSend(v6, "status");
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8 == (id)1 && v7)
    {
      if (v11)
      {
        v18 = 136315906;
        v19 = "-[W5PeerStatusRequest handleResponse:]";
        v20 = 2080;
        v21 = "W5PeerStatusRequest.m";
        v22 = 1024;
        v23 = 62;
        v24 = 2114;
        v25 = v7;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) peer status='%{public}@'", &v18, 38);
      }

      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
      ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v7);
    }
    else
    {
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest peer](self, "peer"));
        v18 = 136315906;
        v19 = "-[W5PeerStatusRequest handleResponse:]";
        v20 = 2080;
        v21 = "W5PeerStatusRequest.m";
        v22 = 1024;
        v23 = 65;
        v24 = 2114;
        v25 = v13;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to retrieve status object from peer='%{public}@'", &v18, 38);

      }
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
      v16 = NSLocalizedFailureReasonErrorKey;
      v17 = CFSTR("W5PeerStatusResponseUndefinedError");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 15, v14));
      ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v15, 0);

    }
  }

}

- (id)_currentVersion
{
  return &off_1000E2E50;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerStatusResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (W5PeerStatusRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
  objc_storeStrong((id *)&self->_requestPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
