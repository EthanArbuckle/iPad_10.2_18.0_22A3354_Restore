@implementation SocialProfilesShelfCollectionViewLayout

- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSShelfViewController.swift", 44, 2, 3493, 0);
  __break(1u);
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *v7;
  id v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_89783C(x, y, width, height);

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
  _TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *v16;
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
  v17 = sub_8979CC(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  return sub_8982F4((char *)self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))sub_897C5C);
}

- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  return sub_8982F4((char *)self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))sub_897FA0);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *v9;
  Class isa;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_4E684(0, (unint64_t *)&unk_14E6D50, UICollectionViewUpdateItem_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = a3;
  v9 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v11.receiver = v9;
  v11.super_class = ObjectType;
  -[SocialProfilesShelfCollectionViewLayout prepareForCollectionViewUpdates:](&v11, "prepareForCollectionViewUpdates:", isa);

  *(Class *)((char *)&v9->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems) = (Class)v7;

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[SocialProfilesShelfCollectionViewLayout finalizeCollectionViewUpdates](&v4, "finalizeCollectionViewUpdates");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems];
  *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems] = 0;

  swift_bridgeObjectRelease(v3);
}

- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)init
{
  _TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *result;

  result = (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialProfilesShelfCollectionViewLayout", 56, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.scrollStyle[OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_socialProfilesHelper]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems));
}

@end
