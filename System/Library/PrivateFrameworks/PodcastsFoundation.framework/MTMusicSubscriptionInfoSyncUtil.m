@implementation MTMusicSubscriptionInfoSyncUtil

- (MTMusicSubscriptionInfoSyncUtil)initWithBag:(id)a3 accountStore:(id)a4
{
  id v5;
  id v6;
  MTMusicSubscriptionInfoSyncUtil *v7;

  v5 = a3;
  v6 = a4;
  v7 = (MTMusicSubscriptionInfoSyncUtil *)sub_1A90C5018(v5, v6);

  return v7;
}

- (MTMusicSubscriptionInfoSyncUtil)init
{
  MTMusicSubscriptionInfoSyncUtil *result;

  result = (MTMusicSubscriptionInfoSyncUtil *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___MTMusicSubscriptionInfoSyncUtil_lastMusicSyncDate;
  v4 = sub_1A93F738C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
