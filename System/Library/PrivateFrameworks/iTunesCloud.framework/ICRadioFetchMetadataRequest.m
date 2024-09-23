@implementation ICRadioFetchMetadataRequest

- (ICRadioFetchMetadataRequest)init
{
  ICRadioFetchMetadataRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICRadioFetchMetadataRequest;
  result = -[ICRadioFetchMetadataRequest init](&v3, sel_init);
  if (result)
    result->_qualityOfService = 25;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_storeAdamIDs);
    objc_storeStrong(v5 + 2, self->_storeRequestContext);
    objc_storeStrong(v5 + 3, self->_timedMetadataData);
    v5[4] = (id)self->_qualityOfService;
  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICAsyncBlockOperation *v7;
  ICAsyncBlockOperation *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)-[ICRadioFetchMetadataRequest copy](self, "copy");
  objc_msgSend(v5, "storeRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [ICAsyncBlockOperation alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke;
    v11[3] = &unk_1E438FB60;
    v14 = v4;
    v12 = v6;
    v13 = v5;
    v8 = -[ICAsyncBlockOperation initWithStartHandler:](v7, "initWithStartHandler:", v11);
    objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v8);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);

  }
}

- (NSArray)storeAdamIDs
{
  return self->_storeAdamIDs;
}

- (void)setStoreAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setStoreRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)timedMetadataData
{
  return self->_timedMetadataData;
}

- (void)setTimedMetadataData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataData, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_storeAdamIDs, 0);
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_2;
  v15[3] = &unk_1E438A7E0;
  v5 = *(id *)(a1 + 48);
  v16 = v3;
  v17 = v5;
  v6 = v3;
  v7 = (void *)MEMORY[0x1A1AFA8D0](v15);
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_3;
  v11[3] = &unk_1E4390DA0;
  v12 = v9;
  v13 = *(id *)(a1 + 40);
  v14 = v7;
  v10 = v7;
  objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v12, v11);

}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICRadioURLRequest *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  objc_msgSend(a2, "radioConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("fetchMetadata"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v9);
      objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
      v11 = -[ICRadioURLRequest initWithURLRequest:requestContext:]([ICRadioURLRequest alloc], "initWithURLRequest:requestContext:", v10, *(_QWORD *)(a1 + 32));
      v12 = objc_msgSend(v6, "maxSupportedProtocolVersion");
      if (v12 <= 6)
        v13 = 6;
      else
        v13 = v12;
      -[ICRadioURLRequest setProtocolVersion:](v11, "setProtocolVersion:", v13);
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_4;
      v21[3] = &unk_1E438D300;
      v22 = *(id *)(a1 + 40);
      -[ICRadioURLRequest setRadioContentDictionaryCreationBlock:](v11, "setRadioContentDictionaryCreationBlock:", v21);
      +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_5;
      v19[3] = &unk_1E438D328;
      v20 = *(id *)(a1 + 48);
      objc_msgSend(v15, "enqueueDataRequest:withCompletionHandler:", v11, v19);

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v10);
    }

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v16 + 16))(*(_QWORD *)(a1 + 48), 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v18);

    }
  }

}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, id, _QWORD);

  v8 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "timedMetadataData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("timed-metadata"));
  objc_msgSend(*(id *)(a1 + 32), "storeAdamIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("ids"));
  if (v8)
    v8[2](v8, v5, 0);

}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ICRadioFetchMetadataResponse *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = -[ICRadioResponse initWithURLResponse:]([ICRadioFetchMetadataResponse alloc], "initWithURLResponse:", v10);
    v7 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v6;
      v9 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
    goto LABEL_9;
  }
  v8 = 0;
  v9 = v5;
LABEL_7:
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
LABEL_9:

}

@end
