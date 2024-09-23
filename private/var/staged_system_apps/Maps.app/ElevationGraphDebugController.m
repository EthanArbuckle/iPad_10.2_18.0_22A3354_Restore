@implementation ElevationGraphDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Elevation Graph");
}

- (void)prepareContent
{
  id v2;

  v2 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Chart Bucketing Algorithm"), &stru_1011BD3D8);
}

@end
