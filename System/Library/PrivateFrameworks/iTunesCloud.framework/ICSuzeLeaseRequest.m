@implementation ICSuzeLeaseRequest

- (ICSuzeLeaseRequest)initWithRequestContext:(id)a3 requestType:(int64_t)a4 leaseID:(id)a5 mediaType:(int64_t)a6 clientData:(id)a7
{
  id v12;
  id v13;
  id v14;
  ICSuzeLeaseRequest *v15;
  uint64_t v16;
  ICStoreRequestContext *requestContext;
  uint64_t v18;
  NSString *leaseID;
  uint64_t v20;
  NSData *clientData;
  objc_super v23;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ICSuzeLeaseRequest;
  v15 = -[ICSuzeLeaseRequest init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    requestContext = v15->_requestContext;
    v15->_requestContext = (ICStoreRequestContext *)v16;

    v15->_requestType = a4;
    v18 = objc_msgSend(v13, "copy");
    leaseID = v15->_leaseID;
    v15->_leaseID = (NSString *)v18;

    v15->_mediaType = a6;
    v15->_qualityOfService = 25;
    v20 = objc_msgSend(v14, "copy");
    clientData = v15->_clientData;
    v15->_clientData = (NSData *)v20;

  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSData copyWithZone:](self->_clientData, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v5[6] = self->_requestType;
    v8 = -[NSString copyWithZone:](self->_leaseID, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v5[3] = self->_mediaType;
    v5[4] = self->_qualityOfService;
    v10 = -[ICRequestContext copyWithZone:](self->_requestContext, "copyWithZone:", a3);
    v11 = (void *)v5[5];
    v5[5] = v10;

  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  ICAsyncBlockOperation *v6;
  id v7;
  id v8;
  ICAsyncBlockOperation *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)-[ICSuzeLeaseRequest copy](self, "copy");
  v6 = [ICAsyncBlockOperation alloc];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke;
  v14 = &unk_1E438EFB0;
  v15 = v5;
  v16 = v4;
  v7 = v4;
  v8 = v5;
  v9 = -[ICAsyncBlockOperation initWithStartHandler:](v6, "initWithStartHandler:", &v11);
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", objc_msgSend(v8, "qualityOfService", v11, v12, v13, v14));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v9);

}

- (NSData)clientData
{
  return self->_clientData;
}

- (NSString)leaseID
{
  return self->_leaseID;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_leaseID, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2;
  v18[3] = &unk_1E438D128;
  v19 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v5 = v3;
  v20 = v5;
  v6 = (void *)MEMORY[0x1A1AFA8D0](v18);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__20315;
  v16[4] = __Block_byref_object_dispose__20316;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_4;
  v11[3] = &unk_1E438D178;
  v15 = v16;
  v12 = *(id *)(a1 + 32);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v8, "getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:", v9, 0, v11);

  _Block_object_dispose(v16, 8);
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)objc_msgSend(a1[4], "qualityOfService"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.iTunesCloud.ICSuzeLeaseRequest.calloutQueue", v10);

  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_3;
  v19 = &unk_1E4390EA8;
  v12 = a1[6];
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v23 = v12;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(v11, &v16);
  objc_msgSend(a1[5], "finishWithError:", v13, v16, v17, v18, v19);

}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  ICStoreURLRequest *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  id v52;

  v7 = a2;
  v8 = a4;
  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (v7)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "requestType") - 1;
    if (v12 > 2)
      v13 = 0;
    else
      v13 = *off_1E438D198[v12];
    objc_msgSend(v7, "urlForBagKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = objc_msgSend(*(id *)(a1 + 32), "mediaType") - 1;
      if (v18 > 6)
        v19 = CFSTR("unknown");
      else
        v19 = off_1E438D1B0[v18];
      objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("media-kind"));
      objc_msgSend(*(id *)(a1 + 40), "deviceInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deviceGUID");
      v24 = objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("guid"));
      objc_msgSend(*(id *)(a1 + 32), "clientData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v17, "setObject:forKey:", v25, CFSTR("client-data"));
      v48 = (void *)v24;
      objc_msgSend(*(id *)(a1 + 32), "leaseID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("lease-id"));

      v52 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v17, 100, 0, &v52);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v52;
      v29 = v28;
      if (v27)
      {
        v45 = v25;
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v16);
        objc_msgSend(v30, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v30, "setHTTPBody:", v27);
        objc_msgSend(v30, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v46 = v16;
        v31 = v8;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v30, *(_QWORD *)(a1 + 40));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suzeLease/%@"), v13);
        v47 = v27;
        v34 = v29;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICURLRequest enableLoadURLMetricsWithRequestName:](v33, "enableLoadURLMetricsWithRequestName:", v35);

        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2_24;
        v49[3] = &unk_1E438D150;
        v50 = v32;
        v44 = *(_OWORD *)(a1 + 48);
        v37 = (id)v44;
        v51 = v44;
        v38 = v32;
        v8 = v31;
        v16 = v46;
        v39 = v38;
        objc_msgSend(v36, "enqueueDataRequest:withCompletionHandler:", v33, v49);

        v29 = v34;
        v27 = v47;

        v25 = v45;
      }
      else
      {
        v40 = *(_QWORD *)(a1 + 48);
        v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        if (v28)
        {
          (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v40 + 16))(v40, 0, v41, v28);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v40 + 16))(v40, 0, v41, v43);

          v29 = 0;
        }
      }

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v20 + 16))(v20, 0, v21, v22);

    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      (*(void (**)(_QWORD, _QWORD, uint64_t, id))(v14 + 16))(*(_QWORD *)(a1 + 48), 0, v15, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v14 + 16))(v14, 0, v15, v42);

    }
  }

}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2_24(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ICSuzeLeaseResponse *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(v15, "aggregatedPerformanceMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v5)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(v15, "parsedBodyDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = -[ICSuzeLeaseResponse initWithResponseDictionary:requestDate:]([ICSuzeLeaseResponse alloc], "initWithResponseDictionary:requestDate:", v11, a1[4]);
      (*(void (**)(_QWORD, ICSuzeLeaseResponse *, _QWORD, _QWORD))(a1[5] + 16))(a1[5], v12, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
    }
    else
    {
      v13 = a1[5];
      v14 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v12 = (ICSuzeLeaseResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, ICSuzeLeaseResponse *))(v13 + 16))(v13, 0, v14, v12);
    }

  }
}

uint64_t __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

@end
