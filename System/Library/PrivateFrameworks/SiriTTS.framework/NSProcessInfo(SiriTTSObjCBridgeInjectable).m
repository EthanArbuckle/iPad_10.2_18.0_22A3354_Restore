@implementation NSProcessInfo(SiriTTSObjCBridgeInjectable)

+ (void)injectProcessInfo:()SiriTTSObjCBridgeInjectable
{
  objc_storeStrong((id *)&NSProcessInfoObjCBridge::injectedProcessInfo, obj);
}

+ (id)injectedProcessInfo
{
  return (id)NSProcessInfoObjCBridge::injectedProcessInfo;
}

@end
