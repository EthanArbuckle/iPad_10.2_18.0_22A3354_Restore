@implementation W5PeerStatusListener

- (W5PeerStatusListener)initWithInterface:(id)a3 statusManager:(id)a4
{
  id v7;
  id v8;
  W5PeerStatusListener *v9;
  W5PeerStatusListener *v10;
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
  v15.super_class = (Class)W5PeerStatusListener;
  v9 = -[W5PeerStatusListener init](&v15, "init");
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_statusManager, a4), !v10->_statusManager))
  {

    v11 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = "-[W5PeerStatusListener initWithInterface:statusManager:]";
      v18 = 2080;
      v19 = "W5PeerStatusListener.m";
      v20 = 1024;
      v21 = 42;
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
  void *v7;
  uint64_t v8;
  NSObject *v9;
  W5PeerStatusResponsePayload *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136316418;
      v19 = "-[W5PeerStatusListener handleClientRequest:]";
      v20 = 2080;
      v21 = "W5PeerStatusListener.m";
      v22 = 1024;
      v23 = 53;
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'", &v18, 58);
    }

    v10 = objc_alloc_init(W5PeerStatusResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerStatusListener currentVersion](self, "currentVersion")));
    -[W5PeerStatusResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerStatusResponsePayload setStatus:](v10, "setStatus:", 1);
    if (objc_msgSend(v7, "integerValue") == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener statusManager](self, "statusManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "status"));
      -[W5PeerStatusResponsePayload setPeerStatus:](v10, "setPeerStatus:", v13);

    }
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    ((void (**)(_QWORD, W5PeerStatusResponsePayload *, _QWORD))v14)[2](v14, v10, 0);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener _connectionInfo](self, "_connectionInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[W5PeerSimpleResponsePayload payloadFromDictionary:](W5PeerSimpleResponsePayload, "payloadFromDictionary:", v15));

    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v7, 0);

  }
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerStatusRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.connectionState");
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_connectionInfo
{
  void *v3;
  void *v4;
  CWFInterface *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  _QWORD v43[20];
  _QWORD v44[20];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener statusManager](self, "statusManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkStatus"));

  v5 = self->_interface;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv4Addresses"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv4Addresses"));
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));

    }
    else
    {
      v42 = &stru_1000D8750;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv4Router"));

    if (v9)
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv4Router"));
    else
      v41 = &stru_1000D8750;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv6Addresses"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv6Addresses"));
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));

    }
    else
    {
      v40 = &stru_1000D8750;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv6Router"));

    if (v13)
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIPv6Router"));
    else
      v39 = &stru_1000D8750;
    v34 = (objc_msgSend(v4, "isAppleReachable") & 2) != 0
       && (objc_msgSend(v4, "isAppleReachable") & 4) == 0;
    v43[0] = CFSTR("networkName");
    v14 = objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](v5, "networkName"));
    if (v14)
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](v5, "networkName"));
    else
      v15 = &stru_1000D8750;
    v33 = (__CFString *)v15;
    v44[0] = v15;
    v43[1] = CFSTR("bssid");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface BSSID](v5, "BSSID"));
    v38 = (void *)v14;
    v35 = v4;
    if (v37)
      v16 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface BSSID](v5, "BSSID"));
    else
      v16 = CFSTR("00:00:00:00:00:00");
    v32 = (__CFString *)v16;
    v44[1] = v16;
    v44[2] = &stru_1000D8750;
    v43[2] = CFSTR("operatingBand");
    v43[3] = CFSTR("rssi");
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CWFInterface RSSI](v5, "RSSI")));
    v18 = (void *)v17;
    if (v17)
      v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CWFInterface RSSI](v5, "RSSI")));
    v31 = (void *)v17;
    v44[3] = v17;
    v43[4] = CFSTR("cca");
    v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CWFInterface CCA](v5, "CCA")));
    v20 = (void *)v19;
    v36 = v18;
    if (v19)
      v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CWFInterface CCA](v5, "CCA")));
    v30 = (void *)v19;
    v44[4] = v19;
    v43[5] = CFSTR("channel");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "channel")));
    v44[5] = v22;
    v43[6] = CFSTR("channelWidth");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v23, "width")));
    v44[6] = v24;
    v43[7] = CFSTR("txRate");
    -[CWFInterface txRate](v5, "txRate");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v44[7] = v25;
    v43[8] = CFSTR("rxRate");
    -[CWFInterface rxRate](v5, "rxRate");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v44[8] = v26;
    v44[9] = &off_1000E8968;
    v43[9] = CFSTR("txFail");
    v43[10] = CFSTR("txFrames");
    v44[10] = &off_1000E8968;
    v44[11] = &off_1000E8968;
    v43[11] = CFSTR("packetLoss");
    v43[12] = CFSTR("ipv4Address");
    v44[12] = v42;
    v43[13] = CFSTR("ipv4Gateway");
    v43[14] = CFSTR("ipv6Address");
    v44[13] = v41;
    v44[14] = v40;
    v44[15] = v39;
    v43[15] = CFSTR("ipv6Gateway");
    v43[16] = CFSTR("knownNetwork");
    v44[16] = &off_1000E3AB0;
    v44[17] = &off_1000E3AC8;
    v43[17] = CFSTR("securityType");
    v43[18] = CFSTR("internetConnected");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v34));
    v43[19] = CFSTR("speed");
    v44[18] = v27;
    v44[19] = &stru_1000D8750;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 20));

    if (v20)
    if (v36)

    if (v37)
    v4 = v35;
    if (v38)

  }
  else
  {
    v28 = &__NSDictionary0__struct;
    v40 = &stru_1000D8750;
    v41 = &stru_1000D8750;
    v42 = &stru_1000D8750;
    v39 = &stru_1000D8750;
  }

  return v28;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (W5StatusManager)statusManager
{
  return self->_statusManager;
}

- (void)setStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
