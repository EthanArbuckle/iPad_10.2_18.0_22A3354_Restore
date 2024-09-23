@implementation HomeListSectionController

- (_TtC4Maps25HomeListSectionController)init
{
  _TtC4Maps25HomeListSectionController *result;

  result = (_TtC4Maps25HomeListSectionController *)_swift_stdlib_reportUnimplementedInitializer("Maps.HomeListSectionController", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000AB2BC((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration);
  sub_1001420E0(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25HomeListSectionController_cachedSectionSnapshot), *(_QWORD *)&self->configuration[OBJC_IVAR____TtC4Maps25HomeListSectionController_cachedSectionSnapshot], *(_QWORD *)&self->configuration[OBJC_IVAR____TtC4Maps25HomeListSectionController_cachedSectionSnapshot + 8], *(_QWORD *)&self->configuration[OBJC_IVAR____TtC4Maps25HomeListSectionController_cachedSectionSnapshot + 16]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps25HomeListSectionController_mutableDeletions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps25HomeListSectionController____lazy_storage___sectionIdentifierPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps25HomeListSectionController____lazy_storage___sectionHeaderIdentifierPath));
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  _TtC4Maps25HomeListSectionController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100200A20(a3);
  swift_unknownObjectRelease(a3);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps25HomeListSectionController *v12;
  Class isa;
  unsigned __int8 v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = -[HomeListSectionController collectionView:shouldSelectItemAtIndexPath:](v12, "collectionView:shouldSelectItemAtIndexPath:", v11, isa);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps25HomeListSectionController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1002025C4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps25HomeListSectionController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100200DB0(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
