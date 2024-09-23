@implementation BABackgroundColorData

- (BABackgroundColorData)initWithBackgroundColor:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BABackgroundColorData_backgroundColor) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BridgedBackgroundColorData();
  return -[BABackgroundColorData init](&v4, "init");
}

- (BABackgroundColorData)init
{
  BABackgroundColorData *result;

  result = (BABackgroundColorData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedBackgroundColorData", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
