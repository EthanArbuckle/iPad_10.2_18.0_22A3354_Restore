@implementation TUIOfflineCache

+ (TUIOfflineCacheProviding)provider
{
  return (TUIOfflineCacheProviding *)(id)qword_2CB1A0;
}

+ (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&qword_2CB1A0, a3);
}

@end
