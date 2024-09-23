@implementation SAParsecContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ParsecContext");
}

+ (id)parsecContext
{
  return objc_alloc_init((Class)a1);
}

- (NSData)httpBody
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("httpBody"));
}

- (void)setHttpBody:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("httpBody"), a3);
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("httpHeaders"));
}

- (void)setHttpHeaders:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("httpHeaders"), a3);
}

- (NSString)httpMethod
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("httpMethod"));
}

- (void)setHttpMethod:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("httpMethod"), a3);
}

- (NSString)httpUrl
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("httpUrl"));
}

- (void)setHttpUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("httpUrl"), a3);
}

@end
