@implementation BrowseCollectionViewFlowLayout

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_customSectionHeadersPinToVisibleBounds) = a3;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v5;
  double v6;
  double v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  v5 = self;
  v8 = sub_688654(v6, v7, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v7;
  void *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_688750(x, y, width, height);
  v9 = v8;

  return v9;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v5;

  v4 = a3;
  v5 = self;
  sub_688AB0(v4);

}

- (void)prepareLayout
{
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v2;

  v2 = self;
  sub_689508();

}

- (CGSize)collectionViewContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BrowseCollectionViewFlowLayout();
  v2 = (char *)v10.receiver;
  -[BrowseCollectionViewFlowLayout collectionViewContentSize](&v10, "collectionViewContentSize");
  v4 = v3;
  v6 = v5 + *(double *)&v2[OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalHeaderHeight];
  v7 = *(double *)&v2[OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalFooterHeight];

  v8 = v6 + v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_6896DC(x, y, width, height);

  if (v8)
  {
    sub_18E0AC();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v10;
  id v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a3;
  v10 = self;
  v11 = sub_68A2F0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
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
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v16;
  char *v17;
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
  v17 = sub_68A4C8(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5
{
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGPoint result;

  x = a3.x;
  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a4;
  v14 = self;
  v15 = sub_68ABD8(x, (uint64_t)v12, a5);
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)init
{
  uint64_t v3;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v4;
  objc_super v6;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_customSectionHeadersPinToVisibleBounds) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalHeaderHeight) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalFooterHeight) = 0;
  v3 = OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_returnedSupplementaryViewIndexPaths;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)sub_199430((uint64_t)_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BrowseCollectionViewFlowLayout();
  return -[BrowseCollectionViewFlowLayout init](&v6, "init");
}

- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication30BrowseCollectionViewFlowLayout *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication30BrowseCollectionViewFlowLayout *)sub_68B108((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_returnedSupplementaryViewIndexPaths));
}

@end
