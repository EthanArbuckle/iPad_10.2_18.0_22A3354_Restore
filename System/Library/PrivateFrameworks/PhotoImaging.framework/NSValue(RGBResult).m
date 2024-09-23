@implementation NSValue(RGBResult)

- (double)RGBResultValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

+ (id)valueWithRGBResult:()RGBResult
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  objc_msgSend(a1, "valueWithBytes:objCType:", v6, "{?=[4d]}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
