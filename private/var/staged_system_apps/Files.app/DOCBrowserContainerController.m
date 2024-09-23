@implementation DOCBrowserContainerController

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v4 = a3;
  v5 = v9.receiver;
  -[DOCBrowserContainerController effectiveAppearanceDidChange:](&v9, "effectiveAppearanceDidChange:", v4);
  v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "backgroundColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v4 = v7;
    v5 = v8;
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  _TtC5Files29DOCBrowserContainerController *v10;
  uint64_t v11;
  objc_super v12;

  v5 = type metadata accessor for UITraitOverrides(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for DOCBrowserContainerController();
  v12.receiver = self;
  v12.super_class = v8;
  v9 = a3;
  v10 = self;
  -[DOCBrowserContainerController willMoveToParentViewController:](&v12, "willMoveToParentViewController:", v9);
  v11 = type metadata accessor for UITraitHorizontalSizeClass(0);
  UIViewController.traitOverrides.getter();
  UITraitOverrides.remove(_:)(v11, &protocol witness table for UITraitHorizontalSizeClass);
  UIViewController.traitOverrides.setter(v7);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_viewControllerBecomingVisible);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_visibleViewController);
  sub_1000A853C(*(unint64_t *)((char *)&self->super.super.super.super.isa
                                    + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_state));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_queue));
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Files29DOCBrowserContainerController_stateReporting), *(_QWORD *)&self->super.appearStateTracker[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_stateReporting]);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_actionReporting);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_overlayDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalLeadingNavigationBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalTrailingNavigationBarButtonItems));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController__containerNavigationItem));
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  _TtC5Files29DOCBrowserContainerController *v5;
  id v6;

  v3 = type metadata accessor for DOCBrowserContainerController.DOCBrowserContainerControllerView();
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  -[DOCBrowserContainerController setView:](v5, "setView:", v6);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC5Files29DOCBrowserContainerController *v6;
  _TtC5Files29DOCBrowserContainerController *v7;
  UIViewController_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  DOCBrowserContainerController.didMove(toParent:)(v8);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setPreventAppearanceForwarding:(BOOL)a3
{
  int v3;
  _TtC5Files29DOCBrowserContainerController *v5;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding) = a3;
  if (v3 == 1 && !a3)
  {
    v5 = self;
    sub_1002C5128();

  }
}

- (BOOL)establishFirstResponder
{
  _TtC5Files29DOCBrowserContainerController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = DOCBrowserContainerController.establishFirstResponder()();

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Files29DOCBrowserContainerController *v4;

  v4 = self;
  DOCBrowserContainerController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Files29DOCBrowserContainerController *v4;

  v4 = self;
  DOCBrowserContainerController.viewDidDisappear(_:)(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files29DOCBrowserContainerController *v4;

  v4 = self;
  DOCBrowserContainerController.viewWillAppear(_:)(a3);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC5Files29DOCBrowserContainerController *v8;
  char v9;
  _TtC5Files29DOCBrowserContainerController *v10;
  UIWindow_optional v11;

  v7 = a3;
  v8 = self;
  v9 = (char)v8;
  v10 = v8;
  v11.value.super.super.super.isa = (Class)a3;
  v11.is_nil = a4;
  DOCBrowserContainerController.viewDidMove(to:shouldAppearOrDisappear:)(v11, v9);

}

- (void)viewDidLoad
{
  char *v2;
  uint64_t v3;
  uint64_t ObjectType;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v2 = (char *)v5.receiver;
  -[DOCBrowserContainerController viewDidLoad](&v5, "viewDidLoad");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource + 8];
  ObjectType = swift_getObjectType(*(_QWORD *)&v2[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource]);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(ObjectType, v3) & 1) == 0)
  {
    sub_10000C9E0();
    if (*(_QWORD *)&v2[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_state] == 5)
      sub_100034DFC(0, 0, 0);
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  char *v6;
  _BYTE v7[24];
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v6 = (char *)v8.receiver;
  -[DOCBrowserContainerController setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController], "setEditing:animated:", v5, v4, swift_beginAccess(&v6[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController], v7, 0, 0).n128_f64[0]);

}

- (_TtC5Files33DOCBrowserContainedViewController)contentViewController
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController, v4, 0, 0);
  return (_TtC5Files33DOCBrowserContainedViewController *)*v2;
}

- (void)setContentViewController:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)allowsPickingMultipleItems
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_allowsPickingMultipleItems);
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  _TtC5Files29DOCBrowserContainerController *v4;

  v4 = self;
  sub_1002C395C(a3);

}

- (NSArray)preferredFocusEnvironments
{
  void **v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  Class isa;
  _QWORD *v10;
  _BYTE v11[24];

  v2 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController, v11, 0, 0);
  v3 = *v2;
  if (*v2)
  {
    v4 = sub_10006922C((uint64_t *)&unk_1006441A0);
    v5 = swift_allocObject(v4, 40, 7);
    *(_OWORD *)(v5 + 16) = xmmword_1004D9B40;
    *(_QWORD *)(v5 + 32) = v3;
    v10 = (_QWORD *)v5;
    specialized Array._endMutation()(v5);
    v6 = v10;
  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  v7 = v3;
  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (BOOL)preventAppearanceForwarding
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding);
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return (NSArray *)sub_1001F75AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalLeadingNavigationBarButtonItems);
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  sub_1002C41EC((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalLeadingNavigationBarButtonItems, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalLeadingNavigationBarButtonItems);
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_1001F75AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalTrailingNavigationBarButtonItems);
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  sub_1002C41EC((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Files29DOCBrowserContainerController_additionalTrailingNavigationBarButtonItems, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalTrailingNavigationBarButtonItems);
}

- (void)activateContentViewController
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  _TtC5Files29DOCBrowserContainerController *v6;

  v3 = *(_QWORD *)&self->super.appearStateTracker[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource];
  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource), a2);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6 = self;
  v5(1, ObjectType, v3);

}

- (NSString)description
{
  _TtC5Files29DOCBrowserContainerController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCBrowserContainerController.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v4 = a3;
  v5 = v6.receiver;
  -[DOCBrowserContainerController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10002DE50();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC5Files29DOCBrowserContainerController *v4;

  v4 = self;
  DOCBrowserContainerController.viewIsAppearing(_:)(a3);

}

- (_TtC5Files29DOCBrowserContainerController)init
{
  _TtC5Files29DOCBrowserContainerController *result;

  result = (_TtC5Files29DOCBrowserContainerController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBrowserContainerController", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC5Files29DOCBrowserContainerController *v13;
  id v14;
  NSURL *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD aBlock[5];
  uint64_t v21;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1005DA550, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  v14 = sub_1002C59F0();
  URL._bridgeToObjectiveC()(v15);
  v17 = v16;
  aBlock[4] = sub_1001D25F4;
  v21 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100018CC0;
  aBlock[3] = &unk_1005DA568;
  v18 = _Block_copy(aBlock);
  v19 = v21;
  swift_retain();
  objc_msgSend(v14, "getTransitionControllerForURL:completionBlock:", v17, v18, swift_release(v19).n128_f64[0]);
  _Block_release(v18);

  swift_release(v12);
  swift_unknownObjectRelease(v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files29DOCBrowserContainerController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA500, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C59F0();
  v13[4] = sub_1001D25F4;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100018CC0;
  v13[3] = &unk_1005DA518;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getTransitionControllerForItem:completionBlock:", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files29DOCBrowserContainerController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA4B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C59F0();
  v13[4] = sub_1002C7DD0;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100018CC0;
  v13[3] = &unk_1005DA4C8;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getPopoverTrackerForItem:completionBlock:", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC5Files29DOCBrowserContainerController *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005DA460, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  v12 = sub_1002C59F0();
  v15[4] = sub_1001D25E0;
  v16 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100083540;
  v15[3] = &unk_1005DA478;
  v13 = _Block_copy(v15);
  v14 = v16;
  swift_retain();
  objc_msgSend(v12, "getViewFor:waitForNewThumbnail::", v10, v5, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_release(v9);
  swift_unknownObjectRelease(v12);
}

- (void)getCellFor:(id)a3 :(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files29DOCBrowserContainerController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA410, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C59F0();
  v13[4] = sub_1001D25F4;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10015936C;
  v13[3] = &unk_1005DA428;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getCellFor::", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC5Files29DOCBrowserContainerController *v12;

  v8 = _Block_copy(a5);
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1005DA3E8, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  DOCBrowserContainerController.reveal(items:selectEvenIfVisible:completionBlock:)(v10, a4, (uint64_t)sub_1002C7DCC, v11);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

@end
