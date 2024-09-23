@implementation PXAssetAnalyzer

- (PXAssetAnalyzer)init
{
  PXAssetAnalyzer *v2;
  uint64_t v3;
  NSMutableDictionary *analyzerUUIDToRequest;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAssetAnalyzer;
  v2 = -[PXAssetAnalyzer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    analyzerUUIDToRequest = v2->_analyzerUUIDToRequest;
    v2->_analyzerUUIDToRequest = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)canAnalyzeAsset:(id)a3 forWorkerType:(int64_t)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  v6 = v5;
  if (a4
    || !objc_msgSend(v5, "canPlayPhotoIris")
    || (objc_msgSend(v6, "isCloudSharedAsset") & 1) != 0
    || objc_msgSend(v6, "playbackVariation"))
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "isVariationSuggestionStatesUnknown");
  }

  return v7;
}

- (void)analyzeAsset:(id)a3 forWorkerType:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  px_dispatch_on_main_queue();

}

- (void)_handleResultForRequest:(id)a3 success:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "workerType");
  -[PXAssetAnalyzer _keyForAssetUUID:forWorkerType:](self, "_keyForAssetUUID:forWorkerType:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_analyzerUUIDToRequest, "removeObjectForKey:", v8);

}

- (id)_keyForAssetUUID:(id)a3 forWorkerType:(int64_t)a4
{
  return (id)objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("-%ld"), a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerUUIDToRequest, 0);
}

void __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _PXAssetAnalyzerRequest *v5;
  _PXAssetAnalyzerRequest *v6;
  _QWORD v7[4];
  _PXAssetAnalyzerRequest *v8;
  id v9;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyForAssetUUID:forWorkerType:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v4);
  v5 = (_PXAssetAnalyzerRequest *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "canAnalyzeAsset:forWorkerType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
      v6 = -[_PXAssetAnalyzerRequest initWithAsset:workerType:]([_PXAssetAnalyzerRequest alloc], "initWithAsset:workerType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, v4);
      objc_initWeak(&location, *(id *)(a1 + 32));
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke_2;
      v7[3] = &unk_1E5147388;
      objc_copyWeak(&v9, &location);
      v5 = v6;
      v8 = v5;
      -[_PXAssetAnalyzerRequest runWithResultHandler:](v5, "runWithResultHandler:", v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      v5 = 0;
    }
  }

}

void __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleResultForRequest:success:", *(_QWORD *)(a1 + 32), a2);

}

@end
