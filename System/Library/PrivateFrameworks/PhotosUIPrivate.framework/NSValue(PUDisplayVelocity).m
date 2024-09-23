@implementation NSValue(PUDisplayVelocity)

- (double)pu_displayVelocityValue
{
  id v1;
  int v2;
  double result;
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  v1 = objc_retainAutorelease(a1);
  v2 = strcmp((const char *)objc_msgSend(v1, "objCType"), "{PUDisplayVelocity=dddd}");
  result = 0.0;
  if (!v2)
  {
    objc_msgSend(v1, "getValue:", v4, 0.0, 0.0, 0.0, 0.0);
    return *(double *)v4;
  }
  return result;
}

+ (id)pu_valueWithDisplayVelocity:()PUDisplayVelocity
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{PUDisplayVelocity=dddd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
