@implementation SDAirDropSendStateMachine.Runner

- (void).cxx_destruct
{
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_senderContact, &qword_1007BA300);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_pseudonymService));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_endpointService));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa
                                           + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_sendConnections));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_selectedConnection));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa
                                           + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_urls));
}

@end
