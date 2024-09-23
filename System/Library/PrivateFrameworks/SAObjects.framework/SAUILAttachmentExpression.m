@implementation SAUILAttachmentExpression

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("AttachmentExpression");
}

+ (id)attachmentExpression
{
  return objc_alloc_init((Class)a1);
}

- (SAAceSerializable)attachmentExpression
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attachmentExpression"));
}

- (void)setAttachmentExpression:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attachmentExpression"), a3);
}

@end
