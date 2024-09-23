@implementation _PXTrimToolPlayerWrapperAVPlayerView

- (_PXTrimToolPlayerWrapperAVPlayerView)initWithPlayer:(id)a3
{
  id v4;
  _PXTrimToolPlayerWrapperAVPlayerView *v5;
  _PXTrimToolPlayerWrapperAVPlayerView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXTrimToolPlayerWrapperAVPlayerView;
  v5 = -[_PXTrimToolPlayerWrapperAVPlayerView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_PXTrimToolPlayerWrapperAVPlayerView playerLayer](v5, "playerLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayer:", v4);

  }
  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
