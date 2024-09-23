@implementation DOCColumnViewController

+ (BOOL)supportsDisplayInTraitCollection:(id)a3 availableArea:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  type metadata accessor for DOCColumnViewSpecs(0, a2);
  v7 = a3;
  v8 = (void *)static DOCColumnViewSpecs.specWithBrowsingContext(traitCollection:columnBrowserSize:)(width, height);

  if (v8)
  return v8 != 0;
}

+ (NSString)DOCColumnViewControllerUpdatedNavigationItem
{
  if (qword_100641078 != -1)
    swift_once(&qword_100641078, sub_1000AAA90);
  return (NSString *)(id)qword_100672CA0;
}

- (NSArray)containerControllers
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_containerControllers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_containerControllers, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for DOCBrowserContainerController();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setContainerControllers:(id)a3
{
  uint64_t v5;
  char **v6;
  _TtC5Files23DOCColumnViewController *v7;

  v5 = type metadata accessor for DOCBrowserContainerController();
  v6 = (char **)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10037D5F4(v6);

}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  if (a4)
    return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DOCColumnViewControllerCollectionView()), "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  __break(1u);
  return self;
}

- (NSString)description
{
  _TtC5Files23DOCColumnViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  sub_100382088((uint64_t)v2, v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC5Files23DOCColumnViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100386F2C();
}

- (void)viewDidLoad
{
  _TtC5Files23DOCColumnViewController *v2;

  v2 = self;
  sub_1003821CC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files23DOCColumnViewController *v4;

  v4 = self;
  sub_1003826AC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files23DOCColumnViewController *v4;

  v4 = self;
  sub_1003827EC(a3);

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[DOCColumnViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  sub_100380214();
  sub_100380B00();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[DOCColumnViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_100380EF0();
  sub_10038125C();
  sub_10038298C();

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC5Files23DOCColumnViewController *v6;

  v4 = a4;
  v6 = self;
  sub_10037CFFC(a3, v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC5Files23DOCColumnViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100383788(1);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC5Files23DOCColumnViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100383CF4((uint64_t)a3, a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files23DOCColumnViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100383F94((uint64_t)a3);

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = v4.receiver;
  -[DOCColumnViewController viewLayoutMarginsDidChange](&v4, "viewLayoutMarginsDidChange");
  v3 = v2;
  sub_100387078(v3, v3);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Files23DOCColumnViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100387780(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Files23DOCColumnViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100387B70(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)updateFocusHierarchy
{
  _TtC5Files23DOCColumnViewController *v2;

  v2 = self;
  sub_100380EF0();

}

- (NSArray)preferredFocusEnvironments
{
  _TtC5Files23DOCColumnViewController *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100384BCC();

  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)showsHierarchyIndicator
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files23DOCColumnViewController_showsHierarchyIndicator);
}

- (void)setShowsHierarchyIndicator:(BOOL)a3
{
  int v3;
  _TtC5Files23DOCColumnViewController *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Files23DOCColumnViewController_showsHierarchyIndicator);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files23DOCColumnViewController_showsHierarchyIndicator) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_100380B00();

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Files23DOCColumnViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100380B00();
  sub_10038298C();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC5Files23DOCColumnViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100387C74(v5);

}

- (_TtC5Files23DOCColumnViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC5Files23DOCColumnViewController *result;

  v3 = a3;
  result = (_TtC5Files23DOCColumnViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCColumnViewController", 29, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC5Files23DOCColumnViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files23DOCColumnViewController *result;

  v4 = a4;
  result = (_TtC5Files23DOCColumnViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCColumnViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_containerControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_additionalLeadingNavigationBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_additionalTrailingNavigationBarButtonItems));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_columnViewSpecs));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_pendingScrollToItem, &qword_1006508D8);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_activeScrollToItemContext, (uint64_t *)&unk_1006508E0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files23DOCColumnViewController____lazy_storage___notificationsController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCColumnViewController_fakeLeadingSeparator));
}

- (void)removeChildViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = v7.receiver;
  -[DOCColumnViewController removeChildViewController:](&v7, "removeChildViewController:", v4);
  v6 = v4;
  sub_100387308(v5, v6);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC5Files23DOCColumnViewController *v12;
  _BYTE v13[24];

  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_containerControllers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCColumnViewController_containerControllers, v13, 0, 0);
  v7 = *v6;
  if (!((unint64_t)v7 >> 62))
    return *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7 < 0)
    v10 = v7;
  else
    v10 = v7 & 0xFFFFFFFFFFFFFF8;
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v10);

  swift_bridgeObjectRelease(v7);
  return v8;
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC5Files23DOCColumnViewController *v13;
  __n128 v14;
  uint64_t v15;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1005E32D8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1003853AC((uint64_t)v10, (uint64_t)sub_1001D25F4, v12);

  v14 = swift_release(v12);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v14);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files23DOCColumnViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E3288, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1003859E0((uint64_t)v8, (uint64_t)sub_100162138, v7, (uint64_t)sub_100018CC0, (uint64_t)&unk_1005E32A0, (SEL *)&selRef_getTransitionControllerForItem_completionBlock_);

  swift_release(v7);
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files23DOCColumnViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E3238, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1003859E0((uint64_t)v8, (uint64_t)sub_100387E9C, v7, (uint64_t)sub_100018CC0, (uint64_t)&unk_1005E3250, (SEL *)&selRef_getPopoverTrackerForItem_completionBlock_);

  swift_release(v7);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC5Files23DOCColumnViewController *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005E31E8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  sub_100385784((uint64_t)v10, a4, (uint64_t)sub_100222EEC, v9);

  swift_release(v9);
}

- (void)getCellFor:(id)a3 :(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files23DOCColumnViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E3198, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1003859E0((uint64_t)v8, (uint64_t)sub_100241430, v7, (uint64_t)sub_10015936C, (uint64_t)&unk_1005E31B0, (SEL *)&selRef_getCellFor::);

  swift_release(v7);
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC5Files23DOCColumnViewController *v12;

  v8 = _Block_copy(a5);
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1005E3148, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  sub_100385C3C(v10, a4, (uint64_t)sub_100386F18, v11);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

@end
