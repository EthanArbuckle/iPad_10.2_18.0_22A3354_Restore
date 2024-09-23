@implementation FilterButton

- (_TtC9SeymourUI12FilterButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI12FilterButton *)sub_22B371708(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI12FilterButton)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI12FilterButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_shouldShowHighlight) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI12FilterButton *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilterButton();
  return -[FilterButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC9SeymourUI12FilterButton *v4;

  v4 = self;
  sub_22B371940(a3);

}

- (void)handleTimer:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_shouldShowHighlight) = 1;
  -[FilterButton setHighlighted:](self, sel_setHighlighted_, 1);
}

- (void)handleTouchDown:(id)a3
{
  void *v5;
  id v6;
  _TtC9SeymourUI12FilterButton *v7;
  objc_class *v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = (objc_class *)objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_handleTimer_, 0, 0, 0.12);
  v9 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer);
  *(Class *)((char *)&v7->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer) = v8;

}

- (void)handleTouchUp:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer), sel_invalidate, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer));
}

@end
