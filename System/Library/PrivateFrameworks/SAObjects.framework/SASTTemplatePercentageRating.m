@implementation SASTTemplatePercentageRating

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("TemplatePercentageRating");
}

+ (id)templatePercentageRating
{
  return objc_alloc_init((Class)a1);
}

- (SAUILocalImageResource)localImageResource
{
  return (SAUILocalImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("localImageResource"));
}

- (void)setLocalImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("localImageResource"), a3);
}

- (SAUIDecoratedText)value
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("value"), a3);
}

@end
