@implementation BANotificationData

- (BANotificationData)initWithNotificationContentID:(id)a3 notificationID:(id)a4 notificationType:(int64_t)a5 recoType:(int64_t)a6 goalType:(int64_t)a7 titleCode:(id)a8 title:(id)a9 messageCode:(id)a10 message:(id)a11
{
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a3)
    v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  else
    v13 = 0;
  v14 = a10;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v17 = v15;
  if (a8)
  {
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8, v15);
    v19 = v15;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9, v15);
  v22 = v20;
  if (!a10)
  {
    v23 = 0;
    if (a11)
      goto LABEL_9;
LABEL_11:
    v24 = 0;
    v25 = 0;
    return (BANotificationData *)BridgedNotificationData.init(notificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:)(v13, v16, v17, a5, a6, a7, v18, v19, v21, v22, (uint64_t)v14, v23, v24, v25);
  }
  v14 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a10, v20);
  v23 = v20;
  if (!a11)
    goto LABEL_11;
LABEL_9:
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a11, v20);
  return (BANotificationData *)BridgedNotificationData.init(notificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:)(v13, v16, v17, a5, a6, a7, v18, v19, v21, v22, (uint64_t)v14, v23, v24, v25);
}

- (BANotificationData)init
{
  BANotificationData *result;

  result = (BANotificationData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedNotificationData", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationData_notificationContentID));
  swift_bridgeObjectRelease(*(_QWORD *)&self->notificationContentID[OBJC_IVAR___BANotificationData_notificationID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->notificationContentID[OBJC_IVAR___BANotificationData_titleCode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->notificationContentID[OBJC_IVAR___BANotificationData_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->notificationContentID[OBJC_IVAR___BANotificationData_messageCode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->notificationContentID[OBJC_IVAR___BANotificationData_message]);
}

@end
