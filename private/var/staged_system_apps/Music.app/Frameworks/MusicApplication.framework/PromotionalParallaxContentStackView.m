@implementation PromotionalParallaxContentStackView

- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_interitemSpacing) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_arrangedSubviews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_lastKnownHeight) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PromotionalParallaxContentStackView();
  return -[PromotionalParallaxContentStackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication35PromotionalParallaxContentStackView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_interitemSpacing) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_arrangedSubviews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_lastKnownHeight) = 0;
  v5 = a3;

  result = (_TtC16MusicApplication35PromotionalParallaxContentStackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/PromotionalParallaxContentStackView.swift", 58, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication35PromotionalParallaxContentStackView *v2;

  v2 = self;
  sub_78828C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication35PromotionalParallaxContentStackView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_788924(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplication35PromotionalParallaxContentStackView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_788924(0.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotionalParallaxContentStackView();
  v4 = a3;
  v5 = v6.receiver;
  -[PromotionalParallaxContentStackView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_7881BC(0);

}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler), *(_QWORD *)&self->layoutInvalidationHandler[OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler]);
  swift_bridgeObjectRelease();
}

@end
