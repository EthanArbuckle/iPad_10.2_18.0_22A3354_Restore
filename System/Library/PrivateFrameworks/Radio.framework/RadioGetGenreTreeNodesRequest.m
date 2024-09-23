@implementation RadioGetGenreTreeNodesRequest

- (RadioGetGenreTreeNodesRequest)init
{
  return -[RadioGetGenreTreeNodesRequest initWithParentNodeID:](self, "initWithParentNodeID:", 0);
}

- (RadioGetGenreTreeNodesRequest)initWithParentNodeID:(unint64_t)a3
{
  RadioGetGenreTreeNodesRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RadioGetGenreTreeNodesRequest;
  result = -[RadioRequest init](&v5, sel_init);
  if (result)
    result->_parentNodeID = a3;
  return result;
}

- (void)startWithCachedCompletionHandler:(id)a3 networkCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__RadioGetGenreTreeNodesRequest_startWithCachedCompletionHandler_networkCompletionHandler___block_invoke;
  v10[3] = &unk_24CA2E760;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RadioGetGenreTreeNodesRequest startWithCompletionHandler:](self, "startWithCompletionHandler:", v10);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[RadioRequest requestContext](self, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke;
  v8[3] = &unk_24CA2E828;
  v9 = v5;
  v10 = v4;
  v8[4] = self;
  v6 = v5;
  v7 = v4;
  -[RadioRequest _loadRadioStoreBagWithCompletionHandler:](self, "_loadRadioStoreBagWithCompletionHandler:", v8);

}

- (id)_genreTreeByApplyingResponse:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  SSMetricsConfiguration *v10;
  NSObject *metricsConfiguration;
  uint64_t v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "radio_decompressedBodyData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v14 = 0;
    v15 = 0;
    objc_msgSend(v4, "propertyListForRadioResponseReturningError:unparsedResponseDictionary:", &v15, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    v7 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "responseContentKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }
      v10 = (SSMetricsConfiguration *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithStorePlatformData:", v7);
      metricsConfiguration = self->_metricsConfiguration;
      self->_metricsConfiguration = v10;
      v12 = 1;
    }
    else
    {
      metricsConfiguration = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(metricsConfiguration, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v6;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_2105F8000, metricsConfiguration, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize genre tree response (%@), data: %@", buf, 0x16u);
      }
      v9 = 0;
      v12 = 3;
    }

    -[RadioRequest setStatus:](self, "setStatus:", v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  uint8_t buf[4];
  void *v46;
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "radioConfigurationDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "requestBagKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || v5)
  {
    v47 = CFSTR("parent-id");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("max-protocol-version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v7 && v13 >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "queryStringForRadioRequestParameters:protocolVersion:error:", v10, 4, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v7, "stringByAppendingString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "absoluteString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_2105F8000, v18, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Request URL: %@", buf, 0xCu);

      }
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v17);
      objc_msgSend(v20, "setHTTPMethod:", CFSTR("GET"));
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "fallbackRequestPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLByAppendingPathComponent:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v23;
        _os_log_impl(&dword_2105F8000, v22, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Request URL: %@", buf, 0xCu);

      }
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v14);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v10, objc_msgSend(*(id *)(a1 + 32), "isAsynchronousBackgroundRequest"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHTTPBody:", v17);
    }

    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cachedConnectionResponseForRequestProperties:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25
      && (objc_msgSend(v25, "ssv_isExpiredResponse") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "_genreTreeByApplyingResponse:", v25),
          (v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = (void *)v26;
      objc_msgSend(v25, "metricsPageEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "mutableCopy");
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 96);
      *(_QWORD *)(v30 + 96) = v29;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCachedResponse:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setCachedResponse:", 1);
      v32 = *(_QWORD *)(a1 + 48);
      if (v32)
        (*(void (**)(uint64_t, void *, _QWORD))(v32 + 16))(v32, v27, 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

    }
    else
    {
      +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "beginUsingNetwork");

      v35 = objc_msgSend(MEMORY[0x24BEB2000], "newRadioRequestWithRequestContext:requestProperties:storeBag:", *(_QWORD *)(a1 + 40), v20, v3);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(void **)(v36 + 80);
      *(_QWORD *)(v36 + 80) = v35;

      v38 = *(_QWORD *)(a1 + 32);
      v39 = *(void **)(v38 + 80);
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_17;
      v40[3] = &unk_24CA2E800;
      v40[4] = v38;
      v41 = v20;
      v42 = *(id *)(a1 + 48);
      objc_msgSend(v39, "startWithConnectionResponseBlock:", v40);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 5);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24CA2E9B0;
    v9 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v44 = v9;
    dispatch_async(v8, block);

    v10 = v44;
  }

}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1)
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

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
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
    v36 = v8;
    _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioGetGenreTreeNodesRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v12 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = (uint64_t)v6;
      _os_log_impl(&dword_2105F8000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get genre tree (%@)", buf, 0xCu);
    }

    if (!v6)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BEB24A0];
      v33 = *MEMORY[0x24BEB24A8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 109, v16);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v8 <= 399)
    {
      v17 = 1;
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
          v17 = 2;
          goto LABEL_22;
        case 400:
LABEL_15:
          v17 = 4;
LABEL_22:
          objc_msgSend(*(id *)(a1 + 32), "setStatus:", v17);
          v18 = 0;
          goto LABEL_23;
      }
    }
    v17 = 3;
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "_genreTreeByApplyingResponse:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "defaultURLCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storeConnectionResponse:forRequestProperties:", v5, *(_QWORD *)(a1 + 40));

  }
LABEL_23:
  objc_msgSend(v5, "metricsPageEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "mutableCopy");
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 96);
  *(_QWORD *)(v22 + 96) = v21;

  dispatch_get_global_queue(0, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_19;
  v28[3] = &unk_24CA2E7D8;
  v25 = *(id *)(a1 + 48);
  v29 = v18;
  v30 = v6;
  v31 = *(_QWORD *)(a1 + 32);
  v32 = v25;
  v26 = v6;
  v27 = v18;
  dispatch_async(v24, v28);

}

void __60__RadioGetGenreTreeNodesRequest_startWithCompletionHandler___block_invoke_19(_QWORD *a1)
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

void __91__RadioGetGenreTreeNodesRequest_startWithCachedCompletionHandler_networkCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

+ (id)cacheKeyForGenreWithNodeID:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("getGenreTreeNodes-%llu"), a3);
}

+ (id)fallbackRequestPath
{
  return CFSTR("getGenreTreeNodes");
}

+ (id)requestBagKey
{
  return CFSTR("getGenreTreeNodes-url");
}

+ (id)responseContentKey
{
  return CFSTR("genre-tree");
}

@end
