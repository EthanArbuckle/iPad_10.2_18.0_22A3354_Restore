@implementation PGEventLabelingConfiguration

- (int64_t)modelVersion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PGEventLabelingConfiguration_modelVersion);
}

- (NSSet)meaningLabels
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B978();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (PGEventLabelingConfiguration)init
{
  return (PGEventLabelingConfiguration *)EventLabelingConfiguration.init()();
}

- (id)thresholdsBy:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PGEventLabelingConfiguration *v7;
  void *v8;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = self;
  v8 = EventLabelingConfiguration.thresholds(by:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)useEventLabelingToInferWithMeaningLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PGEventLabelingConfiguration *v7;
  char v8;
  char v9;
  _BYTE v11[24];
  ValueMetadata *v12;
  unint64_t v13;

  v4 = sub_1CA85B534();
  v6 = v5;
  v12 = &type metadata for PhotosFeatureFlags;
  v13 = sub_1CA48E7DC();
  v7 = self;
  v8 = sub_1CA85A85C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if ((v8 & 1) != 0 && PFOSVariantHasInternalDiagnostics())
    v9 = sub_1CA290460(v4, v6, *(uint64_t *)((char *)&v7->super.isa + OBJC_IVAR___PGEventLabelingConfiguration_meaningLabels));
  else
    v9 = 0;

  swift_bridgeObjectRelease();
  return v9 & 1;
}

+ (BOOL)isEventLabelingEnabled
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for PhotosFeatureFlags;
  v6 = sub_1CA48E7DC();
  v2 = sub_1CA85A85C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  if ((v2 & 1) != 0)
    return PFOSVariantHasInternalDiagnostics();
  else
    return 0;
}

+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings
{
  return objc_msgSend((id)objc_opt_self(), sel_useMeaningEdgeForEventLabelingAlgorithm);
}

+ (NSString)bundlePath
{
  uint64_t v2;
  void *v3;

  _s11PhotosGraph26EventLabelingConfigurationC10bundlePathSSSgvgZ_0();
  if (v2)
  {
    v3 = (void *)sub_1CA85B510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
