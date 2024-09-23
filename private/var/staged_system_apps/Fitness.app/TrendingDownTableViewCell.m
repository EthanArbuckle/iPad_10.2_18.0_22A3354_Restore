@implementation TrendingDownTableViewCell

- (_TtC10FitnessApp19TrendListMetricView)view
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_view));
}

- (UILabel)detailLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_detailLabel));
}

- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp25TrendingDownTableViewCell *)sub_1001F4F34(a3, (uint64_t)a4, v6);
}

- (void)selectionButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp25TrendingDownTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001F61A8();

}

- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithCoder:(id)a3
{
  sub_1001F5C5C(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_view));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_button));
  swift_release(*(_QWORD *)&self->insetContentView[OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_selectionFunction]);
  sub_1001F6168((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_metric);
}

@end
