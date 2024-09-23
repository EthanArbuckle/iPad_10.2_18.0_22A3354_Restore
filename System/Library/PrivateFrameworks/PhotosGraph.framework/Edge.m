@implementation Edge

- (KGNode)targetNode
{
  return (KGNode *)(id)swift_unknownObjectRetain();
}

- (void)setTargetNode:(id)a3
{
  sub_1CA3D02A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC11PhotosGraph4Edge_targetNode);
}

- (KGNode)sourceNode
{
  return (KGNode *)(id)swift_unknownObjectRetain();
}

- (void)setSourceNode:(id)a3
{
  sub_1CA3D02A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC11PhotosGraph4Edge_sourceNode);
}

- (unint64_t)identifier
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier);
}

- (void)setIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
}

- (NSSet)labels
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B978();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setLabels:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_labels) = (Class)sub_1CA85B984();
  swift_bridgeObjectRelease();
}

- (NSDictionary)properties
{
  void *v2;

  sub_1CA322400();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setProperties:(id)a3
{
  sub_1CA322400();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_properties) = (Class)sub_1CA85B414();
  swift_bridgeObjectRelease();
}

- (_TtC11PhotosGraph4Edge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  objc_class *v11;
  objc_class *v12;
  objc_super v14;

  v11 = (objc_class *)sub_1CA85B984();
  sub_1CA322400();
  v12 = (objc_class *)sub_1CA85B414();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_labels) = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_properties) = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_sourceNode) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_targetNode) = (Class)a7;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for Edge();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return -[Edge init](&v14, sel_init);
}

- (void)resolveIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
}

- (_TtC11PhotosGraph4Edge)init
{
  _TtC11PhotosGraph4Edge *result;

  result = (_TtC11PhotosGraph4Edge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
