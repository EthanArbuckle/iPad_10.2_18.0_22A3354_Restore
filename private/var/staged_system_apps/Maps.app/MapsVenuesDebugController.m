@implementation MapsVenuesDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Venues");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsVenuesDebugController;
  -[MapsDebugValuesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsVenuesDebugController _viewWillAppear](self, "_viewWillAppear");
}

- (void)prepareContent
{
  id v2;

  v2 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011ADA90);
}

@end
