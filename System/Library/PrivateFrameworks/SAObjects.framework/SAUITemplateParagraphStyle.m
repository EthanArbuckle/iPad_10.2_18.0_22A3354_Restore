@implementation SAUITemplateParagraphStyle

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("ParagraphStyle");
}

+ (id)paragraphStyle
{
  return objc_alloc_init((Class)a1);
}

- (NSString)alignment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alignment"));
}

- (void)setAlignment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alignment"), a3);
}

- (NSNumber)firstLineHeadIndent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstLineHeadIndent"));
}

- (void)setFirstLineHeadIndent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstLineHeadIndent"), a3);
}

- (NSNumber)getParagraphSpacingBefore
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("getParagraphSpacingBefore"));
}

- (void)setGetParagraphSpacingBefore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("getParagraphSpacingBefore"), a3);
}

- (NSNumber)headIndent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headIndent"));
}

- (void)setHeadIndent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headIndent"), a3);
}

- (NSNumber)lineHeightMultiple
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lineHeightMultiple"));
}

- (void)setLineHeightMultiple:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lineHeightMultiple"), a3);
}

- (NSNumber)lineSpacing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lineSpacing"));
}

- (void)setLineSpacing:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lineSpacing"), a3);
}

- (NSNumber)maximumLineHeight
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("maximumLineHeight"));
}

- (void)setMaximumLineHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("maximumLineHeight"), a3);
}

- (NSNumber)minimumLineHeight
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minimumLineHeight"));
}

- (void)setMinimumLineHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minimumLineHeight"), a3);
}

- (NSNumber)paragraphSpacing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("paragraphSpacing"));
}

- (void)setParagraphSpacing:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("paragraphSpacing"), a3);
}

- (NSNumber)tailIndent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tailIndent"));
}

- (void)setTailIndent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tailIndent"), a3);
}

@end
