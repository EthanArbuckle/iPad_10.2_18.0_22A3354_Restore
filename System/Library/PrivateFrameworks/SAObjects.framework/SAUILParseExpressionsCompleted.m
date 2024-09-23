@implementation SAUILParseExpressionsCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("ParseExpressionsCompleted");
}

+ (id)parseExpressionsCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)parsedExpressions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("parsedExpressions"), v3);
}

- (void)setParsedExpressions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("parsedExpressions"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
