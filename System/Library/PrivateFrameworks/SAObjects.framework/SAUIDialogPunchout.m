@implementation SAUIDialogPunchout

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DialogPunchout");
}

+ (id)dialogPunchout
{
  return objc_alloc_init((Class)a1);
}

- (SAUIButton)buttonView
{
  return (SAUIButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("buttonView"));
}

- (void)setButtonView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("buttonView"), a3);
}

- (SAUIAssistantUtteranceView)utteranceView
{
  return (SAUIAssistantUtteranceView *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("utteranceView"));
}

- (void)setUtteranceView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("utteranceView"), a3);
}

@end
