@implementation HomeListRecentsSectionController

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  _TtC4Maps32HomeListRecentsSectionController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1001FB210((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_markedLocationDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataFilter));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataFilterQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_filteredRecents));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps32HomeListRecentsSectionController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1001FCE20((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
