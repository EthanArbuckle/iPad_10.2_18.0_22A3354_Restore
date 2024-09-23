@implementation LibraryPlacesViewController

- (_TtP4Maps21LibraryActionDelegate_)actionDelegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_actionDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_actionDelegate, v4, 0, 0);
  return (_TtP4Maps21LibraryActionDelegate_ *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setActionDelegate:(id)a3
{
  _TtC4Maps27LibraryPlacesViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  LibraryPlacesViewController.actionDelegate.setter((uint64_t)a3);

}

- (id)menuProvider
{
  _TtC4Maps27LibraryPlacesViewController *v2;
  UIMenu (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  v2 = self;
  v3 = sub_1001C6350();
  v5 = v4;

  v8[4] = v3;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10012918C;
  v8[3] = &unk_1011A9C20;
  v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (void)setMenuProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  id (**v6)(uint64_t, objc_class *);
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1011A9C08, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (id (**)(uint64_t, objc_class *))((char *)self
                                                 + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider);
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider);
  v7 = *(uint64_t *)((char *)&self->super._cardPresentationController
                  + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider);
  *v6 = sub_10012A448;
  v6[1] = (id (*)(uint64_t, objc_class *))v5;
  sub_10000BF74(v8, v7);
}

- (void)viewDidLoad
{
  _TtC4Maps27LibraryPlacesViewController *v2;

  v2 = self;
  LibraryPlacesViewController.viewDidLoad()();

}

- (void)setupConstraints
{
  _TtC4Maps27LibraryPlacesViewController *v2;

  v2 = self;
  sub_1001C7580();

}

- (void)prepareLibrary
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC4Maps27LibraryPlacesViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = swift_allocObject(&unk_1011A9BE0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = &protocol witness table for MainActor;
  sub_1001B0D54((uint64_t)v5, (uint64_t)&unk_10149F6C8, v9);

  swift_release();
}

- (void)dismissTapped
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)exitEditingMode
{
  _TtC4Maps27LibraryPlacesViewController *v2;

  v2 = self;
  sub_1001C8200();

}

- (void)addLibraryItem
{
  _TtC4Maps27LibraryPlacesViewController *v2;

  v2 = self;
  sub_1001C8480();

}

- (UIMenu)selectionModeMenu
{
  _TtC4Maps27LibraryPlacesViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100125600(&OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu, (uint64_t (*)(uint64_t))sub_1001C8DF8);

  return (UIMenu *)v3;
}

- (void)setSelectionModeMenu:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu) = (Class)a3;
  v3 = a3;

}

- (UIMenu)selectionTriggerMenu
{
  _TtC4Maps27LibraryPlacesViewController *v2;
  objc_class *v3;

  v2 = self;
  v3 = sub_1001C86C8();

  return (UIMenu *)v3;
}

- (void)setSelectionTriggerMenu:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps27LibraryPlacesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC4Maps27LibraryPlacesViewController *)LibraryPlacesViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC4Maps27LibraryPlacesViewController)initWithCoder:(id)a3
{
  return (_TtC4Maps27LibraryPlacesViewController *)LibraryPlacesViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_collectionViewManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___navBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___navItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___titleLabelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___dismissButtonIOS));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___doneEditingButton));
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider), *(uint64_t *)((char *)&self->super._cardPresentationController+ OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___searchController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___collectionView));
  swift_bridgeObjectRelease(*(CardPresentationController **)((char *)&self->super._cardPresentationController
                                                           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_placesTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu));
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC4Maps27LibraryPlacesViewController *v5;

  v4 = a3;
  v5 = self;
  LibraryPlacesViewController.updateSearchResults(for:)((UISearchController)v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  id v11;
  _TtC4Maps27LibraryPlacesViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char **)((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LibraryPlacesViewController.collectionView(_:didSelectItemAt:)(v11, v10);

  (*(void (**)(char **, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps27LibraryPlacesViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  _s4Maps27LibraryPlacesViewControllerC010collectionD0_17didDeselectItemAtySo012UICollectionD0C_10Foundation9IndexPathVtF_0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
