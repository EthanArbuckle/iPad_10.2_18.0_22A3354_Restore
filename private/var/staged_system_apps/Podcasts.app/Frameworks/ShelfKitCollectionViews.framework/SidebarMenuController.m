@implementation SidebarMenuController

- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_194928();
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v2;

  v2 = self;
  SidebarMenuController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v2;

  v2 = self;
  SidebarMenuController.viewDidLayoutSubviews()();

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v6;

  v6 = self;
  SidebarMenuController.setEditing(_:animated:)(a3, a4);

}

- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews21SidebarMenuController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.SidebarMenuController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_actionRunner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_datasource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_collectionView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_libraryDataProvider));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_libraryActionController));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_storeDataProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_subscriptions));
  sub_91F0C(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_previousNavigationTab));
  sub_91F0C(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_pendingTabSelection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_libraryItems));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_episodeController));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_searchSuggestionsController, &qword_3D8CC8);
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController__isEditingSidebar;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D9E00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController____lazy_storage___collectionViewLayout));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  SidebarMenuController.collectionView(_:didSelectItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = SidebarMenuController.collectionView(_:shouldSelectItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_194AB0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_194C44((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v20;
  void (*v21)(char *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v24 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  SidebarMenuController.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)((uint64_t)v15, (uint64_t)v12, (uint64_t)v18);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v12, v9);
  v21(v15, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21(v18, v9);
  return isa;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_194EE8((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC23ShelfKitCollectionViews21SidebarMenuController *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  _s23ShelfKitCollectionViews21SidebarMenuControllerC07contextF11Interaction_016configurationForF10AtLocationSo09UIContextF13ConfigurationCSgSo0nfI0C_So7CGPointVtF_0(x, y);
  v10 = v9;

  return v10;
}

@end
