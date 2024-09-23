@implementation SPUIPlatterShadowView

- (SPUIPlatterShadowView)init
{
  SPUIPlatterShadowView *v2;
  SPUIPlatterShadowView *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPUIPlatterShadowView;
  v2 = -[SPUIPlatterShadowView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUIPlatterShadowView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 0.5;
    objc_msgSend(v4, "setShadowOpacity:", v5);
    objc_msgSend(v4, "setShadowRadius:", 20.0);
    objc_msgSend(v4, "setShadowOffset:", 0.0, 10.0);
    objc_msgSend(v4, "setCornerRadius:", 20.0);
    objc_msgSend(v4, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    -[SPUIPlatterShadowView effectiveScreenScale](v3, "effectiveScreenScale");
    objc_msgSend(v4, "setContentsScale:");
    objc_msgSend(v4, "setShadowPathIsBounds:", 1);

  }
  return v3;
}

@end
