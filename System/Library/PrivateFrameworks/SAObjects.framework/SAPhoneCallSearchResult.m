@implementation SAPhoneCallSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallSearchResult");
}

+ (id)callSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)callTime
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("callTime"));
}

- (void)setCallTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("callTime"), a3);
}

- (SAPersonAttribute)contact
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("contact"));
}

- (void)setContact:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("contact"), a3);
}

- (NSNumber)isNew
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isNew"));
}

- (void)setIsNew:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isNew"), a3);
}

@end
