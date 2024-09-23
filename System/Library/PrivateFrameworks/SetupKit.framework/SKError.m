@implementation SKError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8SetupKit7SKError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[SKError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC8SetupKit7SKError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _TtC8SetupKit7SKError *result;

  result = (_TtC8SetupKit7SKError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
