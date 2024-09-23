@implementation W5PeerSnifferListener

- (W5PeerSnifferListener)initWithInterface:(id)a3 snifferManager:(id)a4
{
  id v7;
  id v8;
  W5PeerSnifferListener *v9;
  W5PeerSnifferListener *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v14;
  objc_super v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)W5PeerSnifferListener;
  v9 = -[W5PeerSnifferListener init](&v15, "init");
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_snifferManager, a4), !v10->_snifferManager))
  {

    v11 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = "-[W5PeerSnifferListener initWithInterface:snifferManager:]";
      v18 = 2080;
      v19 = "W5PeerSnifferListener.m";
      v20 = 1024;
      v21 = 43;
      LODWORD(v14) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v16, v14, LODWORD(v15.receiver));
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  W5PeerSnifferResponsePayload *v8;
  id v9;
  char *v10;
  double v11;
  double v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = objc_alloc_init(W5PeerSnifferResponsePayload);
  -[W5PeerSnifferResponsePayload setVersion:](v8, "setVersion:", &off_1000E2DD8);
  if (v7 == (id)1)
  {
    v9 = objc_msgSend(v5, "type");
    v10 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "channels"));
    objc_msgSend(v5, "duration");
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
    if (v9 == (id)2)
    {
      v20 = sub_10008F56C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138543362;
        v29 = v13;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] Request received to cancel sniffer with UUID: %{public}@", &v28, 12);
      }

      -[W5PeerSnifferListener stopSnifferWithUUID:interface:](self, "stopSnifferWithUUID:interface:", v13, self->_interface);
      -[W5PeerSnifferResponsePayload setStatus:](v8, "setStatus:", 1);
    }
    else if (v9 == (id)1 && v10)
    {
      v14 = sub_10008F56C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138543362;
        v29 = v10;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] Request received to run sniffer on channels: %{public}@", &v28, 12);
      }

      if (!v13)
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v16 = sub_10008F56C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138543362;
          v29 = v13;
          LODWORD(v27) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] Generating uuid for sniffer invocation %{public}@", &v28, v27);
        }

      }
      v18 = objc_msgSend(v5, "noAutoStop");
      if ((_DWORD)v18)
        v19 = objc_msgSend(v5, "rotationInterval");
      else
        v19 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:](self, "_runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:", v10, self->_interface, v18, v19, v13, v12));
      -[W5PeerSnifferResponsePayload setStatus:](v8, "setStatus:", 1);
      -[W5PeerSnifferResponsePayload setFilePaths:](v8, "setFilePaths:", v22);
      -[W5PeerSnifferResponsePayload setUuid:](v8, "setUuid:", v13);
      v23 = sub_10008F56C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 136316162;
        v29 = "-[W5PeerSnifferListener handleClientRequest:]";
        v30 = 2080;
        v31 = "W5PeerSnifferListener.m";
        v32 = 1024;
        v33 = 83;
        v34 = 2114;
        v35 = v13;
        v36 = 2114;
        v37 = v22;
        LODWORD(v27) = 48;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) For Sniffer Request, replied with UUID: %{public}@, paths: %{public}@", &v28, v27);
      }

    }
  }
  v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
  ((void (**)(_QWORD, W5PeerSnifferResponsePayload *, _QWORD))v25)[2](v25, v8, 0);

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerSnifferRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.runSniffer");
}

- (id)_runSnifferOnChannels:(id)a3 interface:(id)a4 duration:(double)a5 noAutoStop:(BOOL)a6 rotationInternal:(int64_t)a7 uuid:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  W5PeerSnifferListener *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t *v27;
  double v28;
  int64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_1000130B0;
  v39[4] = sub_1000130C0;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1000130B0;
  v35 = sub_1000130C0;
  v36 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000130C8;
  v21[3] = &unk_1000D54B0;
  v30 = a6;
  v17 = v16;
  v22 = v17;
  v28 = a5;
  v29 = a7;
  v18 = v15;
  v25 = v37;
  v26 = v39;
  v23 = v18;
  v24 = self;
  v27 = &v31;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);
  v19 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

- (void)stopSnifferWithUUID:(id)a3 interface:(id)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  W5WiFiSniffManager *snifferManager;
  char *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  id v18;
  _QWORD v19[4];
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  id v32;

  v6 = (char *)a3;
  v7 = a4;
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v6;
    v17 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] Stopping Sniffer Request with UUID: %{public}@", &v21, v17);
  }

  snifferManager = self->_snifferManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013934;
  v19[3] = &unk_1000D54D8;
  v11 = v6;
  v20 = v11;
  -[W5WiFiSniffManager cancelRequestWithUUID:reply:](snifferManager, "cancelRequestWithUUID:reply:", v11, v19);
  v18 = 0;
  objc_msgSend(v7, "setUserAutoJoinDisabled:error:", 0, &v18);
  v12 = v18;
  v13 = sub_10008F56C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v7, "userAutoJoinDisabled");
    v21 = 136316418;
    v22 = "-[W5PeerSnifferListener stopSnifferWithUUID:interface:]";
    v23 = 2080;
    v24 = "W5PeerSnifferListener.m";
    v25 = 1024;
    v26 = 176;
    v27 = 1024;
    v28 = 0;
    v29 = 1024;
    v30 = v15;
    v31 = 2114;
    v32 = v12;
    LODWORD(v16) = 50;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Setting User Auto Join Disabled: %d, status: %d, error: %{public}@", &v21, v16);
  }

}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
  objc_storeStrong((id *)&self->_snifferManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snifferManager, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
