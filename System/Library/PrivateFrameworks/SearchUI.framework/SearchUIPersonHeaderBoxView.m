@implementation SearchUIPersonHeaderBoxView

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a4, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

@end
