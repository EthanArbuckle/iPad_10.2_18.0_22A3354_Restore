@implementation PXStoryDummyCountChapterCollectionProducer

- (PXStoryDummyCountChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  return -[PXStoryDummyCountChapterCollectionProducer initWithCountInterval:storyQueue:](self, "initWithCountInterval:storyQueue:", 1, a3);
}

- (PXStoryDummyCountChapterCollectionProducer)initWithCountInterval:(int64_t)a3 storyQueue:(id)a4
{
  PXStoryDummyCountChapterCollectionProducer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummyCountChapterCollectionProducer;
  result = -[PXStoryTransientChapterCollectionProducer initWithStoryQueue:](&v6, sel_initWithStoryQueue_, a4);
  if (result)
    result->_countInterval = a3;
  return result;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  char v9;
  PXStoryExplicitChapterCollection *v10;
  PXStoryExplicitChapterCollection *v11;
  _QWORD v13[6];
  char v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = -[PXStoryDummyCountChapterCollectionProducer countInterval](self, "countInterval");
  +[PXStoryChapterSettings sharedInstance](PXStoryChapterSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dummyChaptersIncludeSubtitles");

  v10 = [PXStoryExplicitChapterCollection alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke;
  v13[3] = &__block_descriptor_49_e51_v16__0___PXStoryMutableExplicitChapterCollection__8l;
  v13[4] = v6;
  v13[5] = v7;
  v14 = v9;
  v11 = -[PXStoryExplicitChapterCollection initWithAssets:configuration:](v10, "initWithAssets:configuration:", v5, v13);

  return v11;
}

- (int64_t)countInterval
{
  return self->_countInterval;
}

uint64_t __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 32);
  if (v2 >= 2)
  {
    v4 = result;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)(result + 40);
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = v2 - v6;
      if (v7 >= v9)
        v10 = v9;
      else
        v10 = v7;
      LOBYTE(v11) = *(_BYTE *)(v4 + 48);
      result = objc_msgSend(a2, "addChapterWithAssetRange:configuration:", v6, v8, 3221225472, __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2, &__block_descriptor_57_e33_v16__0___PXStoryMutableChapter__8l, v5++, v6, v10, v11);
      v2 = *(_QWORD *)(v4 + 32);
      v7 = *(_QWORD *)(v4 + 40);
      v6 += v7;
    }
    while (v6 < v2 - 1);
  }
  return result;
}

void __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Chapter %ti"), *(_QWORD *)(a1 + 32) + 1);
  objc_msgSend(v5, "setLocalizedTitle:", v3);

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Assets %ti - %ti"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 48) - 1);
    objc_msgSend(v5, "setLocalizedSubtitle:", v4);

  }
}

@end
