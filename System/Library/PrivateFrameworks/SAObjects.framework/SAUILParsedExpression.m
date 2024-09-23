@implementation SAUILParsedExpression

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("ParsedExpression");
}

+ (id)parsedExpression
{
  return objc_alloc_init((Class)a1);
}

- (SAUILParseableExpression)parseableExpression
{
  return (SAUILParseableExpression *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("parseableExpression"));
}

- (void)setParseableExpression:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("parseableExpression"), a3);
}

- (NSString)parsedOutput
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parsedOutput"));
}

- (void)setParsedOutput:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parsedOutput"), a3);
}

@end
