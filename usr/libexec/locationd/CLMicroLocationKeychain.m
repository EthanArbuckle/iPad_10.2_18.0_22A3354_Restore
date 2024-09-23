@implementation CLMicroLocationKeychain

+ (id)getSymmetricKeyOrCreateNew:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  sub_1003B5800(v4, v6, &v15);
  swift_bridgeObjectRelease(v6);
  v7 = v16;
  if (!v16)
    return 0;
  v8 = sub_1003B5564(&v15, v16);
  v9 = *(_QWORD *)(v7 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v9 + 16))(v12, v10);
  v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v12, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  sub_1003B5588(&v15);
  return v13;
}

+ (id)retrieveSymmetricKey:(id)a3
{
  return sub_1003B6E54((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, uint64_t))sub_1003B66AC);
}

+ (BOOL)removeKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = sub_1003B890C(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (_TtC19microlocation_logic23CLMicroLocationKeychain)init
{
  return (_TtC19microlocation_logic23CLMicroLocationKeychain *)sub_1003B6F7C(self, (uint64_t)a2, type metadata accessor for CLMicroLocationKeychain);
}

@end
