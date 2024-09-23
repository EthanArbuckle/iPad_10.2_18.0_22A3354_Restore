@implementation TrendListMetricView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_titleLabel));
}

- (UILabel)valueLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_valueLabel));
}

- (_TtC10FitnessApp19TrendListMetricView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp19TrendListMetricView *)sub_1004AB45C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp19TrendListMetricView)initWithCoder:(id)a3
{
  sub_1004ABBA4(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_arrowIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_valueLabel));
}

- (NSString)trendString
{
  _TtC10FitnessApp19TrendListMetricView *v2;
  CHWorkoutDetailHeartRateTableViewCell *v3;
  CHWorkoutDetailHeartRateTableViewCell *v4;
  NSString v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = self;
  sub_1004ABEF8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  return (NSString *)v5;
}

@end
