@implementation DeleteButton

- (ASVRoundedButton)deleteButton
{
  return (ASVRoundedButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton));
}

- (void)setDeleteButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure12DeleteButton)initWithFrame:(CGRect)a3
{
  _TtC7Measure12DeleteButton *result;

  sub_10006D614(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure12DeleteButton)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC7Measure12DeleteButton *result;

  v5 = (char *)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_isEnabled) = 1;
  v6 = a3;

  result = (_TtC7Measure12DeleteButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/DeleteButton.swift", 26, 2, 65, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate);

}

- (void)tapDeleteFrom:(id)a3
{
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  _TtC7Measure12DeleteButton *v11;
  id v12;
  _TtC7Measure12DeleteButton *v13;
  Swift::String v14;

  v4 = (char *)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate, a2);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType(Strong);
    v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v10 = a3;
    v11 = self;
    v9(ObjectType, v7);
    swift_unknownObjectRelease(v6);
  }
  else
  {
    v12 = a3;
    v13 = self;
  }
  if (qword_10047AA98 != -1)
    swift_once(&qword_10047AA98, sub_1000E15B4);
  v14._object = (void *)0x80000001003DB980;
  v14._countAndFlagsBits = 0xD000000000000014;
  Log.default(_:isPrivate:)(v14, 0);

}

@end
