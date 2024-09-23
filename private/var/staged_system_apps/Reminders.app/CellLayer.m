@implementation CellLayer

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[CellLayer init](&v3, "init");
}

- (BOOL)masksToBounds
{
  return 0;
}

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer *v9;
  objc_super v11;
  _QWORD v12[3];
  uint64_t v13;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v12);
  swift_unknownObjectRelease(a3);
  v6 = v13;
  v7 = sub_10001413C(v12, v13);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[CellLayer initWithLayer:](&v11, "initWithLayer:", v8);
  swift_unknownObjectRelease(v8);
  sub_100027F10(v12);
  return v9;
}

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[CellLayer initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
