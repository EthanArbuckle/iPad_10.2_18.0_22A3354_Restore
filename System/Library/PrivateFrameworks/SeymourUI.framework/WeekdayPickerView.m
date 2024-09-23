@implementation WeekdayPickerView

- (_TtC9SeymourUI17WeekdayPickerView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17WeekdayPickerView *)sub_22B7D3A98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17WeekdayPickerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7D45BC();
}

- (void)tintColorDidChange
{
  _TtC9SeymourUI17WeekdayPickerView *v2;

  v2 = self;
  sub_22B7D3E50();

}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17WeekdayPickerView_onItemTapped));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
