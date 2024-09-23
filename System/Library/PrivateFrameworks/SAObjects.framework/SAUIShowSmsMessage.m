@implementation SAUIShowSmsMessage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ShowSmsMessage");
}

+ (id)showSmsMessage
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)showAsDraft
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showAsDraft"));
}

- (void)setShowAsDraft:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showAsDraft"), a3);
}

- (SASmsSms)sms
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("sms"));
}

- (void)setSms:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("sms"), a3);
}

@end
