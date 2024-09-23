@implementation IdentityPortraitCell

- (IdentityPortraitCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  IdentityPortraitCell *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IdentityPortraitCell;
  v4 = -[IdentityPortraitCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IdentityPortraitCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[IdentityPortraitCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 2);
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);
    objc_msgSend(v7, "setCornerRadius:", 40.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v7, "setBorderWidth:", PKUIPixelLength() * 3.0);
    objc_msgSend(v6, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IdentityPortraitCell;
  -[IdentityPortraitCell layoutSubviews](&v4, sel_layoutSubviews);
  -[IdentityPortraitCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IdentityPortraitCell bounds](self, "bounds");
  PKRectCenteredIntegralRect();
  objc_msgSend(v3, "setFrame:");

}

@end
