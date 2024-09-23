@implementation AccessoryDelegateTrampoline

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline *v14;

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v14 = self;
  sub_100696D24(v10, v12, a4, v13, (char *)a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_100697298(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline *v9;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (v4)
LABEL_3:
    v4 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v9 = self;
  sub_100697650(v6, v8, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = type metadata accessor for UUID(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit((char *)self+ OBJC_IVAR____TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline_target, 0);
  v7 = OBJC_IVAR____TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline_workItemQueue;
  type metadata accessor for WorkItemQueue(0);
  v8 = self;
  UUID.init()(v8);
  *(Class *)((char *)&self->super.isa + v7) = (Class)WorkItemQueue.__allocating_init(name:identifier:)(0xD00000000000001BLL, 0x8000000100E48550, v6);

  v10.receiver = v8;
  v10.super_class = ObjectType;
  return -[AccessoryDelegateTrampoline init](&v10, "init");
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self+ OBJC_IVAR____TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline_target);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline_workItemQueue));
}

@end
