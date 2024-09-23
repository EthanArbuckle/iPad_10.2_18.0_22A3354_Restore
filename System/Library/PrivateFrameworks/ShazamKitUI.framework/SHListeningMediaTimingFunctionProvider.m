@implementation SHListeningMediaTimingFunctionProvider

+ (id)inOutSineMediaTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1054951342;
  LODWORD(v3) = 1028443341;
  LODWORD(v4) = 1057803469;
  LODWORD(v5) = 1064514355;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)inOutQuartMediaTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1054951342;
  LODWORD(v3) = 1028443341;
  LODWORD(v4) = 1057803469;
  LODWORD(v5) = 1064514355;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

@end
