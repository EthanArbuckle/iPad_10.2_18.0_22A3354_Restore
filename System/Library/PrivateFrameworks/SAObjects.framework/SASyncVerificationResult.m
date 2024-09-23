@implementation SASyncVerificationResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("VerificationResult");
}

+ (id)verificationResult
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)fail
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("fail"));
}

- (void)setFail:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("fail"), a3);
}

- (NSArray)failedObjectIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("failedObjectIds"));
}

- (void)setFailedObjectIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("failedObjectIds"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (int64_t)total
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("total"));
}

- (void)setTotal:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("total"), a3);
}

@end
