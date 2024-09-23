@implementation NCMaterialCrossFadingView

- (NCMaterialCrossFadingView)init
{
  NCMaterialCrossFadingView *v2;
  NCMaterialCrossFadingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCMaterialCrossFadingView;
  v2 = -[NCMaterialCrossFadingView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NCMaterialCrossFadingView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsInPlaceFiltering:", 1);

  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
