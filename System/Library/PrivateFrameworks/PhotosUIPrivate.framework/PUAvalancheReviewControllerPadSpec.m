@implementation PUAvalancheReviewControllerPadSpec

- (double)interItemSpacing
{
  int v2;
  double result;

  v2 = PLIsTallScreen();
  result = 15.0;
  if (v2)
    return 10.0;
  return result;
}

@end
