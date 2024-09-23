@implementation FPTime

- (FPTime)init
{
  FPTime *v2;
  double *v3;
  FPTime *v4;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPTime;
  v2 = -[FPTime init](&v8, "init");
  v3 = (double *)v2;
  if (v2)
  {
    v6 = 0;
    v7 = 0;
    v4 = 0;
    if (!mach_get_times(&v2->_machAbsoluteTime, &v2->_machContinuousTime, &v6))
    {
      v3[3] = (double)v6 - kCFAbsoluteTimeIntervalSince1970 + (double)v7 * 0.000000001;
      v4 = v3;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
