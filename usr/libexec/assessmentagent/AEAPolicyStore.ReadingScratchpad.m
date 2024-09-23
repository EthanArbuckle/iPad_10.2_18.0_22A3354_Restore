@implementation AEAPolicyStore.ReadingScratchpad

- (id)numberForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  v7 = (void *)sub_100059204(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (id)stringForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  sub_100059368(v4, v6);
  v8 = v7;
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  if (v8)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)arrayForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  v7 = sub_1000594EC(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8.super.isa = 0;
  }
  return v8.super.isa;
}

- (BOOL)removeWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060F4(self->fileSystem, *(_QWORD *)&self->fileSystem[24]);
  swift_retain(self);
  sub_100059070((uint64_t)v7);
  sub_100014F24();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release(self);
  return 1;
}

@end
