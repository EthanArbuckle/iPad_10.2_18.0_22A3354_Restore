@implementation SBSceneSnapshotDataProvider

- (SBSceneSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4
{
  id v8;
  SBSceneSnapshotDataProvider *v9;
  SBSceneSnapshotDataProvider *v10;
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
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSnapshotDataProvider.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  v22.receiver = self;
  v22.super_class = (Class)SBSceneSnapshotDataProvider;
  v9 = -[SBSceneSnapshotDataProvider init](&v22, sel_init);
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
  SBSceneSnapshotDataProvider *v6;
  IOSurface *processedSurface;
  uint64_t v8;
  IOSurface *v9;
  IOSurface *v10;

  -[FBSceneSnapshot IOSurface](self->_snapshot, "IOSurface");
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

- (id)fallbackSnapshotDataProvider
{
  SBFallbackSnapshotDataProvider *fallbackSnapshotDataProvider;
  SBFallbackSnapshotDataProvider *v4;
  SBFallbackSnapshotDataProvider *v5;

  fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  if (!fallbackSnapshotDataProvider)
  {
    v4 = -[SBFallbackSnapshotDataProvider initWithSceneSnapshot:scaleFactor:]([SBFallbackSnapshotDataProvider alloc], "initWithSceneSnapshot:scaleFactor:", self->_snapshot, self->_scaleFactor);
    v5 = self->_fallbackSnapshotDataProvider;
    self->_fallbackSnapshotDataProvider = v4;

    fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  }
  return fallbackSnapshotDataProvider;
}

- (BOOL)hasProtectedContent
{
  FBSceneSnapshot *snapshot;
  BOOL result;

  snapshot = self->_snapshot;
  if (!snapshot)
    return self->_hasProtectedContent;
  result = -[FBSceneSnapshot hasProtectedContent](snapshot, "hasProtectedContent");
  self->_hasProtectedContent = result;
  return result;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  UIImage *cachedImage;
  void *v6;
  int v7;
  double v8;
  UIImage *v9;
  UIImage *v10;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  double scaleFactor;
  uint64_t v32;
  CGAffineTransform v33;
  _BYTE v34[52];
  uint64_t v35;
  CGSize v36;
  NSSize v37;
  CGRect v38;

  v35 = *MEMORY[0x1E0C80C00];
  cachedImage = self->_cachedImage;
  if (!cachedImage)
  {
    -[SBSceneSnapshotDataProvider IOSurfaceForFormat:](self, "IOSurfaceForFormat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SBSceneSnapshotDataProvider hasProtectedContent](self, "hasProtectedContent");
      -[XBSnapshotDataProviderContext scale](self->_context, "scale");
      SBCreateUIImageFromIOSurfaceResizingIfNecessary(v6, 0, v7, -[XBSnapshotDataProviderContext isOpaque](self->_context, "isOpaque"), (unint64_t)(a3 - 1) < 2, v8, 1.0);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CEA638];
      v13 = -[FBSceneSnapshot CGImage](self->_snapshot, "CGImage");
      -[XBSnapshotDataProviderContext scale](self->_context, "scale");
      objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v13, 0);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (v9 && (BSFloatIsOne() & 1) == 0)
      {
        memset(&v33, 0, sizeof(v33));
        CGAffineTransformMakeScale(&v33, self->_scaleFactor, self->_scaleFactor);
        -[UIImage size](v9, "size");
        BSRectWithSize();
        *(CGAffineTransform *)v34 = v33;
        CGRectApplyAffineTransform(v38, (CGAffineTransform *)v34);
        -[XBSnapshotDataProviderContext scale](self->_context, "scale");
        UIRectIntegralWithScale();
        v17 = v16;
        v19 = v18;
        v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (*MEMORY[0x1E0C9D820] == v14 && v20 == v15)
        {
          SBLogSceneSnapshots();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            -[SBSnapshotDataProviderContext sceneID](self->_context, "sceneID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIImage size](v9, "size");
            NSStringFromSize(v37);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            scaleFactor = self->_scaleFactor;
            -[XBSnapshotDataProviderContext scale](self->_context, "scale");
            *(_DWORD *)v34 = 138544386;
            *(_QWORD *)&v34[4] = v29;
            *(_WORD *)&v34[12] = 2048;
            *(_QWORD *)&v34[14] = v9;
            *(_WORD *)&v34[22] = 2114;
            *(_QWORD *)&v34[24] = v30;
            *(_WORD *)&v34[32] = 2048;
            *(double *)&v34[34] = scaleFactor;
            *(_WORD *)&v34[42] = 2048;
            *(_QWORD *)&v34[44] = v32;
            _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Can't create 0-size image for '%{public}@' (image %p, %{public}@, scaleFactor %f, context scale %f) ", v34, 0x34u);

          }
          v9 = 0;
        }
        else
        {
          v22 = v14;
          v23 = v15;
          v24 = -[XBSnapshotDataProviderContext isOpaque](self->_context, "isOpaque", *MEMORY[0x1E0C9D820], v20);
          -[XBSnapshotDataProviderContext scale](self->_context, "scale");
          v26 = v25;
          v36.width = v22;
          v36.height = v23;
          UIGraphicsBeginImageContextWithOptions(v36, v24, v26);
          -[UIImage drawInRect:](v9, "drawInRect:", v17, v19, v22, v23);
          UIGraphicsGetImageFromCurrentImageContext();
          v27 = objc_claimAutoreleasedReturnValue();

          UIGraphicsEndImageContext();
          v9 = (UIImage *)v27;
        }
      }
    }
    v10 = self->_cachedImage;
    self->_cachedImage = v9;

    -[SBSceneSnapshotDataProvider _invalidateSnapshotData](self, "_invalidateSnapshotData");
    cachedImage = self->_cachedImage;
  }
  return cachedImage;
}

- (void)_invalidateSnapshotData
{
  IOSurface *processedSurface;
  FBSceneSnapshot *snapshot;
  SBSnapshotDataProviderContext *context;
  SBFallbackSnapshotDataProvider *fallbackSnapshotDataProvider;

  processedSurface = self->_processedSurface;
  self->_processedSurface = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;

  context = self->_context;
  self->_context = 0;

  fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  self->_fallbackSnapshotDataProvider = 0;

}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedSurface, 0);
  objc_storeStrong((id *)&self->_fallbackSnapshotDataProvider, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
