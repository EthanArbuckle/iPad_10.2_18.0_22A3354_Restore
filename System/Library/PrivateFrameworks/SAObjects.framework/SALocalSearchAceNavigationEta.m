@implementation SALocalSearchAceNavigationEta

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("AceNavigationEta");
}

+ (id)aceNavigationEta
{
  return objc_alloc_init((Class)a1);
}

- (SADistance)distanceEta
{
  return (SADistance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("distanceEta"));
}

- (void)setDistanceEta:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("distanceEta"), a3);
}

- (SADuration)timeEta
{
  return (SADuration *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("timeEta"));
}

- (void)setTimeEta:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("timeEta"), a3);
}

@end
