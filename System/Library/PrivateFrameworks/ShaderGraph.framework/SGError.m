@implementation SGError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11ShaderGraph7SGError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDictionary v13;
  _TtC11ShaderGraph7SGError *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (a5)
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = (void *)MEMORY[0x24954AF98](v9, v11);
  swift_bridgeObjectRelease();
  if (a5)
  {
    v13.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = -[SGError initWithDomain:code:userInfo:](&v16, sel_initWithDomain_code_userInfo_, v12, a4, v13.super.isa);

  return v14;
}

- (_TtC11ShaderGraph7SGError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[SGError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
