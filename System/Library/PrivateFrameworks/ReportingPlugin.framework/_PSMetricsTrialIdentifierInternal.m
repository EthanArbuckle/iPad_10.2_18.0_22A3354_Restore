@implementation _PSMetricsTrialIdentifierInternal

- (_PSMetricsTrialIdentifierInternal)initWithExperiment:(id)a3 treatment:(id)a4 deployment:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  v6 = sub_24549A0B4();
  v8 = v7;
  v9 = sub_24549A0B4();
  v11 = v10;
  v12 = sub_24549A0B4();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment);
  *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment);
  *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment);
  *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for TrialIdentifier();
  return -[_PSMetricsTrialIdentifierInternal init](&v18, sel_init);
}

- (int64_t)hash
{
  _PSMetricsTrialIdentifierInternal *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24548329C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_2454834B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_245483384);
}

- (_PSMetricsTrialIdentifierInternal)init
{
  _PSMetricsTrialIdentifierInternal *result;

  result = (_PSMetricsTrialIdentifierInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))TrialIdentifier.description.getter);
}

@end
