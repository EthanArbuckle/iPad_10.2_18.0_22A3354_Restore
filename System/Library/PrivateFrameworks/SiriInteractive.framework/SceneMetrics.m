@implementation SceneMetrics

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_246466CC8();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  sub_246466D24(a3.width, a3.height);
}

- (double)cornerRadius
{
  return sub_246466DEC();
}

- (void)setCornerRadius:(double)a3
{
  sub_246466E48(a3);
}

- (_TtC15SiriInteractive12SceneMetrics)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(xpcDictionary:)();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC15SiriInteractive12SceneMetrics *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_246466FB4((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (_TtC15SiriInteractive12SceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(size:cornerRadius:)(a3.width, a3.height, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15SiriInteractive12SceneMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_246467128(v4);

}

- (_TtC15SiriInteractive12SceneMetrics)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(coder:)(a3);
}

- (_TtC15SiriInteractive12SceneMetrics)init
{
  SceneMetrics.init()();
}

@end
