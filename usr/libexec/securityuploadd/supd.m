@implementation supd

- (void)setupTopics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  SFAnalyticsTopic *v14;
  void *v15;
  SFAnalyticsTopic *v16;
  NSArray *v17;
  NSArray *analyticsTopics;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/Frameworks/Security.framework")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("SFAnalytics"), CFSTR("plist")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_topicsSamplingRates, "objectForKeyedSubscript:", v12, (_QWORD)v19));
        v14 = [SFAnalyticsTopic alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));
        v16 = -[SFAnalyticsTopic initWithDictionary:name:samplingRates:](v14, "initWithDictionary:name:samplingRates:", v15, v12, v13);

        objc_msgSend(v6, "addObject:", v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v17 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  analyticsTopics = self->_analyticsTopics;
  self->_analyticsTopics = v17;

}

- (void)setupSamplingRates
{
  void *v3;
  CFURLRef v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *v27;
  NSDictionary *topicsSamplingRates;
  NSDictionary *v29;
  uint64_t v30;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/Security/Certificates.bundle")));
  v4 = sub_100010C24(CFSTR("private/var/protected/"), (uint64_t)CFSTR("trustd/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByAppendingPathComponent:isDirectory:](v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("SupplementalsAssets/"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("AssetVersion"), CFSTR("plist")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v6));

  if (v7 && (v8 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MobileAssetContentVersion")));
    if (v9 && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
      v11 = v9;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("OTAPKIContext.plist")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v12));

  if (v13 && (v14 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MobileAssetContentVersion")));
    if (v15 && (v16 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
      v17 = v15;
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  if (!v11 || !v17)
  {

    goto LABEL_27;
  }
  v18 = objc_msgSend(v17, "compare:", v11);

  if (v18 != (id)1)
    goto LABEL_27;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.plist"), CFSTR("AnalyticsSamplingRates")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v20));
  v22 = sub_100010B28("supd");
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "read sampling rates from SupplementalsAssets dir", buf, 2u);
  }

  if (!v21 || (v24 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v21, v24) & 1) == 0))
  {

LABEL_27:
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("AnalyticsSamplingRates"), CFSTR("plist")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v25));

    if (!v21)
      goto LABEL_33;
    goto LABEL_28;
  }

LABEL_28:
  v26 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v21, v26) & 1) != 0)
  {
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Topics")));
    topicsSamplingRates = self->_topicsSamplingRates;
    self->_topicsSamplingRates = v27;

    v29 = self->_topicsSamplingRates;
    if (!v29)
    {
LABEL_32:
      self->_topicsSamplingRates = 0;

      goto LABEL_33;
    }
    v30 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v21, v30) & 1) == 0)
    {
      v29 = self->_topicsSamplingRates;
      goto LABEL_32;
    }
  }
LABEL_33:

}

- (supd)initWithConnection:(id)a3 reporter:(id)a4
{
  id v7;
  id v8;
  supd *v9;
  supd *v10;
  supd *v11;
  _QWORD block[4];
  supd *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)supd;
  v9 = -[supd init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_reporter, a4);
    -[supd setupSamplingRates](v10, "setupSamplingRates");
    -[supd setupTopics](v10, "setupTopics");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EE30;
    block[3] = &unk_100018868;
    v11 = v10;
    v14 = v11;
    if (qword_10001DB88 != -1)
    {
      dispatch_once(&qword_10001DB88, block);
      v11 = v14;
    }

  }
  return v10;
}

- (supd)initWithConnection:(id)a3
{
  id v4;
  SFAnalyticsReporter *v5;
  supd *v6;

  v4 = a3;
  v5 = objc_alloc_init(SFAnalyticsReporter);
  v6 = -[supd initWithConnection:reporter:](self, "initWithConnection:reporter:", v4, v5);

  return v6;
}

- (void)sendNotificationForOncePerReportSamplers
{
  notify_post(SFAnalyticsFireSamplersNotification);
  +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 3.0);
}

- (void)performRegularlyScheduledUpload
{
  const void *v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  const void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const void *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = sub_100010B28("upload");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting uploads in response to regular trigger", buf, 2u);
  }

  v13 = 0;
  v5 = -[supd uploadAnalyticsWithError:force:](self, "uploadAnalyticsWithError:force:", &v13, 0);
  v6 = v13;
  if (v5)
  {
    v7 = sub_100010B28("upload");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Regularly scheduled upload successful";
      v10 = v8;
      v11 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    v12 = sub_100010B28("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      v9 = "upload: Failed to complete regularly scheduled upload: %@";
      v10 = v8;
      v11 = 12;
      goto LABEL_8;
    }
  }

}

- (BOOL)uploadAnalyticsWithError:(id *)a3 force:(BOOL)a4
{
  uint64_t v4;
  NSArray *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  const void *v21;
  uint64_t v22;
  id *v23;
  NSArray *v24;
  uint64_t v25;
  void *v26;
  id v27;
  BOOL v28;
  char v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  SFAnalyticsReporter *reporter;
  void *v40;
  const void *v41;
  NSObject *v42;
  unsigned int v43;
  const void *v44;
  NSObject *v45;
  void *v46;
  const void *v47;
  void *v48;
  void *v49;
  id v51;
  const void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  const void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  char v60;
  id v61;
  const void *v62;
  NSObject *v63;
  void *v64;
  char v65;
  id v66;
  id *v68;
  unsigned int v69;
  NSArray *v70;
  char v71;
  void *v72;
  char v73;
  uint64_t v74;
  void *v75;
  id obj;
  uint64_t v77;
  id v78;
  supd *v79;
  void *context;
  void *v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  id v97;
  _BYTE v98[128];

  v4 = a4;
  -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v79 = self;
  v7 = self->_analyticsTopics;
  v78 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
  v8 = 0;
  v9 = 0;
  if (!v78)
  {
    v73 = 0;
    goto LABEL_83;
  }
  v73 = 0;
  v77 = *(_QWORD *)v90;
  v70 = v7;
  v69 = v4;
  v68 = a3;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v90 != v77)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v10);
      v12 = objc_autoreleasePoolPush();
      if (!v8)
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "splunkUploadURL:urlSession:", v4, v8));
      context = v12;
      if (!v13)
      {
        v21 = sub_100010B28("upload");
        v15 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
          v17 = v8;
          v18 = (void *)v22;
          *(_DWORD *)buf = 138412290;
          v95 = v22;
          v19 = v15;
          v20 = "Skipping upload for %@ because no endpoint";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

          v8 = v17;
        }
LABEL_15:

        objc_autoreleasePoolPop(context);
        goto LABEL_16;
      }
      if (objc_msgSend(v11, "disableUploads"))
      {
        v14 = sub_100010B28("upload");
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
          v17 = v8;
          v18 = (void *)v16;
          *(_DWORD *)buf = 138412290;
          v95 = v16;
          v19 = v15;
          v20 = "Aborting upload task for %@ because uploads are disabled";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      v23 = a3;
      v24 = v7;
      v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v88 = v9;
      v75 = (void *)v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createChunkedLoggingJSON:forUpload:participatingClients:force:error:", 0, 1));
      v27 = v88;

      v72 = v26;
      if (v26)
        v28 = v27 == 0;
      else
        v28 = 0;
      v29 = v28;
      v81 = v8;
      v71 = v29;
      if (!v28)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "domain"));
        if (objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.security.supd")))
        {
          v51 = objc_msgSend(v27, "code");

          v28 = v51 == (id)2;
          v7 = v70;
          a3 = v23;
          if (!v28)
          {
LABEL_59:
            v56 = sub_100010B28("SecError");
            v55 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
              *(_DWORD *)buf = 138412546;
              v95 = (uint64_t)v57;
              v96 = 2112;
              v97 = v27;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "upload: failed to create chunked log events for logging topic %@: %@", buf, 0x16u);

            }
            goto LABEL_73;
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v11, "updateUploadDateForClients:date:clearData:", v75, v49, 1);
        }
        else
        {
          v7 = v24;
          a3 = v23;
        }

        goto LABEL_59;
      }
      if (objc_msgSend(v11, "isSampledUpload"))
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        obj = v26;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
        if (v30)
        {
          v31 = v30;
          v32 = 0;
          v33 = *(_QWORD *)v85;
          v74 = *(_QWORD *)v85;
LABEL_29:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v85 != v33)
              objc_enumerationMutation(obj);
            v35 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v34);
            v36 = objc_autoreleasePoolPush();
            v83 = v32;
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[supd serializeLoggingEvent:error:](supd, "serializeLoggingEvent:error:", v35, &v83));
            v9 = v83;

            if (!v37 || v9 != 0)
              break;
            reporter = v79->_reporter;
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
            LOBYTE(reporter) = -[SFAnalyticsReporter saveReport:fileName:](reporter, "saveReport:fileName:", v37, v40);

            if ((reporter & 1) == 0)
            {
              v41 = sub_100010B28("SecError");
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "upload: failed to write analytics data to log", buf, 2u);
              }

            }
            v82 = 0;
            v43 = objc_msgSend(v11, "postJSON:toEndpoint:postSession:error:", v37, v13, v81, &v82);
            v32 = v82;
            if (v43)
            {
              v44 = sub_100010B28("upload");
              v45 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
                *(_DWORD *)buf = 138412290;
                v95 = (uint64_t)v46;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Successfully posted JSON for %@", buf, 0xCu);

                v33 = v74;
              }
              v73 = 1;
            }
            else
            {
              v47 = sub_100010B28("SecError");
              v45 = objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
                *(_DWORD *)buf = 138412546;
                v95 = (uint64_t)v48;
                v96 = 2112;
                v97 = v32;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "upload: Failed to post JSON for %@: %@", buf, 0x16u);

                v33 = v74;
              }
            }

            objc_autoreleasePoolPop(v36);
            if (v31 == (id)++v34)
            {
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
              if (v31)
                goto LABEL_29;
              goto LABEL_65;
            }
          }
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
          v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.security.supd"));
          v60 = v59;
          if (v59)
          {
            v61 = objc_msgSend(v9, "code");

            v7 = v70;
            if (v61 == (id)2)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              objc_msgSend(v11, "updateUploadDateForClients:date:clearData:", v75, v58, 1);
              goto LABEL_67;
            }
            v60 = 0;
          }
          else
          {
            v7 = v70;
LABEL_67:

          }
          v62 = sub_100010B28("SecError");
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
            *(_DWORD *)buf = 138412546;
            v95 = (uint64_t)v64;
            v96 = 2112;
            v97 = v9;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "upload: failed to serialized chunked log events for logging topic %@: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v36);

          v4 = v69;
          a3 = v68;
          if ((v60 & 1) != 0)
            goto LABEL_74;
        }
        else
        {
          v32 = 0;
LABEL_65:

          v9 = v32;
          v4 = v69;
          a3 = v68;
          v7 = v70;
        }
        v55 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v11, "updateUploadDateForClients:date:clearData:", v75, v55, 1);
        v27 = v9;
        goto LABEL_73;
      }
      v7 = v24;
      v52 = sub_100010B28("upload");
      v53 = objc_claimAutoreleasedReturnValue(v52);
      a3 = v23;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalTopicName"));
        *(_DWORD *)buf = 138412290;
        v95 = (uint64_t)v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "skipping unsampled upload for %@ and clearing data", buf, 0xCu);

      }
      v55 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v11, "updateUploadDateForClients:date:clearData:", v75, v55, 1);
      v27 = 0;
LABEL_73:

      v9 = v27;
LABEL_74:

      objc_autoreleasePoolPop(context);
      v65 = v71 ^ 1;
      if (!a3)
        v65 = 1;
      if ((v65 & 1) != 0)
      {
        v8 = v81;
      }
      else
      {
        v8 = v81;
        if (v9)
        {
          v9 = objc_retainAutorelease(v9);
          *a3 = v9;
        }
      }
LABEL_16:
      v10 = (char *)v10 + 1;
    }
    while (v10 != v78);
    v66 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    v78 = v66;
  }
  while (v66);
LABEL_83:

  return v73 & 1;
}

- (id)sysdiagnoseStringForEventRecord:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("topic"));
  v6 = SFAnalyticsEventTime;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", SFAnalyticsEventTime));
  objc_msgSend(v7, "doubleValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8 / 1000.0));

  objc_msgSend(v5, "removeObjectForKey:", v6);
  v10 = SFAnalyticsEventType;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFAnalyticsEventType));
  objc_msgSend(v5, "removeObjectForKey:", v10);
  v12 = SFAnalyticsEventClassKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", SFAnalyticsEventClassKey));
  v14 = objc_msgSend(v13, "integerValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[supd stringForEventClass:](self, "stringForEventClass:", v14));
  objc_msgSend(v5, "removeObjectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v16, "appendString:", CFSTR(" - Attributes: {"));
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 1;
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_10000EDA0;
    v23 = &unk_100018890;
    v25 = v26;
    v17 = v16;
    v24 = v17;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v20);
    objc_msgSend(v17, "appendString:", CFSTR(" }"));

    _Block_object_dispose(v26, 8);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@: %@%@"), v9, v15, v11, v16, v20, v21, v22, v23));

  return v18;
}

- (id)getSysdiagnoseDump
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *obj;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  supd *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_analyticsTopics;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = v4;
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topicClients"));
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v22;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
              v17[0] = _NSConcreteStackBlock;
              v17[1] = 3221225472;
              v17[2] = sub_10000EC04;
              v17[3] = &unk_1000188B8;
              v18 = v3;
              v19 = v11;
              v20 = self;
              objc_msgSend(v11, "withStore:", v17);

              v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v8);
        }

        v4 = v16 + 1;
      }
      while ((id)(v16 + 1) != v15);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v15);
  }

  return v3;
}

- (id)stringForEventClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("EventUnknown");
  else
    return off_100018990[a3];
}

- (BOOL)checkSupdEntitlement
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[supd connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.private.securityuploadd")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)getSysdiagnoseDumpWithReply:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[supd getSysdiagnoseDump](self, "getSysdiagnoseDump"));
    v5[2](v5, v4);

  }
  else
  {
    v5[2](v5, CFSTR("client not entitled"));
  }

}

- (void)createLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *);
  const void *v9;
  NSObject *v10;
  NSArray *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  const void *v26;
  NSObject *v27;
  void (**v28)(id, void *, void *);
  _BOOL4 v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v29 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *))a5;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v9 = sub_100010B28("rpcCreateLoggingJSON");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Building a JSON blob resembling the one we would have uploaded", buf, 2u);
    }

    -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = self->_analyticsTopics;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v12)
    {
      v13 = v12;
      v28 = v8;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "internalTopicName", v28));
          v20 = objc_msgSend(v19, "isEqualToString:", v7);

          if (v20)
          {
            v31 = v14;
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createLoggingJSON:forUpload:participatingClients:force:error:", v29, 0, 0, 1, &v31));
            v22 = v31;

            v14 = v22;
            v15 = (void *)v21;
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v13);

      if (v15)
      {
        v23 = objc_autoreleasePoolPush();
        v30 = v14;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, v29, &v30));
        v25 = v30;

        objc_autoreleasePoolPop(v23);
        v14 = v25;
        v8 = v28;
LABEL_21:
        v8[2](v8, v24, v14);

        goto LABEL_22;
      }
      v8 = v28;
    }
    else
    {

      v14 = 0;
    }
    v26 = sub_100010B28("SecError");
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to obtain JSON: %@", buf, 0xCu);
    }

    v15 = 0;
    v24 = 0;
    goto LABEL_21;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
  v8[2](v8, 0, v14);
LABEL_22:

}

- (void)createChunkedLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  const void *v9;
  NSObject *v10;
  NSArray *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const void *v26;
  void (**v27)(id, void *, id);
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSObject *v36;
  _BYTE v37[128];

  v28 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v9 = sub_100010B28("rpcCreateChunkedLoggingJSON");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Building an array of JSON blobs resembling the one we would have uploaded", buf, 2u);
    }

    -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = self->_analyticsTopics;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v13 = v12;
      v27 = v8;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "internalTopicName", v27));
          v20 = objc_msgSend(v19, "isEqualToString:", v7);

          if (v20)
          {
            v30 = v14;
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createChunkedLoggingJSON:forUpload:participatingClients:force:error:", v28, 0, 0, 1, &v30));
            v22 = v30;

            v14 = v22;
            v15 = (void *)v21;
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v13);

      v23 = objc_autoreleasePoolPush();
      if (v15)
      {
        v29 = v14;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, v28, &v29));
        v25 = v29;
        v8 = v27;
LABEL_21:

        objc_autoreleasePoolPop(v23);
        v8[2](v8, v24, v25);

        goto LABEL_22;
      }
      v25 = v14;
      v8 = v27;
    }
    else
    {

      v23 = objc_autoreleasePoolPush();
      v25 = 0;
    }
    v26 = sub_100010B28("SecError");
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unable to obtain JSON: %@", buf, 0xCu);
    }
    v15 = 0;
    v24 = 0;
    goto LABEL_21;
  }
  v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
  v8[2](v8, 0, v25);
LABEL_22:

}

- (void)forceUploadWithReply:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  const void *v5;
  NSObject *v6;
  _BOOL8 v7;
  id v8;
  const void *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;

  v4 = (void (**)(id, _BOOL8, id))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v5 = sub_100010B28("upload");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Performing upload in response to rpc message", buf, 2u);
    }

    v13 = 0;
    v7 = -[supd uploadAnalyticsWithError:force:](self, "uploadAnalyticsWithError:force:", &v13, 1);
    v8 = v13;
    v9 = sub_100010B28("upload");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("failure");
      if (v7)
        v11 = CFSTR("success");
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Result of manually triggered upload: %@, error: %@", buf, 0x16u);
    }

    v4[2](v4, v7, v8);
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
    ((void (*)(void (**)(id, _BOOL8, id), _QWORD))v4[2])(v4, 0);

  }
}

- (void)setUploadDateWith:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_analyticsTopics;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topicClients", (_QWORD)v16));
          objc_msgSend(v13, "updateUploadDateForClients:date:clearData:", v14, v6, 0);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v15);

  }
}

- (void)clientStatus:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  NSArray *obj;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_analyticsTopics;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v16)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topicClients"));
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(_QWORD *)v21 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
                v17[0] = _NSConcreteStackBlock;
                v17[1] = 3221225472;
                v17[2] = sub_10000EB64;
                v17[3] = &unk_1000188E0;
                v18 = v5;
                v19 = v13;
                objc_msgSend(v13, "withStore:", v17);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v10);
          }

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    v4[2](v4, v5, 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v5);
  }

}

- (void)fixFiles:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  unsigned __int8 v7;
  TrustdFileHelper *v8;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[supd connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.trustd.FileHelp")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc_init(TrustdFileHelper);
    -[TrustdFileHelper fixFiles:](v8, "fixFiles:", v4);
  }
  else
  {
    v8 = (TrustdFileHelper *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
    v4[2](v4, 0);
  }

}

- (NSArray)analyticsTopics
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (SFAnalyticsReporter)reporter
{
  return (SFAnalyticsReporter *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)topicsSamplingRates
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTopicsSamplingRates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_topicsSamplingRates, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_analyticsTopics, 0);
}

+ (id)serializeLoggingEvent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  id v12;

  v5 = a3;
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v12 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 0, &v12));
    v8 = v12;
    objc_autoreleasePoolPop(v6);
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v10 = v7;
    }
    else
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.supd"), 3, 0));
  }

  return v10;
}

@end
