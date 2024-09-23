@implementation SASStartSpeechDictation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeechDictation");
}

+ (id)startSpeechDictation
{
  return objc_alloc_init((Class)a1);
}

- (NSData)activationToken
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationToken"));
}

- (void)setActivationToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationToken"), a3);
}

- (NSString)applicationName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationName"));
}

- (void)setApplicationName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationName"), a3);
}

- (NSString)applicationVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationVersion"));
}

- (void)setApplicationVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationVersion"), a3);
}

- (BOOL)autoPunctuation
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("autoPunctuation"));
}

- (void)setAutoPunctuation:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("autoPunctuation"), a3);
}

- (BOOL)censorSpeech
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("censorSpeech"));
}

- (void)setCensorSpeech:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("censorSpeech"), a3);
}

- (NSString)fieldId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fieldId"));
}

- (void)setFieldId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fieldId"), a3);
}

- (NSString)fieldLabel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fieldLabel"));
}

- (void)setFieldLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fieldLabel"), a3);
}

- (NSArray)inlineItemList
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("inlineItemList"));
}

- (void)setInlineItemList:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("inlineItemList"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (NSString)keyboardIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyboardIdentifier"));
}

- (void)setKeyboardIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyboardIdentifier"), a3);
}

- (NSString)keyboardReturnKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyboardReturnKey"));
}

- (void)setKeyboardReturnKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyboardReturnKey"), a3);
}

- (NSString)keyboardType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyboardType"));
}

- (void)setKeyboardType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyboardType"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSArray)languages
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languages"));
}

- (void)setLanguages:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languages"), a3);
}

- (NSString)postfixText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("postfixText"));
}

- (void)setPostfixText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("postfixText"), a3);
}

- (NSString)prefixText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("prefixText"));
}

- (void)setPrefixText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("prefixText"), a3);
}

- (NSString)region
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("region"));
}

- (void)setRegion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("region"), a3);
}

- (BOOL)saveRequestAudio
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("saveRequestAudio"));
}

- (void)setSaveRequestAudio:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("saveRequestAudio"), a3);
}

- (NSString)selectedText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedText"));
}

- (void)setSelectedText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedText"), a3);
}

- (BOOL)speakerIndependentRecognition
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("speakerIndependentRecognition"));
}

- (void)setSpeakerIndependentRecognition:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("speakerIndependentRecognition"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
