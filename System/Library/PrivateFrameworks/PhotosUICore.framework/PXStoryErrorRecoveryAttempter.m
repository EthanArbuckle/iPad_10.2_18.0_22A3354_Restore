@implementation PXStoryErrorRecoveryAttempter

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3 == self)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

@end
