@implementation SAGKAnswerProperty

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("AnswerProperty");
}

+ (id)answerProperty
{
  return objc_alloc_init((Class)a1);
}

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("command"));
}

- (void)setCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("command"), a3);
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedValue"));
}

- (void)setDecoratedValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedValue"), a3);
}

- (SAUIDecoratedText)decoratedValueAnnotation
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedValueAnnotation"));
}

- (void)setDecoratedValueAnnotation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedValueAnnotation"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (NSNumber)selected
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selected"));
}

- (void)setSelected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selected"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

- (NSString)valueAnnotation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("valueAnnotation"));
}

- (void)setValueAnnotation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("valueAnnotation"), a3);
}

@end
