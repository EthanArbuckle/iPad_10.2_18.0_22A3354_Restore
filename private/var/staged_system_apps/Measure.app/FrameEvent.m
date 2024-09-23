@implementation FrameEvent

- (NSString)description
{
  _TtC7Measure10FrameEvent *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1001509E8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7Measure10FrameEvent)initWithCoder:(id)a3
{
  _TtC7Measure10FrameEvent *result;

  sub_100150C10(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7Measure10FrameEvent *v5;

  v4 = a3;
  v5 = self;
  sub_100150EEC(v4);

}

- (_TtC7Measure10FrameEvent)init
{
  _TtC7Measure10FrameEvent *result;

  result = (_TtC7Measure10FrameEvent *)_swift_stdlib_reportUnimplementedInitializer("Measure.FrameEvent", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
