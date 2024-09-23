@implementation SAMicroblogTwitterPost

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("TwitterPost");
}

+ (id)twitterPost
{
  return objc_alloc_init((Class)a1);
}

@end
