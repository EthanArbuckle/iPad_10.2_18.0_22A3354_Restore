@implementation SFMCachingContactDataProvider

- (void)contactStoreChangedWithNotification:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = swift_retain();
  sub_1CCCE4D60(v4);

  swift_release();
}

@end
