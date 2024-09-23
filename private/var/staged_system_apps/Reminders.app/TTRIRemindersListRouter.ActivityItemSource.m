@implementation TTRIRemindersListRouter.ActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4;
  _TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v4 = a3;
  v5 = self;
  sub_1000A18C0(v10);

  v6 = v11;
  v7 = sub_10001413C(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_100027F10(v10);
  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000A1A74((uint64_t)a4, (uint64_t)v16);

  v9 = v17;
  if (!v17)
    return 0;
  v10 = sub_10001413C(v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v13, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  sub_100027F10(v16);
  return v14;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000A2A68();
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = type metadata accessor for TTRIRemindersListRouterShareSheetItem(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000A2A24((uint64_t)self+ OBJC_IVAR____TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource_item, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    sub_1000A2378((uint64_t)v10);
    return 0;
  }
  else
  {
    v12 = sub_10002A750(&qword_100642C58);
    v13 = *(_QWORD *)&v10[*(int *)(v12 + 48) + 8];
    v14 = a3;
    v15 = a4;
    v16 = self;
    swift_bridgeObjectRelease(v13);
    v17 = *(void **)&v10[*(int *)(v12 + 64)];
    v18 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v10, v18);

    return v17;
  }
}

- (_TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource)init
{
  _TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *result;

  result = (_TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer("Reminders.ActivityItemSource", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000A2378((uint64_t)self+ OBJC_IVAR____TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource_item);
}

@end
