@implementation StackDetailSideBySideItemsCell

- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp30StackDetailSideBySideItemsCell *)sub_1002630A0(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  _TtC10FitnessApp30StackDetailSideBySideItemsCell *v2;

  v2 = self;
  sub_10026418C();

}

- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002645BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_topLeadingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_topTrailingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_bottomLeadingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_bottomTrailingDetailItemView));
}

@end
