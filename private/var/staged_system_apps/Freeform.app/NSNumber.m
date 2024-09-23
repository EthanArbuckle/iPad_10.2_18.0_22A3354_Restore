@implementation NSNumber

+ (id)crl_numberWithCGFloat:(double)a3
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
}

- (BOOL)crl_isFloatingPointType
{
  return (*(_BYTE *)-[NSNumber objCType](objc_retainAutorelease(self), "objCType") & 0xFD) == 100;
}

- (BOOL)crl_isAlmostEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  -[NSNumber doubleValue](self, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = vabdd_f64(v6, v7) < 0.01 || v6 == v7;

  return v8;
}

@end
