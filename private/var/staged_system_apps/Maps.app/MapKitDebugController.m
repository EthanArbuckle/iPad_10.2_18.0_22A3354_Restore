@implementation MapKitDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("MapKit");
}

- (void)prepareContent
{
  id v3;
  id v4;

  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("User Location"), &stru_1011DE9A0);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Elevated Terrain"), &stru_1011DEA40);
}

@end
