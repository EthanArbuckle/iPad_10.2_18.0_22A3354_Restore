@implementation CalendarDayIndicatorView

- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24CalendarDayIndicatorView *)sub_22B36343C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _OWORD *v8;
  _TtC9SeymourUI24CalendarDayIndicatorView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_shapeLayer;
  v6 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_appearance) = (Class)0x3FF0000000000000;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_oldRect);
  *v8 = 0u;
  v8[1] = 0u;

  result = (_TtC9SeymourUI24CalendarDayIndicatorView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI24CalendarDayIndicatorView *v2;

  v2 = self;
  sub_22B363718();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_shapeLayer));
}

@end
