@implementation SANoteCreateCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("CreateCompleted");
}

+ (id)createCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
