@implementation StickerEffectChooser

- (_TtC10StickersUI20StickerEffectChooser)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI20StickerEffectChooser *)sub_247A61088(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI20StickerEffectChooser)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_247A62F1C();
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC10StickersUI20StickerEffectChooser *v5;

  v4 = a3;
  v5 = self;
  sub_247A61BB4(v4);

}

- (void)layoutSubviews
{
  _TtC10StickersUI20StickerEffectChooser *v2;

  v2 = self;
  sub_247A61FD0();

}

- (CGSize)intrinsicContentSize
{
  _TtC10StickersUI20StickerEffectChooser *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_247A62AD8();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_247A62FD0((uint64_t)self + OBJC_IVAR____TtC10StickersUI20StickerEffectChooser_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI20StickerEffectChooser_highlightView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
