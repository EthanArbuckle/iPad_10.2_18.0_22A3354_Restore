@implementation SAUIPronunciationSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PronunciationSnippet");
}

+ (id)pronunciationSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)cancelCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("cancelCommands"), &unk_1EE77C568);
}

- (void)setCancelCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("cancelCommands"), (uint64_t)a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (NSString)orthography
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("orthography"));
}

- (void)setOrthography:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("orthography"), a3);
}

- (NSArray)pronunciations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("pronunciations"), v3);
}

- (void)setPronunciations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("pronunciations"), (uint64_t)a3);
}

- (NSArray)selectNoneCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("selectNoneCommands"), &unk_1EE77C568);
}

- (void)setSelectNoneCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("selectNoneCommands"), (uint64_t)a3);
}

- (NSString)selectNoneText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectNoneText"));
}

- (void)setSelectNoneText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectNoneText"), a3);
}

@end
