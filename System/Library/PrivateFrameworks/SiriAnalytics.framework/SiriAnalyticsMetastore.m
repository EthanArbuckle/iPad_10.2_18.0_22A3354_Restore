@implementation SiriAnalyticsMetastore

- (SiriAnalyticsMetastore)init
{
  return (SiriAnalyticsMetastore *)Metastore.init()();
}

- (void)bootstrap
{
  SiriAnalyticsMetastore *v2;

  v2 = self;
  sub_1A0283BCC();

}

- (void)prune
{
  SiriAnalyticsMetastore *v2;

  v2 = self;
  sub_1A0283F04();

}

- (void)checkpoint
{
  SiriAnalyticsMetastore *v2;

  v2 = self;
  sub_1A02841B0();

}

- (void)dealloc
{
  SiriAnalyticsMetastore *v2;

  v2 = self;
  Metastore.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SiriAnalyticsMetastore_storageURL;
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)createClock:(id)a3 rootClockIdentifier:(id)a4 startedOn:(unint64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  SiriAnalyticsMetastore *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A0307334();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  if (a4)
  {
    sub_1A030731C();
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v14, 1, v10);
  v15 = self;
  Metastore.createClock(_:rootClockIdentifier:startedOn:)();

  sub_1A026F378((uint64_t)v9, &qword_1ED07BC80);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)endClock:(id)a3 endedOn:(unint64_t)a4 endedReason:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  SiriAnalyticsMetastore *v10;
  uint64_t v11;

  v6 = sub_1A0307334();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  v10 = self;
  Metastore.endClock(_:endedOn:endedReason:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)pulseClock:(id)a3 lastEventOn:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  SiriAnalyticsMetastore *v9;
  uint64_t v10;

  v5 = sub_1A0307334();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  v9 = self;
  Metastore.pulseClock(_:lastEventOn:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)cleanupAbandonedClocksWithActiveClockIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  SiriAnalyticsMetastore *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A030731C();
    v8 = sub_1A0307334();
    v9 = 0;
  }
  else
  {
    v8 = sub_1A0307334();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  Metastore.cleanupAbandonedClocks(activeClockIdentifier:)();

  sub_1A026F378((uint64_t)v7, &qword_1ED07BC80);
}

- (id)sensitiveConditionsWithBootSessionUUIDs:(id)a3
{
  uint64_t v4;
  SiriAnalyticsMetastore *v5;
  void *v6;

  sub_1A0307334();
  v4 = sub_1A03078BC();
  v5 = self;
  v6 = (void *)Metastore.sensitiveConditionsByBootSessionUUIDAsNSDictionary(bootSessionUUIDs:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)createTagWithShim:(id)a3 onClock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  SiriAnalyticsMetastore *v14;
  void (*v15)(char *, uint64_t);
  void *v16;
  uint64_t v18;

  v6 = sub_1A0307334();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  v13 = a3;
  v14 = self;
  Metastore.createTag(shim:onClock:)();

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  v16 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) != 1)
  {
    v16 = (void *)sub_1A0307304();
    v15(v12, v6);
  }
  return v16;
}

@end
