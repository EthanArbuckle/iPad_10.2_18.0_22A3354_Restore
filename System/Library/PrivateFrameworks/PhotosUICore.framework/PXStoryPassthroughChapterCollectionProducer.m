@implementation PXStoryPassthroughChapterCollectionProducer

- (PXStoryPassthroughChapterCollectionProducer)init
{
  return -[PXStoryPassthroughChapterCollectionProducer initWithChapterCollectionManager:](self, "initWithChapterCollectionManager:", 0);
}

- (PXStoryPassthroughChapterCollectionProducer)initWithChapterCollectionManager:(id)a3
{
  id v5;
  PXStoryPassthroughChapterCollectionProducer *v6;
  PXStoryPassthroughChapterCollectionProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughChapterCollectionProducer;
  v6 = -[PXStoryPassthroughChapterCollectionProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_chapterCollectionManager, a3);

  return v7;
}

- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v8;
  PXStoryProducerResult *v9;
  void *v10;
  PXStoryProducerResult *v11;

  v8 = a6;
  v9 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughChapterCollectionProducer chapterCollectionManager](self, "chapterCollectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryProducerResult initWithObject:](v9, "initWithObject:", v10);
  (*((void (**)(id, PXStoryProducerResult *))a6 + 2))(v8, v11);

  return 0;
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterCollectionManager, 0);
}

@end
