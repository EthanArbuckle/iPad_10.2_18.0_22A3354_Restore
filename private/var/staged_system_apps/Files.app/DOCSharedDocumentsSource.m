@implementation DOCSharedDocumentsSource

- (id)providerName
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "displayName");
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (NSString)displayName
{
  return (NSString *)sub_10003C32C(self, (uint64_t)a2, (void (*)(void))sub_1000A6ECC);
}

- (void)setDisplayName:(id)a3
{
  sub_1002AD184(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for DOCSharedDocumentsSource);
}

- (void)setProviderName:(id)a3
{
  sub_1002AD184(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for DOCSharedDocumentsSource);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.providerDomain[OBJC_IVAR____TtC5Files24DOCSharedDocumentsSource____lazy_storage____displayName]);
}

@end
