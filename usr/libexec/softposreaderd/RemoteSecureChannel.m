@implementation RemoteSecureChannel

- (void)securingRequest:(id)a3 reply:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC14softposreaderd19RemoteSecureChannel *v12;
  uint64_t v13;

  v7 = type metadata accessor for URLRequest(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_10000CC38((uint64_t)v10, (uint64_t)v12, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC14softposreaderd19RemoteSecureChannel)init
{
  _TtC14softposreaderd19RemoteSecureChannel *result;

  result = (_TtC14softposreaderd19RemoteSecureChannel *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteSecureChannel", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemoteSecureChannel_instance));
}

@end
