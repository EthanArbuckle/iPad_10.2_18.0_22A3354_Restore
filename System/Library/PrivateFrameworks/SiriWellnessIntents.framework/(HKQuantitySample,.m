@implementation (HKQuantitySample,

- (unint64_t)HKQuantitySample)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(HKQuantitySample, HKQuantitySample)]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A]);
    return v1;
  }
  return v3;
}

@end
