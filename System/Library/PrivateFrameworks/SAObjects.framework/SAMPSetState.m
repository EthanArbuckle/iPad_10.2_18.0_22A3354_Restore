@implementation SAMPSetState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SetState");
}

+ (id)setState
{
  return objc_alloc_init((Class)a1);
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
