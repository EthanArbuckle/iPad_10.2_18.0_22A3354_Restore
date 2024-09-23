@implementation CurveObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC3VFX11CurveObject *v5;

  v4 = a3;
  v5 = self;
  sub_1B20D6A40(v4);

}

- (_TtC3VFX11CurveObject)initWithCoder:(id)a3
{
  return (_TtC3VFX11CurveObject *)sub_1B20D6BC8(a3);
}

- (_TtC3VFX11CurveObject)init
{
  _TtC3VFX11CurveObject *result;

  result = (_TtC3VFX11CurveObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
