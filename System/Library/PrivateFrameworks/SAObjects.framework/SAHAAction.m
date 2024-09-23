@implementation SAHAAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("Action");
}

+ (id)action
{
  return objc_alloc_init((Class)a1);
}

- (NSString)actionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actionType"));
}

- (void)setActionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actionType"), a3);
}

- (NSString)attribute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attribute"));
}

- (void)setAttribute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attribute"), a3);
}

- (NSArray)executionFlags
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionFlags"));
}

- (void)setExecutionFlags:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionFlags"), a3);
}

- (int64_t)executionOrder
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("executionOrder"));
}

- (void)setExecutionOrder:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("executionOrder"), a3);
}

- (BOOL)includeCompleteInformation
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("includeCompleteInformation"));
}

- (void)setIncludeCompleteInformation:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("includeCompleteInformation"), a3);
}

- (SAHAAttributeValue)value
{
  return (SAHAAttributeValue *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("value"), a3);
}

@end
