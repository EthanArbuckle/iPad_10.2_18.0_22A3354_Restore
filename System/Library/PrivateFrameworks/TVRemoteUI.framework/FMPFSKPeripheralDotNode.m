@implementation FMPFSKPeripheralDotNode

- (_TtC10TVRemoteUI23FMPFSKPeripheralDotNode)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FMPFSKPeripheralDotNode.init(coder:)();
}

- (NSString)description
{
  _TtC10TVRemoteUI23FMPFSKPeripheralDotNode *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FMPFSKPeripheralDotNode.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x22075C584](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC10TVRemoteUI23FMPFSKPeripheralDotNode)init
{
  _TtC10TVRemoteUI23FMPFSKPeripheralDotNode *result;

  result = (_TtC10TVRemoteUI23FMPFSKPeripheralDotNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super._keyedActions
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_style));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_gimbalNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_diskNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_dotNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_dotCGPathNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_btRangingNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_interativeRadiusBeaconNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_perimeterRotateOnceAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_diskRadiusSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_dotScaleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_angleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_opacitySpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_brightnessSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_xOffsetSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_yOffsetSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_headingSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_radiusFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI23FMPFSKPeripheralDotNode_renderingColor));
}

@end
