@implementation NavDrivingSignLayoutMinimizedWithJunctionView

+ (id)sharedDrivingMinimizedWithJunctionViewSignLayout
{
  if (qword_1014D41C8 != -1)
    dispatch_once(&qword_1014D41C8, &stru_1011E7150);
  return (id)qword_1014D41C0;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 1;
}

@end
