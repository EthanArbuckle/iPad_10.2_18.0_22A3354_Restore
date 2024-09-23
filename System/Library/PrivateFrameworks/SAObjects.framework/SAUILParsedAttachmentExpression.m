@implementation SAUILParsedAttachmentExpression

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("ParsedAttachmentExpression");
}

+ (id)parsedAttachmentExpression
{
  return objc_alloc_init((Class)a1);
}

- (NSData)attachment
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attachment"));
}

- (void)setAttachment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attachment"), a3);
}

@end
