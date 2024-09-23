@implementation SAAceCorrection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceCorrection");
}

+ (id)aceCorrection
{
  return objc_alloc_init((Class)a1);
}

- (NSData)correctionEntryData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("correctionEntryData"));
}

- (void)setCorrectionEntryData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("correctionEntryData"), a3);
}

- (NSString)debugString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("debugString"));
}

- (void)setDebugString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("debugString"), a3);
}

@end
