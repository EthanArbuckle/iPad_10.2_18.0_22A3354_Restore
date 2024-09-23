@implementation TouchableSpriteNode

- (_TtC7Measure19TouchableSpriteNode)init
{
  objc_class *ObjectType;
  char *v4;
  double v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (char *)self + OBJC_IVAR____TtC7Measure19TouchableSpriteNode_delegate;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v5 = swift_unknownObjectWeakInit(v4, 0).n128_u64[0];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TouchableSpriteNode init](&v7, "init", v5);
}

- (_TtC7Measure19TouchableSpriteNode)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  double v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (char *)self + OBJC_IVAR____TtC7Measure19TouchableSpriteNode_delegate;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v7 = swift_unknownObjectWeakInit(v6, 0).n128_u64[0];
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[TouchableSpriteNode initWithCoder:](&v9, "initWithCoder:", a3, v7);
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure19TouchableSpriteNode_delegate);
}

@end
