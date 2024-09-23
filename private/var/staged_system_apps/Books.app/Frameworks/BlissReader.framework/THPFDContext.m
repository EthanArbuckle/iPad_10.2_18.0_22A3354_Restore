@implementation THPFDContext

+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3
{
  return +[PFDContext isBagRefetchRequiredForStatus:](PFDContext, "isBagRefetchRequiredForStatus:", a3);
}

@end
