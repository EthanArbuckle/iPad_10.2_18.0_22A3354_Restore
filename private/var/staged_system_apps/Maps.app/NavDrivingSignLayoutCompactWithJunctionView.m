@implementation NavDrivingSignLayoutCompactWithJunctionView

+ (id)sharedDrivingCompactWithJunctionViewSignLayout
{
  if (qword_1014D41D8 != -1)
    dispatch_once(&qword_1014D41D8, &stru_1011E7170);
  return (id)qword_1014D41D0;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 1;
}

@end
