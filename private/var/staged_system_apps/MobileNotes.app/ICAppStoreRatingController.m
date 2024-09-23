@implementation ICAppStoreRatingController

- (ICCloudConfiguration)cloudConfiguration
{
  return (ICCloudConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICAppStoreRatingController_cloudConfiguration));
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICAppStoreRatingController_userDefaults));
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___ICAppStoreRatingController_windowScene));
}

- (BOOL)didRequestRating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_didRequestRating);
}

- (void)setDidRequestRating:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICAppStoreRatingController *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v5 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_didRequestRating) = v3;
  if (v3)
  {
    v8 = self;
    static Date.now.getter(v8);
    v9 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
    sub_1003CDFF8((uint64_t)v7);

  }
}

- (NSArray)launchDates
{
  ICAppStoreRatingController *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1003CE170();

  type metadata accessor for Date(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSDate)lastRequestDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ICAppStoreRatingController *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1003CE368((uint64_t)v5);

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setLastRequestDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  ICAppStoreRatingController *v10;
  uint64_t v11;

  v5 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1003CDFF8((uint64_t)v7);

}

- (int64_t)totalNoteCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_totalNoteCount);
}

- (void)setTotalNoteCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_totalNoteCount) = (Class)a3;
}

- (NSDate)lastEditDate
{
  return (NSDate *)sub_1003CE5AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAppStoreRatingController_lastEditDate);
}

- (void)setLastEditDate:(id)a3
{
  sub_1003CE694(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ICAppStoreRatingController_lastEditDate);
}

- (NSDate)lastInteractionDate
{
  return (NSDate *)sub_1003CE5AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate);
}

- (void)setLastInteractionDate:(id)a3
{
  sub_1003CE694(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate);
}

- (int64_t)maximumPersistedLaunchDaysCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___ICAppStoreRatingController_maximumPersistedLaunchDaysCount);
}

- (void)setMaximumPersistedLaunchDaysCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_maximumPersistedLaunchDaysCount) = (Class)a3;
}

- (void)didLaunch
{
  ICAppStoreRatingController *v2;

  v2 = self;
  sub_1003CDBD4();

}

- (void)didEdit
{
  ICAppStoreRatingController *v2;

  v2 = self;
  sub_1003CD93C();

}

- (void)didInteract
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  ICAppStoreRatingController *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v11[24];

  v3 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = self;
  static Date.now.getter(v6);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  v8 = (uint64_t)v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate;
  swift_beginAccess((char *)v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate, v11, 33, 0);
  sub_1001CE964((uint64_t)v5, v8);
  swift_endAccess(v11);
  v9 = sub_1003CE790();
  objc_msgSend(v9, "requestFire");

}

- (void)updateTotalNoteCount:(int64_t)a3
{
  ICAppStoreRatingController *v4;

  v4 = self;
  sub_1003CD780(a3);

}

- (void)didStopInteracting
{
  ICAppStoreRatingController *v2;

  v2 = self;
  sub_1003CEFFC();

}

- (ICAppStoreRatingController)init
{
  ICAppStoreRatingController *result;

  result = (ICAppStoreRatingController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.AppStoreRatingController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_cohort));
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICAppStoreRatingController_lastEditDate, (uint64_t *)&unk_1005D7B20);
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate, (uint64_t *)&unk_1005D7B20);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICAppStoreRatingController____lazy_storage___interactionSelectorDelayer));
}

@end
