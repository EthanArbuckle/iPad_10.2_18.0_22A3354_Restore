@implementation SASyncDeepSyncVerificationResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("DeepSyncVerificationResult");
}

+ (id)deepSyncVerificationResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)key
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("key"));
}

- (void)setKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("key"), a3);
}

- (NSString)result
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("result"));
}

- (void)setResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("result"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
