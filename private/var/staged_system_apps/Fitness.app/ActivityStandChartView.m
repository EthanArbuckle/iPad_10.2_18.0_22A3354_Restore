@implementation ActivityStandChartView

- (_TtC10FitnessApp22ActivityStandChartView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp22ActivityStandChartView *result;

  sub_1005B7548(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC10FitnessApp22ActivityStandChartView)initWithCoder:(id)a3
{
  sub_1005B7B1C(a3);
  return 0;
}

- (void)dealloc
{
  _TtC10FitnessApp22ActivityStandChartView *v2;

  v2 = self;
  sub_1005B7CD0();
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___stoodHistogram), *(_QWORD *)&self->$__lazy_storage_$_stoodHistogram[OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___stoodHistogram]);
  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___sedentaryHistogram), *(_QWORD *)&self->$__lazy_storage_$_stoodHistogram[OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___sedentaryHistogram]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___stoodBarLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___sedentaryBarLayer));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_labels), v3, v4, v5, v6, v7, v8, v9);
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_listener);
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_dataProvider);
}

- (void)layoutSubviews
{
  _TtC10FitnessApp22ActivityStandChartView *v2;

  v2 = self;
  sub_1005B87E8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_chartHeight);
  sub_100307E60();
  v6 = v4 + v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  _TtC10FitnessApp22ActivityStandChartView *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v3 = (void *)objc_opt_self(UIScreen);
  v4 = self;
  v5 = objc_msgSend(v3, "mainScreen");
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  -[ActivityStandChartView sizeThatFits:](v4, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (NSArray)standChartPoints
{
  _TtC10FitnessApp22ActivityStandChartView *v2;
  CHWorkoutDetailHeartRateTableViewCell *v3;
  Class isa;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = self;
  v3 = sub_1005B8D08();

  type metadata accessor for CGPoint(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  return (NSArray *)isa;
}

@end
