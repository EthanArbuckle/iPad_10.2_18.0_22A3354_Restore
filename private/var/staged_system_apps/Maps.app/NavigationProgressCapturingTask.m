@implementation NavigationProgressCapturingTask

- (_TtC4Maps31NavigationProgressCapturingTask)initWithPlatformController:(id)a3 session:(id)a4 navigationService:(id)a5
{
  return (_TtC4Maps31NavigationProgressCapturingTask *)sub_1001F32DC(a3, a4, a5);
}

- (void)navigationRouteInterrupter:(id)a3 finishedInteruptingEntryWithIdentifier:(id)a4
{
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC4Maps31NavigationProgressCapturingTask *v13;
  uint64_t v14;

  v7 = sub_100008B04((uint64_t *)&unk_10149AA90);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  swift_unknownObjectRetain(a3);
  v13 = self;
  sub_1001F49B8((uint64_t)v10);
  swift_unknownObjectRelease(a3);

  sub_1000A5008((uint64_t)v10);
}

- (_TtC4Maps31NavigationProgressCapturingTask)init
{
  _TtC4Maps31NavigationProgressCapturingTask *result;

  result = (_TtC4Maps31NavigationProgressCapturingTask *)_swift_stdlib_reportUnimplementedInitializer("Maps.NavigationProgressCapturingTask", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps31NavigationProgressCapturingTask_platformController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31NavigationProgressCapturingTask_routeInfoProvider));

  sub_1000A5008((uint64_t)self + OBJC_IVAR____TtC4Maps31NavigationProgressCapturingTask_activeRouteIdentifier);
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v9;
  _TtC4Maps31NavigationProgressCapturingTask *v10;

  v9 = a3;
  v10 = self;
  sub_1001F392C(a3, a4, a5);

}

- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4
{
  id v7;
  _TtC4Maps31NavigationProgressCapturingTask *v8;

  v7 = a3;
  v8 = self;
  sub_1001F42C0(a3, a4);

}

@end
