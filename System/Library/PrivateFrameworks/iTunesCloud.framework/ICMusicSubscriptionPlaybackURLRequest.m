@implementation ICMusicSubscriptionPlaybackURLRequest

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  ICMusicSubscriptionPlaybackURLRequest *v11;
  id v12;
  id v13;

  v10[1] = 3221225472;
  v10[2] = __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke;
  v10[3] = &unk_1E43901B0;
  v11 = self;
  v12 = a4;
  v13 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  v10[0] = MEMORY[0x1E0C809B0];
  v7 = v13;
  v8 = v12;
  -[ICStoreURLRequest buildStoreURLRequestWithURLRequest:builderProperties:completionHandler:](&v9, sel_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler_, a3, v8, v10);

}

- (id)_actionType
{
  int64_t requestType;
  const __CFString *v3;

  requestType = self->_requestType;
  v3 = CFSTR("lease-renew");
  if (requestType == 2)
    v3 = CFSTR("lease-start");
  if (requestType == 3)
    return CFSTR("accountless-streaming");
  else
    return (id)v3;
}

- (void)_populateItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  int64_t storeSubscriptionAdamID;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
  if (self->_delegatedPlayback)
  {
    v12 = v4;
    if (storeSubscriptionAdamID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("subscriptionAdamId"));

    }
    if (self->_storePurchasedAdamID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("purchaseAdamId"));

    }
    if (self->_storeCloudID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("sagaId"));

    }
    v10 = -[NSString length](self->_cloudUniversalLibraryID, "length");
    v5 = v12;
    if (v10)
    {
      objc_msgSend(v12, "setObject:forKey:", self->_cloudUniversalLibraryID, CFSTR("universalLibraryId"));
LABEL_12:
      v5 = v12;
    }
  }
  else if (storeSubscriptionAdamID)
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("salableAdamId"));

    goto LABEL_12;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionPlaybackURLRequest _populateItemIdentifiers:](self, "_populateItemIdentifiers:", v3);
  v8.receiver = self;
  v8.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  -[ICStoreURLRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "msv_compactDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (id)_analyticSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  -[ICURLRequest _analyticSignature](&v13, sel__analyticSignature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionPlaybackURLRequest _actionType](self, "_actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLRequest urlRequest](self, "urlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "query");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E4391778;
  if (v8)
    v10 = (const __CFString *)v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@?%@ %@"), v4, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSData)leaseCertificateData
{
  return self->_leaseCertificateData;
}

- (void)setLeaseCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSData)leaseAssetIDData
{
  return self->_leaseAssetIDData;
}

- (void)setLeaseAssetIDData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (BOOL)isDelegatedPlayback
{
  return self->_delegatedPlayback;
}

- (void)setDelegatedPlayback:(BOOL)a3
{
  self->_delegatedPlayback = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_leaseAssetIDData, 0);
  objc_storeStrong((id *)&self->_leaseCertificateData, 0);
  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
}

void __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  if (!v5 || a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "storeRequestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *((_QWORD *)a1[4] + 45);
    if (v7 == 3)
      v8 = 309;
    else
      v8 = 310;
    if (v7 == 2)
      v9 = 308;
    else
      v9 = v8;
    if (v7 == 3)
    {
      v10 = -1;
    }
    else
    {
      objc_msgSend(a1[5], "DSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "unsignedLongLongValue");

    }
    +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[4];
    v14 = v13[42];
    v15 = v13[43];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2;
    v17[3] = &unk_1E438DED0;
    v17[4] = v13;
    v18 = v6;
    v19 = v5;
    v20 = a1[6];
    v16 = v6;
    objc_msgSend(v12, "generateSubscriptionLeaseRequestWithAccountUniqueID:transactionType:certificateData:assetIDData:completionHandler:", v10, v9, v14, v15, v17);

  }
}

void __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void (*v27)(void);
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v11;
      v37 = 2114;
      v38 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to generate subscription lease fairplay data. err=%{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_actionType", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("action"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "length"))
    objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), CFSTR("assetStoreFront"));
  if (v7)
  {
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("spc"));

  }
  if (v8)
  {
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("sbsync"));

  }
  objc_msgSend(*(id *)(a1 + 40), "deviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("guid"));
  objc_msgSend(*(id *)(a1 + 40), "deviceInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isWatch");

  if (v19)
  {
    +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pairedDeviceMediaGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("companion-guid"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_populateItemIdentifiers:", v13);
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v32;
  v24 = v23;
  if (!v22 || v23)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (v23)
    {
      v33 = *MEMORY[0x1E0CB3388];
      v34 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = *(_QWORD *)(a1 + 56);
    if (v30)
    {
      v27 = *(void (**)(void))(v30 + 16);
      goto LABEL_30;
    }
  }
  else
  {
    v25 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    objc_msgSend(v25, "setHTTPBody:", v22);
    objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v26 = *(_QWORD *)(a1 + 56);
    if (v26)
    {
      v27 = *(void (**)(void))(v26 + 16);
LABEL_30:
      v27();
    }
  }

}

@end
