@implementation SAMPMediaPlayerOrderingTerm

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MediaPlayerOrderingTerm");
}

+ (id)mediaPlayerOrderingTerm
{
  return objc_alloc_init((Class)a1);
}

- (NSString)mediaPlayerOrderingDirection
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaPlayerOrderingDirection"));
}

- (void)setMediaPlayerOrderingDirection:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaPlayerOrderingDirection"), a3);
}

- (int)mediaPlayerSearchProperty
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaPlayerSearchProperty"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAMPSearchPropertyForString(v2);

  return v3;
}

- (void)setMediaPlayerSearchProperty:(int)a3
{
  id v4;

  stringForSAMPSearchProperty(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaPlayerSearchProperty"), v4);

}

@end
