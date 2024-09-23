@implementation SFMagicHeadShadowView

- (SFMagicHeadShadowView)initWithFrame:(CGRect)a3
{
  SFMagicHeadShadowView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFMagicHeadShadowView;
  v3 = -[SFMagicHeadShadowView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadShadowView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SFMagicHeadShadowView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.07);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setShadowRadius:", 12.0);
  }
  return v3;
}

- (void)setVisible:(BOOL)a3
{
  float v3;
  double v4;
  id v5;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    if (a3)
      v3 = *(float *)"333?";
    else
      v3 = 0.0;
    -[SFMagicHeadShadowView layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v4 = v3;
    objc_msgSend(v5, "setShadowOpacity:", v4);

  }
}

- (BOOL)visible
{
  return self->_visible;
}

@end
