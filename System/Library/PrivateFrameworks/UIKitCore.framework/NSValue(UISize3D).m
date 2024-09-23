@implementation NSValue(UISize3D)

+ (id)valueWithUISize3D:()UISize3D
{
  _QWORD v5[3];

  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{?=ddd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)UISize3DValue
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 24);
  return *(double *)v2;
}

@end
