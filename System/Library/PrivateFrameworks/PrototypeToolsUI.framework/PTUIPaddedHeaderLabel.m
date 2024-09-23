@implementation PTUIPaddedHeaderLabel

- (void)drawTextInRect:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTUIPaddedHeaderLabel;
  -[PTUIPaddedHeaderLabel drawTextInRect:](&v3, sel_drawTextInRect_, a3.origin.x + 20.0, a3.origin.y + 15.0, a3.size.width + -40.0, a3.size.height + -30.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)PTUIPaddedHeaderLabel;
  -[PTUIPaddedHeaderLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3 + 40.0;
  v6 = v5 + 30.0;
  result.height = v6;
  result.width = v4;
  return result;
}

@end
