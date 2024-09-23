@implementation MiniPlayerView

- (void)layoutSubviews
{
  _TtC9SeymourUI14MiniPlayerView *v2;
  objc_super v3;

  v2 = self;
  sub_22B335BC0(32.0, 0.0);
  sub_22B335BC0(32.0, 0.0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MiniPlayerView();
  -[MiniPlayerView layoutSubviews](&v3, sel_layoutSubviews);

}

- (_TtC9SeymourUI14MiniPlayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B8F2378();
}

- (void)playbackControlTapped:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC9SeymourUI14MiniPlayerView *v6;

  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_presenter))
  {
    v4 = *((unsigned __int8 *)a3 + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_type);
    v5 = a3;
    v6 = self;
    swift_unknownObjectRetain();
    sub_22B910FD4(v4);

    swift_unknownObjectRelease();
  }
}

- (void)tapRecognized:(id)a3
{
  id v4;
  _TtC9SeymourUI14MiniPlayerView *v5;

  v4 = a3;
  v5 = self;
  sub_22B8F24C8();

}

- (_TtC9SeymourUI14MiniPlayerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI14MiniPlayerView *result;

  result = (_TtC9SeymourUI14MiniPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_controlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_metadataStackView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_skipForwardControl));

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI14MiniPlayerView *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    v10 = v9;
    objc_opt_self();
    v11 = (void *)swift_dynamicCastObjCClass();
    if (!v11)

  }
  else
  {
    v11 = 0;
  }

  return v11 == 0;
}

@end
