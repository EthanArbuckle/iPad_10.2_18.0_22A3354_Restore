@implementation PXStoryChapteredComposabilityResults

- (PXStoryChapteredComposabilityResults)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapteredComposabilityResults.m"), 26, CFSTR("%s is not available as initializer"), "-[PXStoryChapteredComposabilityResults init]");

  abort();
}

- (PXStoryChapteredComposabilityResults)initWithDisplayAssets:(id)a3 originalResults:(id)a4 chapterCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStoryChapteredComposabilityResults *v12;
  PXStoryChapteredComposabilityResults *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryChapteredComposabilityResults;
  v12 = -[PXStoryChapteredComposabilityResults init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayAssets, a3);
    objc_storeStrong((id *)&v13->_originalResults, a4);
    objc_storeStrong((id *)&v13->_chapterCollection, a5);
  }

  return v13;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PXStoryChapteredComposabilityResults originalResults](self, "originalResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t (**v10)(void *, unint64_t);
  float v11;
  float v12;
  _QWORD aBlock[5];
  $94F468A8D4C62B317260615823C2B210 result;

  -[PXStoryChapteredComposabilityResults originalResults](self, "originalResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composabilityScoresAtIndex:", a3);
  v7 = v6;
  v9 = v8;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryChapteredComposabilityResults_composabilityScoresAtIndex___block_invoke;
  aBlock[3] = &unk_1E513BF38;
  aBlock[4] = self;
  v10 = (uint64_t (**)(void *, unint64_t))_Block_copy(aBlock);
  if ((v10[2](v10, a3 - 1) & 1) != 0 || v10[2](v10, a3))
  {
    v9 = 0.0;
    v7 = 0.0;
  }
  if (v10[2](v10, a3 + 1))
    v9 = 0.0;

  v11 = v7;
  v12 = v9;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (PXStoryComposabilityResults)originalResults
{
  return self->_originalResults;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_originalResults, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

uint64_t __67__PXStoryChapteredComposabilityResults_composabilityScoresAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (a2 < -1)
    return 0;
  v3 = a2 + 1;
  objc_msgSend(*(id *)(a1 + 32), "displayAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "chapterCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsChapterBeginningWithAsset:", v8);

  return v9;
}

@end
