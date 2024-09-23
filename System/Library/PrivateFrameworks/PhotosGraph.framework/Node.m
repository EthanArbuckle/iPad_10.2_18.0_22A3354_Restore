@implementation Node

- (unint64_t)identifier
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier);
}

- (void)setIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
}

- (NSSet)labels
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B978();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
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

- (_TtC11PhotosGraph4Node)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  objc_class *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (objc_class *)sub_1CA85B984();
  sub_1CA322400();
  v8 = (objc_class *)sub_1CA85B414();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_labels) = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_properties) = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Node();
  return -[Node init](&v10, sel_init);
}

- (void)resolveIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
}

- (_TtC11PhotosGraph4Node)init
{
  _TtC11PhotosGraph4Node *result;

  result = (_TtC11PhotosGraph4Node *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
