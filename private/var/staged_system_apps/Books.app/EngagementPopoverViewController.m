@implementation EngagementPopoverViewController

- (_TtC5Books31EngagementPopoverViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100673898();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC5Books31EngagementPopoverViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100673950();

}

- (_TtC5Books31EngagementPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books31EngagementPopoverViewController *result;

  v4 = a4;
  result = (_TtC5Books31EngagementPopoverViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.EngagementPopoverViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->showPopover[OBJC_IVAR____TtC5Books31EngagementPopoverViewController_showPopover]);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_eventHandler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_popoverVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController____lazy_storage___amsEngagement));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_messageViewControllerProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_currentRequestDisplayed));
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC5Books31EngagementPopoverViewController *v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1006739C4(a4, v9, v11);

  swift_bridgeObjectRelease(v11);
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4;
  _TtC5Books31EngagementPopoverViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1006732BC(v4);

}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
