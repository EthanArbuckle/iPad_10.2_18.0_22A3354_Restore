@implementation TrendDetailChartView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_titleLabel));
}

- (UILabel)chartMaxLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMaxLabel));
}

- (NSArray)barStops
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barStops);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setBarStops:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for CGFloat);
  v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barStops);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barStops) = v4;
  swift_bridgeObjectRelease(v5);
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp20TrendDetailChartView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005BCEE8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)layoutSubviews
{
  _TtC10FitnessApp20TrendDetailChartView *v2;

  v2 = self;
  sub_1005C017C();

}

- (_TtC10FitnessApp20TrendDetailChartView)initWithCoder:(id)a3
{
  sub_1005C0C04(a3);
  return 0;
}

- (_TtC10FitnessApp20TrendDetailChartView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp20TrendDetailChartView *result;

  result = (_TtC10FitnessApp20TrendDetailChartView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendDetailChartView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CHWorkoutDetailHeartRateTableViewCell *v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CHWorkoutDetailHeartRateTableViewCell *v32;
  SEL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  SEL v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  CHWorkoutDetailHeartRateTableViewCell *v47;
  SEL v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  SEL v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  SEL v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  SEL v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  SEL v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;

  v9 = *(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_histogram90);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->type[OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_histogram90], a2, v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRelease(v9, v10, v11, v12, v13, v14, v15, v16);
  v17 = *(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa
                                                  + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_histogram365);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->type[OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_histogram365], v18, v19, v20, v21, v22, v23, v24);
  swift_bridgeObjectRelease(v17, v25, v26, v27, v28, v29, v30, v31);
  v32 = *(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa
                                                  + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartHistogram90);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->type[OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartHistogram90], v33, v34, v35, v36, v37, v38, v39);
  swift_bridgeObjectRelease(v32, v40, v41, v42, v43, v44, v45, v46);
  v47 = *(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa
                                                  + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartHistogram365);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->type[OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartHistogram365], v48, v49, v50, v51, v52, v53, v54);
  swift_bridgeObjectRelease(v47, v55, v56, v57, v58, v59, v60, v61);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMaxLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_container365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_container90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_gradientLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_gradientLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_lineLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_lineLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_averagePlatter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_averagePlatter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpole));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisMonthLabels), v62, v63, v64, v65, v66, v67, v68);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisYearLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_monthLabelsStackView));

  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barStops), v69, v70, v71, v72, v73, v74, v75);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_lineStops), v76, v77, v78, v79, v80, v81, v82);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_firstFirstOfMonth, &qword_10083C7F0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_januaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_stackViewLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_stackViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_yearLabelLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter90CenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter90CenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter365CenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter365CenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpoleBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpoleCenterXConstraint));
}

- (void)longPressWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp20TrendDetailChartView *v5;

  v4 = a3;
  v5 = self;
  sub_1005C1CAC(v4);

}

- (HKUnit)accessibilityUnit
{
  char v2;
  void *v3;
  _TtC10FitnessApp20TrendDetailChartView *v4;
  HKUnit *result;
  HKUnit *v6;
  void *v7;
  void *v8;

  v2 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_type);
  v3 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_formattingManager)
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

- (id)accessibilityDateIntervalForIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10FitnessApp20TrendDetailChartView *v8;
  uint64_t v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;

  v5 = sub_100047110((uint64_t *)&unk_100827440);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1005C2B1C(a3, (uint64_t)v7);

  v9 = type metadata accessor for DateInterval(0);
  v10 = *(_QWORD *)(v9 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return isa;
}

- (id)accessibilityQuantityForIndex:(int64_t)a3
{
  _TtC10FitnessApp20TrendDetailChartView *v4;
  id v5;

  v4 = self;
  v5 = sub_1005C2EDC(a3);

  return v5;
}

@end
