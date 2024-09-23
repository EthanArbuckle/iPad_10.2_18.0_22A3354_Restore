@implementation SAUIListItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ListItem");
}

+ (id)listItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (SASTTemplateContentRating)contentRating
{
  return (SASTTemplateContentRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("contentRating"));
}

- (void)setContentRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("contentRating"), a3);
}

- (NSString)imageType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageType"));
}

- (void)setImageType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageType"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSString)labelValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("labelValue"));
}

- (void)setLabelValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("labelValue"), a3);
}

- (SAAceSerializable)object
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("object"));
}

- (void)setObject:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("object"), a3);
}

- (NSString)primaryDescriptiveText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primaryDescriptiveText"));
}

- (void)setPrimaryDescriptiveText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primaryDescriptiveText"), a3);
}

- (NSString)secondaryDescriptiveText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("secondaryDescriptiveText"));
}

- (void)setSecondaryDescriptiveText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("secondaryDescriptiveText"), a3);
}

- (NSString)selectionResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectionResponse"));
}

- (void)setSelectionResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectionResponse"), a3);
}

- (NSString)selectionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectionText"));
}

- (void)setSelectionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectionText"), a3);
}

- (NSString)speakableSelectionResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableSelectionResponse"));
}

- (void)setSpeakableSelectionResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableSelectionResponse"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
