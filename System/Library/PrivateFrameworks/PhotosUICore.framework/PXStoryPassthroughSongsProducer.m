@implementation PXStoryPassthroughSongsProducer

- (PXStoryPassthroughSongsProducer)init
{
  return -[PXStoryPassthroughSongsProducer initWithSongs:](self, "initWithSongs:", 0);
}

- (PXStoryPassthroughSongsProducer)initWithSongs:(id)a3
{
  id v4;
  PXStorySongsConfiguration *v5;
  PXStoryPassthroughSongsProducer *v6;

  v4 = a3;
  v5 = -[PXStorySongsConfiguration initWithCuratedAudioAssets:]([PXStorySongsConfiguration alloc], "initWithCuratedAudioAssets:", v4);

  v6 = -[PXStoryPassthroughSongsProducer initWithSongsConfiguration:](self, "initWithSongsConfiguration:", v5);
  return v6;
}

- (PXStoryPassthroughSongsProducer)initWithSongsConfiguration:(id)a3
{
  id v5;
  PXStoryPassthroughSongsProducer *v6;
  PXStoryPassthroughSongsProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughSongsProducer;
  v6 = -[PXStoryPassthroughSongsProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_songsConfiguration, a3);

  return v7;
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6;
  PXStoryProducerResult *v7;
  void *v8;
  PXStoryProducerResult *v9;

  v6 = a4;
  v7 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughSongsProducer songsConfiguration](self, "songsConfiguration");
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

- (PXStorySongsConfiguration)songsConfiguration
{
  return self->_songsConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songsConfiguration, 0);
}

@end
