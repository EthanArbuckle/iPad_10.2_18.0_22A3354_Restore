@implementation NSValue(SBIconTypes)

+ (id)sbh_valueWithSBHIconGridSize:()SBIconTypes
{
  int v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v4, "{SBHIconGridSize=SS}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sbh_SBHIconGridSizeValue
{
  unsigned int v2;

  v2 = 0;
  objc_msgSend(a1, "getValue:size:", &v2, 4);
  return v2;
}

+ (id)sbh_valueWithSBIconImageInfo:()SBIconTypes
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{SBIconImageInfo={CGSize=dd}dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)sbh_SBIconImageInfoValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 32);
  return *(double *)v2;
}

+ (id)sbh_valueWithSBIconCoordinate:()SBIconTypes
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{SBIconCoordinate=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sbh_SBIconCoordinateValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return v2[0];
}

@end
