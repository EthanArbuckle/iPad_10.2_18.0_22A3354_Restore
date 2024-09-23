@implementation ProductPageRootViewController

- (UINavigationItem)navigationItem
{
  UINavigationItem *v3;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v4;
  UINavigationItem *v5;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v6;
  UINavigationItem *v7;
  objc_super v9;

  v3 = *(UINavigationItem **)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem];
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for ProductPageRootViewController();
    v6 = self;
    v5 = -[ProductPageRootViewController navigationItem](&v9, "navigationItem");
  }
  v7 = v3;

  return v5;
}

- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC25BooksProductPageExtension29ProductPageRootViewController *)sub_10000A0D0(v5, v7, a4);
}

- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000E31C();
}

- (void)viewDidLoad
{
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v2;

  v2 = self;
  sub_10000A3F4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v4 = (char *)v8.receiver;
  -[ProductPageRootViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager];
  if (v5)
  {
    v6 = v5;
    dispatch thunk of AppAnalyticsExtensionManager.startSession()(v6, v7);

    v4 = v6;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_10000A7D8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (SEL *)&selRef_bc_analyticsVisibilityUpdateSubtree);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_10000A7D8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (SEL *)&selRef_bc_analyticsVisibilitySubtreeWillDisappear);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v4;

  v4 = self;
  sub_10000A844(a3);

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v2 = (char *)v3.receiver;
  -[ProductPageRootViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController], "flush", v3.receiver, v3.super_class);

}

- (void)dealloc
{
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v2;

  v2 = self;
  sub_10000ACB8();
}

- (void).cxx_destruct
{

  sub_10000F74C((uint64_t)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification], &qword_100034D60);
  sub_10000F74C((uint64_t)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification], &qword_100034D60);

  swift_bridgeObjectRelease(*(_QWORD *)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData]);

  swift_release(*(_QWORD *)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph]);
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v8;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a3;
  v8 = self;
  sub_10000B094(v7, v6);

  swift_bridgeObjectRelease(v6);
  return 0;
}

- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v12;

  if (a4)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = self;
  sub_10000B378(v11, v8, v10, a5);

  swift_bridgeObjectRelease(v10);
}

- (TUISyncLayoutController)syncLayoutController
{
  TUISyncLayoutController *result;

  result = *(TUISyncLayoutController **)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController];
  if (result)
    return result;
  __break(1u);
  return result;
}

- (id)windowProviderForBridge:(id)a3
{
  id result;

  result = *(id *)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider];
  if (result)
    return result;
  __break(1u);
  return result;
}

- (id)objectRegistrationsForBridge:(id)a3
{
  id v4;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v5;
  uint64_t v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_10000EE44();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void)_bridgeDidReload:(id)a3
{
  sub_10000D3EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10000CAAC);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v4;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = -[ProductPageRootViewController view](v5, "view");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setNeedsLayout");

  }
  else
  {
    __break(1u);
  }
}

- (id)analyticsTrackerForStoreServices:(id)a3
{
  id v4;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v5;
  id v6;
  id result;
  id v8;

  v4 = a3;
  v5 = self;
  v6 = -[ProductPageRootViewController bc_deepestVisibleChildViewControllerIncludePresented:](v5, "bc_deepestVisibleChildViewControllerIncludePresented:", 1);
  result = objc_msgSend(v6, "ba_effectiveAnalyticsTracker");
  if (result)
  {
    v8 = result;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_smartInvertDidChange:(id)a3
{
  sub_10000D3EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10000D110);
}

- (id)flowControllers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtC25BooksProductPageExtension29ProductPageRootViewController *v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  v3 = sub_1000089B0(&qword_100034C20);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100027060;
  v5 = sub_1000089B0(&qword_100034C28);
  v6 = self;
  BaseObjectGraph.inject<A>(_:)(&v10, v5, v5);
  v7 = v10;
  *(_QWORD *)(v4 + 56) = swift_getObjectType(v10);
  *(_QWORD *)(v4 + 32) = v7;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

@end
