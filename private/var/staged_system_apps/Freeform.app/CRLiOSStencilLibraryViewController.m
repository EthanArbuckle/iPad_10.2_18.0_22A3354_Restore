@implementation CRLiOSStencilLibraryViewController

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithEditingCoordinator:(id)a3 interactiveCanvasController:(id)a4 boardItemsToSave:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *result;

  v8 = type metadata accessor for CRLBoardItem(0);
  v9 = sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v8, v9);
  sub_10096F018(a3, a4, v10);
  return result;
}

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1009711C4();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSStencilLibraryViewController(0);
  v2 = v5.receiver;
  -[CRLiOSStencilLibraryViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    if (qword_1013DD5D8 != -1)
      swift_once(&qword_1013DD5D8, sub_10097057C);
    objc_msgSend(v4, "setBackgroundColor:", qword_1013FDE20);

    sub_100970818();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Freeform34CRLiOSStencilLibraryViewController *v4;

  v4 = self;
  sub_10096F79C(a3);

}

- (void)dismissViewController
{
  -[CRLiOSStencilLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSSet)boardItemsToSave
{
  uint64_t v2;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *v3;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_stencilDataArchiver);
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v2 + 16));
  }
  else
  {
    v3 = self;
    if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
      && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
    {
      sub_1004B5FB0((uint64_t)_swiftEmptyArrayStorage);

    }
    else
    {

    }
  }
  type metadata accessor for CRLBoardItem(0);
  sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (void)stencilGridViewDidPressCancelButton
{
  -[CRLiOSStencilLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)stencilGridViewWantsToSaveStencilToLibraryWithTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10096FE2C(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *result;

  v4 = a4;
  result = (_TtC8Freeform34CRLiOSStencilLibraryViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSStencilLibraryViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_stencilLibrary));
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_editingCoordinator, v3);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_icc, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_stencilDataArchiver));
  sub_100970FD0((uint64_t)self + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController____lazy_storage___gridView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController____lazy_storage___gridViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_swiftUIPublisher));
}

@end
