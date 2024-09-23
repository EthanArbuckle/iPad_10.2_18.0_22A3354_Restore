@implementation FMPFSKLabelNode

- (_TtC10TVRemoteUI15FMPFSKLabelNode)initWithCoder:(id)a3
{
  _TtC10TVRemoteUI15FMPFSKLabelNode *result;

  result = (_TtC10TVRemoteUI15FMPFSKLabelNode *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC10TVRemoteUI15FMPFSKLabelNode *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FMPFSKLabelNode.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x22075C584](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC10TVRemoteUI15FMPFSKLabelNode)init
{
  _TtC10TVRemoteUI15FMPFSKLabelNode *result;

  result = (_TtC10TVRemoteUI15FMPFSKLabelNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKLabelNode_style));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKLabelNode_labelNode));
}

@end
