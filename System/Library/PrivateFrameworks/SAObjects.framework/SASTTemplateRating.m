@implementation SASTTemplateRating

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("TemplateRating");
}

+ (id)templateRating
{
  return objc_alloc_init((Class)a1);
}

@end
