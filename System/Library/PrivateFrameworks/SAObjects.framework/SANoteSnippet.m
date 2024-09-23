@implementation SANoteSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)notes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("notes"), v3);
}

- (void)setNotes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("notes"), (uint64_t)a3);
}

@end
