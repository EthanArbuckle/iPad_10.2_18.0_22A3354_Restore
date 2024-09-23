@implementation PUParallaxVideoLayerContentView

- (PUParallaxVideoLayerContentView)initWithFrame:(CGRect)a3
{
  PUParallaxVideoLayerContentView *v3;
  PUParallaxVideoLayerContentView *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUParallaxVideoLayerContentView;
  v3 = -[PUParallaxVideoLayerContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0C8A6E0];
    -[PUParallaxVideoLayerContentView _playerLayer](v3, "_playerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoGravity:", v5);

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
