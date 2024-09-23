@implementation LabelView

- (NSDictionary)labels
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Measure9LabelView_labels);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC7Measure9LabelView_labels, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for LabelRender(0);
  swift_bridgeObjectRetain(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setLabels:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = type metadata accessor for LabelRender(0);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v5, &protocol witness table for String);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Measure9LabelView_labels);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC7Measure9LabelView *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC7Measure9LabelView *v19;
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
  v16 = sub_10000C4B0((unint64_t *)&qword_10047B5F0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1003B06A4);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

LABEL_8:
  sub_1000C6C3C(v9, v11);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v11);
  sub_100018180((uint64_t)v20);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7Measure9LabelView *v5;
  id v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(NSUserDefaults);
  v5 = self;
  v6 = objc_msgSend(v4, "standardUserDefaults");
  v7 = objc_msgSend((id)objc_opt_self(SharedDefaults), "measureUnits");
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v9 = v8;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  objc_msgSend(v6, "removeObserver:forKeyPath:", v5, v7);

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[LabelView dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure9LabelView_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure9LabelView_measurementUnderInspection]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure9LabelView_labels));

  swift_release();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure9LabelView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000C6E94(v6, v7);

  return v9 & 1;
}

- (void)onLabelViewTapped
{
  _TtC7Measure9LabelView *v2;

  v2 = self;
  sub_1000C5C20();

}

- (_TtC7Measure9LabelView)init
{
  _TtC7Measure9LabelView *result;

  result = (_TtC7Measure9LabelView *)_swift_stdlib_reportUnimplementedInitializer("Measure.LabelView", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
