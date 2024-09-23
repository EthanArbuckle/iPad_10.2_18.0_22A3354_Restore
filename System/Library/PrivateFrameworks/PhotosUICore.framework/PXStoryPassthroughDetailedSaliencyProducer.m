@implementation PXStoryPassthroughDetailedSaliencyProducer

- (PXStoryPassthroughDetailedSaliencyProducer)init
{
  return -[PXStoryPassthroughDetailedSaliencyProducer initWithDetailedSaliency:](self, "initWithDetailedSaliency:", 0);
}

- (PXStoryPassthroughDetailedSaliencyProducer)initWithDetailedSaliency:(id)a3
{
  id v5;
  PXStoryPassthroughDetailedSaliencyProducer *v6;
  PXStoryPassthroughDetailedSaliencyProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughDetailedSaliencyProducer;
  v6 = -[PXStoryPassthroughDetailedSaliencyProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_detailedSaliency, a3);

  return v7;
}

- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7;
  PXStoryProducerResult *v8;
  void *v9;
  PXStoryProducerResult *v10;

  v7 = a5;
  v8 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughDetailedSaliencyProducer detailedSaliency](self, "detailedSaliency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryProducerResult initWithObject:](v8, "initWithObject:", v9);
  (*((void (**)(id, PXStoryProducerResult *))a5 + 2))(v7, v10);

  return 0;
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
}

@end
