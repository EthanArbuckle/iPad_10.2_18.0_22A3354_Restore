@implementation CRLiOSSidebarViewController

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10050ADC4();
}

- (void)dealloc
{
  _TtC8Freeform27CRLiOSSidebarViewController *v2;

  v2 = self;
  sub_100504038();
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_viewModelController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_libraryProvider));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_selectedItem, (uint64_t *)&unk_1013E3830);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_syncDidEndObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_syncDidBeginObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_highlightSyncDidEndObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_highlightSyncDidBeginObserver));
}

- (void)viewDidLoad
{
  _TtC8Freeform27CRLiOSSidebarViewController *v2;

  v2 = self;
  sub_100504218();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform27CRLiOSSidebarViewController *v3;

  v3 = self;
  sub_10050B1FC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSSidebarViewController(0);
  v4 = v6.receiver;
  -[CRLiOSSidebarViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = (void *)objc_opt_self(CRLiOSKeyboardMonitor);
  objc_msgSend(v5, "addKeyboardObserver:", v4, v6.receiver, v6.super_class);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform27CRLiOSSidebarViewController *v7;
  uint64_t v8;
  _TtC8Freeform27CRLiOSSidebarViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _OWORD v17[2];
  __int128 v18;
  uint64_t v19;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v17, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v9 = self;
  }
  sub_100506248((uint64_t)a3, (uint64_t)v17, &v18);

  sub_1004CB800((uint64_t)v17, &qword_1013E0230);
  v10 = v19;
  if (!v19)
    return 0;
  v11 = sub_1004BB5A4(&v18, v19);
  v12 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(&v18);
  return v15;
}

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC8Freeform27CRLiOSSidebarViewController *result;

  v3 = a3;
  result = (_TtC8Freeform27CRLiOSSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSSidebarViewController", 36, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform27CRLiOSSidebarViewController *result;

  v4 = a4;
  result = (_TtC8Freeform27CRLiOSSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSSidebarViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform27CRLiOSSidebarViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10050B4C8((uint64_t)v10);

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
  _TtC8Freeform27CRLiOSSidebarViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10050B794((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (NSUndoManager)undoManager
{
  _TtC8Freeform27CRLiOSSidebarViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100506728();

  return (NSUndoManager *)v3;
}

- (UIWindow)keyboardObserversWindow
{
  _TtC8Freeform27CRLiOSSidebarViewController *v2;
  UIWindow *result;
  UIWindow *v4;
  id v5;

  v2 = self;
  result = (UIWindow *)-[CRLiOSSidebarViewController view](v2, "view");
  if (result)
  {
    v4 = result;
    v5 = -[UIWindow window](result, "window");

    return (UIWindow *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform27CRLiOSSidebarViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10050692C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform27CRLiOSSidebarViewController *v9;
  id v10;
  void *v11;
  double left;
  double bottom;
  double right;
  id v15;
  void *v16;
  uint64_t v17;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = -[CRLiOSSidebarViewController collectionView](v9, "collectionView");
  if (v10)
  {
    v11 = v10;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    objc_msgSend(v10, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

    v15 = -[CRLiOSSidebarViewController collectionView](v9, "collectionView");
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end
