@implementation TTRIRemindersListDragSection

- (_TtC9Reminders28TTRIRemindersListDragSection)init
{
  _TtC9Reminders28TTRIRemindersListDragSection *result;

  result = (_TtC9Reminders28TTRIRemindersListDragSection *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersListDragSection", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  Class isa;

  v2 = sub_10002A750((uint64_t *)&unk_100654F80);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100520250;
  if (qword_10063D828 != -1)
    swift_once(&qword_10063D828, sub_1004B0390);
  v4 = *(_QWORD *)algn_100661CF8;
  *(_QWORD *)(v3 + 32) = qword_100661CF0;
  *(_QWORD *)(v3 + 40) = v4;
  v5 = (void *)objc_opt_self(NSString);
  v6 = objc_msgSend(v5, "writableTypeIdentifiersForItemProvider", swift_bridgeObjectRetain(v4).n128_f64[0]);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String);

  sub_1004507EC(v7);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
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
  if (qword_10063D828 != -1)
    swift_once(&qword_10063D828, sub_1004B0390);
  if (v3 == qword_100661CF0 && v5 == *(_QWORD *)algn_100661CF8)
  {
    swift_bridgeObjectRelease(v5);
    return 3;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, qword_100661CF0, *(_QWORD *)algn_100661CF8, 0);
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
  _TtC9Reminders28TTRIRemindersListDragSection *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  v11 = sub_1004B0678(v7, v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
  return v11;
}

@end
