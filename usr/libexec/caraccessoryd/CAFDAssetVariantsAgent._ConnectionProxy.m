@implementation CAFDAssetVariantsAgent._ConnectionProxy

- (NSString)description
{
  uint64_t ObjectType;
  _TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.isa
                                            + OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection));
  v4 = self;
  BSServiceConnectionHost.CAFDDescription.getter(ObjectType);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy)init
{
  _TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *result;

  result = (_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *)_swift_stdlib_reportUnimplementedInitializer("caraccessoryd._ConnectionProxy", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_agent, a2);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection));
}

- (void)invalidate
{
  _TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *v2;

  v2 = self;
  CAFDAssetVariantsAgent._ConnectionProxy.activate()("invalidate proxy %@", (SEL *)&selRef_invalidate);

}

- (void)fetchVariantsWithReply:(id)a3
{
  void *v4;
  _TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized CAFDAssetVariantsAgent._ConnectionProxy.fetchVariants(reply:)((char *)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)refreshVariants
{
  _TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *v2;

  v2 = self;
  CAFDAssetVariantsAgent._ConnectionProxy.refreshVariants()();

}

@end
