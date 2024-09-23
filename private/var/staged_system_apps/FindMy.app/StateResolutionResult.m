@implementation StateResolutionResult

+ (id)successWithResolvedState:(int64_t)a3
{
  swift_getObjCClassMetadata(a1);
  return static PlaySoundDeviceClassResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata(a1);
  return static PlaySoundDeviceClassResolutionResult.confirmationRequired(with:)(a3);
}

- (StateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v6;
  id v7;
  Class isa;
  StateResolutionResult *v9;
  StateResolutionResult *v10;
  objc_super v12;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for StateResolutionResult();
  v9 = -[StateResolutionResult initWithJSONDictionary:forIntent:](&v12, "initWithJSONDictionary:forIntent:", isa, v7);

  v10 = v9;
  if (v10)

  return v10;
}

@end
