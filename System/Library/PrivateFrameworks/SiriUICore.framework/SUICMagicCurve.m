@implementation SUICMagicCurve

void ___SUICMagicCurve_block_invoke()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;

  v0 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v1) = 1043928040;
  LODWORD(v2) = 1058272560;
  LODWORD(v3) = 1063980840;
  LODWORD(v4) = 0;
  v5 = objc_msgSend(v0, "initWithControlPoints::::", v1, v4, v2, v3);
  v6 = (void *)_SUICMagicCurve_curve;
  _SUICMagicCurve_curve = v5;

}

@end
