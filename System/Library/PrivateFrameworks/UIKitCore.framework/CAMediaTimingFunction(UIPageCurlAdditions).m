@implementation CAMediaTimingFunction(UIPageCurlAdditions)

+ (uint64_t)uiFunctionWithControlPoints:()UIPageCurlAdditions
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *a3;
  v4 = a3[1];
  *(float *)&v3 = *a3;
  *(float *)&v4 = v4;
  v5 = a3[2];
  v6 = a3[3];
  *(float *)&v5 = v5;
  *(float *)&v6 = v6;
  return objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v4, v5, v6);
}

@end
