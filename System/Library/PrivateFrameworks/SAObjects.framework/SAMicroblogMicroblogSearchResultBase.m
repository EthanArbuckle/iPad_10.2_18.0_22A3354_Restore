@implementation SAMicroblogMicroblogSearchResultBase

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("MicroblogSearchResultBase");
}

+ (id)microblogSearchResultBase
{
  return objc_alloc_init((Class)a1);
}

- (SAMicroblogTwitterPostAuthor)author
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("author"));
}

- (void)setAuthor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("author"), a3);
}

@end
