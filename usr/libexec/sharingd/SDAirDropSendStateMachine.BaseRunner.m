@implementation SDAirDropSendStateMachine.BaseRunner

- (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner)init
{
  _TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner *result;

  result = (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.BaseRunner", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_queue));
  v3 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_hapticsManager));
  v5 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_sendRequest;
  v6 = type metadata accessor for SFAirDropSend.Request(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_subject));
  swift_release(*(_QWORD *)&self->deviceStatus[OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_yield]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_endpoints));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_backupEndpoints));
  v7 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_currentTransfer;
  v8 = type metadata accessor for SFAirDropSend.Transfer(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_mediaConversionDestinations));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_osTransaction));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_displayPriorityReturnToNormalTask));
}

@end
