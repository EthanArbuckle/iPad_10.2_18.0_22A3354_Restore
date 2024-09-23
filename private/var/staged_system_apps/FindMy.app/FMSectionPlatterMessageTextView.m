@implementation FMSectionPlatterMessageTextView

- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F0E44();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy31FMSectionPlatterMessageTextView *v6;

  v5 = a3;
  v6 = self;
  sub_1001F0A24((uint64_t)a3);

}

- (void)textViewDidBeginEditing:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_isEditing) = 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_isEditing) = 0;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t (*v10)(id, uint64_t, uint64_t);
  id v11;
  _TtC6FindMy31FMSectionPlatterMessageTextView *v12;
  char v13;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    v10 = *(uint64_t (**)(id, uint64_t, uint64_t))(v8 + 8);
    v11 = a3;
    v12 = self;
    v13 = v10(v11, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

- (void)textViewDidChange:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, uint64_t, uint64_t);
  id v11;
  _TtC6FindMy31FMSectionPlatterMessageTextView *v12;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate);
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

- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy31FMSectionPlatterMessageTextView *result;

  result = (_TtC6FindMy31FMSectionPlatterMessageTextView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSectionPlatterMessageTextView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_messageTextViewHeightConstraint));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_initialMessageText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_placeHolderText]);
}

@end
