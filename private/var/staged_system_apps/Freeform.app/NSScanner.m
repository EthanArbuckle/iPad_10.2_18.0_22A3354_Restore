@implementation NSScanner

- (BOOL)crl_scanCGFloat:(double *)a3
{
  BOOL result;
  uint64_t v5;

  v5 = 0;
  result = -[NSScanner scanDouble:](self, "scanDouble:", &v5);
  *(_QWORD *)a3 = v5;
  return result;
}

@end
