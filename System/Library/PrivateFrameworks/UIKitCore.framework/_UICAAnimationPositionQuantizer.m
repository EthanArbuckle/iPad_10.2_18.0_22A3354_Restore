@implementation _UICAAnimationPositionQuantizer

+ (void)quantizePositionsInAnimation:(id)a3 givenView:(id)a4
{
  _quantizePositionsInAnimation(a3, a4, 0);
}

+ (id)animationWithQuantizedPositionsGivenAnimation:(id)a3 appliedToView:(id)a4
{
  id v5;

  v5 = 0;
  _quantizePositionsInAnimation(a3, a4, &v5);
  return v5;
}

@end
