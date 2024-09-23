@implementation ItemSourceResolutionResult

+ (id)successWithResolvedItemSource:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static ItemSourceResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithItemSourcesToDisambiguate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = type metadata accessor for ItemSource();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  v7 = static ItemSourceResolutionResult.disambiguation(with:)(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

+ (id)confirmationRequiredWithItemSourceToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static ItemSourceResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 47, 0);
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 52, 0);
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 57, 0);
  __break(1u);
  return result;
}

- (ItemSourceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v6;
  id v7;
  Class isa;
  ItemSourceResolutionResult *v9;
  ItemSourceResolutionResult *v10;
  objc_super v12;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ItemSourceResolutionResult();
  v9 = -[ItemSourceResolutionResult initWithJSONDictionary:forIntent:](&v12, "initWithJSONDictionary:forIntent:", isa, v7);

  v10 = v9;
  if (v10)

  return v10;
}

@end
