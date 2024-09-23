@implementation NSValue(TSDGeometryAdditions)

+ (uint64_t)valueWithTSDEdgeInsets:()TSDGeometryAdditions
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return objc_msgSend(a1, "valueWithBytes:objCType:", v6, "{UIEdgeInsets=dddd}");
}

- (double)TSDEdgeInsetsValue
{
  int v2;
  double result;
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  v2 = strncmp((const char *)objc_msgSend(a1, "objCType"), "{UIEdgeInsets=dddd}", 0x13uLL);
  result = 0.0;
  if (!v2)
  {
    objc_msgSend(a1, "getValue:", v4, 0.0, 0.0, 0.0, 0.0);
    return *(double *)v4;
  }
  return result;
}

@end
