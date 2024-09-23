@implementation MockEmittableSiriAnalyticsMessageStream

- (void)emitMessage:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream *v5;

  v4 = a3;
  v5 = self;
  MockEmittableSiriAnalyticsMessageStream.emitMessage(_:)(v4);

}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4
{
  id v5;
  _TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream *v6;

  v5 = a3;
  v6 = self;
  specialized MockEmittableSiriAnalyticsMessageStream.emitMessage(_:timestamp:)(v5);

}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a6);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  _Block_release(v11);
  outlined destroy of UUID?((uint64_t)v10);
}

- (void)barrierWithCompletion:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (_TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream)init
{
  return (_TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream *)MockEmittableSiriAnalyticsMessageStream.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream_queue));
  swift_bridgeObjectRelease();
}

@end
