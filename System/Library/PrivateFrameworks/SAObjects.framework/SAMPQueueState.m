@implementation SAMPQueueState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("QueueState");
}

+ (id)queueState
{
  return objc_alloc_init((Class)a1);
}

- (NSString)applicationIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationIdentifier"));
}

- (void)setApplicationIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationIdentifier"), a3);
}

- (SANPVideoAudioAndSubtitleLanguageOptions)audioAndSubtitleLanguageOptions
{
  return (SANPVideoAudioAndSubtitleLanguageOptions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("audioAndSubtitleLanguageOptions"));
}

- (void)setAudioAndSubtitleLanguageOptions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("audioAndSubtitleLanguageOptions"), a3);
}

- (BOOL)currentItemSteerable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("currentItemSteerable"));
}

- (void)setCurrentItemSteerable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("currentItemSteerable"), a3);
}

- (NSDictionary)currentListeningToContainer
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentListeningToContainer"));
}

- (void)setCurrentListeningToContainer:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentListeningToContainer"), a3);
}

- (SAMPMediaItem)listeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("listeningToItem"));
}

- (void)setListeningToItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("listeningToItem"), a3);
}

- (SAMPMediaItem)nextListeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nextListeningToItem"));
}

- (void)setNextListeningToItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nextListeningToItem"), a3);
}

- (SANPCommandInfo)nowPlayingCommandInfo
{
  return (SANPCommandInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nowPlayingCommandInfo"));
}

- (void)setNowPlayingCommandInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nowPlayingCommandInfo"), a3);
}

- (SAMPNowPlayingQueuePosition)playbackQueuePosition
{
  return (SAMPNowPlayingQueuePosition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playbackQueuePosition"));
}

- (void)setPlaybackQueuePosition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playbackQueuePosition"), a3);
}

- (NSNumber)playbackRate
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("playbackRate"));
}

- (void)setPlaybackRate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("playbackRate"), a3);
}

- (SAMPMediaItem)previousListenedToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("previousListenedToItem"));
}

- (void)setPreviousListenedToItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("previousListenedToItem"), a3);
}

- (NSNumber)shuffleEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("shuffleEnabled"));
}

- (void)setShuffleEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("shuffleEnabled"), a3);
}

- (NSString)source
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("source"));
}

- (void)setSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("source"), a3);
}

- (int)state
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAMPPlayStateForString(v2);

  return v3;
}

- (void)setState:(int)a3
{
  id v4;

  stringForSAMPPlayState(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("state"), v4);

}

@end
