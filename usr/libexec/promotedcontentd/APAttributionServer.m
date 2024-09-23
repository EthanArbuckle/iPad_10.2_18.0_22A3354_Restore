@implementation APAttributionServer

+ (BOOL)sendRequestToServer:(id)a3 requestTimestamp:(id)a4 payloadDeliveryTimestamp:(id)a5 interval:(unint64_t)a6 error:(id *)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  unint64_t v47;
  id v48;
  NSErrorUserInfoKey v49;
  const __CFString *v50;
  uint8_t buf[4];
  unint64_t v52;
  NSErrorUserInfoKey v53;
  const __CFString *v54;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "requestBody"));

  if (v17)
  {
    v40 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "requestBody"));
    v48 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v18, 0, &v48));
    v20 = v48;

    v21 = v19 != 0;
    if (v19)
    {
      v22 = APPerfLogForCategory(4);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = v23;
      if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 134349056;
        v52 = a6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, a6, "Server Delivery Queue overhead", "id=%{public, name=id}lld", buf, 0xCu);
      }

      global_queue = dispatch_get_global_queue(25, 0);
      v26 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000957DC;
      block[3] = &unk_1002132E0;
      v47 = a6;
      v42 = v15;
      v43 = v13;
      v14 = v40;
      v44 = v40;
      v45 = v19;
      v46 = v16;
      dispatch_async(v26, block);

      v27 = v42;
    }
    else
    {
      v33 = APLogForCategory(4);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "requestBody"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "jsonString"));
        *(_DWORD *)buf = 138477827;
        v52 = (unint64_t)v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Unable to serialize body %{private}@", buf, 0xCu);

      }
      if (a7)
      {
        v49 = NSLocalizedDescriptionKey;
        v50 = CFSTR("Unable to serialize body");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v37));

        v20 = objc_retainAutorelease(v38);
        *a7 = v20;
      }
      v14 = v40;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "payloadForRequestBodyABCLog"));
      CreateDiagnosticReport(CFSTR("Send Request: Malformed request Body"), v27, CFSTR("Attributtion"));
    }

  }
  else
  {
    v28 = APLogForCategory(4);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Malformed request body", buf, 2u);
    }

    if (a7)
    {
      v53 = NSLocalizedDescriptionKey;
      v54 = CFSTR("Malformed request body");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v30));

      v32 = objc_retainAutorelease(v31);
      *a7 = v32;

    }
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "payloadForRequestBodyABCLog"));
    CreateDiagnosticReport(CFSTR("Send Request: Malformed request Body"), v20, CFSTR("Attributtion"));
    v21 = 0;
  }

  return v21;
}

+ (void)_serverPost:(id)a3 requestTimestamp:(id)a4 payloadDeliveryStartDate:(id)a5 interval:(unint64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD);
  APServerConfiguration *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  __CFString *v68;
  id v69;
  unint64_t spid;
  id v71;
  void *v72;
  id v73;
  NSErrorUserInfoKey v74;
  const __CFString *v75;
  uint8_t buf[4];
  unint64_t v77;
  __int16 v78;
  __CFString *v79;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storefront"));
  v16 = v14;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storefront"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[APAttributionAnalytics storefrontCountryOnly:](APAttributionAnalytics, "storefrontCountryOnly:", v17));

  }
  else
  {
    v18 = CFSTR("NONE");
  }

  v19 = APPerfLogForCategory(4);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  v22 = a6 - 1;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 134349314;
    v77 = a6;
    v78 = 2114;
    v79 = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, a6, "HTTP Request Time", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestHeader"));
  if (!v23)
  {
    v24 = APLogForCategory(4);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Malformed request header", buf, 2u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadForRequestHeaderABCLog"));
    CreateDiagnosticReport(CFSTR("Server Post: Malformed request header"), v26, CFSTR("Attributtion"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestHeader"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v27));

  v72 = v28;
  objc_msgSend(v28, "setObject:forKey:", CFSTR("application/json; charset=utf-8"), CFSTR("Content-Type"));
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v30 = objc_msgSend(v29, "isRunningTests");

    if ((v30 & 1) == 0)
    {
      v31 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueForKey:", CFSTR("APAttribution.serverSignBody")));
      if (v32)
        objc_msgSend(v72, "setObject:forKey:", v32, CFSTR("X-Apple-BridgeTest"));

    }
  }
  spid = a6;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestBody"));
  v73 = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v33, 0, &v73));
  v71 = v73;

  v35 = APLogForCategory(4);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (v34)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestBody"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "jsonString"));
      *(_DWORD *)buf = 138477827;
      v77 = (unint64_t)v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "JSON body %{private}@", buf, 0xCu);

    }
    v69 = v13;

    v40 = APLogForCategory(4);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v16;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "jsonString"));
      *(_DWORD *)buf = 138477827;
      v77 = (unint64_t)v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "JSON header %{private}@", buf, 0xCu);

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://ca.iadsdk.apple.com/adserver/attribution/v2")));
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v68 = v18;
      v45 = v42;
      v46 = objc_alloc_init(APServerConfiguration);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[APServerConfiguration serverURLForMessageID:andBundleID:](v46, "serverURLForMessageID:andBundleID:", &off_100228D30, CFSTR("com.apple.ap.adprivacyd")));

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "URLByAppendingPathComponent:", CFSTR("attribution/v2")));
      v49 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "valueForKey:", CFSTR("APAttribution.serverURLoverride")));
      if (v50)
      {
        v51 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v50));

        v48 = (void *)v51;
      }

      v44 = v48;
      v42 = v45;
      v18 = v68;
    }
    v59 = APLogForCategory(4);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v77 = (unint64_t)v44;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Using %{private}@ to post attribution data", buf, 0xCu);
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[APNetworkClient sharedAPNetworkClient](APNetworkClient, "sharedAPNetworkClient"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleId"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "temporarySessionForClient:", v62));

    v64 = objc_msgSend(objc_alloc((Class)APHTTPRequest), "initWithURL:HTTPMethod:HTTPHeaders:HTTPBody:serviceName:completionHandler:", v44, 2, v72, v34, 0, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    if (!+[APAttributionRetryWorkerBridge startWithSession:request:requestorId:intervalId:reportingStorefront:requestTimestamp:daemonStartTime:tokenReturnedToClientDate:payloadDeliveryStartDate:](APAttributionRetryWorkerBridge, "startWithSession:request:requestorId:intervalId:reportingStorefront:requestTimestamp:daemonStartTime:tokenReturnedToClientDate:payloadDeliveryStartDate:", v63, v64, CFSTR("attribution"), spid, v18, v12, _daemonStartTime, v65, v13))
    {
      v66 = APLogForCategory(4);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Failed to initiate upload.", buf, 2u);
      }

      CreateDiagnosticReport(CFSTR("Server Post: Failed to initiate upload."), 0, CFSTR("Attributtion"));
      v13 = v69;
    }
    if (v42)
      v42[2](v42, 1, 0, 0);

    v55 = v71;
  }
  else
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestBody"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "jsonString"));
      *(_DWORD *)buf = 138477827;
      v77 = (unint64_t)v53;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unable to serialize body %{private}@", buf, 0xCu);

    }
    v74 = NSLocalizedDescriptionKey;
    v75 = CFSTR("Unable to serialize payload");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 1001, v54));

    v56 = APPerfLogForCategory(4);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    v58 = v57;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_DWORD *)buf = 134349056;
      v77 = spid;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, spid, "HTTP Request Time", "id=%{public, name=id}lld", buf, 0xCu);
    }

    v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v16;
    (*((void (**)(id, _QWORD, void *, _QWORD))v16 + 2))(v16, 0, v55, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadForRequestBodyABCLog"));
    CreateDiagnosticReport(CFSTR("Server Post: Malformed request Body"), v44, CFSTR("Attributtion"));
  }

}

+ (void)signPayloadWithFpdi:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 payloadDeliveryStartDate:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  int64_t v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  int v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  id v58;
  const char *v59;
  id v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  __CFString *v72;
  id v73;
  void *v74;
  id v75;
  id v77;
  _QWORD v78[3];
  _QWORD v79[3];
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  __CFString *v83;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = APLogForCategory(4);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Signing: Got FPDI signing request.", buf, 2u);
  }

  v75 = a1;
  v22 = v17;
  if (qword_100268830 != -1)
    dispatch_once(&qword_100268830, &stru_100213300);
  objc_msgSend(v15, "timeIntervalSinceDate:", _daemonStartTime);
  v23 = +[APAttributionAnalytics findBucketForDaemonRunningTime:](APAttributionAnalytics, "findBucketForDaemonRunningTime:");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storefront"));

  if (v24)
  {
    v25 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storefront"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[APAttributionAnalytics storefrontCountryOnly:](APAttributionAnalytics, "storefrontCountryOnly:", v26));

    v19 = v25;
  }
  else
  {
    v28 = APLogForCategory(4);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v81 = "+[APAttributionServer signPayloadWithFpdi:requestTimestamp:interval:jsonBody:startDate:payloadDeliveryStartD"
            "ate:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{sensitive}s, Storefront is nil", buf, 0xCu);
    }

    CreateDiagnosticReport(CFSTR("Sign Payload for Attribution: Error Storefront is nil"), 0, CFSTR("Attributtion"));
    v27 = CFSTR("NONE");
  }
  if (qword_100268818)
  {
    objc_msgSend((id)qword_100268828, "lock");
    if (objc_msgSend((id)qword_100268818, "state") == (id)18001)
    {
      v73 = v19;
      objc_msgSend((id)qword_100268828, "unlock");
      v77 = 0;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268818, "signatureForData:error:", v16, &v77));
      v30 = v77;
      v70 = v30;
      v71 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      if (v30)
      {
        v31 = APLogForCategory(4);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v81 = (const char *)v30;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Signing: signingAuthorityPoolManager.state == APSigningAuthorityPoolManagerStateSetupSucceeded but signing failed: %{public}@. Fallback to Mescal.", buf, 0xCu);
        }

        v19 = v73;
        LOBYTE(v68) = 1;
        v33 = v17;
        +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v14, v15, a5, v16, v17, v18, v68, v73);
        v34 = v74;
        v35 = (void *)v71;
      }
      else
      {
        v45 = APPerfLogForCategory(4);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        v47 = v46;
        if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          *(_DWORD *)buf = 134349314;
          v81 = (const char *)a5;
          v82 = 2114;
          v83 = v27;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, a5, "Payload Signing", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
        }
        v69 = v15;

        v48 = APLogForCategory(4);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Signing: Using FPDI.", buf, 2u);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "base64EncodedStringWithOptions:", 32));
        v78[0] = CFSTR("daemonRunningTime");
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
        v79[0] = v51;
        v79[1] = v27;
        v78[1] = CFSTR("storeFront");
        v78[2] = CFSTR("signingType");
        v79[2] = &off_100228D60;
        v52 = v27;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 3));

        v33 = v17;
        v35 = (void *)v71;
        +[APAttributionAnalytics sendTimingAnalytics:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimingAnalytics:startDate:endDate:additionalFields:", CFSTR("payloadSigningTime"), v17, v71, v53);
        objc_msgSend(v14, "setFpdiSignature:", v50);
        objc_msgSend(v75, "_serverPost:requestTimestamp:payloadDeliveryStartDate:interval:completionHandler:", v14, v69, v18, a5, v73);

        v27 = v52;
        v15 = v69;

        v19 = v73;
        v34 = v74;
      }

      goto LABEL_42;
    }
    v33 = v17;
    v72 = v27;
    if (objc_msgSend((id)qword_100268818, "state") == (id)18002
      || objc_msgSend((id)qword_100268818, "state") == (id)18004)
    {
      v40 = APLogForCategory(4);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager is not ready, starting it.", buf, 2u);
      }

      v42 = (void *)qword_100268820;
      v43 = v19;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[APSigningQueueItem createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:](APSigningQueueItem, "createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:", v14, v15, a5, v19));
      objc_msgSend(v42, "add:", v44);

      v19 = v43;
      byte_100268838 = 0;
      objc_msgSend((id)qword_100268818, "setupWithTimeout:completion:", &stru_100213360, 5.0);
      objc_msgSend((id)qword_100268828, "unlock");
LABEL_41:
      v27 = v72;
      goto LABEL_42;
    }
    if (objc_msgSend((id)qword_100268818, "state") != (id)18000)
    {
      v58 = v19;
      v59 = (const char *)objc_msgSend((id)qword_100268818, "state");
      v60 = objc_msgSend(objc_alloc((Class)APSigningAuthorityPoolManager), "initWithName:poolSize:numberToStash:", CFSTR("attribution_fpdi"), 1, 1);
      v61 = (void *)qword_100268818;
      qword_100268818 = (uint64_t)v60;

      objc_msgSend((id)qword_100268828, "unlock");
      v62 = APLogForCategory(4);
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v81 = v59;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Signing: Unknown signingAuthorityPoolManager state: %ld", buf, 0xCu);
      }

      v19 = v58;
      LOBYTE(v68) = 1;
      +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v14, v15, a5, v16, v17, v18, v68, v58);
      goto LABEL_41;
    }
    v54 = byte_100268838;
    objc_msgSend((id)qword_100268828, "unlock");
    v55 = APLogForCategory(4);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
    if (v54)
    {
      if (v57)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager has stuck in SetupStarted state. Fallback to Mescal.", buf, 2u);
      }

      LOBYTE(v68) = 1;
      +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v14, v15, a5, v16, v22, v18, v68, v19);
      goto LABEL_41;
    }
    if (v57)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager is not ready, adding a request to the queue.", buf, 2u);
    }

    v64 = (void *)qword_100268820;
    v65 = objc_claimAutoreleasedReturnValue(+[APSigningQueueItem createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:](APSigningQueueItem, "createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:", v14, v15, a5, v16, v22, v18, v19));
    v66 = v19;
    v67 = (void *)v65;
    objc_msgSend(v64, "add:", v65);

    v19 = v66;
    v27 = v72;
    if (objc_msgSend((id)qword_100268818, "state") == (id)18000)
      +[APAttributionServer _processSigningQueue:useFpdi:signingAuthorityPoolManager:](APAttributionServer, "_processSigningQueue:useFpdi:signingAuthorityPoolManager:", qword_100268820, 1, qword_100268818);
  }
  else
  {
    v36 = v15;
    v37 = v27;
    v38 = APLogForCategory(4);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Signing: signingAuthorityPoolManager is nil. Using Mescal.", buf, 2u);
    }

    LOBYTE(v68) = 1;
    v33 = v17;
    +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v14, v36, a5, v16, v17, v18, v68, v19);
    if (qword_100268840 != -1)
      dispatch_once(&qword_100268840, &stru_100213320);
    v27 = v37;
    v15 = v36;
  }
LABEL_42:

}

+ (void)signPayloadWithMescal:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 deliveryStartDate:(id)a8 isFallback:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  BOOL v35;
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  objc_initWeak(&location, a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100097274;
  v28[3] = &unk_100213388;
  v23 = v21;
  v33 = v23;
  v34[1] = (id)a5;
  v24 = v17;
  v29 = v24;
  v25 = v16;
  v30 = v25;
  v35 = a9;
  v26 = v19;
  v31 = v26;
  objc_copyWeak(v34, &location);
  v27 = v20;
  v32 = v27;
  objc_msgSend(v22, "signatureForData:waitTime:completion:", v18, v28, 1.0e10);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

+ (void)_processSigningQueue:(id)a3 useFpdi:(BOOL)a4 signingAuthorityPoolManager:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a5;
  v9 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.waitingTasks", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000976FC;
  block[3] = &unk_1002133B0;
  v15 = a4;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

@end
