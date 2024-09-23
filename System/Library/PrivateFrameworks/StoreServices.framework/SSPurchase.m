@implementation SSPurchase

- (id)_initSSPurchase
{
  SSPurchase *v2;
  SSPurchase *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  const __CFUUID *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSPurchase;
  v2 = -[SSPurchase init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_createsDownloads = 257;
    v2->_createsInstallJobs = 1;
    v4 = dispatch_queue_create("com.apple.StoreServices.SSPurchase", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = CFUUIDCreate(0);
    v3->_placeholderDownloadIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
  }
  return v3;
}

- (SSPurchase)initWithItem:(id)a3
{
  id v4;
  void *v5;
  SSPurchase *v6;

  v4 = a3;
  objc_msgSend(v4, "defaultItemOffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSPurchase initWithItem:offer:](self, "initWithItem:offer:", v4, v5);

  return v6;
}

- (SSPurchase)initWithItem:(id)a3 offer:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SSPurchase *v10;
  uint64_t v11;
  NSString *buyParameters;
  void *v13;
  uint64_t v14;
  SSNetworkConstraints *networkConstraints;
  SSDownloadMetadata *v16;
  uint64_t v17;
  NSMutableDictionary *downloadProperties;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "buyParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must provide buy parameters"));
  v10 = -[SSPurchase _initSSPurchase](self, "_initSSPurchase");
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    buyParameters = v10->_buyParameters;
    v10->_buyParameters = (NSString *)v11;

    objc_storeStrong((id *)&v10->_item, a3);
    objc_storeStrong((id *)&v10->_itemOffer, a4);
    -[SSItemOffer networkConstraints](v10->_itemOffer, "networkConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    networkConstraints = v10->_networkConstraints;
    v10->_networkConstraints = (SSNetworkConstraints *)v14;

    v16 = -[SSDownloadMetadata initWithItem:offer:]([SSDownloadMetadata alloc], "initWithItem:offer:", v7, v8);
    v17 = -[SSDownloadMetadata newDownloadProperties](v16, "newDownloadProperties");
    downloadProperties = v10->_downloadProperties;
    v10->_downloadProperties = (NSMutableDictionary *)v17;

  }
  return v10;
}

+ (id)purchaseWithBuyParameters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must provide buy parameters"));
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setBuyParameters:", v4);

  return v5;
}

- (NSNumber)accountIdentifier
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_accountIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __31__SSPurchase_accountIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSString)affiliateIdentifier
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSPurchase_affiliateIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__SSPurchase_affiliateIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)buyParameters
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SSPurchase_buyParameters__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__SSPurchase_buyParameters__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (BOOL)createsDownloads
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSPurchase_createsDownloads__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__SSPurchase_createsDownloads__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (BOOL)createsJobs
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__SSPurchase_createsJobs__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__SSPurchase_createsJobs__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 73);
  return result;
}

- (BOOL)createsInstallJobs
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_createsInstallJobs__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSPurchase_createsInstallJobs__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 74);
  return result;
}

- (BOOL)displaysOnLockScreen
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSPurchase_displaysOnLockScreen__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSPurchase_displaysOnLockScreen__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (SSDownloadPolicy)downloadPolicy
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SSPurchase_downloadPolicy__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSDownloadPolicy *)v3;
}

void __28__SSPurchase_downloadPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)downloadProperties
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_downloadProperties__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __32__SSPurchase_downloadProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)filteredAssetTypes
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_filteredAssetTypes__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __32__SSPurchase_filteredAssetTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)ignoresForcedPasswordRestriction
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSPurchase_ignoresForcedPasswordRestriction__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSPurchase_ignoresForcedPasswordRestriction__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

- (BOOL)isBackgroundPurchase
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSPurchase_isBackgroundPurchase__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSPurchase_isBackgroundPurchase__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (BOOL)isPlaybackRequest
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_isPlaybackRequest__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSPurchase_isPlaybackRequest__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 192);
  return result;
}

- (SSNetworkConstraints)networkConstraints
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_networkConstraints__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSNetworkConstraints *)v3;
}

void __32__SSPurchase_networkConstraints__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSNumber)ownerAccountDSID
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSPurchase_ownerAccountDSID__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __30__SSPurchase_ownerAccountDSID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
}

- (int64_t)placeholderDownloadIdentifier
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
  v5[2] = __43__SSPurchase_placeholderDownloadIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSPurchase_placeholderDownloadIdentifier__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 184);
  return result;
}

- (id)presentingSceneIdentifier
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSPurchase_presentingSceneIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__SSPurchase_presentingSceneIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)presentingSceneBundleIdentifier
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSPurchase_presentingSceneBundleIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__SSPurchase_presentingSceneBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SSURLRequestProperties)requestProperties
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_requestProperties__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSURLRequestProperties *)v3;
}

void __31__SSPurchase_requestProperties__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)setAccountIdentifier:(id)a3
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
  v7[2] = __35__SSPurchase_setAccountIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __35__SSPurchase_setAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 8);
  v4 = (id *)(v2 + 8);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void)setAffiliateIdentifier:(id)a3
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
  v7[2] = __37__SSPurchase_setAffiliateIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __37__SSPurchase_setAffiliateIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
}

- (void)setBackgroundPurchase:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SSPurchase_setBackgroundPurchase___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SSPurchase_setBackgroundPurchase___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setBuyParameters:(id)a3
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
  v7[2] = __31__SSPurchase_setBuyParameters___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __31__SSPurchase_setBuyParameters___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsString:", CFSTR("createsDownloads")))
    {
      v7 = *(id **)(a1 + 32);
      v8 = (void *)objc_msgSend(v7[5], "copy");
      objc_msgSend(v7, "_buyParametersValueForKey:fromBuyParams:", CFSTR("createsDownloads"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isEqualToString:", CFSTR("true")));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 48);
        *(_QWORD *)(v11 + 48) = v10;

      }
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsString:", CFSTR("createsJobs")))
    {
      v13 = *(id **)(a1 + 32);
      v14 = (void *)objc_msgSend(v13[5], "copy");
      objc_msgSend(v13, "_buyParametersValueForKey:fromBuyParams:", CFSTR("createsJobs"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "isEqualToString:", CFSTR("true")));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 64);
        *(_QWORD *)(v17 + 64) = v16;

      }
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsString:", CFSTR("createsInstallJobs")))
    {
      v19 = *(id **)(a1 + 32);
      v20 = (void *)objc_msgSend(v19[5], "copy");
      objc_msgSend(v19, "_buyParametersValueForKey:fromBuyParams:", CFSTR("createsInstallJobs"), v20);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v24, "isEqualToString:", CFSTR("true")));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 56);
        *(_QWORD *)(v22 + 56) = v21;

      }
    }
  }
}

- (void)setCreatesDownloads:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setCreatesDownloads___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setCreatesDownloads___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setCreatesJobs:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__SSPurchase_setCreatesJobs___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __29__SSPurchase_setCreatesJobs___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setCreatesInstallJobs:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SSPurchase_setCreatesInstallJobs___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SSPurchase_setCreatesInstallJobs___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 74) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDisplaysOnLockScreen:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SSPurchase_setDisplaysOnLockScreen___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __38__SSPurchase_setDisplaysOnLockScreen___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDownloadPolicy:(id)a3
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
  v7[2] = __32__SSPurchase_setDownloadPolicy___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __32__SSPurchase_setDownloadPolicy___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v4;

  }
}

- (void)setDownloadProperties:(id)a3
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
  v7[2] = __36__SSPurchase_setDownloadProperties___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __36__SSPurchase_setDownloadProperties___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    v4 = objc_msgSend(v2, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

  }
}

- (void)setFilteredAssetTypes:(id)a3
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
  v7[2] = __36__SSPurchase_setFilteredAssetTypes___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __36__SSPurchase_setFilteredAssetTypes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 128) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;

  }
}

- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SSPurchase_setIgnoresForcedPasswordRestriction___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSPurchase_setIgnoresForcedPasswordRestriction___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 144) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setNetworkConstraints:(id)a3
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
  v7[2] = __36__SSPurchase_setNetworkConstraints___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __36__SSPurchase_setNetworkConstraints___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 168) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v4;

  }
}

- (void)setOwnerAccountDSID:(id)a3
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
  v7[2] = __34__SSPurchase_setOwnerAccountDSID___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __34__SSPurchase_setOwnerAccountDSID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 176);
  v4 = (id *)(v2 + 176);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void)setPlaybackRequest:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchase_setPlaybackRequest___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSPurchase_setPlaybackRequest___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 192) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setPresentingSceneIdentifier:(id)a3
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
  v7[2] = __43__SSPurchase_setPresentingSceneIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__SSPurchase_setPresentingSceneIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 248);
  *(_QWORD *)(v3 + 248) = v2;

}

- (void)setPresentingSceneBundleIdentifier:(id)a3
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
  v7[2] = __49__SSPurchase_setPresentingSceneBundleIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __49__SSPurchase_setPresentingSceneBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

- (void)setRequestProperties:(id)a3
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
  v7[2] = __35__SSPurchase_setRequestProperties___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __35__SSPurchase_setRequestProperties___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 200) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 200);
    *(_QWORD *)(v5 + 200) = v4;

  }
}

- (void)setSkipSoftwareAccountPreflight:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSPurchase_setSkipSoftwareAccountPreflight___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SSPurchase_setSkipSoftwareAccountPreflight___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 216) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setValue:(id)a3 forDownloadProperty:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSPurchase *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSPurchase_setValue_forDownloadProperty___block_invoke;
  block[3] = &unk_1E47B87B8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __43__SSPurchase_setValue_forDownloadProperty___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 104);
  if (!v2)
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = a1[5];
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

    v2 = a1[4];
    v3 = *(void **)(a1[5] + 104);
  }
  return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
}

- (id)valueForDownloadProperty:(id)a3
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
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSPurchase_valueForDownloadProperty___block_invoke;
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

void __39__SSPurchase_valueForDownloadProperty___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SSPurchase)initWithDatabaseEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPurchase *v6;
  SSPurchase *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SSPurchase _initSSPurchase](self, "_initSSPurchase");
    v7 = v6;
    if (v6)
      -[SSPurchase _setValuesUsingDatabaseEncoding:](v6, "_setValuesUsingDatabaseEncoding:", v5);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (int64_t)batchIdentifier
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
  v5[2] = __29__SSPurchase_batchIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__SSPurchase_batchIdentifier__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (NSData)databaseEncoding
{
  id v3;
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  SSPurchase *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  dispatchQueue = self->_dispatchQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __30__SSPurchase_databaseEncoding__block_invoke;
  v11 = &unk_1E47B8768;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(dispatchQueue, &v8);
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

uint64_t __30__SSPurchase_databaseEncoding__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addEntriesToDatabaseEncoding:", *(_QWORD *)(a1 + 40));
}

- (id)buyParametersValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSPurchase buyParameters](self, "buyParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "length");

  if (v6)
  {
    -[SSPurchase buyParameters](self, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("&"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count") == 2)
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if (v16)
            {
              objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_13;
            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_13:

    objc_msgSend(v17, "stringByRemovingPercentEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSNumber)enabledServiceType
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_enabledServiceType__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __32__SSPurchase_enabledServiceType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)expectedDownloadFileSize
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
  v5[2] = __38__SSPurchase_expectedDownloadFileSize__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__SSPurchase_expectedDownloadFileSize__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (NSArray)gratisIdentifiers
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_gratisIdentifiers__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__SSPurchase_gratisIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

- (id)item
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__SSPurchase_item__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __18__SSPurchase_item__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

- (id)itemOffer
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__SSPurchase_itemOffer__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __23__SSPurchase_itemOffer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

- (BOOL)isGratisSoftwareClaim
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSPurchase_isGratisSoftwareClaim__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__SSPurchase_isGratisSoftwareClaim__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;

  }
}

- (BOOL)isPreauthenticated
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_isPreauthenticated__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSPurchase_isPreauthenticated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 193);
  return result;
}

- (id)requiredDeviceCapabilities
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSPurchase_requiredDeviceCapabilities__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SSPurchase_requiredDeviceCapabilities__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 208));
}

- (void)setBatchIdentifier:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchase_setBatchIdentifier___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSPurchase_setBatchIdentifier___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setDefaultUserAgent:(id)a3
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
  v7[2] = __34__SSPurchase_setDefaultUserAgent___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __34__SSPurchase_setDefaultUserAgent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SSMutableURLRequestProperties *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SSMutableURLRequestProperties *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "HTTPHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("User-Agent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (SSMutableURLRequestProperties *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "mutableCopy");
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      if (!v4)
      {
        v4 = objc_alloc_init(SSMutableURLRequestProperties);
        v5 = *(_QWORD *)(a1 + 40);
      }
    }
    v9 = v4;
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));
    v6 = -[SSMutableURLRequestProperties copy](v9, "copy");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 200);
    *(_QWORD *)(v7 + 200) = v6;

  }
}

- (void)setEnabledServiceType:(id)a3
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
  v7[2] = __36__SSPurchase_setEnabledServiceType___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __36__SSPurchase_setEnabledServiceType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 112) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v4;

  }
}

- (void)setExpectedDownloadFileSize:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SSPurchase_setExpectedDownloadFileSize___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __42__SSPurchase_setExpectedDownloadFileSize___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setGratisIdentifiers:(id)a3
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
  v7[2] = __35__SSPurchase_setGratisIdentifiers___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __35__SSPurchase_setGratisIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 136) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v4;

  }
}

- (void)setPlaceholderDownloadIdentifier:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSPurchase_setPlaceholderDownloadIdentifier___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSPurchase_setPlaceholderDownloadIdentifier___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 184) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setPreauthenticated:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setPreauthenticated___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setPreauthenticated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 193) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SSPurchase *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke;
  v7[3] = &unk_1E47B8768;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v2, "addObject:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke_2;
      v14[3] = &unk_1E47BA760;
      v2 = v9;
      v15 = v2;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

    }
    else
    {
      v2 = 0;
    }
  }
  v11 = objc_msgSend(v2, "copy");
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v12 + 208);
  *(_QWORD *)(v12 + 208) = v11;

}

void __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (void)setTidHeaders:(id)a3
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
  v7[2] = __28__SSPurchase_setTidHeaders___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __28__SSPurchase_setTidHeaders___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 224);
  *(_QWORD *)(v3 + 224) = v2;

}

- (void)setUniqueIdentifier:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setUniqueIdentifier___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setUniqueIdentifier___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 232) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setUsesLocalRedownloadParametersIfPossible:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SSPurchase_setUsesLocalRedownloadParametersIfPossible___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __57__SSPurchase_setUsesLocalRedownloadParametersIfPossible___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 240) = *(_BYTE *)(result + 40);
  return result;
}

- (NSDictionary)tidHeaders
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__SSPurchase_tidHeaders__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __24__SSPurchase_tidHeaders__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)uniqueIdentifier
{
  int64_t result;
  const __CFUUID *v4;

  result = self->_uniqueIdentifier;
  if (!result)
  {
    v4 = CFUUIDCreate(0);
    self->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
    return self->_uniqueIdentifier;
  }
  return result;
}

- (BOOL)usesLocalRedownloadParametersIfPossible
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSPurchase_usesLocalRedownloadParametersIfPossible__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSPurchase_usesLocalRedownloadParametersIfPossible__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 240);
  return result;
}

- (void)_addEntriesToDatabaseEncoding:(id)a3
{
  id v4;
  void *v5;
  NSNumber *accountIdentifier;
  NSString *affiliateIdentifier;
  NSNumber *ownerAccountDSID;
  NSString *buyParameters;
  NSMutableDictionary *downloadProperties;
  NSNumber *enabledServiceType;
  NSArray *filteredAssetTypes;
  NSArray *gratisIdentifiers;
  id requiredDeviceCapabilities;
  NSDictionary *tidHeaders;
  NSString *presentingSceneIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SSDownloadPolicy *downloadPolicy;
  void *v32;
  id v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  SSURLRequestProperties *requestProperties;
  void *v48;
  id v49;
  void *v50;
  int v51;
  int v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  id v65;
  id v66;
  int v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("0"));
  affiliateIdentifier = self->_affiliateIdentifier;
  if (affiliateIdentifier)
    objc_msgSend(v5, "setObject:forKey:", affiliateIdentifier, CFSTR("1"));
  ownerAccountDSID = self->_ownerAccountDSID;
  if (ownerAccountDSID)
    objc_msgSend(v5, "setObject:forKey:", ownerAccountDSID, CFSTR("O"));
  buyParameters = self->_buyParameters;
  if (buyParameters)
    objc_msgSend(v5, "setObject:forKey:", buyParameters, CFSTR("3"));
  downloadProperties = self->_downloadProperties;
  if (downloadProperties)
    objc_msgSend(v5, "setObject:forKey:", downloadProperties, CFSTR("7"));
  enabledServiceType = self->_enabledServiceType;
  if (enabledServiceType)
    objc_msgSend(v5, "setObject:forKey:", enabledServiceType, CFSTR("L"));
  filteredAssetTypes = self->_filteredAssetTypes;
  if (filteredAssetTypes)
    objc_msgSend(v5, "setObject:forKey:", filteredAssetTypes, CFSTR("8"));
  gratisIdentifiers = self->_gratisIdentifiers;
  if (gratisIdentifiers)
    objc_msgSend(v5, "setObject:forKey:", gratisIdentifiers, CFSTR("G"));
  requiredDeviceCapabilities = self->_requiredDeviceCapabilities;
  if (requiredDeviceCapabilities)
    objc_msgSend(v5, "setObject:forKey:", requiredDeviceCapabilities, CFSTR("F"));
  tidHeaders = self->_tidHeaders;
  if (tidHeaders)
    objc_msgSend(v5, "setObject:forKey:", tidHeaders, CFSTR("Q"));
  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  if (presentingSceneIdentifier)
    objc_msgSend(v5, "setObject:forKey:", presentingSceneIdentifier, CFSTR("R"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_backgroundPurchase);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSPurchase _createsDownloadsWithOverride](self, "_createsDownloadsWithOverride"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("4"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSPurchase _createsJobsWithOverride](self, "_createsJobsWithOverride"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("5"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSPurchase _createsInstallJobsWithOverride](self, "_createsInstallJobsWithOverride"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("N"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_displaysOnLockScreen);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("K"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_expectedDownloadFileSize);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("E"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoresForcedPasswordRestriction);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("9"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_placeholderDownloadIdentifier);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("C"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usesLocalRedownloadParametersIfPossible);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("H"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_playbackRequest);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("M"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preauthenticated);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("I"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_skipSoftwareAccountPreflight);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("P"));

  -[SSItem rawItemDictionary](self->_item, "rawItemDictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("A"));
  -[SSItemOffer offerIdentifier](self->_itemOffer, "offerIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("A"));
  downloadPolicy = self->_downloadPolicy;
  if (downloadPolicy)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", downloadPolicy, 1, &v66);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v66;
    if (v32)
    {
      objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("6"));
LABEL_42:

      goto LABEL_43;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = objc_msgSend(v34, "shouldLog");
    if (objc_msgSend(v34, "shouldLogToDisk"))
      v36 = v35 | 2;
    else
      v36 = v35;
    objc_msgSend(v34, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      v36 &= 2u;
    if (v36)
    {
      v38 = (void *)objc_opt_class();
      v67 = 138543618;
      v68 = v38;
      v69 = 2114;
      v70 = v33;
      v39 = v38;
      LODWORD(v64) = 22;
      v63 = &v67;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
LABEL_41:

        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v67, v64);
      v37 = objc_claimAutoreleasedReturnValue();
      free(v40);
      SSFileLog(v34, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v37);
    }

    goto LABEL_41;
  }
LABEL_43:
  requestProperties = self->_requestProperties;
  if (requestProperties)
  {
    v65 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", requestProperties, 1, &v65);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v65;
    if (v48)
    {
      objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("D"));
LABEL_58:

      goto LABEL_59;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v51 = objc_msgSend(v50, "shouldLog", v63);
    if (objc_msgSend(v50, "shouldLogToDisk"))
      v52 = v51 | 2;
    else
      v52 = v51;
    objc_msgSend(v50, "OSLogObject");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      v52 &= 2u;
    if (v52)
    {
      v54 = (void *)objc_opt_class();
      v67 = 138543618;
      v68 = v54;
      v69 = 2114;
      v70 = v49;
      v55 = v54;
      LODWORD(v64) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_57:

        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v56, 4, &v67, v64);
      v53 = objc_claimAutoreleasedReturnValue();
      free(v56);
      SSFileLog(v50, CFSTR("%@"), v57, v58, v59, v60, v61, v62, (uint64_t)v53);
    }

    goto LABEL_57;
  }
LABEL_59:

}

- (id)_buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("&"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 2)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if (v13)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  objc_msgSend(v14, "stringByRemovingPercentEncoding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_createsDownloadsWithOverride
{
  NSNumber *buyParamsCreatesDownloads;
  _BOOL8 v4;

  buyParamsCreatesDownloads = self->_buyParamsCreatesDownloads;
  if (buyParamsCreatesDownloads)
    LOBYTE(v4) = -[NSNumber BOOLValue](buyParamsCreatesDownloads, "BOOLValue");
  else
    return self->_createsDownloads;
  return v4;
}

- (BOOL)_createsInstallJobsWithOverride
{
  NSNumber *buyParamsCreatesInstallJobs;
  _BOOL8 v4;

  buyParamsCreatesInstallJobs = self->_buyParamsCreatesInstallJobs;
  if (buyParamsCreatesInstallJobs)
    LOBYTE(v4) = -[NSNumber BOOLValue](buyParamsCreatesInstallJobs, "BOOLValue");
  else
    return self->_createsInstallJobs;
  return v4;
}

- (BOOL)_createsJobsWithOverride
{
  NSNumber *buyParamsCreatesJobs;
  _BOOL8 v4;

  buyParamsCreatesJobs = self->_buyParamsCreatesJobs;
  if (buyParamsCreatesJobs)
    LOBYTE(v4) = -[NSNumber BOOLValue](buyParamsCreatesJobs, "BOOLValue");
  else
    return self->_createsJobs;
  return v4;
}

- (void)_setValuesUsingDatabaseEncoding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *downloadProperties;
  void *v17;
  NSNumber *v18;
  NSNumber *enabledServiceType;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SSItem *v32;
  SSItem *item;
  void *v34;
  SSItemOffer *v35;
  SSItemOffer *itemOffer;
  SSItemOffer *v37;
  SSItemOffer *v38;
  void *v39;
  NSDictionary *v40;
  NSDictionary *tidHeaders;
  void *v42;
  unint64_t v43;
  void *v44;
  SSDownloadPolicy *v45;
  void *downloadPolicy;
  int v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  SSURLRequestProperties *v62;
  void *requestProperties;
  int v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  int v83;
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_accountIdentifier, v5);
  objc_msgSend(v4, "objectForKey:", CFSTR("1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_affiliateIdentifier, v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("O"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_ownerAccountDSID, v7);
  objc_msgSend(v4, "objectForKey:", CFSTR("2"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_backgroundPurchase = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("3"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_buyParameters, v9);
  objc_msgSend(v4, "objectForKey:", CFSTR("4"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_createsDownloads = objc_msgSend(v10, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("5"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_createsJobs = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("N"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_createsInstallJobs = objc_msgSend(v12, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("K"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_displaysOnLockScreen = objc_msgSend(v13, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("7"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (NSMutableDictionary *)objc_msgSend(v14, "mutableCopy");
    downloadProperties = self->_downloadProperties;
    self->_downloadProperties = v15;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("L"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (NSNumber *)objc_msgSend(v17, "copy");
    enabledServiceType = self->_enabledServiceType;
    self->_enabledServiceType = v18;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("E"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_expectedDownloadFileSize = objc_msgSend(v20, "longLongValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("8"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_filteredAssetTypes, v21);
  objc_msgSend(v4, "objectForKey:", CFSTR("G"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_gratisIdentifiers, v22);
  objc_msgSend(v4, "objectForKey:", CFSTR("9"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_ignoresForcedPasswordRestriction = objc_msgSend(v23, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("C"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_placeholderDownloadIdentifier = objc_msgSend(v24, "longLongValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("M"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_playbackRequest = objc_msgSend(v25, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("F"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_storeStrong(&self->_requiredDeviceCapabilities, v26);
  objc_msgSend(v4, "objectForKey:", CFSTR("H"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_usesLocalRedownloadParametersIfPossible = objc_msgSend(v27, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("I"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_preauthenticated = objc_msgSend(v28, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("P"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_skipSoftwareAccountPreflight = objc_msgSend(v29, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("R"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_presentingSceneIdentifier, v30);
  objc_msgSend(v4, "objectForKey:", CFSTR("A"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v31);
    item = self->_item;
    self->_item = v32;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("B"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SSItem itemOfferForIdentifier:](self->_item, "itemOfferForIdentifier:", v34);
    v35 = (SSItemOffer *)objc_claimAutoreleasedReturnValue();
    itemOffer = self->_itemOffer;
    self->_itemOffer = v35;

    if (!self->_itemOffer)
    {
      -[SSItem defaultItemOffer](self->_item, "defaultItemOffer");
      v37 = (SSItemOffer *)objc_claimAutoreleasedReturnValue();
      v38 = self->_itemOffer;
      self->_itemOffer = v37;

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("Q"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = (NSDictionary *)objc_msgSend(v39, "copy");
    tidHeaders = self->_tidHeaders;
    self->_tidHeaders = v40;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("6"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v43 = 0x1E0CB3000uLL;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v42, &v82);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v82;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = v44;
      downloadPolicy = self->_downloadPolicy;
      self->_downloadPolicy = v45;
LABEL_56:
      v43 = 0x1E0CB3000;
LABEL_67:

      goto LABEL_68;
    }
    v77 = v31;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    downloadPolicy = (void *)objc_claimAutoreleasedReturnValue();
    if (!downloadPolicy)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      downloadPolicy = (void *)objc_claimAutoreleasedReturnValue();
    }
    v47 = objc_msgSend(downloadPolicy, "shouldLog");
    if (objc_msgSend(downloadPolicy, "shouldLogToDisk"))
      v47 |= 2u;
    objc_msgSend(downloadPolicy, "OSLogObject");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      v47 &= 2u;
    if (v47)
    {
      v49 = (void *)objc_opt_class();
      v83 = 138543618;
      v84 = v49;
      v85 = 2114;
      v86 = v79;
      v50 = v49;
      LODWORD(v76) = 22;
      v75 = &v83;
      v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51)
      {
        v31 = v77;
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, &v83, v76);
      v48 = objc_claimAutoreleasedReturnValue();
      free(v51);
      SSFileLog(downloadPolicy, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v48);
    }
    v43 = 0x1E0CB3000uLL;

    v31 = v77;
    goto LABEL_67;
  }
LABEL_68:
  objc_msgSend(v4, "objectForKey:", CFSTR("D"), v75);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = *(void **)(v43 + 1808);
    v81 = 0;
    objc_msgSend(v59, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v58, &v81);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v81;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = v60;
      requestProperties = self->_requestProperties;
      self->_requestProperties = v62;
LABEL_82:

      goto LABEL_83;
    }
    v78 = v31;
    v80 = v61;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    requestProperties = (void *)objc_claimAutoreleasedReturnValue();
    if (!requestProperties)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      requestProperties = (void *)objc_claimAutoreleasedReturnValue();
    }
    v64 = objc_msgSend(requestProperties, "shouldLog");
    if (objc_msgSend(requestProperties, "shouldLogToDisk"))
      v64 |= 2u;
    objc_msgSend(requestProperties, "OSLogObject");
    v65 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      v64 &= 2u;
    if (v64)
    {
      v66 = (void *)objc_opt_class();
      v83 = 138543618;
      v84 = v66;
      v85 = 2114;
      v86 = v80;
      v67 = v66;
      LODWORD(v76) = 22;
      v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
LABEL_81:
        v31 = v78;
        v61 = v80;
        goto LABEL_82;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v68, 4, &v83, v76);
      v65 = objc_claimAutoreleasedReturnValue();
      free(v68);
      SSFileLog(requestProperties, CFSTR("%@"), v69, v70, v71, v72, v73, v74, (uint64_t)v65);
    }

    goto LABEL_81;
  }
LABEL_83:

}

- (SSPurchase)initWithCoder:(id)a3
{
  id v5;
  SSPurchase *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSNumber *accountIdentifier;
  uint64_t v16;
  NSString *affiliateIdentifier;
  uint64_t v18;
  NSNumber *ownerAccountDSID;
  uint64_t v20;
  NSString *buyParameters;
  uint64_t v22;
  NSNumber *enabledServiceType;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *filteredAssetTypes;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *gratisIdentifiers;
  uint64_t v34;
  id requiredDeviceCapabilities;
  uint64_t v36;
  NSString *presentingSceneIdentifier;
  uint64_t v38;
  NSString *presentingSceneBundleIdentifier;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  const __CFUUID *v44;
  const __CFUUID *v45;
  void *v46;
  uint64_t v47;
  NSMutableDictionary *downloadProperties;
  void *v49;
  SSItem *v50;
  SSItem *item;
  void *v52;
  uint64_t v53;
  SSItemOffer *itemOffer;
  uint64_t v55;
  SSItemOffer *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSPurchase.m"), 1016, CFSTR("Only keyed coding is supported"));

  }
  v6 = -[SSPurchase _initSSPurchase](self, "_initSSPurchase");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v14;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("affiliate"));
    v16 = objc_claimAutoreleasedReturnValue();
    affiliateIdentifier = v6->_affiliateIdentifier;
    v6->_affiliateIdentifier = (NSString *)v16;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerAccountDSID"));
    v18 = objc_claimAutoreleasedReturnValue();
    ownerAccountDSID = v6->_ownerAccountDSID;
    v6->_ownerAccountDSID = (NSNumber *)v18;

    v6->_backgroundPurchase = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("background"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buyparams"));
    v20 = objc_claimAutoreleasedReturnValue();
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v20;

    v6->_createsDownloads = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("createdl"));
    v6->_createsJobs = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("createjb"));
    v6->_createsInstallJobs = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("createinstalljb"));
    v6->_displaysOnLockScreen = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("dislkscrn"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ensrvtp"));
    v22 = objc_claimAutoreleasedReturnValue();
    enabledServiceType = v6->_enabledServiceType;
    v6->_enabledServiceType = (NSNumber *)v22;

    v6->_expectedDownloadFileSize = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("fsize"));
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("fltassts"));
    v27 = objc_claimAutoreleasedReturnValue();
    filteredAssetTypes = v6->_filteredAssetTypes;
    v6->_filteredAssetTypes = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v31, CFSTR("gratids"));
    v32 = objc_claimAutoreleasedReturnValue();
    gratisIdentifiers = v6->_gratisIdentifiers;
    v6->_gratisIdentifiers = (NSArray *)v32;

    v6->_ignoresForcedPasswordRestriction = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("ignfrcpw"));
    v6->_placeholderDownloadIdentifier = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("plchid"));
    v6->_playbackRequest = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("plyreq"));
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("reqcap"));
    v34 = objc_claimAutoreleasedReturnValue();
    requiredDeviceCapabilities = v6->_requiredDeviceCapabilities;
    v6->_requiredDeviceCapabilities = (id)v34;

    v6->_skipSoftwareAccountPreflight = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("skipSoftwareAccountPreflight"));
    v6->_usesLocalRedownloadParametersIfPossible = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("usesrdl"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    presentingSceneIdentifier = v6->_presentingSceneIdentifier;
    v6->_presentingSceneIdentifier = (NSString *)v36;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneBundleIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    presentingSceneBundleIdentifier = v6->_presentingSceneBundleIdentifier;
    v6->_presentingSceneBundleIdentifier = (NSString *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v42, CFSTR("uniqueid"));
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6->_uniqueIdentifier = -[__CFString longLongValue](v43, "longLongValue");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = CFUUIDCreateFromString(0, v43);
        if (v44)
        {
          v45 = v44;
          v6->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v44);
          CFRelease(v45);
        }
      }
    }
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("dlprops")))
    {
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("dlprops"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "mutableCopy");
    }
    else
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "newDownloadProperties");
    }
    downloadProperties = v6->_downloadProperties;
    v6->_downloadProperties = (NSMutableDictionary *)v47;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("itemdict"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v49);
      item = v6->_item;
      v6->_item = v50;

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerid"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      -[SSItem itemOfferForIdentifier:](v6->_item, "itemOfferForIdentifier:", v52);
      v53 = objc_claimAutoreleasedReturnValue();
      itemOffer = v6->_itemOffer;
      v6->_itemOffer = (SSItemOffer *)v53;

      if (!v6->_itemOffer)
      {
        -[SSItem defaultItemOffer](v6->_item, "defaultItemOffer");
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = v6->_itemOffer;
        v6->_itemOffer = (SSItemOffer *)v55;

      }
    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dlpolicy"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v6->_downloadPolicy, v57);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("netcon"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v6->_networkConstraints, v58);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestp"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v6->_requestProperties, v59);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSObject *dispatchQueue;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  SSPurchase *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSPurchase.m"), 1092, CFSTR("Only keyed coding is supported"));

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSPurchase_encodeWithCoder___block_invoke;
  block[3] = &unk_1E47B8768;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_sync(dispatchQueue, block);

}

uint64_t __30__SSPurchase_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("account"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("affiliate"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176), CFSTR("ownerAccountDSID"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("background"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("buyparams"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("createdl"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 73), CFSTR("createjb"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 74), CFSTR("createinstalljb"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("dislkscrn"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("dlpolicy"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("dlprops"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("ensrvtp"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("fsize"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("fltassts"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("gratids"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("ignfrcpw"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), CFSTR("netcon"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("plchid"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200), CFSTR("requestp"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("plyreq"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208), CFSTR("reqcap"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("skipSoftwareAccountPreflight"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "rawItemDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v3, CFSTR("itemdict"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "offerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("offerid"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("uniqueid"));

  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 240), CFSTR("usesrdl"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248), CFSTR("presentingSceneIdentifier"));
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256), CFSTR("presentingSceneBundleIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  SSPurchase *v12;
  _NSZone *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SSPurchase_copyWithZone___block_invoke;
  block[3] = &unk_1E47B9F28;
  v7 = v5;
  v11 = v7;
  v12 = self;
  v13 = a3;
  dispatch_sync(dispatchQueue, block);
  v8 = v7;

  return v8;
}

void __27__SSPurchase_copyWithZone___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;

  v2 = objc_msgSend(*(id *)(a1[5] + 8), "copyWithZone:", a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = objc_msgSend(*(id *)(a1[5] + 16), "copyWithZone:", a1[6]);
  v6 = a1[4];
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  v8 = objc_msgSend(*(id *)(a1[5] + 176), "copyWithZone:", a1[6]);
  v9 = a1[4];
  v10 = *(void **)(v9 + 176);
  *(_QWORD *)(v9 + 176) = v8;

  *(_BYTE *)(a1[4] + 24) = *(_BYTE *)(a1[5] + 24);
  *(_QWORD *)(a1[4] + 32) = *(_QWORD *)(a1[5] + 32);
  v11 = objc_msgSend(*(id *)(a1[5] + 40), "copyWithZone:", a1[6]);
  v12 = a1[4];
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  *(_BYTE *)(a1[4] + 72) = *(_BYTE *)(a1[5] + 72);
  *(_BYTE *)(a1[4] + 73) = *(_BYTE *)(a1[5] + 73);
  *(_BYTE *)(a1[4] + 74) = *(_BYTE *)(a1[5] + 74);
  *(_BYTE *)(a1[4] + 88) = *(_BYTE *)(a1[5] + 88);
  v14 = objc_msgSend(*(id *)(a1[5] + 96), "copyWithZone:", a1[6]);
  v15 = a1[4];
  v16 = *(void **)(v15 + 96);
  *(_QWORD *)(v15 + 96) = v14;

  v17 = objc_msgSend(*(id *)(a1[5] + 104), "mutableCopyWithZone:", a1[6]);
  v18 = a1[4];
  v19 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = v17;

  v20 = objc_msgSend(*(id *)(a1[5] + 112), "copyWithZone:", a1[6]);
  v21 = a1[4];
  v22 = *(void **)(v21 + 112);
  *(_QWORD *)(v21 + 112) = v20;

  *(_QWORD *)(a1[4] + 120) = *(_QWORD *)(a1[5] + 120);
  v23 = objc_msgSend(*(id *)(a1[5] + 128), "copyWithZone:", a1[6]);
  v24 = a1[4];
  v25 = *(void **)(v24 + 128);
  *(_QWORD *)(v24 + 128) = v23;

  v26 = objc_msgSend(*(id *)(a1[5] + 136), "copyWithZone:", a1[6]);
  v27 = a1[4];
  v28 = *(void **)(v27 + 136);
  *(_QWORD *)(v27 + 136) = v26;

  *(_BYTE *)(a1[4] + 144) = *(_BYTE *)(a1[5] + 144);
  objc_storeStrong((id *)(a1[4] + 152), *(id *)(a1[5] + 152));
  objc_storeStrong((id *)(a1[4] + 160), *(id *)(a1[5] + 160));
  v29 = objc_msgSend(*(id *)(a1[5] + 168), "copyWithZone:", a1[6]);
  v30 = a1[4];
  v31 = *(void **)(v30 + 168);
  *(_QWORD *)(v30 + 168) = v29;

  *(_QWORD *)(a1[4] + 184) = *(_QWORD *)(a1[5] + 184);
  *(_BYTE *)(a1[4] + 192) = *(_BYTE *)(a1[5] + 192);
  v32 = objc_msgSend(*(id *)(a1[5] + 200), "copyWithZone:", a1[6]);
  v33 = a1[4];
  v34 = *(void **)(v33 + 200);
  *(_QWORD *)(v33 + 200) = v32;

  v35 = objc_msgSend(*(id *)(a1[5] + 208), "copyWithZone:", a1[6]);
  v36 = a1[4];
  v37 = *(void **)(v36 + 208);
  *(_QWORD *)(v36 + 208) = v35;

  *(_BYTE *)(a1[4] + 216) = *(_BYTE *)(a1[5] + 216);
  v38 = objc_msgSend(*(id *)(a1[5] + 224), "copyWithZone:", a1[6]);
  v39 = a1[4];
  v40 = *(void **)(v39 + 224);
  *(_QWORD *)(v39 + 224) = v38;

  *(_QWORD *)(a1[4] + 232) = *(_QWORD *)(a1[5] + 232);
  *(_BYTE *)(a1[4] + 240) = *(_BYTE *)(a1[5] + 240);
  *(_BYTE *)(a1[4] + 193) = *(_BYTE *)(a1[5] + 193);
  v41 = objc_msgSend(*(id *)(a1[5] + 248), "copyWithZone:", a1[6]);
  v42 = a1[4];
  v43 = *(void **)(v42 + 248);
  *(_QWORD *)(v42 + 248) = v41;

  v44 = objc_msgSend(*(id *)(a1[5] + 256), "copyWithZone:", a1[6]);
  v45 = a1[4];
  v46 = *(void **)(v45 + 256);
  *(_QWORD *)(v45 + 256) = v44;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SSPurchase buyParameters](self, "buyParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SSPurchase buyParameters](self, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buyParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSPurchase *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__SSPurchase_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

uint64_t __29__SSPurchase_copyXPCEncoding__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "0", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "1", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "2", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "3", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "4", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "5", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 72));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "6", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 73));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "7", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 74));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "23", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 88));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "8", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "9", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "24", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "10", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "11", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "20", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "12", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "14", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "16", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "25", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 192));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "17", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "18", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "19", objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "rawItemDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v2, "13", v3);

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "offerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v4, "15", v5);

  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "26", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 216));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "21", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 240));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "22", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 193));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "27", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "28", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248));
  return SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "29", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256));
}

- (SSPurchase)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPurchase *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *accountIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSString *affiliateIdentifier;
  uint64_t v14;
  uint64_t v15;
  NSNumber *ownerAccountDSID;
  uint64_t v17;
  uint64_t v18;
  NSString *buyParameters;
  SSDownloadPolicy *v20;
  void *v21;
  uint64_t v22;
  SSDownloadPolicy *downloadPolicy;
  uint64_t v24;
  uint64_t v25;
  NSNumber *enabledServiceType;
  uint64_t v27;
  uint64_t v28;
  NSArray *filteredAssetTypes;
  uint64_t v30;
  uint64_t v31;
  NSArray *gratisIdentifiers;
  SSNetworkConstraints *v33;
  void *v34;
  uint64_t v35;
  SSNetworkConstraints *networkConstraints;
  SSURLRequestProperties *v37;
  void *v38;
  uint64_t v39;
  SSURLRequestProperties *requestProperties;
  uint64_t v41;
  uint64_t v42;
  NSDictionary *tidHeaders;
  uint64_t v44;
  uint64_t v45;
  NSString *presentingSceneBundleIdentifier;
  uint64_t v47;
  uint64_t v48;
  NSString *presentingSceneIdentifier;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSMutableDictionary *downloadProperties;
  uint64_t v54;
  void *v55;
  SSItem *v56;
  SSItem *item;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  SSItemOffer *itemOffer;
  uint64_t v62;
  SSItemOffer *v63;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSPurchase _initSSPurchase](self, "_initSSPurchase");
    if (!v6)
      goto LABEL_5;
    v8 = objc_opt_class();
    v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v9;

    v11 = objc_opt_class();
    v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
    affiliateIdentifier = v6->_affiliateIdentifier;
    v6->_affiliateIdentifier = (NSString *)v12;

    v14 = objc_opt_class();
    v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
    ownerAccountDSID = v6->_ownerAccountDSID;
    v6->_ownerAccountDSID = (NSNumber *)v15;

    v6->_backgroundPurchase = xpc_dictionary_get_BOOL(v5, "3");
    v17 = objc_opt_class();
    v18 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v17);
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v18;

    v6->_createsDownloads = xpc_dictionary_get_BOOL(v5, "5");
    v6->_createsJobs = xpc_dictionary_get_BOOL(v5, "6");
    v6->_createsInstallJobs = xpc_dictionary_get_BOOL(v5, "7");
    v6->_displaysOnLockScreen = xpc_dictionary_get_BOOL(v5, "23");
    v20 = [SSDownloadPolicy alloc];
    xpc_dictionary_get_value(v5, "8");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SSDownloadPolicy initWithXPCEncoding:](v20, "initWithXPCEncoding:", v21);
    downloadPolicy = v6->_downloadPolicy;
    v6->_downloadPolicy = (SSDownloadPolicy *)v22;

    v24 = objc_opt_class();
    v25 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v24);
    enabledServiceType = v6->_enabledServiceType;
    v6->_enabledServiceType = (NSNumber *)v25;

    v6->_expectedDownloadFileSize = xpc_dictionary_get_int64(v5, "10");
    v27 = objc_opt_class();
    v28 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v27);
    filteredAssetTypes = v6->_filteredAssetTypes;
    v6->_filteredAssetTypes = (NSArray *)v28;

    v30 = objc_opt_class();
    v31 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v30);
    gratisIdentifiers = v6->_gratisIdentifiers;
    v6->_gratisIdentifiers = (NSArray *)v31;

    v6->_ignoresForcedPasswordRestriction = xpc_dictionary_get_BOOL(v5, "12");
    v6->_placeholderDownloadIdentifier = xpc_dictionary_get_int64(v5, "16");
    v6->_playbackRequest = xpc_dictionary_get_BOOL(v5, "25");
    v33 = [SSNetworkConstraints alloc];
    xpc_dictionary_get_value(v5, "14");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SSNetworkConstraints initWithXPCEncoding:](v33, "initWithXPCEncoding:", v34);
    networkConstraints = v6->_networkConstraints;
    v6->_networkConstraints = (SSNetworkConstraints *)v35;

    v37 = [SSURLRequestProperties alloc];
    xpc_dictionary_get_value(v5, "17");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[SSURLRequestProperties initWithXPCEncoding:](v37, "initWithXPCEncoding:", v38);
    requestProperties = v6->_requestProperties;
    v6->_requestProperties = (SSURLRequestProperties *)v39;

    v6->_uniqueIdentifier = xpc_dictionary_get_int64(v5, "19");
    v6->_usesLocalRedownloadParametersIfPossible = xpc_dictionary_get_BOOL(v5, "21");
    v6->_preauthenticated = xpc_dictionary_get_BOOL(v5, "22");
    v6->_skipSoftwareAccountPreflight = xpc_dictionary_get_BOOL(v5, "26");
    v41 = objc_opt_class();
    v42 = SSXPCDictionaryCopyObjectWithClass(v5, "27", v41);
    tidHeaders = v6->_tidHeaders;
    v6->_tidHeaders = (NSDictionary *)v42;

    v44 = objc_opt_class();
    v45 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v44);
    presentingSceneBundleIdentifier = v6->_presentingSceneBundleIdentifier;
    v6->_presentingSceneBundleIdentifier = (NSString *)v45;

    v47 = objc_opt_class();
    v48 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v47);
    presentingSceneIdentifier = v6->_presentingSceneIdentifier;
    v6->_presentingSceneIdentifier = (NSString *)v48;

    self = (SSPurchase *)SSXPCDictionaryCopyCFObject(v5, "18");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_storeStrong(&v6->_requiredDeviceCapabilities, self);
    v50 = objc_opt_class();
    v51 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "9", v50);
    v52 = objc_msgSend(v51, "mutableCopy");
    downloadProperties = v6->_downloadProperties;
    v6->_downloadProperties = (NSMutableDictionary *)v52;

    v54 = objc_opt_class();
    v55 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "13", v54);
    if (v55)
    {
      v56 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v55);
      item = v6->_item;
      v6->_item = v56;

    }
    v58 = objc_opt_class();
    v59 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "15", v58);
    if (v59)
    {
      -[SSItem itemOfferForIdentifier:](v6->_item, "itemOfferForIdentifier:", v59);
      v60 = objc_claimAutoreleasedReturnValue();
      itemOffer = v6->_itemOffer;
      v6->_itemOffer = (SSItemOffer *)v60;

      if (!v6->_itemOffer)
      {
        -[SSItem defaultItemOffer](v6->_item, "defaultItemOffer");
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v6->_itemOffer;
        v6->_itemOffer = (SSItemOffer *)v62;

      }
    }

  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)downloadMetadata
{
  return 0;
}

- (void)setDownloadMetadata:(id)a3
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
  v7[2] = __34__SSPurchase_setDownloadMetadata___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __34__SSPurchase_setDownloadMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "newDownloadProperties");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

}

- (BOOL)skipSoftwareAccountPreflight
{
  return self->_skipSoftwareAccountPreflight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong(&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_ownerAccountDSID, 0);
  objc_storeStrong((id *)&self->_networkConstraints, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_gratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredAssetTypes, 0);
  objc_storeStrong((id *)&self->_enabledServiceType, 0);
  objc_storeStrong((id *)&self->_downloadProperties, 0);
  objc_storeStrong((id *)&self->_downloadPolicy, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesJobs, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesInstallJobs, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesDownloads, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

+ (id)newPurchaseWithDatabaseEncoding:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("03"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
      v5 = (objc_class *)objc_opt_class();
    v7 = (void *)objc_msgSend([v5 alloc], "_initSSPurchase");
    objc_msgSend(v7, "_setValuesUsingDatabaseEncoding:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newPurchaseWithXPCEncoding:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
  {
    v6 = (objc_class *)objc_opt_class();
    if (xpc_dictionary_get_BOOL(v4, "55"))
      v6 = (objc_class *)objc_opt_class();
    v5 = (void *)objc_msgSend([v6 alloc], "initWithXPCEncoding:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
