@implementation SEState

- (NSString)description
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))SEState.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))SEState.debugDescription.getter);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService7SEState *v5;

  v4 = a3;
  v5 = self;
  SEState.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService7SEState)initWithCoder:(id)a3
{
  return (_TtC9SEService7SEState *)SEState.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9SEService7SEState)init
{
  _TtC9SEService7SEState *result;

  result = (_TtC9SEService7SEState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
