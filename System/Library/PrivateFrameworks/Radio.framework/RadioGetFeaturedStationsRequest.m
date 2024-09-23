@implementation RadioGetFeaturedStationsRequest

- (RadioGetFeaturedStationsRequest)init
{
  return -[RadioGetFeaturedStationsRequest initWithStationCount:](self, "initWithStationCount:", 0);
}

- (RadioGetFeaturedStationsRequest)initWithStationCount:(unsigned int)a3
{
  RadioGetFeaturedStationsRequest *v4;
  RadioGetFeaturedStationsRequest *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *artworkQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RadioGetFeaturedStationsRequest;
  v4 = -[RadioRequest init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_stationCount = a3;
    v6 = dispatch_queue_create("com.apple.Radio.RadioSyncRequest.artworkQueue", 0);
    artworkQueue = v5->_artworkQueue;
    v5->_artworkQueue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (void)cancel
{
  -[SSURLConnectionRequest cancel](self->_request, "cancel");
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke;
  v6[3] = &unk_24CA2E7B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RadioGetFeaturedStationsRequest startWithFeaturedStationsCompletionHandler:](self, "startWithFeaturedStationsCompletionHandler:", v6);

}

- (void)startWithFeaturedStationsCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke;
  v7[3] = &unk_24CA2E9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_importFeaturedStationWithDictionary:(id)a3 inModel:(id)a4 loadArtworkSynchronously:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("station-hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v7, "stationWithHash:", v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend(v8, "length"))
    {
LABEL_9:
      v9 = 0;
      goto LABEL_10;
    }
    v9 = (void *)objc_msgSend(v7, "newFeaturedStationWithDictionary:", v6);
    if (!v9)
    {
      v10 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_2105F8000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to create featured station with dictionary: %@", (uint8_t *)&v12, 0xCu);
      }

      goto LABEL_9;
    }
  }
LABEL_10:

LABEL_12:
  return v9;
}

- (id)_stationDictionariesByApplyingResponse:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "radio_decompressedBodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v10 = 0;
    v12 = 0;
    if (!a4)
      goto LABEL_18;
    goto LABEL_17;
  }
  v15 = 0;
  objc_msgSend(v6, "propertyListForRadioResponseReturningError:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (!v7)
  {
    v12 = v8;
    v10 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2105F8000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize featured stations response (%@), data: %@", buf, 0x16u);
    }
    v11 = 0;
    v13 = 3;
    goto LABEL_14;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("stations"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (self->_stationCount && -[NSObject count](v10, "count") > (unint64_t)self->_stationCount)
  {
    -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v12 = 0;
    v13 = 1;
LABEL_14:

    v10 = v11;
    goto LABEL_16;
  }
  v12 = 0;
  v13 = 1;
LABEL_16:
  -[RadioRequest setStatus:](self, "setStatus:", v13);

  if (a4)
LABEL_17:
    *a4 = objc_retainAutorelease(v12);
LABEL_18:

  return v10;
}

- (BOOL)disableArtworkLoading
{
  return self->_disableArtworkLoading;
}

- (void)setDisableArtworkLoading:(BOOL)a3
{
  self->_disableArtworkLoading = a3;
}

- (BOOL)disableCachedResponses
{
  return self->_disableCachedResponses;
}

- (void)setDisableCachedResponses:(BOOL)a3
{
  self->_disableCachedResponses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_artworkQueue, 0);
}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "requestContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_2;
  v5[3] = &unk_24CA2E828;
  v3 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v8 = v3;
  v4 = v2;
  objc_msgSend(v6, "_loadRadioStoreBagWithCompletionHandler:", v5);

}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  _DWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD block[5];
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("getFeaturedStations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_2105F8000, v7, OS_LOG_TYPE_INFO, "[RadioGetFeaturedStationsRequest] Request URL: %@", buf, 0xCu);

    }
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v6);
    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedConnectionResponseForRequestProperties:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "ssv_isExpiredResponse") & 1) == 0)
    {
      v12 = *(void **)(a1 + 32);
      v31 = 0;
      objc_msgSend(v12, "_stationDictionariesByApplyingResponse:error:", v11, &v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v31;
      v15 = v14;
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCachedResponse:", 1);
        v16 = *(_QWORD *)(a1 + 48);
        if (v16)
          (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v13, v15);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

        goto LABEL_16;
      }

    }
    v20 = *(_DWORD **)(a1 + 32);
    if (v20[22])
    {
      v34 = CFSTR("count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(_DWORD **)(a1 + 32);
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDBD1B8];
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v15, objc_msgSend(v20, "isAsynchronousBackgroundRequest"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v13);
    +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "beginUsingNetwork");

    v23 = objc_msgSend(MEMORY[0x24BEB2000], "newRadioRequestWithRequestContext:requestProperties:storeBag:", *(_QWORD *)(a1 + 40), v9, v3);
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 80);
    *(_QWORD *)(v24 + 80) = v23;

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 80);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_24;
    v28[3] = &unk_24CA2E800;
    v28[4] = v26;
    v29 = v9;
    v30 = *(id *)(a1 + 48);
    objc_msgSend(v27, "startWithConnectionResponseBlock:", v28);

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 5);
  dispatch_get_global_queue(0, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_3;
  block[3] = &unk_24CA2E9B0;
  v19 = *(id *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  v33 = v19;
  dispatch_async(v18, block);

  v6 = v33;
LABEL_17:

}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
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
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
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
    v35 = v8;
    _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioGetFeaturedStationsRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v6;
      _os_log_impl(&dword_2105F8000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get featured stations (%@)", buf, 0xCu);
    }

    v13 = v6;
    if (!v6)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BEB24A0];
      v32 = *MEMORY[0x24BEB24A8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 109, v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v8 <= 399)
    {
      v18 = 1;
      if (v8 == 200 || v8 == 204)
        goto LABEL_23;
    }
    else
    {
      switch(v8)
      {
        case 404:
          goto LABEL_15;
        case 401:
          v18 = 2;
          goto LABEL_23;
        case 400:
LABEL_15:
          v18 = 4;
LABEL_23:
          objc_msgSend(*(id *)(a1 + 32), "setStatus:", v18);
          v20 = 0;
          goto LABEL_24;
      }
    }
    v18 = 3;
    goto LABEL_23;
  }
  v19 = *(void **)(a1 + 32);
  if (v6)
  {
    v31 = v6;
    objc_msgSend(v19, "_stationDictionariesByApplyingResponse:error:", v5, &v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31;

  }
  else
  {
    objc_msgSend(v19, "_stationDictionariesByApplyingResponse:error:", v5, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
LABEL_24:
  if (objc_msgSend(v20, "count") && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 93))
  {
    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "storeConnectionResponse:forRequestProperties:", v5, *(_QWORD *)(a1 + 40));

  }
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_26;
  block[3] = &unk_24CA2E7D8;
  v23 = *(id *)(a1 + 48);
  v27 = v20;
  v28 = v13;
  v29 = *(_QWORD *)(a1 + 32);
  v30 = v23;
  v24 = v13;
  v25 = v20;
  dispatch_async(v22, block);

}

void __78__RadioGetFeaturedStationsRequest_startWithFeaturedStationsCompletionHandler___block_invoke_26(_QWORD *a1)
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

void __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v20 = a2;
  v19 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__931;
  v35 = __Block_byref_object_dispose__932;
  v36 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCachedResponse") && objc_msgSend(v20, "count"))
    {
      +[RadioModel sharedModel](RadioModel, "sharedModel");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v20, "count"));
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v6 = v20;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "objectForKey:", CFSTR("station-hash"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v21, "stationWithHash:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v12)
                {

                  goto LABEL_20;
                }
                objc_msgSend(v5, "addObject:", v12);

              }
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v7)
            continue;
          break;
        }
      }

      if (objc_msgSend(v5, "count"))
      {
        v5 = v5;
        v13 = v5;
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
LABEL_20:
      +[RadioModel backgroundModel](RadioModel, "backgroundModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke_5;
      v22[3] = &unk_24CA2E788;
      v26 = &v31;
      v23 = v14;
      v15 = v20;
      v16 = *(_QWORD *)(a1 + 32);
      v24 = v15;
      v25 = v16;
      v21 = v23;
      objc_msgSend(v23, "performWriteTransactionWithBlock:", v22);
      +[RadioModel sharedModel](RadioModel, "sharedModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertObjects:", v32[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v23;
    }

  }
  else
  {
    v13 = 0;
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v13, v19);

  _Block_object_dispose(&v31, 8);
}

void __62__RadioGetFeaturedStationsRequest_startWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id obj;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "userStations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("stationHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 32), "featuredStations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 40), "count");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 40);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v29 = ~v10;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", CFSTR("station-hash"), v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v27, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "_importFeaturedStationWithDictionary:inModel:loadArtworkSynchronously:", v16, *(_QWORD *)(a1 + 32), v13 < 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "setSortOrder:");
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v19);
            ++v13;
            ++v29;
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minusSet:", v20);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v26;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(a1 + 32), "deleteStation:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v23);
  }

}

@end
