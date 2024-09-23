@implementation SAIntentGroupChoiceSettingSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ChoiceSettingSnippetTemplate");
}

+ (id)choiceSettingSnippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)selected
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("selected"));
}

- (void)setSelected:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("selected"), a3);
}

- (SAServerBoundCommand)updateSlotCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("updateSlotCommand"));
}

- (void)setUpdateSlotCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("updateSlotCommand"), a3);
}

@end
