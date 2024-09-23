@implementation FMSectionPlatterTextFieldView

- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003767E8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy29FMSectionPlatterTextFieldView *v5;

  v4 = a3;
  v5 = self;
  sub_100376940();

}

- (void)textFieldDidBeginEditing:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_isEditing) = 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_isEditing) = 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t (*v17)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t);
  id v18;
  _TtC6FindMy29FMSectionPlatterTextFieldView *v19;
  char v20;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = (char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate);
  if (Strong)
  {
    v14 = Strong;
    v15 = *((_QWORD *)v12 + 1);
    ObjectType = swift_getObjectType(Strong);
    v17 = *(uint64_t (**)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8);
    v18 = a3;
    v19 = self;
    v20 = v17(v18, location, length, v9, v11, ObjectType, v15);

    swift_bridgeObjectRelease(v11);
    swift_unknownObjectRelease(v14);
  }
  else
  {
    swift_bridgeObjectRelease(v11);
    v20 = 0;
  }
  return v20 & 1;
}

- (void)textFieldDidChangeWithSender:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, uint64_t, uint64_t);
  id v11;
  _TtC6FindMy29FMSectionPlatterTextFieldView *v12;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    v10 = *(void (**)(id, uint64_t, uint64_t))(v8 + 16);
    v11 = a3;
    v12 = self;
    v10(v11, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy29FMSectionPlatterTextFieldView *result;

  result = (_TtC6FindMy29FMSectionPlatterTextFieldView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSectionPlatterTextFieldView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_textField));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate);
}

@end
