@implementation DOCInterface

+ (_TtP5Files31DOCSourceListInterfaceProviding_)sidebar
{
  uint64_t v2;

  v2 = type metadata accessor for DOCSourceListInterface_Default();
  return (_TtP5Files31DOCSourceListInterfaceProviding_ *)(id)swift_initStaticObject(v2, &unk_100641248);
}

+ (_TtP5Files28DOCInterfaceSystemAppearance_)general
{
  if (qword_100641150 != -1)
    swift_once(&qword_100641150, sub_1000B20A8);
  return (_TtP5Files28DOCInterfaceSystemAppearance_ *)(id)swift_unknownObjectRetain(qword_100672DD8);
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = qword_100641150;
  swift_unknownObjectRetain(a3);
  if (v4 != -1)
    swift_once(&qword_100641150, sub_1000B20A8);
  v5 = qword_100672DD8;
  qword_100672DD8 = (uint64_t)a3;
  swift_unknownObjectRelease(v5);
}

- (_TtC5Files12DOCInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return -[DOCInterface init](&v3, "init");
}

@end
