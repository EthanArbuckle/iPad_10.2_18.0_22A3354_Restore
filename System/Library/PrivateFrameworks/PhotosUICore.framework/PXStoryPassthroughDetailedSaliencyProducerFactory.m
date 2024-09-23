@implementation PXStoryPassthroughDetailedSaliencyProducerFactory

- (PXStoryPassthroughDetailedSaliencyProducerFactory)init
{
  return -[PXStoryPassthroughDetailedSaliencyProducerFactory initWithDetailedSaliencyProducer:](self, "initWithDetailedSaliencyProducer:", 0);
}

- (PXStoryPassthroughDetailedSaliencyProducerFactory)initWithDetailedSaliencyProducer:(id)a3
{
  id v5;
  PXStoryPassthroughDetailedSaliencyProducerFactory *v6;
  PXStoryPassthroughDetailedSaliencyProducerFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughDetailedSaliencyProducerFactory;
  v6 = -[PXStoryPassthroughDetailedSaliencyProducerFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_detailedSaliencyProducer, a3);

  return v7;
}

- (id)detailedSaliencyProducerForConfiguration:(id)a3
{
  void *v3;
  void *v4;
  PXStoryPassthroughDetailedSaliencyProducer *v5;
  PXStoryPassthroughDetailedSaliencyProducer *v6;

  -[PXStoryPassthroughDetailedSaliencyProducerFactory detailedSaliencyProducer](self, "detailedSaliencyProducer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(PXStoryPassthroughDetailedSaliencyProducer);
  v6 = v5;

  return v6;
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (void)setDetailedSaliencyProducer:(id)a3
{
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, 0);
}

@end
