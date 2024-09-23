@implementation SDAirDropReceiveClassroomHandler

- (SDAirDropAlertManagerDelegate)delegate
{
  return (SDAirDropAlertManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate, a3);
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  return (SDAirDropAlertManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate, a2);
}

- (void)setClassroomDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate, a3);
}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
  sub_100272A10(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_10027079C);
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
  sub_100271CAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "cancelEvent {recordID: %s}", (uint64_t)&unk_10071F100, (uint64_t)sub_1002735B4, (uint64_t)&unk_10071F118);
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
  sub_100271CAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "errorEvent {recordID: %s}", (uint64_t)&unk_10071F0B0, (uint64_t)sub_100273578, (uint64_t)&unk_10071F0C8);
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
  sub_100272A10(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_100271D78);
}

- (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler)init
{
  _TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler *result;

  result = (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropReceiveClassroomHandler", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_stateMachine));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate);
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_queue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_continuations));
}

@end
