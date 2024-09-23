@implementation SAStructuredDictationFailed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StructuredDictationFailed");
}

+ (id)structuredDictationFailed
{
  return objc_alloc_init((Class)a1);
}

- (NSString)dialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogIdentifier"));
}

- (void)setDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogIdentifier"), a3);
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("errorCode"));
}

- (void)setErrorCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("errorCode"), a3);
}

- (NSString)recognition
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)userFacingReasonDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userFacingReasonDescription"));
}

- (void)setUserFacingReasonDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userFacingReasonDescription"), a3);
}

- (NSString)userFacingReasonTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userFacingReasonTitle"));
}

- (void)setUserFacingReasonTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userFacingReasonTitle"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
