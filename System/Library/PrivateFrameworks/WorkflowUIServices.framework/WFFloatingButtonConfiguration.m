@implementation WFFloatingButtonConfiguration

- (WFFloatingButtonConfiguration)init
{
  WFFloatingButtonConfiguration *v2;
  WFFloatingButtonConfiguration *v3;
  double v4;
  WFFloatingButtonConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFloatingButtonConfiguration;
  v2 = -[WFFloatingViewConfiguration init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFFloatingViewConfiguration setShadowOffset:](v2, "setShadowOffset:", 0.0, 3.0);
    LODWORD(v4) = 1045220557;
    -[WFFloatingViewConfiguration setShadowOpacity:](v3, "setShadowOpacity:", v4);
    -[WFFloatingViewConfiguration setShadowRadius:](v3, "setShadowRadius:", 5.0);
    -[WFFloatingViewConfiguration setCornerRadius:](v3, "setCornerRadius:", 6.0);
    v5 = v3;
  }

  return v3;
}

- (BOOL)boldTitle
{
  return self->_boldTitle;
}

- (void)setBoldTitle:(BOOL)a3
{
  self->_boldTitle = a3;
}

- (double)titleFontSize
{
  return self->_titleFontSize;
}

- (void)setTitleFontSize:(double)a3
{
  self->_titleFontSize = a3;
}

@end
