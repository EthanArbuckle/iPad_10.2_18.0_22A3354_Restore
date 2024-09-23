@implementation KmlKeyManagementInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KmlKeyManagementProtocol);
}

@end
