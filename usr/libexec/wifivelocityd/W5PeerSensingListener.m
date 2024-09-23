@implementation W5PeerSensingListener

- (W5PeerSensingListener)initWithInterface:(id)a3
{
  id v5;
  W5PeerSensingListener *v6;
  W5PeerSensingListener *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v11;
  objc_super v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)W5PeerSensingListener;
  v6 = -[W5PeerSensingListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_interface, a3), !v7->_interface))
  {

    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[W5PeerSensingListener initWithInterface:]";
      v15 = 2080;
      v16 = "W5PeerSensingListener.m";
      v17 = 1024;
      v18 = 35;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v13, v11, LODWORD(v12.receiver));
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  W5PeerSensingResponsePayload *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  NSObject *v24;
  const char *v26;
  int v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = objc_alloc_init(W5PeerSensingResponsePayload);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));

  if (v6)
  {
    v7 = objc_alloc_init((Class)CWFSensingParameters);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfReports")));
    objc_msgSend(v7, "setNumberOfReports:", (int)objc_msgSend(v9, "intValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("placeLabels")));
    objc_msgSend(v7, "setPlaceLabels:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("activityLabels")));
    objc_msgSend(v7, "setActivityLabels:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("submitMetric")));
    objc_msgSend(v7, "setSubmitMetric:", objc_msgSend(v15, "intValue") != 0);

    v16 = sub_10008F56C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      v29 = 136315906;
      v30 = "-[W5PeerSensingListener handleClientRequest:]";
      v31 = 2080;
      v32 = "W5PeerSensingListener.m";
      v33 = 1024;
      v34 = 58;
      v35 = 2114;
      v36 = v18;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Performing sensing with parameters='%{public}@'", &v29, 38);

    }
    v28 = 0;
    v19 = -[W5PeerSensingListener performSensing:error:](self, "performSensing:error:", v7, &v28);
    v20 = v28;
    -[W5PeerSensingResponsePayload setResult:](v5, "setResult:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));

    -[W5PeerSensingResponsePayload setErrorStr:](v5, "setErrorStr:", v21);
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    ((void (**)(_QWORD, W5PeerSensingResponsePayload *, _QWORD))v22)[2](v22, v5, 0);

  }
  else
  {
    v23 = sub_10008F56C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315650;
      v30 = "-[W5PeerSensingListener handleClientRequest:]";
      v31 = 2080;
      v32 = "W5PeerSensingListener.m";
      v33 = 1024;
      v34 = 45;
      LODWORD(v26) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) Incoming request for W5DeviceConnection to perform sensing, but options dictionary was empty", (const char *)&v29, v26, v27);
    }

    -[W5PeerSensingResponsePayload setResult:](v5, "setResult:", 0);
    -[W5PeerSensingResponsePayload setErrorStr:](v5, "setErrorStr:", CFSTR("empty request dictionary"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    (*((void (**)(id, W5PeerSensingResponsePayload *, _QWORD))v7 + 2))(v7, v5, 0);
  }

  return v6 != 0;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.performSensing");
}

- (Class)requestPayloadClass
{
  return 0;
}

- (BOOL)performSensing:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v6 = a3;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingListener interface](self, "interface"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "networkName"));
    v15 = 136315906;
    v16 = "-[W5PeerSensingListener performSensing:error:]";
    v17 = 2080;
    v18 = "W5PeerSensingListener.m";
    v19 = 1024;
    v20 = 85;
    v21 = 2114;
    v22 = v10;
    v14 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) corewifi perform sensing for network='%{public}@'", &v15, v14);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingListener interface](self, "interface"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "performSensingWithParameters:error:", v6, a4));

  return v12 != 0;
}

- (id)_responseDictionaryWithSuccess:(BOOL)a3 errorString:(id)a4
{
  _BOOL8 v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a3;
  v5 = (__CFString *)a4;
  if (v5)
    v6 = 1;
  else
    v6 = v4;
  if (v6)
    v7 = v5;
  else
    v7 = CFSTR("unknown error");
  v12[0] = CFSTR("result");
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v12[1] = CFSTR("error");
  v13[0] = v9;
  v13[1] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  return v10;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
