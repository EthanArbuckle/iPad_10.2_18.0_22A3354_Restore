@implementation SAPersonAttribute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PersonAttribute");
}

+ (id)personAttribute
{
  return objc_alloc_init((Class)a1);
}

- (NSString)data
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("data"));
}

- (void)setData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("data"), a3);
}

- (NSString)dataType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dataType"));
}

- (void)setDataType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dataType"), a3);
}

- (NSString)displayText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayText"));
}

- (void)setDisplayText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayText"), a3);
}

- (SAPerson)object
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("object"));
}

- (void)setObject:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("object"), a3);
}

- (SAAceComparable)typedData
{
  return (SAAceComparable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("typedData"));
}

- (void)setTypedData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("typedData"), a3);
}

@end
