@implementation KeyColorDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Key Color");
}

- (void)prepareContent
{
  id v2;

  v2 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Key Color Override"), &stru_1011DA520);
}

@end
