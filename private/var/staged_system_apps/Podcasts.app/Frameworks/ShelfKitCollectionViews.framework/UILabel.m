@implementation UILabel

- (double)firstBaselineFromTop
{
  double result;

  -[UILabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
  return result;
}

- (double)lastBaselineFromBottom
{
  double result;

  -[UILabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
  return result;
}

@end
