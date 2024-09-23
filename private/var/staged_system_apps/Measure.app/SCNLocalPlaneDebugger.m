@implementation SCNLocalPlaneDebugger

- (_TtC7Measure21SCNLocalPlaneDebugger)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100038330();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC7Measure21SCNLocalPlaneDebugger *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  _TtC7Measure21SCNLocalPlaneDebugger *v19;
  _OWORD v20[2];

  if (a3)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v20, 0, sizeof(v20));
    v18 = a5;
    v19 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)(v20, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v15 = v14;
  v16 = sub_1000181C0();
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

LABEL_8:
  sub_1000383D4(v9, v11);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v11);
  sub_100018180((uint64_t)v20);
}

- (_TtC7Measure21SCNLocalPlaneDebugger)init
{
  _TtC7Measure21SCNLocalPlaneDebugger *result;

  result = (_TtC7Measure21SCNLocalPlaneDebugger *)_swift_stdlib_reportUnimplementedInitializer("Measure.SCNLocalPlaneDebugger", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger_detector));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___planeNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___intersectionNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___planeGeometry));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___pointContainerNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___mlNode));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Measure21SCNLocalPlaneDebugger____lazy_storage___pointPool));
}

@end
