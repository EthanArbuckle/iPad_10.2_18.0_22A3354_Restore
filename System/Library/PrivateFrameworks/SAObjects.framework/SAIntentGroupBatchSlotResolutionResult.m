@implementation SAIntentGroupBatchSlotResolutionResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("BatchSlotResolutionResult");
}

+ (id)batchSlotResolutionResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)base64EncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("base64EncodedIntent"));
}

- (void)setBase64EncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("base64EncodedIntent"), a3);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (NSDictionary)slotResolutionMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("slotResolutionMap"));
}

- (void)setSlotResolutionMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("slotResolutionMap"), a3);
}

- (NSArray)stepResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("stepResults"), v3);
}

- (void)setStepResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("stepResults"), (uint64_t)a3);
}

- (NSString)typeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("typeName"));
}

- (void)setTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("typeName"), a3);
}

@end
