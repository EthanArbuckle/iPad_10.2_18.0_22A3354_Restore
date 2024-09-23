@implementation SAAISongTagSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("SongTagSnippet");
}

+ (id)songTagSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)attributionPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attributionPunchOut"));
}

- (void)setAttributionPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attributionPunchOut"), a3);
}

- (SAMPPlaybackButton)playbackButton
{
  return (SAMPPlaybackButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playbackButton"));
}

- (void)setPlaybackButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playbackButton"), a3);
}

- (SAUIAppPunchOut)purchaseSongPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("purchaseSongPunchOut"));
}

- (void)setPurchaseSongPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("purchaseSongPunchOut"), a3);
}

- (SAUIAppPunchOut)songDetailsPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("songDetailsPunchOut"));
}

- (void)setSongDetailsPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("songDetailsPunchOut"), a3);
}

- (SAAISongTag)songTag
{
  return (SAAISongTag *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("songTag"));
}

- (void)setSongTag:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("songTag"), a3);
}

@end
