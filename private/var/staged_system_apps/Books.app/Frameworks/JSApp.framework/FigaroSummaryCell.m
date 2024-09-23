@implementation FigaroSummaryCell

- (_TtC5JSApp17FigaroSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC5JSApp17FigaroSummaryCell *)sub_6DF28(v4, v5);
}

- (void)layoutSubviews
{
  _TtC5JSApp17FigaroSummaryCell *v2;

  v2 = self;
  sub_6C43C();

}

- (_TtC5JSApp17FigaroSummaryCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_6E294();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_figaroEvent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_eventNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_pageTypeLabel));

}

@end
