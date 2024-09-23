@implementation ACCNavigationAccessoryComponent

- (unint64_t)guidanceManeuverCapacity
{
  if (-[ACCNavigationAccessoryComponent maxCapacity_GuidanceManeuver](self, "maxCapacity_GuidanceManeuver"))
    return (unint64_t)-[ACCNavigationAccessoryComponent maxCapacity_GuidanceManeuver](self, "maxCapacity_GuidanceManeuver");
  else
    return 1000;
}

- (unint64_t)laneGuidanceCapacity
{
  if (-[ACCNavigationAccessoryComponent maxCapacity_LaneGuidance](self, "maxCapacity_LaneGuidance"))
    return (unint64_t)-[ACCNavigationAccessoryComponent maxCapacity_LaneGuidance](self, "maxCapacity_LaneGuidance");
  else
    return 1000;
}

@end
