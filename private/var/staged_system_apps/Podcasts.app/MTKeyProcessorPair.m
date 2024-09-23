@implementation MTKeyProcessorPair

- (NSString)key
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->key[OBJC_IVAR___MTKeyProcessorPair_key];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  return (MZKeyValueStoreTransactionProcessing *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor));
}

- (MTKeyProcessorPair)initWithKey:(id)a3 processor:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___MTKeyProcessorPair_key);
  *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor) = (Class)a4;
  v12.receiver = self;
  v12.super_class = ObjectType;
  swift_unknownObjectRetain(a4);
  return -[MTKeyProcessorPair init](&v12, "init");
}

- (MTKeyProcessorPair)init
{
  MTKeyProcessorPair *result;

  result = (MTKeyProcessorPair *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.KeyProcessorPair", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->key[OBJC_IVAR___MTKeyProcessorPair_key]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor));
}

@end
