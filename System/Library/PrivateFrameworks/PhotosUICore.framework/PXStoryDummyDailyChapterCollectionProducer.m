@implementation PXStoryDummyDailyChapterCollectionProducer

- (PXStoryDummyDailyChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  return -[PXStoryDummyDailyChapterCollectionProducer initWithDayInterval:storyQueue:](self, "initWithDayInterval:storyQueue:", 1, a3);
}

- (PXStoryDummyDailyChapterCollectionProducer)initWithDayInterval:(int64_t)a3 storyQueue:(id)a4
{
  PXStoryDummyDailyChapterCollectionProducer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummyDailyChapterCollectionProducer;
  result = -[PXStoryTransientChapterCollectionProducer initWithStoryQueue:](&v6, sel_initWithStoryQueue_, a4);
  if (result)
    result->_dayInterval = a3;
  return result;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  PXStoryTimeBasedChapterCollection *v18;
  id v19;
  id v20;
  PXStoryTimeBasedChapterCollection *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  double v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 < 1)
  {
    v11 = 0;
    v10 = 0;
  }
  else
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localCreationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!v10 || objc_msgSend(v10, "compare:", v14) == 1)
        {
          v15 = v14;

          v10 = v15;
        }
        if (!v11 || objc_msgSend(v11, "compare:", v14) == -1)
        {
          v16 = v14;

          v11 = v16;
        }
      }

    }
  }
  v17 = (double)(86400 * -[PXStoryDummyDailyChapterCollectionProducer dayInterval](self, "dayInterval"));
  v18 = [PXStoryTimeBasedChapterCollection alloc];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke;
  v23[3] = &unk_1E5130970;
  v24 = v10;
  v25 = v11;
  v26 = v17;
  v19 = v11;
  v20 = v10;
  v21 = -[PXStoryTimeBasedChapterCollection initWithAssets:keyAsset:configuration:](v18, "initWithAssets:keyAsset:configuration:", v6, v7, v23);

  return v21;
}

- (int64_t)dayInterval
{
  return self->_dayInterval;
}

void __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    v16 = v3;
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("MMM d, yyyy"));
    +[PXStoryChapterSettings sharedInstance](PXStoryChapterSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "dummyChaptersIncludeSubtitles");

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996D8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

    objc_msgSend(v7, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v9);

    objc_msgSend(v16, "setUsesAssetLocalCreationDates:", 1);
    objc_msgSend(v7, "startOfDayForDate:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40)) == 1)
    {
      v11 = v10;
    }
    else
    {
      v12 = 0;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v10, *(double *)(a1 + 48) + -1.0);
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2;
        v17[3] = &unk_1E5130948;
        v18 = v4;
        v19 = v14;
        v21 = v6;
        v20 = v12;
        v15 = v14;
        objc_msgSend(v16, "addChapterWithDateInterval:configuration:", v15, v17);
        ++v12;

        objc_msgSend(v10, "dateByAddingTimeInterval:", *(double *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v11;
      }
      while (objc_msgSend(v11, "compare:", *(_QWORD *)(a1 + 40)) != 1);
    }

    v3 = v16;
  }

}

void __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedTitle:", v5);

  if (*(_BYTE *)(a1 + 56))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Chapter %ti"), *(_QWORD *)(a1 + 48) + 1);
    objc_msgSend(v7, "setLocalizedSubtitle:", v6);

  }
}

@end
