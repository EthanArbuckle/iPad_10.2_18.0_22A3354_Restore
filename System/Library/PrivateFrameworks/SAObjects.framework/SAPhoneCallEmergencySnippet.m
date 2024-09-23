@implementation SAPhoneCallEmergencySnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallEmergencySnippet");
}

+ (id)callEmergencySnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIColor)bodyBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("bodyBackgroundColor"));
}

- (void)setBodyBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("bodyBackgroundColor"), a3);
}

- (SAUIColor)bodyTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("bodyTextColor"));
}

- (void)setBodyTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("bodyTextColor"), a3);
}

- (int64_t)countDownSeconds
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("countDownSeconds"));
}

- (void)setCountDownSeconds:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("countDownSeconds"), a3);
}

- (SAUIColor)headerBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("headerBackgroundColor"));
}

- (void)setHeaderBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("headerBackgroundColor"), a3);
}

- (SAUIColor)headerTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("headerTextColor"));
}

- (void)setHeaderTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("headerTextColor"), a3);
}

@end
