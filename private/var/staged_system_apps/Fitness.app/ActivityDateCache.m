@implementation ActivityDateCache

- (_TtC10FitnessApp17ActivityDateCache)init
{
  return (_TtC10FitnessApp17ActivityDateCache *)sub_100010A54();
}

- (NSDate)currentDeviceDate
{
  return (NSDate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate));
}

- (void)setCurrentDeviceDate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate) = (Class)a3;
  v3 = a3;

}

- (NSDate)currentSelectedDate
{
  return (NSDate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate));
}

- (void)setCurrentSelectedDate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate) = (Class)a3;
  v3 = a3;

}

- (void)setWithCurrentDeviceDate:(id)a3 caller:(id)a4
{
  sub_1001E2E64(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1001E2D04);
}

- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4
{
  sub_1001E2E64(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1001E2D34);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)Calendar._bridgeToObjectiveC()().super.isa;
}

- (HKDateCache)dateCache
{
  return (HKDateCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_dateCache));
}

- (void)dealloc
{
  void *v2;
  _TtC10FitnessApp17ActivityDateCache *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_dateCache);
  v3 = self;
  objc_msgSend(v2, "removeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ActivityDateCache(0);
  -[ActivityDateCache dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_calendar;
  v4 = type metadata accessor for Calendar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp17ActivityDateCache *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v7 = type metadata accessor for Notification(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)Notification.name.getter();
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIApplicationSignificantTimeChangeNotification);
  if (v14 == v17 && v16 == v18)
  {

    swift_bridgeObjectRelease_n(v16, 2);
  }
  else
  {
    v20 = v18;
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, v17, v18, 0);

    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v20);
    if ((v21 & 1) == 0)
      goto LABEL_9;
  }
  sub_1001E3170();
LABEL_9:

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
