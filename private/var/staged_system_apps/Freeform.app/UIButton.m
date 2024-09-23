@implementation UIButton

- (UIEdgeInsets)crl_deprecatedContentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIButton contentEdgeInsets](self, "contentEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setCrl_deprecatedTitleEdgeInsets:(UIEdgeInsets)a3
{
  -[UIButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UIEdgeInsets)crl_deprecatedTitleEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIButton titleEdgeInsets](self, "titleEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)crl_deprecatedImageEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIButton imageEdgeInsets](self, "imageEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)crl_deprecatedAdjustsImageWhenHighlighted
{
  return -[UIButton adjustsImageWhenHighlighted](self, "adjustsImageWhenHighlighted");
}

- (void)setCrl_deprecatedAdjustsImageWhenDisabled:(BOOL)a3
{
  -[UIButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", a3);
}

- (BOOL)crl_deprecatedAdjustsImageWhenDisabled
{
  return -[UIButton adjustsImageWhenDisabled](self, "adjustsImageWhenDisabled");
}

- (CGRect)crl_deprecatedBackgroundRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButton backgroundRectForBounds:](self, "backgroundRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedContentRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButton contentRectForBounds:](self, "contentRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedTitleRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButton titleRectForContentRect:](self, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedImageRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
