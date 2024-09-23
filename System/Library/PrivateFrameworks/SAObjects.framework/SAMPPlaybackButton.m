@implementation SAMPPlaybackButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("PlaybackButton");
}

+ (id)playbackButton
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)pauseCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("pauseCommands"), &unk_1EE77C568);
}

- (void)setPauseCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("pauseCommands"), (uint64_t)a3);
}

- (NSArray)playCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("playCommands"), &unk_1EE77C568);
}

- (void)setPlayCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("playCommands"), (uint64_t)a3);
}

@end
