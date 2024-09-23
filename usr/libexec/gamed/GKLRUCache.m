@implementation GKLRUCache

- (_TtC14GameDaemonCore10GKLRUCache)initWithCapacity:(int64_t)a3
{
  return (_TtC14GameDaemonCore10GKLRUCache *)GKLRUCache.init(capacity:)(a3);
}

- (void)clear
{
  _TtC14GameDaemonCore10GKLRUCache *v2;

  v2 = self;
  GKLRUCache.clear()();

}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v7;
  _TtC14GameDaemonCore10GKLRUCache *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v11, a3);
  swift_unknownObjectRelease(a3);
  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)(v10, v7, v9);

  GKLRUCache.insertValue(_:forKey:)((uint64_t)v11, (uint64_t)v10);
  sub_1001638F4((uint64_t)v10);
  sub_100161FE0(v11);
}

- (id)getValueForKey:(id)a3
{
  _TtC14GameDaemonCore10GKLRUCache *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v13[5];
  _QWORD v14[3];
  uint64_t v15;

  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)(v13, a3, a2);
  v4 = self;
  GKLRUCache.getValue(forKey:)((uint64_t)v13);

  sub_1001638F4((uint64_t)v13);
  v5 = v15;
  if (!v15)
    return 0;
  v6 = sub_100163928(v14, v15);
  v7 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_100161FE0(v14);
  return v10;
}

- (_TtC14GameDaemonCore10GKLRUCache)init
{
  GKLRUCache.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_mostRecentNode));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_leastRecentNode));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_cache), v3);
}

@end
