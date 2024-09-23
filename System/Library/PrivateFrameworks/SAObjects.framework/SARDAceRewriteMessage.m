@implementation SARDAceRewriteMessage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("AceRewriteMessage");
}

- (NSString)rewriteType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rewriteType"));
}

- (void)setRewriteType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rewriteType"), a3);
}

- (NSString)rewrittenUtterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rewrittenUtterance"));
}

- (void)setRewrittenUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rewrittenUtterance"), a3);
}

@end
