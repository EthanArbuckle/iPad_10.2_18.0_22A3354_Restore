@implementation PushFrequentUpdatesObservationServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore36PushFrequentUpdatesObservationServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C132A768(v8);

  swift_unknownObjectRelease();
}

- (id)activitiesExceedingReducedPushBudget
{
  _TtC11SessionCore36PushFrequentUpdatesObservationServer *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C14264B8();
  sub_1C13279BC(v3);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1C1426BF0();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC11SessionCore36PushFrequentUpdatesObservationServer)init
{
  _TtC11SessionCore36PushFrequentUpdatesObservationServer *result;

  result = (_TtC11SessionCore36PushFrequentUpdatesObservationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_requestProcessingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_pushServer));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
