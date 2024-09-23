@implementation APServerRequester

- (APServerRequester)initWithBundleID:(id)a3 requestIdentifier:(id)a4 contextIdentifier:(id)a5 contentIdentifier:(id)a6 idAccount:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  APServerRequester *v17;
  APServerRequester *v18;
  APServerRequester *v19;
  void *v20;
  double v21;
  id v23;
  id v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v24 = a5;
  v23 = a6;
  v15 = a7;
  v16 = v15;
  v17 = 0;
  if (v13 && v14 && v15)
  {
    v25.receiver = self;
    v25.super_class = (Class)APServerRequester;
    v18 = -[APServerRequester init](&v25, "init", v23, v24);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_bundleID, a3);
      objc_storeStrong((id *)&v19->_requestIdentifier, a4);
      objc_storeStrong((id *)&v19->_contextIdentifier, a5);
      objc_storeStrong((id *)&v19->_contentIdentifier, a6);
      objc_storeStrong((id *)&v19->_idAccount, a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v20, "timeIntervalSince1970");
      v19->_timestamp = v21;

    }
    self = v19;
    v17 = self;
  }

  return v17;
}

- (void)makeRequest:(id)a3
{
  id v3;

  v3 = -[APServerRequester makeNetworkRequest:](self, "makeNetworkRequest:", a3);
}

- (BOOL)shouldSignRequestWithMessageId:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0xC00000Eu >> a3);
}

- (id)buildURLForRequestProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = objc_msgSend((id)objc_opt_class(a3), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageIndex")));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester _serverConfiguration](self, "_serverConfiguration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverURLForMessageID:andBundleID:", v7, v9));

      v11 = APPBAdsOptions();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("protocolVersion")));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URLSuffix")));
        if (v15)
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:", v15));
        else
          v16 = 0;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)adServerEnvironment
{
  return self->_adServerEnvironment;
}

- (id)_serverEnvironmentTranslation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __CFString *v11;
  void *v12;
  unsigned int v13;
  id *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v22;
  unsigned int v23;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", kAPServerEnvironmentProductionBaseURL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
  if (objc_msgSend(v4, "isEqual:", v6))
  {

LABEL_4:
    v11 = 0;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://news.iadsdk.apple.com/adserver/")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
    goto LABEL_4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v13 = objc_msgSend(v12, "containsString:", CFSTR("iad2v1"));

  if (v13)
  {
    v14 = (id *)&kAPServerEnvironmentQE1;
LABEL_13:
    v11 = (__CFString *)*v14;
    goto LABEL_14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v16 = objc_msgSend(v15, "containsString:", CFSTR("iad2v2"));

  if (v16)
  {
    v14 = (id *)&kAPServerEnvironmentQE2;
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v18 = objc_msgSend(v17, "containsString:", CFSTR("iad2v3"));

  if (v18)
  {
    v14 = (id *)&kAPServerEnvironmentQE3;
    goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v20 = objc_msgSend(v19, "containsString:", CFSTR("iad2v4"));

  if (v20)
  {
    v14 = (id *)&kAPServerEnvironmentQE4;
    goto LABEL_13;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v23 = objc_msgSend(v22, "containsString:", CFSTR("iad2v5"));

  if (v23)
    v11 = CFSTR("QE5");
  else
    v11 = CFSTR("custom");
LABEL_14:

  return v11;
}

- (id)_serverConfiguration
{
  if (qword_100269708 != -1)
    dispatch_once(&qword_100269708, &stru_100214500);
  return (id)qword_100269700;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)headers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 7));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.6f"), v5));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("timestamp"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("bundleID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceModel"));
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("device"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "osVersionAndBuild"));
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("os_Version"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storefront"));
  objc_msgSend(v6, "setValue:forKey:", v14, CFSTR("storefront"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storefront"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userAgentStringForBundleID:storefront:", v16, v18));
  objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("User-Agent"));

  objc_msgSend(v6, "setValue:forKey:", CFSTR("com.apple.ap.promotedcontentd"), CFSTR("Request-Source"));
  v20 = objc_msgSend(v6, "copy");

  return (NSDictionary *)v20;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (id)_deserializeResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(v6, "length") || !-[APServerRequester isAllowedEmptyResponse](self, "isAllowedEmptyResponse"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APProtobufSerialization deserializeProtobufferData:ofClass:error:](APProtobufSerialization, "deserializeProtobufferData:ofClass:error:", v6, -[APServerRequester responseClass](self, "responseClass"), a4));
    v7 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else if (a4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Deserializing protobuffer failed for request %@."), v10));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4501, v11));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)idsAsString
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_5;
  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = objc_msgSend(v4, "initWithSuiteName:", APDefaultsBundleID);
  if (!objc_msgSend(v5, "BOOLForKey:", kAPAutomationLoggingEnabled))
  {

LABEL_5:
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iTunesDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iAdID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "DPID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anonymousDemandID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toroID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceNewsPlusSubscriberID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DSID: %@\niAdID: %@\nDPID: %@\nContentID: %@\nAnonymousDemandID: %@\nToroID: %@\nDeviceNewsPlusSubscriberID: %@"), v5, v6, v8, v9, v10, v11, v12));

    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester _accountIDsDict](self, "_accountIDsDict"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsonString"));
LABEL_6:

  return v7;
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (void)_logResponse:(id)a3 responseProtobuf:(id)a4 requestProtobufClass:(Class)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  APServerRequester *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[3];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v13 = APLogForCategory(21);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
      v16 = objc_msgSend(v12, "code");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v71 = v15;
      v72 = 2048;
      v73 = v16;
      v74 = 2114;
      v75 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Received error for request %{public}@\nCode:%ld\nReason:%{public}@", buf, 0x20u);

    }
    v18 = APLogForCategory(21);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseBody"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedStringWithOptions:", 0));
      *(_DWORD *)buf = 138543362;
      v71 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Base64-encoded response is:\n%{public}@", buf, 0xCu);

    }
  }
  else if ((objc_msgSend(v10, "valid") & 1) != 0)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));

    if (v22)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
      -[NSObject setValue:forKey:](v19, "setValue:forKey:", v23, CFSTR("headers"));
    }
    else
    {
      v29 = APLogForCategory(21);
      v23 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Response headers were nil", buf, 2u);
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryRepresentation"));
    if (v30)
    {
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryRepresentation"));
      -[NSObject setValue:forKey:](v19, "setValue:forKey:", v31, CFSTR("body"));
    }
    else
    {
      v32 = APLogForCategory(21);
      v31 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Response body was nil", buf, 2u);
      }
    }

    v33 = APLogForCategory(21);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if (v11)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (objc_class *)objc_opt_class(v11);
        v37 = NSStringFromClass(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = NSStringFromClass(a5);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
        v64 = self;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester additionalRequestDescription](self, "additionalRequestDescription"));
        v67 = v10;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject jsonString](v19, "jsonString"));
        *(_DWORD *)buf = 138544899;
        v71 = v38;
        v72 = 2114;
        v73 = v40;
        v74 = 2114;
        v75 = v41;
        v76 = 2114;
        v77 = v42;
        v78 = 2114;
        v79 = v43;
        v80 = 2113;
        v81 = v44;
        v82 = 2113;
        v83 = v45;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Received %{public}@ from %{public}@ with identifiers {\"r\":%{public}@, \"ctx\":[%{public}@], \"cnt\":[%{public}@]} %{private}@:\n%{private}@", buf, 0x48u);

        v10 = v67;
        self = v64;

        v12 = 0;
      }
    }
    else if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseBody"));
      *(_DWORD *)buf = 138543619;
      v71 = v46;
      v72 = 2113;
      v73 = v47;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Response protobuf was nil for request: %{public}@ with response: %{private}@", buf, 0x16u);

    }
  }
  else
  {
    v24 = APLogForCategory(21);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
      *(_DWORD *)buf = 138543618;
      v71 = v26;
      v72 = 2048;
      v73 = objc_msgSend(v10, "responseStatusCode");
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Response not valid %{public}@\n status %ld", buf, 0x16u);

    }
    v27 = APLogForCategory(21);
    v19 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
      *(_DWORD *)buf = 138412290;
      v71 = v28;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "response headers %@", buf, 0xCu);

    }
  }

  v48 = objc_autoreleasePoolPush();
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& objc_opt_class(APTestHookSender))
  {
    v49 = objc_alloc_init((Class)APTestHookSender);
    v50 = objc_alloc((Class)APTestHookMetadata);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
    v62 = objc_msgSend(v50, "initWithHttpHeaders:", v51);

    v52 = objc_alloc((Class)APTestHookID);
    v68 = v10;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v66 = v12;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "UUIDString"));
    v53 = objc_msgSend(v52, "initWithID:ofType:", v63, 2);
    v69[0] = v53;
    v54 = objc_alloc((Class)APTestHookID);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v56 = objc_msgSend(v54, "initWithID:ofType:", v55, 1);
    v69[1] = v56;
    v57 = objc_alloc((Class)APTestHookID);
    v58 = v11;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v60 = objc_msgSend(v57, "initWithID:ofType:", v59, 0);
    v69[2] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 3));
    objc_msgSend(v49, "send:withMetadata:forIDs:", v58, v62, v61);

    v11 = v58;
    v12 = v66;

    v10 = v68;
  }
  objc_autoreleasePoolPop(v48);

}

- (void)_logRequestURL:(id)a3 headers:(id)a4 body:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  uint64_t v102;

  v83 = a3;
  v8 = a4;
  v9 = a5;
  v10 = APLogForCategory(21);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idsAsString](self, "idsAsString"));
    *(_DWORD *)buf = 138477827;
    v90 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "IDs for request:\n%{private}@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v14 = v13;
  if (v8)
  {
    objc_msgSend(v13, "setValue:forKey:", v8, CFSTR("headers"));
  }
  else
  {
    v15 = APLogForCategory(21);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Request headers were nil", buf, 2u);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));

  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));
    objc_msgSend(v14, "setValue:forKey:", v18, CFSTR("body"));
  }
  else
  {
    v19 = APLogForCategory(21);
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Request body was nil", buf, 2u);
    }
  }

  v20 = APLogForCategory(21);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class(v9);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester additionalRequestDescription](self, "additionalRequestDescription"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "jsonString"));
    v81 = v14;
    v30 = v9;
    v31 = v8;
    v32 = (void *)v29;
    *(_DWORD *)buf = 138544899;
    v90 = v24;
    v91 = 2113;
    v92 = v83;
    v93 = 2114;
    v94 = v25;
    v95 = 2114;
    v96 = v26;
    v97 = 2114;
    v98 = v27;
    v99 = 2113;
    v100 = v28;
    v101 = 2113;
    v102 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Making %{public}@ to %{private}@ with identifiers {\"r\":%{public}@, \"ctx\":[%{public}@], \"cnt\":[%{public}@]} %{private}@:\n%{private}@", buf, 0x48u);

    v8 = v31;
    v9 = v30;
    v14 = v81;

  }
  v33 = objc_autoreleasePoolPush();
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& objc_opt_class(APTestHookSender))
  {
    v79 = objc_alloc_init((Class)APTestHookSender);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester _accountIDsDict](self, "_accountIDsDict"));
    v77 = v33;
    v34 = objc_alloc((Class)APTestHookID);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
    v82 = v14;
    v37 = objc_msgSend(v34, "initWithID:ofType:", v36, 2);
    v88[0] = v37;
    v38 = objc_alloc((Class)APTestHookID);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v40 = objc_msgSend(v38, "initWithID:ofType:", v39, 1);
    v88[1] = v40;
    v78 = v8;
    v41 = objc_alloc((Class)APTestHookID);
    v80 = v9;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v43 = objc_msgSend(v41, "initWithID:ofType:", v42, 0);
    v88[2] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 3));
    objc_msgSend(v79, "send:ofType:withMetadata:forIDs:", v74, 1, 0, v44);

    v86[0] = &off_100229000;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v87[0] = v75;
    v86[1] = &off_100229018;
    v45 = objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v73 = (void *)v45;
    if (v45)
      v46 = (const __CFString *)v45;
    else
      v46 = &stru_100219118;
    v87[1] = v46;
    v86[2] = &off_100229030;
    v47 = objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v48 = (void *)v47;
    if (v47)
      v49 = (const __CFString *)v47;
    else
      v49 = &stru_100219118;
    v87[2] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 3));
    v51 = objc_alloc((Class)APTestHookID);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "UUIDString"));
    v53 = objc_msgSend(v51, "initWithID:ofType:", v52, 2);
    v85[0] = v53;
    v54 = objc_alloc((Class)APTestHookID);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v56 = objc_msgSend(v54, "initWithID:ofType:", v55, 1);
    v85[1] = v56;
    v57 = objc_alloc((Class)APTestHookID);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v59 = objc_msgSend(v57, "initWithID:ofType:", v58, 0);
    v85[2] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 3));
    objc_msgSend(v79, "send:ofType:withMetadata:forIDs:", v50, 0, 0, v60);

    v8 = v78;
    v61 = objc_msgSend(objc_alloc((Class)APTestHookMetadata), "initWithHttpHeaders:", v78);
    v62 = objc_alloc((Class)APTestHookID);
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "UUIDString"));
    v64 = objc_msgSend(v62, "initWithID:ofType:", v63, 2);
    v84[0] = v64;
    v65 = objc_alloc((Class)APTestHookID);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contentIdentifier](self, "contentIdentifier"));
    v67 = objc_msgSend(v65, "initWithID:ofType:", v66, 1);
    v84[1] = v67;
    v68 = objc_alloc((Class)APTestHookID);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester contextIdentifier](self, "contextIdentifier"));
    v70 = objc_msgSend(v68, "initWithID:ofType:", v69, 0);
    v84[2] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 3));
    objc_msgSend(v79, "send:withMetadata:forIDs:", v80, v61, v71);

    v9 = v80;
    v33 = v77;

    v14 = v82;
  }
  objc_autoreleasePoolPop(v33);

}

- (NSString)contextIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (id)additionalRequestDescription
{
  return &stru_100219118;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_adServerEnvironment, 0);
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (Class)responseClass
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (BOOL)isAllowedEmptyResponse
{
  return 0;
}

- (double)roundedTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[2];
  int v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "decimalValue");
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithDecimal:](NSDecimalNumber, "decimalNumberWithDecimal:", v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:](NSDecimalNumberHandler, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 3, 1, 0, 0, 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decimalNumberByRoundingAccordingToBehavior:", v5));

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (id)protoBuffer
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (id)makeNetworkRequest:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  _QWORD v40[4];
  void (**v41)(id, _QWORD, void *);
  id v42[3];
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[APServerRequester headers](self, "headers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester protoBuffer](self, "protoBuffer"));
  if (!v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.LegacyInterface"), 1001, 0));
    v4[2](v4, 0, v24);

LABEL_21:
    v28 = 0;
    goto LABEL_30;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));

  if (!v7)
  {
    v25 = APLogForCategory(21);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "BundleID cannot be nil, aborting the request.", buf, 2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.LegacyInterface"), 1003, 0));
    v4[2](v4, 0, v27);

    goto LABEL_21;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester buildURLForRequestProtobuf:](self, "buildURLForRequestProtobuf:", v6));
  if (v8)
  {
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[APServerRequester _serverEnvironmentTranslation:](self, "_serverEnvironmentTranslation:", v8));
      v10 = (void *)v9;
      if (v9)
      {
        v46 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
        -[APServerRequester setAdServerEnvironment:](self, "setAdServerEnvironment:", v11);

      }
      v12 = APLogForCategory(21);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester adServerEnvironment](self, "adServerEnvironment"));
        *(_DWORD *)buf = 138543362;
        v45 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Making request to ad server environment %{public}@", buf, 0xCu);

      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[APProtobufSerialization serializeProtobuffer:](APProtobufSerialization, "serializeProtobuffer:", v6));
    if (v15)
    {
      -[APServerRequester requestWillSend:headers:request:](self, "requestWillSend:headers:request:", v8, v5, v6);
      v16 = objc_msgSend((id)objc_opt_class(v6), "options");
      v39 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("messageIndex")));
      if (-[APServerRequester shouldSignRequestWithMessageId:](self, "shouldSignRequestWithMessageId:", objc_msgSend(v38, "integerValue")))
      {
        v17 = APLogForCategory(4);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "New signing service is not enabled, sign data using old service.", buf, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
        v43 = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "signatureForData:error:", v15, &v43));
        v21 = v43;

        if (!objc_msgSend(v20, "length") || v21)
        {
          v30 = APLogForCategory(21);
          v23 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v21;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to get a signature for LI server request: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v22 = -[NSObject mutableCopy](v5, "mutableCopy");
          -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v20, CFSTR("X-Apple-ActionSignature"));
          v23 = v5;
          v5 = v22;
        }

      }
      -[APServerRequester _logRequestURL:headers:body:](self, "_logRequestURL:headers:body:", v8, v5, v6);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v31, "timeIntervalSince1970");
      v33 = v32;

      v34 = (void *)objc_opt_class(v6);
      objc_initWeak((id *)buf, self);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[APNetworkClient sharedAPNetworkClient](APNetworkClient, "sharedAPNetworkClient"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000C5CEC;
      v40[3] = &unk_100214498;
      objc_copyWeak(v42, (id *)buf);
      v42[1] = v33;
      v42[2] = v34;
      v41 = v4;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "POST:client:headers:body:completionHandler:", v8, v36, v5, v15, v40));

      objc_destroyWeak(v42);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.LegacyInterface"), 1002, 0));
      v4[2](v4, 0, v39);
      v28 = 0;
    }

  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.LegacyInterface"), 1004, 0));
    v4[2](v4, 0, v29);

    v28 = 0;
  }

LABEL_30:
  return v28;
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  double v23;

  v8 = a4;
  v9 = a5;
  if (qword_1002696F8 != -1)
    dispatch_once(&qword_1002696F8, &stru_1002144B8);
  v10 = APLogForCategory(21);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    *(_DWORD *)buf = 138412546;
    v21 = v12;
    v22 = 2048;
    v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Delaying request with ID %@ for %.2f seconds.", buf, 0x16u);

  }
  v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v14 = qword_1002696F0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C60E4;
  block[3] = &unk_1002144E0;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  dispatch_after(v13, v14, block);

}

- (id)_accountIDsDict
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _QWORD v26[7];
  _QWORD v27[7];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v26[0] = CFSTR("DSID");
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iTunesDSID"));
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_100219118;
  v27[0] = v5;
  v26[1] = CFSTR("iAdID");
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iAdID"));
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_100219118;
  v27[1] = v8;
  v26[2] = CFSTR("DPID");
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "DPID"));
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_100219118;
  v27[2] = v11;
  v26[3] = CFSTR("ContentID");
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentID"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_100219118;
  v27[3] = v14;
  v26[4] = CFSTR("AnonymousDemandID");
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anonymousDemandID"));
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_100219118;
  v27[4] = v17;
  v26[5] = CFSTR("ToroID");
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "toroID"));
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_100219118;
  v27[5] = v20;
  v26[6] = CFSTR("DeviceNewsPlusSubscriberID");
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceNewsPlusSubscriberID"));
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_100219118;
  v27[6] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 7));

  return v24;
}

- (id)additionalResponseDescription
{
  return &stru_100219118;
}

- (void)cancelDelayedRequest
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = APLogForCategory(21);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancelling request with ID %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[APServerRequester setCancelled:](self, "setCancelled:", 1);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setAdServerEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_adServerEnvironment, a3);
}

- (void)setContextIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

@end
