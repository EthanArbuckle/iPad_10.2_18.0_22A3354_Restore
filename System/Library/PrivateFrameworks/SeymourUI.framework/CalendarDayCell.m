@implementation CalendarDayCell

- (_TtC9SeymourUI15CalendarDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI15CalendarDayCell *)sub_22B687170(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI15CalendarDayCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B688008();
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CalendarDayCell();
  v2 = (char *)v5.receiver;
  -[CalendarDayCell prepareForReuse](&v5, sel_prepareForReuse);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_highlightView], sel_setHidden_, 1, v5.receiver, v5.super_class);
  v3 = *(char **)&v2[OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_indicatorView];
  objc_msgSend(v3, sel_setHidden_, 1);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_shapeLayer];
  objc_msgSend(v4, sel_setFillColor_, 0);
  objc_msgSend(v4, sel_setStrokeColor_, 0);

}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_indicatorView));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_styleProvider;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_styleProvider);
  v5 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI15CalendarDayCell_styleProvider);
  v11 = v4;
  v6 = (void *)*((_QWORD *)v3 + 2);
  v7 = (void *)*((_QWORD *)v3 + 3);
  v8 = (void *)*((_QWORD *)v3 + 4);
  v9 = (void *)*((_QWORD *)v3 + 5);
  v10 = (void *)*((_QWORD *)v3 + 6);

}

@end
