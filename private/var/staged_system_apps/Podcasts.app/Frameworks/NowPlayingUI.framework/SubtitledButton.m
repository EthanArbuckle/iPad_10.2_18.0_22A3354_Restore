@implementation SubtitledButton

- (_TtC12NowPlayingUI15SubtitledButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  _TtC12NowPlayingUI15SubtitledButton *v13;
  _TtC12NowPlayingUI15SubtitledButton *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_title);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_subtitle);
  *v10 = 0;
  v10[1] = 0;
  v11 = OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor;
  v12 = (void *)objc_opt_self(UIColor);
  v13 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = (Class)objc_msgSend(v12, "whiteColor");

  v16.receiver = v13;
  v16.super_class = ObjectType;
  v14 = -[MultilineButton initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  sub_B8A3C();

  return v14;
}

- (_TtC12NowPlayingUI15SubtitledButton)initWithCoder:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC12NowPlayingUI15SubtitledButton *result;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_title);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_subtitle);
  *v6 = 0;
  v6[1] = 0;
  v7 = OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor;
  v8 = (void *)objc_opt_self(UIColor);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "whiteColor");

  result = (_TtC12NowPlayingUI15SubtitledButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/MultilineButton.swift", 34, 2, 306, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  -[MultilineButton sizeThatFits:](&v7, "sizeThatFits:", width, height);
  v6 = 50.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.backgroundCornerRadius[OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.backgroundCornerRadius[OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor));
}

@end
