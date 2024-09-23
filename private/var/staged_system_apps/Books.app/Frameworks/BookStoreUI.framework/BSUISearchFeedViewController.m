@implementation BSUISearchFeedViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  swift_unknownObjectRetain(a4);
  v7 = v8.receiver;
  -[BSUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  objc_msgSend(v7, "_updateNavigationLayoutMetrics", v8.receiver, v8.super_class);
  swift_unknownObjectRelease(a4);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_2E7F00, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_6F010;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_6D3F4(v10, a4, (uint64_t)v8, v9);
  sub_6C2DC((uint64_t)v8, v9);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_2E7ED8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_6F010;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_6D66C(a3, (uint64_t)v6, v7);
  sub_6C2DC((uint64_t)v6, v7);

}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  _TtC11BookStoreUI28BSUISearchFeedViewController *v2;
  UINavigationItem *v3;
  UISearchController *v4;
  id v5;
  BOOL v6;
  objc_super v8;

  v2 = self;
  v3 = -[BSUIFeedViewController navigationItem](v2, "navigationItem");
  v4 = -[UINavigationItem searchController](v3, "searchController");

  if (v4
    && (v5 = -[UISearchController presentedViewController](v4, "presentedViewController"),
        v4,
        v5))
  {

    return 0;
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
    v6 = -[BSUISearchFeedViewController bc_analyticsVisibilityOfSelf](&v8, "bc_analyticsVisibilityOfSelf");

  }
  return v6;
}

- (BOOL)bc_navBarVisible
{
  _TtC11BookStoreUI28BSUISearchFeedViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_6D9C4();

  return v3 & 1;
}

- (void)bc_setNavBarVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  -[BSUISearchFeedViewController bc_setNavBarVisible:](&v4, "bc_setNavBarVisible:", v3);
}

- (Class)jsaFeedControllerClass
{
  uint64_t v2;

  v2 = sub_5C194(0, &qword_31FC30, JSASearchFeedController_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)feedController:(id)a3 dismissKeyboard:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_2E7EB0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_6F008;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_6DAF4((uint64_t)v8, (uint64_t)v6, v7);
  sub_6C2DC((uint64_t)v6, v7);

}

- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v20;

  v14 = _Block_copy(a8);
  v15 = sub_5C154(&qword_31FC38);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a7, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (v14)
  {
    v18 = swift_allocObject(&unk_2E7E88, 24, 7);
    *(_QWORD *)(v18 + 16) = v14;
    v14 = sub_6EFFC;
  }
  else
  {
    v18 = 0;
  }
  v19 = a3;
  v20 = self;
  sub_6DD94((uint64_t)v19, v16, a5, a6, v17, v14, v18);
  sub_6C2DC((uint64_t)v14, v18);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
}

- (void)feedController:(id)a3 wantsToUpdateSearchText:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v10;
  uint64_t *v11;
  unint64_t v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  if ((sub_6E0C4(v6, v8) & 1) != 0)
  {

  }
  else
  {
    v11 = (uint64_t *)&v10->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    v12 = *(_QWORD *)((char *)&v10->super._stateLock._os_unfair_lock_opaque
                    + OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText);
    *v11 = v6;
    v11[1] = v8;

    v8 = v12;
  }
  swift_bridgeObjectRelease(v8);
}

- (UIEdgeInsets)navigationBarMetricsLayoutMargins
{
  _TtC11BookStoreUI28BSUISearchFeedViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_6E398();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  id v9;
  id v10;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  id v18;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v19;
  unsigned __int8 v20;
  _OWORD v22[2];

  if (a3)
  {
    v9 = a4;
    v10 = a5;
    v11 = self;
    v12 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12);
    swift_unknownObjectRelease(a3);
    if (a4)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    v15 = 0;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  memset(v22, 0, sizeof(v22));
  v17 = a4;
  v18 = a5;
  v19 = self;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;

  if (!a5)
    goto LABEL_7;
LABEL_4:
  v16 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

LABEL_8:
  v20 = sub_6E56C((uint64_t)v22, v13, v15, v16);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v15);
  sub_6EF98((uint64_t)v22);
  return v20 & 1;
}

- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4
{
  id v6;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v7;

  v6 = a3;
  v7 = self;
  sub_6E85C((uint64_t)v6, a4);

}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5
{
  unsigned __int8 *v9;
  objc_class *v10;
  objc_super v12;

  v9 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
  v10 = (objc_class *)type metadata accessor for BSUISearchFeedViewController();
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[BSUISearchFeedViewController initWithFeedContent:manager:factory:](&v12, "initWithFeedContent:manager:factory:", a3, a4, a5);
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  id v9;
  NSString v10;
  unsigned __int8 *v11;
  id v12;
  _TtC11BookStoreUI28BSUISearchFeedViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  v13 = -[BSUISearchFeedViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  objc_class *v6;
  objc_super v8;

  v5 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
  v6 = (objc_class *)type metadata accessor for BSUISearchFeedViewController();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[BSUISearchFeedViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithOptions:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v3 = 0;
  return (_TtC11BookStoreUI28BSUISearchFeedViewController *)BSUISearchFeedViewController.init(options:)(v3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)((char *)&self->super._stateLock._os_unfair_lock_opaque
                                      + OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText));
}

@end
