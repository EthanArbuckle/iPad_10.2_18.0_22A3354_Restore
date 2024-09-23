@implementation SocialProfilesFlowCollectionViewLayout

- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)initWithCoder:(id)a3
{
  _TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *result;

  result = (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSGridViewController.swift", 43, 2, 2703, 0);
  __break(1u);
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *v7;
  id v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_A9B8F8(x, y, width, height);

  if (v8)
  {
    sub_4E684(0, (unint64_t *)&qword_14B5940, UICollectionViewLayoutAttributes_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *v16;
  id v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = sub_A9BA84(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_A9BCFC(x, y, width, height);

  return v8;
}

- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)init
{
  _TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *result;

  result = (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialProfilesFlowCollectionViewLayout", 55, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->socialProfilesHelper[OBJC_IVAR____TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout_socialProfilesHelper]);
}

@end
