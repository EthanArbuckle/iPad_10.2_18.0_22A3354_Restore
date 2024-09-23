@implementation APAdBatchRequester

- (APAdBatchRequester)initWithBatch:(id)a3 bundleID:(id)a4 requestIdentifier:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  APAdBatchRequester *v30;
  APAdBatchRequester *v31;
  NSArray *v32;
  NSArray *batchedRequests;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v11 = a3;
  v40 = a4;
  v39 = a5;
  obj = a6;
  v38 = a6;
  v37 = a7;
  v12 = v11;
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v14 = &stru_100219118;
    v15 = &stru_100219118;
    do
    {
      if (v13)
        v16 = CFSTR(",");
      else
        v16 = &stru_100219118;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
      v21 = v12;
      v22 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("%@%@"), v16, v20, obj));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v13));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
      v26 = v21;
      v27 = (__CFString *)v22;
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR("%@%@"), v16, v25));

      ++v13;
      v12 = v26;
      v29 = objc_msgSend(v26, "count");
      v15 = v28;
      v14 = v27;
    }
    while (v13 < (unint64_t)v29);
  }
  else
  {
    v28 = &stru_100219118;
    v27 = &stru_100219118;
  }
  v41.receiver = self;
  v41.super_class = (Class)APAdBatchRequester;
  v30 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](&v41, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v40, v39, v27, v28, v37);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_clientInfo, obj);
    v32 = (NSArray *)objc_msgSend(v12, "copy");
    batchedRequests = v31->_batchedRequests;
    v31->_batchedRequests = v32;

  }
  return v31;
}

- (id)requestFromRequestID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
        v12 = objc_msgSend(v4, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)makeRequest:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[16];

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v7 = +[APMockAdServerSettings isAdResponseMockedForPlacementType:](APMockAdServerSettings, "isAdResponseMockedForPlacementType:", objc_msgSend(v6, "placementType"));

  if (!v7)
    goto LABEL_7;
  v8 = APLogForCategory(21);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AdBatchRequester will return forced ad response for request.", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings adResponseDataForPlacementType:](APMockAdServerSettings, "adResponseDataForPlacementType:", objc_msgSend(v11, "placementType")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchResponseFromBase64EncodedString:](self, "batchResponseFromBase64EncodedString:", v12));
    v4[2](v4, v13, 0);

  }
  else
  {
LABEL_7:
    v14.receiver = self;
    v14.super_class = (Class)APAdBatchRequester;
    -[APServerRequester makeRequest:](&v14, "makeRequest:", v4);
    -[APAdBatchRequester sendAnalyticsForMakingRequest](self, "sendAnalyticsForMakingRequest");
  }

}

- (id)protoBuffer
{
  APPBAdBatchRequest *v3;
  void *v4;
  void *v5;
  id v6;
  APPBAdSpecification *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = objc_alloc_init(APPBAdBatchRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester requestProperties](self, "requestProperties"));
  -[APPBAdBatchRequest setRequestProperties:](v3, "setRequestProperties:", v4);

  -[APAdBatchRequester addRequestersToRequest:](self, "addRequestersToRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc_init(APPBAdSpecification);
    -[APPBAdBatchRequest setSpecification:](v3, "setSpecification:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v10 = +[APLegacyTypeTranslator placementTypeToCreativeType:](APLegacyTypeTranslator, "placementTypeToCreativeType:", objc_msgSend(v9, "placementType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest specification](v3, "specification"));
    objc_msgSend(v11, "setType:", v10);

  }
  return v3;
}

- (void)sendAnalyticsForMakingRequest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  unint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  uint8_t buf[4];
  double v57;
  __int16 v58;
  double v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));

    v8 = APLogForCategory(21);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      *(_DWORD *)buf = 138543362;
      v57 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[LegacyInterface] Requester (%{public}@) sending ad request.", buf, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prefetchTimestamp"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prefetchTimestamp"));
      objc_msgSend(v12, "timeIntervalSinceDate:", v14);
      v16 = v15;

      v17 = APLogForCategory(21);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
        *(_DWORD *)buf = 138543618;
        v57 = *(double *)&v20;
        v58 = 2050;
        v59 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[LegacyInterface] Context %{public}@: Pre-fetch to daemon ad request interval is %{public}f.", buf, 0x16u);

      }
      v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"));
      v23 = -[NSObject isEqual:](v21, "isEqual:", v22);

      if ((v23 & 1) != 0)
      {
        v24 = APLogForCategory(21);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v57 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%f Invalid interval", buf, 0xCu);
        }
      }
      else
      {
        v55[0] = v21;
        v54[0] = CFSTR("Interval");
        v54[1] = CFSTR("IntervalType");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", 3));
        v55[1] = v27;
        v54[2] = CFSTR("NetworkType");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", 0));
        v55[2] = v28;
        v54[3] = CFSTR("PlacementType");
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "current"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v29, "placement")));
        v55[3] = v30;
        v54[4] = CFSTR("Failed");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
        v55[4] = v31;
        v25 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 5));

        +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("adtiming"), v25);
      }

    }
    else
    {
      v26 = APLogForCategory(21);
      v21 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "prefetchTimestamp is nil!", buf, 2u);
      }
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v33, "timestamp");
    v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
    v37 = objc_msgSend(v36, "count");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v35));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sending %lu requests in batch %@: %@"), v37, v38, v39));

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
    v42 = objc_msgSend(v41, "count");

    if ((unint64_t)v42 < 2)
    {
      v49 = v40;
    }
    else
    {
      v43 = 1;
      do
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v43));
        objc_msgSend(v45, "timestamp");
        v47 = v46 - v35;

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", + %.0f mS"), v47 * 1000.0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByAppendingString:", v48));

        ++v43;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
        v51 = objc_msgSend(v50, "count");

        v40 = v49;
      }
      while (v43 < (unint64_t)v51);
    }
    v52 = APLogForCategory(21);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v57 = *(double *)&v49;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

  }
}

- (NSArray)batchedRequests
{
  return self->_batchedRequests;
}

- (id)requestProperties
{
  APPBRequestProperties *v3;

  v3 = objc_alloc_init(APPBRequestProperties);
  -[APAdBatchRequester addClientInfoProperties:](self, "addClientInfoProperties:", v3);
  -[APAdBatchRequester addDeviceInfoProperties:](self, "addDeviceInfoProperties:", v3);
  -[APAdBatchRequester addAccountProperties:](self, "addAccountProperties:", v3);
  -[APAdBatchRequester addContentRestrictionProperties:](self, "addContentRestrictionProperties:", v3);
  -[APAdBatchRequester addMiscellaneousProperties:](self, "addMiscellaneousProperties:", v3);
  -[APAdBatchRequester addPandoraTestProperties:](self, "addPandoraTestProperties:", v3);
  return v3;
}

- (id)headers
{
  NSDictionary *v2;
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APAdBatchRequester;
  v2 = -[APServerRequester headers](&v7, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "copy");
  return v5;
}

- (void)addRequestersToRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  APPBAdRequester *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __int128 v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = v4;
  objc_msgSend(v4, "setRequesters:", v5);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v36;
    *(_QWORD *)&v7 = 138543362;
    v32 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc_init(APPBAdRequester);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
        -[APPBAdRequester setIdentifier:](v12, "setIdentifier:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
        objc_msgSend(v15, "maxSize");
        -[APAdBatchRequester _computeMinimumSize:](self, "_computeMinimumSize:");
        v17 = v16;
        v19 = v18;

        -[APPBAdRequester setHeight:](v12, "setHeight:", (int)v19);
        -[APPBAdRequester setWidth:](v12, "setWidth:", (int)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contextJSONForRequest:andPlacementType:", v22, objc_msgSend(v11, "placementType")));
        -[APPBAdRequester setContextJSON:](v12, "setContextJSON:", v23);

        if (-[APPBAdRequester width](v12, "width") < 1 || -[APPBAdRequester height](v12, "height") <= 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester clientInfo](self, "clientInfo", v32));
          v25 = v24;
          if (v24 && (unint64_t)objc_msgSend(v24, "interfaceIdiom") <= 1)
          {
            v26 = (char *)objc_msgSend(v25, "orientation");
            if ((unint64_t)(v26 - 2) < 2)
            {
              -[APPBAdRequester setHeight:](v12, "setHeight:", 414);
              -[APPBAdRequester setWidth:](v12, "setWidth:", 896);
            }
            else if ((unint64_t)v26 <= 1)
            {
              -[APPBAdRequester setWidth:](v12, "setWidth:", 414);
              -[APPBAdRequester setHeight:](v12, "setHeight:", 896);
            }
          }

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "requesters", v32));
        objc_msgSend(v27, "addObject:", v12);

        v28 = APLogForCategory(21);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
          *(_DWORD *)buf = v32;
          v40 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Making AdBatchRequest for context %{public}@", buf, 0xCu);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

}

- (void)addPandoraTestProperties:(id)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v3 = +[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isTest"));
    objc_msgSend(v9, "setIsTest:", objc_msgSend(v5, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v9, "setHasIsTest:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "campaignNamespace"));

  if (v7)
    v8 = v3;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v7, "length"))
    objc_msgSend(v9, "setCampaignNameSpace:", v7);

}

- (void)addMiscellaneousProperties:(id)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v3 = +[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall");
  if (v3)
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(v9, "setRunState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v9, "setClientClockTime:");

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serveProductionAds"));
    v8 = objc_msgSend(v7, "isEqualToNumber:", &off_100229888);

    if (v8)
      objc_msgSend(v9, "setInternalUserWantsProdAds:", 1);
  }
  objc_msgSend(v9, "setAppStoreViewAdVersion:", 2);

}

- (void)addDeviceInfoProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  objc_msgSend(v3, "setDeviceMode:", objc_msgSend(v10, "educationModeEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "osVersionAndBuild"));
  objc_msgSend(v3, "setOsVersionAndBuild:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceModel"));
  objc_msgSend(v3, "setDeviceModel:", v5);

  objc_msgSend(v3, "setConnectionType:", +[APLegacyTypeTranslator connectionTypeToAPPBAdConnection:](APLegacyTypeTranslator, "connectionTypeToAPPBAdConnection:", objc_msgSend(v10, "connectionType")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v7 = (double)(uint64_t)objc_msgSend(v6, "secondsFromGMT") / 3600.0;
  *(float *)&v7 = v7;
  objc_msgSend(v3, "setTimezone:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localeIdentifier"));
  objc_msgSend(v3, "setLocaleIdentifier:", v9);

}

- (void)addContentRestrictionProperties:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v13, "setDenyExplicit:", objc_msgSend(v3, "effectiveBoolValueForSetting:", MCFeatureExplicitContentAllowed) == 2);
  objc_msgSend(v13, "setAllowInstallApps:", objc_msgSend(v3, "isOnDeviceAppInstallationAllowed"));
  objc_msgSend(v13, "setAllowITunes:", objc_msgSend(v3, "effectiveBoolValueForSetting:", MCFeatureITunesAllowed) != 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveValueForSetting:", MCFeatureMaximumMoviesRating));
  v5 = v4;
  if (v4)
    v6 = (uint64_t)objc_msgSend(v4, "intValue");
  else
    v6 = 1000;
  objc_msgSend(v13, "setMoviesRank:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveValueForSetting:", MCFeatureMaximumTVShowsRating));
  v8 = v7;
  if (v7)
    v9 = (uint64_t)objc_msgSend(v7, "intValue");
  else
    v9 = 1000;
  objc_msgSend(v13, "setTvshowsRank:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveValueForSetting:", MCFeatureMaximumAppsRating));
  v11 = v10;
  if (v10)
    v12 = (uint64_t)objc_msgSend(v10, "intValue");
  else
    v12 = 1000;
  objc_msgSend(v13, "setAppsRank:", v12);

}

- (void)addClientInfoProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v25;

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  objc_msgSend(v25, "setAppID:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester clientInfo](self, "clientInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVersion"));
  objc_msgSend(v25, "setAppVersion:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scale"));
  objc_msgSend(v25, "setScreenDPI:", objc_msgSend(v7, "intValue"));

  objc_msgSend(v25, "setScreenWidth:", objc_msgSend(v5, "screenWidth"));
  objc_msgSend(v25, "setScreenHeight:", objc_msgSend(v5, "screenHeight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyboards"));
  v9 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v25, "setUserKeyboards:", v9);

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyboardOverride"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyboardOverride"));
      v14 = objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v25, "setUserKeyboards:", v14);

    }
  }
  if (-[APAdBatchRequester _canSendLocationInformationForClientInfo:](self, "_canSendLocationInformationForClientInfo:", v5))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locality"));
    objc_msgSend(v25, "setLocality:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "administrativeArea"));
    objc_msgSend(v25, "setAdministrativeArea:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subAdministrativeArea"));
    objc_msgSend(v25, "setSubAdministrativeArea:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "isoCountryCode"));
    objc_msgSend(v25, "setIsoCountryCode:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "postalCode"));
    objc_msgSend(v25, "setPostalCode:", v24);

  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_computeMinimumSize:(id)a3
{
  double var1;
  double var0;
  void *v5;
  void *v6;
  double v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester clientInfo](self, "clientInfo"));
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  if (objc_msgSend(v5, "interfaceIdiom") == (id)1)
    v7 = 20.0;
  else
    v7 = 44.0;
  if (var0 <= 0.0)
    var0 = (double)(uint64_t)objc_msgSend(v6, "screenWidth");
  if (var1 <= 0.0)
    var1 = (double)(uint64_t)objc_msgSend(v6, "screenHeight");
  v8 = objc_msgSend(v6, "interfaceIdiom");
  if (v8)
  {
    if (v8 != (id)1)
      goto LABEL_20;
    v9 = (char *)objc_msgSend(v6, "orientation");
    if ((unint64_t)(v9 - 2) < 2)
    {
      v10 = objc_msgSend(v6, "screenWidth");
      if ((double)(uint64_t)v10 + -320.0 < var0)
        var0 = (double)(uint64_t)v10 + -320.0;
    }
    else if ((unint64_t)v9 > 1)
    {
      goto LABEL_18;
    }
    v11 = objc_msgSend(v6, "screenHeight");
    if ((double)(uint64_t)v11 - v7 < var1)
      var1 = (double)(uint64_t)v11 - v7;
  }
LABEL_18:
  v12 = objc_msgSend(v6, "screenHeight");
  if ((double)(uint64_t)v12 - v7 < var1)
    var1 = (double)(uint64_t)v12 - v7;
LABEL_20:

  v13 = var0;
  v14 = var1;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (APClientInfo)clientInfo
{
  return (APClientInfo *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)_canSendLocationInformationForClientInfo:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "locationInfo"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
    if ((objc_msgSend(v5, "isManagedAccount") & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
      v6 = objc_msgSend(v7, "educationModeEnabled") ^ 1;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)addAccountProperties:(id)a3
{
  void *v4;
  void *v5;
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
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedIDsForIDAccountPrivate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iAdID"));
  objc_msgSend(v19, "setIAdID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anonymousDemandID"));
  objc_msgSend(v19, "setAnonymousDemandiAdID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentID"));
  objc_msgSend(v19, "setContentiAdID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "DPID"));
  objc_msgSend(v19, "setDPID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storefront"));
  objc_msgSend(v19, "setITunesStore:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "monthlyIDResetCount"));
  objc_msgSend(v19, "setAdvertisingIdentifierMonthResetCount:", objc_msgSend(v14, "intValue"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iTunesDSID"));
  v16 = objc_msgSend(v15, "isEqualToNumber:", &off_100229870);

  if ((v16 & 1) != 0)
  {
    v17 = 0;
LABEL_17:
    objc_msgSend(v19, "setAccountType:", v17);
    goto LABEL_18;
  }
  if ((objc_msgSend(v13, "ageUnknown") & 1) != 0)
  {
    v18 = 6;
LABEL_13:
    objc_msgSend(v19, "setAccountType:", v18);
    goto LABEL_14;
  }
  if ((objc_msgSend(v13, "isManagedAccount") & 1) != 0)
  {
    v18 = 2;
    goto LABEL_13;
  }
  if ((objc_msgSend(v13, "isChild") & 1) != 0)
  {
    v18 = 3;
    goto LABEL_13;
  }
  if ((objc_msgSend(v13, "isAdolescent") & 1) != 0)
  {
    v18 = 5;
    goto LABEL_13;
  }
  if (objc_msgSend(v13, "isAdult"))
  {
    v18 = 1;
    goto LABEL_13;
  }
LABEL_14:
  if (_os_feature_enabled_impl("PromotedContentFeatureFlags", "AgeEnforcementDisplay")
    && objc_msgSend(v13, "sensitiveContentEligible"))
  {
    v17 = 7;
    goto LABEL_17;
  }
LABEL_18:

}

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBAdBatchResponse, a2);
}

- (NSArray)requestParameters
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchedRequests, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

- (id)batchResponseFromBase64EncodedString:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  char *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  void *v60;
  unsigned int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  id v73;
  void *v74;
  id obj;
  uint64_t v76;
  APAdBatchRequester *v77;
  void *v78;
  id v79;
  uint64_t v80;
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    v10 = 0;
    goto LABEL_55;
  }
  v6 = APECJourneyPurposeConfig_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester headers](self, "headers"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester headers](self, "headers"));
    objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("headers"));

  }
  else
  {
    v11 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412290;
      v93 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%@] Request headers were nil", buf, 0xCu);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester protoBuffer](self, "protoBuffer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dictionaryRepresentation"));

  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[APAdBatchRequester protoBuffer](self, "protoBuffer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dictionaryRepresentation](v18, "dictionaryRepresentation"));
    objc_msgSend(v7, "setValue:forKey:", v19, CFSTR("body"));
LABEL_13:

    goto LABEL_14;
  }
  v20 = APLogForCategory(21);
  v18 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = (objc_class *)objc_opt_class(self);
    v22 = NSStringFromClass(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *(_DWORD *)buf = 138412290;
    v93 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%@] Request body was nil", buf, 0xCu);
    goto LABEL_13;
  }
LABEL_14:

  v23 = APLogForCategory(21);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester protoBuffer](self, "protoBuffer"));
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester additionalRequestDescription](self, "additionalRequestDescription"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "jsonString"));
    *(_DWORD *)buf = 138413058;
    v93 = v28;
    v94 = 2112;
    v95 = v29;
    v96 = 2112;
    v97 = v30;
    v98 = 2112;
    v99 = v31;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] Making MOCKED APPBAdBatchRequest for content identifier %@%@:\n%@", buf, 0x2Au);

    v6 = APECJourneyPurposeConfig_ptr;
  }

  v32 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v5, 0);
  if (!v32)
  {
    v10 = 0;
    goto LABEL_50;
  }
  v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v32, 4);
  v34 = objc_alloc_init((Class)PBTextReader);
  v35 = objc_msgSend(v34, "readMessageType:fromString:", objc_opt_class(APPBAdBatchResponse), v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v10 = v36;
  if (!v36)
    goto LABEL_48;
  v71 = v34;
  v72 = v33;
  v73 = v32;
  v74 = v5;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v78 = v36;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ads"));
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  if (!v79)
    goto LABEL_47;
  v37 = 0;
  v76 = *(_QWORD *)v87;
  v77 = self;
  do
  {
    v38 = 0;
    do
    {
      if (*(_QWORD *)v87 != v76)
        objc_enumerationMutation(obj);
      v80 = v38;
      v39 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchRequester batchedRequests](self, "batchedRequests"));
      v42 = (char *)objc_msgSend(v41, "count") - 1;

      v81 = v37;
      if (v37 >= (unint64_t)v42)
        v43 = v42;
      else
        v43 = (char *)v37;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", v43));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "identifier"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "UUIDString"));
      objc_msgSend(v39, "setAdOriginalRequesterId:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "specification"));
      v48 = objc_msgSend(v47, "type");
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "specification"));
      objc_msgSend(v49, "setType:", v48);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "impressionIdentifierData"));
      v51 = objc_opt_class(NSString);
      LOBYTE(v48) = objc_opt_isKindOfClass(v50, v51);

      if ((v48 & 1) != 0)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "impressionIdentifierData"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "dataUsingEncoding:", 4));
        objc_msgSend(v39, "setImpressionIdentifierData:", v53);

      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "actions"));
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v56; i = (char *)i + 1)
          {
            if (*(_QWORD *)v83 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
            if (!objc_msgSend(v59, "action"))
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "specification"));
              v61 = objc_msgSend(v60, "type");

              switch(v61)
              {
                case 2u:
                  v62 = 13;
                  break;
                case 0xAu:
                  goto LABEL_41;
                case 8u:
                  v62 = 10;
                  break;
                default:
                  v62 = 12;
                  break;
              }
              objc_msgSend(v59, "setAction:", v62);
            }
LABEL_41:
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "actionURL"));

            if (!v63)
              objc_msgSend(v59, "setActionURL:", CFSTR("https://www.apple.com"));
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        }
        while (v56);
      }

      v37 = v81 + 1;
      v38 = v80 + 1;
      self = v77;
    }
    while ((id)(v80 + 1) != v79);
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  }
  while (v79);
LABEL_47:

  v5 = v74;
  v6 = APECJourneyPurposeConfig_ptr;
  v33 = v72;
  v32 = v73;
  v10 = v78;
  v34 = v71;
LABEL_48:

LABEL_50:
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[89], "dictionaryWithCapacity:", 1));
  if (v10)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryRepresentation"));
    objc_msgSend(v64, "setValue:forKey:", v65, CFSTR("body"));

  }
  v66 = APLogForCategory(21);
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "jsonString"));
    *(_DWORD *)buf = 138412546;
    v93 = v68;
    v94 = 2112;
    v95 = v69;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Returning MOCKED APPBAdBatchResponse for request %@:\n%@", buf, 0x16u);

  }
LABEL_55:

  return v10;
}

- (void)setBatchedRequests:(id)a3
{
  objc_storeStrong((id *)&self->_batchedRequests, a3);
}

@end
