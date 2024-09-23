@implementation SASItnAlignment

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ItnAlignment");
}

+ (id)itnAlignment
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)firstPostItnCharPos
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("firstPostItnCharPos"));
}

- (void)setFirstPostItnCharPos:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("firstPostItnCharPos"), a3);
}

- (int64_t)firstPreItnTokenIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("firstPreItnTokenIndex"));
}

- (void)setFirstPreItnTokenIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("firstPreItnTokenIndex"), a3);
}

- (int64_t)lastPostItnCharPos
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("lastPostItnCharPos"));
}

- (void)setLastPostItnCharPos:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("lastPostItnCharPos"), a3);
}

- (int64_t)lastPreItnTokenIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("lastPreItnTokenIndex"));
}

- (void)setLastPreItnTokenIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("lastPreItnTokenIndex"), a3);
}

@end
