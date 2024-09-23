@implementation SAUIGetResponseAlternativesPlayback

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("GetResponseAlternativesPlayback");
}

+ (id)getResponseAlternativesPlayback
{
  return objc_alloc_init((Class)a1);
}

- (SAUIGetResponseAlternatives)playbackCommand
{
  return (SAUIGetResponseAlternatives *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playbackCommand"));
}

- (void)setPlaybackCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playbackCommand"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
