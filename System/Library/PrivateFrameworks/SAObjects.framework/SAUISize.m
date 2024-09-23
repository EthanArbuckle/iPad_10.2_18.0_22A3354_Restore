@implementation SAUISize

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("Size");
}

- (int64_t)height
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("height"));
}

- (void)setHeight:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("height"), a3);
}

- (double)scale
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("scale"));
}

- (void)setScale:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("scale"), a3);
}

- (int64_t)width
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("width"));
}

- (void)setWidth:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("width"), a3);
}

@end
