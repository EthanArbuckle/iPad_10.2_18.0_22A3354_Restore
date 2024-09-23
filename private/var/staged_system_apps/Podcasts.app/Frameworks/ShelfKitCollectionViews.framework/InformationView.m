@implementation InformationView

- (void)buttonTappedFrom:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15InformationView *v5;

  v4 = a3;
  v5 = self;
  sub_1B1F3C((uint64_t)v4);

}

- (_TtC23ShelfKitCollectionViews15InformationView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15InformationView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_buttons) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtC23ShelfKitCollectionViews15InformationView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/InformationView.swift", 45, 2, 112, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC23ShelfKitCollectionViews15InformationView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = InformationView.sizeThatFits(_:)(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews15InformationView *v2;

  v2 = self;
  InformationView.layoutSubviews()();

}

- (_TtC23ShelfKitCollectionViews15InformationView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews15InformationView *result;

  result = (_TtC23ShelfKitCollectionViews15InformationView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.InformationView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_actionButtons));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_buttons));
}

@end
