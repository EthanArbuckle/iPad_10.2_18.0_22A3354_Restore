@implementation CarAutohidingLabel

- (CarAutohidingLabel)initWithFrame:(CGRect)a3
{
  CarAutohidingLabel *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarAutohidingLabel;
  result = -[CarAutohidingLabel initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_autohideForVerticalSquishing = 1;
  return result;
}

- (CarAutohidingLabel)initWithCoder:(id)a3
{
  CarAutohidingLabel *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarAutohidingLabel;
  result = -[CarAutohidingLabel initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    result->_autohideForVerticalSquishing = 1;
  return result;
}

- (void)setAutohide:(BOOL)a3 forAxis:(int64_t)a4
{
  int *v4;

  if (a4 == 1)
  {
    v4 = &OBJC_IVAR___CarAutohidingLabel__autohideForVerticalSquishing;
  }
  else
  {
    if (a4)
      return;
    v4 = &OBJC_IVAR___CarAutohidingLabel__autohideForHorizontalSquishing;
  }
  *((_BYTE *)&self->super.super.super.super.isa + *v4) = a3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)CarAutohidingLabel;
  -[CarAutohidingLabel layoutSubviews](&v11, "layoutSubviews");
  v3 = 1.0;
  if (-[CarAutohidingLabel adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
  {
    -[CarAutohidingLabel minimumScaleFactor](self, "minimumScaleFactor");
    v3 = v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel font](self, "font"));
  objc_msgSend(v5, "lineHeight");
  v7 = v3 * v6;

  if (self->_autohideForVerticalSquishing)
  {
    -[CarAutohidingLabel bounds](self, "bounds");
    v8 = CGRectGetHeight(v12) < v7;
  }
  else
  {
    v8 = 0;
  }
  if (self->_autohideForHorizontalSquishing)
  {
    -[CarAutohidingLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, v7 * (double)(uint64_t)-[CarAutohidingLabel numberOfLines](self, "numberOfLines"));
    v10 = v9;
    -[CarAutohidingLabel bounds](self, "bounds");
    if (CGRectGetWidth(v13) < v10)
      v8 = 1;
    else
      v8 = v8;
  }
  -[CarAutohidingLabel setHidden:](self, "setHidden:", v8);
}

@end
