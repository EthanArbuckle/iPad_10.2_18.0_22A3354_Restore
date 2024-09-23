@implementation NSData(NSDataExtras)

+ (id)dataWithRange:()NSDataExtras
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(a1, "dataWithBytes:length:", v5, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)range
{
  if (objc_msgSend(a1, "length") == 16)
    return *(_QWORD *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  else
    return 0;
}

+ (id)dataWithPSN:()NSDataExtras
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(a1, "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)psn
{
  if (objc_msgSend(a1, "length") == 8)
    return *(_QWORD *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  else
    return 0;
}

+ (id)dataWithCGRect:()NSDataExtras
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  objc_msgSend(a1, "dataWithBytes:length:", v6, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGRectValue
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(a1, "length");
  result = 0.0;
  if (v2 == 32)
    return *(double *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  return result;
}

+ (id)dataWithCGSize:()NSDataExtras
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  objc_msgSend(a1, "dataWithBytes:length:", v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGSizeValue
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(a1, "length");
  result = 0.0;
  if (v2 == 16)
    return *(double *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  return result;
}

+ (id)dataWithCGPoint:()NSDataExtras
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  objc_msgSend(a1, "dataWithBytes:length:", v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGPointValue
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(a1, "length");
  result = 0.0;
  if (v2 == 16)
    return *(double *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  return result;
}

@end
