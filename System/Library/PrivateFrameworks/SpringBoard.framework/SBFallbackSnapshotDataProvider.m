@implementation SBFallbackSnapshotDataProvider

- (SBFallbackSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4
{
  id v8;
  SBFallbackSnapshotDataProvider *v9;
  SBFallbackSnapshotDataProvider *v10;
  SBSnapshotDataProviderContext *v11;
  SBSnapshotDataProviderContext *context;
  SBSnapshotDataProviderContext *v13;
  void *v14;
  void *v15;
  SBSnapshotDataProviderContext *v16;
  void *v17;
  SBSnapshotDataProviderContext *v18;
  void *v19;
  void *v21;
  objc_super v22;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSnapshotDataProvider.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  v22.receiver = self;
  v22.super_class = (Class)SBFallbackSnapshotDataProvider;
  v9 = -[SBFallbackSnapshotDataProvider init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_scaleFactor = a4;
    objc_storeStrong((id *)&v9->_snapshot, a3);
    v11 = objc_alloc_init(SBSnapshotDataProviderContext);
    context = v10->_context;
    v10->_context = v11;

    v13 = v10->_context;
    objc_msgSend(v8, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSnapshotDataProviderContext setSceneID:](v13, "setSceneID:", v15);

    v16 = v10->_context;
    objc_msgSend(v8, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    -[XBSnapshotDataProviderContext setScale:](v16, "setScale:");

    v18 = v10->_context;
    objc_msgSend(v8, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBSnapshotDataProviderContext setOpaque:](v18, "setOpaque:", objc_msgSend(v19, "isOpaque"));

  }
  return v10;
}

- (id)IOSurfaceForFormat:(int64_t)a3
{
  void *v5;
  SBFallbackSnapshotDataProvider *v6;
  IOSurface *processedSurface;
  uint64_t v8;
  IOSurface *v9;
  IOSurface *v10;

  -[FBSceneSnapshot fallbackIOSurface](self->_snapshot, "fallbackIOSurface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  if (v5 && (BSFloatIsOne() & 1) == 0)
  {
    processedSurface = v6->_processedSurface;
    if (!processedSurface)
    {
      SBCreateScaledIOSurface(v5, (unint64_t)(a3 - 1) < 2, v6->_scaleFactor);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v6->_processedSurface;
      v6->_processedSurface = (IOSurface *)v8;

      processedSurface = v6->_processedSurface;
    }
    v10 = processedSurface;

    v5 = v10;
  }
  objc_sync_exit(v6);

  return v5;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  UIImage *cachedImage;
  UIImage *v6;
  UIImage *v7;
  double v8;
  UIImage *v9;

  cachedImage = self->_cachedImage;
  if (!cachedImage)
  {
    -[SBFallbackSnapshotDataProvider IOSurfaceForFormat:](self, "IOSurfaceForFormat:");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[XBSnapshotDataProviderContext scale](self->_context, "scale");
      SBCreateUIImageFromIOSurfaceResizingIfNecessary(v7, 0, 0, -[XBSnapshotDataProviderContext isOpaque](self->_context, "isOpaque"), (unint64_t)(a3 - 1) < 2, v8, 1.0);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_cachedImage;
    self->_cachedImage = v6;

    -[SBFallbackSnapshotDataProvider _invalidateSnapshotData](self, "_invalidateSnapshotData");
    cachedImage = self->_cachedImage;
  }
  return cachedImage;
}

- (void)_invalidateSnapshotData
{
  IOSurface *processedSurface;
  FBSceneSnapshot *snapshot;
  SBSnapshotDataProviderContext *context;

  processedSurface = self->_processedSurface;
  self->_processedSurface = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;

  context = self->_context;
  self->_context = 0;

}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedSurface, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
