@implementation MTForegroundSyncUtil

+ (MTForegroundSyncUtil)sharedInstance
{
  if (qword_1005520F0 != -1)
    swift_once(&qword_1005520F0, sub_10000597C);
  return (MTForegroundSyncUtil *)(id)static ForegroundSyncUtil.shared;
}

- (MTForegroundSyncUtil)init
{
  return (MTForegroundSyncUtil *)ForegroundSyncUtil.init()();
}

- (void)syncEverythingIfNeeded
{
  MTForegroundSyncUtil *v2;

  v2 = self;
  ForegroundSyncUtil.syncEverythingIfNeeded()();

}

- (void)setNeedsSyncing
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_needsSyncing) = 1;
}

- (void)feedUpdateAllPodcastsOnForeground
{
  MTForegroundSyncUtil *v2;

  v2 = self;
  ForegroundSyncUtil.feedUpdateAllPodcastsOnForeground()();

}

- (NSDate)lastExpectedFeedsUpdateDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  _BYTE v11[24];

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess(v7, v11, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)isa;
}

- (void)setLastExpectedFeedsUpdateDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void (*v10)(char *, _BYTE *, uint64_t);
  MTForegroundSyncUtil *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess((char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate, v13, 33, 0);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);

}

- (void)startCloudSyncAfterPrivacy
{
  MTForegroundSyncUtil *v2;

  v2 = self;
  ForegroundSyncUtil.startCloudSyncAfterPrivacy()();

}

- (void)updatePlaybackSettingIfNeeded
{
  MTForegroundSyncUtil *v2;

  v2 = self;
  ForegroundSyncUtil.updatePlaybackSettingIfNeeded()();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_syncController));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_categoriesSyncUtil));
  v3 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
