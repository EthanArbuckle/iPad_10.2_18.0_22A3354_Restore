@implementation SAHAActionResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("ActionResult");
}

+ (id)actionResult
{
  return objc_alloc_init((Class)a1);
}

- (SAHAEntity)entity
{
  return (SAHAEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("entity"));
}

- (void)setEntity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("entity"), a3);
}

- (NSString)outcome
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outcome"));
}

- (void)setOutcome:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outcome"), a3);
}

- (NSArray)relatedEntityIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("relatedEntityIds"));
}

- (void)setRelatedEntityIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("relatedEntityIds"), a3);
}

- (NSString)requestActionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestActionId"));
}

- (void)setRequestActionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestActionId"), a3);
}

- (NSString)resultAttribute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultAttribute"));
}

- (void)setResultAttribute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultAttribute"), a3);
}

- (SAHAAttributeValue)resultValue
{
  return (SAHAAttributeValue *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("resultValue"));
}

- (void)setResultValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("resultValue"), a3);
}

@end
