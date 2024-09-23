@implementation DefaultsObserver

- (_TtC15audioaccessoryd16DefaultsObserver)initWithKeys:(id)a3 defaults:(id)a4 notificationBlock:(id)a5
{
  void *v8;
  objc_class *v9;
  uint64_t v10;
  void (**v11)();
  id v12;
  objc_super v14;

  v8 = _Block_copy(a5);
  v9 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v10 = swift_allocObject(&unk_1001EB4E0, 24, 7);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_monitoredKeys) = v9;
  *(_QWORD *)(v10 + 16) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_defaults) = (Class)a4;
  v11 = (void (**)())((char *)self + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify);
  *v11 = sub_10010FC0C;
  v11[1] = (void (*)())v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DefaultsObserver();
  v12 = a4;
  return -[DefaultsObserver init](&v14, "init");
}

- (void)dealloc
{
  _TtC15audioaccessoryd16DefaultsObserver *v2;
  objc_super v3;

  v2 = self;
  DefaultsObserver.stop()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DefaultsObserver();
  -[DefaultsObserver dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_monitoredKeys));
  swift_release(*(_QWORD *)&self->defaults[OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify]);
}

- (void)start
{
  _TtC15audioaccessoryd16DefaultsObserver *v2;

  v2 = self;
  DefaultsObserver.start()();

}

- (void)stop
{
  _TtC15audioaccessoryd16DefaultsObserver *v2;

  v2 = self;
  DefaultsObserver.stop()();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC15audioaccessoryd16DefaultsObserver *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  id v20;
  _TtC15audioaccessoryd16DefaultsObserver *v21;
  _OWORD v22[2];

  if (a3)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain(a4);
      v12 = a5;
      v13 = self;
      _bridgeAnyObjectToAny(_:)(v22);
      swift_unknownObjectRelease(a4);
      if (a5)
        goto LABEL_4;
LABEL_8:
      v17 = 0;
      if (v11)
        goto LABEL_5;
LABEL_9:

      swift_bridgeObjectRelease(v17);
      goto LABEL_10;
    }
  }
  memset(v22, 0, sizeof(v22));
  v20 = a5;
  v21 = self;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v15 = v14;
  v16 = sub_10010FBA0();
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

  if (!v11)
    goto LABEL_9;
LABEL_5:
  v19 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                                + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify);
  v18 = *(_QWORD *)&self->defaults[OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify];
  swift_retain(v18);
  v19(v9, v11);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v17);
  swift_release(v18);
LABEL_10:
  sub_1000B3C60((uint64_t)v22);
}

- (_TtC15audioaccessoryd16DefaultsObserver)init
{
  _TtC15audioaccessoryd16DefaultsObserver *result;

  result = (_TtC15audioaccessoryd16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer("audioaccessoryd.DefaultsObserver", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
