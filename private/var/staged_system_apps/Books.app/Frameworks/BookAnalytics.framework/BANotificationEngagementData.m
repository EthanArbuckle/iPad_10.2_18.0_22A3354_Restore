@implementation BANotificationEngagementData

- (BANotificationEngagementData)initWithActionType:(int64_t)a3 actionUrl:(id)a4 targetID:(id)a5 targetType:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t *v14;
  objc_super v16;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v12 = v11;
  if (a5)
    v13 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  else
    v13 = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_actionType) = (Class)a3;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BANotificationEngagementData_actionUrl);
  *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_targetID) = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_targetType) = (Class)a6;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BridgedNotificationEngagementData();
  return -[BANotificationEngagementData init](&v16, "init");
}

- (BANotificationEngagementData)init
{
  BANotificationEngagementData *result;

  result = (BANotificationEngagementData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedNotificationEngagementData", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->actionType[OBJC_IVAR___BANotificationEngagementData_actionUrl]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_targetID));
}

@end
