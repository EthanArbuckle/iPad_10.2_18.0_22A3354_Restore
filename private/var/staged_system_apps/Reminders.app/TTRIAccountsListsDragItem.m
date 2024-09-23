@implementation TTRIAccountsListsDragItem

- (_TtC9Reminders25TTRIAccountsListsDragItem)init
{
  _TtC9Reminders25TTRIAccountsListsDragItem *result;

  result = (_TtC9Reminders25TTRIAccountsListsDragItem *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIAccountsListsDragItem", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1003E8B34((uint64_t)self + OBJC_IVAR____TtC9Reminders25TTRIAccountsListsDragItem_listState);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = sub_10002A750((uint64_t *)&unk_100654F80);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100520250;
  if (qword_10063D738 != -1)
    swift_once(&qword_10063D738, sub_1003E821C);
  v4 = *(_QWORD *)algn_100659A98;
  *(_QWORD *)(v3 + 32) = qword_100659A90;
  *(_QWORD *)(v3 + 40) = v4;
  swift_bridgeObjectRetain(v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
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

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  uint64_t v2;
  Class isa;

  v2 = sub_1003E8698();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  if (qword_10063D738 != -1)
    swift_once(&qword_10063D738, sub_1003E821C);
  if (v3 == qword_100659A90 && v5 == *(_QWORD *)algn_100659A98)
  {
    swift_bridgeObjectRelease(v5);
    return 3;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, qword_100659A90, *(_QWORD *)algn_100659A98, 0);
    swift_bridgeObjectRelease(v5);
    if ((v7 & 1) != 0)
      return 3;
    else
      return 0;
  }
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC9Reminders25TTRIAccountsListsDragItem *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  v11 = sub_1003E877C(v7, v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
  return v11;
}

@end
