@implementation SFMagicHeadCircleView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFMagicHeadCircleView)initWithFrame:(CGRect)a3
{
  SFMagicHeadCircleView *v3;
  SFMagicHeadCircleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadCircleView;
  v3 = -[SFMagicHeadCircleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFMagicHeadCircleView update](v3, "update");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadCircleView;
  -[SFMagicHeadCircleView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFMagicHeadCircleView update](self, "update");
}

- (void)update
{
  void *v3;
  id v4;
  id v5;
  id v6;
  CGRect v7;

  -[SFMagicHeadCircleView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadCircleView frame](self, "frame");
  objc_msgSend(v6, "setCornerRadius:", CGRectGetWidth(v7) * 0.5);
  v3 = (void *)MEMORY[0x24BEBD420];
  -[SFMagicHeadCircleView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setPath:", objc_msgSend(v4, "CGPath"));

  objc_msgSend(v6, "setMasksToBounds:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v5, "CGColor"));

}

@end
