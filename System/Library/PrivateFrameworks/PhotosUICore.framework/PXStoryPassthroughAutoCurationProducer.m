@implementation PXStoryPassthroughAutoCurationProducer

- (PXStoryPassthroughAutoCurationProducer)init
{
  PXStoryPassthroughAutoCurationProducer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryPassthroughAutoCurationProducer;
  result = -[PXStoryPassthroughAutoCurationProducer init](&v3, sel_init);
  if (result)
    result->_availableLengths = 0;
  return result;
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  void (**v7)(id, PXStoryProducerResult *);
  PXStoryCurationLengthInfo *v8;
  PXStoryProducerResult *v9;

  v7 = (void (**)(id, PXStoryProducerResult *))a6;
  v8 = -[PXStoryCurationLengthInfo initWithAvailableLengths:defaultLength:]([PXStoryCurationLengthInfo alloc], "initWithAvailableLengths:defaultLength:", -[PXStoryPassthroughAutoCurationProducer availableLengths](self, "availableLengths"), 0);
  v9 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v8);
  v7[2](v7, v9);

  return 0;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  void (**v6)(id, PXStoryProducerResult *);
  void *v7;
  PXStoryProducerResult *v8;
  void *v9;
  PXStoryProducerResult *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PXStoryProducerResult *v18;
  uint64_t v20;

  v6 = (void (**)(id, PXStoryProducerResult *))a5;
  -[PXStoryPassthroughAutoCurationProducer assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [PXStoryProducerResult alloc];
    -[PXStoryPassthroughAutoCurationProducer assets](self, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXStoryProducerResult initWithObject:](v8, "initWithObject:", v9);
    v6[2](v6, v10);

  }
  else
  {
    PLStoryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "requestCuratedAssetsWithOptions is not supported.", (uint8_t *)&v20, 2u);
    }

    PXStoryErrorCreateWithCodeDebugFormat(16, CFSTR("Target Duration Curation Not Supported"), v12, v13, v14, v15, v16, v17, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
    -[PXStoryProducerResult error:](v10, "error:", v9);
    v18 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v18);

  }
  return 0;
}

- (unint64_t)availableLengths
{
  return self->_availableLengths;
}

- (void)setAvailableLengths:(unint64_t)a3
{
  self->_availableLengths = a3;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
