@implementation FIUIWorkoutActivityType

- (BOOL)bridge_supportsElevationAscendedInSummary
{
  FIUIWorkoutActivityType *v2;
  char v3;

  v2 = self;
  v3 = FIUIWorkoutActivityType.supportsElevationAscendedInSummary.getter();

  return v3 & 1;
}

- (BOOL)bridge_supportsElevationDescendedInSummary
{
  FIUIWorkoutActivityType *v2;
  char v3;

  v2 = self;
  v3 = FIUIWorkoutActivityType.supportsElevationDescendedInSummary.getter();

  return v3 & 1;
}

- (BOOL)bridge_isDownhillSnowSport
{
  return -[FIUIWorkoutActivityType isDownhillSnowSport](self, "isDownhillSnowSport");
}

@end
