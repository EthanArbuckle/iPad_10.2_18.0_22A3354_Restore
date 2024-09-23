@implementation SSVPlatformRequestOperation

- (SSVPlatformRequestOperation)init
{
  return -[SSVPlatformRequestOperation initWithPlatformContext:](self, "initWithPlatformContext:", 0);
}

- (SSVPlatformRequestOperation)initWithPlatformContext:(id)a3
{
  id v4;
  SSVPlatformRequestOperation *v5;
  uint64_t v6;
  SSVPlatformContext *context;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *dispatchQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSVPlatformRequestOperation;
  v5 = -[SSVPlatformRequestOperation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (SSVPlatformContext *)v6;

    v5->_personalizationStyle = 2;
    v5->_shouldSuppressUserInfo = 0;
    v5->_shouldSuppressCookies = 0;
    v5->_attribution = 0;
    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSVPlatformRequestOperation.%p"), v5));
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (NSString)imageProfile
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSVPlatformRequestOperation_imageProfile__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __43__SSVPlatformRequestOperation_imageProfile__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 304));
}

- (NSArray)itemIdentifiers
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSVPlatformRequestOperation_itemIdentifiers__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__SSVPlatformRequestOperation_itemIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

- (NSArray)bundleIdentifiers
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SSVPlatformRequestOperation_bundleIdentifiers__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __48__SSVPlatformRequestOperation_bundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 296));
}

- (NSString)keyProfile
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SSVPlatformRequestOperation_keyProfile__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__SSVPlatformRequestOperation_keyProfile__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (id)responseBlock
{
  NSObject *dispatchQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSVPlatformRequestOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (void *)MEMORY[0x1A8585DF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SSVPlatformRequestOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)personalizationStyle
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SSVPlatformRequestOperation_personalizationStyle__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SSVPlatformRequestOperation_personalizationStyle__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 320);
  return result;
}

- (void)setImageProfile:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SSVPlatformRequestOperation_setImageProfile___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__SSVPlatformRequestOperation_setImageProfile___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 304) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 304);
    *(_QWORD *)(v5 + 304) = v4;

  }
}

- (void)setItemIdentifiers:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SSVPlatformRequestOperation_setItemIdentifiers___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__SSVPlatformRequestOperation_setItemIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 288) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 288);
    *(_QWORD *)(v5 + 288) = v4;

  }
}

- (void)setBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SSVPlatformRequestOperation_setBundleIdentifiers___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __52__SSVPlatformRequestOperation_setBundleIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 296) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 296);
    *(_QWORD *)(v5 + 296) = v4;

  }
}

- (void)setKeyProfile:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SSVPlatformRequestOperation_setKeyProfile___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__SSVPlatformRequestOperation_setKeyProfile___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 312) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 312);
    *(_QWORD *)(v5 + 312) = v4;

  }
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SSVPlatformRequestOperation_setPersonalizationStyle___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__SSVPlatformRequestOperation_setPersonalizationStyle___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 320) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setResponseBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SSVPlatformRequestOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__SSVPlatformRequestOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v4;

  }
}

- (void)setStoreFrontSuffix:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SSVPlatformRequestOperation_setStoreFrontSuffix___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__SSVPlatformRequestOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 336) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 336);
    *(_QWORD *)(v5 + 336) = v4;

  }
}

- (void)setTimeoutInterval:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SSVPlatformRequestOperation_setTimeoutInterval___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__SSVPlatformRequestOperation_setTimeoutInterval___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 344) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 344);
    *(_QWORD *)(v5 + 344) = v4;

  }
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SSVPlatformRequestOperation_setValue_forRequestParameter___block_invoke;
  block[3] = &unk_1E47B87B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __60__SSVPlatformRequestOperation_setValue_forRequestParameter___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 256))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 256);
    *(_QWORD *)(v3 + 256) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 256);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SSVPlatformRequestOperation_setValue_forHTTPHeaderField___block_invoke;
  block[3] = &unk_1E47B87B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __59__SSVPlatformRequestOperation_setValue_forHTTPHeaderField___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 248))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 248);
    *(_QWORD *)(v3 + 248) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 248);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (NSString)storeFrontSuffix
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSVPlatformRequestOperation_storeFrontSuffix__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __47__SSVPlatformRequestOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 336));
}

- (NSNumber)timeoutInterval
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSVPlatformRequestOperation_timeoutInterval__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __46__SSVPlatformRequestOperation_timeoutInterval__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 344));
}

- (id)valueForRequestParameter:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSVPlatformRequestOperation_valueForRequestParameter___block_invoke;
  block[3] = &unk_1E47B86D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__SSVPlatformRequestOperation_valueForRequestParameter___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 256), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SSVPlatformRequestOperation_valueForHTTPHeaderField___block_invoke;
  block[3] = &unk_1E47B86D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SSVPlatformRequestOperation_valueForHTTPHeaderField___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 248), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)main
{
  void *v3;
  int64_t v4;

  -[SSVPlatformContext SAPContext](self->_context, "SAPContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SSVPlatformRequestOperation _makeLocalMescalRequest](self, "_makeLocalMescalRequest");
  }
  else
  {
    v4 = -[SSVPlatformRequestOperation personalizationStyle](self, "personalizationStyle");
    if (v4 == 2)
      -[SSVPlatformRequestOperation _makeLocalJSSignRequest](self, "_makeLocalJSSignRequest");
    else
      -[SSVPlatformRequestOperation _makeLookupRequestWithPersonalizationStyle:](self, "_makeLookupRequestWithPersonalizationStyle:", v4);
  }
}

- (void)_setCaller:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SSVPlatformRequestOperation__setCaller___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __42__SSVPlatformRequestOperation__setCaller___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v4;

  }
}

- (void)_setUserAgent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SSVPlatformRequestOperation__setUserAgent___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__SSVPlatformRequestOperation__setUserAgent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 352) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 352);
    *(_QWORD *)(v5 + 352) = v4;

  }
}

- (id)_callerValue
{
  NSObject *dispatchQueue;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__76;
  v17 = __Block_byref_object_dispose__76;
  v18 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__SSVPlatformRequestOperation__callerValue__block_invoke;
  v12[3] = &unk_1E47B8680;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(dispatchQueue, v12);
  v3 = (void *)v14[5];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v14[5];
    v14[5] = v5;

    v3 = (void *)v14[5];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14[5];
      v14[5] = v8;

      v3 = (void *)v14[5];
    }
  }
  v10 = v3;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __43__SSVPlatformRequestOperation__callerValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectForKey:", CFSTR("caller"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_enumerateQueryParametersUsingBlock:(id)a3
{
  void (**v4)(id, const __CFString *, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *dispatchQueue;
  void (**v13)(id, const __CFString *, void *, _QWORD);
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (void (**)(id, const __CFString *, void *, _QWORD))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SSVPlatformRequestOperation _callerValue](self, "_callerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4[2](v4, CFSTR("caller"), v5, v18[3]++);
  -[SSVPlatformRequestOperation itemIdentifiers](self, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v4[2](v4, CFSTR("id"), v7, v18[3]++);
  -[SSVPlatformRequestOperation bundleIdentifiers](self, "bundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v4[2](v4, CFSTR("bundleId"), v9, v18[3]++);
  -[SSVPlatformRequestOperation keyProfile](self, "keyProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v4[2](v4, CFSTR("p"), v10, v18[3]++);
  -[SSVPlatformRequestOperation imageProfile](self, "imageProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v4[2](v4, CFSTR("artwork"), v11, v18[3]++);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke;
  block[3] = &unk_1E47C01B8;
  block[4] = self;
  v15 = v4;
  v16 = &v17;
  v13 = v4;
  dispatch_sync(dispatchQueue, block);

  _Block_object_dispose(&v17, 8);
}

void __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 256);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke_2;
  v6[3] = &unk_1E47C0190;
  v6[1] = 3221225472;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("caller")) & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (id)_lookupWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *dispatchQueue;
  uint64_t v8;
  id v9;
  SSVLoadURLOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD block[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__76;
  v33 = __Block_byref_object_dispose__76;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__76;
  v27 = __Block_byref_object_dispose__76;
  dispatchQueue = self->_dispatchQueue;
  v8 = MEMORY[0x1E0C809B0];
  v28 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v9 = v6;
  v22 = v9;
  dispatch_sync(dispatchQueue, block);
  v10 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v9);
  +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v10, "setDataConsumer:", v11);

  -[SSVLoadURLOperation setITunesStoreRequest:](v10, "setITunesStoreRequest:", 1);
  -[SSVPlatformRequestOperation storeFrontSuffix](self, "storeFrontSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setStoreFrontSuffix:](v10, "setStoreFrontSuffix:", v12);

  -[SSVLoadURLOperation setShouldSuppressUserInfo:](v10, "setShouldSuppressUserInfo:", -[SSVPlatformRequestOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"));
  -[SSVLoadURLOperation setShouldSuppressCookies:](v10, "setShouldSuppressCookies:", -[SSVPlatformRequestOperation shouldSuppressCookies](self, "shouldSuppressCookies"));
  -[SSVLoadURLOperation setAttribution:](v10, "setAttribution:", -[SSVPlatformRequestOperation attribution](self, "attribution"));
  -[SSVPlatformRequestOperation mainDocumentURL](self, "mainDocumentURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SSVPlatformRequestOperation mainDocumentURL](self, "mainDocumentURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setMainDocumentURL:](v10, "setMainDocumentURL:", v14);

  }
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_3;
  v20[3] = &unk_1E47C01E0;
  v20[4] = &v23;
  v20[5] = &v29;
  -[SSVLoadURLOperation setOutputBlock:](v10, "setOutputBlock:", v20);
  -[SSVLoadURLOperation main](v10, "main");
  v15 = (void *)v24[5];
  -[SSVLoadURLOperation metricsPageEvent](v10, "metricsPageEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setMetricsPageEvent:", v16);

  v17 = (void *)v24[5];
  if (a4 && !v17)
  {
    *a4 = objc_retainAutorelease((id)v30[5]);
    v17 = (void *)v24[5];
  }
  v18 = v17;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 352);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v3, CFSTR("User-Agent"));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v2 + 248);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_2;
  v5[3] = &unk_1E47BA5D8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

uint64_t __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

void __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SSLookupResponse *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SSLookupResponse initWithResponseDictionary:]([SSLookupResponse alloc], "initWithResponseDictionary:", v11);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)_makeLocalJSSignRequest
{
  void *v3;
  id v4;
  SSBag *bag;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  uint64_t v33;
  const void *v34;
  void *v35;
  CC_LONG v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _BYTE v59[128];
  _QWORD v60[5];

  v60[3] = *MEMORY[0x1E0C80C00];
  -[SSVPlatformContext unpersonalizedLookupURLString](self->_context, "unpersonalizedLookupURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  if (v4)
    goto LABEL_6;
  bag = self->_bag;
  if (bag)
  {
    -[SSBag stringForKey:error:](bag, "stringForKey:error:", CFSTR("storeplatform-lookup-url-unpersonalized"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    -[SSVPlatformRequestOperation _URLBagContext](self, "_URLBagContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForKey:error:", CFSTR("storeplatform-lookup-url-unpersonalized"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v8, "mutableCopy");

  }
  if (v4)
  {
LABEL_6:
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v4, "appendString:", CFSTR("?"));
    -[SSVPlatformRequestOperation timeoutInterval](self, "timeoutInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(v11, "setTimeoutInterval:");
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;

    objc_msgSend(v12, "appendFormat:", CFSTR("%.0f"), v17);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-JS-TIMESTAMP=%.0f"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SSVStoreFrontIdentifierForAccount(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[SSVPlatformRequestOperation storeFrontSuffix](self, "storeFrontSuffix");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v21, "stringByAppendingString:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v23;
      }
      objc_msgSend(v12, "appendString:", v21);

    }
    v49 = v14;
    v50 = v9;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __54__SSVPlatformRequestOperation__makeLocalJSSignRequest__block_invoke;
    v56[3] = &unk_1E47C0208;
    v4 = v4;
    v57 = v4;
    v24 = v10;
    v58 = v24;
    -[SSVPlatformRequestOperation _enumerateQueryParametersUsingBlock:](self, "_enumerateQueryParametersUsingBlock:", v56);
    objc_msgSend(v24, "objectForKey:", CFSTR("version"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      objc_msgSend(v4, "appendString:", CFSTR("&version=1"));
    v60[0] = CFSTR("caller");
    v60[1] = CFSTR("id");
    v60[2] = CFSTR("p");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v53 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v24, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v12, "appendString:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v28);
    }

    v32 = objc_retainAutorelease(v12);
    v33 = objc_msgSend(v32, "UTF8String");
    if (v33)
    {
      v34 = (const void *)v33;
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
      v36 = objc_msgSend(v32, "length");
      v37 = objc_retainAutorelease(v35);
      CC_SHA1(v34, v36, (unsigned __int8 *)objc_msgSend(v37, "mutableBytes"));
      objc_msgSend(v37, "setLength:", 16);
      v38 = objc_retainAutorelease(v37);
      fd3fa4R8(3, objc_msgSend(v38, "mutableBytes"));
      objc_msgSend(v38, "base64EncodedStringWithOptions:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-JS-SP-TOKEN=%@"), v39, v49);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v40);

      }
    }
    if (objc_msgSend(v50, "count"))
    {
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("; "));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v41, CFSTR("Cookie"));

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setURL:", v42);

    -[SSVPlatformRequestOperation mainDocumentURL](self, "mainDocumentURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[SSVPlatformRequestOperation mainDocumentURL](self, "mainDocumentURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMainDocumentURL:", v44);

    }
    objc_msgSend(v11, "setAttribution:", -[SSVPlatformRequestOperation attribution](self, "attribution"));
    v51 = 0;
    -[SSVPlatformRequestOperation _lookupWithRequest:error:](self, "_lookupWithRequest:error:", v11, &v51);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v51;

  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
  }
  -[SSVPlatformRequestOperation responseBlock](self, "responseBlock");
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v47;
  if (v47)
  {
    (*(void (**)(uint64_t, void *, id))(v47 + 16))(v47, v45, v46);
    -[SSVPlatformRequestOperation setResponseBlock:](self, "setResponseBlock:", 0);
  }

}

void __54__SSVPlatformRequestOperation__makeLocalJSSignRequest__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("&"));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v10);
  v8 = *(void **)(a1 + 32);
  URLEscapedQueryParameter(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@=%@"), v10, v9);

}

- (void)_makeLocalMescalRequest
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSVPlatformRequestOperation timeoutInterval](self, "timeoutInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v3, "setTimeoutInterval:");
  }
  v50 = v7;
  -[SSVPlatformContext lookupURLString](self->_context, "lookupURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "appendString:", CFSTR("?"));
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = objc_claimAutoreleasedReturnValue();

  v51 = (void *)v13;
  if (v13 && !-[SSVPlatformRequestOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"))
  {
    objc_msgSend(CFSTR("X-Dsid"), "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v51, v14);

    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v51, CFSTR("X-Dsid"));
  }
  SSVStoreFrontIdentifierForAccount(v11);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[SSVPlatformRequestOperation storeFrontSuffix](self, "storeFrontSuffix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v16, "stringByAppendingString:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v18;
    }
    objc_msgSend(CFSTR("X-Apple-Store-Front"), "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, v19);

    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Apple-Store-Front"));
  }
  v49 = v11;
  v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v20;
  objc_msgSend(v20, "stringFromDate:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("x-request-timestamp"));
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v22, CFSTR("X-Request-TimeStamp"));
  }
  v47 = (void *)v22;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __54__SSVPlatformRequestOperation__makeLocalMescalRequest__block_invoke;
  v63[3] = &unk_1E47C0208;
  v53 = v9;
  v64 = v53;
  v23 = v5;
  v65 = v23;
  -[SSVPlatformRequestOperation _enumerateQueryParametersUsingBlock:](self, "_enumerateQueryParametersUsingBlock:", v63);
  objc_msgSend(v23, "objectForKey:", CFSTR("version"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    objc_msgSend(v53, "appendString:", CFSTR("&version=1"));
  v52 = v3;
  v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[SSVPlatformContext signedHeaders](self->_context, "signedHeaders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v25, "appendString:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v28);
  }
  -[SSVPlatformContext signedQueryParameters](self->_context, "signedQueryParameters");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v56 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(v23, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v25, "appendString:", v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v34);
  }
  objc_msgSend(v25, "dataUsingEncoding:", 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[SSVPlatformContext SAPContext](self->_context, "SAPContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "signatureWithData:error:", v38, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "base64EncodedStringWithOptions:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v52, "setValue:forHTTPHeaderField:", v41, CFSTR("X-Apple-ActionSignature"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v53);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setURL:", v42);

  v54 = 0;
  -[SSVPlatformRequestOperation _lookupWithRequest:error:](self, "_lookupWithRequest:error:", v52, &v54);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v54;
  -[SSVPlatformRequestOperation responseBlock](self, "responseBlock");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
  {
    (*(void (**)(uint64_t, void *, id))(v45 + 16))(v45, v43, v44);
    -[SSVPlatformRequestOperation setResponseBlock:](self, "setResponseBlock:", 0);
  }

}

void __54__SSVPlatformRequestOperation__makeLocalMescalRequest__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("&"));
  v8 = *(void **)(a1 + 32);
  URLEscapedQueryParameter(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@=%@"), v10, v9);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v10);
}

- (void)_makeLookupRequestWithPersonalizationStyle:(int64_t)a3
{
  SSLookupRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *additionalParameters;
  uint64_t v10;
  SSLookupRequest *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  SSLookupRequest *v35;

  v5 = objc_alloc_init(SSLookupRequest);
  -[SSVPlatformRequestOperation keyProfile](self, "keyProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSLookupRequest setKeyProfile:](v5, "setKeyProfile:", v6);

  -[SSLookupRequest setPersonalizationStyle:](v5, "setPersonalizationStyle:", a3);
  -[SSVPlatformRequestOperation timeoutInterval](self, "timeoutInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSLookupRequest _setTimeoutInterval:](v5, "_setTimeoutInterval:", v7);

  -[SSVPlatformRequestOperation itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSLookupRequest setValue:forRequestParameter:](v5, "setValue:forRequestParameter:", v8, CFSTR("id"));

  additionalParameters = self->_additionalParameters;
  v10 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke;
  v34[3] = &unk_1E47BA5D8;
  v11 = v5;
  v35 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](additionalParameters, "enumerateKeysAndObjectsUsingBlock:", v34);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__76;
  v32 = __Block_byref_object_dispose__76;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__76;
  v26 = __Block_byref_object_dispose__76;
  v27 = 0;
  v15 = v10;
  v16 = 3221225472;
  v17 = __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke_2;
  v18 = &unk_1E47C0230;
  v20 = &v28;
  v21 = &v22;
  v12 = dispatch_semaphore_create(0);
  v19 = v12;
  -[SSLookupRequest startWithLookupBlock:](v11, "startWithLookupBlock:", &v15);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  -[SSVPlatformRequestOperation responseBlock](self, "responseBlock", v15, v16, v17, v18);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, v23[5], v29[5]);
    -[SSVPlatformRequestOperation setResponseBlock:](self, "setResponseBlock:", 0);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

}

uint64_t __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forRequestParameter:", a3, a2);
}

void __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_URLBagContext
{
  void *v3;
  NSObject *dispatchQueue;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__76;
  v14 = __Block_byref_object_dispose__76;
  v15 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__SSVPlatformRequestOperation__URLBagContext__block_invoke;
  v9[3] = &unk_1E47B8680;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(dispatchQueue, v9);
  v5 = v11[5];
  if (!v5)
  {
    SSVDefaultUserAgent();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11[5];
    v11[5] = v6;

    v5 = v11[5];
  }
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));
  _Block_object_dispose(&v10, 8);

  return v3;
}

void __45__SSVPlatformRequestOperation__URLBagContext__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)shouldSuppressCookies
{
  return self->_shouldSuppressCookies;
}

- (void)setShouldSuppressCookies:(BOOL)a3
{
  self->_shouldSuppressCookies = a3;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (NSURL)mainDocumentURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMainDocumentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (unint64_t)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_timeoutInterval, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
}

@end
