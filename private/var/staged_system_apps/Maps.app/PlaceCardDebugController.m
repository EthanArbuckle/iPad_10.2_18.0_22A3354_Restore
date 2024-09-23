@implementation PlaceCardDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Place Card");
}

- (void)prepareContent
{
  id v3;
  id v4;

  if (MapsFeature_IsEnabled_PlaceCardShowcase(-[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011E2E70)))v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Place Enrichment"), &stru_1011E2FD0);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Override"), &stru_1011E2FF0);
}

@end
