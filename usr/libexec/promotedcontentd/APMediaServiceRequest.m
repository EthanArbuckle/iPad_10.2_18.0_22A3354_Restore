@implementation APMediaServiceRequest

+ (void)_handleResult:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a7;
  if (!v12
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain")),
        v16 = objc_msgSend(v15, "isEqualToString:", AMSErrorDomain),
        v15,
        !v16))
  {
    v20 = -1;
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", AMSErrorUserInfoKeyStatusCode));

  if (v18 && (v19 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
    v20 = (uint64_t)objc_msgSend(v18, "longValue");
  else
    v20 = -1;

  if (v11)
LABEL_7:
    v20 = (uint64_t)objc_msgSend(v11, "responseStatusCode");
LABEL_8:
  if ((unint64_t)(v20 - 400) <= 0x63)
  {
    v21 = 3002;
    goto LABEL_19;
  }
  if ((unint64_t)(v20 - 500) <= 0x63)
  {
    v21 = 3003;
    goto LABEL_19;
  }
  if (v20 != 200)
  {
    if (!v12)
    {
      v25 = APLogForCategory(27);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = 134217984;
        v28 = objc_msgSend(v11, "responseStatusCode");
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unexpected MediaAPI server response. Status code: %lu", (uint8_t *)&v27, 0xCu);
      }

      v21 = 3002;
      v23 = 0;
      goto LABEL_20;
    }
    v21 = 3000;
LABEL_19:
    v23 = v12;
LABEL_20:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithCode:internalError:](NSError, "errorWithCode:internalError:", v21, v23));
    v14[2](v14, 0, v24);

    goto LABEL_21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
  +[APMediaServiceRequest _handleResponseJsonData:error:params:responseReceivedTimestamp:completionHandler:](APMediaServiceRequest, "_handleResponseJsonData:error:params:responseReceivedTimestamp:completionHandler:", v22, v12, v13, v14, a6);

LABEL_21:
}

+ (void)_handleResponseJsonData:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, void *))a7;
  v16 = objc_msgSend(v12, "length");
  if (v13 || !v16)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithCode:internalError:](NSError, "errorWithCode:internalError:", 3005, v13));
    v15[2](v15, 0, v25);

  }
  else
  {
    v31 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v12, 0, &v31));
    v18 = v31;
    v19 = v18;
    if (!v17 || v18)
    {
      v26 = APLogForCategory(27);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_opt_class(APMediaServiceRequest);
        *(_DWORD *)buf = 138412546;
        v33 = v28;
        v34 = 2114;
        v35 = 0;
        v29 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@: Error with MediaAPI response serialization: %{public}@", buf, 0x16u);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithCode:internalError:](NSError, "errorWithCode:internalError:", 3006, v19));
      v15[2](v15, 0, v20);
    }
    else
    {
      v30 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceResponseTranslator translateResponse:requestParams:responseReceivedTimestamp:error:](APMediaServiceResponseTranslator, "translateResponse:requestParams:responseReceivedTimestamp:error:", v17, v14, &v30, a6));
      v19 = v30;
      if (v19)
      {
        v21 = APLogForCategory(27);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412546;
          v33 = v23;
          v34 = 2114;
          v35 = v19;
          v24 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@: Error with MediaAPI response translator: %{public}@", buf, 0x16u);

        }
      }
      ((void (**)(id, void *, void *))v15)[2](v15, v20, v19);
    }

  }
}

+ (void)_reportBuildRequestForPlacement:(unint64_t)a3 duration:(double)a4 bagDuration:(double)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  if (a4 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    a5 = a5 * 100.0 / a4;
    v6 = (unint64_t)a5;
  }
  v11[0] = CFSTR("Duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a5));
  v12[0] = v7;
  v11[1] = CFSTR("Type");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12[1] = v8;
  v11[2] = CFSTR("BagFraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  v12[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("mediasvc.buildrequest"), v10);
}

+ (id)_buildQueryParamsForDevicePlatform:(id)a3 placement:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appMetadataFields"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appMetadataFields"));
    v12 = objc_msgSend(v11, "mutableCopy");

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("platform")));
  if (!v13)
    objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("platform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("placement")));

  if (!v14)
    objc_msgSend(v12, "setValue:forKey:", v8, CFSTR("placement"));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("search-landing")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("fields")));

    if (!v15)
      objc_msgSend(v12, "setValue:forKey:", CFSTR("appBinaryTraits"), CFSTR("fields"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("omit[resource]")));

    if (!v16)
      objc_msgSend(v12, "setValue:forKey:", CFSTR("autos"), CFSTR("omit[resource]"));
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000035B0;
  v20[3] = &unk_100218F70;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = v21;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v20);
  v18 = objc_msgSend(v17, "copy");

  return v18;
}

- (id)runWithParameters:(id)a3 mediaServiceSession:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  dispatch_semaphore_t v36;
  void *v37;
  void *v38;
  dispatch_time_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  dispatch_semaphore_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  dispatch_time_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  APAdLibDefaults *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  id v74;
  void *v75;
  double v76;
  void *v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  NSObject *v86;
  id v87;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  NSObject *v109;
  id v110;
  void (**v111)(id, _QWORD, void *);
  id v112[3];
  char v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[5];
  NSObject *v117;
  __int128 *v118;
  _QWORD v119[5];
  NSObject *v120;
  __int128 *p_buf;
  id v122;
  uint8_t v123[4];
  void *v124;
  __int128 v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  __int128 buf;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;

  v8 = a3;
  v105 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idAccount"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iAdID"));

  v11 = objc_msgSend(v8, "validate");
  if (v9 && v11 && v104)
  {
    -[APMediaServiceRequest setParams:](self, "setParams:", v8);
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))v12 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceRequestSettings settings](APMediaServiceRequestSettings, "settings"));
    else
      v12 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = v17;

    if (objc_msgSend(v12, "useAMSBagValue"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfile](AMSMediaTask, "bagSubProfile"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfileVersion](AMSMediaTask, "bagSubProfileVersion"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v19, v20));

    }
    else
    {
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[APAMSBagManager adprivacydBag](APAMSBagManager, "adprivacydBag"));
    }
    v21 = 0.0;
    if ((objc_msgSend(v12, "ignoreBagKeyCheckValue") & 1) == 0)
    {
      if (!-[APMediaServiceRequest isStorefrontAdPlatformsEnabledForBag:](self, "isStorefrontAdPlatformsEnabledForBag:", v102))
      {
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 2202, 0));
        v34 = APLogForCategory(27);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v103;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Ad Platforms is not enabled. Not making MediaAPI request: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v9[2](v9, 0, v103);
        v15 = v105;
        goto LABEL_54;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v22, "timeIntervalSince1970");
      v24 = v23;

      v21 = v24 - v18;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mockRequestJson"));
    if (objc_msgSend(v25, "length"))
    {
      v103 = v25;
    }
    else
    {
      v122 = 0;
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest _requestJsonCatchingError:](self, "_requestJsonCatchingError:", &v122));
      v31 = v122;

      if (v31 || !objc_msgSend(v103, "length"))
      {
        v32 = APLogForCategory(27);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to generate request from context: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v9[2](v9, 0, v31);
        v15 = v105;
        goto LABEL_53;
      }
    }
    v26 = v105;
    if (!v26)
      v26 = (id)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest _createSessionForBag:](self, "_createSessionForBag:", v102));
    v93 = v26;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "protocolHandler"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "tokenService"));
    v100 = objc_msgSend(objc_alloc((Class)AMSMediaRequestEncoder), "initWithTokenService:bag:", v97, v102);
    objc_msgSend(v100, "setAccount:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest _clientProcessInfo](self, "_clientProcessInfo"));
    objc_msgSend(v100, "setClientInfo:", v27);

    v135 = CFSTR("adRequest");
    v136 = v103;
    v137 = CFSTR("data");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1));
    v138 = v28;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v96, 0, 0));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v131 = 0x3032000000;
    v132 = sub_10002D3F0;
    v133 = sub_10002D388;
    v134 = 0;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaAPIHostURL"));
    if (objc_msgSend(v91, "length"))
    {
      v29 = objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v91));
      v30 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v29;
    }
    else
    {
      v36 = dispatch_semaphore_create(0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[APAMSBagManager mediaAPIHostURL](APAMSBagManager, "mediaAPIHostURL"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valuePromise"));

      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_10017B510;
      v119[3] = &unk_100218ED0;
      v119[4] = self;
      p_buf = &buf;
      v30 = v36;
      v120 = v30;
      objc_msgSend(v38, "addFinishBlock:", v119);
      v39 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v30, v39))
      {
        v40 = APLogForCategory(27);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = (void *)objc_opt_class(self);
          LODWORD(v125) = 138477827;
          *(_QWORD *)((char *)&v125 + 4) = v42;
          v43 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the API host from AMSMediaTask bag in time.", (uint8_t *)&v125, 0xCu);

        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get the API host from AMSMediaTask bag in time.")));
        CreateDiagnosticReport(v44, 0, CFSTR("Bag load miss"));

      }
    }

    *(_QWORD *)&v125 = 0;
    *((_QWORD *)&v125 + 1) = &v125;
    v126 = 0x3032000000;
    v127 = sub_10002D3F0;
    v128 = sub_10002D388;
    v129 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "countryCode"));
    if (!objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 40), "length"))
    {
      v45 = dispatch_semaphore_create(0);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[APAMSBagManager mediaAPICountryCode](APAMSBagManager, "mediaAPICountryCode"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valuePromise"));

      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472;
      v116[2] = sub_10017B6A0;
      v116[3] = &unk_100218EF8;
      v116[4] = self;
      v118 = &v125;
      v48 = v45;
      v117 = v48;
      objc_msgSend(v47, "addFinishBlock:", v116);
      v49 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v48, v49))
      {
        v50 = APLogForCategory(27);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = (void *)objc_opt_class(self);
          *(_DWORD *)v123 = 138477827;
          v124 = v52;
          v53 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the country code from AMSMediaTask bag in time.", v123, 0xCu);

        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get the country code from AMSMediaTask bag in time.")));
        CreateDiagnosticReport(v54, 0, CFSTR("Bag load miss"));

      }
    }
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "devicePlatform"));
    if (!objc_msgSend(v99, "length"))
    {
      v55 = objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest _devicePlatform](self, "_devicePlatform"));

      v99 = (void *)v55;
    }
    if ((objc_msgSend(v12, "disablePlacementParamValue") & 1) != 0)
      v56 = 0;
    else
      v56 = objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest _placementForPlacement:](self, "_placementForPlacement:", objc_msgSend(v8, "placement")));
    v90 = (void *)v56;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceRequest _buildQueryParamsForDevicePlatform:placement:parameters:](APMediaServiceRequest, "_buildQueryParamsForDevicePlatform:placement:parameters:", v99));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/v1/engagement/%@/ads"), *(_QWORD *)(*((_QWORD *)&v125 + 1) + 40)));
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setPath:", v57);

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setQueryItems:", v94);
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "URL"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:"));
    objc_msgSend(v58, "setHTTPBody:", v95);
    objc_msgSend(v58, "setHTTPMethod:", CFSTR("POST"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "identifier"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "UUIDString"));

    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v61 = objc_alloc_init(APAdLibDefaults);
      v62 = objc_msgSend(objc_alloc((Class)ADRoutingInfoMessage), "initWithRoutingType:preferencesStore:", 1, v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "payload"));

      objc_msgSend(v58, "setValue:forHTTPHeaderField:", v63, CFSTR("x-apple-iad-env-name"));
    }
    objc_msgSend(v58, "setValue:forHTTPHeaderField:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 40), CFSTR("X-Apple-Store-Front"));
    objc_msgSend(v58, "setValue:forHTTPHeaderField:", v101, CFSTR("X-Apple-App-Store-Client-Request-Id"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headers"));
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_10017B7B0;
    v114[3] = &unk_100214FC8;
    v65 = v58;
    v115 = v65;
    objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v114);

    v66 = objc_msgSend(v12, "prettyPrintJsonValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "allHTTPHeaderFields"));
    -[APMediaServiceRequest _logRequestURL:requestID:headers:innerRequestJson:prettyPrint:](self, "_logRequestURL:requestID:headers:innerRequestJson:prettyPrint:", v92, v101, v67, v103, v66);

    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mockResponseResultForPlacement:", objc_msgSend(v8, "placement")));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestTime"));

    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v70, "timeIntervalSince1970");
      v72 = v71;

      v73 = (void *)objc_opt_class(self);
      v74 = objc_msgSend(v8, "placement");
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestTime"));
      objc_msgSend(v75, "timeIntervalSince1970");
      objc_msgSend(v73, "_reportBuildRequestForPlacement:duration:bagDuration:", v74, v72 - v76, v21);

    }
    if (v68)
    {
      +[APMediaServiceRequest _logResponse:requestID:error:prettyPrint:](APMediaServiceRequest, "_logResponse:requestID:error:prettyPrint:", v68, v101, 0, v66);
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v77, "timeIntervalSince1970");
      +[APMediaServiceRequest _handleResult:error:params:responseReceivedTimestamp:completionHandler:](APMediaServiceRequest, "_handleResult:error:params:responseReceivedTimestamp:completionHandler:", v68, 0, v8, v9);

      v78 = v93;
    }
    else
    {
      v79 = APPerfLogForCategory(27);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      v81 = (void *)os_signpost_id_generate(v80);
      -[APMediaServiceRequest beginSignpostForPlacement:log:logID:](self, "beginSignpostForPlacement:log:logID:", objc_msgSend(v8, "placement"), v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v82, "timeIntervalSince1970");
      v84 = v83;

      objc_initWeak((id *)v123, self);
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "requestByEncodingRequest:parameters:", v65, 0));
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_1000040B0;
      v106[3] = &unk_100218F48;
      v111 = v9;
      v85 = v93;
      v107 = v85;
      objc_copyWeak(v112, (id *)v123);
      v108 = v8;
      v86 = v80;
      v109 = v86;
      v112[1] = v81;
      v112[2] = v84;
      v110 = v101;
      v113 = (char)v66;
      objc_msgSend(v89, "addFinishBlock:", v106);
      v87 = v85;

      objc_destroyWeak(v112);
      objc_destroyWeak((id *)v123);

    }
    _Block_object_dispose(&v125, 8);

    _Block_object_dispose(&buf, 8);
    v31 = v93;
    v15 = v93;
LABEL_53:

LABEL_54:
    goto LABEL_55;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 2200, 0));
  v13 = APLogForCategory(27);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Media service request failed: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v9[2](v9, 0, v12);
  v15 = v105;
LABEL_55:

  return v15;
}

+ (void)_logResponse:(id)a3 requestID:(id)a4 error:(id)a5 prettyPrint:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  NSString *v41;
  void *v42;
  void *context;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  id v52;
  const __CFString *v53;
  void *v54;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));

  if (v6)
  {
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v14, 0, 0));

      if (!v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to deserialize incoming data into JSON. %@"), v16));

        APSimulateCrash(5, v17, 0);
        v53 = CFSTR("error");
        v54 = v17;
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));

      }
    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "responseStatusCode")));
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("statusCode"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("headers"));

    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v13, CFSTR("body"));
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, CFSTR("error"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString jsonStringWithOptions:](v18, "jsonStringWithOptions:", 3));
  }
  else
  {
    if (v13)
    {
      v22 = objc_alloc((Class)NSString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      v13 = (__CFString *)objc_msgSend(v22, "initWithData:encoding:", v23, 4);

      if (!v13)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "base64EncodedStringWithOptions:", 0));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to convert incoming data into UTF8 string. %@"), v25));

        APSimulateCrash(5, v26, 0);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\"error\":\"%@\"}"), v26));

      }
    }
    else
    {
      v13 = CFSTR("null");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
    v18 = CFSTR("null");
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseHeaders"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "jsonStringWithOptions:", 0));

    }
    if (v12)
    {
      context = objc_autoreleasePoolPush();
      v52 = v12;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "jsonRepresentationWithOptions:", 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));

      if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v31))
      {
        v50 = CFSTR("description");
        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugDescription"));
        else
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
        v34 = (void *)v32;
        v51 = v32;
        v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));

        v31 = (void *)v35;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v31, 0, 0));
      if (v36)
        v33 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v36, 4);
      else
        v33 = CFSTR("null");

      objc_autoreleasePoolPop(context);
    }
    else
    {
      v33 = 0;
    }
    v37 = objc_msgSend(v10, "responseStatusCode");
    if (v33)
      v38 = v33;
    else
      v38 = CFSTR("null");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\"statusCode\":%ld,\"headers\":%@,\"body\":%@,\"error\":%@}"), v37, v18, v13, v38));

  }
  v39 = APLogForCategory(27);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = NSStringFromClass((Class)a1);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    *(_DWORD *)buf = 138412802;
    v45 = v42;
    v46 = 2114;
    v47 = v11;
    v48 = 2114;
    v49 = v21;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%@] Received Media API response for %{public}@:\n%{public}@", buf, 0x20u);

  }
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

- (double)responseTime
{
  return self->_responseTime;
}

- (APMediaServiceRequestParameters)params
{
  return self->_params;
}

- (BOOL)isStorefrontAdPlatformsEnabledForBag:(id)a3
{
  _BOOL4 v3;

  v3 = +[APAMSBagManager isSearchLandingAdsEnabled](APAMSBagManager, "isSearchLandingAdsEnabled", a3);
  if (v3)
    LOBYTE(v3) = +[APAMSBagManager isSponsoredAdsEnabledForAdTrackingd](APAMSBagManager, "isSponsoredAdsEnabledForAdTrackingd");
  return v3;
}

- (void)endSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5
{
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v7 = a4;
  v8 = v7;
  v9 = a5 - 1;
  if (a3 == 7005)
  {
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v13 = 0;
      v10 = "slpNetworkingTime";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, a5, v10, " enableTelemetry=YES ", v11, 2u);
    }
  }
  else if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v12 = 0;
    v10 = "clNetworkingTime";
    v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }

}

- (void)beginSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5
{
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v7 = a4;
  v8 = v7;
  v9 = a5 - 1;
  if (a3 == 7005)
  {
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v13 = 0;
      v10 = "slpNetworkingTime";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a5, v10, "", v11, 2u);
    }
  }
  else if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v12 = 0;
    v10 = "clNetworkingTime";
    v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }

}

- (id)_placementForPlacement:(unint64_t)a3
{
  if (a3 - 7005 > 3)
    return &stru_100219118;
  else
    return *(&off_100218F90 + a3 - 7005);
}

- (void)_logRequestURL:(id)a3 requestID:(id)a4 headers:(id)a5 innerRequestJson:(id)a6 prettyPrint:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_autoreleasePoolPush();
  if (!v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "jsonStringWithOptions:", 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\"headers\":%@,\"body\":%@}"), v17, v15));
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v18, 0, 0));

  if (!v14)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("headers"));

    if (v19)
      goto LABEL_4;
LABEL_7:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("body"));

    goto LABEL_8;
  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("headers"));
  if (!v19)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("body"));
LABEL_8:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "jsonStringWithOptions:", 3));

LABEL_9:
  v23 = APLogForCategory(27);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class(self);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138413059;
    v29 = v27;
    v30 = 2113;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    v34 = 2114;
    v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%@] Making Media API request to %{private}@ with identifier %{public}@:\n%{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);

}

- (id)_devicePlatform
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((+[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone") & 1) != 0)
    return CFSTR("iphone");
  if ((+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad") & 1) != 0)
    return CFSTR("ipad");
  if ((+[AMSDevice deviceIsAppleTV](AMSDevice, "deviceIsAppleTV") & 1) != 0)
    return CFSTR("appletv");
  if ((+[AMSDevice deviceIsAppleWatch](AMSDevice, "deviceIsAppleWatch") & 1) != 0)
    return CFSTR("watch");
  if ((+[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod") & 1) != 0)
    return CFSTR("iphone");
  if ((+[AMSDevice deviceIsMac](AMSDevice, "deviceIsMac") & 1) != 0)
    return CFSTR("mac");
  v3 = APLogForCategory(27);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unknown device platform", v5, 2u);
  }

  return 0;
}

- (id)_createSessionForBag:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  v5 = objc_msgSend(objc_alloc((Class)AMSURLSession), "initWithConfiguration:", v4);
  v6 = objc_msgSend(objc_alloc((Class)AMSMediaTokenService), "initWithClientIdentifier:bag:", CFSTR("com.apple.ap.promotedcontentd"), v3);

  objc_msgSend(v6, "setSession:", v5);
  v7 = objc_msgSend(objc_alloc((Class)AMSMediaProtocolHandler), "initWithTokenService:", v6);
  objc_msgSend(v5, "setProtocolHandler:", v7);

  return v5;
}

- (id)_clientProcessInfo
{
  return objc_msgSend(objc_alloc((Class)AMSProcessInfo), "initWithBundleIdentifier:", CFSTR("com.apple.AppStore"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
}

- (id)_requestJsonCatchingError:(id *)a3
{
  void *v5;
  APMediaServiceContextTransformer *v6;
  void *v7;
  APMediaServiceContextTransformer *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v5 = objc_autoreleasePoolPush();
  v6 = [APMediaServiceContextTransformer alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequest params](self, "params"));
  v8 = -[APMediaServiceContextTransformer initWithParams:](v6, "initWithParams:", v7);

  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer transformedContextJSON:](v8, "transformedContextJSON:", &v16));
  v10 = v16;
  if (v10)
  {
    v11 = APLogForCategory(27);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      v19 = 2114;
      v20 = v10;
      v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Error with context to JSON transformer: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v10);

  return v9;
}

@end
