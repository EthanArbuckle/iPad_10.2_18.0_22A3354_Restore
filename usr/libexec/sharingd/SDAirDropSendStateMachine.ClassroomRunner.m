@implementation SDAirDropSendStateMachine.ClassroomRunner

- (void)operationStartedWithOperation:(id)a3
{
  id v4;
  _TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner *v5;

  v4 = a3;
  v5 = self;
  sub_1004FA3F8((uint64_t)v5);

}

- (void)operationMadeProgressWithOperation:(id)a3
{
  sub_1004F9A54(self, (uint64_t)a2, a3, (uint64_t)&unk_10072D500, (uint64_t)&unk_1007C4708);
}

- (void)operationEndedWithOperation:(id)a3
{
  sub_1004F9A54(self, (uint64_t)a2, a3, (uint64_t)&unk_10072D4D8, (uint64_t)&unk_1007C46F8);
}

- (void).cxx_destruct
{
  double v3;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_sendOperationQueue));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_sendContinuation, &qword_1007B6C20);
  *(_QWORD *)&v3 = swift_bridgeObjectRelease((const char *)*(_QWORD *)&self->super.deviceStatus[OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_bundleIdentifier]).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa+ OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_urls), v3);
}

@end
