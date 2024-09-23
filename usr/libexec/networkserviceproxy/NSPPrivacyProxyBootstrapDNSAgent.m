@implementation NSPPrivacyProxyBootstrapDNSAgent

+ (id)dnsAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_100112A38);
}

@end
