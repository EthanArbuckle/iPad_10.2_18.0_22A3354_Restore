@implementation RadioRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unparsedResponseDictionary, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_loadRadioStoreBagWithCompletionHandler:(id)a3
{
  -[RadioRequest _loadRadioStoreBagAndAllowRetry:withCompletionHandler:](self, "_loadRadioStoreBagAndAllowRetry:withCompletionHandler:", 1, a3);
}

- (void)_loadRadioStoreBagAndAllowRetry:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  RadioLoadStoreBagRequest *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v4 = a3;
  v6 = a4;
  v7 = objc_alloc_init(RadioLoadStoreBagRequest);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  if (v4)
    v8 = 0;
  else
    v8 = 3;
  v10[2] = __70__RadioRequest__loadRadioStoreBagAndAllowRetry_withCompletionHandler___block_invoke;
  v10[3] = &unk_24CA2E4C8;
  v12 = v4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[RadioLoadStoreBagRequest loadStoreBagWithOptions:completionHandler:](v7, "loadStoreBagWithOptions:completionHandler:", v8, v10);

}

- (void)dealloc
{
  objc_super v3;

  -[RadioRequest cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)RadioRequest;
  -[RadioRequest dealloc](&v3, sel_dealloc);
}

- (RadioRequest)init
{
  RadioRequest *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RadioRequest;
  v2 = -[RadioRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Radio.RadioRequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

void __70__RadioRequest__loadRadioStoreBagAndAllowRetry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "radioConfigurationDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v7 || !*(_BYTE *)(a1 + 48))
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
  else
  {
    v9 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2105F8000, v9, OS_LOG_TYPE_INFO, "[RadioRequest] No valid tilt dictionary, invalidating URL bag and retrying...", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_loadRadioStoreBagAndAllowRetry:withCompletionHandler:", 0, *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)isAsynchronousBackgroundRequest
{
  return self->_asynchronousBackgroundRequest;
}

+ (id)defaultURLCache
{
  if (defaultURLCache_sOnceToken != -1)
    dispatch_once(&defaultURLCache_sOnceToken, &__block_literal_global_304);
  return (id)defaultURLCache_sDefaultURLCache;
}

void __31__RadioRequest_defaultURLCache__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB20A8]);
  objc_msgSend(v2, "setSessionIdentifier:", CFSTR("com.apple.Radio.RadioRequestURLCache"));
  objc_msgSend(v2, "setSupportsProcessSharing:", 1);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEB20A0]), "initWithConfiguration:", v2);
  v1 = (void *)defaultURLCache_sDefaultURLCache;
  defaultURLCache_sDefaultURLCache = v0;

}

- (int64_t)errorCode
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__RadioRequest_errorCode__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCachedResponse
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__RadioRequest_isCachedResponse__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (RadioRequestContext)requestContext
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__298;
  v10 = __Block_byref_object_dispose__299;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__RadioRequest_requestContext__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RadioRequestContext *)v3;
}

- (double)retryInterval
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__RadioRequest_retryInterval__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCachedResponse:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__RadioRequest_setCachedResponse___block_invoke;
  v4[3] = &unk_24CA2E910;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setErrorCode:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__RadioRequest_setErrorCode___block_invoke;
  v4[3] = &unk_24CA2E538;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setRequestContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__RadioRequest_setRequestContext___block_invoke;
  v7[3] = &unk_24CA2E640;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setRetryInterval:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__RadioRequest_setRetryInterval___block_invoke;
  v4[3] = &unk_24CA2E538;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setStatus:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__RadioRequest_setStatus___block_invoke;
  v4[3] = &unk_24CA2E538;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (int64_t)status
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__RadioRequest_status__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setUnparsedResponseDictionary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__RadioRequest_setUnparsedResponseDictionary___block_invoke;
  v7[3] = &unk_24CA2E640;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSDictionary)unparsedResponseDictionary
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__298;
  v10 = __Block_byref_object_dispose__299;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__RadioRequest_unparsedResponseDictionary__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)setAsynchronousBackgroundRequest:(BOOL)a3
{
  self->_asynchronousBackgroundRequest = a3;
}

void __42__RadioRequest_unparsedResponseDictionary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __46__RadioRequest_setUnparsedResponseDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

uint64_t __22__RadioRequest_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

uint64_t __26__RadioRequest_setStatus___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

double __33__RadioRequest_setRetryInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

void __34__RadioRequest_setRequestContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

  }
}

uint64_t __29__RadioRequest_setErrorCode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __34__RadioRequest_setCachedResponse___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

double __29__RadioRequest_retryInterval__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __30__RadioRequest_requestContext__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32__RadioRequest_isCachedResponse__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __25__RadioRequest_errorCode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

+ (void)loadServiceConfigurationWithCompletionHandler:(id)a3
{
  id v3;
  RadioLoadStoreBagRequest *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(RadioLoadStoreBagRequest);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke;
  v6[3] = &unk_24CA2E480;
  v7 = v3;
  v5 = v3;
  -[RadioLoadStoreBagRequest loadStoreBagWithOptions:completionHandler:](v4, "loadStoreBagWithOptions:completionHandler:", 1, v6);

}

void __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24CA2E938;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "radioConfigurationDictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 40));

  }
}

@end
