@implementation SAUITemplateTabularDataValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataValue");
}

+ (id)tabularDataValue
{
  return objc_alloc_init((Class)a1);
}

- (SAUITemplateAttributedString)attributedText
{
  return (SAUITemplateAttributedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attributedText"));
}

- (void)setAttributedText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attributedText"), a3);
}

- (NSDictionary)attributedTexts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("attributedTexts"), v3);
}

- (void)setAttributedTexts:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("attributedTexts"), (uint64_t)a3);
}

- (BOOL)highlighted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("highlighted"));
}

- (void)setHighlighted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("highlighted"), a3);
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (double)imagePointHeight
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("imagePointHeight"));
}

- (void)setImagePointHeight:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("imagePointHeight"), a3);
}

- (double)imagePointWidth
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("imagePointWidth"));
}

- (void)setImagePointWidth:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("imagePointWidth"), a3);
}

- (NSArray)themeImages
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("themeImages"), v3);
}

- (void)setThemeImages:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("themeImages"), (uint64_t)a3);
}

@end
