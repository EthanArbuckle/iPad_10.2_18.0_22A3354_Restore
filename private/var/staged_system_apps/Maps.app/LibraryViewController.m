@implementation LibraryViewController

- (_TtP4Maps21LibraryActionDelegate_)actionDelegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC4Maps21LibraryViewController_actionDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps21LibraryViewController_actionDelegate, v4, 0, 0);
  return (_TtP4Maps21LibraryActionDelegate_ *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setActionDelegate:(id)a3
{
  _TtC4Maps21LibraryViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  LibraryViewController.actionDelegate.setter((uint64_t)a3);

}

- (void)viewDidLoad
{
  _TtC4Maps21LibraryViewController *v2;

  v2 = self;
  LibraryViewController.viewDidLoad()();

}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (_TtC4Maps21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC4Maps21LibraryViewController *)LibraryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC4Maps21LibraryViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps21LibraryViewController_actionDelegate, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps21LibraryViewController____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps21LibraryViewController_collectionViewManager) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[LibraryViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps21LibraryViewController_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps21LibraryViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps21LibraryViewController_collectionViewManager));
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", a3, a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps21LibraryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LibraryViewController.collectionView(_:didSelectItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)presentPinsView
{
  sub_1001BEE04((char *)self, (uint64_t)a2, (SEL *)&selRef_viewControllerShowMyShortcuts_);
}

- (void)presentSavedRouteList
{
  void *v3;
  uint64_t v4;
  void *v5;
  _TtC4Maps21LibraryViewController *v6;
  _QWORD v7[6];

  v3 = (void *)objc_opt_self(MapsSavedRoutesManager);
  v4 = swift_allocObject(&unk_1011A97C0, 24, 7);
  swift_unknownObjectWeakInit(v4 + 16);
  v7[4] = sub_1001BEF5C;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1001BEC48;
  v7[3] = &unk_1011A97D8;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_release();
  objc_msgSend(v3, "fetchSavedRoutesWithType:completion:", 1, v5);
  _Block_release(v5);

}

- (void)presentPlacesView
{
  sub_1001BEE04((char *)self, (uint64_t)a2, (SEL *)&selRef_viewControllerShowLibraryPlacesView_);
}

- (void)presentGuidesView
{
  sub_1001BEE04((char *)self, (uint64_t)a2, (SEL *)&selRef_viewControllerShowCollections_);
}

@end
