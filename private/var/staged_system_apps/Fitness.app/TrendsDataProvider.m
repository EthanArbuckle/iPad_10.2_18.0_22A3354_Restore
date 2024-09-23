@implementation TrendsDataProvider

- (void)didReceiveNotificationWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _TtC10FitnessApp18TrendsDataProvider *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _TtC10FitnessApp18TrendsDataProvider *v22;
  char v24[24];

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = type metadata accessor for Calendar(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v13 = sub_100047110((uint64_t *)&unk_100832590);
  __chkstk_darwin(v13);
  v15 = &v24[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (!a3)
  {
    v21 = type metadata accessor for Notification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v15, 1, 1, v21);
    v22 = self;
LABEL_7:
    sub_10000FFA8();
    goto LABEL_8;
  }
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = type metadata accessor for Notification(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 0, 1, v16);
  v17 = qword_10081D558;
  v18 = self;
  if (v17 != -1)
    swift_once(&qword_10081D558, sub_100006F7C);
  v19 = sub_10003CE9C(v9, (uint64_t)qword_100869D40);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v19, v9);
  v20 = (char *)v18 + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_lastCalculatedDate;
  swift_beginAccess(v20, v24, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v20, v5);
  LOBYTE(v20) = Calendar.isDateInToday(_:)(v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((v20 & 1) == 0)
    goto LABEL_7;
LABEL_8:

  sub_10001BE90((uint64_t)v15, (uint64_t *)&unk_100832590);
}

- (void)wheelchairUseChangedWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp18TrendsDataProvider *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100221524();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC10FitnessApp18TrendsDataProvider)init
{
  _TtC10FitnessApp18TrendsDataProvider *result;

  result = (_TtC10FitnessApp18TrendsDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsDataProvider", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  _BYTE v5[1832];
  _BYTE v6[1832];

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_workoutProvider));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_pairedWatchManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsByTrendType365));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsByTrendType90));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_mannKendallTestByTrendType90));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_mannKendallTestByTrendType365));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_fitsByTrendType90));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_fitsByTrendType365));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_orderedValidUpTrends));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_orderedValidDownTrends));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_orderedInvalidTrends));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsBuilder));

  sub_10003F6A0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsCompilation365, (uint64_t)v5);
  sub_10003F0D8((uint64_t)v5);
  sub_10003F6A0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsCompilation90, (uint64_t)v6);
  sub_10003F0D8((uint64_t)v6);
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_lastCalculatedDate;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
