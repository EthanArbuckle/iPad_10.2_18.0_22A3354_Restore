@implementation APMetricHTTPDelivery

- (id)sendPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  if (-[APMetricHTTPDelivery _shouldReturnFakeResponse](self, "_shouldReturnFakeResponse"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "channel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery _serverURLForPurpose:](self, "_serverURLForPurpose:", v8));

    v10 = objc_msgSend(objc_alloc((Class)NSHTTPURLResponse), "initWithURL:statusCode:HTTPVersion:headerFields:", v9, 200, 0, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[APSigningAuthorityPoolManager sharedInstance](APSigningAuthorityPoolManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSigningAuthority"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "batchesData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "channel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "billing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery buildMetricDeliveryRequestFromData:toChannel:billing:signingAuthority:failIfSignatureIsNotAvailable:error:](self, "buildMetricDeliveryRequestFromData:toChannel:billing:signingAuthority:failIfSignatureIsNotAvailable:error:", v12, v13, v14, v9, 1, a4));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "batchInfos"));
    objc_msgSend(v15, "setBatchInfos:", v16);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fakeNetworkResponse"));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = +[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall");

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fakeNetworkResponse"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headers"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addFakeResponseHeadersToHeaders:", v21));
        objc_msgSend(v15, "setHeaders:", v22);

      }
    }
    if (v15)
      v10 = (id)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery sendHTTPDeliveryRequest:error:](self, "sendHTTPDeliveryRequest:error:", v15, a4));
    else
      v10 = 0;

  }
  return v10;
}

- (id)sendHTTPDeliveryRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  dispatch_time_t v29;
  intptr_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id *v40;
  id v41;
  void *v42;
  uint8_t v43[16];
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  uint8_t *v51;
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signature"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery _serverURLForPurpose:](self, "_serverURLForPurpose:", v9));

    v40 = a4;
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v11 = objc_alloc((Class)NSUserDefaults);
      v12 = objc_msgSend(v11, "initWithSuiteName:", APDefaultsBundleID);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", kAPServerEnvironmentKey));

    }
    else
    {
      v13 = 0;
    }
    v17 = (void *)kAPServerEnvironmentProduction;
    if (v13)
      v17 = v13;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[APNetworkClient sharedAPNetworkClient](APNetworkClient, "sharedAPNetworkClient"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "billing"));
    v42 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "temporarySessionForClient:", v20));

    *(_QWORD *)buf = 0;
    v53 = buf;
    v54 = 0x3032000000;
    v55 = sub_10002D3B0;
    v56 = sub_10002D368;
    v57 = 0;
    v22 = dispatch_group_create();
    dispatch_group_enter(v22);
    global_queue = dispatch_get_global_queue(9, 0);
    v24 = objc_claimAutoreleasedReturnValue(global_queue);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "batchInfos"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D710;
    block[3] = &unk_100215968;
    block[4] = self;
    v45 = v6;
    v26 = v25;
    v46 = v26;
    v41 = v21;
    v47 = v41;
    v15 = v10;
    v48 = v15;
    v27 = v18;
    v49 = v27;
    v51 = buf;
    v28 = v22;
    v50 = v28;
    dispatch_async(v24, block);
    v29 = dispatch_time(0, 120000000000);
    v30 = dispatch_group_wait(v28, v29);
    v31 = sub_100021B00();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    sub_100031038(v32, *((void **)v53 + 5), v30 != 0, v26);

    if (v30)
    {
      -[APMetricHTTPDelivery observeClientTimeout](self, "observeClientTimeout");
      v33 = APLogForCategory(29);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "We timed out waiting for the metric data to be sent to the server!", v43, 2u);
      }
      v16 = 0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v53 + 5), "URLResponse"));
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v53 + 5), "responseError"));
      v34 = v35;
      if (v40)
        *v40 = objc_retainAutorelease(v35);
      if (v16)
      {
        -[APMetricHTTPDelivery observerServerResponse:](self, "observerServerResponse:", objc_msgSend(v16, "statusCode"));
      }
      else if (v34)
      {
        -[APMetricHTTPDelivery observeClientError:](self, "observeClientError:", -[NSObject code](v34, "code"));
      }
      v36 = APLogForCategory(29);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Metric data was sent to the server!", v43, 2u);
      }

    }
    v38 = (void *)*((_QWORD *)v53 + 5);
    *((_QWORD *)v53 + 5) = 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = APLogForCategory(29);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Missing signature.", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (void)observerServerResponse:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  if ((unint64_t)(a3 - 200) <= 0x63)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    objc_msgSend(v5, "recordSuccess");

    return;
  }
  if ((unint64_t)(a3 - 400) > 0x63)
  {
    if ((unint64_t)(a3 - 500) > 0x63)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    v6 = v3;
    v4 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    v6 = v3;
    v4 = 0;
  }
  objc_msgSend(v3, "recordFailure:", v4);

}

- (APDeliveryObservability)o11y
{
  return self->_o11y;
}

- (APJourneySettings)journeySettings
{
  APJourneySettings *journeySettings;
  APJourneySettings *v4;
  APJourneySettings *v5;

  journeySettings = self->_journeySettings;
  if (!journeySettings)
  {
    v4 = (APJourneySettings *)objc_claimAutoreleasedReturnValue(+[APJourneySettings settings](APJourneySettings, "settings"));
    v5 = self->_journeySettings;
    self->_journeySettings = v4;

    journeySettings = self->_journeySettings;
  }
  return journeySettings;
}

- (_TtC7Metrics27APSigningObservabilityDiary)diary
{
  return self->_diary;
}

- (id)buildMetricDeliveryRequestFromData:(id)a3 toChannel:(id)a4 billing:(id)a5 signingAuthority:(id)a6 failIfSignatureIsNotAvailable:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  APMetricHTTPDeliveryRequest *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  char v36;
  const __CFString **v37;
  const __CFString **v38;
  uint64_t v39;
  void *v40;
  APMetricHTTPDeliveryRequest *v41;
  _QWORD v43[4];
  id v44;
  id v45;
  const __CFString *v46;
  const __CFString *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  NSErrorUserInfoKey v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;

  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(APMetricHTTPDeliveryRequest);
  -[APMetricHTTPDeliveryRequest setData:](v18, "setData:", v17);

  -[APMetricHTTPDeliveryRequest setBilling:](v18, "setBilling:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));

  -[APMetricHTTPDeliveryRequest setDestination:](v18, "setDestination:", v19);
  if (!v14)
  {
    v21 = 0;
LABEL_15:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery diary](self, "diary"));
    objc_msgSend(v31, "recordFailure");

    v20 = 0;
    if (v9)
      goto LABEL_9;
    goto LABEL_16;
  }
  v45 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest buildSignatureUsingSigningAuthority:error:](v18, "buildSignatureUsingSigningAuthority:error:", v14, &v45));
  v21 = v45;
  if (!v20)
    goto LABEL_15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery diary](self, "diary"));
  objc_msgSend(v22, "recordSuccess");

  v23 = objc_msgSend(v20, "length");
  if (v21)
    v24 = 1;
  else
    v24 = v23 == 0;
  if (v24 && v9)
  {
LABEL_9:
    v25 = APLogForCategory(29);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class(self);
      v28 = NSStringFromClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138478083;
      v53 = v29;
      v54 = 2114;
      v55 = v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to get a signature for Journey Server request: %{public}@", buf, 0x16u);

    }
    if (a8)
    {
      if (v21)
      {
        v50 = NSUnderlyingErrorKey;
        v51 = v21;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      }
      else
      {
        v30 = 0;
      }
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APMetricHTTPDeliveryDomain"), 8898, v30));

    }
    if (objc_msgSend(v14, "state") == (id)18001)
    {
      if (qword_100269A20 == -1)
      {
        v41 = 0;
        goto LABEL_33;
      }
      dispatch_once(&qword_100269A20, &stru_100215918);
    }
    else
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100125A74;
      v43[3] = &unk_100212FE0;
      v44 = v14;
      if (qword_100269A28 != -1)
        dispatch_once(&qword_100269A28, v43);

    }
    v41 = 0;
    goto LABEL_33;
  }
LABEL_16:
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v32 = objc_alloc((Class)NSUserDefaults);
    v33 = objc_msgSend(v32, "initWithSuiteName:", APDefaultsBundleID);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("APMetricDelivery.disableSigning")));
    v35 = objc_msgSend(v34, "BOOLValue");

    v36 = v35 ^ 1;
  }
  else
  {
    v36 = 1;
  }
  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")|| (v36 & 1) != 0)
  {
    v46 = CFSTR("Content-Type");
    v47 = CFSTR("application/json");
    v37 = &v47;
    v38 = &v46;
    v39 = 1;
  }
  else
  {
    v48[0] = CFSTR("Content-Type");
    v48[1] = CFSTR("X-Apple-BridgeTest");
    v49[0] = CFSTR("application/json");
    v49[1] = CFSTR("true");
    v37 = (const __CFString **)v49;
    v38 = (const __CFString **)v48;
    v39 = 2;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v38, v39));
  -[APMetricHTTPDeliveryRequest setHeaders:](v18, "setHeaders:", v40);
  v41 = v18;

LABEL_33:
  return v41;
}

- (BOOL)_shouldReturnFakeResponse
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  const __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isRunningTests");

  if (v3)
  {
    v4 = APLogForCategory(29);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = CFSTR("YES");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Metric data will not be sent running tests (%@)", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

- (id)_serverURLForPurpose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery journeySettings](self, "journeySettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ECRouter"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eCServerURL"));
  }
  else
  {
    v9 = APLogForCategory(29);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected destination (%@)", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_hashAndSavePayloadForInternalTesting:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;

  v5 = a3;
  v6 = a4;
  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_21;
  v7 = objc_alloc((Class)NSUserDefaults);
  v8 = objc_msgSend(v7, "initWithSuiteName:", APDefaultsBundleID);
  if (!objc_msgSend(v8, "BOOLForKey:", kAPAutomationLoggingEnabled))
  {

LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/tmp/com.apple.ap.promotedcontentd"), "stringByAppendingPathComponent:", CFSTR("EC")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sha256"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asHexString"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("sig")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v40 = 0;
  v16 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v40);
  v17 = v40;

  if ((v16 & 1) == 0)
  {
    v18 = APLogForCategory(29);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "error creating directory %{public}@", buf, 0xCu);

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = objc_msgSend(v21, "fileExistsAtPath:", v12);

  if ((v22 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v23, "createFileAtPath:contents:attributes:", v12, 0, 0);

  }
  v39 = v17;
  v24 = objc_msgSend(v5, "writeToFile:options:error:", v12, 1, &v39);
  v25 = v39;

  if ((v24 & 1) == 0)
  {
    v26 = APLogForCategory(29);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "error writing to payload to file %{public}@", buf, 0xCu);

    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v30 = objc_msgSend(v29, "fileExistsAtPath:", v14);

  if ((v30 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v31, "createFileAtPath:contents:attributes:", v14, 0, 0);

  }
  v38 = v25;
  v32 = objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v14, 1, 4, &v38);
  v33 = v38;

  if ((v32 & 1) == 0)
  {
    v34 = APLogForCategory(29);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v42 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "error writing to signature to file %{public}@", buf, 0xCu);

    }
  }

LABEL_22:
  return v11;
}

- (APMetricHTTPDelivery)init
{
  APMetricHTTPDelivery *v2;
  APDeliveryObservability *v3;
  APDeliveryObservabilityCoreAnalyticsTransmitter *v4;
  APDeliveryObservability *v5;
  APDeliveryObservability *o11y;
  _TtC7Metrics27APSigningObservabilityDiary *v7;
  _TtC7Metrics27APSigningObservabilityDiary *diary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APMetricHTTPDelivery;
  v2 = -[APMetricHTTPDelivery init](&v10, "init");
  if (v2)
  {
    v3 = [APDeliveryObservability alloc];
    v4 = objc_alloc_init(APDeliveryObservabilityCoreAnalyticsTransmitter);
    v5 = -[APDeliveryObservability initWithTransmitter:](v3, "initWithTransmitter:", v4);
    o11y = v2->_o11y;
    v2->_o11y = v5;

    v7 = objc_alloc_init(_TtC7Metrics27APSigningObservabilityDiary);
    diary = v2->_diary;
    v2->_diary = v7;

  }
  return v2;
}

- (void)observeClientError:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a3 == -1009)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    v5 = v3;
    v4 = 2;
  }
  else if (a3 == -1001)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    v5 = v3;
    v4 = 3;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
    v5 = v3;
    v4 = 4;
  }
  objc_msgSend(v3, "recordFailure:", v4);

}

- (void)observeClientTimeout
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDelivery o11y](self, "o11y"));
  objc_msgSend(v2, "recordFailure:", 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_o11y, 0);
  objc_storeStrong((id *)&self->_diary, 0);
  objc_storeStrong((id *)&self->_journeySettings, 0);
}

@end
