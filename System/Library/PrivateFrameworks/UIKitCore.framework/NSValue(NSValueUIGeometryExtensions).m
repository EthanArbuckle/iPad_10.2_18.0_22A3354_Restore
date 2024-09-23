@implementation NSValue(NSValueUIGeometryExtensions)

+ (id)valueWithCGPoint:()NSValueUIGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithCGRect:()NSValueUIGeometryExtensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGPointValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGPoint");
  return *(double *)v2;
}

- (double)CGRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"CGRect");
  return *(double *)v2;
}

- (double)UIEdgeInsetsValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"UIEdgeInsets");
  return *(double *)v2;
}

- (double)CGSizeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGSize");
  return *(double *)v2;
}

- (double)directionalEdgeInsetsValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"NSDirectionalEdgeInsets");
  return *(double *)v2;
}

+ (id)valueWithUIEdgeInsets:()NSValueUIGeometryExtensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{UIEdgeInsets=dddd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithCGSize:()NSValueUIGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)UIOffsetValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"UIOffset");
  return *(double *)v2;
}

+ (uint64_t)valueWithCGAffineTransform:()NSValueUIGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

+ (id)valueWithDirectionalEdgeInsets:()NSValueUIGeometryExtensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{NSDirectionalEdgeInsets=dddd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGAffineTransformValue
{
  __int128 v3;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  _getNSValueBytes(a1, &v5, 0x30uLL, (uint64_t)"CGAffineTransform");
  v3 = v6;
  *a2 = v5;
  a2[1] = v3;
  result = *(double *)&v7;
  a2[2] = v7;
  return result;
}

+ (id)valueWithCGVector:()NSValueUIGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGVector=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)valueWithNSDirectionalEdgeInsets:()NSValueUIGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDirectionalEdgeInsets:");
}

+ (id)valueWithUIOffset:()NSValueUIGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{UIOffset=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGVectorValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGVector");
  return *(double *)v2;
}

@end
