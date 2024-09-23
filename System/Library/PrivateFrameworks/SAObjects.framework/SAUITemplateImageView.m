@implementation SAUITemplateImageView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("ImageView");
}

+ (id)imageView
{
  return objc_alloc_init((Class)a1);
}

- (float)alpha
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("alpha"));
}

- (void)setAlpha:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("alpha"), a3);
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

- (NSArray)monogramName
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("monogramName"));
}

- (void)setMonogramName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("monogramName"), a3);
}

- (NSString)style
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("style"));
}

- (void)setStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("style"), a3);
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
