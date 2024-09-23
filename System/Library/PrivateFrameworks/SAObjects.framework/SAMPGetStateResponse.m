@implementation SAMPGetStateResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GetStateResponse");
}

+ (id)getStateResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSString)hashedGroupID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedGroupID"));
}

- (void)setHashedGroupID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedGroupID"), a3);
}

- (SAMPMediaItem)listeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("listeningToItem"));
}

- (void)setListeningToItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("listeningToItem"), a3);
}

- (NSNumber)listeningToMusicApplication
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listeningToMusicApplication"));
}

- (void)setListeningToMusicApplication:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listeningToMusicApplication"), a3);
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
