@implementation FMPFSKBTRangeDotNode

- (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode)init
{
  return (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode *)FMPFSKBTRangeDotNode.init()();
}

- (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10TVRemoteUI20FMPFSKBTRangeDotNode *result;

  v4 = OBJC_IVAR____TtC10TVRemoteUI20FMPFSKBTRangeDotNode_sizeSpring;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)specialized static FMPFFluidSpring.lazySpringWith(initialValue:stableValueThreshold:)(0, 0, 0x3F50624DD2F1A9FCLL, 0);

  result = (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5
{
  id v6;
  id v7;
  _TtC10TVRemoteUI20FMPFSKBTRangeDotNode *result;

  v6 = a3;
  v7 = a4;
  result = (_TtC10TVRemoteUI20FMPFSKBTRangeDotNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI20FMPFSKBTRangeDotNode_sizeSpring));
}

@end
