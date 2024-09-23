@implementation CRLTextInputModifierKeyMask

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)none
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD468, (id *)&qword_10147FE40, (uint64_t)sub_1008ED684);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)shift
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD470, (id *)&qword_10147FE48, (uint64_t)sub_1008ED6F4);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)option
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD478, (id *)&qword_10147FE50, (uint64_t)sub_1008ED768);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)command
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD480, (id *)&qword_10147FE58, (uint64_t)sub_1008ED7DC);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)control
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD488, (id *)&qword_10147FE60, (uint64_t)sub_1008ED850);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)optionShift
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD490, (id *)&qword_10147FE68, (uint64_t)sub_1008ED8C4);
}

- (int64_t)rawValue
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue);
}

- (void)setRawValue:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue) = (Class)a3;
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform27CRLTextInputModifierKeyMask *v5;
  uint64_t v6;
  _TtC8Freeform27CRLTextInputModifierKeyMask *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1008EDA68((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8;
}

- (_TtC8Freeform27CRLTextInputModifierKeyMask)init
{
  _TtC8Freeform27CRLTextInputModifierKeyMask *result;

  result = (_TtC8Freeform27CRLTextInputModifierKeyMask *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTextInputModifierKeyMask", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

+ (id)fromKeyCommandFlags:(int64_t)a3
{
  return sub_1008EE258(a3);
}

@end
