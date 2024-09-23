@implementation SAAnswerSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("address"));
}

- (void)setAddress:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("address"), a3);
}

- (NSString)attribute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attribute"));
}

- (void)setAttribute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attribute"), a3);
}

- (NSString)miscQuestion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("miscQuestion"));
}

- (void)setMiscQuestion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("miscQuestion"), a3);
}

- (NSString)placeAttribute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeAttribute"));
}

- (void)setPlaceAttribute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeAttribute"), a3);
}

- (NSArray)product
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("product"));
}

- (void)setProduct:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("product"), a3);
}

- (NSString)timeQuestion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeQuestion"));
}

- (void)setTimeQuestion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeQuestion"), a3);
}

- (NSString)verbType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("verbType"));
}

- (void)setVerbType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("verbType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
