@implementation PlaybackControlTransitionView

- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B523458();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaybackControlTransitionView();
  v2 = v4.receiver;
  -[PlaybackControlTransitionView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI29PlaybackControlTransitionView *result;

  result = (_TtC9SeymourUI29PlaybackControlTransitionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_widthConstraint));
}

@end
