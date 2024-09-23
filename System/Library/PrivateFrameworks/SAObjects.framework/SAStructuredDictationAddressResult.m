@implementation SAStructuredDictationAddressResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StructuredDictationAddressResult");
}

+ (id)structuredDictationAddressResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)addressLabel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("addressLabel"));
}

- (void)setAddressLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("addressLabel"), a3);
}

- (NSURL)contactId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("contactId"));
}

- (void)setContactId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("contactId"), a3);
}

- (NSString)contactName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contactName"));
}

- (void)setContactName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contactName"), a3);
}

- (NSData)forwardGeoProtobuf
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("forwardGeoProtobuf"));
}

- (void)setForwardGeoProtobuf:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("forwardGeoProtobuf"), a3);
}

@end
