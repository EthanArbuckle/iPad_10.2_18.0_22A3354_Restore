@implementation SGEdge

- (id)initFrom:(id)a3 to:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGEdge_from) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGEdge_to) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v8 = a3;
  v9 = a4;
  return -[SGEdge init](&v11, sel_init);
}

- (NSString)debugDescription
{
  return (NSString *)@objc SGEdge.debugDescription.getter(self, (uint64_t)a2, SGEdge.debugDescription.getter);
}

- (SGEdge)init
{
  SGEdge *result;

  result = (SGEdge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
