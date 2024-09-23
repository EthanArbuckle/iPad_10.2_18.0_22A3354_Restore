@implementation SASetConnectionHeader

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetConnectionHeader");
}

+ (id)setConnectionHeader
{
  return objc_alloc_init((Class)a1);
}

- (NSString)aceHostHeader
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("aceHostHeader"));
}

- (void)setAceHostHeader:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("aceHostHeader"), a3);
}

- (SAConnectionPolicy)connectionPolicy
{
  return (SAConnectionPolicy *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("connectionPolicy"));
}

- (void)setConnectionPolicy:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("connectionPolicy"), a3);
}

- (BOOL)reconnectNow
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("reconnectNow"));
}

- (void)setReconnectNow:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("reconnectNow"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
