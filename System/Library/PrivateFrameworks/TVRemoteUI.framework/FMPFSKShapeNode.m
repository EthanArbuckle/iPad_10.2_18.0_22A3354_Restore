@implementation FMPFSKShapeNode

- (_TtC10TVRemoteUI15FMPFSKShapeNode)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKShapeNode_previousBrightness;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFSKShapeNode();
  return -[SKShapeNode init](&v4, sel_init);
}

- (_TtC10TVRemoteUI15FMPFSKShapeNode)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKShapeNode_previousBrightness;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPFSKShapeNode();
  return -[SKShapeNode initWithCoder:](&v6, sel_initWithCoder_, a3);
}

@end
