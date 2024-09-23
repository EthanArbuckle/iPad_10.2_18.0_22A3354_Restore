@implementation HealthDataTypeResolutionResult

+ (id)successWithResolvedHealthDataType:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static HealthDataTypeResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithHealthDataTypesToDisambiguate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = type metadata accessor for HealthDataType();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  v7 = static HealthDataTypeResolutionResult.disambiguation(with:)(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

+ (id)confirmationRequiredWithHealthDataTypeToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static HealthDataTypeResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 47, 0);
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 52, 0);
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 57, 0);
  __break(1u);
  return result;
}

- (HealthDataTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v6;
  id v7;
  Class isa;
  HealthDataTypeResolutionResult *v9;
  HealthDataTypeResolutionResult *v10;
  objc_super v12;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HealthDataTypeResolutionResult();
  v9 = -[HealthDataTypeResolutionResult initWithJSONDictionary:forIntent:](&v12, "initWithJSONDictionary:forIntent:", isa, v7);

  v10 = v9;
  if (v10)

  return v10;
}

@end
