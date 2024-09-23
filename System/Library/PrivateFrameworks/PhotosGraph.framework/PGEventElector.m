@implementation PGEventElector

+ (id)memoryUniqueIdentifiersToElectWithGraph:(id)a3 electionMode:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = sub_1CA85B534();
  v8 = v7;
  v9 = a3;
  swift_bridgeObjectRetain();
  v10 = sub_1CA29E840(v6, v8);
  v11 = sub_1CA29EA64((uint64_t)v9, v10);
  v12 = sub_1CA29F114(v9, v10);
  sub_1CA33DA88(v12, v11);
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1CA85B978();
  swift_bridgeObjectRelease();
  return v13;
}

- (PGEventElector)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EventElector();
  return -[PGEventElector init](&v3, sel_init);
}

@end
