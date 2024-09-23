@implementation W5PeerDatabaseRequest

- (W5PeerDatabaseRequest)initWithPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  W5PeerDatabaseRequest *v12;
  W5PeerDatabaseRequest *v13;
  id v14;
  id reply;
  NSString *identifier;
  W5PeerDatabaseRequestPayload *v17;
  W5PeerDatabaseRequestPayload *requestPayload;
  void *v19;
  uint64_t v21;
  NSObject *v22;
  objc_super v23;
  int v24;
  const char *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)W5PeerDatabaseRequest;
  v12 = -[W5PeerDatabaseRequest init](&v23, "init");
  v13 = v12;
  if (v9 && v12 && (objc_storeStrong((id *)&v12->_peer, a3), v10) && (objc_storeStrong((id *)&v13->_fetch, a4), v11))
  {
    v14 = objc_retainBlock(v11);
    reply = v13->_reply;
    v13->_reply = v14;

    identifier = v13->_identifier;
    v13->_discoveryFlags = 1;
    v13->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.dbQuery");

    v17 = objc_alloc_init(W5PeerDatabaseRequestPayload);
    requestPayload = v13->_requestPayload;
    v13->_requestPayload = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest _currentVersion](v13, "_currentVersion"));
    -[W5PeerDatabaseRequestPayload setVersion:](v13->_requestPayload, "setVersion:", v19);

    -[W5PeerDatabaseRequestPayload setFetchRequest:](v13->_requestPayload, "setFetchRequest:", v13->_fetch);
  }
  else
  {

    v21 = sub_10008F56C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315138;
      v25 = "-[W5PeerDatabaseRequest initWithPeer:fetch:reply:]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s: init error!", (const char *)&v24);
    }

    v13 = 0;
  }

  return v13;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (!v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchedResults"));
    if (objc_msgSend(v6, "status") == (id)1)
    {
      v8 = sub_10008F56C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v10)
        {
          v24 = 136316162;
          v25 = "-[W5PeerDatabaseRequest handleResponse:]";
          v26 = 2080;
          v27 = "W5PeerDatabaseRequest.m";
          v28 = 1024;
          v29 = 69;
          v30 = 2080;
          v31 = "-[W5PeerDatabaseRequest handleResponse:]";
          v32 = 2048;
          v33 = objc_msgSend(v7, "count");
          LODWORD(v19) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) %s: peer fetched results count=%lu", (const char *)&v24, v19, (_DWORD)v20, (const char *)v21, v22);
        }

        v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
        ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v7);
        goto LABEL_15;
      }
      if (v10)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
        v24 = 136316162;
        v25 = "-[W5PeerDatabaseRequest handleResponse:]";
        v26 = 2080;
        v27 = "W5PeerDatabaseRequest.m";
        v28 = 1024;
        v29 = 72;
        v30 = 2080;
        v31 = "-[W5PeerDatabaseRequest handleResponse:]";
        v32 = 2112;
        v33 = v17;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) %s: peer fetch ok, but no results peer='%@'", &v24, 48);

      }
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
      v22 = NSLocalizedFailureReasonErrorKey;
      v23 = CFSTR("W5NoErr");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v16 = 0;
    }
    else
    {
      v12 = sub_10008F56C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
        v24 = 136316162;
        v25 = "-[W5PeerDatabaseRequest handleResponse:]";
        v26 = 2080;
        v27 = "W5PeerDatabaseRequest.m";
        v28 = 1024;
        v29 = 76;
        v30 = 2080;
        v31 = "-[W5PeerDatabaseRequest handleResponse:]";
        v32 = 2112;
        v33 = v14;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) %s: failed to retrieve status object from peer='%@'", &v24, 48);

      }
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
      v20 = NSLocalizedFailureReasonErrorKey;
      v21 = CFSTR("W5PeerDatabaseResponseUndefinedError");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v16 = 14;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), v16, v15));
    ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v18, 0);

LABEL_15:
    goto LABEL_16;
  }
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);
LABEL_16:

}

- (id)_currentVersion
{
  return &off_1000E2E08;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerDatabaseResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (NSFetchRequest)fetch
{
  return self->_fetch;
}

- (void)setFetch:(id)a3
{
  objc_storeStrong((id *)&self->_fetch, a3);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (W5PeerDatabaseRequestPayload)requestPayload
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
  objc_storeStrong((id *)&self->_fetch, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
