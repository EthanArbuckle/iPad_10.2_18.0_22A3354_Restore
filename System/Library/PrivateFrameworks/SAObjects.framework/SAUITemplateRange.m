@implementation SAUITemplateRange

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("Range");
}

+ (id)range
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)length
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("length"));
}

- (void)setLength:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("length"), a3);
}

- (int64_t)location
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("location"), a3);
}

@end
