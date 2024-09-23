@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_1000F2600((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000F2BA4);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_1000F2600((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000F2C90);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  NSString v14;
  uint64_t v16;

  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  static CharacterSet.decimalDigits.getter(v8);
  CharacterSet.insert(_:)(43);
  swift_bridgeObjectRetain(v10);
  sub_100373FE0(v8, v10, (uint64_t)v7);
  v12 = v11;
  v13 = swift_bridgeObjectRelease(v10);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v13);
  swift_bridgeObjectRelease(v10);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return v14;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSString v6;
  unsigned __int8 v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = v3;
  v5 = (void *)static String.emailPredicate.getter();
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "evaluateWithObject:", v6);
  swift_bridgeObjectRelease(v4);

  return v7;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = sub_1000F2D98(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6 & 1;
}

- (_TtC6FindMy17FMPhoneNumberUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return -[FMPhoneNumberUtil init](&v3, "init");
}

@end
