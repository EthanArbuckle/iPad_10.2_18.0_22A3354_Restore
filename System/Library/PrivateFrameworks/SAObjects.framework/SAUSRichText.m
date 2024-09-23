@implementation SAUSRichText

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("RichText");
}

+ (id)richText
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentAdvisory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentAdvisory"));
}

- (void)setContentAdvisory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentAdvisory"), a3);
}

- (NSString)formattedTextDelimiter
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("formattedTextDelimiter"));
}

- (void)setFormattedTextDelimiter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("formattedTextDelimiter"), a3);
}

- (NSArray)markupList
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("markupList"), &unk_1EE7893B0);
}

- (void)setMarkupList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("markupList"), (uint64_t)a3);
}

- (NSArray)moreGlyphs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("moreGlyphs"), v3);
}

- (void)setMoreGlyphs:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("moreGlyphs"), (uint64_t)a3);
}

- (NSNumber)starRating
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("starRating"));
}

- (void)setStarRating:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("starRating"), a3);
}

- (NSNumber)textMaxlines
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("textMaxlines"));
}

- (void)setTextMaxlines:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("textMaxlines"), a3);
}

@end
