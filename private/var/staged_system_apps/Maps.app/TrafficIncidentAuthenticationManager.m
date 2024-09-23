@implementation TrafficIncidentAuthenticationManager

- (TrafficIncidentAuthenticationManager)init
{
  TrafficIncidentAuthenticationManager *v2;
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  TrafficIncidentAuthenticationManager *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentAuthenticationManager;
  v2 = -[TrafficIncidentAuthenticationManager init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    global_queue = dispatch_get_global_queue(2, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10081F4E0;
    v8[3] = &unk_1011AC8B0;
    v9 = v2;
    v10 = v3;
    v6 = v3;
    dispatch_async(v5, v8);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submissionManager"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentAuthenticationManager;
  -[TrafficIncidentAuthenticationManager dealloc](&v5, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_1014D3548 != -1)
    dispatch_once(&qword_1014D3548, &stru_1011CA178);
  return (id)qword_1014D3540;
}

- (void)generateAuthenticationInfoWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[TrafficIncidentAuthenticationManager isSupported](self, "isSupported"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("TrafficIncidentAuthenicationInfo")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("TrafficIncidentAuthenicationKeyId")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("TrafficIncidentAuthenicationAttested")));

    -[TrafficIncidentAuthenticationManager _incrementSubmissionCount](self, "_incrementSubmissionCount");
    v8 = -[TrafficIncidentAuthenticationManager _isUUIDValid](self, "_isUUIDValid");
    if (v5 && v6)
    {
      if (v7)
        v9 = 0;
      else
        v9 = v8;
      if (v9 == 1)
      {
        -[TrafficIncidentAuthenticationManager _attestKeyId:completionHandler:](self, "_attestKeyId:completionHandler:", v6, v11);
      }
      else if (!v7 || ((v8 ^ 1) & 1) != 0)
      {
        if ((v8 & 1) == 0)
          -[TrafficIncidentAuthenticationManager _rollOverKeyId:completionHandler:](self, "_rollOverKeyId:completionHandler:", v6, v11);
      }
      else
      {
        -[TrafficIncidentAuthenticationManager _generateAssertionKeyId:completionHandler:](self, "_generateAssertionKeyId:completionHandler:", v6, v11);
      }
    }
    else
    {
      -[TrafficIncidentAuthenticationManager _generateKey:](self, "_generateKey:", v11);
    }

    goto LABEL_13;
  }
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_13:
    v10 = v11;
  }

}

- (void)rolloverAnonymousId
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", 0, CFSTR("TrafficIncidentAuthenicationInfo"));

  -[TrafficIncidentAuthenticationManager _refreshStoredUUID](self, "_refreshStoredUUID");
}

- (void)_generateKey:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1004327DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _generateKey:", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DCAppAttestService sharedService](DCAppAttestService, "sharedService"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10081F898;
  v9[3] = &unk_1011CA1A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "generateKeyWithCompletionHandler:", v9);

}

- (void)_attestKeyId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  TrafficIncidentAuthenticationManager *v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = sub_1004327DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _attestKeyId:", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentAuthenticationManager _clientDataHash](self, "_clientDataHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DCAppAttestService sharedService](DCAppAttestService, "sharedService"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10081FB78;
  v14[3] = &unk_1011CA1C8;
  v16 = self;
  v17 = v7;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "attestKey:clientDataHash:completionHandler:", v12, v10, v14);

}

- (void)_generateAssertionKeyId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_1004327DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _generateAssertionKeyId:", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentAuthenticationManager _clientDataHash](self, "_clientDataHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DCAppAttestService sharedService](DCAppAttestService, "sharedService"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10081FF34;
  v13[3] = &unk_1011ACA58;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "generateAssertion:clientDataHash:completionHandler:", v7, v10, v13);

}

- (void)_rollOverKeyId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_1004327DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _rollOverKeyId:", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008201F4;
  v11[3] = &unk_1011CA1F0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[TrafficIncidentAuthenticationManager _generateAssertionKeyId:completionHandler:](self, "_generateAssertionKeyId:completionHandler:", v7, v11);

}

- (void)_refreshStoredUUID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("TrafficIncidentAuthenicationUUID"));
  objc_msgSend(v4, "setInteger:forKey:", 0, CFSTR("TrafficIncidentAuthenicationSubmissionCount"));
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("TrafficIncidentAuthenicationRolloverTimestamp"), CFAbsoluteTimeGetCurrent());
  v5 = sub_1004327DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: did refreshStoredUUID", v7, 2u);
  }

}

- (void)_incrementSubmissionCount
{
  id v2;
  char *v3;
  id v4;

  v2 = objc_alloc_init((Class)NSUserDefaults);
  v3 = (char *)objc_msgSend(v2, "integerForKey:", CFSTR("TrafficIncidentAuthenicationSubmissionCount"));

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", v3 + 1, CFSTR("TrafficIncidentAuthenicationSubmissionCount"));

}

- (id)_storedUUID
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)NSUserDefaults);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TrafficIncidentAuthenicationUUID")));

  return v3;
}

- (BOOL)_isUUIDValid
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double Current;
  BOOL v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TrafficIncidentAuthenicationUUID")));
  objc_msgSend(v2, "doubleForKey:", CFSTR("TrafficIncidentAuthenicationRolloverTimestamp"));
  v5 = v4;
  Current = CFAbsoluteTimeGetCurrent();
  if (v3)
  {
    if (Current - v5 >= GEOConfigGetDouble(MapsConfig_TrafficIncidentRolloverTTL, off_1014B3508))
    {
      v8 = objc_msgSend(v2, "integerForKey:", CFSTR("TrafficIncidentAuthenicationSubmissionCount"));
      v7 = (uint64_t)v8 <= GEOConfigGetUInteger(MapsConfig_TrafficIncidentAuthenticationSubmissionMaxCount, off_1014B3528);
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    objc_msgSend(v2, "integerForKey:", CFSTR("TrafficIncidentAuthenicationSubmissionCount"), Current);
    v7 = 0;
  }

  return v7;
}

- (id)_keyId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TrafficIncidentAuthenicationInfo")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TrafficIncidentAuthenicationKeyId")));

  return v4;
}

- (id)_clientDataHash
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  NSData *v6;
  id v7;
  id v8;
  CC_LONG v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentAuthenticationManager _storedUUID](self, "_storedUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
  v4 = objc_retainAutorelease(v2);
  v5 = (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 1);
  v6 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, strlen(v5));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v3);
  CC_SHA256(v8, v9, (unsigned __int8 *)objc_msgSend(v10, "mutableBytes"));

  return v10;
}

- (void)submissionDidFailAttestation
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004327DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: submissionDidFailAttestation", v6, 2u);
  }

  -[TrafficIncidentAuthenticationManager rolloverAnonymousId](self, "rolloverAnonymousId");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
  objc_msgSend(v5, "resubmitLastReport");

}

- (BOOL)isSupported
{
  return self->_supported;
}

@end
