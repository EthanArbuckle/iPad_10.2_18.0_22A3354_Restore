@implementation PGSearchEntityAccumulator

- (NSDictionary)searchEntitiesByMomentUUID
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED874948);
  v2 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSDictionary)relatedPersonAndPetDescriptorByRelatedPersonIdentifier
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for RelatedPersonEntityDescriptor();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (PGGraphSearchEntity)mePersonEntity
{
  return (PGGraphSearchEntity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___PGSearchEntityAccumulator_internalMePersonEntity));
}

- (PGSearchEntityAccumulator)initWithSynonymsByCategoryMask:(id)a3
{
  uint64_t v3;

  sub_1CA24EEC0(0, (unint64_t *)&qword_1ED8723C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED872DE8);
  sub_1CA24E6C0((unint64_t *)&qword_1ED8723C8, (unint64_t *)&qword_1ED8723C0);
  v3 = sub_1CA85B414();
  return (PGSearchEntityAccumulator *)SearchEntityAccumulator.init(with:)(v3);
}

- (PGSearchEntityAccumulator)init
{
  PGSearchEntityAccumulator *result;

  result = (PGSearchEntityAccumulator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PGSearchEntityAccumulator_logger;
  v4 = sub_1CA85B348();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (BOOL)accumulatePublicEventsInPublicEventKeywords:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PGSearchEntityAccumulator *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  sub_1CA24EEC0(0, (unint64_t *)&qword_1ED8723C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872270);
  sub_1CA24E6C0((unint64_t *)&qword_1ED8723C8, (unint64_t *)&qword_1ED8723C0);
  v7 = sub_1CA85B414();
  v8 = sub_1CA85B534();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  SearchEntityAccumulator.accumulatePublicEvents(in:for:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1CA85A358();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

- (BOOL)accumulateTrip:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PGSearchEntityAccumulator *v13;
  Swift::String v14;
  Swift::String v15;
  void *v16;
  void *v17;
  id v18;

  v7 = sub_1CA85B534();
  v9 = v8;
  v10 = sub_1CA85B534();
  v12 = v11;
  v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  SearchEntityAccumulator.accumulateTrip(trip:for:)(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v16)
  {
    if (a5)
    {
      v17 = (void *)sub_1CA85A358();

      v18 = v17;
      *a5 = v17;
    }
    else
    {

    }
  }
  return v16 == 0;
}

- (BOOL)accumulateMeanings:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PGSearchEntityAccumulator *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  v7 = sub_1CA85B414();
  v8 = sub_1CA85B534();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  SearchEntityAccumulator.accumulateMeanings(meanings:for:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1CA85A358();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

- (BOOL)accumulateHolidays:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  return sub_1CA40DF74(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))SearchEntityAccumulator.accumulateHolidays(holidays:for:));
}

- (BOOL)accumulateSeasons:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  return sub_1CA40DF74(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))SearchEntityAccumulator.accumulateSeasons(seasons:for:));
}

- (BOOL)accumulateHomeAndWorkWithHomeAndWorkKeywords:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PGSearchEntityAccumulator *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  sub_1CA24EEC0(0, (unint64_t *)&qword_1ED8723C0);
  sub_1CA24E6C0((unint64_t *)&qword_1ED8723C8, (unint64_t *)&qword_1ED8723C0);
  v7 = sub_1CA85B414();
  v8 = sub_1CA85B534();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  SearchEntityAccumulator.accumulateHomeAndWork(with:for:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1CA85A358();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

- (BOOL)accumulatePersonAndPetRelationshipsFromGraph:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PGSearchEntityAccumulator *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  SearchEntityAccumulator.accumulatePersonAndPetRelationships(from:progressReporter:)(v7);

  return 1;
}

@end
