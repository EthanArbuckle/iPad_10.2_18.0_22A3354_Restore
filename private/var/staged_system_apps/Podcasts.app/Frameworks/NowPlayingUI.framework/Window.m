@implementation Window

- (_TtC12NowPlayingUI6Window)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC12NowPlayingUI6Window *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI6Window_screenDimensionsDidChangeHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI6Window_boundsSizeDidChangeHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection) = 0;
  v6 = a3;

  result = (_TtC12NowPlayingUI6Window *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/Window.swift", 25, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI6Window *v2;

  v2 = self;
  Window.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  _TtC12NowPlayingUI6Window *v6;
  objc_super v7;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection) = 0;
  v5 = a3;
  v6 = self;

  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for Window();
  -[Window traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v5);

}

- (UITraitCollection)traitCollection
{
  _TtC12NowPlayingUI6Window *v2;
  id v3;

  v2 = self;
  v3 = (id)sub_16052C();

  return (UITraitCollection *)v3;
}

- (_TtC12NowPlayingUI6Window)initWithWindowScene:(id)a3
{
  id v3;
  _TtC12NowPlayingUI6Window *result;

  v3 = a3;
  result = (_TtC12NowPlayingUI6Window *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.Window", 19, "init(windowScene:)", 18, 0);
  __break(1u);
  return result;
}

- (_TtC12NowPlayingUI6Window)initWithFrame:(CGRect)a3
{
  sub_16048C((uint64_t)self, (uint64_t)a2, (uint64_t)"init(frame:)", 12);
}

- (_TtC12NowPlayingUI6Window)initWithContentRect:(CGRect)a3
{
  sub_16048C((uint64_t)self, (uint64_t)a2, (uint64_t)"init(contentRect:)", 18);
}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI6Window_screenDimensionsDidChangeHandler), *(_QWORD *)&self->screenDimensionsDidChangeHandler[OBJC_IVAR____TtC12NowPlayingUI6Window_screenDimensionsDidChangeHandler]);
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI6Window_boundsSizeDidChangeHandler), *(_QWORD *)&self->screenDimensionsDidChangeHandler[OBJC_IVAR____TtC12NowPlayingUI6Window_boundsSizeDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection));
}

@end
