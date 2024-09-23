@implementation SAStockReference

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("Reference");
}

+ (id)reference
{
  return objc_alloc_init((Class)a1);
}

- (NSString)companyName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("companyName"));
}

- (void)setCompanyName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("companyName"), a3);
}

- (NSString)symbol
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("symbol"));
}

- (void)setSymbol:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("symbol"), a3);
}

@end
