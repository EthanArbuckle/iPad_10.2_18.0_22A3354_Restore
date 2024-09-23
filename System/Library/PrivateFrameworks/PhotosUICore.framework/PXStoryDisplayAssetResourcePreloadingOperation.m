@implementation PXStoryDisplayAssetResourcePreloadingOperation

- (PXStoryDisplayAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  PXStoryDisplayAssetResourcePreloadingOperation *v10;
  PXStoryDisplayAssetResourcePreloadingOperation *v11;
  uint64_t v12;
  PXDisplayAsset *displayAsset;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
  v10 = -[PXAsyncOperation init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resource, a3);
    objc_storeStrong((id *)&v11->_mediaProvider, a4);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PXStoryDisplayAssetResourcePreloadingOperation.m"), 33, CFSTR("Only resources that have px_storyResourceDisplayAsset property (like PXStoryDisplayAssetResource, PXStoryFrameFillingEffectResource) are supported"));

      abort();
    }
    objc_msgSend(v8, "px_storyResourceDisplayAsset");
    v12 = objc_claimAutoreleasedReturnValue();
    displayAsset = v11->_displayAsset;
    v11->_displayAsset = (PXDisplayAsset *)v12;

  }
  return v11;
}

- (PXStoryDisplayAssetResourcePreloadingOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDisplayAssetResourcePreloadingOperation.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryDisplayAssetResourcePreloadingOperation init]");

  abort();
}

- (void)px_start
{
  -[PXStoryDisplayAssetResourcePreloadingOperation setStartTime:](self, "setStartTime:", (double)mach_absolute_time());
}

- (void)px_finishIfPossible
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  objc_super v12;
  _QWORD block[5];

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "simulateSlowResourcesBuffering")
    && (-[PXStoryDisplayAssetResourcePreloadingOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v3, "simulatedSlowResourcesBufferingDelay");
    v4 = v5;
  }
  if (objc_msgSend(v3, "exaggerateResourceDownloadTimes"))
  {
    -[PXStoryDisplayAssetResourcePreloadingOperation startTime](self, "startTime");
    if (v6 > 0.0 && (-[PXStoryDisplayAssetResourcePreloadingOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      v7 = (double)mach_absolute_time();
      -[PXStoryDisplayAssetResourcePreloadingOperation startTime](self, "startTime");
      v9 = (double)(uint64_t)(v7 - v8);
      PXTimebaseConversionFactor();
      if (v10 * v9 > 0.1)
        v4 = v4 + 15.0;
    }
  }
  if (v4 <= 0.0)
  {
    v12.receiver = self;
    v12.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
    -[PXAsyncOperation px_finishIfPossible](&v12, sel_px_finishIfPossible);
  }
  else
  {
    v11 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PXStoryDisplayAssetResourcePreloadingOperation_px_finishIfPossible__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  }

}

- (PXStoryResource)resource
{
  return self->_resource;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

id __69__PXStoryDisplayAssetResourcePreloadingOperation_px_finishIfPossible__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
  return objc_msgSendSuper2(&v2, sel_px_finishIfPossible);
}

@end
