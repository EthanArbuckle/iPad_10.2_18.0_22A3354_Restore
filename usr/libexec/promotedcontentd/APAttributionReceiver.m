@implementation APAttributionReceiver

- (APAttributionReceiver)initWithConnection:(id)a3
{
  id v5;
  APAttributionReceiver *v6;
  APAttributionReceiver *v7;
  APAttributionAnalytics *v8;
  APAttributionAnalytics *analytics;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APAttributionReceiver;
  v6 = -[APAttributionReceiver init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(APAttributionAnalytics);
    analytics = v7->_analytics;
    v7->_analytics = v8;

  }
  return v7;
}

- (BOOL)canReturnToken:(id)a3
{
  id v3;
  APItunesMetaData *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = -[APItunesMetaData initWithBundleID:]([APItunesMetaData alloc], "initWithBundleID:", v3);

  if (-[APItunesMetaData installedByAppStore](v4, "installedByAppStore"))
    v5 = 1;
  else
    v5 = -[APItunesMetaData installedAsTestApp](v4, "installedAsTestApp");

  return v5;
}

- (void)attributionTokenRequestTimestamp:(id)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  APAttributionReceiver *v21;
  id v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;

  v8 = a3;
  v9 = a5;
  -[APAttributionReceiver setIntervalId:](self, "setIntervalId:", a4);
  v10 = APPerfLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  -[APAttributionReceiver setAttemptId:](self, "setAttemptId:", os_signpost_id_generate(v11));

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
    v13 = APPerfLogForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = -[APAttributionReceiver intervalId](self, "intervalId");
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 134349312;
        v24 = -[APAttributionReceiver intervalId](self, "intervalId");
        v25 = 2050;
        v26 = -[APAttributionReceiver attemptId](self, "attemptId");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Token Request", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009C0F0;
    v18[3] = &unk_1002133F8;
    v19 = v8;
    v20 = v12;
    v21 = self;
    v22 = v9;
    v17 = v12;
    -[APAttributionReceiver _attributionTokenRequestTimestamp:completionHandler:](self, "_attributionTokenRequestTimestamp:completionHandler:", v19, v18);

  }
}

- (void)_attributionTokenRequestTimestamp:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  APAttributionRequest *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_signpost_id_t v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  uint64_t v56;
  NSObject *v57;
  os_signpost_id_t v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  NSObject *v64;
  os_signpost_id_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  NSObject *v78;
  os_signpost_id_t v79;
  unint64_t v80;
  unint64_t v81;
  __uint64_t v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  os_signpost_id_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  NSObject *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  _QWORD v97[4];
  APAttributionRequest *v98;
  id v99;
  void (**v100)(id, id);
  id v101;
  uint8_t v102[16];
  _OWORD v103[2];
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  uint64_t v107;
  __int16 v108;
  unint64_t v109;
  __int16 v110;
  const __CFString *v111;
  NSErrorUserInfoKey v112;
  const __CFString *v113;
  void *v114;
  void *v115;
  NSErrorUserInfoKey v116;
  const __CFString *v117;
  NSErrorUserInfoKey v118;
  const __CFString *v119;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v104 = 0u;
  v105 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    v104 = 0u;
    v105 = 0u;
  }

  if (ba_is_process_extension(&v104))
  {
    v118 = NSLocalizedDescriptionKey;
    v119 = CFSTR("Attribution services not available in extensions");
    v10 = (APAttributionRequest *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 3, v10));
    v12 = APLogForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v107 = (uint64_t)"-[APAttributionReceiver _attributionTokenRequestTimestamp:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{sensitive}s, Attribution services not available in extensions", buf, 0xCu);
    }

    v14 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v11);
    v7[2](v7, v14);
  }
  else
  {
    v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v16, "setTokenDaemonStart:", v15);

    v10 = objc_alloc_init(APAttributionRequest);
    -[APAttributionRequest loadIDAccountDetails](v10, "loadIDAccountDetails");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));

    -[APAttributionRequest setBundleId:](v10, "setBundleId:", v11);
    v18 = APLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v107 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Request for Attribution from bundle %{public}@", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
    v21 = v20 == 0;

    if (v21)
    {
      v31 = APLogForCategory(4);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "BundleID nil", buf, 2u);
      }

      v116 = NSLocalizedDescriptionKey;
      v117 = CFSTR("BundleID nil");
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v14));
      v34 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v33);
      v7[2](v7, v34);

    }
    else
    {
      if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
      {
        v22 = objc_alloc((Class)APSettingsStorageUserDefaults);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("APAttribution.bundleID"), "componentsSeparatedByString:", CFSTR(".")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastObject"));
        v114 = v24;
        v115 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1));
        v26 = objc_msgSend(v22, "initWithDefaultValues:", v25);

        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("APAttribution.bundleID")));
        -[APAttributionRequest setBundleId:](v10, "setBundleId:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("APAttribution.applyRateLimiting")));
        v29 = v28;
        if (v28)
          v30 = objc_msgSend(v28, "BOOLValue");
        else
          v30 = 1;
        v35 = APLogForCategory(4);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v107 = v27;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Using override bundleID %{public}@ to pull attribution data", buf, 0xCu);
        }

        v11 = (void *)v27;
      }
      else
      {
        v30 = 1;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
      v38 = -[APAttributionReceiver canReturnToken:](self, "canReturnToken:", v37);

      v39 = APLogForCategory(4);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
      if ((v38 & 1) != 0)
      {
        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
          *(_DWORD *)buf = 138477827;
          v107 = (uint64_t)v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Continuing with Attribution for %{private}@ app installed by a supported marketplace", buf, 0xCu);

        }
        if (v30)
        {
          v43 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
          v14 = (id)objc_claimAutoreleasedReturnValue(+[APAttributionCacheElement cachedElementForBundleIdentifier:](APAttributionCacheElement, "cachedElementForBundleIdentifier:", v43));
        }
        else
        {
          v47 = APLogForCategory(4);
          v43 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Rate limiting is disabled", buf, 2u);
          }
          v14 = 0;
        }

        v48 = APPerfLogForCategory(4);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        v50 = -[APAttributionReceiver intervalId](self, "intervalId");
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          v51 = -[APAttributionReceiver intervalId](self, "intervalId");
          v52 = -[APAttributionReceiver attemptId](self, "attemptId");
          *(_DWORD *)buf = 134349312;
          v107 = v51;
          v108 = 2050;
          v109 = v52;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_BEGIN, v50, "Check ATT", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));
        v54 = v53;
        if (v53)
          objc_msgSend(v53, "auditToken");
        else
          memset(v103, 0, sizeof(v103));
        v55 = +[APAttributionAppTracking appTrackingStatus:](APAttributionAppTracking, "appTrackingStatus:", v103);

        v56 = APPerfLogForCategory(4);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        v58 = -[APAttributionReceiver intervalId](self, "intervalId");
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          v59 = -[APAttributionReceiver intervalId](self, "intervalId");
          v60 = -[APAttributionReceiver attemptId](self, "attemptId");
          *(_DWORD *)buf = 134349312;
          v107 = v59;
          v108 = 2050;
          v109 = v60;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, v58, "Check ATT", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }

        if (v14
          && (v61 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest toroId](v10, "toroId")),
              v62 = objc_msgSend(v14, "isValidCheckWithToroID:andTrackingStatus:", v61, v55),
              v61,
              v62))
        {
          v63 = APPerfLogForCategory(4);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          v65 = -[APAttributionReceiver intervalId](self, "intervalId");
          if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
          {
            v66 = -[APAttributionReceiver intervalId](self, "intervalId");
            v67 = -[APAttributionReceiver attemptId](self, "attemptId");
            *(_DWORD *)buf = 134349312;
            v107 = v66;
            v108 = 2050;
            v109 = v67;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_EVENT, v65, "Use Cached Token", "Use Cached Token id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
          }

          v68 = APLogForCategory(4);
          v69 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v107 = (uint64_t)v11;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Token requested before previous expired, returning cached token for %{public}@", buf, 0xCu);
          }

          v70 = APLogForCategory(4);
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "token"));
            *(_DWORD *)buf = 141558274;
            v107 = 1752392040;
            v108 = 2112;
            v109 = (unint64_t)v72;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Token = %{mask.hash}@", buf, 0x16u);

          }
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenTracker defaultTracker](APAttributionTokenTracker, "defaultTracker"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "token"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
          v76 = objc_msgSend(v73, "isTokenUsedByOtherBundle:bundleID:", v74, v75);

          if (v76)
          {
            +[APAttributionAnalytics sendTokenDuplicateAnalytics:](APAttributionAnalytics, "sendTokenDuplicateAnalytics:", CFSTR("TokenDupeCache"));
            v77 = APPerfLogForCategory(4);
            v78 = objc_claimAutoreleasedReturnValue(v77);
            v79 = -[APAttributionReceiver intervalId](self, "intervalId");
            if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
            {
              v80 = -[APAttributionReceiver intervalId](self, "intervalId");
              v81 = -[APAttributionReceiver attemptId](self, "attemptId");
              *(_DWORD *)buf = 134349570;
              v107 = v80;
              v108 = 2050;
              v109 = v81;
              v110 = 2114;
              v111 = CFSTR("local");
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, OS_SIGNPOST_EVENT, v79, "Duplicate Token Found", "Duplicate Token Found id=%{public, name=id}lld attempt=%{public, name=attempt}lld cache=%{public, name=cache}@", buf, 0x20u);
            }
          }
          else
          {
            v78 = objc_claimAutoreleasedReturnValue(+[APAttributionTokenTracker defaultTracker](APAttributionTokenTracker, "defaultTracker"));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "token"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
            -[NSObject addToken:bundleID:](v78, "addToken:bundleID:", v92, v93);

          }
          v94 = objc_alloc((Class)AAAttributionResult);
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "token"));
          v96 = objc_msgSend(v94, "initWithToken:source:", v95, 1);
          v7[2](v7, v96);

        }
        else
        {
          v82 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
          objc_msgSend(v83, "setTokenStart:", v82);

          v84 = APPerfLogForCategory(4);
          v85 = objc_claimAutoreleasedReturnValue(v84);
          v86 = -[APAttributionReceiver intervalId](self, "intervalId");
          if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
          {
            v87 = -[APAttributionReceiver intervalId](self, "intervalId");
            v88 = -[APAttributionReceiver attemptId](self, "attemptId");
            *(_DWORD *)buf = 134349312;
            v107 = v87;
            v108 = 2050;
            v109 = v88;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_BEGIN, v86, "Create Token", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
          }

          objc_initWeak((id *)buf, self);
          v89 = APLogForCategory(4);
          v90 = objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v102 = 0;
            _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "Creating token", v102, 2u);
          }

          v91 = -[APAttributionReceiver intervalId](self, "intervalId");
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_10009CFE8;
          v97[3] = &unk_100213420;
          objc_copyWeak(&v101, (id *)buf);
          v10 = v10;
          v98 = v10;
          v99 = v6;
          v100 = v7;
          +[APAttributionToken tokenWithDetail:interval:completionHandler:](APAttributionToken, "tokenWithDetail:interval:completionHandler:", v55, v91, v97);

          objc_destroyWeak(&v101);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        if (v41)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](v10, "bundleId"));
          *(_DWORD *)buf = 138477827;
          v107 = (uint64_t)v44;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Cannot attribute %{private}@ as it was installed by an unsupported marketplace.", buf, 0xCu);

        }
        v112 = NSLocalizedDescriptionKey;
        v113 = CFSTR("App is not able to be attributed");
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v14));
        v46 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v45);
        v7[2](v7, v46);

      }
    }
  }

}

- (void)_continueAttribution:(id)a3 token:(id)a4 cached:(BOOL)a5 requestTimestamp:(id)a6 error:(id)a7 constructionWithCompletionHandler:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id);
  __uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  os_signpost_id_t v32;
  unint64_t v33;
  unint64_t v34;
  APItunesMetaData *v35;
  void *v36;
  APItunesMetaData *v37;
  id v38;
  void *v39;
  APAttributionCapData *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  unint64_t v44;
  os_signpost_id_t v45;
  unint64_t v46;
  unint64_t v47;
  __uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  void *v55;
  void *v56;
  __uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void (**v71)(id, id);
  __CFString **v72;
  void *v73;
  uint64_t v74;
  id v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  NSObject *p_super;
  unint64_t v83;
  os_signpost_id_t v84;
  NSObject *v85;
  unint64_t v86;
  unint64_t v87;
  void *v88;
  uint64_t v89;
  _BOOL8 v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unsigned __int8 v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  APAttributionCapData *v111;
  void (**v112)(id, id);
  _BOOL4 v113;
  id v114;
  id v115;
  id v116;
  _OWORD v117[2];
  _QWORD v118[4];
  id v119;
  APAttributionReceiver *v120;
  id v121;
  id v122;
  id v123;
  NSErrorUserInfoKey v124;
  const __CFString *v125;
  NSErrorUserInfoKey v126;
  const __CFString *v127;
  NSErrorUserInfoKey v128;
  const __CFString *v129;
  uint8_t buf[4];
  unint64_t v131;
  __int16 v132;
  unint64_t v133;
  NSErrorUserInfoKey v134;
  const __CFString *v135;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, id))a8;
  if (v15)
  {
    v113 = v11;
    v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v20, "setTokenEnd:", v19);

    v21 = APPerfLogForCategory(4);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = -[APAttributionReceiver intervalId](self, "intervalId");
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v23;
      if (os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 134349312;
        v131 = -[APAttributionReceiver intervalId](self, "intervalId");
        v132 = 2050;
        v133 = -[APAttributionReceiver attemptId](self, "attemptId");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v24, "Create Token", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    v25 = APLogForCategory(4);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Created token", buf, 2u);
    }
    v116 = v17;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "key"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v14, "setAttributionKey:", v28);

    v29 = APPerfLogForCategory(4);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = -[APAttributionReceiver intervalId](self, "intervalId");
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v32 = v31;
      if (os_signpost_enabled(v30))
      {
        v33 = -[APAttributionReceiver intervalId](self, "intervalId");
        v34 = -[APAttributionReceiver attemptId](self, "attemptId");
        *(_DWORD *)buf = 134349312;
        v131 = v33;
        v132 = 2050;
        v133 = v34;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, v32, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    v35 = [APItunesMetaData alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleId"));
    v37 = -[APItunesMetaData initWithBundleID:](v35, "initWithBundleID:", v36);

    v123 = 0;
    LOBYTE(v35) = -[APItunesMetaData loadMetaDataWithError:](v37, "loadMetaDataWithError:", &v123);
    v38 = v123;
    v39 = v38;
    if ((v35 & 1) != 0)
    {
      v114 = v16;
      v112 = v18;
      objc_msgSend(v14, "setDevelopmentApp:", -[APItunesMetaData installedAsTestApp](v37, "installedAsTestApp"));
      objc_msgSend(v14, "addMetaData:", v37);
      objc_msgSend(v14, "loadDeviceInfo");
      v40 = objc_alloc_init(APAttributionCapData);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData adamID](v37, "adamID"));
      -[APAttributionCapData loadCapData:](v40, "loadCapData:", v41);

      v111 = v40;
      objc_msgSend(v14, "addCapData:", v40);
      v42 = APPerfLogForCategory(4);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v44 = -[APAttributionReceiver intervalId](self, "intervalId");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v45 = v44;
        if (os_signpost_enabled(v43))
        {
          v46 = -[APAttributionReceiver intervalId](self, "intervalId");
          v47 = -[APAttributionReceiver attemptId](self, "attemptId");
          *(_DWORD *)buf = 134349312;
          v131 = v46;
          v132 = 2050;
          v133 = v47;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v45, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }
      }

      v48 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
      objc_msgSend(v49, "setServerPostStart:", v48);

      v50 = objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
      v51 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.attr-send-request-to-server");
      v52 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v53 = -[APAttributionReceiver intervalId](self, "intervalId");
      v122 = v39;
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_10009DCF4;
      v118[3] = &unk_100213448;
      v109 = (id)v50;
      v119 = v109;
      v120 = self;
      v108 = v51;
      v121 = v108;
      v110 = (void *)v52;
      LOBYTE(v50) = +[APAttributionServer sendRequestToServer:requestTimestamp:payloadDeliveryTimestamp:interval:error:completionHandler:](APAttributionServer, "sendRequestToServer:requestTimestamp:payloadDeliveryTimestamp:interval:error:completionHandler:", v14, v114, v52, v53, &v122, v118);
      v54 = v122;

      if ((v50 & 1) != 0)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storefront"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
        objc_msgSend(v56, "setStorefrontID:", v55);

        v57 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
        objc_msgSend(v58, "setTokenDaemonEnd:", v57);

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
        if (!v59)
        {
          v124 = NSLocalizedDescriptionKey;
          v125 = CFSTR("Error no signed token available");
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1));
          v89 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v88));

          v16 = v114;
          v75 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v89);
          v18 = v112;
          v112[2](v112, v75);
          v54 = (id)v89;
LABEL_44:

          v17 = v116;
          p_super = &v111->super;
LABEL_45:

          goto LABEL_46;
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleId"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));
        v63 = v62;
        if (v62)
          objc_msgSend(v62, "auditToken");
        else
          memset(v117, 0, sizeof(v117));
        v90 = +[APAttributionAppTracking appTrackingStatus:](APAttributionAppTracking, "appTrackingStatus:", v117);
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toroId"));
        v92 = +[APAttributionCacheElement elementWithToken:andBundle:andAppTrackingStatus:andToroID:](APAttributionCacheElement, "elementWithToken:andBundle:andAppTrackingStatus:andToroID:", v60, v61, v90, v91);

        v93 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
        objc_msgSend(v93, "setStatus:", CFSTR("Success"));

        v94 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
        objc_msgSend(v94, "sendTokenAnalytics");

        v95 = APLogForCategory(4);
        v96 = objc_claimAutoreleasedReturnValue(v95);
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
          *(_DWORD *)buf = 141558274;
          v131 = 1752392040;
          v132 = 2112;
          v133 = (unint64_t)v97;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Token %{mask.hash}@", buf, 0x16u);

        }
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenTracker defaultTracker](APAttributionTokenTracker, "defaultTracker"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleId"));
        v101 = objc_msgSend(v98, "isTokenUsedByOtherBundle:bundleID:", v99, v100);

        v18 = v112;
        if ((v101 & 1) == 0)
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenTracker defaultTracker](APAttributionTokenTracker, "defaultTracker"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleId"));
          objc_msgSend(v102, "addToken:bundleID:", v103, v104);

        }
        if (v113)
          v105 = 2;
        else
          v105 = 3;
        v106 = objc_alloc((Class)AAAttributionResult);
        v75 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signedAttributionToken"));
        v107 = objc_msgSend(v106, "initWithToken:source:", v75, v105);
        v112[2](v112, v107);

      }
      else
      {
        v126 = NSLocalizedDescriptionKey;
        v127 = CFSTR("Error posting to Attribution server");
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
        v74 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v73));

        v75 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v74);
        v18 = v112;
        v112[2](v112, v75);
        v54 = (id)v74;
      }
      v16 = v114;
      goto LABEL_44;
    }
    v115 = v15;
    v70 = v16;
    v71 = v18;
    if (v38)
    {
      if (objc_msgSend(v38, "code") == (id)3)
      {
        v72 = &kAttributionAnalyticsTokenStatusErrorMetaDataBundleID;
LABEL_27:
        v76 = *v72;
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
        objc_msgSend(v77, "setStatus:", v76);

        goto LABEL_28;
      }
      if (objc_msgSend(v39, "code") == (id)2)
      {
        v72 = &kAttributionAnalyticsTokenStatusErrorMetaDataNoData;
        goto LABEL_27;
      }
    }
LABEL_28:
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v78, "sendTokenAnalytics");

    v128 = NSLocalizedDescriptionKey;
    v129 = CFSTR("Error loading data from iTunesMetadata");
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1));
    v54 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v79));

    v80 = objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v54);
    v18 = v71;
    v71[2](v71, v80);

    v81 = APPerfLogForCategory(4);
    p_super = objc_claimAutoreleasedReturnValue(v81);
    v83 = -[APAttributionReceiver intervalId](self, "intervalId");
    if (v83 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v116;
      v16 = v70;
    }
    else
    {
      v84 = v83;
      v17 = v116;
      v16 = v70;
      if (os_signpost_enabled(p_super))
      {
        v85 = p_super;
        v86 = -[APAttributionReceiver intervalId](self, "intervalId");
        v87 = -[APAttributionReceiver attemptId](self, "attemptId");
        *(_DWORD *)buf = 134349312;
        v131 = v86;
        p_super = v85;
        v132 = 2050;
        v133 = v87;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_END, v84, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }
    v15 = v115;
    goto LABEL_45;
  }
  if (v17)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v64, "setStatus:", CFSTR("ErrorTokenSigning"));

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v17, "code")));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringValue"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v67, "setErrorCode:", v66);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v68, "sendTokenAnalytics");

  }
  v134 = NSLocalizedDescriptionKey;
  v135 = CFSTR("Error generating token");
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
  v54 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v69));

  v37 = (APItunesMetaData *)objc_msgSend(objc_alloc((Class)AAAttributionResult), "initWithError:", v54);
  v18[2](v18, v37);
LABEL_46:

}

- (void)attributionAnalytics:(unint64_t)a3 end:(unint64_t)a4 Handler:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, uint64_t, _QWORD);

  v14 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a4 >= a3
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics")),
        v9 = objc_msgSend(v8, "tokenDaemonStart"),
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v10, "setStart:", a3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v11, "setEnd:", a4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver analytics](self, "analytics"));
    objc_msgSend(v12, "sendAnalytics");

    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  v14[2](v14, v13, 0);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___AAAttribution_XPC;
}

- (id)remoteObjectInterface
{
  return &OBJC_PROTOCOL___AAAttribution_XPC;
}

- (void)terminateConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionReceiver connection](self, "connection"));
    objc_msgSend(v4, "invalidate");

    -[APAttributionReceiver setConnection:](self, "setConnection:", 0);
  }
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (APAttributionAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (unint64_t)serverRetries
{
  return self->_serverRetries;
}

- (void)setServerRetries:(unint64_t)a3
{
  self->_serverRetries = a3;
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (unint64_t)attemptId
{
  return self->_attemptId;
}

- (void)setAttemptId:(unint64_t)a3
{
  self->_attemptId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
