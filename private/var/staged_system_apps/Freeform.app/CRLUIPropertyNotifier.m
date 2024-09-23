@implementation CRLUIPropertyNotifier

- (_TtC8Freeform21CRLUIPropertyNotifier)initWithParent:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  uint64_t v7;
  double v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_propertyStateUpdateCount) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_changeNotifier;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_changeNotifier);
  v7 = OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_subscribers;
  *(Class *)((char *)&self->super.isa + v7) = (Class)sub_1008E06F8(_swiftEmptyArrayStorage, &qword_1013F5090);
  *(_QWORD *)&v8 = swift_unknownObjectWeakAssign(v6, a3).n128_u64[0];
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[CRLUIPropertyNotifier init](&v10, "init", v8);
}

- (_TtC8Freeform21CRLUIPropertyNotifier)init
{
  uint64_t v3;
  _TtC8Freeform21CRLUIPropertyNotifier *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_propertyStateUpdateCount) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_changeNotifier);
  v3 = OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_subscribers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1008E06F8(_swiftEmptyArrayStorage, &qword_1013F5090);

  result = (_TtC8Freeform21CRLUIPropertyNotifier *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Freeform/CRLUIPropertyNotifier.swift", 36, 2, 44, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_changeNotifier);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_subscribers));
}

@end
