@implementation SAUIFeedbackForm

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("FeedbackForm");
}

- (NSString)domain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domain"));
}

- (void)setDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domain"), a3);
}

- (NSString)input
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("input"));
}

- (void)setInput:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("input"), a3);
}

- (NSString)output
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("output"));
}

- (void)setOutput:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("output"), a3);
}

@end
