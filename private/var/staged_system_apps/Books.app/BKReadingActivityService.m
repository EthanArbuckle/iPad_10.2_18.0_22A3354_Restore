@implementation BKReadingActivityService

- (BSUIDynamicValue)dailyGoal
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_dailyGoal));
}

- (BSUIDynamicValue)finishedAssetsData
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsData));
}

- (BSUIDynamicValue)finishedAssetYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetYear));
}

- (BSUIDynamicValue)readingIndicatorTimeToday
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingIndicatorTimeToday));
}

- (BSUIDynamicValue)finishedAssetCountByYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetCountByYear));
}

- (BSUIDynamicValue)booksFinishedGoal
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_booksFinishedGoal));
}

- (BSUIDynamicValue)allTimeRecordStreakData
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_allTimeRecordStreakData));
}

- (BSUIDynamicArray)readingHistory
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingHistory));
}

+ (id)readingGoalsUserDefaultsKey
{
  return String._bridgeToObjectiveC()();
}

- (int64_t)currentStreak
{
  BKReadingActivityService *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ReadingActivityService.currentStreak.getter();
  v4 = v3;

  return v4;
}

- (double)readingTimeTodayIncludingUnflushed
{
  BKReadingActivityService *v2;
  double v3;

  v2 = self;
  v3 = ReadingActivityService.readingTimeTodayIncludingUnflushed()();

  return v3;
}

- (BSUIDynamicValue)didSeeWelcomeExperience
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_didSeeWelcomeExperience));
}

+ (NSString)includePDFsDefaultsKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (BSUIDynamicValue)isDailyGoalCompleted
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_isDailyGoalCompleted));
}

- (BOOL)readingGoalsEnabled
{
  return _s5Books22ReadingActivityServiceC19readingGoalsEnabledSbvg_0() & 1;
}

- (BSUIDynamicValue)readingTimeToday
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingTimeToday));
}

- (BSUIDynamicArray)finishedAssets
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssets));
}

- (BSUIDynamicValue)finishedAssetAllTimeCount
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetAllTimeCount));
}

- (BSUIDynamicValue)booksPerYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_booksPerYear));
}

- (BSUIDynamicValue)timeReadPerMonth
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_timeReadPerMonth));
}

- (BOOL)enableCloudSync
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BKReadingActivityService_enableCloudSync;
  swift_beginAccess((char *)self + OBJC_IVAR___BKReadingActivityService_enableCloudSync, v4, 0, 0);
  return *v2;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BKReadingActivityService *v4;

  v4 = self;
  ReadingActivityService.enableCloudSync.setter(a3);

}

- (int64_t)allTimeRecordStreak
{
  BKReadingActivityService *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ReadingActivityService.allTimeRecordStreak.getter();
  v4 = v3;

  return v4;
}

- (int64_t)timeReadToday
{
  BKReadingActivityService *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ReadingActivityService.timeReadToday.getter();
  v4 = v3;

  return v4;
}

- (BOOL)todayIsStreakDay
{
  BKReadingActivityService *v2;
  char v3;
  char v4;

  v2 = self;
  ReadingActivityService.todayIsStreakDay.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)setReadingGoalsEnabled:(BOOL)a3
{
  void *v4;
  BKReadingActivityService *v5;
  id v6;
  id v7;
  Class isa;
  id v9;

  v4 = (void *)objc_opt_self(BUAppGroup);
  v5 = self;
  v6 = objc_msgSend(v4, "books");
  v7 = objc_msgSend(v6, "userDefaults");

  isa = Bool._bridgeToObjectiveC()().super.super.isa;
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "setValue:forKey:", isa, v9);

}

- (id)fetchReadingGoalsNotificationEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100911EE0, (uint64_t)sub_1005978F8, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_100911EF8);
}

- (id)updateReadingGoalsNotificationEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100911E90, (uint64_t)sub_1005978F0, (uint64_t)sub_1005C5EA8, (uint64_t)&unk_100911EA8);
}

- (id)fetchReadingGoalsCoachingEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100911E40, (uint64_t)sub_1005978F4, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_100911E58);
}

- (id)updateReadingGoalsCoachingEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100911DF0, (uint64_t)sub_1005978EC, (uint64_t)sub_1005C5EA8, (uint64_t)&unk_100911E08);
}

- (void)clearData
{
  BKReadingActivityService *v2;

  v2 = self;
  ReadingActivityService.clearData()();

}

- (void)handleCloudChangeNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  BKReadingActivityService *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005912DC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BKReadingActivityService)init
{
  BKReadingActivityService *result;

  result = (BKReadingActivityService *)_swift_stdlib_reportUnimplementedInitializer("Books.ReadingActivityService", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsAfterCurrentYearCount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsPriorToCurrentYearCount));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_readingHistoryPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService__setupState));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_welcomeTimers));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___BKReadingActivityService_readingTimeTodayDynamicProgress));

  sub_100010960((uint64_t)self + OBJC_IVAR___BKReadingActivityService_goalsModule, &qword_1009ECAC8);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKReadingActivityService_booksFinishedModule, &qword_1009ECAD0);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKReadingActivityService_historyModule, &qword_1009ECAD8);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKReadingActivityService_sessionEventProvider, (uint64_t *)&unk_1009ECAE0);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_achievementsController));
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_cloudSyncStateHandler), *(_QWORD *)&self->dailyGoal[OBJC_IVAR___BKReadingActivityService_cloudSyncStateHandler]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_notificationSuppressingEventHandler), *(_QWORD *)&self->dailyGoal[OBJC_IVAR___BKReadingActivityService_notificationSuppressingEventHandler]);

}

- (void)changeBooksPerYearGoal:(int64_t)a3 :(BOOL)a4
{
  BKReadingActivityService *v6;

  v6 = self;
  ReadingActivityService.changeBooksPerYearGoal(_:_:)(a3, a4);

}

- (void)changeDailyGoal:(double)a3 :(BOOL)a4
{
  BKReadingActivityService *v6;

  v6 = self;
  ReadingActivityService.changeDailyGoal(_:_:)(a3, a4);

}

- (void)setCurrentBooksFinishedStateTo:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BKReadingActivityService *v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];

  v5 = (char *)self + OBJC_IVAR___BKReadingActivityService_booksFinishedModule;
  swift_beginAccess((char *)self + OBJC_IVAR___BKReadingActivityService_booksFinishedModule, v12, 0, 0);
  if (*((_QWORD *)v5 + 3))
  {
    sub_10002E418((uint64_t)(v5 + 40), (uint64_t)v9);
    v6 = v10;
    v7 = v11;
    sub_10003F198(v9, v10);
    v8 = self;
    dispatch thunk of BooksFinishedEventProcessor.setState(year:)(a3, v6, v7);
    _s5Books15CurrentPageViewVwxx_0(v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)setReadingHistoryWithBeginning:(id)a3 ending:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  BKReadingActivityService *v17;
  void (*v18)(char *, uint64_t);
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)v19 - v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = (char *)self + OBJC_IVAR___BKReadingActivityService_historyModule;
  swift_beginAccess((char *)self + OBJC_IVAR___BKReadingActivityService_historyModule, v22, 0, 0);
  if (*((_QWORD *)v14 + 3))
  {
    sub_10002E418((uint64_t)(v14 + 40), (uint64_t)v19);
    v15 = v20;
    v16 = v21;
    sub_10003F198(v19, v20);
    v17 = self;
    dispatch thunk of ReadingHistoryEventProcessor.setReadingHistory(beginning:ending:)(v13, v10, v15, v16);
    _s5Books15CurrentPageViewVwxx_0(v19);

    v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v18(v10, v7);
    v18(v13, v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)setReadingHistoryForWeekWithEnding:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BKReadingActivityService *v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR___BKReadingActivityService_historyModule;
  swift_beginAccess((char *)self + OBJC_IVAR___BKReadingActivityService_historyModule, v16, 0, 0);
  if (*((_QWORD *)v9 + 3))
  {
    sub_10002E418((uint64_t)(v9 + 40), (uint64_t)v13);
    v10 = v14;
    v11 = v15;
    sub_10003F198(v13, v14);
    v12 = self;
    dispatch thunk of ReadingHistoryEventProcessor.setReadingHistoryForWeek(ending:)(v8, v10, v11);
    _s5Books15CurrentPageViewVwxx_0(v13);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)setCurrentActiveAchievementSheetWithKind:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService__currentActiveAchievementSheetKind) = (Class)a3;
}

- (void)suppressNotifications
{
  BKReadingActivityService *v2;

  v2 = self;
  ReadingActivityService.suppressNotifications()();

}

- (void)resumeNotifications
{
  BKReadingActivityService *v2;

  v2 = self;
  ReadingActivityService.resumeNotifications()();

}

- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7
{
  char v7;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  id v18;
  BKReadingActivityService *v19;
  uint64_t v20;

  v7 = a7;
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  v18 = a3;
  swift_unknownObjectRetain(a6);
  v19 = self;
  sub_100596910((uint64_t)v17, a5, a6, v7);

  swift_unknownObjectRelease(a6);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
}

- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8
{
  char v8;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  id v18;
  BKReadingActivityService *v19;
  uint64_t v20;

  v8 = a8;
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  v18 = a3;
  swift_unknownObjectRetain(a7);
  v19 = self;
  sub_100597198((uint64_t)v17, a7, v8);

  swift_unknownObjectRelease(a7);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
}

- (void)dynamicProgressChanged:(id)a3
{
  BKReadingActivityService *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  ReadingActivityService.dynamicProgressChanged(_:)(a3);
  swift_unknownObjectRelease(a3);

}

- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5
{
  _BOOL8 v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BKReadingActivityService *v18;
  uint64_t v19;

  v6 = a4;
  v9 = sub_10004CFD4(&qword_1009D7440);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v15 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  v17 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_achievementsController);
  if (v17)
  {
    v18 = self;
    swift_retain(v17);
    dispatch thunk of ReadingAchievementsController.willMarkAsset(_:finished:finishedDate:)(v12, v14, v6, v11);

    swift_bridgeObjectRelease(v14);
    swift_release(v17);
    sub_100010960((uint64_t)v11, &qword_1009D7440);
  }
  else
  {
    __break(1u);
  }
}

@end
