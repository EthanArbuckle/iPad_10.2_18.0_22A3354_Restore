@implementation PURedeyeToolControllerSpec

- (double)tooltipPortraitMargin
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 0.0;
  if (v2 <= 4)
    return dbl_1AB0F0008[v2];
  return result;
}

- (double)tooltipLandscapeMargin
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 0.0;
  if (v2 <= 4)
    return dbl_1AB0F0030[v2];
  return result;
}

- (BOOL)displaysTooltipAtTopInPortrait
{
  return (unint64_t)-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") < 4;
}

@end
