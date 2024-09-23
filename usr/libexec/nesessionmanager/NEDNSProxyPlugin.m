@implementation NEDNSProxyPlugin

- (id)remotePluginInterface
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEDNSProxyPluginDriver));
  v3 = objc_opt_class(NSArray);
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(NEDNSSettings), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "setSystemDNSSettings:", 0, 0);

  return v2;
}

@end
