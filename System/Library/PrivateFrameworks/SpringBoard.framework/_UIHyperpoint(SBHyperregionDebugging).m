@implementation _UIHyperpoint(SBHyperregionDebugging)

- (double)sb_debugFrame
{
  double v2;
  double v3;

  v2 = *(double *)objc_msgSend(a1, "_value");
  objc_msgSend(a1, "sb_debugSize");
  return v2 - v3 * 0.5;
}

- (double)sb_debugSize
{
  return 20.0;
}

@end
