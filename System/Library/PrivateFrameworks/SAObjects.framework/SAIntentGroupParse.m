@implementation SAIntentGroupParse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("Parse");
}

+ (id)parse
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupDirectInvocation)directInvocation
{
  return (SAIntentGroupDirectInvocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("directInvocation"));
}

- (void)setDirectInvocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("directInvocation"), a3);
}

- (NSString)jsonIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonIntent"));
}

- (void)setJsonIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonIntent"), a3);
}

- (NSString)jsonIntentTypeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonIntentTypeName"));
}

- (void)setJsonIntentTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonIntentTypeName"), a3);
}

- (SAIntentGroupProtobufMessage)nlv3Parse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nlv3Parse"));
}

- (void)setNlv3Parse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nlv3Parse"), a3);
}

- (NSArray)nlv3ParseWithAlternatives
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("nlv3ParseWithAlternatives"), v3);
}

- (void)setNlv3ParseWithAlternatives:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("nlv3ParseWithAlternatives"), (uint64_t)a3);
}

- (SAIntentGroupProtobufMessage)pegasusResults
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("pegasusResults"));
}

- (void)setPegasusResults:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("pegasusResults"), a3);
}

- (SAIntentGroupProtobufMessage)siriKitIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("siriKitIntent"));
}

- (void)setSiriKitIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("siriKitIntent"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
