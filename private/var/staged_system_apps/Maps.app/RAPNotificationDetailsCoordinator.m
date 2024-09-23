@implementation RAPNotificationDetailsCoordinator

- (UIViewController)parentViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_parentViewController, a3);
}

- (ActionCoordination)coordinator
{
  return (ActionCoordination *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_coordinator);
}

- (void)setCoordinator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_coordinator, a3);
}

- (RAPSubmissionStatusDownloader)rapStatusDownloader
{
  return (RAPSubmissionStatusDownloader *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_rapStatusDownloader));
}

- (_TtC4Maps33RAPNotificationDetailsCoordinator)initWithParentViewController:(id)a3
{
  id v3;
  _TtC4Maps33RAPNotificationDetailsCoordinator *v4;

  v3 = a3;
  v4 = (_TtC4Maps33RAPNotificationDetailsCoordinator *)sub_100156E50((uint64_t)v3);

  return v4;
}

- (_TtC4Maps33RAPNotificationDetailsCoordinator)init
{
  _TtC4Maps33RAPNotificationDetailsCoordinator *result;

  result = (_TtC4Maps33RAPNotificationDetailsCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Maps.RAPNotificationDetailsCoordinator", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_parentViewController);
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_coordinator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_rapStatusDownloader));
}

- (void)presentRAPNotificationDetailsViewControllerWithRapRecord:(id)a3 entryPoint:(int)a4
{
  id v6;
  _TtC4Maps33RAPNotificationDetailsCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_100155D58(v6, a4);

}

- (void)openURLWithDetailsViewController:(id)a3 URL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  void *v12;
  id v13;
  _TtC4Maps33RAPNotificationDetailsCoordinator *v14;
  NSURL *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_coordinator);
  if (Strong)
  {
    v12 = (void *)Strong;
    v13 = a3;
    v14 = self;
    URL._bridgeToObjectiveC()(v15);
    v17 = v16;
    objc_msgSend(v12, "viewController:openURL:", v13, v16);

    swift_unknownObjectRelease(v12);
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
