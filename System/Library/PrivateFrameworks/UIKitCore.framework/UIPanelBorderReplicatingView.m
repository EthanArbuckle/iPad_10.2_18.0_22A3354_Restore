@implementation UIPanelBorderReplicatingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIPanelBorderReplicatingView)initWithFrame:(CGRect)a3 replicaOffset:(double)a4
{
  UIPanelBorderReplicatingView *v5;
  UIPanelBorderReplicatingView *v6;
  void *v7;
  CATransform3D v9;
  CATransform3D v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIPanelBorderReplicatingView;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInstanceCount:", 2);
    CATransform3DMakeTranslation(&v10, a4, 0.0, 0.0);
    v9 = v10;
    objc_msgSend(v7, "setInstanceTransform:", &v9);

  }
  return v6;
}

@end
