@implementation SAAssetManagerFactory

+ (id)safariAssistantAssetManagerWithLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_2459D9728();
  v5 = sub_2459C869C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (SAAssetManagerFactory)init
{
  return (SAAssetManagerFactory *)SAAssetManagerFactory.init()();
}

@end
