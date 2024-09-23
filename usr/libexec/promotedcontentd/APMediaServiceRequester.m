@implementation APMediaServiceRequester

- (NSString)bundleID
{
  return self->_bundleID;
}

- (id)_loadInternalPropertiesFromContentData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "representations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));
    objc_msgSend(v5, "setObject:forKey:", v7, kAPMetricSubscriptionIdentifier);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "impressionID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "impressionID"));
    objc_msgSend(v5, "setObject:forKey:", v9, kAPMetricImpressionIdentifier);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    objc_msgSend(v5, "setObject:forKey:", v11, kAPMetadataIdentifier);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v5));

  return v12;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (void)setReceivedContentDataItems:(id)a3
{
  objc_storeStrong((id *)&self->_receivedContentDataItems, a3);
}

- (void)setMediaServiceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceRequest, a3);
}

- (void)setHasOdml:(BOOL)a3
{
  self->_hasOdml = a3;
}

- (void)setDeliveryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setContextFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_contextFingerprint, a3);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (id)sendRequest:(id)a3 params:(id)a4 mediaServiceSession:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester deliveryBlock](self, "deliveryBlock")),
        v14,
        v10)
    && v14)
  {
    -[APMediaServiceRequester setCompletionHandler:](self, "setCompletionHandler:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fingerprint"));
    -[APMediaServiceRequester setContextFingerprint:](self, "setContextFingerprint:", v16);

    -[APMediaServiceRequester setMediaServiceRequest:](self, "setMediaServiceRequest:", v10);
    -[APMediaServiceRequester setHasOdml:](self, "setHasOdml:", objc_msgSend(v11, "hasOdml"));
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v17 = (void *)objc_claimAutoreleasedReturnValue(+[APMockMAPIResponseSettings settings](APMockMAPIResponseSettings, "settings")), v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentDataObjects")), v17, v18))
    {
      -[APMediaServiceRequester _handleMediaServiceResponse:params:error:completionHandler:](self, "_handleMediaServiceResponse:params:error:completionHandler:", v18, v11, 0, v13);
      v19 = v12;

    }
    else
    {
      objc_initWeak(&location, self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester mediaServiceRequest](self, "mediaServiceRequest"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100003878;
      v22[3] = &unk_1002186C0;
      objc_copyWeak(&v25, &location);
      v23 = v11;
      v24 = v13;
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "runWithParameters:mediaServiceSession:completionHandler:", v23, v12, v22));

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v19 = v12;
  }

  return v19;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (NSArray)receivedContentDataItems
{
  return self->_receivedContentDataItems;
}

- (APMediaServiceRequest)mediaServiceRequest
{
  return self->_mediaServiceRequest;
}

- (APMediaServiceRequester)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APMediaServiceRequester;
  return -[APMediaServiceRequester init](&v3, "init");
}

- (BOOL)hasOdml
{
  return self->_hasOdml;
}

- (id)deliveryBlock
{
  return self->_deliveryBlock;
}

- (NSString)contextFingerprint
{
  return self->_contextFingerprint;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)_loadJourneyStartRelayValuesFromContentData:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "representations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  v13[0] = kAPMetricAdGroupId;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "journeyRelayAdGroupId"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_100219118;
  v14[0] = v7;
  v13[1] = kAPMetricCampaignId;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "journeyRelayCampaignId"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_100219118;
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  return v11;
}

- (void)_handleRankedRepresentations:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  void (**v21)(void);
  void (**v22)(void);
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(void);
  id v28;
  id v29;
  APMediaServiceRequester *v30;
  uint8_t buf[8];
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  if (v8)
  {
    v9 = objc_msgSend(v7, "deliverEntireBatch");
    v10 = objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester deliveryBlock](self, "deliveryBlock"));
    v11 = (void (**)(_QWORD, _QWORD))v10;
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
    else
    {
      v32 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      ((void (**)(_QWORD, void *))v11)[2](v11, v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester contextFingerprint](self, "contextFingerprint"));
    v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v19));

    if (v20)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100003F94;
      v26[3] = &unk_100218710;
      v27 = v20;
      v28 = v8;
      v29 = v7;
      v30 = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);
      v21 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester completionHandler](self, "completionHandler"));
      v21[2]();

      v22 = v27;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester contextFingerprint](self, "contextFingerprint"));
      APSimulateCrashNoKillProcess(5, CFSTR("Can not find managed context for fingerprint: %@"));

      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester completionHandler](self, "completionHandler", v25));
      v22[2]();
    }

  }
  else
  {
    v12 = APLogForCategory(34);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "No valid content data object was returned by Media API.", buf, 2u);
    }

    v14 = objc_msgSend(v7, "deliverEntireBatch");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester deliveryBlock](self, "deliveryBlock"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester receivedContentDataItems](self, "receivedContentDataItems"));
    v17 = v16;
    if (v14)
    {
      ((void (**)(_QWORD, void *))v15)[2](v15, v16);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      v33 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      ((void (**)(_QWORD, void *))v15)[2](v15, v24);

    }
    v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester completionHandler](self, "completionHandler"));
    v20[2]();
  }

}

- (void)_handleMediaServiceResponse:(id)a3 params:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id buf;
  void *v36;
  void *v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester mediaServiceRequest](self, "mediaServiceRequest"));
  objc_msgSend(v14, "responseTime");
  -[APMediaServiceRequester setResponseTime:](self, "setResponseTime:");

  -[APMediaServiceRequester setReceivedContentDataItems:](self, "setReceivedContentDataItems:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester receivedContentDataItems](self, "receivedContentDataItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester contextFingerprint](self, "contextFingerprint"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceErrorResponseProcessor processErrorsForContentDataItems:error:contextFingerprint:params:](APMediaServiceErrorResponseProcessor, "processErrorsForContentDataItems:error:contextFingerprint:params:", v15, v12, v16, v11));

  if (v17 && !objc_msgSend(v10, "count"))
  {
    objc_msgSend(v17, "setDiagnosticCode:", 0);
    v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester deliveryBlock](self, "deliveryBlock"));
    v37 = v17;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    ((void (**)(_QWORD, void *))v30)[2](v30, v31);

    v13[2](v13);
  }
  else if (objc_msgSend(v10, "count"))
  {
    v18 = -[APMediaServiceRequester hasOdml](self, "hasOdml");
    v19 = APLogForCategory(34);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v21)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "ODML enabled. Reranking content data.", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100169874;
      v32[3] = &unk_1002186E8;
      objc_copyWeak(&v34, &buf);
      v33 = v11;
      +[APMediaServicesRanker rankRepresentations:completionHandler:](APMediaServicesRanker, "rankRepresentations:completionHandler:", v10, v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (v21)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "ODML disabled. Sorting content data.", (uint8_t *)&buf, 2u);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServicesRanker findValidObjectsInContentDataItems:](APMediaServicesRanker, "findValidObjectsInContentDataItems:", v10));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServicesRanker sortByRank:](APMediaServicesRanker, "sortByRank:", v28));
      -[APMediaServiceRequester _handleRankedRepresentations:params:](self, "_handleRankedRepresentations:params:", v29, v11);

    }
  }
  else
  {
    v22 = objc_alloc((Class)NSUUID);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester contextFingerprint](self, "contextFingerprint"));
    v24 = objc_msgSend(v22, "initWithUUIDString:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[APContentData createForServerUnfilledReason:placementType:contextIdentifier:](APContentData, "createForServerUnfilledReason:placementType:contextIdentifier:", 1025, 5, v24));

    objc_msgSend(v25, "setDiagnosticCode:", 1);
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APMediaServiceRequester deliveryBlock](self, "deliveryBlock"));
    v36 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    ((void (**)(_QWORD, void *))v26)[2](v26, v27);

    v13[2](v13);
    v17 = v25;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedContentDataItems, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_contextFingerprint, 0);
  objc_storeStrong((id *)&self->_mediaServiceRequest, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
