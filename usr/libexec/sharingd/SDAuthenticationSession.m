@implementation SDAuthenticationSession

- (_TtC16DaemoniOSLibrary23SDAuthenticationSession)init
{
  _TtC16DaemoniOSLibrary23SDAuthenticationSession *result;

  result = (_TtC16DaemoniOSLibrary23SDAuthenticationSession *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAuthenticationSession", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_delegate, &qword_1007BFF70);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_peerDevice, &qword_1007B9E38);

  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_sessionID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_responseTimer));
}

@end
