@implementation PXGVideoPlayerViewConfiguration

- (PXGVideoPlayerViewConfiguration)initWithVideoSession:(id)a3 toneMapToStandardDynamicRange:(BOOL)a4
{
  id v7;
  PXGVideoPlayerViewConfiguration *v8;
  PXGVideoPlayerViewConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGVideoPlayerViewConfiguration;
  v8 = -[PXGVideoPlayerViewConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_videoSession, a3);
    v9->_toneMapToStandardDynamicRange = a4;
  }

  return v9;
}

- (PXGVideoPlayerViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGVideoPlayerView.m"), 92, CFSTR("%s is not available as initializer"), "-[PXGVideoPlayerViewConfiguration init]");

  abort();
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSession, 0);
}

@end
