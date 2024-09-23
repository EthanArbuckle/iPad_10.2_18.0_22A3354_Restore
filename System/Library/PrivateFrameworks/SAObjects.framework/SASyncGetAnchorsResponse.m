@implementation SASyncGetAnchorsResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("GetAnchorsResponse");
}

+ (id)getAnchorsResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)anchors
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("anchors"), v3);
}

- (void)setAnchors:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("anchors"), (uint64_t)a3);
}

- (NSString)authToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("authToken"));
}

- (void)setAuthToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("authToken"), a3);
}

- (NSString)primeToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primeToken"));
}

- (void)setPrimeToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primeToken"), a3);
}

- (NSNumber)syncDataReset
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncDataReset"));
}

- (void)setSyncDataReset:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncDataReset"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
