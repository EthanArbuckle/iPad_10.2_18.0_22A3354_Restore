@implementation AccessoryBoxView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  double y;
  double x;
  id v8;
  _TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView *v9;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)(v4, x, y);

  return v4 & 1;
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[AccessoryBoxView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithArrangedSubviews:(id)isa
{
  objc_class *ObjectType;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v7 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v7);
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v6 = swift_bridgeObjectRelease(v8).n128_u64[0];
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[AccessoryBoxView initWithArrangedSubviews:](&v11, "initWithArrangedSubviews:", isa, v6);

  return v9;
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[AccessoryBoxView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
