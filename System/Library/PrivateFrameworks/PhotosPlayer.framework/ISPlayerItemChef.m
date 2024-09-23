@implementation ISPlayerItemChef

- (ISPlayerItemChef)init
{
  ISPlayerItemChef *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *isolationQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *operationsByRequestID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ISPlayerItemChef;
  v2 = -[ISPlayerItemChef init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->__operationQueue;
    v2->__operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->__operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->__operationQueue, "setQualityOfService:", 25);
    v5 = dispatch_queue_create("com.apple.irisassetisolation", 0);
    isolationQueue = v2->__isolationQueue;
    v2->__isolationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    operationsByRequestID = v2->__operationsByRequestID;
    v2->__operationsByRequestID = v7;

  }
  return v2;
}

- (int64_t)prepareIrisVideoWithAsset:(id)a3 photoTime:(id *)a4 trimmedTimeRange:(id *)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  int64_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  _OWORD v18[3];

  v10 = a6;
  v11 = a3;
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "audioEnabled");
  v14 = *(_OWORD *)&a5->var0.var3;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  v17 = *a4;
  v15 = -[ISPlayerItemChef prepareIrisPlayerItemWithAsset:trimmedTimeRange:photoTime:includeVideo:includeAudio:completion:](self, "prepareIrisPlayerItemWithAsset:trimmedTimeRange:photoTime:includeVideo:includeAudio:completion:", v11, v18, &v17, 1, v13, v10);

  return v15;
}

- (int64_t)prepareIrisPlayerItemWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeVideo:(BOOL)a6 includeAudio:(BOOL)a7 completion:(id)a8
{
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  _ISPlayerItemChefOperation *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  id v21;
  NSObject *v22;
  _ISPlayerItemChefOperation *v23;
  _ISPlayerItemChefOperation *v24;
  id v25;
  void *v26;
  _BOOL4 v28;
  _BOOL4 v29;
  _QWORD block[4];
  id v31;
  _ISPlayerItemChefOperation *v32;
  int64_t v33;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v34;
  _OWORD v35[3];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  int64_t v40;

  v28 = a6;
  v29 = a7;
  v12 = a8;
  v13 = a3;
  v14 = -[ISPlayerItemChef _currentRequestID](self, "_currentRequestID") + 1;
  -[ISPlayerItemChef _setCurrentRequestID:](self, "_setCurrentRequestID:", v14);
  -[ISPlayerItemChef _isolationQueue](self, "_isolationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISPlayerItemChef _operationsByRequestID](self, "_operationsByRequestID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [_ISPlayerItemChefOperation alloc];
  v18 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke;
  v36[3] = &unk_1E9453BA8;
  v37 = v15;
  v19 = v16;
  v39 = v12;
  v40 = v14;
  v38 = v19;
  v20 = *(_OWORD *)&a4->var0.var3;
  v35[0] = *(_OWORD *)&a4->var0.var0;
  v35[1] = v20;
  v35[2] = *(_OWORD *)&a4->var1.var1;
  v34 = *a5;
  v21 = v12;
  v22 = v15;
  v23 = -[_ISPlayerItemChefOperation initWithAsset:trimmedTimeRange:photoTime:includeAudio:includeVideo:resultHandler:](v17, "initWithAsset:trimmedTimeRange:photoTime:includeAudio:includeVideo:resultHandler:", v13, v35, &v34, v29, v28, v36);

  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_3;
  block[3] = &unk_1E9453BD0;
  v31 = v19;
  v32 = v23;
  v33 = v14;
  v24 = v23;
  v25 = v19;
  dispatch_async(v22, block);
  -[ISPlayerItemChef _operationQueue](self, "_operationQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOperation:", v24);

  return v14;
}

- (void)cancelPreparationOfIrisAssetWithRequestID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  int64_t v10;

  -[ISPlayerItemChef _operationsByRequestID](self, "_operationsByRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISPlayerItemChef _isolationQueue](self, "_isolationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ISPlayerItemChef_cancelPreparationOfIrisAssetWithRequestID___block_invoke;
  block[3] = &unk_1E94541A8;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

}

- (NSOperationQueue)_operationQueue
{
  return self->__operationQueue;
}

- (OS_dispatch_queue)_isolationQueue
{
  return self->__isolationQueue;
}

- (NSMutableDictionary)_operationsByRequestID
{
  return self->__operationsByRequestID;
}

- (int64_t)_currentRequestID
{
  return self->__currentRequestID;
}

- (void)_setCurrentRequestID:(int64_t)a3
{
  self->__currentRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__operationsByRequestID, 0);
  objc_storeStrong((id *)&self->__isolationQueue, 0);
  objc_storeStrong((id *)&self->__operationQueue, 0);
}

void __62__ISPlayerItemChef_cancelPreparationOfIrisAssetWithRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cancel");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, __int128 *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, id, __int128 *, id);
  __int128 v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  uint64_t v20;

  v9 = a3;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_2;
  block[3] = &unk_1E94541A8;
  v11 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v19 = v12;
  v20 = v13;
  dispatch_async(v11, block);
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    v15 = *(void (**)(uint64_t, uint64_t, id, __int128 *, id))(v14 + 16);
    v16 = *a4;
    v17 = *((_QWORD *)a4 + 2);
    v15(v14, a2, v9, &v16, v10);
  }

}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_3(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = (void *)a1[4];
  v2 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, v3);

}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

+ (ISPlayerItemChef)defaultChef
{
  if (defaultChef_onceToken != -1)
    dispatch_once(&defaultChef_onceToken, &__block_literal_global_1931);
  return (ISPlayerItemChef *)(id)defaultChef_defaultChef;
}

void __31__ISPlayerItemChef_defaultChef__block_invoke()
{
  ISPlayerItemChef *v0;
  void *v1;

  v0 = objc_alloc_init(ISPlayerItemChef);
  v1 = (void *)defaultChef_defaultChef;
  defaultChef_defaultChef = (uint64_t)v0;

}

@end
