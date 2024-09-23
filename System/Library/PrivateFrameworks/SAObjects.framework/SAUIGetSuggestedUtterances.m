@implementation SAUIGetSuggestedUtterances

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("GetSuggestedUtterances");
}

+ (id)getSuggestedUtterances
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
