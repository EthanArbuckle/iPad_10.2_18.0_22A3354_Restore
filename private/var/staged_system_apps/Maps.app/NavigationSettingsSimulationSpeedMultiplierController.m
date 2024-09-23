@implementation NavigationSettingsSimulationSpeedMultiplierController

+ (id)navigationDestinationTitle
{
  return CFSTR("Simulation Speed Multiplier");
}

- (void)prepareContent
{
  id v2;

  v2 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8CE8);
}

@end
