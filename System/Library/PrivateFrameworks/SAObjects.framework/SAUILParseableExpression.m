@implementation SAUILParseableExpression

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("ParseableExpression");
}

+ (id)parseableExpression
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)context
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("context"), a3);
}

- (NSString)expressionString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("expressionString"));
}

- (void)setExpressionString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("expressionString"), a3);
}

@end
