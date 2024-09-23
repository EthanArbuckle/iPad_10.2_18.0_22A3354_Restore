@implementation MTMultiKeySyncProcessor

- (MTMultiKeySyncProcessor)initWithKeysAndProcessors:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for KeyProcessorPair();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (MTMultiKeySyncProcessor *)MultiKeySyncProcessor.init(keysAndProcessors:)(v5, v6);
}

- (NSArray)dirtyKeys
{
  return (NSArray *)sub_1001CBDDC(self, (uint64_t)a2, (uint64_t (*)(void))MultiKeySyncProcessor.dirtyKeys.getter);
}

- (NSArray)cleanKeys
{
  return (NSArray *)sub_1001CBDDC(self, (uint64_t)a2, (uint64_t (*)(void))MultiKeySyncProcessor.cleanKeys.getter);
}

- (id)processorForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTMultiKeySyncProcessor *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = (void *)MultiKeySyncProcessor.processor(for:)(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (MTMultiKeySyncProcessor)init
{
  MTMultiKeySyncProcessor *result;

  result = (MTMultiKeySyncProcessor *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.MultiKeySyncProcessor", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTMultiKeySyncProcessor_orderedKeys));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTMultiKeySyncProcessor_processorsByKey));
}

- (int64_t)operationTypeForSET
{
  return 17;
}

- (BOOL)hasLocalChanges
{
  MTMultiKeySyncProcessor *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = MultiKeySyncProcessor.hasLocalChanges()();

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  MTMultiKeySyncProcessor *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = MultiKeySyncProcessor.requiresNextGetTransaction()();

  return v3;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  MZKeyValueStoreTransaction *v9;
  MTMultiKeySyncProcessor *v10;
  Swift::String v11;
  void *object;
  NSString v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = (MZKeyValueStoreTransaction *)a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  object = MultiKeySyncProcessor.version(forGetTransaction:key:)(v9, v11).value._object;

  swift_bridgeObjectRelease(v8);
  if (object)
  {
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MTMultiKeySyncProcessor *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Class isa;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v12 = self;
  v13 = MultiKeySyncProcessor.data(forSetTransaction:key:version:)((uint64_t)v11, v8, v10, (uint64_t)a5);
  v15 = v14;

  swift_bridgeObjectRelease(v10);
  if (v15 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1001C0F60(v13, v15);
  }
  return isa;
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  MTMultiKeySyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)();

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B39E0, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE028;
LABEL_9:
  MultiKeySyncProcessor.success(forGetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  MTMultiKeySyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)();

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B39B8, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE028;
LABEL_9:
  MultiKeySyncProcessor.success(forSetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  MTMultiKeySyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)(char);

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B3990, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE020;
LABEL_9:
  MultiKeySyncProcessor.conflict(forSetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTMultiKeySyncProcessor *v10;
  id v11;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  type metadata accessor for SyncKeysRepository(0);
  v9 = a3;
  v10 = self;
  v11 = (id)static SyncKeysRepository.shared.getter(v10);
  swift_bridgeObjectRetain(v8);
  SyncKeysRepository.podcastsDomainVersion.setter(v6, v8);

  swift_bridgeObjectRelease(v8);
}

@end
