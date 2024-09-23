@implementation _UISwipeActionSpringAnimationParameters

+ (void)setDefaultDamping:(double)a3
{
  _UISwipeActionSpringAnimationParametersDamping = *(_QWORD *)&a3;
}

+ (double)defaultDamping
{
  return *(double *)&_UISwipeActionSpringAnimationParametersDamping;
}

+ (void)setDefaultStiffness:(double)a3
{
  _UISwipeActionSpringAnimationParametersStiffness = *(_QWORD *)&a3;
}

+ (double)defaultStiffness
{
  return *(double *)&_UISwipeActionSpringAnimationParametersStiffness;
}

@end
