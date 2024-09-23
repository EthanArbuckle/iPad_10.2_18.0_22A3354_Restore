@implementation BAUtilities

+ (int64_t)backgroundColorFromThemeIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BAEventReporter *v5;
  int64_t v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  int64_t v11;
  int64_t v12;
  id v13;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = (BAEventReporter *)v4;
  v6 = sub_EB5F0(v3, v4);
  swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
  return v6;
}

+ (int64_t)contentTypeFromAssetType:(int64_t)a3
{
  return sub_EB7CC(a3);
}

+ (id)stringFromUpSellLocation:(int64_t)a3
{
  unint64_t v3;
  NSString v4;
  id result;
  int64_t v6;

  v3 = 0xE700000000000000;
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v3 = 0xE200000000000000;
      goto LABEL_5;
    case 2:
      v3 = 0xEA0000000000676ELL;
      goto LABEL_5;
    case 3:
      v3 = 0xEA0000000000776FLL;
LABEL_5:
      v4 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v3);
      result = v4;
      break;
    default:
      v6 = a3;
      result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for BridgedUpSellLocation, &v6, &type metadata for BridgedUpSellLocation, &type metadata for Int);
      __break(1u);
      break;
  }
  return result;
}

+ (id)stringFromUpSellVariant:(int64_t)a3
{
  unint64_t v3;
  NSString v4;
  id result;
  int64_t v6;

  switch(a3)
  {
    case 0:
      v3 = 0xE700000000000000;
      goto LABEL_7;
    case 2:
      v3 = 0xE90000000000006BLL;
LABEL_7:
      v4 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v3);
      return v4;
    case 1:
      v3 = 0xEC000000746E6574;
      goto LABEL_7;
  }
  v6 = a3;
  result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for BridgedUpSellVariant, &v6, &type metadata for BridgedUpSellVariant, &type metadata for Int);
  __break(1u);
  return result;
}

- (BAUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Utilities();
  return -[BAUtilities init](&v3, "init");
}

@end
