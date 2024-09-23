@implementation SAUIClearScreen

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ClearScreen");
}

+ (id)clearScreen
{
  return objc_alloc_init((Class)a1);
}

- (SAAceView)initialView
{
  return (SAAceView *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("initialView"));
}

- (void)setInitialView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("initialView"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
