@implementation BAMarkedData

- (BAMarkedData)initWithIsFinishedDateSet:(BOOL)a3
{
  objc_super v4;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAMarkedData_isFinishedDateSet) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BridgedMarkedData();
  return -[BAMarkedData init](&v4, "init");
}

- (BAMarkedData)init
{
  BAMarkedData *result;

  result = (BAMarkedData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedMarkedData", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
