@implementation CRLSyncController

- (_TtC8Freeform17CRLSyncController)init
{
  _TtC8Freeform17CRLSyncController *result;

  result = (_TtC8Freeform17CRLSyncController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSyncController", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_dataSource);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncLogicProvider);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_fetchStatusObserver);

  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncEngine, &qword_1013F20A0);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLSyncController_saveTask));
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLSyncController_throttlingScheduler));
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncPriorityProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncMetadata, &qword_1013F2098);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform17CRLSyncController_accountChangeObserverManager));
}

@end
