@implementation ICRadioLikeRequest

- (ICRadioLikeRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICRadioLikeRequest *v5;
  ICRadioLikeRequest *v6;
  uint64_t v7;
  ICStoreRequestContext *requestContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICRadioLikeRequest;
  v5 = -[ICRadioLikeRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 25;
    v7 = objc_msgSend(v4, "copy");
    requestContext = v6->_requestContext;
    v6->_requestContext = (ICStoreRequestContext *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = v5;
  if (v5)
  {
    v5[2] = self->_likeState;
    v5[1] = self->_storeAdamID;
    v5[4] = self->_stationID;
    v7 = -[NSString copyWithZone:](self->_stationHash, "copyWithZone:", a3);
    v8 = (void *)v6[3];
    v6[3] = v7;

    v9 = -[NSString copyWithZone:](self->_stationStringID, "copyWithZone:", a3);
    v10 = (void *)v6[5];
    v6[5] = v9;

    v6[6] = self->_qualityOfService;
    v11 = -[ICRequestContext copyWithZone:](self->_requestContext, "copyWithZone:", a3);
    v12 = (void *)v6[7];
    v6[7] = v11;

  }
  return v6;
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
  v5 = (void *)-[ICRadioLikeRequest copy](self, "copy");
  objc_msgSend(v5, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [ICAsyncBlockOperation alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke;
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

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_storeAdamID = a3;
}

- (int64_t)likeState
{
  return self->_likeState;
}

- (void)setLikeState:(int64_t)a3
{
  self->_likeState = a3;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setStationHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
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
  v15[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_2;
  v15[3] = &unk_1E438D2D0;
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
  v11[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_3;
  v11[3] = &unk_1E4390DA0;
  v12 = v9;
  v13 = *(id *)(a1 + 40);
  v14 = v7;
  v10 = v7;
  objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v12, v11);

}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICRadioURLRequest *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  objc_msgSend(a2, "radioConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlForBagRadioKey:", CFSTR("like-event-url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v7);
    objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
    v9 = -[ICRadioURLRequest initWithURLRequest:requestContext:]([ICRadioURLRequest alloc], "initWithURLRequest:requestContext:", v8, *(_QWORD *)(a1 + 32));
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_4;
    v15[3] = &unk_1E438D300;
    v16 = *(id *)(a1 + 40);
    -[ICRadioURLRequest setRadioContentDictionaryCreationBlock:](v9, "setRadioContentDictionaryCreationBlock:", v15);
    +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_23;
    v13[3] = &unk_1E438D328;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v9, v13);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v5);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v8);
  }

LABEL_6:
}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(id, id, _QWORD);

  v16 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "stationStringID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("radio-station-id"));
    goto LABEL_9;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "stationID");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("station-id");
LABEL_7:
    objc_msgSend(v5, "setObject:forKey:", v8, v9);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "stationHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = CFSTR("station-hash");
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  v10 = objc_msgSend(*(id *)(a1 + 32), "storeAdamID");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("id"));

  }
  objc_msgSend(v5, "setObject:forKey:", &unk_1E43E6790, CFSTR("type"));
  v12 = objc_msgSend(*(id *)(a1 + 32), "likeState");
  if (v12 == -1)
    v13 = -1;
  else
    v13 = 0;
  if (v12 == 1)
    v14 = 1;
  else
    v14 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("like-value"));

  if (v16)
    v16[2](v16, v5, 0);

}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ICRadioLikeResponse *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = -[ICRadioResponse initWithURLResponse:]([ICRadioLikeResponse alloc], "initWithURLResponse:", v10);
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
