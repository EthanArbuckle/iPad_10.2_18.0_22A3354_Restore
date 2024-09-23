@implementation NowPlayingVibrancyEffectView

- (_TtC5Books28NowPlayingVibrancyEffectView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Books28NowPlayingVibrancyEffectView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_vibrancyState) = 1;
  v4 = a3;

  result = (_TtC5Books28NowPlayingVibrancyEffectView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/NowPlayingTransportButton.swift", 37, 2, 148, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingVibrancyEffectView();
  v2 = (char *)v4.receiver;
  -[NowPlayingVibrancyEffectView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (_TtC5Books28NowPlayingVibrancyEffectView)initWithEffect:(id)a3
{
  id v3;
  _TtC5Books28NowPlayingVibrancyEffectView *result;

  v3 = a3;
  result = (_TtC5Books28NowPlayingVibrancyEffectView *)_swift_stdlib_reportUnimplementedInitializer("Books.NowPlayingVibrancyEffectView", 34, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView));
}

@end
