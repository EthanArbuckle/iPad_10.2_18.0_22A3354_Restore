@implementation UpsellLogoFallbackHeader

- (_TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader *result;

  v4 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_backgroundArtworkView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_531EC();
  v6 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_logoArtworkView;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)sub_532E4();
  v7 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_gradientView;
  v8 = type metadata accessor for UpsellTitleBarGradientView();
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8)), "init");

  result = (_TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UpsellArtworkHeader.swift", 49, 2, 281, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_54170((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_backgroundArtworkView, &OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_logoArtworkView, &OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_gradientView);
}

@end
