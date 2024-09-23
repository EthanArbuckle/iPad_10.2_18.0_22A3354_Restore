@implementation PUAdjustmentsToolControllerSpec

- (double)standardBottomBarHeight
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 141.0;
  if (v2 >= 5)
    return 0.0;
  return result;
}

- (double)sliderLength
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 294.0;
  if (v2 >= 5)
    return 0.0;
  return result;
}

@end
