@implementation PlaybackTrackView

- (_TtC9SeymourUI17PlaybackTrackView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI17PlaybackTrackView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI17PlaybackTrackView_trackLayoutGuide;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD718]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17PlaybackTrackView_layout) = (Class)0x401C000000000000;

  result = (_TtC9SeymourUI17PlaybackTrackView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaybackTrackView();
  v2 = v4.receiver;
  -[PlaybackTrackView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

- (_TtC9SeymourUI17PlaybackTrackView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI17PlaybackTrackView *result;

  result = (_TtC9SeymourUI17PlaybackTrackView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17PlaybackTrackView_trackLayoutGuide));
}

@end
