@implementation TUIContainerLayerConfig

- (TUIContainerLayerConfig)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  TUIContainerLayerConfig *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TUIContainerLayerConfig;
  result = -[TUIContainerLayerConfig init](&v6, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
  }
  return result;
}

- (void)configureLayer:(id)a3
{
  id v5;

  if (self->_size.width != CGSizeZero.width || self->_size.height != CGSizeZero.height)
  {
    v5 = a3;
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, self->_size.width, self->_size.height);

  }
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
  objc_msgSend(a4, "setSublayers:", a3);
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  TUIContainerLayerConfig *v7;

  v4 = a3;
  v5 = objc_opt_class(TUIContainerLayerConfig);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (TUIContainerLayerConfig *)objc_claimAutoreleasedReturnValue(v6);

  return v7 == self;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

@end
