@implementation ReadingHistoryController

- (void)handlePlaceholderStreakDayGoalNeedsUpdate:(id)a3
{
  sub_1AE4BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1ADB4C);
}

- (void)handleSignificantDateChange:(id)a3
{
  sub_1AE4BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1ADC60);
}

- (void)createFakeSession:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  sub_1AE560((uint64_t)v8);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)clearTodaysReadingTime
{
  swift_retain(self);
  sub_1AEA38();
  swift_release(self);
}

@end
