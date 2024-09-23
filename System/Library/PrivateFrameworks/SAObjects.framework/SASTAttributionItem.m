@implementation SASTAttributionItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("AttributionItem");
}

+ (id)attributionItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
}

- (NSString)attributionPosition
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributionPosition"));
}

- (void)setAttributionPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributionPosition"), a3);
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
