@implementation PSUSummarizationPipeline

- (PSUSummarizationPipeline)initWithContactStore:(id)a3
{
  id v4;
  PSUSummarizationPipeline *v5;
  _PSUSummarizationPipeline *v6;
  _PSUSummarizationPipeline *pipeline;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUSummarizationPipeline;
  v5 = -[PSUSummarizationPipeline init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_PSUSummarizationPipeline initWithContactStore:]([_PSUSummarizationPipeline alloc], "initWithContactStore:", v4);
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;

  }
  return v5;
}

- (void)processSearchableItem:(id)a3
{
  -[_PSUSummarizationPipeline processItem:](self->_pipeline, "processItem:", a3);
}

- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  -[_PSUSummarizationPipeline handleDeletionOfItemsWithIdentifiers:bundleIdentifier:](self->_pipeline, "handleDeletionOfItemsWithIdentifiers:bundleIdentifier:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
}

+ (id)sharedPipelineWithContactStore:(id)a3 incomingBundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v5 = a3;
  if (+[_PSUAvailabilityManager areGenerativeModelsAvailableFor:](_PSUAvailabilityManager, "areGenerativeModelsAvailableFor:", a4))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__PSUSummarizationPipeline_sharedPipelineWithContactStore_incomingBundleId___block_invoke;
    block[3] = &unk_2515CA388;
    v6 = v5;
    v11 = v6;
    if (sharedPipelineWithContactStore_incomingBundleId___pasOnceToken2 == -1)
    {
      v7 = v6;
    }
    else
    {
      dispatch_once(&sharedPipelineWithContactStore_incomingBundleId___pasOnceToken2, block);
      v7 = v11;
    }
    v8 = (id)sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __76__PSUSummarizationPipeline_sharedPipelineWithContactStore_incomingBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  PSUSummarizationPipeline *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24952359C]();
  v3 = -[PSUSummarizationPipeline initWithContactStore:]([PSUSummarizationPipeline alloc], "initWithContactStore:", *(_QWORD *)(a1 + 32));
  v4 = (void *)sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult;
  sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

@end
