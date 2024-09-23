@implementation StackDetailHeaderCell

- (_TtC10FitnessApp21StackDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp21StackDetailHeaderCell *)sub_10028B598(a3, (uint64_t)a4, v6);
}

- (void)navigateToPlaylist
{
  _TtC10FitnessApp21StackDetailHeaderCell *v2;

  v2 = self;
  sub_10028C2DC();

}

- (_TtC10FitnessApp21StackDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028C9B8();
}

- (void).cxx_destruct
{
  sub_10028C978((uint64_t)self + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_stackViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell____lazy_storage___imageViewHeightConstraint));
}

@end
