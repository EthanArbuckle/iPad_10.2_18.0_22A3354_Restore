@implementation PXStoryPassthroughAssetsProducer

- (PXStoryPassthroughAssetsProducer)init
{
  return -[PXStoryPassthroughAssetsProducer initWithAssetsDataSourceManager:](self, "initWithAssetsDataSourceManager:", 0);
}

- (PXStoryPassthroughAssetsProducer)initWithAssetsDataSourceManager:(id)a3
{
  id v5;
  PXStoryPassthroughAssetsProducer *v6;
  PXStoryPassthroughAssetsProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughAssetsProducer;
  v6 = -[PXStoryPassthroughAssetsProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetsDataSourceManager, a3);

  return v7;
}

- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5
{
  id v7;
  PXStoryProducerResult *v8;
  void *v9;
  PXStoryProducerResult *v10;

  v7 = a5;
  v8 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughAssetsProducer assetsDataSourceManager](self, "assetsDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryProducerResult initWithObject:](v8, "initWithObject:", v9);
  (*((void (**)(id, PXStoryProducerResult *))a5 + 2))(v7, v10);

  return 0;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

@end
