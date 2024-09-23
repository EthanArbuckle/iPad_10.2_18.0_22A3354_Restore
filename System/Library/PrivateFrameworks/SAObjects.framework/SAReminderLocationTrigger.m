@implementation SAReminderLocationTrigger

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("LocationTrigger");
}

+ (id)locationTrigger
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)contactIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("contactIdentifier"));
}

- (void)setContactIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("contactIdentifier"), a3);
}

- (NSString)internalGUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("internalGUID"));
}

- (void)setInternalGUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("internalGUID"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)mobileSpace
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mobileSpace"));
}

- (void)setMobileSpace:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mobileSpace"), a3);
}

- (NSString)timing
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timing"));
}

- (void)setTiming:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timing"), a3);
}

@end
