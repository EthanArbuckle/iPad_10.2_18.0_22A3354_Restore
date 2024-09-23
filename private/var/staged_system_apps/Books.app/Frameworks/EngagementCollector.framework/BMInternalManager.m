@implementation BMInternalManager

- (BMInternalManager)initWithConfiguration:(id)a3
{
  return (BMInternalManager *)Manager.init(configuration:)(a3);
}

- (void)dealloc
{
  uint64_t v3;
  BMInternalManager *v4;
  uint64_t v5;
  objc_super v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem);
  v4 = self;
  if (v3)
  {
    v5 = swift_retain(v3);
    dispatch thunk of DispatchWorkItem.cancel()(v5);
    swift_release(v3);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for Manager();
  -[BMInternalManager dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_collector));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_localStorage));
}

- (void)submitEvent:(id)a3
{
  BMInternalManager *v3;

  v3 = self;
  sub_1AC68();

}

- (void)onDidReceiveAppDidBackground:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  BMInternalManager *v10;
  id v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_configuration);
  if (v9 && *((_BYTE *)v9 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData) == 1)
  {
    v10 = self;
    v11 = v9;
    sub_11928();

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BMInternalManager)init
{
  BMInternalManager *result;

  result = (BMInternalManager *)_swift_stdlib_reportUnimplementedInitializer("EngagementCollector.Manager", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4
{
  id v7;
  BMInternalManager *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  Manager.propertyDidChange(_:propertyConfiguration:)(a3, v7);
  swift_unknownObjectRelease(a3);

}

@end
