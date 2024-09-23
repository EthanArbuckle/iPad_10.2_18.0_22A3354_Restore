@implementation HKQuantityType:

- (void)HKUnit
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v7 = a3;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(v12, (uint64_t)a3, v8);
  }
  else
  {
    v5 = a2;
    type metadata accessor for HKQuantityType();
    type metadata accessor for HKUnit();
    lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    _resumeUnsafeThrowingContinuation<A>(_:_:)(v12, (uint64_t)&v13, v6);

  }
}

- (unint64_t)HKUnit
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B]);
    return v1;
  }
  return v3;
}

@end
