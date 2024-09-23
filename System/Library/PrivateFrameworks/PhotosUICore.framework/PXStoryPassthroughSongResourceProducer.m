@implementation PXStoryPassthroughSongResourceProducer

- (PXStoryPassthroughSongResourceProducer)initWithSongResource:(id)a3
{
  id v5;
  PXStoryPassthroughSongResourceProducer *v6;
  PXStoryPassthroughSongResourceProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughSongResourceProducer;
  v6 = -[PXStoryPassthroughSongResourceProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_songResource, a3);

  return v7;
}

- (PXStoryPassthroughSongResourceProducer)init
{
  return -[PXStoryPassthroughSongResourceProducer initWithSongResource:](self, "initWithSongResource:", 0);
}

- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6;
  PXStoryProducerResult *v7;
  void *v8;
  PXStoryProducerResult *v9;

  v6 = a4;
  v7 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughSongResourceProducer songResource](self, "songResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStoryProducerResult initWithObject:](v7, "initWithObject:", v8);
  (*((void (**)(id, PXStoryProducerResult *))a4 + 2))(v6, v9);

  return 0;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResource, 0);
}

@end
