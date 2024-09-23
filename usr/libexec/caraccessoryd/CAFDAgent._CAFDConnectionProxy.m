@implementation CAFDAgent._CAFDConnectionProxy

- (void)fetchNowPlayingSnapshotWithReply:(id)a3
{
  _QWORD *v4;
  _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized CAFDAgent._CAFDConnectionProxy.fetchNowPlayingSnapshot(reply:)((uint64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)refreshNowPlayingSnapshot
{
  _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *v2;

  v2 = self;
  CAFDAgent._CAFDConnectionProxy.refreshNowPlayingSnapshot()();

}

- (NSString)description
{
  uint64_t ObjectType;
  _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.isa
                                            + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection));
  v4 = self;
  BSServiceConnectionHost.CAFDDescription.getter(ObjectType);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy)init
{
  _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *result;

  result = (_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *)_swift_stdlib_reportUnimplementedInitializer("caraccessoryd._CAFDConnectionProxy", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent, a2);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection));
}

- (void)invalidate
{
  _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *v2;

  v2 = self;
  CAFDAgent._CAFDConnectionProxy.activate()("invalidate proxy %@", (SEL *)&selRef_invalidate);

}

@end
