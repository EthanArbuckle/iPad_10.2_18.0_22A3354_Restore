@implementation SAMPSetPlaybackPosition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SetPlaybackPosition");
}

+ (id)setPlaybackPosition
{
  return objc_alloc_init((Class)a1);
}

- (int)position
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAMPPlaybackPositionForString(v2);

  return v3;
}

- (void)setPosition:(int)a3
{
  id v4;

  stringForSAMPPlaybackPosition(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), v4);

}

- (BOOL)requiresResponse
{
  return 0;
}

@end
