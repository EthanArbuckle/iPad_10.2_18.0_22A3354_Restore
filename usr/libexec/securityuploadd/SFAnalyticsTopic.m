@implementation SFAnalyticsTopic

- (void)setupClientsForTopic:(id)a3
{
  NSMutableArray *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSArray *topicClients;
  id v25;
  id v26;
  id v27;

  v27 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicKeySync))
  {
    v5 = objc_msgSend((id)objc_opt_class(self), "databasePathForCKKS");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:](SFAnalyticsClient, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:", CFSTR("ckks"), v6, 0, 1));
    -[NSMutableArray addObject:](v4, "addObject:", v7);

    v8 = objc_msgSend((id)objc_opt_class(self), "databasePathForSOS");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:](SFAnalyticsClient, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:", CFSTR("sos"), v9, 0, 1));
    -[NSMutableArray addObject:](v4, "addObject:", v10);

    v11 = objc_msgSend((id)objc_opt_class(self), "databasePathForPCS");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:](SFAnalyticsClient, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:", CFSTR("pcs"), v12, 0, 1));
    -[NSMutableArray addObject:](v4, "addObject:", v13);

    v14 = objc_msgSend((id)objc_opt_class(self), "databasePathForLocal");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = CFSTR("local");
LABEL_9:
    v20 = v15;
    v21 = 1;
    v22 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicCloudServices))
  {
    v17 = objc_msgSend((id)objc_opt_class(self), "databasePathForCloudServices");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v16 = CFSTR("CloudServices");
    goto LABEL_9;
  }
  if (objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicTrust))
  {
    v18 = objc_msgSend((id)objc_opt_class(self), "databasePathForTrust");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v16 = CFSTR("trust");
    goto LABEL_9;
  }
  if (objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicNetworking))
  {
    v19 = objc_msgSend((id)objc_opt_class(self), "databasePathForNetworking");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v16 = CFSTR("networking");
    goto LABEL_9;
  }
  if (objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicTransparency))
  {
    -[SFAnalyticsTopic setTerseMetrics:](self, "setTerseMetrics:", 1);
    v25 = objc_msgSend((id)objc_opt_class(self), "databasePathForTransparency");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v16 = CFSTR("transparency");
  }
  else
  {
    if (!objc_msgSend(v27, "isEqualToString:", SFAnalyticsTopicSWTransparency))
      goto LABEL_11;
    -[SFAnalyticsTopic setTerseMetrics:](self, "setTerseMetrics:", 1);
    v26 = objc_msgSend((id)objc_opt_class(self), "databasePathForSWTransparency");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v16 = CFSTR("swtransparency");
  }
  v20 = v15;
  v21 = 0;
  v22 = 1;
LABEL_10:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:](SFAnalyticsClient, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:", v16, v20, v21, v22));
  -[NSMutableArray addObject:](v4, "addObject:", v23);

LABEL_11:
  topicClients = self->_topicClients;
  self->_topicClients = &v4->super;

}

- (SFAnalyticsTopic)initWithDictionary:(id)a3 name:(id)a4 samplingRates:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFAnalyticsTopic *v11;
  SFAnalyticsTopic *v12;
  uint64_t v13;
  NSString *splunkTopicName;
  void *v15;
  uint64_t v16;
  NSURL *splunkUploadURL;
  void *v18;
  uint64_t v19;
  NSURL *splunkBagURL;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  int has_internal_diagnostics;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  uint64_t v42;
  unint64_t v43;
  const void *v44;
  NSObject *v45;
  NSString *internalTopicName;
  unint64_t secondsBetweenUploads;
  unint64_t maxEventsToReport;
  double devicePercentage;
  void *v51;
  id v52;
  void *v53;
  objc_super v54;
  uint8_t buf[4];
  NSString *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  double v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)SFAnalyticsTopic;
  v11 = -[SFAnalyticsTopic init](&v54, "init");
  v12 = v11;
  if (v11)
  {
    v11->_terseMetrics = 0;
    objc_storeStrong((id *)&v11->_internalTopicName, a4);
    v52 = v9;
    -[SFAnalyticsTopic setupClientsForTopic:](v12, "setupClientsForTopic:", v9);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("splunk_topic")));
    splunkTopicName = v12->_splunkTopicName;
    v12->_splunkTopicName = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("splunk_uploadURL")));
    v16 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));
    splunkUploadURL = v12->__splunkUploadURL;
    v12->__splunkUploadURL = (NSURL *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("splunk_bagURL")));
    v19 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
    splunkBagURL = v12->_splunkBagURL;
    v12->_splunkBagURL = (NSURL *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("splunk_allowInsecureCertificate")));
    v12->_allowInsecureSplunkCert = objc_msgSend(v21, "BOOLValue");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("uploadSizeLimit")));
    v12->_uploadSizeLimit = (unint64_t)objc_msgSend(v22, "unsignedIntegerValue");

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("splunk_endpointDomain")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("disableClientId")));

    if (v23)
      v12->_disableClientId = 1;
    v24 = objc_alloc((Class)NSUserDefaults);
    v25 = objc_msgSend(v24, "initWithSuiteName:", SFAnalyticsUserDefaultsSuite);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringForKey:", CFSTR("splunk_topic")));
    if (v26)
      objc_storeStrong((id *)&v12->_splunkTopicName, v26);
    v51 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringForKey:", CFSTR("splunk_uploadURL")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v27));

    if (v28)
      objc_storeStrong((id *)&v12->__splunkUploadURL, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringForKey:", CFSTR("splunk_bagURL")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v29));

    if (v30)
      objc_storeStrong((id *)&v12->_splunkBagURL, v30);
    v31 = (uint64_t)objc_msgSend(v25, "integerForKey:", CFSTR("uploadSizeLimit"));
    if (v31 >= 1)
      v12->_uploadSizeLimit = v31;
    v12->_allowInsecureSplunkCert |= objc_msgSend(v25, "BOOLForKey:", CFSTR("splunk_allowInsecureCertificate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringForKey:", CFSTR("splunk_endpointDomain")));
    v33 = v32;
    if (v32)
    {
      v34 = v32;

      v53 = v34;
    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.security");
    if (v10)
    {
      if (has_internal_diagnostics)
        v36 = CFSTR("SecondsBetweenUploadsInternal");
      else
        v36 = CFSTR("SecondsBetweenUploadsCustomer");
      if (has_internal_diagnostics)
        v37 = CFSTR("DevicePercentageInternal");
      else
        v37 = CFSTR("DevicePercentageCustomer");
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v36));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v37));
      v12->_secondsBetweenUploads = (unint64_t)objc_msgSend(v38, "integerValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NumberOfEvents")));
      v12->_maxEventsToReport = (unint64_t)objc_msgSend(v40, "unsignedIntegerValue");

      objc_msgSend(v39, "floatValue");
      v12->_devicePercentage = v41;

    }
    else
    {
      v42 = 259200;
      if (has_internal_diagnostics)
        v42 = 86400;
      v43 = SFAnalyticsMaxEventsToReport;
      v12->_secondsBetweenUploads = v42;
      v12->_maxEventsToReport = v43;
      v12->_devicePercentage = 100.0;
    }
    v44 = sub_100010B28("supd");
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = v12->_internalTopicName;
      secondsBetweenUploads = v12->_secondsBetweenUploads;
      maxEventsToReport = v12->_maxEventsToReport;
      devicePercentage = v12->_devicePercentage;
      *(_DWORD *)buf = 138413058;
      v56 = internalTopicName;
      v57 = 2048;
      v58 = secondsBetweenUploads;
      v59 = 2048;
      v60 = maxEventsToReport;
      v61 = 2048;
      v62 = devicePercentage;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "created %@ with %lu seconds between uploads, %lu max events, %f percent of uploads", buf, 0x2Au);
    }

    v9 = v52;
  }

  return v12;
}

- (BOOL)isSampledUpload
{
  uint32_t v3;
  double devicePercentage;

  v3 = arc4random();
  devicePercentage = self->_devicePercentage;
  if (devicePercentage >= 0.0000000232830644)
  {
    if (devicePercentage / 100.0 * 4294967300.0 < (double)v3)
      return 0;
  }
  else if (v3)
  {
    return 0;
  }
  return 1;
}

- (id)getSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("securityd/%s"), "61439.0.138.0.1", CFSTR("User-Agent")));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v3, "setHTTPAdditionalHeaders:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, self, 0));
  return v6;
}

- (BOOL)postJSON:(id)a3 toEndpoint:(id)a4 postSession:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  NSString *internalTopicName;
  dispatch_time_t v21;
  BOOL v22;
  _QWORD v24[5];
  id v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  NSString *v33;
  NSErrorUserInfoKey v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = objc_alloc_init((Class)NSMutableURLRequest);
    objc_msgSend(v13, "setURL:", v11);
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "supd_gzipDeflate"));
    objc_msgSend(v13, "setHTTPBody:", v14);

    objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
    v15 = dispatch_semaphore_create(0);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000C09C;
    v24[3] = &unk_100018690;
    v24[4] = self;
    v27 = &v28;
    v25 = v11;
    v16 = v15;
    v26 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v13, v24));
    v18 = sub_100010B28("upload");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = self->_internalTopicName;
      *(_DWORD *)buf = 138412290;
      v33 = internalTopicName;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Splunk upload start for %@", buf, 0xCu);
    }

    objc_msgSend(v17, "resume");
    v21 = dispatch_time(0, 300000000000);
    dispatch_semaphore_wait(v16, v21);
    v22 = *((_BYTE *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    if (!a6)
    {
      v22 = 0;
      goto LABEL_8;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No endpoint for %@"), self->_internalTopicName));
    v34 = NSLocalizedDescriptionKey;
    v35 = v13;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SupdUploadErrorDomain"), -10, v16));
  }

LABEL_8:
  return v22;
}

- (BOOL)eventIsBlacklisted:(id)a3
{
  NSArray *blacklistedEvents;
  void *v4;
  unsigned __int8 v5;

  blacklistedEvents = self->_blacklistedEvents;
  if (!blacklistedEvents)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", SFAnalyticsEventType));
  v5 = -[NSArray containsObject:](blacklistedEvents, "containsObject:", v4);

  return v5;
}

- (void)removeBlacklistedFieldsFromEvent:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_blacklistedFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addRequiredFieldsToEvent:(id)a3
{
  id v4;
  NSDictionary *metricsBase;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  metricsBase = self->_metricsBase;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C028;
  v7[3] = &unk_1000186B8;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](metricsBase, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)prepareEventForUpload:(id)a3 linkedUUID:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  NSString *splunkTopicName;
  void *v10;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[SFAnalyticsTopic eventIsBlacklisted:](self, "eventIsBlacklisted:", v6);
  if ((v8 & 1) == 0)
  {
    -[SFAnalyticsTopic removeBlacklistedFieldsFromEvent:](self, "removeBlacklistedFieldsFromEvent:", v6);
    -[SFAnalyticsTopic addRequiredFieldsToEvent:](self, "addRequiredFieldsToEvent:", v6);
    if (self->_disableClientId)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10001A240, CFSTR("clientId"));
    splunkTopicName = self->_splunkTopicName;
    if (!splunkTopicName)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("topic"));

      if (!v7)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", splunkTopicName, CFSTR("topic"));
    if (v7)
    {
LABEL_6:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("eventLinkID"));

    }
  }
LABEL_7:

  return v8 ^ 1;
}

- (void)addFailures:(id)a3 toUploadRecords:(id)a4 threshold:(unint64_t)a5 linkedUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *j;
  id v22;
  id v23;
  unint64_t maxEventsToReport;
  id v25;
  double v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  void *v32;
  void *v33;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v9 = a3;
  v35 = a4;
  v10 = a6;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000BE10;
        v47[3] = &unk_1000186E0;
        v50 = a5;
        v47[4] = self;
        v48 = v10;
        v49 = v35;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v47);

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v12);
  }
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v43 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v16);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j), "count");
        v19 += ((uint64_t)v22 - a5) & ~((uint64_t)((uint64_t)v22 - a5) >> 63);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v23 = objc_msgSend(v35, "count");
  maxEventsToReport = self->_maxEventsToReport;
  if ((unint64_t)v23 < maxEventsToReport && v19 >= 1)
  {
    v25 = objc_msgSend(v35, "count");
    v39 = 0u;
    v40 = 0u;
    if ((double)(maxEventsToReport - (unint64_t)v25) / (double)v19 <= 1.0)
      v26 = (double)(maxEventsToReport - (unint64_t)v25) / (double)v19;
    else
      v26 = 1.0;
    v41 = 0uLL;
    v42 = 0uLL;
    v27 = v16;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k);
          if ((unint64_t)objc_msgSend(v32, "count") > a5)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "subarrayWithRange:", a5, (unint64_t)(v26 * (double)((unint64_t)objc_msgSend(v32, "count") - a5))));
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10000BFDC;
            v36[3] = &unk_100018708;
            v36[4] = self;
            v37 = v10;
            v38 = v35;
            objc_msgSend(v33, "enumerateObjectsUsingBlock:", v36);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v29);
    }

  }
}

- (id)sampleStatisticsForSamples:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
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

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (unint64_t)objc_msgSend(v6, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingSelector:", "compare:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v10));
  v68 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));

  if (v9 == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v7);
LABEL_16:

    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("average:"), v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "expressionValueWithObject:context:", 0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-avg"), v7));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

  if (!-[SFAnalyticsTopic terseMetrics](self, "terseMetrics"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("stddev:"), v12));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "expressionValueWithObject:context:", 0, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-dev"), v7));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("min:"), v12));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "expressionValueWithObject:context:", 0, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-min"), v7));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("max:"), v12));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "expressionValueWithObject:context:", 0, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-max"), v7));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("median:"), v12));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "expressionValueWithObject:context:", 0, 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-med"), v7));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v28);

  }
  if (v9 >= 4 && !-[SFAnalyticsTopic terseMetrics](self, "terseMetrics"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-1q"), v7));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-3q"), v7));
    if ((v9 & 1) != 0)
    {
      if ((v9 & 3) == 3)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9 >> 2));
        objc_msgSend(v63, "doubleValue");
        v50 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (v9 >> 2) + 1));
        objc_msgSend(v51, "doubleValue");
        v42 = 0.25;
        v65 = v29;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v52 + v50 * 3.0) * 0.25));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, v13);

        v54 = 3 * (v9 >> 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v54 + 1));
        objc_msgSend(v61, "doubleValue");
        v56 = v55;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v54 + 2));
        objc_msgSend(v34, "doubleValue");
        v48 = v56 + v57 * 3.0;
      }
      else
      {
        if ((v9 & 3) != 1)
        {
LABEL_15:

          goto LABEL_16;
        }
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (v9 >> 2) - 1));
        objc_msgSend(v62, "doubleValue");
        v39 = v38;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9 >> 2));
        objc_msgSend(v40, "doubleValue");
        v42 = 0.25;
        v65 = v29;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v39 + v41 * 3.0) * 0.25));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, v13);

        v44 = 3 * (v9 >> 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v44));
        objc_msgSend(v61, "doubleValue");
        v46 = v45;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v44 + 1));
        objc_msgSend(v34, "doubleValue");
        v48 = v47 + v46 * 3.0;
      }
      v29 = v65;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v48 * v42));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, v65);
    }
    else
    {
      v30 = v9 >> 1;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v30));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v60));
      v67 = v59;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("median:"), v31));
      v64 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "expressionValueWithObject:context:", 0, 0));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, v13);

      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", v30, v30));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:"));
      v66 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("median:"), v35));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "expressionValueWithObject:context:", 0, 0));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, v64);

      v29 = v64;
    }

    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (id)healthSummaryWithName:(id)a3 store:(id)a4 uuid:(id)a5 timestamp:(id)a6 lastUploadTime:(id)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const void *v35;
  NSObject *v36;
  const void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v53[6];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[9];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[2];
  _QWORD v78[2];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  uint64_t v82;
  _BYTE v83[128];

  v11 = a3;
  v51 = a4;
  v46 = a5;
  v47 = a6;
  v48 = a7;
  v49 = v11;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  dispatch_assert_queue_V2(v12);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = sub_100005D88;
  v75 = sub_100005D98;
  v76 = (id)0xAAAAAAAAAAAAAAAALL;
  v76 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@HealthSummary"), v50));
  v44 = SFAnalyticsEventType;
  objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v13);

  if (-[SFAnalyticsTopic eventIsBlacklisted:](self, "eventIsBlacklisted:", v72[5]))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v47, SFAnalyticsEventTime);
    +[SFAnalytics addOSVersionToEvent:](SFAnalytics, "addOSVersionToEvent:", v72[5]);
    if (v48)
      objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v48, SFAnalyticsAttributeLastUploadTime);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "summaryCounts"));
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    if (-[SFAnalyticsTopic terseMetrics](self, "terseMetrics"))
      objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", &off_10001A258, CFSTR("T"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10000BA74;
    v58[3] = &unk_100018730;
    v58[4] = self;
    v58[5] = &v71;
    v58[6] = &v67;
    v58[7] = &v63;
    v58[8] = &v59;
    objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v58);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v68[3]));
    objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v15, SFAnalyticsColumnSuccessCount);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v64[3]));
    objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v16, SFAnalyticsColumnHardFailureCount);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v60[3]));
    objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v17, SFAnalyticsColumnSoftFailureCount);

    if (os_variant_has_internal_diagnostics("com.apple.security"))
      objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("internal"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "metricsAccountID"));
    if (v18)
      objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v18, CFSTR("sfaAccountID"));
    v43 = (void *)v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "samples"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v83, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v55;
      v23 = SFAnalyticsColumnSampleName;
      v24 = SFAnalyticsColumnSampleValue;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v23));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v27));
          v29 = v28 == 0;

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v23));
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, v31);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v23));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v24));
          objc_msgSend(v33, "addObject:", v34);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v83, 16);
      }
      while (v21);
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10000BDC0;
    v53[3] = &unk_100018758;
    v53[4] = self;
    v53[5] = &v71;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v53);
    if (-[SFAnalyticsTopic prepareEventForUpload:linkedUUID:](self, "prepareEventForUpload:linkedUUID:", v72[5], v46))
    {
      if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v72[5]))
      {
        v14 = (id)v72[5];
      }
      else
      {
        v37 = sub_100010B28("SecError");
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = v72[5];
          *(_DWORD *)buf = 138412546;
          v80 = v50;
          v81 = 2112;
          v82 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "json: health summary for client %@ is invalid JSON: %@", buf, 0x16u);
        }

        v78[0] = SFAnalyticsEventTypeErrorEvent;
        v77[0] = v44;
        v77[1] = SFAnalyticsEventErrorDestription;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("JSON:%@HealthSummary"), v50));
        v78[1] = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 2));
        v14 = objc_msgSend(v41, "mutableCopy");

      }
    }
    else
    {
      v35 = sub_100010B28("SecWarning");
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v50;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "supd: health summary for %@ blacklisted", buf, 0xCu);
      }

      v14 = 0;
    }

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);

  }
  _Block_object_dispose(&v71, 8);

  return v14;
}

- (void)updateUploadDateForClients:(id)a3 date:(id)a4 clearData:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a3;
  v8 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10000B908;
        v14[3] = &unk_100018780;
        v15 = v8;
        v16 = v13;
        v17 = a5;
        objc_msgSend(v13, "withStore:", v14);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (unint64_t)serializedEventSize:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  NSErrorUserInfoKey v19;
  NSObject *v20;

  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v5))
  {
    v16 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 0, &v16));
    v8 = v16;
    if (v7)
    {
      v9 = objc_msgSend(v7, "length");

      objc_autoreleasePoolPop(v6);
      goto LABEL_10;
    }
    v15 = sub_100010B28("serializedEventSize");
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to serialize event: %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = sub_100010B28("serializedEventSize");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "invalid JSON object", buf, 2u);
    }

    v19 = NSLocalizedDescriptionKey;
    v12 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Event is not valid JSON: %@"), v5));
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.supd"), 2, v13));

  }
  objc_autoreleasePoolPop(v6);
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v9 = 0;
    *a4 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_10:

  return (unint64_t)v9;
}

- (id)chunkFailureSet:(unint64_t)a3 events:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  const void *v23;
  NSObject *v24;
  void *v26;
  id *v27;
  void *v28;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v7 = a4;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v11 = v10;
    v27 = a5;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    obj = v9;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v31 = 0;
        v17 = -[SFAnalyticsTopic serializedEventSize:error:](self, "serializedEventSize:error:", v16, &v31);
        v18 = v31;
        if (v18)
        {
          v22 = v18;
          if (v27)
            *v27 = objc_retainAutorelease(v18);
          v23 = sub_100010B28("SecEmergency");
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v20 = v28;
          v9 = obj;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedDescription"));
            *(_DWORD *)buf = 138412290;
            v37 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to serialize event JSON: %@", buf, 0xCu);

            v9 = obj;
          }

          v21 = 0;
          goto LABEL_22;
        }
        if (v12 > 0x3E7 || v17 + v13 > a3)
        {
          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v28, "addObject:", v8);
            v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

            v12 = 0;
            v13 = 0;
            v8 = (void *)v19;
          }
          else
          {
            v12 = 0;
            v13 = 0;
          }
        }
        objc_msgSend(v8, "addObject:", v16);
        ++v12;
        v13 += v17;
      }
      v9 = obj;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v11)
        continue;
      break;
    }
  }

  v20 = v28;
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v28, "addObject:", v8);
  v21 = v28;
LABEL_22:

  return v21;
}

- (id)createEventDictionary:(id)a3 timestamp:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[8];
  NSErrorUserInfoKey v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v7 = a3;
  v8 = a4;
  v9 = objc_autoreleasePoolPush();
  v20[0] = SFAnalyticsPostTime;
  v20[1] = CFSTR("events");
  v21[0] = v8;
  v21[1] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v10))
  {
    objc_autoreleasePoolPop(v9);
    v11 = 0;
  }
  else
  {
    v12 = sub_100010B28("SecEmergency");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "json: final dictionary invalid JSON.", buf, 2u);
    }

    v18 = NSLocalizedDescriptionKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Final dictionary for upload is invalid JSON: %@"), v10));
    v19 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.supd"), 2, v15));

    objc_autoreleasePoolPop(v9);
    if (a5)
    {
      v11 = objc_retainAutorelease(v11);
      v10 = 0;
      *a5 = v11;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)createChunkedLoggingJSON:(id)a3 failures:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * 1000.0));

  v28 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic chunkFailureSet:events:error:](self, "chunkFailureSet:events:error:", -[SFAnalyticsTopic uploadSizeLimit](self, "uploadSizeLimit"), v8, a5));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic createEventDictionary:timestamp:error:](self, "createEventDictionary:timestamp:error:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v18), v13, a5));
        if (v19)
          objc_msgSend(v10, "addObject:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v16);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic chunkFailureSet:events:error:](self, "chunkFailureSet:events:error:", -[SFAnalyticsTopic uploadSizeLimit](self, "uploadSizeLimit"), v9, a5));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic createEventDictionary:timestamp:error:](self, "createEventDictionary:timestamp:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v25), v13, a5));
        if (v26)
          objc_msgSend(v10, "addObject:", v26);

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  return v10;
}

- (id)dataAnalyticsSetting:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)carryStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  const void *v7;
  NSObject *v8;
  int v10;
  id v11;

  if (os_variant_has_internal_diagnostics("com.apple.security"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration automatedDeviceGroup](OSASystemConfiguration, "automatedDeviceGroup"));
    if (v4
      || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic dataAnalyticsSetting:](self, "dataAnalyticsSetting:", CFSTR("AutomatedDeviceGroup")))) != 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("automatedDeviceGroup"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic dataAnalyticsSetting:](self, "dataAnalyticsSetting:", CFSTR("ExperimentGroup")));

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic dataAnalyticsSetting:](self, "dataAnalyticsSetting:", CFSTR("ExperimentGroup")));
      if ((objc_msgSend(v5, "isEqual:", CFSTR("walkabout")) & 1) != 0
        || objc_msgSend(v5, "isEqual:", CFSTR("carry")))
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("carry"));
      }
    }
    if (objc_msgSend(v3, "count"))
      v6 = v3;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  v7 = sub_100010B28("getLoggingJSON");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "carrystatus is %@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (BOOL)ckDeviceAccountApprovedTopic:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (os_variant_has_internal_diagnostics("com.apple.security"))
  {
    if (qword_10001DB78 != -1)
      dispatch_once(&qword_10001DB78, &stru_1000187A0);
    v4 = objc_msgSend((id)qword_10001DB80, "containsObject:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)copyEvents:(id)a3 failures:(id)a4 forUpload:(BOOL)a5 participatingClients:(id)a6 force:(BOOL)a7 linkedUUID:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  const void *v15;
  NSObject *v16;
  const void *v17;
  void *v18;
  double v19;
  void *v20;
  SFAnalyticsTopic *v21;
  NSArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v32;
  id v33;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[6];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  BOOL v58;
  BOOL v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[16];
  NSErrorUserInfoKey v65;
  void *v66;
  _BYTE v67[128];

  v35 = a5;
  v40 = a3;
  v33 = a4;
  v13 = a6;
  v44 = a8;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[SFAnalyticsTopic ckDeviceAccountApprovedTopic:](self, "ckDeviceAccountApprovedTopic:", self->_internalTopicName))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic askSecurityForCKDeviceID](self, "askSecurityForCKDeviceID"));
    v14 = sub_10000B0D0();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic appleUser](self, "appleUser"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic carryStatus](self, "carryStatus"));
    v15 = sub_100010B28("getLoggingJSON");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "including deviceID for internal user", buf, 2u);
    }
  }
  else
  {
    v17 = sub_100010B28("getLoggingJSON");
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no deviceID for internal user", buf, 2u);
    }
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v37 = 0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 * 1000.0));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v21 = self;
  v22 = self->_topicClients;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10000B360;
        v46[3] = &unk_1000187C8;
        v58 = a7;
        v59 = v35;
        v46[4] = v27;
        v46[5] = v21;
        v47 = v45;
        v48 = v44;
        v49 = v20;
        v50 = v39;
        v51 = v38;
        v52 = v36;
        v53 = v37;
        v54 = v40;
        v55 = v43;
        v56 = v42;
        v57 = v41;
        objc_msgSend(v27, "withStore:", v46);

      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v24);
  }

  if (v35 && !objc_msgSend(v45, "count"))
  {
    if (!a9)
    {
      v30 = 0;
      v29 = v33;
      goto LABEL_18;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Upload too recent for all clients for %@"), v21->_internalTopicName));
    v65 = NSLocalizedDescriptionKey;
    v66 = v28;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
    *a9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SupdUploadErrorDomain"), -10, v32));

    v30 = 0;
    v29 = v33;
  }
  else
  {
    objc_msgSend(v13, "addObjectsFromArray:", v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:](v21, "addFailures:toUploadRecords:threshold:linkedUUID:", v43, v28, v21->_maxEventsToReport / 0xA, v44);
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:](v21, "addFailures:toUploadRecords:threshold:linkedUUID:", v42, v28, v21->_maxEventsToReport / 0xA, v44);
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:](v21, "addFailures:toUploadRecords:threshold:linkedUUID:", v41, v28, 0, v44);
    v29 = v33;
    objc_msgSend(v33, "addObjectsFromArray:", v28);
    v30 = 1;
  }

LABEL_18:
  return v30;
}

- (id)createChunkedLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v8 = a6;
  v9 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0;
  LODWORD(v9) = -[SFAnalyticsTopic copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:](self, "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:", v14, v13, v9, v11, v8, v12, &v22);

  v15 = v22;
  v16 = v15;
  if (v9 && v15 == 0)
  {
    if ((unint64_t)objc_msgSend(v13, "count") > self->_maxEventsToReport)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", 0));
      v20 = objc_msgSend(v19, "mutableCopy");

      v13 = v20;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic createChunkedLoggingJSON:failures:error:](self, "createChunkedLoggingJSON:failures:error:", v14, v13, a7));
  }
  else
  {
    v18 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v15);
  }

  return v18;
}

- (id)createLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v25;

  v8 = a6;
  v9 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0;
  LODWORD(v9) = -[SFAnalyticsTopic copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:](self, "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:", v13, v12, v9, v11, v8, 0, &v25);

  v14 = v25;
  v15 = v14;
  if (v9 && v14 == 0)
  {
    if ((unint64_t)objc_msgSend(v12, "count") > self->_maxEventsToReport)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", 0));
      v19 = objc_msgSend(v18, "mutableCopy");

      v12 = v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v20, "addObjectsFromArray:", v13);
    objc_msgSend(v20, "addObjectsFromArray:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v21, "timeIntervalSince1970");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22 * 1000.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic createEventDictionary:timestamp:error:](self, "createEventDictionary:timestamp:error:", v20, v23, a7));

  }
  else
  {
    v17 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v14);
  }

  return v17;
}

- (BOOL)haveEligibleClients
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic topicClients](self, "topicClients", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6);
        if (!objc_msgSend(v7, "requireDeviceAnalytics"))
          goto LABEL_13;
        if (qword_10001DB98 != -1)
          dispatch_once(&qword_10001DB98, &stru_100018928);
        if (byte_10001DB90)
        {
LABEL_13:
          if (!objc_msgSend(v7, "requireiCloudAnalytics"))
            goto LABEL_17;
          if (qword_10001DBA8 != -1)
            dispatch_once(&qword_10001DBA8, &stru_100018948);
          if (byte_10001DBA0)
          {
LABEL_17:
            v8 = 1;
            goto LABEL_19;
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_19:

  return v8;
}

- (id)askSecurityForCKDeviceID
{
  void *v2;
  id v3;
  BOOL v4;
  const void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  const void *v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  NSObject *v15;
  __int128 *p_buf;
  id v17;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](CKKSControl, "controlObject:", &v17));
  v3 = v17;
  if (v3)
    v4 = 1;
  else
    v4 = v2 == 0;
  if (v4)
  {
    v5 = sub_100010B28("SecError");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unable to obtain CKKS endpoint: %@", (uint8_t *)&buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = sub_100005D88;
    v21 = sub_100005D98;
    v22 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000ACC0;
    v14[3] = &unk_1000187F0;
    p_buf = &buf;
    v8 = dispatch_semaphore_create(0);
    v15 = v8;
    objc_msgSend(v2, "rpcGetCKDeviceIDWithReply:", v14);
    v9 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = sub_100010B28("SecError");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "timed out waiting for a response from security", v13, 2u);
      }

      v7 = 0;
    }
    else
    {
      v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    }

    _Block_object_dispose(&buf, 8);
  }

  return v7;
}

- (id)appleUser
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierIMAP));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsWithAccountType:", v3));
  v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v25)
  {
    v5 = *(_QWORD *)v31;
    v6 = ACEmailAliasKeyEmailAddresses;
    v7 = &ACAccountTypeIdentifierIMAP_ptr;
    v23 = *(_QWORD *)v31;
    v24 = v3;
    v22 = ACEmailAliasKeyEmailAddresses;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", v6, v22, v23));
        v10 = objc_opt_class(v7[31]);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
        }
        else
        {
          v12 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
          {
            v11 = v9;
          }
          else
          {
            v13 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
              v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(",")));
            else
              v11 = 0;
          }
        }
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = v11;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v19, "hasSuffix:", CFSTR("@apple.com")) & 1) != 0)
              {
                v20 = v19;

                v3 = v24;
                goto LABEL_26;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v16)
              continue;
            break;
          }
        }

        v8 = (char *)v8 + 1;
        v6 = v22;
        v5 = v23;
        v7 = &ACAccountTypeIdentifierIMAP_ptr;
      }
      while (v8 != v25);
      v20 = 0;
      v3 = v24;
      v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v25);
  }
  else
  {
    v20 = 0;
  }
LABEL_26:

  return v20;
}

- (id)splunkUploadURL:(BOOL)a3 urlSession:(id)a4
{
  id v6;
  NSURL *splunkUploadURL;
  NSURL *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSURL *v13;
  NSObject *v14;
  NSURL *v15;
  void *v16;
  dispatch_time_t v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[5];
  NSObject *v23;
  NSURL *v24;
  __int128 *p_buf;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id location;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a4;
  if (a3 || -[SFAnalyticsTopic haveEligibleClients](self, "haveEligibleClients"))
  {
    splunkUploadURL = self->__splunkUploadURL;
    if (splunkUploadURL)
    {
      v8 = splunkUploadURL;
    }
    else
    {
      v9 = sub_100010B28("getURL");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic internalTopicName](self, "internalTopicName"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asking server for endpoint and config data for topic %@", (uint8_t *)&buf, 0xCu);

      }
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v12 = dispatch_semaphore_create(0);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v36 = 0x3032000000;
      v37 = sub_100005D88;
      v38 = sub_100005D98;
      v39 = 0;
      v13 = self->_splunkBagURL;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = sub_100005D88;
      v32 = sub_100005D98;
      v33 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000A734;
      v22[3] = &unk_100018818;
      objc_copyWeak(&v27, &location);
      p_buf = &buf;
      v22[4] = self;
      v14 = v12;
      v23 = v14;
      v26 = &v28;
      v15 = v13;
      v24 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataTaskWithURL:completionHandler:", v15, v22));
      objc_msgSend(v16, "resume");
      v17 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v14, v17);
      v8 = (NSURL *)(id)v29[5];

      objc_destroyWeak(&v27);
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v18 = sub_100010B28("getURL");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic internalTopicName](self, "internalTopicName"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not going to talk to server for topic %@ because no eligible clients", (uint8_t *)&buf, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  const void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  NSString *internalTopicName;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  __SecTrust *v25;
  _BOOL4 v26;
  int v27;
  const void *v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  void *v32;
  _BYTE buf[24];
  void *v34;
  __int128 v35;
  uint64_t v36;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (!v10)
  {
    v11 = sub_100010B28("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("Execution has encountered an unexpected state");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091854;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
    }

    v13 = dword_10001DB58;
    if (dword_10001DB58 == -1)
    {
      if (!qword_10001DBD8)
      {
        *(_OWORD *)buf = off_100018CF0;
        *(_QWORD *)&buf[16] = 0;
        qword_10001DBD8 = _sl_dlopen(buf, 0);
      }
      if (qword_10001DBD8)
      {
        v14 = getpid();
        v15 = CFSTR("Execution has encountered an unexpected state");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v16 = off_10001DBE0;
        v34 = off_10001DBE0;
        if (off_10001DBE0)
          goto LABEL_15;
        v32 = 0;
        if (!qword_10001DBD8)
        {
          v35 = off_100018CF0;
          v36 = 0;
          qword_10001DBD8 = _sl_dlopen(&v35, &v32);
        }
        v16 = (void *)qword_10001DBD8;
        if (!qword_10001DBD8)
        {
          v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CrashReporterSupportLibrary(void)"));
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("simulate_crash.m"), 18, CFSTR("%s"), v32);

          goto LABEL_36;
        }
        v17 = v32;
        if (v32)
          goto LABEL_37;
        while (1)
        {
          v16 = dlsym(v16, "SimulateCrash");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v16;
          off_10001DBE0 = v16;
LABEL_15:
          _Block_object_dispose(buf, 8);
          if (v16)
            break;
          v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"));
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("simulate_crash.m"), 22, CFSTR("%s"), dlerror());

LABEL_36:
          __break(1u);
LABEL_37:
          free(v17);
        }
        ((void (*)(uint64_t, uint64_t, const __CFString *))v16)(v14, 1405091854, CFSTR("Execution has encountered an unexpected state"));

        goto LABEL_17;
      }
      v13 = dword_10001DB58;
    }
    dword_10001DB58 = v13 + 1;
  }
LABEL_17:
  v18 = sub_100010B28("upload");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    internalTopicName = self->_internalTopicName;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = internalTopicName;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Splunk upload challenge for %@", buf, 0xCu);
  }

  if ((uint64_t)objc_msgSend(v9, "previousFailureCount") >= 1)
    goto LABEL_31;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protectionSpace"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "authenticationMethod"));
  v23 = objc_msgSend(v22, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if (!v23)
  {
    v10[2](v10, 1, 0);
    goto LABEL_32;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protectionSpace"));
  v25 = (__SecTrust *)objc_msgSend(v24, "serverTrust");

  v26 = SecTrustEvaluateWithError(v25, 0);
  v27 = self->_allowInsecureSplunkCert || v26;
  if (v27 != 1)
  {
LABEL_31:
    v10[2](v10, 2, 0);
    goto LABEL_32;
  }
  if (self->_allowInsecureSplunkCert)
  {
    v28 = sub_100010B28("upload");
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_internalTopicName;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Force Accepting Splunk Credential for %@", buf, 0xCu);
    }

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v25));
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v31);

LABEL_32:
}

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = objc_msgSend(a3, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_blacklistedFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)splunkTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSplunkTopicName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)splunkBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSplunkBagURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)internalTopicName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalTopicName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (NSArray)topicClients
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTopicClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)_splunkUploadURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_splunkUploadURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)allowInsecureSplunkCert
{
  return self->_allowInsecureSplunkCert;
}

- (void)setAllowInsecureSplunkCert:(BOOL)a3
{
  self->_allowInsecureSplunkCert = a3;
}

- (BOOL)ignoreServersMessagesTellingUsToGoAway
{
  return self->_ignoreServersMessagesTellingUsToGoAway;
}

- (void)setIgnoreServersMessagesTellingUsToGoAway:(BOOL)a3
{
  self->_ignoreServersMessagesTellingUsToGoAway = a3;
}

- (BOOL)disableUploads
{
  return self->_disableUploads;
}

- (void)setDisableUploads:(BOOL)a3
{
  self->_disableUploads = a3;
}

- (BOOL)disableClientId
{
  return self->_disableClientId;
}

- (void)setDisableClientId:(BOOL)a3
{
  self->_disableClientId = a3;
}

- (BOOL)terseMetrics
{
  return self->_terseMetrics;
}

- (void)setTerseMetrics:(BOOL)a3
{
  self->_terseMetrics = a3;
}

- (unint64_t)secondsBetweenUploads
{
  return self->_secondsBetweenUploads;
}

- (void)setSecondsBetweenUploads:(unint64_t)a3
{
  self->_secondsBetweenUploads = a3;
}

- (unint64_t)maxEventsToReport
{
  return self->_maxEventsToReport;
}

- (void)setMaxEventsToReport:(unint64_t)a3
{
  self->_maxEventsToReport = a3;
}

- (float)devicePercentage
{
  return self->_devicePercentage;
}

- (void)setDevicePercentage:(float)a3
{
  self->_devicePercentage = a3;
}

- (NSDictionary)metricsBase
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetricsBase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)blacklistedFields
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBlacklistedFields:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)blacklistedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBlacklistedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->__splunkUploadURL, 0);
  objc_storeStrong((id *)&self->_topicClients, 0);
  objc_storeStrong((id *)&self->_internalTopicName, 0);
  objc_storeStrong((id *)&self->_splunkBagURL, 0);
  objc_storeStrong((id *)&self->_splunkTopicName, 0);
}

+ (id)databasePathForCKKS
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/ckks_analytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForSOS
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/sos_analytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)AppSupportPath
{
  return CFSTR("/var/mobile/Library/Application Support");
}

+ (id)databasePathForPCS
{
  void *v2;
  void *v3;
  const void *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "AppSupportPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/com.apple.ProtectedCloudStorage/PCSAnalytics.db"), v2));
    v4 = sub_100010B28("supd");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PCS Database path (%@)", buf, 0xCu);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)databasePathForLocal
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/localkeychain.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForTrust
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/trust_analytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForNetworking
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/networking_analytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForCloudServices
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/CloudServicesAnalytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForTransparency
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/TransparencyAnalytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForSWTransparency
{
  CFURLRef v2;
  void *v3;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("Analytics/SWTransparencyAnalytics.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

@end
