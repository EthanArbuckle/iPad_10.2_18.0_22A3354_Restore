@implementation NSScanner(TSUAdditions)

- (double)tsu_scanCGFloat:()TSUAdditions
{
  double result;
  double v5;

  v5 = 0.0;
  objc_msgSend(a1, "scanDouble:", &v5);
  result = v5;
  *a3 = v5;
  return result;
}

@end
