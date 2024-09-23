@implementation SAMPAddMediaEntityToAcousticIdHistory

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AddMediaEntityToAcousticIdHistory");
}

+ (id)addMediaEntityToAcousticIdHistory
{
  return objc_alloc_init((Class)a1);
}

- (NSString)adamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adamId"));
}

- (void)setAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adamId"), a3);
}

- (NSString)affiliateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("affiliateId"));
}

- (void)setAffiliateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("affiliateId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
