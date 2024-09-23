@implementation SEApplet

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545CA0D0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545CA0D0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService8SEApplet *v5;

  v4 = a3;
  v5 = self;
  SEApplet.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService8SEApplet)initWithCoder:(id)a3
{
  return (_TtC9SEService8SEApplet *)SEApplet.init(coder:)(a3);
}

- (NSString)description
{
  _TtC9SEService8SEApplet *v2;
  void *v3;

  v2 = self;
  SEApplet.description.getter();

  v3 = (void *)sub_20A0E0800();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9SEService8SEApplet)init
{
  _TtC9SEService8SEApplet *result;

  result = (_TtC9SEService8SEApplet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
