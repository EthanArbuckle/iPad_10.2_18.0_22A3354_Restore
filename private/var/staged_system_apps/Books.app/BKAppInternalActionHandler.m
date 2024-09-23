@implementation BKAppInternalActionHandler

- (BKAppInternalActionHandler)initWithApplication:(id)a3 sceneManager:(id)a4
{
  return (BKAppInternalActionHandler *)sub_100015A44((uint64_t)a3, (uint64_t)a4);
}

- (void)validateCommand:(id)a3
{
  id v4;
  BKAppInternalActionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_100368E90(v4);

}

- (void)books_internal_presentDebugMenu:(id)a3
{
  sub_100369CA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1003697C4);
}

- (void)books_internal_simulateMemoryWarning:(id)a3
{
  BKAppInternalActionHandler *v5;
  uint64_t v6;
  BKAppInternalActionHandler *v7;
  id v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  v8 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v8, "postNotificationName:object:", UIApplicationDidReceiveMemoryWarningNotification, *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_application));

  sub_10004A7B8((uint64_t)v9);
}

- (void)books_internal_openRedeemURL:(id)a3
{
  sub_100369CA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1003699B0);
}

- (void)books_internal_toggleFakePlayer:(id)a3
{
  sub_100369CA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100369B98);
}

- (void)books_internal_toggleRecordingLiveResizeStats:(id)a3
{
  BKAppInternalActionHandler *v5;
  uint64_t v6;
  BKAppInternalActionHandler *v7;
  __int128 v8;
  __int128 v9;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults), "setBool:forKey:", objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults), "BOOLForKey:", TUIUserDefaultRecordLiveResizeStats, v8, v9) ^ 1, TUIUserDefaultRecordLiveResizeStats);

  sub_10004A7B8((uint64_t)&v8);
}

- (void)books_internal_disableStoreInternalDebugMessageUI:(id)a3
{
  BKAppInternalActionHandler *v5;
  uint64_t v6;
  BKAppInternalActionHandler *v7;
  void *v8;
  NSString v9;
  unsigned int v10;
  NSString v11;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v7 = self;
  }
  v8 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v8, "BOOLForKey:", v9);

  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setBool:forKey:", v10 ^ 1, v11);

  sub_10004A7B8((uint64_t)v12);
}

- (void)books_internal_triggerFakeDailyReadingGoalAchievementNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BKAppInternalActionHandler *v8;
  uint64_t v9;
  BKAppInternalActionHandler *v10;
  _OWORD v11[2];

  v5 = type metadata accessor for Achievement(0);
  __chkstk_darwin(v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v10 = self;
  }
  *(_QWORD *)v7 = 0;
  v7[8] = 0;
  swift_storeEnumTagMultiPayload(v7, v5, 0);
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v7, 0);
  sub_10036BA60((uint64_t)v7);

  sub_10004A7B8((uint64_t)v11);
}

- (void)books_internal_triggerFakeYearlyBooksGoalAchievementNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  BKAppInternalActionHandler *v8;
  uint64_t v9;
  BKAppInternalActionHandler *v10;
  _OWORD v11[2];

  v5 = type metadata accessor for Achievement(0);
  __chkstk_darwin(v5);
  v7 = (_QWORD *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v10 = self;
  }
  *v7 = 0;
  swift_storeEnumTagMultiPayload(v7, v5, 1);
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v7, 0);
  sub_10036BA60((uint64_t)v7);

  sub_10004A7B8((uint64_t)v11);
}

- (void)books_internal_triggerFakeLongestStreakNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BKAppInternalActionHandler *v11;
  uint64_t v12;
  BKAppInternalActionHandler *v13;
  uint64_t v14;
  _OWORD v15[2];

  v5 = type metadata accessor for Date(0);
  __chkstk_darwin(v5);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Achievement(0);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    v11 = self;
    v12 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v13 = self;
  }
  v14 = sub_10004CFD4(&qword_1009DD7F8);
  *v10 = 88;
  Date.init()(v14);
  ReadingHistoryModel.DayKey.init(_:)(v7);
  swift_storeEnumTagMultiPayload(v10, v8, 2);
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v10, 0);
  sub_10036BA60((uint64_t)v10);

  sub_10004A7B8((uint64_t)v15);
}

- (void)books_internal_selectSidebarItem:(id)a3
{
  sub_10036B478(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10036A1BC);
}

- (void)books_internal_selectSidebarSearch:(id)a3
{
  BKAppInternalActionHandler *v5;
  uint64_t v6;
  BKAppInternalActionHandler *v7;
  id v8;
  id v9;
  NSString v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v7 = self;
  }
  v8 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_sceneManager), "primarySceneController", v11, v12);
  v9 = objc_msgSend(v8, "rootBarCoordinator");

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    objc_msgSend(v9, "selectWithIdentifier:isUserAction:", v10, 1);

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_10004A7B8((uint64_t)&v11);
}

- (void)books_internal_selectSidebarCollection:(id)a3
{
  sub_10036B478(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10036A5CC);
}

- (void)books_internal_setLegacyAccount:(id)a3
{
  sub_10036B478(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10036A91C);
}

- (void)books_internal_incrementPostLaunchCacheCount:(id)a3
{
  BKAppInternalActionHandler *v5;
  uint64_t v6;
  BKAppInternalActionHandler *v7;
  id v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = self;
  }
  v8 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_1009CE7A8 != -1)
    swift_once(&qword_1009CE7A8, sub_1005195CC);
  objc_msgSend(v8, "postNotificationName:object:", qword_100A1EBE0, *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_application), v9, v10);

  sub_10004A7B8((uint64_t)&v9);
}

- (BKAppInternalActionHandler)init
{
  BKAppInternalActionHandler *result;

  result = (BKAppInternalActionHandler *)_swift_stdlib_reportUnimplementedInitializer("Books.AppInternalActionHandler", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
