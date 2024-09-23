@implementation SBMainScreenPointsPerMillimeter

double __SBMainScreenPointsPerMillimeter_block_invoke()
{
  double v0;
  void *v1;
  double v2;
  double v3;
  double result;

  v0 = (double)SBMainScreenDPI() / 25.4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nativeScale");
  v3 = v2;

  result = v0 / v3;
  *(double *)&SBMainScreenPointsPerMillimeter_pointsPerMM = v0 / v3;
  return result;
}

@end
