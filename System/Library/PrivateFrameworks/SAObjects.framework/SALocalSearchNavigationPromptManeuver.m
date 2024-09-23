@implementation SALocalSearchNavigationPromptManeuver

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("NavigationPromptManeuver");
}

+ (id)navigationPromptManeuver
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)maneuverIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("maneuverIndex"));
}

- (void)setManeuverIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("maneuverIndex"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
