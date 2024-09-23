@implementation FMMessageTableViewHeaderView

- (void)layoutSubviews
{
  _TtC6FindMy28FMMessageTableViewHeaderView *v2;

  v2 = self;
  sub_10037B56C();

}

- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC6FindMy28FMMessageTableViewHeaderView *)sub_10037B6C4(v3, v4);
}

- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithCoder:(id)a3
{
  return (_TtC6FindMy28FMMessageTableViewHeaderView *)sub_10037B808(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMMessageTableViewHeaderView_style));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMMessageTableViewHeaderView_remainingCharsLabel));
}

@end
