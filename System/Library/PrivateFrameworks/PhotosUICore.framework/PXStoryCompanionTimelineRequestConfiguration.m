@implementation PXStoryCompanionTimelineRequestConfiguration

- (PXStoryCompanionTimelineRequestConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryCompanionTimelineRequestConfiguration.m"), 17, CFSTR("%s is not available as initializer"), "-[PXStoryCompanionTimelineRequestConfiguration init]");

  abort();
}

- (PXStoryCompanionTimelineRequestConfiguration)initWithAssetCollection:(id)a3 viewportSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  PXStoryCompanionTimelineRequestConfiguration *v9;
  PXStoryCompanionTimelineRequestConfiguration *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryCompanionTimelineRequestConfiguration;
  v9 = -[PXStoryCompanionTimelineRequestConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    v10->_viewportSize.width = width;
    v10->_viewportSize.height = height;
    objc_storeStrong((id *)&v10->_queue, MEMORY[0x1E0C80D38]);
    v10->_songsProducerKind = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXStoryCompanionTimelineRequestConfiguration assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryCompanionTimelineRequestConfiguration viewportSize](self, "viewportSize");
  v6 = (void *)objc_msgSend(v4, "initWithAssetCollection:viewportSize:", v5);

  -[PXStoryCompanionTimelineRequestConfiguration queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueue:", v7);

  objc_msgSend(v6, "setSongsProducerKind:", -[PXStoryCompanionTimelineRequestConfiguration songsProducerKind](self, "songsProducerKind"));
  return v6;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

@end
