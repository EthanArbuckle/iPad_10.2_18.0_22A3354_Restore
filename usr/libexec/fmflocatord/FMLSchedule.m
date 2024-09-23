@implementation FMLSchedule

- (unint64_t)startHour
{
  return sub_100030E4C(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

- (unint64_t)startMin
{
  return sub_100030E4C(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

- (unint64_t)daysOfWeek
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC11fmflocatord11FMLSchedule *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v16;

  v3 = type metadata accessor for Fence.DaysOfWeek(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Fence.Schedule(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  v12 = Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.daysOfWeek.getter(v12);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = Fence.DaysOfWeek.rawValue.getter(v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v14;
}

- (unint64_t)endHour
{
  return sub_100030E4C(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

- (unint64_t)endMin
{
  return sub_100030E4C(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

- (unint64_t)spanDays
{
  return 0;
}

- (NSTimeZone)timeZone
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC11fmflocatord11FMLSchedule *v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v3 = type metadata accessor for Fence.Schedule(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TimeZone(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  v12 = Fence.Schedule.Matcher.schedule.getter(v11);
  Fence.Schedule.timeZone.getter(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  isa = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (NSTimeZone *)isa;
}

- (BOOL)isCurrentAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11fmflocatord11FMLSchedule *v9;
  char v10;
  uint64_t v12;

  v5 = type metadata accessor for Date(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = Fence.Schedule.Matcher.doesMatchSchedule(_:)(v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10 & 1;
}

- (id)nextStartOrEndDateFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC11fmflocatord11FMLSchedule *v12;
  void (*v13)(char *, uint64_t);
  Class isa;
  uint64_t v16;

  v5 = type metadata accessor for Date(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10002C518(&qword_100069530);
  __chkstk_darwin(v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = self;
  Fence.Schedule.Matcher.nextStartOrEndDate(from:)(v8);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    v13(v11, v5);
  }
  return isa;
}

- (_TtC11fmflocatord11FMLSchedule)init
{
  _TtC11fmflocatord11FMLSchedule *result;

  result = (_TtC11fmflocatord11FMLSchedule *)_swift_stdlib_reportUnimplementedInitializer("fmflocatord.FMLSchedule", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher;
  v3 = type metadata accessor for Fence.Schedule.Matcher(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (id)dictionary
{
  _TtC11fmflocatord11FMLSchedule *v2;
  unint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_10003174C();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (_TtC11fmflocatord11FMLSchedule)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  return (_TtC11fmflocatord11FMLSchedule *)sub_100031E58(v3);
}

@end
