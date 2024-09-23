@implementation Reactions.Control

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithCoder:(id)a3
{
  _TtCE5MusicO11MusicCoreUI9Reactions7Control *result;

  result = (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/Reactions+Music.swift", 27, 2, 388, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[Reactions.Control intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)_s7ControlCMa(0);
  -[Reactions.Control frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_s7ControlCMa(0);
  v7 = (char *)v9.receiver;
  -[Reactions.Control setFrame:](&v9, "setFrame:", x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView];
  objc_msgSend(v7, "bounds", v9.receiver, v9.super_class);
  objc_msgSend(v8, "setFrame:");

}

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithFrame:(CGRect)a3
{
  _TtCE5MusicO11MusicCoreUI9Reactions7Control *result;

  result = (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)_swift_stdlib_reportUnimplementedInitializer("Music.Control", 13, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_context, _s7ContextVMa_1);
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_reactionsStackView, type metadata accessor for Reactions.StackView);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_controller));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView));
}

@end
