@implementation HomeListFavoritesSectionController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController_favoritesDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController_libraryCountsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesIdentifierPath));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___placeLibraryIdentifierPath));
  sub_100010CC4((uint64_t)self + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesCellSnapshot, &qword_10149B500);
  sub_100010CC4((uint64_t)self+ OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesCellSnapshotLegacy, &qword_10149B500);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC4Maps34HomeListFavoritesSectionController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1000AE59C(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)editFavoriteShortcut:(id)a3
{
  sub_1000AE080(self, (uint64_t)a2, a3, (SEL *)&selRef_homePinnedLibraryItemTapped_);
}

- (void)removeFavoriteShortcut:(id)a3
{
  sub_1000AE080(self, (uint64_t)a2, a3, (SEL *)&selRef_homeDidTapToUnpinLibraryShortcutItem_);
}

- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3
{
  void *v5;
  id v6;
  _TtC4Maps34HomeListFavoritesSectionController *v7;
  NSString v8;
  _QWORD v9[5];
  uint64_t v10;

  sub_1000AB280((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, v9);
  v5 = (void *)swift_unknownObjectWeakLoadStrong(&v10);
  v6 = a3;
  v7 = self;
  sub_1000AB2BC((uint64_t)v9);
  if (v5)
  {
    v8 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "homeItemTapped:", v8);

    swift_unknownObjectRelease(v5);
  }
  else
  {

  }
}

- (void)shortcutsRowTableViewCell:(void *)a3 openShortcut:(void *)a4
{
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;

  sub_1000AB280((uint64_t)a1 + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, v11);
  v7 = (void *)swift_unknownObjectWeakLoadStrong(&v12);
  v8 = a3;
  v9 = a4;
  v10 = a1;
  sub_1000AB2BC((uint64_t)v11);
  if (v7)
  {
    objc_msgSend(v7, "homeItemTapped:", v9);

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
}

@end
