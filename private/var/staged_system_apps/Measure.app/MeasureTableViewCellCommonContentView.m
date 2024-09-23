@implementation MeasureTableViewCellCommonContentView

- (_TtC7Measure37MeasureTableViewCellCommonContentView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure37MeasureTableViewCellCommonContentView *)sub_10009BAC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure37MeasureTableViewCellCommonContentView)initWithCoder:(id)a3
{
  return (_TtC7Measure37MeasureTableViewCellCommonContentView *)sub_10009BC3C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure37MeasureTableViewCellCommonContentView_title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure37MeasureTableViewCellCommonContentView_mainUnits));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure37MeasureTableViewCellCommonContentView_secondaryLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure37MeasureTableViewCellCommonContentView_marginConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure37MeasureTableViewCellCommonContentView_horizontalConstraints));
}

@end
