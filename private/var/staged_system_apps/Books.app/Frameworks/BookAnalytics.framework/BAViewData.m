@implementation BAViewData

- (BAViewData)initWithType:(int64_t)a3 action:(int64_t)a4 location:(int64_t)a5
{
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAViewData_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAViewData_action) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAViewData_location) = (Class)a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BridgedViewData();
  return -[BAViewData init](&v6, "init");
}

- (BAViewData)init
{
  BAViewData *result;

  result = (BAViewData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedViewData", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
