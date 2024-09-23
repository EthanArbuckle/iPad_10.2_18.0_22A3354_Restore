@implementation ICMusicSubscriptionAccountlessPlaybackRequest

- (ICMusicSubscriptionAccountlessPlaybackRequest)initWithRequestContext:(id)a3 storeSubscriptionAdamID:(int64_t)a4
{
  id v6;
  ICMusicSubscriptionAccountlessPlaybackRequest *v7;
  uint64_t v8;
  ICStoreRequestContext *requestContext;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionAccountlessPlaybackRequest;
  v7 = -[ICMusicSubscriptionAccountlessPlaybackRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    requestContext = v7->_requestContext;
    v7->_requestContext = (ICStoreRequestContext *)v8;

    v7->_qualityOfService = 25;
    v7->_storeSubscriptionAdamID = a4;
  }

  return v7;
}

- (id)performWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  ICMusicSubscriptionPlaybackRequestOperation *v6;
  uint64_t v7;
  ICMusicSubscriptionPlaybackRequestOperation *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  ICMusicSubscriptionPlaybackRequestOperation *v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ICMusicSubscriptionPlaybackRequestOperation);
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke;
  v18[3] = &unk_1E43913D8;
  v19 = v6;
  v8 = v6;
  objc_msgSend(v5, "setCancellationHandler:", v18);
  objc_msgSend(v5, "setCancellable:", 1);
  -[ICMusicSubscriptionPlaybackRequestOperation setRequestType:](v8, "setRequestType:", 3);
  -[ICMusicSubscriptionPlaybackRequestOperation setAssetSourceStorefrontID:](v8, "setAssetSourceStorefrontID:", self->_assetSourceStorefrontID);
  -[ICMusicSubscriptionPlaybackRequestOperation setRequestContext:](v8, "setRequestContext:", self->_requestContext);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke_2;
  v15[3] = &unk_1E438AB10;
  v9 = v5;
  v16 = v9;
  v17 = v4;
  v10 = v4;
  -[ICMusicSubscriptionPlaybackRequestOperation setResponseHandler:](v8, "setResponseHandler:", v15);
  -[ICMusicSubscriptionPlaybackRequestOperation setStoreSubscriptionAdamID:](v8, "setStoreSubscriptionAdamID:", self->_storeSubscriptionAdamID);
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v8);

  v12 = v17;
  v13 = v9;

  return v13;
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
}

uint64_t __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = *(void **)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  objc_msgSend(v8, "setCancellationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
