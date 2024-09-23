@implementation TrendDetailDailyAverageView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_titleLabel));
}

- (NSArray)dayStops
{
  _TtC10FitnessApp27TrendDetailDailyAverageView *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  sub_1001D3004();
  v4 = v3;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp27TrendDetailDailyAverageView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001D4040();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)layoutSubviews
{
  _TtC10FitnessApp27TrendDetailDailyAverageView *v2;

  v2 = self;
  sub_1001D712C();

}

- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithCoder:(id)a3
{
  sub_1001D744C(a3);
  return 0;
}

- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp27TrendDetailDailyAverageView *result;

  result = (_TtC10FitnessApp27TrendDetailDailyAverageView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendDetailDailyAverageView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram90);
  v4 = *(_QWORD *)&self->type[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram90];
  v5 = *(_QWORD *)&self->histogram90[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram90 + 47];
  swift_bridgeObjectRelease(*(_QWORD *)&self->histogram90[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram90
                                                        + 55]);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram365);
  v7 = *(_QWORD *)&self->type[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram365];
  v8 = *(_QWORD *)&self->histogram90[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram365 + 47];
  swift_bridgeObjectRelease(*(_QWORD *)&self->histogram90[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_histogram365
                                                        + 55]);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_chartContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_container90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_container365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_textContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_gradientLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_barLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_gradientLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_barLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_chartMask));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_dayOfWeekLabels));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_dayOfWeekStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_minAxisLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_midAxisLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_maxValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_div));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platterCenterLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_longPressRecognizer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->type[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_title90]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->type[OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_title365]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platterCenterXConstraint));
}

- (void)longPressWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp27TrendDetailDailyAverageView *v5;

  v4 = a3;
  v5 = self;
  sub_1001D7D2C(v4);

}

- (HKUnit)accessibilityUnit
{
  char v2;
  void *v3;
  _TtC10FitnessApp27TrendDetailDailyAverageView *v4;
  HKUnit *result;
  HKUnit *v6;
  void *v7;
  void *v8;

  v2 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_type);
  v3 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_formattingManager)
                + OBJC_IVAR____TtC10FitnessApp23TrendsFormattingManager_fiuiFormatter);
  v4 = self;
  result = (HKUnit *)objc_msgSend(v3, "unitManager");
  if (result)
  {
    v6 = result;
    sub_100036BCC((uint64_t)result, v2);
    v8 = v7;

    return (HKUnit *)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)accessibilityDayForStopIndex:(int64_t)a3
{
  return sub_1001D8A60((id)a3);
}

- (id)accessibiliytQuantity90ForIndex:(int64_t)a3
{
  _TtC10FitnessApp27TrendDetailDailyAverageView *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1001D8408(a3);

  return v5;
}

- (id)accessibiliytQuantity365ForIndex:(int64_t)a3
{
  _TtC10FitnessApp27TrendDetailDailyAverageView *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1001D856C(a3);

  return v5;
}

@end
