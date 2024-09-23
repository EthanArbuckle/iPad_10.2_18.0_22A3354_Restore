@implementation CRLLastSubmittedTaskQueue

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform25CRLLastSubmittedTaskQueue_queue));
}

- (_TtC8Freeform25CRLLastSubmittedTaskQueue)initWithLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC8Freeform25CRLLastSubmittedTaskQueue *v13;
  uint64_t v14;
  uint64_t v16;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  static DispatchQoS.userInitiated.getter(v9);
  v12 = objc_allocWithZone(ObjectType);
  v13 = (_TtC8Freeform25CRLLastSubmittedTaskQueue *)CRLLastSubmittedTaskQueue.init(label:qos:)(v9, v11, (uint64_t)v8);
  v14 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v14, 24, 7);
  return v13;
}

- (void)performAsync:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8Freeform25CRLLastSubmittedTaskQueue *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1012761B8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_10069B418((uint64_t)sub_100565828, v5);

  swift_release(v5);
  swift_release(v7);
}

- (_TtC8Freeform25CRLLastSubmittedTaskQueue)init
{
  _TtC8Freeform25CRLLastSubmittedTaskQueue *result;

  result = (_TtC8Freeform25CRLLastSubmittedTaskQueue *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLLastSubmittedTaskQueue", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLLastSubmittedTaskQueue_lastWorkItem));
}

@end
