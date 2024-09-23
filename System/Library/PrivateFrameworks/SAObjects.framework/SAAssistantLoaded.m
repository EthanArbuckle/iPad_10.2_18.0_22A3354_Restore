@implementation SAAssistantLoaded

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AssistantLoaded");
}

+ (id)assistantLoaded
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appleConnectSessionToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appleConnectSessionToken"));
}

- (void)setAppleConnectSessionToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appleConnectSessionToken"), a3);
}

- (NSString)dataAnchor
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dataAnchor"));
}

- (void)setDataAnchor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dataAnchor"), a3);
}

- (NSNumber)requestSync
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestSync"));
}

- (void)setRequestSync:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestSync"), a3);
}

- (NSArray)syncAnchors
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("syncAnchors"), v3);
}

- (void)setSyncAnchors:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("syncAnchors"), (uint64_t)a3);
}

- (NSString)version
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("version"));
}

- (void)setVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("version"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
