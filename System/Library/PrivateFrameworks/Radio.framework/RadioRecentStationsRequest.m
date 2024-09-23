@implementation RadioRecentStationsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStationStringID, 0);
  objc_storeStrong((id *)&self->_currentStation, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)getCachedRecentStationsResponseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__RadioRecentStationsRequest_getCachedRecentStationsResponseWithCompletionHandler___block_invoke;
  v6[3] = &unk_24CA2E708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RadioRequest _loadRadioStoreBagWithCompletionHandler:](self, "_loadRadioStoreBagWithCompletionHandler:", v6);

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RadioRecentStationsRequest;
  -[RadioRequest cancel](&v3, sel_cancel);
  -[SSURLConnectionRequest cancel](self->_request, "cancel");
}

- (void)setShouldGroupResponses:(BOOL)a3
{
  self->_shouldGroupResponses = a3;
}

- (RadioRecentStationsRequest)initWithCurrentStation:(id)a3
{
  id v5;
  RadioRecentStationsRequest *v6;
  RadioRecentStationsRequest *v7;

  v5 = a3;
  v6 = -[RadioRequest init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentStation, a3);

  return v7;
}

void __83__RadioRecentStationsRequest_getCachedRecentStationsResponseWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newRecentStationsURLRequestPropertiesWithBaseURL:", v3);
    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedConnectionResponseForRequestProperties:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "_recentStationsResponseWithConnectionResponse:returningError:", v6, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (id)_newRecentStationsURLRequestPropertiesWithBaseURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  if (self->_stationCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("count"));

  }
  if (!self->_shouldGroupResponses)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("flatten"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[RadioStation stationStringID](self->_currentStation, "stationStringID");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v9 || (v9 = self->_currentStationStringID) != 0)
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("radio-station-id"));
  v10 = -[RadioStation stationID](self->_currentStation, "stationID");
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("station-id"));

  }
  -[RadioStation stationHash](self->_currentStation, "stationHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("station-hash"));
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("station-info"));
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("recentStations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v13);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v5, -[RadioRequest isAsynchronousBackgroundRequest](self, "isAsynchronousBackgroundRequest"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPBody:", v15);

  return v14;
}

- (RadioRecentStationsRequest)initWithCurrentStationStringID:(id)a3
{
  id v4;
  RadioRecentStationsRequest *v5;
  uint64_t v6;
  NSString *currentStationStringID;

  v4 = a3;
  v5 = -[RadioRequest init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    currentStationStringID = v5->_currentStationStringID;
    v5->_currentStationStringID = (NSString *)v6;

  }
  return v5;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[RadioRequest requestContext](self, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke;
  block[3] = &unk_24CA2E938;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)_configureRequestPropertiesForCaching:(id)a3 returningCacheKey:(id *)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
  if (a4)
  {
    objc_msgSend(v8, "HTTPBody");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "bytes");
    objc_msgSend(v5, "length");
    ISMD5StringForBytes();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v6 = &stru_24CA306F0;
    *a4 = objc_retainAutorelease(v6);

  }
  objc_msgSend(v8, "setHTTPBody:", 0);

}

- (id)_recentStationsResponseWithConnectionResponse:(id)a3 returningError:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  RadioRecentStationsResponse *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  RadioRecentStationsResponse *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "radio_decompressedBodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v11 = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v16 = 0;
  v17 = 0;
  objc_msgSend(v6, "propertyListForRadioResponseReturningError:unparsedResponseDictionary:", &v17, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = -[RadioRecentStationsResponse initWithResponseDictionary:]([RadioRecentStationsResponse alloc], "initWithResponseDictionary:", v7);
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v11 = v8;
    v13 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize get stations response (%@)", buf, 0xCu);
    }

    v10 = 0;
    v12 = 3;
  }
  -[RadioRequest setStatus:](self, "setStatus:", v12);

  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v11);
LABEL_11:
  v14 = v10;

  return v14;
}

- (BOOL)shouldGroupResponses
{
  return self->_shouldGroupResponses;
}

- (unint64_t)stationCount
{
  return self->_stationCount;
}

- (void)setStationCount:(unint64_t)a3
{
  self->_stationCount = a3;
}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24CA2E828;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_loadRadioStoreBagWithCompletionHandler:", v3);

}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[5];
  id v44;

  v3 = a2;
  objc_msgSend(v3, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "setStatus:", 5);
    dispatch_get_global_queue(0, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_3;
    block[3] = &unk_24CA2E9B0;
    v30 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v44 = v30;
    dispatch_async(v29, block);

    v6 = v44;
    goto LABEL_10;
  }
  v6 = (void *)objc_msgSend(v5, "_newRecentStationsURLRequestPropertiesWithBaseURL:", v4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB2000], "newRadioRequestWithRequestContext:requestProperties:storeBag:", *(_QWORD *)(a1 + 40), v6, v3);
  objc_msgSend(v7, "requestProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = *(void **)(a1 + 32);
  v42 = 0;
  objc_msgSend(v10, "_configureRequestPropertiesForCaching:returningCacheKey:", v9, &v42);
  v11 = v42;
  objc_msgSend((id)objc_opt_class(), "defaultURLCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v12, "cachedConnectionResponseForRequestProperties:cachedResponse:", v9, &v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v41;

  if (v13)
  {
    if ((objc_msgSend(v13, "ssv_isExpiredResponse") & 1) == 0)
    {
      objc_msgSend(v35, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.Radio.RadioRecentStationsRequest.bodyMD5"));
      v34 = v13;
      v15 = v4;
      v16 = v3;
      v17 = v7;
      v18 = v6;
      v19 = v11;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v19);

      v11 = v19;
      v6 = v18;
      v7 = v17;
      v3 = v16;
      v4 = v15;
      v13 = v34;

      if (v21)
      {
        v22 = *(void **)(a1 + 32);
        v40 = 0;
        objc_msgSend(v22, "_recentStationsResponseWithConnectionResponse:returningError:", v34, &v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v40;
        if (!v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "setCachedResponse:", 1);
          v31 = *(_QWORD *)(a1 + 48);
          if (v31)
            (*(void (**)(uint64_t, void *, _QWORD))(v31 + 16))(v31, v23, 0);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v32 = v23;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

          goto LABEL_8;
        }
        v25 = v24;

      }
    }
  }
  +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "beginUsingNetwork");

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v7);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 72);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_4;
  v36[3] = &unk_24CA2E738;
  v36[4] = v27;
  v37 = v9;
  v38 = v11;
  v39 = *(id *)(a1 + 48);
  objc_msgSend(v28, "startWithConnectionResponseBlock:", v36);

LABEL_8:
LABEL_10:

}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RadioRequestErrorDomain"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endUsingNetwork");

  if (v5)
  {
    v8 = objc_msgSend(v5, "statusCode");
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "integerValue");

  }
  v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v8;
    _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioRecentStationsRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v6;
      _os_log_impl(&dword_2105F8000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get recent stations (%@)", buf, 0xCu);
    }

    v13 = v6;
    if (!v6)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BEB24A0];
      v37 = *MEMORY[0x24BEB24A8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 109, v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v8 <= 399)
    {
      v18 = 1;
      if (v8 == 200 || v8 == 204)
        goto LABEL_22;
    }
    else
    {
      switch(v8)
      {
        case 404:
          goto LABEL_15;
        case 401:
          v18 = 2;
          goto LABEL_22;
        case 400:
LABEL_15:
          v18 = 4;
LABEL_22:
          objc_msgSend(*(id *)(a1 + 32), "setStatus:", v18);
          v20 = 0;
          goto LABEL_23;
      }
    }
    v18 = 3;
    goto LABEL_22;
  }
  v19 = *(void **)(a1 + 32);
  v34 = v6;
  objc_msgSend(v19, "_recentStationsResponseWithConnectionResponse:returningError:", v5, &v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;

  if (v20)
  {
    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    v35 = CFSTR("com.apple.Radio.RadioRecentStationsRequest.bodyMD5");
    v36 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "storeConnectionResponse:forRequestProperties:userInfo:", v5, v23, v24);

  }
LABEL_23:
  dispatch_get_global_queue(0, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_10;
  block[3] = &unk_24CA2E7D8;
  v26 = *(id *)(a1 + 56);
  v30 = v20;
  v31 = v13;
  v32 = *(_QWORD *)(a1 + 32);
  v33 = v26;
  v27 = v13;
  v28 = v20;
  dispatch_async(v25, block);

}

void __57__RadioRecentStationsRequest_startWithCompletionHandler___block_invoke_10(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[7];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), a1[6]);

}

@end
