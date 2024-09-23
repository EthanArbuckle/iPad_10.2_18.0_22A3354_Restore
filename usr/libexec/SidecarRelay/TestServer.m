@implementation TestServer

- (NSString)description
{
  NSString v2;

  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEA00000000007265);
  return (NSString *)v2;
}

- (void)activateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _TtC12SidecarRelay10TestServer *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100087BD0, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100012CAC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100051E18((uint64_t)v7, v6, (uint64_t)&unk_100087BF8, (uint64_t)sub_100053124, (uint64_t)&unk_100087C10);
  sub_1000121B4((uint64_t)v7, v6);

}

- (_TtC12SidecarRelay10TestServer)init
{
  return (_TtC12SidecarRelay10TestServer *)sub_100052060();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->RPRemoteDisplayServer_opaque[OBJC_IVAR____TtC12SidecarRelay10TestServer_sessions]);
  sub_1000536AC(*(_QWORD *)&self->RPRemoteDisplayServer_opaque[OBJC_IVAR____TtC12SidecarRelay10TestServer_proxies]);
}

@end
