@implementation _UIHyperrectangle(SBHyperregionDebugging)

- (double)sb_debugFrame
{
  double v2;

  v2 = *(double *)objc_msgSend(a1, "_minimumPoint");
  objc_msgSend(a1, "sb_debugSize");
  return v2;
}

- (double)sb_debugSize
{
  double *v2;
  double v3;

  v2 = (double *)objc_msgSend(a1, "_minimumPoint");
  v3 = *(double *)objc_msgSend(a1, "_maximumPoint") - *v2;
  if (BSFloatIsZero())
    v3 = 20.0;
  BSFloatIsZero();
  return v3;
}

@end
