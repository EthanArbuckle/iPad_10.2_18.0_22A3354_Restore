@implementation SSVLoadNearbyAppsOperation

- (SSVLoadNearbyAppsOperation)initWithBaseURL:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  SSVLoadNearbyAppsOperation *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v12;
  NSString *baseURLString;
  NSMutableDictionary *v14;
  NSMutableDictionary *parameters;
  NSMutableDictionary *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SSVLoadNearbyAppsOperation;
  v8 = -[SSVLoadNearbyAppsOperation init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSVLoadNearbyAppsOperation.%p"), v8));
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v6, "copy");
    baseURLString = v8->_baseURLString;
    v8->_baseURLString = (NSString *)v12;

    objc_storeStrong((id *)&v8->_location, a4);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parameters = v8->_parameters;
    v8->_parameters = v14;

    v16 = v8->_parameters;
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[CLLocation coordinate](v8->_location, "coordinate");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%.4f"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v19, CFSTR("lat"));

    v20 = v8->_parameters;
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[CLLocation coordinate](v8->_location, "coordinate");
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%.4f"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v23, CFSTR("lon"));

  }
  return v8;
}

- (NSString)pointOfInterestIdentifier
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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SSVLoadNearbyAppsOperation_pointOfInterestIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __55__SSVLoadNearbyAppsOperation_pointOfInterestIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKey:", CFSTR("poi"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)pointOfInterestProviderIdentifier
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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SSVLoadNearbyAppsOperation_pointOfInterestProviderIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __63__SSVLoadNearbyAppsOperation_pointOfInterestProviderIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKey:", CFSTR("poiProvider"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)pointOfInterestProviderURL
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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SSVLoadNearbyAppsOperation_pointOfInterestProviderURL__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __56__SSVLoadNearbyAppsOperation_pointOfInterestProviderURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKey:", CFSTR("poiURL"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSVLoadNearbyAppsOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (void *)MEMORY[0x1A8585DF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SSVLoadNearbyAppsOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPointOfInterestIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SSVLoadNearbyAppsOperation *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SSVLoadNearbyAppsOperation_setPointOfInterestIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __59__SSVLoadNearbyAppsOperation_setPointOfInterestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(v2, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setObject:forKey:", v3, CFSTR("poi"));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "removeObjectForKey:", CFSTR("poi"));
  }
}

- (void)setPointOfInterestProviderIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SSVLoadNearbyAppsOperation *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SSVLoadNearbyAppsOperation_setPointOfInterestProviderIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __67__SSVLoadNearbyAppsOperation_setPointOfInterestProviderIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(v2, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setObject:forKey:", v3, CFSTR("poiProvider"));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "removeObjectForKey:", CFSTR("poiProvider"));
  }
}

- (void)setPointOfInterestProviderURL:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SSVLoadNearbyAppsOperation *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SSVLoadNearbyAppsOperation_setPointOfInterestProviderURL___block_invoke;
  v7[3] = &unk_1E47B8768;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __60__SSVLoadNearbyAppsOperation_setPointOfInterestProviderURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(v2, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setObject:forKey:", v3, CFSTR("poiURL"));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "removeObjectForKey:", CFSTR("poiURL"));
  }
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
  v7[2] = __47__SSVLoadNearbyAppsOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__SSVLoadNearbyAppsOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 280) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 280);
    *(_QWORD *)(v5 + 280) = v4;

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
  v7[2] = __50__SSVLoadNearbyAppsOperation_setStoreFrontSuffix___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__SSVLoadNearbyAppsOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
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

- (void)setUserAgent:(id)a3
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
  v7[2] = __43__SSVLoadNearbyAppsOperation_setUserAgent___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__SSVLoadNearbyAppsOperation_setUserAgent___block_invoke(uint64_t a1)
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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSVLoadNearbyAppsOperation_storeFrontSuffix__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__SSVLoadNearbyAppsOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

- (NSString)userAgent
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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSVLoadNearbyAppsOperation_userAgent__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __39__SSVLoadNearbyAppsOperation_userAgent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 296));
}

- (void)main
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const void *v20;
  void *v21;
  CC_LONG v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  objc_msgSend(v3, "setCachePolicy:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = (void *)-[NSString mutableCopy](self->_baseURLString, "mutableCopy");
  objc_msgSend(v5, "appendString:", CFSTR("?"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(v4, "appendFormat:", CFSTR("%.0f"), v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v9, CFSTR("X-JS-TIMESTAMP"));

  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SSVStoreFrontIdentifierForAccount(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SSVLoadNearbyAppsOperation _storeFrontSuffix](self, "_storeFrontSuffix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "stringByAppendingString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    objc_msgSend(v4, "appendString:", v12);
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-Store-Front"));

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSVLoadNearbyAppsOperation_main__block_invoke;
  block[3] = &unk_1E47B87B8;
  block[4] = self;
  v16 = v5;
  v35 = v16;
  v17 = v4;
  v36 = v17;
  dispatch_sync(dispatchQueue, block);
  v18 = objc_retainAutorelease(v17);
  v19 = objc_msgSend(v18, "UTF8String");
  if (v19)
  {
    v20 = (const void *)v19;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
    v22 = objc_msgSend(v18, "length");
    v23 = objc_retainAutorelease(v21);
    CC_SHA1(v20, v22, (unsigned __int8 *)objc_msgSend(v23, "mutableBytes"));
    objc_msgSend(v23, "setLength:", 16);
    v24 = objc_retainAutorelease(v23);
    fd3fa4R8(3, objc_msgSend(v24, "mutableBytes"));
    objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v3, "setValue:forHTTPHeaderField:", v25, CFSTR("X-JS-SP-TOKEN"));

  }
  -[SSVLoadNearbyAppsOperation userAgent](self, "userAgent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "userAgentWithClientName:version:", CFSTR("AppStore"), CFSTR("2.0"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v26, CFSTR("User-Agent"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v28);

  v33 = 0;
  -[SSVLoadNearbyAppsOperation _lookupWithRequest:error:](self, "_lookupWithRequest:error:", v3, &v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v33;
  -[SSVLoadNearbyAppsOperation responseBlock](self, "responseBlock");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v29, v30);

}

void __34__SSVLoadNearbyAppsOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "mutableCopy");
  v3 = 0;
  v16[0] = xmmword_1E47BC218;
  v16[1] = *(_OWORD *)off_1E47BC228;
  v17 = CFSTR("lon");
  do
  {
    v4 = *(_QWORD *)((char *)v16 + v3);
    objc_msgSend(v2, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (v13[3])
        objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("&"));
      objc_msgSend(*(id *)(a1 + 48), "appendString:", v5);
      v6 = *(void **)(a1 + 40);
      URLEscapedQueryParameter(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@"), v4, v7);

      objc_msgSend(v2, "removeObjectForKey:", v4);
      ++v13[3];
    }

    v3 += 8;
  }
  while (v3 != 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__SSVLoadNearbyAppsOperation_main__block_invoke_2;
  v9[3] = &unk_1E47BC248;
  v11 = &v12;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v9);

  for (i = 32; i != -8; i -= 8)
  _Block_object_dispose(&v12, 8);
}

void __34__SSVLoadNearbyAppsOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("&"));
  v6 = *(void **)(a1 + 32);
  URLEscapedQueryParameter(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@"), v8, v7);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)_lookupWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  SSVLoadURLOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v7 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v6);
  +[SSVURLDataConsumer consumer](SSVURLLookupResponseConsumer, "consumer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v7, "setDataConsumer:", v8);

  -[SSVLoadURLOperation setITunesStoreRequest:](v7, "setITunesStoreRequest:", 1);
  -[SSVLoadURLOperation setRecordsMetrics:](v7, "setRecordsMetrics:", 1);
  -[SSVLoadNearbyAppsOperation _storeFrontSuffix](self, "_storeFrontSuffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setStoreFrontSuffix:](v7, "setStoreFrontSuffix:", v9);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__SSVLoadNearbyAppsOperation__lookupWithRequest_error___block_invoke;
  v15[3] = &unk_1E47BC270;
  v15[4] = &v16;
  v15[5] = &v22;
  -[SSVLoadURLOperation setOutputBlock:](v7, "setOutputBlock:", v15);
  -[SSVLoadURLOperation main](v7, "main");
  v10 = (void *)v17[5];
  -[SSVLoadURLOperation metricsPageEvent](v7, "metricsPageEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setMetricsPageEvent:", v11);

  v12 = (void *)v17[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v23[5]);
    v12 = (void *)v17[5];
  }
  v13 = v12;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __55__SSVLoadNearbyAppsOperation__lookupWithRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_storeFrontSuffix
{
  __CFString *v2;

  -[SSVLoadNearbyAppsOperation storeFrontSuffix](self, "storeFrontSuffix");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR(" t:native");
  return v2;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_baseURLString, 0);
}

@end
