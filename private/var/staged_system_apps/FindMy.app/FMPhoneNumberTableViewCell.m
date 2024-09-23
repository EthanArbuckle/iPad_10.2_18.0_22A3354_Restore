@implementation FMPhoneNumberTableViewCell

- (void)textFieldDidChangeWithSender:(id)a3
{
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v10;
  id v11;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v12;

  v4 = (char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(id, uint64_t, uint64_t))(v7 + 8))(a3, ObjectType, v7);
    v9 = a3;
    v10 = self;
    swift_unknownObjectRelease(v6);
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  sub_10007668C();

}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(id, uint64_t, uint64_t))(v8 + 8))(a3, ObjectType, v8);
    swift_unknownObjectRelease(v7);
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_100076974((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  void *Strong;
  void *v5;
  unsigned __int8 v6;
  id v7;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v8;
  id v9;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textViewDelegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = objc_msgSend(Strong, "respondsToSelector:", "textViewDidChange:");
    v7 = a3;
    v8 = self;
    if ((v6 & 1) != 0)
      objc_msgSend(v5, "textViewDidChange:", v7);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    v9 = a3;
    v10 = self;
  }
  sub_10007668C();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  void *Strong;
  void *v12;
  unsigned __int8 v13;
  id v14;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v15;
  NSString v16;
  unsigned __int8 v17;
  id v18;
  _TtC6FindMy26FMPhoneNumberTableViewCell *v19;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textViewDelegate);
  if (!Strong)
  {
    v18 = a3;
    v19 = self;
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v12 = Strong;
  v13 = objc_msgSend(Strong, "respondsToSelector:", "textView:shouldChangeTextInRange:replacementText:");
  v14 = a3;
  v15 = self;
  if ((v13 & 1) == 0)
  {
    swift_unknownObjectRelease(v12);
    goto LABEL_6;
  }
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v12, "textView:shouldChangeTextInRange:replacementText:", v14, location, length, v16);
  swift_unknownObjectRelease(v12);

LABEL_7:
  sub_10007668C();

  swift_bridgeObjectRelease(v10);
  return v17;
}

- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy26FMPhoneNumberTableViewCell *)sub_100076D10(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy26FMPhoneNumberTableViewCell *)sub_100076EC8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_placeHolderLabel));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textViewDelegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->textField[OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_initialPhoneNumber]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->textField[OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_placeHolderText]);
}

@end
