@implementation VUITimeMetadataFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_34);
  return (id)sharedInstance_sharedInstance_4;
}

void __40__VUITimeMetadataFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = v0;

}

- (VUITimeMetadataFactory)init
{
  VUITimeMetadataFactory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUITimeMetadataFactory;
  v2 = -[VUITimeMetadataFactory init](&v4, sel_init);
  if (v2)
    +[VideosUI initializeUIFactory](_TtC8VideosUI8VideosUI, "initializeUIFactory");
  return v2;
}

- (id)makeViewControllerWithPlaybackInfo:(id)a3
{
  id v4;
  VUITimeMetadataFactory *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = VUITimeMetadataFactory.makeViewController(playbackInfo:)(v4);

  return v6;
}

@end
