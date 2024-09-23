@implementation PXStoryDefaultChapterCollectionProducerFactory

- (id)chapterCollectionProducerForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXStoryMemoryChapterCollectionProducer *v8;
  PXStoryDummyCountChapterCollectionProducer *v9;
  void *v10;

  v3 = a3;
  if ((objc_msgSend(v3, "options") & 2) != 0)
    goto LABEL_14;
  objc_msgSend(v3, "storyQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryChapterSettings sharedInstance](PXStoryChapterSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "chapterCollectionProducerKind");
  switch(v6)
  {
    case 3:
      v9 = -[PXStoryDummyCountChapterCollectionProducer initWithCountInterval:storyQueue:]([PXStoryDummyCountChapterCollectionProducer alloc], "initWithCountInterval:storyQueue:", objc_msgSend(v5, "dummyChaptersCountInterval"), v4);
LABEL_9:
      v8 = (PXStoryMemoryChapterCollectionProducer *)v9;
      break;
    case 2:
      v9 = -[PXStoryDummyDailyChapterCollectionProducer initWithDayInterval:storyQueue:]([PXStoryDummyDailyChapterCollectionProducer alloc], "initWithDayInterval:storyQueue:", objc_msgSend(v5, "dummyChaptersDayInterval"), v4);
      goto LABEL_9;
    case 1:
      objc_msgSend(v3, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = -[PXStoryMemoryChapterCollectionProducer initWithMemory:storyQueue:]([PXStoryMemoryChapterCollectionProducer alloc], "initWithMemory:storyQueue:", v7, v4);
      else
        v8 = 0;

      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(v3, "errorReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransientChapterCollectionProducer setErrorReporter:](v8, "setErrorReporter:", v10);

  if (!v8)
LABEL_14:
    v8 = objc_alloc_init(PXStoryPassthroughChapterCollectionProducer);

  return v8;
}

@end
