@implementation GEOElevationProfile

- (BOOL)isValid
{
  return (unint64_t)-[GEOElevationProfile pointsCount](self, "pointsCount") > 1;
}

@end
