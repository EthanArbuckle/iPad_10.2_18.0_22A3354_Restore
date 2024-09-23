@implementation SAMPPlaybackInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("PlaybackInfo");
}

+ (id)playbackInfo
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)durationMillis
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("durationMillis"));
}

- (void)setDurationMillis:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("durationMillis"), a3);
}

- (SACalendar)lastPlayedDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("lastPlayedDate"));
}

- (void)setLastPlayedDate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("lastPlayedDate"), a3);
}

- (int64_t)playbackPositionMillis
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("playbackPositionMillis"));
}

- (void)setPlaybackPositionMillis:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("playbackPositionMillis"), a3);
}

- (int64_t)plays
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("plays"));
}

- (void)setPlays:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("plays"), a3);
}

- (BOOL)rememberPlaybackPosition
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("rememberPlaybackPosition"));
}

- (void)setRememberPlaybackPosition:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("rememberPlaybackPosition"), a3);
}

@end
