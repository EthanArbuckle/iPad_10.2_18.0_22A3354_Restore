@implementation PXVideoContentProvider

- (BOOL)mayContainAudio
{
  return 1;
}

- (void)makeUniqueContentIdentifier
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoContentProvider.m"), 32, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoContentProvider makeUniqueContentIdentifier]", v6);

  abort();
}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoContentProvider.m"), 36, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoContentProvider beginLoadingWithPriority:]", v7);

  abort();
}

- (void)cancelLoading
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoContentProvider.m"), 40, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoContentProvider cancelLoading]", v6);

  abort();
}

- (void)setLoadingProgress:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_loadingProgress = a3;
    -[PXVideoContentProvider signalChange:](self, "signalChange:", 2);
  }
}

- (void)setLoadingResult:(id)a3
{
  PXVideoContentProviderLoadingResult *v5;
  PXVideoContentProviderLoadingResult *v6;

  v5 = (PXVideoContentProviderLoadingResult *)a3;
  if (self->_loadingResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_loadingResult, a3);
    -[PXVideoContentProvider signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (NSDictionary)analyticsPayload
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSNumber)videoAspectRatio
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXVideoContentProvider loadingResult](self, "loadingResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "presentationSize"), (PXSizeIsEmpty() & 1) == 0))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    PXSizeGetAspectRatio();
    objc_msgSend(v5, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (PXVideoContentProviderLoadingResult)loadingResult
{
  return self->_loadingResult;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (void)setVideoAspectRatio:(id)a3
{
  objc_storeStrong((id *)&self->_videoAspectRatio, a3);
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_videoAspectRatio, 0);
  objc_storeStrong((id *)&self->_loadingResult, 0);
}

@end
