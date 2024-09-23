@implementation NEVPNAuthenticationPlugin

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEVPNAuthenticationPluginDriver);
}

@end
