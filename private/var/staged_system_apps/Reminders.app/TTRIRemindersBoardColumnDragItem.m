@implementation TTRIRemindersBoardColumnDragItem

- (_TtC9Reminders32TTRIRemindersBoardColumnDragItem)init
{
  _TtC9Reminders32TTRIRemindersBoardColumnDragItem *result;

  result = (_TtC9Reminders32TTRIRemindersBoardColumnDragItem *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersBoardColumnDragItem", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000CDF68((uint64_t)self + OBJC_IVAR____TtC9Reminders32TTRIRemindersBoardColumnDragItem_columnID);
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  NSString v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = (void *)objc_opt_self(REMError);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "internalErrorWithDebugDescription:", v14);

  swift_willThrow(v16);
  sub_1000A2B58(v10, v12);
  if (a5)
  {
    v17 = (void *)_convertErrorToNSError(_:)(v15);

    v18 = v17;
    *a5 = v17;
  }
  else
  {

  }
  return 0;
}

+ (Class)readableTypeIdentifiersForItemProvider
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Class isa;

  v0 = sub_10002A750((uint64_t *)&unk_100654F80);
  v1 = swift_allocObject(v0, 48, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100520250;
  if (qword_10063D500 != -1)
    swift_once(&qword_10063D500, sub_10021D584);
  v2 = *(_QWORD *)algn_10064D928;
  *(_QWORD *)(v1 + 32) = qword_10064D920;
  *(_QWORD *)(v1 + 40) = v2;
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  return isa;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  _TtC9Reminders32TTRIRemindersBoardColumnDragItem *v6;
  void *v7;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  v7 = (void *)sub_10021D900((uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

@end
