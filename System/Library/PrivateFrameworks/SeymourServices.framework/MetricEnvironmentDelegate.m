@implementation MetricEnvironmentDelegate

- (id)app
{
  _TtC15SeymourServices25MetricEnvironmentDelegate *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  sub_1CF14C278();
  v3 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v4 = (void *)sub_1CF151B4C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithString_, v4);

  return v5;
}

- (id)hostApp
{
  return 0;
}

- (id)pageUrl
{
  return 0;
}

- (id)resourceRevNum
{
  return 0;
}

- (_TtC15SeymourServices25MetricEnvironmentDelegate)init
{
  _TtC15SeymourServices25MetricEnvironmentDelegate *result;

  result = (_TtC15SeymourServices25MetricEnvironmentDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
