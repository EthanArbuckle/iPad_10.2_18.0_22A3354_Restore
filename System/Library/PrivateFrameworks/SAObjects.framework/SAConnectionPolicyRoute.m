@implementation SAConnectionPolicyRoute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ConnectionPolicyRoute");
}

+ (id)connectionPolicyRoute
{
  return objc_alloc_init((Class)a1);
}

- (NSString)cname
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("cname"));
}

- (void)setCname:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("cname"), a3);
}

- (NSString)connectionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("connectionId"));
}

- (void)setConnectionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("connectionId"), a3);
}

- (NSString)host
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("host"));
}

- (void)setHost:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("host"), a3);
}

- (NSNumber)mptcp
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mptcp"));
}

- (void)setMptcp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mptcp"), a3);
}

- (int64_t)priority
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("priority"));
}

- (void)setPriority:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("priority"), a3);
}

- (NSString)resolver
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resolver"));
}

- (void)setResolver:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resolver"), a3);
}

- (NSString)resolverProtocol
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resolverProtocol"));
}

- (void)setResolverProtocol:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resolverProtocol"), a3);
}

- (NSString)routeId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeId"));
}

- (void)setRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeId"), a3);
}

- (NSNumber)timeout
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeout"));
}

- (void)setTimeout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeout"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
