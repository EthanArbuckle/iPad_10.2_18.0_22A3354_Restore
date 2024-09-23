@implementation SAAnswerAnswerProperty

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("AnswerProperty");
}

+ (id)answerProperty
{
  return objc_alloc_init((Class)a1);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
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
