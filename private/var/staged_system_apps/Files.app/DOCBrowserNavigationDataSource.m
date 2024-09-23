@implementation DOCBrowserNavigationDataSource

- (void)hierarchyController:(id)a3 willSet:(id)a4 animated:(BOOL)a5
{
  id v7;
  _TtC5Files30DOCBrowserNavigationDataSource *v8;

  v7 = a3;
  v8 = self;
  sub_10009CDE4(a5);

}

- (void)hierarchyController:(id)a3 didSet:(id)a4 animated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5Files30DOCBrowserNavigationDataSource *v12;

  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = a3;
  v12 = self;
  sub_100036718(v10, 0, a5);

  swift_bridgeObjectRelease(v10);
}

- (void)hierarchyController:(id)a3 didUpdateLastDisplayedLocationPath:(id)a4 anchorLocation:(id)a5 source:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _TtC5Files30DOCBrowserNavigationDataSource *v17;
  id v18;

  v11 = sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v13 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_historyDataSource);
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;
  v18 = v13;
  sub_10001A420(v12, a5, v16);

  swift_bridgeObjectRelease(v12);
}

- (NSArray)currentViewControllers
{
  _TtC5Files30DOCBrowserNavigationDataSource *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_10005F27C();

  sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)currentContainers
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_currentContainers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_currentContainers, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for DOCBrowserContainerController();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)hierarchyController:(id)a3 prepareControllersFor:(id)a4 :(id)a5 isUserInteraction:(BOOL)a6 isBrowsingTrash:(BOOL)a7 completion:(id)a8
{
  void *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC5Files30DOCBrowserNavigationDataSource *v20;

  v14 = _Block_copy(a8);
  v15 = sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  v17 = swift_allocObject(&unk_1005E60D0, 24, 7);
  *(_QWORD *)(v17 + 16) = v14;
  v18 = a3;
  v19 = a5;
  v20 = self;
  sub_100031B08(v16, a5, a6, a7, (uint64_t)sub_1000833E4, v17);

  swift_bridgeObjectRelease(v16);
  swift_release(v17);
}

- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator
{
  uint64_t Strong;
  void *v4;
  _TtC5Files30DOCBrowserNavigationDataSource *v5;
  id v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_updateObserver, a2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "hierarchyChangeTransitionCoordinator");

    swift_unknownObjectRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return (UIViewControllerTransitionCoordinator *)v6;
}

- (void)setUpdateObserver:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_updateObserver, a3);
}

- (_TtC5Files30DOCBrowserNavigationDataSource)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v5;
  id v6;
  _TtC5Files30DOCBrowserNavigationDataSource *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC5Files30DOCBrowserNavigationDataSource *)sub_10002C0B8(v5, v6);

  return v7;
}

- (void)setShortDebugID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC5Files30DOCBrowserNavigationDataSource *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10009D728(v4, v6);

}

- (void)setItemProvider:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_itemProvider, a3);
}

- (NSArray)containerControllers
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_containerControllers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_containerControllers, v6, 0, 0);
  v3 = *v2;
  if (!v3)
    return (NSArray *)0;
  type metadata accessor for DOCBrowserContainerController();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setContainerControllers:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = a3;
  if (a3)
  {
    v5 = type metadata accessor for DOCBrowserContainerController();
    v3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_containerControllers);
  swift_beginAccess(v6, v8, 1, 0);
  v7 = *v6;
  *v6 = (uint64_t)v3;
  swift_bridgeObjectRelease(v7);
}

- (NSArray)columnViewControllers
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_columnViewControllers);
  if (v2)
  {
    type metadata accessor for DOCColumnViewController(0);
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void)setColumnViewControllers:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  if (a3)
  {
    v5 = type metadata accessor for DOCColumnViewController(0);
    v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_columnViewControllers);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_columnViewControllers) = v6;
  swift_bridgeObjectRelease(v7);
}

- (void)setCurrentViewControllers:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  _TtC5Files30DOCBrowserNavigationDataSource *v7;

  v5 = sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10009D1E8(v6);

}

- (void)setCurrentContainers:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = type metadata accessor for DOCBrowserContainerController();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_currentContainers);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)popLastViewController
{
  _TtC5Files30DOCBrowserNavigationDataSource *v2;

  v2 = self;
  sub_1003BEA40();

}

- (NSString)shortDebugID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->historyDataSource[OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_shortDebugID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtP5Files44DOCBrowserNavigationDataSourceUpdateObserver_)updateObserver
{
  return (_TtP5Files44DOCBrowserNavigationDataSourceUpdateObserver_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_updateObserver, a2);
}

- (_TtP5Files42DOCBrowserNavigationDataSourceItemProvider_)itemProvider
{
  return (_TtP5Files42DOCBrowserNavigationDataSourceItemProvider_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_itemProvider, a2);
}

- (NSString)description
{
  _TtC5Files30DOCBrowserNavigationDataSource *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1003BED00();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Files30DOCBrowserNavigationDataSource)init
{
  _TtC5Files30DOCBrowserNavigationDataSource *result;

  result = (_TtC5Files30DOCBrowserNavigationDataSource *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBrowserNavigationDataSource", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_historyDataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_containerControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_columnViewControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_currentContainers));

  swift_bridgeObjectRelease(*(_QWORD *)&self->historyDataSource[OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_shortDebugID]);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_updateObserver);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_itemProvider);
}

- (void)hierarchyController:(id)a3 prepareByDismissingSearchWithCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC5Files30DOCBrowserNavigationDataSource *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1003C1D44((uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)hierarchyController:(id)a3 willAppend:(id)a4 animated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _TtC5Files30DOCBrowserNavigationDataSource *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = type metadata accessor for DOCBrowserContainerController();
  v10 = swift_dynamicCastClass(a4, v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = a4;
    v13 = a3;
    v14 = self;
    v15 = sub_1003C218C((uint64_t)v13, (uint64_t)v14, v11);
    v17 = v16;
    sub_10009CDE4(a5);

    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v17);
  }
}

- (void)hierarchyController:(id)a3 didAppend:(id)a4 animated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _TtC5Files30DOCBrowserNavigationDataSource *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = type metadata accessor for DOCBrowserContainerController();
  v10 = swift_dynamicCastClass(a4, v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = a4;
    v13 = a3;
    v14 = self;
    v15 = sub_1003C218C((uint64_t)v13, (uint64_t)v14, v11);
    v17 = v16;
    sub_100036718(v15, v16, a5);

    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v17);
  }
}

- (void)hierarchyController:(id)a3 willReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  int64_t v14;
  id v15;
  _TtC5Files30DOCBrowserNavigationDataSource *v16;

  v12 = _Block_copy(a7);
  v13 = sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v13);
  _Block_copy(v12);
  v15 = a3;
  v16 = self;
  sub_1003C2658((int)v15, a4, v14, a6, (uint64_t)v16, v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease(v14);
}

- (void)hierarchyController:(id)a3 didReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6
{
  uint64_t v11;
  unint64_t v12;
  id v13;
  _TtC5Files30DOCBrowserNavigationDataSource *v14;

  v11 = sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  v13 = a3;
  v14 = self;
  sub_1003BF1C8((uint64_t)v13, a4, v12, a6);

  swift_bridgeObjectRelease(v12);
}

- (void)hierarchyController:(id)a3 didReveal:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  _TtC5Files30DOCBrowserNavigationDataSource *v9;

  v7 = a3;
  v8 = a5;
  v9 = self;
  sub_1003C2DD0();

}

- (void)hierarchyController:(id)a3 didPrepend:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files30DOCBrowserNavigationDataSource *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1003BF660((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

}

- (void)hierarchyController:(id)a3 willPopLocations:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v10;
  id v11;
  _TtC5Files30DOCBrowserNavigationDataSource *v12;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = self;
  sub_1003C23FC(a4, a5, (uint64_t)v12, (void (**)(_QWORD, __n128))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)hierarchyController:(id)a3 didPopLocations:(int64_t)a4 animated:(BOOL)a5
{
  id v8;
  _TtC5Files30DOCBrowserNavigationDataSource *v9;

  v8 = a3;
  v9 = self;
  sub_1003C3504((_QWORD *)a4, a5);

}

@end
