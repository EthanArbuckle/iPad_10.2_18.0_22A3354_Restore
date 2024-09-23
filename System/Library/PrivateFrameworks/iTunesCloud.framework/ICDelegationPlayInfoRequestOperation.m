@implementation ICDelegationPlayInfoRequestOperation

- (void)finishWithResponse:(id)a3 requestDate:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICDelegationPlayInfoResponseToken *v19;
  void *v20;
  void *v21;
  void *v22;
  ICDelegationPlayInfoRequestOperation *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a4;
  if (a3)
  {
    objc_msgSend(a3, "parsedBodyArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v23 = self;
      v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v24 = v8;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        v26 = v9;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("dsid"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", CFSTR("play-info"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (_NSIsNSData() && (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v14, "objectForKey:", CFSTR("token-ttl-in-seconds"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v17, "doubleValue");
                  objc_msgSend(v25, "dateByAddingTimeInterval:");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v18 = 0;
                }
                v19 = objc_alloc_init(ICDelegationPlayInfoResponseToken);
                -[ICDelegationPlayInfoResponseToken setTokenData:](v19, "setTokenData:", v16);
                -[ICDelegationPlayInfoResponseToken setExpirationDate:](v19, "setExpirationDate:", v18);
                objc_msgSend(v14, "objectForKey:", CFSTR("storefront"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (_NSIsNSString())
                  -[ICDelegationPlayInfoResponseToken setStorefrontIdentifier:](v19, "setStorefrontIdentifier:", v20);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "longLongValue"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v19, v21);

                v9 = v26;
              }

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      -[ICDelegationPlayInfoRequestOperation _finishWithResult:tokens:error:](v23, "_finishWithResult:tokens:error:", 1, v27, 0);
      v8 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDelegationPlayInfoRequestOperation _finishWithResult:tokens:error:](self, "_finishWithResult:tokens:error:", 0, 0, v22);

    }
  }
  else
  {
    -[ICDelegationPlayInfoRequestOperation _finishWithResult:tokens:error:](self, "_finishWithResult:tokens:error:", 0, 0, a5);
  }

}

- (void)execute
{
  void *v3;
  ICStoreRequestContext *storeRequestContext;
  _QWORD v5[5];

  objc_storeStrong((id *)&self->_strongSelf, self);
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke;
  v5[3] = &unk_1E4391658;
  v5[4] = self;
  objc_msgSend(v3, "getBagForRequestContext:withCompletionHandler:", storeRequestContext, v5);

}

- (void)finishWithError:(id)a3
{
  ICDelegationPlayInfoRequestOperation *strongSelf;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDelegationPlayInfoRequestOperation;
  -[ICAsyncOperation finishWithError:](&v5, sel_finishWithError_, a3);
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (void)_finishWithResult:(BOOL)a3 tokens:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**responseHandler)(id, _BOOL8, id, id);
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v8 = a5;
  responseHandler = (void (**)(id, _BOOL8, id, id))self->_responseHandler;
  v12 = v8;
  if (responseHandler)
  {
    if (a4)
      v10 = a4;
    else
      v10 = (id)MEMORY[0x1E0C9AA70];
    responseHandler[2](responseHandler, v6, v10, v8);
    v11 = self->_responseHandler;
    self->_responseHandler = 0;

    v8 = v12;
  }
  -[ICDelegationPlayInfoRequestOperation finishWithError:](self, "finishWithError:", v8);

}

- (ICDelegationPlayInfoRequest)playInfoRequest
{
  return self->_playInfoRequest;
}

- (void)setPlayInfoRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setStoreRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_storeRequestContext, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_playInfoRequest, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

void __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  ICStoreURLRequest *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  if (a2)
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("getWholeHouseAudioPlayInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "propertyListRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("guid"));
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (objc_class *)MEMORY[0x1E0C92C28];
        v10 = v19;
        v11 = (id)objc_msgSend([v9 alloc], "initWithURL:cachePolicy:timeoutInterval:", v4, 1, 30.0);
        objc_msgSend(v11, "setHTTPBody:", v8);
        objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke_2;
        v17[3] = &unk_1E438E870;
        v17[4] = *(_QWORD *)(a1 + 32);
        v18 = v12;
        v15 = v12;
        objc_msgSend(v14, "enqueueDataRequest:withCompletionHandler:", v13, v17);

      }
      else
      {
        v16 = *(void **)(a1 + 32);
        v11 = v19;
        objc_msgSend(v16, "_finishWithResult:tokens:error:", 0, 0, v11);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_finishWithResult:tokens:error:", 0, 0, v5);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResult:tokens:error:", 0, 0, a3);
  }
}

uint64_t __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResponse:requestDate:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

@end
