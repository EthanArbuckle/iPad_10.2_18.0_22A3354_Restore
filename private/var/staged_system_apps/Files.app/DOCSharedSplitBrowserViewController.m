@implementation DOCSharedSplitBrowserViewController

- (DOCTabbedBrowserViewController)tabbedBrowser
{
  return (DOCTabbedBrowserViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_tabbedBrowser, a2);
}

- (void)setTabbedBrowser:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_tabbedBrowser, a3);
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC5Files35DOCSharedSplitBrowserViewController *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_sharedSplitBrowser);
  v3 = self;
  v4 = objc_msgSend(v2, "preferredFocusEnvironments");
  v5 = sub_10006922C((uint64_t *)&unk_100648EE0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files35DOCSharedSplitBrowserViewController *v4;

  v4 = self;
  sub_1002735DC(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DOCSharedSplitBrowserViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[DOCSharedSplitBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_1005D6398, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_100274030;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100018CC0;
  v12[3] = &unk_1005D63B0;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)_workaround_122589472_fixupDescendantSafeAreas
{
  uint64_t v2;
  _TtC5Files35DOCSharedSplitBrowserViewController *v3;
  _TtC5Files35DOCSharedSplitBrowserViewController *v4;
  _TtC5Files35DOCSharedSplitBrowserViewController *v5;

  v2 = qword_100640ED0;
  v3 = self;
  if (v2 != -1)
  {
    v5 = v3;
    swift_once(&qword_100640ED0, sub_100273F50);
    v3 = v5;
  }
  if ((byte_10064AA50 & 1) == 0)
  {
    v4 = v3;
    -[DOCSharedSplitBrowserViewController _doc_ipi_updateContentOverlayInsetsForSelfAndChildren](v3, "_doc_ipi_updateContentOverlayInsetsForSelfAndChildren");
    v3 = v4;
  }

}

- (void)_workaround_122589743_fixupDescendantSearchMargins
{
  _TtC5Files35DOCSharedSplitBrowserViewController *v2;

  v2 = self;
  sub_1002739B4();

}

- (NSString)description
{
  _TtC5Files35DOCSharedSplitBrowserViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100273B84();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Files35DOCSharedSplitBrowserViewController)init
{
  _TtC5Files35DOCSharedSplitBrowserViewController *result;

  result = (_TtC5Files35DOCSharedSplitBrowserViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSharedSplitBrowserViewController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_tabItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_sharedSplitBrowser));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_keyValueObservations));
  sub_100241398((uint64_t)self + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_lastEnsureAppearedRequestID);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files35DOCSharedSplitBrowserViewController_tabbedBrowser);
}

@end
