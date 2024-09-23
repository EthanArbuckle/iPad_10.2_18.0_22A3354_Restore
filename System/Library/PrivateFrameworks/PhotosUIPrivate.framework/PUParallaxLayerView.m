@implementation PUParallaxLayerView

- (void)layoutWithInfo:(id)a3
{
  id v3;
  objc_class *v4;
  PUParallaxLayerView *v5;
  SEL v6;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (PUParallaxLayerView *)_PFAssertFailHandler();
  -[PUParallaxLayerView parallaxLayer](v5, v6);
}

- (PFParallaxLayer)parallaxLayer
{
  objc_class *v2;
  PUParallaxLayerView *v3;
  SEL v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PUParallaxLayerView *)_PFAssertFailHandler();
  return (PFParallaxLayer *)-[PUParallaxLayerView currentLayoutInfo](v3, v4);
}

- (PUParallaxLayerLayoutInfo)currentLayoutInfo
{
  objc_class *v2;
  PUParallaxLayerView *v3;
  SEL v4;
  id v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PUParallaxLayerView *)_PFAssertFailHandler();
  return (PUParallaxLayerLayoutInfo *)-[PUParallaxLayerView _shouldAnimatePropertyWithKey:](v3, v4, v5);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUParallaxLayerView;
    v5 = -[PUParallaxLayerView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

@end
