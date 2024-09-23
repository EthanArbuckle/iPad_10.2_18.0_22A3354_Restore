@implementation SAUIAssistantTipView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AssistantTipView");
}

+ (id)assistantTipView
{
  return objc_alloc_init((Class)a1);
}

- (NSString)flowIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("flowIdentifier"));
}

- (void)setFlowIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("flowIdentifier"), a3);
}

- (NSString)tipPrefix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tipPrefix"));
}

- (void)setTipPrefix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tipPrefix"), a3);
}

@end
